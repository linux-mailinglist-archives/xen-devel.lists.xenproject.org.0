Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CClDMduUqWmKAQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 15:36:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D651A213922
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 15:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246831.1545900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy9nd-0003gg-Sb; Thu, 05 Mar 2026 14:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246831.1545900; Thu, 05 Mar 2026 14:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy9nd-0003eP-Pj; Thu, 05 Mar 2026 14:35:37 +0000
Received: by outflank-mailman (input) for mailman id 1246831;
 Thu, 05 Mar 2026 14:35:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Giqy=BF=bounce.vates.tech=bounce-md_30504962.69a994b4.v1-13efca2423ce456a8fffcf306fd88959@srs-se1.protection.inumbo.net>)
 id 1vy9nc-0003eJ-TM
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 14:35:37 +0000
Received: from mail133-21.atl131.mandrillapp.com
 (mail133-21.atl131.mandrillapp.com [198.2.133.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 912783aa-18a0-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 15:35:34 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fRXBr2gGDz1XLMvF
 for <xen-devel@lists.xenproject.org>; Thu,  5 Mar 2026 14:35:32 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 13efca2423ce456a8fffcf306fd88959; Thu, 05 Mar 2026 14:35:32 +0000
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
X-Inumbo-ID: 912783aa-18a0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772721332; x=1772991332;
	bh=bjjglNVu4C0tfbhCkLt2PLAJ8HDOll2Ntt8/ixuBhH0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zXfHRxp+TrxQO5hhELYzBehD2iWfAkQ0DIPxDo7h8rzlod5nABEUdCh0SeP0z2TDg
	 7qX6G8LE5KCue0U9Is4AveKsLmNpHc8+Ym8544m4kgy6uC+FaxgD90awHbUsnrqkBB
	 r0XUw/L2RSyA1E1eCYzl8JyaSvsrRbJJadA/Yd7dGNzDQ13jTSLU+tnDx97sjUyR7x
	 1bK02eVxhdg87/ZvtHKo57D8Dfl3gntmYs8JwLfEzDv02jB6Xi0obTO3mI73xq79Du
	 YLIrMAy1BbuxlixnpZZ0BpvcUksAHrHpcFbmOsEGQGGFgdMTDUmlL/8X5Za+3IfeJ6
	 E4/2ufMoXj7Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772721332; x=1772981832; i=teddy.astie@vates.tech;
	bh=bjjglNVu4C0tfbhCkLt2PLAJ8HDOll2Ntt8/ixuBhH0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ThKiC8+JBioN8O+ChwxU+6Ucuj2UmP1MslB9Jj+uNp64bB4CXCOSV9M6yH2KghWvB
	 qWx1PpoN/efiNH3VT0rmZvRrhllZ8Lm5bEYS/xberN8w3Xzsv+3vV/wW07axvlQBDh
	 z6U/UKAA5+RzX1CCpF9g9U1XsiOkmAIpsT2EN6t5nyqCbj8YUAto0ONrnAoMr3hgWg
	 oL3WLyFP/uR1LrdolNM8dMv91DA+Xf/BsT0PVADXjJcEHmFQp4MhXfGG+deTMAKM61
	 ZnPeg32WoaKT14kqpI7kbELQLDTqMnUJYAFtUnD2tK6Tj5hPLBp1C/SBXPfaOs8+qr
	 LTytyFv3ub6yg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20RFC:=20unmap=5Fpage=5Frange=20optimisation=20(avoiding=20emulation=20faults=20during=20VM=20migration)?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772721331310
Message-Id: <42bc5972-ecd0-4a3c-9ff7-0a5246f4bd6b@vates.tech>
To: "Edwin Torok" <edwin.torok@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Ross Lagerwall" <ross.lagerwall@citrix.com>, "Juergen Gross" <jgross@suse.com>
References: <16133EFF-88FF-467F-B78F-E96EB148C3A5@citrix.com>
In-Reply-To: <16133EFF-88FF-467F-B78F-E96EB148C3A5@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.13efca2423ce456a8fffcf306fd88959?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260305:md
Date: Thu, 05 Mar 2026 14:35:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D651A213922
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jgross@suse.com,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.171];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Adding Juergen

Le 12/02/2026 =C3=A0 18:50, Edwin Torok a =C3=A9crit=C2=A0:
> Hi,
> 
> When profiling a VM migration I noticed that on the sender side a signifi=
cant (~45%) time is spent in PV Dom0 Linux taking an emulation fault in unm=
ap_page_range [1]:
> 
> The call comes from zap_pte_range (pgtable_64.h, inlined):
>   ptent =3D ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
> 
> This has 2 implementations: native and a generic one where pte_clear is i=
mplemented using set_pte_at with a Xen pvop.
> 
> As a proof of concept I=E2=80=99ve deleted the native implementation [2],=
 which makes it fall back to the generic implementation [3].
> This is not necessarily safe on SMP (it reads and clears as 2 separate st=
eps), but shows that a paravirt op is faster than emulation.
> 
> To fix this we may need to partially revert  https://git.kernel.org/pub/s=
cm/linux/kernel/git/torvalds/linux.git/commit/?id=3D4cdd9c8931767e1c56a51a1=
078d33a8c340f4405
> 
> To test this more easily I=E2=80=99ve written a small test program that m=
aps/unmaps pages from a domain in Dom0 [4].
> Before: 3.26932 +- 0.00503 seconds time elapsed  ( +-  0.15% )
> After: 0.75642 +- 0.00202 seconds time elapsed  ( +-  0.27% )
> 
> It is more than 4x faster to use the paravirt ops than trapping and emula=
ting.
>  From a functional point of view the above commit is correct, Xen doesn=
=E2=80=99t need a dedicated PV operation: trap and emulation works.
> But from a performance point of view I=E2=80=99d say that Xen does need i=
t. This is a hot-path during migration, and it=E2=80=99d be worthwhile to o=
ptimise it.
> 
> Just deleting the native implementation is probably not the solution, sin=
ce we also want a value returned, and the existing PV operation is void.
> It probably needs a new PV operation (re)introduced with the desired sema=
ntics?
> 

I can't find a MMUEXT hypercall which does roughly xchg on the 
pagetable. You can write a entry through MMU_NORMAL_PT_UPDATE, but not 
reading it before writing it atomically (xchg).

Maybe there is a way to achieve it, but otherwise, it would need a new 
dedicated hypercall and related code for Linux.

> Best regards,
> --Edwin
> 
> [1]: https://cdn.jsdelivr.net/gh/edwintorok/xen@pmustack-coverletter/docs=
/tmp/migrate-send.svg?x=3D950.6&y=3D2197
> 
> [2]:
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtabl=
e.h
> index 690c0307afed..ab6318bb5676 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1097,13 +1097,9 @@ extern int ptep_test_and_clear_young(struct vm_are=
a_struct *vma,
>   extern int ptep_clear_flush_young(struct vm_area_struct *vma,
>                                    unsigned long address, pte_t *ptep);
> 
> -#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
> -static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned lo=
ng addr,
> -                                      pte_t *ptep)
> -{
> -       pte_t pte =3D native_ptep_get_and_clear(ptep);
> -       return pte;
> -}
> +static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
> +                                      unsigned long address,
> +                                      pte_t *ptep);
> 
>   #define __HAVE_ARCH_PTEP_GET_AND_CLEAR_FULL
>   static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
> 
> [3]:
> #ifndef __HAVE_ARCH_PTEP_GET_AND_CLEAR
> static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>                                         unsigned long address,
>                                         pte_t *ptep)
> {
>          pte_t pte =3D *ptep;
>          pte_clear(mm, address, ptep);
>          return pte;
> }
> #endif
> static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pt=
e_t *ptep) { set_pte_at(mm, addr, ptep, __pte(0)); }
> 
> [4]:
> $ cat >main.c <<EOF
> #include <assert.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <sys/mman.h>
> #include <xenctrl.h>
> #include <xenforeignmemory.h>
> 
> int main(int argc, char *argv[]) {
>    if (argc !=3D 3) {
>      fprintf(stderr, "Usage: %s <domid> <batchsize>\n", argv[0]);
>      return 1;
>    }
>    uint32_t domid =3D atoi(argv[1]);
>    uint32_t batch_size =3D atoi(argv[2]);
> 
>    if (!domid || !batch_size) {
>      fprintf(stderr, "Invalid arguments, expected 2 integers");
>      return 2;
>    }
> 
>    xenforeignmemory_handle *handle =3D xenforeignmemory_open(NULL, 0);
>    if (!handle)
>      return 3;
> 
>    xc_interface *xc =3D xc_interface_open(NULL, NULL, 0);
>    if (!xc)
>      return 4;
> 
>    xen_pfn_t nr_pfns;
>    if (xc_domain_nr_gpfns(xc, domid, &nr_pfns) < 0)
>      return 5;
> 
>    unsigned mappings_size =3D nr_pfns / batch_size + 1;
>    void **mappings =3D calloc(mappings_size, sizeof(void *));
>    if (!mappings) {
>      perror("calloc");
>      return 6;
>    }
> 
>    for (xen_pfn_t i =3D 0; i < nr_pfns; i +=3D batch_size) {
>      xen_pfn_t arr[batch_size];
>      int err[batch_size];
> 
>      for (unsigned j =3D 0; j < batch_size; j++)
>        arr[j] =3D i + j;
> 
>      unsigned long idx =3D i / batch_size;
>      assert(idx < mappings_size);
>      mappings[idx] =3D xenforeignmemory_map(
>          handle, domid, PROT_READ, sizeof(arr) / sizeof(arr[0]), arr, err=
);
>      if (!mappings[idx])
>        return 7;
>    }
> 
>    for (xen_pfn_t i =3D 0; i < nr_pfns; i +=3D batch_size) {
>      unsigned long idx =3D i / batch_size;
>      assert(idx < mappings_size);
>      if (xenforeignmemory_unmap(handle, mappings[idx], batch_size))
>        return 8;
>    }
> 
>    free(mappings);
>    xc_interface_close(xc);
>    xenforeignmemory_close(handle);
> 
>    return EXIT_SUCCESS;
> }
> EOF
> 
> $ cat >meson.build <<EOF
> project('xfm_scale', 'c', default_options:['c_std=3Dgnu11'])
> xfm =3D dependency('xenforeignmemory')
> xc =3D dependency('xencontrol=E2=80=99)
> executable('xfm_scale', 'main.c', dependencies: [xfm, xc])
> EOF

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



