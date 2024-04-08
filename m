Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5723089BCF3
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 12:24:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701887.1096479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtm9b-0005Gz-Hw; Mon, 08 Apr 2024 10:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701887.1096479; Mon, 08 Apr 2024 10:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtm9b-0005F2-F4; Mon, 08 Apr 2024 10:23:07 +0000
Received: by outflank-mailman (input) for mailman id 701887;
 Mon, 08 Apr 2024 10:23:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djzs=LN=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rtm9a-0005Ew-3p
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 10:23:06 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa7d06f8-f591-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 12:23:01 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d886dd4f18so12082811fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 03:23:01 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l8-20020a1c7908000000b00416838eeda7sm665967wme.1.2024.04.08.03.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 03:23:00 -0700 (PDT)
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
X-Inumbo-ID: fa7d06f8-f591-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712571781; x=1713176581; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eQWcSoGSs4u7E5KUko9THOfWCCg1AklJd4XJDC2Aw3U=;
        b=ew3+zhWM832/JZEu9pvAdmkph9/vMPC7ePL0GAAPk1OwRaafPGpe5nLy3EpIBdjIZ2
         9kywgK17pG4RVlroUdDkq8l7mcqlBC3WTazSj8rQjX0HtEzPR2+G9b2yehJ8LsUk38iw
         3+u34/3kqWD2o94Jl7/Z7lNc0DJGLHdhfzs6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712571781; x=1713176581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQWcSoGSs4u7E5KUko9THOfWCCg1AklJd4XJDC2Aw3U=;
        b=IVVkzHc8PmBFotDy0KZZ15OfnZBgx/6bQUv8UvkkVpyrok6CfL1b5JAwT7Gw4MOso0
         9CHuB3665Mw9e3lwT5KQnSKLTua6PInIPegk8orLDeo4+Vxh0plQD+j/q1ep+P4IZrO/
         HgsVoh0i7tdYkMyckGhatLSyAMptTRzuMLTSZ8D8uAiyz/VlUgV17KVcRNdGOobPjgHZ
         TIylDD1sGWXPDm/Hp87Ldsesv7LbN1OQP4C9mGrcOiTUwOf1QyZswW1WtCimpDzWDay7
         A8ZD+IoElXIhdOOqiOVVDLE//ZyakJh2gKcJaaaH4nO/GGJy25tkmiIInJ9C5Tjpd1+m
         cAiA==
X-Forwarded-Encrypted: i=1; AJvYcCVZJuOpBITy/JG2NHNEc34NRUxwkcCvHiFOGtZYma4Clze+Sh+0+S2L7I6thZAh83JvWjwSs0rTwjN3oTKf2vlBzUxaRb8yRVq8vRns9Tw=
X-Gm-Message-State: AOJu0YzlUsfxf/YCdEWoIBgwOKlONHGwBJBz32uDsanED0fDsd2ZRtYK
	Npmk4S+BrpY/fKPddh4hAtoWv2UJwE5HB6qbaaBpxEgnYYSvWokjV2mtKdNUKlIg2SCAEqPH2Hy
	i
X-Google-Smtp-Source: AGHT+IHVEWICi/Q8QMp/tD+l30c+k8xCYBmkiRMeY3pEC9QEl3Mhdmx87KFV1O6RjK3R4lWkdwB7IQ==
X-Received: by 2002:ac2:4884:0:b0:515:c43e:19c6 with SMTP id x4-20020ac24884000000b00515c43e19c6mr6019948lfc.23.1712571781089;
        Mon, 08 Apr 2024 03:23:01 -0700 (PDT)
Date: Mon, 8 Apr 2024 11:22:59 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Subject: Re: Linux Xen PV CPA W^X violation false-positives
Message-ID: <f86bc525-1a77-4b7a-b1b3-9a22d9525e90@perard>
References: <20240124165401.35784-1-jandryuk@gmail.com>
 <a2246242-627a-493b-9cd4-c76b0cb301ee@suse.com>
 <CAKf6xps9X=6GYxuk9u2cPYh_pzpLu2MQ00smydRQ40TjxDhgEQ@mail.gmail.com>
 <9b5a105a-650c-4b33-9f4e-03612fb6701c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b5a105a-650c-4b33-9f4e-03612fb6701c@suse.com>

On Thu, Mar 28, 2024 at 02:00:14PM +0100, Jürgen Groß wrote:
> Hi Jason,
> 
> On 28.03.24 02:24, Jason Andryuk wrote:
> > On Wed, Mar 27, 2024 at 7:46 AM Jürgen Groß <jgross@suse.com> wrote:
> > > 
> > > On 24.01.24 17:54, Jason Andryuk wrote:
> > > > +
> > > > +                     return new;
> > > > +             }
> > > > +     }
> > > > +
> > > >        end = start + npg * PAGE_SIZE - 1;
> > > >        WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
> > > >                  (unsigned long long)pgprot_val(old),
> > > 
> > > Jason, do you want to send a V2 with your Signed-off, or would you like me to
> > > try upstreaming the patch?
> > 
> > Hi Jürgen,
> > 
> > Yes, please upstream your approach.  I wasn't sure how to deal with
> > it, so it was more of a bug report.
> 
> The final solution was a bit more complicated, as there are some
> corner cases to be considered. OTOH it is now complete by looking
> at all used translation entries.
> 
> Are you able to test the attached patch? I don't see the original
> issue and can only verify the patch doesn't cause any regression.
> 
> 
> Juergen

Hi Jürgen,

I gave a try to the patch in this email with osstest, and I can't find a
single "CPA detected W^X violation" log entry, when there's seems to be
many in osstest in general, from dom0 it seems as it's on the host
serial console usually.

http://logs.test-lab.xenproject.org/osstest/logs/185252/

If you look in several "serial-$host.log*" files, there will be the
"CPA detected" message, but they happen on previous test run.

I did an other smaller run before this one, and same thing:
http://logs.test-lab.xenproject.org/osstest/logs/185186/

And this other run as well, which I failed to setup properly with lots
of broken, but no failure due to the patch and I can't find any "CPA
detected" messages.
http://logs.test-lab.xenproject.org/osstest/logs/185248/

I hope that helps?

Cheers,


> From fd25a67d92e44b61d05d92658b23d026202a1656 Mon Sep 17 00:00:00 2001
> From: Juergen Gross <jgross@suse.com>
> To: x86@kernel.org
> To: linux-kernel@vger.kernel.org
> To: xen-devel@lists.xenproject.org
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Date: Thu, 28 Mar 2024 12:24:48 +0100
> Subject: [PATCH] x86/pat: fix W^X violation false-positives when running as
>  Xen PV guest
> 
> When running as Xen PV guest in some cases W^X violation WARN()s have
> been observed. Those WARN()s are produced by verify_rwx(), which looks
> into the PTE to verify that writable kernel pages have the NX bit set
> in order to avoid code modifications of the kernel by rogue code.
> 
> As the NX bits of all levels of translation entries are or-ed and the
> RW bits of all levels are and-ed, looking just into the PTE isn't enough
> for the decision that a writable page is executable, too. When running
> as a Xen PV guest, kernel initialization will set the NX bit in PMD
> entries of the initial page tables covering the .data segment.
> 
> When finding the PTE to have set the RW bit but no NX bit, higher level
> entries must be looked at. Only when all levels have the RW bit set and
> no NX bit set, the W^X violation should be flagged.
> 
> Additionally show_fault_oops() has a similar problem: it will issue the
> "kernel tried to execute NX-protected page" message only if it finds
> the NX bit set in the leaf translation entry, while any NX bit in
> non-leaf entries are being ignored for issuing the message.
> 
> Modify lookup_address_in_pgd() to return the effective NX and RW bit
> values of the non-leaf translation entries and evaluate those as well
> in verify_rwx() and show_fault_oops().
> 
> Fixes: 652c5bf380ad ("x86/mm: Refuse W^X violations")
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/include/asm/pgtable_types.h |  2 +-
>  arch/x86/kernel/sev.c                |  3 +-
>  arch/x86/mm/fault.c                  |  7 ++--
>  arch/x86/mm/pat/set_memory.c         | 56 +++++++++++++++++++++-------
>  arch/x86/virt/svm/sev.c              |  3 +-
>  5 files changed, 52 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
> index 0b748ee16b3d..91ab538d3872 100644
> --- a/arch/x86/include/asm/pgtable_types.h
> +++ b/arch/x86/include/asm/pgtable_types.h
> @@ -565,7 +565,7 @@ static inline void update_page_count(int level, unsigned long pages) { }
>   */
>  extern pte_t *lookup_address(unsigned long address, unsigned int *level);
>  extern pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
> -				    unsigned int *level);
> +				    unsigned int *level, bool *nx, bool *rw);
>  extern pmd_t *lookup_pmd_address(unsigned long address);
>  extern phys_addr_t slow_virt_to_phys(void *__address);
>  extern int __init kernel_map_pages_in_pgd(pgd_t *pgd, u64 pfn,
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index b59b09c2f284..e833183d1adb 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -515,12 +515,13 @@ static enum es_result vc_slow_virt_to_phys(struct ghcb *ghcb, struct es_em_ctxt
>  	unsigned long va = (unsigned long)vaddr;
>  	unsigned int level;
>  	phys_addr_t pa;
> +	bool nx, rw;
>  	pgd_t *pgd;
>  	pte_t *pte;
>  
>  	pgd = __va(read_cr3_pa());
>  	pgd = &pgd[pgd_index(va)];
> -	pte = lookup_address_in_pgd(pgd, va, &level);
> +	pte = lookup_address_in_pgd(pgd, va, &level, &nx, &rw);
>  	if (!pte) {
>  		ctxt->fi.vector     = X86_TRAP_PF;
>  		ctxt->fi.cr2        = vaddr;
> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index 622d12ec7f08..eb8e897a5653 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -514,18 +514,19 @@ show_fault_oops(struct pt_regs *regs, unsigned long error_code, unsigned long ad
>  
>  	if (error_code & X86_PF_INSTR) {
>  		unsigned int level;
> +		bool nx, rw;
>  		pgd_t *pgd;
>  		pte_t *pte;
>  
>  		pgd = __va(read_cr3_pa());
>  		pgd += pgd_index(address);
>  
> -		pte = lookup_address_in_pgd(pgd, address, &level);
> +		pte = lookup_address_in_pgd(pgd, address, &level, &nx, &rw);
>  
> -		if (pte && pte_present(*pte) && !pte_exec(*pte))
> +		if (pte && pte_present(*pte) && (!pte_exec(*pte) || nx))
>  			pr_crit("kernel tried to execute NX-protected page - exploit attempt? (uid: %d)\n",
>  				from_kuid(&init_user_ns, current_uid()));
> -		if (pte && pte_present(*pte) && pte_exec(*pte) &&
> +		if (pte && pte_present(*pte) && pte_exec(*pte) && !nx &&
>  				(pgd_flags(*pgd) & _PAGE_USER) &&
>  				(__read_cr4() & X86_CR4_SMEP))
>  			pr_crit("unable to execute userspace code (SMEP?) (uid: %d)\n",
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index 80c9037ffadf..baa4dc4748e9 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -619,7 +619,8 @@ static inline pgprot_t static_protections(pgprot_t prot, unsigned long start,
>   * Validate strict W^X semantics.
>   */
>  static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long start,
> -				  unsigned long pfn, unsigned long npg)
> +				  unsigned long pfn, unsigned long npg,
> +				  bool nx, bool rw)
>  {
>  	unsigned long end;
>  
> @@ -641,6 +642,10 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
>  	if ((pgprot_val(new) & (_PAGE_RW | _PAGE_NX)) != _PAGE_RW)
>  		return new;
>  
> +	/* Non-leaf translation entries can disable writing or execution. */
> +	if (!rw || nx)
> +		return new;
> +
>  	end = start + npg * PAGE_SIZE - 1;
>  	WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
>  		  (unsigned long long)pgprot_val(old),
> @@ -660,17 +665,22 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
>   * Return a pointer to the entry and the level of the mapping.
>   */
>  pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
> -			     unsigned int *level)
> +			     unsigned int *level, bool *nx, bool *rw)
>  {
>  	p4d_t *p4d;
>  	pud_t *pud;
>  	pmd_t *pmd;
>  
>  	*level = PG_LEVEL_NONE;
> +	*nx = false;
> +	*rw = true;
>  
>  	if (pgd_none(*pgd))
>  		return NULL;
>  
> +	*nx |= pgd_flags(*pgd) & _PAGE_NX;
> +	*rw &= pgd_flags(*pgd) & _PAGE_RW;
> +
>  	p4d = p4d_offset(pgd, address);
>  	if (p4d_none(*p4d))
>  		return NULL;
> @@ -679,6 +689,9 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
>  	if (p4d_leaf(*p4d) || !p4d_present(*p4d))
>  		return (pte_t *)p4d;
>  
> +	*nx |= p4d_flags(*p4d) & _PAGE_NX;
> +	*rw &= p4d_flags(*p4d) & _PAGE_RW;
> +
>  	pud = pud_offset(p4d, address);
>  	if (pud_none(*pud))
>  		return NULL;
> @@ -687,6 +700,9 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
>  	if (pud_leaf(*pud) || !pud_present(*pud))
>  		return (pte_t *)pud;
>  
> +	*nx |= pud_flags(*pud) & _PAGE_NX;
> +	*rw &= pud_flags(*pud) & _PAGE_RW;
> +
>  	pmd = pmd_offset(pud, address);
>  	if (pmd_none(*pmd))
>  		return NULL;
> @@ -695,6 +711,9 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
>  	if (pmd_leaf(*pmd) || !pmd_present(*pmd))
>  		return (pte_t *)pmd;
>  
> +	*nx |= pmd_flags(*pmd) & _PAGE_NX;
> +	*rw &= pmd_flags(*pmd) & _PAGE_RW;
> +
>  	*level = PG_LEVEL_4K;
>  
>  	return pte_offset_kernel(pmd, address);
> @@ -710,18 +729,24 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
>   */
>  pte_t *lookup_address(unsigned long address, unsigned int *level)
>  {
> -	return lookup_address_in_pgd(pgd_offset_k(address), address, level);
> +	bool nx, rw;
> +
> +	return lookup_address_in_pgd(pgd_offset_k(address), address, level,
> +				     &nx, &rw);
>  }
>  EXPORT_SYMBOL_GPL(lookup_address);
>  
>  static pte_t *_lookup_address_cpa(struct cpa_data *cpa, unsigned long address,
> -				  unsigned int *level)
> +				  unsigned int *level, bool *nx, bool *rw)
>  {
> -	if (cpa->pgd)
> -		return lookup_address_in_pgd(cpa->pgd + pgd_index(address),
> -					       address, level);
> +	pgd_t *pgd;
> +
> +	if (!cpa->pgd)
> +		pgd = pgd_offset_k(address);
> +	else
> +		pgd = cpa->pgd + pgd_index(address);
>  
> -	return lookup_address(address, level);
> +	return lookup_address_in_pgd(pgd, address, level, nx, rw);
>  }
>  
>  /*
> @@ -849,12 +874,13 @@ static int __should_split_large_page(pte_t *kpte, unsigned long address,
>  	pgprot_t old_prot, new_prot, req_prot, chk_prot;
>  	pte_t new_pte, *tmp;
>  	enum pg_level level;
> +	bool nx, rw;
>  
>  	/*
>  	 * Check for races, another CPU might have split this page
>  	 * up already:
>  	 */
> -	tmp = _lookup_address_cpa(cpa, address, &level);
> +	tmp = _lookup_address_cpa(cpa, address, &level, &nx, &rw);
>  	if (tmp != kpte)
>  		return 1;
>  
> @@ -965,7 +991,8 @@ static int __should_split_large_page(pte_t *kpte, unsigned long address,
>  	new_prot = static_protections(req_prot, lpaddr, old_pfn, numpages,
>  				      psize, CPA_DETECT);
>  
> -	new_prot = verify_rwx(old_prot, new_prot, lpaddr, old_pfn, numpages);
> +	new_prot = verify_rwx(old_prot, new_prot, lpaddr, old_pfn, numpages,
> +			      nx, rw);
>  
>  	/*
>  	 * If there is a conflict, split the large page.
> @@ -1046,6 +1073,7 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
>  	pte_t *pbase = (pte_t *)page_address(base);
>  	unsigned int i, level;
>  	pgprot_t ref_prot;
> +	bool nx, rw;
>  	pte_t *tmp;
>  
>  	spin_lock(&pgd_lock);
> @@ -1053,7 +1081,7 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
>  	 * Check for races, another CPU might have split this page
>  	 * up for us already:
>  	 */
> -	tmp = _lookup_address_cpa(cpa, address, &level);
> +	tmp = _lookup_address_cpa(cpa, address, &level, &nx, &rw);
>  	if (tmp != kpte) {
>  		spin_unlock(&pgd_lock);
>  		return 1;
> @@ -1594,10 +1622,11 @@ static int __change_page_attr(struct cpa_data *cpa, int primary)
>  	int do_split, err;
>  	unsigned int level;
>  	pte_t *kpte, old_pte;
> +	bool nx, rw;
>  
>  	address = __cpa_addr(cpa, cpa->curpage);
>  repeat:
> -	kpte = _lookup_address_cpa(cpa, address, &level);
> +	kpte = _lookup_address_cpa(cpa, address, &level, &nx, &rw);
>  	if (!kpte)
>  		return __cpa_process_fault(cpa, address, primary);
>  
> @@ -1619,7 +1648,8 @@ static int __change_page_attr(struct cpa_data *cpa, int primary)
>  		new_prot = static_protections(new_prot, address, pfn, 1, 0,
>  					      CPA_PROTECT);
>  
> -		new_prot = verify_rwx(old_prot, new_prot, address, pfn, 1);
> +		new_prot = verify_rwx(old_prot, new_prot, address, pfn, 1,
> +				      nx, rw);
>  
>  		new_prot = pgprot_clear_protnone_bits(new_prot);
>  
> diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
> index cffe1157a90a..9131d80cff36 100644
> --- a/arch/x86/virt/svm/sev.c
> +++ b/arch/x86/virt/svm/sev.c
> @@ -338,12 +338,13 @@ void snp_dump_hva_rmpentry(unsigned long hva)
>  {
>  	unsigned long paddr;
>  	unsigned int level;
> +	bool nx, rw;
>  	pgd_t *pgd;
>  	pte_t *pte;
>  
>  	pgd = __va(read_cr3_pa());
>  	pgd += pgd_index(hva);
> -	pte = lookup_address_in_pgd(pgd, hva, &level);
> +	pte = lookup_address_in_pgd(pgd, hva, &level, &nx, &rw);
>  
>  	if (!pte) {
>  		pr_err("Can't dump RMP entry for HVA %lx: no PTE/PFN found\n", hva);
> -- 
> 2.35.3
> 


-- 
Anthony PERARD

