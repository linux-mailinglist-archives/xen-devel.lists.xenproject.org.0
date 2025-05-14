Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC46FAB6BF9
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 15:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984306.1370462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFBie-0006ea-Ns; Wed, 14 May 2025 13:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984306.1370462; Wed, 14 May 2025 13:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFBie-0006cE-KJ; Wed, 14 May 2025 13:00:20 +0000
Received: by outflank-mailman (input) for mailman id 984306;
 Wed, 14 May 2025 13:00:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Q1L=X6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFBid-0006c8-Nf
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 13:00:19 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 621f42d1-30c3-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 15:00:17 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5fcc96b6a64so8792082a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 06:00:17 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad219374753sm934144266b.75.2025.05.14.06.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 06:00:16 -0700 (PDT)
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
X-Inumbo-ID: 621f42d1-30c3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747227617; x=1747832417; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cp44VPrCe7E0iWOoeiEtYivPM+pYB3ZZmZRGKLCzlrI=;
        b=VCVWQQGCwQ8O3LOGe1cGhmw1UqymIpSJA/c3KkfNQ5ypVJrXW9PoabZiKqG/a/Jayc
         gV1i257gl42whFjMIZLd4rMlb8qleDbEc0HWnfSjVPLjTIlE51kdkiubZJRnYXTWm1bH
         s6iFip5aDOeVVuYiPAlKT9eG/VfgdYEfuHP3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747227617; x=1747832417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cp44VPrCe7E0iWOoeiEtYivPM+pYB3ZZmZRGKLCzlrI=;
        b=XvkDkRRufIyFpDpTJBtQvUA6zSpfw5RZCXlO9Q96RPLIZRnh1gfrrMiQrhO3wobOn9
         cN+O6we7Tqf1OLhxG3xQdgRLkW9ErqDWhv1UhREUqlc4VMwb4EcPfKc7G9tFcuJhKwHi
         Ou+8LjJMBkox6Nz2w7DELp2hQEgcQxu9+zRURKZmj/cU2tUeaRFiObbMLGIFNsu51YEd
         tk+gtGHT2dL4j4EhSvUHZULWViSmKQGXylCF4Hle8v0uBnBSOJ/uTFMcSMEWNszKB4sC
         13P1P0Ye1I1DA9TrBKhft1lSxs3ugeErr5zK7V75LCMEM/XnNPFedi1AT+eWa1sZpp9f
         jwTw==
X-Gm-Message-State: AOJu0Yz2Op1BkhVBUotwyrd0WrTTMDey6r+kAN6GFjdQzwrJKeuCI/0p
	k0YEoUera2AeSgY/xZhy+gy0NrN+rrM0Chu9VCexUp7SR+29PX2Ybn6cGaMKHFU=
X-Gm-Gg: ASbGncuds0sQIrrCQdgz3nCicMsz19tocqAAY9CLln4I9FirixyY3cH4M6lYjCSZLKe
	Fki7wqXqxtHMyxNKOUieHUFUG/P9SsVku3ULaxNUn3UPi1FsNt2i7fBazLheH+WZ774Q/3ID3Zr
	zt3P1vy3b0Av8SJHNdiF98mU9vCrtSBiQdTqPCfV6o+1NoLF18eax2pNYWrF1d4CKwq34yyBUnz
	eQ39Ey7u8l9XsTljqtFIBfY9U/hj9d4HBsSZ71n9drFqVXZwmQA5ZtavdsKyarcJ0AoqTI8zl2n
	JBUbRLBX1s3iMBWpYU5v47wJtf0/1/AOCe1oxQULADKSuIN//HBJtL9KJxcHVA==
X-Google-Smtp-Source: AGHT+IGZwpSNYc6qsBP4ojzmSjul57P5titEfYFu+ylbKb3LqpSDyM9J4/bLG0wyrqZh9i9tu0xg4Q==
X-Received: by 2002:a17:907:198c:b0:ad2:2fe0:6310 with SMTP id a640c23a62f3a-ad4f75a0de0mr350862766b.57.1747227616693;
        Wed, 14 May 2025 06:00:16 -0700 (PDT)
Date: Wed, 14 May 2025 15:00:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v2 6/6] x86/HVM: limit cache writeback overhead
Message-ID: <aCST30l2N9X6AOgr@macbook.lan>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <9274fbb1-c1be-9570-ecfc-8f0ac9a1f42b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9274fbb1-c1be-9570-ecfc-8f0ac9a1f42b@suse.com>

On Wed, May 03, 2023 at 11:47:18AM +0200, Jan Beulich wrote:
> There's no need to write back caches on all CPUs upon seeing a WBINVD
> exit; ones that a vCPU hasn't run on since the last writeback (or since
> it was started) can't hold data which may need writing back.

Couldn't you do the same with PV mode, and hence put the cpumask in
arch_vcpu rather than hvm_vcpu?

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> With us not running AMD IOMMUs in non-coherent ways, I wonder whether
> svm_wbinvd_intercept() really needs to do anything (or whether it
> couldn't check iommu_snoop just like VMX does, knowing that as of
> c609108b2190 ["x86/shadow: make iommu_snoop usage consistent with
> HAP's"] that's always set; this would largely serve as grep fodder then,
> to make sure this code is updated once / when we do away with this
> global variable, and it would be the penultimate step to being able to
> fold SVM's and VT-x'es functions).

On my series I expand cache_flush_permitted() to also account for
iommu_snoop, I think it's easier to have a single check that signals
whether cache control is allowed for a domain, rather that having to
check multiple different conditions.

Thanks, Roger.

