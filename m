Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rn1UJ8lDRmqhNAsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 12:56:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E206F6471
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 12:56:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=eh7Q7K2q;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351659.1608774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfF5N-0005nj-S9; Thu, 02 Jul 2026 10:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351659.1608774; Thu, 02 Jul 2026 10:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfF5N-0005lF-Ob; Thu, 02 Jul 2026 10:56:01 +0000
Received: by outflank-mailman (input) for mailman id 1351659;
 Thu, 02 Jul 2026 10:56:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfF5M-0005jW-6p
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 10:56:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfF5L-005SZh-J2
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 12:55:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4643ae-5cb7-0a2a0a5109dd-0a2a450bcd14-28
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 12:55:59 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4643bf-ac48-0a2a450b0019-d1558030b18d-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 12:55:59 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-493b7612475so13560495e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 03:55:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dbe617b1sm7898518f8f.16.2026.07.02.03.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 03:55:58 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782989759; x=1783594559; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y40rikzKdW41I0gcKC+jqL54qXX/dn+hAUR30HB1xyE=;
        b=eh7Q7K2qOy6U8kyHHoMlBLcaCpYUYEXasesUO+v22GXrh85ks2gWvTGrJxszC4uFXL
         U2yQm+v31PYfsVhlmRVOGTlkKnHGvWWcF9v26fatcEF+6XFeI9CNcgMHVhMELU3YXWfW
         0p8kQPLzvoTQVqtcwUHOb8y2OHfcGI3EyAJI5jx7w67SxBvPACpQGKYqP7wEErXjF0Uq
         pG21wNG6ZcR2fD6WMdW5U1a1QT84NBYPX6Jh1JZ8Gk6BPBa/yLHwV2gOlKHamqeWEySJ
         JbA0hlHxHweXO9f6IKEpKGkt+c423OahOmHPFZp0dKIGK6kUf1b7NLbyPM2iDDz8HOwM
         wncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989759; x=1783594559;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y40rikzKdW41I0gcKC+jqL54qXX/dn+hAUR30HB1xyE=;
        b=Os6dZxCuPeBPM2L5BHEiYDkNgy1rtkRsQy1xnvSFRW7CEmTsIuQue+fIh6NCzqNjkH
         xfjfsGQIh39T3x/O1+SAwSrHSgu94bwRSZ0RIgJvNLdI3xk7txG2ji0YAlhT6hP/iM6b
         Qeq+oEa3iICAPyWGnUauD6veyr6cH+zq35OWBzoNxpdjsPe7G3Vheqc2IxzVrNYYXWsM
         KBrs7lpP+s87sn0WhoVYwK9rMmLWc8Pict9lTn+a80CwqYAUyr4OvwPj/TfkfW1uQV0h
         /vTndmDHYM/3Mtx2ojg45wnanyy2+ZyDqzWwZoied/CqImBsD7bFAmy1wioU2KHz4wjo
         lspQ==
X-Gm-Message-State: AOJu0Yyl/uTkwoLs4XJod1M43mCnEVXc1dF6LcoUtFylQFaaew0fwroJ
	s1jsRfLqefNkN2vmTHCJPDGxBsEg8eWjjIEaFVkK3VNCSjL7z3vN3Wg9qxSYOqNGFLlZKoXDYe4
	PpmK0zg==
X-Gm-Gg: AfdE7ckQhybl4zb0k61r51PansW7a85LEtgvIS2drbL1tN8dkKeYsfe0+jmjBNWkdTN
	letBbw5XLYgoPkrKFyNKpW2vUy+xvAYWtsL4U6h1SstVPvNBMYopaeA+C5FDflyLjHtMqqCkdRJ
	b9gq5u4O8JzdWdpfwyoaN1AhnNNN/VZxkIrTmm34eSZtsfq0HenTK4u2chvfNcb4DpEA3PhUf+o
	KcM8yAGobIiSx62CvzJxQxYn1umFcxEPsAUy4SjroUnt4HXfcp3i916OAWuLwjrZfTP2fne5ntb
	Mk61JYOxGDl9m7sQo82T576ffhOobjhAwbusgQ1DIkSsTV0iBvpASbNdC4QZlWKlaUQCr+uRlps
	b/gA+n3b3KQFlVdOJurVuI2Olo5FOt3A4rmc/gxfqcJqejtzs3r942QeSYG5OkYamwVZcQqWfM+
	3/vV6SukEB8a3avIRldWJ53/olpBJdtdJV8k0Ueu/b3AH1R9FQYoZskOtsOha2wi+0A30oenQ54
	hSh
X-Received: by 2002:a05:600d:c:b0:493:aa28:38ad with SMTP id 5b1f17b1804b1-493c2b4442emr58140175e9.10.1782989758979;
        Thu, 02 Jul 2026 03:55:58 -0700 (PDT)
Message-ID: <3ed270eb-4417-4340-a3da-f06704b27047@suse.com>
Date: Thu, 2 Jul 2026 12:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 4/4] x86: prefer shadow stack for producing call traces
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7ba5ecff-af64-49c0-abf9-23963ca56aa6@suse.com>
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
In-Reply-To: <7ba5ecff-af64-49c0-abf9-23963ca56aa6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1782989759-A6939220-6047AE3A/0/0
X-purgate-type: clean
X-purgate-size: 4605
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
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
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04E206F6471

Shadow stacks contain little more than return addresses, and they in
particular allow precise call traces also with FRAME_POINTER=n:

(XEN) Xen call trace:
(XEN)    [<ffff82d04032d730>] R extable.c#search_one_extable+0x70/0x73
(XEN)    [<ffff82d04032d802>] C search_exception_table+0xc2/0x177
(XEN)    [<ffff82d040358378>] C traps.c#extable_fixup.isra.0+0x18/0x6c
(XEN)    [<ffff82d040358e3b>] C do_invalid_op+0xab/0x106
(XEN)    [<ffff82d040201d98>] C x86_64/entry.S#handle_exception_saved+0x88/0xf4
(XEN)    [<ffff82d07fffe044>] E ffff82d07fffe044
(XEN)    [<ffff82d040412db0>] C stub_selftest+0xd0/0x168
(XEN)    [<ffff82d0403508d6>] C setup.c#init_done+0x116/0x15a

as opposed to this counterpart (earlier during the same boot, before CET
is enabled):

(XEN) Xen call trace:
(XEN)    [<ffff82d04032d730>] R extable.c#search_one_extable+0x70/0x73
(XEN)    [<ffff82d04032d802>] S search_exception_table+0xc2/0x177
(XEN)    [<ffff82d040358378>] S traps.c#extable_fixup.isra.0+0x18/0x6c
(XEN)    [<ffff82d040358e3b>] S do_invalid_op+0xab/0x106
(XEN)    [<ffff82d040201d98>] S x86_64/entry.S#handle_exception_saved+0x88/0xf4
(XEN)    [<ffff82d040412db0>] S stub_selftest+0xd0/0x168
(XEN)    [<ffff82d0403d0cc9>] S do_initcalls+0x29/0x38
(XEN)    [<ffff82d04041adf2>] S __start_xen+0x1c72/0x2235
(XEN)    [<ffff82d040288a57>] S __high_start+0xb7/0xc0

(note the entirely missing entry for the stub itself [1]; sadly there are
no stray entries there).

[1] Arguably we could teach FRAME_POINTER=n traces to recognize stubs as
    well. But not FRAME_POINTER=y ones. In fact, what's missing there
    isn't the stub itself, but (of course) its immediate caller.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While the 'E' for exception frames is probably okay, I'm not overly
happy with the 'C' (for CET). I would have preferred 'S' (for shadow),
but we use that character already.

As an alternative to suppressing output for the top level exception
frame, adding the new code ahead of the 'R' output line (and then also
ahead of the stack top read) could be considered.

Quite likely a number of other uses of is_active_kernel_text() also want
amending with in_stub().
---
v3: Correct "link to other shadow stack" check. Don't log a line for the
    (impossible) PV case. Add example stack trace to description.
v2: IS_ENABLED() -> #ifdef. Re-base.

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -48,6 +48,7 @@
 #include <asm/shared.h>
 #include <asm/shstk.h>
 #include <asm/smp.h>
+#include <asm/stubs.h>
 #include <asm/system.h>
 #include <asm/traps.h>
 #include <asm/uaccess.h>
@@ -705,6 +706,13 @@ unsigned long get_stack_dump_bottom(unsi
     }
 }
 
+#ifdef CONFIG_XEN_SHSTK
+static bool in_stub(unsigned long addr)
+{
+    return !((this_cpu(stubs.addr) ^ addr) >> STUB_BUF_SHIFT);
+}
+#endif
+
 #if !defined(CONFIG_FRAME_POINTER)
 
 /*
@@ -797,6 +805,49 @@ static void show_trace(const struct cpu_
          !is_active_kernel_text(tos) )
         printk("   [<%p>] R %pS\n", _p(regs->rip), _p(regs->rip));
 
+#ifdef CONFIG_XEN_SHSTK
+    if ( rdssp() != SSP_NO_SHSTK )
+    {
+        const unsigned long *ptr = _p(regs->entry_ssp);
+        unsigned int n;
+
+        for ( n = 0; (unsigned long)ptr & (PAGE_SIZE - sizeof(*ptr)); ++n )
+        {
+            unsigned long val = *ptr;
+
+            if ( is_active_kernel_text(val) || in_stub(val) )
+            {
+                /* Normal return address entry.  */
+                printk("   [<%p>] C %pS\n", _p(val), _p(val));
+                ++ptr;
+            }
+            else if ( !((val ^ (unsigned long)ptr) >>
+                        (PAGE_SHIFT + STACK_ORDER)) )
+            {
+                if ( val & (sizeof(val) - 1) )
+                {
+                    /* Most likely a supervisor token. */
+                    break;
+                }
+
+                /*
+                 * Ought to be a hypervisor interruption frame.  But don't
+                 * (re)log the current frame's %rip.
+                 */
+                if ( n || ptr[1] != regs->rip )
+                    printk("   [<%p>] E %pS\n", _p(ptr[1]), _p(ptr[1]));
+                ptr = _p(val);
+            }
+            else /* Bogus. */
+                break;
+        }
+
+        /* Fall back to legacy stack trace if nothing was logged at all. */
+        if ( n )
+            return;
+    }
+#endif /* CONFIG_XEN_SHSTK */
+
     if ( fault )
     {
         printk("   [Fault on access]\n");


