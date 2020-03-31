Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF241993DC
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:49:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEQi-00033G-HB; Tue, 31 Mar 2020 10:47:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I6p8=5Q=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jJEQh-00032A-7o
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:47:35 +0000
X-Inumbo-ID: 05b79fdf-733d-11ea-ba0c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05b79fdf-733d-11ea-ba0c-12813bfff9fa;
 Tue, 31 Mar 2020 10:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585651652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sTRFnOyU0qysVRQKIYm0QNOBqhQc72Q/G0zAnlz7wss=;
 b=WkV+h0PCk7bhHCZu30gDrjMdITnj0n/1Tbr6PaS31bQysA6lyaBmyVQe
 RxLWRqF1ngjOr9ToheOGKnEOrPOVUyMcOjQtJp7eF7YVzXwVmyGzKTjZv
 Q0Rw9GDW164DtNCHmzMVCAq6bvuR2pHWmag+FWaRY8xUn4+nKbBIGG9Gi c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: viTSuHUT56dAd46Npgp61E6wHa4ri6NYqsb0L7KvibMGiKbnoav/JB/670NXVr7YjHfSVYzvMy
 BHNSFWPTVt/yTHp9rdWDbgWj7Ft84gStkYjngUTbtjuCAR7Xnl+Oxy7dw9xxqJjqBrcxhnPGA8
 eX4rOCQLX4L91ytvh+m7kbGGU7bH3BVQciDty5hI+Vhwoqe8imQmJSC4OAHDh9T5BrnYN6OlHj
 VfPaUE/tdfYgvoAq7Wa4b0fYZ90QkEKXTdal2+K5f9yZR1BZbMrFzNn6vzm9iiPO6YS1kClMIf
 4Ws=
X-SBRS: 2.7
X-MesageID: 14904511
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="14904511"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v4 13/18] xen/build: Use if_changed for prelink*.o
Date: Tue, 31 Mar 2020 11:30:57 +0100
Message-ID: <20200331103102.1105674-14-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200331103102.1105674-1-anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We change the dependencies of prelink-efi.o so that we can use the
same command line. The dependency on efi/built_in.o isn't needed
because, we already have:
    efi/*.o: efi/built_in.o
to build efi/*.o files that prelink-efi.o needs.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v4:
    - fix rebuild, prelink.o and prelink-efi.o needs to be in targets

 xen/arch/x86/Makefile | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index eb6f7a6aceca..7676fb1c5bc8 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -128,11 +128,13 @@ prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
 prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink-efi_lto.o efi/boot.init.o
 	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
 else
-prelink.o: $(ALL_OBJS)
-	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
+prelink.o: $(ALL_OBJS) FORCE
+	$(call if_changed,ld)
+
+prelink-efi.o: $(filter-out %/efi/built_in.o,$(ALL_OBJS)) efi/boot.init.o efi/runtime.o efi/compat.o FORCE
+	$(call if_changed,ld)
 
-prelink-efi.o: $(ALL_OBJS) efi/boot.init.o efi/runtime.o efi/compat.o
-	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out %/efi/built_in.o,$^)
+targets += prelink.o prelink-efi.o
 endif
 
 $(TARGET)-syms: prelink.o xen.lds
-- 
Anthony PERARD


