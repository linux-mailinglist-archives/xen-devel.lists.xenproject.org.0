Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5691EF9CE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 16:00:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhCsx-00064k-Pd; Fri, 05 Jun 2020 13:59:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jhCsw-00064C-Io
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 13:59:50 +0000
X-Inumbo-ID: d2373990-a734-11ea-9ad7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2373990-a734-11ea-9ad7-bc764e2007e4;
 Fri, 05 Jun 2020 13:59:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8FB34AAE8;
 Fri,  5 Jun 2020 13:59:52 +0000 (UTC)
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20200604014621.GA203658@mail-itl>
 <e9c6dba3-2780-b155-5b12-3eb44dc31957@suse.com>
 <20200605111840.GE98582@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae54e2f6-efc9-1c39-d33a-f633def549e0@suse.com>
Date: Fri, 5 Jun 2020 15:59:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200605111840.GE98582@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.06.2020 13:18, Marek Marczykowski-Górecki wrote:
> On Fri, Jun 05, 2020 at 11:38:17AM +0200, Jan Beulich wrote:
>> On 04.06.2020 03:46, Marek Marczykowski-Górecki wrote:
>>> Hi,
>>>
>>> (continuation of a thread from #xendevel)
>>>
>>> During system shutdown quite often I hit infinite stream of errors like
>>> this:
>>>
>>>     (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
>>>     (XEN) domain_crash called from io.c:178
>>>
>>> This is all running on Xen 4.13.0 (I think I've got this with 4.13.1
>>> too), nested within KVM. The KVM part means everything is very slow, so
>>> various race conditions are much more likely to happen.
>>>
>>> It started happening not long ago, and I'm pretty sure it's about
>>> updating to qemu 4.2.0 (in linux stubdom), previous one was 3.0.0.
>>>
>>> Thanks to Andrew and Roger, I've managed to collect more info.
>>>
>>> Context:
>>>     dom0: pv
>>>     dom1: hvm
>>>     dom2: stubdom for dom1
>>>     dom3: hvm
>>>     dom4: stubdom for dom3
>>>     dom5: pvh
>>>     dom6: pvh
>>>
>>> It starts I think ok:
>>>
>>>     (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
>>>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>>     (XEN) d3v0 handle_pio port 0xb004 write 0x0001
>>>     (XEN) d3v0 handle_pio port 0xb004 write 0x2001
>>>     (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
>>
>> I can't seem to be able to spot the call site of this, in any of
>> qemu, libxl, or libxc. I'm in particular curious as to the further
>> actions taken on the domain after this was invoked: Do any ioreq
>> servers get unregistered immediately (which I think would be a
>> problem)?
> 
> It is here:
> https://github.com/qemu/qemu/blob/master/hw/i386/xen/xen-hvm.c#L1539
> 
> I think it's called from cpu_handle_ioreq(), and I think the request
> state is set to STATE_IORESP_READY before exiting (unless there is some
> exit() hidden in another function used there).

Thanks. There's nothing in surrounding code there that would unregister
an ioreq server. But as said elsewhere, I don't know qemu very well,
and hence I may easily overlook how else one may get unregistered
prematurely.

Jan

