Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B429D9C4C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 18:20:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843945.1259515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFzEM-0004aW-IH; Tue, 26 Nov 2024 17:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843945.1259515; Tue, 26 Nov 2024 17:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFzEM-0004ZQ-EO; Tue, 26 Nov 2024 17:20:06 +0000
Received: by outflank-mailman (input) for mailman id 843945;
 Tue, 26 Nov 2024 17:20:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzfN=SV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFzEL-0004Pz-JR
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 17:20:05 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20626.outbound.protection.outlook.com
 [2a01:111:f403:2406::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7b90930-ac1a-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 18:19:56 +0100 (CET)
Received: from DS7PR06CA0023.namprd06.prod.outlook.com (2603:10b6:8:2a::14) by
 IA1PR12MB9032.namprd12.prod.outlook.com (2603:10b6:208:3f3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 17:19:50 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:8:2a:cafe::f5) by DS7PR06CA0023.outlook.office365.com
 (2603:10b6:8:2a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Tue,
 26 Nov 2024 17:19:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 17:19:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Nov
 2024 11:19:49 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Nov
 2024 11:19:48 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 26 Nov 2024 11:19:48 -0600
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
X-Inumbo-ID: a7b90930-ac1a-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwNjo6NjI2IiwiaGVsbyI6Ik5BTTAyLVNOMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImE3YjkwOTMwLWFjMWEtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjQxNTk2LjcyNzg5OSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lmz4W+cnNuqashzG9E1//MLpO/eop6VvKf4zxIP+0Ul0mteimmCW/vTNL1fKBJF3XMLTpTaV84NSeamg7pXz6xs8MMoX9goHvugYUhDXqaa0pJ3z82HN8Awej0vMt+h9uMDZdNaaJDsTplpBjwJRC/4D6t6z2WOjlq0GfjTewPynD7/2nyihqvs7KyBzuX1mYjfD6KE0HTpyBvtfh5YprwWHNNdZ5D3vSFiEdR38PzoqIoQstVdrHx07ZAgfdU9/ZbeVikXG17wQ/yQ0of/1AUy3KvZul5/b8HoEmHGtdC+I1C/IdT8R09dCfsE0o5Njr2IXs/cZU+AxhHMGhLaUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgUbu1p1G8VrX+7vvopPeVN3XfOcljEX1p1X+gAqQc8=;
 b=wtdgL9N0skrOaiWAy8U0o0Asd7N3LQcIIACw5YmzRXu6fgvbWX/myxs2TEYVLTwXuEQQOQtWVXN93lVAgbkmVW4fXj0gV1jH4USfkVFrdrlW7dVUXevtSCMANx3Rwtzf141jxrSiLEmIYU3v6wrCBDUtaB+muwhEWJzWA76c6LvrEM6JHG7WeWkzhNic/aoI0rgzTwrD3K2RSHq177lssXArGLn24r/lo8PwetyViQ7VI8W3LtV2VOCinFLscZykHanGYyFNv1GoHbZvBKEwzO1U6aPNgcTpN6zvxPTLIw4O33tCtqQs7o0rX6mDpq4aggZCkTBVehW2kOoo5Avs+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgUbu1p1G8VrX+7vvopPeVN3XfOcljEX1p1X+gAqQc8=;
 b=n0kx32GRdRxwSmiMVi9twAN8F19UecKc7MGCzRozbe6CZQfuzqUtF9z/mvzC4dBNU6YaGunoVRPFXRpoERH+5jfqihyfaJWy6Nz9oxVudUhHTrkADbbIsjnmp8vrSsdTkKhzkYm1iydI9s8LNQsm0InjseYmWoxVjwgRpVcD4Dw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v2 0/2] xl suspend/resume commands
Date: Tue, 26 Nov 2024 12:19:39 -0500
Message-ID: <20241126171941.170897-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|IA1PR12MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b654aa-95f1-4ae6-d386-08dd0e3e88a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjNHeXFrVkViNlZXblAwT29QVkJYKzd6bHdVdTVJbzREUGRRU3lFZUJtSk1C?=
 =?utf-8?B?Zk9ObXFRWkN6V3p3d3dnb2IrazdpRVREUVhaYVJqcDBsSkhaOVUvUkNGd2Z4?=
 =?utf-8?B?K2FuM1ljdDI5amdOVjNSOUV0V2Y4SFM1ODg5ZXVTdkpnTnB5OVU0ekkyK0Ju?=
 =?utf-8?B?Umd2NU00eWxvYmlPMWZGc0N4aFRRN1hEUiswQk0yNXBhTGRpd1p0djBCMGNy?=
 =?utf-8?B?cjY3SWQwajAzbDNVZmM3ZktLL21vOG4zeWcvUWVmQlNRMmdTbTJhaXUrNzY2?=
 =?utf-8?B?MEdUME1DUW5vb09kREwxZmRrcFNrRE9QQ2c3WDNaWXlGNWJsWUYyM3ZPY0Ja?=
 =?utf-8?B?ZTRLeW9lMkFGSTAvY3dUQWttNWY0ZXc4WFllWURqTHhMTkJJWU5abGw5aVB2?=
 =?utf-8?B?U1M4Qk9nanUvdHZFYzhqMDNkRnZiZzYxanJIbi9Db0YrL1JZVFgxamEwb05w?=
 =?utf-8?B?VGprdEN6L25XcFRrQ2o3VlV3MkxIazBybjMrYnIxUkU5dGR4eTdzRzJtU3lR?=
 =?utf-8?B?OVZUVEN1ZlVOcWIzN0NnVllvdDNDc0tPZDluTGhFWUhaUHh6NWxRRTZtRjYx?=
 =?utf-8?B?azdoL25DZkVhNU0zR2hRQ215VzFNbUhZTHd6MnVOS2ViRFRoSVlRUnNtK29l?=
 =?utf-8?B?eVNMMGpUUitUNXIxR1hCVThBeDlnSGk5VFljaTBBYzdEZFJiVkIyVnBLaE1W?=
 =?utf-8?B?YnJsdFNUK1VxMEk0ZUlKMThscmdvVHZ0V2hDZ0RENk9nMlNBZEhvMzhDc05y?=
 =?utf-8?B?azFVZ3U4Yk03V1F5Q3JzSGZmUFl2TGg4VlpLdGQ2Q2lvUDB4aWVrcms5d3Vv?=
 =?utf-8?B?aVBrc1FITmljTFlHenlqUzhXeHNXZXQzTFpOMEFJOXBMMVE5SmFCc0tnWUc2?=
 =?utf-8?B?ZFljNkFRYUJJbk5WeDIyNHB2SEVRUnpVaThyS1grYWs2Y3h0NERJUzB3L3NL?=
 =?utf-8?B?TE50dlRVS2oyYnZqWG05YW5ibXl4NWw3R2NHd3FnM0IzL2JvS2RyWlBkY21y?=
 =?utf-8?B?TUxFdFluUHE4SjV3QkxvMitmUlJkS25LUWxOVzlLQjBSbUhmRlNISDRsSWdG?=
 =?utf-8?B?Rk1pRWRFREJySmF6dStzYmRkdXpLR0s1Qkg3Y1dnbFR4WXp0c0pyWGtHY2w2?=
 =?utf-8?B?WFJxZURyWkphdGJBNzNpTnVoRmZWYSt1K29OMTJ6UStjVUhvcThJU2J6aEY2?=
 =?utf-8?B?UE5iSFU1K0ZoY1hZSzQrWkNhMlpSbTVXTjIwTjJyeTRXRi9pWkdTTFdYT2lh?=
 =?utf-8?B?cmpnbVh5dXZSOTkyV3lXajBOU0hVMG9Xd2lmaC9VMWg1VEo0WU1MQ0p5VG5S?=
 =?utf-8?B?SGlzZ2VvNnVKNzVhbkRMVzN1WVBYOU5CR20wbzRZcTV6TnRHbjZuYXAyYWdP?=
 =?utf-8?B?ZVAvQ0w4RVkxd29uQUFGK01nYlQ1dDV4N01zOXJtNGZDWWhXeHFxdnkwaXlz?=
 =?utf-8?B?cWZBbTBhc1laY3N1c05kRkl4ZFFDZkxyYlVXMG1peEdzeTMwbGVKTFoxaGtB?=
 =?utf-8?B?N2ZmaVE5dTBuOWptb0hrYXRLc29mQUU2OU92bEtvdTRIdlFDTElVcW1LMlRo?=
 =?utf-8?B?Qjdtc2ZLU1NDTnJFM29ITkpvZW00Y29hS0phL0NSUHdxSVdYZjZZR3U4RDMw?=
 =?utf-8?B?Sm1aRnVGNFNTSkYyVE1CWFRBTE5pYkN2Q0grSjJaZjFaWWhrWkd0ZXRyRVV0?=
 =?utf-8?B?YXNYZmEzT3hvMmIxWVlVT01nd0lFVi9jalZuKytneUs3Zmx1Q1R2QTZnNTVG?=
 =?utf-8?B?ZG9JR253Ui92NmdzdndhN1ZJdkdseU5Ud0dkaDdoTllCNllaSWZDQ0dZWVhL?=
 =?utf-8?B?ZmROMVN1SGJ0OTVLTS9UUm1qQ3I0UTN0c1ZYNTNkMDllQ2ZLcWMwVmNQUWZH?=
 =?utf-8?B?Q1d0YXJFUDdDUU8zZzR6WHNOeUVRdTJpVTBsQStoZzIycElXVkh0bUhoMTJX?=
 =?utf-8?Q?5Ir3oRUkpMmaGAmAUyI3es7flXFyqtwQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 17:19:49.8452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b654aa-95f1-4ae6-d386-08dd0e3e88a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9032

This is a v2 of Cyril's implementation of xl suspend/resume.  This is a
cooperative operation like libvirt's suspend.

I renamed suspend-to-ram to just suspend.  xl also needed a fixup to
avoid exiting when the domain suspends.

Jason Andryuk (1):
  xl: Keep monitoring suspended domain

zithro / Cyril Rébert (1):
  tools/xl: add suspend and resume subcommands

 docs/man/xl.1.pod.in    | 12 +++++++++
 tools/xl/xl.h           |  3 +++
 tools/xl/xl_cmdtable.c  | 10 ++++++++
 tools/xl/xl_vmcontrol.c | 54 ++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 78 insertions(+), 1 deletion(-)

-- 
2.34.1


