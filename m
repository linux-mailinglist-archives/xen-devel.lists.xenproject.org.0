Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7D994381C
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 23:38:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769125.1180017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZH1E-0005KF-QA; Wed, 31 Jul 2024 21:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769125.1180017; Wed, 31 Jul 2024 21:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZH1E-0005HV-NB; Wed, 31 Jul 2024 21:38:00 +0000
Received: by outflank-mailman (input) for mailman id 769125;
 Wed, 31 Jul 2024 21:37:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8eAs=O7=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sZH1D-0005H6-2T
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 21:37:59 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24e76c74-4f85-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 23:37:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id E80C2A02F7;
 Wed, 31 Jul 2024 23:37:53 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rg-Yh-7p8FpE; Wed, 31 Jul 2024 23:37:53 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id CC3F4A02F3;
 Wed, 31 Jul 2024 23:37:53 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sZH17-0000000BKFG-1iMz; Wed, 31 Jul 2024 23:37:53 +0200
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
X-Inumbo-ID: 24e76c74-4f85-11ef-8776-851b0ebba9a2
Date: Wed, 31 Jul 2024 23:37:53 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 3/3] mini-os: mm: convert set_readonly() to use walk_pt()
Message-ID: <20240731213753.hduimhyf56bf7yr4@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20240731130026.8467-1-jgross@suse.com>
 <20240731130026.8467-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731130026.8467-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mer. 31 juil. 2024 15:00:26 +0200, a ecrit:
> +static int set_readonly_func(unsigned long va, unsigned int lvl, bool is_leaf,
> +                             pgentry_t *pte, void *par)
> +{
> +    struct set_readonly_par *ro = par;
>  
> +    mmu_updates[ro->count].ptr = virt_to_mach(pte);
> +    mmu_updates[ro->count].val = *pte & ~_PAGE_RW;
> +    ro->count++;
> +
> +    if ( (ro->count == L1_PAGETABLE_ENTRIES ||
> +          va + 2 * PAGE_SIZE > ro->etext) &&
> +         HYPERVISOR_mmu_update(mmu_updates, ro->count, NULL, DOMID_SELF) < 0 )
> +    {
> +        printk("ERROR: set_readonly(): PTE could not be updated\n");
> +        do_exit();
> +    }

Don't we also want to set ro->count to 0?
And assert that it is 0 after calling walk_pt in set_readonly, to make
sure the va + 2 * PAGE_SIZE > ro->etext test did work properly
(personally I would have rather made set_readonly call a last
HYPERVISOR_mmu_update in case ro->count is not 0, which looks more
robust that a quite magic-looking va + 2 * PAGE_SIZE > ro->etext test)

Samuel

