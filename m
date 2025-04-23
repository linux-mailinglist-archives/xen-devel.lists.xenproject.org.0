Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBA1A99AB9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 23:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965475.1356023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hdx-0006A2-Ux; Wed, 23 Apr 2025 21:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965475.1356023; Wed, 23 Apr 2025 21:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hdx-00068U-RO; Wed, 23 Apr 2025 21:28:33 +0000
Received: by outflank-mailman (input) for mailman id 965475;
 Wed, 23 Apr 2025 21:28:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbtc=XJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u7hdv-00068J-OD
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 21:28:31 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2412::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5d6719b-2089-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 23:28:30 +0200 (CEST)
Received: from BYAPR02CA0018.namprd02.prod.outlook.com (2603:10b6:a02:ee::31)
 by CYYPR12MB8961.namprd12.prod.outlook.com (2603:10b6:930:bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 21:28:25 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::ba) by BYAPR02CA0018.outlook.office365.com
 (2603:10b6:a02:ee::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 23 Apr 2025 21:28:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 21:28:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 16:28:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 16:28:22 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Apr 2025 16:28:22 -0500
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
X-Inumbo-ID: e5d6719b-2089-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrWwQ3Hg4UDEyMTj5NE2vrfuQc2CAuAj1Hd2uHgvoqETEonWM647KeQPeG97wzgjhaBc6jGsoXTXqdfi2oh38FKNYlpzSGVa/vo2Ohvq1X07If471y7eIzNZquV3blE2Zc5r1UIC1m8ZXSkYJBQWSVeqR2WJFrV2NDhyeilneMDns1Tsd+l3Cr4cUT+kfzVltE49IVfnrtf14djKFSGXQzhYwG59V827AAsu2qNir5D4sn+qiCdxHSd23cXKVpXdoMhWYHExc7XXiZZJAJLXNlbl732NxOJT3cfKewMGhOsVxQZ7DFirgNIlO/OsFLoOkDUNl5tq9ZzjP55Hi8RonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCPl/lAfP33+0hzm6bFSkcVC3gcsNunHg/zQBvPExdQ=;
 b=o+yQ7TfNJ+TtShkGYCnGL7ipFvSisVbHQ13SpomfuipIwe2JSfTYGvwlS1Td79nBpwPsWmMZa2CiEz2f4ipwKXoqF3kvvx0rYL1G60zQoDmfXGXuqlibNIHmamTr+u0QB42e0J+qOanLGWSEqSq3BWw0IdmxueWLr4EBDC/YQQ5DnQZjdH6M3t+ux0dkT0LT2ud3a/zsQznQYcw0R3Aep0YgmK+qSuFjU0sutPvqAmHIwo75AmdV0EL4ASxDARxZ8k7VaNwwT+Mt6I13Pb9NhHP4TYG2YIqGa4Lrys/1OEncSI2Vg+ke+9YBdQtVCTTYzoJ6BGMxtl9TwnjF9vdqyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCPl/lAfP33+0hzm6bFSkcVC3gcsNunHg/zQBvPExdQ=;
 b=qCB5LUblmEuDAX41MV8ch5R6Ees1ySFOnWvd9l9CtQhumklHFlRFFhiBscej1dBks8Jx3zGsr/Id97pC8i4pxrYQ3Jm9GTYKBPuLfteyXie2tWXVKftLhA7rN1i+ezHL2WpFKD/cjIQUt38aYXAyOe0cqK68cnBDDOXbaObgKuc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH 0/2] xen-hptool small cleanups
Date: Wed, 23 Apr 2025 17:28:19 -0400
Message-ID: <20250423212821.42776-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|CYYPR12MB8961:EE_
X-MS-Office365-Filtering-Correlation-Id: c2938a84-89ee-4069-1061-08dd82adc73f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0eDnFZ7oQDnwlmKZV6I0FT98ZyLFyQ2iY7MLzAId8vhKI65FQfbTr40RvpHw?=
 =?us-ascii?Q?F5Ujq1sikrD/lFvNab7uwTzxu0xV0e1h96LPIV048rn2zPES/rGNOGuQzQcp?=
 =?us-ascii?Q?x4AyoyQvGu+WIiheOOZb4VteHipQpEEQQ2sOjgYwUSMmlBdcZJu6+fDanWtG?=
 =?us-ascii?Q?qIq8Ry+/F2KxYAt8olW+XE1DgsuxJmMTEj16TH6zhUrEAUdtNQ6RzoYh1F7A?=
 =?us-ascii?Q?sOXPHVCP9sUfIGyLAcafo1W6dtbzVmC63kV7HqSQC3p4e+FiA6Q6IBueT1aF?=
 =?us-ascii?Q?gq+C2we96wklIZ5WsEDmWL9I3sj0J+RVun3ZLeCpj1R1HRjk4hbPbm/ZJigu?=
 =?us-ascii?Q?H8dg3PAORezj/hyltyY/++YnBQDTXdHMKTqz1kPC7VYR/SgwYq2cJBM+CTjw?=
 =?us-ascii?Q?poHCbqeNkcu0D/zGIUuglNGsCHqJzmm7ssGMktAy49LNzztcrZBIvGxeDFku?=
 =?us-ascii?Q?mw9JqpgUdGHgrpq0mdhLGj74peFtEyjtRAW7GKWp40W69BzW3J2tNiGY62e7?=
 =?us-ascii?Q?XqhM3qhrq4pva5CEdtfItFDkb/C2/RY/zOeu+Xo6nF1L/dXJkeBhE+46LvUO?=
 =?us-ascii?Q?OSR8QAWmQV9Pl9LDEK7BMxQWtHJTXXI8jf9IAZODMiYS2JPiBlUGnzJE6whU?=
 =?us-ascii?Q?5E6vEudxYcSPnoHzpF6bdPt+aO3EdNODQuHgKvRoRhaY6yoJKH9asrccPlxs?=
 =?us-ascii?Q?/t94Pbug4h0zdRbefQwWEpRVgT9bo/CbHdcIQIzpi5KCEHgZdzBYVsjjhLMR?=
 =?us-ascii?Q?aL5q0LzYvQaZZfpzdmlOhTckcZZyPCZ/DgqJ5nG9veNKGyrdDdnyu8AALSl6?=
 =?us-ascii?Q?y4g8PZ8XyasztHf+I+7xoDEfP3LMJE4YOocXiMwmiJ6tFzJ/8wgDr5cf36M1?=
 =?us-ascii?Q?DtDfk3rX5wmdrbijwTmjTy7LfH/eW8b1bo1IG1vVDnQ83f5122C045gfQOkp?=
 =?us-ascii?Q?cYG6QQkiotUw3OEDdmA2H7+k00C0LKZihxcJiWeQPT9SZ1g0rj/faueMGVNU?=
 =?us-ascii?Q?EtoMlOPM0EcyVQ0kzMAq5Xfmne003Ga9zaVn6PqbUG4eDBJBEgmgMSchemHj?=
 =?us-ascii?Q?/oqUSWo+vUpRn8BINKd0MHbz8vxNseAkH7WvQC1015omlvBqDXOTievq8GI5?=
 =?us-ascii?Q?3fkQmWL5+Dqz1xSWZiOz1rzWThWv052nmLgwUlu+nBNBOfsA8/+I555LHNp4?=
 =?us-ascii?Q?cXXY+kjJxD/5oe+nv8tqIjiTxzmKyDcFaTyTgOsiwbsuvQ4km3O3AkgE5TWO?=
 =?us-ascii?Q?3/4x3qRC0vH9Oaq/5WxRWqI3ElHB+0H4f4uYr0/jfCd+G/lnNysNLrPZ1oAA?=
 =?us-ascii?Q?ruQwpTI8rqYFA8JdhbwevqSZfFeENChEZyanXLTRSU2IAQOF6LsuNfnscT4l?=
 =?us-ascii?Q?ZG0GKsPJpfSyNMp66bvoOMVlCydaLO2tVI9A8GB3zw7/OmLdx5h6+ThV4ELe?=
 =?us-ascii?Q?YccPmekisa8vVKef4GQ8XP5TaO22+7RtCO6QMIOl/TcsjxWTzemUAiSDtOpy?=
 =?us-ascii?Q?nkb2OAM9z6v6dRmc9PaieKoBC+RY9AU/+ydg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 21:28:23.8824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2938a84-89ee-4069-1061-08dd82adc73f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8961

Two small cleanups for xen-hptool.

Jason Andryuk (2):
  tools/xen-hptool: Add missing newlines
  tools/xen-hptool: Replace hard tabs

 tools/misc/xen-hptool.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.49.0


