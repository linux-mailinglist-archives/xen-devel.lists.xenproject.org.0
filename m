Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C33227481D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:25:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKmyo-0008Vj-KY; Tue, 22 Sep 2020 18:25:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKmyn-0008V0-BZ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:25:29 +0000
X-Inumbo-ID: 9f7a1f4a-4c4b-44a5-ab12-d566d463e613
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f7a1f4a-4c4b-44a5-ab12-d566d463e613;
 Tue, 22 Sep 2020 18:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600799129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QzVikzTXIrENnpKWbynQkJyOfWkh2lkxwYpfijKtf/0=;
 b=cfjkELq5Zs9EdqDmWRjmYe2SNkMvVWFebo+RwWbto6CccjvHexeo1bTr
 oo5I7Y4fVMFSwNvFdcxbiF5dviTQmfSvuMGI0zy9TCvS1OgRkVUwhN35L
 sFFu1AiedZw7DepUxzDwE/ajRGb6lWjT2dWBz0KKZ8zi35drH0KSztbZo 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ox9Ky0uJZEa6RYONNB1dq0u6kg1zwZNt18Av1jD72N6oKG/HKDzpiS+q5FifRsFQzp+Y9+gB2B
 ygZIbhM0Ewo6WGqcimUaPBgcm96whm1DxbR/Q734qaKJSgf9BpjIjVRXMxoMIpYdnXjBHTnlY4
 wct78+xVFlGg7pDfp9tAIFgx7nTZ6mcFPg2eERqFt4Qt/duSHB+Q6Xj1yGxtEjGUXspB51J9u9
 AHM21dRrJAt6U3gXfMberzhBKwl08OcLehxKq21h+XacFmqpcp4Kssl8NRNicr4JqdM5Zsooxk
 VAw=
X-SBRS: 2.7
X-MesageID: 27631635
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27631635"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
 <tamas@tklengyel.com>
Subject: [PATCH v2 06/11] xen/memory: Clarify the XENMEM_acquire_resource ABI
 description
Date: Tue, 22 Sep 2020 19:24:39 +0100
Message-ID: <20200922182444.12350-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200922182444.12350-1-andrew.cooper3@citrix.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is how similar operations already operate, compatible with the sole
implementation (in Linux), and explicitly gives us some flexibility.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
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


