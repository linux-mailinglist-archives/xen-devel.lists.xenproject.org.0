Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDED28CCFB2
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 11:54:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728303.1133176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA57y-00075S-ML; Thu, 23 May 2024 09:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728303.1133176; Thu, 23 May 2024 09:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA57y-00072m-JE; Thu, 23 May 2024 09:52:50 +0000
Received: by outflank-mailman (input) for mailman id 728303;
 Thu, 23 May 2024 09:52:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqPc=M2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sA57y-00072g-3H
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 09:52:50 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36255a95-18ea-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 11:52:48 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-792b8d98a56so474487685a.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 02:52:48 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf27fa4asm1471326385a.43.2024.05.23.02.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 02:52:47 -0700 (PDT)
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
X-Inumbo-ID: 36255a95-18ea-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716457967; x=1717062767; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tyTeWN/+8z/4F9vK2R+GVpI8XwMfkIXVPIglqrEEYuw=;
        b=i/m3T01BvmJYLOng/xtzzVdiuHT7+zbX7RxRRILHc4WoCkDVivbDhgIwC+2ouuL2+2
         cKBmTXSfUarVn0YqqQNuKrNCZFJQGLkdIpOwJh2hyo6VFhq2TweXSm7UYNEQZXMTV8Y4
         blWq4Y9fnCx83ftORwuInng48iz0JI0HIrU94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716457967; x=1717062767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyTeWN/+8z/4F9vK2R+GVpI8XwMfkIXVPIglqrEEYuw=;
        b=ghvpZULmmYsB9EPALjTkyJsgH9OfOjplTcgI1DTfSup+7r27NL9Jj2dZiftfcI/IUx
         +JspbrA3iGy9HvnjY+/N2KkowJl9Eewu2mb4gAqipodb+foJivh0zydaDUH478TadIoS
         DyElus/iHA5/+8fx2IS9/pnaMOgXv5YurtqXJwhqoL/AVaucsFRZAathaNLYvEwtp9MF
         F+WEXISCEMfa00wec5d7NLxL+NKsFYeCDmdzq2NwvjwG++PdoRf5KQpltvDuG6qNTxAs
         1JpunMPMwD2vhqm610+zyqPYJqi13NhavJuquZnNRzKDdZNYVHr+SReIWtnC0Yl5awD3
         dSbw==
X-Gm-Message-State: AOJu0YxxXKvrxqFnE8UMtjwJNE24iRFbCScFLg5CucpTPDA1vsnQjT4t
	JFVHcdTrolhETLE3iU743Udn6OtEBmQggyLtfVK44P007ehDU5p7cjnp0ZTccdWb7HpkJceZKkx
	w
X-Google-Smtp-Source: AGHT+IENn22mYam9JRDfdyj3gtDSvwEUDhOJpucb9n0pWEveQPtT/JUC5Xa2AoBqOuSNQM+Tpz39KQ==
X-Received: by 2002:a05:620a:2888:b0:792:949d:bb0 with SMTP id af79cd13be357-794994b29b4mr683161685a.47.1716457967424;
        Thu, 23 May 2024 02:52:47 -0700 (PDT)
Date: Thu, 23 May 2024 11:52:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] x86/iommu: Conditionally compile platform-specific
 union entries
Message-ID: <Zk8R7YAhD9UHtVW6@macbook>
References: <2744240f42dadcb1edc69d0f921d5909fe0f63a2.1716455673.git.teddy.astie@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2744240f42dadcb1edc69d0f921d5909fe0f63a2.1716455673.git.teddy.astie@vates.tech>

On Thu, May 23, 2024 at 09:19:53AM +0000, Teddy Astie wrote:
> If some platform driver isn't compiled in, remove its related union
> entries as they are not used.
> 
> Signed-off-by Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/arch/x86/include/asm/iommu.h | 4 ++++
>  xen/arch/x86/include/asm/pci.h   | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
> index 8dc464fbd3..99180940c4 100644
> --- a/xen/arch/x86/include/asm/iommu.h
> +++ b/xen/arch/x86/include/asm/iommu.h
> @@ -42,17 +42,21 @@ struct arch_iommu
>      struct list_head identity_maps;
>  
>      union {
> +        #ifdef CONFIG_INTEL_IOMMU
>          /* Intel VT-d */
>          struct {
>              uint64_t pgd_maddr; /* io page directory machine address */
>              unsigned int agaw; /* adjusted guest address width, 0 is level 2 30-bit */
>              unsigned long *iommu_bitmap; /* bitmap of iommu(s) that the domain uses */
>          } vtd;
> +        #endif
> +        #ifdef CONFIG_AMD_IOMMU
>          /* AMD IOMMU */
>          struct {
>              unsigned int paging_mode;
>              struct page_info *root_table;
>          } amd;
> +        #endif
>      };
>  };
>  
> diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
> index fd5480d67d..842710f0dc 100644
> --- a/xen/arch/x86/include/asm/pci.h
> +++ b/xen/arch/x86/include/asm/pci.h
> @@ -22,12 +22,16 @@ struct arch_pci_dev {
>       */
>      union {
>          /* Subset of struct arch_iommu's fields, to be used in dom_io. */
> +        #ifdef CONFIG_INTEL_IOMMU
>          struct {
>              uint64_t pgd_maddr;
>          } vtd;
> +        #endif
> +        #ifdef CONFIG_AMD_IOMMU
>          struct {
>              struct page_info *root_table;
>          } amd;
> +        #endif
>      };

The #ifdef and #endif processor directives shouldn't be indented.

Would you mind adding /* CONFIG_{AMD,INTEL}_IOMMU */ comments in the
#endif directives?

I wonder if we could move the definitions of those structures to the
vendor specific headers, but that's more convoluted, and would require
including the iommu headers in pci.h

Thanks, Roger.

