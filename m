Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ACF98A10A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807254.1218616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsN-0001Ds-SK; Mon, 30 Sep 2024 11:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807254.1218616; Mon, 30 Sep 2024 11:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEsN-0001Aw-OO; Mon, 30 Sep 2024 11:47:39 +0000
Received: by outflank-mailman (input) for mailman id 807254;
 Mon, 30 Sep 2024 11:47:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=orP2=Q4=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1svEsM-0000Cy-Ke
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:47:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20629.outbound.protection.outlook.com
 [2a01:111:f403:2613::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9ca7cda-7f21-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 13:47:37 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by AS8PR04MB8357.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 11:47:35 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 11:47:34 +0000
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
X-Inumbo-ID: c9ca7cda-7f21-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eswTL4dCWaUGm2FhyGxDJgZShHhEtcrCiidfky5fGZQRo5kU9YfB3F3Y550aoHZ59jqGm9L9SNc9HT+yHC3Ha74dZFoty/dXwvX2v7aysdBw4jzp0EHo+1SAq2yXLoLeXYzGW4kk2PQ0PDAVAmRf27Tn5aUq7oRMi8yhWDQ38On7SZEGUkh8iyCMtoeTUKr3RP6Pnne47jvg7/VhB4ONtFNgeldGIer+0WofFOIzuI8dC3T8V9mR+VdsPwdxz8ZujIibVN9zL6nkbe7EdoXEwrQVHU7y8WOSkitK36Brc3w2Zve4P5mBDZeTpGVsy5N8L0vAROhsiCDHKaLJYDK2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoDhdTF0A/O26QnYxCxxYly+yAcFFjFRVafIQNru3ks=;
 b=qTj713nPY0q1JtOAEtohKEh3LtvoS1eauVmGxypPPFoLE/dxPTCA9ViMHqLN9QVKFwSu/6D128l6mWnESenoN0Y/mI9YSig7/XElcTWyoZeW9zM3M4UWCJVTSmknVDNQ4gTIyUYV4pEweJY+zX8COX7VldQHLjuP/U+uI1yct2FCh+CSGj+6alDHjTYF1q0WSK6tnpJbn7hg8yfOEjwQ/2niWO8hJanlTNRZb+w5y9oalSdvSqIF7rQP3Tg8A5w15b3upZ4w7tuz/8qo2I6A9M5N6LFuAo34VuTdy2RIsHG8jDayviC3iNHGQwd2C9Riv2v1LRQUROcKkvsYJY870Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoDhdTF0A/O26QnYxCxxYly+yAcFFjFRVafIQNru3ks=;
 b=Lgj1ntiAjzjZjTpUJWElA49MLuuXQa2AcuVlLM805VSQg+rOAcxy7JwYuA3RfFEoALAIslXCPs/YY9juTSItuwGlRO8l9wujQECcL0ATLMGUSUGVsRHiCD+UOYZYYxV6jtif2LcdFdsT1AJUcLlwUsgr87LRhABKqmpUDCMsBXFCRdN5ZnHwis2itQSLMmpQo19n24JDJXWzjMAtHTU6mDKl3nQ04vCp1otA7zX0f7uiZ9Wahr1dFxZElYlfVAIXK5mNyzUXaZdVwetUzDzumgmjJFT9G2HWuOSfVDGCHOYsrQ1MeRBvZNln0SxJk3AaA2XaoyY28+kraEocdeXPOw==
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
Subject: [PATCH v2 4/8] xen/arm: vsmc: Enable handling SiP-owned SCMI SMC calls
Date: Mon, 30 Sep 2024 14:47:10 +0300
Message-ID: <20240930114715.642978-5-andrei.cherechesu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6495c173-cd34-4d0b-c602-08dce145acc4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IhKpMS2LSaTUDsXr4ohdnuP+L/Lo27SbxC+0gVVAflBJ1TYr75rvjS5987/5?=
 =?us-ascii?Q?x58RD23a5SMVc4rcUBeI8vY9KazP9zRjnPKYhv6e5k1YGdYc1A3wVaQC/oh5?=
 =?us-ascii?Q?7LqsbvSqqBQvB7p8wqVvZFAgp462oBQ9UZhWCFenz4vRlFG2HfSIo+gYn7qj?=
 =?us-ascii?Q?CutX6ncDDxhmbV1LHmh0jMlEJoLwfdxDjw/uQoNBEYficO0tB+NHbJ7eSyji?=
 =?us-ascii?Q?awpD46HVBEkiHCgomWcFeIrRoZitVnQEx+NVTlgbDBTHozQqV6BkVnIhPNou?=
 =?us-ascii?Q?Cgb1TVuMvlPHOIEs8Bm31xdqa8yoyLfYyuc/yMAcOI1GLo4VbDJfZ5wR85CW?=
 =?us-ascii?Q?oymvbizcioe3SyryTR2SLQgeUgb27ZVv+TXMhG7hZTC6ZlVUajaDvWXUvEJE?=
 =?us-ascii?Q?VfM9tRIYabIdzVLSYBthNHrelLIHDHT3Mz98/rBi3JaLxZ7V2DsuZndQajfu?=
 =?us-ascii?Q?AfaSm0VVjvRBXKDmsqF7fBS8d1jUpGUimja2TUSlI3WYcnB8HbALEkOmiyHR?=
 =?us-ascii?Q?KrFTSO8CVusQ7kaltZfqJ0YY0qwJwrsL0J6Re57tb7zE7BChSEAUoIMt7OfC?=
 =?us-ascii?Q?Jq+1FU/3bMJ2GpRq2QzeBHj1SNfRIYHystP1CV46ypwLyP0Daz11UkeAIboG?=
 =?us-ascii?Q?2Fu++acGIOrWOZax5RMUvFilr4cWyrEhCO5Qqz+b3X2jyY8zvqlxlDODssXJ?=
 =?us-ascii?Q?qvOrwkojB9EUjpfdZXY/iSSj7aSRWqCx3dftDIuHtyM16fpUbB8Mlo8EKano?=
 =?us-ascii?Q?dbSwCkJefqcjOg6KD9C67HUcOBwdq755meRFvhwHtF+5eWFRs2pjsGDKVVWs?=
 =?us-ascii?Q?UXSZSx1OTARmw6AC8I+0HE1nZZ08UsTzZrUXHg7XLIfn/mLhVn97nHRkKMrg?=
 =?us-ascii?Q?DWT3xl5Ietzn1tHGDAA91bGCCsD+n60Q6vqy4oZtlp35ezb4TEAJgp8INpdH?=
 =?us-ascii?Q?mFz+4ZaqsFOnAorsNEke8aywPWvPcHGYKTXbW8Cb1kOUgLs8KFwic1NtsDkf?=
 =?us-ascii?Q?kPrjYUKOgTsrwHt8/i25iS1zOhYHXSOp5heUFWVS5Tobop3qzYTAOfxcq0xG?=
 =?us-ascii?Q?p+bit4PtKsLz/xqGt4+QJBPVx/CIu0SnCnDG6WNyiGJmH1jgiV9eectHTeVM?=
 =?us-ascii?Q?QeUO2nYrvLywrII9otFIJYNs4Oxz3eLOLzYz+8cNYypv8DcNUMbYxc6trvlk?=
 =?us-ascii?Q?xa5TwDHptuQt/nFkszfIvQ0aJ0M5wXrqhHLdsi5uZyKVNF8/Fkls+pLbaJ39?=
 =?us-ascii?Q?igBdkBLpo3p0D5zUxmKDo7o/Zm8xNkdQmtv3Qk/bRJ2aHOhflvtczeWZu2Hs?=
 =?us-ascii?Q?X71dR92DT//SFNlopYItUl9CAIkg49/iDAn4876COstpDw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ciWkBClUl86MQvUKEwJEpHFhHrtkzaBBnec/QbheaI+3qCb0iWPB+v25nM5x?=
 =?us-ascii?Q?pxLcg9faFZGAYGPkTGW0pcqOq0BKuJBVMOIXfx76gYaQsGNVy0ORCyvZDs8p?=
 =?us-ascii?Q?IPDyBwR4VyrujHPdWMhc6wESo8D0ElkZ1MnQ4gZsLDxwtQHiDues88CL5YIi?=
 =?us-ascii?Q?rJfQiXy5qC/VN4c9T0I6wKwGWaUqvEuchej1TVDOKpqfHumSUi7A+CjLPC/s?=
 =?us-ascii?Q?FfoLG7BSB0w4D5JpJEV3LT4RQZq76mQLJz25jU1fozSouj9KfEDsBZH55itN?=
 =?us-ascii?Q?d/ryqvjS+30CzvgkBA4ivif41jj/buT0bit7HkEbDSY6kQlvkNaH9Z79wGsZ?=
 =?us-ascii?Q?3yJD1OSHtWldmS5Pnh6X5+DHgkBXNkMGZYxqUZwv7o3JBppXiA/8jXQ6ZmqO?=
 =?us-ascii?Q?6xiWPzesu9lDYk9d/QaWktMxGvVyog7ciw/7dyPAx+0SnvHOPwE45ou39hyi?=
 =?us-ascii?Q?xv6Iir9sIGLy/6N9g6PNT8p8e5aO6DBGO9vR07wyo29sB5HPE0dQDBNA4SBg?=
 =?us-ascii?Q?Fb4WwtEf3Sb2ik0lOf/41IZw6UzC1zybr/PrWEkk+ufW3AzZWXU2n2ZqdtUn?=
 =?us-ascii?Q?y2IlaNwNPH6uY83ezBl1J93Rr2KPNosZv7fIj0CAFN+wYxag7CH99XyM85Hi?=
 =?us-ascii?Q?a4fYAbRwFRXqtYgbbzu4qdc/P0hV540VMxQs4JOr0bXh3wh4rrA9WURzkq52?=
 =?us-ascii?Q?jWZ/eIVHUzZ6wAzQgrLpLIut7MI0c3lhtH2xcf78NUC3OlV2z9SSSwvd2Opu?=
 =?us-ascii?Q?eGps5cq9KuwsQYSKnScMycvDM9eyBWZrhvoZT94sOiy4pHuz7zH/qgFNZkqm?=
 =?us-ascii?Q?nQlBbKDwgiX7HSNERVa0m6cSWdcVrgZnjSswqvLfR+VqZY/GlbWK49pg41YG?=
 =?us-ascii?Q?TqEHbOj8L/jWN6o43hBXc89TIyPqMNr2t4MCNHr3xvbLXDvhe7SZx4UO32D+?=
 =?us-ascii?Q?NG2qucblZhy0nO0bNLl5UwHCineHE9ik28cI60NB+VjjNOPE02aEveLN0mpA?=
 =?us-ascii?Q?LMYGS/eM3S8MfrwfZY0P68NlKu0s5lNcOqD4TJ8UL8gQ/gfawP86fS6ryYrZ?=
 =?us-ascii?Q?mlKfdvJbgeiQmH2UkMAfGeUu/5QHhlcM56626roD8iKNy3RaFsqtoZa7KV77?=
 =?us-ascii?Q?B8hFVfS+AkyB2XfGV4z3WxdrzLEDVwB2wowLLeM7b+m9UVrt8Ty6gEmZxH14?=
 =?us-ascii?Q?mYbJEuUkWSP5bR4+5Uy5BZx/gRe4UCPvKEtSm05IGbOzvP6tLJ0ycPu5Eszt?=
 =?us-ascii?Q?S7Cvkj7phhYieCxwTnTNn527QXRe5Sv9Aqmu6dynwfjMu0kKkZuhDwX8lWHk?=
 =?us-ascii?Q?qloGXCElsSYGjEHwK+M4nB2H+xEgfXIwm6JnMooOgGEeGqSGncnxG8lUvi3g?=
 =?us-ascii?Q?gjR2N8qXTSqPzHpjiZsLCIM/sC3E8z9Q85gWdNO+1oABhiwsf9bp+nY7qRig?=
 =?us-ascii?Q?7fnq5ekkBn2Py0g5xiYdAsjZJ/qoXUyP6C9mikjEjKOPVRLLsyRqvNFhAz0j?=
 =?us-ascii?Q?3LY29iw6+ShXH+GmzrhLRMb3h0v0Lygms8VkiMDDzbgiLatZIfd9adNfDX2e?=
 =?us-ascii?Q?LHf9Yt2842uTrcKHyPcGoimpGb7At7yGSrkMxMOdKr9tH+qtVb5u8Do4S/I5?=
 =?us-ascii?Q?5g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6495c173-cd34-4d0b-c602-08dce145acc4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 11:47:34.9063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aWJ3JREzReLbf2a2z/nY2+xwcHzurCDas5SQ1Ecs6tkk4DwjH3hzEn5Vr8Hgrc57YWx8a37HKzel84VPiuTQvlgpr2+nH2zTvq4XAmmKB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8357

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Change the handling of SiP SMC calls to be more generic,
instead of directly relying on the `platform_smc()` callback
implementation.

Try to handle the SiP SMC first through the `platform_smc()`
callback (if implemented). If not handled, check if the
SCMI layer is available and that the SMC is a valid SCMI
message. Handle it then within the SCMI layer which forwards
it to EL3 FW, only if the SMC comes from Dom0.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 xen/arch/arm/vsmc.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 7f2f5eb9ce..0de194a132 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -14,6 +14,7 @@
 #include <asm/cpufeature.h>
 #include <asm/monitor.h>
 #include <asm/regs.h>
+#include <asm/scmi-smc.h>
 #include <asm/smccc.h>
 #include <asm/tee/ffa.h>
 #include <asm/tee/tee.h>
@@ -224,6 +225,22 @@ static bool handle_sssc(struct cpu_user_regs *regs)
     }
 }
 
+/* Secure Calls defined by the Silicon Provider (SiP) */
+static bool handle_sip(struct cpu_user_regs *regs)
+{
+    uint32_t fid = (uint32_t)get_user_reg(regs, 0);
+
+    /* Firstly, let each platform define custom handling for these SMCs */
+    if ( platform_smc(regs) )
+        return true;
+
+    /* Otherwise, if valid SCMI SMC, forward the call to EL3 */
+    if ( scmi_is_enabled() && scmi_is_valid_smc_id(fid) )
+        return scmi_handle_smc(regs);
+
+    return false;
+}
+
 /*
  * vsmccc_handle_call() - handle SMC/HVC call according to ARM SMCCC.
  * returns true if that was valid SMCCC call (even if function number
@@ -288,7 +305,7 @@ static bool vsmccc_handle_call(struct cpu_user_regs *regs)
             handled = handle_sssc(regs);
             break;
         case ARM_SMCCC_OWNER_SIP:
-            handled = platform_smc(regs);
+            handled = handle_sip(regs);
             break;
         case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_END:
         case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END:
-- 
2.45.2


