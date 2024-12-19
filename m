Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B459F7A4F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 12:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861108.1273096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEd1-000817-Cc; Thu, 19 Dec 2024 11:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861108.1273096; Thu, 19 Dec 2024 11:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEd1-0007yd-A0; Thu, 19 Dec 2024 11:23:39 +0000
Received: by outflank-mailman (input) for mailman id 861108;
 Thu, 19 Dec 2024 11:23:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vR1G=TM=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tOEd0-0007yX-0t
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 11:23:38 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af7940d9-bdfb-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 12:23:35 +0100 (CET)
Received: from PA4SPRMB0023.eurprd04.prod.outlook.com (2603:10a6:102:268::8)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 11:23:33 +0000
Received: from PA4SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::fd16:4665:bad7:33ce]) by PA4SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::fd16:4665:bad7:33ce%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 11:23:32 +0000
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
X-Inumbo-ID: af7940d9-bdfb-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORhnqPVO5omPS9RZPbxSZB6JbseKltWhonR8uS8KSzhIF5BdH965/E8HUa8OVPChnv17Ea7DAz6kfsGAufazfV1EpghmWheu/x43eutCSIU3+h0hxScgZQkfs6mNO892iv/HWpLSj3r4fycArEKOzUlclj4330SUO2p4FuX+TAVtoXirqPNFvmHWjnv0S/hPwjMsZfC3dXU+yFVXwAWUCtHhFhdqjHRAkHg4te0POToKIwcYSuGOfHrl8x3HWY9wowgIcOsxLZZpOgdy+O0z5LjPUwaknnDUwbkb1QwYldqzSnmleqNj4m+Kn5PdD03oAZiF6VuEj8veMD+HtkRlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SF+E4oIztAo8DI6G23YZJyRkJ1MuJiwBlLoguKFGeE=;
 b=MWaxKjirP5KMRvguk2+GETFyjzbEFHNwZ0gF8OSEZKm/1iKfdJLxk2iDElaGQvtb3iH6kvA5j2pNCGbO5HBJ3dg81pV8Mfm2FQkH6Bj09d7mmtgbjNYonMVttKmxBzrS0nS8Bol0A/t5wr7cCPvzwpRLoimztoBbgXvqYiVCiq5nob/D0t+ScEr8VaRELk643DaiT6/YVX3yjNg7r5duZBcGx9HFxThylD6Ngolo4ofMON4ks7SEVhqJWr2pS1+L6aMEXijtYEzffL6zA+xMbEjnJH3KcNcgQIzO6iVOe5zMa2dFnnYD6fHYhH0SWO9/bX+oq3I8hVQnl3ivmzi4XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SF+E4oIztAo8DI6G23YZJyRkJ1MuJiwBlLoguKFGeE=;
 b=wC5qlVhhZoiUtxR3h/S81JnEz8qdT7oQQCidPTpm1zIJR1RxuezgzcAHp1cCR5fk9o5ImlKUQw4IoedtSCYC1Cg5Wm1h1KB+piNoiihvWsAB8/yyNwhyVX3SuHvn82tqdcuANLxstvniro9IrW/h5tPSh4+g5W3gUIgNhioSApj2raxB4QTMn8Wfo1Ue3cM4ubf1I08SNw5BWbsBPGvO0snK3/5aW3Y2+TiBvmyxddmtmHhxPMQIsEn+4h6k+Wd8fXj+dhFaK5i9BL7d5sVRFuo7TIazIQh3sDRx3GLaTLId6IJUnnKinxQZO0qKOWOHaDyuwQJSKPw5hRnXdYnC4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: S32@nxp.com,
	andrei.cherechesu@oss.nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 0/6] xen/arm: Add support for S32CC platforms and LINFlexD UART
Date: Thu, 19 Dec 2024 13:23:09 +0200
Message-ID: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:208:1::16) To PA4SPRMB0023.eurprd04.prod.outlook.com
 (2603:10a6:102:268::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4SPRMB0023:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b5fec7-ec94-4f4d-e63f-08dd201f9235
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VtFtU5nOcbquqNYV0JbF6RfvrxRgj3HmN47iJ+bk1kDJOJrCmwmveQwYsuJ4?=
 =?us-ascii?Q?NmrvvNRtmERcYKlXWEPpbxEHaU8lpO1Y6whs9a4dwx95NnlMuIBRAenpkLGV?=
 =?us-ascii?Q?Cpoz2Agsi2HC8gXExLws918pEaHLM6Q6m+WisJVilG6fJAy0/nWxh5L9DGpA?=
 =?us-ascii?Q?yWyVnYGhm66Ve6NOGd+kSt8MO3j5Gz+J1LCOigaTV64dUFjZ2jGtsX3cXmFQ?=
 =?us-ascii?Q?/UafmogewGKjHL2M8RRqrIaO9WBB+8dJoEeg9OKy1pbfwTigzvtsh3v/9Pbw?=
 =?us-ascii?Q?wOd8jMX1FUY56T3KPsCBKWsBGqbhRShq4UA0QdvbjHFJcU8+ySg8JzsBw7Gu?=
 =?us-ascii?Q?qDxMDgPVzZ/58K8l4VTzofhnU1CxWy1ABsnR+01xl7rft5TY1212c7bNm1V0?=
 =?us-ascii?Q?j5mFs+cX+tQl09ISU6Rp40+lUyeWWjUpJPdV9pDSLchPSqbK6o4f8Ax+xFHR?=
 =?us-ascii?Q?Ycjyvyh/3qnyDJiv8wZvDo5vt7fHYVzHV863cZZ67tq8B1HZQYpHdhKgk7mo?=
 =?us-ascii?Q?7PcVf6JmDlScE15xryttaiKnvODjrGhD96r4L/72nMwJXRhm7YsBel8qMTpX?=
 =?us-ascii?Q?6rCtX72fU2xuxpmMrIm3GujvI/QcQuTX3EfhDiGryBazNpjQLCQSj9WLvqd3?=
 =?us-ascii?Q?dNl185FfFFjeLxXmjfyT3vl5bjFDCzT4wOl4dH0DQx9MEM6bXUrLYMwLNvmZ?=
 =?us-ascii?Q?sPfwoyEuYv/+sOoqT4efcuKQqW3xTUbGjGvSaMXuZN1ImhGAIOJS8j7l09Gw?=
 =?us-ascii?Q?vY1oaqzFXPto3SQvNpHYvG632bYj59uqRfx3P2Hgnr78vBIR6DbfaMRmVRUe?=
 =?us-ascii?Q?iIMBdBkKmKWjF0TcNfLcyDCfOs2QWwUPxmXAKSQ6Z4aTgSGr3bK+l3srYl9n?=
 =?us-ascii?Q?qtLc21L820LGJBTNJ2O5SFBr7dtz384UDClp5mTg+mcVBXwXyAp17FWfIyqu?=
 =?us-ascii?Q?0XCCIXQY0KB/plCfdOJpGOoY+7fhgvAHJEKCe0jxODopsDnuXjGH6AAwz2Nk?=
 =?us-ascii?Q?X9YxaTXITc3ftoTivWlzONUE6VIMLsvzwEx7vq9tflE/7JGoQDfq8x+9ja0A?=
 =?us-ascii?Q?GEqd/hnIBRk1eM6WGCgsq9QGl9j+MwQQVaFoLQhvXHOhBiwbk1UgHcu+vTd6?=
 =?us-ascii?Q?nqRL/NKaF8KRGEnKrPgR6jtZRab0ScxcoyL6wzusbnqwsnDJ9pWATAr1q2Do?=
 =?us-ascii?Q?OH5jJiWkZ0dlXvLyZDqCXeD0KHyZrd+tl3sO+i7sFCdYoUamKzawHKluB9YY?=
 =?us-ascii?Q?o9HUNuUuLDr4fULhn1mDTfoyvYo67lbmmMV8A9QVQjF0etUSUMxlpO00Ps49?=
 =?us-ascii?Q?UTiPZAz0jm5TP+HtPV8yzrXnW07SfB2xT7LbX/9+W9upA3fNppssLh5QPXP9?=
 =?us-ascii?Q?JhrQZjXUZQFEutOPsdZVT01+92GZW7oGY8pdFXO+vZ33GWhz8Fx1xyOUd0V/?=
 =?us-ascii?Q?sMOvowaefjgtnxvq+W7jEMk/lh+rKQXa9pjs0e88fLh+xixiqp0Vrg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4SPRMB0023.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J5jc2O/4upH09F9sGFZxLiTn1+n6mPoU4Hwfks6Ivzp5WDGFLC/KgocATvwq?=
 =?us-ascii?Q?Bj3oMkZ7CULpA341pVIHwfA0/05xlk0xnFRGQut+vKP3O6e1DVXZkiOLqyNv?=
 =?us-ascii?Q?2kXfIyVgmtszvrG1j5nUqoo3ScARWtYVmkcZGFKS3/IkfthBPE91YNgQPz96?=
 =?us-ascii?Q?G98xTp/p9P0pEWXFbFnF02J+dGyz403YxBPgYaDiRVfgxAXjeSBjwHigpVxD?=
 =?us-ascii?Q?gsDCniUVReJJrFoBWm5iNzR8P5zZPETXEXmdWHXxjPQk9ICpdxV8Xm9IwNZW?=
 =?us-ascii?Q?DriHA4pa9AeRm+aowN/NpKAqqx+S4Db4Ls8ohnP7WcoOlNZYXXOuBZiqP0kk?=
 =?us-ascii?Q?8lj+6mSa+ttZ2bi68gbLWnR1niUXdXruZkkHskM2b6jBOXMQ3MUS7DuQnh92?=
 =?us-ascii?Q?JM21LH79OINvpRY8cCD5uV58DlWi9OCHAZ3uXO4/Z1+Rag+//+y+A368YhQY?=
 =?us-ascii?Q?mGk05q5YCJa+O6/aVryaHDp/50br3Rv4sdl9TItQBKFO9Tefmt1RojurxszU?=
 =?us-ascii?Q?HgImNcKMjY4Q1ozaIxdguYcCEsswy2sI6S3DyeSO+1Bt4iWHWYDHWJkpUft7?=
 =?us-ascii?Q?mxO5WnXlQzaBy+BNNBArZi2S7+PjhWAI31f6bPqPsSQr47ofR1mDWXIS2s6s?=
 =?us-ascii?Q?LGfcQI166PCq1Hgf9JiDvLknDz1V1VhBbo0oE5xhTh3N2509Jzg2aYM9T88t?=
 =?us-ascii?Q?k21hfTRhHKI3DP2E8XmuS1VoCVF/YctUuKQSbwisVK1QRMPFdYpqyasG6Fhi?=
 =?us-ascii?Q?d5ypYJ1CIS6rJx3pFmVbjwQkO2MGglbjahnS8tSOGXOzIYleAQdH0PxrLh/V?=
 =?us-ascii?Q?z4iU+/EC53cYDRrfbl51y7l6Y56Xz5DZkpwlxMLELSWVi9iGQ3u8bSazShhv?=
 =?us-ascii?Q?CzbfRmNUztECr5UNmVCFo3dR9LM3LMggPO/80km5tUcPEN2DDpYig9zNMj9g?=
 =?us-ascii?Q?3HEISIM36RCyYlXAB4PkcsHsG1jlzN4c6bvKfuCC2O34tzEun91KBCb2tkwl?=
 =?us-ascii?Q?JIKfhnvZIrVUXV9y/1yuwwJ88zt8vfjm9OE5v7HUWFff/mMB+etN2rWVbaee?=
 =?us-ascii?Q?w6ZMV6FIxM9FSsdIaLPBIXzXxfjax3wSYFLdGERmT6/s6DykCafysYHx4F6x?=
 =?us-ascii?Q?AAmJEsc8J0CGnn1AE40kq0ffLiqnywET4Q2ewojH5XhOLHCSHJp8dGd3jomp?=
 =?us-ascii?Q?kgFh/4Jwb9Uhfuewe8qSwjtaskNNpD4YDMhf6UhBzPeDWzF2a5Kr/xB++kiZ?=
 =?us-ascii?Q?vjHMw6oRvG3G1siIUiatDI6Owg2WuqQI6AR2PjTYXskxbO2s24yPfFbqoi8I?=
 =?us-ascii?Q?NLyFwMN6okGTB0V52TUS83CytCGjbupFtVWiKbMdEGMAzZFkIz6IH0uihHP5?=
 =?us-ascii?Q?GXBascsslX9XD1xA0e9xXJNyOOh2USu/Z+NcOHaRZdrwJWaLuFrEm1qj4aHx?=
 =?us-ascii?Q?Rvgz9fVNJWOkvAta9xevAaSfFwgIPGIPy+cdI8dGt/HNF/rUdXpCDrfymksh?=
 =?us-ascii?Q?gDNGDT7Wm2EJ1oE8XbHcdi1gy/+ltOOPbdlHaK1C9TXNNu/0DLmRj+NYxNb2?=
 =?us-ascii?Q?Wlx+frokrQbZpTRj7ZfW2+LYfdb+r7+ErzqabRYYsmJMK4fQ2UN2X8ypA73q?=
 =?us-ascii?Q?HQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b5fec7-ec94-4f4d-e63f-08dd201f9235
X-MS-Exchange-CrossTenant-AuthSource: PA4SPRMB0023.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 11:23:32.8993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qptugAHk+ht0b3SioQzrX0wK95CmmB+iTpGQmFmRleF97oIWcU9n5tN9vj7OS3D00CIyGOmT9kZ+W6NnCpBSAJOkFuCRJmR6d+5Gr54LAHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Targeting: Xen 4.20
This v4 version of this patch series finishes the work left to support NXP
S32G3 Processors [0], part of the NXP S32CC Family. The LINFlexD UART support
patches have been merged in v2. Platforms using S32G3 Processors are not
affected by the TLBI by VA erratum (discussed in v2), and are security
supported without a workaround needed in Xen or guests. The workaround needed
for S32G2 [1] / S32R45 [2] will be addressed in future series.

The 1st patch introduces a generic mechanism for forwarding SCMI
over SMC calls to firmware running at EL3, selected via
CONFIG_SCMI_SMC. The 2nd patch refactors the SiP SMC handling in
vSMC mechanism, to rely firstly on `platform_smc()` if implemented,
then on the previously introduced generic SCMI handling/forwarding
mechanism.

The 3rd patch adds S32G3 platform config to enable the required drivers for
S32G3-based platforms.

The 4th, 5th and 6th patches modify the CHANGELOG.md, SUPPORT.md
and MAINTAINERS files, respectively, to add mentions about LINFlexD
UART support, S32G3 Processors support, and the new SCMI-SMC layer
introduced.

[0] https://www.nxp.com/products/S32G3
[1] https://www.nxp.com/products/S32G2
[2] https://www.nxp.com/products/S32R45

v3->v4:
  - SCMI-SMC handling layer (Patch [v4,1/6]):
    - Changed license for scmi-smc.c and scmi-smc.h to GPLv2-only
    - Renamed `scmi_support` bool variable to `scmi_enabled`
    - Dropped `scmi_is_enabled()` public function. Driver's internal state is
      now managed internally and based on `scmi_enabled` var. The public
      stub `scmi_handle_smc()` checks first `scmi_enabled`, instead of letting
      callers do this work.
    - Dropped include statement for <asm/regs.h>, replaced with forward
      declaration for `struct cpu_user_regs`
    - Addressed indentation issue for `err` label
    - Changed the `gprintk` from `scmi_handle_smc()` to `gdprintk`, and dropped
      redundant info in the print statement.
  - Handling SiP as SCMI SMC (Patch [v4,2/6]):
    - Dropped usage of `scmi_is_enabled()` since SCMI-SMC driver state is now
      managed internally

v2->v3:
  - linflex-uart (Patch [v2,1/8] and [v2,2/8], now dropped):
    - Patches merged in v2, no longer re-submitted
  - SCMI-SMC handling layer (Patch [v2,3/8], now [v3,1/6]):
    - Changed occurrences of calls coming from "Dom0", to "hwdom" or "hardware
      domain"
    - Made initialization part of initcall chain instead of presmp_initcall
    - Changed occurrences related to "Dom0 DT", to "Host DT"
    - Made `scmi_support` and `scmi_smc_id` variables __ro_after_init
    - Used `current->domain` to print domain ID (with `%pd` formatter)
    - Dropped usage of local string var `smc_id_prop` to store "arm,smc-id"
    - Added usage of XENLOG_* levels to all prints
    - Changed print in `scmi_check_smccc_ver()` to XENLOG_WARNING
    - If `scmi_check_smccc_ver()` fails, initialization fails silently (only
      printing a warning regarding no SMCCC support) since it's optional
    - Made `scmi_is_valid_smc_id()` private to the driver and used it in
      `scmi_handle_smc()` instead of requiring usage by its callers
    - Created a 'firmware' folder in xen/arch/arm, to store the SCMI related
      code, and moved the SCMI-SMC layer implementation there
  - Handling SiP as SCMI SMC (Patch [v2,4/8] now [v3,2/6]):
    - Dropped implementation-specific details in commit message and code
      comments
  - S32G3 platform config (Patch [v2,5/8] now [v3,3/6]):
    - As motivated at the beginning of this cover letter, changed the config
      name and description from S32CC to S32G3
    - Dropped the `s32cc.c` dummy platform code and the CONFIG_S32CC_PLATFORM
      used to enable its compilation
    - Dropped Stefano's "Reviewed-by", since patch had non-trivial changes.
      Please re-approve.
  - CHANGELOG.md (Patch [v2,6/8] now [v3,4/6]):
    - Changed 'dom0' to 'hwdom'
    - Changed S32CC to S32G3, as motivated at the beginning of the cover letter
    - Rephrased to drop the 'Add' word since the entries are already part of
      the 'Added' category
    - Dropped Stefano's and Oleksii's "Acked-by", since patch had non-trivial
      changes. Please re-approve.
  - SUPPORT.md (Patch [v2,7/8] now [v3,5/6]):
    - Changed 'dom0' to 'hwdom'
    - Changed 'Dom0 DT' to 'Host DT'
  - MAINTAINERS (Patch [v2,8/8] now [v3,6/6]):
    - Dropped `linflex-uart.c` driver from ARM Architecture list
    - Dropped `s32cc.c` platform file since it's been dropped from Patch
      [v3,3/6]
    - Changed S32CC to S32G3, as motivated at the beginning of the cover letter
    - Dropped Stefano's "Acked-by", since patch had non-trivial changes. Please
      re-approve.

v1->v2:
  - linflex-uart: 
    - Addressed coding style comments from Julien:
      - spaces vs. tabs
      - indentation
      - license issue
      - comments format
      - code reusage
      - misplaced loop exit
    - Made the pointer to struct linflex_uart const in most functions
    since it's not modified
    - Added support for customizable baud rate through console options,
    parsing what Xen gets in its bootargs. other parameters following
    <baud> are discarded for the moment.
  - SCMI SMC handling:
    - Added a generic `scmi-smc` layer (enabled by CONFIG_SCMI_SMC)
    to enable forwarding SCMI requests over SMC to EL3 FW if issued
    by Dom0. If the SCMI firmware node is not found in Dom0's DT during
    initialization, it fails silently as it's not mandatory.
    - Changed the handling for SiP SMCs in vsmc.c to firstly try
    the `platform_smc()` callback if implemented, then try to
    handle the SiP SMC as SCMI if enabled and SMC ID matches.
  - S32CC Platform support:
    - Added dependency on CONFIG_SCMI_SMC
    - Removed the S32CC platform-specific forwarding to EL3 mechanism.
    - Dropped unused headers
  - CHANGELOG.md:
    - Added mentions about S32CC support and SCMI-SMC layer.
  - SUPPORT.md:
    - Added SCMI over SMC forwarding to EL3 feature for Arm as supported.
  - MAINTAINERS:
    - Added myself as maintainer for S32CC platforms and NXP S32 Linux Team
    as reviewer list.

Andrei Cherechesu (6):
  xen/arm: firmware: Add SCMI over SMC calls handling layer
  xen/arm: vsmc: Enable handling SiP-owned SCMI SMC calls
  xen/arm: platforms: Add NXP S32G3 Processors config
  CHANGELOG.md: Add NXP S32G3 and SCMI-SMC layer support mentions
  SUPPORT.md: Describe SCMI-SMC layer feature
  MAINTAINERS: Add myself as maintainer for NXP S32G3

 CHANGELOG.md                                 |   3 +
 MAINTAINERS                                  |   6 +
 SUPPORT.md                                   |   8 +
 xen/arch/arm/Kconfig                         |   2 +
 xen/arch/arm/Makefile                        |   1 +
 xen/arch/arm/firmware/Kconfig                |  13 ++
 xen/arch/arm/firmware/Makefile               |   1 +
 xen/arch/arm/firmware/scmi-smc.c             | 162 +++++++++++++++++++
 xen/arch/arm/include/asm/firmware/scmi-smc.h |  41 +++++
 xen/arch/arm/platforms/Kconfig               |   8 +
 xen/arch/arm/vsmc.c                          |  13 +-
 11 files changed, 257 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/firmware/Kconfig
 create mode 100644 xen/arch/arm/firmware/Makefile
 create mode 100644 xen/arch/arm/firmware/scmi-smc.c
 create mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

-- 
2.45.2


