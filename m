Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E9B48E6F6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 09:54:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257579.442706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8ILC-0000My-6I; Fri, 14 Jan 2022 08:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257579.442706; Fri, 14 Jan 2022 08:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8ILC-0000Kr-2M; Fri, 14 Jan 2022 08:53:46 +0000
Received: by outflank-mailman (input) for mailman id 257579;
 Fri, 14 Jan 2022 08:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eLMo=R6=outlook.com=blsvntn@srs-se1.protection.inumbo.net>)
 id 1n8IKR-0000Ju-Kb
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 08:53:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04olkn0800.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::800])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e3bd326-7517-11ec-a563-1748fde96b53;
 Fri, 14 Jan 2022 09:52:58 +0100 (CET)
Received: from AS8P193MB1718.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3b2::8)
 by AS8P193MB1783.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3fc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 08:52:55 +0000
Received: from AS8P193MB1718.EURP193.PROD.OUTLOOK.COM
 ([fe80::64a2:3bd1:e033:a89]) by AS8P193MB1718.EURP193.PROD.OUTLOOK.COM
 ([fe80::64a2:3bd1:e033:a89%6]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 08:52:55 +0000
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
X-Inumbo-ID: 5e3bd326-7517-11ec-a563-1748fde96b53
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7bTgssMleCGLR8RIpSAU3gi41ZewIc2on4cl+TApRHNowngpob+wtY96Cq/PPjeH+SSEtYNl0zB3xTbC4+J95eIFiI6faYkbCM1lfORbfl10Z9lXMvFsRuTm0F/fVrK+VB0fRJznRNnOPxtkEV0cqXi9PXlmAdgccMTj94uNkiDU6gXImVjbXp2+smN9qBCsw4L+oqzFJMkPnUVCleQZllawx+QJ1YEXCOz+fXzGqSf0aYWy+vBBJhY154IRVGr25UJZqzuU6N3iGOk+G3//6bxTp69hV4HdBj7nzd6P/sR/NxBSS55UGsV3+bDLNCrK8FhmoWGWFDyJewWpiqagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2QuCyyYu0UDooETtxc4jmGVO432HFwpUYbO2waM8h8=;
 b=hOvvc0UmY4s3dBVvm4ASy5evHbcXtSt7YUy+vyqnA+tQaE1i7B/fDGq9s1Z5T6YMxV/fgLpnHjvlD+SR757rFREy01EXx9u2aIQlVg/ddjWP8KqxGCHq27YkIBUEk0BTeZEQCw1s6jhL//oXcrBzOev2IfyWrVlrfcYOmcrLpbeqsv6OQsOq2EIOSg6dQZ67qMRo/e6Q1nmYixgxiIwRCuvN2gzaQn5Ndujl4Xw1lYyv/5FpLxkpHdSqlXbz2H994RLW9wvw6ST96ExTzw5PLkJgfMN+bLr52r4mIKIHA57H/0tVUK0SAonWjeOH49IGGwP8on/K/WsnA8waYvYxPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2QuCyyYu0UDooETtxc4jmGVO432HFwpUYbO2waM8h8=;
 b=FIc1okkJPMOxmvZ7qjUHpQW8mygF7cpS38Xwu10OuzZxa3qxsNtifqJnDzUG6YTByBXnuaIvfEzTnzcKw2PRo39ivGh04PFgWDtEFtQDb8Vu5S6ZOeetEs2HSmMHFENlhnr2eVzGvasYQVQ+7rCY4Wt+MJBqRbo4Kv3JfS2BhixN1etT5I8C+9rMS+286amcShngNp0iNEFfrJQSaO9GILh114j2gPz/eWA/rGdleCw98ndJ2bIOcVff9df74UHCjS6B8IgyYClrGkNphUw3v6UCPUY5HFTJWbgah/R7NQmq3wsafF/zx0iwkv2+PAMUe5m6DE/iuDbJawt2XdUSXw==
From: Anton Belousov <blsvntn@outlook.com>
To: xen-devel@lists.xenproject.org
Cc: Anton Belousov <blsvntn@outlook.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH] tools/firmware/hvmloader/smbios.c: Add new SMBIOS tables (7,8,9,26,27,28)
Date: Fri, 14 Jan 2022 08:52:44 +0000
Message-ID:
 <AS8P193MB171873609ED0D3F997083C2DA3549@AS8P193MB1718.EURP193.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [MeRNfpZZT4JIHFMYltIy3mGU++ucTKrR]
X-ClientProxiedBy: GV3P280CA0013.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::34) To AS8P193MB1718.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:3b2::8)
X-Microsoft-Original-Message-ID:
 <6ebb32ff993fc0aaca9ccef0b8c243aa97daade7.1642150081.git.blsvntn@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94cbccbb-d864-4b57-4ac9-08d9d73b411c
X-MS-Exchange-SLBlob-MailProps:
	3UeWkQkuiJMapIaE3yskuNrNSV986tZK++sapM/cF3KUrblsHXpVKw2pDg0rLq3A375JJXdjrncdHFB0a2adGg4EQYNduqqQnWODlEmxjgHG28cVW7tj7EwxRaBwv9nda0ABrpLdbCewBFLr0SifRlu3RigXNBxxA+8yg8uxaSZbft0Gee80Mlv6t1rhhR3MC7Gt1NiENv5WasiTymVObpvZKv3K372kyh5jmnXamduadsGHME0Gr94bVsz0O8/wj75xjHlkTjT6NzRNCkveeRZZyDNHKiAyQjCXj4nUCeuMAUL0rbgBwoUsPLn7rsKLBmeTR5uqSbiYfyDFAB1CZWr/n8RH6JYo8ZGJIomkUfVBUe38fkWnRWo554JdIe0ZTjz5SLyxDHYD3U1MwF0/krSaxTdDAInsf9g3kZlKxSvWPOAne4X1mzKmAEKYLukNO+kK0dCQrH3d0nALbrWhz/UDc1QUxOoGva0t4GnLcpHNFWmz8LtvYvT4X33jCK1BNkmWBwSgoSNDGlxd4UGzJOoHb+zSLt5oa1NyToB0st2IqA+HOFqIZpzw+ZD8Aolk8+Jc2ttdpUcImZtW9p+w3rWPnbQxHhKFhBMXRjJbcpX0MrjEeKAaez/ik/W6iDhkLIe2VIA1UBGp73lWYUiPbT7XLJTsLU2G0mpbWfk/adeQjGbKJjrJVM5Rmy6n7WrKAUjEYZBk0cZFDHW4nwxK+8vKUscl9zJvjBp/tiX7BWtIbsu8ujlQeQ==
X-MS-TrafficTypeDiagnostic: AS8P193MB1783:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/HU3EkWezEryfa9I5Nrr27yGTpdxpMDruyX6jW/Lfn0z2gEXq07QSuWJyfPsFyU1eAdjDU9rX5sL4J36Vmcj0zSgR4LZ04ekXFol00+mfXVvbc5NHnI+tgwMjPOCY0L4LvvXiXwO78V5x6VmJEzVx/zlbAwJC6mz3kAjPNNKcooV7t0G6YaqIo7tg0Jc+2TfTqjSF2xE8TBkMufSl3C9gsgAxGgil7Rvf2bckTmId0N0pr65WEaLz7pOJnip8blRpfHO5SYka1czeh5wm+2yaL/PdRShGiYeJXrC3KFGhtsCo56PJFXrd6gAlxvYAN7BoFQpeHGDySeMSybIDncqkireGJI4RLNjKxWmgkU0BFRMxJ54bb9OO+56L9jo1PpR/R+S2puVHQ0/tZ6dwsXZrCyM2Y0Ea2cZhTDfB4Sm+h40gBe0+iO+wQLqx0TiiZpMsJ6hh+/H66XcLYR7WZzy2DwD8YqexkNQUtLvJX4KGspXDy8esQLx0NSl/VMq+8IMcMLltYIkTovj62jYb8K/Lmjdwy354cNfcli+J1p5uYilOBEdQeBAvawgIPm278av8sFfzm4uv6Xr9Cq0ByUqIQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ze7SMSztAvZdl4o1/A7LzSy3Pfvg0vKGdN9Q4PyE6aZurCBu9KMZBmEH/BgE?=
 =?us-ascii?Q?qzhwdaex0f5nueuGuCZMuiyKj1yo0zCHEqXXcMQ/OJvbnQdWSdmQs0bXyJ/M?=
 =?us-ascii?Q?Q4ud8ZIzUQ0BBd3ToHf9w5ByffN61fZrX06NT631S1fW9y4Qzkp0TvAmg/E+?=
 =?us-ascii?Q?zsFBdszorW14WaR/sRtfleuNYWoYWsFEARgs+/kn4IBSwmHjYguvNLsGeynj?=
 =?us-ascii?Q?ZFv6SFHgS3GdHlzIeWAOzkwoaBZXjseFypg6KM58850Liafrbss3j4uH+e2X?=
 =?us-ascii?Q?NGNllUZq+ohXa8+znCRMuKlk5A3ve/o+DyAA2pCrF9oYf4x/STR7sPBoNycN?=
 =?us-ascii?Q?Bn5UXdPIZ5v4d1l6AmtUyuCgKdhDfyVEBO8tx/cZdRmA4g9MoAJx3hXmcApc?=
 =?us-ascii?Q?SFkvPemAuKS22Q+GocgUPP2LdXgd7ZRe/Ubk36aew0WNZjSF3S+4HNdad8p5?=
 =?us-ascii?Q?3bMI8AIKM9/98a4MX3oDH7M8vYuod3LZo8nzvPLkFd1RvVbEH+PSlrFcetcq?=
 =?us-ascii?Q?p9Et1WGUdnBtKK+mxmbL/BAugXIGaT5vxuMNfFpaBxyBntLpG9kzuBpU3xrl?=
 =?us-ascii?Q?WT17hFNNxNlL64YhISTazzeop/eYP2eRkWfDTUc0dJWAeDp9m3csEF5DowpQ?=
 =?us-ascii?Q?j77NLva5aYPFYo/I4C6ZR4nbAZW/PhbJOzKlg3y1NnnpLoVUEpPzt58L2aUH?=
 =?us-ascii?Q?Gq3F/rXZDng5sW8MPkOtLUKg22zFXup4vwvBp4UKewO+ysi8EiD5zMviwnca?=
 =?us-ascii?Q?LlNbqXo2l3UWlWL2eDUVH01AxNiovpioLYcM2D8VFPr9+dtj+zsyNb8fxGIY?=
 =?us-ascii?Q?/4KPkROIkyHe6S5C9/MmUxUSZaX2rpuiyZEFJfWH4QR1bmGkEsIilJwOEiFG?=
 =?us-ascii?Q?99FFcOGnY8p9RnAMVT13Do2FSc2d+vmKNoRi01sYukcMxrqTVWNg4eG0RT8y?=
 =?us-ascii?Q?+w0J+1brChJW9WJ/1vMoZQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94cbccbb-d864-4b57-4ac9-08d9d73b411c
X-MS-Exchange-CrossTenant-AuthSource: AS8P193MB1718.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 08:52:55.7863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB1783

SMBIOS tables like 7,8,9,26,27,28 are neccessary to prevent sandbox detection by malware
using WMI-queries. New tables can be mapped to memory from binary file specified in
"smbios_firmware" parameter of domain configuration. If particular table is absent
in binary file, then it will not be mapped to memory. This method works for Windows
domains as tables 7,8,9,26,27,28 are not critical for OS boot and runtime. Also if "smbios_firmware"
parameter is not provided, these tables will be skipped in write_smbios_tables function.

Signed-off-by: Anton Belousov <blsvntn@outlook.com>
---
 tools/firmware/hvmloader/smbios.c       | 146 ++++++++++++++++++++++++
 tools/firmware/hvmloader/smbios_types.h |  77 +++++++++++++
 2 files changed, 223 insertions(+)

diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index 97a054e9e3..f5e61c1159 100644
--- a/tools/firmware/hvmloader/smbios.c
+++ b/tools/firmware/hvmloader/smbios.c
@@ -33,12 +33,18 @@
 #define SMBIOS_HANDLE_TYPE2   0x0200
 #define SMBIOS_HANDLE_TYPE3   0x0300
 #define SMBIOS_HANDLE_TYPE4   0x0400
+#define SMBIOS_HANDLE_TYPE7   0x0700
+#define SMBIOS_HANDLE_TYPE8   0x0800
+#define SMBIOS_HANDLE_TYPE9   0x0900
 #define SMBIOS_HANDLE_TYPE11  0x0B00
 #define SMBIOS_HANDLE_TYPE16  0x1000
 #define SMBIOS_HANDLE_TYPE17  0x1100
 #define SMBIOS_HANDLE_TYPE19  0x1300
 #define SMBIOS_HANDLE_TYPE20  0x1400
 #define SMBIOS_HANDLE_TYPE22  0x1600
+#define SMBIOS_HANDLE_TYPE26  0x1A00
+#define SMBIOS_HANDLE_TYPE27  0x1B00
+#define SMBIOS_HANDLE_TYPE28  0x1C00
 #define SMBIOS_HANDLE_TYPE32  0x2000
 #define SMBIOS_HANDLE_TYPE39  0x2700
 #define SMBIOS_HANDLE_TYPE127 0x7f00
@@ -77,6 +83,12 @@ static void *
 smbios_type_4_init(void *start, unsigned int cpu_number,
                    char *cpu_manufacturer);
 static void *
+smbios_type_7_init(void *start);
+static void *
+smbios_type_8_init(void *start);
+static void *
+smbios_type_9_init(void *start);
+static void *
 smbios_type_11_init(void *start);
 static void *
 smbios_type_16_init(void *start, uint32_t memory_size_mb, int nr_mem_devs);
@@ -89,6 +101,12 @@ smbios_type_20_init(void *start, uint32_t memory_size_mb, int instance);
 static void *
 smbios_type_22_init(void *start);
 static void *
+smbios_type_26_init(void *start);
+static void *
+smbios_type_27_init(void *start);
+static void *
+smbios_type_28_init(void *start);
+static void *
 smbios_type_32_init(void *start);
 static void *
 smbios_type_39_init(void *start);
@@ -205,6 +223,9 @@ write_smbios_tables(void *ep, void *start,
     do_struct(smbios_type_3_init(p));
     for ( cpu_num = 1; cpu_num <= vcpus; cpu_num++ )
         do_struct(smbios_type_4_init(p, cpu_num, cpu_manufacturer));
+    do_struct(smbios_type_7_init(p));
+    do_struct(smbios_type_8_init(p));
+    do_struct(smbios_type_9_init(p));
     do_struct(smbios_type_11_init(p));
 
     /* Each 'memory device' covers up to 16GB of address space. */
@@ -221,6 +242,9 @@ write_smbios_tables(void *ep, void *start,
     }
 
     do_struct(smbios_type_22_init(p));
+    do_struct(smbios_type_26_init(p));
+    do_struct(smbios_type_28_init(p));
+    do_struct(smbios_type_27_init(p));
     do_struct(smbios_type_32_init(p));
     do_struct(smbios_type_39_init(p));
     do_struct(smbios_type_vendor_oem_init(p));
@@ -700,6 +724,66 @@ smbios_type_4_init(
     return start+1;
 }
 
+/* Type 7 -- Cache Information */
+static void *
+smbios_type_7_init(void *start)
+{
+    struct smbios_type_7 *p = (struct smbios_type_7 *)start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(7, &length);
+    if ( (pts != NULL)&&(length > 0) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE7;
+        return (start + length);
+    }
+
+    return start;
+}
+
+/* Type 8 -- Port Connector Information */
+static void *
+smbios_type_8_init(void *start)
+{
+    struct smbios_type_8 *p = (struct smbios_type_8 *)start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(8, &length);
+    if ( (pts != NULL)&&(length > 0) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE8;
+        return (start + length);
+    }
+
+    return start;
+}
+
+/* Type 9 -- System Slots */
+static void *
+smbios_type_9_init(void *start)
+{
+    struct smbios_type_9 *p = (struct smbios_type_9 *)start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(9, &length);
+    if ( (pts != NULL)&&(length > 0) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE9;
+        return (start + length);
+    }
+
+    return start;
+}
+
 /* Type 11 -- OEM Strings */
 static void *
 smbios_type_11_init(void *start) 
@@ -923,6 +1007,68 @@ smbios_type_22_init(void *start)
     return start+1; 
 }
 
+/* Type 26 -- Voltage Probe */
+static void *
+smbios_type_26_init(void *start)
+{
+    struct smbios_type_26 *p = (struct smbios_type_26 *)start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(26, &length);
+    if ( (pts != NULL)&&(length > 0) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE26;
+        return (start + length);
+    }
+
+    return start;
+}
+
+/* Type 27 -- Cooling Device */
+static void *
+smbios_type_27_init(void *start)
+{
+    struct smbios_type_27 *p = (struct smbios_type_27 *)start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(27, &length);
+    if ( (pts != NULL)&&(length > 0) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE27;
+        p->temperature_probe_handle = SMBIOS_HANDLE_TYPE28;
+        p->cooling_unit_group = 0;
+        return (start + length);
+    }
+
+    return start;
+}
+
+/* Type 28 -- Temperature Probe */
+static void *
+smbios_type_28_init(void *start)
+{
+    struct smbios_type_28 *p = (struct smbios_type_28 *)start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(28, &length);
+    if ( (pts != NULL)&&(length > 0) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE28;
+        return (start + length);
+    }
+
+    return start;
+}
+
 /* Type 32 -- System Boot Information */
 static void *
 smbios_type_32_init(void *start)
diff --git a/tools/firmware/hvmloader/smbios_types.h b/tools/firmware/hvmloader/smbios_types.h
index 7c648ece71..d196c62229 100644
--- a/tools/firmware/hvmloader/smbios_types.h
+++ b/tools/firmware/hvmloader/smbios_types.h
@@ -149,6 +149,44 @@ struct smbios_type_4 {
     uint8_t part_number_str;
 } __attribute__ ((packed));
 
+/* SMBIOS type 7 - Cache Information */
+struct smbios_type_7 {
+    struct smbios_structure_header header;
+    uint8_t socket_designation_str;
+    uint16_t cache_configuration;
+    uint16_t maximum_cache_size;
+    uint16_t installed_size;
+    uint16_t supported_SRAM_type;
+    uint16_t current_SRAM_type;
+    uint8_t cache_speed;
+    uint8_t error_connection_type;
+    uint8_t system_cache_type;
+    uint8_t associativity;
+} __attribute__ ((packed));
+
+/* SMBIOS type 8 - Port Connector Information */
+struct smbios_type_8 {
+    struct smbios_structure_header header;
+    uint8_t internal_reference_designator_str;
+    uint8_t internal_connector_type;
+    uint8_t external_reference_designator_str;
+    uint8_t external_connector_type;
+    uint8_t port_type;
+} __attribute__ ((packed));
+
+/* SMBIOS type 9 - System Slots */
+struct smbios_type_9 {
+    struct smbios_structure_header header;
+    uint8_t slot_designation_str;
+    uint8_t slot_type;
+    uint8_t slot_data_bus_width;
+    uint8_t current_usage;
+    uint8_t slot_length;
+    uint16_t slot_id;
+    uint8_t slot_characteristics_1;
+    uint8_t slot_characteristics_2;
+} __attribute__ ((packed));
+
 /* SMBIOS type 11 - OEM Strings */
 struct smbios_type_11 {
     struct smbios_structure_header header;
@@ -232,6 +270,45 @@ struct smbios_type_22 {
     uint32_t oem_specific;
 } __attribute__ ((packed));
 
+/* SMBIOS type 26 - Voltage Probe */
+struct smbios_type_26 {
+    struct smbios_structure_header header;
+    uint8_t description_str;
+    uint8_t location_and_status;
+    uint16_t maximum_value;
+    uint16_t minimum_value;
+    uint16_t resolution;
+    uint16_t tolerance;
+    uint16_t accuracy;
+    uint32_t oem_defined;
+    uint16_t nominal_value;
+} __attribute__ ((packed));
+
+/* SMBIOS type 27 - Cooling Device */
+struct smbios_type_27 {
+    struct smbios_structure_header header;
+    uint16_t temperature_probe_handle;
+    uint8_t device_type_and_status;
+    uint8_t cooling_unit_group;
+    uint32_t oem_defined;
+    uint16_t nominal_speed;
+    uint8_t description_str;
+} __attribute__ ((packed));
+
+/* SMBIOS type 28 - Temperature Probe */
+struct smbios_type_28 {
+    struct smbios_structure_header header;
+    uint8_t description_str;
+    uint8_t location_and_status;
+    uint16_t maximum_value;
+    uint16_t minimum_value;
+    uint16_t resolution;
+    uint16_t tolerance;
+    uint16_t accuracy;
+    uint32_t oem_defined;
+    uint16_t nominal_value;
+} __attribute__ ((packed));
+
 /* SMBIOS type 32 - System Boot Information */
 struct smbios_type_32 {
     struct smbios_structure_header header;
-- 
2.25.1


