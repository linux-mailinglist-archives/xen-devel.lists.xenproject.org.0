Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE5A98A10F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807253.1218602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsM-0000oR-Eq; Mon, 30 Sep 2024 11:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807253.1218602; Mon, 30 Sep 2024 11:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsM-0000im-BB; Mon, 30 Sep 2024 11:47:38 +0000
Received: by outflank-mailman (input) for mailman id 807253;
 Mon, 30 Sep 2024 11:47:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=orP2=Q4=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1svEsL-0000Cy-Ke
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:47:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20603.outbound.protection.outlook.com
 [2a01:111:f403:2613::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9445154-7f21-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 13:47:36 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB8357.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 11:47:34 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 11:47:33 +0000
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
X-Inumbo-ID: c9445154-7f21-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xm+o2I8NUtHsZTt1Y1ueSqpRH+16cETNR6Bow8ZnJPMVCsq8UyhnprbruzcQvrnUOpt7Kaa0ZmNoL976kL3wcUeQbB4QOfLStP3JqBjWZQLNnYU/0nNJSva66T1Tb2YeSwfpOPtrjwgkt9eNjbeQLa5lhDNcU0tj+rTkZuxdqQdjmR9CtsrdYOiXEqeT96/e4ZVTbb7f2S7s9eovorAhoUQC5q8/22iFmhbR8YI5mpwOwfaGySgUzwiuY1zcmkw1YR6XMGUlUx8afQ7L81/XilPo6KnXAN4VMOweRbGz9TLhm5Wr6rQIMlbFQF2WZKC2oPxIdBx4bd3NfKuuJOTV7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6y/NKPJmOcBVTeXUQHUvTBNywNYLbjwPhMoJ6DJlPcY=;
 b=AosIIBCy8M5jBn6Rc0RhUtkTZP/eCf6sjtxUBZx3Z5nqkqfRBxZ6+sTe5tAf5LO52e8v6ja0nnK//MOt5IXK59aSyZ45Fg/E+FX1WmWc3NKLPQWR+YGnGscuqOO4lMhYbKcWtctK2O3xr+tZW6aLPKJ1Ykohz4emzIZmXAGcjJUETE2UupOqPzTTxuC5bH2QATUdIC02IMIEeh2YPoRuMaKrdb/Xwslbg9BKldseFtalL4h+CLtjsRXOMbJ+XP2q51RY75hJSa+Nkd/0TGaJ9u4Yvelhc/cvQqHn2xKXtYvxBYDSISynMWBAM+Z/2qza0rJcMoDT7sPNzmQGGLM32g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6y/NKPJmOcBVTeXUQHUvTBNywNYLbjwPhMoJ6DJlPcY=;
 b=JXdciUNgtYOCIL0hEi6fsCHoSW+2w5lmLHz+UcrfADE+e81BXJVt54Vp+cV4Y/wGmw4v+saRjVsSFkv2Szn/l9TzaVB7itcZdEibwkD7SyhyO4AEoGlUWEKMTpe1ewDVmAG6jBeQMuYgbG6/iuaHGPTAG6EfBDzyjxd7WE82dBna/vLkv5LrAziF8ICHkztRVhYGnbwetB0SHlIBl3oiKCGX32pMT07S+otA4RSb8OAUiABsVjNrIcoCUhaINQLXzDPaxS7B1RDH6bhhDK/engWvnZ2lOsw6dplRH3EaEN0q+v43Jt51d/2LzjF+Lnzcf9aF9BbdifCpDwlKhGLw+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: andrei.cherechesu@oss.nxp.com,
	S32@nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/8] xen/arm: Add SCMI over SMC calls handling layer
Date: Mon, 30 Sep 2024 14:47:09 +0300
Message-ID: <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1219c388-7294-4ce3-2c00-08dce145ac24
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rkxtPpvcfCBPXx0XJJ4PyPGxSCcfZWHECTmOj/QBppX3UXidsSxfJIRUQ9Xg?=
 =?us-ascii?Q?bqNj60q2W0d7Qe5DVfupBVI0FYCgzmO+9hmOkzcBBo3gmOk5vrvVYWVhw7ja?=
 =?us-ascii?Q?WhNL8NU2pstqC3aZsFdBKvUPSRWrV7NGP0v0/LY140geZrVosB7ynkBj1vZe?=
 =?us-ascii?Q?IFzd7mpd6j9/D2xQC6bIN+nvPIn5450Dd7WX3b+QqfNRf8pjdz4oDBR546n2?=
 =?us-ascii?Q?vuxfmMiZcj1cfHFq7qThyblbfq/juK2u0fLMARSElAcrj81LyIqYI9RL5H6K?=
 =?us-ascii?Q?A9VxX7NeeC11bYd83ZpZcsBhNoUef3MZNxJmi16XBHWMTN6W9vAUzZP78a0g?=
 =?us-ascii?Q?AehLoyw+CbaHCy3GiwDp8zfiTrwqdkPfx839QC+7OGftbnhvewS7dWxD9IRD?=
 =?us-ascii?Q?YE4DqZh396OseUBA1L2Gkl4xWSA3H0b9fWJi9NXQJdfXgFYylF36TbMGVn6H?=
 =?us-ascii?Q?kRC+JBs6gYoDFQ5YgDDGPyw7tfTbxQq5eUlOz+pvjQVyDeMfRlX+t1uLc48T?=
 =?us-ascii?Q?sJo1iF1GXNWR//ICLJCjVfN1OScEt+hWscBNPrEqNkLZSDkhxxVPeyUbDyXL?=
 =?us-ascii?Q?UgqB6cceSUcOq/onD8ABhUWB4wlGwO0kqw8VJJnc1AS0u0nChYYWI300Jkt0?=
 =?us-ascii?Q?wG2HPBgeRh3ciq+eegP5HcHI7oEX80Y2vMNGs5luGis04JvRZG4B3HK8mxMh?=
 =?us-ascii?Q?OV7v3fuw7bFPI0wL6UyHlmC0IKRKx/D90EpWTiz7LKGBN2feeppcEM+W+j3+?=
 =?us-ascii?Q?vA/I1XeEy3LwmXG+Hsk9OKZ8OIkPklgyRiqKLFz64LdbsBxcUZsOyrUHwAWL?=
 =?us-ascii?Q?9/K58vYdmx4vnFcQp0OgMocxy5Bw0gxdyWOMCaH45u3hx6w+eZnQU9brdVu5?=
 =?us-ascii?Q?/Pl2+QO4VPA+wdQQ9c9ied+yWJbs7BH5u0unkatmyNDUoPB4kLgXa1ucqW+M?=
 =?us-ascii?Q?IX3cAv2+RL2dz6NhMqSv/PLXFT30SHJrW+3HegaEvcHM7ZatZLZ4WIy//Lj4?=
 =?us-ascii?Q?RGj14sbUrz3TCpnjRA/S+6bjtZsEEt7q9/OX30iXzLkRioGamCI8pcbDYS4Q?=
 =?us-ascii?Q?VmNwmXVK9DsIgSC2sAvHAuv/ANHF32uobJgJMFwcEeP8AbJEl6pf0weYgvmv?=
 =?us-ascii?Q?OZ1tTF0V0YhaTNRZvv87nXYQkj/JqETFy78InGyqg67UH7381EG+DGktl/Ds?=
 =?us-ascii?Q?cYxgTHxGpYXO7pRhuQz+KG1+13Tw2zsN7uAUn8LP0julquyngaC3VkiqxREe?=
 =?us-ascii?Q?1z6AdZVtNL1d1jPrmmg7WP9i+8QGr1jWpnlFGO7oTUPxuvLFzGpEQigArQzr?=
 =?us-ascii?Q?BkmppeJ7G4TTqVAHDnHrO7bfO/kLQPLHpoaZ4mvYbLrj5A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Ngxtn/jbSYmDMNZnmH5DldOaodu+aNHgW7UImEj+kbiIhKllx+I+1qSjWyi?=
 =?us-ascii?Q?ODHEd53SR+thcG+7SNO4bHOuf3cpjxQ4cuhYsVkZ/U18Ue5wGpB/F2jtBZ3P?=
 =?us-ascii?Q?V0jTMDq8XrKmVdigecBXyP/YrO4Omg8tkco2mKH4FyYrVz/vEJD1cx/8xeb9?=
 =?us-ascii?Q?ow7k4GkoJTjHmZ1FAVXxHP0cmN8bwtT/6zF/dFxHXxpzGFoaRMaZi2Z6OBwg?=
 =?us-ascii?Q?7d3BIpYisk72TfgmgZLXRJ+X95wfIJdM4LO2hDKbMHXfM9489O45lMLqxKpk?=
 =?us-ascii?Q?RnxxeXVBBMik40WnLvnrbzBzJeikuZNqtm8ued2svrQHtm8295ONNIUXcu0I?=
 =?us-ascii?Q?giJWhNJrjNyzS3bT8PaSvNg54dlbkiL2h+J8f4XHY/zevwR2G/G76CYBCb8Y?=
 =?us-ascii?Q?UHmb3rVTzJKUC2kaOwpGKm+xZRy0jEEclDFOyhfbjVhvgYh2y6dOicXsUo4c?=
 =?us-ascii?Q?VwnPZTRoPpIm850Bnq3JU67ZbqwA/sQkNEKeTeei2J1762eKoHMmO111/qrB?=
 =?us-ascii?Q?Rz6ip8/mLxzyd4KxIAt7hrkmkQ4/zZoecTGcL+OkT42Hk9/Gt0Y4A7d+K5+h?=
 =?us-ascii?Q?9smfpzgiJkI81DmzoqS9BnQz6Oqb5ZgjcIr31Hovyin8m6ms33qOjo7VjwLE?=
 =?us-ascii?Q?DJdi4ZPVcsN7HqMbn0oYbxhrkmCZl3bbtYrNnMBe4je+56VroLWLLmUX8T8j?=
 =?us-ascii?Q?TpNe8GXyQswFhZeA6SbQOeRgxJmjuVOD9CssehkoqGnc3Ynf81wK6aUJpU1f?=
 =?us-ascii?Q?vL/FRX6eLyt0zwT5RBLSw2W+sgUAfcWt/MNmc5PjISA/qqC5+oWYblF8IE1p?=
 =?us-ascii?Q?zf0Y8keXGUm5yoz1i1pYsngB1+ndH+NRVsgENkqDriGt4l9/lbRB/rYrCJXD?=
 =?us-ascii?Q?NjYopgSun9GbJlIqV+pt5O/Q61JGlqf0P4CSwXfQtruWAsrZjFNQ6yN6MrO0?=
 =?us-ascii?Q?XFj/dBhWNWrUxoOMtRn4JhXzxdjQKhQO7mTrLxKmNOqsBmqybJUBKRXk+Nks?=
 =?us-ascii?Q?JOfjF0LFZY4d/gZFYtrvq73XZA+pKbEH46blr5UE/3Nw/ZKIHM1H9b4S3Z80?=
 =?us-ascii?Q?x6/WDymGCNnvMSpROwt4579iDQ5N8yaSyVGSDNRljzapycw5Ofq4ZHFbBy9F?=
 =?us-ascii?Q?bPvV3FGr1AIXElb+oScj3xfyhSbrpFGvURaG7BL76wpZQDhHN0QQnQH7N6gq?=
 =?us-ascii?Q?qqcMyc6seZU9/5WPt96+Uy313fgdSO4L21AHjsph731pipj6QQ+/ZjMrKjAg?=
 =?us-ascii?Q?eSGxE6bs9HSW7XFNhFRDOdLbcaXe0QqzsyDZgnLI7X/qS1xDbs4eHyKLFWzM?=
 =?us-ascii?Q?zwILptoJm69p8s2mvkWqD84DxytWLPE7p6dkcE1atB0zAdDaUfvUWF8irKC3?=
 =?us-ascii?Q?Un2jMRKWFFCUGQoct56sOTqBzuCvw+v6jHIW0PR0xrwFkokPVAiCF/DJAdpI?=
 =?us-ascii?Q?n5G0t4vVBA/hr+RlI+m3KxkY7d37UrKSZ1ODgFzio/EFyZKa22WdgZkK86UA?=
 =?us-ascii?Q?5oIV6xbMtQWFhIXJkLWKLnimgAN1fzM6jZ4oNobxZy37m5ndO5r/jZ9lKrGC?=
 =?us-ascii?Q?53HrAmjyPjsXO5vw9SEC608Sp/gWLKTIHd6GkudpX1wOu6x1eROTQruXc3Vr?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1219c388-7294-4ce3-2c00-08dce145ac24
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 11:47:33.9135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNmPZTRZGzEXgxXI0ncRT7H0U892NdjTA78EqCQqYusXWUb2EDPqy6NsoZsK+FrH7yuuTeGU7JfCYHL3j9fZgEtxA76xq3QKof/izrUvn8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8357

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Introduce the SCMI layer to have some basic degree of awareness
about SMC calls that are based on the ARM System Control and
Management Interface (SCMI) specification (DEN0056E).

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

The initialization is done as 'presmp_initcall', since we need
SMCs and PSCI should already probe EL3 FW for supporting SMCCC.
If no "arm,scmi-smc" compatible node is found in Dom0's
DT, the initialization fails silently, as it's not mandatory.
Otherwise, we get the 'arm,smc-id' DT property from the node,
to know the SCMI SMC ID we handle. The 'shmem' memory ranges
are not validated, as the SMC calls are only passed through
to EL3 FW if coming from Dom0 and as if Dom0 would be natively
running.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 xen/arch/arm/Kconfig                |  10 ++
 xen/arch/arm/Makefile               |   1 +
 xen/arch/arm/include/asm/scmi-smc.h |  52 +++++++++
 xen/arch/arm/scmi-smc.c             | 163 ++++++++++++++++++++++++++++
 4 files changed, 226 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/scmi-smc.h
 create mode 100644 xen/arch/arm/scmi-smc.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 323c967361..adf53e2de1 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -245,6 +245,16 @@ config PARTIAL_EMULATION
 	  not been emulated to their complete functionality. Enabling this might
 	  result in unwanted/non-spec compliant behavior.
 
+config SCMI_SMC
+	bool "Enable forwarding SCMI over SMC calls from Dom0 to EL3 firmware"
+	default y
+	help
+	  This option enables basic awareness for SCMI calls using SMC as
+	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
+	  compatible only). The value of "arm,smc-id" DT property from SCMI
+	  firmware node is used to trap and forward corresponding SCMI SMCs
+	  to firmware running at EL3, if the call comes from Dom0.
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7792bff597..b85ad9c13f 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -45,6 +45,7 @@ obj-y += platform_hypercall.o
 obj-y += physdev.o
 obj-y += processor.o
 obj-y += psci.o
+obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
 obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
diff --git a/xen/arch/arm/include/asm/scmi-smc.h b/xen/arch/arm/include/asm/scmi-smc.h
new file mode 100644
index 0000000000..c6c0079e86
--- /dev/null
+++ b/xen/arch/arm/include/asm/scmi-smc.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/include/asm/scmi-smc.h
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
+bool scmi_is_valid_smc_id(uint32_t fid);
+bool scmi_handle_smc(struct cpu_user_regs *regs);
+
+#else
+
+static inline bool scmi_is_enabled(void)
+{
+    return false;
+}
+
+static inline bool scmi_is_valid_smc_id(uint32_t fid)
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
diff --git a/xen/arch/arm/scmi-smc.c b/xen/arch/arm/scmi-smc.c
new file mode 100644
index 0000000000..373ca7ba5f
--- /dev/null
+++ b/xen/arch/arm/scmi-smc.c
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/scmi-smc.c
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
+#include <asm/scmi-smc.h>
+#include <asm/smccc.h>
+
+#define SCMI_SMC_ID_PROP   "arm,smc-id"
+
+static bool scmi_support;
+static uint32_t scmi_smc_id;
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
+bool scmi_is_valid_smc_id(uint32_t fid)
+{
+    return (fid == scmi_smc_id);
+}
+
+/*
+ * Generic handler for SCMI-SMC requests, currently only forwarding the
+ * request to FW running at EL3 if it came from Dom0. Is called from the vSMC
+ * layer for SiP SMCs, since SCMI calls are usually provided this way.
+ * Can also be called from `platform_smc()` plat-specific callback.
+ *
+ * Returns true if SMC was handled (regardless of response), false otherwise.
+ */
+bool scmi_handle_smc(struct cpu_user_regs *regs)
+{
+    struct arm_smccc_res res;
+
+    /* Only the hardware domain should use SCMI calls */
+    if ( !is_hardware_domain(current->domain) )
+    {
+        gprintk(XENLOG_ERR, "SCMI: Unprivileged d%d cannot use SCMI.\n",
+                current->domain->domain_id);
+        return false;
+    }
+
+    /* For the moment, forward the SCMI Request to FW running at EL3 */
+    arm_smccc_1_1_smc(scmi_smc_id,
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
+        printk(XENLOG_ERR
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
+    const char *smc_id_prop = SCMI_SMC_ID_PROP;
+    int ret;
+
+    /* If no SCMI firmware node found, fail silently as it's not mandatory */
+    scmi_node = dt_find_matching_node(NULL, scmi_ids);
+    if ( !scmi_node )
+        return -EOPNOTSUPP;
+
+    ret = dt_property_read_u32(scmi_node, smc_id_prop, &scmi_smc_id);
+    if ( !ret )
+    {
+        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT node\n",
+               smc_id_prop, scmi_node->full_name);
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
+        printk("SCMI is not supported when using ACPI\n");
+        return -EINVAL;
+    }
+
+    ret = scmi_check_smccc_ver();
+    if ( ret )
+        goto err;
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
+presmp_initcall(scmi_init);
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
-- 
2.45.2


