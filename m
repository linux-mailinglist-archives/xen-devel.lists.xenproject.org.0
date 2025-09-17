Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D437B822AD
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 00:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125844.1467667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz0hu-0006dx-3O; Wed, 17 Sep 2025 22:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125844.1467667; Wed, 17 Sep 2025 22:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz0hu-0006ao-04; Wed, 17 Sep 2025 22:32:58 +0000
Received: by outflank-mailman (input) for mailman id 1125844;
 Wed, 17 Sep 2025 22:32:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Emon=34=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uz0hs-0006ai-VB
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 22:32:57 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40efcef3-9416-11f0-9d13-b5c5bf9af7f9;
 Thu, 18 Sep 2025 00:32:55 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45decc9e83eso2923565e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 15:32:55 -0700 (PDT)
Received: from [10.10.152.155] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-330654bf948sm152653a91.0.2025.09.17.15.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 15:32:53 -0700 (PDT)
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
X-Inumbo-ID: 40efcef3-9416-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758148374; x=1758753174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xv9UNWdjEKb2GbD8pgOSbR6qFEwUYZTltwPh071cC68=;
        b=b9N+Xg+5K2Lp7Zs0TAqedhjU0BpqMFQZWxYqi2nqeSjpNhyv1ozvq2sbc7b8+cXmPg
         DCSu2NQ7X7Ufr/pSHY5LTkOnw6iDUqLB2dUlicSEXH/hWJuDT1vV1Tc3wY1PhxnQo9Zr
         AZyzK28wXa1tQgtwrIPuJwsloQIoWCT782Sw2D5sJURDUQahmBR5gQ8Mce/j+jp/2OzO
         krG6AelPcC8ebeDCx7Vpg6QMLiZI1k/dqPugDUvWEFUUu1SgD5u69M0jdcvVkiumFSeV
         eW4cpsT6Ej89yCXJvcT+ESkzk0msYJZgaZsT47pNRRdSKMsrLuiuM+KtKv7EN7FyG3/i
         RfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758148374; x=1758753174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xv9UNWdjEKb2GbD8pgOSbR6qFEwUYZTltwPh071cC68=;
        b=bC/PVYJtiCjyYttUX0EoQmYJ9Ux4WGYXC9bESE6/cczWm78RjI8gr2jssfXTAi6Yrx
         /Moz6SZbb7K/Cn2rHdw9Q2IoiZPBduhrMIFaRhZuF8kiINTQyDbrIzLd3d5p2fUt9LWd
         0xnHOK822h3aN61Cr1X+sYvSmBwqOE/Y8kG7VIfIOb1gXRXxDjUS0rrqi/x6vWpluUQz
         V59W9lVPcKBj+D4CQdgYHern04l0KFtCBAR27oiEdAaxmWAV1C4r3+NwTuJPhIdVb508
         qFnBk7shdr/017sRilZxfh0mEmcWUWRKVTgWgW66f3wprAIXIINt5KZ2e3NfFTkl6o3n
         1d3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUC5t2xL1JaVf30KCgdg92Ur8MQBPDzjoi8vz2Ilyo4DNJUVLiK3apCK6MFzAukb6D89X2hy4maoA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywyK00P5cUE/ryXvpWQ//BhXC/YApL91sZvl5jf4iKK4womaX0
	cxb5fiw3MtnQPEZeysAlinDfAyE9CuPYiY95Rx0QVPkG5KQJqUIygOw6SMNVxCB67Q==
X-Gm-Gg: ASbGncs+KBkwDPaNsOIW4vixAidzAVUi4jeGyBO1sjjGD/b51jro1NiC03dfb6PNmrH
	MXNX7owOE2E3UevDVoUKsK04iijyVEGykp7d2Eb0kP7XOMXyASEWyyrQVNGyqYOtjVNO6BGBoYa
	OR/Hu1QoYLloTftHmInJqwt92zGW679yDQ9GXpWcCHaGms54jJQinQks3bJcfPeq4YvWsRtDAIh
	/X6YXbjVo4VSZGLxZiVFMxmYuhzjOsMv8nigJkBgFOOrNdEduIaHJG2dG4n6kHs291/zVm7QOna
	NgwH70+ml0ib/vwjpnkWJ9dKGSFhjg61iZ7WMQFUvz4vdcEdiJOeY2r6D819iA2kGTjFyO5PH/i
	Ux/UcySr4k8Y9jCm3PuJ0RjD+FQca/lLYtzuPYQjBgXLjeSpG2a/4
X-Google-Smtp-Source: AGHT+IGXC2D7CFFsIFWdM9Glpt++oKHeAvZAWq08Absw9NixPiV+85/2P0qLG2UDc4moJ7VEFuTsmQ==
X-Received: by 2002:a5d:5888:0:b0:3ec:a76e:95d6 with SMTP id ffacd0b85a97d-3ecdfa3f97cmr3681386f8f.55.1758148374344;
        Wed, 17 Sep 2025 15:32:54 -0700 (PDT)
Message-ID: <d03896aa-cfc7-4bce-bcb9-dee5ad138466@suse.com>
Date: Thu, 18 Sep 2025 00:32:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH] build: Require explicit .config update
To: Anthony PERARD <anthony@xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250917214519.64323-2-anthony@xenproject.org>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250917214519.64323-2-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2025 23:45, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> It is sometime unwelcome for the config of the hypervisor to change.
> 
> Make output will be something like that:
>   tools/kconfig/conf  --syncconfig Kconfig
> 
>   *** The configuration requires explicit update.
> 
>   make[2]: *** [/xen.git/xen/tools/kconfig/Makefile:73: syncconfig] Error 1
>     GEN     Makefile
>   /xen.git/xen/Rules.mk:19: include/config/auto.conf: No such file or directory
>   make[2]: *** No rule to make target 'include/config/auto.conf'.  Stop.
>   make[1]: *** [/xen.git/xen/Makefile:620: xen] Error 2
>   make: *** [/xen.git/xen/Makefile:179: __sub-make] Error 2
> 
> This also prevent update when the toolchain change and change CONFIG_*
> values like CONFIG_GCC_VERSION.
> 
> Proposed-by: during design session
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> ---
> 
> During the design session, the proposal was to compare .config before
> and after syncconfig. But maybe KCONFIG_NOSILENTUPDATE is enough?

Didn't know something like this existed. It's sufficient imo, just that
we don't want to apply this mode unconditionally.

Jan

