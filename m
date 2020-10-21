Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B407294E20
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 15:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10084.26583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVEbk-0001Mw-OV; Wed, 21 Oct 2020 13:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10084.26583; Wed, 21 Oct 2020 13:56:52 +0000
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
	id 1kVEbk-0001MX-LD; Wed, 21 Oct 2020 13:56:52 +0000
Received: by outflank-mailman (input) for mailman id 10084;
 Wed, 21 Oct 2020 13:56:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVEbi-0001Lo-Ml
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 13:56:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a62ac48-afe3-43a5-bec1-79817ec655f7;
 Wed, 21 Oct 2020 13:56:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C55BEAE0C;
 Wed, 21 Oct 2020 13:56:48 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVEbi-0001Lo-Ml
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 13:56:50 +0000
X-Inumbo-ID: 8a62ac48-afe3-43a5-bec1-79817ec655f7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8a62ac48-afe3-43a5-bec1-79817ec655f7;
	Wed, 21 Oct 2020 13:56:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603288608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3qXGbst+Pk6JDM4JK8cfOB9fQVYHkDFGQ6b7JIQTD0=;
	b=NMs9wwZXOdNIPvCIa36zvhy8DvgjRG5CMCasN8hbxDg9PIpyMXVZD76MZ4QrFGWlEQYojY
	7esvejxaEV3rGR1rVvYW5Y5YlQjMgIhmiX6yBs5D0QVDT9afmhk1/yd5Q6m7QggyOdg7bw
	9ELiDxI8weYszbZy6/YVX6MAS2AR02U=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C55BEAE0C;
	Wed, 21 Oct 2020 13:56:48 +0000 (UTC)
Subject: Re: [PATCH] x86/pv: Flush TLB in response to paging structure changes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201021130708.12249-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7967fa6e-213d-50e2-87d3-dbd319aa2060@suse.com>
Date: Wed, 21 Oct 2020 15:56:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201021130708.12249-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.10.2020 15:07, Andrew Cooper wrote:
> @@ -4037,6 +4037,9 @@ long do_mmu_update(
>                          break;
>                      rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
> +                    /* Paging structure maybe changed.  Flush linear range. */
> +                    if ( !rc )
> +                        flush_flags_all |= FLUSH_TLB;
>                      break;
>  
>                  case PGT_l3_page_table:
> @@ -4044,6 +4047,9 @@ long do_mmu_update(
>                          break;
>                      rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
> +                    /* Paging structure maybe changed.  Flush linear range. */
> +                    if ( !rc )
> +                        flush_flags_all |= FLUSH_TLB;
>                      break;
>  
>                  case PGT_l4_page_table:
> @@ -4051,27 +4057,28 @@ long do_mmu_update(
>                          break;
>                      rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
> -                    if ( !rc && pt_owner->arch.pv.xpti )
> +                    /* Paging structure maybe changed.  Flush linear range. */
> +                    if ( !rc )
>                      {
> -                        bool local_in_use = false;
> +                        bool local_in_use = mfn_eq(
> +                            pagetable_get_mfn(curr->arch.guest_table), mfn);
>  
> -                        if ( mfn_eq(pagetable_get_mfn(curr->arch.guest_table),
> -                                    mfn) )
> -                        {
> -                            local_in_use = true;
> -                            get_cpu_info()->root_pgt_changed = true;
> -                        }
> +                        flush_flags_all |= FLUSH_TLB;
> +
> +                        if ( local_in_use )
> +                            flush_flags_local |= FLUSH_TLB | FLUSH_ROOT_PGTBL;

Aiui here (and in the code consuming the flags) you build upon
flush_flags_local, when not zero, always being a superset of
flush_flags_all. I think this is a trap to fall into when later
wanting to change this code, but as per below this won't hold
anymore anyway, I think. Hence here I think you want to set
FLUSH_TLB unconditionally, and above for L3 and L2 you want to
set it in both variables. Or, if I'm wrong below, a comment to
that effect may help people avoid falling into this trap.

An alternative would be to have

    flush_flags_local |= (flush_flags_all & FLUSH_TLB);

before doing the actual flush.

>                          /*
>                           * No need to sync if all uses of the page can be
>                           * accounted to the page lock we hold, its pinned
>                           * status, and uses on this (v)CPU.
>                           */
> -                        if ( (page->u.inuse.type_info & PGT_count_mask) >
> +                        if ( pt_owner->arch.pv.xpti &&

I assume you've moved this here to avoid the further non-trivial
checks when possible, but you've not put it around the setting
of FLUSH_ROOT_PGTBL in flush_flags_local because setting
->root_pgt_changed is benign when !XPTI?

> +                             (page->u.inuse.type_info & PGT_count_mask) >
>                               (1 + !!(page->u.inuse.type_info & PGT_pinned) +
>                                mfn_eq(pagetable_get_mfn(curr->arch.guest_table_user),
>                                       mfn) + local_in_use) )
> -                            sync_guest = true;
> +                            flush_flags_all |= FLUSH_ROOT_PGTBL;

This needs to also specify FLUSH_TLB_GLOBAL, or else original
XPTI behavior gets broken. Since the local CPU doesn't need this,
the variable may then better be named flush_flags_remote?

Or if I'm wrong here, the reasoning behind the dropping of the
global flush in this case needs putting in the description, not
the least because it would mean the change introducing it went
too far.

> @@ -4173,18 +4180,36 @@ long do_mmu_update(
>      if ( va )
>          unmap_domain_page(va);
>  
> -    if ( sync_guest )
> +    /*
> +     * Flushing needs to occur for one of several reasons.
> +     *
> +     * 1) An update to an L2 or higher occured.  This potentially changes the
> +     *    pagetable structure, requiring a flush of the linear range.
> +     * 2) An update to an L4 occured, and XPTI is enabled.  All CPUs running
> +     *    on a copy of this L4 need refreshing.
> +     */
> +    if ( flush_flags_all || flush_flags_local )

Minor remark: At least in x86 code it is more efficient to use
| instead of || in such cases, to avoid relying on the compiler
to carry out this small optimization. It may well be that all
compilers we care about do so, but it's certainly not the case
for all the compilers I've ever worked with.

>      {
> +        cpumask_t *mask = pt_owner->dirty_cpumask;
> +
>          /*
> -         * Force other vCPU-s of the affected guest to pick up L4 entry
> -         * changes (if any).
> +         * Local flushing may be asymmetric with remote.  If there is local
> +         * flushing to do, perform it separately and omit the current CPU from
> +         * pt_owner->dirty_cpumask.
>           */
> -        unsigned int cpu = smp_processor_id();
> -        cpumask_t *mask = per_cpu(scratch_cpumask, cpu);
> +        if ( flush_flags_local )
> +        {
> +            unsigned int cpu = smp_processor_id();
> +
> +            mask = per_cpu(scratch_cpumask, cpu);
> +            cpumask_copy(mask, pt_owner->dirty_cpumask);
> +            __cpumask_clear_cpu(cpu, mask);
> +
> +            flush_local(flush_flags_local);
> +        }
>  
> -        cpumask_andnot(mask, pt_owner->dirty_cpumask, cpumask_of(cpu));

I understand you're of the opinion that cpumask_copy() +
__cpumask_clear_cpu() is more efficient than cpumask_andnot()?
(I guess I agree for high enough CPU counts.)

Jan

