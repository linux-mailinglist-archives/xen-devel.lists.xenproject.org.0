Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4CEA901CC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 15:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956040.1349559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52X8-0000zZ-G2; Wed, 16 Apr 2025 13:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956040.1349559; Wed, 16 Apr 2025 13:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52X8-0000wt-DD; Wed, 16 Apr 2025 13:10:30 +0000
Received: by outflank-mailman (input) for mailman id 956040;
 Wed, 16 Apr 2025 13:10:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PIlj=XC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u52X6-0000wn-Vm
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 13:10:28 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [2a01:111:f403:2413::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28e55228-1ac4-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 15:10:26 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ2PR12MB8874.namprd12.prod.outlook.com (2603:10b6:a03:540::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 13:10:20 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 13:10:20 +0000
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
X-Inumbo-ID: 28e55228-1ac4-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5jV5Dv/RlE2cD7yGC/5csUw8zBuBWsMhzE7ZqAsYao+F3AvRde+V+AJl6a+4OZs7bcGfcT/d/lDNrLkDOJuGWebGZdxB/OHpltIhD90MmVoJ7czt0uFAfwr9u8ez7PTSxliFL8+yOfGceq1ddMfP7R2rdZdRXQ+eCnGHt1qpiiU53djXbHT1d3iuw9/WDVvbrxzBiFC+Zyu/75DFAO0syer9R6SVOLKrK+LQ4tT2JcMgGnPV+PH2ADKX1LLFFWLl/5JXHKiZ91pLVHg6UVp0QEFT5Qq6Cp9W8kaDcpjQ6gp99Zdj3yvFklnQzQULOg3EWj/2SYZszPfAKbIDSX6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MPy0DaydIbRG9Uspm6pnkMLosb5GuT87IKBRTXynqM=;
 b=BR3Ee3h43uGXMvR9ajNhpfzuq4kE+cFTWqOwJuitoRA2ggX8/mXUpuz7Y0V3Jth1T7e12nCBF9tXCxHACrwQD7l3VYpXLKx4tqQlcY3QDQrlwV0E27KZqjBi2VOZV5oEdZhQQ9ogtfRRS32g41wocPHF2sXD73uloW1Nz0AgmupPDO5nW9BHfhAxJMUSgrvzGITaulurp7OKQ9oCexI2dY4OKxHPdueLYgov9Dy3/I8WeXgZvOKCHETvh+KBeXEHYSm0FbP8XgxDxBiNFCKAxmOXtuSkpgf1QahJj9N5l9RT4C9yP5sdj9hiwSdTiLhHHPjl71tsjsRLXyqMwixcfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MPy0DaydIbRG9Uspm6pnkMLosb5GuT87IKBRTXynqM=;
 b=GSBVf5r1v/HjLUpAEFtvQAF6Gwd3yLbjClNGaFRCfcEVZ3tUE7t1fZKVWPR1jWC201UcJbE/TtaxwvWuP2Dv1vk7Pqr8kGdWD2NljISptMcef6QuODg/vcuZv5Jia2Vn8J9VRLQza+vVn8YYlDqDZsk+xgk/XDTSMP1bbHjYoA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8251ff44-0b45-4f9a-9762-077763f620b1@amd.com>
Date: Wed, 16 Apr 2025 15:10:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] arm/mpu: Introduce utility functions for the pr_t
 type
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-4-luca.fancellu@arm.com>
 <d2b51729-e5dd-4325-9275-615ab1cbb68d@amd.com>
 <0877268B-138F-4FC9-B95E-544699D8AD91@arm.com>
 <22a7f8b1-6614-4354-830e-30dbf6210ec8@amd.com>
 <605B837B-7EB4-4A00-A4C5-D86630D764FD@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <605B837B-7EB4-4A00-A4C5-D86630D764FD@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0415.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SJ2PR12MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3f0766-c5d0-4086-10f3-08dd7ce80a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEdjQk9pRHRlL2tsT1Q3MWM5TEJZV0xnMzhMTXNvYWp0dVhjNnc4OVh6ZlpQ?=
 =?utf-8?B?dnZFRnBuenVCa0VXeEw3Qm1kY1c0aGpmUHh6cllXZms5R1Z6TXovK3haaXB4?=
 =?utf-8?B?bVRrbktJS2h6dXZHSGJwVEc1STVGZVJuNmlQY1drVkwveWVaNy9xcjZ6RHkv?=
 =?utf-8?B?MUd5WjVWc3FqUFVDb2dhcmw2STNsWTduNTFyU214blJhSUlNNWdtNFc0LzlM?=
 =?utf-8?B?NXFmY0NyOFlpVG42SlFzRDNhejVLWXRoZjJMVzh1dmFWRzR1R20zNmlCekJp?=
 =?utf-8?B?bFF5eG8waGt5OHZYRS9Jc1NrSTBIYzhLcUlkODFSaW13QVd5ci9Ock96MlQy?=
 =?utf-8?B?T3dYa3FPMGFaN0hpSjdFcC9YTUlmOXphKzIwa01wY2p6VGZkV1BvWU9reldj?=
 =?utf-8?B?UlpXWS9qQmNRV0xGM2ZmL1dTT0FFRUd4eXlZakczUzYwY2FuU1NnTDVJYlRX?=
 =?utf-8?B?VE5scG9BL0kvVWxma0dMcnE2eTBXdEc3aW5SZ0k2S0ZheTZwcm9xNDJZTzRz?=
 =?utf-8?B?aW50TmkyK1ByVnFRM2dCYitZNWp4VzQ5eFM1M0dEY1duK01pTXQ1T1FKUHo4?=
 =?utf-8?B?TDVQbHBIVmxsQVdaeFR1U2s0UFZQN1gyUG1mVHBiZXBBaDlwTDUrMk9YVFds?=
 =?utf-8?B?dnBVS01GbzhJZUJuVThJUGFoemd2VjRjNkVyS1J2MlFYUitBZWo5SEx1QUMr?=
 =?utf-8?B?T0VrM1pDblVkNDFyTjRMMll3RndSNnplRjFOSVNQN1g0MkdOQm1hTlY2cjZR?=
 =?utf-8?B?d0pOWG1MVDFmRG9rT3JIdjRhS1I4L2h1Um5JQlg3MkowbmdSRktTMk1IWmgw?=
 =?utf-8?B?ODg3ODNmTmJGLzJSTkNiMHlpVlJPYWNId0cvRnNMRTBYN1BmV3ZJRDFHSHdp?=
 =?utf-8?B?VWJ2SWczRFNGbStvU1lmU0hGMWRXWFZSbHoyaHhaTVQzZWhrdFl6TU4yNThm?=
 =?utf-8?B?TnY3TEN6T1d5MEIvR2E4djRQSFFRL1hUZHV1T25ndEtQRzNsZlo5cWptcksx?=
 =?utf-8?B?c0FlQXNXSGxLY2U4NVhEQWJ6TDBLOEY2NHRuZ3M3OXRSSVljQVo5QXp2WWk2?=
 =?utf-8?B?dnVnb2crUnBMT3d5aVBMS0txOTE0THNEb0FzeE1BSWJaY09rWHRDTllWSGZL?=
 =?utf-8?B?OCtYcmQ1SjFIdE1lalhKVTRoRWk4S3NEYklFdTFlMmczdW5iNTZOdWoveit1?=
 =?utf-8?B?M0tZL3gxc3l1NElrVlpIK29LN1o3S0kvRkQ1T2VzRCszS2tCSjJGc29ublow?=
 =?utf-8?B?d2VFZ0gyY3EzSEU2NTByTENZVUl3dE52NlVweFRIbE1TMmRaaGN4Ti8xQSt4?=
 =?utf-8?B?SEVnL1YwSm1FbjNHSUdXQnE0MnlzckloKzRhNWlLblM2TDk0V0ZxMzhIT2NS?=
 =?utf-8?B?SDl2dmVURjVrdHFTNWEwMmhpdFlTWUdxRFA2UG1wUGpkWlBvRmJLS2c3dHJv?=
 =?utf-8?B?bkV1N3BQNjhtOVVielNsNWw1VXNNTlczQ1I3S1Rha0NYVmJjTFpNbWo2U1M2?=
 =?utf-8?B?bmIwS2RZTDUxcjdTZzJsRS9vZHNTczRaTmMxTmN0WFdBZXhQVXQxVkRLYzR5?=
 =?utf-8?B?Q0FjVGNSa0VLQnpNUE5ITFNKenYvMkxXZzVrMDFxaFNxUmhZdXRBNUFXRm9r?=
 =?utf-8?B?U1RPRE1vMDBPQ2owNDV2OFUzNVF3Q2RtcS9iL05tZ2gySHBqOGc5TmdqdFpm?=
 =?utf-8?B?UmJ4ZnlLL0ZBY3F1ai9HdEUvaldFQVRwTndvakttZmhzTHRzLzhaNkVHUm1i?=
 =?utf-8?B?di9Zd3VYb2tiRDUxS29ZQW5ORENRWUNLZ2dSbVZjeHJtMFY1OENQZENLb2tN?=
 =?utf-8?B?N09VcFc0aE9xeDZoOGR5ZlROL3FzR0JxZzR3TE1MVVozN3VmSmljQ3Z6ZW00?=
 =?utf-8?B?TXBreStXS2FRdVFsT3VDazZIL0RjdGZxdHFhWGZjekE5cmJmeFZqbS9PZUpm?=
 =?utf-8?Q?2YKW8tkp5C0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVJVT3JLcHRVTWY0a2w1bVBNVzV4U2RxRGlXQlpLSmV0M0xOSmNWSTk0OWkx?=
 =?utf-8?B?ZnowOEU3UmJTR0RGT2FhTEl3bVo4SllXUWNnZ3FwOVphVmdVWUtuWk81REZJ?=
 =?utf-8?B?dXhmSHlWaHNUZDN5dGZIUStmWGcrYlFScHlqZ3dvSzZUaEhYNXdlVHEzYWNV?=
 =?utf-8?B?ZU5veGxLdk1xdWZyQUpYM0hSbTVwRHV0a0RVOG55bjVuazVJK1pHNXdqZGFw?=
 =?utf-8?B?YU05VnNMTUJWQ2JQM3RuUWxsRzAxVmpaczZSNThZYkZKQis2WlBJbXNxbmNw?=
 =?utf-8?B?dTcyZm1mR0YxWThIZlJKMitkdU5iQUpoUVJsTlA2cFp1bEhpR2xPL0xDanpj?=
 =?utf-8?B?WURpUG0yNkFlS21uNUVJN1AzQ24yL1A3SkdvejZ6cjBXelIyTjhGRk0xUnFP?=
 =?utf-8?B?Y1hBaHJUN0lQMlhMRlhWK1Q5cnFPR0dmc3VTazVjVm9LVlBXQ3JtekZJOVRN?=
 =?utf-8?B?bE8rSUp2Vnk2c3lBQ2x0T21NVWd6b21qdEwxSHBvL3dEa09hOVFTTjc3eTQ3?=
 =?utf-8?B?WEhxWDczUGxPT0FEdHZqTElKa1NRMm96eVNGQnVHN2lwTy9MbGtTYUFValQ2?=
 =?utf-8?B?dmpzUTRlWWhNRGR3Q2tpc3R3SDBnZ2o0OGV2SHd5NGsxOHFLNlE1VXNzUkhv?=
 =?utf-8?B?R3luY0RPUms4Umh3NXR1cldNNkt1SDR3UHpvTWRwVUltUGNwelk3cWlDeW81?=
 =?utf-8?B?UmZVbmxVOTJ4b2pubWhCSXB2QUhzV09mQjVxU01CT2QzYWhPellJR1U4U1Y5?=
 =?utf-8?B?RnE3SUQ5MVEvY0NIOWZ4enA1QmZpUGhqVHI5Sys1UzcvVi9obWRmdTllRkpH?=
 =?utf-8?B?VU5WaWpxcDJoOE9IN3hXbGRaaU9hSEFnQ3M5ejQ3WFR6OXNhbVBzSkVqaFg5?=
 =?utf-8?B?VC9jSDRrOERIcTQrNG5mT1d2aHpkS3pLT0luWVBta0c0ei8xcHM0eUY5K3Z4?=
 =?utf-8?B?R3k2QnhaRGgzVU15TGZaQThmT01HOC8veng5U0lJakRXOUpHZ1czVEh4T1Ey?=
 =?utf-8?B?VHdZNUoreFZCWGtTTGJmdGFmMkQzL0lrZ1hVN2NodmlwOVg5WmhWQzV5S09m?=
 =?utf-8?B?U3hGNHhaakVrVW5nd3p6cWhnQTBaN0E3Y1ZDbXdUeG5POHJleWI5Qmd5THVa?=
 =?utf-8?B?Sk5ndGJudHp2SEp0aVRELzVxRU1wRXh3cEZTZEVzZGpjZWh6akNNOUE3UC9T?=
 =?utf-8?B?aVJZZTVnSXFYUDFSOGdCNnEzSTUrTXJtalI2RERaMUw0RDFHa3dUbDRWNmd0?=
 =?utf-8?B?SGc1eG5uWG5nV3QrNkVFS3prYjJEbWRXZ3NYSHNOSiszYWdLbGF2N29scTVa?=
 =?utf-8?B?Z3VyQXllVUJ4U21XOFJDS1N0clZOZ3V1dGFOVUVxMDhmS3R0ZWtxb1B6UGQ5?=
 =?utf-8?B?OFB5T0htUCtKNldVSDc1UEZrUWhJZmNXSkp6Y3Frb2o4Z3RTOTROZFgxN25I?=
 =?utf-8?B?YVFNQkhveE91anVtSVdUVWoxMURvd3ljREhXU2FpcEJBVEQ0TThOTlJVWmVH?=
 =?utf-8?B?WmJSRWZkSnhKS200U0pFSDZXK1AyL3ZwdXZzRU50b1QxZ2NUbUZ1N1BtZ1A0?=
 =?utf-8?B?dVlmSUc3MHBCdVFycld4QnRLUDRneHBYQlBVdFUxMnRDMWlzcGl6MlYyS1RZ?=
 =?utf-8?B?cTR4QlJFS0grOGNnT0EzUVBMUGtzcG9HZG1XeDJQU3FtWDN5TnBhMXE2MWhY?=
 =?utf-8?B?YWtPYU5BMUxNakdBWEx0RjhHVjNlMW9CLzk3dVV3aXE4elNLTGFGaFNXam5u?=
 =?utf-8?B?YXJWWjJsYzdKYUpxaXhpU1puSEdHK1NYam9sa082R1VNMHRJVWZmT0xMb2gy?=
 =?utf-8?B?S2dkNFFaU0orcHJha2RLd1h2cnp2REliTXVBcWk3RE42Y2MvL1g1Um9IdU91?=
 =?utf-8?B?V2pWY3l5dWhYSFI4Sm5najgzS3FiTVRCV0dnUTNRbHJab2pmN1pxMmlVY0Rz?=
 =?utf-8?B?WVU2TjluUjNJVVNTam1ZN1llbTkwUXc1MTRZYjVibU5kWUczaXkzZGxvRWg4?=
 =?utf-8?B?K2VtY2xyMXRIMXNuVDhGdG8zTHB4L1RzbU9nNWhFaDdUWEx2NHlXNkNUUHdJ?=
 =?utf-8?B?UTY4a3gxRlN1ZytiUERWYlpzY00yU0s0VE52bmhlOWtYNFdSK2ZjUW50SHIv?=
 =?utf-8?Q?oTxn9pMD9w9lfpDuM91CXgYwj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3f0766-c5d0-4086-10f3-08dd7ce80a22
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 13:10:20.2713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTd1kqQKiJ/ZBG33TFslDgF0UlROtDz1dNurNpI6Q5TkaEfkHl/gNo3o3vY9WJv+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8874



On 16/04/2025 14:57, Luca Fancellu wrote:
> Hi Michal,
> 
>>>
>>>>
>>>>> +}
>>>>> +
>>>>> +/* Set limit address of MPU protection region(pr_t). */
>>>>> +static inline void pr_set_limit(pr_t *pr, paddr_t limit)
>>>>> +{
>>>>> +    pr->prlar.reg.limit = ((limit - 1) >> MPU_REGION_SHIFT);
>>>> Why -1? AFAIR these registers take inclusive addresses, so is it because you
>>>> want caller to pass limit as exclusive and you convert it to inclusive? I think
>>>> it's quite error prone.
>>>
>>> Yes it’s meant to be used with exclusive range, shall we document it or use
>>> Inclusive range instead?
>> What's the expected behavior of callers? Are we going to set up protection
>> region based on regular start+size pair (like with MMU) or start+end? If the
>> latter for some reason (with size there are less issues), then end usually is
>> inclusive and you would not need conversion.
> 
> I think we have a mix because for example destroy_xen_mappings and modify_xen_mappings
> are start and end, map_pages_to_xen instead is kind of start+size?
> 
> I moved the -1 inside pr_set_limit because it was open-coded in all the places, for example when
> referencing linker symbols or output of mfn_to_maddr(mfn_add(smfn, nr_mfn)), for this reason I
> thought: let’s call this one with exclusive ranges and modify internally for inclusive.
Hmm, yes. Indeed we have a mix of places where end is inclusive or exclusive. I
think we can stick with exclusive address being passed to this helper unless
others have a different opinion. I know we tried to convert some places to
start+size but I don't remember the future plans.

~Michal



