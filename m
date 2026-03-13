Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EI3FBk49tGmDjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59CE287288
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254026.1550031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Vt-0007Kl-HL; Fri, 13 Mar 2026 16:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254026.1550031; Fri, 13 Mar 2026 16:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Vt-0007IC-7V; Fri, 13 Mar 2026 16:37:25 +0000
Received: by outflank-mailman (input) for mailman id 1254026;
 Fri, 13 Mar 2026 16:37:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc6w=BN=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w15Vg-00040A-VV
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:37:12 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1601c20-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:37:11 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH3PR03MB7412.namprd03.prod.outlook.com (2603:10b6:610:198::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Fri, 13 Mar
 2026 16:36:44 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 16:37:03 +0000
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
X-Inumbo-ID: e1601c20-1efa-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HujcbZVQlkiQ4pwQH9DE3gv7KcvxEatO3ZsNp5wda7TkwrnF2g0b3zZQZdd236NU9uhzu2rsY9k/51PSNyaPppVcCERJYDAyfp1ZX9bTMg2N1o4nFjBQc8aQRYxaioKTBfXfn0ugeuFFy4qiN1vWfbzhk1zoqwpf0HsBlvZ/FyTAs7hc1ycr1bOht/hNsYSfUd2ZjmKQFJInFczJZzZBVm9OA2kxRapOXTWeLvBE2YvDekq7jp3RE+VI7KHPPDnQMNueICna26cDOeM+JVMXVJadcTIv9wKw4tnwN78XJi5LqMK/klyN9iMtcqYfCuNcCDVsC6wh68BF8JBhxO6Qmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yd8n5uLy2YBtVrAJOKIpy1iVYTwPAmDskE+Dkrm1v1c=;
 b=wikCIBkDNBhVhrB7RBKFnsn46Z7d8wGbJwIEdN3SVb0Ky20hvsHnaNDDyBJTpfakcKQhXAj9dgxTNu+9Z7sDp5Ka8u0Dk8bLerFyJj8Z1pyuJHwcQ8fpvRtS0x2ZY5BSFMJ+3IJH9oWwLtfP3xLR/N9yZV6XTs0933+FnVDn60pj3cn9avqZjH1CyBbCtrU9++5Wx5gOuwshKcdRfWOt/41tFI2Y74oLRNmLKX2YX5f2qi56a9fFFq6h5DifFdtBvx1rxQdI+d7JvpQJzyAn1rXn4O1/UbTHpxZgTmbyGBWFr/lUyTdTEO3FWrKY+A2QwXS5BLHEfhf5S/asxIR6/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yd8n5uLy2YBtVrAJOKIpy1iVYTwPAmDskE+Dkrm1v1c=;
 b=dKNqnz7gi25nKxkUEYmQnstz9cowR53FGQ4Jgqsm52VaSeOncr+YWDm7xC6fxaHre5F9MZLqhy9P1Tuns0KfUDq/3cDrje8/15GnCqf0ExgbIi2xz2tXjOya0hEx4prZZg7hEBQG6JbvbTKojCZjdIZ/DwMdVJJfi9beG1094O0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v3 7/7] x86: Remove x86 prefixed names from cpuinfo
Date: Fri, 13 Mar 2026 16:36:30 +0000
Message-ID: <20260313163630.1073019-8-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260313163630.1073019-1-kevin.lampis@citrix.com>
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH3PR03MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c28bd30-667a-405d-a693-08de811ec1aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rlkNn/n0nqb/H9RqKcNWbEagWf83eRo8Hp8EO/d79NjWFxxfgRkaAbtHUuHB6nkjT+o+Afo2a9s5RSzSA92ukDCzzBSwZgEIGR9GXjkkdv8CXTemveS3yTzat6a7CwQ84DbkAHAUwKhFqpwZyVsEMmeEQ4HS958mHTstm1o+I/7yKAOxb/0aFjRa1ZCHZTh3vwYSuXPZxpF3nFUDx/KOsv/sPe6zkbOKYEPpCagaZqe7n+/RIt2uYsFFIiQ7ZYFoQzyEPWb5rebU+COhveKNH03ooIMxDTDxVug1P3+JpkD5ks8uol1A4DHP9s5c5GMYTgrVUbFKD/G/VRO+9oaY9B4REYEwjHun9ux72J12agwNsgEDPAwkHc2pKD2M9M9bVC5KnyHM+2N9DOyuy08U4iTAqowF/6m+zbt/C81d6rnhEUu2qRnS2FElAciKXVgNcMN2XDJbL09K0lt6PMXWUspq1HWMnV9s2Fst9VxXvOhk7kQ0aKQauuwPDAe/w+LHRhrxzkVgsnrs2ahbhVIvbuutsRm7sHVlynkn3anwzI6ORJF/p3GbN00AR98jJHSC+PVD5n+DzknqUm1uobVzEEzPbtdT2k7NBEpVzFZQ4FF29T2Ziv7FcbqCDOiVajZROeK8zp6XtTG4UAR1IdE2psXBOSOTo1uZWRUHTkFgl2H4bXs4AbTzp7hwtj2Dw6mK2oUJIczIJrYTuYlFXW7nCLRw3RE3Ngq5ZPeMHCbyPlE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fL5UP2X4258NefnzQ90Agk85sctdBd4LR9e0Nn6Z77eeBV+2LBLmtRAF68L7?=
 =?us-ascii?Q?VzsvIttNINBCWpGN+n9A7bSi4+70PkAhyWkcO10CTuXSbKvsaTF6Vmzb7RGZ?=
 =?us-ascii?Q?uLL+NiSAnlqK1ZUVjLETaHPFKntMK2QKOWl+/lgItuB0rdBKYmFwsnnHoeFW?=
 =?us-ascii?Q?O5k4TtjmYsUFrTnp5puE4OJsuG3tf2kzxgNr2mC5jqEVAcqz8zANcKsIqLxW?=
 =?us-ascii?Q?vDbpCCVOLCGRiKbf0EECbhxzsRHF7Re9xTNUvE9wyBpNpOxqfMIj+r8QgMPF?=
 =?us-ascii?Q?VUv6u/JcXu9OMVQ5nxOr1I1BOAm8LxZM/vOhUVDyyk1mQbgBceTVSlBjuAwR?=
 =?us-ascii?Q?VylJpmf6MXD6MFIvDIs3Vms/JfENN9z/iwMF/LXYPXlHsmeObA0kRPBxWtFV?=
 =?us-ascii?Q?sCUnovp5hK6q34hdxQKpx/EAqdpxriQiKMVnGIJ+EHR7sZp7VbumvLmB3ToA?=
 =?us-ascii?Q?fVHZ1gZO7Q2rJjhaOucTeDTLxLtKLyDsj/66lhxXBSAHnPOUa0fr+iF6wOxv?=
 =?us-ascii?Q?dusbWccNNE/RGjuUskfnvS6bOXkwoNK0rGBsbaQUadsersk7x+eMGZl5ICCB?=
 =?us-ascii?Q?wfM/azeMVDtKTaEFblilzyWjDsoymezcy+Z3/hEmLHKkQaz2UOaYEfu5mG6v?=
 =?us-ascii?Q?3rO3pmh8dsGk0uLtkS9KM4VFg/YROWBLXKcAQYLdkupj+qNJXx+KlZsO+2Wx?=
 =?us-ascii?Q?no4uqfaB4p7bWpiTETMKapPXilaXz2sXV1Ej+ZrTecWXVV+2ML6FtLJdQmnQ?=
 =?us-ascii?Q?N5r+gOyzP2v7Qkm6huoMeQW/x4w93H7dmKhNddOoZ0HLAW3Y6/epxxWpYItt?=
 =?us-ascii?Q?6gqWIRGiADK6++8TP9a18M5QY39lOMwGTpJXCDAb33sauWMyrYyChsyJjvk2?=
 =?us-ascii?Q?mNtqRjp0orPZB+tqix2QMz/2at4JNXzDm17dO0aBak1T06UxlYdi0bErgGdG?=
 =?us-ascii?Q?wUyK/RNZ3aFdBhoPujkmTNhX9LAGy7VvOvukbrlLU4nk7xImKROtMLucw6Zw?=
 =?us-ascii?Q?J6IdeGu8fMnF+3BULxxkgbtfrfPhKO5r2unxEMl+kkPjFIj68nmosVMf1bfb?=
 =?us-ascii?Q?1o1tHq31rIxQDiEfniOVZ4GWyYcHMYOJFtDZ+bb1qzj4qJ6/VCnmD1PjxMdx?=
 =?us-ascii?Q?h7CT8rzzQw5GjodJjvKWMfwdt5Yv6x89lerVrSwqm17jgZ4Hom2CBtjw5WE0?=
 =?us-ascii?Q?czIBkEC3Y/dWimXZOM9MVzf2xJ1m5Fvps0zEbodGSS9DiDGeNNqWmoBoHqHF?=
 =?us-ascii?Q?bf099d46mROkIvwM9j0i3K9JIrsAQIF8H6Vta1rs0c9TqZU+4zLr2c5BbrcI?=
 =?us-ascii?Q?HpavBLAJGc40Pl+/Q8hy5b9KPB+8nXSGF7giJw3jLzXV5U8nOz+NxRii/Uvz?=
 =?us-ascii?Q?K2IGTvoOCDMysecn+MkijVSGhQcT4aBAnsxQYdx4MC1gQ83urLHtYE184Sue?=
 =?us-ascii?Q?uRs3kPkSp1Shtb+NuyDfYW3ti+CCRC96oc7LfKUkX3iOXQvDkOSjeDiyjwho?=
 =?us-ascii?Q?B1MBUlwy+j/pOvYDnC+5OfOVN5+bvLGQ5siL9UfiiAel1IIxrQ2ztXCUTIOl?=
 =?us-ascii?Q?zSwKuw7GSc9DauJOknXq7hzG3bxCRbczLJtAr0P97ivAYggZhi2/t50OaHo3?=
 =?us-ascii?Q?GC9EiWB4TfPisCF4DYJZX+2GWdP4P5p5DSIdF5hrc+YfL9ZX2ZtWt5dkCD5y?=
 =?us-ascii?Q?9LkacNYUdUkJHWhHcWTv1WU4UTi8oZFR/PfRYx0VttFBMWKYNoF6HNH5qIqX?=
 =?us-ascii?Q?T6bbJ5JPYQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c28bd30-667a-405d-a693-08de811ec1aa
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:37:03.2855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snsrs0O6E+0fUmQq6A90BcItMWtw4DnLvCq/Mm3OzAi+IfdzxPijcEBv79h+24l+N8WmLSKXKkDpzhEazudQyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7412
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C59CE287288
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Remove the unneeded unions

Changes in v3:
- No changes
---
 xen/arch/x86/include/asm/cpufeature.h | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index dcd223d84f..11661a114f 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -43,29 +43,16 @@
 #ifndef __ASSEMBLER__
 
 struct cpuinfo_x86 {
-    /* TODO: Phase out the x86 prefixed names. */
     union {
         struct {
-            union {
-                uint8_t x86_model;
-                uint8_t model;
-            };
-            union {
-                uint8_t x86;
-                uint8_t family;
-            };
-            union {
-                uint8_t x86_vendor;
-                uint8_t vendor;
-            };
+            uint8_t model;
+            uint8_t family;
+            uint8_t vendor;
             uint8_t _rsvd;             /* Use of this needs coordinating with VFM_MAKE() */
         };
         uint32_t vfm;                  /* Vendor Family Model */
     };
-    union {
-        uint8_t x86_mask;
-        uint8_t stepping;
-    };
+    uint8_t stepping;
 
     unsigned int cpuid_level;          /* Maximum supported CPUID level */
     unsigned int extended_cpuid_level; /* Maximum supported CPUID extended level */
-- 
2.51.1


