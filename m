Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB876C7496F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 15:35:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167552.1493846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5kt-0003XF-5S; Thu, 20 Nov 2025 14:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167552.1493846; Thu, 20 Nov 2025 14:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5kt-0003Uv-2S; Thu, 20 Nov 2025 14:35:27 +0000
Received: by outflank-mailman (input) for mailman id 1167552;
 Thu, 20 Nov 2025 14:35:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hThX=54=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1vM5kr-0003QT-Pf
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 14:35:25 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 259a6171-c61e-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 15:35:24 +0100 (CET)
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:35:22 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2025 06:35:16 -0800
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
X-Inumbo-ID: 259a6171-c61e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763649324; x=1795185324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e/JMkSbWMtHvyUA9DUy8ek+fYt4Hi5AVya5FhO0+re8=;
  b=YC8pgyj/th7O+J1aDfrWPkuzssKJYjB2YNR8OjtM7tQbQHBVekBgLPjv
   eOhaIYIMFITL2Hq8bfa2d3cMYOff9npTHnEohvkL+h7xdwAKH/S1AgjAF
   bJQZU261r1KVg7T3D2QeGpB8ZcrASEwkUInyNXkyBZ4V08Pq4n+NbW6r2
   HUci4jnSFKn7PbdpeQFeTTI4ZYxOs1w0WvCjvyLZdZnsjiUP8o0hIECXm
   QP3Nr9FzDL63kLPw1m8qpUXWKGevKrEf7m5eDChzKOxDpTNPze3GXkEgV
   aoaIW7j//AtNZVPuKltR7SiWQn1hf2N1yYHpqOTacJgVmySaylxEIVM0S
   Q==;
X-CSE-ConnectionGUID: 79667ok/Sz+XyPTUP6EzjQ==
X-CSE-MsgGUID: dXnEgEKKQCGwc27otVPj8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65661137"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="65661137"
X-CSE-ConnectionGUID: EqJuRxrkRa246dIOaQUj+Q==
X-CSE-MsgGUID: nowOQ2DKQKSKtR3ilwu7PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191634112"
Date: Thu, 20 Nov 2025 22:57:36 +0800
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
Subject: Re: [PATCH 5/5] error: Consistently name Error * objects err, and
 not errp
Message-ID: <aR8sYFmEauBGe/Ln@intel.com>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-6-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119130855.105479-6-armbru@redhat.com>

On Wed, Nov 19, 2025 at 02:08:55PM +0100, Markus Armbruster wrote:
> Date: Wed, 19 Nov 2025 14:08:55 +0100
> From: Markus Armbruster <armbru@redhat.com>
> Subject: [PATCH 5/5] error: Consistently name Error * objects err, and not
>  errp
> 
> This touches code in xen_enable_tpm() that is obviously wrong.  Since
> I don't know how to fix it properly, I'm adding a FIXME there.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  block/crypto.c          |  8 ++++----
>  hw/acpi/ghes.c          |  8 ++++----
>  hw/ppc/spapr.c          | 16 ++++++++--------
>  hw/xen/xen-pvh-common.c | 13 ++++++++++---
>  nbd/common.c            |  6 +++---
>  5 files changed, 29 insertions(+), 22 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


