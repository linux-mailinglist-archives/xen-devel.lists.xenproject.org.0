Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A0898A10D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807256.1218636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsR-0001n2-J9; Mon, 30 Sep 2024 11:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807256.1218636; Mon, 30 Sep 2024 11:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsR-0001jl-Eh; Mon, 30 Sep 2024 11:47:43 +0000
Received: by outflank-mailman (input) for mailman id 807256;
 Mon, 30 Sep 2024 11:47:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=orP2=Q4=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1svEsP-0001MH-Nw
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:47:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2613::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbdacc01-7f21-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 13:47:40 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB8357.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 11:47:36 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 11:47:36 +0000
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
X-Inumbo-ID: cbdacc01-7f21-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1hdMh48Y52Zlv7dSK6yuA9zl4EL4p03eeX4jcmCIo3p8BvY36GaRmaPbowQVXxyszTWBRbCn6jPV9X7K78WZjr8E9V4rQtaVz+yOWuDdFjRZtVTlfLwrNl6BaxhLHvZs1C4x15tCj9e4BBNtibX4MuoIv+Q3zpfO7E2TTqMO2ny53YlhwN0nU6Rzthyn+aKR+gScfOfGfCyJSQcB28FDD5C3TOensnbb570hvMMnS6pOWiMNMOs68ftx28tMZ2/nZUSuC+S/5rGqBH8a3UXe4nv51G+nUDhzrzg2iAcM8SLH4vZy1M/7+fn3HyDHSHeL4yJMGyPWM6PD1XBNdyFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDUk5g7NendjaxUN9TFs53dKpySmOC0eSPjOxB+OIic=;
 b=b+dKMISonR3sDLeuWBA5Ey/qMGFD+EYXMDxZxEyCrjOE4RZ/VgM7EFO4UqeWi2d1ozize87IAPvV/93Ebng11mLn3Rm6FUlBziGV/6fGFFnPU/uHJZI2aaEps74gE3hCQK8ow7xn1cLVaJ+IbgW/zfVHAf8MGXopD2LmJZhfxZdVeyS+YlfO39mROHA0zSpacXfLfrdxXm4FQSxFxF8oEFTRzWb7SwnoY4G6eyIN3GGZsAOqEmj0T0YQomJMtT87G9asqGIoskASzU2y5EW+CSSxe13ToxA02LeFnD3pUjMStkoX/sz6zw7ljKSaKMbHjkxVPNS3CXHWNyIUR1bIsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDUk5g7NendjaxUN9TFs53dKpySmOC0eSPjOxB+OIic=;
 b=NVhsMy8aHXXiYATyoKkTOdXdy75j7C5PtFJcAyN+aas3aasJgzqFqIInB9yUtgaw2N8YMH+bDwIExFO22tpMKplmWw639Lz5/DvLoOwPczDGDT1kW30cN4YpF1jGOvc1e3TaJyKe8rctqW/IjiBUX1qvlnoUmcUuN0ZvNIuOC3xl/jTZ5Gj0qzSBXib2q0s4dm3zcIvGCQOUKvsVWV1gyFVehw8hsohQ4opQalnI54ViUJZk6WN90aVOD9TIrOtgEPYK5CNUtujbpaNBCamsLy0BZe0FhTfK6+xgw+b9vZtF4bAOq6em9lmYPgHAYav1VFn0D8pNlG/uQ9qbbelhIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: andrei.cherechesu@oss.nxp.com,
	S32@nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 6/8] CHANGELOG.md: Add NXP S32CC and SCMI-SMC layer support mentions
Date: Mon, 30 Sep 2024 14:47:12 +0300
Message-ID: <20240930114715.642978-7-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::26) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|AS8PR04MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: 7232ee7d-5e26-4c9e-a9f8-08dce145ade2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tJEGv8Y3j/lJJVphpPpl5NuzyRWiU31fl9IYgLbgLw+YGfUkU+QmJNqxWwcj?=
 =?us-ascii?Q?waWSCVw2aIhm6FYe6TUgBl8ZXAtjb1S1nL40NRM94+fOhYj4tY6P2GryPiX0?=
 =?us-ascii?Q?HBMwfbjBx/aazeYYW4sTuFStdgkbjmsG7mD9mgyH99GsZgdhTCIZOTdmPUE+?=
 =?us-ascii?Q?ib2WprHcLG1w0WMWH6Ht6oz6ORNfqbFB7mu0AhItg0pfv7AN0yu6w+RgX2tm?=
 =?us-ascii?Q?yT1CDXa5FSVKuQaEBwQnvmFeoLwoj4sCMR9cUTrpHMSQBPnJpojLafQeefUb?=
 =?us-ascii?Q?+VXjLqjDvUiP+ji6IXf5tdhHABdCCCR86+ys+0nYX6FD1SVN56CJerYEk/yA?=
 =?us-ascii?Q?riYUvLH+rLyfE9l0insKfqsqo0KgSfFwOc861bykTX5WtCqFgIbpZoy0tN0u?=
 =?us-ascii?Q?C6dy4iD54XaWH0w07QkaybGQMvcoTf72edkLevxwl57DdtXgH8AqrMN1XuxJ?=
 =?us-ascii?Q?9PkBJmp/DPehkO1otEyPpMWOhIXzAlioee68uHZ+/yopRmZohCVhW9IRs/PN?=
 =?us-ascii?Q?aWWQcq9uzU0L4Mnl4GJa9c3pvAPaS+41Nrx9dMjSgBe3G0LMdBGEcPuzWnZi?=
 =?us-ascii?Q?xG63PUJTR0fHexiZsSigvFzaj0EXoECOjzRNd1Wri8AVfU0ea0LM895IV6fM?=
 =?us-ascii?Q?0rdbc6IU3OTIKFl1Al4Jq8n3C4/ZC24U2TLOQDwyCrZM7rRg2SYQpnAEmwxE?=
 =?us-ascii?Q?6ssfExM/KEFlYAasAvPfZ11P8/sy4pIFj+15opPzled4GSV0zXC5JaOIex0a?=
 =?us-ascii?Q?YzhEPSraCkdByB5fSsg+xEI2/gDD/qdaPLYfjlHsaNv/lR3UVtGgEYePqV8/?=
 =?us-ascii?Q?4iK/cSvW8VyDvQoPJES+dfcoudk/APaKia5LCKGGphsS7Gq3PXXYPnaVZFYm?=
 =?us-ascii?Q?RA8+TvZLX+ZQuFnFeCZeWwKr/CEIItSNeR7HHkypcbKcKGt9ca0rCLev/2hn?=
 =?us-ascii?Q?DcU/bK+2SF1NfqFXMrq+P/MDKsIY3SuFMVTA8AXY06o4qwsAPA32v+54ZzTt?=
 =?us-ascii?Q?+wWPwVujoX/YJA9DJWVi5Qa6LhOO1AgO0hlCVPo4/z0UKtVBOKnX/BrfsYNe?=
 =?us-ascii?Q?GNfqHS5oqnNgMzTVfi3f4K/I1sUg2Ea2Trzca7pNq7e2MB9cKAmdB4AMmUPT?=
 =?us-ascii?Q?+ihCFQ2YldV/1SSSlkdt77ueDeZKCwSfxshZHKyn++AtdbJ1HXEY5HuDhdM7?=
 =?us-ascii?Q?5xJ+nkbtth0FMwxgIxXdL7uE0W21r/JjmINgOTUIqz2W2o8yHzJz3J7ah5Wz?=
 =?us-ascii?Q?8Fkb8ZQnpEwFDsRMZNfeTHW5ftARzocdbAwj5L/Ivg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YyF6OXU592xBQLU5qVmiGmYvITLjMwF4+dW17Nz9+G/UKyYCUjZvH6d/eq7O?=
 =?us-ascii?Q?pDOb/Oa3mBWW2HWxKOHFPJmYwDMPXXlez05bvhc8yieFmjI06CIypegahktk?=
 =?us-ascii?Q?glqY2CbFWi5HXPphqAKT5xSnWEnmrubOiJgT+G593iq1D859mCdwoT6/FpNN?=
 =?us-ascii?Q?Ph0EVfuG2R7e4V+2XgjvZzDQz7XNtorWMPADis8IWtqVtcPiI0wNsg0ChS5m?=
 =?us-ascii?Q?O/aYkA4pGCVuUVqKxxJQYR6XbXgJhgDDcM5kSPvwqDrP086eLafPaMqDPAi+?=
 =?us-ascii?Q?IzUEuQMjgyo0LSlU9m8qcKjrWDd+vgwgfsCnwdo6i1OOQa7TPtz9cAG3GCcq?=
 =?us-ascii?Q?26P6ek1yLNHEbnzpn+cDhYhleo28bvg0pysqLRH5F//Upt0gWuhgByicZ+dv?=
 =?us-ascii?Q?463YLUcYL8EZD924F9VFBN4Uxdk1QvN8OPFpNlccYNDMHbhjx9uWUkX6gRmP?=
 =?us-ascii?Q?hp+HaYbWSGNhGCl9QzprlYpwxw3l13yWW0EpnHIPTzoSt7Nk/yZk5x4PX3BG?=
 =?us-ascii?Q?Oe6DQX/psPlTBpxH2BhRAYfj5lORDMd/EShY7ofAAMVyJ2llmWfYnz5sIDXs?=
 =?us-ascii?Q?PLcAID8hp/6vfR8clnMQKWquKsiXXV/w61M0Df5lw9uAHpBJc37JB0Ku16G7?=
 =?us-ascii?Q?HNfxUQ3elk9mCiQYiex2zDvZAYmgzzCoF9A/MIYTydEBdBsrerrqlxrW45wh?=
 =?us-ascii?Q?y4qzWL/0IDF+MRAOcF3sUlJRmnIrJll31h+2y2g8F5+WzDZ5jZCYTCHVweCO?=
 =?us-ascii?Q?e3Do0FZwZxRREMiIz9AHGM0ALeLZB5e0YKTK2Vp/MgBpvvcJBDPW8ignK031?=
 =?us-ascii?Q?R+Li7vF5yucVd0+6etxDglQva5flDWopO9HPFf8VxDGXefbn4XXvSVr7lynT?=
 =?us-ascii?Q?QTKLR3uK0gWvd1vwXrOTX5NXrautT0/2QaRO12mI8XOv6b7YRxHnWo1Eiu8b?=
 =?us-ascii?Q?I/S9uHtO+vkfWsix0iCznQUApy8VW4pvcFfKWPcHc4hHdidKnYzJTpe0/emK?=
 =?us-ascii?Q?Qi2+Oq6nKsMvmkfEgjzelw35oTmesytBoP+pHbqltpxmwcfxMJiCcd4e0QSy?=
 =?us-ascii?Q?2R8hMZmvpjNbVR9g8sD2g6Zkd/eehSOQ+D6cavqN4UKbnDedr4Fexd2L+rPu?=
 =?us-ascii?Q?w9D6WY+DAJZP+Qmhw1mEegZXle8y6NoyKP2kDTUDG/E9EMnbeijwH1U2BMYc?=
 =?us-ascii?Q?NibNzW05ZHme4Vkf691XHxHRlWbAZ7inQq8dP47VsefhDJwJyW/0BpRFjROH?=
 =?us-ascii?Q?LhgCHybuJx0ACZ1mnK/HWk27gXQLcdML23MeARxcNyxD/u9BlQ3NMxVJsbH6?=
 =?us-ascii?Q?im72hF+M1SvK+u7t8dBsKmM61lLgbhfYKs9nh5cDfndtr/B36YL5aJGKgITi?=
 =?us-ascii?Q?1dPWdagV5uC767gNVJhEuM4KpjY72LYnUgMZ+QRLPOc85PIM8ndh0q+MvWyz?=
 =?us-ascii?Q?+jUuUiOUYUSVedVLfYAUqnN3c2+Jzg3r0g8hgouhZYqP4kpDaXmy4qkM5NPS?=
 =?us-ascii?Q?cW870S5DHUJ5KCXFNaU41SShhzxFCGkr2BPxtOM+aDwe/PaMTl4bqd76gTi+?=
 =?us-ascii?Q?VdvbnYAalEj5kyWkEFIiSzPctMS5RG+bQ5HUonuxXw6j/ridCX4MfNIxiUXH?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7232ee7d-5e26-4c9e-a9f8-08dce145ade2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 11:47:36.8007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5SVg2NqELSdA4RP+HgM86UfgevTzNk672iAXsGtNXXsdYaCroaGaKOSelLmc/N7xWq/s6CQvj8WHB43l41SstuZBDq0VGp32zwGCtRCCC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8357

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 CHANGELOG.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 26e7d8dd2a..66ea505843 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -11,6 +11,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
 
 ### Added
+  - On Arm:
+   - Add support for NXP S32CC platforms and NXP LINFlexD UART driver.
+   - Add basic handling for SCMI requests over SMC using Shared Memory,
+   by allowing forwarding the calls to EL3 FW if coming from Dom0.
 
 ### Removed
  - On x86:
-- 
2.45.2


