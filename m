Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B9929D27A
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 22:32:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13911.34764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXt2p-0006XB-LQ; Wed, 28 Oct 2020 21:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13911.34764; Wed, 28 Oct 2020 21:31:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXt2p-0006Wm-I9; Wed, 28 Oct 2020 21:31:47 +0000
Received: by outflank-mailman (input) for mailman id 13911;
 Wed, 28 Oct 2020 21:31:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNQY=ED=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kXt2n-0006Wh-E4
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 21:31:45 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d4f690e-340c-4788-bf34-781eb0f3043f;
 Wed, 28 Oct 2020 21:31:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dNQY=ED=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kXt2n-0006Wh-E4
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 21:31:45 +0000
X-Inumbo-ID: 9d4f690e-340c-4788-bf34-781eb0f3043f
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9d4f690e-340c-4788-bf34-781eb0f3043f;
	Wed, 28 Oct 2020 21:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603920703;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=QBnCna8eiqqIPimvDphfSIhfLU6HR9J6WeP6SsXBf/8=;
  b=eqgKbgA/aeH9gtKby9sjF+g+YVYWg22UDxFMKNqQcz3fD73i/8XRfll6
   OL41LG1rtKaHpwi4jU51ErEhiW40N0jqqDNc4WtgaR85nipb2eUJ1EU2q
   xATQAXvFt/QE+Y3RxyGZA9lcnr7elUu9q8a93JnMyOmJ6eIrlFkep7sn3
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: rntssEikuZwN3+9nk0j2xv3y/RbMhIv7b3LnGgSSZjJxkGg26dM0/lnzoppw2dHC8c7R1Zc2cc
 x/9A75bH1n20cooh7ZG1rXe71GiTlatBkVi8J+qMbXJENXAFoF1w/jBJWS0OjElKORCPyIfUsZ
 KrbZ0E5j5LttLC5vXeHVBVlD47dFE6S4kW+8llXnXUEO2cjgjNZstck5c8Us55iASDgvEvByCT
 Xm+nWelSZsSSpUO5L6SfcBRE7tQBiAqseBVR8+5R9gelh67Tx6q6ZB5d143IUfkN0E4/iZ0gn6
 M7M=
X-SBRS: None
X-MesageID: 30065052
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,428,1596513600"; 
   d="scan'208";a="30065052"
Subject: Re: [PATCH v3] x86/pv: inject #UD for entirely missing SYSCALL
 callbacks
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <0e76675b-c549-128e-449f-0c7a4df64f11@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0ac0f006-c529-2437-4286-62158c2c491b@citrix.com>
Date: Wed, 28 Oct 2020 21:31:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0e76675b-c549-128e-449f-0c7a4df64f11@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 26/10/2020 09:40, Jan Beulich wrote:
> In the case that no 64-bit SYSCALL callback is registered, the guest
> will be crashed when 64-bit userspace executes a SYSCALL instruction,
> which would be a userspace => kernel DoS.  Similarly for 32-bit
> userspace when no 32-bit SYSCALL callback was registered either.
>
> This has been the case ever since the introduction of 64bit PV support,
> but behaves unlike all other SYSCALL/SYSENTER callbacks in Xen, which
> yield #GP/#UD in userspace before the callback is registered, and are
> therefore safe by default.
>
> This change does constitute a change in the PV ABI, for the corner case
> of a PV guest kernel not registering a 64-bit callback (which has to be
> considered a defacto requirement of the unwritten PV ABI, considering
> there is no PV equivalent of EFER.SCE).
>
> It brings the behaviour in line with PV32 SYSCALL/SYSENTER, and PV64
> SYSENTER (safe by default, until explicitly enabled).
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <JBeulich@suse.com>
> ---
> v3:
>  * Split this change off of "x86/pv: Inject #UD for missing SYSCALL
>    callbacks", to allow the uncontroversial part of that change to go
>    in. Add conditional "rex64" for UREGS_rip adjustment. (Is branching
>    over just the REX prefix too much trickery even for an unlikely to be
>    taken code path?)

I find this submission confusion seeing as my v3 is already suitably
acked and ready to commit.  What I haven't had yet enough free time to
do so.

> v2:
>  * Drop unnecessary instruction suffixes
>  * Don't truncate #UD entrypoint to 32 bits
>
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -33,11 +33,27 @@ ENTRY(switch_to_kernel)
>          cmoveq VCPU_syscall32_addr(%rbx),%rax
>          testq %rax,%rax
>          cmovzq VCPU_syscall_addr(%rbx),%rax
> -        movq  %rax,TRAPBOUNCE_eip(%rdx)
>          /* TB_flags = VGCF_syscall_disables_events ? TBF_INTERRUPT : 0 */
>          btl   $_VGCF_syscall_disables_events,VCPU_guest_context_flags(%rbx)
>          setc  %cl
>          leal  (,%rcx,TBF_INTERRUPT),%ecx
> +
> +        test  %rax, %rax
> +UNLIKELY_START(z, syscall_no_callback) /* TB_eip == 0 => #UD */
> +        mov   VCPU_trap_ctxt(%rbx), %rdi
> +        movl  $X86_EXC_UD, UREGS_entry_vector(%rsp)
> +        cmpw  $FLAT_USER_CS32, UREGS_cs(%rsp)
> +        je    0f
> +        rex64                           # subl => subq
> +0:
> +        subl  $2, UREGS_rip(%rsp)

There was deliberately not a 32bit sub here (see below).

As to the construct, I'm having a hard time deciding whether this is an
excellent idea, or far too clever for its own good.

Some basic perf testing shows that there is a visible difference in
execution time of these two paths, which means there is some
optimisation being missed in the frontend for the 32bit case.  However,
the difference is tiny in the grand scheme of things (about 0.4%
difference in aggregate time to execute a loop of this pattern with a
fixed number of iterations.)

However, the 32bit case isn't actually interesting here.  A guest can't
execute a SYSCALL instruction on/across the 4G->0 boundary because the
M2P is mapped NX up to the 4G boundary, so we can never reach this point
with %eip < 2.

Therefore, the 64bit-only form is the appropriate one to use, which
solves any question of cleverness, or potential decode stalls it causes.

~Andrew

