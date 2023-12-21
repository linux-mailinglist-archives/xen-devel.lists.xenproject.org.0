Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90C181B29B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 10:38:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658723.1028038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGFVz-0005gc-4j; Thu, 21 Dec 2023 09:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658723.1028038; Thu, 21 Dec 2023 09:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGFVz-0005dr-1t; Thu, 21 Dec 2023 09:38:51 +0000
Received: by outflank-mailman (input) for mailman id 658723;
 Thu, 21 Dec 2023 09:38:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yxSo=IA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rGFVx-0005df-W8
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 09:38:50 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd8d63b6-9fe4-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 10:38:47 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso425857f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 01:38:47 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-110-223.as13285.net. [92.26.110.223])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b003367433118bsm1597343wrq.78.2023.12.21.01.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 01:38:47 -0800 (PST)
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
X-Inumbo-ID: bd8d63b6-9fe4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703151527; x=1703756327; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8glTMB6OR6iWmfxtYa6V6b3clUcWOXKdT1CBESqc0eQ=;
        b=lS2fXAExKOSJfhvo8aHdMc05ecPy18lQRxyu8xBiyWOirzzslCx4S3vjIxd6itrKyl
         /g51Yh5OCz4ejP+ju3dONZNSY2oDoE3GfJgIUhnpDvp5GACCKEovP+4aNLQyePUHipPt
         vg4V8uYHnX8eBo9rRsIuhWgcc95lYkLdKqfAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703151527; x=1703756327;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8glTMB6OR6iWmfxtYa6V6b3clUcWOXKdT1CBESqc0eQ=;
        b=SgG5XKII+wdkwH6Md511FOlSDhse+tpU9A/qlIcCd1/pSXtSiCVjkE0QLZVsToIPxJ
         VMpt/VmUhuqHT5COZFyunMFWEFuuoAUf5MCU3EaMdx+nhn16OHZ5nD1L0t4XNzjn7LmX
         ocjMCX7T6GECBNOfNWW6w4J1qm/C5V7qXp57XeaQ6DVWu923ES9iGhIPj4AVTF+1rH/T
         SA5w8SIkTedxVcv+1Km6beusRfevdojTtGOS1OQjM8YFrWYZeQCYwZDC+E1oYEB2voCV
         F5vnccZ2/PCsxepkn/UrP4htsR6ztsjVVrnZgnfnlFYftQpRQ3d9pPjAAwlU6TKiAa3K
         TK3w==
X-Gm-Message-State: AOJu0YxLuHQeEj23+BGdg7Y654camFOD4GowfEWvkdFnX5hyZM1XMgKl
	Anr6vu0WTrBMR1ECgoxBjJEN2A==
X-Google-Smtp-Source: AGHT+IF79XqRFHRkPNkTTBQN3LXi4F01A6WLbNWHrTB+aBj4KMU6z0/VhVZNRHJqUjI+rkGX67VNyQ==
X-Received: by 2002:a5d:4d89:0:b0:336:7814:84be with SMTP id b9-20020a5d4d89000000b00336781484bemr644704wru.141.1703151527316;
        Thu, 21 Dec 2023 01:38:47 -0800 (PST)
Message-ID: <97838b11-e23d-4081-acbf-054d02f5ab73@citrix.com>
Date: Thu, 21 Dec 2023 09:38:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen: have a more generic unaligned.h header (take 2)
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231212162702.26360-1-jgross@suse.com>
 <75dccbdf-616c-4487-a1a0-64bdfcce0f91@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <75dccbdf-616c-4487-a1a0-64bdfcce0f91@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/12/2023 9:37 am, Juergen Gross wrote:
> On 12.12.23 17:27, Juergen Gross wrote:
>> Second try for the generic unaligned.h approach.
>>
>> This time including a fix for building stubdom with libxenguest,
>> which is using a cruel hack to reuse the hypervisor's decompressing
>> code.
>>
>> Juergen Gross (2):
>>    xen: make include/xen/unaligned.h usable on all architectures
>>    xen: remove asm/unaligned.h
>>
>>   .../guest/xg_dom_decompress_unsafe_zstd.c     |  2 +-
>>   xen/arch/x86/include/asm/unaligned.h          |  6 ---
>>   xen/common/lz4/defs.h                         |  2 +-
>>   xen/common/lzo.c                              |  2 +-
>>   xen/common/unlzo.c                            |  2 +-
>>   xen/common/xz/private.h                       |  2 +-
>>   xen/common/zstd/mem.h                         |  2 +-
>>   xen/include/xen/unaligned.h                   | 53 +++++++++++--------
>>   xen/lib/xxhash32.c                            |  2 +-
>>   xen/lib/xxhash64.c                            |  2 +-
>>   10 files changed, 38 insertions(+), 37 deletions(-)
>>   delete mode 100644 xen/arch/x86/include/asm/unaligned.h
>>
>
> Is anything missing for this series to go in?

Oh - I'd not spotted it.  Lemme throw it through a full Gitlab CI run
just to be sure.

~Andrew

