Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BC77AF593
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 22:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608528.947059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlF4S-0004yQ-8f; Tue, 26 Sep 2023 20:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608528.947059; Tue, 26 Sep 2023 20:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlF4S-0004wU-5a; Tue, 26 Sep 2023 20:54:16 +0000
Received: by outflank-mailman (input) for mailman id 608528;
 Tue, 26 Sep 2023 20:54:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d5Ia=FK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qlF4Q-0004wM-Cv
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 20:54:14 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7effe06-5cae-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 22:54:11 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40535597f01so97812155e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Sep 2023 13:54:11 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m28-20020a05600c3b1c00b004053a2138bfsm14512674wms.12.2023.09.26.13.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 13:54:10 -0700 (PDT)
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
X-Inumbo-ID: d7effe06-5cae-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695761651; x=1696366451; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vmzVlZEt0c6r9t6B5QTRO0H5Q1XVtRZ4v0aC2ION6b8=;
        b=WvhgWeJhfDWlGYO5OhuEWv7awCb2eyJcQTE/vwTQFqce28lkEkI9k9ztrhuzicoF/8
         Mr13wHqVeKIDbFBq4N3B1w+RQ/GQNjC487QIJqSpua43nhmvQIRfGrr1pTKg5FIsdhza
         XTJvCImP768VbuHJrKSurD+A71FdTheDIaNhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695761651; x=1696366451;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmzVlZEt0c6r9t6B5QTRO0H5Q1XVtRZ4v0aC2ION6b8=;
        b=vKmpk0/lwSiwa4V3b/nnhrSuJ4uKbWeohdVm5C7goQG23kanU6y0m/HR8KBs4snYwj
         TGPvzDaedhyI6rlmhlSs1yfvDu90Y0vFJfMwRxy3HCvKRQOssXPPN3W6wQzsN8jFhCRZ
         yQKBtapPT2V5XHA2kaKAmmIV3z84lhWGEz+DbG5deoOx2yfp2nKhjAEFQBcE3OVRzG/f
         JgdFHSuVGHqNqRrL3lS2L5kQnDmcalAyYR9CVU4rMJUiCH/zJVjf1LK+3Hn/ZxoB/zsL
         3Qlg+Ky/0g1Fc7+/o8yHAcXFgyDfDrJwwZo8yjQOCaTP2MTW1zk/agVWm2I2ckmwnbnU
         yQDg==
X-Gm-Message-State: AOJu0YxA8r9Dk85CGdYs+WZjvL1amyvLAFE4Ont0Nj0007dxvcDr2lLQ
	zC1OEQUSpY3FUc/mJniLo0Q+ug==
X-Google-Smtp-Source: AGHT+IF00xUdXGTMEDJWtP1B29tq5VF920ZbP+591zaQ8f4U+77XwiwsbXg+aCXCJjMWBYNE44yTOg==
X-Received: by 2002:a05:600c:218b:b0:405:3f06:c075 with SMTP id e11-20020a05600c218b00b004053f06c075mr95363wme.6.1695761650732;
        Tue, 26 Sep 2023 13:54:10 -0700 (PDT)
Message-ID: <2afa2ce7-ce22-ed47-07fe-0165e58302c6@citrix.com>
Date: Tue, 26 Sep 2023 21:54:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] xen/common: Add NUMA node id bounds check to
 page_alloc.c/node_to_scrub
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <cover.1695754185.git.sanastasio@raptorengineering.com>
 <cbecf35392441b03dc3ccd2a119b6fbdbf13b855.1695754185.git.sanastasio@raptorengineering.com>
In-Reply-To: <cbecf35392441b03dc3ccd2a119b6fbdbf13b855.1695754185.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/09/2023 7:54 pm, Shawn Anastasio wrote:
> When building for Power with CONFIG_DEBUG unset, a compiler error gets
> raised inside page_alloc.c's node_to_scrub function:
>
> common/page_alloc.c: In function 'node_to_scrub.part.0':
> common/page_alloc.c:1217:29: error: array subscript 1 is above array
>             bounds of 'long unsigned int[1]' [-Werror=array-bounds]
>  1217 |         if ( node_need_scrub[node] )
>
> It appears that this is a false positive, given that in practice
> cycle_node should never return a node ID >= MAX_NUMNODES as long as the
> architecture's node_online_map is properly defined and initialized, so
> this additional bounds check is only to satisfy GCC.

If GCC thinks it's got an index of 1 here, then it thinks it's proved
that a 1 gets passed.  But the fact that cycle_node() really can return
1 if one variable gets tweaked in memory means that logic derived on
this property is broken.

But we've got even more basic problems to fix first.

xen$ git grep -B1 '__read_mostly node_online_map'
arch/arm/smpboot.c-45-/* Fake one node for now. See also asm/numa.h */
arch/arm/smpboot.c:46:nodemask_t __read_mostly node_online_map = { { [0]
= 1UL } };
arch/ppc/stubs.c-25-
arch/ppc/stubs.c:26:nodemask_t __read_mostly node_online_map = { { [0] =
1UL } };
common/numa.c-44-
common/numa.c:45:nodemask_t __read_mostly node_online_map = { { [0] =
1UL } };

There are 3 identical definitions of node_online_map, one for the
architecture which really supports NUMA, and two for the stubs which don't.

And the bug here is that code outside of CONFIG_NUMA assumes NUMA is
valid, including several places in page_alloc.c,
domain_set_node_affinity(), credit1 and sysctl.  XEN_SYSCTL_numainfo
even has a bigger sin of using a static MAX_NUMNODES array when it
doesn't need an array in the first place.

It's rude for xen/nodemask.h to short circuit some of the operations on
node_online_map based on MAX_NUMNODES but not others.

If nothing else, the fallback for "not really NUMA" needs providing by
the common code and not by the arch stubs.  When that is sorted, we
might have more consistent behaviour to investigate.

~Andrew

