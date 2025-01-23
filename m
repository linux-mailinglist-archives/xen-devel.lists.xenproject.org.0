Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C51A1A6BC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 16:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876337.1286697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tayqD-0003bz-HU; Thu, 23 Jan 2025 15:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876337.1286697; Thu, 23 Jan 2025 15:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tayqD-0003Zi-EM; Thu, 23 Jan 2025 15:09:57 +0000
Received: by outflank-mailman (input) for mailman id 876337;
 Thu, 23 Jan 2025 15:09:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GMDf=UP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tayqC-0003Zc-Hz
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 15:09:56 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a095228-d99c-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 16:09:54 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso1166783e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 07:09:54 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af732ddsm2692294e87.198.2025.01.23.07.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 07:09:53 -0800 (PST)
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
X-Inumbo-ID: 1a095228-d99c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737644994; x=1738249794; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sOALsuAJW1LZwGF3zk+Y24qSfCH+qPZ25tMRrMAnTtU=;
        b=DIgXfFk8Bsz8AKUwo7I8dUcegIH7fQ76YNJz7af1fggNt559qLNTQFSxi9TEEHvQLT
         /2FvwbjOa1rBwohMiqHoXCkvd3h8K0UlxHdFyEBAqFB2URZ8o7e3SyRiaUv+D0hDVJ0U
         pMfEN5HPM54q4v0s+8NVxKF04OUF1qnGNdCdwIEt9+eGYCvSLgLrRQTXp/HLyiJ6UTPv
         sgiycX4CXRbgEFC60d5J2ESN58mfWvhHhk6xfaTzHXxe97+h2imqz89pxuMkgxXLmYmt
         e1BFsRoNfmLauViqKHt2YFMlIvzQz0i5WvqksuqDpZQ7fN64Ecx80uD5tUiwN8PCCfw6
         MZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737644994; x=1738249794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOALsuAJW1LZwGF3zk+Y24qSfCH+qPZ25tMRrMAnTtU=;
        b=Bo9pHWMuqXVuphIZl7Y4/f5VNaCe0RsOoUqB+OSe4pCLYoQiDlCQwsvZm9vOwWt7Hi
         AYXcnB0n4ty27i0kNr95dawhF7FDHojees+CymR8kmqhFU2QW9O7XcJdAV2kPURxSdJO
         rqP2rioiT9WDOMzNHodKChVurqVz6Ymn5ukm0SCoAePNeW3EtXlb7CPIYl4KjWnZ5Ox5
         2QY6KTw0Bk0ANAiaAr5X2S7kHAEjixyLQH0CJhuekD7GH3kazW1la372tPRQvP8feTa+
         31Xh3V+5mFSiwhQ5aJ8IUMg8rI0Yjio+QDXY5XPt3ApsWDMQL3PCecKmEeiWyYZSd3Gz
         a7AA==
X-Forwarded-Encrypted: i=1; AJvYcCWoW1Z9Dyxl1qo0Pa1jsTd97ZOmpOrmbPBl1vjhSCp0ZRnrk8CsWgPeO7DcMyk+pKZzBOX6qD3xGZs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyicFqu/KxcKJSBE0QX/UwDs+DP16LFALOtkV3BmHQXufYkCGOC
	iBTeYXdq0L+uJS9iLSTjZ4Kl6ECUGbGR63btPniFOskshDf8dgIE
X-Gm-Gg: ASbGncvcNrEVDd5iA25PxcIHLyaEFMxtFJfB53aifXFymdJI3YpQa+g1creaGd4/evz
	6sgeSJu7CZXIBTWNn4x2LWc2fWCCyS3X3uvxyJEeo58yLosR26e3GszGj8bSpOvLuHQWz0PSr9y
	8VppoUima3hhHdCbJJfU4Ck8zxv7ArPGv2oyy1NbTycw614bx2AM7mpSVGnqa7WR5ybcGfn8w1H
	/ZyyjshZAOUbyQUT8TWxPCSiQJJXKSWVNnlbq7Qka/7z23IoGa5DyQZZKwNhut85TsnUBAP7cAl
	RTuO/R29z/fc3H0TRQ==
X-Google-Smtp-Source: AGHT+IFCFb5WpdvPDORwvGAHR84eWKRFZI6LeOWIeX5qpvBwPqmFa1BlELIVlWsR549q4JGpr3AKkg==
X-Received: by 2002:a19:740f:0:b0:542:2388:3f05 with SMTP id 2adb3069b0e04-5439c25122fmr8547193e87.31.1737644993737;
        Thu, 23 Jan 2025 07:09:53 -0800 (PST)
Message-ID: <a8cb8a0d-9c44-4e1b-92f3-50928f03ebd2@gmail.com>
Date: Thu, 23 Jan 2025 16:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH partly-for-4.20 v3 0/4] x86/HVM: emulation (MMIO)
 improvements
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <729f7896-55b7-4b5b-a7e9-6eb0420e0b14@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <729f7896-55b7-4b5b-a7e9-6eb0420e0b14@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/25 11:29 AM, Jan Beulich wrote:
> The main fix is patch 2, with the earlier patch setting the stage and
> the latter ones simplifying other things at least a little in exchange.
>
> 1: allocate emulation cache entries dynamically
> 2: correct read/write split at page boundaries
> 3: slightly improve CMPXCHG16B emulation
> 4: drop redundant access splitting
>
> Oleksii - the first two patches (plus the simple one from v2 that I just
> committed) are backporting material, and hence I'd like to ask for a
> release ack for at least those two.

R-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> for first two 
patches.

Thanks.

~ Oleksii



