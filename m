Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C2B89F99D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 16:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703328.1098950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruYhh-00084F-O0; Wed, 10 Apr 2024 14:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703328.1098950; Wed, 10 Apr 2024 14:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruYhh-00081m-L6; Wed, 10 Apr 2024 14:13:33 +0000
Received: by outflank-mailman (input) for mailman id 703328;
 Wed, 10 Apr 2024 14:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fu/Z=LP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ruYhg-0007wz-OD
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 14:13:32 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8289abe4-f744-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 16:13:31 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a46ea03c2a5so1120693466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 07:13:31 -0700 (PDT)
Received: from ?IPV6:2003:e5:8705:9b00:4df1:9dd5:4f97:24a?
 (p200300e587059b004df19dd54f97024a.dip0.t-ipconnect.de.
 [2003:e5:8705:9b00:4df1:9dd5:4f97:24a])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a170906414f00b00a519de61bebsm6998316ejk.137.2024.04.10.07.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 07:13:30 -0700 (PDT)
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
X-Inumbo-ID: 8289abe4-f744-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712758411; x=1713363211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vDpK/3WQjVbeikam+hAfuyMA1XIDGJ8Ln1Tz+atruM0=;
        b=XVsfk7PpEJ6TQIcjF4vL08B613ET4+s01Cjl8JCyOwF6FZXJcl7WO1Jwsw0TN93Vzf
         nsA19xLz6seDCiJSBVTOE/b6+qktZv+k3GNQn1lmK94Vy4aDQ1KBvWe9z9eH0uK2vYPi
         /v1p7YLCbT7kMjn3Lf5pTswyQ3DbwlZNpzei7kyXOLDRaemA7Y2+E4yzv/kPdIs1ovgd
         gkhn5ZMOGoP3S/yjBVt5UzqCa5aDeY8mu4DLe66n/e/bKSk19KPFGSxq7lszdAyLF6eS
         Nn5/A/AieqSYlc28fJoLa2qYS71I2wvnESNDgjtmnUNdgfkJ6dB4E6hvBQgJgXyJSwBD
         t4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712758411; x=1713363211;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDpK/3WQjVbeikam+hAfuyMA1XIDGJ8Ln1Tz+atruM0=;
        b=pipqu3GgsR6ZEc/OChr5N3i4cZaiG47BpA+J1PuFEoxytcLs+2OPxP+1yphUp1PaNj
         3Bvhul8ZNMAjvogxXzOW3s1UFGq9q/bqSi5+b0G6rIuZfkt1EUUurd36Hp6t5WmwMJ3j
         6EmC3Eqf3mQo3aAqE2WkyxAteBNF9IG0tTE13xXnxFAseZhFVERofrkYHnOqrTnhTlqX
         1zs0i06wix2EDCN4k/LBOQqOy7nTO13H1EuBwmQe6AXywkz+Y7hGjd9D7FAvjZNpXuI/
         CncVL9fhNtUuVhDubckaxzlO7UmYtuCzUvJy4Lxxg/zAvQXw/hZ8UvR3MUCfMwdWziet
         mntA==
X-Forwarded-Encrypted: i=1; AJvYcCW0OySAgjA0zOtvsfvFNxO+NfWzcRuCmTr2L9KeGjY5JsirxF4MFUofhER1dwumBt+vx/hf3hcZScIq3b+u+NrxJMj8lqbnmhTO6DHSdzU=
X-Gm-Message-State: AOJu0Yy4emapS+X17cVZ5w9R6SpaVC5ofrwRKhGoe6N06hfv7Xyv8nyi
	97Ar1GVi0BWTx8EDJmuXWWcZ8HcZlwDwqabgYQDxQ0MrciuDtQz/+NGGZLCxv0Q=
X-Google-Smtp-Source: AGHT+IG//o2hSrl1V8BVIIurZsctw3ES6spYWYRLuk2P/pNTWjV+L9bcGgL69go/rwrLf1sT4SSsfg==
X-Received: by 2002:a17:906:3b9b:b0:a4f:193e:9600 with SMTP id u27-20020a1709063b9b00b00a4f193e9600mr5028138ejf.18.1712758410890;
        Wed, 10 Apr 2024 07:13:30 -0700 (PDT)
Message-ID: <78018558-35d9-41de-947d-3b0a2c72b616@suse.com>
Date: Wed, 10 Apr 2024 16:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pat: fix W^X violation false-positives when running
 as Xen PV guest
Content-Language: en-US
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240409094712.21285-1-jgross@suse.com>
 <ZhaYsAuhhqomQUWT@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <ZhaYsAuhhqomQUWT@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.04.24 15:48, Ingo Molnar wrote:
> 
> * Juergen Gross <jgross@suse.com> wrote:
> 
>> When running as Xen PV guest in some cases W^X violation WARN()s have
>> been observed. Those WARN()s are produced by verify_rwx(), which looks
>> into the PTE to verify that writable kernel pages have the NX bit set
>> in order to avoid code modifications of the kernel by rogue code.
>>
>> As the NX bits of all levels of translation entries are or-ed and the
>> RW bits of all levels are and-ed, looking just into the PTE isn't enough
>> for the decision that a writable page is executable, too. When running
>> as a Xen PV guest, kernel initialization will set the NX bit in PMD
>> entries of the initial page tables covering the .data segment.
>>
>> When finding the PTE to have set the RW bit but no NX bit, higher level
>> entries must be looked at. Only when all levels have the RW bit set and
>> no NX bit set, the W^X violation should be flagged.
>>
>> Additionally show_fault_oops() has a similar problem: it will issue the
>> "kernel tried to execute NX-protected page" message only if it finds
>> the NX bit set in the leaf translation entry, while any NX bit in
>> non-leaf entries are being ignored for issuing the message.
>>
>> Modify lookup_address_in_pgd() to return the effective NX and RW bit
>> values of the non-leaf translation entries and evaluate those as well
>> in verify_rwx() and show_fault_oops().
> 
> Ok, this fix makes sense, as that's how the hardware works and we interpret
> the pagetables poorly.

Thanks for confirmation that my approach is sane.

> 
>> Fixes: 652c5bf380ad ("x86/mm: Refuse W^X violations")
>> Reported-by: Jason Andryuk <jandryuk@gmail.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   arch/x86/include/asm/pgtable_types.h |  2 +-
>>   arch/x86/kernel/sev.c                |  3 +-
>>   arch/x86/mm/fault.c                  |  7 ++--
>>   arch/x86/mm/pat/set_memory.c         | 56 +++++++++++++++++++++-------
>>   arch/x86/virt/svm/sev.c              |  3 +-
>>   5 files changed, 52 insertions(+), 19 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
>> index 0b748ee16b3d..91ab538d3872 100644
>> --- a/arch/x86/include/asm/pgtable_types.h
>> +++ b/arch/x86/include/asm/pgtable_types.h
>> @@ -565,7 +565,7 @@ static inline void update_page_count(int level, unsigned long pages) { }
>>    */
>>   extern pte_t *lookup_address(unsigned long address, unsigned int *level);
>>   extern pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
>> -				    unsigned int *level);
>> +				    unsigned int *level, bool *nx, bool *rw);
>>   extern pmd_t *lookup_pmd_address(unsigned long address);
>>   extern phys_addr_t slow_virt_to_phys(void *__address);
>>   extern int __init kernel_map_pages_in_pgd(pgd_t *pgd, u64 pfn,
> 
> Please introduce a new lookup_address_in_pgd_attr() function or so, which
> is used by code intentionally.
> 
> This avoids changing the arch/x86/kernel/sev.c and arch/x86/virt/svm/sev.c
> uses, that retrieve these attributes but don't do anything with them:

Okay.

> 
>> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
>> index 38ad066179d8..adba581e999d 100644
>> --- a/arch/x86/kernel/sev.c
>> +++ b/arch/x86/kernel/sev.c
>> @@ -516,12 +516,13 @@ static enum es_result vc_slow_virt_to_phys(struct ghcb *ghcb, struct es_em_ctxt
>>   	unsigned long va = (unsigned long)vaddr;
>>   	unsigned int level;
>>   	phys_addr_t pa;
>> +	bool nx, rw;
>>   	pgd_t *pgd;
>>   	pte_t *pte;
>>   
>>   	pgd = __va(read_cr3_pa());
>>   	pgd = &pgd[pgd_index(va)];
>> -	pte = lookup_address_in_pgd(pgd, va, &level);
>> +	pte = lookup_address_in_pgd(pgd, va, &level, &nx, &rw);
>>   	if (!pte) {
>>   		ctxt->fi.vector     = X86_TRAP_PF;
>>   		ctxt->fi.cr2        = vaddr;
>> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
>> index 622d12ec7f08..eb8e897a5653 100644
>> --- a/arch/x86/mm/fault.c
>> +++ b/arch/x86/mm/fault.c
>> @@ -514,18 +514,19 @@ show_fault_oops(struct pt_regs *regs, unsigned long error_code, unsigned long ad
>>   
>>   	if (error_code & X86_PF_INSTR) {
>>   		unsigned int level;
>> +		bool nx, rw;
>>   		pgd_t *pgd;
>>   		pte_t *pte;
>>   
>>   		pgd = __va(read_cr3_pa());
>>   		pgd += pgd_index(address);
>>   
>> -		pte = lookup_address_in_pgd(pgd, address, &level);
>> +		pte = lookup_address_in_pgd(pgd, address, &level, &nx, &rw);
>>   
>> -		if (pte && pte_present(*pte) && !pte_exec(*pte))
>> +		if (pte && pte_present(*pte) && (!pte_exec(*pte) || nx))
>>   			pr_crit("kernel tried to execute NX-protected page - exploit attempt? (uid: %d)\n",
>>   				from_kuid(&init_user_ns, current_uid()));
>> -		if (pte && pte_present(*pte) && pte_exec(*pte) &&
>> +		if (pte && pte_present(*pte) && pte_exec(*pte) && !nx &&
>>   				(pgd_flags(*pgd) & _PAGE_USER) &&
>>   				(__read_cr4() & X86_CR4_SMEP))
>>   			pr_crit("unable to execute userspace code (SMEP?) (uid: %d)\n",
> 
> This should be a separate patch - as it might change observed behavior.

Fine with me.

> 
>> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
>> index 80c9037ffadf..baa4dc4748e9 100644
>> --- a/arch/x86/mm/pat/set_memory.c
>> +++ b/arch/x86/mm/pat/set_memory.c
>> @@ -619,7 +619,8 @@ static inline pgprot_t static_protections(pgprot_t prot, unsigned long start,
>>    * Validate strict W^X semantics.
>>    */
>>   static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long start,
>> -				  unsigned long pfn, unsigned long npg)
>> +				  unsigned long pfn, unsigned long npg,
>> +				  bool nx, bool rw)
>>   {
>>   	unsigned long end;
>>   
>> @@ -641,6 +642,10 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
>>   	if ((pgprot_val(new) & (_PAGE_RW | _PAGE_NX)) != _PAGE_RW)
>>   		return new;
>>   
>> +	/* Non-leaf translation entries can disable writing or execution. */
>> +	if (!rw || nx)
>> +		return new;
>> +
>>   	end = start + npg * PAGE_SIZE - 1;
>>   	WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
>>   		  (unsigned long long)pgprot_val(old),
>> @@ -660,17 +665,22 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
>>    * Return a pointer to the entry and the level of the mapping.
>>    */
>>   pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
>> -			     unsigned int *level)
>> +			     unsigned int *level, bool *nx, bool *rw)
>>   {
>>   	p4d_t *p4d;
>>   	pud_t *pud;
>>   	pmd_t *pmd;
>>   
>>   	*level = PG_LEVEL_NONE;
>> +	*nx = false;
>> +	*rw = true;
>>   
>>   	if (pgd_none(*pgd))
>>   		return NULL;
>>   
>> +	*nx |= pgd_flags(*pgd) & _PAGE_NX;
>> +	*rw &= pgd_flags(*pgd) & _PAGE_RW;
>> +
>>   	p4d = p4d_offset(pgd, address);
>>   	if (p4d_none(*p4d))
>>   		return NULL;
>> @@ -679,6 +689,9 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
>>   	if (p4d_leaf(*p4d) || !p4d_present(*p4d))
>>   		return (pte_t *)p4d;
>>   
>> +	*nx |= p4d_flags(*p4d) & _PAGE_NX;
>> +	*rw &= p4d_flags(*p4d) & _PAGE_RW;
>> +
>>   	pud = pud_offset(p4d, address);
>>   	if (pud_none(*pud))
>>   		return NULL;
>> @@ -687,6 +700,9 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
>>   	if (pud_leaf(*pud) || !pud_present(*pud))
>>   		return (pte_t *)pud;
>>   
>> +	*nx |= pud_flags(*pud) & _PAGE_NX;
>> +	*rw &= pud_flags(*pud) & _PAGE_RW;
>> +
>>   	pmd = pmd_offset(pud, address);
>>   	if (pmd_none(*pmd))
>>   		return NULL;
>> @@ -695,6 +711,9 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
>>   	if (pmd_leaf(*pmd) || !pmd_present(*pmd))
>>   		return (pte_t *)pmd;
>>   
>> +	*nx |= pmd_flags(*pmd) & _PAGE_NX;
>> +	*rw &= pmd_flags(*pmd) & _PAGE_RW;
>> +
>>   	*level = PG_LEVEL_4K;
>>   
> 
> This should be a separate preparatory patch that also introduces the new
> method - without changing any behavior.

Okay.

> 
>    	return pte_offset_kernel(pmd, address);
>> @@ -710,18 +729,24 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
>>    */
>>   pte_t *lookup_address(unsigned long address, unsigned int *level)
>>   {
>> -	return lookup_address_in_pgd(pgd_offset_k(address), address, level);
>> +	bool nx, rw;
>> +
>> +	return lookup_address_in_pgd(pgd_offset_k(address), address, level,
>> +				     &nx, &rw);
>>   }
>>   EXPORT_SYMBOL_GPL(lookup_address);
>>   
>>   static pte_t *_lookup_address_cpa(struct cpa_data *cpa, unsigned long address,
>> -				  unsigned int *level)
>> +				  unsigned int *level, bool *nx, bool *rw)
>>   {
>> -	if (cpa->pgd)
>> -		return lookup_address_in_pgd(cpa->pgd + pgd_index(address),
>> -					       address, level);
>> +	pgd_t *pgd;
>> +
>> +	if (!cpa->pgd)
>> +		pgd = pgd_offset_k(address);
>> +	else
>> +		pgd = cpa->pgd + pgd_index(address);
>>   
>> -	return lookup_address(address, level);
>> +	return lookup_address_in_pgd(pgd, address, level, nx, rw);
> 
> I think it would be better to split out this change as well into a separate
> patch. It changes the flow from lookup_address_in_pgd() + lookup_address()
> to only use lookup_address_in_pgd(), which is an identity transformation
> that should be better done separately.

Okay.

> 
>>   }
>>   
>>   /*
>> @@ -849,12 +874,13 @@ static int __should_split_large_page(pte_t *kpte, unsigned long address,
>>   	pgprot_t old_prot, new_prot, req_prot, chk_prot;
>>   	pte_t new_pte, *tmp;
>>   	enum pg_level level;
>> +	bool nx, rw;
>>   
>>   	/*
>>   	 * Check for races, another CPU might have split this page
>>   	 * up already:
>>   	 */
>> -	tmp = _lookup_address_cpa(cpa, address, &level);
>> +	tmp = _lookup_address_cpa(cpa, address, &level, &nx, &rw);
>>   	if (tmp != kpte)
>>   		return 1;
>>   
>> @@ -965,7 +991,8 @@ static int __should_split_large_page(pte_t *kpte, unsigned long address,
>>   	new_prot = static_protections(req_prot, lpaddr, old_pfn, numpages,
>>   				      psize, CPA_DETECT);
>>   
>> -	new_prot = verify_rwx(old_prot, new_prot, lpaddr, old_pfn, numpages);
>> +	new_prot = verify_rwx(old_prot, new_prot, lpaddr, old_pfn, numpages,
>> +			      nx, rw);
>>   
>>   	/*
>>   	 * If there is a conflict, split the large page.
>> @@ -1046,6 +1073,7 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
>>   	pte_t *pbase = (pte_t *)page_address(base);
>>   	unsigned int i, level;
>>   	pgprot_t ref_prot;
>> +	bool nx, rw;
>>   	pte_t *tmp;
>>   
>>   	spin_lock(&pgd_lock);
>> @@ -1053,7 +1081,7 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
>>   	 * Check for races, another CPU might have split this page
>>   	 * up for us already:
>>   	 */
>> -	tmp = _lookup_address_cpa(cpa, address, &level);
>> +	tmp = _lookup_address_cpa(cpa, address, &level, &nx, &rw);
>>   	if (tmp != kpte) {
>>   		spin_unlock(&pgd_lock);
>>   		return 1;
>> @@ -1594,10 +1622,11 @@ static int __change_page_attr(struct cpa_data *cpa, int primary)
>>   	int do_split, err;
>>   	unsigned int level;
>>   	pte_t *kpte, old_pte;
>> +	bool nx, rw;
>>   
>>   	address = __cpa_addr(cpa, cpa->curpage);
>>   repeat:
>> -	kpte = _lookup_address_cpa(cpa, address, &level);
>> +	kpte = _lookup_address_cpa(cpa, address, &level, &nx, &rw);
>>   	if (!kpte)
>>   		return __cpa_process_fault(cpa, address, primary);
>>   
>> @@ -1619,7 +1648,8 @@ static int __change_page_attr(struct cpa_data *cpa, int primary)
>>   		new_prot = static_protections(new_prot, address, pfn, 1, 0,
>>   					      CPA_PROTECT);
>>   
>> -		new_prot = verify_rwx(old_prot, new_prot, address, pfn, 1);
>> +		new_prot = verify_rwx(old_prot, new_prot, address, pfn, 1,
>> +				      nx, rw);
>>   
>>   		new_prot = pgprot_clear_protnone_bits(new_prot);
> 
> And then this should be the final patch, which fixes RWX verification
> within the CPA code.

Agreed.


Juergen


