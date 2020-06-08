Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4927A1F1908
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 14:46:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiHAn-0000rD-Ux; Mon, 08 Jun 2020 12:46:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jiHAm-0000r8-EF
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 12:46:40 +0000
X-Inumbo-ID: 18a67e10-a986-11ea-9b55-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18a67e10-a986-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 12:46:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 33865AB8F;
 Mon,  8 Jun 2020 12:46:42 +0000 (UTC)
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
To: paul@xen.org
References: <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <000501d63b29$496ce6e0$dc46b4a0$@xen.org>
 <fe275c12-9bea-8733-dbdc-b225bf15fea3@suse.com>
 <002001d63b3e$7c268a40$74739ec0$@xen.org>
 <a418a2ea-f4ff-2b8e-eabf-2622099561f6@suse.com>
 <002e01d63b4f$914b3a90$b3e1afb0$@xen.org> <20200605161804.GJ98582@mail-itl>
 <d1bc0e70-c5a1-438a-e430-76b3d561564c@suse.com>
 <002701d63d75$6363a130$2a2ae390$@xen.org>
 <3811b700-7bd7-859a-2c84-a9885acf64a1@suse.com>
 <002e01d63d91$a701e5c0$f505b140$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <49232c15-513b-0ff3-040e-8f5287a84379@suse.com>
Date: Mon, 8 Jun 2020 14:46:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <002e01d63d91$a701e5c0$f505b140$@xen.org>
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
Cc: =?UTF-8?B?J0rDvHJnZW4gR3Jvw58n?= <jgross@suse.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?=27Marek_Marczykowski-G=c3=b3recki=27?=
 <marmarek@invisiblethingslab.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.06.2020 14:38, Paul Durrant wrote:
>> From: Jürgen Groß <jgross@suse.com>
>> Sent: 08 June 2020 10:25
>>
>> On 08.06.20 11:15, Paul Durrant wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 08 June 2020 09:14
>>>>
>>>> On 05.06.2020 18:18, 'Marek Marczykowski-Górecki' wrote:
>>>>> (XEN) d12v0 XEN_DMOP_remote_shutdown domain 11 reason 0
>>>>> (XEN) d12v0 domain 11 domain_shutdown vcpu_id 0 defer_shutdown 1
>>>>> (XEN) d12v0 XEN_DMOP_remote_shutdown domain 11 done
>>>>> (XEN) d12v0 hvm_destroy_ioreq_server called for 11, id 0
>>>>
>>>> Can either of you tell why this is? As said before, qemu shouldn't
>>>> start tearing down ioreq servers until the domain has made it out
>>>> of all shutdown deferrals, and all its vCPU-s have been paused.
>>>> For the moment I think the proposed changes, while necessary, will
>>>> mask another issue elsewhere. The @releaseDomain xenstore watch,
>>>> being the trigger I would consider relevant here, will trigger
>>>> only once XEN_DOMINF_shutdown is reported set for a domain, which
>>>> gets derived from d->is_shut_down (i.e. not mistakenly
>>>> d->is_shutting_down).
>>>
>>> I can't find anything that actually calls xendevicemodel_shutdown(). It was added by:
>>
>> destroy_hvm_domain() in qemu does.
>>
> 
> Ah ok, thanks. So it looks like this should only normally be called when the guest has written to the PIIX to request shutdown. Presumably the hvm_destroy_ioreq_server call we see afterwards is QEMU then exiting.

If a shutdown request was received, qemu should still not exit as long
as there's in-flight I/O, or as long as there are CPUs running in the
guest. It would seem legitimate to "cancel" in-flight I/O (and perhaps
"reject" further requests arriving), but the device model needs to
remain there as long as there's at least one running CPU. That's no
different on "real" hardware - the machine doesn't "disappear" just
because shutdown was requested.

Jan

