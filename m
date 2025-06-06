Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFF4ACFF11
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 11:18:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008279.1387543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTDr-0008SQ-P2; Fri, 06 Jun 2025 09:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008279.1387543; Fri, 06 Jun 2025 09:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTDr-0008QQ-L6; Fri, 06 Jun 2025 09:18:47 +0000
Received: by outflank-mailman (input) for mailman id 1008279;
 Fri, 06 Jun 2025 09:18:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNTDp-0008QI-Em
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 09:18:45 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e901612-42b7-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 11:18:44 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so24510635e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 02:18:44 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45213709729sm17336525e9.19.2025.06.06.02.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 02:18:43 -0700 (PDT)
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
X-Inumbo-ID: 3e901612-42b7-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749201524; x=1749806324; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3IdQjJF9gZnyZYYf1r4pKU7xWWviktuD/x3iuFyCOdw=;
        b=XX+SkDpmprctbr81n9+0lOfYvPYL+Tdh3NSHTVPBeB+3Inya1DQgbumI30sl2ED5Na
         WBYgq/MSmu/rFnJj9ovzaFqFuulHNVo3DJ6+v+pGPdvcHYtRSHcokB3bzaUps7+G6fGo
         ouofhhylmTdqPyX3p1avzgYuJlvvCCWO5bcm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749201524; x=1749806324;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3IdQjJF9gZnyZYYf1r4pKU7xWWviktuD/x3iuFyCOdw=;
        b=PLY4W6hLShx+RW3ptNCO0eTFVi9wah1QglNuX1p/ZPPlW64LljnrxqZzyzimRPZuO3
         h7aRdzUHSYgda6qEfee5r/TP0BJigV8T2CT0v9kvhARIpef793Oaq9PLTUSW3EZhEi7G
         dr58gOp8PnPxIp5PgxSFhM7DX7hV9KqDa/hkB9VtvASQeBBJQ+swQXVZbXXcEvBghwSA
         5acMolsPWq+3zYBbSXXGzGGTEJCkm2X9WShF3pexAfRg59i8GTzUIs0iKnQGCZg/v/eB
         KaaLW/2wHlit3qp3HpnV6Y9exIxj2fdJf0m1gCAqXF3HC79MqAnu5mF1N3QQbR0qtteq
         cB7A==
X-Gm-Message-State: AOJu0Yzk+zyw4Tr9wRohz9bz+l9gnRFpk0vJptDlTiXdxe2MvM8pk9zv
	DBL4OKaMPJWO/ARcqKAT3eP6mMjWfYBCw72+zXWj4ipG67hcfWAQ48jjdGh4+wpC9iw=
X-Gm-Gg: ASbGncuBxb5+bFfuNXCowoeZLj1CdgNo71i5wjivfCMyA6Wj12bjwW6pVUkkg9QnUWV
	vuFiVmqp6exCkycRiZVmVhOVfSsY4+iPB4cp6mHGtrplbGyh29wC3Qnv629QuXaKffe95E4XAgO
	7DjB4mvLqTpNNqNlhg/aOOVV9TyFcqvWRy3vbSy+n8CfyViDLtQ3lUgiHZ/SgIsO+DE/5sTZB5b
	fQcZrE6HhO+aL76g5Hgv1OIUA05N9QWxlz/IuFJL+rn1w4FiAMa441cmdRoJaESk954n482OvuT
	Np8owoaFA2YxFqNs++b6yTTo0Wq2vTbph+1fEwvLfGclzu+JkxLldr2XCqeHiHlP3q1vzJaRcME
	27QFS5JSiiSe0hkyrO6Y=
X-Google-Smtp-Source: AGHT+IGJnJW33vQrfOLwL4KX9GbDUx9QKMz1GNvQtmGPgxfc+PEz7TniH5IOht6bN5736iKHv8YxLQ==
X-Received: by 2002:a05:600c:6085:b0:442:f485:6fa4 with SMTP id 5b1f17b1804b1-452014ea837mr26105615e9.31.1749201523973;
        Fri, 06 Jun 2025 02:18:43 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:18:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 06/10] vpci: Hide extended capability when it fails to
 initialize
Message-ID: <aEKyci_ZhlOtcw89@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-7-Jiqian.Chen@amd.com>
 <aEGt5SJ32hovLinu@macbook.local>
 <BL1PR12MB584912A5245E0E142200FFEAE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB584912A5245E0E142200FFEAE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Fri, Jun 06, 2025 at 08:30:42AM +0000, Chen, Jiqian wrote:
> On 2025/6/5 22:47, Roger Pau Monné wrote:
> > On Mon, May 26, 2025 at 05:45:55PM +0800, Jiqian Chen wrote:
> >> @@ -209,11 +301,11 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
> >>                     pdev->domain, &pdev->sbdf,
> >>                     is_ext ? "extended" : "legacy", cap);
> >>              if ( !is_ext )
> >> -            {
> >>                  rc = vpci_capability_hide(pdev, cap);
> >> -                if ( rc )
> >> -                    return rc;
> >> -            }
> >> +            else
> >> +                rc = vpci_ext_capability_hide(pdev, cap);
> >> +            if ( rc )
> >> +                return rc;
> > 
> > Could the code in the previous patch be:
> > 
> > if ( !is_ext )
> >     rc = vpci_capability_hide(pdev, cap);
> > 
> > if ( rc )
> >     return rc;
> > 
> > So that your introduction here is simpler?
> OK, but the logic of the previous patch will become a little strange.
> Anyway, the strange will disappear after applying this patch.

No strong opinion really, was mostly a recommendation to avoid extra
changes here.  In a series it's best if you try to arrange the code so
that it's only modified once (if possible, obviously).

Thanks, Roger.

