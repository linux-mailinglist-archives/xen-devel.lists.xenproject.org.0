Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165CE1CA5B2
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 10:08:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWy2x-0004g4-Gc; Fri, 08 May 2020 08:07:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EkJI=6W=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jWy2w-0004fy-0x
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 08:07:50 +0000
X-Inumbo-ID: 01779709-9103-11ea-9fcd-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 01779709-9103-11ea-9fcd-12813bfff9fa;
 Fri, 08 May 2020 08:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588925268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SuYs7UxkZXmIi+x04iSR/3r2g41gsXRftXIHWrzE+iQ=;
 b=NGroNXsKEX5qDXVmC1U4ONJEQ5jQZ5LD+MhZYZGIcHfai0MS1IJEPGPn/Pr6Bu3GkB0u9W
 1r6MJ5P7O54L4OJwKIRuHKsy+DG8Mum4Tvmpm3VtWhKHhth6a0H9qpVl3Dx12CxSVBync+
 f/n3VW6+ThrWHBhMivZz/u4H1Gv/kJE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-c2fDB09uMeWEdiVzAw6cTQ-1; Fri, 08 May 2020 04:07:46 -0400
X-MC-Unique: c2fDB09uMeWEdiVzAw6cTQ-1
Received: by mail-wm1-f71.google.com with SMTP id h184so4819731wmf.5
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2020 01:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KmYk5oCCH0iOigKwyECVQLnLIP/7UbsMDa2NDl9JB4g=;
 b=gmJZgfBhH/GAfX+cnBpwegW8OxYPsOibxYXU71tNPyaaHKvnVpa+vRcUzCX2osBeGG
 YBXqkndj2gKXxfRgJ47Iat+CycGGPu8A207XS8a3RqbIsCs76CQJJlLZRGN0DR5tQhFG
 yCAhn5y39ILHTQob30v9XV54IvZH2R+zSyYPUxxcy2rhkqPxfYEImIa1LmX8rvb2diyd
 z9xblt1UogJZqXI+IrmheIi408koJwZEGwf2f0TcaDPVog+v8jM/NulQugVkff7SsVZZ
 stTfqbEEKSNM1T2iv94WQqthZXWgSJFjG32B35jVbkwLHIFb7a11IIs3gT8jVnBe4Aid
 uiNg==
X-Gm-Message-State: AGi0Pua0oE+EOW3gvautcNSnX7TADVHsQdB4lDv7GCug1+f4H0yruxWY
 Slrt5bNgHcu7hvivE8oXeoqft2XlN2E7VWqjIk7yYS/uPDCM0cYLrdCMLtOIYJ+nX5wfPmTdFt2
 VNjwKcB6FD0hYBZo96TUyUzAm5yI=
X-Received: by 2002:adf:80ee:: with SMTP id 101mr1546305wrl.156.1588925265455; 
 Fri, 08 May 2020 01:07:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypKXOBfLV/4JiC9sd75VwtKJJwa7gBFo2sTQ0zCOhSHeGR5hqWbusQ4EiH/EH8+RYbtPLF5MyQ==
X-Received: by 2002:adf:80ee:: with SMTP id 101mr1546287wrl.156.1588925265280; 
 Fri, 08 May 2020 01:07:45 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id x13sm12113449wmc.5.2020.05.08.01.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 01:07:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] exec: Check Xen is enabled before calling the Xen API
Date: Fri,  8 May 2020 10:07:37 +0200
Message-Id: <20200508080738.2646-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200508080738.2646-1-philmd@redhat.com>
References: <20200508080738.2646-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/exec/ram_addr.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 5e59a3d8d7..dd8713179e 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -330,7 +330,9 @@ static inline void cpu_physical_memory_set_dirty_range(=
ram_addr_t start,
         }
     }
=20
-    xen_hvm_modified_memory(start, length);
+    if (xen_enabled()) {
+        xen_hvm_modified_memory(start, length);
+    }
 }
=20
 #if !defined(_WIN32)
@@ -388,7 +390,9 @@ static inline void cpu_physical_memory_set_dirty_lebitm=
ap(unsigned long *bitmap,
             }
         }
=20
-        xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        if (xen_enabled()) {
+            xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        }
     } else {
         uint8_t clients =3D tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_CLIE=
NTS_NOCODE;
=20
--=20
2.21.3


