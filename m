Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E867B968
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 19:34:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484521.751137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKkaf-0004te-AJ; Wed, 25 Jan 2023 18:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484521.751137; Wed, 25 Jan 2023 18:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKkaf-0004rx-6l; Wed, 25 Jan 2023 18:33:45 +0000
Received: by outflank-mailman (input) for mailman id 484521;
 Wed, 25 Jan 2023 18:33:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dnVv=5W=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pKkad-0004rn-Uo
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 18:33:43 +0000
Received: from crocodile.elm.relay.mailchannels.net
 (crocodile.elm.relay.mailchannels.net [23.83.212.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c98d1fd9-9cde-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 19:33:41 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 25BFC881D46
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 18:33:39 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 8EC9C881C5C
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 18:33:38 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.126.30.49 (trex/6.7.1); Wed, 25 Jan 2023 18:33:38 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4P2CCQ1YPDzK3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 10:33:38 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e00e2 by kmjvbox (DragonFly Mail Agent v0.12);
 Wed, 25 Jan 2023 10:33:37 -0800
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
X-Inumbo-ID: c98d1fd9-9cde-11ed-91b6-6bf2151ebd3b
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1674671618; a=rsa-sha256;
	cv=none;
	b=0RcDVdnfrfpZO++0fp/wERntWG6DUztZnG2iq28H16d12M7DJEGQQoj1QheyUuXcgnMhPA
	nkv+xt4MRVjEIEKg+t6WaZfh14lmJj0isg1S1dI8RbMD813+1d4iJoOZaZ2cPdzfmW66ea
	4OE6hO/TowJHfI5vo+cI9M9QMg1MUAV8ank6MUmpIeU6M4HfxYuJL45dZUZGd5ZQxbVm2Z
	QsL4MnEa5PaNVUoFMAIeW41ZuJkdvRe4kP3c7QuV+LHqxhb2F/9gHOt5FQ8G1lPQFTaajb
	zPIfHEilx2e4rMdPOab3CleXm6o15uVgEBEZS7hJGY3lrIMRiDEViUaHXYqo+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1674671618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=eqyFtuln9teDjnwVY8VK7WjssFBHkmh8oTKDG+ZK2Dg=;
	b=iooMJgKXGkqohds3FAEuulD2ymWzfGD8M8Q/jP9FiKGctDuiUS1NE+CdwS4Tf4u1fMWHiT
	FnAxR06uOCsFohEA/nc8YjyI/puk0ctlmOTHEvBuqvY60N2oX8F9j6pG0d8flTkP66WcIz
	UZafvLARpFUMbVO9HwRPtngvctong+lJ5dl3VaZF+0BX2GtfODy7DUuE4P621DNw/LHjfw
	u+I0A702GgqNvuaulE/f0vPBAKdJffyqG0qXLA+NKWL8P0IJmk6Ic7CS5bTfobaEP6+1OX
	Fr/sPuV8WoMBf+7R3d580dR55eHnBstUCYXqGEvk3saIsKhh/a6wyurhMiOCbA==
ARC-Authentication-Results: i=1;
	rspamd-65f5b7cf85-z6rsq;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Cure-Gusty: 65b9a5b53bc53093_1674671618808_1379431902
X-MC-Loop-Signature: 1674671618808:1002556764
X-MC-Ingress-Time: 1674671618808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1674671618;
	bh=eqyFtuln9teDjnwVY8VK7WjssFBHkmh8oTKDG+ZK2Dg=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=jTYoayBwAJyox93l/wMGptzqafXCYrPR9Oascr3rXA8ynmDNqiGto3CJNq1wd80ic
	 fEZEVmdZtOW06CnMG4XZFajP6M+zd341nk89Nb+q0GyISCnGfzx4lc4uiwut3n734C
	 Blo3ouPHsd60YXfSE+Rlas1IaH1a2b8Blg/z4zu8=
Date: Wed, 25 Jan 2023 10:33:37 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Reaver <me@davidreaver.com>
Subject: [PATCH v2] xen/x86: public: add TSC defines for cpuid leaf 4
Message-ID: <20230125183337.GC1963@templeofstupid.com>
References: <20230124223531.GB1962@templeofstupid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124223531.GB1962@templeofstupid.com>

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


