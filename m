Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F64805750
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:30:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647961.1011783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWRb-0002kY-2v; Tue, 05 Dec 2023 14:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647961.1011783; Tue, 05 Dec 2023 14:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWRb-0002hz-0F; Tue, 05 Dec 2023 14:30:39 +0000
Received: by outflank-mailman (input) for mailman id 647961;
 Tue, 05 Dec 2023 14:30:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAWRZ-0000ZF-6A
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:30:37 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da729a70-937a-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 15:30:35 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c0873cf84so30768645e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 06:30:35 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c4f8a00b0040b4b2a15ebsm18736978wmq.28.2023.12.05.06.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 06:30:34 -0800 (PST)
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
X-Inumbo-ID: da729a70-937a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701786635; x=1702391435; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=As6pafrDewdwd74baYtQQACTLUGczckFKgBD8E77da0=;
        b=kb9R3bOYU4wmCMs9GF9i+PymeXTappG1jAb0mfavg0tfItuso72gSdl4biqoTeBgqR
         Ok1uiHiQKd7CMyA0FkD0K3Dw01kAwkKP88nXIN+n4+2l1GU42M8E++hBBnR/K0BAxUdm
         mlfMg98ZDMU+//VD1trswwuhsXlYByZVnQslQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701786635; x=1702391435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=As6pafrDewdwd74baYtQQACTLUGczckFKgBD8E77da0=;
        b=G+kUjDpiGSiXDr1KV2d8ORvxMw6MFUMKqdqBWGhoHMIb2OJkLVMduFTNVxMH9u9li6
         XYHR2uSosm01pMdGRKxeRNzLYIZJCjpCwWGg+awTu6GlOUrYvwX7WiW9jfJD9YniZnF+
         m79GjvQtqztRTBlFhGhRGkNd2Ooi1y0f2vC5ybevBbusuJkc4tvAto9wp+8WvdxJB3q/
         WZmZxbuIq/Y0XJyfzhxily4D6TYYNI31oMJIBUjdrjSs9E/van482H6JV1Xq4hpOhDEi
         UhpWtbMcfm5AsysnKaQ6gktjPVTOXXNcT9L9u9vRxgbKwIM5fJTUnSSVpsEPjHUC45sw
         UNmg==
X-Gm-Message-State: AOJu0YxMHkyq+wdVryy1qrCftvJJ1GBLM41SRy/3E3bxBy5tKyjmelXr
	bdccIW4LV/foPWbRbqwa6lbRUw==
X-Google-Smtp-Source: AGHT+IE+FfmlLUFlpjq5XT0UuSzGs8n67PWdYn2FROaxRpQrkQJU4mFjkJEpw1+++PexJfOoCEpMcw==
X-Received: by 2002:a05:600c:16d3:b0:40b:5e59:c55f with SMTP id l19-20020a05600c16d300b0040b5e59c55fmr592412wmn.137.1701786635114;
        Tue, 05 Dec 2023 06:30:35 -0800 (PST)
Date: Tue, 5 Dec 2023 15:30:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/6] iommu/vt-d: do not assume page table levels for
 quarantine domain
Message-ID: <ZW80CvsRqXcM1s-b@macbook>
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-2-roger.pau@citrix.com>
 <a9ca40d5-3546-46a4-ab56-3b190b1e4e93@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9ca40d5-3546-46a4-ab56-3b190b1e4e93@suse.com>

On Tue, Dec 05, 2023 at 03:24:46PM +0100, Jan Beulich wrote:
> On 04.12.2023 10:43, Roger Pau Monne wrote:
> > Like XSA-445, do not assume IOMMU page table levels on VT-d are always set
> > based on DEFAULT_DOMAIN_ADDRESS_WIDTH and instead fetch the value set by
> > intel_iommu_hwdom_init() from the domain iommu structure.  This prevents
> > changes to intel_iommu_hwdom_init() possibly getting the levels out of sync
> 
> In both cases, don't you mean intel_iommu_domain_init() instead? Only if

Indeed, sorry.

> so
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> (and happy to adjust while committing).

Thanks.

> Otherwise I must be missing something.

No, you are right.

Roger.

