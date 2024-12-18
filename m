Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE39F626C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:12:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860092.1272152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNr2Y-0005xP-5N; Wed, 18 Dec 2024 10:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860092.1272152; Wed, 18 Dec 2024 10:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNr2Y-0005vF-2i; Wed, 18 Dec 2024 10:12:26 +0000
Received: by outflank-mailman (input) for mailman id 860092;
 Wed, 18 Dec 2024 10:12:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M/38=TL=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tNr2W-0005v1-Dk
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:12:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [2a01:111:f403:2613::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93066323-bd28-11ef-a0d6-8be0dac302b0;
 Wed, 18 Dec 2024 11:12:23 +0100 (CET)
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com (2603:10a6:10:312::7)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 10:12:20 +0000
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f]) by DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:12:20 +0000
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
X-Inumbo-ID: 93066323-bd28-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLVfvBLKVkIxfXImTp6E0/IQadpP7aD+Oa7dT2Sj9GQsFo13T3z8etTibfWzVnDiy9DbbWeYlQ7+Xs2z9u1QtPP9IBMNVr7EAItqEe2AJrtEoIuz34cmGrpifbZ8T94Uop4Eb7rTOT+5qTXuCz/jlDE4SlQmR+0RXFczuefmHnac87sUkQLXXiJqY+l17CQcgzzfnDEv2R89yy4wpPj0qR93mc3c/GBCOiy/7R1AhCmv/TsQZkhtSW8G6hwrKfk9zZER+6u5h1mTMeLQeZ21g6JgnPgbrIKWl7fUlSqy3VJcY8Kp8q+mzVMeG5NCc5z0RjImGyUnfHOD66Hzus6lNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYBrGQDJpQbCT6auY/9vzMYsBF2jgRh4Xc/6g+axlVY=;
 b=vyStJ+hZHJuH1VvK+ttuK30cuia22pQJeqz44WkK7VW/T1utRP1hR2x2hZ9I4w9Ut732Evo7ixW/hzWhjriIGNw82QKWynhS1q99fFBYWWBNcADxJ3G4khEr2AHEODecARisP2K7wIQZ6cxARz7ZTAxN5Pe8UKJK9bWg2kIofGvQMXkOId8PIwU711AlL2Gt8IP276mP9Q2v3bNxYuB86/gGyY8Jd1UN4SwLJ3sn2MKET2eERFWiQFDDjP4RcscXol7ATc4JEsJTV84J1jLuKz/C5LF7omsLOondAx19M2wchPUpCG2yZzbWj8GI7g3fD3Vy9e1N4jURygZOulVlzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYBrGQDJpQbCT6auY/9vzMYsBF2jgRh4Xc/6g+axlVY=;
 b=W6cfRomqM6oUPiMrvVZx/RNtkQENnK5sCI+PU3mHTGK4ecDojJqhRlm0yS+XWkTfusiFGIc22zIdAou4lncJ6luIePg+s2l1vSM7MsEa5G6LROTzhZrThYp0gD7hude+xRrcKFktX/hba2B4FF5wE2mgY5lLkYHxbHa09afvpkRPKP+pQ7bL6f27A7bg8lP6dC7gt+Wa+6zXEMZCiGCI7c+XA7+LFd2sLHvXj1XBYEbUHtK+ZVzwapIMdQE5d17r1HO1rBXuHzS5YomrchZzRBif+QcjiNd4lvZ4Mbf5uqRQ69BFS3EgnQ5Jdizw3L9IvtysjLjf33kASQbMpbK6JA==
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
Subject: [PATCH v3 0/6] xen/arm: Add support for S32CC platforms and LINFlexD UART
Date: Wed, 18 Dec 2024 12:11:35 +0200
Message-ID: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0228.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::35) To DU0PR04MB9561.eurprd04.prod.outlook.com
 (2603:10a6:10:312::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9561:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: 135b3d05-a982-4359-9c63-08dd1f4c7525
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NvguuPZOtzVv4277Sbv9gf1jV8ndwBt7HZeiuVQY7ahE7TGNnJgq5sAI+noA?=
 =?us-ascii?Q?94PM4jIc9Wh6FiTzVqfB0zWFp4651DPc97n2vfctiHJVrx5yu4IRODfMEaUY?=
 =?us-ascii?Q?W7pIXRPYh/ms9ipn4qGYSB9HupcDaPD70wCuLoVfjI7PadvM5YB8u+HyAFfb?=
 =?us-ascii?Q?+xV1rN2VjxF2/t+T7JL4I2FzGDA3xzaIUnLG9HBN1sZ1KvntQDLZHWl4k3jP?=
 =?us-ascii?Q?g59V+R4FS0IQWiGOsHye+OBOtl4HE+7UwnJEqJNz003ti6ReOmf0jHfGLdgJ?=
 =?us-ascii?Q?JDBsUdt9rQ2TeaBXpv4ih9eSihJAcnCrGbmTqhI7ic1GelDTtkKawQ5AnON8?=
 =?us-ascii?Q?jUkgy6wTJtPJWtOZnfqopMkzpKfGY9JaYHug9Bedp0P0sA5rH3mSxE5I3zPy?=
 =?us-ascii?Q?gccg53NJSngq6Gx7SCmxZfL9UVr5at0pxQO1QCkI0FElMmmDIfeyrquIEjSj?=
 =?us-ascii?Q?rvA28rAeAIOkrU2l00DBtsRc9ByK2qqvb7mDaXIrEzsj0WSZ0pa+BRonsdM0?=
 =?us-ascii?Q?2NS8FVIV/QGl/8XwGT0qASvnP7PhTX/2cDi6pdm3EG7CTsu7k4BuhMVl0Nar?=
 =?us-ascii?Q?ZeNsb/YjqlBkCxWAEbxHBQ2N1h4L7e9jQaGf2rVGBR4d/2mc+RS9WOOAFsRx?=
 =?us-ascii?Q?dkX5W66kw1U7qMcFgVUh69ZmhiJOY9miJax5aCRvKW5N66LiemrSpN5q/SWM?=
 =?us-ascii?Q?gmTS9AdNnSaK5T+Wc7MH5TzZLavetJDGkM2iRCdcuGFHvomfo7g8C1QvBDPy?=
 =?us-ascii?Q?M5tAcgCLdSLJhP73v+m6I02+5JiQpTqKXsulpJbjpIJCIssWcanbAocfVI0x?=
 =?us-ascii?Q?i6y03ny9h8fR4/x803Tu/o8z7zOY8JtjZxky1Y7hZF49JjF9yjvrbPVr7ULB?=
 =?us-ascii?Q?ejuXHdvUdgim02ZXHubRD8E+41Fch3ErDuct/U3IzbDO9P/grqnDgFvVkYZA?=
 =?us-ascii?Q?hDeUbzz3pCGHznFwj00OSU+GbB2PWrNEFlmqRunZg/2WjPK41lg4Y/v969/b?=
 =?us-ascii?Q?fmZIYVBI21wfIEYSs2mgJBs5Nk0cPPm+JNP38+20OnHaKHO/mCPIhjHuGZm6?=
 =?us-ascii?Q?ByXBoAE82vHhoy1jTYjNTSQAXbRrWMeKLyYV71c30BWIcJrJMVsr76ynk46j?=
 =?us-ascii?Q?pABvxQojJ1zELdo7BnnT5x1R2ulkAmi/K1AT49UEQB1A7iSkLkRdwBxd6/gW?=
 =?us-ascii?Q?2Zdw0r3NRK+/c1Xujrw2XnX2iuiXn0iZnQ4LQmGlIEsYBoPOfEM+kAUw8NPM?=
 =?us-ascii?Q?jNZe9Gs2tbhSLeeLekAU66ElFlZ3nZzJIBY/hA0ydSFg0PQPVh+2nCOgiq0+?=
 =?us-ascii?Q?ZuO/Ha5vG8D77B3Ws+kogZ7D1DdedgB4ZQnhyPDwYujRfvXH11nQJClPi645?=
 =?us-ascii?Q?87qdsDg66ClxRkKYiGpGb/Ngff7ERXAhcb5n4Fdj6pxQM7L9sUOJvAXliSCT?=
 =?us-ascii?Q?674KIdLmRbRta2Ipcjt8XcH57pddOmk1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9561.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uvl1P1FbwzuyMIyEfK01RO00BRyJD3RXXx6jlUNWsw4cdV/25sHd8WoOC1eN?=
 =?us-ascii?Q?2gh9eeTr9FvIw0hUQ6o7jtok/Vx7p6UcNRlN4qgO1ChgzmD9I/RLVEQlw5yB?=
 =?us-ascii?Q?T5eNkKFiSZkc2/TrOP1mOvDMm9hGtXOco+IzDmmUMffUkmigf6sprlpGs6dL?=
 =?us-ascii?Q?aVLAb6vu+qbrY/MrjBq2n/l0DyvbRNU492gX33PRvShqv6amnSPQr0Wo7jIr?=
 =?us-ascii?Q?Yme217m7udqwaGZ2ZmoqGDLC7IJ9vQUBNbolwt4wslOa0VvBRV9S9uYXMMDD?=
 =?us-ascii?Q?OXtDcFWRBwDR+d7dv/ZQ7wWvppU5jDuvVFMtyDzznxZkvk++bI4D/CTlWOLq?=
 =?us-ascii?Q?qEbFOJ7LAjFgONRW8B4f2n51w6jDyMvjZE5VXbPfU7m5OTsewHcNTA0uEWru?=
 =?us-ascii?Q?B35kfehHF/DbaGmeb5TDbPHtVnwstWLyX4PAlShXdYoAuXxMbb9+Zyy4yKS6?=
 =?us-ascii?Q?Lz3mwlE1YvQvBzcLZ//ZPgNZNtLlRtJ64RD3be5cJQ0+LveeV03tMw7c9wrh?=
 =?us-ascii?Q?yQAq96O2jKUkWoF5pyMWwvEnCD4xnhLTybxkm4QZUWDFD2jtP9L3ZVbPebbt?=
 =?us-ascii?Q?WmtYYRYyo1EfWEFMrcpujZT17ABgtqttZ+SIX8uaJbgVFh/ZPdL6+c8fyX3e?=
 =?us-ascii?Q?330ctzso09HfJOELrJn9Q3SKT/t0L+cxFQ6i0hfByFplVACS+hy5mYFOVob0?=
 =?us-ascii?Q?LSJDlSpW2MaW8SMtXidtsPIPjNdbmtnSc7sVLVUv8gfMTZ17L6kCqT1p09xr?=
 =?us-ascii?Q?Cuo+OPU8Y0RkE10q0p18IUFx1wl9W0bzEUkikcHc6Y0uejZNf/heDbc1gc/3?=
 =?us-ascii?Q?RETcBCqRTz9FDVGL/4aZUmetooUY33BtkRDSDq82CfEixok1Nc/gPiAsVwgQ?=
 =?us-ascii?Q?0CLUeUyw5QlEWqAuwrpru7MvIVaBoNHdKaBjG4IhnzBwYwPyL+K+uqHC/3jr?=
 =?us-ascii?Q?iHkasyPtg3eQ26Nrrxc6rW8rIT9+WfLXIoKNksn79W4KEIn10jB/0/TRocfG?=
 =?us-ascii?Q?BFE7LX7oj9EFHPnxv8qw6F3vp+RTU2CjkFn775KJzv29bxyrLXG5y6DCv1eO?=
 =?us-ascii?Q?YQ0lg7pjFPadQHnIW+WviGPMhJLO/K0GPvLbMT2Kj3lzDegOi9JWdVy3hReI?=
 =?us-ascii?Q?r1Fl+ZS8Xem2y4J2N1H2T+IZizmxd5zwxKhIUjfP91RHla/fQR+DbkKgNshs?=
 =?us-ascii?Q?AubRwUQ6YQwjq4P30P13gDKzyLlOLloCLOlR1NvEdytDT5Ki/UD9EolM9SIY?=
 =?us-ascii?Q?E6xE0mWsLCw75yUipPnhUvOeoQ+8UGjurqN1OWWc316KDEVvhG2n1+2WaJSr?=
 =?us-ascii?Q?Qy/vxX7UuBwJnIxLpcYUEpYmXBxPOqAPi0V/LT6VFNuDZ2AWLEpHFzoxv74y?=
 =?us-ascii?Q?GfStzQI/GTKY2M3hqLcaFBLI29oAJ42hojIkeJUDO3CJEALlHc3zOBUTXL3V?=
 =?us-ascii?Q?k0FvgzhSDYfVc+ldtxMQWfnqd/oZXS3XTRzNLZ2G/uAxx0dk5TlFlPt9mYI3?=
 =?us-ascii?Q?EpljzatQOtIGTTiY5G8fnXI86T9jayhTw7lW0Xb1iqc+LQDNsad6qKCocmKW?=
 =?us-ascii?Q?Ft8LNjzwMwrW5nUiY0HiaPbTQg9DNvorhM6UcVi7BIlSbeW0lTS7YnHmjLl7?=
 =?us-ascii?Q?pA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135b3d05-a982-4359-9c63-08dd1f4c7525
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9561.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:12:20.2493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqheX/60QfEk1YgUDekcWGpb2eymOOObfiJ5koQbKhmO4fjeB902lYmNLR3fio/19GrMRPHy4k9qLTWwkhz1v5cRkuoiN/vBIb/7wnnNL/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Targeting: Xen 4.20
This v3 version of this patch series finishes the work left to support NXP
S32G3 Processors [0], part of the NXP S32CC Family. The LINFlexD UART support
patches have been merged in v2. Platforms using S32G3 Processors are not
affected by the TLBI by VA erratum (discussed in v2), and are security
supported without a workaround needed in Xen or guests. The workaround needed
for S32G2/S32R45 will be addressed in future series.

The 1st patch introduces a generic mechanism for forwarding SCMI
over SMC calls to firmware running at EL3, selected via
CONFIG_SCMI_SMC. The 2nd patch refactors the SiP SMC handling in
vSMC mechanism, to rely firstly on `platform_smc()` if implemented,
then on the previously introduced generic SCMI handling/forwarding
mechanism if enabled.

The 3rd patch adds S32G3 platform config to enable the required drivers for
S32G3-based platforms.

The 4th, 5th and 6th patches modify the CHANGELOG.md, SUPPORT.md
and MAINTAINERS files, respectively, to add mentions about LINFlexD
UART support, S32G3 Processors support, and the new SCMI-SMC layer
introduced.

[0] https://www.nxp.com/products/S32G3

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
 xen/arch/arm/firmware/scmi-smc.c             | 166 +++++++++++++++++++
 xen/arch/arm/include/asm/firmware/scmi-smc.h |  46 +++++
 xen/arch/arm/platforms/Kconfig               |   8 +
 xen/arch/arm/vsmc.c                          |  16 +-
 11 files changed, 269 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/firmware/Kconfig
 create mode 100644 xen/arch/arm/firmware/Makefile
 create mode 100644 xen/arch/arm/firmware/scmi-smc.c
 create mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

-- 
2.45.2


