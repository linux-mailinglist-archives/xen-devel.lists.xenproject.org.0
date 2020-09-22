Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3636727481C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:25:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKmyf-0008Py-BM; Tue, 22 Sep 2020 18:25:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKmye-0008GI-7X
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:25:20 +0000
X-Inumbo-ID: 635d8d12-cb4f-4e0b-b442-646c3906e749
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 635d8d12-cb4f-4e0b-b442-646c3906e749;
 Tue, 22 Sep 2020 18:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600799106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pLAgF35adw/kn3WeOYhIg/xCYIoVFVCDELdjZDtTL0c=;
 b=SXcxF+gpotR8smdrO71mdzRkyIo3SzotYiMka0xg9Iu7thE4W10qRejz
 vvPd1cQnWNfrdNZlC2lyHQhBAWqTjuObaI8CNWM56U64gu9PAhepR45Ou
 jfY2j2SkzOVXXCXW05L5e3CJiGKjXAviR83+IVhjZ1FrbruYRcuaR5Frn Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: x4JzTL0cF8XRaqd3vLFHV5fhhcs+rcRu+VvL6j4BG7OCXCwhi8G360HAexdBGRZ7paMNOP8BEt
 9qqW1tS6lR97zQLU+4ZUBxhjzrZYN/iUX2jL/1ckImYIRFGX0wawTKjQ2jsjdMI5GM2KOvY+FE
 G5hZSt6ERK/t0ZqM6q0L4A8glTCxviyHUFRgUReKTYnVJR7czj2HIcwq1eJ4kwIdIY8mK0DUC+
 eV4Lf35mbVRgxhnp81exSMSck5l+S115dXw/HOnwRRN5FjdkL98cxHFacy3jUIJdEmRPQhiOn8
 b88=
X-SBRS: 2.7
X-MesageID: 28290908
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="28290908"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
 <tamas@tklengyel.com>
Subject: [PATCH v2 03/11] xen/memory: Fix compat XENMEM_acquire_resource for
 size requests
Date: Tue, 22 Sep 2020 19:24:36 +0100
Message-ID: <20200922182444.12350-4-andrew.cooper3@citrix.com>
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

Copy the nr_frames from the structure which actually has the correct value, so
the caller doesn't unconditionally receive 0.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/common/compat/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
index 3851f756c7..ed92e05b08 100644
--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -599,7 +599,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
                 if ( __copy_field_to_guest(
                          guest_handle_cast(compat,
                                            compat_mem_acquire_resource_t),
-                         &cmp.mar, nr_frames) )
+                         nat.mar, nr_frames) )
                     return -EFAULT;
             }
             else
-- 
2.11.0


