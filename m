Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BEF9F626D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:12:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860094.1272162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNr2h-0006E9-DB; Wed, 18 Dec 2024 10:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860094.1272162; Wed, 18 Dec 2024 10:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNr2h-0006Cu-8z; Wed, 18 Dec 2024 10:12:35 +0000
Received: by outflank-mailman (input) for mailman id 860094;
 Wed, 18 Dec 2024 10:12:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M/38=TL=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tNr2f-0006CD-Oh
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:12:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f403:2612::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97903345-bd28-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 11:12:31 +0100 (CET)
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com (2603:10a6:10:312::7)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 10:12:29 +0000
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f]) by DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:12:28 +0000
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
X-Inumbo-ID: 97903345-bd28-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PN+MqymSlI49WUPgqu0UMsf90iJWixxnV/TApLDkkAI+brhX7DuuNCZOyCBHK19VN56ja0kP0YBWx2P0jMt2U+jYdF7OYxtMrjGk+/4x0C15O/htICiAd6KbCBxpYJdkQ5R8GDIKMrblhJOHmmBwa+whydBcyMO7YRrHq67mkYILs7vjyFiXh6NgPDz8wmWcVEiP83r2yrDC0StQDd8h+1ptRVLngy3p73m7G0PGGoqjjDjzXem8yJgxgx2PkCq9v3pYOIWlIVXVEiBplDSd0poHE8BoJMUOruYn9QfaD4LS6pHLKePs7oy7YIG2sI/bEqHiXEVOYHpKBGm/4ih3tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVUhy4h/8vFnBvQQe+bcSOsEufOWVq0iIZoms1ECpf0=;
 b=H5X6781bZGqB7t5GnlSxRYKjUoPw/raAyp4HvHOokGmLQb+1YLmIxMdelVmc0HptQkZoK2JaZjKQos5hGCNYeQWeZ7r/6xpGvPuAIpt1qBaTcvZswWpj0w26dGe5PeHy4nRMWhKy/bJugoxnayR9aImKb2rhj7bgIiVVFcaU95kUfE/ITTfAJDava+u2BFArKCml+Znm34Lf2kRafoo8w4dJkkzrN5k0qDgf/okAQ3QKkzO9Hks4BU5IkK/eX66bhh/Y1yIj99x98sEdU0ylCz4l1cplvfEtlWYDrSFHIV1/jDha7IRpcgQptb/vp+spTqm6ABIqiU+enoMFzbNtzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVUhy4h/8vFnBvQQe+bcSOsEufOWVq0iIZoms1ECpf0=;
 b=Rz+qCCPjijjGKCBhnqbq1h8YNH03xMw5feJWtTdSuyLOT24iZfJObdSTGqqTglBAvnSuPmfTvSVf7V+R7gQv+0qkMusnMmtu5akdko83F6yHGnzcbHOqKU2gUSPEz3yv3eq5Fk+58SWCzyVwVP+khTJr566HfmWUt4+TTKxSzqHHFIJo3x32Zu6wgDlfQ6ykdSsmb3XIw/4AIQkb/6AJxnUJtaazTFTd6PmFF13Cj+sV2/LrY01HG7MYjGOf6pvu/PSwMDC9AGLb7T9NFT/1YxYEPs6E0KL4H64j3R2ofhVFWeChu3z3kYyRvmdFb7bToGTFnnPtdejJGRoDie0gXw==
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 1/6] xen/arm: firmware: Add SCMI over SMC calls handling layer
Date: Wed, 18 Dec 2024 12:11:36 +0200
Message-ID: <20241218101142.1552618-2-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0228.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::35) To DU0PR04MB9561.eurprd04.prod.outlook.com
 (2603:10a6:10:312::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9561:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c50f34-8999-4888-b1bf-08dd1f4c7a08
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?22h9+N2vOk+m5zxQ9v2tZqcPKfgejn85RGhCYMeba0O6tLG1n9TN1LVolEka?=
 =?us-ascii?Q?wVJ1GZliyvzOS5YzgSDMrPMDYvEa/xuKyMt9phdBEfYe/7VA0QrfBCcl8Ose?=
 =?us-ascii?Q?dhGbk65jj7HLiEqN6VlSowaBffWPNWSJGyuzFeRWXNemsZ3i5fwx3rpggvU4?=
 =?us-ascii?Q?kb2HA4uB3kaMzatIw22CHLbSt5R7QjDy97xwli8DfDrGOSsjW6Wd+PwlBeEX?=
 =?us-ascii?Q?KvElwvFWxhvlM9SW4UCFtEdBbLqA54Il6lAnxhDnF3Tv+S/JmGRfT951+U9H?=
 =?us-ascii?Q?PlQrX1wUen2eXSk+9DdB38g1sGzHLSY4lshFocc4R6jgchELERqZp2UHgrY5?=
 =?us-ascii?Q?51NWDE8rCeBiRiwNcFY+Xj6L0eZBZGTZdt+2UEoK3+W4Elt4vACRnOVsy9Mo?=
 =?us-ascii?Q?7tgWukD+/XiGDzZ7oX7Wnc/g8b4CZNMsm8yUbukZ3aS2bhdt55BUpWJTP+dR?=
 =?us-ascii?Q?usl98Ao80D4I+o+qVTj3PnMm1BC4mbcHoK+I3MttDnVezWLyV4WzdPk9vyi3?=
 =?us-ascii?Q?PYREzeemxL8QOPFNYDRfTmZBBnV4zHQbONReYAyaHqZV5UHTVi8X1XTm1RQ5?=
 =?us-ascii?Q?EyMxx7o5AxX99Nb4s+/oa/mwkYt2FW5mCNEPfOA5lS9jF9XCwl99S/wMdZp8?=
 =?us-ascii?Q?wSC9W/P3SpmJAkNyKUFEZGXYpCAeyjs0AoQpDbgVbEnHHb0WI/d2ho8Qk1LC?=
 =?us-ascii?Q?OK6o0gh/mRcCcy0etdZ9FZXhXsDCJZYuQxW5MCu5Sneom/hJpaodSdYtIpWh?=
 =?us-ascii?Q?RbBNsxeDS8wrzrKrIuWb/6PZseGgbhfzHH+QHMClSRHraIApm/VhtLgdTZwg?=
 =?us-ascii?Q?O4Zo4IMQMSnmTGb9YhkhYGojR1j2gtOm/HiViqcsaJfJTnKD8p57DQkJU0dv?=
 =?us-ascii?Q?cszz38pXbAHz+6ve8VHWS91Sv0p2hIKoveQoINkCF+aV+46nkrihq6Ngg3pd?=
 =?us-ascii?Q?QMm6wvt07DlitSO7E9kQbIzZ/GzJIY0BTzPM2+JdjVJURaxNPqjUSwt9IwKL?=
 =?us-ascii?Q?sngQrDNFnvE8mknXU10D87FJz8oPv8K+jD82c89hEWrWkAEzOE+YgoAyg+hQ?=
 =?us-ascii?Q?HGVPulSmunC/9Ce38hyx0MG82lcnBPR5G6mRnzSVU59CydQllH93RlNPkT5V?=
 =?us-ascii?Q?OGyqo/ZKchscgHZ/KYvIE3DupCt0U3dFrC6mT3JoXFlZXtWEPovneEC3Cg1T?=
 =?us-ascii?Q?74Fd4iinxnZtU4GoYpIfl8BuMny4s587V1EMpjg680xlNQfQgGs9YyE7kf8u?=
 =?us-ascii?Q?C57IwRgGd9ZEeSJSFbBbWBLyrFU4Bn88HgFCx6QI4xggLW/jU2yO52Rv6oU0?=
 =?us-ascii?Q?zEgHpuxF4kMxA+qDhyg6d7oicM/BsTmMMcKPFoQluPaLq+rYRxEb+DT1Rdrp?=
 =?us-ascii?Q?SvzcDg9QDQF/qh+Cwq06+c9vqtoc7XsO0nHCJO6jx6JnxuZtTOs8XDPLpTy2?=
 =?us-ascii?Q?Ms7MnXb+EW5bPXN9eQybucMcttqu4ktl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9561.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V45rHnrkYoYLWxltnV72iVzNfrs4nV/xTeiddqoPfJxyO/6K8DrWAN1E+Hq8?=
 =?us-ascii?Q?3RyMGU9CC/1fewmWBLVhGFRQ7n8+5Rehozw1upwQYp0QDh+GDG+zI3WQsjvt?=
 =?us-ascii?Q?Yy/qmoct2cTYBISSMg1lXQlanIgjwCgtk4KlnBtjMhctKPnkCh7T0TLeKVLr?=
 =?us-ascii?Q?NNi8tGU7R5bdmMiawtF8zpkWQaP3KBJFqcqkUA68PPQUH3UvNhEYBsdI2SeE?=
 =?us-ascii?Q?leOsnjK2MOybirXNSx1QWu/W6Lb07qEp3JqFfwci2kB8v7lLfPm1WkAtynhD?=
 =?us-ascii?Q?SLBhB3v4UsX09epHYB7FNrmXrVzFrgOpGtwlFLyTtW2ibyWUD89AvzUDnU7a?=
 =?us-ascii?Q?rAu+2dRy/VPmg67XbeHurgjNkhvawQOVWseo5jTBldCpt0Zo/rdQvE8kPTMa?=
 =?us-ascii?Q?7iHSjM0A+V8Q38o05JZctqvhjgvRCX3vpLpRq/PkfgOevAZyAopuFnpKLiEd?=
 =?us-ascii?Q?Z3YPbLQkqorIH0Hb3gjH5XzmvdE4oBufHSrQdqriu5ZU7+3OFXyeRN5RLw8p?=
 =?us-ascii?Q?lt8PxXp0MZ/RSuv2dQFTBeyEdAISPQ4pAdmZ3aUziqKwupY2YhnubPYA78w9?=
 =?us-ascii?Q?JCUPEHlQq3EWUMQcfTMAsv+SRTVx/5Bz5IbMLT2ubZlFx89SVdRvvNrmiwPE?=
 =?us-ascii?Q?iUO5T0eJ54+/DMB3X0jZqZl2CeHdaCxtPFjDtGTaqsSfpJgXN31gbkJb1e++?=
 =?us-ascii?Q?X3n4v3gjwvU9ygqJgjXCw+KWtHUFUoT+epGdrdUqaS8gvsLgFJRMF58mJQF4?=
 =?us-ascii?Q?gi2zyfQdrniQf0YmCdeigNEbr68JpD37A3R5FzKCmJHdC3ecjZpIeNRa69Nf?=
 =?us-ascii?Q?nAqzIh5/4e5fdkQqGVh1BMtZwTN4sqqRMRXmWZdLRJOX4EPDRJrnoSUD0AJB?=
 =?us-ascii?Q?S+2vdHc6+SSsXPLdrioSGr52nponOSTEZmcgMsx+7Mef+CNffNbQ3ZbkfM8W?=
 =?us-ascii?Q?5xJvmS1Q3Z6HNxLO1gf+lzj4Kv7yK8S1fnyAksg0weLqxvRJlJrcasoTff9t?=
 =?us-ascii?Q?fELW6yqXr6mVqCZ3fgYMMArLbzqw/0vNGc3aO9YfWwGeiZys75iJ8F/e8G4C?=
 =?us-ascii?Q?sVY21lNzPlLwOyqWFO2p8beMUfj8YsD4vm3aBM2zbW+MJm15puzohQyKULPU?=
 =?us-ascii?Q?ZXQB71ynlW3Yt+WUKr7gRILCadMLbnzDRFq3/0onxS9HZ167KTsXP8UoNRyT?=
 =?us-ascii?Q?wogyXNW9jkqtqHKfmfyb7l7++xN9MaTD0ft5ZbXwnBxg7yroVbD6m7oGMJVC?=
 =?us-ascii?Q?5gnX2A173fe17f2B0fmoBEXyHOrd/vYgOc9k6u3WoThfF6eAlW6HuiBiB8+Z?=
 =?us-ascii?Q?4l2W/EVGdfX1pP0If1O4pWaM34ZAuPc+jcHQPyBityDScA+sk6cDc2g118ly?=
 =?us-ascii?Q?LdU8RGrfx4q1Qyo8MQ0VqUQDmrA5crZrEV6BQM9TArAHIqQlwSG30F6OMxTk?=
 =?us-ascii?Q?Y7XiWHdTevg1d7wOWkKytZZEVEAwYdAoCawYYgXAqZG92iyPHxpR4HQETU40?=
 =?us-ascii?Q?J5HTUR0htFTZ2BnEI1HmmQCmn/fybuj0+GMSwN02XOJ0Cs0NrfdJ+FK4T76O?=
 =?us-ascii?Q?Ea0KfINNSylWW8wKmVL6XQhT4ef8Wo7b8PVinyuJjVqPh4df65dyQq8uxk5x?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c50f34-8999-4888-b1bf-08dd1f4c7a08
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9561.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:12:28.3683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4+PE+5P++M43Eci4BrXAi6MKYLKvz/233gPCdZMf9f8JHPANphJdvJSTj8c+N2uBNDHGh+ZB48R5krhFTCPRqZOXHLmzlgJWcB6l5vet9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Introduce the SCMI-SMC layer to have some basic degree of
awareness about SCMI calls that are based on the ARM System
Control and Management Interface (SCMI) specification (DEN0056E).

The SCMI specification includes various protocols for managing
system-level resources, such as: clocks, pins, reset, system power,
power domains, performance domains, etc. The clients are named
"SCMI agents" and the server is named "SCMI platform".

Only support the shared-memory based transport with SMCs as
the doorbell mechanism for notifying the platform. Also, this
implementation only handles the "arm,scmi-smc" compatible,
requiring the following properties:
	- "arm,smc-id" (unique SMC ID)
	- "shmem" (one or more phandles pointing to shmem zones
	for each channel)

The initialization is done as initcall, since we need
SMCs, and PSCI should already probe EL3 FW for SMCCC support.
If no "arm,scmi-smc" compatible node is found in the host
DT, the initialization fails silently, as it's not mandatory.
Otherwise, we get the 'arm,smc-id' DT property from the node,
to know the SCMI SMC ID we handle. The 'shmem' memory ranges
are not validated, as the SMC calls are only passed through
to EL3 FW if coming from the hardware domain.

Create a new 'firmware' folder to keep the SCMI code separate
from the generic ARM code.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/arm/Kconfig                         |   2 +
 xen/arch/arm/Makefile                        |   1 +
 xen/arch/arm/firmware/Kconfig                |  13 ++
 xen/arch/arm/firmware/Makefile               |   1 +
 xen/arch/arm/firmware/scmi-smc.c             | 166 +++++++++++++++++++
 xen/arch/arm/include/asm/firmware/scmi-smc.h |  46 +++++
 6 files changed, 229 insertions(+)
 create mode 100644 xen/arch/arm/firmware/Kconfig
 create mode 100644 xen/arch/arm/firmware/Makefile
 create mode 100644 xen/arch/arm/firmware/scmi-smc.c
 create mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 604aba4996..23dc7162a7 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -271,6 +271,8 @@ config PARTIAL_EMULATION
 	  not been emulated to their complete functionality. Enabling this might
 	  result in unwanted/non-spec compliant behavior.
 
+source "arch/arm/firmware/Kconfig"
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index e4ad1ce851..8c696c2011 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_HAS_PCI) += pci/
 ifneq ($(CONFIG_NO_PLAT),y)
 obj-y += platforms/
 endif
+obj-y += firmware/
 obj-$(CONFIG_TEE) += tee/
 obj-$(CONFIG_HAS_VPCI) += vpci.o
 
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
new file mode 100644
index 0000000000..817da745fd
--- /dev/null
+++ b/xen/arch/arm/firmware/Kconfig
@@ -0,0 +1,13 @@
+menu "Firmware Drivers"
+
+config SCMI_SMC
+	bool "Forward SCMI over SMC calls from hwdom to EL3 firmware"
+	default y
+	help
+	  This option enables basic awareness for SCMI calls using SMC as
+	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
+	  compatible only). The value of "arm,smc-id" DT property from SCMI
+	  firmware node is used to trap and forward corresponding SCMI SMCs
+	  to firmware running at EL3, for calls coming from the hardware domain.
+
+endmenu
diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefile
new file mode 100644
index 0000000000..a5e4542666
--- /dev/null
+++ b/xen/arch/arm/firmware/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
new file mode 100644
index 0000000000..62657308d6
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-smc.c
@@ -0,0 +1,166 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/firmware/scmi-smc.c
+ *
+ * ARM System Control and Management Interface (SCMI) over SMC
+ * Generic handling layer
+ *
+ * Andrei Cherechesu <andrei.cherechesu@nxp.com>
+ * Copyright 2024 NXP
+ */
+
+#include <xen/acpi.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/smccc.h>
+#include <asm/firmware/scmi-smc.h>
+
+#define SCMI_SMC_ID_PROP   "arm,smc-id"
+
+static bool __ro_after_init scmi_support;
+static uint32_t __ro_after_init scmi_smc_id;
+
+/* Check if SCMI layer correctly initialized and can be used. */
+bool scmi_is_enabled(void)
+{
+    return scmi_support;
+}
+
+/*
+ * Check if provided SMC Function Identifier matches the one known by the SCMI
+ * layer, as read from DT prop 'arm,smc-id' during initialiation.
+ */
+static bool scmi_is_valid_smc_id(uint32_t fid)
+{
+    return (fid == scmi_smc_id);
+}
+
+/*
+ * Generic handler for SCMI-SMC requests, currently only forwarding the
+ * request to FW running at EL3 if it came from the hardware domain.
+ * Called from the vSMC layer for SiP SMCs, since SCMI calls are usually
+ * provided this way.
+ *
+ * Returns true if SMC was handled (regardless of response), false otherwise.
+ */
+bool scmi_handle_smc(struct cpu_user_regs *regs)
+{
+    uint32_t fid = (uint32_t)get_user_reg(regs, 0);
+    struct arm_smccc_res res;
+
+    if ( !scmi_is_valid_smc_id(fid) )
+        return false;
+
+    /* Only the hardware domain should use SCMI calls */
+    if ( !is_hardware_domain(current->domain) )
+    {
+        gprintk(XENLOG_ERR, "SCMI: Unprivileged %pd cannot use SCMI.\n",
+                current->domain);
+        return false;
+    }
+
+    /* For the moment, forward the SCMI Request to FW running at EL3 */
+    arm_smccc_1_1_smc(fid,
+                      get_user_reg(regs, 1),
+                      get_user_reg(regs, 2),
+                      get_user_reg(regs, 3),
+                      get_user_reg(regs, 4),
+                      get_user_reg(regs, 5),
+                      get_user_reg(regs, 6),
+                      get_user_reg(regs, 7),
+                      &res);
+
+    set_user_reg(regs, 0, res.a0);
+    set_user_reg(regs, 1, res.a1);
+    set_user_reg(regs, 2, res.a2);
+    set_user_reg(regs, 3, res.a3);
+
+    return true;
+}
+
+static int __init scmi_check_smccc_ver(void)
+{
+    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
+    {
+        printk(XENLOG_WARNING
+               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled\n");
+        return -ENOSYS;
+    }
+
+    return 0;
+}
+
+static int __init scmi_dt_init_smccc(void)
+{
+    static const struct dt_device_match scmi_ids[] __initconst =
+    {
+        /* We only support "arm,scmi-smc" binding for now */
+        DT_MATCH_COMPATIBLE("arm,scmi-smc"),
+        { /* sentinel */ },
+    };
+    const struct dt_device_node *scmi_node;
+    int ret;
+
+    /* If no SCMI firmware node found, fail silently as it's not mandatory */
+    scmi_node = dt_find_matching_node(NULL, scmi_ids);
+    if ( !scmi_node )
+        return -EOPNOTSUPP;
+
+    ret = dt_property_read_u32(scmi_node, SCMI_SMC_ID_PROP, &scmi_smc_id);
+    if ( !ret )
+    {
+        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT node\n",
+               SCMI_SMC_ID_PROP, scmi_node->full_name);
+        return -ENOENT;
+    }
+
+    scmi_support = true;
+
+    return 0;
+}
+
+/* Initialize the SCMI layer based on SMCs and Device-tree */
+static int __init scmi_init(void)
+{
+    int ret;
+
+    if ( !acpi_disabled )
+    {
+        printk(XENLOG_WARNING "SCMI is not supported when using ACPI\n");
+        return -EINVAL;
+    }
+
+    ret = scmi_check_smccc_ver();
+    if ( ret )
+        return ret;
+
+    ret = scmi_dt_init_smccc();
+    if ( ret == -EOPNOTSUPP )
+        return ret;
+    if ( ret )
+        goto err;
+
+    printk(XENLOG_INFO "Using SCMI with SMC ID: 0x%x\n", scmi_smc_id);
+
+    return 0;
+
+err:
+    printk(XENLOG_ERR "SCMI: Initialization failed (ret = %d)\n", ret);
+    return ret;
+}
+
+__initcall(scmi_init);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/firmware/scmi-smc.h b/xen/arch/arm/include/asm/firmware/scmi-smc.h
new file mode 100644
index 0000000000..57cc9eef86
--- /dev/null
+++ b/xen/arch/arm/include/asm/firmware/scmi-smc.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/include/asm/firmware/scmi-smc.h
+ *
+ * ARM System Control and Management Interface (SCMI) over SMC
+ * Generic handling layer
+ *
+ * Andrei Cherechesu <andrei.cherechesu@nxp.com>
+ * Copyright 2024 NXP
+ */
+
+#ifndef __ASM_SCMI_SMC_H__
+#define __ASM_SCMI_SMC_H__
+
+#include <xen/types.h>
+#include <asm/regs.h>
+
+#ifdef CONFIG_SCMI_SMC
+
+bool scmi_is_enabled(void);
+bool scmi_handle_smc(struct cpu_user_regs *regs);
+
+#else
+
+static inline bool scmi_is_enabled(void)
+{
+    return false;
+}
+
+static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
+{
+    return false;
+}
+
+#endif /* CONFIG_SCMI_SMC */
+
+#endif /* __ASM_SCMI_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.45.2


