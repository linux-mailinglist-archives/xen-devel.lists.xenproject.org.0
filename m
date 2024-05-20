Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553048C9DA9
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 14:46:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726080.1130330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s92P4-0008JB-Mr; Mon, 20 May 2024 12:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726080.1130330; Mon, 20 May 2024 12:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s92P4-0008GG-Jx; Mon, 20 May 2024 12:46:10 +0000
Received: by outflank-mailman (input) for mailman id 726080;
 Mon, 20 May 2024 12:46:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ccuw=MX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s92P3-00083S-0M
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 12:46:09 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eada3d34-16a6-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 14:46:03 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34e0d8b737eso1304643f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 05:46:03 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354c9bcaa98sm1671106f8f.4.2024.05.20.05.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 05:46:02 -0700 (PDT)
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
X-Inumbo-ID: eada3d34-16a6-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716209163; x=1716813963; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jxUyZpN1suFKeFoxu2f1Gn72DbRiYZT0++YwB29/0cE=;
        b=oBn/CDdug4DnaWDkHWuo8akoASPhwRhixVH8k+01bIpAl2yn/KxKGBsCsX16VUcFGR
         Ou6OQLKthMqN4HrypwSdSoENY+ldaf+M+M90STYfkyNG3NHfUFgnZEtDmag/wIc/MI4l
         SqmwXhGcEUL92AmtjmwYWKp+Pup7w8vbjWDJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716209163; x=1716813963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxUyZpN1suFKeFoxu2f1Gn72DbRiYZT0++YwB29/0cE=;
        b=lZtUZ2Zq383NecQZqkNN9UVyCF3lzw6StzHRxyCyYt/f1vZZZQflKnJJfgGZtsV0as
         pOfP1fOWJR8d6XHjr4aVaFcGBoKHfgE7X0Kjg1Mu1ERfXdIQ83x8VHQniVbn+3nXvFSR
         WHbDDSebVyBO7cixEoVwD6hYIWkythlYeA9D5PNkkxDojPftQ+QR9ibC5hxsMPlz6rTl
         /MJH9X5H0fBlV8Gb6KtEdgwPJa0McBbDqjLE2sKcdjtr/44PCVGEQ1HZ4AJS75Bzwt1L
         CqgoY20yEXp/IvWAUozO4r9jqV7ZLbcJ9RJ16ugodE0lT4Wqc8sPPtKhc/PdGz+gT8Id
         QAXg==
X-Gm-Message-State: AOJu0Yzu92mJ154ERL2qPxzBf06dTNqXJgpStyAty85A03M0Cz/DmekZ
	S5z+ojCdQ96259KpmH+FyWPc0xvetOCtzfqZQTmCKWGP/DBb/SxXdvJO8UZWUxQ=
X-Google-Smtp-Source: AGHT+IHb8piXZ+JowYCnYQ3dkHmRp6lGCgfHkOv/6sKzFT+fUMotKMhg6umOk/jrHxWZNhxFxjtKuA==
X-Received: by 2002:adf:9797:0:b0:34d:10a9:3a22 with SMTP id ffacd0b85a97d-354b8e377f5mr4745377f8f.32.1716209162779;
        Mon, 20 May 2024 05:46:02 -0700 (PDT)
Date: Mon, 20 May 2024 14:45:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 0/3] Clean the policy manipulation path in domain
 creation
Message-ID: <ZktGBkfwxEzrbojw@macbook>
References: <cover.1715954111.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1715954111.git.alejandro.vallejo@cloud.com>

On Fri, May 17, 2024 at 05:08:33PM +0100, Alejandro Vallejo wrote:
> v2:
>   * Removed xc_cpu_policy from xenguest.h
>   * Added accessors for xc_cpu_policy so the serialised form can be extracted.
>   * Modified xen-cpuid to use accessors.
> 
> ==== Original cover letter ====
> 
> In the context of creating a domain, we currently issue a lot of hypercalls
> redundantly while populating its CPU policy; likely a side effect of
> organic growth more than anything else.
> 
> However, the worst part is not the overhead (this is a glacially cold
> path), but the insane amounts of boilerplate that make it really hard to
> pick apart what's going on. One major contributor to this situation is the
> fact that what's effectively "setup" and "teardown" phases in policy
> manipulation are not factored out from the functions that perform said
> manipulations, leading to the same getters and setter being invoked many
> times, when once each would do.
> 
> Another big contributor is the code being unaware of when a policy is
> serialised and when it's not.
> 
> This patch attempts to alleviate this situation, yielding over 200 LoC
> reduction.
> 
> Patch 1: Mechanical change. Makes xc_cpu_policy_t public so it's usable
>          from clients of libxc/libxg.
> Patch 2: Changes the (de)serialization wrappers in xenguest so they always
>          serialise to/from the internal buffers of xc_cpu_policy_t. The
>          struct is suitably expanded to hold extra information required.
> Patch 3: Performs the refactor of the policy manipulation code so that it
>          follows a strict: PULL_POLICIES, MUTATE_POLICY (n times), PUSH_POLICY.

I think patch 3 is no longer part of the set?  I don't see anything
in the review of v1 that suggests patch 3 was not going to be part of
the next submission?

Thanks, Roger.

