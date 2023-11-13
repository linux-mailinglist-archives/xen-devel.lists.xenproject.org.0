Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B6E7EA295
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 19:11:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631931.985684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bOe-0000S5-Du; Mon, 13 Nov 2023 18:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631931.985684; Mon, 13 Nov 2023 18:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bOe-0000Pw-B6; Mon, 13 Nov 2023 18:10:52 +0000
Received: by outflank-mailman (input) for mailman id 631931;
 Mon, 13 Nov 2023 18:10:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZgi=G2=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1r2bOc-0000NP-O1
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 18:10:51 +0000
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [2607:f8b0:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f80b5f14-824f-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 19:10:48 +0100 (CET)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5bd33abbb90so2991594a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 10:10:48 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a17090a910900b00280c285f878sm3923719pjo.55.2023.11.13.10.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 10:10:46 -0800 (PST)
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
X-Inumbo-ID: f80b5f14-824f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699899046; x=1700503846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G5/qOWZgkeSPPtH0EpFhTGO8tdIfjkfMdQotq8wuAKg=;
        b=N2mRT42TZFRb6hWlyHp7UFFUE2iXxMo4N0BhJW29bfX3J/aOSPHvnotZMmIXH4+3e9
         InhVNelb9ANbYqLxKsPjnw2RPdqZAlh5Yd7gJzyPmz1tqFukcQqAUVOarXqkFsTCqskq
         5moRKOpMLANEQbXlFvz3RZLh6fRiEWJlSgWYbBz1LfTMw5fnkOZJfQHb+lkxrBJo4HYJ
         YBnyPvjQUOXqvlncT7lTeMYpt50Q/LEPfEnZcqwnas+YGjuNrjh/gbMjpavwYpMQV1Q6
         uSxmR6xAPB2quacNsp+XwYFeUgp0Ax1UO0ZFnVkQ7j5WNUkqtSjAuw2a6TNSGcKOBff8
         4BPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899046; x=1700503846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5/qOWZgkeSPPtH0EpFhTGO8tdIfjkfMdQotq8wuAKg=;
        b=Sqv8oryxBrNX+D9RWzasT58xIo+zc/ny5nYHnLBzD5Rqgkl3u4v68P+R5Kylc0AzA5
         JqUiVw0J7xcUfHo0SW+INfrc8CJK5ctIl/LdEstWeznvHQkx65FgwyRUxX+OaPzTC7B1
         ESbRccQ50T85YIVKTD0g6RD4x0jfUfPZ62z9ZI894T2Az3pCYI9hjaWuqOmXApTEbDee
         ITtFOEodePaOWihidEmmi6ev576wp8a99UcVd2bkammacDYC2aixeN2pwQdsyOnQfsmI
         SODb148uYLfYP3BTR5cdWWV3Hn3ZXNm2JhmBPGa6DT8Omd1MxFckVNpJGKzjyJp0vv2t
         1FoA==
X-Gm-Message-State: AOJu0Yza4UWIC4DRiFdhETZB/wj8HPlVPjeLguH4o6MYu81T48Vy7Ezw
	4BlZ3oGKqDxcA7+GIPhgzFLS0Q==
X-Google-Smtp-Source: AGHT+IHUViJUi40vcCWJAbjeC1I6xdrwoRGcxD8HWAB7g1Sz2zxxUOjf7IqWCp/nkqVYvgGeqTiuOQ==
X-Received: by 2002:a17:90a:1789:b0:27f:fcc8:9196 with SMTP id q9-20020a17090a178900b0027ffcc89196mr5441493pja.32.1699899046448;
        Mon, 13 Nov 2023 10:10:46 -0800 (PST)
Message-ID: <365f998f-b7e0-4f5a-bd75-177d23946e4d@linaro.org>
Date: Mon, 13 Nov 2023 10:10:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 01/10] sysemu/xen: Forbid using Xen headers in
 user emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231113152114.47916-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/23 07:21, Philippe Mathieu-Daudé wrote:
> Xen is a system specific accelerator, it makes no sense
> to include its headers in user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/sysemu/xen.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

