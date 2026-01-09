Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5821D08F8A
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 12:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198626.1515506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veAu0-0007i6-4V; Fri, 09 Jan 2026 11:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198626.1515506; Fri, 09 Jan 2026 11:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veAu0-0007ge-1g; Fri, 09 Jan 2026 11:43:36 +0000
Received: by outflank-mailman (input) for mailman id 1198626;
 Fri, 09 Jan 2026 11:43:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hvra=7O=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1veAty-0007gF-Q1
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 11:43:34 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6be6156a-ed50-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 12:43:32 +0100 (CET)
Received: from DS1PR03MB7992.namprd03.prod.outlook.com (2603:10b6:8:21b::11)
 by CH8PR03MB8203.namprd03.prod.outlook.com (2603:10b6:610:2c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 11:43:29 +0000
Received: from DS1PR03MB7992.namprd03.prod.outlook.com
 ([fe80::9bcf:b438:9af9:9ba]) by DS1PR03MB7992.namprd03.prod.outlook.com
 ([fe80::9bcf:b438:9af9:9ba%6]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 11:43:29 +0000
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
X-Inumbo-ID: 6be6156a-ed50-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5ecxi5Qg/5K1fybrloba/RN1gcIfHPrODDRA9TUYtLWIcsfnixDs/arvDIRQid6fH/glZwqVGFRGxnv4/EB3YA4tWo8jM4L0HvY9WOp7pMQhhbsX+QC1AcoWkJC0wtVVFacwLCD2OSd2O9scIqa84AW/MBBMGkPxcyCMxL7z0U+DCAYoDqKNqp7+zIzEfz2PzL3zuEZ/7tpB3lheadgT83A2C3R5DpWB1Os0oEvKW/PbAKwwZsKT731k58A6/Q4WQeyh4zgIoPsZ72LwJ1Xa/KX6EON4qCA/uz3FULQVaTitRgTeYz9Q1L5xPVMt+B2XVHqseaQkjv4u3IPqKSB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkB6EsBblYtcdg4TthQlzoq+zGj2omHbzRe0YMZrHm0=;
 b=lLVSHetqKaliFVNYB3F5F51aP2bPzyFxt8GsUPWTMSW1WWRAgIUpoTtPMRqMZTqicB/i/OQC6EQ3tm55gsrYGVSxigpOVcA5jpLCQCBOyqKuLVoQvzDeyGw/gnhT1mDny7DgKJ7MPa2ewBCIrjyQIvoFnOwApXuDpNoHyEZkNTOreIi5OlxDjHXUmSzK3DotYCzC1SmLLL5daBpgE3WYFf6J/1JYpVqjfzRHX65oZRsYyApomKKxwAMoZ3TPVaKt9iKy/I4i+hDf0XNwuo1SMj7+Q1mwZNvSyLf/mgPyi3dpstRxPwPYReXcS2zxkSM8OEFb4YpJMzC9INXk2X5omg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkB6EsBblYtcdg4TthQlzoq+zGj2omHbzRe0YMZrHm0=;
 b=O/di4petjN7isxlDU8yF0iKjRk1rQqNEjvyIF9iYTACwpF5rGjNaaNyrjtgn+KT/Nm+KcI8y0vmixfhI8qmyNw/unsmOX5zBEnHlPO58chFzhbykJe31RRI8PMVJXVDcQb3OJ2/r5ze5I0Vr3NaLQUpEgoSZ99h6ZeREhjXMMH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH] x86: fix incorrect return value for has_if_pschange_mc
Date: Fri,  9 Jan 2026 11:43:30 +0000
Message-ID: <20260109114330.2361144-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::16) To DS1PR03MB7992.namprd03.prod.outlook.com
 (2603:10b6:8:21b::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PR03MB7992:EE_|CH8PR03MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 51665958-21fc-4c69-26aa-08de4f744ebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/QxLwuv+XDDAsj8lF7FKBj6xUhoKk3CfEVqH0qoz+zaMla9mNgRtv7wse3Jf?=
 =?us-ascii?Q?eVQ55xMSDjSGfOXzJc8fdni2DIqZ4l1gm4Yb/7KipihTKZwpVoRTZ7vmxWS0?=
 =?us-ascii?Q?SvM/iDUK9cLNsdIk+Qkx/atW4qyjZlFlDOdIsJnXrAxiXFhe7/KvI/q31aPa?=
 =?us-ascii?Q?yd2WNYift41bo/ySoXBwpWpJ+VE6G9htGKKQOn9t/k4DsosmkHhRoeOjBYLT?=
 =?us-ascii?Q?rep4OvwhshQFF51WkD1mpSLg67zsq5Jkvv+9mTMOM6riwP55me7yHKC3JO/A?=
 =?us-ascii?Q?GSL3Gcfvqj8uF1JbhH6ci/ShsDJ6c+kTJdpyDMQFBPMjCketoS+r1oOiWKmz?=
 =?us-ascii?Q?kAM3sMTIZvq1mMJlwZfS/Zta9mmgT5YPbs/JvWMULyRHwmRQ41rCVS0+cQNL?=
 =?us-ascii?Q?j7tLeNM/D3ZdqxGgLjbSFNRTSPMYuxgBJ2nsVohz+VXD0VpH/Gqm0CPLYJG2?=
 =?us-ascii?Q?H05m0jxVREuLwval0g/TsLVva+ajnMwgZaPDY3Bjfsg0ww3ijUwbuSbz+wRM?=
 =?us-ascii?Q?xOhDblgYk2gZZLXT8hOBJ8WuxGOcGTsl7zXFbjmDe6bqZdfvk0HbMzm+1shd?=
 =?us-ascii?Q?W2b8tShmmFHCKR9hm485n9Z9VPUqKFKleRNOv4yMAnL3O2/KBYsSZJUboEjO?=
 =?us-ascii?Q?d5M4WC3r6+Y9I3aw16UVVjO7jCh4TWI0J4vuaSq1RYg37XmBPnUieTqNsq5W?=
 =?us-ascii?Q?QPwxrFd7WnquunA2Hb4Znbu9RausHGy2VytOqmk8NOhv+N9nLHK8TX4eF5sR?=
 =?us-ascii?Q?41eBLHUaNEp/7Fn1j041sI4/fkKTLniIsy+1MvKup3YAPHBEH9kns6kG0dzr?=
 =?us-ascii?Q?uaTP3FlqdUMcX0/ftGb7jEQ14NZmQlRx1ymbyloE5sUI2A+ar2zJH7+LjUvp?=
 =?us-ascii?Q?YItcWDzcwKNEBtZ90KH5NlRUj3WANmTZDlSbql5CfyK7++xxwguz2MzlxToN?=
 =?us-ascii?Q?m9yGMYqWnnzIB6rG/foVy+DPc1WChGhZqvYPHkGrwDq4TPqKfbxLhLc38PF/?=
 =?us-ascii?Q?qUsxO65LXY1LYQVAjrNnDjVmyFQGqjsu+VdzfNifcIuT5cqUq9o3ypWnWQP8?=
 =?us-ascii?Q?m+WQa8kc96nbFnCBKdyczmnWKfw37hhj+cz4Zxre0a43fdyHz72raEcQFzC/?=
 =?us-ascii?Q?0MY7FgqMEKPhtgwim+0SvZfChUs8wyp+d9eHodYw3E54vJ1sESssI5ztcwbk?=
 =?us-ascii?Q?Y6dgfwy3hGHmQPSYV6AgyYv51++796i8fhQrFJ+pZad4EFMNN9GVispCLo0y?=
 =?us-ascii?Q?z+0UanGd1dDOGe6HG8Qraw/xWuLh+/J/jpTWSnHiNHhod/Pa7DkL6gK+hvWa?=
 =?us-ascii?Q?a6O4cKfgIXRrHrgBDM7YKjgBziBHb9Gks1L7b/jr2am0MEcQRaHhio5fHjJP?=
 =?us-ascii?Q?uQ5XD77dUPdu9dBSyvQ9aPFb3pQq7SDvl7lenPdaN+r5ZPdc/4pB7JzMBeEJ?=
 =?us-ascii?Q?nV0YmG2nLjPtOh4mbynuxlRKDPRAzBsH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS1PR03MB7992.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JiZCAdqqXLufGrU3j94C81Kvv2BAA6T+NQxR9856XqvfLTAz6j/Q2AwN9qEP?=
 =?us-ascii?Q?hirwEJ9UxsBx0Fh4ZY6ttLk5a7e/X1rJ1t1KLmTfhndeafvgLWAleeeenUp2?=
 =?us-ascii?Q?KicKr4qfq1XpnVc8+UA8U4Ec5Ol219hmG28v5L0rAsBg0yFgRipu6MS9rZfV?=
 =?us-ascii?Q?TO92hYyTto9G4sf47s6RCUIhpSh9WRRX59bAdNNlpI8SeMMPXLM+xLtSDYef?=
 =?us-ascii?Q?iHf5TvoXTI9P3UKXyhjnUZIzSiuM0w9jct/bxURhIQMYiywJGZkMvQfJEPA1?=
 =?us-ascii?Q?6QHyNCiSI9LUCnaaES1tIHMQOPGUEQmksUgxKIEk9Pg1qSjyF3guwKBuUYiV?=
 =?us-ascii?Q?pkiLMbVXP9UNsDK+nBSgd6wMyfvPBCxRPJcwtOm9/oCCbTfC8XqvTN2WrVuI?=
 =?us-ascii?Q?wyjlzysiIvvoi/khSXywPZ6RXsMFAJwXT6Fy9e0CZD6yhpgO+oHNc8T7u5Jm?=
 =?us-ascii?Q?pBN6Mnnu9HeAw506EqFFCaPyZsheWM3avLbKxWNVPxsO8Eb1/i22Nte/F4E/?=
 =?us-ascii?Q?E9owGty+yiD0S57NqQDb7l4/D8fa4reDMk1nDukfRV2F1KuLuwyzp78eTJYQ?=
 =?us-ascii?Q?w/xKmx9u8rNPVeqYotfkbIdcY5GlhdbAE9TtkRaOFZuWmvPqxSCN8HUGswFU?=
 =?us-ascii?Q?89N+5ZbStdlSkExRYYM7TdOakD9tRdzuF0bxdXQ2acgy4u+/BIFo5271AzzP?=
 =?us-ascii?Q?cHoW6dyMpu/A6Sv4w/96Po+Q/LrH2RyI3VS2la2J/vL2W1T9hUZHQTQndGoW?=
 =?us-ascii?Q?4nePJqYTOikoTAgKuPDFdPgRDuAWqfJwLIrjUSu3JGymhwwqC2mL6YSDucpr?=
 =?us-ascii?Q?1eCbPHH9Gv+K3ziKt00jarKIg5EeUYxtyV2+kMZG7+d41D2W94WRY/LcuLo8?=
 =?us-ascii?Q?KasiwJC426mRXpYam45GiXff1cYX9+YUT2QdW1drwDsslo2QuiNAmkamzeec?=
 =?us-ascii?Q?AuR6m82A5PcRT5VY2aIpUSFNzA4qeQ4R3/ISHTtvr9LSPeDdEQLIJACMIrdR?=
 =?us-ascii?Q?3146N/T+l3d7/wNxQRn+TPIFb/zKjERM74TdOZbyKPdM+/JsLCG1WcFmUepZ?=
 =?us-ascii?Q?p8P9EN0L7Z5imPPLXsMTGy90kLNiw43VbcjSAzeRty54ejwqDCNbRU07AZtB?=
 =?us-ascii?Q?/RKLbpszlIdL5JNfXdmiZX3TjiFWrTanV8ZHK2dfXEdoOzJn0jJ5MX5F5DRE?=
 =?us-ascii?Q?DUpiFD5mJPKTgQRkXV6UUqB/wSBOXS3upcInd/Jj/MPOL3CLYXfeZI7bNBZe?=
 =?us-ascii?Q?IUa1X+UWIEuNLxYhNrvXAksfgbewx7Boeu8ywrpU01UN+qBBKoBhMkNHF7RT?=
 =?us-ascii?Q?pLDIDi3X4Ale/8rYYTwrTv49iWIsnJ+DN+0alloS7PCda7A97rWxVWTGbz0+?=
 =?us-ascii?Q?hrhsc1Xg2yen91cJ6U3mfndvJOJWNVxtYtOelMTMKW9FeiWgpjaLnxKH1CuL?=
 =?us-ascii?Q?jRmdwX4I32fWkMdA+tcBwspW3Hni+uI9pM01yeTGnZsq4fMWgqVBJaT3Wcut?=
 =?us-ascii?Q?SXz3i+EEXVUV+BezlcHqT1iXGZQpxJS9DfqhS55Z9/fc93KqAoi7kUlY8YiD?=
 =?us-ascii?Q?EaWQQUXg24nyLxK/6WIGD7hzPVlqQ4BS9VjjGOVIyIEDdomxu6rAA7KLE0vp?=
 =?us-ascii?Q?027RQMe6uE6aNSFz08Puq5yh9TzaZdfL0viTfjhQu0JAEijs0ArFPma8sqbf?=
 =?us-ascii?Q?7IyXcAt5ACPLrS6vBsd6xAaXIF0YlP9nqkQR+GXAQQgChAIPXtsCiUcs7S0z?=
 =?us-ascii?Q?MEXNy6TH7A=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51665958-21fc-4c69-26aa-08de4f744ebb
X-MS-Exchange-CrossTenant-AuthSource: DS1PR03MB7992.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 11:43:29.0549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QLCkicZYarnYwjnjw0ukBEzE6xkctvNyI0yj79F0/Ay9/VfS4IKeqgdagqmmy5a3OymsisQSGAQ6kzbmW4P6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8203

A return value is missing from this function leading to safe CPUs being
marked as vulnerable.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 05b59cb8e4..cf474ee5b3 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3117,6 +3117,7 @@ static bool __init has_if_pschange_mc(void)
     case 0x75: /* Lightning Mountain */
     case 0x7a: /* Gemini Lake */
     case 0x86: /* Jacobsville */
+        return false;
 
     default:
         printk("Unrecognised CPU model %#x - assuming vulnerable to IF_PSCHANGE_MC\n",
-- 
2.51.1


