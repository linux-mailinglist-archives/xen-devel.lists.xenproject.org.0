Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43071924F8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:03:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH2q0-0008W5-8c; Wed, 25 Mar 2020 10:00:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3jc=5K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jH2py-0008W0-9p
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:00:38 +0000
X-Inumbo-ID: 792935f8-6e7f-11ea-85c4-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 792935f8-6e7f-11ea-85c4-12813bfff9fa;
 Wed, 25 Mar 2020 10:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585130436;
 h=from:subject:to:references:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=Xq6X+PkWZwJ3evzRVEpJzYsuVpk4jvVWxBe4PcB3mqE=;
 b=CrYXmcjsJqPpitxJKo41LYVvr0Dw+/kntFzO0HXAj7phHR265RKHKqgD
 T3gXWEUpQgxG8aE0vEfHbJO7gIqvtOPbdRynQyDoaqmvYdbEfLp59i6vM
 yHzkLjTkOELaQHdVcPiaVM5lvYiY2jVQ49pscjl9CmuM+fs2sxqFpc8vF I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kViBLAffHvslWVrercXGWersVFs2HySs50Fq2jAXCZbCMTW8/C24XcZsaNnMMWoDJMiLtWmKM/
 eH1sT/TLCvUaq1dJgxR2wBY0q4/rRZlIbzcPku65ey+4BBEEIbIRZ17b025waQidSQWv1YMwaA
 ujKGcHJ5ERwLmbwglsg0TCuJjgtuSORMDb2Z10xQNswMGnJDSOARp9pNLBcLIERAzB/l6zH38u
 PzZMOqNQGlqYue8Im20oVE0mXUzlRNXWaZWnizRO7lx66L23t3LFlESTAiGF3HG6Yn4fOHVoXJ
 M6Q=
X-SBRS: 2.7
X-MesageID: 15006742
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,303,1580792400"; d="scan'208";a="15006742"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
 <78b62646-6fd4-e5b3-bc09-783bb017eaaa@suse.com>
Message-ID: <9af3c1bb-5b8f-4ff5-c9ce-2f34af652814@citrix.com>
Date: Wed, 25 Mar 2020 10:00:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <78b62646-6fd4-e5b3-bc09-783bb017eaaa@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/03/2020 16:29, Jan Beulich wrote:
> This is to augment SYSCALL, which has been supported for quite some
> time.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I've compared this to the in-progress version I have in my XSA-204
follow-on series.  I'm afraid the behaviour has far more vendor specific
quirks than this.

>
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -5975,6 +5975,60 @@ x86_emulate(
>              goto done;
>          break;
>  
> +    case X86EMUL_OPC(0x0f, 0x07): /* sysret */
> +        vcpu_must_have(syscall);
> +        /* Inject #UD if syscall/sysret are disabled. */
> +        fail_if(!ops->read_msr);
> +        if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
> +            goto done;
> +        generate_exception_if((msr_val & EFER_SCE) == 0, EXC_UD);

(as with the SYSCALL side), no need for the vcpu_must_have(syscall) as
well as this check.

> +        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), EXC_UD);
> +        generate_exception_if(!mode_ring0(), EXC_GP, 0);
> +        generate_exception_if(!in_protmode(ctxt, ops), EXC_GP, 0);
> +

The Intel SYSRET vulnerability checks regs->rcx for canonicity here, and
raises #GP here.

I see you've got it below, but this is where the Intel pseudocode puts
it, before MSR_STAR gets read, and logically it should be grouped with
the other excpetions.

> +        if ( (rc = ops->read_msr(MSR_STAR, &msr_val, ctxt)) != X86EMUL_OKAY )
> +            goto done;
> +        sreg.sel = ((msr_val >> 48) + 8) | 3; /* SELECTOR_RPL_MASK */

This would be the logical behaviour...

AMD CPUs |3 into %cs.sel, but don't make an equivalent adjustment for
%ss.sel, and simply take MSR_START.SYSRET_CS + 8.

If you aren't careful with MSR_STAR, SYSRET will return to userspace
with mismatching RPL/DPL and userspace can really find itself with an
%ss with an RPL of 0.  (Of course, when you take an interrupt and
attempt to IRET back to this context, things fall apart).

I discovered this entirely by accident in XTF, but it is confirmed by
careful reading of the AMD SYSRET pseudocode.

> +        cs.sel = op_bytes == 8 ? sreg.sel + 8 : sreg.sel - 8;
> +
> +        cs.base = sreg.base = 0; /* flat segment */
> +        cs.limit = sreg.limit = ~0u; /* 4GB limit */
> +        cs.attr = 0xcfb; /* G+DB+P+DPL3+S+Code */
> +        sreg.attr = 0xcf3; /* G+DB+P+DPL3+S+Data */

Again, that would be the logical behaviour...

AMD CPU's don't update anything but %ss.sel, and even comment the fact
in pseudocode now.

This was discovered by Andy Luto, where he found that taking an
interrupt (unconditionally sets %ss to NUL), and opportunistic sysret
back to 32bit userspace lets userspace see a sane %ss value, but with
the attrs still empty, and the stack unusable.

> +
> +#ifdef __x86_64__
> +        if ( mode_64bit() )
> +        {
> +            if ( op_bytes == 8 )
> +            {
> +                cs.attr = 0xafb; /* L+DB+P+DPL3+S+Code */
> +                generate_exception_if(!is_canonical_address(_regs.rcx) &&
> +                                      !amd_like(ctxt), EXC_GP, 0);

Wherever this ends up living, I think it needs calling out with a
comment /* CVE-xxx, Intel privilege escalation hole */, as it is a very
subtle piece of vendor specific behaviour.

Do we have a Centaur/other CPU to try with?  I'd err on the side of
going with == Intel rather than !AMD to avoid introducing known
vulnerabilities into models which stand half a chance of not being affected.

> +                _regs.rip = _regs.rcx;
> +            }
> +            else
> +                _regs.rip = _regs.ecx;
> +
> +            _regs.eflags = _regs.r11 & ~(X86_EFLAGS_RF | X86_EFLAGS_VM);
> +        }
> +        else
> +#endif
> +        {
> +            _regs.r(ip) = _regs.ecx;
> +            _regs.eflags |= X86_EFLAGS_IF;
> +        }
> +
> +        fail_if(!ops->write_segment);
> +        if ( (rc = ops->write_segment(x86_seg_cs, &cs, ctxt)) != X86EMUL_OKAY ||
> +             (!amd_like(ctxt) &&
> +              (rc = ops->write_segment(x86_seg_ss, &sreg,
> +                                       ctxt)) != X86EMUL_OKAY) )

Oh - here is the AMD behaviour with %ss, but its not quite correct.

AFAICT, the correct behaviour is to read the old %ss on AMD-like, set
flat attributes on Intel, and write back normally, because %ss.sel does
get updated.

~Andrew

> +            goto done;
> +
> +        singlestep = _regs.eflags & X86_EFLAGS_TF;
> +        break;
> +
>      case X86EMUL_OPC(0x0f, 0x08): /* invd */
>      case X86EMUL_OPC(0x0f, 0x09): /* wbinvd / wbnoinvd */
>          generate_exception_if(!mode_ring0(), EXC_GP, 0);
>


