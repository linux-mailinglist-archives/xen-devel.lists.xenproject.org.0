Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109B2B1198A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 10:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057481.1425388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDTV-0000Nd-Cw; Fri, 25 Jul 2025 08:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057481.1425388; Fri, 25 Jul 2025 08:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDTV-0000M5-8x; Fri, 25 Jul 2025 08:08:17 +0000
Received: by outflank-mailman (input) for mailman id 1057481;
 Fri, 25 Jul 2025 08:08:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfLl=2G=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ufDTT-0008Kx-3A
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 08:08:15 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82c956ba-692e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 10:08:13 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so10272155e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 01:08:13 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4587272b405sm24512515e9.19.2025.07.25.01.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 01:08:12 -0700 (PDT)
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
X-Inumbo-ID: 82c956ba-692e-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753430893; x=1754035693; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5FYuPMgEcNXrIfzNzacjkyZv/AQIF5n9VoaEQ2FXLDA=;
        b=SOxXadV9DYD70X/Mva/VLPjhxHmbMOVIn1l72fU468Wz9mOP1fpMLy0moRkFCx9hPV
         yjf//P/krk8Gi8/UF51WGjfnxCEb6a9wDaNF+ksvKQ7LzdQN/F1YdcNV5jAwq1Kusfpp
         zxnoeSfSe6jBp9v9004HHHIfUIAW7Kz6TO/uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753430893; x=1754035693;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5FYuPMgEcNXrIfzNzacjkyZv/AQIF5n9VoaEQ2FXLDA=;
        b=r+6NIRZBI1yFjUJocv+vmt5n/DJYb4PvS29AkbxWhJv8Ch1YgnIaflNNx9CYRggmV4
         rBXYYvD8O7j+Fx02rorWJI+gfOuR845/Ckr0R1NLs9uBJb/Lw786PNv73pUOlgrMb8nf
         yZzNN2DzYPkqgS9tbzsdZcNLuZMKLZ3CIw4K5ngfTeip9rFXqfPytL+kMb0Nn8tu8DGu
         kxspgZOfYv5+w8dVTqBjdsnlebPmH13uqu9PoSru0BTf+0xdOht4Ewue/hUrEVfdH6AS
         fhYf5Pppg6bUQdWAAPIQIC80FBZ1nbjIgM0ItrDmMf6UbrUkqlbeGijesjE7grkNXWhh
         XZ4w==
X-Gm-Message-State: AOJu0Yxc0yUHa/qoiQuO4j8jnHVpwDh0l7FNSxOs699xC3UhgeJVSwUO
	/zI1iLCQiS4+It3+CNUErm9CsLj2AasNPysBtIvKJ+xBi8iZDwaZnBBsJiAU2s0tA8c=
X-Gm-Gg: ASbGncusB4ZsP97TR2N5hB9tnz5Y3xbIUyxVNtlNI1OcIr3LP5ciWoLW0kUPnFWPjZt
	SKeK5EriCmz5Ez4mookt6xlEJT5tW6DljXMQFP5h7LeLs0r2AVSOOM94Q8G+KXjVvTBUE9vQ4U3
	/NojnKhKz3wWqlgPPygX680UhYdVxo0vMWvCHfAdK0S2JJCpmO2Nt/X5n24GQtM14cFQ03MtmsT
	P+Lf778+/GS2P3cmYg63VGyqwgTbKWCPpXXwFPqPnNgseHxIOfjRqiNOJIAgSlqWzTVKRbgSJgc
	KrlKZvpJ2AZRl6OTaaA6/Ta5q70EJCVmV7o9tIe6ZL+ECsDKA+gUFTccBwIavXNOKMLOyuIAvt0
	MgQL1WkJVNYgcYVno9THRZHBKnzuzLfeDouy7UYwzVWhSiDbuPFcCF8dUJ0knJIqkYw==
X-Google-Smtp-Source: AGHT+IHhLhjxT4BpG+qFb8jkfoMc2FQItbYgHt+iYgGROiaydX8af+dE7jzl6FPJinxBJ1jqhHb/DA==
X-Received: by 2002:a05:6000:1785:b0:3a5:39bb:3d61 with SMTP id ffacd0b85a97d-3b77675fd22mr864047f8f.27.1753430892636;
        Fri, 25 Jul 2025 01:08:12 -0700 (PDT)
Date: Fri, 25 Jul 2025 10:08:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v8 2/8] vpci: Refactor REGISTER_VPCI_INIT
Message-ID: <aIM7a8fa0XT-nuUI@macbook.local>
References: <20250724055006.29843-1-Jiqian.Chen@amd.com>
 <20250724055006.29843-3-Jiqian.Chen@amd.com>
 <aIJC8qqJM_P-hEAb@macbook.local>
 <BL1PR12MB58494358468BFF892A892879E759A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58494358468BFF892A892879E759A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Fri, Jul 25, 2025 at 03:15:13AM +0000, Chen, Jiqian wrote:
> On 2025/7/24 22:28, Roger Pau Monné wrote:
> > On Thu, Jul 24, 2025 at 01:50:00PM +0800, Jiqian Chen wrote:
> >> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> >> index 74211301ba10..eb3e7dcd1068 100644
> >> --- a/xen/drivers/vpci/msix.c
> >> +++ b/xen/drivers/vpci/msix.c
> >> @@ -703,9 +703,18 @@ static int cf_check init_msix(struct pci_dev *pdev)
> >>      pdev->vpci->msix = msix;
> >>      list_add(&msix->next, &d->arch.hvm.msix_tables);
> >>  
> >> -    return 0;
> >> +    /*
> >> +     * vPCI header initialization will have mapped the whole BAR into the
> >> +     * p2m, as MSI-X capability was not yet initialized.  Crave a hole for
> >> +     * the MSI-X table here, so that Xen can trap accesses.
> >> +     */
> >> +    spin_lock(&pdev->vpci->lock);
> >> +    rc = vpci_make_msix_hole(pdev);
> >> +    spin_unlock(&pdev->vpci->lock);
> > 
> > I should have asked in the last version, but why do you take the vPCI
> > lock here?
> > 
> > The path that ASSERTs the lock is held should never be taken when
> > called from init_msix().  Is there some path I'm missing in
> > vpci_make_msix_hole() that requires the vCPI lock to be held?
> > 
> > The rest LGTM.
> Sorry to forget to delete this.
> Feel free to change when submit.
> Or I will change by sending a new version.

Can you ensure it also works without the locking?  I think so, but I
haven't tested myself.

Thanks, Roger.

