Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1375099315D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 17:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812187.1224914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxplX-0007fG-Ad; Mon, 07 Oct 2024 15:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812187.1224914; Mon, 07 Oct 2024 15:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxplX-0007d5-7S; Mon, 07 Oct 2024 15:35:19 +0000
Received: by outflank-mailman (input) for mailman id 812187;
 Mon, 07 Oct 2024 15:35:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arWC=RD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sxplW-0007cx-M3
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 15:35:18 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c01ba9e8-84c1-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 17:35:17 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-539908f238fso5081467e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 08:35:15 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05a9358sm3278526a12.27.2024.10.07.08.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 08:35:14 -0700 (PDT)
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
X-Inumbo-ID: c01ba9e8-84c1-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728315315; x=1728920115; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pSWpmC3UN2VjifQaNpwOV/JbgIK1VDU69pLYkH7ldOQ=;
        b=lP5j9ALTXvhDZGZYLx9A8uJVIn1c6CZ6RoA+TvylrGkEoFqD9lgqO1nvM2XF+contz
         7Ipd92y/1O5nNIxq8HKegc5pmPwhYO/VqwprbMB/AkszRRt0ikwMwBzmsbBEPbiFDHxb
         HyEOGF903RmvfkXa2dWVXnBhEg7GkvhJJc6TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728315315; x=1728920115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSWpmC3UN2VjifQaNpwOV/JbgIK1VDU69pLYkH7ldOQ=;
        b=Mm6VoLRQ2YhjcY6vBQB0RH3sJbkrKbQ7oLcBqoq6q3eYxpBbOsq16MGMUlvQBKgR1l
         LNIz4xoeOJ8IM5mHi+qpX3zo6B04DlP52PyaxCimHlVroKewRrrp0FoiiPfSTTJqKeUR
         GWwadU8T7dViI98qTw2IBve8oUsNmlZfginB5hozW9IQ/J3DD51WzBI43dWJENNz2w6B
         B2uZ/pQ0Yo5lUDmj1o802wf2/mwbLuwVBl5/3ysJRMoQMzyRU00Vvbn2e73tndDvZvgD
         y+MHkEEOt3qS2DcY/5JsTdqQ7wsmn2aD9fIXbfvGjiyF4NT1Gm1nd/u7KUs3gZWotepB
         kJbg==
X-Forwarded-Encrypted: i=1; AJvYcCVXkkWW+AG6gIKvXkRhhTlC3hPJMR1aw2e/GyG7KOht3MlYZHBYs2CBuAVbxWB98HD5yTIJ7beNOvM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGSwOGBiwLCMe2iecgep6wuLjs6upqsGj/a5fk1iEnf+JnJ1f2
	EXSmEiMcaRmvECbbYaPW4ERyQ1rOy+mHp70Rz3J9QWm6aAGZCouSXaO0zxh3XMw=
X-Google-Smtp-Source: AGHT+IHfurIJgjKf5jvWOgwxsDNMCbrm5hO5TM701GlQH2KoxDrTjf7YC1VtMTQx22K2dW5fsJskEQ==
X-Received: by 2002:a05:6512:402a:b0:539:94d5:244b with SMTP id 2adb3069b0e04-539ab9eadd4mr5921381e87.45.1728315315278;
        Mon, 07 Oct 2024 08:35:15 -0700 (PDT)
Message-ID: <e7f552d7-f9c3-4f22-8a18-68294324a676@citrix.com>
Date: Mon, 7 Oct 2024 16:35:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] automation: use PYTHON for qemu-deps-check.py
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241007152259.1353-1-olaf@aepfle.de>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241007152259.1353-1-olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/10/2024 4:22 pm, Olaf Hering wrote:
> This enables use of something else than the system 'python3' binary.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  automation/scripts/build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 34416297a4..5d806c235a 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -93,7 +93,7 @@ else
>  
>      # Qemu requires Python 3.8 or later, and ninja
>      # and Clang 10 or later
> -    if ! type python3 || ! python3 automation/scripts/qemu-deps-check.py \
> +    if ! type "${PYTHON:-python3}" || ! "${PYTHON:-python3}" automation/scripts/qemu-deps-check.py \
>              || [[ "$cc_is_clang" == y && "$cc_ver" -lt 0x0a0000 ]] \
>              || ! type ninja; then
>          cfgargs+=("--with-system-qemu=/bin/false")
>

Thanks, but I'm just about to delete this whole construct in order to
avoid wasting so much CI time doing redundant builds of QEMU.

I expect the end result to with your adjustment to the Leap container,
with no change necessary here.

While I think it's useful to have Leap able to do builds of QEMU given
how easy it is to fix, I'll be removing it by default from Gitlab runs. 
We spend more than ~50% of wallclock time building QEMU, when 99% of
changes aren't even liable to change the interaction with QEMU.

~Andrew

