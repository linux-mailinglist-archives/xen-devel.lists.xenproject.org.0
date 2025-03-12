Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8872DA5D687
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 07:48:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909887.1316773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsFrz-0006Y4-6P; Wed, 12 Mar 2025 06:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909887.1316773; Wed, 12 Mar 2025 06:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsFrz-0006WC-2w; Wed, 12 Mar 2025 06:47:11 +0000
Received: by outflank-mailman (input) for mailman id 909887;
 Wed, 12 Mar 2025 04:21:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=knxZ=V7=linux.dev=shakeel.butt@srs-se1.protection.inumbo.net>)
 id 1tsDaV-0004e1-Ut
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:21:00 +0000
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [91.218.175.182]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65bb66bf-fef9-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 05:20:58 +0100 (CET)
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
X-Inumbo-ID: 65bb66bf-fef9-11ef-9ab9-95dc52dad729
Date: Tue, 11 Mar 2025 21:20:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741753256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hDVW5paXvofauniZLpqYiGX3ZDGr6k7FCnVsxIQYmDI=;
	b=XEwUyIMDWawoG5pdblTStI90HquR/rc4o2V0eGwG0KkonQod7nUPqLyItShqetqdquXcQh
	/yNdl28wY6m6OKfmu15G0wheicZLL/xdftO1L8QhhRgbxANOz3ePyhU5QqTYAF2M9I/7F7
	NOKfvHIcb5lldr/IXRtr3hANfUg4T5w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Nico Pache <npache@redhat.com>
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, cgroups@vger.kernel.org, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	jerrin.shaji-george@broadcom.com, bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de, 
	gregkh@linuxfoundation.org, mst@redhat.com, david@redhat.com, jasowang@redhat.com, 
	xuanzhuo@linux.alibaba.com, eperezma@redhat.com, jgross@suse.com, sstabellini@kernel.org, 
	oleksandr_tyshchenko@epam.com, akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@kernel.org, 
	roman.gushchin@linux.dev, muchun.song@linux.dev, nphamcs@gmail.com, yosry.ahmed@linux.dev, 
	kanchana.p.sridhar@intel.com, alexander.atanasov@virtuozzo.com
Subject: Re: [RFC 1/5] meminfo: add a per node counter for balloon drivers
Message-ID: <oiues63fvb5xx45pue676iso3d3mcqboxdtmcfldwj4xm7q4g7@rxrgpz5l23ok>
References: <20250312000700.184573-1-npache@redhat.com>
 <20250312000700.184573-2-npache@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312000700.184573-2-npache@redhat.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Mar 11, 2025 at 06:06:56PM -0600, Nico Pache wrote:
> Add NR_BALLOON_PAGES counter to track memory used by balloon drivers and
> expose it through /proc/meminfo and other memory reporting interfaces.
> 
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>  fs/proc/meminfo.c      | 2 ++
>  include/linux/mmzone.h | 1 +
>  mm/memcontrol.c        | 1 +
>  mm/show_mem.c          | 4 +++-
>  mm/vmstat.c            | 1 +
>  5 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
> index 8ba9b1472390..83be312159c9 100644
> --- a/fs/proc/meminfo.c
> +++ b/fs/proc/meminfo.c
> @@ -162,6 +162,8 @@ static int meminfo_proc_show(struct seq_file *m, void *v)
>  	show_val_kb(m, "Unaccepted:     ",
>  		    global_zone_page_state(NR_UNACCEPTED));
>  #endif
> +	show_val_kb(m, "Balloon:        ",
> +		    global_node_page_state(NR_BALLOON_PAGES));
>  
>  	hugetlb_report_meminfo(m);
>  
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 9540b41894da..71d3ff19267a 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -223,6 +223,7 @@ enum node_stat_item {
>  #ifdef CONFIG_HUGETLB_PAGE
>  	NR_HUGETLB,
>  #endif
> +	NR_BALLOON_PAGES,
>  	NR_VM_NODE_STAT_ITEMS
>  };
>  
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 4de6acb9b8ec..182b44646bfa 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -1377,6 +1377,7 @@ static const struct memory_stat memory_stats[] = {
>  #ifdef CONFIG_HUGETLB_PAGE
>  	{ "hugetlb",			NR_HUGETLB			},
>  #endif
> +	{ "nr_balloon_pages",		NR_BALLOON_PAGES		},

Please remove the above counter from memcontrol.c as I don't think this
memory is accounted towards memcg.

