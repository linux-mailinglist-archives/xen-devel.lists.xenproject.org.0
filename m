Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGdmIFGqd2k8kAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7439D8BC61
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213842.1524395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmr-0007OJ-U6; Mon, 26 Jan 2026 17:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213842.1524395; Mon, 26 Jan 2026 17:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmr-0007BU-Gt; Mon, 26 Jan 2026 17:54:05 +0000
Received: by outflank-mailman (input) for mailman id 1213842;
 Mon, 26 Jan 2026 17:54:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQmn-0004HW-KA
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:54:01 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe79a932-fadf-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 18:54:00 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so40779595e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:54:00 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:59 -0800 (PST)
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
X-Inumbo-ID: fe79a932-fadf-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450039; x=1770054839; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1ONjoPKEWiY2hmWsIYX5khT8mAnFR/6SGFmL+oGZ7U=;
        b=k6N3qPTTsWg85Hzq1f4mG5dmYFyb9igbxl6SpLLIXkiQCs9KWqjUa/C7mJdrFwTHCM
         yCs+VTc4Mo6Ln0J7C6Vs+l6xJhFc9YSkJ+7bMYMUwaDMLplktd0SfUSGkYwrGDqRiaPQ
         Qq1+cJhF2pzD+YQkJ1hwHoHSuNG7HIGo08U9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450039; x=1770054839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c1ONjoPKEWiY2hmWsIYX5khT8mAnFR/6SGFmL+oGZ7U=;
        b=CdlBNAJL/JbURbn1qVHdAB/CL7vXbDvdJ/PBMMXIRRe7eh07NBJzZwr6r4rMri4/D+
         VzwGlbnMLiKVjq6z+ehsZL8fxcKtcMJsCjHK1jD7XuNacGRHRset3H+xiiEhYzhSH+Jf
         Ejxso6l60Su8/T5hkDiSIa8qf1+TvFBkKkBV5wcRgsYG8x4Omk7n09cuoYhRu/OV0fYp
         LnMvhTVV0QimzYGa6+fTavRKLFoixTttPbDn4rrzRG6P//cHw6Y6H0b3UEWq8K4u6smc
         21+g1GT6ScIJTB+w72D6/ArSsm8CY2Qkrf9iBlVjUgz95OY2yo5omk348Qa2euQfeDIO
         evOA==
X-Gm-Message-State: AOJu0YwA3tgUSuuGJWKzD/Ac2LhngBGK9NYaETSq94bEGS67FhT+1N3+
	oMklAFEI6xQvI9zGhynmThzgcI475vZRSF/DYmKYHT1d/D4jCfOYkGBK13M84zVXL5GH2boSNlg
	/aM8J
X-Gm-Gg: AZuq6aIRqpuijwD0bf/qvENC9XdTyFB/ZE+Q0Ak3xo9K4GIAvOXcuXjMhLU6XHTmx4/
	H0sRaHozAlvbo2zMB9Ba3F6SNU0jP4LZ3JPNiLm9yZW+WwmmxWXaujCcbebuUzB5L+/lsXBTdql
	UIsg4f16JVxKlFyrhSpzXLjMBW73J4JHp/XoqBEBfFcpmn8GbnOVgsbgLNxn+P8PyH5GIDf8F6H
	ri1zqEnTdCHshmZ1zjBfP1lSsEcA56F5EIQqbyc3gdMX8wyOgXs99QY/TACS/SDlejNbpcpp4EW
	ZxFwOqMd3VmwH+PwEAh47enK/vwR+6oc8ClvmFCBve5AaNejE6VC0rLPAdTyTmNXmQRwsOrGEwO
	li7jwlENQe/XoJPNwHJbEbpssP3pxI5LLcG54B+S1YOupc8R0Xr71NHTqjekurKa6V8Q7InVGn+
	Y2J0V//OmqViNCZgGRdaF/rYzecXX2zHSf8jIcXLu3loVGtazGdK8zQhKhpz+1+T60m4W6wnPR
X-Received: by 2002:a05:600c:5297:b0:477:a289:d854 with SMTP id 5b1f17b1804b1-4805cd2026amr94916305e9.5.1769450039455;
        Mon, 26 Jan 2026 09:53:59 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 14/16] x86/cpu: Drop default_init() and default_cpu
Date: Mon, 26 Jan 2026 17:53:43 +0000
Message-Id: <20260126175345.2078371-15-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7439D8BC61
X-Rspamd-Action: no action

While the comment is reasonable, clearing SEP as the only action for an
unknown CPU is useless.  Drop the infrastructure.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpu/common.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 7674cca1ba93..bab2193e9ba3 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -100,15 +100,6 @@ bool __init is_forced_cpu_cap(unsigned int cap)
 	return test_bit(cap, forced_caps) || test_bit(cap, cleared_caps);
 }
 
-static void cf_check default_init(struct cpuinfo_x86 * c)
-{
-	/* Not much we can do here... */
-	__clear_bit(X86_FEATURE_SEP, c->x86_capability);
-}
-
-static const struct cpu_dev __initconst_cf_clobber __used default_cpu = {
-	.c_init	= default_init,
-};
 static struct cpu_dev __ro_after_init actual_cpu;
 
 static DEFINE_PER_CPU(uint64_t, msr_misc_features);
@@ -375,7 +366,6 @@ void __init early_cpu_init(bool verbose)
 	case X86_VENDOR_SHANGHAI: actual_cpu = shanghai_cpu_dev; break;
 	case X86_VENDOR_HYGON:    actual_cpu = hygon_cpu_dev;    break;
 	default:
-		actual_cpu = default_cpu;
 		if (!verbose)
 			break;
 		printk(XENLOG_ERR
-- 
2.39.5


