Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CC5207805
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 17:55:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo7k9-0003Jy-88; Wed, 24 Jun 2020 15:55:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hC7e=AF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jo7k8-0003JS-BM
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 15:55:20 +0000
X-Inumbo-ID: 1a44e360-b633-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a44e360-b633-11ea-b7bb-bc764e2007e4;
 Wed, 24 Jun 2020 15:55:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2633EAD20;
 Wed, 24 Jun 2020 15:55:18 +0000 (UTC)
Subject: Ping: use of "stat -"
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <ian.jackson@citrix.com>
References: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
 <20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <fa507eab-547a-c0fb-9620-825aba5f55b2@suse.com>
 <4b90b635-84bb-e827-d52e-dfe1ebdb4e4d@citrix.com>
 <814db557-4f6a-020d-9f71-4ee3724981e3@suse.com>
 <CAKf6xps0XDRTUJsbE1zHpn=h98yTN+Y1DzaNpVGzhhJGVccRRw@mail.gmail.com>
 <20200512195005.GA96154@mattapan.m5p.com>
 <049e0022-f9c1-6dc9-3360-d25d88eeb97f@citrix.com>
 <20200512225458.GA1530@mattapan.m5p.com>
 <24253.9543.974853.499775@mariner.uk.xensource.com>
 <0b449d5a-9629-8e41-5354-b985a063eba4@suse.com>
Message-ID: <4baa4ff6-aab6-63c6-16f0-96e71f567af4@suse.com>
Date: Wed, 24 Jun 2020 17:55:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0b449d5a-9629-8e41-5354-b985a063eba4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Elliott Mitchell <ehem+xen@m5p.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.05.2020 12:34, Jan Beulich wrote:
> On 14.05.2020 13:02, Ian Jackson wrote:
>> I've read this thread.  Jan, I'm sorry that this causes you
>> inconvenience.  I'm hoping it won't come down to a choice between
>> supporting people who want to ship a dom0 without perl, and people who
>> want a dom0 using more-than-a-decade-old coreutils.
>>
>> Jan, can you tell me what the output is of this on your ancient
>> system:
>>
>>   $ rm -f t
>>   $ >t
>>   $ exec 3<t
>>   $ stat -L -c '%F %i' /dev/stdin <&3
>>   regular empty file 393549
>>   $ rm t
>>   $ stat -L -c '%F %i' /dev/stdin <&3
>>   regular empty file 393549
>>   $ strace -ou stat -L -c '%F %i' /dev/stdin <&3
>>   $
> 
> $ rm -f t
> $ >t
> $ exec 3<t
> $ stat -L -c '%F %i' /dev/stdin <&3
> regular empty file 3380369
> $ rm t
> $ stat -L -c '%F %i' /dev/stdin <&3
> regular empty file 3380369
> $ strace -ou stat -L -c '%F %i' /dev/stdin <&3
> regular empty file 3380369
> 
>> Also, the contents of the file "u" afterwards, please.
> 
> Attached.
> 
> Thanks for looking into this, Jan

Is there (still) a plan to get this addressed for 4.14? Apologies if
I missed something having been posted / committed...

Jan

