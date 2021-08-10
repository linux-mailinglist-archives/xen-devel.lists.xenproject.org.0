Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A453E58AF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 12:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165321.302133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDPQc-0006s1-3P; Tue, 10 Aug 2021 10:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165321.302133; Tue, 10 Aug 2021 10:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDPQb-0006ol-VX; Tue, 10 Aug 2021 10:56:13 +0000
Received: by outflank-mailman (input) for mailman id 165321;
 Tue, 10 Aug 2021 10:56:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GuK=NB=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1mDPQb-0006of-CL
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 10:56:13 +0000
Received: from mail-wm1-f51.google.com (unknown [209.85.128.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9325e1f0-f9c9-11eb-9f75-12813bfff9fa;
 Tue, 10 Aug 2021 10:56:12 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 w21-20020a7bc1150000b02902e69ba66ce6so2225722wmi.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Aug 2021 03:56:12 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id x18sm20028730wmc.17.2021.08.10.03.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:56:10 -0700 (PDT)
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
X-Inumbo-ID: 9325e1f0-f9c9-11eb-9f75-12813bfff9fa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M8c678fNnsGLoOeW7UexhiEvWyA8c3/gcsG+wSE2ct8=;
        b=iJ8qqb3cvLwc9L8K+UtP+FSCeGr6PstPaaCbPVtTeY9kU++4U1Xd9p//xkn9YOV5JW
         3mFRb7Ow/oJqssqTZ5mpRuiisK1yQ11vNzPyudhdEHD82r6b7E85lUjdxWdCImHpeDNw
         Vq+Xe5jv14MXxNVJBLuM1Bv+5G/SVDNUTeqzEPJVlfRoFpNVoj87NgTO+7tgmDK1URag
         8I8BvF0/OHGZ65AT3Gsey+HDvYf0xt8Bw9wWoZ1HiIQYlYP30/op1vqyrNLyPcsaQ5i+
         tKorWy9+qOadJHfJvRj5JXju7USPDNOpHOJAcxSIN2OqJCqazL2a76hQ/o/4gn6DLDaE
         FXGA==
X-Gm-Message-State: AOAM5332q/+kSR5bxRZFbAWm3xxL1N+P3cpLblf5QVJnsfxg8L+MVbWI
	Gw725IS/U5BcnklRZ1/zmzE=
X-Google-Smtp-Source: ABdhPJz2yF8WcgnnZUSV/YZcts24nqVnzunX66Xx60m+tHd6RHQnGzum63lk7AYwHZ32aACM7/ys3w==
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr2862006wmc.23.1628592971259;
        Tue, 10 Aug 2021 03:56:11 -0700 (PDT)
Date: Tue, 10 Aug 2021 10:56:09 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
	sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	thomas.lendacky@amd.com, brijesh.singh@amd.com, ardb@kernel.org,
	Tianyu.Lan@microsoft.com, pgonda@google.com,
	martin.b.radev@gmail.com, akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com, rppt@kernel.org,
	sfr@canb.auug.org.au, saravanand@fb.com, krish.sadhukhan@oracle.com,
	aneesh.kumar@linux.ibm.com, xen-devel@lists.xenproject.org,
	rientjes@google.com, hannes@cmpxchg.org, tj@kernel.org,
	michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com, parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: Re: [PATCH V3 01/13] x86/HV: Initialize GHCB page in Isolation VM
Message-ID: <20210810105609.soi67eg2us5w7yuq@liuwe-devbox-debian-v2>
References: <20210809175620.720923-1-ltykernel@gmail.com>
 <20210809175620.720923-2-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809175620.720923-2-ltykernel@gmail.com>

On Mon, Aug 09, 2021 at 01:56:05PM -0400, Tianyu Lan wrote:
[...]
>  static int hv_cpu_init(unsigned int cpu)
>  {
>  	union hv_vp_assist_msr_contents msr = { 0 };
> @@ -85,6 +111,8 @@ static int hv_cpu_init(unsigned int cpu)
>  		}
>  	}
>  
> +	hyperv_init_ghcb();
> +

Why is the return value not checked here? If that's not required, can
you leave a comment?

Wei.

