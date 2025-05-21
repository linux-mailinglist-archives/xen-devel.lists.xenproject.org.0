Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 158A6ABF821
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 16:46:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992001.1375779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHki4-0002HD-Bf; Wed, 21 May 2025 14:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992001.1375779; Wed, 21 May 2025 14:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHki4-0002G7-8y; Wed, 21 May 2025 14:46:20 +0000
Received: by outflank-mailman (input) for mailman id 992001;
 Wed, 21 May 2025 14:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHki3-0002G1-F9
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 14:46:19 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5aacd138-3652-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 16:46:18 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ad5533c468cso651274766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 07:46:18 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d047c30sm905384066b.6.2025.05.21.07.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 07:46:17 -0700 (PDT)
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
X-Inumbo-ID: 5aacd138-3652-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747838778; x=1748443578; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FVFet3xoWefKKVawYbCCRbLAxEdKpBbFXS6HzUTlXSM=;
        b=HQR1Bk24Vp15P4AkuoEa9z5YH7jHCxB6KtdBYjB0EzZZBAr69uCbqdVU3EXVeNL5Yr
         pNRKepAeomQ1udeLAwv9v0rk4Eo+LDUfcOXShFS1Ki40UIkU0kGvfQVzPaFyE+7bWNPe
         +6nGXK9edYSnElzfXQtcVDMFXF9zpo16haa6FByRHLV0IFU2Ka4h1vFpEgbLZXUBePaZ
         dNZA/YB+4/BwsHXfSciSGnysNHfmNIjJzLBdGsXPmrmRSpw4j/7zIkyasvyq9DqHPdgh
         5EUABO9677uCwYt2jKsZjAR6XcU+7O6Treva8sZ7ridwnn800/PsJJ0jYpKjopp6RWAi
         6o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747838778; x=1748443578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FVFet3xoWefKKVawYbCCRbLAxEdKpBbFXS6HzUTlXSM=;
        b=aThB+AXWpMkIB6f7+z/lB0P6f9v8sOYwOf5bPrZmns6s2MYKr6B/o7TsmnO+P08j9d
         5DWjDAZcMfwetBZp4MwVdqSsm2d6YIeDJyP/Jphx8zCH0vPBVYWBWiUNJKQT9DptjTZN
         t6CKGyV6en0nhh6GtA9/rBbbA7oLMeOq3Oj3p9fT5bqkHxuCkVipfV4508HLtbNDBqgM
         mfUi58vDFFvDFH2Cuml+4mDeZmQ4yFYw5nzkQxKw3X4mvbjrK5qGp9GzYnhoIutzW7pX
         OF+fwCxHVp/2QdOrdSocNGsFb6M08+gTPzU6gS8XmHsD6T+SXRGaycsgaEeisBPhtszP
         8JyA==
X-Forwarded-Encrypted: i=1; AJvYcCXX/jDiyd0SO60vgETMuTWHYnJGdCQEJsnbOWNBhph/5aLpAwL+LmIWGwNLkDG4S2qCvvN6M78GV2g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdhHUw8OIOIG33x/HcV5qzOalRZ0MwL2jU6zgsMsoWTgf55GuE
	3t5k2RJm3byZYsR4UaCAt+sxYx42v6vxre6jQaEh0OOEy0EyoyzVKxStk5b7Fgm7Vw==
X-Gm-Gg: ASbGncsJKClmjibmbh9mW1lPfXp2ycuCfngmEowv/ypsoTt/VZpwFN1nQRUVqG4/8l2
	Qb39gRtLmvsfUIlrr6Fr6E7VKUOJ/5Y2xSCzd6QJHELBg1ksjGRbUzqPHslpDFhoudTFnzwEisN
	eL8l290koGmvjU3YGbTse1U/MMfsJF9ygBHQSENM/WQWbSOg2KxNg1tmJnHrnNBCAFtBoRZAub3
	QBaMmHI1V4Mryllr87tbAmfi57bH6GLyRcW6vybgpCod1wxXBSGeVKeMRS+M5X1JGGILmHj62BL
	pKREBPYjR7tNieAn7T8X5rGM9uUGBvc5zLSjedV4OLsSBz431p6L6+/GGSdLDg==
X-Google-Smtp-Source: AGHT+IFKhbCYh6veQxMiAAEatLbcddhtrN1lGye6RI2wR8d7Wrj0yVZ4kUQWHaKbhCCHUqemYdOZhQ==
X-Received: by 2002:a17:906:6a19:b0:acb:34b2:851 with SMTP id a640c23a62f3a-ad536f9d598mr1635099866b.44.1747838777940;
        Wed, 21 May 2025 07:46:17 -0700 (PDT)
Message-ID: <3256d638-8f6b-4eab-98ae-d8afb23cc51f@suse.com>
Date: Wed, 21 May 2025 16:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xstate: Rework xsetbv() to use asm goto()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250521143622.311566-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250521143622.311566-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 16:36, Andrew Cooper wrote:
> Switch to using a mnemonic, and asm_inline as there's EXTABLE metadata.
> 
> Update the types, and adjust parameter names.  The name xfeatures is specific
> to xcr0, so rename to val to be more generic, even if there isn't another
> writeable xcr yet.
> 
> No functional change.
> 
> Resolves: https://gitlab.com/xen-project/xen/-/work_items/212
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


