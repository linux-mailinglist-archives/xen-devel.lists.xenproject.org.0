Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9417A1B2586
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 14:06:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQrfB-0007Sr-Rb; Tue, 21 Apr 2020 12:06:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQrf9-0007Sm-LY
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 12:06:03 +0000
X-Inumbo-ID: 784b4a0a-83c8-11ea-912a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 784b4a0a-83c8-11ea-912a-12813bfff9fa;
 Tue, 21 Apr 2020 12:06:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D8C89ABC7;
 Tue, 21 Apr 2020 12:06:00 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: make sh_remove_write_access() helper HVM only
Message-ID: <2a339346-ed09-22b6-88fb-6f9d997b10b4@suse.com>
Date: Tue, 21 Apr 2020 14:05:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Despite the inline attribute at least some clang versions warn about
trace_shadow_wrmap_bf() being unused in !HVM builds. Include the helper
in the #ifdef region.

Fixes: 8b8d011ad868 ("x86/shadow: the guess_wrmap() hook is needed for HVM only")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1756,6 +1756,7 @@ void sh_destroy_shadow(struct domain *d,
     }
 }
 
+#ifdef CONFIG_HVM
 static inline void trace_shadow_wrmap_bf(mfn_t gmfn)
 {
     if ( tb_init_done )
@@ -1767,7 +1768,6 @@ static inline void trace_shadow_wrmap_bf
     }
 }
 
-#ifdef CONFIG_HVM
 /**************************************************************************/
 /* Remove all writeable mappings of a guest frame from the shadow tables
  * Returns non-zero if we need to flush TLBs.

