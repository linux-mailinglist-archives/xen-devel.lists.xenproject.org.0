Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3719D87DB
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 15:25:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842611.1258287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFa11-0001Na-35; Mon, 25 Nov 2024 14:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842611.1258287; Mon, 25 Nov 2024 14:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFa10-0001KR-W3; Mon, 25 Nov 2024 14:24:38 +0000
Received: by outflank-mailman (input) for mailman id 842611;
 Mon, 25 Nov 2024 14:24:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFa0z-0001KL-Lt
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 14:24:37 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe070939-ab38-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 15:24:34 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38245e072e8so4518549f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 06:24:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb4ecd8sm10512288f8f.60.2024.11.25.06.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 06:24:33 -0800 (PST)
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
X-Inumbo-ID: fe070939-ab38-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzAiLCJoZWxvIjoibWFpbC13cjEteDQzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZlMDcwOTM5LWFiMzgtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTQ0Njc0LjMwMDA4OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732544673; x=1733149473; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E7rL2p+3PZJcbrmWuAkJoQaV4Nffxc4O4oIoBSP8VR8=;
        b=VzgCmLL5T7uHb7sAXNvwncFMJEzzLGCXxUqap8h9g4ZqZtr8kDWmKm2FfriQq4tAIc
         Eo6D6slZ/L7BfM17JqZ4eS1WLfcyfboCjUZEp3Cgc79LMI8m4zk7EeNdADLRxfzgqdPK
         /3wvgUquRgs0eawjbEQpgkktUy/fqwB58p5CCccFPw5KW4R/j6/38RPRY6SKUUd2Wubr
         XfzMbpUcTjPlnS+E2xW/b9K6Pf4j3DeAW+tlySoFApkKq4zOgQ70SgF+muHbYCDwtP3v
         vnbQ4Kbeol4LOEjFDcHVXuFveL16z4rPB7RfZthftU3jhj32pcq1spDnRMXVLILriqhz
         vSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544673; x=1733149473;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E7rL2p+3PZJcbrmWuAkJoQaV4Nffxc4O4oIoBSP8VR8=;
        b=OPULzvNvG5425QnOCjuXPCUrk4/qSiu7lTGc5o24HXaUdSP6qbZJ1derpBS5SvwP4V
         5tyRrakM/BAx+dwUOmAgd8NBZs+Q6hQ0aKQI5xeYb3JQR0Hmkyc+1mRyJj/Ou9pg8Hb2
         MyViclLQHtodwIY+h4mcyptkA+3/vcepLDcKS41M/+LDq8etjlVFdM/u0hKmi1RbFBKo
         TzyKiIwwkI6CZeoEQKpoH62+KOsrnVAFuhc7GqhEbHXhfIYaPs1Luw5hezwQimh9Nzxt
         2Y5XxyZq1Ar6ADGE/hcBh0P6BH7FkuHzGsHz0SScbd2fz4akBY2dhjCPTXTRouCT0Awb
         8fNQ==
X-Gm-Message-State: AOJu0YyEa5JpCg2afSL39jzsUYUkOkCCW5ZJvNElFumQzlClvWAlK301
	0YZs2L1kf7cEsTKaL4Xr+KVB/30ZS9XY1VJdQmEZ6Wd/4thKLaj74sr8YCGV0NZiWVvSLAW6YcA
	=
X-Gm-Gg: ASbGncsW+Q48vd51YfeqbleZv5ZG2ztVtWSsFgAued2GYXYi29SWu9hrQ8xe279kbdP
	MaMaQ9yv3B/9Q81vgzHNHSEbgLDpW/fT790GTrDh8TddkLykT9HY/S9zzubsOaypxpOG6Da/o3i
	k3nsecf4oDhkMl0c40G5HYB4cd3S1DnWgpx6/HqQqlcYKGqkZWSYC6xJbx+D5F00uNdMeIuKzGR
	y7yfM/DXV4mZQWka70GVRkqVP0VLW+7aAALLD27X08f9OH2KB+LVhPmgGPMmSlsbIbJ3QL3Utk6
	FI7HRnDg4x9pGreSk2t2y4MObq8kBen8RX4=
X-Google-Smtp-Source: AGHT+IFbDjFkcbPwQ+hwRaxzAKz3tD8yviJe4bXIIHr/D5MChjCedX3qf70+Ub/KxDtrubFUS7mCHg==
X-Received: by 2002:a05:6000:381:b0:382:4ab4:b3e5 with SMTP id ffacd0b85a97d-3826088e2b0mr13174440f8f.0.1732544673591;
        Mon, 25 Nov 2024 06:24:33 -0800 (PST)
Message-ID: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
Date: Mon, 25 Nov 2024 15:24:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/7] x86: memcpy() / memset() (non-)ERMS flavors plus
 fallout
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
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

v3, apart from the new 1st patch, submitted mainly upon request, as
otherwise there was just some re-basing over the 3.5 years since v2.

01: x86: suppress ERMS for internal use when MISC_ENABLE.FAST_STRING is clear
02: x86: re-work memset()
03: x86: re-work memcpy()
04: x86: control memset() and memcpy() inlining
05: x86: introduce "hot" and "cold" page clearing functions
06: page-alloc: make scrub_on_page() static
07: mm: allow page scrubbing routine(s) to be arch controlled

Jan

