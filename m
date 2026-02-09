Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLYYEGnxiWnGEgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:38:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D99110987
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:38:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225494.1532008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSP9-0002xC-0k; Mon, 09 Feb 2026 14:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225494.1532008; Mon, 09 Feb 2026 14:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSP8-0002vE-U4; Mon, 09 Feb 2026 14:38:22 +0000
Received: by outflank-mailman (input) for mailman id 1225494;
 Mon, 09 Feb 2026 14:38:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EeIc=AN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpSP7-0002tn-8q
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:38:21 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7113c48-05c4-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 15:38:15 +0100 (CET)
Received: from BN9PR03CA0926.namprd03.prod.outlook.com (2603:10b6:408:107::31)
 by SN7PR12MB7450.namprd12.prod.outlook.com (2603:10b6:806:29a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:38:06 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::33) by BN9PR03CA0926.outlook.office365.com
 (2603:10b6:408:107::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 14:38:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 14:38:06 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 08:38:01 -0600
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
X-Inumbo-ID: f7113c48-05c4-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+H+KWWznYDZbzRocsU4waH+x7nlb0rOSWPx+Tcw1ePoU4A8rzAbs5CPxD9ipbjELLzBvgj8Tdo2xr4aLBk5SWhhhf90v4eqp1snKfX8yFDpbCfTf4k5epjI6+qCyUSHC0B+YSAJwGPe1EWX8kGD/6yrH1oS236ZZc7vmF6vOQU0A/eHjlSL65MLIWa6RiL7BqY1OCOQr/RUuLODiSiM4OBd9EZBWuYKlJNJCKErg6hoEQw5cjcjGMIvMgDlpebkEh3X6GRMzJ1hFl670IbWsbiZK+wVm2AmIVIlRCiHiTPeEQcCI156dIPpED1Lj3pPKqVmmfidF6ynZjFu1PQ0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gn12UfPFihhH+wxtx1AeC7kZFezimNVmrRvx7f0cUCE=;
 b=Oh9J7H4ByCIxnCYJ1A/7+0BY5DbnZaEle9Uskni9rnNkActXL5+c32ONaMdu98OwTDChPlAS4uNNO6OY8yiuBMdPybF2TQG6+7YHTC1u6mn0yeSKP3RHws9nR7wXPCCumei16H/GYPXhgMVO3Xb00M9b9kUFNINCyOro0oEkYWbT86wWrtisG6q+qpa5r4e5tI/JO9k5yJoat7f9+hvrRfqzXHWWISNSKWoE2N1m1btfmnGS3KNgGaL2DrtEzb15WXFUdtVhW6XzqyoGtxdJAkMY4BDfSszu/+9tRO8K696z2NEHA643I23n8dA5k1FJ4AfOMVMRB0Nkap9a5/1I/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gn12UfPFihhH+wxtx1AeC7kZFezimNVmrRvx7f0cUCE=;
 b=YqJ9wWQe7mE70OSlaKEAHjofHulOqsMA+eK+dKq4NAJT/vrj0XJ/s0HHUwVNw1Q+8PUtCKmM+PmMstXAlBddtmWU+e7+7FC5aSyqgi/nds6XUz2ckif3qVF5Nn+3yuPwf+4a7pFlr/OOEMyRd/93Ru5nLpBANks5xCX/ER2AohY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 15:37:59 +0100
Message-ID: <DGAIAEFBG8RK.3EP3TSR06KTOZ@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 00/12] const-ify vendor checks
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <608472d0-517c-4bc5-b5c1-c278c4f6620b@suse.com>
 <DGACI1R7MGDO.1SB7OMQQZ1NC3@amd.com>
 <836c1ef7-4ec3-4c4a-b527-17066327ff19@suse.com>
 <DGAEV1NFZF2A.2ATDMEFZAIZ5S@amd.com>
 <57c4d4d5-5588-40cf-919c-1e337328858f@suse.com>
In-Reply-To: <57c4d4d5-5588-40cf-919c-1e337328858f@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|SN7PR12MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f289284-3833-453e-ca17-08de67e8d6b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjE1L3pOZExoRlY1aDd2UHlTdzRLOFR6MFpnRHMrUk01SE5JTWQ1Qmcwc3BX?=
 =?utf-8?B?K3dYdmpoRlVibDR0REhBcnBna1A2SmFyVlNRc2xSdjh2aVI2Y2hvenhMdlFh?=
 =?utf-8?B?bDRwTzArSWJVR2cyZzhzN1lMTGZXNzRWWHpJKzZ1RGlJSDh0REdBdjQ5WC9y?=
 =?utf-8?B?eHF4aHJPWi9tR1hyTFRrMXV5NlV0aGVwYUd4TEZ2ZUphSVdDZGhPd2dqMVlk?=
 =?utf-8?B?QkxTZFlmZEpRZXJlT1puZmpOblRSMGFteVZlbVpTZ3kybXJWZ3V2YmtSeWtQ?=
 =?utf-8?B?blFLYlZXQ09LeW5zbGVUbG1DWm52djVRUzhscVpsRkxFYWlGQkNLVVd6K3Mz?=
 =?utf-8?B?eU0zdlVyYWpiYStqeE5SbzkyU1puR2ljczhrSTcyUUVKdzNKK1NVY3h2R01M?=
 =?utf-8?B?SncwcEVHYk41MjlZai9oSGdHOW5wb2hoOGxDNWJ4aUFvT2ZHVWh3R21aRnJC?=
 =?utf-8?B?eUdnRWd6T1FLQXgySlM2RVJXck82a3hzZWZaV1FVeEc5cmJhZTVITnhXbmxW?=
 =?utf-8?B?NGhoUTFQMHBtUTNJdG9pOUlIT2JTRFUrL2lQVlFYdm1WRFN0MFFvN2c0S2dr?=
 =?utf-8?B?cGNVUDJoemVGWXlJQzRTNjRlMU5teDM2QkFIam80UXFNZnFBY2tFRG1oUjQy?=
 =?utf-8?B?Rmh6RksrR21VcnRCMVd2WjFGcUVOWHFob244Qm5rRFFTL1JPdXp2ZHJMQmtC?=
 =?utf-8?B?aEZGWWx1L2NraWt2S3BDSzgyZUtINkNRc3haMTNjUEV1dHVTM2FTbDlzQUs1?=
 =?utf-8?B?RWZEelZNTHBDMkZmR0t5WGtTdWhCeE8xTmYrUmduRzVxZ050N0RiaW5HanJR?=
 =?utf-8?B?M2dHd1VVZzR2QjFMWjU1YXFHa1RVdXQ4ZGVFNFF2OFBZbCtJY2YwdzRKMzMr?=
 =?utf-8?B?SGhXdlFQcWhudDlaQkpDMGJjQ1k3MCs5REk5ck8vSW9wRTl2cUc2dUVsd1BU?=
 =?utf-8?B?MTN2QkhyclFLNk1zK0svQ1J4cjc4ZStuZ0NaV3F3WVVXdE1WY1lPeTUwWThJ?=
 =?utf-8?B?RTZ4MEEyeDI2blNqVW9KS2tFVkxUQTRSSktZajU5eUUvOU83NjRaRHFrR0RT?=
 =?utf-8?B?WG5zdkJidmxwMVkxWjlibDZYWVRIRUZoc1ZZNnlMMldrWW0wVG41QTBlZmwv?=
 =?utf-8?B?RWNsSDg5ajJvMzJQK3dVa3k2MFJnc0R6djJXSTRXSlRZdUxwME15ZngxVFE2?=
 =?utf-8?B?cFZYYXFtRGpWZjRwTWNmVHlWUDVuRW9uTmEzeUNmL3hzaEdpQ2c4V0Rjb3pH?=
 =?utf-8?B?VUVHTnlKUlRIMUs4SXYrMEY1a3ZTczBGWHh6bG5zUml0aVhnR0pJSllEL05D?=
 =?utf-8?B?UEFNU2o3RFY1ZGFqWjJjUGxnKytEanFFUy9heXhsY2gxUXYyaklpSXFCSmpM?=
 =?utf-8?B?UzJWN2Q0QWlabWFSLzlMWWRSMDMyOCtmMjE0R0hWWEFsVzJpQUFqeFB4Zzl6?=
 =?utf-8?B?YTlKcUNZOWozWklNckg2eXdZYWhnNSs2SHdDOHRkZTZtZ3EyQWVRdlZDWnpH?=
 =?utf-8?B?QkJ3akV2SFEyU2Y0Nkl1UjRXTDBwZW9STW1kb1F6YVR2WC9IS3FZQTRpN01Y?=
 =?utf-8?B?YmE1R3puMGg4aFlDRDZ6cTZtQmpQNXJ2cHRDS3lVTFRKVGJRMmwzUDhucEFC?=
 =?utf-8?B?aDVuMFo4N0d6Qld1K0NobGlkVEdsODdWcXgrUlU1dExHQStSdnZtNEF1WWVT?=
 =?utf-8?B?SWNFNzBkM2w0U1gya1ZsWDh3SWRrTE94Q3VrM2hMMDhxU2Y4ZldSeEpZUFBE?=
 =?utf-8?B?MDZ2NXRhbkNQb0pMbDIyRlN5Wm8va2lxRDhBMXJVMCtEbHFFUXRvcmJYUXRs?=
 =?utf-8?B?SWVhaWE2VHBOeVBZZHUza1pVY3J0V1FqK0pnTnBuVlNsN2hVeDdiWWhxSTAv?=
 =?utf-8?B?eWhyVjBIV1QxR2w5V2Y3NGxQd052aXI4SlBhcm9RU041NSsycUJKSml4cHlk?=
 =?utf-8?B?N3IweFhmLythS3czZVJCU1B6clNpY0ExRm5qYWVTazdyWWl4VjBnQWpjeWZB?=
 =?utf-8?B?S0tuei9EeWY1blZCTUpRZmt2UUlKdXdzUDI5QkpRandTTGM1MTBvOEFiTjZs?=
 =?utf-8?B?eVFFMmpaYWRxNjFscURqTUlleExyWVlUUS9DSHJzTXpnN1g0OS9tdlpBc3Az?=
 =?utf-8?B?RE5GZ2FRNDRZV1BMejFnVnNQSU5yTTNSeEJETk1OdXc5OTF1MUJVRXNBdGll?=
 =?utf-8?B?YzEzdTE4SGpNRTZZSnlEQ21SbnhYMlZrTThRajRKM0xSa0ptemhad2tXREpU?=
 =?utf-8?B?a3dMKzhkV3ZNcUIwY2tqNHp5SVF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yDQGe2OWld8ffx5IOw5+5wIx+SrHv2pc2vQW0agl06lZPlrOrWlAbNW3vKVACQcTVJFG9qMpbc69IFPK47+NG5JVkTxQ1U31Qhpbv1sK5BLa9O4y05ugDK+jiQEb55LAjzL2tXixlKgsdq7ZHIaMzfFHa14Hgra2hMHragSXzUlnAedQIeLFF0VudOpevzrHfTr/FySezwwWVoxgfSHGdwQkFYKA/RBtE7MJ2zUJEfHFBR/O6tE5DLFk6S7kx7NpSpRZRgxwcRQ/iwGK5mI/D17IHNU6d7huyRlDekvh5tkj9Nn9tMMWMUlH6NRA7RwVqovgiVZSfdJ8Jy+bTMEJPuAnAOqrrO53aj7hguF9XQmyZ8nt8PgX4ANh78UD8/HVkWZwZo4nhUfJEiP7CIxSRVFEnPYE7Pf8J1sirEaEChUv67t2pEZluDbDGfB69Tf7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:38:06.5065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f289284-3833-453e-ca17-08de67e8d6b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7450
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 87D99110987
X-Rspamd-Action: no action

On Mon Feb 9, 2026 at 1:52 PM CET, Jan Beulich wrote:
> On 09.02.2026 12:56, Alejandro Vallejo wrote:
>> On Mon Feb 9, 2026 at 11:15 AM CET, Jan Beulich wrote:
>>> On 09.02.2026 11:05, Alejandro Vallejo wrote:
>>>> On Mon Feb 9, 2026 at 10:21 AM CET, Jan Beulich wrote:
>>>>> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>>>>>> High level description
>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>>
>>>>>> When compared to the RFC this makes a different approach The series =
introduces
>>>>>> cpu_vendor() which maps to a constant in the single vendor case and =
to
>>>>>> (boot_cpu_data.vendor & X86_ENABLED_VENDORS), where X86_ENABLED_VEND=
ORS is a
>>>>>> mask of the compile-time chosen vendors. This enables the compiler t=
o detect
>>>>>> dead-code at the uses and remove all unreachable branches, including=
 in
>>>>>> switches.
>>>>>>
>>>>>> When compared to the x86_vendor_is() macro introduced in the RFC, th=
is is
>>>>>> simpler. It achieves MOST of what the older macro did without touchi=
ng the
>>>>>> switches, with a few caveats:
>>>>>>
>>>>>>   1. Compiled-out vendors cause a panic, they don't fallback onto th=
e unknown
>>>>>>      vendor case. In retrospect, this is a much saner thing to do.
>>>>>
>>>>> I'm unconvinced here. Especially our Centaur and Shanghai support is =
at best
>>>>> rudimentary. Treating those worse when configured-out than when confi=
gured-in
>>>>> feels questionable.
>>>>
>>>> Isn't that the point of configuring out?
>>>
>>> That's what I'm unsure about.
>>=20
>> I'm really missing what you're trying to make, sorry. How, if at all, is=
 it
>> helpful for a hypervisor with a compiled out vendor to be bootable on a =
machine
>> of that vendor?
>
> No more and no less than for a system with CPUs from a vendor we don't ha=
ve
> support for at all. Let's assume someone wants to start adding support fo=
r
> a new vendor. They may first try Xen as-is. This wouldn't panic.
> on how exactly they would start adding stuff, Xen might suddenly panic,
> despite functionally nothing having changed.

There's an "unknown CPU vendor" option for that. With that option enabled
unknown vendor keep working as intended. If it booted in the first place it=
's
because the unknown vendor option was enabled. The panic would happen iff t=
hey
add their own vendor to the code, hook it up on the lookup function and mis=
s
the X86_ENABLED_VENDORS addition. Which, incidentally, would notify them ri=
ght
away through a panic rather than having them waste time trying to trigger c=
ode
DCE is intentionally removing.

>
>>>> Besides the philosophical matter of whether or not a compiled-out vend=
or
>>>> should be allowed to run there's the more practical matter of what to =
do
>>>> with the x86_vendor field of boot_cpu_data. Because at that point our =
take
>>>> that cross-vendor support is forbidden is a lot weaker. If I can run a=
n
>>>> AMD-hypervisor on an Intel host, what then? What policies would be all=
owed? If I
>>>> wipe x86_vendor then policies with some unknown vendor would be fine. =
Should the
>>>> leaves match too? If I do not wipe the field, should I do black magic =
to ensure
>>>> the behaviour is different depending on whether the vendor is compiled=
 in or
>>>> not? What if I want to migrate a VM currently running in this hypothet=
ical
>>>> hypervisor? The rules becomes seriously complex.
>>>>
>>>> It's just a lot cleaner to take the stance that compiled out vendors c=
an't run.
>>>> Then everything else is crystal clear and we avoid a universe's worth =
of corner
>>>> cases. I expect upstream Xen to support all cases (I'm skeptical about=
 the
>>>> utility of the unknown vendor path, but oh well), but many downstreams=
 might
>>>> benefit from killing off support for vendors they really will never to=
uch.
>>>
>>> To them, will panic()ing (or not) make a difference?
>>=20
>> One would hope not because the're compiling them out for a reason.
>> But for upstream, not panicking brings a sea of corner cases. The ones I
>> mentioned above is not the whole list.
>>=20
>> Turning the question around. Who benefits from not panicking?
>
> Certain things may work. But more generally - see above. Turning this
> question around also isn't quite appropriate imo: You want to introduce
> the panic(), so it's on you to justify doing so (which includes making
> clear why omitting that small piece of code would be a bad idea).

The justification is twofold. To aleviate complexity in Xen, and fullful a
security invariant in the presence of misuse. Letting a guest run is easy (=
not
quite a oneliner, but not much more). However it raises a number of questio=
ns
with complicated answers:

Save/restore | Live migration
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

The biggest hurdle, as I mentioned, is live-migrations/save-restore.

If I xl restore a Hygon VM on a host running in "unknown" mode (being an
AMD-only hypervisor with the unknown vendor cfg enabled on an Centaur host)=
: What
should the vendor policy check say when I restore?

    a. They are incompatible: Because Hygon is compiled out.
    b. They are incompatible: Because Hygon doesn't match the vendor bytes =
of the host.
    b. They are compatible: Because they are both "unknown".
    c. What if the host _was_ Hygon, but Hygon was disabled?

It's just a mess. And the fact that the unknown vendor path has even less
testing than that of Centaur we can probably count on it being extremely bu=
ggy.

And on the topic of the consequences of bugs, there's the other argument...

Security argument
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

If an AMD-only hypervisor runs on Intel hardware it just wouldn't be safe. =
We
can make statements that this configuration being unsupported and known uns=
afe,
and everything along those lines but mistakes happen. A mistake in producti=
on
where a vendor-trimmed hypervisor lands on the very trimmed vendor means a
security hole. And saying "that's a 'you' problem" doesn't cut it, because =
I can
make the same statement to users and developers of new vendors.

I can only see very theoretical use cases for the lack of a panic and a ver=
y
clear danger of misuse. early_cpu_init() runs after COM ports are configure=
d so
it's not like we'd reboot without stating why.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

If it's a hard requirement, I can change it so the panic behaves as it did
on the RFC, but IMO it creates real problems for the benefit of imaginary u=
se
cases.

Cheers,
Alejandro

