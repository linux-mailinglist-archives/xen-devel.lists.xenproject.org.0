Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0627D6422F9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 07:21:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453178.710840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p24qV-0001BF-99; Mon, 05 Dec 2022 06:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453178.710840; Mon, 05 Dec 2022 06:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p24qV-00019R-58; Mon, 05 Dec 2022 06:20:55 +0000
Received: by outflank-mailman (input) for mailman id 453178;
 Mon, 05 Dec 2022 06:20:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g57r=4D=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p24qU-00019L-7L
 for xen-devel@lists.xen.org; Mon, 05 Dec 2022 06:20:54 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6f47463-7464-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 07:20:52 +0100 (CET)
Received: by mail-pg1-x52c.google.com with SMTP id f3so9637656pgc.2
 for <xen-devel@lists.xen.org>; Sun, 04 Dec 2022 22:20:51 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 qb12-20020a17090b280c00b001fd6066284dsm8457861pjb.6.2022.12.04.22.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 22:20:49 -0800 (PST)
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
X-Inumbo-ID: f6f47463-7464-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uqsE8tqTqZyblTvVwSMqpzen4waQLmBaXHHjeti5h8g=;
        b=ThCZ2yJc50RBxK2PGhKUzk1otivqHIwQJQAqrb+c//XbGWu2pZ17ndPtoaAzOyhYH+
         h4a/+dGAze4sWIN9E/o1CntetbV8H4GXePdpKQxjCoj7Wka24uj+09FtsV0aVYg98hbH
         uhwfDwAvZ9IuwnZdjtBYVrMqRMY3SKnTiuX1UCS72cntDnyihVsBvTUNg4gjrXrcQrkd
         6Pd1Cv1ZogtOiNLPBKbraX5whxxpR2cRv5fiN4cya5hjPEqAL8AF1kBCxwwZ/n4rsQ+L
         KxkUM8oKUHAhgtx0IzqaNgcUr1NfWVx1UpZNfkmR66K9jOTtazf1+EOKbkmYwT+KIv+k
         ADvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqsE8tqTqZyblTvVwSMqpzen4waQLmBaXHHjeti5h8g=;
        b=kgUuvw+2VOQVIRuTwPSbS0WbK/QTIIsSYuF9K0XhkroncxKAeZTJuF3ASieATRAe5D
         PsyLdSjkEUnKm86dzUFRM+YeIJpJXtArmHBPXrHKg0+OWSWRcDqfn++lneIB5d7R4tMW
         zJDa4t5UZKXLpXrOMYycvRtes4/GoQY7h6KJv2Ns0ogpibJDXsy4sDhVkkl5/wZnhOzZ
         TwbwEfklMkdt9szFX8n5Uq4UsvOtoh8uPRMCnmla10x1cMkCHaUpPbSdmOYf4wjh+ziz
         gxAZv4gVwkEj+5bQEh8UzkaRG2XGKFv/A8t1l7diIjCg1xyJ+FHOFkbsKg4O/oK6fJWx
         +EaA==
X-Gm-Message-State: ANoB5plhK4bavKHNDloc0uKlIm7Q5RUCP6xqyH0/fYMY1ORqTluDr6Yw
	GchOsoQOUoRtQuuaOhyYo1oFCA==
X-Google-Smtp-Source: AA0mqf7/GbAOcqplFFbXHGkyLdcsQdPdQaHptaqjo1Qer+Ubd7FviOnFDulD6QUjDYhdfeQnNOJ73A==
X-Received: by 2002:aa7:9882:0:b0:574:7931:98a3 with SMTP id r2-20020aa79882000000b00574793198a3mr53697026pfl.17.1670221250135;
        Sun, 04 Dec 2022 22:20:50 -0800 (PST)
Date: Mon, 5 Dec 2022 11:50:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH V6 2/3] xl: Add support to parse generic virtio device
Message-ID: <20221205062047.yuv3hyrkpumry7wn@vireshk-i7>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
 <73663851c5223b99ed0f23a163a0d44cba0ebe29.1667906228.git.viresh.kumar@linaro.org>
 <4a355c28-9596-cfbd-ffd2-2f8d9dde9938@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a355c28-9596-cfbd-ffd2-2f8d9dde9938@gmail.com>

On 02-12-22, 19:16, Oleksandr Tyshchenko wrote:
> Interesting, I see you allow user to configure virtio-mmio params (irq and
> base), as far as I remember for virtio-disk these are internal only
> (allocated by tools/libs/light/libxl_arm.c).

It is a mistake. Will drop it.

-- 
viresh

