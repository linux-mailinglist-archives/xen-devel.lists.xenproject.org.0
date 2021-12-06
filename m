Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A6046A1EE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:03:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239420.414997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOP-0007AJ-A4; Mon, 06 Dec 2021 17:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239420.414997; Mon, 06 Dec 2021 17:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOP-00076P-3E; Mon, 06 Dec 2021 17:03:09 +0000
Received: by outflank-mailman (input) for mailman id 239420;
 Mon, 06 Dec 2021 17:03:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHON-0005ta-Ar
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6161c2ab-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:03:06 +0100 (CET)
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
X-Inumbo-ID: 6161c2ab-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PF7/5zEo4jDOxqZUxq2UUbdYIZsE8xugvykCl7MlfeA=;
  b=IOvCR0hAmGfvnMho4dsTZb0iP6Zfq4eCDMvqBVowvp0BCv3WdjbMS0QE
   FplmuyhlYCsxFx4fkP9AZrzBKXkNvz+5xD0TbuQjrlS8+QB1Qi7Spc7Go
   1lYbLYpPvP8e77oPBlKRggQh5/jBtk0r3FYiSm2d/EtCO4iFkaGrqXxOk
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: n6U9gc6/9UNcQbsKdjvz9fL3AJSy6ydRf6ZAl+5Rionxf8kDM84dd0gdl/bqsKxGBmz5lZL7LP
 LxRUjdwc9qZt4mnJLeFuBZHtYp6OlmNP8W/U8fRmMX44xJxjKMcWOm/v/mro5tDMapNXMqPVAw
 gGrDvQmlVFHhQ8SwTnCH6OsA2YVSwXiGaqr2ZDStqxA3pYNFwHMEg4WHvPDDKkcdpRmiXZ2tfP
 t3Ee/nfjCvt1+YtrqzCGDUgqm0mVXyE/WyM9FofspfeT/m3Lo1SU4+j/Xs2EMDsbSjFbOFraJR
 v/urDFspNKj4356RFAadETh3
X-SBRS: 5.1
X-MesageID: 59387743
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YwohFKB+5vpF7BVW/9jkw5YqxClBgxIJ4kV8jS/XYbTApGgn3jRWz
 2IYCm6OOq2PajGmL48lPorl9htS75bVnYBhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX570Uw7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/qgyJgPN71
 M92moGIFR4ZIYLuscYFekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFjWxg2Z8SRp4yY
 eIwODw1chLFOCR2O3o4A6gwksL3pyfwJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSXv
 GXd5EziHwoXcteYzFKt822urv/CmzvhX4AfH6H+8eRl6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZtD7Qx2/pm/CphMGUsBcO+I/4QCJjKHT5m6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHkYSVVlGX6q2vgi6KZTElMkAgTA0cZF5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdjv9tlsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbWS0bb1HRcBJG9GRF5iLJ9o4DNZWfhgBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66PPoUUM8UrLlHYrEmCgHJ8OUi3yiDAdollZ
 v+mnTuEVy5GWcyLMhLoLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwJzLqVp
 S/kBRcDoLc97FWeQTi3hrlYQOuHdf5CQbgTZETA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:/gqaCqphLyvcB3/DgszHo/IaV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59387743"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 06/57] libs/libs.mk: Remove generic variable that already exist
Date: Mon, 6 Dec 2021 17:01:49 +0000
Message-ID: <20211206170241.13165-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

comma, empty, space are already defined in "Config.mk".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/libs.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 830bdc851f..dfbbef4080 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -26,9 +26,6 @@ ifneq ($(nosharedlibs),y)
 LIB += lib$(LIB_FILE_NAME).so
 endif
 
-comma:= ,
-empty:=
-space:= $(empty) $(empty)
 PKG_CONFIG ?= $(LIB_FILE_NAME).pc
 PKG_CONFIG_NAME ?= Xen$(LIBNAME)
 PKG_CONFIG_DESC ?= The $(PKG_CONFIG_NAME) library for Xen hypervisor
-- 
Anthony PERARD


