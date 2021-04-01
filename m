Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C635129B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 11:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104227.199101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtsf-0004Vw-Om; Thu, 01 Apr 2021 09:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104227.199101; Thu, 01 Apr 2021 09:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtsf-0004VY-Kt; Thu, 01 Apr 2021 09:44:49 +0000
Received: by outflank-mailman (input) for mailman id 104227;
 Thu, 01 Apr 2021 09:44:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRtsd-0004VQ-Um
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:44:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe3208f1-ecda-432e-992b-d7c37b5347b1;
 Thu, 01 Apr 2021 09:44:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 103B1AEB6;
 Thu,  1 Apr 2021 09:44:46 +0000 (UTC)
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
X-Inumbo-ID: fe3208f1-ecda-432e-992b-d7c37b5347b1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617270286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DTY3+YpVaKr0M5lxEi40/UGmLAUNw4TGq/wK3vHEKos=;
	b=RMb8FYQPGQ4y2QUArjxQ8e8E9Ki9Di/g32LAqqoALfhUEAYYcyRsoG6ubbRT+syvdahlPu
	lXOaLpqN4iKXypG7Dci1xCZ5NpTMPOqT1r5+HjsoJ3UbWNQVFfiwMyVHhWGHGcLdoHIwBu
	gVDLQzqmktH+1xJiyWBW2AilaEM3PEc=
Subject: [PATCH 2/8] x86/EFI: sections may not live at VA 0 in PE binaries
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Message-ID: <5d7c61b0-8441-dccc-4917-cc8a436fd96f@suse.com>
Date: Thu, 1 Apr 2021 11:44:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

PE binaries specify section addresses by (32-bit) RVA. GNU ld up to at
least 2.36 would silently truncate the (negative) difference when a
section is placed below the image base. Such sections would also be
wrongly placed ahead of all "normal" ones. Since, for the time being,
we build xen.efi with --strip-debug anyway, .stab* can't appear. And
.comment has an entry in /DISCARD/ already anyway in the EFI case.

Because of their unclear origin, keep the directives for the ELF case
though.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
It's certainly odd that we have stabs section entries in the script, but
no Dwarf ones.

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -347,6 +347,7 @@ SECTIONS
 #endif
   }
 
+#ifndef EFI
   /* Stabs debugging sections.  */
   .stab 0 : { *(.stab) }
   .stabstr 0 : { *(.stabstr) }
@@ -355,6 +356,7 @@ SECTIONS
   .stab.index 0 : { *(.stab.index) }
   .stab.indexstr 0 : { *(.stab.indexstr) }
   .comment 0 : { *(.comment) }
+#endif
 }
 
 ASSERT(__2M_rwdata_end <= XEN_VIRT_END - XEN_VIRT_START + __XEN_VIRT_START -


