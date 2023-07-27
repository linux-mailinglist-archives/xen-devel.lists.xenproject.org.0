Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFCD7650E6
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 12:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570989.893721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOy77-00015C-N4; Thu, 27 Jul 2023 10:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570989.893721; Thu, 27 Jul 2023 10:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOy77-000130-KP; Thu, 27 Jul 2023 10:20:57 +0000
Received: by outflank-mailman (input) for mailman id 570989;
 Thu, 27 Jul 2023 10:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hVV=DN=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1qOy75-00012p-Ot
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 10:20:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43df2f2d-2c67-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 12:20:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44B6761DD3;
 Thu, 27 Jul 2023 10:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9266C433C8;
 Thu, 27 Jul 2023 10:20:47 +0000 (UTC)
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
X-Inumbo-ID: 43df2f2d-2c67-11ee-b247-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690453251;
	bh=Uv0jglg4XDxm5uiOcl1Fs0VDdmS3vnj5J06IHksC3j0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VjGCTE5fXWQGMkstr5mWfG/olGcukHbx9MJ5gIHM1kJfwo/BiFcjiuEaiA2TxQad6
	 b/CL9D78jYHhDiLBxLD9gCBB6CtR9Pngnq1E4RM+cWQl1ITCzXzhPBEMorh0UStJGb
	 V5QypMia7H1mT7Yv9W7oIRfkDRB1G3xJIxfo7Y/Lymzj+mXx3lcBAFmRFbWxhh8lk9
	 h4N9LjcMkMC3/ZfJEah0qCVly/fWQ4ostsbFgLI1m7GG/WQbkHJ87BAgn9cUsNUERW
	 XrnUyEDaK9+tFU+Iukly/qv+tfC9IZiVkgJJJYsmEkH+2gmJEivzAz4IAcCpkEsNUW
	 WY8rxT9ubVHrA==
Message-ID: <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
Date: Thu, 27 Jul 2023 19:20:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 28/49] dm zoned: dynamically allocate the dm-zoned-meta
 shrinker
Content-Language: en-US
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Muchun Song <songmuchun@bytedance.com>, akpm@linux-foundation.org,
 david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
 <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/27/23 17:55, Qi Zheng wrote:
>>>           goto err;
>>>       }
>>>   +    zmd->mblk_shrinker->count_objects = dmz_mblock_shrinker_count;
>>> +    zmd->mblk_shrinker->scan_objects = dmz_mblock_shrinker_scan;
>>> +    zmd->mblk_shrinker->seeks = DEFAULT_SEEKS;
>>> +    zmd->mblk_shrinker->private_data = zmd;
>>> +
>>> +    shrinker_register(zmd->mblk_shrinker);
>>
>> I fail to see how this new shrinker API is better... Why isn't there a
>> shrinker_alloc_and_register() function ? That would avoid adding all this code
>> all over the place as the new API call would be very similar to the current
>> shrinker_register() call with static allocation.
> 
> In some registration scenarios, memory needs to be allocated in advance.
> So we continue to use the previous prealloc/register_prepared()
> algorithm. The shrinker_alloc_and_register() is just a helper function
> that combines the two, and this increases the number of APIs that
> shrinker exposes to the outside, so I choose not to add this helper.

And that results in more code in many places instead of less code + a simple
inline helper in the shrinker header file... So not adding that super simple
helper is not exactly the best choice in my opinion.

-- 
Damien Le Moal
Western Digital Research


