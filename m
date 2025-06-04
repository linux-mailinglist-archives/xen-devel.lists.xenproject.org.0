Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FBAACDB5C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 11:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005307.1384803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMkj8-0006lm-KF; Wed, 04 Jun 2025 09:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005307.1384803; Wed, 04 Jun 2025 09:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMkj8-0006jY-He; Wed, 04 Jun 2025 09:48:06 +0000
Received: by outflank-mailman (input) for mailman id 1005307;
 Wed, 04 Jun 2025 09:48:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMkj6-0006jQ-VD
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 09:48:04 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0192efde-4129-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 11:48:02 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-607013a3dc8so358692a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 02:48:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c74cd4sm8757998a12.44.2025.06.04.02.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 02:48:01 -0700 (PDT)
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
X-Inumbo-ID: 0192efde-4129-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749030482; x=1749635282; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=odruecDOvo+t9KpaVjj9qI+wVwOtPBef4MrD5a+o5Aw=;
        b=gCMbmqbiepOcNpeQDn/t6Vj99NCIG1+dZoB2fN8mQvFcAhourUznbGa+SazCkTrs2K
         sPzXTH5Jb7Ifz8PVtgngJ5zXs6NMbDqvAc9nHrv/Gcc3BToOQCJYtrRfg0FEV5rYk82y
         +wS+C9As1NjjhUJLgx0aawQQBbYW0/brBZlTMmvKBhLpxpN5MMBohuFeGr3GpY1kAzil
         /FgeDTG/p5BriORgoDruRbo4aI8om3QQZRcGp+00J41mv6JwziQ9FBxjGkZy5Y2ZyROm
         aN2fW9hIkjmJhNy08E93tCE3wqrwx51oYSzQZXrrRvhvYtz77FwD8ONPBz3ps2D3t7qU
         vloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030482; x=1749635282;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odruecDOvo+t9KpaVjj9qI+wVwOtPBef4MrD5a+o5Aw=;
        b=b4vZsxS4cNWDU/af+2YL+WPTIt/62BLg9SUv2RK4uxCkhIloERzuAUi6ga0wXMJEvv
         tvYYbfBmUxKQRc4C1KjRV4wnJWsYokDSmUbM0JrmbwRb02ZF3yw4RygjTRMkT2ZW1vMU
         VCTiqyjXZngq0FvLIk+Cf9Erl6bZtD0YU+59DClIek78TYIfooMU+JWoVbfQYY/JJMRR
         gYJQ/PCNsHvAaEKN3WYTl6zmdhsPiX5D69AE9skl0ie5BZavVXMQ4AcRIN2lF8x1Oc28
         +i5xe2X21eCRaM/SAR9a1iScTZ0mOHUhhzhTbrmCBxHd2AFhvhmbqRw2OpmrXOhhsa9o
         W2mw==
X-Gm-Message-State: AOJu0YxexWW0c98ERGFKUsRjFlIo0eD3sheaXmeQPccelJwcN1oMXaG9
	Ag2i++Rae1gajbn0maIHlMEzfr7V57bYt6riuIqcUaKJO/4VhLCU0A1YtobIAMh30rynNphiwmf
	E/Qw=
X-Gm-Gg: ASbGncu8d2COqlcI/lvDoayzwtpYyHLRE4YDZ3aqK2RC0aZ/9x1/xurQnRdqzz3Wo8k
	0r1lXptxQR84prQs4F3GRiCQB2D9+vyD5bTmkmnSK+pTNXbvFULFQgxXzA8EDAB9Sctr5blXEgQ
	EPSbgUYygBJtqsDMpoUF8PBQxRgvmJ4O6n8OhSlq/7SGNyHRTWzCSrlQ/SX/g9ZugLHlzTzj3Dj
	2NtFyzoo/7D77Emj3qg01Q2nhMw4Rnh2S392dHC+bQtGluHPgtz5HQ1Qm77EI3c7JkXvurG5jpl
	llOFd1YxeJA00a7o07VbZAnAwaFo3JwkTzHs8ZZbvp3doOd3j4M+fJS/cHg9Qb1n888KNaq8wDU
	ZIGKFG8L/1eU7PYT9ss+shp6Ag3a2ceowH2fW
X-Google-Smtp-Source: AGHT+IEjDMzhYz9lHMci6k4SS1rSCc/HwUT10egeql4xTuFK+EMbl7YgYm43CVVP9xGWoNqYfH3vCw==
X-Received: by 2002:a05:6402:2789:b0:600:2af6:d91b with SMTP id 4fb4d7f45d1cf-606e9415f3cmr2074917a12.1.1749030481934;
        Wed, 04 Jun 2025 02:48:01 -0700 (PDT)
Message-ID: <78b3ddeb-4317-4d54-ad52-9eb03bdf7942@suse.com>
Date: Wed, 4 Jun 2025 11:48:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/HVM: restrict use of pinned cache attributes as well
 as associated flushing
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

We don't permit use of uncachable memory types elsewhere unless a domain
meets certain criteria. Enforce this also during registration of pinned
cache attribute ranges.

Furthermore restrict cache flushing to just uncachable range registration.
While there, also (mainly be calling memory_type_changed())
- take CPU self-snoop as well as IOMMU snoop into account (albeit the
  latter still is a global property rather than a per-domain one),
- avoid flushes when the domain isn't running yet (which ought to be the
  common case).

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
At the expense of yet larger a diff it would be possible to get away
without any "goto", by moving the whole "new entry" handling into the
switch(). Personally I'd prefer that, but the larger diff may be
unwelcome.

I have to admit that I can't spot what part of epte_get_entry_emt() the
comment refers to that is being deleted. The function does use
hvm_get_mem_pinned_cacheattr(), yes, but there's nothing there that talks
about cache flushes (and their avoiding) in any way.

Is it really sensible to add/remove ranges once the guest is already
running? (If it is, limiting the scope of the flush would be nice, but
would require knowing dirtyness for the domain wrt the caches, which
currently we don't track.)

This is kind of amending XSA-428.
---
v2: Use memory_type_changed() and conditionalize call to
    p2m_memory_type_changed().

--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -582,6 +582,7 @@ int hvm_set_mem_pinned_cacheattr(struct
 {
     struct hvm_mem_pinned_cacheattr_range *range, *newr;
     unsigned int nr = 0;
+    bool flush = false;
     int rc = 1;
 
     if ( !is_hvm_domain(d) )
@@ -605,31 +606,35 @@ int hvm_set_mem_pinned_cacheattr(struct
 
                 type = range->type;
                 call_rcu(&range->rcu, free_pinned_cacheattr_entry);
-                p2m_memory_type_changed(d);
                 switch ( type )
                 {
-                case X86_MT_UCM:
+                case X86_MT_WB:
+                case X86_MT_WP:
+                case X86_MT_WT:
                     /*
-                     * For EPT we can also avoid the flush in this case;
-                     * see epte_get_entry_emt().
+                     * Flush since we don't know what the cachability is going
+                     * to be.
                      */
-                    if ( hap_enabled(d) && cpu_has_vmx )
-                case X86_MT_UC:
-                        break;
-                    /* fall through */
-                default:
-                    flush_all(FLUSH_CACHE);
+                    if ( is_iommu_enabled(d) || cache_flush_permitted(d) )
+                        flush = true;
                     break;
                 }
-                return 0;
+                rc = 0;
+                goto finish;
             }
         domain_unlock(d);
         return -ENOENT;
 
     case X86_MT_UCM:
     case X86_MT_UC:
-    case X86_MT_WB:
     case X86_MT_WC:
+        /* Flush since we don't know what the cachability was. */
+        if ( !is_iommu_enabled(d) && !cache_flush_permitted(d) )
+            return -EPERM;
+        flush = true;
+        break;
+
+    case X86_MT_WB:
     case X86_MT_WP:
     case X86_MT_WT:
         break;
@@ -682,9 +687,11 @@ int hvm_set_mem_pinned_cacheattr(struct
 
     xfree(newr);
 
-    p2m_memory_type_changed(d);
-    if ( type != X86_MT_WB )
-        flush_all(FLUSH_CACHE);
+ finish:
+    if ( flush )
+        memory_type_changed(d);
+    else if ( d->vcpu && d->vcpu[0] )
+        p2m_memory_type_changed(d);
 
     return rc;
 }

