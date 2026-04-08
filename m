Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEGrDGA91mlZBwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 13:34:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F523BB557
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 13:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275787.1561509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARBH-0000Y3-K5; Wed, 08 Apr 2026 11:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275787.1561509; Wed, 08 Apr 2026 11:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARBH-0000WG-Gx; Wed, 08 Apr 2026 11:34:47 +0000
Received: by outflank-mailman (input) for mailman id 1275787;
 Wed, 08 Apr 2026 11:34:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wARBF-0000Un-OR
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 11:34:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wARBF-009oGY-43
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 13:34:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d63d4e-bab6-0a2a0a5309dd-0a2a45039f58-48
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 13:34:44 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d63d54-02b3-0a2a45030019-d1558036e0be-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 13:34:44 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so50984305e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 04:34:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488be75215dsm133255955e9.6.2026.04.08.04.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 04:34:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1775648084; x=1776252884; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdptFfRcnIR+guBMaOX6EdAYvW7VI11lHEC8d4E2Q7Q=;
        b=HjqbLgfSwoSCoKL2PWvJWsRuN6GTefxpENEvPFyj1bvOUgYC29CARFgCDl97tp1w+h
         ojXRnzc07zmuPSQQhrByEQldnjnVrN/Fe3XdtGCvaC2U3OiRznLs2YkzC7/l69Bp2hQi
         RSksaNMp+zGRkekjkSE0hxy71gBUPBhnaM++xse/piV+hGuz6hudqGEP5i5GveR4RAy9
         2KgJCcPay0J7puYa0zGmFWat8lJv56XWutGGkvW8vJPaMMuk4OuPpaIulQm+ejFEw69B
         r2dnvfnqqabG707WFuY8bMk73NbVICwMRA66P1HehbsLt7C8O+/RZxeVYwaGsibUiOdM
         hnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775648084; x=1776252884;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CdptFfRcnIR+guBMaOX6EdAYvW7VI11lHEC8d4E2Q7Q=;
        b=QR6ki+j7nk2CAZ/G/YIWNjB4GJPQ7diC01Q3tJuPZ9szkpzT5wVeMBrS2EMmzKRhcX
         g60nFuhVszclXbTEp5bh7BEkXbDlPJ2KOUr7BpMUDPBxm+tQWvC68ymYe+3hNDtBUp1c
         TH1M0zOvrBXPtwFmuRjn+AL5xWmKh2U0JkUlAhHGfThqZlkqp13ijPjRaUc+SLFDJaFH
         NxBnXWYKMlqPq9bKPVvqLXHd2AI7DXVdmAas3178CZO0AbpjxYO4Im6RgC6rqmUXB8qj
         beeLm3qQWZTDu8zAaPzgW062p2XAxmkP0Hhq+Cl/8vYpsSU7kACoqUSx8Ny4vxc//f/b
         Icfg==
X-Gm-Message-State: AOJu0Yz39yJnEG9lgaBAyR1atjX8NzlF5lbqHbDwYaYu7iuJCTCqLoPN
	vbsfCtrGe97+H8U6x6TW6KsVBR/UfmrOmw+Zri84CvI+Lh/vcifJurC1jd9Mv5Z63FM6q+JODm+
	1uEiapA==
X-Gm-Gg: AeBDieufCTzz49PogaIehWDGD9KL9iSFNxnoeEVIDjEtCwjyq6mAifuJP9ElB2YCq+T
	D+iPZo1SYHAcsrt0B2lyfcYrNh0hHDDz4oRrAN07JobXq5lqkPOU498UvMRa+aQacE/Cm+hpc18
	QvcAygvuxTdAxOv5bDKKkYs+b+UAmAbvXRB/XWvob2yWqtnQaybsX6DGA9r9ENowDq3f5ywZIoZ
	vr8R4LmXMJyi0vfNu7aYBwBq4cWJY+4TBOCORhfyoNfFGXHi7I3AAvKtXOy8KzVIctCVJrnQhQr
	whk33X1lXifLLBs2PzjHGK57QbAmyefeY0mNINiPCVKVyBe55bnf+pTZ8lPo9wfxdQAs7m/TCmc
	ANJIjtpiNxgmLG8mIvcGVBcZwLg8a3u3fp+XSKHz6RHYtYEQcUct7LYe1W7/2buWTb6quaxj/7P
	zcl8ssqlrvmLLeOlP2tEe3f/OvfEJQ1ULYYUpOveIwR1YCPjFEDZKldFv56s/Xv+QW8dDmWicUM
	MbLyLHVTWOva+mN2HdHn/lFWg==
X-Received: by 2002:a05:600c:5247:b0:488:b187:3c with SMTP id 5b1f17b1804b1-488b1870244mr152150515e9.14.1775648084324;
        Wed, 08 Apr 2026 04:34:44 -0700 (PDT)
Message-ID: <4b89f640-046a-49c1-95f1-947d98135e5b@suse.com>
Date: Wed, 8 Apr 2026 13:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/cpuidle: split the max_cstate variable
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
X-purgate-ID: tlsNG-33051d/1775648084-42B1DC9A-06BB0736/0/0
X-purgate-type: clean
X-purgate-size: 12120
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 90F523BB557
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The admin can control the upper bound wanted not only via command line
option, but also via XEN_SYSCTL_pm_op_set_max_cstate. While decisions how
to set up the system are okay this way as long as we deem the command line
option a strict upper bound, what to do during S3 resume should not be
based on that potentially varying value. Decisions there need to use
solely the strict upper bound we may have enforced ourselves (or which was
forced onto us via command line option).

Rather than altering pit_broadcast_is_available(), drop the function
altogether. It's pretty odd for acpi/cpu_idle.c to call into time.c, just
for that to call into acpi/cpu_idle.c again.

Fixes: 8d24303023ec ("x86: don't write_tsc() non-zero values on CPUs updating only the lower 32 bits")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
cpuidle_disable_deep_cstate(), when called from handle_rtc_once(), is
still somewhat of a problem: Boot time and resume time runs of
_disable_pit_irq() may still behave differently because of that.

If we wanted the sysctl to possibly move the maximum C-state beyond what
was given on the command line, things would get yet more complicated, as
we'd then need to re-configure the driver that's in use.

I wonder how useful the ACPI_STATE_C<n> #define-s really are. Plain 1 is
used in e.g. probe_c3_errata(), and the plain 7 doesn't even have a
respective constant (nor would that be suitable, as that's not really an
ACPI state).

--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -119,7 +119,7 @@ bool lapic_timer_init(void)
         lapic_timer_off = hpet_broadcast_enter;
         lapic_timer_on = hpet_broadcast_exit;
     }
-    else if ( pit_broadcast_is_available() )
+    else if ( cpuidle_usable_deep_cstate() )
     {
         lapic_timer_off = pit_broadcast_enter;
         lapic_timer_on = pit_broadcast_exit;
@@ -131,12 +131,15 @@ bool lapic_timer_init(void)
 }
 
 void (*__read_mostly pm_idle_save)(void);
-unsigned int max_cstate __read_mostly = UINT_MAX;
+
+unsigned int max_usable_cstate __read_mostly = UINT_MAX;
+unsigned int max_allowed_cstate __read_mostly = UINT_MAX;
 unsigned int max_csubstate __read_mostly = UINT_MAX;
 
 static int __init cf_check parse_cstate(const char *s)
 {
-    max_cstate = simple_strtoul(s, &s, 0);
+    max_allowed_cstate = simple_strtoul(s, &s, 0);
+    max_usable_cstate = max_allowed_cstate;
     if ( *s == ',' )
         max_csubstate = simple_strtoul(s + 1, NULL, 0);
     return 0;
@@ -413,10 +416,11 @@ static void cf_check dump_cx(unsigned ch
     unsigned int cpu;
 
     printk("'%c' pressed -> printing ACPI Cx structures\n", key);
-    if ( max_cstate < UINT_MAX )
+    if ( max_cstate() < UINT_MAX )
     {
-        printk("max state: C%u\n", max_cstate);
-        if ( max_csubstate < UINT_MAX )
+        printk("max state: C%u\n", max_cstate());
+        if ( max_allowed_cstate <= max_usable_cstate &&
+             max_csubstate < UINT_MAX )
             printk("max sub-state: %u\n", max_csubstate);
         else
             printk("max sub-state: unlimited\n");
@@ -690,18 +694,18 @@ static void cf_check acpi_processor_idle
     u32 exp = 0, pred = 0;
     u32 irq_traced[4] = { 0 };
 
-    if ( max_cstate > 0 && power &&
+    if ( max_cstate() > 0 && power &&
          (next_state = cpuidle_current_governor->select(power)) > 0 )
     {
         unsigned int max_state = sched_has_urgent_vcpu() ? ACPI_STATE_C1
-                                                         : max_cstate;
+                                                         : max_cstate();
 
         do {
             cx = &power->states[next_state];
         } while ( (cx->type > max_state ||
                    cx->entry_method == ACPI_CSTATE_EM_NONE ||
                    (cx->entry_method == ACPI_CSTATE_EM_FFH &&
-                    cx->type == max_cstate &&
+                    cx->type == max_allowed_cstate &&
                     (cx->address & MWAIT_SUBSTATE_MASK) > max_csubstate)) &&
                   --next_state );
         if ( next_state )
@@ -1448,7 +1452,7 @@ static void amd_cpuidle_init(struct acpi
 
     for ( i = 0; i < nr; ++i )
     {
-        if ( cx[i].type > max_cstate )
+        if ( cx[i].type > max_cstate() )
             break;
         power->states[i + 1] = cx[i];
         power->states[i + 1].idx = i + 1;
@@ -1611,21 +1615,22 @@ int pmstat_reset_cx_stat(unsigned int cp
 
 void cpuidle_disable_deep_cstate(void)
 {
-    if ( max_cstate > ACPI_STATE_C1 )
+    if ( max_usable_cstate > ACPI_STATE_C1 )
     {
         if ( local_apic_timer_c2_ok )
-            max_cstate = ACPI_STATE_C2;
+            max_usable_cstate = ACPI_STATE_C2;
         else
-            max_cstate = ACPI_STATE_C1;
+            max_usable_cstate = ACPI_STATE_C1;
     }
 
     hpet_disable_legacy_broadcast();
 }
 
-bool cpuidle_using_deep_cstate(void)
+bool cpuidle_usable_deep_cstate(void)
 {
-    return xen_cpuidle && max_cstate > (local_apic_timer_c2_ok ? ACPI_STATE_C2
-                                                               : ACPI_STATE_C1);
+    return xen_cpuidle &&
+           max_usable_cstate > (local_apic_timer_c2_ok ? ACPI_STATE_C2
+                                                       : ACPI_STATE_C1);
 }
 
 static int cf_check cpu_callback(
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -384,12 +384,12 @@ static void probe_c3_errata(const struct
     };
 
     /* Serialized by the AP bringup code. */
-    if ( max_cstate > 1 && (c->apicid & (c->x86_num_siblings - 1)) &&
+    if ( max_usable_cstate > 1 && (c->apicid & (c->x86_num_siblings - 1)) &&
          x86_match_cpu(models) )
     {
         printk(XENLOG_WARNING
 	       "Disabling C-states C3 and C6 due to CPU errata\n");
-        max_cstate = 1;
+        max_usable_cstate = 1;
     }
 }
 
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1045,15 +1045,16 @@ static void cf_check mwait_idle(void)
 	u64 before, after;
 	u32 exp = 0, pred = 0, irq_traced[4] = { 0 };
 
-	if (max_cstate > 0 && power &&
+	if (max_cstate() > 0 && power &&
 	    (next_state = cpuidle_current_governor->select(power)) > 0) {
 		unsigned int max_state = sched_has_urgent_vcpu() ? ACPI_STATE_C1
-								 : max_cstate;
+								 : max_cstate();
 
 		do {
 			cx = &power->states[next_state];
-		} while ((cx->type > max_state || (cx->type == max_cstate &&
-			  MWAIT_HINT2SUBSTATE(cx->address) > max_csubstate)) &&
+		} while ((cx->type > max_state ||
+                          (cx->type == max_allowed_cstate &&
+			   MWAIT_HINT2SUBSTATE(cx->address) > max_csubstate)) &&
 			 --next_state);
 		if (!next_state)
 			cx = NULL;
@@ -1458,7 +1459,7 @@ static void __init sklh_idle_state_table
 	u64 msr;
 
 	/* if PC10 disabled via cmdline max_cstate=7 or shallower */
-	if (max_cstate <= 7)
+	if (max_cstate() <= 7)
 		return;
 
 	/* if PC10 not present in CPUID.MWAIT.EDX */
@@ -1623,7 +1624,7 @@ static int __init mwait_idle_probe(void)
 	    !mwait_substates)
 		return -ENODEV;
 
-	if (!max_cstate || !opt_mwait_idle) {
+	if (!max_cstate() || !opt_mwait_idle) {
 		pr_debug(PREFIX "disabled\n");
 		return -EPERM;
 	}
@@ -1714,8 +1715,8 @@ static int cf_check mwait_idle_cpu_init(
 		hint = flg2MWAIT(cpuidle_state_table[cstate].flags);
 		state = MWAIT_HINT2CSTATE(hint) + 1;
 
-		if (state > max_cstate) {
-			printk(PREFIX "max C-state %u reached\n", max_cstate);
+		if (state > max_cstate()) {
+			printk(PREFIX "max C-state %u reached\n", max_cstate());
 			break;
 		}
 
--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -31,7 +31,6 @@ int cpu_frequency_change(u64 freq);
 
 void cf_check pit_broadcast_enter(void);
 void cf_check pit_broadcast_exit(void);
-int pit_broadcast_is_available(void);
 
 uint64_t cf_check acpi_pm_tick_to_ns(uint64_t ticks);
 
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -517,7 +517,7 @@ static int64_t __init cf_check init_hpet
     bool disable_hpet = false;
 
     if ( hpet_address && strcmp(opt_clocksource, pts->id) &&
-         cpuidle_using_deep_cstate() )
+         cpuidle_usable_deep_cstate() )
     {
         if ( pci_conf_read16(PCI_SBDF(0, 0, 0x1f, 0),
                              PCI_VENDOR_ID) == PCI_VENDOR_ID_INTEL )
@@ -2655,7 +2655,7 @@ static int _disable_pit_irq(bool init)
      * XXX dom0 may rely on RTC interrupt delivery, so only enable
      * hpet_broadcast if FSB mode available or if force_hpet_broadcast.
      */
-    if ( cpuidle_using_deep_cstate() && !boot_cpu_has(X86_FEATURE_XEN_ARAT) )
+    if ( cpuidle_usable_deep_cstate() && !boot_cpu_has(X86_FEATURE_XEN_ARAT) )
     {
         init ? hpet_broadcast_init() : hpet_broadcast_resume();
         if ( !hpet_broadcast_is_available() )
@@ -2707,11 +2707,6 @@ void cf_check pit_broadcast_exit(void)
         reprogram_timer(this_cpu(timer_deadline));
 }
 
-int pit_broadcast_is_available(void)
-{
-    return cpuidle_using_deep_cstate();
-}
-
 void send_timer_event(struct vcpu *v)
 {
     send_guest_vcpu_virq(v, VIRQ_TIMER);
@@ -2999,7 +2994,7 @@ static void cf_check dump_softtsc(unsign
     else if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC ) )
     {
         printk("TSC has constant rate, ");
-        if ( max_cstate <= ACPI_STATE_C2 && tsc_max_warp == 0 )
+        if ( max_usable_cstate <= ACPI_STATE_C2 && tsc_max_warp == 0 )
             printk("no deep Cstates, passed warp test, deemed reliable, ");
         else
             printk("deep Cstates possible, so not reliable, ");
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -142,30 +142,33 @@ int acpi_gsi_to_irq (u32 gsi, unsigned i
 
 #ifdef	CONFIG_ACPI_CSTATE
 /*
- * max_cstate sets the highest legal C-state.
- * max_cstate = 0: C0 okay, but not C1
- * max_cstate = 1: C1 okay, but not C2
- * max_cstate = 2: C2 okay, but not C3 etc.
-
- * max_csubstate sets the highest legal C-state sub-state. Only applies to the
- * highest legal C-state.
- * max_cstate = 1, max_csubstate = 0 ==> C0, C1 okay, but not C1E
- * max_cstate = 1, max_csubstate = 1 ==> C0, C1 and C1E okay, but not C2
- * max_cstate = 2, max_csubstate = 0 ==> C0, C1, C1E, C2 okay, but not C3
- * max_cstate = 2, max_csubstate = 1 ==> C0, C1, C1E, C2 okay, but not C3
+ * max_{allowed,usable}_cstate sets the highest allowed / usable C-state, where
+ * "allowed" is command line / sysctl based.
+ * max_*_cstate = 0: C0 okay, but not C1
+ * max_*_cstate = 1: C1 okay, but not C2
+ * max_*_cstate = 2: C2 okay, but not C3 etc.
+ *
+ * max_csubstate sets the highest allowed C-state sub-state. Only applies to
+ * the highest allowed C-state.
+ * max_allowed_cstate = 1, max_csubstate = 0 ==> C0, C1 okay, but not C1E
+ * max_allowed_cstate = 1, max_csubstate = 1 ==> C0, C1 and C1E okay, but not C2
+ * max_allowed_cstate = 2, max_csubstate = 0 ==> C0, C1, C1E, C2 okay, but not C3
+ * max_allowed_cstate = 2, max_csubstate = 1 ==> C0, C1, C1E, C2 okay, but not C3
  */
 
-extern unsigned int max_cstate;
+extern unsigned int max_usable_cstate;
+extern unsigned int max_allowed_cstate;
 extern unsigned int max_csubstate;
 
+#define max_cstate() min(max_usable_cstate, max_allowed_cstate)
+
 static inline unsigned int acpi_get_cstate_limit(void)
 {
-	return max_cstate;
+	return max_allowed_cstate;
 }
 static inline void acpi_set_cstate_limit(unsigned int new_limit)
 {
-	max_cstate = new_limit;
-	return;
+	max_allowed_cstate = new_limit;
 }
 
 static inline unsigned int acpi_get_csubstate_limit(void)
--- a/xen/include/xen/cpuidle.h
+++ b/xen/include/xen/cpuidle.h
@@ -89,7 +89,7 @@ struct cpuidle_governor
 extern int8_t xen_cpuidle;
 extern struct cpuidle_governor *cpuidle_current_governor;
 
-bool cpuidle_using_deep_cstate(void);
+bool cpuidle_usable_deep_cstate(void);
 void cpuidle_disable_deep_cstate(void);
 
 #define CPUIDLE_DRIVER_STATE_START  1

