Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8961EA057AF
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 11:10:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867063.1278467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVT1C-0003xh-AE; Wed, 08 Jan 2025 10:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867063.1278467; Wed, 08 Jan 2025 10:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVT1C-0003vr-7L; Wed, 08 Jan 2025 10:10:30 +0000
Received: by outflank-mailman (input) for mailman id 867063;
 Wed, 08 Jan 2025 10:10:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVT1A-0003vh-T9
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 10:10:28 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8266210-cda8-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 11:10:26 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385e0e224cbso8263425f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 02:10:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e43dsm53369272f8f.70.2025.01.08.02.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 02:10:26 -0800 (PST)
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
X-Inumbo-ID: c8266210-cda8-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736331026; x=1736935826; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ptw2j3iRaXshGQyZT4fu68y8VNXjLsYriz7sfdma9sA=;
        b=L1omUP8kbAemOW1NCgbtBjBVI1Ixilb76t67Wi6HVNWj8ONv0Dpu2dosblw8nJav7J
         yk5U3JDNNTSqeSe6nnNsA+kFuPU3xPOwJr5nHmfnfkeJ+CFfMx1T24Grej+JtQjCFjLK
         u1wAWDmlk/NJ5FGhC8bul47VytQ72BCt+0wPEED6mFYFd95GcTWuAV2kNtqHj+fMZmeS
         NWGETtYGSExjkfZkAGWG3vQfKdTLzpyZnTfDifrlqrJvbgkHmhYC5SwJ7IvwUTLydKj3
         1fXdJyTSenCctsIEs6H2CgDqP7x+Z11YCrd4yzQcPwcD/H00HppJ/WWiMRMa6p9YGQc2
         7nSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736331026; x=1736935826;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ptw2j3iRaXshGQyZT4fu68y8VNXjLsYriz7sfdma9sA=;
        b=w+FzylQs4XWDWR48zHSXMEsRZAg7XamWAyfxkEC8y9gz5IT+E9Pm2AY3gzP8lz2onP
         lAgjreiTtrvEN24Gy66BYwFSIKmkWRbPLG4Fiu7/UZzp1IZAUuL6bLuo4w7ntRVEHa/u
         ixkFepNtFJ2M3Upm0FOabN2jBFKQtVCwSOobhC/JqI/OenceN4Q7eY7axG4Lejio1Xio
         SqxFrAa6T9eqT5szV57SioLWcmjG8Q1GVuP34j3o9OSvWOyjNQ8kn2keNaB56NWB27L7
         AlXDs+3AOYYICjIlV8ymW21J24WPplqBojft3gwR92LCM1Asxc8PwSh1+xVROxrAHgEB
         ScqQ==
X-Gm-Message-State: AOJu0YwDGm3IqFCVsVJ+RFHGNPyE5dZw4GINNkbXxTU8e46GWGiXHxhS
	GQhxKr4FR0AiCnWSFDu5ufXgTNU0tgYJulZL9Etoin9ea8Ln6QfKoW8lNGLVhgjROJtxO/1AwJI
	=
X-Gm-Gg: ASbGncu+SJz+7S0G5XgLXQ2JaHSRUddHBB+hrRxuRtCJSLP00DqhiumOOIMbLHzdDC7
	YZOwtIbmE4dmICPZFWKRTf8c+tLpoZYnT3ysk5bxeS2uyzmPNoQUIwFufTlH919zw82E38Ddiqv
	uMNy8z8WvHTgx2PUwB5LhEMFA5tCBjaYhdD54oegTxvqNRRbfOIe+kFcEjP0sAq0BDNq7lrEhsZ
	H2fV7Q7eO4Mw9Ft1PVcUc6caUC1TeG2O1uMyA93aKpBc1RKZtpnwHBNjQt/N9xoEeJs4DIZPJvr
	X/Rm26gCPFrdacG6Jsdb0uHPWTyLKB8bzO6t9033kg==
X-Google-Smtp-Source: AGHT+IG59dOkEJ8WT4sjjxrurLckOkaOK5hCufNEx2KSGKA+i/g7eXLZyK3Hk10mapcf9e4ThGaaiw==
X-Received: by 2002:a05:6000:1acc:b0:385:db39:2cf with SMTP id ffacd0b85a97d-38a872c943fmr1520300f8f.12.1736331026360;
        Wed, 08 Jan 2025 02:10:26 -0800 (PST)
Message-ID: <14b65231-b83b-43fb-bbcf-dec5c07d285b@suse.com>
Date: Wed, 8 Jan 2025 11:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/6] x86: memcpy() / memset() (non-)ERMS flavors plus
 fallout
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

While the performance varies quite a bit on older (pre-ERMS) and newer
(ERMS) hardware, so far we've been going with just a single flavor of
these two functions, and oddly enough with ones not consistent with one
another. Using plain memcpy() / memset() on MMIO (video frame buffer)
is generally okay, but the ERMS variant of memcpy() turned out to
regress (boot) performance in a way easily visible to the human eye.

01: x86: suppress ERMS for internal use when MISC_ENABLE.FAST_STRING is clear
02: x86: re-work memset()
03: x86: re-work memcpy()
04: x86: control memset() and memcpy() inlining
05: x86: introduce "hot" and "cold" page clearing functions
06: mm: allow page scrubbing routine(s) to be arch controlled

Jan

