Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C3EBF0CCC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 13:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146159.1478626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnxb-0005B8-Vn; Mon, 20 Oct 2025 11:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146159.1478626; Mon, 20 Oct 2025 11:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnxb-00058K-T8; Mon, 20 Oct 2025 11:21:55 +0000
Received: by outflank-mailman (input) for mailman id 1146159;
 Mon, 20 Oct 2025 11:21:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAnxa-00058E-5Q
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 11:21:54 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9b12817-ada6-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 13:21:51 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47100eae3e5so39349555e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 04:21:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47160987184sm59788055e9.11.2025.10.20.04.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 04:21:50 -0700 (PDT)
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
X-Inumbo-ID: f9b12817-ada6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760959311; x=1761564111; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yfju5TuSYr1gnKBFs17R38Pvw/Jb2fzNTTH63D/Pa3U=;
        b=EVoV4FFZ9R4OPzh/RUdqZM4nmyJL+xldLXM4kiY2Wh5WHuxUNmt3hkYP2VN6o0t8n3
         mQ+FZwkeO5numFXz1RsRwhZ+5DTMkw4y8Djwwid0rBACSot/+lKQlW4I2K1R6W0z1DzV
         aywrOlKgwEuegsyQsfo+vVPl4CHs0I8gHiy9F+buQcekxChHEbeOKBkZ7Ref4zoGtI68
         Rb0BfjfeGl+sQWlMrI2LZEIamCIP+Sbs84XPQT2yDLObFcmj6vo9tqQ28SYvy7H26iC8
         CCRFwzY2ly3sOFfxRoflEAfYJrkeCk5U7C3d0qQ+4Sx7QXWk/JfP3p9Cy+LdlT/1Au2b
         4ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959311; x=1761564111;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yfju5TuSYr1gnKBFs17R38Pvw/Jb2fzNTTH63D/Pa3U=;
        b=GKNyAdiyAxYdYPXvRjtddNLnaciCAF/GSWgTmHeMF+MyB1s9uk7Ee1+NTESOY68jfL
         RuPdCSyN7JCJsRZI6FHA5GW1Amazkg0n1u88ebtby0V3ozTMEwm14GfcjEC3bteddDnt
         cE1G+Di1kygZRtpbDIHHs6ZwxvEjTWyGx33PSyIA2gTh3G94sL94WKYhq4Gv+OCmtdYj
         iImuN8frufq5cq2sKqYjNc3qVFI7C4EZGJ0gQaYAirZ7KPMeQb3w2heHi16wjXHpy8Un
         DVAuiZc/eXbATKzI3UcNhlZDQR5cueQHBvKT15yw1KRrgxwkYpcpAMbKbm49TmhVaIBM
         iAgQ==
X-Gm-Message-State: AOJu0YxN4BHJCYI6jYZqNTQ367e6vO5W+gM9K0hH30a/UCPA7nOFDBtr
	l7eDRyxsVDHdDPgfWTSaYVlPi27lSeYEAtJHwnxWyT6GGqmnGB/qbByNKbY7GvqA4vigzTAbz+w
	gdv8=
X-Gm-Gg: ASbGncs9I8MDNLPaQyztjrxvOWLtgK4hUSKASuYCgqlrVa++QOwBhDCxLGWWQtaRYqt
	d86UXzDK10X1BDL9gwd/oHdQAJIwfuZ5s0kneULiI77/ySIMpCnUarG4Ust5z7C88fbkzhUi2qf
	/SZ0SU8xmKuccMmuzyYk4qBTvs4kGCSgbTluTO986ALB8MBUV6XxPlOx+uDux5FhfRkvcM8ij+6
	K64GY0KA8xq/aMVUXF4zMUZmErgaOoQECg3TZhuUs6QGRRj7ln+VLxQoARw9EfIV7c4yL9rH52O
	0MdNa15wPKjlpABWcLM21EHRJtfxNa3I9o41ulAdBPeol/OYyFPPX9ittq62DJLyRpmnXmikgo5
	sYl/EBJ/ek5lUOmFiQWFTiWOuwIybdzjomQn0AQn/Gi2dQTgyabXCows1OmqwoPXUuHACJVwAPr
	Pky0EWUR0TZzZNLgDNHcrmPNjS5KrP/mNlHlFesDN8VgVY9EYlP4S1M1RXHV2NOKPmhTIMAMs=
X-Google-Smtp-Source: AGHT+IEtmGDyRsBl9htJ526cm9h+9wIw5KznJsMXYVif6/SuHdjk7VYyyZ1p99weciLPSfTIwx7dXw==
X-Received: by 2002:a05:600c:3488:b0:459:e398:ed89 with SMTP id 5b1f17b1804b1-4711786c586mr89914955e9.1.1760959311006;
        Mon, 20 Oct 2025 04:21:51 -0700 (PDT)
Message-ID: <65b6c05b-49f4-4a3e-aa13-abf5da99f9cb@suse.com>
Date: Mon, 20 Oct 2025 13:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 9/9] x86/HPET: simplify "expire" check a little in
 reprogram_hpet_evt_channel()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
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
In-Reply-To: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When this was added, the log message was updated correctly, but the zero
case was needlessly checked separately: hpet_broadcast_enter() had a zero
check added at the same time, while handle_hpet_broadcast() can't possibly
pass 0 here anyway.

Fixes: 7145897cfb81 ("cpuidle: Fix for timer_deadline==0 case")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -147,10 +147,10 @@ static int reprogram_hpet_evt_channel(
     int64_t delta;
     int ret;
 
-    if ( (ch->flags & HPET_EVT_DISABLE) || (expire == 0) )
+    if ( ch->flags & HPET_EVT_DISABLE )
         return 0;
 
-    if ( unlikely(expire < 0) )
+    if ( unlikely(expire <= 0) )
     {
         printk(KERN_DEBUG "reprogram: expire <= 0\n");
         return -ETIME;


