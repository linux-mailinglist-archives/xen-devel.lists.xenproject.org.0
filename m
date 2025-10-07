Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC855BC1626
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 14:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138746.1474368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v66yN-0001E5-EP; Tue, 07 Oct 2025 12:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138746.1474368; Tue, 07 Oct 2025 12:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v66yN-0001BL-BT; Tue, 07 Oct 2025 12:39:19 +0000
Received: by outflank-mailman (input) for mailman id 1138746;
 Tue, 07 Oct 2025 12:39:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Adj=4Q=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1v66yL-0001BF-90
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 12:39:17 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f17a956-a37a-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 14:39:11 +0200 (CEST)
Received: from CY4PR03MB3382.namprd03.prod.outlook.com (2603:10b6:910:53::36)
 by IA3PR03MB8022.namprd03.prod.outlook.com (2603:10b6:208:508::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 12:39:06 +0000
Received: from CY4PR03MB3382.namprd03.prod.outlook.com
 ([fe80::2947:e6d0:817c:58e8]) by CY4PR03MB3382.namprd03.prod.outlook.com
 ([fe80::2947:e6d0:817c:58e8%5]) with mapi id 15.20.9182.015; Tue, 7 Oct 2025
 12:39:06 +0000
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
X-Inumbo-ID: 9f17a956-a37a-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkhQdx1M6ujOWxgBXptKreGT7k2Zy8FCF/uTXRz1pWrTcpaUKEOYzElWzcDKu3mpCxSLJbp3auhBDgHkTgEVNdZXBmXWaslSDF6JzCnkqhSTv58xZvf0n5mBqpkKMhZwUfoTFS9X8fOBsSAtR3wwkrI+cNextfY39V8SpjWGAvW0iR6wVuwU76sA1godqhoPgYAqyQdQD/gANJOE7zQujAHFUNB0qRPNcOIIOVHAFsTHnJcubQ1rtYBis3kaODT53WHT+OcRZwaVIclKBMMOlrcDiqA4WxoXOK5hJxeXGJSp7YDxiBQymClkQN3h4IVXmK3W/UvwvqVZbuJrMLbuaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzXBy9q2rZHz5Leac3PtUcTLC31gSKUmboThEqNAc7g=;
 b=afQQx5lmXXA6YQo2IlgRSgQzF+LM11oupjXn8IkpX+obV/nDFB4dPJTYUimLNsZwzOlPts45rzXrX9O2R8XxhHC14ZLFKh0qLTWi1J/Wu5ys3OV+sQUG78m8YqqGsPxOWP4Mm3BD4jSke5suJstVBT8XCj3/G5eQkybltApIk2qybkx9HVl35ihmLDQ+HINpjorG4RkU2plGQqTm5TrNLbTBhSQ6YZ5AvulmtlzrCPdHLjAbbljmROolr09VXgX9Hk4MeoT1lizzzly8jqydag/kXGDvlO3IH3Jqs+m4J3GRZxXIJ/LFiLtAzg30yZGmcpvv4QNyyS8W6jAHIRuCYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzXBy9q2rZHz5Leac3PtUcTLC31gSKUmboThEqNAc7g=;
 b=lTG2hIvgd8JbJ24vbfefka8BW0FjDX/3aT6gzQwR2iXLdkSjMh1jyPvQ7XjTBb+1QDE/oKWcoCiNBusf8pABCXdAHd5+yDys+j0j3LPOe8fKaFJ2+QNJJoITjQPQXMjQSv+S1KnPtv4ptgfKweDFyycibVdA0KigRY1Mlv1tNBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	"Ross Lagerwall" <ross.lagerwall@citrix.com>,
	"Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH livepatch-build-tools v2] Treat constant sections as string sections
Date: Tue,  7 Oct 2025 13:38:55 +0100
Message-ID: <20251007123859.23646-1-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0388.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::15) To CY4PR03MB3382.namprd03.prod.outlook.com
 (2603:10b6:910:53::36)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR03MB3382:EE_|IA3PR03MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e7950c-51a8-458b-a233-08de059e80fa
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UQ/B1V2YEmQOSao9uWTXxeTslJaYI3baZu+uL+wOInvMnw7pPR0UCXnW7mH7?=
 =?us-ascii?Q?ObB/2RRzOFzOn8tPbNnDfBoctA65pAlh/9WLVZYhOOrUXJDVISHn1i5DWIJO?=
 =?us-ascii?Q?+q0LHvlVLYVOnotyJLGLJ2WGSvvHg0c7HvI1yeeWzsfi6BG5GN0KQWV+/kxC?=
 =?us-ascii?Q?1GNshRR7vIkI24mbFPfDb8yYlYeFyZBvj/qZcze3FcRwwvH2V/+CcYLdPmOy?=
 =?us-ascii?Q?U7erRSiRKLbbCRh9+B2oNyatnTX0l7BrEHwC0NB/At8Bx/SNZW1EeDDQJfK0?=
 =?us-ascii?Q?ghFWptgWZK8JW9sMa/7t8zRYfvbEoyyJZVi8a3vBiJqFq4/1kXub3P6+JI+p?=
 =?us-ascii?Q?7mLxAaWp9nKxM4/46A9wr7/VHaGvNtKXecAl0+rr0tRgMDJSZn/HA/l8D1My?=
 =?us-ascii?Q?F0Gg96o6G339nPnOtGIJwpRlGusijtwRpCg32uIPzriE6frSeW5KxwamJoXg?=
 =?us-ascii?Q?mdSKE/nJmiVaOdapoq/5rGEzDoT/ZF6PFq3YgMqM9rUlPF+9gMvgFBQstTD0?=
 =?us-ascii?Q?ALTS9AZTsBeZp6L5lNlr2wZAI8yzo27A2sB85WZ5RMPAfeyXPpevOBrY4ukt?=
 =?us-ascii?Q?BQF74Hnu6jT1yreWzyf6cuIp17rhDluEw96J4iN7uDTBorlEB4qI8DXdBNTz?=
 =?us-ascii?Q?kznTkvyhVduV/OEe+52vU75Fs/RzOfbkiFxVrz6VW57S8yJNAuGGA0KF0kbs?=
 =?us-ascii?Q?8Tk0zfe7+8O43PHKdUJtL2NOaM06eAjbgXVKQUWdyz8N3eiNFIOOmHSi34zx?=
 =?us-ascii?Q?XAZZyOsIUA0Zqeu2iDgrvCsG7zpF33rUMOEzzvrcytLPl3Zk/rcTrAAqbgWm?=
 =?us-ascii?Q?AgdB9+4hQAO/MniRQFoQdO2CbJCspIb2xHkb5LyNhHTfiJIn1PP4d1/BjaG/?=
 =?us-ascii?Q?Ro1G4MhXIwHBzu3yuVjPbfG2fFAngtYqz9UF0bWUL/v5qqqYKvQilAoLz2vi?=
 =?us-ascii?Q?mLg7645YWlkP8TFoSKqiRSiH9nglFjTRb8Kd7O5XmYQktzvk6fgvI5VsAi9Z?=
 =?us-ascii?Q?Gn3E7kjHZbMO0SzlJJH99jrh8aGJwnbKz2vm/HUIZspNiSpmCg7MEHS9EuiB?=
 =?us-ascii?Q?+BFE+MkkC67RYrHsIxyQq6lt9NWVvsCCCdESeSjNHJs6zyGUx9rqo0BKGuY6?=
 =?us-ascii?Q?pxB9NhnyxT4sbCivjoyGG4feGyFglP9ekql+ZxBRI0zaqiRVFtQjQad3g1PJ?=
 =?us-ascii?Q?K8z8evkG4D4l1XuJt1PZ6t9YHPYKXPvBSqNhZcdJ2lAh1KJXWWW5gNfpWMIR?=
 =?us-ascii?Q?ulQiGR8LP9/jfFwFQZHkd1czRVXnspV6JvLHIQYVWZG7BWJCVR2TT8neKuVC?=
 =?us-ascii?Q?psn+OzSgk/tExugXxXVQVSm5jHsrslnVeRIuky1Mmlo+VazqUJnCRl7DRp/g?=
 =?us-ascii?Q?8dNUSSocUeuE645BqD1won56Rtq3/PQCWSey+eKmp8VwCxjhhRfja+CYsoi3?=
 =?us-ascii?Q?8owttcULU5p7rXtcLEyTK/pWg8MoEvyn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR03MB3382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xfTF5dQbkUd/rJIHOQePkzda+e5mAiI0rmvQ2EQSaVNjBRMOwG1OX1EsADSv?=
 =?us-ascii?Q?dTIyMXwKeCnBYGl378V7utyrHylRmyrfORgeM5B7hHq7Ff19hOZN3bCIgaHg?=
 =?us-ascii?Q?a1IqfUHRB8mqCZFG/6a0fRFuJqcusIX5P9wmXf6IITP9F0ccXw6ErTwPQa6W?=
 =?us-ascii?Q?kZ5WMVJhP4Rqra8p4xdpZT/W/8EWkbhTCMnyPTRPa7gC9EXDgyzuYY09UWVo?=
 =?us-ascii?Q?2MtSmUgKbRvV4fZERKtC2pEjLq2UlQCMKReMGVDgbIQaN7sZAjCj8xizyHuZ?=
 =?us-ascii?Q?efMNHY74orurdtgXA9FMud0cYGyCnm1uJZT86jneNeDwizx86eY6KTv4oe3N?=
 =?us-ascii?Q?Vy8qEWhMyvJdQAqIEn5Fxs8WjcsUHdo70X3unx5nxb2Ru1s3fhS1pJ0qISgL?=
 =?us-ascii?Q?Dbya0h6rapvA7bK8uTRtK1mp4XMRa0BBIcZoSqWt2veoTh/0ci8FoaklPEDv?=
 =?us-ascii?Q?fVhrA/irqme2oeqDBzy+CjNbS1k3j8HJpe/rTpqeLVGRqciCJl+dcXPyxnCy?=
 =?us-ascii?Q?7SKYHy51R1rcpr0mfLc+y+AJ/v1uxU8KZKJ6Lsgexi4u+U0+nJMGuM4qOGxR?=
 =?us-ascii?Q?QEzKpj0F3C/JYvrHoSTVeJEBojSJ0LhvkW3I4dSlhjL+b5ia334W9zzf99D2?=
 =?us-ascii?Q?Bd16350XgCDlFGMxPuI9vv0sFMD+EAJwFZim0bVQbxLD5LP+vhFt/l9uL8QS?=
 =?us-ascii?Q?kX3AxOSuyijXUla2MGH4ryMAIV6ASvjn0hMg7Rc0hZ2WNFHDfrWmf7dCGFRt?=
 =?us-ascii?Q?MX57h34TsYNcAhJvc7Ge1OFYwcg2leoRdXi9ovddb6kW8zKIUPMDq8v64wEN?=
 =?us-ascii?Q?mib34gwnB8Y8A6mME4FalR3FsDwHSO2g/rv/vmOkQokcHq20ghGeuqhkuqBx?=
 =?us-ascii?Q?GgPc/42hgcz2Wdq+xEpd+eOMTOyOFrBjcQx4H07dSDzypNri28/aCnbqsy7w?=
 =?us-ascii?Q?TqI5VAMd0cGsv+OWL18mcHZz2/Gnt4kOMAhxLJM7YSoH0F/4LnMZ1D6c/BrX?=
 =?us-ascii?Q?jhPfU4tWbruPwZiQDJokvgVVNKIKzGdXx9qEVWmDUsfZzJTKL8U+diMczfEW?=
 =?us-ascii?Q?NjsWwYeD2aeZziS6ezLdtbV7QrBROPt9NdfZjxKGcKa3sIS8SMMZySL7zJTV?=
 =?us-ascii?Q?w7vjj+VqWPQvVZrGR6emyfJtCBh5S+HU38t57Tqe1KnTvPORpSIgwGHmz98W?=
 =?us-ascii?Q?0StgyT85KxwOr6I9AQpyGo0huLbik9EHTMxGnn38LM4br64W146WL6exsz62?=
 =?us-ascii?Q?KrBlyaFvWX+NyosSWhOdnNfn7cpGzFMwuuVmG+RNNJGxrHNK2CjrgeeWH5Bd?=
 =?us-ascii?Q?v8N99qhIOR8L/8q40u77WrjO2HLOFRJlepS9wokdklSOKSid230tHKJYIgGy?=
 =?us-ascii?Q?pJockdoouliS8DeEVOVr3s93Wr+ABZ0RyqcaK/vVDg2JK+dTidxrgtMUL/gZ?=
 =?us-ascii?Q?TWDD9Dw0zzVKNMGpg2O/kJY5JDTgvzLKf5qLluGqdnQBARrL6+kR7udHRAI/?=
 =?us-ascii?Q?FKHcbb4m2gV4AAosAtvXmkUUywgLF2eVBh2d72v2FTWCd3jYgYylioICmire?=
 =?us-ascii?Q?1itLuRx79+oc54C4zyv2MUyDDatf/TNmEpVLN5SyDSQFkdYMl86LH7SIBW06?=
 =?us-ascii?Q?rw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e7950c-51a8-458b-a233-08de059e80fa
X-MS-Exchange-CrossTenant-AuthSource: CY4PR03MB3382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 12:39:06.3033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z03Z3MfPj/3+ppNq+l/aZNnZPnVwsa9YSYyUBm4HlpYQREk+fMpVHJm0gxjlq9PHsfuc2x7qYCl15Mjv7Sabocu/NQ5rrkC0sm4u24eQvvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8022

Newer compiler can put some constant strings inside constant
sections (.rodata.cstXX) instead of string sections (.rodata.str1.XX).
This causes the produced live patch to not apply when such
strings are produced.
So treat the constant sections as string ones.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 create-diff-object.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/create-diff-object.c b/create-diff-object.c
index 7e6138b..8104017 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1441,16 +1441,24 @@ static bool is_number(const char *s)
  * or .rodata.str1.[0-9]+ (older versions of GCC)
  * For the new format we only include the needed strings sections.
  * For the old format all string sections are always included.
+ * We also treat constant sections .rodata.cst[0-9]+ as string
+ * sections as newer compilers put some strings on them.
  */
 static bool is_rodata_str_section(const char *name)
 {
 #define GCC_5_SECTION_NAME ".rodata.str1."
 #define GCC_6_SECTION_NAME ".str1."
+#define GCC_CONSTANT_SECTION_NAME ".rodata.cst"
 	const char *s;
 
 	if (strncmp(name, ".rodata.", 8))
 		return false;
 
+	/* Check if name matches ".rodata.cst[0-9]+" */
+	if (!strncmp(name, GCC_CONSTANT_SECTION_NAME,
+		     strlen(GCC_CONSTANT_SECTION_NAME)))
+		return is_number(name + strlen(GCC_CONSTANT_SECTION_NAME));
+
 	/* Check if name matches ".rodata.str1.[0-9]+" */
 	if (!strncmp(name, GCC_5_SECTION_NAME, strlen(GCC_5_SECTION_NAME)))
 		return is_number(name + strlen(GCC_5_SECTION_NAME));
@@ -1462,6 +1470,7 @@ static bool is_rodata_str_section(const char *name)
 	return is_number(s + strlen(GCC_6_SECTION_NAME));
 #undef GCC_5_SECTION_NAME
 #undef GCC_6_SECTION_NAME
+#undef GCC_CONSTANT_SECTION_NAME
 }
 
 static void kpatch_include_standard_elements(struct kpatch_elf *kelf)
-- 
2.51.0


