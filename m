Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624A8A5A2EC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 19:30:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906766.1314151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trhtM-0001TZ-E7; Mon, 10 Mar 2025 18:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906766.1314151; Mon, 10 Mar 2025 18:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trhtM-0001RC-BX; Mon, 10 Mar 2025 18:30:20 +0000
Received: by outflank-mailman (input) for mailman id 906766;
 Mon, 10 Mar 2025 18:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UYYE=V5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1trhtK-0001R6-Ur
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 18:30:18 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6c2c151-fddd-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 19:30:16 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso20737915e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 11:30:16 -0700 (PDT)
Received: from [10.81.43.157] ([46.149.103.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c015c2csm15397324f8f.49.2025.03.10.11.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 11:30:15 -0700 (PDT)
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
X-Inumbo-ID: b6c2c151-fddd-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741631416; x=1742236216; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/kxi/K8greiGx9tRJC2MGXUHERJlt80UNcmi0fNtc2E=;
        b=DnJrWLvlECIBOEMzhhcs1nldSgBquHYszaHpsHWFKQGbGTcJTNktZ5N8bLFn55nVQZ
         9DFKPt/lcKN2gG1rDcE/z8HFAEGMXafwKdqxE7k25/0DUGW0VL9j6xkwl4hAwbUx6WmZ
         DeIysUGcsdZ1h1WNLctSRi3CIWlj9DZzbvA5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741631416; x=1742236216;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kxi/K8greiGx9tRJC2MGXUHERJlt80UNcmi0fNtc2E=;
        b=kbYgHHEzTGmjMdZ5VIV4p5isvdqx/qQ4thNzWw+dBrvfPQ25smZpr3D90CNkVYFn2d
         FgQiW3rvD9+VnyvPPLWV7Kh+a0kEH5bhUeuc+iAdbm6NbJRYjk7EFV+4Lxy6YzEff7tW
         tTwLgWQdd6I8oPubRM18XD36twwcY2Nmjo13UgHwipGmutiXBkJNzUxt5YWN/VPyUdHX
         8jDr2yVovAHcpvBI5+DXd/ODx4/sWkvl9DdjnLl+EefSsH3yvG7y3IFIVeuJ0X1eAvob
         0aLNKuxc7X/s+s7h+UmS+cGikT3mGgepQeO3wXfUr25scLQkdspf4Z/J71zTodHfm5+h
         f43g==
X-Forwarded-Encrypted: i=1; AJvYcCXafChqNED/WFCYPjBWz7XCy9GQtIBL1CXQGmiCZFMh6sijFL7df55MAT466M9Kmgzxj9PnAMgRrMg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjHi/IJ88xQUTwRTmXQVweBIA1tIqWuM1Kwmc2gkWeLEpAgYYB
	z0YpiBQRbS4D8H5Rk+n53WGlrHWp2BV5ZbzWYkJeZsx5IgNx6rRQuSxRdzagb5U=
X-Gm-Gg: ASbGnct2qErJ51krVxIp90MDTj24NTcrdKrDtlGFcXJRfKQI7bZCdY2TJl2Ymtk71vU
	IDaZ8TDAVDnn9FymBABfx4ayOEAxs8IwtkgnHyWGTT2dTaAa5B2eJncWCbXlcuggZOtBVUZsya2
	XGsCDVkeFbjTjGpR4gviF7Q37o9XSwrT9AmlduMfMqmMK94TLgPN2fjF591/O7hSJ9tlp70pFR4
	qvO6YTojtrDXll4zDKcLLwMMHB4/lixPYoJkflrTsnWcP9o47x8Egh1rmlKGfIqJzjOL5GzxheU
	VNNGIVNH3UUyDYbnDxHRqtRywunnpDnIyyRjugillqAfP9Nc//UAzJxZW7Sd2KSpTQ==
X-Google-Smtp-Source: AGHT+IGDDXsei2BCwiQobP8ANMPjWDMcmrYBsk2LlJ0ghwwiscJ4ys6sbwzr6tPAr5DVLUHunWdKGw==
X-Received: by 2002:a5d:64ad:0:b0:38f:2a49:f6a5 with SMTP id ffacd0b85a97d-39132d4de7emr11105481f8f.15.1741631416302;
        Mon, 10 Mar 2025 11:30:16 -0700 (PDT)
Message-ID: <b95a2bcc-4ab8-46d5-9d92-1f2c37d4c279@citrix.com>
Date: Mon, 10 Mar 2025 18:30:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation/cirrus-ci: store xen/.config as an artifact
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250310181638.51196-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250310181638.51196-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/03/2025 6:16 pm, Roger Pau Monne wrote:
> Always store xen/.config as an artifact, renamed to xen-config to match
> the naming used in the Gitlab CI tests.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Looking at this, I suspect my failure was caused by trying to capture
".config" directly.

> ---
>  .cirrus.yml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/.cirrus.yml b/.cirrus.yml
> index e2949d99d73a..1a39f5026f9a 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -15,6 +15,14 @@ freebsd_template: &FREEBSD_ENV
>      APPEND_INCLUDES: /usr/local/include
>      CIRRUS_CLONE_DEPTH: 1
>  
> +freebsd_artifacts: &FREEBSD_ARTIFACTS
> +  always:
> +    rename_script:
> +      - cp xen/.config xen-config
> +    config_artifacts:
> +      path: xen-config
> +      type: text/plain

Can't this be part of freebsd_template directly?

Or is there an ordering problem with the regular build_script ?

~Andrew

