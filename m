Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B41E48A96FA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 12:05:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708183.1106837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxOdw-0004iu-4q; Thu, 18 Apr 2024 10:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708183.1106837; Thu, 18 Apr 2024 10:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxOdw-0004hP-26; Thu, 18 Apr 2024 10:05:24 +0000
Received: by outflank-mailman (input) for mailman id 708183;
 Thu, 18 Apr 2024 10:05:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p/a5=LX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rxOdt-0004hJ-VJ
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 10:05:21 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2928a8a1-fd6b-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 12:05:19 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-78efd533a00so38879585a.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 03:05:19 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 wh2-20020a05620a56c200b0078ede24313esm492503qkn.12.2024.04.18.03.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 03:05:18 -0700 (PDT)
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
X-Inumbo-ID: 2928a8a1-fd6b-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713434718; x=1714039518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4gYN7tA/gMAb9/jEcITxIDEQy5e7N50MWh0AJZpQxMs=;
        b=X1tTR4Te1Rdy0nAAcDV8lQ8k9y3JMrEDCuyXOYAWfW3JX5aSPLpJkIxLNhOxKszodu
         5hDM3z5mSoIoLxXSO/6Q71bGGu1EmZtWZ/RrfWaCrJ7wGtON7hdBTvUW+UqsWqsmB8Yk
         MRrQu1JC6Etx8A2Kv9ZmW3hsPQgJdVfnNFZPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713434718; x=1714039518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gYN7tA/gMAb9/jEcITxIDEQy5e7N50MWh0AJZpQxMs=;
        b=ltZkboCmWBelHnCt5s+xo79eTZZpCvWsFPT7YYCTu9VK0/XWPd3hUgvOm6h2hA10XE
         OJQVfngmwJ4ubQ1tTH4VD97akJTEm6gIecjTEIq/HQygGt/yzwCaAidF2HYS8gSHiPOP
         QlJTeEJTY+RzigTisOlYKD3WObykuXvc/IVgvJJ09PwvNxaCPQMkZuifVkfL4+XXfVAI
         PPGQiwdGjbD8tnV2/2qlSMT0aRU7hsZSW+7ExIxCoAz5sCfNh2X+IdoPqlij7xfk3bEK
         wRaYwhH+djBl3dsEyKlDaB1ShuQxxcabxBUemoOAICUVTUTtoIgLYhZn2R+gdjaj6Hq9
         qnSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXIGrH2wCw0LuS7qloE1z7V50rmqt0++I0LzSLQNSPYFSaF8YFRYxgeztXdqPGreaaNUbeek9pDQyKsPq8aExOntYx9Jozl8K+XVf7HQA=
X-Gm-Message-State: AOJu0YzYCbhroTSKXMaNBQa2MwFohV9ipg2YX78wy7EXaC++jSPwBbcQ
	1ix6xyO/mTqZygF7F0UGag/Ccz+BjaKbm9RxUqj1Ce/+5jz3u2k19uPppQIoPPo=
X-Google-Smtp-Source: AGHT+IHLtOYSjY9xoKU2L+ADdw/RYC6L8AJslSPZYuvQ9O/RUj0iOVvxIXKErk2FH5Z6hGS300oNuA==
X-Received: by 2002:a05:620a:24d3:b0:78f:a08:64fc with SMTP id m19-20020a05620a24d300b0078f0a0864fcmr2263525qkn.30.1713434718390;
        Thu, 18 Apr 2024 03:05:18 -0700 (PDT)
Message-ID: <c865e0ea-fee1-42e8-a30f-5344863d00e9@citrix.com>
Date: Thu, 18 Apr 2024 11:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86: Update x86 low level version check of
 microcode
To: Fouad Hilly <fouad.hilly@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240416091546.11622-1-fouad.hilly@cloud.com>
 <20240416091546.11622-2-fouad.hilly@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240416091546.11622-2-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/04/2024 10:15 am, Fouad Hilly wrote:
> Update microcode version check at Intel and AMD Level by:
> Preventing the low level code from sending errors if the microcode
> version provided is not a newer version. Other errors will be sent like before.
> When the provided microcode version is the same as the current one, code
> to point to microcode provided.
> Microcode version check happens at higher and common level in core.c.
> Keep all the required code at low level that checks for signature and CPU compatibility
>
> [v2]
> Update message description to better describe the changes
>
> Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
> ---


As a general note, your v2/v3/etc changelog needs to go under this --- line.

~Andrew

