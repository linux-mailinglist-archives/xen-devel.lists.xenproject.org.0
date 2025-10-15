Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CFABE0426
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 20:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143906.1477483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v96Zt-0007TP-Tf; Wed, 15 Oct 2025 18:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143906.1477483; Wed, 15 Oct 2025 18:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v96Zt-0007Rw-QD; Wed, 15 Oct 2025 18:50:25 +0000
Received: by outflank-mailman (input) for mailman id 1143906;
 Wed, 15 Oct 2025 18:50:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nzz5=4Y=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v96Zs-0007Rq-Bb
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 18:50:24 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccc333b1-a9f7-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 20:50:21 +0200 (CEST)
Received: from DM6PR08CA0058.namprd08.prod.outlook.com (2603:10b6:5:1e0::32)
 by MN2PR12MB4062.namprd12.prod.outlook.com (2603:10b6:208:1d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 18:50:18 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:5:1e0:cafe::c9) by DM6PR08CA0058.outlook.office365.com
 (2603:10b6:5:1e0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.11 via Frontend Transport; Wed,
 15 Oct 2025 18:50:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Wed, 15 Oct 2025 18:50:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 15 Oct
 2025 11:50:16 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Oct
 2025 13:50:15 -0500
Received: from [172.18.10.234] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Oct 2025 11:50:15 -0700
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
X-Inumbo-ID: ccc333b1-a9f7-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHmcBfEoN3x253HX4Zu/ewgko+ENrnEqFUJGXgjk9F+UiWOUXajqxOcEfDH76JpivX2lUex3Al7tSUyI5z5MfJ1tD3V94limW8DXELXfnSnORS+WOtumqptS/q4BpHlTQ9Qb+PXcYLnxKRbezJgwJ1Zzf+64zyCOxW+4K0vY6gv38OeeTiDG5usUP9YjE8Dakj054PtThLVakpWw6AcfkGFxo6sschCflzVwqNkp/V+H/R8zm+kZCmyHZwCnFhLrG0+oQ0GUEhr9mFzxIjksRxygiwZR+9kAyfJqkjSA8/Hg742eB5wsmZcXSNUNHpBOGVd7uMnhemFL9MAj6/Cx7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzYYdd6yASB1df4nN5ksjUGYlWqBQJBhElXxtuZkeZs=;
 b=y4b+EHrbwpAbFWALRgwrMgwj54dntblGXbJMlI2e1U4aBPNK06hY9QsyyZy5GsFkKq2ow8IVCikSAmA+evXak1vxfTMZnjBknDy5tvERsn3f4Fnc9Ca1LOIdBYCIJjAoe8yiHLOJ74bayG4UKWjn03ClMjyT+qBKc/uREWLoUPdLrSJxQZyvdduCo93EAOddndUMhv5LF6isVh8p/ex07XI79jRAjx7sJfYIoB4Vx+aelAOuIRnRHImvjiIYDw0iCJYifVITa0nLcQmgJpnBvye5P5vSwhklNMpLGuybJMMPgBnDQHFl36BsPySrZjnME5v8sfuiyDi385/2Zswgtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzYYdd6yASB1df4nN5ksjUGYlWqBQJBhElXxtuZkeZs=;
 b=5fZZI7nf31JheWZMJbX5nRdvSwEEcRXF+gY0ox72liRAyPLkDjYj666ADjqCx3JspdQd6lYOACmCSmqJxshVBEKRbwUhFhblmwUXAcmiW4LRNYo/0yo8obVBWoOCvqfCj0UuFKUYTszm0Jfag6nZ36Zj9wMe7tV5yyUKM+01dHA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <01bb3ad5-31ed-4690-8dce-aca4c7aa888f@amd.com>
Date: Wed, 15 Oct 2025 14:50:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 2/6] tools/libxl: avoid freeing stack rubble in
 libxl__json_object_to_json()
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: <oleksii.kurochko@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
References: <20251015134043.72316-1-roger.pau@citrix.com>
 <20251015134043.72316-3-roger.pau@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251015134043.72316-3-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|MN2PR12MB4062:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bda1019-364a-47d9-af3a-08de0c1baf7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0cvc2t0TVNEYWo4aUxNM2VGWjdZRGYwYTBQSFM5ZmtUY3p5VzQ3TUNzQmpE?=
 =?utf-8?B?cy9Dc3VQRE91SEJqZ1JtcDZjZWNuQUdoQ2h0NVJmNFg4ZWRBUHNaazJnaWJ1?=
 =?utf-8?B?dThKSTZ5MUxETXU4WGx2ZXg1b0k0Y2hKNHFuNWQ4WGM5ZmpXemxoeTk2REdk?=
 =?utf-8?B?eEFjb1poVzZsc0F6K2UvL1NvWHdFS0RhUkZxUGRwOUw3NXFDNTV2dXJaSFNp?=
 =?utf-8?B?elNSaG1abysxR2VrL09QeGFaS0ZidlhaaUNjcUpuR3hLMGNiYkt6MlFoTWhl?=
 =?utf-8?B?VWc3ZlVPK1ptTTM3dTR1WTFINVFxVG5pM1dCdHFhdmNtU1FEQ1VRSFNoK3RF?=
 =?utf-8?B?R3lXd3JrekVWZ2xOdTE1a0gxRXNPSGRjdlNOU2luMDAxMSthZ3cweW1FY0FC?=
 =?utf-8?B?b3J4VUMvUVNsOHJzT3VRTUJvRVZSMVRzRC9CNnZqRU8wbHBWeFZUaEdGNUNP?=
 =?utf-8?B?RUFMZDBmZUZyejlxYUgydEdrYW9EQ2l6aXBrU0F0VlVaRHdIQnVscncrZlBQ?=
 =?utf-8?B?bnJXWmhvMUFtVnBGV3BhSi94YjQ5MDh3b2JZZmZWRnJSRHZQUEszYmZTT2Rj?=
 =?utf-8?B?VkYwdm1Kd01zS00vOGJGdUVMYktEUnJXWk9SRzF4UWdnN0dJQlNjc3l1ZnJG?=
 =?utf-8?B?dUxRd2tUSC9yeDFzT3ZxK3E3eW9POG5XWUlDaHBnZ1IzZU9qTE8xVnZneTdE?=
 =?utf-8?B?b05lRHdRNU8vaFNySkNyR0ZsYzJkUmhkL3dmWWJiSld4Tll5RmNweDcvVmZO?=
 =?utf-8?B?MC9NSE9RZ1h6cTZIa3l0NC9mTFFJakcxbVFsaGtHb3dmTE5OTlBkQkRsNjdH?=
 =?utf-8?B?bnBpUnNwL1NzdEZkYWM1RDRwcEVOeHpKbG9pTkNrY05XVlp1dkZhczR4bDE0?=
 =?utf-8?B?YWU0TTJEbkcvK1RlM3hiQ0NHcngxbTBxTVF6clh0NVZVdzJFTkZmR2M0d0N5?=
 =?utf-8?B?VzdYYXBtSW10TjhJK0ZOWkVWbnZ1V0pvYmkzU1dHblRhRGdTS0FnNTRyR1NC?=
 =?utf-8?B?OERhNmVPNmFsdDArclNVM1N2ZytyNWNvb1g4KzNyOHpPRkZnSjFoZFowSUZP?=
 =?utf-8?B?ZlU4ZFA2R28wQXBYYllmQXdZc3JTQ3dIbThFUDF5Y1JyQUFLUlZFM0lyczdz?=
 =?utf-8?B?aGFMT29iWDFtc0Rodm5BcnlpYzkxL2FQTndTRzdaZTJpZlk4Rjd5dU5XaGpG?=
 =?utf-8?B?WEYyU0ZMbTJDY3V6bm9NK2FHcFJrREEwU0oxanlOSTBCMXUxTlF2RTVHM0pF?=
 =?utf-8?B?L3crekFVUzIveTV2TTYxc3JWUk5rYlUwZUFaTUJKdVNKZEdzVDVPeTdoTHBs?=
 =?utf-8?B?eEhpb1dOYU51OGxMMFpIQkVqa2ljak0vOHBhR1g1UzR0Yy9MRnZxQ0lOR29E?=
 =?utf-8?B?RGExZ1g5V054SENSTFdhZ2E1QmZVRCt6QWxuMkExb1BUaHRPS2NDQThUK0hS?=
 =?utf-8?B?cTlhL281SjhnT0diT0V6bktQNDhCTm11VG1DQzI3K3NFcjVZNlRmVTRrWmRN?=
 =?utf-8?B?N3MxVXNTVDRYcmtNeU02eHVCUk1BNVhMT3RBVEpXR3RwdHhuSDVMUDBUR3B1?=
 =?utf-8?B?NERiQ1FtN09jZDM5blVyZVZhcVl2ek4rVEZFTnJIVTUycXVFMlVLRkJEMTg2?=
 =?utf-8?B?eFU4TFd1UktxVlExc29DbDRiMWU5SThFMWhUNUtxak10WjhsRkliTGxsK2pL?=
 =?utf-8?B?eGlNTTFjQUZsYXorSFZiV3JibStzdVNmeEtNbVJLcUFqSEZyUU44emtvZmlz?=
 =?utf-8?B?VCtOWmFDSmhnTEg3N3d1Wng4RkdQK2V1MTBlb1h4L3Vmdk12K0l5MVBEN0RV?=
 =?utf-8?B?SjI3K2xxRnIxYlpFSWIyN2dKZVZWS1c1dkpVdlJDa1IvQ29odXluMWJUaVQ3?=
 =?utf-8?B?a0dLeXdqc1MwdjJZMS9TbGxROFBZWTQ1dzVZOG5YajNrcXY3Z3lDU1hBei9Q?=
 =?utf-8?B?TW52cUJtT1poVWo4R1cwc3BhdHZUVVpuOUdnR0JpcHB3MlA3STVtaTUveDdp?=
 =?utf-8?B?UVRaMFk5VUtHM2lZaU9mdG1SMWM4U2lrdnRMc05IcHh6V1ZDY3psZXlWTDZp?=
 =?utf-8?B?eFVvK09rNWlvWFhhWGNyZThMUzNhUndSVUZHeWtycU10MjR0TmZYeVNORHFI?=
 =?utf-8?Q?xdjo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 18:50:18.0239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bda1019-364a-47d9-af3a-08de0c1baf7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4062

On 2025-10-15 09:40, Roger Pau Monne wrote:
> It's possible for libxl__json_object_to_json_object() to not set the passed
> jso_out parameter, hence initialize it in libxl__json_object_to_json() to
> avoid freeing an uninitialized pointer in case of failure.
> 
> Reported by XenServer internal Coverity instance.
> 
> Fixes: 75fa670e582c ("libxl: Convert libxl__json_object_to_json() to json_object")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

