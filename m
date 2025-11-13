Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAB3C57D64
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 15:05:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161642.1489544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXx7-0006q7-0j; Thu, 13 Nov 2025 14:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161642.1489544; Thu, 13 Nov 2025 14:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXx6-0006nx-U1; Thu, 13 Nov 2025 14:05:32 +0000
Received: by outflank-mailman (input) for mailman id 1161642;
 Thu, 13 Nov 2025 14:05:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJXx6-0006nl-7v
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 14:05:32 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d07b3351-c099-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 15:05:31 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-640e9f5951aso3260128a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 06:05:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fb12c87sm171670866b.31.2025.11.13.06.05.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 06:05:30 -0800 (PST)
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
X-Inumbo-ID: d07b3351-c099-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763042730; x=1763647530; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sZq0rGLOh+pLuLrf0Wbz4KdmVtquORqk6xNM2i1m+CU=;
        b=bud5aBc9naSj6JXNr//OTf90wWqKMGit07zQVAxZonEgsf2wO0zEILiZfw1nzCZEzT
         ZxRauZwIWwgnReSMCrCC2BPq7pZ1PwaOSmguvKvFVkzhnCAISrQ3gw3/sc2MYW7zTCOf
         Kqx3deYVQmB04KEZpwj0dZOKPd2Ex7pDZO5GuaC3eWVFEuba2d0PhpPCQ0sWl9f06qjy
         3fFqEyESDbzSQFVzd6MLC102fnYA1nQh4qj0OPkJFmxB4T2VQ2pwzoKUKSNNBAJ1L63f
         2e1xQ/MUkI5B2PvJHEUUw/lIzhao9CYeNcufSdTj/29sUr0PwkTXGQoquaP2/nD/m3F/
         Zpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763042730; x=1763647530;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZq0rGLOh+pLuLrf0Wbz4KdmVtquORqk6xNM2i1m+CU=;
        b=LWc75JrvNsLJymmd/4WBnKII8k9ZHf/pQiJeF/N0piNlz5NAEXosTN8KfFmViR3uBk
         V0/1DHqyMkBEElxjY4gWVsHH1fysNu/ZrgCaZe4da9ql0LD3mRPjcs2lF7gE83HZJeeL
         ithA7LWaK+IYBs0Cz5r0E1fz61Sy/LCrB9YqWshEJvSpOs5XnE9+cS4oJ1HczHM/ukMV
         LMbx66wbZh4JcdR3NmNMik5qtqD7pByF0AbgpM/FUW094YTffYP7abexw2VbYMUS6Ym8
         eoUtI99vXzRSEayyBqVvrsibW06qxtgiCBd9g3sizu/nNTHrnAMmY6u5j+31rPQ5/pNm
         FB8A==
X-Gm-Message-State: AOJu0YxiHqeSA8QzfIl/h6s56F1KQQddaUMvhHUXWgv/AY6Ih1T1fG7p
	vcGTrrzT4tZ0SzW3R2GL0J66aU/zrtzzJ5On9iUuxdnVuCB1EYtwvKYrEUDWKF1RUw==
X-Gm-Gg: ASbGnctBrMcwxs09rBlVLdp8FqeqFuHHqYbTX5iubqoDXEwaQvQaI+Y/4oqgBSK/Fgb
	dhjrGtDpTHHZ6iFujimzRkjPdVWqVohAxg+zftKcROnVZg1iiAwp8Zl6H4urVu3++ABCLcG2SDR
	lzCyizNrtzkfsO01Xi3A7ASdiAD6VJpxpMVExNdDeN13II4AIFdhxeyt23E6m9XEjOo1wl92ZhK
	3YZsNzLEpNapRJ8duoP9SycEqhlqvFXYNXAcq8JPD9B0hGcnfpDW7P8Rn8kZwRS+giIPSCK550I
	yiGxu1pYVpUEWAZjbU/Dx6zmCKiVADKolTFfo7E07J/YWgF4BA5XiWs66Fs6ZDG97Zv5K86ir7L
	XZvgOrC/8OdhQuTu6km5PsuqDRfZLjyXczdxZldyA0NZmDoYDJ2Rrclaco88wcWuIYamDaguFyf
	HJg1KK6zPXsKdoL1T/5KQu0I/YzW8p9PdUlmHeAQ+M4GKWVhYSJ5QkTAVDup8oNDPHBfIfdnMqG
	rE=
X-Google-Smtp-Source: AGHT+IFAOzGnnAJoS1b7fKcAUNiyowiDf8ahXtFV0LF9WI6V8jVnkBjSeTXMmxuF7zshlHQClIscOQ==
X-Received: by 2002:a17:907:944d:b0:b6d:545e:44f6 with SMTP id a640c23a62f3a-b73483674admr338161066b.12.1763042730387;
        Thu, 13 Nov 2025 06:05:30 -0800 (PST)
Message-ID: <6352ac82-e8c9-4c63-9603-f31a0e9d737d@suse.com>
Date: Thu, 13 Nov 2025 15:05:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.20.2 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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

All,

we're pleased to announce release of another bug fixing Xen version.

Xen 4.20.2 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.20
(tag RELEASE-4.20.2) or from the XenProject download page
https://xenproject.org/resources/downloads/.

We recommend all users of the 4.20 stable series to update to this latest
point release.

Regards, Jan

