Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E971A7FD6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 16:32:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOMbh-0007Rb-FI; Tue, 14 Apr 2020 14:32:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JNOL=56=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jOMbg-0007RW-3r
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 14:32:08 +0000
X-Inumbo-ID: b772c51c-7e5c-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b772c51c-7e5c-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 14:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586874727;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=TOZ8VaQtOfD6/5e8XVw+V2N89bks/gsB76xNB9tyKuI=;
 b=SNQD/HvujYayLWYzTU0460tNqRHl5JRuq9A5xuUB7fwqDgYUIaOFHoT/
 t5rWKSUDEC4PmiqqBMyEVyr183u4Zteq/D5zBROnreWaAGfjudLbbdpyq
 nqNRrFUftiTw5la3xHXi0SYuvRhPYYROUYy+wuBS+li2cd45uVf/vTti9 w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cxhAff+LbOIqaPSdYZ7uAEz+yu7JkmY1BnwjCDxNTAkzodjytJg+ZGjlANsE2FD1A2m6TSGSGb
 oFfy9JJgEFQwOhp3JRJ7RNA7hA+E7XPMKrOIeBlbPENlzi6hDWT//oATy+9d0XZX9pLyt1tqou
 RX03Yl6XdvZDxcK5K26GYtF3SNPyDtIPGfC1axnYFpxC6/kGrr+hUSTr3jKr6i4+RZ7Hpt0LtR
 D2vrY/23cPjTOfbCOYC/XZLac6zjKaDe5RH0gVbwYo1hOpp3KkTSCvxzubTt8zpOR1DR9Q1/i/
 NGE=
X-SBRS: 2.7
X-MesageID: 16320624
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,382,1580792400"; d="scan'208";a="16320624"
Subject: Re: [PATCH] x86/svm: Don't use vmcb->tlb_control as if it is a boolean
To: Jan Beulich <jbeulich@suse.com>
References: <20200414121429.10196-1-andrew.cooper3@citrix.com>
 <9c4e293d-1425-846f-1c52-91906f4e0d72@suse.com>
 <223c8116-4faf-2264-bc19-0e0de8b9ec9a@citrix.com>
 <39604bee-40f1-6a7a-f089-8cecd4e914b9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <51ecd0bc-5387-9126-133f-00abbb3facac@citrix.com>
Date: Tue, 14 Apr 2020 15:32:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <39604bee-40f1-6a7a-f089-8cecd4e914b9@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14/04/2020 15:21, Jan Beulich wrote:
> On 14.04.2020 16:15, Andrew Cooper wrote:
>> On 14/04/2020 14:57, Jan Beulich wrote:
>>> On 14.04.2020 14:14, Andrew Cooper wrote:
>>>> @@ -44,19 +41,20 @@ void svm_asid_handle_vmrun(void)
>>>>      struct hvm_vcpu_asid *p_asid =
>>>>          nestedhvm_vcpu_in_guestmode(curr)
>>>>          ? &vcpu_nestedhvm(curr).nv_n2asid : &curr->arch.hvm.n1asid;
>>>> -    bool_t need_flush = hvm_asid_handle_vmenter(p_asid);
>>>> +    bool need_flush = hvm_asid_handle_vmenter(p_asid);
>>>>  
>>>>      /* ASID 0 indicates that ASIDs are disabled. */
>>>>      if ( p_asid->asid == 0 )
>>>>      {
>>>>          vmcb_set_guest_asid(vmcb, 1);
>>>> -        vmcb->tlb_control = 1;
>>>> +        vmcb->tlb_control = TLB_CTRL_FLUSH_ALL;
>>> While there ought to be no difference in behavior, use of
>>> TLB_CTRL_FLUSH_ASID would seem more logical to me here. Other
>>> than below we're no after flushing all ASIDs in this case
>>> afaict.
>>>
>>> Question of course is - did early CPUs treat this as boolean,
>>> accepting any non-zero value to mean "flush all"?
>> The spec states "When the VMM sets the TLB_CONTROL field to 1, ...",
>> which is fairly clear on the matter.
> Well, it is a clear statement without it being clear how close to
> truth it is. Consider the spec also saying "Should only be used by
> legacy hypervisors" for the value of 1.

That particular choice of wording is odd, because it should be "legacy
hardware" instead.  I'll add this to my "pestering AMD list".

There probably is a perf hit from it, as flushing every ASID includes
flushing ASID 0 which is Xen's TLB entries.  For back-to-back vmexits,
this probably is noticeable.

>>> Preferably with such an adjustment
>> I'd prefer not to.  There is a good chance that your suggestion will
>> suffer a vmentry failure, or not flush anything on old hardware.
> Okay then. Could I talk you into adding at least a respective
> comment there? Or one indicating that we should stop using the
> value of 1 altogether (which of course is a bigger change)?

Would you accept /* TODO: investigate using TLB_CTRL_FLUSH_ASID here
instead. */ ?

~Andrew

