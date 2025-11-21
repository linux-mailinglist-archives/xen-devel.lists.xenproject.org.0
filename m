Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CEEC7BB99
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 22:10:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1169458.1495152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMYNT-0000aH-MI; Fri, 21 Nov 2025 21:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1169458.1495152; Fri, 21 Nov 2025 21:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMYNT-0000Yp-Iy; Fri, 21 Nov 2025 21:09:11 +0000
Received: by outflank-mailman (input) for mailman id 1169458;
 Fri, 21 Nov 2025 21:09:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUV2=55=durham.ac.uk=m.a.young@srs-se1.protection.inumbo.net>)
 id 1vMYNS-0000Yj-RK
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 21:09:10 +0000
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c205::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51fac5a5-c71e-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 22:09:09 +0100 (CET)
Received: from CWLP265MB1875.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:5f::9) by
 CWXP265MB3286.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:d8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.14; Fri, 21 Nov 2025 21:09:05 +0000
Received: from CWLP265MB1875.GBRP265.PROD.OUTLOOK.COM
 ([fe80::2af7:6198:6898:8636]) by CWLP265MB1875.GBRP265.PROD.OUTLOOK.COM
 ([fe80::2af7:6198:6898:8636%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 21:09:05 +0000
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
X-Inumbo-ID: 51fac5a5-c71e-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpRDrdRGoCR4Sq/qFqMh6WdteAke6ohsNmS6t7NaPBPbHKTeifyoXt1TtR8wK4Ug/4g7gCV6tAOY4fO9eUoiwDL11v0fdMg8nbZpto7l7ebHLJnpFX7/8Gk7denhDH+8ss7+g+bRE849jb1pbDWoCvjwWHuPcokuWa874U9TNWU/gG1iSWejvi9MAkzATBPC2BCoGFhfbaIqhUUnxyND3ABOCe6IosMH/vJPklotMtxArr/1/ku0w63KEiH4Musq2CtXeVkCgCyo3Rbix+hpKr7J8iPOI2u822yKjI5Nq8XQS50xaWVcQLtQTTlwG/ZWVHoIJ/Aq2mMTMnQwipk3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kv42ZEkgyrPpVrzR/AloL9B9AKQMGqD2iqG3U1yBZO0=;
 b=ZprgkuGgKE/sP4YDJeahPFdDDkatn3kVQAY0OCorZJT4DtTHj9UXXUhSCbcN1vblYtdG28aQTngY3W+U5E+69cSqgPLi8l3t+0Sfl9yZKAmE3K3pJUiu2eXuW2YJZfCiuCE5GLze06wpjH3pjWYuaRaCWBqa4tPikMuga01SARCbtF1//CtIkSoVIgItO4sWZWs8ZOaROlwF6Ma958NJYTM9dGEHrl/gosQ8aE7bbOOMBfojHG8ZzhWzLFRxtdazIcaDHnXtGrghsK7qpcfnb+z2ERt+QJF+u47Ndlr1hcAe1vVXIbPckepxiE3keC2M5crcftP4+OSPH8K371bJYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=durham.ac.uk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kv42ZEkgyrPpVrzR/AloL9B9AKQMGqD2iqG3U1yBZO0=;
 b=Vpo3NokPxIGlURurT9wLIyToswzyjM+SyFhmpc2Wa15Nab0cLe4PIaEcQ/y6JXNkpGwh7X9WkKAbmoQ/1AVwldH+a4IeuvbPQx0XrsL8PRWGdeySILML5hPCRu2ZljXibsVk08nP5gtAX9Si/aHlAajDmu4y6LXZaJubAtC5+hc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=durham.ac.uk;
Date: Fri, 21 Nov 2025 21:09:04 +0000 (GMT)
From: Michael Young <m.a.young@durham.ac.uk>
To: xen-devel@lists.xenproject.org
cc: Anthony PERARD <anthony.perard@vates.tech>, 
    Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH] libxl_nocpuid.c: fix build with json-c
Message-ID: <94ffdeb1-6826-4c3a-a9c1-3ccc8b129a61@durham.ac.uk>
Content-Type: multipart/mixed; boundary="-1463790335-1529782592-1763759344=:3590"
X-ClientProxiedBy: LO4P265CA0252.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::18) To CWLP265MB1875.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:5f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB1875:EE_|CWXP265MB3286:EE_
X-MS-Office365-Filtering-Correlation-Id: e3985e05-7345-407d-094a-08de294233fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-7?Q?oanR8GjnFerhncff1LC+MhuzSNHWbU2fqmW+7GO37eGFcBMaOWybu4dkU+?=
 =?iso-8859-7?Q?gIF4yMB8drcSvHZAVIviDCbgH9UwsOUDkPxwhh9IyKOT7R46ptLDHdxE5U?=
 =?iso-8859-7?Q?g2E7z2dXnrxqvdSiRchRwMd+lb/5x4mfQlLcaw91BLCBxBUodpDry0byLz?=
 =?iso-8859-7?Q?B97tHwR1ZR+0Kp/rX/LErzXIAhr11Owsyp3x8DIX5RDTcARxhMHBRunTRw?=
 =?iso-8859-7?Q?tqxQe8p4T+J7n5Bew1Kk3HvZJdJ/60ska9IZh+n5Vi0GA2EeMeqGm5voOb?=
 =?iso-8859-7?Q?4akdSTOLyEr7HYFAGCzb4BFSYOZFTPXVkApuRbdhsXBxF9wjB7TB0gvat4?=
 =?iso-8859-7?Q?XNOR/L2H92q2gfxegrLlFmU0mUn1ESQ1lla2MO5JMTpNLc0YJwAl21HQ8g?=
 =?iso-8859-7?Q?BeDHgoDth+Hm2TxNE6VERDldY2EXlym5uRaFLlOYBjtYq9GpbcUm6dMyP3?=
 =?iso-8859-7?Q?XKG2MuSnG7iR+LUXE4GcxdRKOfUr9KB7tTkg/VCeFkrEoG8vPeZBEjZ73m?=
 =?iso-8859-7?Q?b6HfCmuZGMGjQe6mvLqayUMOGHsXTlC9C2+DiRdlhaa7vNNrVRlhI+mwen?=
 =?iso-8859-7?Q?ixWnPMCPH3pyrgBryBfK5avVtL7dhzg3QzxdT7GO+GjdLYQRIrG6i9t3nu?=
 =?iso-8859-7?Q?02nSFISWdLJAjMXHztRj6Wgu2k97ZVX8ByO5QQ8hbG7IOTX4i+AnTGsueS?=
 =?iso-8859-7?Q?GI/cHEVCJ95KfX/SkI9MliD1WcButHgrh8e+p4yMNEHuYTBNJvMx5wDiel?=
 =?iso-8859-7?Q?KSaPJ9l2aH38aHmQydG/rOvXEi2tyrVQYymKC/A05UlIMwloXaSZ06ZIQd?=
 =?iso-8859-7?Q?InuPcOxsdard88Lw8YEt77EX+H9qQxG/vfWE0qTB1d1A0+f1qLbBxfKkGb?=
 =?iso-8859-7?Q?/7q+23Bkf6i1GdyzEaOiqBg2mcL15IBHBgqdThGU4MtYsiBWMvVC0oUhso?=
 =?iso-8859-7?Q?HyOGi7g90CPQcAgaPIlZ/qpbSfKM+0loykmPbgTRPMSxheeOfklDpjVsN7?=
 =?iso-8859-7?Q?G3wlXqhQCp5GRU7grfvP3GY46VFZo8sSvQPcYiD8TbRXDqlIn3x9rt6SU1?=
 =?iso-8859-7?Q?Rw9fA3nlv3UE9+HOPU0kTSlCBpaYyBALUUpJWfLjsmUHM53c4oif/KtK7d?=
 =?iso-8859-7?Q?BgD0J8CvAelcsw24Q2cWAGqQDQAAfvUsv+Gn0/9ttAZ2gxFOZKUgKqP6pZ?=
 =?iso-8859-7?Q?fjl5AuGZfy43V8KAPmNMEeZtBU1K8T0A+sjcVLzLJmNhOhOcQ732pWCT6M?=
 =?iso-8859-7?Q?LR8gGoFd2YFIgbbSKyMvsNr2fnb3fV+XYnVAw9b+2xxS0AhM0mgS6ZB/Gh?=
 =?iso-8859-7?Q?1y0u2IaMvKN7A4Nh/yNU0qR+p7rkLw4K3XrdsnPyl6wiCGfEjNIQ2Agz0+?=
 =?iso-8859-7?Q?pPH6/OQoiMm5CkmdIOvSY5/QITuIkLbQyIXMtQMzsvjTUx7YuFtcusQC2h?=
 =?iso-8859-7?Q?zlKQ5fpjIJiRXPAhDg26pjK7WOcFsJTazoiwNE/A9/EXmRwtLizqp/L4XS?=
 =?iso-8859-7?Q?zV38/q5GcF18KzoGNh+cVb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB1875.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-7?Q?/HTe6In+fWB7Gr8pZIhSNsCOQpjkTyFysIRZT/uYFex23uK3KGTcvHe96q?=
 =?iso-8859-7?Q?Pq/+IrsHp/MjCB8oNPs36WbCNP/XLSTVZpOtm02WzkFhKGCjP+ZdXPs8CZ?=
 =?iso-8859-7?Q?7nPr33E2lV/uKU+7jsMCSyi2dPwOFVT1vtmqJrk//53ERjU71V07kqNF8i?=
 =?iso-8859-7?Q?+y8QCh2W6gW0T8qsjeq46oyKIKA7wf+/DGC9UBusIPZnxJUjxN+eBa3LaS?=
 =?iso-8859-7?Q?4cnjpDt+pxrZVQ+YYknhnfDm/crgAK6Yifsx+fzytJvGeMpX0/jfwwEAVL?=
 =?iso-8859-7?Q?rrkeZ2uVlbLWTOf7kT6WvhMxtBsM9yc7jeH2W1ihV1n89RN8TcOj3U/BCZ?=
 =?iso-8859-7?Q?0V1uHQTLktNZ6RZ0UdNDq1on6D7sEoK6UNr+XT2e1usY4JzIGl86pvgAm7?=
 =?iso-8859-7?Q?mT1xN4ODMxcGHUKzHesQFa9nxx+o9Z16tcWpLjxBQdk+JXtC+eA8fsktnQ?=
 =?iso-8859-7?Q?Z35uojmuFg2nbaxNhBl9LGx8AQk5sv9vDgKcK1r+4IfOoda/LKPRhfJ9A6?=
 =?iso-8859-7?Q?ZVsnddjeKMPnudHtudDb2fClhHJ70FZS2kTd6wkjgUmB7zbWlp255yMBEG?=
 =?iso-8859-7?Q?z8cI9cPjJILvvE/ETsHdDxPb6W75gXQRr/pQ7UMs4nashSQZlbtf7QiXwG?=
 =?iso-8859-7?Q?O8ZVnTMnm1nLgoFcdeQwPG78lFzCTkIFP59YLfaQM1QlgJfzm1mmpkaNhY?=
 =?iso-8859-7?Q?3YcgJqD4h/ofRVexaH1CsOUjsI8RzXAWQFmf3xUGPwKhYpNP62sMq9I2bJ?=
 =?iso-8859-7?Q?UP1IT2TyliNcfR+XPBTsiUiDLQCl9x5oJt4wz0FcZ0+1h1O3rPmxgsjBh5?=
 =?iso-8859-7?Q?RIiTqNYYysDNiaM44ok3zcQPxUAU9Sc9LVrQMm/7Tj6ecOnRuNvOaUSkMG?=
 =?iso-8859-7?Q?UGDen+c6/4qC+poyBJongwXJtzcsFyKwfF06VZYjHTmHd4B2JZkmFtkAK1?=
 =?iso-8859-7?Q?OFFD/59I2NgtXik0f7spN1v6abWWBqEwxfo57K42EBckNl7UYjm3dLkfGM?=
 =?iso-8859-7?Q?68lKI+0XCjcwwc0fe5ifU2CpaxVrT5mMZJKj5MHRdt59JZU3TSPvZn4UZy?=
 =?iso-8859-7?Q?EZmVHGQezYkfDYAyRa1iBQrJ8O0vP/tTJVp1n/WqXJV2nm9a5IReAcEf7U?=
 =?iso-8859-7?Q?VC5PPZqUS4HpVjOY6O/gcgAmQqQ6nsspb2Y4zM1lS6XwVXln2rfvd1eEKY?=
 =?iso-8859-7?Q?uPzOSKdoPgUXySxnH/SZW8YrXmDeZAPNEzWpFejVECZAYujez6/wrQCiyf?=
 =?iso-8859-7?Q?MOr9SABOZNF9WNXgoMhXINdZOzxoNUK0UwqMCfhrEK+sjGim9CrYtXMgB8?=
 =?iso-8859-7?Q?YxEACyBGl1xNNilWWo370Zfts0IxXnolrb2mYOpyP0AqVi+ilhwU60a5p1?=
 =?iso-8859-7?Q?uO3pOkgmE6syRnpKZzBWZ9e3ieo8dxna7FFVt+Y2nyCKbcQR6dShaWTy1r?=
 =?iso-8859-7?Q?WgxHRyagK6A3IQ6TN7N2tXLfwYpbnNs5oYZkJnGQ2IGSQpLb0Am7qRuDfM?=
 =?iso-8859-7?Q?uc8MA4Y1QZY7NBmV7PBD7htIJQTnQGqPXLf02lkbqG+zRoZb1CjquHqLyL?=
 =?iso-8859-7?Q?NP3SnuN7+GvxzEt5aMziaWBUZkkLvOaheiIdOrabOefZuThAUovV5Spvdw?=
 =?iso-8859-7?Q?9xHSjYKoqBATmspoprzvk0cOXpRFADW8gfElYTATSQZ0P7M6Cw0d0rLD+i?=
 =?iso-8859-7?Q?vxj/KKIvCPZKu0CmJMrUenxG9xpePAjAdo0vjn7U?=
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: e3985e05-7345-407d-094a-08de294233fa
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB1875.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 21:09:05.3183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2Xblg8ptZUZlYBGx6MWo4CVY95w+3xyrP7PEQ/1U7l12Y6XAJfdds40jlBJ1EP229ZNPMkQFP9Wo7HyiM3I3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3286

---1463790335-1529782592-1763759344=:3590
Content-Type: text/plain; format=flowed; charset=ISO-8859-7
Content-Transfer-Encoding: 8BIT

The build of xen-4.21.0 with json-c present and yajl not present
is failing with the error

libxl_nocpuid.c:43:1: error: unknown type name ¡yajl_gen_status¢
    43 | yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
       | ^~~~~~~~~~~~~~~
libxl_nocpuid.c:43:50: error: unknown type name ¡yajl_gen¢
    43 | yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
       |                                                  ^~~~~~~~
make[6]: *** 
[/builddir/build/BUILD/xen-4.21.0-build/xen-4.21.0/tools/libs/light/../../../tools/Rules.mk:178: libxl_nocpuid.o] Error 1

I tested it with the patch below based on libxl_nocpuid.c which did build.

Signed-off-by: Michael Young <m.a.young@durham.ac.uk>
---
  tools/libs/light/libxl_nocpuid.c | 13 +++++++++++++
  1 file changed, 13 insertions(+)

diff --git a/tools/libs/light/libxl_nocpuid.c 
b/tools/libs/light/libxl_nocpuid.c
index 0630959e76..71ab49ed61 100644
--- a/tools/libs/light/libxl_nocpuid.c
+++ b/tools/libs/light/libxl_nocpuid.c
@@ -40,11 +40,24 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t 
domid, bool restore,
      return 0;
  }

+#ifdef HAVE_LIBJSONC
+#ifndef _hidden
+#define _hidden
+#endif
+_hidden int libxl_cpuid_policy_list_gen_jso(json_object **jso_r,
+                                libxl_cpuid_policy_list *pcpuid)
+{
+    return 0;
+}
+#endif
+
+#if defined(HAVE_LIBYAJL)
  yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
                                  libxl_cpuid_policy_list *pcpuid)
  {
      return 0;
  }
+#endif

  int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
                                          const libxl__json_object *o,
-- 
2.51.1

---1463790335-1529782592-1763759344=:3590--

