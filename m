Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D76064C362
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 06:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461637.719754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Js0-0004fM-Rh; Wed, 14 Dec 2022 04:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461637.719754; Wed, 14 Dec 2022 04:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Js0-0004d2-Og; Wed, 14 Dec 2022 04:59:52 +0000
Received: by outflank-mailman (input) for mailman id 461637;
 Wed, 14 Dec 2022 04:59:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtkE=4M=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p5Jrz-0004cw-9y
 for xen-devel@lists.xen.org; Wed, 14 Dec 2022 04:59:51 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2289d46d-7b6c-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 05:59:49 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id t2so2195050ply.2
 for <xen-devel@lists.xen.org>; Tue, 13 Dec 2022 20:59:49 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 e8-20020a170902784800b00186c3afb49esm739019pln.209.2022.12.13.20.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 20:59:47 -0800 (PST)
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
X-Inumbo-ID: 2289d46d-7b6c-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bFucnG/T5ns6x7NB4ooMO+qUTJtpLJD/hjTYgeTpV6c=;
        b=DKDR9LADKPrbVlwWP1byp1idfp8K8KCbnJckhpMlpH/zxD8adyeg0fLGz/MeqCEfWN
         eUfjWgEgG3EaIioNVFdGA18w2+CPTFM7u0mj0+aUfBd0u9IHkvv7q19G3a6kNeHJJ9Dr
         CEIHTN8SnM61ygS1Srvu9OiyVUrT/V+kV3iZ8w2PewM8JKROLApvAYbK1lFpK4B7abyk
         5C0ts5KhJUnyVCN0pcP66r9ZGalmbMUtuOBFTL3c3b0Wh9nII5WSszq8gZMxlR9wngnp
         /VB+EK+j5D0LOC/KyDXV8mkRtTUG+3EaQlBLJO+zoTYOzWfxhJD02OWTY24lOu9yhlkL
         4pKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFucnG/T5ns6x7NB4ooMO+qUTJtpLJD/hjTYgeTpV6c=;
        b=RAc5T3SXddU14wGpCt7VL5i6OBB/irRjfOrbNxDLk4pQYEIaqv7Jg+QiHwXTLoTHre
         EVt45LHj9OJdJosIxkbyKpWqp6/ugZEa8EJnKV1x4KUN/L590Fg9DZUpUTCG60KKlpij
         7M5T+mttxc04uKiEPJFqrgsnvCxj3Er/Y7YS+U/eP+W/o+eV+lchqDxkXjag049E5iBA
         jVTw00AA5rLcI8GJC2jIASUfdSNJlokVu6QmX0xOsuL+lHYBvgkOygEBNrF+VRdAHQi5
         o306Ng2L/lWd2ew+UhohpskfCkqtBtxHe4VXwtndFGj04Yvupg/Rjs6P7Q5s1OQlfIk+
         qLmw==
X-Gm-Message-State: ANoB5pmCwxx2+eDExXyFZKMh/ByGgOUKmmQGuGFG3FVypvdcz6gwjW5l
	qdi2LI6i16+8grChDdZof15HDg==
X-Google-Smtp-Source: AA0mqf4xb3MW6vOCu8qynEBlc/B81+UcHTzgvwFOnt0Wc3701E6PVCXzjNeJpuKZVgGo0/mFGF+DxA==
X-Received: by 2002:a17:902:cec1:b0:189:cef2:88e3 with SMTP id d1-20020a170902cec100b00189cef288e3mr32654790plg.57.1670993987873;
        Tue, 13 Dec 2022 20:59:47 -0800 (PST)
Date: Wed, 14 Dec 2022 10:29:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH V9 1/3] libxl: Add support for generic virtio device
Message-ID: <20221214045944.bu2vxk363dlxcksq@vireshk-i7>
References: <cover.1670925998.git.viresh.kumar@linaro.org>
 <01dfa7692457a7f40255645f5239f74797e6db3a.1670925998.git.viresh.kumar@linaro.org>
 <36e4038a-d394-62c0-3bce-1c81450c6bb9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36e4038a-d394-62c0-3bce-1c81450c6bb9@suse.com>

On 13-12-22, 12:14, Jan Beulich wrote:
> Please can you arrange tags in time order, which would mean R-b past any
> S-o-b? I'll try to remember to swap them while committing, but in the
> future please save committers from needing to do so.

I was confused if Reviewed-by's should be after of before Author's
signed-off, understood it now. Will remember that going ahead. Thanks.

-- 
viresh

