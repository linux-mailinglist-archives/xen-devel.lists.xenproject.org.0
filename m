Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B8CC1C081
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 17:22:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152986.1483478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8vy-0006mr-GA; Wed, 29 Oct 2025 16:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152986.1483478; Wed, 29 Oct 2025 16:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8vy-0006jn-DZ; Wed, 29 Oct 2025 16:22:02 +0000
Received: by outflank-mailman (input) for mailman id 1152986;
 Wed, 29 Oct 2025 16:22:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U31q=5G=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vE8vw-0006jh-KE
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 16:22:00 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 649a2112-b4e3-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 17:21:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3D9317790836;
 Wed, 29 Oct 2025 11:21:58 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id yoK6KqvvWYXM; Wed, 29 Oct 2025 11:21:57 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C554F77909D6;
 Wed, 29 Oct 2025 11:21:57 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id A3HgJKzp2KYY; Wed, 29 Oct 2025 11:21:57 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A50357790836;
 Wed, 29 Oct 2025 11:21:57 -0500 (CDT)
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
X-Inumbo-ID: 649a2112-b4e3-11f0-9d16-b5c5bf9af7f9
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C554F77909D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1761754917; bh=kl1KEbh9Ft0GCHWz4g0qKwnPGZ2NpPYJTjTRcy1f+UA=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=l9Hxdo46v1Ul0ky7sVgF4bvWP2yPDH+NlIU69ctUEglkvxtLiWFddTkGq3V3lvjYJ
	 noHRA4KIQhlU34H+0vWmVt54wj1IoBj7KzwzuDHLz5VgYgK9uGPBSIKzzGxZWdEbqb
	 v1McKvu8STZl3fVBoZPm5dM/+gA15m+Fs5cEo4U4=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Wed, 29 Oct 2025 11:21:57 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, shawn <shawn@anastas.io>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <1794235010.4856.1761754917625.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v2] MAINTAINERS: Remove Shawn Anastasio as PPC64 maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Index: cUw/Hiil+ONZbVmqernyfdki6+68Zw==
Thread-Topic: MAINTAINERS: Remove Shawn Anastasio as PPC64 maintainer

Shawn is no longer with Raptor Engineering.  For now, add myself as PPC64
reviewer.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ecd3f40df8..c8764a8c5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -472,7 +472,7 @@ F:	xen/drivers/cpufreq/
 F:	xen/include/acpi/cpufreq/
 
 PPC64
-M:	Shawn Anastasio <sanastasio@raptorengineering.com>
+M:	Timothy Pearson <tpearson@raptorengineering.com>
 F:	xen/arch/ppc/
 
 PUBLIC I/O INTERFACES AND PV DRIVERS DESIGNS
-- 
2.39.5

