Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61702753B8D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 15:10:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563633.880956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKIZA-00025k-Ug; Fri, 14 Jul 2023 13:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563633.880956; Fri, 14 Jul 2023 13:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKIZA-00023C-Rc; Fri, 14 Jul 2023 13:10:36 +0000
Received: by outflank-mailman (input) for mailman id 563633;
 Fri, 14 Jul 2023 13:10:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIDz=DA=citrix.com=prvs=552896509=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qKIZ9-000236-Gb
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 13:10:35 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf687c7a-2247-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 15:10:32 +0200 (CEST)
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
X-Inumbo-ID: cf687c7a-2247-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689340232;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TubUCgaOpcPozNc4hn7KgzQpWH88pNLu5aE4X43RVo4=;
  b=hrFDG6CiSP7vx/yZaqgfdyGBe22tvWYm7U34uLf2Nf//sF24+2VRvRco
   B74M/FnfCsLZuu1NBZ3Vnfir//T57IXHX981guDOD7f0aczoRfZ23R8gr
   NZhqCYwxNZG12RwCVR2BzATrv9agAY4d6ZmgOFP9LOhm2Y1eOjpRbDMPp
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118818560
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:+D5zt6wI155f8NwnyS96t+fXxirEfRIJ4+MujC+fZmUNrF6WrkVUm
 GBODTqPaPaCamr0e9onPoS0oBgGupLUnddrTQA++yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPKwT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWhr7
 6A8BAlWUkGsuMaRg7afTeNUttt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwMzhbB9
 j+YpwwVBDk6BoOz5SDZ1U62vezqxC7qQLAvEL6no6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YW2Z3qeZq3W1Iyd9BW0fYS4JSyMV7t+lp5s85jrVSdxuCrKyyNf8Fjf52
 TmipjUxnLgVgogA0KDT1VbGiDWor97XQxIv5wPWdmi44Rh0YoHjbIutgWU39t4ZctzfFAPY+
 iFZxY7Htrtm4YyxeDKlScAXQJWF3q25YRLjpXksG70m/Qyd5Cv2FWxP2w2SNHuFI+5dJ2+4O
 xWL6VsOjHNAFCD0NPEqOupdH+xvlPG9Toq9C5g4e/IUOvBMmBm7EDaCjKJ690TkiwASnK42I
 v93mu78XC9BWcyLINdbLtrxMIPHJQhknws/vbihk3yaPUO2PRZ5s4stPlqUdfwe56iZugjT+
 Ns3H5LUm0QFD7amPXWJrN57wbU2wZ4TX8ueRyt/L77rH+abMDt5V6+5LU0JJuSJYJi5Zs+Xp
 yrgCye0OXL0hGHdKBXiV5yQQOqHYHqLllpiZXZEFQ/xixAejXOHsP93m20fIeN2q4SODJdcE
 5E4Ril3KqkUF2ifpG9NPPEQbuVKLXyWuO5HBAL9CBBXQnKqb1ChFgPMFuc3yBQzMw==
IronPort-HdrOrdr: A9a23:Yk+eQa2uwksPjh0AnefV6wqjBGAkLtp133Aq2lEZdPUCSL3lqy
 mLpoVh6faSskdoZJhAo6H4BEDkexnhHPFOkOos1NuZPDUO/VHYSb2KjrGSpQEIeReOlNK1jp
 0QCZSWYeeYZTNHZITBkW2F+r0bsb66Gc6T5Nv2/jNEURxtcK146hcRMHfnLqS0fmV77FgCea
 Z0KvApm9NoQxoqUvg=
X-Talos-CUID: =?us-ascii?q?9a23=3ABzIUQGoKnNAV0NAMlzMOp7nmUckAaCH54E6LHx6?=
 =?us-ascii?q?XNkJOC7mxTlWoyLwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AP7ZsQAy7xy/4Qb0jvvnUW0YXf8KaqIScV2whi8k?=
 =?us-ascii?q?hh9O/NgkpNiaFvgmzQZByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,205,1684814400"; 
   d="scan'208";a="118818560"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>, "Nicola
 Vetrini" <nicola.vetrini@bugseng.com>
Subject: [PATCH] xen/ACPI: Use const char * for string literals
Date: Fri, 14 Jul 2023 14:10:26 +0100
Message-ID: <20230714131026.3082591-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

For pre-ANSI-C compatibility reasons, string literals have a mutable type, but
it is undefined behaviour to mutate them.

Swap char *'s to const char *'s for variables which hold string literals.

This fixes several violations of MISRA Rule 7.4:

  A string literal shall not be assigned to an object unless the object's type
  is "pointer to const-qualified char".

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/drivers/acpi/tables.c           |  6 +++---
 xen/drivers/acpi/tables/tbfadt.c    |  2 +-
 xen/drivers/acpi/tables/tbutils.c   |  2 +-
 xen/drivers/acpi/utilities/utmisc.c |  6 +++---
 xen/include/acpi/actables.h         |  2 +-
 xen/include/acpi/acutils.h          | 12 ++++++------
 xen/include/xen/acpi.h              |  6 +++---
 7 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/xen/drivers/acpi/tables.c b/xen/drivers/acpi/tables.c
index 96ff96b84c66..20aed8929b86 100644
--- a/xen/drivers/acpi/tables.c
+++ b/xen/drivers/acpi/tables.c
@@ -300,7 +300,7 @@ acpi_table_get_entry_madt(enum acpi_madt_type entry_id,
 }
 
 int __init
-acpi_parse_entries(char *id, unsigned long table_size,
+acpi_parse_entries(const char *id, unsigned long table_size,
 		   acpi_table_entry_handler handler,
 		   struct acpi_table_header *table_header,
 		   int entry_id, unsigned int max_entries)
@@ -359,7 +359,7 @@ acpi_parse_entries(char *id, unsigned long table_size,
 }
 
 int __init
-acpi_table_parse_entries(char *id,
+acpi_table_parse_entries(const char *id,
 			 unsigned long table_size,
 			 int entry_id,
 			 acpi_table_entry_handler handler,
@@ -405,7 +405,7 @@ acpi_table_parse_madt(enum acpi_madt_type id,
  * Scan the ACPI System Descriptor Table (STD) for a table matching @id,
  * run @handler on it.
  */
-int __init acpi_table_parse(char *id, acpi_table_handler handler)
+int __init acpi_table_parse(const char *id, acpi_table_handler handler)
 {
 	struct acpi_table_header *table = NULL;
 
diff --git a/xen/drivers/acpi/tables/tbfadt.c b/xen/drivers/acpi/tables/tbfadt.c
index d8fcc50deca5..a03836e0dc8a 100644
--- a/xen/drivers/acpi/tables/tbfadt.c
+++ b/xen/drivers/acpi/tables/tbfadt.c
@@ -60,7 +60,7 @@ static void acpi_tb_validate_fadt(void);
 /* Table for conversion of FADT to common internal format and FADT validation */
 
 typedef struct acpi_fadt_info {
-	char *name;
+	const char *name;
 	u16 target;
 	u16 source;
 	u16 length;
diff --git a/xen/drivers/acpi/tables/tbutils.c b/xen/drivers/acpi/tables/tbutils.c
index 11412c47deb4..458989abea99 100644
--- a/xen/drivers/acpi/tables/tbutils.c
+++ b/xen/drivers/acpi/tables/tbutils.c
@@ -243,7 +243,7 @@ u8 acpi_tb_checksum(u8 * buffer, acpi_native_uint length)
 
 void __init
 acpi_tb_install_table(acpi_physical_address address,
-		      u8 flags, char *signature, acpi_native_uint table_index)
+		      u8 flags, const char *signature, acpi_native_uint table_index)
 {
 	struct acpi_table_header *table;
 
diff --git a/xen/drivers/acpi/utilities/utmisc.c b/xen/drivers/acpi/utilities/utmisc.c
index 4e1497ad0fae..ee22c83e3842 100644
--- a/xen/drivers/acpi/utilities/utmisc.c
+++ b/xen/drivers/acpi/utilities/utmisc.c
@@ -134,7 +134,7 @@ const char *__init acpi_ut_validate_exception(acpi_status status)
  ******************************************************************************/
 
 void ACPI_INTERNAL_VAR_XFACE __init
-acpi_ut_error(const char *module_name, u32 line_number, char *format, ...)
+acpi_ut_error(const char *module_name, u32 line_number, const char *format, ...)
 {
 	va_list args;
 
@@ -147,7 +147,7 @@ acpi_ut_error(const char *module_name, u32 line_number, char *format, ...)
 }
 
 void ACPI_INTERNAL_VAR_XFACE __init
-acpi_ut_warning(const char *module_name, u32 line_number, char *format, ...)
+acpi_ut_warning(const char *module_name, u32 line_number, const char *format, ...)
 {
 	va_list args;
 
@@ -161,7 +161,7 @@ acpi_ut_warning(const char *module_name, u32 line_number, char *format, ...)
 }
 
 void ACPI_INTERNAL_VAR_XFACE __init
-acpi_ut_info(const char *module_name, u32 line_number, char *format, ...)
+acpi_ut_info(const char *module_name, u32 line_number, const char *format, ...)
 {
 	va_list args;
 
diff --git a/xen/include/acpi/actables.h b/xen/include/acpi/actables.h
index d4cad35f41c0..527e1c9f9b9d 100644
--- a/xen/include/acpi/actables.h
+++ b/xen/include/acpi/actables.h
@@ -99,7 +99,7 @@ acpi_tb_verify_checksum(struct acpi_table_header *table, u32 length);
 
 void
 acpi_tb_install_table(acpi_physical_address address,
-		      u8 flags, char *signature, acpi_native_uint table_index);
+		      u8 flags, const char *signature, acpi_native_uint table_index);
 
 acpi_status
 acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags);
diff --git a/xen/include/acpi/acutils.h b/xen/include/acpi/acutils.h
index b1b0df758bd6..ac54adaa8c23 100644
--- a/xen/include/acpi/acutils.h
+++ b/xen/include/acpi/acutils.h
@@ -164,7 +164,7 @@ acpi_ut_debug_print(u32 requested_debug_level,
 		    u32 line_number,
 		    const char *function_name,
 		    const char *module_name,
-		    u32 component_id, char *format, ...) ACPI_PRINTF_LIKE(6);
+		    u32 component_id, const char *format, ...) ACPI_PRINTF_LIKE(6);
 
 void ACPI_INTERNAL_VAR_XFACE
 acpi_ut_debug_print_raw(u32 requested_debug_level,
@@ -172,24 +172,24 @@ acpi_ut_debug_print_raw(u32 requested_debug_level,
 			const char *function_name,
 			const char *module_name,
 			u32 component_id,
-			char *format, ...) ACPI_PRINTF_LIKE(6);
+			const char *format, ...) ACPI_PRINTF_LIKE(6);
 
 void ACPI_INTERNAL_VAR_XFACE
 acpi_ut_error(const char *module_name,
-	      u32 line_number, char *format, ...) ACPI_PRINTF_LIKE(3);
+	      u32 line_number, const char *format, ...) ACPI_PRINTF_LIKE(3);
 
 void ACPI_INTERNAL_VAR_XFACE
 acpi_ut_exception(const char *module_name,
 		  u32 line_number,
-		  acpi_status status, char *format, ...) ACPI_PRINTF_LIKE(4);
+		  acpi_status status, const char *format, ...) ACPI_PRINTF_LIKE(4);
 
 void ACPI_INTERNAL_VAR_XFACE
 acpi_ut_warning(const char *module_name,
-		u32 line_number, char *format, ...) ACPI_PRINTF_LIKE(3);
+		u32 line_number, const char *format, ...) ACPI_PRINTF_LIKE(3);
 
 void ACPI_INTERNAL_VAR_XFACE
 acpi_ut_info(const char *module_name,
-	     u32 line_number, char *format, ...) ACPI_PRINTF_LIKE(3);
+	     u32 line_number, const char *format, ...) ACPI_PRINTF_LIKE(3);
 
 /*
  * utmisc
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 352f27f6a723..8ec95791726e 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -81,12 +81,12 @@ int erst_init(void);
 void acpi_hest_init(void);
 
 int acpi_table_init (void);
-int acpi_table_parse(char *id, acpi_table_handler handler);
-int acpi_parse_entries(char *id, unsigned long table_size,
+int acpi_table_parse(const char *id, acpi_table_handler handler);
+int acpi_parse_entries(const char *id, unsigned long table_size,
 		       acpi_table_entry_handler handler,
 		       struct acpi_table_header *table_header,
 		       int entry_id, unsigned int max_entries);
-int acpi_table_parse_entries(char *id, unsigned long table_size,
+int acpi_table_parse_entries(const char *id, unsigned long table_size,
 	int entry_id, acpi_table_entry_handler handler, unsigned int max_entries);
 struct acpi_subtable_header *acpi_table_get_entry_madt(enum acpi_madt_type id,
 						      unsigned int entry_index);
-- 
2.30.2


