Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEF1B253BC
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 21:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080215.1440749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umGv2-0007vd-Dx; Wed, 13 Aug 2025 19:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080215.1440749; Wed, 13 Aug 2025 19:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umGv2-0007si-AU; Wed, 13 Aug 2025 19:13:52 +0000
Received: by outflank-mailman (input) for mailman id 1080215;
 Wed, 13 Aug 2025 19:13:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EaOB=2Z=gmail.com=nicola.vetrini@bugseng.com>)
 id 1umGv1-0007sc-AW
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 19:13:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1e9eb3a-7879-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 21:13:50 +0200 (CEST)
Received: from nico.tail79467d.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id C41EB4EE3C04;
 Wed, 13 Aug 2025 21:13:41 +0200 (CEST)
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
X-Inumbo-ID: a1e9eb3a-7879-11f0-a328-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755112424;
	b=GGeUXKpTbWantT3ja9h1kMqcXZB/t0HpFiw0Hp5/eVZOP2qA8asOeKDnCDQ2IiZyJ0BO
	 hZ7HQ6PSRXlPgH8E/tGbUlnY0xy342NyQo2AzjEvQ61JoOLWAGUI3yCKtYknUNo83j12H
	 LFd6wQTQxKSQ89m207WOEU0lpGpJzZvOWbZfIy5CUoqavNynkZD0j7iy1vC3MMXjSYPe5
	 LYWnW1g/mtywV1KdQ4Z01GnOTdukCTgZv9rJAOzbVKInZXq7Ty0IhNVKg8x57FLFr4Ydj
	 Xa/jMWQRRGG9avPGX44Z7fjMa9fs75APFENaon3tdB687KMTRLBOI/UL7eiBlHahY4KJd
	 x5LPITyQt4mkKhyTENBMM/ffjHrZdxhIS9xUjhVOoJ8RAjOZSyfqhf2gW1XfOnJFvjIK0
	 ICD89kCJxsBSGYN3f/NLq+XZiRrX5+Wo3Q7zX1VWVdwSEGPDpF2pwC+xqjwXSQYzTpzBQ
	 AW+DpXGZCV/m8z/EoEwbtv6j/igpSQ70OEQjsRoyvofIzD5UCn4v0E6x0q3pGprWLcAmJ
	 eJoRxQpMZerMmdKMc6fz/VFknWMufUVfFylSBcnSsooj6GfvIj6nCfTnaD/6rzpw7zeSJ
	 awB5mEteIEfr8BctcLS41oBP70rwGwUVltRfhIXumlMQv9yxZQp98Ty1uh0ejdU=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755112424;
	h=From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2izQEEsEoXe8U0qFnjbrGzxnPbP1HHcIMSYNM12SpUg=;
	b=jdE+3bghFYeFsJoAwJGUMGoJq+zGNbPnRXJvrRtIb8yvUtdCDN41A5UShGLlyDjSa2J1
	 rwwSkAQHSnjIwvck8FRIQ1l4lBfqLr2ZUe58eHjfdBrH8dMj3cYozw4i4vjRVTz4g1Pft
	 kcOO+PtrFngwDiHJV8A9M9NRHL30FopprHIzY3hwGHh31vebxdb9qgIc6c+djgw9eAfZf
	 OA2kM01kPzaSF2dHJI2OtBsWHumxujc81h2MpVGT38pv8y9aevzAE52S2K0mWMIeHXFgn
	 Dy5O7VJUoWsptwdPdwuzh591YzR6Z6W5Xzr7CO5DLzCr7/VaxzIjFIX4YThtuujWpzB14
	 Gq4Qsr66ZrQD9o1ZgOr5FG8p31tayOfSCll27y/tnYS+JBm5ZNR8Q9/kFovC9bSAX/bZE
	 P0hIGK+s8GDlT1erdSQ0HLmkFiykpznyi28UFAGQhxq6TkU9O5fc87CX4K7vS0IQjMKVC
	 HH7urWIhKake43osyvlriR++qtuwSJEbnjr1fn0HsHq8fXY8IbDaFE/BVESKxyzXlGexy
	 VCBpJpWmxnpiaaTl4jWUdZvgsC2iQHmWaWvb40fYKp8C1///yrBC71Pfdt8JXKEeTM4t3
	 uSSVIVyxuVV1WjXuyswu6RtWQtKnmUUKuHmfrwIpop0BZ1MRfq10LD6/ddnTyCc=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
From: nicola.vetrini@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Nicola Vetrini <nicola.vetrini@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [XEN PATCH 0/3] Drop alternative definitions for unsupported GCCs
Date: Wed, 13 Aug 2025 21:12:47 +0200
Message-ID: <cover.1755111932.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicola Vetrini <nicola.vetrini@gmail.com>

Similar to e4a042062787, drop alternative defines for older GCC versions

Nicola Vetrini (3):
  xen/compiler: drop alternative unreachable() definition for older GCC
  xen/macros: Drop alternative definition of BUILD_BUG_ON(_ZERO)? for
    old GCC
  xen/efi: efibind: Drop alternative define for old GCC versions

 xen/arch/x86/include/asm/x86_64/efibind.h | 4 +---
 xen/include/xen/compiler.h                | 4 ----
 xen/include/xen/macros.h                  | 8 --------
 3 files changed, 1 insertion(+), 15 deletions(-)

-- 
2.43.0


