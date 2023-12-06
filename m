Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A5B806582
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 04:16:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648805.1012796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiOF-0005ET-NY; Wed, 06 Dec 2023 03:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648805.1012796; Wed, 06 Dec 2023 03:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiOF-0005CF-KA; Wed, 06 Dec 2023 03:15:59 +0000
Received: by outflank-mailman (input) for mailman id 648805;
 Wed, 06 Dec 2023 03:15:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMAt=HR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAiOE-0005Ap-0A
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 03:15:58 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5017d11-93e5-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 04:15:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5B314B81D8A;
 Wed,  6 Dec 2023 03:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDB6C433C7;
 Wed,  6 Dec 2023 03:15:53 +0000 (UTC)
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
X-Inumbo-ID: c5017d11-93e5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701832554;
	bh=uvWU04pRqiplwKbwHTnhwZ2FK1FCR67Y/FppL/AJPAc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IPyZHYQ3hkds4zVvhCzU7pNVUBorBIp2Y9ZQGg2FjkA8iG4/QjcMCH1tV2LWYtYpb
	 GrPBJUhxFgisPv9ae/iuZ+/IDXx5OI5cDGfFRPcZTrLUyS3bCzsNpgSGKf7DxMBp4p
	 PeEvwnN6eLPx1TNw8SY5f7Ju39YP2gcXvypvq+yx5y+lbrlr8SZdUhub38n3vnynuj
	 +f6GpAPCNL9zIIUf9T0EAkm0VWYHknMnDF0lMx6CcCsBNLDwfupN8xd75tAbkBWT8w
	 SSd4beGmBU0aXJI89NDYVDTanrCiCElbPE0xK90w6P5roEXjC+QiDT0i1sxVXubwPm
	 NQ62NoFLLBLkQ==
Date: Tue, 5 Dec 2023 19:15:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 3/6] AMD/IOMMU: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <c529cb0d8eba253436c5bba22f8bceddeaaf5831.1701764980.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312051913190.110490@ubuntu-linux-20-04-desktop>
References: <cover.1701764980.git.federico.serafini@bugseng.com> <c529cb0d8eba253436c5bba22f8bceddeaaf5831.1701764980.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Dec 2023, Federico Serafini wrote:
> Add missing parameter names to address violations of MISRA C:2012
> Rule 8.2. Furthermore, remove trailing spaces and use C standard types to
> comply with XEN coding style.
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/drivers/passthrough/amd/iommu.h      | 17 ++++++++++-------
>  xen/drivers/passthrough/amd/iommu_init.c | 24 ++++++++++++++----------
>  2 files changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
> index d4416ebc43..1b62c083ba 100644
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -138,10 +138,12 @@ struct ivrs_mappings {
>  extern unsigned int ivrs_bdf_entries;
>  extern u8 ivhd_type;
>  
> -struct ivrs_mappings *get_ivrs_mappings(u16 seg);
> -int iterate_ivrs_mappings(int (*)(u16 seg, struct ivrs_mappings *));
> -int iterate_ivrs_entries(int (*)(const struct amd_iommu *,
> -                                 struct ivrs_mappings *, uint16_t));
> +struct ivrs_mappings *get_ivrs_mappings(uint16_t seg);
> +int iterate_ivrs_mappings(int (*handler)(uint16_t seg,
> +                                         struct ivrs_mappings *map));
> +int iterate_ivrs_entries(int (*handler)(const struct amd_iommu *iommu,
> +                                        struct ivrs_mappings *map,
> +                                        uint16_t bdf));
>  
>  /* iommu tables in guest space */
>  struct mmio_reg {
> @@ -226,7 +228,7 @@ struct acpi_ivrs_hardware;
>  /* amd-iommu-detect functions */
>  int amd_iommu_get_ivrs_dev_entries(void);
>  int amd_iommu_get_supported_ivhd_type(void);
> -int amd_iommu_detect_one_acpi(const struct acpi_ivrs_hardware *);
> +int amd_iommu_detect_one_acpi(const struct acpi_ivrs_hardware *ivhd_block);
>  int amd_iommu_detect_acpi(void);
>  void get_iommu_features(struct amd_iommu *iommu);
>  
> @@ -295,9 +297,10 @@ struct amd_iommu *find_iommu_for_device(int seg, int bdf);
>  bool cf_check iov_supports_xt(void);
>  int amd_iommu_setup_ioapic_remapping(void);
>  void *amd_iommu_alloc_intremap_table(
> -    const struct amd_iommu *, unsigned long **, unsigned int nr);
> +    const struct amd_iommu *iommu, unsigned long **inuse_map, unsigned int nr);
>  int cf_check amd_iommu_free_intremap_table(
> -    const struct amd_iommu *, struct ivrs_mappings *, uint16_t);
> +    const struct amd_iommu *iommu, struct ivrs_mappings *ivrs_mapping,
> +    uint16_t bdf);
>  unsigned int amd_iommu_intremap_table_order(
>      const void *irt, const struct amd_iommu *iommu);
>  void cf_check amd_iommu_ioapic_update_ire(
> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> index 5515cb70fd..62f9bfdfc8 100644
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -300,12 +300,13 @@ static void cf_check set_iommu_ppr_log_control(
>  static int iommu_read_log(struct amd_iommu *iommu,
>                            struct ring_buffer *log,
>                            unsigned int entry_size,
> -                          void (*parse_func)(struct amd_iommu *, u32 *))
> +                          void (*parse_func)(struct amd_iommu *iommu,
> +                                             uint32_t *entry))
>  {
>      unsigned int tail, tail_offest, head_offset;
>  
>      BUG_ON(!iommu || ((log != &iommu->event_log) && (log != &iommu->ppr_log)));
> -    
> +
>      spin_lock(&log->lock);
>  
>      /* make sure there's an entry in the log */
> @@ -361,14 +362,15 @@ static int iommu_read_log(struct amd_iommu *iommu,
>  
>   out:
>      spin_unlock(&log->lock);
> -   
> +
>      return 0;
>  }
>  
>  /* reset event log or ppr log when overflow */
>  static void iommu_reset_log(struct amd_iommu *iommu,
>                              struct ring_buffer *log,
> -                            void (*ctrl_func)(struct amd_iommu *iommu, bool))
> +                            void (*ctrl_func)(struct amd_iommu *iommu,
> +                                              bool iommu_control))

instead of iommu_control it should be iommu_enable ?


>  {
>      unsigned int entry, run_bit, loop_count = 1000;
>      bool log_run;
> @@ -1158,14 +1160,15 @@ static void __init amd_iommu_init_cleanup(void)
>      iommuv2_enabled = 0;
>  }
>  
> -struct ivrs_mappings *get_ivrs_mappings(u16 seg)
> +struct ivrs_mappings *get_ivrs_mappings(uint16_t seg)
>  {
>      return radix_tree_lookup(&ivrs_maps, seg);
>  }
>  
> -int iterate_ivrs_mappings(int (*handler)(u16 seg, struct ivrs_mappings *))
> +int iterate_ivrs_mappings(int (*handler)(uint16_t seg,
> +                                         struct ivrs_mappings *map))

Instead of map it should be ivrs_mappings ? Actually it reads better as
map and I know it is not a MISRA requirement to have function pointer
args match. I'll leave this one to Jan.




>  {
> -    u16 seg = 0;
> +    uint16_t seg = 0;
>      int rc = 0;
>  
>      do {
> @@ -1180,10 +1183,11 @@ int iterate_ivrs_mappings(int (*handler)(u16 seg, struct ivrs_mappings *))
>      return rc;
>  }
>  
> -int iterate_ivrs_entries(int (*handler)(const struct amd_iommu *,
> -                                        struct ivrs_mappings *, uint16_t bdf))
> +int iterate_ivrs_entries(int (*handler)(const struct amd_iommu *iommu,
> +                                        struct ivrs_mappings *map,

same here ivrs_mappings instead of map, but actually map reads better

I checked everything else and looks OK

