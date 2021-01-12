Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B71F2F3AFD
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 20:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65958.116959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPfC-0006DA-TI; Tue, 12 Jan 2021 19:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65958.116959; Tue, 12 Jan 2021 19:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPfC-0006CR-Oq; Tue, 12 Jan 2021 19:49:10 +0000
Received: by outflank-mailman (input) for mailman id 65958;
 Tue, 12 Jan 2021 19:49:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh5d=GP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzPfB-00066z-5z
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 19:49:09 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbf235d4-fe19-4919-9e9a-66968dfb69df;
 Tue, 12 Jan 2021 19:49:04 +0000 (UTC)
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
X-Inumbo-ID: bbf235d4-fe19-4919-9e9a-66968dfb69df
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610480944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/lEUtHbPcN2XVh53IarWY1jBzQfcYRjmKojGzZEr8Dc=;
  b=AE1MI/iegWKgtsD+JPXaoKIgDwO701fRV4Fi9IA/rG0CkiEYQms2o1g/
   3DXUzynlX76fxwEAP3Xa2sNdKvyA3bgIwnXLmvHNYbs4/gMjPX7hJJpJu
   lMm7m0dqMfYlz83SU11okN1q3vXbOE6jpxh/wSO41XBiNpU9Ao8OGK3dC
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: n3ZBGtGurNual2FwTY1cVU+Tl/bj7doQHUmwSmmGYZCz0wzxAKz81fomZupnJi6ug51g239N1k
 Eoepmqe8AmI/hXCrNjsYspx1SyKf8hE3s2AfU8Kud4NzDANc3UIu3rjI0c4lsnw0SJ5G8YK7hV
 fCADj3eCEBg0UOHbP+VzVX4hHuU9U/v2C/7dc90p1MfjwbYryvLXO1gFnS+nKYj/mW/Bt4Oe7a
 MnRPEuTUz/shF8l1VvjnDdMtltH23xQyAQ2bMM/xJNQcy6RmnUGJV+VGsDoH+WFwjsyB+NC2Nf
 5KM=
X-SBRS: 5.2
X-MesageID: 36235813
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,342,1602561600"; 
   d="scan'208";a="36235813"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: [PATCH v3 4/7] xen/memory: Clarify the XENMEM_acquire_resource ABI description
Date: Tue, 12 Jan 2021 19:48:38 +0000
Message-ID: <20210112194841.1537-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210112194841.1537-1-andrew.cooper3@citrix.com>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is how similar operations already operate, compatible with the sole
implementation (in Linux), and explicitly gives us some flexibility.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/include/public/memory.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index d7eb34f167..c4c47a0b38 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -642,6 +642,7 @@ struct xen_mem_acquire_resource {
      * IN/OUT
      *
      * As an IN parameter number of frames of the resource to be mapped.
+     * This value may be updated during the course of the operation.
      *
      * When frame_list is NULL and nr_frames is 0, this is interpreted as a
      * request for the size of the resource, which shall be returned in the
@@ -656,7 +657,8 @@ struct xen_mem_acquire_resource {
     uint32_t pad;
     /*
      * IN - the index of the initial frame to be mapped. This parameter
-     *      is ignored if nr_frames is 0.
+     *      is ignored if nr_frames is 0.  This value may be updated
+     *      during the course of the operation.
      */
     uint64_t frame;
 
@@ -672,7 +674,8 @@ struct xen_mem_acquire_resource {
      *          If -EIO is returned then the frame_list has only been
      *          partially mapped and it is up to the caller to unmap all
      *          the GFNs.
-     *          This parameter may be NULL if nr_frames is 0.
+     *          This parameter may be NULL if nr_frames is 0.  This
+     *          value may be updated during the course of the operation.
      */
     XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
 };
-- 
2.11.0


