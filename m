Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOkoN8q7eGm0sgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:21:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A4E94D02
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214691.1524908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkj0C-00028P-67; Tue, 27 Jan 2026 13:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214691.1524908; Tue, 27 Jan 2026 13:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkj0C-000263-2t; Tue, 27 Jan 2026 13:21:04 +0000
Received: by outflank-mailman (input) for mailman id 1214691;
 Tue, 27 Jan 2026 13:21:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkj0B-0001py-Aw
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 13:21:03 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06bffb54-fb83-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 14:21:02 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso57718935e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 05:21:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bf7ae8sm60785035e9.7.2026.01.27.05.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 05:21:01 -0800 (PST)
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
X-Inumbo-ID: 06bffb54-fb83-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769520062; x=1770124862; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjFGeKp1K4ttCYF68p8JwAWjBOoW26y1e6tNrvP69Hs=;
        b=UEvMFkW4jXIDAEIUK25u+5l7LSY8/y4GVTfgvQqvsbJh9CqhrpJ/WGfkUT03cEQXPC
         dwn38LXEdBBVL4QMYPBsbD2/mtL0P+uN2W8Gya6pvSJj9ZqTs03a6o1tp04jB1MgoZvh
         e7V8h9H/qMNY4BgKGjBP49+4V3ggZ4Qo76h+wW8VqrP2idMi5J0YKnb+sq7rjkrDmAOI
         rSGrQ5w8E53UlKaTznw2WLBVuYPaiiYl73pZvJgXJy1CyqrnK1Jz8eyPqX5BU/ELYkqk
         4rjNOjuEXB/tQVPnB2M23GBgO55b6RfuhIAMCwzzNgcearzz+mKF7glxyVaHsli340NI
         Odpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769520062; x=1770124862;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjFGeKp1K4ttCYF68p8JwAWjBOoW26y1e6tNrvP69Hs=;
        b=jNI4UPSNdY/92EAWrw7gPMQGIM9ZVTrmY/TfRmjgxw/BynOp32DEzYbBWe/fgKv0n+
         odhAEAjj7dbknCwhjQq8AQirOAz644YCidh9hvB3+4TGzME6M4s3wJ31jndiImk2lCjF
         tqKqg8tixBy4Z8OWa8YQxbeOpgYXjD2vtFNSekcL30GnKJXTkov+JixNW8IjVqxn+eLt
         flmvxANrNx7U08RIj8gXjBQviFobUMIkEYEhU78mf3jLURFfYAfadfI0gEh4DlMqdkRI
         LNnOYRRQ+DdCgm85D0uHgChbi5RUnwHUS6+qZZ+P9p1I6K5PJTR2ih0mC1CYc0NjOjFC
         9sXQ==
X-Gm-Message-State: AOJu0YzKNBCJz6WTlQpIwmUxaYVIORLj6BIcti7Bu9p808M1rV2Yk0Df
	hY3whwUWFcF7nvuCqhT22Fl6R5RQQcP8dUpJNfAupxjkIg8p4lBT8x2Bk6y7upDCUHihtBWTutE
	XFWQ=
X-Gm-Gg: AZuq6aL+JsvrLSF6iujqqTwzm/jfMxT3lGCebNkbYOSWE3WENKYj52WQoRpBFXc8VZj
	WI3oPVLRCx/IEVEkRcttFEeCeDv1lCPjpKZJBRBTpPf6lB97M6cCVLoorRxf79zCR8HNravaEr1
	vvDvF4jEZVXlAyzreV8+LdtC2JHYyj0USelM36k+EjOaa+M0O244h+/zkvMM5CBqH6J6dOU8YrQ
	jK2o9eMSm3NWlDGL2zzAeqdrAEo5FyWrsJwc9oUocz+puJxFSjC1J6yyArV19ukAotzREi9aF9N
	vzi07weNJ8lN2fvwCq38zRmc1SmrJMQcKiDqs0yQJAalT8qrwX/Nx/1X417yGHKiVAvv6hSJM2N
	3GJlusabczzeOfB9OlM6HtJv1K1QxTEtoqMXNr7hq7+JKSHR6ueAgQNT7KxBVHtFtMW2879BWH3
	8mpdFxyFBY2Jir7j3re1Qj20K4uJKHPS6m05kCuIXhdmOJsp4T8XFDk8apohtWPnm6K1PGb9vYm
	Ck=
X-Received: by 2002:a05:600c:4f82:b0:480:4d39:84b3 with SMTP id 5b1f17b1804b1-48069bfabe7mr23329285e9.6.1769520061553;
        Tue, 27 Jan 2026 05:21:01 -0800 (PST)
Message-ID: <7982a813-0fda-447e-a0f1-c9357b85f264@suse.com>
Date: Tue, 27 Jan 2026 14:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: suppress trace_emul_write_val hook when
 !TRACEBUFFER
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 44A4E94D02
X-Rspamd-Action: no action

The hook is never invoked in that case, and hence needlessly offers an
extra valid indirect call target. With the hook suppressed, no consumer
of the three local per-CPU variables exists either, so they're
suppressed as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -90,10 +90,12 @@ struct shadow_paging_mode {
     int           (*guess_wrmap           )(struct vcpu *v, 
                                             unsigned long vaddr, mfn_t gmfn);
     void          (*pagetable_dying       )(paddr_t gpa);
+#ifdef CONFIG_TRACEBUFFER
     void          (*trace_emul_write_val  )(const void *ptr, unsigned long vaddr,
                                             const void *src, unsigned int bytes);
 #endif
 #endif
+#endif
     /* For outsiders to tell what mode we're in */
     unsigned int shadow_levels;
 };
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -211,9 +211,11 @@ hvm_emulate_write(enum x86_segment seg,
     default: memcpy(ptr, p_data, bytes);                break;
     }
 
+#ifdef CONFIG_TRACEBUFFER
     if ( tb_init_done )
         v->arch.paging.mode->shadow.trace_emul_write_val(ptr, addr,
                                                          p_data, bytes);
+#endif
 
     sh_emulate_unmap_dest(v, ptr, bytes, sh_ctxt);
     shadow_audit_tables(v);
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2044,6 +2044,7 @@ static void __maybe_unused sh_trace_gfn_
 }
 
 #ifdef CONFIG_HVM
+#ifdef CONFIG_TRACEBUFFER
 #if GUEST_PAGING_LEVELS == 3
 static DEFINE_PER_CPU(guest_va_t,trace_emulate_initial_va);
 static DEFINE_PER_CPU(int,trace_extra_emulation_count);
@@ -2071,9 +2072,11 @@ static void cf_check trace_emulate_write
     memcpy(&this_cpu(trace_emulate_write_val), src, bytes);
 #endif
 }
+#endif /* CONFIG_TRACEBUFFER */
 
 static inline void sh_trace_emulate(guest_l1e_t gl1e, unsigned long va)
 {
+#ifdef CONFIG_TRACEBUFFER
     if ( tb_init_done )
     {
         struct __packed {
@@ -2099,6 +2102,7 @@ static inline void sh_trace_emulate(gues
 
         sh_trace(TRC_SHADOW_EMULATE, sizeof(d), &d);
     }
+#endif /* CONFIG_TRACEBUFFER */
 }
 #endif /* CONFIG_HVM */
 
@@ -2678,7 +2682,9 @@ static int cf_check sh_page_fault(
     paging_unlock(d);
     put_gfn(d, gfn_x(gfn));
 
+#ifdef CONFIG_TRACEBUFFER
     this_cpu(trace_emulate_write_val) = (guest_l1e_t){};
+#endif
 
 #if SHADOW_OPTIMIZATIONS & SHOPT_FAST_EMULATION
  early_emulation:
@@ -2794,7 +2800,10 @@ static int cf_check sh_page_fault(
     if ( r == X86EMUL_OKAY && !emul_ctxt.ctxt.retire.raw )
     {
         int i, emulation_count=0;
+
+#ifdef CONFIG_TRACEBUFFER
         this_cpu(trace_emulate_initial_va) = va;
+#endif
 
         for ( i = 0 ; i < 4 ; i++ )
         {
@@ -2830,7 +2839,10 @@ static int cf_check sh_page_fault(
                 break; /* Don't emulate again if we failed! */
             }
         }
+
+#ifdef CONFIG_TRACEBUFFER
         this_cpu(trace_extra_emulation_count)=emulation_count;
+#endif
     }
 #endif /* PAE guest */
 
@@ -4130,7 +4142,9 @@ const struct paging_mode sh_paging_mode
     .shadow.guess_wrmap            = sh_guess_wrmap,
 #endif
     .shadow.pagetable_dying        = sh_pagetable_dying,
+#ifdef CONFIG_TRACEBUFFER
     .shadow.trace_emul_write_val   = trace_emulate_write_val,
+#endif
 #endif /* CONFIG_HVM */
     .shadow.shadow_levels          = SHADOW_PAGING_LEVELS,
 };

