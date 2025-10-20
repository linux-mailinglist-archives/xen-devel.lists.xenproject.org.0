Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4ADBF0D26
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 13:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146193.1478657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAo1g-0006oH-TE; Mon, 20 Oct 2025 11:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146193.1478657; Mon, 20 Oct 2025 11:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAo1g-0006me-PR; Mon, 20 Oct 2025 11:26:08 +0000
Received: by outflank-mailman (input) for mailman id 1146193;
 Mon, 20 Oct 2025 11:26:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAnx1-0001y1-9g
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 11:21:19 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6213609-ada6-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 13:21:18 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4711f156326so28740375e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 04:21:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b9f9dsm14822154f8f.39.2025.10.20.04.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 04:21:17 -0700 (PDT)
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
X-Inumbo-ID: e6213609-ada6-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760959278; x=1761564078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/bovBnMZlpdcR5xnSOmFdCORNaMff19Gz4ZDC+SsaVo=;
        b=Jwm/qoTpS3+DoZnfu86ydyF6w/oTxnqUmDQB5AMCzMjW2wC0zPt+s50TZo4/N6HrTY
         3OVcPFUAjOacGiJVuOJHELNgITz4QMKl0SOuvPcWVFGRE6acvwMdfBnxNtf0CHH971PG
         j4caC0/fHjoJ50Q8nbJ9lEA/NXtJWig9xIczh7YhU1prRZ1Yk/h6coYiFplNpkV7BLWk
         5biM0TEG2uY8Tq665if81DqRbgvd9cFjMhH9CSUSmTi3vujDMh4YerWxBTCNST1rjiUa
         bxQG+0c64uNaVJ1zCuYrooOznVsV2wYpbA2r3/eCPbKc91gigms2s2YMzwB+TygOK7u6
         HSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959278; x=1761564078;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bovBnMZlpdcR5xnSOmFdCORNaMff19Gz4ZDC+SsaVo=;
        b=t8JUjwcoDKaKcSRpzV0T5Qs5ghD6eudIo5KROzYrrf9QOTm2serACO8RBu4uZQxxxE
         CnA9RN/n/0oVKmFfdtbrt23wfRa/3OPEh+20MNSlakq3jXg1QNwi/qVaaBWRL2BUDDDN
         molrHaJRgH8b0wIO7YfF7c2xJKgoxwV6K3RsD8yFOs08rhqtVcX1FFdPuHxY3RBrXfjZ
         jh7Z3yRV3xcLuFfI5rbpjwk9NeQrsrsoK6OLgKO2K3lhG09tNpNfyFwhh9j8WUyOhKzQ
         lEB/ht1GkvPMaTcWbZ/J8MVOFphKWasJAJ9qBZwyq16k7nNblBYF/4Ac4l7X+1B7PiDS
         npfA==
X-Gm-Message-State: AOJu0YxRRD7XtSvIQVxQh5d7+MkryB0S4oHLLri1xAEftohGi6oVhazl
	4HAqH3AdAfXtq/LRPhn684RNlFWMbbnZi6YRQphlvpX9uIBxTMgBgCm6PXgI0I8Oow5u+7KmTRf
	jvSE=
X-Gm-Gg: ASbGncvfpxBy4aQ6XwSUHQNhWzTyMFqie7tFSFiul3uQcGH7F2GWmxcwrpCnQMjJ1oL
	IGc4nqTdX1IrFABtHpF7Od/gz8hzwUJvDCiimEOCYvS0TKfzljPKT1BkS2zEDa+ObiQ8T46Gvsu
	z1IUQgnuYeS1r9ebGdrtocKp9GHgtLOOSy++c7JBTVuMXz+Ut381TvXB0iHLbUEqxfMZ4fdj5m6
	on7G1LYghDgnBohnJbpDupeHG4gn4LlmctjlyeOPhaYSNjXfLVj6sT0fqdUkkNe8qWM0ZXL8QjD
	wg6nDuwXnZKgIYZFMZm9CEBaPWhd9cwSkXmB8mvAXumt/1XfASudCAGvyIjJkpTrT2HnmVcxRxV
	V1/KsQ0Ba1wcaHFz3C/ZzQAKcVcxLHpYAcOe0RS0cghiEg2AQqN0PUZacaDmUhcg6qK9eiHnD1r
	/q+DsVaskij7GZj2e6Q/VKskg1MouWhQMcSeCH/3VdEl20RyziWSiBdfcb8cziFjFIoIqQY9M=
X-Google-Smtp-Source: AGHT+IGZVHllDvy8xBuSDysKAU/0iFJ7N0bKLzv76WL3TZeTF1MU7jcqslieCUYBzpX92bNpmmdgUg==
X-Received: by 2002:a05:6000:22c5:b0:427:492:79e5 with SMTP id ffacd0b85a97d-42704d7504emr7602131f8f.21.1760959278154;
        Mon, 20 Oct 2025 04:21:18 -0700 (PDT)
Message-ID: <2e140536-6e24-4de7-a5f6-0c0e19951f13@suse.com>
Date: Mon, 20 Oct 2025 13:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.21 8/9] x86/HPET: don't use hardcoded 0 for "long
 timeout"
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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

With 32-bit counters, writing 0 means on average half the wrapping period
until an interrupt would be raised. Yet of course in extreme cases an
interrupt would be raised almost right away. Write the present counter
value instead, to make the timeout predicatbly a full wrapping period.

Fixes: e862b83e8433 ("CPUIDLE: Avoid remnant HPET intr while force hpetbroadcast")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Actually - can't we just disable the channel instead of setting a "long"
timeout? Of course we'd then also need to enable it a few lines down. Yet
in turn we could then remove the enabling from set_channel_irq_affinity().

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -165,7 +165,7 @@ static int reprogram_hpet_evt_channel(
     if ( expire == STIME_MAX )
     {
         /* We assume it will take a long time for the timer to wrap. */
-        hpet_write32(0, HPET_Tn_CMP(ch->idx));
+        hpet_write32(hpet_read32(HPET_COUNTER), HPET_Tn_CMP(ch->idx));
         return 0;
     }
 


