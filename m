Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C0AB06F18
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 09:37:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044868.1414901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubwgY-0006cL-UL; Wed, 16 Jul 2025 07:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044868.1414901; Wed, 16 Jul 2025 07:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubwgY-0006a8-RK; Wed, 16 Jul 2025 07:36:14 +0000
Received: by outflank-mailman (input) for mailman id 1044868;
 Wed, 16 Jul 2025 07:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6L/7=Z5=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1ubwgX-0006a1-M4
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 07:36:13 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8938288f-6217-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 09:36:09 +0200 (CEST)
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 00:36:06 -0700
Received: from smile.fi.intel.com ([10.237.72.52])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 00:35:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ubwg6-0000000Fr3T-1IQh; Wed, 16 Jul 2025 10:35:46 +0300
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
X-Inumbo-ID: 8938288f-6217-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752651369; x=1784187369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SLxwHXEqd1OUWiEYMVIKGR7ibc8WPwr3uMVi8v3Vptw=;
  b=lYde8jT0G/T/oS8Fp20q+qq3CHrSmhmMeZjc3qCLMGfqoUqzRGpm7LkR
   /GqnITmcZTeOLtUaBuwDQmv8xgh541WEkai45ReacZtshFzg5IYoHvtn5
   I76I3beyYlUwOkxe0pb7HBO6Y2sQROe4d1LcOwDVK3spiCG5zj3BkPHMC
   DYS7A8qsdRXlGcBaR3HRCsykx0n5ihtmt7gfndlsQHkTUTWb88u0aOUKF
   GKTX6P8JN4RzpBlYDi5VYkhC6OacB5XDymKZM/tSybHgVRjGNRrG0RRxG
   k00XPwgwNeihQB+Bacyb4jnaPCC2u0hPk1/dxsLJyYSuRhO72Fd1fCbAf
   A==;
X-CSE-ConnectionGUID: 0yslpo14Qp+0p2kFvzJx2A==
X-CSE-MsgGUID: EjX9zuX9RX+Ce8Bwa6REGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65458024"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="65458024"
X-CSE-ConnectionGUID: hY0dnPHtTOiIv2bf3XuWdg==
X-CSE-MsgGUID: +jK6Yk6xTfOJ47JGHLkZWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="157985544"
Date: Wed, 16 Jul 2025 10:35:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org,
	alison.schofield@intel.com, andrew+netdev@lunn.ch,
	arend.vanspriel@broadcom.com, bp@alien8.de,
	brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
	colin.i.king@gmail.com, cvam0000@gmail.com,
	dan.j.williams@intel.com, dave.hansen@linux.intel.com,
	dave.jiang@intel.com, dave@stgolabs.net, davem@davemloft.net,
	dri-devel@lists.freedesktop.org, edumazet@google.com,
	gregkh@linuxfoundation.org, guanwentao@uniontech.com, hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com, intel-xe@lists.freedesktop.org,
	ira.weiny@intel.com, j@jannau.net, jeff.johnson@oss.qualcomm.com,
	jgross@suse.com, jirislaby@kernel.org, johannes.berg@intel.com,
	jonathan.cameron@huawei.com, kuba@kernel.org, kvalo@kernel.org,
	kvm@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux@treblig.org,
	lucas.demarchi@intel.com, marcin.s.wojtas@gmail.com,
	ming.li@zohomail.com, mingo@kernel.org, mingo@redhat.com,
	netdev@vger.kernel.org, niecheng1@uniontech.com,
	oleksandr_tyshchenko@epam.com, pabeni@redhat.com,
	pbonzini@redhat.com, quic_ramess@quicinc.com, ragazenta@gmail.com,
	rodrigo.vivi@intel.com, seanjc@google.com, shenlichuan@vivo.com,
	simona@ffwll.ch, sstabellini@kernel.org, tglx@linutronix.de,
	thomas.hellstrom@linux.intel.com, vishal.l.verma@intel.com,
	x86@kernel.org, xen-devel@lists.xenproject.org,
	yujiaoliang@vivo.com, zhanjun@uniontech.com
Subject: Re: [PATCH v2 6/8] serial: 8250_dw: Fix typo "notifer"
Message-ID: <aHdWUu58e_nCadX4@smile.fi.intel.com>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
 <2BF1749F02ADE664+20250715134407.540483-6-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2BF1749F02ADE664+20250715134407.540483-6-wangyuli@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 15, 2025 at 09:44:05PM +0800, WangYuli wrote:
> There is a spelling mistake of 'notifer' in the comment which
> should be 'notifier'.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



