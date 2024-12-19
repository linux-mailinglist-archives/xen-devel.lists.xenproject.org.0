Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCDF9F7A4D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 12:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861113.1273137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEd7-0000Wl-91; Thu, 19 Dec 2024 11:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861113.1273137; Thu, 19 Dec 2024 11:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEd7-0000S5-43; Thu, 19 Dec 2024 11:23:45 +0000
Received: by outflank-mailman (input) for mailman id 861113;
 Thu, 19 Dec 2024 11:23:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vR1G=TM=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tOEd5-00089J-Qh
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 11:23:43 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2de0e23-bdfb-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 12:23:40 +0100 (CET)
Received: from PA4SPRMB0023.eurprd04.prod.outlook.com (2603:10a6:102:268::8)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 11:23:39 +0000
Received: from PA4SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::fd16:4665:bad7:33ce]) by PA4SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::fd16:4665:bad7:33ce%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 11:23:39 +0000
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
X-Inumbo-ID: b2de0e23-bdfb-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLZTV45yvFyoOeTMoSY/TRfQOLfVzIrfDqgCRDVZsNyfvs5bS9Mw2wdpV30/YlAtMseOEwlBVBjyHJ3tDUEbJV2bulcU0xA1rYEwhPyCCeyWASMvbn2JK7WyDnTQcXDjImN/XJ3NoXp0uxdlAreIdIL6VsUE2/2va1lgUo2re+YhHFuuuDWpNH3dxcZJKCtEqt2E018QTPjLrqJKRua25iV7jTNbHB6+kfJgMGc+AsJpg+nrOmk9/2WW2p/Q5HmUt0kjodd+i4YbA9AI5PCQtNiTVbdl0xK2P7ZgAjUt6rnNfEhGhWILOG06wxgFNgXxW10DWhzcdq+bnRKDtvFwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TE1ptO+swG0YleI2LOVgM8SYYL3IrYeRWVns++Tpy6o=;
 b=orhFQH/s1bNz6Mx7mV9Zy4wwQpIU2SY3lyN/pgXUkozN20fhGiUFCMWiSN8YlSIZLAO4X2O8zlzJg1fDr5W+QIhDAEHi3jqzqi+NOQ4BE2hBp4xYaYtMnhaOROL1iUNaK1K7Wl1GXgRdIc6LaTuaYzoMdAIp/11Qt853yaO4lbld24EDHuf9oiUrwUFaAhbqlKWSeuQJGzRkXskhsqwGE9t/IEIP8jAd93o3I5KADVwngNNXF3u3ZMpNRPTXIdqhHUfx3xP9CX0vkHh/Qv68Js/U0AKF7dPNiN8uiy6oEuEyEzQWVFmGaguGzVeHIXhxavmZFmcJT32G4QPHwKddqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TE1ptO+swG0YleI2LOVgM8SYYL3IrYeRWVns++Tpy6o=;
 b=Pg2bSNHF6ZCY/IOIfk1mVt56ifZAv0aB2Cvydd82UK43ETA1BZ3SKHZAWjhXbfkx+ZY2H3viVzUD13j0lDQ1MpVLHPxRHWPv+d8evZRYi4RU6cE0xOShO04vUeLKP/HzEQOZpRs5gaWrGWU3KF2XM37cDaWH09jKJBx5leed+8WNp9bd+61sMs+EAuzFvgsXkfNd3GJN1+lt76d9/l45IVSRQ3XhrNDQBS/+rZVFlllxbG9y3lM5xizx/5X3nUZFy3EmQcKM35gfnd49gtWjq1GzF9gEPVJzSgpaW6DIKq5XnqRr+1lzzd/HJs7nA5B8bgS6h3Dm2xzEb8r5AOAfOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: S32@nxp.com,
	andrei.cherechesu@oss.nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v4 6/6] MAINTAINERS: Add myself as maintainer for NXP S32G3
Date: Thu, 19 Dec 2024 13:23:15 +0200
Message-ID: <20241219112315.2461048-7-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
References: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:208:1::16) To PA4SPRMB0023.eurprd04.prod.outlook.com
 (2603:10a6:102:268::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4SPRMB0023:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: b608cb2a-591d-463d-9148-08dd201f9617
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BRMODXdnI4BtN/d2YjjS5js+PGDUEgq+pVLMwl5fr1HF1CQbgnKlR6cIoBH2?=
 =?us-ascii?Q?6TQ0QJldvvOz+MjIVGz0x8NvtibfNemjgVq+hi+K9+Y72DfF3fC13LtWG5a+?=
 =?us-ascii?Q?TBHb7e+ex0qbNdGAnjVw96W4VvZZ4Rgn0MhAHPnm0jlWnrt38ZXZ5rilb1Yg?=
 =?us-ascii?Q?pJS2b0kMUKzvuKqy5OpzaDoWHcca/STXyBGHrV0ba9N79VZSf7+nvWQrdAJq?=
 =?us-ascii?Q?BVeLZtWJJcJzAD08DcetyxyoD7jpk49hUEAUeXSiuyYOfKZoZEOn5Y5OEFbP?=
 =?us-ascii?Q?lawuuIit7V00VQkTw5HfPiKuMFpaSposgKuJYiOsvmZsPbwAW0zI9hLSevVy?=
 =?us-ascii?Q?a3ll46Vo7mZSAPr6s0TOscVuLfVGEajMX5RRgEzT7FaE6tHIE76SucpTlfhj?=
 =?us-ascii?Q?8WlJncWKkkeLMCXokc5jacugA5OvT5nZb99s+Z0Hp/6TTNNXU/yWT7sVWYbn?=
 =?us-ascii?Q?wM5vw97FTY3sx0mG2HhXJ2EE0FMXmGBBKUKFF1XEoF3HPVQjcAi2ii5/7h35?=
 =?us-ascii?Q?51IO/ijyfeNCMDrw0D/rLxfTjt2osIK9s0slKmqh5J+QnGOrAmetk2yE+U7i?=
 =?us-ascii?Q?G7EWYCmvPDIY4q1zX/RgDZmq9J24C3ZsSipghga3ywbQ48jSXdclhvX+SPJ0?=
 =?us-ascii?Q?xAtUc7diBUizCQgJghi3R3hqCi5ufVTkleiSZp6uk/3ng/YSGjnjS5UcizeW?=
 =?us-ascii?Q?NsaSnVASYDlMuF9+7VCaIoCLZ6bbhJP+nPySdMXVqoXfS/MAo3RmmdgpI9mn?=
 =?us-ascii?Q?a0/hHVHf86GhLtC5EIEIBat/Zyfs6hTyNNBK1M1VdXrt4Cc5eSIurkCyX9NL?=
 =?us-ascii?Q?GLExmUELtf7E/fQlbg01XSEAALlGfLlNkjuYAcHpiShEOTfLGaERV1kFkar6?=
 =?us-ascii?Q?wmNgunFxhm9Mn8ftFaqEGznF68c2y81Gd4X2ika9WZVNHhIrqqB2+8xrwrkc?=
 =?us-ascii?Q?FEy58DvortIT/eH+22FV3oUucZUNwQIxXhWqbSjS2rTmnpHTHzwoneJDyXmp?=
 =?us-ascii?Q?S7Sa776UV6nQXysZiGMkh7Bx6lpkWdkoXGnyRZBNUtIObkaHp31/bA1AYb/F?=
 =?us-ascii?Q?6rcOso7ySmDFTzWNLVptzYZLuTL9k8ex/YaVac7JCPGuabT1N5lMH2zQlp/H?=
 =?us-ascii?Q?FcGUKet1W5yfe0WwbuVIvX/Yq7IQR7sF1awAtl6WJUkW5Rn0SGr0ZTRbI/Y6?=
 =?us-ascii?Q?pFj//ne/kR7JHy9u0X8JFOJPVQMmQq8lNSO1/WfIKuaZOKQWmI/NsCN80zib?=
 =?us-ascii?Q?IaMEsojb0BE71cqK164557WiIDyLRLoaD+pIXaxXyOOXoYoBlOqFIGFHUrmt?=
 =?us-ascii?Q?OWYd8rOtRc2UU+g8owuTnFxWj/EDZCZ72d13go23tO43+SeV5y3zgrpM911A?=
 =?us-ascii?Q?eJcotmbX3L+6dUw9Xk3NSdIfEgXE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4SPRMB0023.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cb4/heK7pNLDlYdgT+zgvM5wQeCxsV29scc4s+4jxa2eDw1YfbyglR5Esu6J?=
 =?us-ascii?Q?vcOcIykQx1eP22JkPw/GAnGnEHXv/nDkONG73Rv+YBJu88x4OP3rOrUKy6Ms?=
 =?us-ascii?Q?j+Jam0Ht2LAfNp7xbVgW3oHSS9HZD+CfIdq8CmfuG8Rm1djOxRfCmQ1aTzc/?=
 =?us-ascii?Q?xEDLjECqgayBXQokOgIgv5qy7UVIqCGrfUiaxrKXNaLr4UhDnRvuDi7qSL7z?=
 =?us-ascii?Q?tT6gfK+tKHOfHP4PALj+ZmQ3Q8SovbRLCco+Y/ihyXojTdRli9jSM9oIgHiq?=
 =?us-ascii?Q?UvdvWSArHPICH5Clr9j+4EtxFamvSVmgV9/pACk2xAN/DHyFV53WH8PDkn92?=
 =?us-ascii?Q?cDZe22CXJi6833vjHuKUM4Sla3Ziof9z6yCuFXtbQANia0G/5yUEJepek0pm?=
 =?us-ascii?Q?JzsWeEyQixgOSIE5oLWqs7/0i5ufDoH+8i4AeSuS0pCNSwUPSdVFTvzwRMgL?=
 =?us-ascii?Q?TlbrhbrBxTtJy3nHvkMYtrFWqm4zgL4Kub8tW7wg3Iaf6A+REDf8Ttsk/p45?=
 =?us-ascii?Q?XN2YuOhESmA2X7iZov7t3uVW99R0LMo8g0pwrek4z+JhaGAeKbU7Qbxq3sMb?=
 =?us-ascii?Q?r/Rb9IOi6eCU+3ZNxbPC2DIsBMMB1om2fQ4Xd5P+shU0WmaBJa+kLpsiAQDS?=
 =?us-ascii?Q?oBtart/UcNT3BjPfAAOBZlErbTYqy5D/gyuLoTt3nQt9iyPcNubRF5Ta62hp?=
 =?us-ascii?Q?GbIQS8840mqmHDS6pALiFe1eh567UKBP5tyooYQeEZ6BWOLVObn59q9yQ+fH?=
 =?us-ascii?Q?szi5zI8g0LH6XbFuxgLOmHv9NAvxhLaCVFE13mEoC++vhHFU7KyRf0sGbICP?=
 =?us-ascii?Q?qCwVIPx5jgA3cDp2gd4tQ+6w74z1T5w45nzfAs67kPSCjpVlpEqsFkpImi5A?=
 =?us-ascii?Q?nw+vZhleT5YN8XNj4MHFRArIS95mZb3d1dXF78UALFr0eriRVVr3unSx1g4V?=
 =?us-ascii?Q?hUoZG9bQy1Z2baQSd1yqBJBGKZeITDL6XTDGpwG9wgohrWky9PvR5b9Rg4Gj?=
 =?us-ascii?Q?3Ky/IXsW5NggROd0eqt/iv9nX3vfVjFUAAUois009oPbT2rn6Np9Kww80UT1?=
 =?us-ascii?Q?FyM9iDhEZshqSz6sqMKF1UHJj09TbyxBwVhU+m62fp4IY2wTj6vY6GZO0pLY?=
 =?us-ascii?Q?MNsf2bif+DibBox0Sqg3fMkcwWHd9KjsBXtF7k8qEf7VUHHnlBG2+21vDKIo?=
 =?us-ascii?Q?tZwaVGY86K80J6FNLE0HIDW3zI/tO1gV07fUz+UvC7gk+ap/zXjgePZYbRNz?=
 =?us-ascii?Q?BmnAoZk7Bejuck5QFFhwONG21ezRBe1dsBafSgK6nGRWlOZtIgGDZb6NfCu3?=
 =?us-ascii?Q?qcYC6MsRTXpSgf9HwduV5uPddWcYzKq15VkTN9tNJAEf3uY9W/2HZaRowBEC?=
 =?us-ascii?Q?5x/6KG4eKkCre3MYDGJqJ7Y3QlenmpIH3IEUnYdr5UfC+JjTFaWcNRL9FjGa?=
 =?us-ascii?Q?w2xr/LfMyrCgssls9ehkbuWv89H6SQp9+tnKbhKJTxeFZuaBsSbIGOLmO3I9?=
 =?us-ascii?Q?m0vLbjw8X6pwJc08cViBRVcriBPQ+rOb4lwJahGL4ecSy2BPRgeBIeS38ACq?=
 =?us-ascii?Q?KM3SXseVZu5CTUcXYT6/u2Bw+G2ypQoh9kBsNwlb8dpTQVqTQWopK/n8Fkr9?=
 =?us-ascii?Q?iQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b608cb2a-591d-463d-9148-08dd201f9617
X-MS-Exchange-CrossTenant-AuthSource: PA4SPRMB0023.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 11:23:39.1998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8cA3hu3tsd2/NqqQen9Q0Uwgc4c1zeeLMQsQzb8g/h2tSItpWyEU8qILeUZAhabdHZLhRXzZvFsKsdBZN3KsMx6t8/bnq0rnxumfbclgUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Add myself as maintainer for NXP S32G3 SoCs Family,
and the S32 Linux Team as relevant reviewers list.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34ad49bc39..392f780f76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -426,6 +426,12 @@ L:	minios-devel@lists.xenproject.org
 T:	git https://xenbits.xenproject.org/git-http/mini-os.git
 F:	config/MiniOS.mk
 
+NXP S32G3 PROCESSORS FAMILY SUPPORT
+M:	Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
+L:	NXP S32 Linux Team <s32@nxp.com>
+F:	xen/arch/arm/include/asm/linflex-uart.h
+F:	xen/drivers/char/linflex-uart.c
+
 OCAML TOOLS
 M:	Christian Lindig <christian.lindig@citrix.com>
 M:	David Scott <dave@recoil.org>
-- 
2.45.2


