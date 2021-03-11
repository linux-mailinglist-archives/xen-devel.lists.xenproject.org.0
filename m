Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF41336F07
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 10:41:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96410.182352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKHoG-00073h-Gq; Thu, 11 Mar 2021 09:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96410.182352; Thu, 11 Mar 2021 09:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKHoG-00073I-DW; Thu, 11 Mar 2021 09:40:48 +0000
Received: by outflank-mailman (input) for mailman id 96410;
 Thu, 11 Mar 2021 09:40:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gir7=IJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lKHoE-00073D-NY
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 09:40:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4168d23-4778-427b-ab71-434787f94cf1;
 Thu, 11 Mar 2021 09:40:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E146AC16;
 Thu, 11 Mar 2021 09:40:44 +0000 (UTC)
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
X-Inumbo-ID: f4168d23-4778-427b-ab71-434787f94cf1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615455644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1XVkrEfKmBVOU6F+L+VVfC9OHCsEz9IKiz0UT5qoCQE=;
	b=MZqljq3IQAm31q6uxSEDAaFiKhtAirMgPS3ixjN4ZYyKYth1Q+3U2oqsl5t9tDvtzOUsRv
	YeDa7TMLqN6ZPUrOSP1foQTd/UL0oUTQ0nZvsc6mlb+tnfhcStOYMyUNa8Png+F3m81zxq
	itxFjCWpndQy+o41c1uNHzQhu6KPn7s=
Subject: [PATCH] xen: fix for_each_cpu when NR_CPUS=1
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Thu, 11 Mar 2021 09:40:43 +0000
Message-ID: <161545564302.24868.14477928469038686899.stgit@Wayrath>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

When running an hypervisor build with NR_CPUS=1 for_each_cpu does not
take into account whether the bit of the CPU is set or not in the
provided mask.

This means that whatever we have in the bodies of these loops is always
done once, even if the mask was empty and it should never be done. This
is clearly a bug and was in fact causing an assert to trigger in credit2
code.

Removing the special casing of NR_CPUS == 1 makes things work again.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
---
I'm not really sure whether this should be 4.15 material.

It's definitely a bug, IMO. The risk is also pretty low, considering
that no one should really run Xen in this configuration (NR_CPUS=1, I
mean). Which is also the reason why it's probably not really important
that we fix it at this point of the release cycle.
---
 xen/include/xen/cpumask.h |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/xen/include/xen/cpumask.h b/xen/include/xen/cpumask.h
index 256b60b106..e69589fc08 100644
--- a/xen/include/xen/cpumask.h
+++ b/xen/include/xen/cpumask.h
@@ -368,15 +368,10 @@ static inline void free_cpumask_var(cpumask_var_t mask)
 #define FREE_CPUMASK_VAR(m) free_cpumask_var(m)
 #endif
 
-#if NR_CPUS > 1
 #define for_each_cpu(cpu, mask)			\
 	for ((cpu) = cpumask_first(mask);	\
 	     (cpu) < nr_cpu_ids;		\
 	     (cpu) = cpumask_next(cpu, mask))
-#else /* NR_CPUS == 1 */
-#define for_each_cpu(cpu, mask)			\
-	for ((cpu) = 0; (cpu) < 1; (cpu)++, (void)(mask))
-#endif /* NR_CPUS */
 
 /*
  * The following particular system cpumasks and operations manage



