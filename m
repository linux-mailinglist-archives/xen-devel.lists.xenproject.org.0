Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25901B053E7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043689.1413689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaZt-0001s9-DJ; Tue, 15 Jul 2025 07:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043689.1413689; Tue, 15 Jul 2025 07:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaZt-0001qG-AV; Tue, 15 Jul 2025 07:59:53 +0000
Received: by outflank-mailman (input) for mailman id 1043689;
 Tue, 15 Jul 2025 07:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8kEX=Z4=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1ubaZs-0001qA-4e
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:59:52 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae138a91-6151-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 09:59:50 +0200 (CEST)
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:59:47 -0700
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:59:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ubaZS-0000000Fadw-49Fb; Tue, 15 Jul 2025 10:59:26 +0300
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
X-Inumbo-ID: ae138a91-6151-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752566391; x=1784102391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UeR90blzl1UkanLlvwh7Gs4nuz3Jzfvnov9b2Px8QHk=;
  b=FU2P6QxnaFPJf8RAnJUZbRASZbHZZCR4Ds5ByonVqy05oDTK90GhE1Lj
   pZP4yfbA6jQrmYWugOvCT4pFgHay3RlM9/r2qzwhjCa1u2lsKvkhHyGKQ
   erD+WyNLnlsBo4X1MDGc70sfsk5Gm73j1AJeIxrtnoeKlDRLtbPXy+60T
   G5t6bzzsSU9jOB6Vf9h84fETDiw7bqPcZymttsrSFu0hrz0fJk3U16lXo
   t1JuGAWq6NqJdTq6pXskaWTKm/espMCKLhI3DWfFL8OmQWhu5gTirottt
   3Blyk3hdcXXIRki+pqrFgcVFwfnjd6/l+nRT/MUm2B6n+UmnBYYrr0oOj
   Q==;
X-CSE-ConnectionGUID: eQIRCEO0SAK6+33q6u+G1Q==
X-CSE-MsgGUID: l1BmVJ8zTjeZlutAKImVyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54920738"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54920738"
X-CSE-ConnectionGUID: LAglGVJPSx+FTNAdNBYyDw==
X-CSE-MsgGUID: ZxagDbPCR3a8lGaD4xN+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="156565039"
Date: Tue, 15 Jul 2025 10:59:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, seanjc@google.com,
	pbonzini@redhat.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, lucas.demarchi@intel.com,
	thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
	airlied@gmail.com, simona@ffwll.ch, marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, arend.vanspriel@broadcom.com,
	ilpo.jarvinen@linux.intel.com, jirislaby@kernel.org,
	jgross@suse.com, sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com, akpm@linux-foundation.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	ming.li@zohomail.com, linux-cxl@vger.kernel.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	netdev@vger.kernel.org, kvalo@kernel.org, johannes.berg@intel.com,
	quic_ramess@quicinc.com, ragazenta@gmail.com,
	jeff.johnson@oss.qualcomm.com, mingo@kernel.org, j@jannau.net,
	linux@treblig.org, linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
	linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
	shenlichuan@vivo.com, yujiaoliang@vivo.com, colin.i.king@gmail.com,
	cvam0000@gmail.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: Re: [PATCH] treewide: Fix typo "notifer"
Message-ID: <aHYKXgc2k5wDY32c@smile.fi.intel.com>
References: <B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com>
 <2025071545-endnote-imprison-2b98@gregkh>
 <5D06C25920559D71+06c9ce34-9867-495c-9842-dcfe9f1d51bb@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5D06C25920559D71+06c9ce34-9867-495c-9842-dcfe9f1d51bb@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 15, 2025 at 03:53:18PM +0800, WangYuli wrote:
> On 2025/7/15 15:22, Greg KH wrote:
> > Please break this up into one-patch-per-subsystem, like is required for
> > things like this.

> Honestly, I've always been quite unsure how to handle situations like this.
> 
> It seems every subsystem maintainer has different preferences.

True, but at least if you see the specific driver in the MAINTAINERS, split for
that driver. For instance, 8250_dw in this patch is exactly the case.

> I've previously encountered some maintainers who suggested I split such
> patches by subsystem so each maintainer could merge them into their tree
> without contention. However, other ones have argued that fixing spelling
> errors isn't worth multiple commits, claiming it would create chaos.

> Since I genuinely discover these spelling errors by chance each time, and to
> avoid giving the impression I'm "spamming" the kernel tree for some ulterior
> motive, I've opted to squash them into a single commit.
> 
> That said, I personally don't have any strong feelings or preferences on
> this matter. Since you've requested it, I'll go ahead and split it up and
> send a v2 patchset.

-- 
With Best Regards,
Andy Shevchenko



