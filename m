Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UP2WFouAlWlESAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 10:04:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976BB154655
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 10:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235373.1538358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsdTO-0008US-RZ; Wed, 18 Feb 2026 09:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235373.1538358; Wed, 18 Feb 2026 09:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsdTO-0008T1-OV; Wed, 18 Feb 2026 09:03:54 +0000
Received: by outflank-mailman (input) for mailman id 1235373;
 Wed, 18 Feb 2026 09:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cF4C=AW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsdTN-0008Su-Fr
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 09:03:53 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beae05c6-0ca8-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 10:03:52 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4837584120eso33703675e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 01:03:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d99e194sm440739835e9.8.2026.02.18.01.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 01:03:50 -0800 (PST)
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
X-Inumbo-ID: beae05c6-0ca8-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771405431; x=1772010231; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SvKa91gva/wogVd3fgZzjcHBMHjxFlRjMx/wNJQFRf4=;
        b=YqkcrYwP/wVZ+D5ahCE5fCeI/ZbEOprUoTsRQ+1pHakQryCzq6NjSN7s4eHJcuCZR8
         3KfXFZ+LW4MNf+kyV9lQAqA5fZH8eRkdEBWG76KIlGzF/YOgLlKBPfcOkubglAOf/vzM
         u83THwfOIcOyPTqAktGZjxTYzRgVpMLIHmS6U38dcULfnuXJjt0YaAScztWXTUEMedkG
         I0xpxHUtIusM/G3CaaHLk51QRaJfjH1vnkKtLvL/Yqe5vtuYn8XiuYiz++thXRvt3XLF
         JGs4EoyqxvwCkl07wVoh0BkguCF7PimbRCh1YC2K7pd5jvYGkk6TWQvf4ORPDTLtUEo8
         vNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771405431; x=1772010231;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SvKa91gva/wogVd3fgZzjcHBMHjxFlRjMx/wNJQFRf4=;
        b=YEA9chCOnSvrGSGA3oBED3mwjr+OeSAgBUtg3XnOQtSJQj7BCGZ9ItusXr9kCDQzBx
         ipQIEu0uZXVrwgYnZPRX8ziMVirbFbsmJ3niPXpWXTsr61WmFU+qSsCzeLQT57M46S+n
         CNK/EMUzerYaBJjVAD+SZFGLQ/fq/YOe6krk1OV1obC1lATQgnJKF5H57gLXb37UD452
         +GW4zsvNZjv/Ml9xvPk9xcl9PncNO9h5BTIuFVjy8YrjrbXTvcAZI8F5R/E90+HxYSrm
         rf1vOnkJF/iQ6FikLnxyR7sWx9qhPO/CmaNsly6+XbqcobtiZtlIkZCf8kf1AR/u2a/5
         vrWQ==
X-Gm-Message-State: AOJu0YydRiPGlo1XulXrhBVi/rX0oj6jpnxD5CoL+iX7RzmIrl21T1wl
	SF6zeHX/4yaivwWLnt3imPnxFr0XCZpIVcUgm/JrjfRJvv7HSIlE1Kx2wkvHii9QKGDdTOJhzAk
	sRFo=
X-Gm-Gg: AZuq6aI+dOE+PIYpXekX+BYT0gFpgacFLesFKEoAwOaxmzyee3KvtEOQaPx50Re2W9J
	hWKT3nGYBcc1UbKgp392k8uQh5apFcpWzgODtBmbYIqJTC7A1EQLb6+spO+w+c9szjvqvh0J3AK
	Ok5EKG6RCUIw89lwSbEzcXHWUbIw+57Et3UKq5aec96MeHpNEs4P2829kMDl+iruVLv9HALFaBD
	kGUD1+2/Zk/AR1CczUOnXGI88n1C7fn7ELjLJMvwfsV0N0eRoZkmq1Qxe5e3w++nwC9kr4D4sJX
	7mEYDEe7lBIWUAbeSluTOMEVME5rRud8PiLiKIfAepxtoF4pf1RAv04uvKJbJgfhlgdftnzGs3M
	b8N3BbZGmazKorr/YfLBT6M7eaZZa12D+Xhyc9TZ62XGJLUZJEs86nsgftDKv+mcc+vkLBRTeJ+
	HXG9bpt43TeHHrLWzeMotLbAVXVBHDXS1suVpGhJwmtHtKIMP4nWrAO0uV0frhlI4a/wlS2FQm6
	pVuuTHbi6BtNDPICk5ah1UYeg==
X-Received: by 2002:a05:600c:444f:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-48379bd742amr219365065e9.24.1771405431184;
        Wed, 18 Feb 2026 01:03:51 -0800 (PST)
Message-ID: <23951625-939c-4658-8146-84c1f12381d0@suse.com>
Date: Wed, 18 Feb 2026 10:03:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: don't use #if in macro invocations
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 976BB154655
X-Rspamd-Action: no action

As per the standard this is UB, i.e. we're building on a defacto extension
in the compilers we use. Misra C:2012 rule 20.6 disallows this altogether,
though. Use helper always-inline functions instead.

In sh_audit_l1_table(), along with reducing the scope of "gfn", which now
isn't used anymore by the if() side of the conditional, also reduce the
scope of two other adjacent variables.

For audit_magic() note that both which parameters are needed and what
their types are is attributed to AUDIT_FAIL() accessing variables which
aren't passed as arguments to it.

No functional change intended. Of course codegen does change with this,
first and foremost in register allocation.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Leaving even the fetching of current to the helper in
sh_rm_write_access_from_l1() looks tidier to me overall, albeit this means
the fetch will now occur once per present L1E.

Converting the #if to if() and #ifdef to if(IS_ENABLED()) wouldn't work
here, as identifiers are used which aren't available when the respective
conditions are false.

Note that I tested this only on top of
https://lists.xen.org/archives/html/xen-devel/2023-05/msg01140.html, but I
have no reason to assume that there is a problematic interaction. Of
course it would be really nice if the rest of that series finally could go
in.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -395,7 +395,7 @@ static inline mfn_t cf_check sh_next_pag
     shadow_set_l2e(d, sl2e, new_sl2e, sl2mfn, SH_type_fl1_shadow, sh_next_page)
 
 static inline u32
-guest_index(void *ptr)
+guest_index(const void *ptr)
 {
     return (u32)((unsigned long)ptr & ~PAGE_MASK) / sizeof(guest_l1e_t);
 }
@@ -3549,16 +3549,25 @@ static int cf_check sh_guess_wrmap(
 }
 #endif
 
+/* Remember the last shadow that we shot a writeable mapping in */
+static always_inline void store_last_writeable_pte_smfn(
+    const struct domain *d, mfn_t sl1mfn)
+{
+#if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
+    struct vcpu *curr = current;
+
+    if ( curr->domain == d )
+        curr->arch.paging.shadow.last_writeable_pte_smfn = mfn_x(sl1mfn);
+#endif
+}
+
 int cf_check sh_rm_write_access_from_l1(
     struct domain *d, mfn_t sl1mfn, mfn_t readonly_mfn)
 /* Excises all writeable mappings to readonly_mfn from this l1 shadow table */
 {
     shadow_l1e_t *sl1e;
     int done = 0;
-#if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
-    struct vcpu *curr = current;
     mfn_t base_sl1mfn = sl1mfn; /* Because sl1mfn changes in the foreach */
-#endif
 
     FOREACH_PRESENT_L1E(sl1mfn, sl1e, NULL, done,
     {
@@ -3568,11 +3577,9 @@ int cf_check sh_rm_write_access_from_l1(
             shadow_l1e_t ro_sl1e = shadow_l1e_remove_flags(*sl1e, _PAGE_RW);
 
             shadow_set_l1e(d, sl1e, ro_sl1e, p2m_ram_rw, sl1mfn);
-#if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
-            /* Remember the last shadow that we shot a writeable mapping in */
-            if ( curr->domain == d )
-                curr->arch.paging.shadow.last_writeable_pte_smfn = mfn_x(base_sl1mfn);
-#endif
+
+            store_last_writeable_pte_smfn(d, base_sl1mfn);
+
             if ( (mfn_to_page(readonly_mfn)->u.inuse.type_info
                   & PGT_count_mask) == 0 )
                 /* This breaks us cleanly out of the FOREACH macro */
@@ -3882,12 +3889,36 @@ static const char *sh_audit_flags(const
     return NULL;
 }
 
+static always_inline bool audit_magic(
+    const guest_l1e_t *gl1e, mfn_t gl1mfn,
+    const shadow_l1e_t *sl1e, mfn_t sl1mfn)
+{
+    bool done = false;
+
+#if SHADOW_OPTIMIZATIONS & SHOPT_FAST_FAULT_PATH
+    if ( !sh_l1e_is_gnp(*sl1e) )
+    {
+        gfn_t gfn = sh_l1e_mmio_get_gfn(*sl1e);
+
+        ASSERT(sh_l1e_is_mmio(*sl1e));
+
+        if ( !gfn_eq(gfn, guest_l1e_get_gfn(*gl1e)) )
+            AUDIT_FAIL(1,
+                       "shadow MMIO gfn is %" SH_PRI_gfn " but guest gfn is %" SH_PRI_gfn,
+                       gfn_x(gfn), gfn_x(guest_l1e_get_gfn(*gl1e)));
+    }
+    else if ( guest_l1e_get_flags(*gl1e) & _PAGE_PRESENT )
+        AUDIT_FAIL(1, "shadow is GNP magic but guest is present");
+#endif
+
+    return done;
+}
+
 int cf_check sh_audit_l1_table(struct domain *d, mfn_t sl1mfn, mfn_t x)
 {
     guest_l1e_t *gl1e, *gp;
     shadow_l1e_t *sl1e;
-    mfn_t mfn, gmfn, gl1mfn;
-    gfn_t gfn;
+    mfn_t gl1mfn;
     p2m_type_t p2mt;
     const char *s;
     int done = 0;
@@ -3906,28 +3937,10 @@ int cf_check sh_audit_l1_table(struct do
 #endif
 
     gl1e = gp = map_domain_page(gl1mfn);
-    FOREACH_PRESENT_L1E(sl1mfn, sl1e, &gl1e, done, {
-
+    FOREACH_PRESENT_L1E(sl1mfn, sl1e, &gl1e, done,
+    {
         if ( sh_l1e_is_magic(*sl1e) )
-        {
-#if (SHADOW_OPTIMIZATIONS & SHOPT_FAST_FAULT_PATH)
-            if ( sh_l1e_is_gnp(*sl1e) )
-            {
-                if ( guest_l1e_get_flags(*gl1e) & _PAGE_PRESENT )
-                    AUDIT_FAIL(1, "shadow is GNP magic but guest is present");
-            }
-            else
-            {
-                ASSERT(sh_l1e_is_mmio(*sl1e));
-                gfn = sh_l1e_mmio_get_gfn(*sl1e);
-                if ( gfn_x(gfn) != gfn_x(guest_l1e_get_gfn(*gl1e)) )
-                    AUDIT_FAIL(1, "shadow MMIO gfn is %" SH_PRI_gfn
-                               " but guest gfn is %" SH_PRI_gfn,
-                               gfn_x(gfn),
-                               gfn_x(guest_l1e_get_gfn(*gl1e)));
-            }
-#endif
-        }
+            done = audit_magic(gl1e, gl1mfn, sl1e, sl1mfn);
         else
         {
             s = sh_audit_flags(d, 1, guest_l1e_get_flags(*gl1e),
@@ -3936,9 +3949,10 @@ int cf_check sh_audit_l1_table(struct do
 
             if ( SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES_MFNS )
             {
-                gfn = guest_l1e_get_gfn(*gl1e);
-                mfn = shadow_l1e_get_mfn(*sl1e);
-                gmfn = get_gfn_query_unlocked(d, gfn_x(gfn), &p2mt);
+                gfn_t gfn = guest_l1e_get_gfn(*gl1e);
+                mfn_t mfn = shadow_l1e_get_mfn(*sl1e);
+                mfn_t gmfn = get_gfn_query_unlocked(d, gfn_x(gfn), &p2mt);
+
                 if ( !p2m_is_grant(p2mt) && !mfn_eq(gmfn, mfn) )
                     AUDIT_FAIL(1, "bad translation: gfn %" SH_PRI_gfn
                                " --> %" PRI_mfn " != mfn %" PRI_mfn,
@@ -4027,6 +4041,17 @@ int cf_check sh_audit_l2_table(struct do
 }
 
 #if GUEST_PAGING_LEVELS >= 4
+static always_inline unsigned int type_from_gl3e(
+    const struct domain *d, const guest_l3e_t *gl3e)
+{
+#ifdef CONFIG_PV32
+    if ( guest_index(gl3e) == 3 && is_pv_32bit_domain(d) )
+        return SH_type_l2h_shadow;
+#endif
+
+    return SH_type_l2_shadow;
+}
+
 int cf_check sh_audit_l3_table(struct domain *d, mfn_t sl3mfn, mfn_t x)
 {
     guest_l3e_t *gl3e, *gp;
@@ -4056,14 +4081,10 @@ int cf_check sh_audit_l3_table(struct do
 
         if ( SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES_MFNS )
         {
-            unsigned int t = SH_type_l2_shadow;
+            unsigned int t = type_from_gl3e(d, gl3e);
 
             gfn = guest_l3e_get_gfn(*gl3e);
             mfn = shadow_l3e_get_mfn(*sl3e);
-#ifdef CONFIG_PV32
-            if ( guest_index(gl3e) == 3 && is_pv_32bit_domain(d) )
-                t = SH_type_l2h_shadow;
-#endif
             gmfn = get_shadow_status(
                        d, get_gfn_query_unlocked(d, gfn_x(gfn), &p2mt), t);
             if ( !mfn_eq(gmfn, mfn) )

