Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F6D9E18A7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 11:00:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847793.1262851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPhm-0008Iq-TH; Tue, 03 Dec 2024 10:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847793.1262851; Tue, 03 Dec 2024 10:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPhm-0008H3-Ps; Tue, 03 Dec 2024 10:00:30 +0000
Received: by outflank-mailman (input) for mailman id 847793;
 Tue, 03 Dec 2024 10:00:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzh2=S4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tIPhk-0008Gx-N8
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 10:00:28 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b7dff4d-b15d-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 11:00:26 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-434a736518eso65873065e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 02:00:26 -0800 (PST)
Received: from [192.168.69.223] ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385db7f86dasm13053820f8f.66.2024.12.03.02.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 02:00:25 -0800 (PST)
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
X-Inumbo-ID: 6b7dff4d-b15d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733220026; x=1733824826; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mou40D0ZjD2Lf1VQwRddwv9731DnFFHuY1Fb6AhznBU=;
        b=o8blNhYMuRBcst0NVK45hLRq16jOJK8RktWNYBc90oxEgzCO4pp7wx0f4+lTvR5RpH
         hqeYHWcMwDXnXYTKv8GPWgd93TjS2P1vxQlQ3czHZ+RIzXJYcjkY/bgF+J32d0tfvXpo
         rbWpx2mAErI5SW2mKVZdwL91zPXytVeqjI8uTqqjQ7DLPB9/s2EsFmukdEWO829Y/ABM
         1tVEFscMIjQrkl/jmzjW/EK/b+BqeupOIcyDVni6QZhObxyeG7TMo+HuJfAmeluv9tMe
         P2Kxd/g4rbhCpGrathhEKvgukyoFyq4/M4iCXrS5wFw7vyZosjgk5fEzpUFCWXRxng/k
         jUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733220026; x=1733824826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mou40D0ZjD2Lf1VQwRddwv9731DnFFHuY1Fb6AhznBU=;
        b=H+lbnRlr0Nk2qwgQUmfFYN2XB5/MkOPJgJAJbfFJ03028jQkAHFHH1p4lBJxr8p5y9
         XWcRD5SbSdTJyttlWMzbln43Df5/kUg2IL9s5H3JFbErr3KQhev/t8EkPQxxgg9fEjHd
         aIs7liDZ20Rq1OKVwUkML3YyFGNGGScwIe2QQqE1aAUDo1leZi6P8yfcNyYtZKgA1xVg
         qLX07RZvezcJaD/Mp7jmHh4SVc+uBYBdwmmJkjDzGjPHNtLw13olV73sMrNdn6V61riF
         9RD6g/rjQw5NY0xgtjNhuSgTfaSif/0FdwF3rufYVJjEA0NL9P7BpCp7HveRnRIbdhoC
         L/Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVDGCD9GMfmTTj7I4sMg8PCm6zvQpY+PUBzEgxbw1FPfCTbx/aQWd4b0LpIMji1JZ7qjy0xI0Rh3J0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoU3+Yb6W9yf+v1se3bTJGRNDEXxfl0ydb3U/kc/8MC/YeRNmY
	vxods/NNhwyEbVCGHM3c2etAI8tCHqX5FugdBuT00W1/1feAqBSoheX6lJws/ic=
X-Gm-Gg: ASbGnctsHzPDjH5+RZXhzYj86Dnhh6yHUDNk4gTPM+C4+Peb+0a+59KDZXmjA0R3Eub
	6KST+KfbSc9j8in95YDv2JJ+bOy/6qVBkZKBhi8VeHCjnYuC+sx5gQ90EOSPXM+ByhXrdCDNAE6
	O6bYukpVtSzZ/i4lExGIe2Vn0cYgNWsx1mfDnAGaUShONx6MGuTYdErtvwjtqM9U220OQKn5tXl
	qWz3eeTw8WAKMyl3khUyMRF5tGbbuBuqJ8Z/cODCN/2dzTrJcMQx5GHaACVIBEIQw==
X-Google-Smtp-Source: AGHT+IE9vxZfRp24W90RJX0+iLYHphI7Leo+DbgvnW1oVtIyTYr8wsT4fzpvKsL/PjdyubjEmCbDIQ==
X-Received: by 2002:a05:6000:4024:b0:385:f062:c2d4 with SMTP id ffacd0b85a97d-385fd435560mr1562279f8f.37.1733220025994;
        Tue, 03 Dec 2024 02:00:25 -0800 (PST)
Message-ID: <0ca2c3e9-2ea6-4cd1-9f97-56068b48d870@linaro.org>
Date: Tue, 3 Dec 2024 11:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] qemu-options: Remove mentions of legacy '-machine
 foo,accel=bar'
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-8-philmd@linaro.org> <Z07VR-YvVCxdTua_@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z07VR-YvVCxdTua_@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/12/24 10:54, Daniel P. Berrangé wrote:
> On Tue, Dec 03, 2024 at 10:21:53AM +0100, Philippe Mathieu-Daudé wrote:
>> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
>> options") we prefer the '-accel bar' command line option.
>>
>> The new form started to be documented in commit 8d4e9146b35 ("tcg:
>> add options for enabling MTTCG"); it is safe to remove the mentions
>> of the legacy option.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   qemu-options.hx | 9 ---------
>>   1 file changed, 9 deletions(-)


> I'm not convinced we should be removing documentation for options that
> currently exist and remain supported.
> 
> The documentation should be updated to say that we prefer use of '-accel'
> instead at least.
> 
> Beyond that, what is our long term intention with '-machine accel=xxx' ?
> 
> Is this a case where we are happy to leave '-machine accel=' as syntax
> sugar forever ?  Or is this a case where we want to deprecate it and
> eventually remove its impl (and thus the documention here)

Right, we should deprecate and then remove.

