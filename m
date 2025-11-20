Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9226EC74915
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 15:31:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167491.1493791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5gz-0000RY-Lo; Thu, 20 Nov 2025 14:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167491.1493791; Thu, 20 Nov 2025 14:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5gz-0000Os-JE; Thu, 20 Nov 2025 14:31:25 +0000
Received: by outflank-mailman (input) for mailman id 1167491;
 Thu, 20 Nov 2025 14:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hThX=54=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1vM5gy-0000Om-FK
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 14:31:24 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 943f43a9-c61d-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 15:31:21 +0100 (CET)
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:31:19 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa010.jf.intel.com with ESMTP; 20 Nov 2025 06:31:10 -0800
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
X-Inumbo-ID: 943f43a9-c61d-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763649082; x=1795185082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BJQ0ePr3LQV5SiK/Z+mX4/dVwor8ikb3J0AbLLg45uc=;
  b=Rwi4dSJ1VwwCbqgttRbMLi4pP8Z+RxEyHe1oQipl+nVBiZ0Z3Sz2TcJ2
   K0O4PGPRxW8clJWR216ZTWvrsfcUzKLONEw9Ppx7Xllpng+4pwj5fzHWv
   pxU01Xepm/1fRqo1kC9meAF0rS3XeQ2KHe9NpFvow59JW31O6yOdgavin
   CQNQjVCKwS2ESSEDgPMcLnxXsGns9t8I6lkLActyieJAtSQ7MUJFb2AV8
   qRScwq9+hpNR7AjBOMVmtuwl9EJGlWPico8A7EWoujziEtrcKjhrc0+qh
   Oyi2G9tsOQiLwCKYlJ9mS7kywRAcChClhx81wu7+he6ZyhgZYZIT9JuIG
   g==;
X-CSE-ConnectionGUID: 5Xap0oqZS9+NSsxWgFkNbg==
X-CSE-MsgGUID: OELw4eyzSzibKWzM1zXd5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65651092"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="65651092"
X-CSE-ConnectionGUID: IHUmIxu8STWCMdWRCOkkHQ==
X-CSE-MsgGUID: r9ZK/qnPSHODU6gCYG74XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="190664714"
Date: Thu, 20 Nov 2025 22:53:30 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
	mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
	gengdongjiu1@gmail.com, peter.maydell@linaro.org,
	alistair@alistair23.me, edgar.iglesias@gmail.com, npiggin@gmail.com,
	harshpb@linux.ibm.com, palmer@dabbelt.com, liwei1518@gmail.com,
	dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
	sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
	berrange@redhat.com, peterx@redhat.com, farosas@suse.de,
	eblake@redhat.com, vsementsov@yandex-team.ru, eduardo@habkost.net,
	marcel.apfelbaum@gmail.com, philmd@linaro.org,
	wangyanan55@huawei.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/5] hw/core/loader: Make load_elf_hdr() return bool,
 simplify caller
Message-ID: <aR8rajtQm+kppR87@intel.com>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-2-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119130855.105479-2-armbru@redhat.com>

On Wed, Nov 19, 2025 at 02:08:51PM +0100, Markus Armbruster wrote:
> Date: Wed, 19 Nov 2025 14:08:51 +0100
> From: Markus Armbruster <armbru@redhat.com>
> Subject: [PATCH 1/5] hw/core/loader: Make load_elf_hdr() return bool,
>  simplify caller
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/hw/loader.h |  4 +++-
>  hw/arm/boot.c       |  6 +-----
>  hw/core/loader.c    |  8 ++++++--
>  hw/riscv/spike.c    | 10 +---------
>  4 files changed, 11 insertions(+), 17 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


