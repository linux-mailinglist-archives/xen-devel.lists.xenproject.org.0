Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4015B52F9
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 06:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405372.647806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXacy-00088U-BC; Mon, 12 Sep 2022 04:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405372.647806; Mon, 12 Sep 2022 04:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXacy-00086Y-4H; Mon, 12 Sep 2022 04:00:56 +0000
Received: by outflank-mailman (input) for mailman id 405372;
 Mon, 12 Sep 2022 04:00:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JuFZ=ZP=runbox.com=m.v.b@srs-se1.protection.inumbo.net>)
 id 1oXacw-00086S-PB
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 04:00:55 +0000
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com
 [2a0c:5a00:149::26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e89a40c-324f-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 06:00:52 +0200 (CEST)
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
 by mailtransmit05.runbox.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <m.v.b@runbox.com>)
 id 1oXact-009joN-Sw; Mon, 12 Sep 2022 06:00:51 +0200
Received: from [10.9.9.73] (helo=submission02.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <m.v.b@runbox.com>)
 id 1oXact-0004X5-Cu; Mon, 12 Sep 2022 06:00:51 +0200
Received: by submission02.runbox with esmtpsa [Authenticated ID (536975)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1oXach-0003S3-DL; Mon, 12 Sep 2022 06:00:39 +0200
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
X-Inumbo-ID: 7e89a40c-324f-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=UB4fTYWfrW3vEt2oDlOTKBk6EbS08X1+1sCyJYpMX6M=; b=wsBt9B
	rNhZlSmXaFOaUsL7bzGgtj6T7a5eDibuOqEJyMGFsWPJHhhEZ7XYhJuc4B5Nl1EqurFY12BPedUZz
	bfHkSGxrj1XbJp1AwXJy0UOSEcx2IeWNvPkf3IKz50q84/OFGAMT03HUT1v3MeAGEyBUOOdnZzM8a
	/o0ye5rKua9T7Klgi/hJwrnQqymFfyE5e4cG5MtZ19CYsFxRMRXUnrV+FKN21itSK65H6euVC3LGJ
	MQiDuyeA+4MVqW75zaAkcDGoAX+cBOMvTuYilUiWPpXxB0ZDLOvM12//HqjbLUNrSCWzHlJbg8B1B
	9z7JeYqQ1fpFHHDJI73HWwoCXW9A==;
From: "M. Vefa Bicakci" <m.v.b@runbox.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: m.v.b@runbox.com,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 0/2] xen/gntdev: Fixes for leaks and VMA splitting
Date: Mon, 12 Sep 2022 00:00:00 -0400
Message-Id: <20220912040002.198191-1-m.v.b@runbox.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

The changes in this patch series intend to fix the Xen grant device
driver, so that grant mapping leaks caused by partially failed grant
mapping operations are avoided with the first patch, and so that the
splitting of VMAs does not result in incorrectly unmapped grant pages
with the second patch. The second patch also prevents a similar issue in
a double-mapping scenario, where mmap() is used with MAP_FIXED to map
grants over an existing mapping created with the same grants, and where
grant pages are unmapped incorrectly as well.

These commits were tested on top of Linux v5.15.67, but I have also
verified that they compile fine on top of the base commit mentioned at
the bottom of this cover letter. The base commit in question is tagged
as "next-20220909".

Thank you,

Vefa

M. Vefa Bicakci (2):
  xen/gntdev: Prevent leaking grants
  xen/gntdev: Accommodate VMA splitting

 drivers/xen/gntdev-common.h |  3 +-
 drivers/xen/gntdev.c        | 90 +++++++++++++++++++++----------------
 2 files changed, 54 insertions(+), 39 deletions(-)


base-commit: 9a82ccda91ed2b40619cb3c10d446ae1f97bab6e
-- 
2.37.3


