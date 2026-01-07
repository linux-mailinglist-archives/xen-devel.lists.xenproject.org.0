Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F297ECFE389
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 15:16:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196733.1514471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdUKL-0003pZ-8e; Wed, 07 Jan 2026 14:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196733.1514471; Wed, 07 Jan 2026 14:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdUKL-0003mZ-5t; Wed, 07 Jan 2026 14:15:57 +0000
Received: by outflank-mailman (input) for mailman id 1196733;
 Wed, 07 Jan 2026 14:15:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdUKK-0003mT-A2
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 14:15:56 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 613075e2-ebd3-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 15:15:55 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42b3d7c1321so1256620f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 06:15:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e180csm10399322f8f.10.2026.01.07.06.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 06:15:54 -0800 (PST)
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
X-Inumbo-ID: 613075e2-ebd3-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767795354; x=1768400154; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=inh0jSeo2mIZtxJK0EUO10bXoajZTBl2mmwHlqUuR1Y=;
        b=dYpg2sV0g8wwMD4Kr6qjWRzMWebI6hU/IyWxHNp19XY/1jvEY/L6T6y8lvUlMVwoRk
         VtkW2UThO0awi9PUxQMtWDazcklwmQwegVs5GLSzwM80jRSBlhUGSoYeJT3y/NYvVp3s
         Yb6O6pvCE6+cE25ZNAHONHddgXgaG6uEOWp5g9P82npC+r3f2kdFO15pCx2VGFFUgppT
         yyQCZDAlNTKT4l3I0DGf1RFFX7IZIShpPdnxya4aVOEr0EneWFuiCUfdMARC3dgFvfgu
         CPtSA1Li9pkhWlS03bWES2zubLTyi1uP4hq0xRgI0ELwDqEmyBeqLeYOza4dGTwGy1a7
         vJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795354; x=1768400154;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inh0jSeo2mIZtxJK0EUO10bXoajZTBl2mmwHlqUuR1Y=;
        b=kn9ms6z0Zkudf79vNzevlL1U5vx2HVOoglUTinCT+x9XSF2MNWZOnVaJ5viwcJ/4LC
         zSpPjIaudUpoPrmNVSPqOBy5mld1GqOwt70P5zgMH9codREO0SDBI+I8vKs1JypLaM0z
         8msa6aAuWwhwNKmmnYKqp99ofSnohGRr3/DNDi5EbbsgjGuIhoXVBGfOZwGGJWgpCmCX
         cvf2pahGyME5rI+Ii/0jNH+DG6o5frUk9Wy7HjJmda+SZLno1SFC4fPrg56w3CIdf8QD
         Te4XUTnjY5zaBIx5SvyGaimImJrxONk1buejBwph9XZK8DQroj+fOPasKB+QyVqxUwQd
         gD/g==
X-Gm-Message-State: AOJu0YwzhZQaA/LfNMW3/f6c8fHYNGRxuc4JFnJNwx/RHC4czu3cmvMw
	C4PRn25kR6TB84EeArbGV1nBZHcgWu9/EMS+BuSE5C07KQN14oJNjurPV/2if7z69O5c5uWtLCx
	UcBE=
X-Gm-Gg: AY/fxX6JQWInT8U1KflLP0AlkLEvXVyzLDXMvQN+GB5MFoTmZNme30NcR+4Tf6PC4LK
	7Ikysn9Ts8DEnPO99A6i64yt4zs2vIsYjJxAYQu5Avri2pi62eChcie4hz8NTdEzrt2ZxcQ+Ove
	x5iTyiBTM96EzlOLuapvm2bzdeZFqcYv1eww7QzLPP+3gJuCM0lnEp52uoMi0yQxVWzbVD01HTi
	jUIbrWZjfqOJx9KeIfARJsNWqJ6l8kfouZ2ysKiwfxdxjTnEnCHP1gngBpvmCGaONjB7mvAVIP8
	r6rJe7IXmErwklFU4KLvXy/s+WOYK1o2fPm9OVdZR7yBkWolEiNonjkfpVV9TETqB0Wg+2Dm34H
	FVbz9nocJ/77rcrGHBBoahhWEYhk7HNSnhKrg9+E0Pz0qeK5a0X67GzTWrgQHu+W5xVWV9fRWyb
	zM3+00LFp8wig3IT/L5alJbP9Rvp45mhgotfnLJWXLpQ0akdTmMd1tJ/YS9NnJbzw946npil+lk
	jA=
X-Google-Smtp-Source: AGHT+IHFY6DctEC5XrtlpeUdmBMfhXfAZetMaxV1iXewE5awWQcTXS9A+oTQojXsQaizn8E8IUs3Xg==
X-Received: by 2002:a05:6000:2305:b0:430:f7ae:af3e with SMTP id ffacd0b85a97d-432c3798309mr3350400f8f.32.1767795354548;
        Wed, 07 Jan 2026 06:15:54 -0800 (PST)
Message-ID: <4bd68e41-e665-4992-9d3c-0086bb5195ef@suse.com>
Date: Wed, 7 Jan 2026 15:15:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] x86/cpu-policy: librarify copy-in/-out
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

1: move CPU policy library code
2: split out copy-in/-out functions

Jan

