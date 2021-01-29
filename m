Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5671F308887
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 12:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78061.141845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SFm-0000Hx-2B; Fri, 29 Jan 2021 11:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78061.141845; Fri, 29 Jan 2021 11:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SFl-0000HY-Uh; Fri, 29 Jan 2021 11:47:53 +0000
Received: by outflank-mailman (input) for mailman id 78061;
 Fri, 29 Jan 2021 11:47:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5SFk-0000HS-FJ
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 11:47:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28c1e95e-1f1a-4c2a-926b-15c1aaa69754;
 Fri, 29 Jan 2021 11:47:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09B3FAE44;
 Fri, 29 Jan 2021 11:47:51 +0000 (UTC)
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
X-Inumbo-ID: 28c1e95e-1f1a-4c2a-926b-15c1aaa69754
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611920871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D1518ntl4YLdyBdKaA0oI7BiNTZxN+BoeF1+sRU3ZCg=;
	b=Bc4TQlFBiahMpFixXyXOSangybf7NyRxGSZMr8rHFjcQzrI1iRPuSbrd9ObrQxOrFVhKpK
	oSEuay7R7Y5+hIiLCECAVvwL7YhJZHES9ktN+ugxklw9V2+K61fJP4YBKdgivh8lG+kaPv
	KpSonfaTrT9Im+VSzUXpEpaA1nRZqtA=
Subject: [PATCH XTF RFC] force-enable UMIP for UMIP testing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
References: <5a8b1c37-5f53-746f-ba87-778d4d980d99@suse.com>
Message-ID: <045a8b84-eed0-f43a-dcff-2d992c638742@suse.com>
Date: Fri, 29 Jan 2021 12:47:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <5a8b1c37-5f53-746f-ba87-778d4d980d99@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Enable UMIP even if underlying hardware doesn't support it (assuming
the respective change supporting its emulation is in place). Obviously,
as explained in that patch, the SMSW test is then expected to fail on
Intel hardware.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tests/umip/Makefile
+++ b/tests/umip/Makefile
@@ -4,6 +4,8 @@ NAME      := umip
 CATEGORY  := functional
 TEST-ENVS := hvm32 hvm64
 
+TEST-EXTRA-CFG := extra.cfg.in
+
 obj-perenv += main.o
 
 include $(ROOT)/build/gen.mk
--- /dev/null
+++ b/tests/umip/extra.cfg.in
@@ -0,0 +1 @@
+cpuid = "host,umip=1"


