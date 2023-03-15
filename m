Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CB86BBCE4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 20:04:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510188.787487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcWPV-00077g-MJ; Wed, 15 Mar 2023 19:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510188.787487; Wed, 15 Mar 2023 19:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcWPV-000757-JZ; Wed, 15 Mar 2023 19:03:41 +0000
Received: by outflank-mailman (input) for mailman id 510188;
 Wed, 15 Mar 2023 19:03:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DN/u=7H=citrix.com=prvs=431ad58dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pcWPT-000751-Ss
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 19:03:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1580da0f-c364-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 20:03:36 +0100 (CET)
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
X-Inumbo-ID: 1580da0f-c364-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678907016;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RrJYsIFKDjR0M/7xogCc2jHl0xDaQZoIYGx92W0ZYMA=;
  b=IpcBpeVMjhvYO00aTWEE5JmcWySGHxwRG3zeoncWNPSltAIvA9v84SiC
   3bstpuwHktKXtf0p7YAS3WbdOXqeLH6LhEC+rXYzrRZixnkEB0tsg9hp5
   4w2f0+fJJcdaZuuS0xY+xCgHXRu/O+AsX7lCuQbhXxxpG8sR/+DF5Wn9j
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100916106
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:NM5s0aCqVEN/gRVW/xTjw5YqxClBgxIJ4kV8jS/XYbTApDoq1WcGz
 jMYW2GHOKzYYWOhf91ybNnnoUIG6JaBytZlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhB4wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw9Nx+AGhSr
 PEiM3MVdDvbnfmv27P8Rbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4TSFJwLxx7Gz
 o7A12b3ISg8Dc6D9RWI1mz918TJsT/DdY1HQdVU8dY12QbOlwT/EiY+X1yxq+i0kU66VtdWL
 WQb/yMvqe4580nDZtL6WRu/onKNoB8Hc9VVGuw+rgqKz8L86gKYHXQNTyQHZsYvssQ3XhQ12
 lTPlNTsbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bs/7UZo89Sujv1ISzQGyuh
 WnQ90DSmon/k+YF7ay69Eyejgi35YDTZVYv/RzMXyWqu1YRiJGeW6Sk7l3S7PBlJYmfT0Wcs
 HVsp/Vy/NziHrnWynXTHbxl8KWBoq/cbWaC2QIH84wJrWzFxpK1QWxHDNiSzm9NO91MRzLma
 VS7Veh5tM4KZyvCgUOajuuM5yUWIUrIT4iNuhP8NIAmjn1NmOivrUlTiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymH9ulTqCHMmjl0v9uVZ7WJJyYeZtDbdzRrphsPPsTPv9q
 r6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOK0aX/d/L7bZSiI/QTFJNhMk6e95E2CTt/gPx7igE
 7DUchMw9WcTclWceVnWNCk9Neu1NXu9xFpiVRER0Z+T8yBLSe6SAG03LvPboZFPGDRf8MNJ
IronPort-HdrOrdr: A9a23:08bH2KvLDzRjNUUZQHrKHeD27skDeNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="100916106"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH] xen/riscv: Fix early_puts() newline handling
Date: Wed, 15 Mar 2023 19:03:25 +0000
Message-ID: <20230315190325.668853-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

OpenSBI already expands \n to \r\n.  Don't repeat the expansion, as it doubles
the size of the resulting log with every other line being blank.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Bob Eshleman <bobbyeshleman@gmail.com>
CC: Alistair Francis <alistair.francis@wdc.com>
CC: Connor Davis <connojdavis@gmail.com>
---
 xen/arch/riscv/early_printk.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
index b66a11f1bc1a..97a94885773b 100644
--- a/xen/arch/riscv/early_printk.c
+++ b/xen/arch/riscv/early_printk.c
@@ -16,8 +16,6 @@ void early_puts(const char *s, size_t nr)
 {
     while ( nr-- > 0 )
     {
-        if ( *s == '\n' )
-            sbi_console_putchar('\r');
         sbi_console_putchar(*s);
         s++;
     }
-- 
2.30.2


