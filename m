Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0258FA12387
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:08:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872408.1283374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2Bu-0001gx-Pl; Wed, 15 Jan 2025 12:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872408.1283374; Wed, 15 Jan 2025 12:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2Bu-0001dn-MN; Wed, 15 Jan 2025 12:08:10 +0000
Received: by outflank-mailman (input) for mailman id 872408;
 Wed, 15 Jan 2025 12:08:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmQ5=UH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tY2Bt-0001da-ER
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:08:09 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 618e1cef-d339-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 13:08:07 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab322ecd75dso146704566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 04:08:07 -0800 (PST)
Received: from [10.81.35.177] ([46.149.103.12])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab337d71352sm210298966b.54.2025.01.15.04.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 04:08:06 -0800 (PST)
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
X-Inumbo-ID: 618e1cef-d339-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736942887; x=1737547687; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kmeyu+qUWKTXZ4Mksi6zjGxNuSb/SWYG3CoZy2oFHhc=;
        b=IDh8wNgSFE4Tez6aImdGnF4Pq5y920fYs9b61GG2I+FIdq3skj99QShDVvyzS/SF9M
         uqH9l8qKWWYVEy/PZlKStDSbge9HWv09zLrDIpJs5lj9PYz6DEqX34ntVHzDh3tby8c5
         SgrE9k9XCP+1hSCEmVsQfM/C81zrRZIptUq8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736942887; x=1737547687;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kmeyu+qUWKTXZ4Mksi6zjGxNuSb/SWYG3CoZy2oFHhc=;
        b=BJMx6GAMFhVH+s90wYToPfNgBAP2jFAYuSuvOixzF7n7Tul9hxWlQ1ojUVAskdvIDx
         /gZzRDZFUBqd94hnLQldliFx4D3HaEdkxr0vMskQrPRm4d1WXLpgHmObnKEjRuooZxTD
         22xXvAGxCa/cTrSymvWI8U5Usbja5KgLEIGZdFjO80lqp0xR+8dDYw7Mm09cApgK+soH
         A2vzuFxWsRPWAd0Zq081BaMl2PDrGLev40VvUebcYRUcY2wIMSZ9qkMpePAKExtvmXtE
         HXaJmfjw7/N7RQ16WoVU1za3hzCJc3Lg+uYKV7+PL4offTdZLgfNxPOWHfuBFDLEOQeF
         8Efw==
X-Forwarded-Encrypted: i=1; AJvYcCW8qSNbI/lrkB4OREDxMcXfC4tbXIx4DV5IuVvFZa76PsXkGouYbu8ZFa+cQVk9TO5J7TJb+n+OimY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaN4ySTUfhQDIQdgcpMyzHGMKnmD36u6mvKKm8bEQpHlBNgn+k
	4y2bdrjOZxd2UgbyTNR9/mniwhksRa1ZEoZ1ZXSS7nHU48pkMqIM3pO4o00ifoSk8kTRkfOHBuy
	/
X-Gm-Gg: ASbGnctJ46v+Rbmii8j9CarCI6dtiqi6YjE08Ip2pNrwKpBdxpRDr7qiFmuZTaZjtj3
	vngMN4I8De4xnbpE+1LdHJpBcAgYpL0jRuaYzr1nDm1gO3bwF3qUIDpiuVJ4b4346BrZFnJT/CX
	GLpRh7aDJYGzroUvDKnCb215PBaK675yB6r+qiYuLjoZqCq9ZfqG4o39Zbjv9imEEtCPmzho0NA
	FI/RSZNwn2jfn3hW2t65vM2Bai4N3tD587rxVR3pDTUwXdyKWULr7AaJI8cw6paQCw=
X-Google-Smtp-Source: AGHT+IG3atfQuhtdKGLp5p5I6WBJ7QsLnJX/echZTu4U6xtiE/UhGBCuljohL0c6hqDta35asty+Iw==
X-Received: by 2002:a17:907:7252:b0:aae:e52f:3d2b with SMTP id a640c23a62f3a-ab2c3d1927fmr1683809866b.28.1736942887049;
        Wed, 15 Jan 2025 04:08:07 -0800 (PST)
Message-ID: <a936f720-818e-41d8-bd68-b35bc2bce7b6@citrix.com>
Date: Wed, 15 Jan 2025 12:08:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/2] docs/sphinx: import sys for error reporting
To: Yann Dirson <yann.dirson@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1736941628.git.yann.dirson@vates.tech>
 <4b7de1b9a5b0eec8cb1803e59b0027092c43c126.1736941628.git.yann.dirson@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4b7de1b9a5b0eec8cb1803e59b0027092c43c126.1736941628.git.yann.dirson@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/01/2025 12:01 pm, Yann Dirson wrote:
> Signed-off-by: Yann Dirson <yann.dirson@vates.tech>
> ---
>  docs/conf.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/docs/conf.py b/docs/conf.py
> index 5d2e979449..84bec024e7 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -21,6 +21,7 @@
>  # https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information
>  
>  import sphinx
> +import sys
>  
>  project = u'Xen'
>  copyright = u'2019-%Y, The Xen development community'

Oh, that's awkward.  Older sphinx must have had sys in context, because
it did work when I initially added that check.

Any chance this can go up above the "Path setup" section, and drop the
commented out line?

~Andrew

