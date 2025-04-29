Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6B2AA0DE8
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 15:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972684.1360995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9lNM-0002TA-Bx; Tue, 29 Apr 2025 13:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972684.1360995; Tue, 29 Apr 2025 13:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9lNM-0002Qu-92; Tue, 29 Apr 2025 13:51:56 +0000
Received: by outflank-mailman (input) for mailman id 972684;
 Tue, 29 Apr 2025 13:51:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPhw=XP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u9lNK-0002Qg-M7
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 13:51:54 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ae6c14c-2501-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 15:51:52 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso68482165e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 06:51:52 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2d8842sm189068455e9.31.2025.04.29.06.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 06:51:51 -0700 (PDT)
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
X-Inumbo-ID: 1ae6c14c-2501-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745934712; x=1746539512; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2/y6+2INwKNSQJaEbtVTz5eKAdaGP+Eyy7WDmS1Iqg=;
        b=RsAQ6ssaXb3qyRnlbK0DbzDMOTXL7mBc0SGgx0HPPBz87/VAy94ac+35EBPR+QwXp4
         zYN7EkNfcYowYx10vQ/RGGvtRgNeaHaZCwgt27lBCfJ1LU/kt5NIplASopkX+eUOLJ5a
         2mhi4xyfNQiIU3fQxnStWL0ciYVjdIeYbfvx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745934712; x=1746539512;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2/y6+2INwKNSQJaEbtVTz5eKAdaGP+Eyy7WDmS1Iqg=;
        b=OfkW+fmCAx8fTgRCeKzSuT/RpkNhiuIqdtWDNLIhoS6ddKqzdIFxfSEJZJTWxl64wd
         XFkRvmGsByKj8M/OW1VvfN+Ik5qRZd+21mA80Kfj9fvfrxriGnp7qskFS9rrh7+awXwV
         7lRzr9mF0YV8qZ9F7TAmjO32+WXmvEwro9gfb3ymjwNriFM9B5Vl0b3HrzUhU4n7cfib
         OhH+TTftFJeuJ8yh3/3jco6iGRyWMl6iAJlXjSGsSptcFCdKGLY8Op7gEpr84XE+wWVY
         Qqydgr/eoHaAOtgZxGf9+4l2I8ImnP2xaAVMfBycmcZNVihGctXtD/bs2t4uCbo56I2L
         N9Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUlFYKfJ8Er940Pv9703qeHmFSSzCf6FdkRlrG1CHG9GRVxE6NtOklx44Vh83gns2Ne32+6avxTQ8M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFMklkvEaJ7FKLVPKJL4rK+OzGkzGFKZXuh8rdQ3zSETDj2n01
	DBiIyy+LtSxwLDm/FARwcCVqO1WzkwyR8wFSRZk5QUu+LZnAQr+fujWfJ04bUjWrj9VVw7AFhWQ
	j
X-Gm-Gg: ASbGncvRoVqzgg5cgkBgBJjoCqd2CqMWOFPPUZYnKkl10i2U//7CMJbUuhBTCZDQPWs
	/O/ldKkFBOD5Lr5M/JxHnFVphA0hJs9xeUTirNENnsnRPwLjFI3emtoRZ6J9P9SMJxFdBscGIzW
	3vbtr2GT9avAirBKs+fTmo7a+cS+D96gCURpbP5Elffng9ulQ0HAyr9uxZB/Olyos3w7zmFJmm3
	W+EJbGt4axPZOoTVnxWLSvAHvuDhzaCkpqBVPW+BywHUP3yHxgOBLwVBsZHFf0G9Ox/PqqBsUIO
	YEI7VBVVvvD4TWV73wSrKZTzC9aImijxuzcLU52oK9BzdFoGWHClHnKODPYGbXyarKmX5kj+FcF
	t0n8XPg==
X-Google-Smtp-Source: AGHT+IFE9u+uIgHB/+4VO4+ms62KFS3vDeYHSXIH89ZJgchqt7zf9n6D7HsxXTdzCLmrmF5VYA/9iw==
X-Received: by 2002:a05:600c:3b0a:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-441ac84b420mr28506545e9.1.1745934712130;
        Tue, 29 Apr 2025 06:51:52 -0700 (PDT)
Message-ID: <89c5128d-173a-4c54-8837-f4a23c7b5fb0@citrix.com>
Date: Tue, 29 Apr 2025 14:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: use existing local var in
 cpufreq_statistic_init()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <4054b780-2b42-4d56-ba3f-d56392c8ab4a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4054b780-2b42-4d56-ba3f-d56392c8ab4a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2025 2:38 pm, Jan Beulich wrote:
> ..., which actually also helps readability (imo).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

