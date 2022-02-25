Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6DA4C488F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:17:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279305.477070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcL1-000449-9O; Fri, 25 Feb 2022 15:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279305.477070; Fri, 25 Feb 2022 15:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcL0-0003q4-Lq; Fri, 25 Feb 2022 15:16:54 +0000
Received: by outflank-mailman (input) for mailman id 279305;
 Fri, 25 Feb 2022 15:16:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIM-0007Bf-Qc
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 935c9a50-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:14:07 +0100 (CET)
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
X-Inumbo-ID: 935c9a50-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+VKqQ9Ban5DJzksG49npHQWFkvG/L4HTbI6R5Xjk91w=;
  b=iPDDwPFn3wbQgYeYWuWznLlzn0mwqcxXKNpXICeCeTcZbik1UUduZ6hQ
   WMmmsJLhNUe7mmW0HwNfX2B3pYlnLA8DpYvzPgJ3R6POxsnCTu4lb07Q1
   RQr102rGZeZTA+GzznVbIbCmCXMKHhC+enQrW9WRiVhhMXK7uRCt7wWGd
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65407580
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LM/w6qOgkd8+srrvrR3fl8FynXyQoLVcMsEvi/4bfWQNrUpw0GMAz
 DFKWGGFO/qJN2T9ctEiO4rjpEgP7Z/dn9VmHAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZj2NMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z5
 vpRip+0ZBoVMfPGt+QhWQdYT38uFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQQKqGO
 JdJMVKDajyaaCRUFUwKFqgBjdeSilnUTgdBi1ia8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u12b2GBYBL/SE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYydMZvEOkX9T2ClKD74zqTGGhYEG5oPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNL0D2BLwQKChRqlEGp/ZgPQ1
 JTjs5LDhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGwheB41b55cIWeBj
 KrvVeV5vs470JyCN/IfXm5MI55ykfiI+SrNDJg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3C7WvMnGKqtdIdTjn7xETXPjLliCeTcbbSiIOJY3rI6W5LW8JE2C9o5loqw==
IronPort-HdrOrdr: A9a23:x3xGZayhnHQSaCmhimyDKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZImPH7P+U4ssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkGNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65407580"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 18/29] libs/guest: rename ELF_OBJS to LIBELF_OBJS
Date: Fri, 25 Feb 2022 15:13:10 +0000
Message-ID: <20220225151321.44126-19-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

It seems a better name. Later, we will introduce LIBX86_OBJS to
collect lib/x86/* objects.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---

Notes:
    v2:
    - fix typo in patch description
    - reviewed

 tools/libs/guest/Makefile | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 17eb0ebf4b..7707d4300f 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -33,13 +33,12 @@ CFLAGS += -I$(XEN_libxenctrl)
 vpath %.c ../../../xen/common/libelf
 CFLAGS += -I../../../xen/common/libelf
 
-ELF_OBJS-y += libelf-tools.o libelf-loader.o
-ELF_OBJS-y += libelf-dominfo.o
+LIBELF_OBJS += libelf-tools.o libelf-loader.o
+LIBELF_OBJS += libelf-dominfo.o
 
-OBJS-y += $(ELF_OBJS-y)
+OBJS-y += $(LIBELF_OBJS)
 
-$(ELF_OBJS-y): CFLAGS += -Wno-pointer-sign
-$(ELF_OBJS-y:.o=.opic): CFLAGS += -Wno-pointer-sign
+$(LIBELF_OBJS) $(LIBELF_OBJS:.o=.opic): CFLAGS += -Wno-pointer-sign
 
 ifeq ($(CONFIG_X86),y) # Add libx86 to the build
 vpath %.c ../../../xen/lib/x86
-- 
Anthony PERARD


