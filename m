Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMtqE2YngmnPPgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:50:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCA6DC459
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:50:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219426.1528315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJbp-0006dJ-9D; Tue, 03 Feb 2026 16:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219426.1528315; Tue, 03 Feb 2026 16:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJbp-0006bf-56; Tue, 03 Feb 2026 16:50:37 +0000
Received: by outflank-mailman (input) for mailman id 1219426;
 Tue, 03 Feb 2026 16:50:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnJbo-0006bJ-0k
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 16:50:36 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74e040b3-0120-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 17:50:33 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4801ea9bafdso26650015e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 08:50:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482dbcf9c3fsm144236995e9.4.2026.02.03.08.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 08:50:32 -0800 (PST)
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
X-Inumbo-ID: 74e040b3-0120-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770137433; x=1770742233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ArrlHuUWuRHWGJM3SpePVZfqjLgEGNYvg8IJ6jwvR5M=;
        b=du0Unn1Ossf2Pua17GboRT5/mDmLDThoiLIzjqY1tUUYoZygZXndjEohWhL4zEuqfm
         +60m3wwsfA+pj9l6ghVAaHy6ayOOqThIXhDa/u0VjsyDOgpW2IIGXHu2XLLT8JYQicFM
         cNyrIFO86DY8k2ym3mK0VCKyBsrr/bHJlqAaXFo6w5GctJVXWHUo6bfzh7vDOX9cpMBC
         P6MSvUNaN5oOrew8lTgut4j62VS7Ht3NIH3aDtkwzAB7pgPCKpWEG+YgQxJsNNLlOCuA
         gHDb71KTrDBTQzml+DHCa7RhVRmQrB0TrcDgxeSs9LtkDmW6ZIrrGgY1XOticaUTUjO4
         +aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770137433; x=1770742233;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArrlHuUWuRHWGJM3SpePVZfqjLgEGNYvg8IJ6jwvR5M=;
        b=XXlEv7JLnGp+QwX7wXPQ1C/mt5ACVyK1Xi/pmHxrtoUSriTyb2Q087pHzMxrCFJ6ni
         U9Aw0J4mNaJqhMR4HD07rfV9I7d9HUetjzg9GeUd5YA0+2JPrkEmfiZBLY/OqiaQ1nQO
         tiu4euFvZoB0gbcnjqa30tFLIi5BjaKqYspdM7Oqpk5rP16Iekg+gjqWe5V+uRl58MfL
         EBjJgRPg+J7TtSFq6SGWFm+hK1cnXJsI8obYgNj66L3lp5TQSUN4XQG4XyY+DJO3BYqB
         lHLOhkTYiekOVxWQz8qga1vczpOwAHccSBnBDVXhhzWNUv9brpCbzK6sgc9DzCBbfH9y
         AM2g==
X-Gm-Message-State: AOJu0Yz7G08wz7HFg9FRLWdVkVmK3dPE7hJ6rmt8u5gShTi5E9l8Ftkj
	/WVckNeIyCsqtGHMid7hTJ+4bs/PEa210RSSO5+MrqMO4dyoE0u71S1z40uAVc+FuV4QVmwVXhu
	zQD0=
X-Gm-Gg: AZuq6aIvoPYwF+UoQ7227hwAOJ3XhQM6mzSsk7GXsqUb8b9JuUne7TgtzNKPRtlfP6z
	ugTgyF93pK0gr4ZFXefdnMaLr342bbeTO1U6tHfpPRd2Ut0+P8GLSPWcEM8j3OusC0LHaqBg7md
	60GVD56Yw7pY5TqTVB1HYEzg2EWyZ2fbT9cGJZcQmYkW9/o4rFyG2PsnGDfT81NYtcvS6FkYgtR
	kcevCJTFzu9R5YWhAKeBi6inwJCMz470I+s6FIzkAlHqB9Dgsth2MzoFTppmFVWgYwpz8eGIL2i
	tcmVU67g9GjjRAu6wKT3xeQbk2p99IR0+l2KI7v4yCVTc18PuoSAI9Gh2lnmLOecJvtAqr/nXa7
	2n1peE51JTJzo2G4BtGyRRA18tEx8PwKQlyDV90b1mZFXFoZKwvQsy5Z6SNeLZmFLohqZf01Z77
	YgoqhvFYOGZsSJPuw+zpjWIf0jCS4MrQ3Ar5T3mjP90Lb5qQ3XFo/lht81yOEX2d7l7iSV9Z/CI
	ss=
X-Received: by 2002:a05:600c:5295:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-4830e96adddmr3271045e9.19.1770137433181;
        Tue, 03 Feb 2026 08:50:33 -0800 (PST)
Message-ID: <38581c16-e2a0-4f7e-a08a-3517063a27cc@suse.com>
Date: Tue, 3 Feb 2026 17:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/3] x86/shadow: reduce flush_tlb's scope in
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[37.24.206.209:received,94.247.172.50:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: ADCA6DC459
X-Rspamd-Action: no action

It's set only in the main "else", so the declaration as well as the sole
consumer can also move into that more narrow scope. This may in particular
help with possible future locking changes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -1022,7 +1022,6 @@ int shadow_track_dirty_vram(struct domai
     int rc = 0;
     unsigned long end_pfn = begin_pfn + nr_frames;
     unsigned int dirty_size = DIV_ROUND_UP(nr_frames, BITS_PER_BYTE);
-    int flush_tlb = 0;
     unsigned long i;
     p2m_type_t t;
     struct sh_dirty_vram *dirty_vram;
@@ -1097,7 +1096,7 @@ int shadow_track_dirty_vram(struct domai
     {
         mfn_t map_mfn = INVALID_MFN;
         void *map_sl1p = NULL;
-        bool any_dirty = false;
+        bool any_dirty = false, flush_tlb = false;
         s_time_t now;
 
         /* Iterate over VRAM to track dirty bits. */
@@ -1158,7 +1157,7 @@ int shadow_track_dirty_vram(struct domai
                              * _PAGE_ACCESSED set by another processor.
                              */
                             l1e_remove_flags(*sl1e, _PAGE_DIRTY);
-                            flush_tlb = 1;
+                            flush_tlb = true;
                         }
                     }
                     break;
@@ -1201,9 +1200,10 @@ int shadow_track_dirty_vram(struct domai
             }
             dirty_vram->last_dirty = -1;
         }
+
+        if ( flush_tlb )
+            guest_flush_tlb_mask(d, d->dirty_cpumask);
     }
-    if ( flush_tlb )
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
     goto out;
 
  out_sl1ma:


