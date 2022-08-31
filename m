Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FC55A739E
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 03:54:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395266.634812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTCvZ-0007a7-0U; Wed, 31 Aug 2022 01:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395266.634812; Wed, 31 Aug 2022 01:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTCvY-0007Xu-U6; Wed, 31 Aug 2022 01:54:00 +0000
Received: by outflank-mailman (input) for mailman id 395266;
 Wed, 31 Aug 2022 01:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1zJ=ZD=infradead.org=rdunlap@srs-se1.protection.inumbo.net>)
 id 1oTCvX-0007R3-MX
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 01:53:59 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6064773-28cf-11ed-a60c-1f1ba7de4fb0;
 Wed, 31 Aug 2022 03:53:58 +0200 (CEST)
Received: from [2601:1c0:6280:3f0::a6b3]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oTCv3-0036yC-Ja; Wed, 31 Aug 2022 01:53:29 +0000
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
X-Inumbo-ID: c6064773-28cf-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=RhkN3pjenFJ3Z4sU+BUfbopmS9x7erS/IYHXt0Yrgys=; b=QysnhHPVNUGamQ7lXkzW2eGveh
	lrRg3+WUIjKPhlF4vYw9KekYa0WymOeuQ9HZPakLME5p5qV2twe7OuR2cUMRxXRUExVoM9Da2cXco
	yxjaOKLwszB82khEd88lF0vcr9JboUUXxbv1iMGT6e8sXnviYouqPSuJ+bj2WkKHW8IkoHWJTYVAa
	nyEihlkujx5tC79yFjtJBfsR8iMLwz25U0Q5QoAClOCZQUDuPmiYE4b2xfU5PgTlbLr8FZaKX/Pc6
	90hO5RXPljYmishV1MXlptWBpBn7w9xcC6yjahtqPBxuBT6MCskGBWplJNcTqSA8jP2wkHctWyQFF
	e1X2LPNQ==;
Message-ID: <241c05a3-52a2-d49f-6962-3af5a94bc3fc@infradead.org>
Date: Tue, 30 Aug 2022 18:53:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [RFC PATCH 27/30] Code tagging based latency tracking
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz,
 hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de,
 dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com,
 void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com,
 ldufour@linux.ibm.com, peterx@redhat.com, david@redhat.com, axboe@kernel.dk,
 mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org,
 changbin.du@intel.com, ytcoode@gmail.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org,
 iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com,
 elver@google.com, dvyukov@google.com, shakeelb@google.com,
 songmuchun@bytedance.com, arnd@arndb.de, jbaron@akamai.com,
 rientjes@google.com, minchan@google.com, kaleshsingh@google.com,
 kernel-team@android.com, linux-mm@kvack.org, iommu@lists.linux.dev,
 kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
 linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220830214919.53220-1-surenb@google.com>
 <20220830214919.53220-28-surenb@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220830214919.53220-28-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/30/22 14:49, Suren Baghdasaryan wrote:
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index b7d03afbc808..b0f86643b8f0 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1728,6 +1728,14 @@ config LATENCYTOP
>  	  Enable this option if you want to use the LatencyTOP tool
>  	  to find out which userspace is blocking on what kernel operations.
>  
> +config CODETAG_TIME_STATS
> +	bool "Code tagging based latency measuring"
> +	depends on DEBUG_FS
> +	select TIME_STATS
> +	select CODE_TAGGING
> +	help
> +	  Enabling this option makes latency statistics available in debugfs

Missing period at the end of the sentence.

-- 
~Randy

