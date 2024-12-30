Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE039FEB30
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2024 22:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863616.1274990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSNhT-0001T5-3n; Mon, 30 Dec 2024 21:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863616.1274990; Mon, 30 Dec 2024 21:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSNhT-0001R8-15; Mon, 30 Dec 2024 21:53:23 +0000
Received: by outflank-mailman (input) for mailman id 863616;
 Mon, 30 Dec 2024 21:53:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X1cU=TX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tSNhR-0001R2-B7
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2024 21:53:21 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b1ae4fc-c6f8-11ef-99a4-01e77a169b0f;
 Mon, 30 Dec 2024 22:53:19 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-436341f575fso100115095e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2024 13:53:19 -0800 (PST)
Received: from [192.168.86.29] ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c848a47sm30712508f8f.62.2024.12.30.13.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2024 13:53:18 -0800 (PST)
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
X-Inumbo-ID: 7b1ae4fc-c6f8-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735595599; x=1736200399; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gZUi7UGwaKBR6JJvqimj61FdN9dv/1BvOOvYzpiO8mw=;
        b=GYtGnlT2BIJ1LaHBw6NBSTJa8aD8WVcMDsqwUnQ601cdw4T5HEzkJFiAfEu1dx1qs0
         gG4el5GWgia1Df0+F+2xBzW1slKfjKgcSAxt10c+1XFPJ5R4rApVxO/TZGINnaiotoJb
         kp9gpptLhwJA0SrLoaEwRRgrc+L2y4KEr7QQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735595599; x=1736200399;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZUi7UGwaKBR6JJvqimj61FdN9dv/1BvOOvYzpiO8mw=;
        b=XFMGTklkWORfH+6f3d8x1oz/7Rmnrqv9FV2lPJL1YdwM0wmN0ROs0As/zb2oqlbBkG
         cF9FVJv6cHTGvFDClhXlit51EyPPSw9XF/3H6iglmeG/vtA56PLMLlvjNDpb3cxChXMe
         160XSnGKAUjyc9CwZHz4QOEWCiXT722H/E80gcy1CGs8b3ZqPf3Rp7M3+lfb5n5jdGK4
         uExkH+YMNs7AO83b3aopmU6erSSY1IjdsvBr0a3qdx542Toa71e8emcn2Rje9UbROV4x
         SazglqYYPkk2yhGOhOguddnlnt081ggk18c/2ehWM6uKrWSzSAX/tRfx96SvmOFMF792
         buJg==
X-Forwarded-Encrypted: i=1; AJvYcCU3FJc0sQfwOyHYthPpOUAJkiE9PhavtfcSEkpcvLwCYxMh7JRtyt8Iv80h+X1VaVUjDtRGZ+qxMS4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcPV59w4UJPSrqozwzlC33GasyHOk7w8fCe19xXboQLiW4g6DI
	ZOdlaziwXi9hRF07HcomoyLGhmjlOH2HUDG0VslNY3fTPacESWPIxLyGHnPzCtU=
X-Gm-Gg: ASbGncvmo/mYkSH40AG3q7dwFdKIZEsbYRZS5TafQKmlF8fkmwuF/cpooK+zBHJolrr
	5TZC+ChghV9ecPay4y3T6yD1oUkae6+92+L6M6+WnpLJxXgSGZsnuROGYSZ49qPfyjm6b/zQl6x
	lOWHFRjpN169fxrTclFC0FzB5R/vzgGiaUsGUaibQnZWIg2I3W5gRcaa1jlXbRQQEcyAnx/KdBB
	ys/qnvrs8H6KdElf1PHoK3MPcvRRbswI1Zp30IBa0ITQy80hqjLTsfJDVOuUgEde08=
X-Google-Smtp-Source: AGHT+IENve12XVoRefxMJ8ewLR1XlxsqmyqFV6gzFw1auS5A1JNTDhQ4BY9Ojmmyz2NUUBTH3aiSBg==
X-Received: by 2002:adf:a445:0:b0:38a:2b39:9205 with SMTP id ffacd0b85a97d-38a2b3993dfmr23487729f8f.33.1735595598673;
        Mon, 30 Dec 2024 13:53:18 -0800 (PST)
Message-ID: <5e4c9b33-7250-48b6-9a35-6ca4ee9342b8@citrix.com>
Date: Mon, 30 Dec 2024 21:53:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 0/5] Fixes for reproducible builds and other small
 fixes
To: Maximilian Engelhardt <maxi@daemonizer.de>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>
References: <cover.1735585600.git.maxi@daemonizer.de>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cover.1735585600.git.maxi@daemonizer.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/12/2024 9:00 pm, Maximilian Engelhardt wrote:
> This series is a bunch of fixes we found while packaging Xen in Debian
> and we believe they should be best addressed upstream.
>
> We have been carrying the first patch for a long time in Debian, but it
> seems it never was applied upstream. It's an addition to
> "docs/man: Provide properly-formatted NAME sections"
> (commit 423c4def1f7a01eeff56fa70564180640ef3af43).
>
> Patch two and three are fixes for reproducibility issues that I found
> using our testing gear in Debian.
>
> The last two patches are trivial fixes correcting two common typos found
> by Debian tools.

These are all very simple and obvious. I've summarily acked and taken
all patches other than 2, where I've got a question/suggestion.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1606875387

~Andrew

