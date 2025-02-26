Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B2FA46809
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 18:28:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897126.1305847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnLCI-0003d0-RJ; Wed, 26 Feb 2025 17:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897126.1305847; Wed, 26 Feb 2025 17:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnLCI-0003Zs-O9; Wed, 26 Feb 2025 17:27:50 +0000
Received: by outflank-mailman (input) for mailman id 897126;
 Wed, 26 Feb 2025 17:27:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnLCI-0003Zm-1R
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 17:27:50 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe6804c0-f466-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 18:27:46 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4399d14334aso844655e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 09:27:46 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba549da9sm28650605e9.38.2025.02.26.09.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 09:27:45 -0800 (PST)
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
X-Inumbo-ID: fe6804c0-f466-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740590866; x=1741195666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1RRN+V3PMH8GegLMS6oV/NhXgEo4GbQDqSygIoMJPHY=;
        b=H9AjuN5YKu4Pg71pGGCSpZlv0BHEMZD0k0+d+hu6iSRHImEaT9FVk5mzabhuqUPNU8
         Dk/MFODpWiN51R+ORGLbcCqGbOL+FS34VJtTGsoNzf2AVzyIoD1qEWArvsqnws5Y2595
         OGOVQeRTFUd/u4aPeHt1sqfUoXl87TEL4aH5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740590866; x=1741195666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RRN+V3PMH8GegLMS6oV/NhXgEo4GbQDqSygIoMJPHY=;
        b=DbRh9vost2oBiS/hK1/bU0hWYktS8qLbq3LOS2+4+9rREUGoOPnbIz+IqR5y6VNMS8
         /O2AB2Deyjh/Fbk0MJSjy0tcjuUr5ZPW+hBLSfJEPxkFwzFD3SQNTsxWinZHJIYKh6HP
         8ma2yg4Pb/w0jv8ESdIJHAmCKZH7s/USiCyPOjplxOYmeIAuJUV8v1zSqTMt5o1pjbB1
         ncOqEYu3ZoBpASv900AzpzytS/OW1MrJPfecScv+/hqaJTkc8wPpdzhSaS/WY1AJbnkq
         SAFpnlP+Ecz6OMgt+Z9jvgYB1KgJCgrsTsWlpN4OXoi0fYWvuuoNRrx7jSwr7Bs51eSB
         jw1g==
X-Forwarded-Encrypted: i=1; AJvYcCWbribz6JNSs94SKYcXl6R/QumvMN6hzSng7iJNjTLtjl+XvJHKtR24ptTeBy/O9AUrJI/MA9SJVyU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWe6THQtG2gQg0aP1g7OQV50ST2gEI6ehiEVj/eQUktTBYaT99
	3M0zLChLRTjCSdWtEjfIJqrbEACRuMQEn5glBws1zykXolW93wHNQuzZB80MbSE=
X-Gm-Gg: ASbGncvRMj0C4QcFIl2CrDU8+f2n+1qsQWazUC2iRLQQLfgwzS/yafGRiOS6ngnTdfU
	Sk+Z8s+xtZpt4WNiIAen3wYf/594CALUFhi7asFkGEGAN9MkQXp73WU39wMEb0CaiDummsKKcrh
	nMeajnaLkaak+D8RB2Agncg8WyIiLyXXT7XlyG4xWuALE36hPwfhb6/B2rw7ia+Vy9iez0g4i2x
	0OimzA1nNZDpd9qsWasaKAsQLtX8bpqdYn7XR+wSfo4cHbYfOk/Le+SLBDBISNjD4PpdH0sS5HH
	K9gt4RZos3x8OafDgpeCgnkMBs+IMuih2qE+6IpQB4wGcYAYYAG44dIy4IfOJZzzWQ==
X-Google-Smtp-Source: AGHT+IGIBloRMaaWSlecXcvAQZPUQkiWEtPVrzzYzNomTlPTnnQBWzXlTZEgPc4oahHKGZj9XKjOhA==
X-Received: by 2002:a05:600c:1c1e:b0:438:a240:c63 with SMTP id 5b1f17b1804b1-43ab8fd05d4mr36230205e9.2.1740590865955;
        Wed, 26 Feb 2025 09:27:45 -0800 (PST)
Message-ID: <3a3d67c5-c89b-4108-864c-8c46b79b0246@citrix.com>
Date: Wed, 26 Feb 2025 17:27:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] x86/IDT: Rename X86_NR_VECTORS to X86_IDT_VECTORS
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-4-andrew.cooper3@citrix.com>
 <56aa1fbe-ebbf-4e03-b164-51710a75bde3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <56aa1fbe-ebbf-4e03-b164-51710a75bde3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/02/2025 8:31 am, Jan Beulich wrote:
> On 24.02.2025 17:05, Andrew Cooper wrote:
>> Observant readers may have noticed that the FRED spec has another 8 bits of
>> space reserved immediately following the vector field.
>>
>> Make the existing constant more precise.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I don't mind this, so
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> I can't help the impression though that the majority of places will need
> touching again if vector space was enlarged, to use the alternative larger
> constant then.

A number of uses don't survive to the end of the series.  For the
others, they'll need to become conditional on some new control being
active, so won't be a straight swap for another constant.

~Andrew

