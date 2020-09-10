Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC4526481D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:40:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNkU-00061X-OR; Thu, 10 Sep 2020 14:40:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EwZ=CT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kGNkT-00061O-I3
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:40:29 +0000
X-Inumbo-ID: b041b3b7-e057-4e7d-bf3b-74f1a21e12f1
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b041b3b7-e057-4e7d-bf3b-74f1a21e12f1;
 Thu, 10 Sep 2020 14:40:28 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id y15so301654wmi.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=3MvUpOlziyTnS5n6nDNDQDHR8Pa/bdXj2Grvv2f00Qw=;
 b=BnQEBUxxKdYaSjfgoTO8dvI1aS8VzdPdnj+eOMEr5oa4gL5bHSQl8u0L+PkhQdHWVb
 X8aXZTQ4scXJPbCLWn28tvBvnyZGNfNQ9xmCJgUR9mxdiUwmTsNm/Non5poNIeYP4Tap
 5mFWrOYDTBmc630WZ16Xjp9n2cLA+3tBt77gzZMF5lKAsCBndjTidwHTChXUrIrYCe8Q
 1Mcbvs0KIT4mEdbjd1u3B+6I3HEUF/8MIBHkvol8zreZKX7B6PpnnHGq9ls5yuljeUwN
 fVFQq2bP2G6qO16ULnYWMRREFD0LQz1+AB3b01uX4+16pkslnhgqeZsNaQYsQKI+A04B
 ymLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=3MvUpOlziyTnS5n6nDNDQDHR8Pa/bdXj2Grvv2f00Qw=;
 b=pYlLDr6WmDhx4oCyqjaa+P80ivOgcDEwNmyN6ECbROODTXK2yaWP4fspeOlwFyzcCb
 Tg5ZGEpEVc4iCLoZdkcBBYKql2wKK+vb627MQj8nbjINXrJEhouiV763rdFrh85nsBqH
 Q4GQid1W8tQrcilOC+svubdS94RSTX9kFruEp/RxRVDOgcSSoFQnnY4J+5MMfsdM6GO7
 EIRyptvoaD+xHfBJawuuPXesMowdcKXC8048zxR917OgSDY/2IytQHj5Na02m6Dz0wmk
 WdfRVZ6Gj07iqRVhu7/jzFNPk845unQXNbLyIAItI2fFSpxEIH/d9pUwPdSSfyUbi67R
 wXgg==
X-Gm-Message-State: AOAM530NQaeBj7XmBM2560Zyw4tpd7EhoX7WBR+AABApAsy+up9l97Fz
 Kmx5uZ9DxkLRhoHllY2nrjw=
X-Google-Smtp-Source: ABdhPJz2jaAfBcr0YQtfHwgFbgULIj11ZP++Vkg2KPxOOSYsfOZYliuPDyrQE1geLjTP/zGbZqyETA==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr343225wmj.150.1599748827751; 
 Thu, 10 Sep 2020 07:40:27 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id b8sm3950250wmh.48.2020.09.10.07.40.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 07:40:27 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>, "'Paul Durrant'" <pdurrant@amazon.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>
References: <20200907074023.1392-1-paul@xen.org>
 <20200907074023.1392-9-paul@xen.org>
 <611962bf-4cd9-7da8-ea47-e95e5181515b@suse.com>
In-Reply-To: <611962bf-4cd9-7da8-ea47-e95e5181515b@suse.com>
Subject: RE: [PATCH v5 8/8] iommu: stop calling IOMMU page tables 'p2m tables'
Date: Thu, 10 Sep 2020 15:40:26 +0100
Message-ID: <003501d68780$5305eff0$f911cfd0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHhwG7ATr0KfpJW6ur2MqQg9p50hwHCwLyXAa9gtJGpL+2VMA==
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 10 September 2020 15:27
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Kevin Tian <kevin.tian@intel.com>
> Subject: Re: [PATCH v5 8/8] iommu: stop calling IOMMU page tables 'p2m tables'
> 
> On 07.09.2020 09:40, Paul Durrant wrote:
> > --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> > +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> > @@ -491,8 +491,8 @@ static int amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
> >
> >  #include <asm/io_apic.h>
> >
> > -static void amd_dump_p2m_table_level(struct page_info* pg, int level,
> > -                                     paddr_t gpa, int indent)
> > +static void amd_dump_page_table_level(struct page_info* pg, int level,
> 
> Could you flip * and space here as you touch the line anyway?
> 

Sure.

> > @@ -504,7 +504,7 @@ static void amd_dump_p2m_table_level(struct page_info* pg, int level,
> >      table_vaddr = __map_domain_page(pg);
> >      if ( table_vaddr == NULL )
> >      {
> > -        printk("Failed to map IOMMU domain page %"PRIpaddr"\n",
> > +        printk("%s: failed to map domain page %"PRIpaddr"\n", __func__,
> >                  page_to_maddr(pg));
> 
> Why the addition of __func__? Personally I'd rather see most of its
> uses go away ... (There are two more further down.) Preferably with
> this dropped again

Ok.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 

Thanks.

  Paul

> Jan


