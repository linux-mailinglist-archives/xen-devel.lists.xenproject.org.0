Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4146319262D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:50:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH3ZL-0004YO-FN; Wed, 25 Mar 2020 10:47:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3jc=5K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jH3ZK-0004YJ-4c
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:47:30 +0000
X-Inumbo-ID: 0591eb24-6e86-11ea-85cb-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0591eb24-6e86-11ea-85cb-12813bfff9fa;
 Wed, 25 Mar 2020 10:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585133250;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=sziwqsWZYG9oxHGYQcnSKvWdCOeCv0WEmW09niYGq1g=;
 b=aVzBaNzhM9atB5/xo4YOGkINDVKkEqqVjAoMsNsm3q4kF6QMSpIReDY/
 0gggXEBwR0fhcfM3kyDOAOAIMXOo78THYhb0QN5Y9KfOLqR7FojPp7MF0
 7qngvEbf1ASKzvygXBpWPHWecJmZW/PDId/EBfBh71kGp+3iK3qNq31bc M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yDSpe2dm4FbUNsNSbNRCeXBWARcp7LKJmj/nvQ+Pkl8LwRsGKUUlNLWOvzCFRVs5Lpk4bfL+TK
 2pPbz1+aj2FaGumgsYW0UWs5cqR5PLehqDeG5w7op7HLEj3guPL1HQ3RB4mLlUuIho6OJkVnuu
 WKn0/ZkHiPCpz9NkYLj1RxlbXkJPbd83Ikr5Gv8S1g3PBFLVC6mR/FLnmPiO8u1ha5CsqXjKK7
 KTJx0/Sl1LWf4xikZUwv7ytVIckXgARtEEsMeey0bPq0K84WAFmaDIrnnvpXngDrE1ZWu19XHX
 Jsg=
X-SBRS: 2.7
X-MesageID: 14811954
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="14811954"
To: Jan Beulich <jbeulich@suse.com>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
 <78b62646-6fd4-e5b3-bc09-783bb017eaaa@suse.com>
 <9af3c1bb-5b8f-4ff5-c9ce-2f34af652814@citrix.com>
 <75958d0a-9b63-6f70-a38b-471994c45f5f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <debcc812-f542-eccd-8d34-fbdb137365db@citrix.com>
Date: Wed, 25 Mar 2020 10:47:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <75958d0a-9b63-6f70-a38b-471994c45f5f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 7/7] x86emul: support SYSRET
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25/03/2020 10:19, Jan Beulich wrote:
> On 25.03.2020 11:00, Andrew Cooper wrote:
>> On 24/03/2020 16:29, Jan Beulich wrote:
>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>> @@ -5975,6 +5975,60 @@ x86_emulate(
>>>              goto done;
>>>          break;
>>>  
>>> +    case X86EMUL_OPC(0x0f, 0x07): /* sysret */
>>> +        vcpu_must_have(syscall);
>>> +        /* Inject #UD if syscall/sysret are disabled. */
>>> +        fail_if(!ops->read_msr);
>>> +        if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
>>> +            goto done;
>>> +        generate_exception_if((msr_val & EFER_SCE) == 0, EXC_UD);
>> (as with the SYSCALL side), no need for the vcpu_must_have(syscall) as
>> well as this check.
> Hmm, yes, we do so elsewhere too, so I'll adjust this there and here.

In theory, the SEP checks for SYSENTER/SYSEXIT could be similarly
dropped, once the MSR logic is updated to perform proper availability
checks.

>>> +        if ( (rc = ops->read_msr(MSR_STAR, &msr_val, ctxt)) != X86EMUL_OKAY )
>>> +            goto done;
>>> +        sreg.sel = ((msr_val >> 48) + 8) | 3; /* SELECTOR_RPL_MASK */
>> This would be the logical behaviour...
>>
>> AMD CPUs |3 into %cs.sel, but don't make an equivalent adjustment for
>> %ss.sel, and simply take MSR_START.SYSRET_CS + 8.
>>
>> If you aren't careful with MSR_STAR, SYSRET will return to userspace
>> with mismatching RPL/DPL and userspace can really find itself with an
>> %ss with an RPL of 0.  (Of course, when you take an interrupt and
>> attempt to IRET back to this context, things fall apart).
>>
>> I discovered this entirely by accident in XTF, but it is confirmed by
>> careful reading of the AMD SYSRET pseudocode.
> I did notice this in their pseudocode, but it looked too wrong to
> be true. Will change.

The main reason why my 204 followon series is still pending is because I
never got around to completing an XTF test for all of these corner cases.

I'm happy to drop my series to Xen in light of this series of yours, but
I'd still like to complete the XTF side of things at some point.

>>> +
>>> +#ifdef __x86_64__
>>> +        if ( mode_64bit() )
>>> +        {
>>> +            if ( op_bytes == 8 )
>>> +            {
>>> +                cs.attr = 0xafb; /* L+DB+P+DPL3+S+Code */
>>> +                generate_exception_if(!is_canonical_address(_regs.rcx) &&
>>> +                                      !amd_like(ctxt), EXC_GP, 0);
>> Wherever this ends up living, I think it needs calling out with a
>> comment /* CVE-xxx, Intel privilege escalation hole */, as it is a very
>> subtle piece of vendor specific behaviour.
>>
>> Do we have a Centaur/other CPU to try with?  I'd err on the side of
>> going with == Intel rather than !AMD to avoid introducing known
>> vulnerabilities into models which stand half a chance of not being affected.
> I'd rather not - this exception behavior is spelled out by the
> SDM, and hence imo pretty likely to be followed by clones.

In pseudocode which certainly used to state somewhere "for reference
only, and not to be taken as an precise specification of behaviour". 
(And yes - that statement was still at the beginning of Vol2 when Intel
also claimed that "SYSRET was working according to the spec" in the
embargo period of XSA-7, because I called them out on it).

And anyway - it is a part of the AMD64 spec, not the Intel32 spec.  A
3rd party implementing it for 64bit support is more likely to go with
AMD's writings of how it behaves.

> While I do have a VIA box somewhere, it's not stable enough to
> run for more than a couple of minutes.

Fundamentally, it boils down to this.

Intel behaviour leaves a privilege escalation vulnerability available to
userspace.

Assuming AMD behaviour for unknown parts is the safer course of action,
because we don't need to issue an XSA/CVE to fix the emulator when it
turns out that we're wrong.

~Andrew

