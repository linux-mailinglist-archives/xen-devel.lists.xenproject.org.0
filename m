Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1842923DC
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 10:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8665.23195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUQm6-0005gL-Ph; Mon, 19 Oct 2020 08:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8665.23195; Mon, 19 Oct 2020 08:44:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUQm6-0005fw-Me; Mon, 19 Oct 2020 08:44:14 +0000
Received: by outflank-mailman (input) for mailman id 8665;
 Mon, 19 Oct 2020 08:44:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUQm4-0005fr-NR
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 08:44:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84e74d34-620b-4c58-bddd-da16b64806cb;
 Mon, 19 Oct 2020 08:44:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9DA8AC8C;
 Mon, 19 Oct 2020 08:44:10 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUQm4-0005fr-NR
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 08:44:12 +0000
X-Inumbo-ID: 84e74d34-620b-4c58-bddd-da16b64806cb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 84e74d34-620b-4c58-bddd-da16b64806cb;
	Mon, 19 Oct 2020 08:44:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603097050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=COuzPGSKu8kTkPCTbkSS7vettxOSsQ5QPecx7OAzo4Q=;
	b=M/ycs8f9xbKzqQQ04tWGJXJ2QwQ6sByoJJF0QHtkI66kiu6i/pxfZDATX9E5zF4dgmzObp
	lHy9UzyJOcCskoIXgknoNjdNb/gMM5l3/d2pUXcRfzpFJjLscUZpDlqCFt22JBOuTTfVG2
	Ec50qgsXmhT4S8WP9d7ENosGF62BIfI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B9DA8AC8C;
	Mon, 19 Oct 2020 08:44:10 +0000 (UTC)
Subject: [PATCH v3 1/3] x86/shim: don't permit HVM and PV_SHIM_EXCLUSIVE at
 the same time
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
Message-ID: <2c687e27-9219-b2e4-f383-9ab6b3e1fbfe@suse.com>
Date: Mon, 19 Oct 2020 10:44:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

This combination doesn't really make sense (and there likely are more);
in particular even if the code built with both options set, HVM guests
wouldn't work (and I think one wouldn't be able to create one in the
first place). The alternative here would be some presumably intrusive
#ifdef-ary to get this combination to actually build (but still not
work) again.

Fixes: 8b5b49ceb3d9 ("x86: don't include domctl and alike in shim-exclusive builds")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v2: Restore lost default setting.

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -23,7 +23,7 @@ config X86
 	select HAS_PDX
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
-	select HAS_VPCI if !PV_SHIM_EXCLUSIVE && HVM
+	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
 	select NUMA
 
@@ -90,8 +90,9 @@ config PV_LINEAR_PT
          If unsure, say Y.
 
 config HVM
-	def_bool !PV_SHIM_EXCLUSIVE
-	prompt "HVM support"
+	bool "HVM support"
+	depends on !PV_SHIM_EXCLUSIVE
+	default y
 	---help---
 	  Interfaces to support HVM domains.  HVM domains require hardware
 	  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot

