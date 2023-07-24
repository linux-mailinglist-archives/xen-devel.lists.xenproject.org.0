Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECA175F158
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:57:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568627.888306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsJ4-0003sW-0L; Mon, 24 Jul 2023 09:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568627.888306; Mon, 24 Jul 2023 09:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsJ3-0003pa-Tv; Mon, 24 Jul 2023 09:56:45 +0000
Received: by outflank-mailman (input) for mailman id 568627;
 Mon, 24 Jul 2023 09:56:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jodz=DK=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qNsJ1-0003pU-Lh
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:56:43 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63b2cc17-2a08-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 11:56:42 +0200 (CEST)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-682ae5d4184so1051746b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:56:42 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 y1-20020aa78541000000b00682aac1e2b8sm7356787pfn.60.2023.07.24.02.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 02:56:40 -0700 (PDT)
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
X-Inumbo-ID: 63b2cc17-2a08-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192601; x=1690797401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=am2eIoStEhYj6reS+R983QZxh6h3W0xYr71gNNToCQ8=;
        b=OlJHj1/yO42yQ42YyfDdqtfuDdXGGV/WQ0GpL38YIfO5RJZmkcdCx+PepLtkyGVzEN
         bTK4LhGsJI+OJKO7VuvlEDj/aPd3bZAexndKWivptO/xeLBD7J/JCOubjicjaVNWXLQ5
         H6fB+0YsEx63uc5TiCs20sSEjZ3JxRWkjZHG3LQbatv3J9k4pmh0VpqAg7R562nbzzly
         s71ebLgHH+wdbZuHYfqIuXfOS4H3wCLtxZ6Rqc556hBiF9jLddR68NJcthdMi5JsNo9F
         fUAZvFHEDsznNwsCMgykOwv5P0YMuteT/vvRsXd6nvRv9Clc/Ic3a7YeuRAtFe+vPCu7
         EZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192601; x=1690797401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=am2eIoStEhYj6reS+R983QZxh6h3W0xYr71gNNToCQ8=;
        b=ijq8OemdaTZp24RCnF5Hkyvf2oCTx2U++K+EBQKl6KtOFVt1mgo7pA2nJpMi0UtWs4
         AG8txnG1kDs9RbYbT0WpigPPjPYVK8Cy+2ZImL5m/scYFXh0Sr0jywW+81bbRCdzUKyg
         BENGpNz1IfmpOrYuoL4HMrHOBF+7tFtkp3IcYa5CaoCpcsnhQO0AZPFmv+XjokSJwvQQ
         RWuNWP4+2f0PV+2mOVtrDMhfPCJQWULMW8gBOCAGeZUMTknoDqopmMyupb6JjgZqOsCG
         iPTvh/2hCqFe9DWw1u/8AMkThnUng8z+XkOOhfy8Hr4n7p7ryFtLkRe+N2j+ZmqCNLEG
         +c7w==
X-Gm-Message-State: ABy/qLawimyUMFeUPE1yj7BJeBrjC/Ij7Rpi2owbJcihevfAktknBbMD
	2rSxDx96bV8Th/+4K9bibZW3gQ==
X-Google-Smtp-Source: APBJJlEtnCzvJ6I1rkWEELadVXHfZtUE/plpWIuGp/MFKpOvTS509ssN84iHDxA1POdeL3+D21rKQg==
X-Received: by 2002:a05:6a20:8e04:b0:137:3941:17b3 with SMTP id y4-20020a056a208e0400b00137394117b3mr14532126pzj.6.1690192601020;
        Mon, 24 Jul 2023 02:56:41 -0700 (PDT)
Message-ID: <7b4eb3fa-1ebd-de07-1a16-9533b069a66e@bytedance.com>
Date: Mon, 24 Jul 2023 17:56:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 05/47] binder: dynamically allocate the android-binder
 shrinker
Content-Language: en-US
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-6-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230724094354.90817-6-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


This patch depends on the patch: 
https://lore.kernel.org/lkml/20230625154937.64316-1-qi.zheng@linux.dev/


