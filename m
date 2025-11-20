Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C720AC74948
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 15:33:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167526.1493825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5jB-0002RS-Kt; Thu, 20 Nov 2025 14:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167526.1493825; Thu, 20 Nov 2025 14:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5jB-0002Px-I4; Thu, 20 Nov 2025 14:33:41 +0000
Received: by outflank-mailman (input) for mailman id 1167526;
 Thu, 20 Nov 2025 14:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hThX=54=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1vM5jA-0002Pm-G0
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 14:33:40 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5cab8f9-c61d-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 15:33:38 +0100 (CET)
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:33:36 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2025 06:33:28 -0800
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
X-Inumbo-ID: e5cab8f9-c61d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763649219; x=1795185219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sQyxYXW7PPbgad6LMRVwa4jqmK6s2KwTJtkRXoZqVk8=;
  b=beQHTH7LO/Y3nK9spZ2K0TfKTXqUZVzlCLUQZgQBFwLtzLGB3iJO5+Kl
   87EdeC9m2IA+LQNXvhoQ7acQBUqcR2bJ0J6R86xpR9JvsleoI5Ua13sPf
   eC925KN1c6/dgXofl9z5Ptbg/X1aAyDZPIIOpA0Yg0HYEdCxpJmNQV7Gj
   lgQmUXaqHE7Me1dRr9MsONxZaEkir1Eg6VQn6//B/BFuNnSnyjn++Qr+0
   j74SP66zdWDl6bs8f5BlBZOTUIZwHl34nWQ/VtELBVtnU8ge21HBUqoon
   gsz3OT3MFtJUvLMF2a5gyMuEs+VHixf7Byecnl5QJqIdE4/VzdN+wfWwT
   w==;
X-CSE-ConnectionGUID: L1V3G54CRmy+yFnF57IMgA==
X-CSE-MsgGUID: l++w+5KcSVi6/Z4DQC1fmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76824888"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="76824888"
X-CSE-ConnectionGUID: iNkqu0PST0O5MuzQO2Nlgw==
X-CSE-MsgGUID: eSoSkmy/QXuBrOhkef7vzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191058805"
Date: Thu, 20 Nov 2025 22:55:48 +0800
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
Subject: Re: [PATCH 3/5] nbd/client-connection: Replace error_propagate() by
 assignment
Message-ID: <aR8r9PwcBCqidxUp@intel.com>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-4-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119130855.105479-4-armbru@redhat.com>

On Wed, Nov 19, 2025 at 02:08:53PM +0100, Markus Armbruster wrote:
> Date: Wed, 19 Nov 2025 14:08:53 +0100
> From: Markus Armbruster <armbru@redhat.com>
> Subject: [PATCH 3/5] nbd/client-connection: Replace error_propagate() by
>  assignment
> 
> connect_thread_func() sets a variable to null, then error_propagate()s
> an Error * to it.  This is a roundabout way to assign the Error * to
> it, so replace it by just that.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  nbd/client-connection.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


