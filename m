Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A7D881039
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 11:47:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695853.1086061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmtTB-0004e7-PV; Wed, 20 Mar 2024 10:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695853.1086061; Wed, 20 Mar 2024 10:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmtTB-0004bo-Mv; Wed, 20 Mar 2024 10:46:53 +0000
Received: by outflank-mailman (input) for mailman id 695853;
 Wed, 20 Mar 2024 10:46:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmtTA-0004bi-3c
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 10:46:52 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27ee46fd-e6a7-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 11:46:50 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-513e14b2bd9so5009551e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 03:46:50 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c4e8e00b0041413aefeb9sm1818726wmq.48.2024.03.20.03.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 03:46:49 -0700 (PDT)
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
X-Inumbo-ID: 27ee46fd-e6a7-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710931609; x=1711536409; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ceKuNjrEoY/wR6eGMrhm+IiYJyeYJXgPktVg6elNVZA=;
        b=jUZVrmdQVyCdpWibnno81/EXy8+/Qaq69KagzC7GlqP/N+rxGhoYV9gcAU4864jJBc
         iA222EmMeLCaJnkE/G6zqDddwOKtJhi/y4ez7iB1iVwvOXJ0wQg9dWmeeHdWCmXiZatu
         TfjeIgakO1+eM/69LPbmwDGRz+WpOQhgDenMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710931609; x=1711536409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceKuNjrEoY/wR6eGMrhm+IiYJyeYJXgPktVg6elNVZA=;
        b=Q+Dj5RCPP+u0BWQ+AQld+Nk044584pwGqlvhd1gS7qJlwDOXK+Gj8dYuqX0AMBXEhU
         OprQ8f1++v2i90SpUimB+y8qXXpUDYIcDuX4MJms86IitsotVq409dDlmPG3VKnvsg/I
         VoGOXwFAkzUtFgqf3oID9hIj5/hSBW9keMX9K0zpqAgq+NErmbKPVoIhRZx7YZiGlFQS
         K+mHpjo3GHhieFETePBnvEcdRMTHxcTLanzecm6qQZPmlxz5/J+M+Y2zSlIJmz/lK6qE
         mNtoUlfcAFoCR8OwPc94OEsLNrCxbolLktHjz7wLPYV2DMETbt5YOBeQiP4XA3vvO9mk
         EGuA==
X-Gm-Message-State: AOJu0Yx5/b1v8W8tgyb7d+SRW2lOGb/72LQxp3mwKwILEmkfqRxt6a9X
	hp+kvPro1o+R0fHd3ejvz0GynnPd+Riavj+mTF0eCVfySy26UH8YLtlGjUB6EOg=
X-Google-Smtp-Source: AGHT+IFTCgGouzsvJXo9SprsGY4wNcT3j41ZAKhQriZRu1QC4exLROJRspoO349YgY15R/56pXiDsw==
X-Received: by 2002:a19:ae17:0:b0:513:21a9:79a8 with SMTP id f23-20020a19ae17000000b0051321a979a8mr13050723lfc.62.1710931609413;
        Wed, 20 Mar 2024 03:46:49 -0700 (PDT)
Date: Wed, 20 Mar 2024 11:46:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] AMD/IOMMU: drop remaining guest-IOMMU bits too
Message-ID: <Zfq-mNNfG6I7diJw@macbook>
References: <5eb98372-2992-4a93-846c-4e325c41af98@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5eb98372-2992-4a93-846c-4e325c41af98@suse.com>

On Tue, Mar 19, 2024 at 02:28:12PM +0100, Jan Beulich wrote:
> With a02174c6c885 ("amd/iommu: clean up unused guest iommu related
> functions") having removed the sole place where d->g_iommu would be set
> to non-NULL, guest_iommu_add_ppr_log() will unconditionally bail the
> latest from its 2nd if(). With it dropped, all other stuff in the file
> is unused, too. Delete iommu_guest.c altogether.
> 
> Further delete struct guest{_buffer,_dev_table,_iommu{,_msi}} as well as
> struct mmio_reg for being unused with the unused g_iommu also dropped
> from struct arch_iommu.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wasn't sure how far to further go with removing the body of
> parse_ppr_log_entry(), or perhaps even the entire function, and then
> further up to all PPR logging code. Hence why for now I've merely
> commented out the function call into the file being deleted (which of
> course Misra isn't going to like). Thoughts / suggestions?
> 
> I further wonder whether set_iommu_guest_translation_control() should
> have been invoked independent of guest-IOMMU actually being enabled. IOW
> that may want purging, too. Along these lines iommuv2_enabled may also
> want dropping, for not having any consumer left. Much like has_viommu()
> and then also {XEN_,}X86_EMU_IOMMU, i.e. going as far as affecting the
> public interface.
> 
> --- a/xen/arch/x86/include/asm/iommu.h
> +++ b/xen/arch/x86/include/asm/iommu.h
> @@ -52,7 +52,6 @@ struct arch_iommu
>          struct {
>              unsigned int paging_mode;
>              struct page_info *root_table;
> -            struct guest_iommu *g_iommu;
>          } amd;
>      };
>  };
> --- a/xen/drivers/passthrough/amd/Makefile
> +++ b/xen/drivers/passthrough/amd/Makefile
> @@ -5,4 +5,3 @@ obj-y += pci_amd_iommu.o
>  obj-bin-y += iommu_acpi.init.o
>  obj-y += iommu_intr.o
>  obj-y += iommu_cmd.o
> -obj-$(CONFIG_HVM) += iommu_guest.o
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -145,57 +145,6 @@ int iterate_ivrs_entries(int (*handler)(
>                                          struct ivrs_mappings *map,
>                                          uint16_t bdf));
>  
> -/* iommu tables in guest space */
> -struct mmio_reg {
> -    uint32_t    lo;
> -    uint32_t    hi;
> -};
> -
> -struct guest_dev_table {
> -    struct mmio_reg         reg_base;
> -    uint32_t                size;
> -};
> -
> -struct guest_buffer {
> -    struct mmio_reg         reg_base;
> -    struct mmio_reg         reg_tail;
> -    struct mmio_reg         reg_head;
> -    uint32_t                size;
> -};
> -
> -struct guest_iommu_msi {
> -    uint8_t                 vector;
> -    uint8_t                 dest;
> -    uint8_t                 dest_mode;
> -    uint8_t                 delivery_mode;
> -    uint8_t                 trig_mode;
> -};
> -
> -/* virtual IOMMU structure */
> -struct guest_iommu {
> -
> -    struct domain          *domain;
> -    spinlock_t              lock;
> -    bool                    enabled;
> -
> -    struct guest_dev_table  dev_table;
> -    struct guest_buffer     cmd_buffer;
> -    struct guest_buffer     event_log;
> -    struct guest_buffer     ppr_log;
> -
> -    struct tasklet          cmd_buffer_tasklet;
> -
> -    uint64_t                mmio_base;             /* MMIO base address */
> -
> -    /* MMIO regs */
> -    union amd_iommu_control reg_ctrl;              /* MMIO offset 0018h */
> -    struct mmio_reg         reg_status;            /* MMIO offset 2020h */
> -    union amd_iommu_ext_features reg_ext_feature;  /* MMIO offset 0030h */
> -
> -    /* guest interrupt settings */
> -    struct guest_iommu_msi  msi;
> -};
> -
>  extern bool iommuv2_enabled;

I think iommuv2_enabled can also go away, since it's only used by
guest_iommu_init()?

It's set in amd_iommu_prepare() and amd_iommu_init_cleanup() but only
consumed by guest_iommu_init().

Thanks, Roger.

