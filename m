Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E252C74960
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 15:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167539.1493836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5k1-0002y5-TX; Thu, 20 Nov 2025 14:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167539.1493836; Thu, 20 Nov 2025 14:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5k1-0002wM-Ph; Thu, 20 Nov 2025 14:34:33 +0000
Received: by outflank-mailman (input) for mailman id 1167539;
 Thu, 20 Nov 2025 14:34:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hThX=54=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1vM5k0-0002wE-L3
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 14:34:32 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 055de50d-c61e-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 15:34:30 +0100 (CET)
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:34:29 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 06:34:15 -0800
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
X-Inumbo-ID: 055de50d-c61e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763649271; x=1795185271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yPcH1deYy75uCsECvsB0OJbTIL54O9dmOmpsEpMttdo=;
  b=J38W0jd3TzwfAMjpDCQSGKuomGDKdN8C0T/MCyP6cDWWvp0a5IkTvZMx
   80NvcMfFGAUpS1njpWGkffyzijnd/XbN/5mMN+n6VPer7cKHiWrKlhM25
   3wORE5uugqqPQPhVr8P5pmgtNhHxxkZS4YShEaMUP5VvHggZRVM+3KVZ0
   1Ynmbw1SiISbxOJrkrZO1TwG+0j69+X9Lm9g4F/TbYtwRTfGqCXWxcH52
   kRkopr4300ZZ1E1bSg/2xb1ubYwpvVxyzI01qFRlZzCCKKpBNHoe78ErD
   Le9/h/qyO+JX1FfYlgRxyaS71K3a1Wc0H+iZb3EgIxeGFKVVP3mnRXvZX
   g==;
X-CSE-ConnectionGUID: EhaBkU2+Tk+k1VOn4nUBEw==
X-CSE-MsgGUID: bNY4uY+cQ9S/EMPWKfeMLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69336185"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="69336185"
X-CSE-ConnectionGUID: 0vCE/3psQMyRUX3wO3xbCA==
X-CSE-MsgGUID: urw9h5M8Q0CbV8xchmpPTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="222028345"
Date: Thu, 20 Nov 2025 22:56:34 +0800
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
Subject: Re: [PATCH 4/5] error: error_free(NULL) is safe, drop unnecessary
 conditionals
Message-ID: <aR8sIlSfRc93wTSh@intel.com>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-5-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119130855.105479-5-armbru@redhat.com>

On Wed, Nov 19, 2025 at 02:08:54PM +0100, Markus Armbruster wrote:
> Date: Wed, 19 Nov 2025 14:08:54 +0100
> From: Markus Armbruster <armbru@redhat.com>
> Subject: [PATCH 4/5] error: error_free(NULL) is safe, drop unnecessary
>  conditionals
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/acpi/pcihp.c             | 4 +---
>  io/channel-websock.c        | 4 +---
>  io/task.c                   | 4 +---
>  migration/migration.c       | 6 ++----
>  tests/unit/test-smp-parse.c | 5 +----
>  5 files changed, 6 insertions(+), 17 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


