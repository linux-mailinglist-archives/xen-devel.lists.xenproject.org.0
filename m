Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 096AC6817E9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 18:45:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487102.754580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYDT-0003Hb-RG; Mon, 30 Jan 2023 17:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487102.754580; Mon, 30 Jan 2023 17:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYDT-0003Df-OI; Mon, 30 Jan 2023 17:45:15 +0000
Received: by outflank-mailman (input) for mailman id 487102;
 Mon, 30 Jan 2023 17:45:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/WO=53=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pMYDS-00031n-H9
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 17:45:14 +0000
Received: from bonobo.larch.relay.mailchannels.net
 (bonobo.larch.relay.mailchannels.net [23.83.213.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d462c1cd-a0c5-11ed-8ba2-5fe241e16ab0;
 Mon, 30 Jan 2023 18:45:07 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 660A95C2652
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 17:45:04 +0000 (UTC)
Received: from pdx1-sub0-mail-a304.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 20F7E5C22AC
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 17:45:03 +0000 (UTC)
Received: from pdx1-sub0-mail-a304.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.116.179.68 (trex/6.7.1); Mon, 30 Jan 2023 17:45:04 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a304.dreamhost.com (Postfix) with ESMTPSA id 4P5Fv23cYtzS9
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 09:45:02 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e0034 by kmjvbox (DragonFly Mail Agent v0.12);
 Mon, 30 Jan 2023 09:44:59 -0800
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
X-Inumbo-ID: d462c1cd-a0c5-11ed-8ba2-5fe241e16ab0
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1675100703; a=rsa-sha256;
	cv=none;
	b=TrsAuql7YYd5WwaELsMFJyT20+05x1Vs+1TTMg+hWteoVNhAWBrrcFXxmL+JcXKac5FgI2
	KpfLmxPZyGt1r9SovVmK6TVncc8fcwngR93Jq5g7oWxCaT0jgVUQ+lAiJlzK2OvcO116ui
	fWJ7SFGTd5I7ql4Xp1QLT+MGE4hNSHfcubF7ibOmWo5JMUXazub/w2BByBFTGvsulJS6mX
	Yp9VpKbVtrMf1Ip/aW/vPk/JWJLxkzvRQOJIOD2YVTMOm9O+6XvP6QUo0fwLK49RtRbUw4
	TXp7h5xl/yX+WIoP+S/l0dDDmSNT/OZ8Hr0SFR+IT+bFp3zjnbU4Kp0DndtQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1675100703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=lzWbg7pH2Qdroe4uerh/jh+EVVJsKlEREiv+gIZXp/4=;
	b=E3tMINDvnoMbohYwJ2477XupHt22eo5PKXuXrCR80DCEOx6O3LtSpoKqYpU4NiSr/RvYAt
	r4cpur82sRhkJdBkIOFC/7Gi66WferqRwBCK3SM9C+Q8oICzA5CGBzIPGCgiMDnUeYAJbE
	V6mw+ksIgkXsy62qdb0SGeecvTs1vGQ7eyvAQyddDtewVg4mr+ChgDGZhn91JfEyBqrNCh
	jx7qO+h4ZCffvFpNK1LU3NCpDMNZhUlwfkgwaFgOa4TrU65P+nTr1yUEgdQAaKYTBzbroz
	7YetaIDnEiEr9W0pxX/bLIvHwQ2mvbgfn/tKvqfZtdgjLFoRi9YmRb79+6T80Q==
ARC-Authentication-Results: i=1;
	rspamd-5fb8f68d88-c76m6;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Good
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Chief-Abortive: 6c1bbaf9559e6c5a_1675100704225_1603156238
X-MC-Loop-Signature: 1675100704225:1628132625
X-MC-Ingress-Time: 1675100704225
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1675100702;
	bh=lzWbg7pH2Qdroe4uerh/jh+EVVJsKlEREiv+gIZXp/4=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=XZIPzc7tWyRIsJ5Nl1A+WZvwQPUww3beix2acoBlBry7erf54qAkT87ly6BsCQeI+
	 GvE9ZnFpO3pHv7GIDqIKL09jDoyZTXXm5ZT+4TBeWHe7m6LTGVB2d/E1IRTeQWKswE
	 rvLmm6awA85ljK3livi/ugFn2X7msalK1Od1WOYo=
Date: Mon, 30 Jan 2023 09:44:59 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Reaver <me@davidreaver.com>
Subject: [PATCH v4] xen/x86: public: add TSC defines for cpuid leaf 4
Message-ID: <20230130174459.GB2001@templeofstupid.com>
References: <bfccbe22-e5e4-40d3-aded-639d812bfa08@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfccbe22-e5e4-40d3-aded-639d812bfa08@suse.com>

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
v4
  - Rename TSC_MODE_NEVER_EMULATE_TSC_AUX to TSC_MODE_PVRDTSCP (feedback from
    Jan Buelich)
v3
  - Additional formating cleanups (feedback from Jan Buelich)
  - Ensure that TSC_MODE #defines match the names of those in time.h (feedback
    from Jan Buelich)
v2:
  - Fix whitespace between comment and #defines (feedback from Jan Beulich)
  - Add tsc mode 3: no emulate TSC_AUX (feedback from Jan Beulich)
---
 xen/include/public/arch-x86/cpuid.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index 7ecd16ae05..9d02f86564 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -72,6 +72,15 @@
  * Sub-leaf 2: EAX: host tsc frequency in kHz
  */
 
+#define XEN_CPUID_TSC_EMULATED               (1u << 0)
+#define XEN_CPUID_HOST_TSC_RELIABLE          (1u << 1)
+#define XEN_CPUID_RDTSCP_INSTR_AVAIL         (1u << 2)
+
+#define XEN_CPUID_TSC_MODE_DEFAULT               (0)
+#define XEN_CPUID_TSC_MODE_ALWAYS_EMULATE        (1u)
+#define XEN_CPUID_TSC_MODE_NEVER_EMULATE         (2u)
+#define XEN_CPUID_TSC_MODE_PVRDTSCP              (3u)
+
 /*
  * Leaf 5 (0x40000x04)
  * HVM-specific features
-- 
2.25.1


