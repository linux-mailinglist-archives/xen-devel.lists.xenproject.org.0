Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4695A1030D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 10:33:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871064.1282112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXdI1-0004Je-BF; Tue, 14 Jan 2025 09:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871064.1282112; Tue, 14 Jan 2025 09:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXdI1-0004Gt-8N; Tue, 14 Jan 2025 09:32:49 +0000
Received: by outflank-mailman (input) for mailman id 871064;
 Tue, 14 Jan 2025 09:32:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIyo=UG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tXdHz-0003ZR-SF
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 09:32:47 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83dde6de-d25a-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 10:32:47 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab322ecd75dso120685466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 01:32:47 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b7317sm602044066b.154.2025.01.14.01.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 01:32:46 -0800 (PST)
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
X-Inumbo-ID: 83dde6de-d25a-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736847167; x=1737451967; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B9S6pdDsNCp33mtAF7/BbRjeEO4D+sXhz+vsHSrTIR0=;
        b=Zv7GH+WtwUBfrVOE/SsskghlwpSszRchm1HkGfzGqi5eMZigD96gHezqLrsaoLqtMG
         Mmn1wb7fH31I87kpOzi5N9B5I8hiCBb0hOQCKJ09aAmvqbouILjTJhykISF4gDQjPJdJ
         16Wf+ME1NoC+9078dDbJL/eueSZRmHbNKrtgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736847167; x=1737451967;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9S6pdDsNCp33mtAF7/BbRjeEO4D+sXhz+vsHSrTIR0=;
        b=m5mFoJPxzEQSqXaE7I8PbkdE0rCn3lncAVk2IACV4JwyKfsbRv704tIE+LmwikYsln
         4bdppxfs53vWEBAyGLQdongvZLlITljArTr3pQNSNK1zHTSlrwzL6eTtrBkZ6SdRGwmv
         VJVd6yjhj8xHGhPldlBVPCFHoUOCR5Vyo6qRaA6IMqBilIqh0LQSDuc4NAuPGhWU7vRO
         B5Vv+4mIyUuBOkeaE2p6TIGIwCeXLBf+HteOdA0k/WJuT9ggnRi+Tk0GJwhQ5se3GBip
         CZ86DtY+1wePuMmBQWf2UX5fU6b8j48455Kk8ztKNChAELgFt34HuFCMo/P2sB4mR+YI
         54qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV30JxX9pZHI0o4HXp+gcGvm1yvXGb4IakbB+nr3D4A33LBhq94bhDdWeTNr46dlB0q9Dd5nK9dzyE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4GZzvAob7iviGFko4JO/vH8JiVkM4bZGYw8ZDhHP4fOi9cKzq
	h5dsGKwQ5Pfn/WeSX2AMm7OqQacst9PW2UJ0wq+m/cBkVoRc5716nK7HwYr3+Hg=
X-Gm-Gg: ASbGncs+084Z3uW6Ken4tgLDBw+DxADMkH4Z8iyfVOHb6bd7R5cSe3noBOQ4cXJmoe/
	0Ia8JcSEXgs4PzrzSwWsXEkQ9Np4LhLDEc2EZAY2H4B+eXrPU0DOm0UibM09JctId7Bc1TcEPOL
	8hVO6bJCvYvJ3eAOqfR5muCfpshKZ691mN4s3CQzLt0q72gnnOBsmD5RmJDFbqm/4OZD5TKA1tn
	bJh75mCuTyCidZQCNjtjGf8misOFumvDRN1wJKF181D8YYsRM0P/y1B4M0ykdLdgvelTgQaXoiq
	EvSfHxOyvqV5sjHMzw7x
X-Google-Smtp-Source: AGHT+IGt/EWC+NrUj3u542WA/piYX6HYdLSvUnDhmt7XC/QzS6Qd60I9LSfv8KeO4rNFoU8q33tDwA==
X-Received: by 2002:a17:907:c1c:b0:aab:882e:921e with SMTP id a640c23a62f3a-ab2c3c63988mr1917154966b.2.1736847166868;
        Tue, 14 Jan 2025 01:32:46 -0800 (PST)
Message-ID: <5b6b1ad2-c0cd-454c-aa7c-b6de37ab39df@citrix.com>
Date: Tue, 14 Jan 2025 09:32:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add/enable stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/01/2025 4:25 am, Volodymyr Babchuk wrote:
> Volodymyr Babchuk (4):
>   common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
>   xen: common: add ability to enable stack protector
>   xen: arm: enable stack protector feature
>   CHANGELOG.md: Mention stack-protector feature

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

There's one minor formatting error which can be fixed on commit.

~Andrew

