Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C0CB248C2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 13:48:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079791.1440482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um9xL-0003nf-Ly; Wed, 13 Aug 2025 11:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079791.1440482; Wed, 13 Aug 2025 11:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um9xL-0003kw-Ib; Wed, 13 Aug 2025 11:47:47 +0000
Received: by outflank-mailman (input) for mailman id 1079791;
 Wed, 13 Aug 2025 11:47:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1um9xK-0003ko-30
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 11:47:46 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fd64a88-783b-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 13:47:38 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b78a034f17so4954157f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 04:47:38 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8fc28a7b0sm23073146f8f.63.2025.08.13.04.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 04:47:37 -0700 (PDT)
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
X-Inumbo-ID: 4fd64a88-783b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755085658; x=1755690458; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iy1tBLDIVk3xzTwJcF3vFaNJwhpfkhjyT2B1lZ9N6JI=;
        b=CrOnp1exa036BuMVpw+sA6aPOGE8aorHSjIrNXyUgE9qdI/aqVtz2cbXB9R3s3isj7
         Z6SAkFVANeFeyN7G+gCuAHw+OID5/TZtjAXL3+/dcNLK5PuHvyt76Jj9qViUPdYGGYwB
         Qqf7rKPz5Fg2UWh8aPj+MiG7LgSFLa3A+ZRx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755085658; x=1755690458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iy1tBLDIVk3xzTwJcF3vFaNJwhpfkhjyT2B1lZ9N6JI=;
        b=nPPnbi8P5bhlm6jTXenWsgilCMFaSs43Y/wr/8RD3B2iIrUYp6Y9tqRtp6C/e5glnH
         qoFVouTbwOkVgvT9jlol3lhuujpQdsIozTsqPcA55D98O0Gc3KC+CEf/cjEC8hsEBkq3
         0Zh1EwDzeM+E7CfZjsBtfxnlUQzrK/SAn85/MfcemEpcWuCvZueDU4Iy1zmUEN7+1ule
         tcvBLb1ZJqtHaD2eP/MQ9ISSYGpOvocgZKZIb6DslWY71TJrYuUEgYC5JwASdBDERMXf
         vbATpw7BzKUI9+NvqsgEWUj9ZxSpQBJdvMAcPevypSlxGdXo+ATjaLRyaCs3YS34lid2
         C8+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZYRmhHwLRmeME6fCMTE0V29yoENQCPEDtM1Kq5Q/QKgZhOh8tpiYWe6VjNtaEiiUKVskVK2UjQd8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwE7A01d+3RLSrtMwzubIJXizzBy628+YNGCj5tIBaa/NzW4m0q
	ioAVNI/cLxYUclA7tW2HUkmM/kYhc9bOup03U8O+cImIzcPw2WwpJ2U/lYwvPGcVoAs=
X-Gm-Gg: ASbGncv7UnLddJXvGcecS8MVRdgpdRLWoJViZBSFvMS9WApLCiME1CeTc6j+ndBF/md
	hKNaqD4c1aB9cKWjxAr84wsl/ZT/uW3XygQqa3V0LkrseEdDKg2CW5JGSOqDBGhPpJznsRXWYLd
	omd+HNH9+6xn4755peqSKq3X1TSdkuYUutr+Xl4/9mPy8VSjSpRws0HDu/D7WXgYr3+CXGqHdHT
	DH8r9OU1CDpztRom2t2nko9nIzRAzT5A3/WSVI8r4c7fI2V7Z1avCn2xOIXtKf9uCxJMWfiEX8z
	WvRdFRnAicyMe6KOSNyNQispMKo86tfNdj6DbJ2M++EUnzn3+Vp1VKDn4PoirZzo2aU6zNLgQZY
	rTW3G8osMYxjlYPueBDIDTfKA1Rvz2Bm8QeKzVWjxrjG19pgSsqamWXZyW6vXLpRSrtTv
X-Google-Smtp-Source: AGHT+IFj2U5g5L4A/6mfvy60zsXMic7fuMjZcMnAGsCRvxY9EsvCBOPq3KF8OOh4BcqamhgKFlQccA==
X-Received: by 2002:a05:6000:4285:b0:3a5:8934:4940 with SMTP id ffacd0b85a97d-3b917f417ffmr1827310f8f.50.1755085658099;
        Wed, 13 Aug 2025 04:47:38 -0700 (PDT)
Message-ID: <f3e57860-d4db-43c5-8cb2-29eac2163c1d@citrix.com>
Date: Wed, 13 Aug 2025 12:47:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [Coverity complaint] Re: [PATCH v5] pdx: introduce a new compression
 algorithm based on region offsets
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250812150624.64898-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250812150624.64898-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2025 4:06 pm, Roger Pau Monne wrote:
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Not this patch, but this is probably the best place to report it.

https://scan5.scan.coverity.com/#/project-view/30554/10426?selectedIssue=1662707

Something you did in the series made enough changes in
pfn_pdx_compression_setup() for Coverity to start reporting an issue in
some decade-old code.

The complaint is on line:

277    ma_va_bottom_mask   = (PAGE_SIZE << bottom_shift) - 1;
CID 1662707: (#1 of 1): Bad bit shift operation (BAD_SHIFT)

34. large_shift: In expression 0x1000 << bottom_shift, left shifting by more than 31 bits
has undefined behavior. The shift amount, bottom_shift, is as much as 63.


The relevant part of earlier analysis seems to be the "i >=
BITS_PER_LONG" check in the order loop, causing Coverity to think that i
can be up to 63.

~Andrew

