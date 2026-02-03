Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJY3LjgngmnPPgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:50:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D15DC43D
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219416.1528295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJav-0004lo-OS; Tue, 03 Feb 2026 16:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219416.1528295; Tue, 03 Feb 2026 16:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJav-0004jT-LF; Tue, 03 Feb 2026 16:49:41 +0000
Received: by outflank-mailman (input) for mailman id 1219416;
 Tue, 03 Feb 2026 16:49:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnJau-0004jK-1f
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 16:49:40 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5394b2a4-0120-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 17:49:38 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4801bc32725so45340605e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 08:49:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830512e61dsm73209105e9.8.2026.02.03.08.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 08:49:37 -0800 (PST)
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
X-Inumbo-ID: 5394b2a4-0120-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770137377; x=1770742177; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hsihNRRAUO9irjyqUmGl+lYbNZkIHXJWPrKLzjEl7yk=;
        b=d27/gVMW0dgCW5fycMRRMONDxt5VtrUc+jYbcyrvU3GpbWgLvNVJQziC/NIdy4Hkmj
         XWnKj4hl+HahwnUIoa/tWA1ALHnf04I4EIVAPReRU0y4lpGRmp3CvJsrqF0o8OLARtk7
         52+S3qeMKmI6fTsk5zkptCQkrq9B1ZFE6rXGvXzSY2QjV035zf5qxJ7VsMScc0NxiNnm
         Ii2yY3XO8ERDQHCfC5EScMx8dTk0GMPBwAQ3uSeoS8mRH3WirXrUIlV3oO0qkI1wKpbH
         /MXnJs4oMJRYmTxXGE2nMSpXNk4DRi+G+khHdON5Vh3pqXtpyiW2Rp7Tn1ewnntCw+YJ
         LZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770137377; x=1770742177;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsihNRRAUO9irjyqUmGl+lYbNZkIHXJWPrKLzjEl7yk=;
        b=dZlNSU50ABndHyyalHo1vWQEUWWYY4u5Z7KRlWBAB+AWXxtqYPQoaZxmQt/jD8xuOL
         Beny4Ezg+Iyl4SOhIN/acXDO6pDZUts1/j442PjWALg9TcJCZhXggd35luvsOiGk+/Fl
         mSTxeRfvyJq+rMRtcj3Yztjy96tNtIIyUesab4OkTu/uCQXqQKCi1EcI8AZDCfzbNZoA
         21itmqcVww6n9tVgQDs9oITFaH0qYAh6OGM4BTd5bGJHmx2RlmLjsNwPF7x+OiYFeTaH
         WHj4477H/8PDOPtGk3ggFTXJnV4kvYGk1AnCiyMl/1oyzPf8nBmeY5hjY9pj9UIxhDDf
         17PA==
X-Gm-Message-State: AOJu0YzpOllN2h78BuReqjWnxbfdmTgEukkM9eOvO99Ea+1SFFs2KdnU
	y/ESPQfXCr1qYW5z7LiQE94FiZPHb0CV1pjNBKlMNcftfcw69JDIY+hPKV/1E7VPLh1wP8uhM0E
	D1PYtRg==
X-Gm-Gg: AZuq6aIt1W2BXxlURoNO8yUUvZZM8vIifbYBeCpUngMcckJjYLicj7NM0Wg7gsQiljC
	QJkaYgpyRxQgBxN6+VokPG/ws3f362nR4b3RdI3tz2+sQIwQetMrroPfrB9HYN0H2uGaGpvmtLZ
	k7QaUJCxPxq4wxq4XTbB5FFtat4JPxIyPClLufNc73Kr10nAyC4vhiPBCeRqzNRjjECR+Ib2suy
	qmT3lv285oPX18SO4klGvoRsUls0jCVG13uCYwZvNz4isI7YhRsDoN5mxoff1263TDoQgkEr94c
	7raEKzH2B2JFW/XQ1SemPMu91qZKKyPv4CVAu9CHdy1RuMAdh91LXnRFvjNPM/FLRHvt9xplwaS
	7aQK0ceBfaIfEbr2w5Vp9ukC/GxLeoQeXDF/MJbDfQWiL6p0Lk0mmjozeoaviqGVZHH0AZAl9HK
	Yx0P3OYha2wbjJR5oO7vV0HDhqSPD4X6ctY20nBf/HFsIdtGM1mQD6r47BK19xKxE5F1/Zc0gag
	1HyxThvcLMNTg==
X-Received: by 2002:a05:600c:1f08:b0:480:6941:d38b with SMTP id 5b1f17b1804b1-4830e991a8emr3540515e9.30.1770137377374;
        Tue, 03 Feb 2026 08:49:37 -0800 (PST)
Message-ID: <c6aa40de-11b2-4725-b18c-8a982e43f0f0@suse.com>
Date: Tue, 3 Feb 2026 17:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/3] x86/shadow: unlock P2M slightly earlier in
 shadow_track_dirty_vram()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <5149ab32-7d03-4ae5-9af0-e62dd5836329@suse.com>
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
In-Reply-To: <5149ab32-7d03-4ae5-9af0-e62dd5836329@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[37.24.206.209:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 28D15DC43D
X-Rspamd-Action: no action

There's no need to call vfree() with the lock still held.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In fact for the purposes of the function the P2M lock could really be
obtained merely in read mode, and it could be dropped immediately in both
the main "if()" and its "else if()". If only there wasn't the error
handling after copy_to_guest(): Dropping the paging lock ahead of that
call, we rely solely on the P2M lock to also guard the changing of
d->arch.hvm.dirty_vram.sh and what it points to. Question is why dropping
the paging lock (but continuing to hold the P2M lock) is necessary there
in the first place.

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -1219,8 +1219,8 @@ int shadow_track_dirty_vram(struct domai
         paging_unlock(d);
         rc = -EFAULT;
     }
-    vfree(dirty_bitmap);
     p2m_unlock(p2m_get_hostp2m(d));
+    vfree(dirty_bitmap);
     return rc;
 }
 


