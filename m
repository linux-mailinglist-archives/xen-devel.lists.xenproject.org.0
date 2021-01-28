Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D5430784F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 15:41:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77099.139457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58TV-0007io-RR; Thu, 28 Jan 2021 14:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77099.139457; Thu, 28 Jan 2021 14:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58TV-0007iP-Ne; Thu, 28 Jan 2021 14:40:45 +0000
Received: by outflank-mailman (input) for mailman id 77099;
 Thu, 28 Jan 2021 14:40:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l58TU-0007iK-Ag
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:40:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33dd243c-cc79-483a-ad41-569f220181f8;
 Thu, 28 Jan 2021 14:40:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74302ACB7;
 Thu, 28 Jan 2021 14:40:42 +0000 (UTC)
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
X-Inumbo-ID: 33dd243c-cc79-483a-ad41-569f220181f8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611844842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lo8ff0wg31WPDl4BHmbjNh0fflkm+W+tVaUcxAY+VYY=;
	b=XDdoJODlpQEK3wPimMX6qIE9mGdvIo4HHxm/0lL95dIJGiai1qYh2lYZkPS8Mj8lv8DB0g
	QPrt/CHNCuYXNZqv30QJTMhA+YVu2iNc9nLuhEAlsxAE34dDRvjBjdikSKXs+H+HELcucF
	NwXuK1ZyWUtMxFJuFrEdDcCMBOnLtmQ=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: re-order error path of hvm_domain_initialise()
Message-ID: <57a95580-bae0-ac76-fb4c-e1db85da4d5f@suse.com>
Date: Thu, 28 Jan 2021 15:40:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

hvm_destroy_all_ioreq_servers(), called from
hvm_domain_relinquish_resources(), invokes relocate_portio_handler(),
which uses d->arch.hvm.io_handler. Defer freeing of this array
accordingly on the error path of hvm_domain_initialise().

Similarly rtc_deinit() requires d->arch.hvm.pl_time to still be around,
or else an armed timer structure would get freed, and that timer never
get killed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
We may want to consider moving the other two XFREE()s later as well,
if only to be on the safe side.

For vRTC I question the calling of check_update_timer() from rtc_init():
I would consider it more reasonable to do so immediately before the
guest gets first launched, especially if a guest remains paused for a
while after creation.

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -714,15 +714,15 @@ int hvm_domain_initialise(struct domain
  fail1:
     if ( is_hardware_domain(d) )
         xfree(d->arch.hvm.io_bitmap);
-    XFREE(d->arch.hvm.io_handler);
     XFREE(d->arch.hvm.params);
-    XFREE(d->arch.hvm.pl_time);
     XFREE(d->arch.hvm.irq);
  fail0:
     hvm_destroy_cacheattr_region_list(d);
     destroy_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0);
  fail:
     hvm_domain_relinquish_resources(d);
+    XFREE(d->arch.hvm.io_handler);
+    XFREE(d->arch.hvm.pl_time);
     return rc;
 }
 

