Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A6A67EDD8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 19:51:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485875.753306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLTog-0006Hc-33; Fri, 27 Jan 2023 18:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485875.753306; Fri, 27 Jan 2023 18:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLTog-0006FF-0G; Fri, 27 Jan 2023 18:51:14 +0000
Received: by outflank-mailman (input) for mailman id 485875;
 Fri, 27 Jan 2023 18:51:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=in7c=5Y=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pLToe-0006F9-9b
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 18:51:12 +0000
Received: from crocodile.elm.relay.mailchannels.net
 (crocodile.elm.relay.mailchannels.net [23.83.212.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ef94deb-9e73-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 19:51:09 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 03CC35C1203
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 18:51:07 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 955D55C1A79
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 18:51:06 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.109.138.31 (trex/6.7.1); Fri, 27 Jan 2023 18:51:06 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a305.dreamhost.com (Postfix) with ESMTPSA id 4P3RVd36b7zT5
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 10:51:05 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e00cb by kmjvbox (DragonFly Mail Agent v0.12);
 Fri, 27 Jan 2023 10:51:03 -0800
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
X-Inumbo-ID: 8ef94deb-9e73-11ed-a5d9-ddcf98b90cbd
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1674845466; a=rsa-sha256;
	cv=none;
	b=l3uUapRDUt9TyoUvdX/uRZzR5zQCdxtd+SZfzjpNagftL1bVVJnR+36ruWHU0zVPzbz+QS
	YADlLButB1GDI1AqEupaOLyVcnhkvjWLTihuc+VLKUKLXVVN/9DRFgB03smi0Z5yjWx8YU
	LVxllGZupg7qgmEeOWrAQMJCp3tmLxqGVBzS1E3oJzv/baRq+keAcS0c4FCCbl6rAuNRBM
	Iw6qW/Y0iUwHU9Vzex3C2rKkLWmNGjFgpxDutgyA58/Dcinpb9/FII1qS/8Bc0y09v8fJ+
	axpBbnaIrmV/Xhixopn+msh3u9M5vD1APVJkXyw4r5BwIBXEcb7ck5y1n3mnLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1674845466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=/tENzN1fZmTiIr9IRlRDDiiliEJeTf+ZkNKhBh7jCCQ=;
	b=aDS+HgXS2Lc409JnGpQ7BqEj5j1ty7AwsvblABp0cIQVwFLpUY4TaUdLOsXqnhMKT2AYLh
	EWgL0AMckdlP/PUOcotkKWVVnid5JUXa7HYcjS9+b/lZfw9H7bezkRho6gORMOTJdUuFrW
	o/XxIw0bnb6wYCEI23QfHKEopXZId/zQp1fZZYBXzLz9IZy0dqDBkkQIygAhb76Z19lP8+
	xnwKNUPME3smRjbEjReDWB8W5cBZYWPWrbdg4BbUClHtVd+gBrviO0GbmyZmeBfLpg4bNb
	PW3x7Z5j8gsCcRcy3BPNs8LzPxL85Ci+oVZtJaP8dTi2V19yKl0Z3wiJSfCS9w==
ARC-Authentication-Results: i=1;
	rspamd-544f66f495-b824g;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Imminent-Whimsical: 183d5168448ab42e_1674845466854_2630497509
X-MC-Loop-Signature: 1674845466854:2979937404
X-MC-Ingress-Time: 1674845466854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1674845465;
	bh=/tENzN1fZmTiIr9IRlRDDiiliEJeTf+ZkNKhBh7jCCQ=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=pCWLym6dy9sMeKjHPfNiKgthih4RtF6rtqAZl1H7vIiklQ7pDBgvor19ccYJin+SK
	 kdKlIdXMrJsFmaF1NVOYaWfwmUQJyND7Xr5v2cvYAXEIpbZ7qXqGt4JSOilqSTmF3u
	 b+2LnG8v/lDeFKpU7dAMS49qETdDmrKeQTriVv9k=
Date: Fri, 27 Jan 2023 10:51:03 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Reaver <me@davidreaver.com>
Subject: [PATCH v3] xen/x86: public: add TSC defines for cpuid leaf 4
Message-ID: <20230127185103.GB1955@templeofstupid.com>
References: <0c4eb4ba-4314-02c7-62d5-b08a3573fcc2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c4eb4ba-4314-02c7-62d5-b08a3573fcc2@suse.com>

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
index 7ecd16ae05..3fbd912dcd 100644
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
+#define XEN_CPUID_TSC_MODE_NEVER_EMULATE_TSC_AUX (3u)
+
 /*
  * Leaf 5 (0x40000x04)
  * HVM-specific features
-- 
2.25.1


