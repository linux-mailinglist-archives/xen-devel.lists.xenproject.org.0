Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9044045DB8B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231300.400295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6H-00077m-Nc; Thu, 25 Nov 2021 13:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231300.400295; Thu, 25 Nov 2021 13:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6G-0006q0-OB; Thu, 25 Nov 2021 13:47:44 +0000
Received: by outflank-mailman (input) for mailman id 231300;
 Thu, 25 Nov 2021 13:47:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzm-0007NX-79
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:02 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 529b438c-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:41:00 +0100 (CET)
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
X-Inumbo-ID: 529b438c-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/8ecL57WQSeBuZo2P6i4snr54bttWa1idLLgaIXs6qQ=;
  b=Ov0TSVUwNcRF2199NxJN2DG9PyIUXQ4TIx8lTZYTKpkxbE/5/spYMrLV
   VO0X+hAs1QBj445S12pq/lq+46hc9/vie6EM2P0hT2GJy8Q4MYrP3cNGH
   G7gVX9ltf857lhsDsg3rep+N5dxfPzfDLWKUsJQx8zY9XItdK59s88v8A
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iLs3vK6REGTPu6tzZUIOuOGnPY4tebgAJQYOOvmQr0GB7D+r5FwkQRIN8rmHfMVdwOE8ATTsZc
 /kRna3F51RqchvMgtQRzWT6ihD+fohnqNQC3PnFhT4FZCObwHMaFrmnQC2ZmgjT6SuBxC3hxIs
 ukiqItUc6B+eT8xjYlHmHzmH/dmsH9udIG/C+P90Yol9KU3eBp5fFBIy7LZaOjvIfvBwnfyWv9
 BfmjUTfpZ34KF5sV3e58iqmm9tC0Rd6WQcsui3nE8QgZtjRpJfyDLJbkF2c3UrSwEQVaQNPCza
 0UrB+3x2M/1jznwz06HKA1k8
X-SBRS: 5.1
X-MesageID: 58617651
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MnrkOKtulovxx7cZK7+xNomjSefnVP1ZMUV32f8akzHdYApBsoF/q
 tZmKTqDPqmIMDH0fIgjbIS2pEkB7MWDy4AxTwQ4rXtnHn4R+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24XhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplnrXvRzcYDL31osMbYjN5PCBnZvF+9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6DN
 5RANmQyNXwsZTVfOHUuVLw1vN23jz7ASW1hi0y2no4etj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKgoBKNWVxD6B83StruzChyX2XMQVDrLQ3vRnmkGJz2ofThgfT0KmoOKRg1S7HdlYL
 iQ8xC0qqqQj8V2xefP0VRa4vX2sswYVXpxbFOhSwAOHx7fQ4g2ZLnMZVTMHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTS0ZSQoI5fHzrYd1iQjAJv5iD6ydntDzASv3w
 T2BsG45nbp7sCIQ//zlpxad2Wvq/8WXCF5ujunKYo67xihQO4CVVr640GL868dqDamYVwLdh
 HdRzqBy89syJZ2KkSWMRsAEE7eo++uJPVXgvLJ/I3Uy32/zoiD+JOi89Bk7fR40aZhcJVcFd
 WeK4VsJjKK/KkdGekOej2iZL80xhZbtGt3+Phw/RoofO8MhHONrEcwHWKJx44wPuBRz+U3cE
 c3CGSpJMZr9If46pAdav89HjdcWKtkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlnt/zb/1SFo
 4cFaZriJ/BjvArWOHe/zGLuBQpScShT6W7e96S7idJv0iI5QTp8Wpc9MJsqepB/nrQ9qws71
 irVZ6Os83Km3SevAVzTMhhLMeqzNb4i/SNTFXF9Zj6Ahil8CbtDGY9CLvPbi5F8r7c9pRO1J
 tFYE/i97gNnFm6apm9DNMal9+SPtn2D3GqzAsZsWxBnF7YIeuAD0oWMktLH+HZcAyypm9E5p
 rH8hArXTYBaH1ZpDdrMaeLpxFS05CBPlOV3VkrOA99SZESzr9Q6d32v1qc6c5MWNBHO5jqGz
 ALKUx0WkvbA/t0u+97TiKHa84rwS7liHlBXFnXw5KqtMXWI5XKqxIJNCb7afT3UWG7u1r+lY
 OFZk6P1PPEdxQ4YuItgCbd7i6k54oK39bNdyw1lGlTNbkiqVew8ciXXg5EXu/QUlLFDuAawV
 kaewfVgOO2EaJH/DVocBAs5deDfh/sarSbfsKYuK0Lg6S4poLfeCRdOPwOBgTB2JaduNN932
 v8ovcMb5lDtihcuNdra3ClY+37Vcy4FWqQj8JobHJXqmkwgzVQbOc7QDSr/4ZeubdRQMxZ1f
 m/I1fSa37kMlFDfd3cTFGTW2bsPjJsDjxlG0VseKgnbgdHCnPI2gEVc/Dlfot65FfmbPzaf4
 lRWCnA=
IronPort-HdrOrdr: A9a23:Km9AVqGjTHFjroD2pLqE7seALOsnbusQ8zAXP0AYc3Nom6uj5q
 eTdZUgpGbJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWntQts5
 uIGJIRNDSfNzRHZL7BkWqFL+o=
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58617651"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>
Subject: [XEN PATCH v8 14/47] build: rename __LINKER__ to LINKER_SCRIPT
Date: Thu, 25 Nov 2021 13:39:33 +0000
Message-ID: <20211125134006.1076646-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

For two reasons: this macro is used to generate a "linker script" and
is not by the linker, and name starting with an underscore '_' are
supposed to be reserved, so better avoid them when not needed.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/Rules.mk                      | 2 +-
 xen/arch/arm/include/asm/config.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 4624739ca7e2..d32fec0ae037 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -256,7 +256,7 @@ $(obj)/%.s: $(src)/%.S FORCE
 
 # Linker scripts, .lds.S -> .lds
 quiet_cmd_cpp_lds_S = LDS     $@
-cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -D__LINKER__ -MQ $@ -o $@ $<
+cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -DLINKER_SCRIPT -MQ $@ -o $@ $<
 
 targets := $(filter-out $(PHONY), $(targets))
 
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index c7b77912013e..2aced0bc3b8b 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -191,7 +191,7 @@ extern unsigned long frametable_virt_end;
 #define watchdog_disable() ((void)0)
 #define watchdog_enable()  ((void)0)
 
-#if defined(__ASSEMBLY__) && !defined(__LINKER__)
+#if defined(__ASSEMBLY__) && !defined(LINKER_SCRIPT)
 #include <asm/asm_defns.h>
 #include <asm/macros.h>
 #endif
-- 
Anthony PERARD


