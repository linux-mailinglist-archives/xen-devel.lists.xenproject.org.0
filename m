Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5765ED01C8E
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 10:17:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197416.1514948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdm8b-00016X-V6; Thu, 08 Jan 2026 09:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197416.1514948; Thu, 08 Jan 2026 09:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdm8b-00015i-RB; Thu, 08 Jan 2026 09:17:01 +0000
Received: by outflank-mailman (input) for mailman id 1197416;
 Thu, 08 Jan 2026 09:17:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdm8Z-00015c-UW
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 09:17:00 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7ce5755-ec72-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 10:16:57 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so20417045e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 01:16:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacc5sm14743651f8f.5.2026.01.08.01.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 01:16:56 -0800 (PST)
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
X-Inumbo-ID: c7ce5755-ec72-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767863817; x=1768468617; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bSZg6G2K02HYMv6dTp6lcuQv6mC9nXI1R3vXW4BMuo=;
        b=VO6hbUe+KGfHt+JD0ngIRgnUh8n4P0rEjXw+K+vpW7a4YX05mXKwGFBrOnuc9+/OOP
         I2rGa/wsqYhrkMwtcl7oL7a8i/UV/NmoRC/hXb8XphVA2KJLl6eRDnqucuavfb52vsF0
         SuKhPsRHV8toV+j32hxjbJDhlvPiauhoThBtycjhA+/FBx8rJLFFYxkLvA3grHTxq3vA
         BtAIM73jquhh/bfFXlqhNntE+zlrFbTiszZXk0OrY28eFOFzW46n+KhnA+ZoYX0z9f5A
         wle+6F5n/XOa5lUOdx0oEgDYvcFmcyQlsoI9PqgWlh5e8zMa98Eny5uhcxN+PU8PKpFW
         DOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863817; x=1768468617;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5bSZg6G2K02HYMv6dTp6lcuQv6mC9nXI1R3vXW4BMuo=;
        b=TCqwuFc57vGgswmiTKxC+EmilhiR9lHMKrSIlR99ug03cMZQvi8JLOVzXpx4gRbv5R
         N/O3bXRxxqg6aPQ2m6WOx8ZlQi8pUil8WGV9bawUHEvQh+KUTK0D3+ipBQ/9eu8dCFQR
         lVNE92hTAhKX0/JONlMx2X7Z5SvQZGlMbvywc1ZizvYskYWII6HOpRjf09Gfdcw8KVwN
         hChihvGYW09f2U2WcKExYAWbz2rjdgwfUagSivVf2M1OumtZ9Ap0dfIgmNAMtj2Bf2FN
         ptlXJm4vH5kWUoM2pY0ZHapg0y1qtQvhub9Dq1LXjVRtDZSVFab//ea+JDNhYyxOn4lK
         XNvQ==
X-Gm-Message-State: AOJu0Yy52ge2ms2kOgp/zJfZf7dbDSBY6K5as/w44ZpafPcECvWvRp3G
	VQNAtb7a+VLYllSmWcP9YWMsZVf7ds6HmVON8t2CdeL4o3rHxPseXR2T5WlBxkqr2AJnLWJszh7
	37hM=
X-Gm-Gg: AY/fxX761g8Hbl+tWcTc1PYjvZzTampeulmF2ouL53OCpwiPbZKyzTG5Hs8XpmrS0Lm
	yDbYeI0okPJElJROJtlug+NUgD3LFqEnWqOkLNdgFO5bjXfoMXfIOaQBAiS1B0G+Pzlh7rBOKHC
	60dOI6vpfzuszMG2YtqnDeQBPING78twH00CjKQRa0Q5carz/fAnMkXO4zdR+oXwKcBJWpiIvZH
	3o4pRra+FOTHdGknQzXI74pfz2Rm6oMPnt+Aqtc1MbqrSshuHoe5EaJjtGWo+CJKs+pchDKP/Sk
	Jg8uhuu5LJJTJXRhIu8BcJVOj7b72Dwl8do2QBAcT04/2Ry/jlNLAritB2eKbY0T7H5CYxK2Rit
	a7ejcF1QrNmIfSyrFu+WTGn5EJIAsO15HjSfVRZc3A1hFhMuPH3CySCTZEuJEUa5LxdE43iCROh
	MkCgZnISQ9Gkz1NKFYnSvjsLpvxiC+5CK6yEmx3f31zROUYeFFP0auLKLwwUc4uvnkiwbDW2fZf
	IM=
X-Google-Smtp-Source: AGHT+IGWPstROHVuTt2BfhH/vFV12wJ7cCQwG+Fd26st5lAZjRHQZeSCKzCw8Eutdp1d10bnQ/YYjw==
X-Received: by 2002:a05:600c:3b19:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-47d84b3b645mr67097935e9.21.1767863816633;
        Thu, 08 Jan 2026 01:16:56 -0800 (PST)
Message-ID: <6b0fc1a8-fdee-40dd-b3c6-262c33607715@suse.com>
Date: Thu, 8 Jan 2026 10:16:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PVH: mark pvh_setup_mmcfg() __init
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

Its sole caller is, and the wrong annotation would cause a build failure
(non-empty .text) if the compiler chose to not inline the function when at
the same time LATE_HWDOM=y.

Fixes: be52cb139f57a ("x86/mmcfg: add handlers for the PVH Dom0 MMCFG areas")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1310,7 +1310,7 @@ static int __init pvh_setup_acpi(struct
     return 0;
 }
 
-static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
+static void __init pvh_setup_mmcfg(struct domain *d)
 {
     unsigned int i;
     int rc;

