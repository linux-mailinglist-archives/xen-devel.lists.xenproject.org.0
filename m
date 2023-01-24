Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F5867A5F0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 23:35:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483768.750132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKRt0-0004Sx-3C; Tue, 24 Jan 2023 22:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483768.750132; Tue, 24 Jan 2023 22:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKRt0-0004QU-0G; Tue, 24 Jan 2023 22:35:26 +0000
Received: by outflank-mailman (input) for mailman id 483768;
 Tue, 24 Jan 2023 22:35:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mREw=5V=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pKRsy-0004QO-EI
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 22:35:24 +0000
Received: from hedgehog.birch.relay.mailchannels.net
 (hedgehog.birch.relay.mailchannels.net [23.83.209.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 621c667d-9c37-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 23:35:21 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id A3FBB641B11
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jan 2023 22:35:19 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 323FE6419D2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jan 2023 22:35:19 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.103.24.31 (trex/6.7.1); Tue, 24 Jan 2023 22:35:19 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4P1hck4Z67zf7
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jan 2023 14:35:18 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e006a by kmjvbox (DragonFly Mail Agent v0.12);
 Tue, 24 Jan 2023 14:35:16 -0800
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
X-Inumbo-ID: 621c667d-9c37-11ed-91b6-6bf2151ebd3b
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1674599719; a=rsa-sha256;
	cv=none;
	b=na7ndZ/tJ7Wzepuo09WIEZUPa2Ur3Nxjlfe1JykQ1vtDWhf9zu8yhW74wmJAcL/nNge5ai
	YKnJn+4WiBi7+slkin556bmHu4jzJF5T+Jheji9RMHDStEDYGpXuWBRUnTwbPCp/AkPh2z
	v1vPHYfsXLWoWIHNvGuNt9+xU+3vOXCmtfRF+fwSJzlWBqVowtRNzRaIl0FwJUodbqRJp2
	1JaanLK5a8LXWfYupXZWBAdoQph+SWIcXbbO4ADNLXH51iWfcXWsbadb2CiAfb2XXZ9crw
	FuFqEYWFhxvGlfBGjYl0H7Lquj7uM3OG5YF1Q154/NFC9u0r0crbO8NQx4PaJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1674599719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=/rnaVJdqABJD+0Xa4hNZqIvtAk2JjITERqbT0AFef+k=;
	b=VUFhB5qbzhlhyxCFK4du1nPoFYemSHM+zkdVetC6i/UY3ceoG3ObHByafFHRUp+m0ZCyt3
	sVyVUXu5CtGCRkgMDkaw9xj6vUEYqXqmfX+uTjmIxebOojPZaJtAKLqQi9ZiZivmk1STLa
	6ZY/vEn7oyeP3GIBBgcMiQfCbh62uDah0IJK+tCbTWzQYadT27USkgYJKX5Z+3wedAsGeK
	gLqx6FmoV2LHn0JtQIHlp2mpO2ZD5Xy/ipSYkO8lZ0zEHuhPUZ8PjOPxYW2hVqyZc3b1Zb
	/Nea1MV9K62x30UttDjjdBQVgL9lRuqfsNEUmBjfYcNY41OTFNJd34mDwAusZA==
ARC-Authentication-Results: i=1;
	rspamd-69c95c757c-zt9v2;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Wide-Eyed-Spicy: 79a11c450360c0dc_1674599719422_4293014534
X-MC-Loop-Signature: 1674599719422:603297941
X-MC-Ingress-Time: 1674599719421
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1674599718;
	bh=/rnaVJdqABJD+0Xa4hNZqIvtAk2JjITERqbT0AFef+k=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=DCwDfkrjRjWhSLFFfdj2dLanchkSI4muoA5sq2O2hGbpxiHWlMqkrXZWRhq1zb0Eg
	 yG6KGvxN1IvDut6OH6xEilCiB1laUUTSFeC1O/x1V+t6RztzIgtKDWbcLkhzPtR/bM
	 x2nCRKpRjWfEp22eX+bsrW2UzIQrz+rezO8mVdpw=
Date: Tue, 24 Jan 2023 14:35:16 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Reaver <me@davidreaver.com>
Subject: [PATCH] xen/x86: public: add TSC defines for cpuid leaf 4
Message-ID: <20230124223516.GA1962@templeofstupid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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
 xen/include/public/arch-x86/cpuid.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index 7ecd16ae05..97dc970417 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -71,6 +71,12 @@
  *             EDX: shift amount for tsc->ns conversion
  * Sub-leaf 2: EAX: host tsc frequency in kHz
  */
+#define XEN_CPUID_TSC_EMULATED       (1u << 0)
+#define XEN_CPUID_HOST_TSC_RELIABLE  (1u << 1)
+#define XEN_CPUID_RDTSCP_INSTR_AVAIL (1u << 2)
+#define XEN_CPUID_TSC_MODE_DEFAULT   (0)
+#define XEN_CPUID_TSC_MODE_EMULATE   (1u)
+#define XEN_CPUID_TSC_MODE_NOEMULATE (2u)
 
 /*
  * Leaf 5 (0x40000x04)
-- 
2.25.1


