Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B41F01CB275
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 17:05:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX4Yq-0007TP-76; Fri, 08 May 2020 15:05:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jX4Yo-0007TI-UB
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 15:05:10 +0000
X-Inumbo-ID: 4f4dd21c-913d-11ea-a013-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f4dd21c-913d-11ea-a013-12813bfff9fa;
 Fri, 08 May 2020 15:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588950310;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Rxz5ayXkVhQcIZe8LnlmVx26dYJADMhWFsWDJ7DcR+c=;
 b=Ed5Yg5e24wJFhqYzyHi6CyJjZhcdEDRnCP8LQFEyWNDeXgUNMqHbKHXM
 lLaLl+J1UDO5oOWDzzJvNwG3lcqAVoA/hxqA3lq3K1LBB7xgcUAbcl+U9
 ze2CYMYRgCflVNpTo83fOPdoP/AXMY5Gpb8HyEyhcoN/THtVvkCoXzE6m M=;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: sX6pPtWO1xcemqcgkJxls9p1PABP8wgYuEg4xBm7z6sdf/cSQPr9qEKqJyvFMsdWbzy+IX55Hi
 M7W39NEzmuPYbAGGVCGRfyVtfZTs52EXnMWxx+KGl5AgTshv4D+JYTZlFbs2tkeKerOj18pa/f
 27/e1JTX52a0NqMD0nlStyNHeGKUaGxR8I1E9L35J0R4iMxiAoKvsjUyiKNriom9YlpJHFOMV2
 ILIXQmJHbpM9a1cC/J+pygppAekK9Nv1ShlQv5NArIUImPgyIXwfgMHRD0zvQkey4UT7acAp7d
 fOw=
X-SBRS: 2.7
X-MesageID: 17358004
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,368,1583211600"; d="scan'208";a="17358004"
Subject: Re: [PATCH v8 04/12] x86emul: support SERIALIZE
To: Jan Beulich <jbeulich@suse.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <0bbbf95e-48ec-ee73-5234-52cf9c6c06d8@suse.com>
 <64de91ff-41ae-baf1-1119-0ba39df32275@citrix.com>
 <0c5a03c6-6c4f-c6ec-e474-71a2badd1c9c@suse.com>
 <fe12bd3d-37f6-111c-e738-dde0b42d2d3d@citrix.com>
 <1a4a9298-3446-a863-2e24-4c81244594dd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <883156dc-dd47-203d-8d64-2a4f025270f3@citrix.com>
Date: Fri, 8 May 2020 16:05:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1a4a9298-3446-a863-2e24-4c81244594dd@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08/05/2020 14:59, Jan Beulich wrote:
> On 08.05.2020 15:00, Andrew Cooper wrote:
>> On 08/05/2020 08:34, Jan Beulich wrote:
>>>>> @@ -5660,6 +5661,18 @@ x86_emulate(
>>>>>                  goto done;
>>>>>              break;
>>>>>  
>>>>> +        case 0xe8:
>>>>> +            switch ( vex.pfx )
>>>>> +            {
>>>>> +            case vex_none: /* serialize */
>>>>> +                host_and_vcpu_must_have(serialize);
>>>>> +                asm volatile ( ".byte 0x0f, 0x01, 0xe8" );
>>>> There is very little need for an actual implementation here.  The VMExit
>>>> to get here is good enough.
>>>>
>>>> The only question is whether pre-unrestricted_guest Intel boxes are
>>>> liable to find this in real mode code.
>>> Apart from this we also shouldn't assume HVM in the core emulator,
>>> I think.
>> It's not assuming HVM.  Its just that there is no way we can end up
>> emulating this instruction from PV context.
>>
>> If we could end up here in PV context, the exception causing us to
>> emulate to begin with would be good enough as well.
> With the current way of where/how emulation gets involved -
> yes. I'd like to remind you though of the 4-insn window
> shadow code tries to emulate over for PAE guests. There
> is no intervening #VMEXIT there.
>
> So do you want me to drop the asm() then, and switch from
> host_and_vcpu_must_have(serialize) to just
> vcpu_must_have(serialize)?

No - keep it as is.  This isn't a fastpath, and it is much safer to
assume there might be something we've forgotten.  (Or perhaps some new
future behaviour included in the definition of architecturally serialising).

~Andrew

