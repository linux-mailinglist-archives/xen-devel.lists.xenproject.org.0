Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4424DAE63FA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 13:57:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023620.1399617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU2H1-0004Si-Ol; Tue, 24 Jun 2025 11:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023620.1399617; Tue, 24 Jun 2025 11:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU2H1-0004QY-LL; Tue, 24 Jun 2025 11:57:11 +0000
Received: by outflank-mailman (input) for mailman id 1023620;
 Tue, 24 Jun 2025 11:57:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X7et=ZH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uU2H0-0004QQ-HE
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 11:57:10 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5937e8ce-50f2-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 13:57:05 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so2950953f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 04:57:05 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453646d156esm142032915e9.11.2025.06.24.04.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 04:57:04 -0700 (PDT)
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
X-Inumbo-ID: 5937e8ce-50f2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750766225; x=1751371025; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GMmY3CBjs8D7xUSCbldFoiZAUzdH0S+Gn6QAcfdKT8s=;
        b=LnXWinTpury5AaZgCglsgjV2qJ5UIM4lgok6ZSr0hAVWCe/qsUOumfKuWx0SNuzJQS
         TubhwF0ksGDoQrC6Vy87qJESsU8IWOv5Xa5v7csbLWY8t0vMKqcA3PyHl8Y7Yq7oCOQn
         cD5Rh+A+lVpQEY5B1XH2pQx8vIO3eUYOWlu7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750766225; x=1751371025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMmY3CBjs8D7xUSCbldFoiZAUzdH0S+Gn6QAcfdKT8s=;
        b=s8rzBx7X5gR/AcPrFEcMwO+e+3LWVlgWMrPaTg5GUAAxZgBWhciT0rcCWWXOeEKaSc
         tyqXz+EVB8y5Uu6xxjAZqjsz7zCSkLXTfH+Ds/ky7jEKqqFmmuNgn2SVmyEnE3WGzdMb
         YLwA/4JO8rcivadmp7nLJbrPnhOZWkvVxx9B7nAHTOMLHiBGwsL/c9/dgLvTzS9thGc4
         XNamEW7V+PePOx7wuxg2ORcg59NB/6n7E7DJ1bkAx7lWhK4pS2mvFFESB73eZTj9LVbA
         SYZyP+jvaMNxK6w2V93nPUBaEZ4k5odGUtsM94goVp4+eu8BbSiq2SFfuzMfEgKYn9xK
         +neQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7pp9oNZYiYH0D/lhYSL/9ew5Ws8vo7X7iBJ4hElOBFRbbwWEhj6wGsi2eo+1f3yc5jdbUh3ppC0Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzf+68tp+iA7L6aKdRd1GkFqeTsWgMLAree02A3sYs39rJMcGSB
	lRhrw5Caq6QnR6v8WGlgTCUsEx3g5FPb441YU8j+3nxkY2dHkIsrPhmwcjjF08BzHvU=
X-Gm-Gg: ASbGncuewB5te7ZPqENEJpUI1Mvh8NtCgx9yD+A24fhBcPoSNfFkbL+tAddKuYR12GK
	M0K0HP8M+cRNTrf+8CmrspcRLgf8jI/J56IuXDnHoWzm/96zrshAiPYirtLzLdjNy1ZzFObBQar
	+/PqLUUD+cNGfwq8AuB7Z3pwIBTZ2DF/zWgXaA0O1fQ5CN19jktEKAB15LEJ+VlgllGqzhMroY0
	ntpRFdtOzSfaA9Z+INTqFP/kHNml33VM44rBknH+V0hL7i9i9Aw0Q9X2aPvQ+grzD7RpOV6f9Dj
	CSUK0ulDtBv0XYbIxb61A0mEgz9SA5kDq5XVjDm/HX1NXYcWn7MSZnnFcNX9LKs7xYWTl1jUojP
	Gy4ldTG2jTVrgcd4VTyO+QYazwF8=
X-Google-Smtp-Source: AGHT+IG6VRMIM+zUTo/aiJ7hnDlIwiyveHuxH3f+2ryO9hMC++NxXCn64Cu/4aNo0aUF/q0i5WJJwQ==
X-Received: by 2002:a05:6000:430c:b0:3a3:598f:5a97 with SMTP id ffacd0b85a97d-3a6e71c5b60mr2332889f8f.9.1750766225275;
        Tue, 24 Jun 2025 04:57:05 -0700 (PDT)
Message-ID: <c3f0415a-3a91-4a23-81d7-8e913e4a8f7c@citrix.com>
Date: Tue, 24 Jun 2025 12:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/efi: Do not undefine not defined macro
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
References: <20250624114529.34743-1-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250624114529.34743-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/06/2025 12:45 pm, Frediano Ziglio wrote:
> The "buffer" macro is not defined.
>
> Fixes: 59e087bf6a9c ("xen/keyhandler: Drop keyhandler_scratch")
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

While correct, the grammar isn't great.  I'd suggest "Drop stale #undef
buffer" for the subject, and "The "buffer" macro was removed when
keyhandler_scratch was removed."

Can fix on commit.

~Andrew

