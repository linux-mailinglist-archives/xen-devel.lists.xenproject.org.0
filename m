Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F45046A1F0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239426.415031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOX-0008WJ-Vl; Mon, 06 Dec 2021 17:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239426.415031; Mon, 06 Dec 2021 17:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOX-0008QC-OV; Mon, 06 Dec 2021 17:03:17 +0000
Received: by outflank-mailman (input) for mailman id 239426;
 Mon, 06 Dec 2021 17:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOV-0005ti-Nh
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:15 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66618f48-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:14 +0100 (CET)
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
X-Inumbo-ID: 66618f48-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7opyQyqBD4bp65pDWsyDxZ8R2Dsh09XMMGy7CWwOvJI=;
  b=Fgj3h/7HAaQJnB5vD7uZFcKyj0c8uCDydFmDrA2h2u0SHwfSMUXgShfu
   qvA8z7YWepiiFNv6RKNEGSIYrw1NA0u6i8Ivia8G8Hiu/QnHB9FzP/O4c
   JhJaWtzJlT7Zte8AhmdYJ34r9I+Aqbu3r8CMl3vYbodB8iMTAwd8sqNPf
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8pVUxEHKFUaBG3nW93DwpRmzURM2NQdzzTlXAu0dv9eARkPc86GZAfDlgyxHaQ2+4qZYs3UBXe
 rJ69QzDvJUaR8S34/qi92Rr6934oTj+YPWDx5kSbv6I5RxsH/GO8QsTlRJJ56Or3jbPfS3JrWj
 gdY8jzCHTY5nnfqTi+Ftv5iW6HilNnerQ3u5XLG7lOHv9jNEcDW98zyLojblhcasmCApYRKSlC
 9QEVBNXHLeLrZbHs0fiaoS1QhNuN3yJH+KNfSekVIHbGX4+lkps/BQdCSRfZd53GltrypV7duZ
 YkOPP4jvcaH1CpYih5qzD6lf
X-SBRS: 5.1
X-MesageID: 58884308
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TEoWtKzDfR/VkO+P1916t+fGwSrEfRIJ4+MujC+fZmUNrF6WrkUHz
 TQXWj/QO66OajHyct4ga4y18UwH7ZfcnYBqSQE+qiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wbZn2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt85gy
 /lTvKHzc0AoY4fOlcZEeABVHC4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY25AeTaqFP
 5pxhTxHRz+RWgF+BE0tJIMzo7b5jWnOdj4IgQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krE8H7+GQoyL8GExHyO9XfEru7QnwvrVYQKDrq6+/V2xlqJyQQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzWxpmKEuRgNHcJdCeQg5CmCz6PV50CSAW1sc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYWyM9ZuKpA7xA28UcEUAaA1dZhII7Na29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysgPNb9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQM2d3XC3270k5JGQWy2yGskTKuOGpxbEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQOcguLl7apnswOh74M4XRfK4Ey/tX1
 XCzK5nEMJrnIf4/kGreqxk1j9fHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgo
 ivgBxQGkQWn3hUq62yiMxheVV8mZr4nxVpTAMDmFQ/AN6ELbdn94aEBWYEweLV7puVvweQtF
 6sOetmaA+QJQTPComxPYZ74pY1kVRKqmQPRYHb1PGlhJ8ZtF17T59vpXgrz7y1SXCC5gtQz/
 u+73QTBTJtdGwk7VJTKaOiixk+atGQGnL4gRFPBJ9ReIR2+8IVjJyHroOUwJsUAdUfKyjeAj
 l7EChYEv+jd5YQy9YCR16yDqo6oFcp4H1ZbQDaHverna3GC8zP6k4FaUeuOcTTMb0/O+f2vN
 bdP0vXxEPwbh1IW4YByJKlmkPAl7Nz1qr4Ekgk9RCfXb06mA69LK2Wd2ZUdrbVEw7JUtFfkW
 k+L/dUGa7yFNNm8TQwULQshKO+CyesVin/Z6vFseBf24yp+/bymV0ROPkbT1HwBfeUtaI51k
 /08vMM26hCkjkt4O9mLuSlY6mCQIyFSSK4grJwbXNfmhwdDJouuunAA5vsaOK2yVug=
IronPort-HdrOrdr: A9a23:f16jNq/R3G++yVG+Dbluk+DeI+orL9Y04lQ7vn2YSXRuHfBw8P
 re+8jztCWE8Qr5N0tApTntAsS9qDbnhPxICOoqTNOftWvd2FdARbsKheCJ/9SjIVyaygc079
 YHT0EUMrPN5DZB4foSmDPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="58884308"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 10/57] libs/stat: Remove duplicated CFLAGS from deps
Date: Mon, 6 Dec 2021 17:01:53 +0000
Message-ID: <20211206170241.13165-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Those CFLAGS_* are already added in libs.mk via USELIBS_stat.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/stat/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index c99508ae6b..911a2de8ec 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -15,7 +15,7 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenstore) $(CFLAGS_xeninclude) -include $(XEN_ROOT)/tools/config.h
+CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
 SRCS-y += xenstat.c
 SRCS-y += xenstat_qmp.c
-- 
Anthony PERARD


