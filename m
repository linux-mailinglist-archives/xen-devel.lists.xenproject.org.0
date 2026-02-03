Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJrHDUEngmnPPgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:50:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2778DC44B
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219421.1528305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJbG-0005Cx-05; Tue, 03 Feb 2026 16:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219421.1528305; Tue, 03 Feb 2026 16:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJbF-00059k-Sp; Tue, 03 Feb 2026 16:50:01 +0000
Received: by outflank-mailman (input) for mailman id 1219421;
 Tue, 03 Feb 2026 16:49:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnJbD-0004jK-Oq
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 16:49:59 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f6c0bc4-0120-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 17:49:57 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-435a517be33so3521246f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 08:49:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4360ef9e804sm11082497f8f.41.2026.02.03.08.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 08:49:56 -0800 (PST)
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
X-Inumbo-ID: 5f6c0bc4-0120-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770137397; x=1770742197; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jSrVgJ47FbXZI7U0CKTH4UTDBJca7s7Dks5/LglLXeg=;
        b=UczrCBv7BqVf1fbPOPppPBJ1enWYryDi8T132BjsyGBVeu/HnK85ZIqCcKKD2aonod
         mjv0/OJBOx8tF/rLlDnYIsJO6XxR+Enp0mZ3TW9J6tOCsxKtegdkTTGFRFgixLVKTSVV
         GNHuQsGdg44iVuv7qckZS6Dk5GJua/hkHPU47JuCYRI6rU+mvjKAczh1WUIw8YyKBGsy
         zOKoQwsdR+hojTkdlOMa8e7A7BPfe9xsO18Qiuy5jwqqmy1grq48tsn5C442FQs5kEkh
         hV/Mp+xDBex9FnaS1/1RkPbx6rDnO7qk15YO7lIDSPSvv9LAtzH0hxEGKWCkzDUc34ZR
         OYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770137397; x=1770742197;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSrVgJ47FbXZI7U0CKTH4UTDBJca7s7Dks5/LglLXeg=;
        b=Nu76lesIZeEbRiDDdFkkDZtPWJMyF8IQ4LDfmEUcer8HtOz2M3Vg7ZA2g6YvOlOkTS
         Mk1Udt+n0IGcXvDgs8CzQvvXp47udqgty/Rg3433kbqR8hoUJm7lcpmQx9xYTDcdIJr6
         829eON7pif51iZDL2YqL+q1+6oQ4wtUTa3510dHY+1+HTDvETbSPiUMoW549LoJHRJNg
         ulcVxJy70cfPMbFQcvL8yCIoWGbyEQk2ZrdyJN5DiK1bwoFvgLj1IlkRwIDVAuu7IDsR
         eNWWYEPvtoHxDHM00TTQOLxrrqdkSESs1JgQyRXcbGKEKIJwRSP7RNa/c23UAFsZo2aH
         4Nzg==
X-Gm-Message-State: AOJu0YzDXDg+FdgrTP0AOv/3X1uUWiXILWxYDEekWoWmvzEEpZhCcLmZ
	HpauZiTNTI8xHeh139qnljLaXq/GxqDs5NVHm8j0sdDjt/NohNvxRraDm+sdVgGQe3y1ukRXo4v
	FcHw=
X-Gm-Gg: AZuq6aL8hWYSN0HtBIvCdCeww/TTm5um0Nw2LIQO6BuPqEC8xl0L/NLnwPS0/t8uamu
	ioldUAN/1AuPKws63FfDGOT+HAbXLFmy5cCeDjc6lN80UUaanfAiR4QGsNsXKfcC4j3gx0zwxS/
	0hu8p3nXHDl7/tLGNctJrv3BY6WClicDnQpF7ZZUJdN0h1dj9OwbC8qesTfurjJBMA3BF2lAzqf
	ghjnCafJ05qnvXUXBHElGj3/uCO1Pw9yBROCPR/kNh8bBiT0s0cGkFkzRI7de8kVYuLhaNhSSs3
	C+s366d1fD5SJTCpc+xZODFVJrtwhqKAdQ8VJMp8tvDqRPjXFX4XfhnUKO/lJ2o97icuzeHyOVD
	MJvVbkTfFN3/TLz2ecChFZYrjNm8jYWRLNlbh9h4ETw5nJhlquiMvLilaWfPCJ2hKnemz+SaIwi
	WTFkepIOA1VzkbNoIg0DGMHoh6pEAjEpdrezDfMmNzX122AEYAbVU2+0p/1pB3BwLYXblalOCbw
	I0=
X-Received: by 2002:a05:6000:290b:b0:436:14fa:a3f3 with SMTP id ffacd0b85a97d-43614faa467mr3339071f8f.21.1770137397143;
        Tue, 03 Feb 2026 08:49:57 -0800 (PST)
Message-ID: <8559db88-5f1d-4ced-980c-e71c4e229c7c@suse.com>
Date: Tue, 3 Feb 2026 17:49:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/3] x86/shadow: VRAM last_dirty tagging
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[37.24.206.209:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B2778DC44B
X-Rspamd-Action: no action

->last_dirty holding a valid value (one other than -1) is solely an
indication of the bitmap being entirely clean. (The opposite isn't true,
because of _sh_propagate() setting the field to a valid value without
setting a bit in the bitmap.) As a consequence
- setting the field to a valid value right after having allocated zero-
  filled space is pointless,
- copying the the all empty bitmap to the output array is pointless; with
  the output array also having been allocated zero-filled, not even a
  memset() is needed there,
- after restoring bitmap contents when dealing with copy_to_guest() having
  failed, the field needs setting to a valid value again.

Furthermore invoking NOW() in perhaps many loop iterations of the main
loop is wasteful, too. Record whether any bit was set, and record a new
->last_dirty only once, after the loop. Then use the same NOW() value also
for the subsequent check.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -1087,18 +1087,18 @@ int shadow_track_dirty_vram(struct domai
         if ( (dirty_vram->dirty_bitmap = xzalloc_array(uint8_t, dirty_size)) == NULL )
             goto out_sl1ma;
 
-        dirty_vram->last_dirty = NOW();
+        dirty_vram->last_dirty = -1;
 
         /* Tell the caller that this time we could not track dirty bits. */
         rc = -ENODATA;
     }
-    else if ( dirty_vram->last_dirty == -1 )
-        /* still completely clean, just copy our empty bitmap */
-        memcpy(dirty_bitmap, dirty_vram->dirty_bitmap, dirty_size);
-    else
+    /* Nothing to do when the bitmap is still completely clean. */
+    else if ( dirty_vram->last_dirty != -1 )
     {
         mfn_t map_mfn = INVALID_MFN;
         void *map_sl1p = NULL;
+        bool any_dirty = false;
+        s_time_t now;
 
         /* Iterate over VRAM to track dirty bits. */
         for ( i = 0; i < nr_frames; i++ )
@@ -1174,16 +1174,20 @@ int shadow_track_dirty_vram(struct domai
             if ( dirty )
             {
                 dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);
-                dirty_vram->last_dirty = NOW();
+                any_dirty = true;
             }
         }
 
+        now = NOW();
+        if ( any_dirty )
+            dirty_vram->last_dirty = now;
+
         if ( map_sl1p )
             unmap_domain_page(map_sl1p);
 
         memcpy(dirty_bitmap, dirty_vram->dirty_bitmap, dirty_size);
         memset(dirty_vram->dirty_bitmap, 0, dirty_size);
-        if ( dirty_vram->last_dirty + SECONDS(2) < NOW() )
+        if ( dirty_vram->last_dirty + SECONDS(2) < now )
         {
             /*
              * Was clean for more than two seconds, try to disable guest
@@ -1216,6 +1220,7 @@ int shadow_track_dirty_vram(struct domai
         paging_lock(d);
         for ( i = 0; i < dirty_size; i++ )
             dirty_vram->dirty_bitmap[i] |= dirty_bitmap[i];
+        dirty_vram->last_dirty = NOW();
         paging_unlock(d);
         rc = -EFAULT;
     }


