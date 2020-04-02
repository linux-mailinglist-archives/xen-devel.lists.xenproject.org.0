Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AA319BD92
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 10:27:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJv9R-0008Bt-RZ; Thu, 02 Apr 2020 08:24:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJv9Q-0008Bo-KO
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 08:24:36 +0000
X-Inumbo-ID: 62c9049a-74bb-11ea-bb88-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62c9049a-74bb-11ea-bb88-12813bfff9fa;
 Thu, 02 Apr 2020 08:24:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 10193ACC6;
 Thu,  2 Apr 2020 08:24:35 +0000 (UTC)
Subject: [PATCH v2 1/2] x86/cpuidle: drop Cannon Lake support
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e39d4326-57d1-a4b5-3081-76b5160644ae@suse.com>
Message-ID: <0a95dc08-d547-a7c0-1a82-d28f7290e93b@suse.com>
Date: Thu, 2 Apr 2020 10:24:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e39d4326-57d1-a4b5-3081-76b5160644ae@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As per SDM rev 071 Cannon Lake has
- no CC3 residency MSR at 3FC,
- a CC1 residency MSR ar 660 (like various Atoms),
- a useless (always zero) CC3 residency MSR at 662.
However, this CPU model has been discontinued and isn't a primary target
of Xen anyway. Hence (at least for now) rather than correcting things,
simply drop the case label altogether.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Split from larger patch.

--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -180,8 +180,6 @@ static void do_get_hw_residencies(void *
     case 0x4E:
     case 0x55:
     case 0x5E:
-    /* Cannon Lake */
-    case 0x66:
     /* Kaby Lake */
     case 0x8E:
     case 0x9E:


