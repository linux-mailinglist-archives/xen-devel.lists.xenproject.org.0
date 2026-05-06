Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBeVD/UL+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:37:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 925FD4D8B8C
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301433.1575718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYhO-0008CV-NC; Wed, 06 May 2026 09:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301433.1575718; Wed, 06 May 2026 09:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYhO-00089n-Jn; Wed, 06 May 2026 09:37:46 +0000
Received: by outflank-mailman (input) for mailman id 1301433;
 Wed, 06 May 2026 09:37:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKYhM-00089f-RS
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:37:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYhM-00FTsG-7u
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:37:44 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb0be1-e002-0a2a0a5209dd-0a2a4506eae8-22
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:37:44 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb0be7-7371-0a2a45060019-d155802ae136-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:37:44 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso65292125e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 02:37:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e52f5e668sm17102985e9.0.2026.05.06.02.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 02:37:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778060263; x=1778665063; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qs+DlzY0nmy8xATHx3GZkcu4RgtuaNdQ+SDz1pEbEHc=;
        b=VqDc26E8ubmFYx1fzxaU06L5XwWWNVzsnmsHc9A0q6gK4wvwZWkYwxiaNB3A34n0tN
         n3OeByuKlVGSfAjRiD+A51d7VamdG4PaK5/UCzlZQtpApA1QKuaYidcNnelVla+sLbRg
         CPAhVXBSa70VIqvJotMX1PF4MDJddymKz3z2pdPosKxBCZmb9no5f56P2eWZ5PioriK7
         mnFatXS6rkrEJC1zA0gCi5l/UXq62oGmw8ZMfCgmSyWVmG49w3r5GwNa1RjcWFow0f8X
         jVao66+uYLIFLGrFvX17b9zEz6cgMVN8+Fc98O+Q7cm09l9Q39es8mfmS1D5H/x9b7ca
         eq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778060263; x=1778665063;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qs+DlzY0nmy8xATHx3GZkcu4RgtuaNdQ+SDz1pEbEHc=;
        b=bvaabvhS8W2Sch0VgAps4VNbVfRMG3E3fBAtYJgMVLWU5+YpLxmSl+OIECvp8cqUD3
         oB4MMFa0Kp/AM5J0rFgQ88ERKcKPbakXyjP7S5fimmjD1cIbPd0Bea8kB7J3aDK9f7z2
         tgI3txPuaGP+SF39Op2viD+u2SkQIqiRNS73lmphia2PrEuI/amF2hcHIdH0PP/j9gI+
         /4iV5FZf/AsLeBeUiEu4qHn1fRXcsR66QcWhQza/2Af2Bke6jGRuhDx/B2sRAaAQpcVu
         /iwtCdahYl8yDyBA+JnCRxcxfDHZiDFOU7Wc87zT9BCtNzwbpfOy60VkS07JxlP6rK2f
         kqdg==
X-Gm-Message-State: AOJu0YxTtM+JNaRhbdHd6R2GE8GwycoPY4/nEeJxErKLEQBE4QLjHA3L
	7LaSio6w+pB+QHskDQGIGIqlgaHYHENezaPlIxe3boncRm3w26jRcAicNIaL1Tgt6LA7d07fHni
	rLVA=
X-Gm-Gg: AeBDiesv6W7t4XNpcDMapahi3T8kjCuoLlgjb/sQPiwyWZ7OcTYQdXwha8T+tVbQgnQ
	zjL+XF40CPrT7w3Az8q/l2dRhangyQThDTEXRQ14kjtn5myqLU2CBwCIcSAIUZ5O/5sM738tHpM
	HBmUMFRCdTUCkaZCcEeLmi0PT8spj2vKwHocC8Q91uKt1fs3HzXtmBHEU9jDOXquZ5pKmyHKeWK
	VFmSviIZSzIKp16Wt8Zpe5ulq5mZPUTNfVIoLo+C9J4u+7005uBct4QT/aA07Qz+yDQIhWt2LUz
	o0qAPwnSd1wW3nLswTNJC/pQO/Ayxr0XSg/RtfKVlsILumOrL/t2TQeppSRiD9SfSO1qZkKwtSi
	QRzHHF6aoMRF/bYLf5ZBg0XLLsreirodF8PkSusPZlxK5Gc/C/6dXb5Q4S7PjArV9I+rJlonOWG
	cgQCD0xlOcY4/nKJQpDogRt3+uYH8rKJLVpimgvY6eC+H8owtnipiZBQJNkXJG6EKN1ONVhfUwF
	wg5RNJKqutyHWLsvVlHj/fh9A==
X-Received: by 2002:a05:600c:4c97:b0:489:1fa4:50c6 with SMTP id 5b1f17b1804b1-48e51f45c63mr27839125e9.20.1778060263514;
        Wed, 06 May 2026 02:37:43 -0700 (PDT)
Message-ID: <746ce9af-156b-4c16-8cc0-6e8d929107a0@suse.com>
Date: Wed, 6 May 2026 11:37:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] x86/time: avoid early uses of NOW() to return zero
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1778060264-84566D75-AC2B156B/0/0
X-purgate-type: clean
X-purgate-size: 2361
X-Rspamd-Queue-Id: 925FD4D8B8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Waiting loops like the one in flush_command_buffer() will degenerate to
infinite ones when used early enough for NOW() to still return constant
zero. Make sure the returned value at least monotonically increases.

Do this only in get_s_time(), as producing a sane value in
get_s_time_fixed() for non-zero inputs won't be reasonably possible.

Reported-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: This breaks at least the TSM_BOOT case printk_start_of_line(), which
     checks for NOW() returning 0 (falling back to TSM_RAW in this case).
     For now I have no idea how to avoid this, except that when CPUID leaf
     0x15 is available we could leverage that to put in place at least an
     approximate scale value. Doing so could, however, lead to a
     discontinuity (returned value moving backwards) once the final scale
     value was put in place. (Note, however, that such a discontinuity can
     also result from init_percpu_time() using the BSP's scale value as
     initial estimate for APs. Then again local_time_calibration() at
     least makes an attempt at avoiding such.)

RFC: While generally the mentioned waiting loops will take longer to time
     out, on a very fast CPU tight loops may time out too early.

RFC: In get_s_time_fixed(), should we perhaps assert that the scale was
     set?

I don't think Fixes: tags should be put here. If we did, we'd have to
enumerate all introductions of early uses of NOW() (or get_s_time()), with
the exception of those dealing with getting back 0 (which I expect is only
printk_start_of_line()).

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1668,6 +1668,20 @@ s_time_t get_s_time_fixed(u64 at_tsc)
 
 s_time_t get_s_time(void)
 {
+    /*
+     * Before the TSC scale is set, avoid returning constant 0 (or whatever
+     * this_cpu(cpu_time).stamp.local_stime is set to).  While the returned
+     * value is in no way representing time, it at least increases
+     * monotonically, thus avoiding e.g. waiting loops to degenerate to
+     * entirely infinite ones.
+     */
+    if ( unlikely(!this_cpu(cpu_time).tsc_scale.mul_frac) )
+    {
+        static s_time_t counter;
+
+        return arch_fetch_and_add(&counter, 1);
+    }
+
     return get_s_time_fixed(0);
 }
 

