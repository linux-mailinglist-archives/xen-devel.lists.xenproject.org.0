Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA6A623A4
	for <lists+xen-devel@lfdr.de>; Sat, 15 Mar 2025 02:06:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915647.1321122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttFyx-0002kw-Ti; Sat, 15 Mar 2025 01:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915647.1321122; Sat, 15 Mar 2025 01:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttFyx-0002j2-Q1; Sat, 15 Mar 2025 01:06:31 +0000
Received: by outflank-mailman (input) for mailman id 915647;
 Sat, 15 Mar 2025 01:06:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3z59=WC=linux-foundation.org=akpm@srs-se1.protection.inumbo.net>)
 id 1ttFyw-0002it-Ct
 for xen-devel@lists.xenproject.org; Sat, 15 Mar 2025 01:06:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b96acdfa-0139-11f0-9ab9-95dc52dad729;
 Sat, 15 Mar 2025 02:06:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D1D8A5C57AE;
 Sat, 15 Mar 2025 01:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50731C4CEE3;
 Sat, 15 Mar 2025 01:06:26 +0000 (UTC)
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
X-Inumbo-ID: b96acdfa-0139-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1742000787;
	bh=9oWnsRrteEppsIdl5wrmRTiQSvICywXOfyVLBTYkPCI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hiDkEE6J0GX+v0+CdESRoz6zAHZRHQZ72O5QKVYZ5LGWrjOEvbGY+IX/tGmhLRq9z
	 4EoNAziY4xo2uHV9ZoPku2B4MfYlNMovYNZdeyRXjA2Jx/wWHrU4V1izR9ldGxdxtk
	 4iph9jC++nXZzJojFvQ59UmAE6u4XbopROzZAjq0=
Date: Fri, 14 Mar 2025 18:06:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nico Pache <npache@redhat.com>
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, virtualization@lists.linux.dev,
 alexander.atanasov@virtuozzo.com, muchun.song@linux.dev,
 roman.gushchin@linux.dev, mhocko@kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 mst@redhat.com, david@redhat.com, yosry.ahmed@linux.dev,
 hannes@cmpxchg.org, nphamcs@gmail.com, chengming.zhou@linux.dev,
 kanchana.p.sridhar@intel.com, llong@redhat.com, shakeel.butt@linux.dev
Subject: Re: [PATCH v2 1/4] meminfo: add a per node counter for balloon
 drivers
Message-Id: <20250314180625.8c3a2a5a990a132a7b0b9072@linux-foundation.org>
In-Reply-To: <20250314213757.244258-2-npache@redhat.com>
References: <20250314213757.244258-1-npache@redhat.com>
	<20250314213757.244258-2-npache@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Mar 2025 15:37:54 -0600 Nico Pache <npache@redhat.com> wrote:

> Add NR_BALLOON_PAGES counter to track memory used by balloon drivers and
> expose it through /proc/meminfo and other memory reporting interfaces.
> 
> ...
>
> --- a/fs/proc/meminfo.c
> +++ b/fs/proc/meminfo.c
> @@ -162,6 +162,8 @@ static int meminfo_proc_show(struct seq_file *m, void *v)
>  	show_val_kb(m, "Unaccepted:     ",
>  		    global_zone_page_state(NR_UNACCEPTED));
>  #endif
> +	show_val_kb(m, "Balloon:        ",
> +		    global_node_page_state(NR_BALLOON_PAGES));

Please update Documentation/filesystems/proc.rst for this.

