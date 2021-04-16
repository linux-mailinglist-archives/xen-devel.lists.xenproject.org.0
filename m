Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63A9361FEB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 14:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111705.213609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXNeT-0003Yp-P4; Fri, 16 Apr 2021 12:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111705.213609; Fri, 16 Apr 2021 12:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXNeT-0003YQ-Lk; Fri, 16 Apr 2021 12:32:49 +0000
Received: by outflank-mailman (input) for mailman id 111705;
 Fri, 16 Apr 2021 12:32:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDum=JN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lXNeS-0003Y5-7w
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 12:32:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c042834a-9e3c-4f6e-89cb-f8573e2a81cc;
 Fri, 16 Apr 2021 12:32:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 324B5B036;
 Fri, 16 Apr 2021 12:32:46 +0000 (UTC)
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
X-Inumbo-ID: c042834a-9e3c-4f6e-89cb-f8573e2a81cc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618576366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=luWHCLnoFFFinXHoizhCXTY+5bpKvS2q8+7RdusGvw0=;
	b=GaEpyH71PbpNaW+fkt5r40fHBTpzAfMdsXHncACEMFSIY1s7q8fabxwUvw/sJOfNYZ4mzh
	kRRRAw6kUPpaZ0DJGg3g3ij18yHHBhgP32q8ArjS0QUIWyWt506GC5jFRax6kj3fKR2dBZ
	8I6r4eqBydXY4m83zT1zLeb8ZMNinQo=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: depend on PV || HVM
Message-ID: <eee69a8e-36d5-b9eb-d8f1-1a7e1c3dfdc0@suse.com>
Date: Fri, 16 Apr 2021 14:32:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

With the building of guest_?.o now depending on PV or HVM, without
further #ifdef-ary shadow code won't link anymore when !PV && !HVM.
Since this isn't a useful configuration anyway, exclude shadow code from
being built in this case.

Fixes: aff8bf94ce65 ("x86/shadow: only 4-level guest code needs building when !HVM")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -121,6 +121,7 @@ config XEN_SHSTK
 config SHADOW_PAGING
 	bool "Shadow Paging"
 	default !PV_SHIM_EXCLUSIVE
+	depends on PV || HVM
 	---help---
 
           Shadow paging is a software alternative to hardware paging support

