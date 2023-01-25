Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FB567B9C3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 19:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484535.751147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKklo-0006lh-Iq; Wed, 25 Jan 2023 18:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484535.751147; Wed, 25 Jan 2023 18:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKklo-0006je-Ey; Wed, 25 Jan 2023 18:45:16 +0000
Received: by outflank-mailman (input) for mailman id 484535;
 Wed, 25 Jan 2023 18:45:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dnVv=5W=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pKkln-0006jY-3v
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 18:45:15 +0000
Received: from buffalo.larch.relay.mailchannels.net
 (buffalo.larch.relay.mailchannels.net [23.83.213.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6580acb2-9ce0-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 19:45:12 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id ED582201E66
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 18:45:08 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 8EBA4201DEE
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 18:45:08 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.109.196.199 (trex/6.7.1); Wed, 25 Jan 2023 18:45:08 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4P2CSh1HffzK1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 10:45:08 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e00e2 by kmjvbox (DragonFly Mail Agent v0.12);
 Wed, 25 Jan 2023 10:45:06 -0800
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
X-Inumbo-ID: 6580acb2-9ce0-11ed-91b6-6bf2151ebd3b
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1674672308; a=rsa-sha256;
	cv=none;
	b=sHXSvZg6a4ESmjJMDTauMoz+oej81nxqM9LHKP0M5N1bYchPmFqQ1z12sRlki06O4/Yy8u
	fQioyNctYw7yLf3H3omMbI1IEn6bYPee2xkhAcGRnU9KRa0AD8/XvOVgZEB9f8RNTruJdz
	CxKztOuikyFXhxREeim5zJttpaeUkXMUGOo2+hoAxEMnKuKjAjOIL46HQKa3vHQLBMFP+Q
	nITR0DK6DZbH+h4lqmaK5Xpb47aYk+HifnGo8nL0fm8p4pwICvLnV/8hcTNAmS1qXt3jp7
	aBVCOAuin2B1GIkd1hS71NUz1LFhUhMzAPC2bVap+Nn46SNLif5ws5CqF5Pi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1674672308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:dkim-signature;
	bh=dwwSySAB0/noOy7j2ESEKeWWjrMfxpM7nNQbHo69AIU=;
	b=Sx50BYuCU9K4AzSxAjRIxlMX1HraVB4wVzDlta9Ie5Xiy1llqKot2YZ61xW3WuqEX3Ynmq
	0Mt1n+wHMDbX7VV2Ie4+m60VoB/6OhvWm52kGb+FhS20NaPsnrotFJUUUMcbjM2J5MFb2J
	hAM0BZ0E8CQK32uy0V6S6wyyvUOW8eWfVh0718ip7nqBbzPvC2lfrmNf+Y9Piglv1hiVXt
	udfHrXgm4bp3krCayU/T8Nxf+rIRFzRg035mRyN3NZ+xuNLJokM351tCXts7grwgVV5o51
	NLHYi8UNk+3vzFrMePHn5Oca+/Hud7JzGmlpL54saCMp+QJmjY5j9KY7DMSDjA==
ARC-Authentication-Results: i=1;
	rspamd-6989874cc5-vfcqp;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Good
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Abortive-Reign: 4b1828fe3d6c6c3c_1674672308827_357499150
X-MC-Loop-Signature: 1674672308827:2558123209
X-MC-Ingress-Time: 1674672308827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1674672308;
	bh=dwwSySAB0/noOy7j2ESEKeWWjrMfxpM7nNQbHo69AIU=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=PYR3YyMwqygtLxvD5YTYV0Dw+In3vPsoMFuy8e/LaadPOi3qXMr4jAIy2xHSG/oQT
	 t5qDfzZygJYJtu2GQNfyT7jNELjKh6vSxRF/h+OwF0fqOMI+6YnsOVAOI8xi5ut1qh
	 DY9BQiLXKm/gwGHdrf3hQyxmFg7gCf+jqzw9KcwI=
Date: Wed, 25 Jan 2023 10:45:06 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Reaver <me@davidreaver.com>
Subject: [PATCH v2] xen/x86: public: add TSC defines for cpuid leaf 4
Message-ID: <20230125184506.GE1963@templeofstupid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124223516.GA1962@templeofstupid.com>

Cpuid leaf 4 contains information about how the state of the tsc, its
mode, and some additional information.  A commit that is queued for
linux would like to use this to determine whether the tsc mode has been
set to 'no emulation' in order to make some decisions about which
clocksource is more reliable.

Expose this information in the public API headers so that they can
subsequently be imported into linux and used there.

Link: https://lore.kernel.org/xen-devel/eda8d9f2-3013-1b68-0df8-64d7f13ee35e@suse.com/
Link: https://lore.kernel.org/xen-devel/0835453d-9617-48d5-b2dc-77a2ac298bad@oracle.com/
Signed-off-by: Krister Johansen <kjlx@templeofstupid.com>
---
v2.1:
  - Correct In-Reply-To header for proper threading
v2:
  - Fix whitespace between comment and #defines (feedback from Jan Beulich)
  - Add tsc mode 3: no emulate TSC_AUX (feedback from Jan Beulich)
---
 xen/include/public/arch-x86/cpuid.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index 7ecd16ae05..090f7f0034 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -72,6 +72,14 @@
  * Sub-leaf 2: EAX: host tsc frequency in kHz
  */
 
+#define XEN_CPUID_TSC_EMULATED               (1u << 0)
+#define XEN_CPUID_HOST_TSC_RELIABLE          (1u << 1)
+#define XEN_CPUID_RDTSCP_INSTR_AVAIL         (1u << 2)
+#define XEN_CPUID_TSC_MODE_DEFAULT           (0)
+#define XEN_CPUID_TSC_MODE_EMULATE           (1u)
+#define XEN_CPUID_TSC_MODE_NOEMULATE         (2u)
+#define XEN_CPUID_TSC_MODE_NOEMULATE_TSC_AUX (3u)
+
 /*
  * Leaf 5 (0x40000x04)
  * HVM-specific features
-- 
2.25.1


