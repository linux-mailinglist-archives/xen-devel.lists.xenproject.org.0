Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0DCABCED7
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 07:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990436.1374378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHFzP-0000nh-Dj; Tue, 20 May 2025 05:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990436.1374378; Tue, 20 May 2025 05:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHFzP-0000ky-AJ; Tue, 20 May 2025 05:58:11 +0000
Received: by outflank-mailman (input) for mailman id 990436;
 Tue, 20 May 2025 05:58:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHFzN-0000ks-Nw
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 05:58:09 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67934790-353f-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 07:58:08 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ad564b7aea9so388635866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 22:58:08 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad53603a369sm641502966b.47.2025.05.19.22.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 22:58:08 -0700 (PDT)
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
X-Inumbo-ID: 67934790-353f-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747720688; x=1748325488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnZUd73vdE6oubGO0t5uW1E2L4TvTC2C5MtnX8ISUY8=;
        b=dN91jy3CaUzxDdu1FTu43mtskbYEisSn7gf1iZpkV+SyNnUt1ORAOPdV+0Ffk26gN5
         CMHHa31M7bSOyB60AMIXbNJqdp4eNOE7qNMjiJMAPO1j5h4mp8uCwFVLr2rVml+gkmFF
         5mwBPGSl7Uy/swRdu+nqNmV52IXCYcUJ/q9ik4MW0MLe5bGFmwoNOLH5BZ7m/g3aHYU4
         QJnQ3KMZYmVDnLtQHybMM6ABZpW6Illl3Nm8ApxTDEYwhtb9d17/5tmW2k+U5qr4FJfk
         OoVvHrOgEMpoyK30fkDm0R2MhCZyWAOgafeC3qOciFssCLdkeusQMW/5PrwjpSGoQ6bp
         mDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747720688; x=1748325488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnZUd73vdE6oubGO0t5uW1E2L4TvTC2C5MtnX8ISUY8=;
        b=dF3f7WEydAy3XPBVo7H/Xe2jeIdXEenNvN+0CUle3oQgY2LWpe45Ha+IPSinr5MJk3
         5sN2V1GC4UCWG0zkt5Z5nD6ZcvSAfocaOdjUq0yNvuJBotBuuyhFGw+zKywnpUjnE3HW
         IdPlCf+MYwzzuONoOzhDTawAE8M75CGRlbNCEQr4sovglDSpJzBY21ca08RQvx80K79F
         QMHyEA7Oo8Ao3OyMfo43eZpordJkowvkdeYoSLoR5LHBWNrh6y9Vcor9v7eYiUhwnWI4
         ncFGaKWHM5mF7iBr6DUJckCCwPS6jYY1uSBe11OsGyjZyrTnP9OVi7IS1LYDH4Tdd1v2
         Zrxg==
X-Forwarded-Encrypted: i=1; AJvYcCX4HhGu8+WoP58BGR4csAeDd2OOuG2cP1XDRgAPGyH8lkVHvsydCwFBl5Kqv2kR33mrkCQhYcM/EYY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS34b1uMwICnihJf1v1tAugR9bDA0cWHgg0ygfnjeAcVqPUIb/
	SphosnDwI30cRvln6x6kxB59rEFyUOSXSoFjHJnLLem0HeqSUtgFamcyeEUq9twfww==
X-Gm-Gg: ASbGnctTkPn6ddP+2alyB7kO7gsWGe28Lw7RhMC4+jxDnmdldM1DeSBS71rpy/uqZm1
	y/DFFGumfh/VJavmBNIrbN5DgjjtuuLZ2q+bLkgLiECwehgipVQiRjz9zHneiqj74LfFd52rlAE
	4SDgOaElHKzRRNQ/X5IMUgya4UuDCnHkNma851SCm927QG+cL6zgHMKJpf50ov3AqtmN6P3uyf3
	HqupWzm6wBo09lvGw4xB4comMypWbRP5NQNZb18dMzF3DCOlNY9GXymbtYAECmgMPA1++WTYnXp
	Pyd8mdkjhkZwaM4JL0Pwoqx7FIFAMTZORW9g4ju3m2c9RbKCzcvw7357rilDvA==
X-Google-Smtp-Source: AGHT+IG8T9dluX0LCk1s16OYBphhaFtaTml++AUHKYtxZCv2QICNleZtqdtGFlxdTAeIXMAX1fyVTw==
X-Received: by 2002:a17:907:1003:b0:ad5:2c8d:6f2d with SMTP id a640c23a62f3a-ad52c8d707bmr1105741066b.28.1747720688242;
        Mon, 19 May 2025 22:58:08 -0700 (PDT)
Message-ID: <b72d5119-de76-4606-adfc-b8dadae81b27@suse.com>
Date: Tue, 20 May 2025 07:58:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] xen/domain: adjust domain ID allocation for Arm
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250519192306.1364471-1-dmukhin@ford.com>
 <20250519192306.1364471-3-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250519192306.1364471-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 21:23, dmkhn@proton.me wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -2424,6 +2424,9 @@ domid_t domid_alloc(domid_t domid)
>      }
>      else
>      {
> +        domid_t reserved;
> +
> +        reserved = __test_and_set_bit(get_initial_domain_id(), domid_bitmap);

This returns a (pseudo-)boolean, and hence the variable's type is wrong,
as is ...

> @@ -2439,6 +2442,9 @@ domid_t domid_alloc(domid_t domid)
>              __set_bit(domid, domid_bitmap);
>              domid_last = domid;
>          }
> +
> +        if ( !reserved )
> +            __clear_bit(reserved, domid_bitmap);

... this.

Jan

