Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 764E03512AD
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 11:47:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104251.199174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtvO-0005Da-RI; Thu, 01 Apr 2021 09:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104251.199174; Thu, 01 Apr 2021 09:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtvO-0005DB-NY; Thu, 01 Apr 2021 09:47:38 +0000
Received: by outflank-mailman (input) for mailman id 104251;
 Thu, 01 Apr 2021 09:47:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRtvN-0005Cz-4u
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:47:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44e4df5d-2e9a-4bf3-98ab-d0a39461290f;
 Thu, 01 Apr 2021 09:47:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9BECEAEB6;
 Thu,  1 Apr 2021 09:47:35 +0000 (UTC)
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
X-Inumbo-ID: 44e4df5d-2e9a-4bf3-98ab-d0a39461290f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617270455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JPanjNLWZj0sfyOALMrDaazSMh9LoXOd8c9exdMQnew=;
	b=IGPv4OtotCts8m+MoUtRP6JYnk/FVJHi1tVHu/JVgErsRzCK/DksCt6VfCJYbaS2WHPC8/
	dSl1Uso+7FMg0+S8GuLdj8/bLIO6JZupV0hAEY3eCi+vaSuCR79TyOkSdqOjFJ1QX3ntow
	VjABFEfXljVhN/pf9XhU83uNOl4knKM=
Subject: [PATCH 8/8] x86/EFI: don't have an overly large image size
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Message-ID: <26ec4a83-cda9-5193-d797-357c05b26ab7@suse.com>
Date: Thu, 1 Apr 2021 11:47:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While without debug info the difference is benign (so far), since we pad
the image to 16Mb anyway, forcing the .reloc section to a 2Mb boundary
causes subsequent .debug_* sections to go farther beyond 16Mb than
needed. There's no reason to advance . for establishing __2M_rwdata_end,
as all data past _end is of no interest at runtime anymore anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This makes more explicit a possible latent problem with the ELF image:
It ends at _end, not __2M_rwdata_end (advancing . as was done here does
not have the effect of increasing the image size). Interestingly the
conversion xen-syms => xen rounds up the program header specified size
suitably, as per the comment "Do not use p_memsz: it does not include
BSS alignment padding" in mkelf32.c. I do think this would instead want
taking care of in the linker script. Commit 7a95e0a2c572 ("x86: properly
calculate xen ELF end of image address") clearly only hacked an existing
hack rather than addressing the root cause. Thoughts?

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -303,8 +303,7 @@ SECTIONS
   } PHDR(text)
   _end = . ;
 
-  . = ALIGN(SECTION_ALIGN);
-  __2M_rwdata_end = .;
+  __2M_rwdata_end = ALIGN(SECTION_ALIGN);
 
 #ifdef EFI
   .reloc ALIGN(4) : {


