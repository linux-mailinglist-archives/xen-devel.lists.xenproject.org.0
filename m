Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BB7BC0723
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 09:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138519.1474216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61hd-0004Ui-UM; Tue, 07 Oct 2025 07:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138519.1474216; Tue, 07 Oct 2025 07:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61hd-0004Sx-QT; Tue, 07 Oct 2025 07:01:41 +0000
Received: by outflank-mailman (input) for mailman id 1138519;
 Tue, 07 Oct 2025 07:01:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v61hc-0004Br-UW
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 07:01:40 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77f899a9-a34b-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 09:01:39 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS0PR03MB8224.namprd03.prod.outlook.com (2603:10b6:8:28c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 07:01:36 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 07:01:36 +0000
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
X-Inumbo-ID: 77f899a9-a34b-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnB3cpuaLGAZO40oiAGqjyyOFML6BWr3tkG71M3byMRDKeumaPF8pwkIxdSm6AcOPmgDeN+J/16SI30nlmhhg2+JZh8xcPga0C3/9iMzvmQN+Vw3QpNxm76G9marBbieIIPhiGmTUJ11vkMyCQMxmEIBUD1POjwoGmkf3Lj+E7VDvLiK+TCg0n8uiFtLj/2dc9npaHocpkCV3o1BnQB8GgKGVVdQpBW+sauRoincSkhLuV6BDmsZ8LCjaYYN7teVDPlRnVbVxBSkFs3eYscVUDRcTueZefLQLrpQqj3Nau/FfGhQ57fa1wmdUURh3Q1DQfMRvmAnRuR0tk4V22ArfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rt/WxD6Gdd7rLdutxff+o1yeRD3SJzgEDdXFlgHJEU=;
 b=gId9IfyTmPfUboDkC8zHdvesSopOqztdU3wEMH5WO6szdav0kQmlJOMuLFMKeVoGhVnVc5Teu0RxCiD8EoF6yoW4e+Hx3Wv07eJyptcB2TbJHCPxZYunGjHg9bsLykIbZXqMUoiqP9L0jCYE2AYpIm0gh4IcEai8j8GtIxJBIpbuPzfC0wHmzM41GHzYFHTlw70ZiA3psKJBwoixm4TH9QL3nSgEZoWt+hLrw0R6rswuppHMC0dcoQ1FahkHb17G46z3ix4eS09iT/ykBvA5B5r67v6qfA+Y0tObt1ins+dCB6Vw6hQRN2e+4JKRqwEzk7BW8E01IIS0DvJKaM1ZkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rt/WxD6Gdd7rLdutxff+o1yeRD3SJzgEDdXFlgHJEU=;
 b=MI96JZgHEmgQX4YvNWEfe4d9AHAjQJXjn/wlnSEzqTeVz/oyJ0v2u7O3eNhAY4/TlQQh1JcCEUtNfqvCV7MtAKfS9Ng0z+kDRBGgx5E6ch9Hdl01QIDSpEwjGJf39hIOeMKruJppA2JKP/r62RrjZCEPMQL1c0lbm7L+p1m0MR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.21 v2 2/3] cirrus-ci: fix bashism in the test_script code
Date: Tue,  7 Oct 2025 09:00:55 +0200
Message-ID: <20251007070056.83423-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007070056.83423-1-roger.pau@citrix.com>
References: <20251007070056.83423-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0078.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::23) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS0PR03MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 0931f642-4090-437d-681d-08de056f5ae2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODRmNXRITGY1TEZjRGpUV1k0dm1JUHZqbEVMNTVxdnkyWTNaTFgrOFc0VzN4?=
 =?utf-8?B?WVhKa1VzUVFRdnAvNjdIOEtST25xdWJvSGJBN0R0RTdmUmJ3aUVLa1hFOTht?=
 =?utf-8?B?aFhEUnI4U1lYV1g3T2o1dGdiZ2dKTVBhdnhjMktjS1pyNlphS2hCckZCcDZ0?=
 =?utf-8?B?bFlPdDd2dnY0RitRa3ZOVS9lbXZnZlVIOVgzMXM5dFJNMDM1dGtyVEVLZ0Jx?=
 =?utf-8?B?emZNWnBUQ0IvbGtKaEpUSGM3WkdRbFBWTEpSbDhzNS9MTzFjQ0VNYlRWdkxQ?=
 =?utf-8?B?NitrMkZKUTkySjJLUEp4bmVyczgwS3NxYUUvM21vSjRTVytad3RjOEhMV3lI?=
 =?utf-8?B?ODRHMWRGOW1Mc3hlaTk5MTdTaFNwbjR5dEIwSmIydjFCSnBKZFdEQ0FFWlJ5?=
 =?utf-8?B?eWVXSW9RL2FuYkxKZm9MbVhzVzl3b3BPMVFacFl0cEh4WE9PWENqL2llQ0F3?=
 =?utf-8?B?WEpKMkQwRWFMTk1mcFpZTXBIclVlZ0xZaUpZeWd4WWVOcU5UTGJZYWVkRUwx?=
 =?utf-8?B?RUlpRzU5UWZackpJYXV6R01VR2owSnZ3Rk9GV2JCK1c2M091dVRRMktrRElv?=
 =?utf-8?B?UU8wbU5PeHVzc2FtNElzNzhXeU45ei9rbnZ6Rm9tUHB0UGpaekV6blhpMCt6?=
 =?utf-8?B?TlZVZisrRkpPdHFVbTdLWnBrZ3BZck40TFNKYUc3aU0xZXcweDBlMEliQitE?=
 =?utf-8?B?WmovVlYvOFErNnlhZHNGMG5rbGFHVVNueVg4emcyNHh6bmhIVFpHNWRGeHlz?=
 =?utf-8?B?UU14MjE1eDViRlV3WjRFVFB0ZU9EWlNubXVQZ3lqdDh5bi96ZStPcFpoMmxv?=
 =?utf-8?B?ZXpUQUZQc3dWZlVRY1Z3cHE1NURuYjlCNVhyNG9IVlRmS0xiUUdkMUs1aFlF?=
 =?utf-8?B?K1hjVUVXa0VVOUxlYjhqYUtEL09DVUpiTlRkRldadzlwWlhBclZzTkVXbXhw?=
 =?utf-8?B?Zlc3RHVSM3N1NlU1WGFOU2JkUzZrTWdKTkN1RDdrc3hQNlpCOEU5ZS9aU1BP?=
 =?utf-8?B?bThTbkJvM2dvcVpwTTBta01QNnBJbnlsQUtMSXpGR2o1aG5yZW5odDV5eWlj?=
 =?utf-8?B?RGEvc3RySy9ueld0QzEwRjhoUElYOUlsZ0xibk0rT0VDeGFkU3lDaWlCam8y?=
 =?utf-8?B?Mm5nTUhjMnFwNUdWNC9HL2xIY0VBekJDY0ZTTmU2cXJ0a1pjRGdJRnplU0sy?=
 =?utf-8?B?L3B1YWZrL3Bncy9yTmh1UUkxVWxMVFZwZVdGYWxFVkVhSW0za0RqQ0NIaVBP?=
 =?utf-8?B?T3YxWnluY25EcWU1MWRZd1Q1QkdtYUx6UW9xalZUclZBU3NPWmxmc2NLS1lh?=
 =?utf-8?B?U3pxRE9EK0QxUTAwL05MOEpQT002eS8xTGJNSEU2Z0oyMHZSVkNEbWNsSTlO?=
 =?utf-8?B?TEJ2dENTVVlRZFAwN1hINlhmUWVkYWZyaGlwSjNjUEd4c3lkdS81VVNZYklD?=
 =?utf-8?B?dDQzOGtVcFE1OHZEelRNQnU1eHFLOGVmVVVyTUtoZHVZVmxDWUJxeWxSSHlW?=
 =?utf-8?B?SFBMdlFRcVpWRTd5TDNTRnkvbWtVaHN6OTNkdThqbmFLcW96SGhNWXFjY0VH?=
 =?utf-8?B?MGR1Q0ZFaUFOM1V6Mk5lbHBUem1HZjZPdXZySEU0N3ZOKzYrU005cDE2ZU9w?=
 =?utf-8?B?TWx5SGlHeGpGejBIdC9nY1N6bVhJcVJaY1Bnc09YVlRCNWVNTnVMam9HTFpP?=
 =?utf-8?B?R2hVZnM4cnhDQThsRXc4THNCY0xQSGhiK1hoN3RyZERhL2RpYUdKTkxBeXVu?=
 =?utf-8?B?c2VkYW9sQUFGRjF1RUFkVVZCYTlkaEtqeXh4dkhRUFR4VG1LeUUwOVVNaTg2?=
 =?utf-8?B?Zk15R3ZoSEVXNmZvZ3VhSzR6NnhJNWFlNktmd00wdXpxMDZ3a05SUXhYM2FS?=
 =?utf-8?B?RWNGZGYvZEV5cnhwdVo0dTBjQXYwbVcxNEhGRnJNMEMzOFZ2NFc5V2tKUTJM?=
 =?utf-8?Q?V9OCqiWiLAj+k4MhYsBgjY1KFbxCs7YR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VElMelFqRThUdjZwN3Jaclh5K3lxZlBkQ1g3dGZFaHBmaW1GcUZTNWR2S3lP?=
 =?utf-8?B?b3Zob0ZSNGxTcXlzSkNoNVlNd0NtSzRwYlNlVVNqR1FHRWxuR0syczJyWTl6?=
 =?utf-8?B?Y283K1FVUXpQNm5wT2hUQ2ppblhHekxtVjBMVHFkNTdjU3V5UkEzK3NvRW01?=
 =?utf-8?B?T1ljMFViT0FOZ3NOTUJyVUJPSTFRd0lzOEdnWDZKM1p3d00rWEwrcUEyNGhs?=
 =?utf-8?B?OEFIbStkUE9zMTd5SVBsOVNla2VXNis0bTR1cW12TmxnOUdqQ0E0M2lBODhu?=
 =?utf-8?B?VGcwTjlIT2MzbjZxdWEyUEk0LzZIbSt5Ym9mUzBqbWUxdDBRS1g0N3N0MGs0?=
 =?utf-8?B?RmpEMlpxUmtMQVkrM1NMTjg1Z2cwaGg2amJwdkgyN2V4M3ZBV0dMa0hIZGJs?=
 =?utf-8?B?enh6Ny9JOWkyWWw2NTVhQUwwaGpSYTMzRkJHRFJkSTQ5ejNNS0EvQzMvKzNB?=
 =?utf-8?B?YjE5b3RpTXJ2YzkrZlBqQ2xVYk9WUXBZeCtZdW1mL3Z3MTFPYTIxL0lvQm40?=
 =?utf-8?B?VXY2QVJ6ck80US9pR3JaeVpsSStRWDFOazBMUDIvMTFlVFRQbDVFS29mS203?=
 =?utf-8?B?V3IxRlZsOEVHNGU3TGNpeHR6NXpja2t6cUpvUzNMazhYaitZZHgxeGhQUi9H?=
 =?utf-8?B?NVhIM3JKTVo1MmkrVnB3MmJTblJUMDU5aDlORDZOMGh0L3BvVVRHWFVYMWVN?=
 =?utf-8?B?RUNXNlRLVkFrQWUxa0c0a1Jld3FTR2RiTFI5aDBXMXZyc1VUaEFYYitwNTkx?=
 =?utf-8?B?MnV5SXFnZzVKUUhxQmpHTThIK1JnRkhQcnhOcm9qaWg3SkRjOStNZGlneCtE?=
 =?utf-8?B?WG5FSGRlUlo5d1VOMW9YUWsvTisrTVdZTmJQbnI0UkkyWTJGVVhBbytrcmVn?=
 =?utf-8?B?WHZwVk1zcW1CVDQxVXJEb24xRDZYZ0FBWGkzdVNqTHRVS1lYaDNQNzJDRXRX?=
 =?utf-8?B?dW9oVzl1ODB5TWdmLzB4STRtOER0YzZsK21GWm5sL2dNMEpIM21LK0sycmtD?=
 =?utf-8?B?WkFPemprNE5YZnp6a3NKcVRpMGRFMmtvWjNSbHRPeU0rUDlFUHFkR3doRzZm?=
 =?utf-8?B?ZG5wNTd0d3cxeld3Uk9sM2pYazZWVzlxUTY0Sml0enlhQ1N6bHBOTnNWM3Qv?=
 =?utf-8?B?RGxEQm5vOHlPMmxUT1g2ZWl2TEpTS21hakJmOXJRQi93MXowYUVuaFhVWjR2?=
 =?utf-8?B?ZmtwZWdTdU1qN1lKZmZnNUhpWlVxSFJWTDUyOXFoQVQvM3ZSUElFWlZnSTYw?=
 =?utf-8?B?NVovY3lCWTFYRjhBTmExS1V5VEtZQTV2SXZaQk9hY092bUNydWpQbEZ2TnlV?=
 =?utf-8?B?amt2dW9vYVlhOHlaS0UzR0RXY096OWJJMTlZOU9RbkZ6ZDVpUjUzUnA2bk9P?=
 =?utf-8?B?dGhqb2kxalpOemVmbkRsN2JYWHY3NU5CTGkvb1dvbGJXUVdqcmdXTWJMYzRS?=
 =?utf-8?B?YzIwRXZBWERmVkxoYlViTmFQTm1YMTBPVWNRbHUxeEx5L0cxclJNRm1iU1Y2?=
 =?utf-8?B?Nk9LNXh0K1RaQy9ndHkwQXlFUFlXYmtQbFhEU09HeHlEVkdBRW9KK2RxTmM5?=
 =?utf-8?B?aVlqTUlrbCtvU2FyRUVnenRWUTFtRUtxQzhQUExaZDRkQ01HeVVrTVExaDdK?=
 =?utf-8?B?RkVOd09pdytDOWpHZkpQbnBYMzNqQzNqOWZEdWh2WU9UeWYySjZEK2J1R056?=
 =?utf-8?B?TEk1cnZmTjEzQkhOQUN2bGxSM2VDdUNScEJYUFZMb1JqWmZYcG9WSm9ENDlB?=
 =?utf-8?B?dXdpQVo4V0pxK1VnaHU4U0lhc0IrUTdSTDlYNjVFQVJPUmVINUt2SGFnYXls?=
 =?utf-8?B?bk05R1VqYTZIZVptNWM1S0JRa21xZEtaNkcxR2lPN2tFUm44YnNjNTl6ajk5?=
 =?utf-8?B?K2hURnBTWkNDVVVpTXJtQ0ZRTCtoeFZZWmFDNTdFeDZBSVhBVWVlUjgrRmxQ?=
 =?utf-8?B?OHBkR1Jia1FyTEVkTllOYisvcnpSNEtqVEtkSk5CTnhKc0ZVQnZZSXJuZ0Mx?=
 =?utf-8?B?b0FEd1lmd3hncHdGWUhtN2xOUlNmaTFXOWRlN0VxTHFlUWlURnMvU3Q1ZEFo?=
 =?utf-8?B?N05mRGE4Mzk2VHQ1K2lPZkRncjVGOGhTR3dzeVdQUmFBU3cvcndpWC8ySHJn?=
 =?utf-8?Q?QrObxT+9plHUcuOsqAdUBgFIW?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0931f642-4090-437d-681d-08de056f5ae2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 07:01:36.1068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8tmqUoMhGHbMPLkFNLYd8U5jp7lf7XsO943OCOhW13SczxcwJsNxtF+YHbhIZHsVSIDVLy6sw0e8ofSqzq5OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8224

The default shell in FreeBSD is plain sh, which doesn't support the usage
of the '|&' operator:

./automation/scripts/console.exp |& sed 's/\r\+$//'
/tmp/scripts34c427adc6599db29cb91221a0939d85.sh: 16: Syntax error: "&" unexpected

Fix this by using a redirection of stderr into stdout, and then a pipe.

Fixes: a406195c15dd ("automation: call expect script with redirected standard error")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 10d8371ccc38..30108892b751 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -167,7 +167,7 @@ task:
     export TEST_LOG="serial-${FREEBSD_BUILD}-${XTF_ARCH}.txt"
     export PASSED="Test result: SUCCESS"
     export TEST_TIMEOUT=120
-    ./automation/scripts/console.exp |& sed 's/\r\+$//'
+    ./automation/scripts/console.exp 2>&1 | sed 's/\r\+$//'
 
   always:
     serial_artifacts:
-- 
2.51.0


