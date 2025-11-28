Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D829C91A40
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 11:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174708.1499655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOvkJ-0007JQ-V2; Fri, 28 Nov 2025 10:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174708.1499655; Fri, 28 Nov 2025 10:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOvkJ-0007Hp-SM; Fri, 28 Nov 2025 10:30:35 +0000
Received: by outflank-mailman (input) for mailman id 1174708;
 Fri, 28 Nov 2025 10:30:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2FAk=6E=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vOvkH-0006Hj-W7
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 10:30:34 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a10ec7e-cc45-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 11:28:55 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5218.namprd03.prod.outlook.com (2603:10b6:a03:223::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 28 Nov
 2025 10:28:51 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 10:28:51 +0000
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
X-Inumbo-ID: 0a10ec7e-cc45-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcMuz8TEyWiKHEON2mE80tyiPn8O8q2wJIXn+9eFo+JUZZJ/1ERQocgkp0jLOMAspDvxrDGz2VJ4Vsh7GjaVg05xLrZgJ7hlin71LlOllELIFn+NbPZVkTWBsjcF8O5uFgJVNRJSE33voUfYjH8xBlV/4FEJmIhor/c6HIXF9sorubx8a0eFIpEmbGa+4LWrkQiIMRlHkyc6zKGuzbqxMTJT2pcuoVT6Ho6aN5uIRfv/w9LAlO5/RjUyoKOA/jrlnYkfIrgswpAs1dDQEMngvPkVp7IjLZqeeImnrXWV1mh4xJRXdGigJd6utCutMA6jvtnSFGFsuRg7FwFJ5s8kBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDNTtGJJgweGSSaG0VehTKsCqD5+n+ME1UT/gpgz1+8=;
 b=YOIvKGNsR/vpY5RJpvkL3/+/E7vMPdYYWXattp673GqHelvxZT36xFeRi+YxR0Wq6E88wrcRuqZM3JCgqvE897I18m4P/MzJ8fgZVAseM+6PKsfRCNTO4qPPyl3xyUeQeDPluIYOk/ikUIRAdOkOLvEUnimewFofxkOC3lBbxJi7WFuHo7wXIwjBdmHvdJRfp2iORkM5K2BN6Gk/Eh/FpTgnGdo5wil4u7HzfG+oAsrEPq87ohqnrNjobW6pODGsFtbD+PPf8I9pocAW+0/whsYgRoPO+dj+M87AJG+UhdZ3IDeyMXpL4Vxf4uW5EhJdS+1KsAeu8MsiFNfIqjXWsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDNTtGJJgweGSSaG0VehTKsCqD5+n+ME1UT/gpgz1+8=;
 b=Xnm84Qd86ihSL5fnDJk1GlfvCZ/b7aYO4PP3np/nMNgkmYCavSDaO7zS0XpqTv4MtuoJppP9JdPofUBQu2NmDi/NAwXsAdVEHT//bE/2yT71KNDwuXeYn1rAdQopD6Spw+FCT0FgfPGu9+lmHdR3wGCWEoJfPYKzxbTMV3RTfGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 28 Nov 2025 11:28:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: qemu-devel@nongnu.org
Cc: Peter.Turner@cloud.com, ngoc-tu.dinh@vates.tech,
	Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
	Jesper Devantier <foss@defmacro.it>, xen-devel@lists.xenproject.org
Subject: Default NVMe MDTS value causes Widnows Server 2025 hangs and BSODs
 (during install at least)
Message-ID: <aSl5X4dJHACpJHPU@Mac.lan>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: PA7P264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2d3::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 451623c2-d162-4b74-fbe9-08de2e68ec4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjRybkFvdWg2cTF0OEkwcER6QWlKc3liTHdXUjkxbGpnRVJaR0lpZGxJVmN1?=
 =?utf-8?B?N2JZaldVTkp1b1krQVc2dVZXMWt5N1RVR0RjcmVnTENnUk4zbDE1cjhkTlNX?=
 =?utf-8?B?ZU1TaHk5NmxoY2JjS1dPNk5TaE0rRG1Xbm5PRGpRbHdwQVNScUtrZkp4NlUw?=
 =?utf-8?B?ak9lS3VkSVdJTDN6L2pFSWVGNys3eVQ2UksvZEJlM2JmN3lHeDYxVVJ4eTli?=
 =?utf-8?B?ZUFibFUwYVpheVo2ZVFVaGlBMVVlOWZQNlBxZmRwMUIxeE9NNklZREdyUFNm?=
 =?utf-8?B?T2R3RWJzbHphWU1LaHN3bEROVjlObGxpeGxvbURwMU1QaklBTkRwQXg0Q1lL?=
 =?utf-8?B?VzBkbDN1OGdRM3dkNGJKMHZGWlZJaU9WZk52NklHa3pNV0wzUHZFSzJxbmk5?=
 =?utf-8?B?akZ0aFdkNDc4K3ViR3pMT3JpRDU2SFEvMGhkRWVaTldjeDdEQmh3N2F3QURq?=
 =?utf-8?B?Q0pXdGVQcXhDTlBxT0QraTV2QU84RjY5ckhGMDFzU29kdnhOSUxFaStQYVNl?=
 =?utf-8?B?TzduLzZpR2V3Mjk0Y3B0b1RmRjlLOXhVbDJwb09BRFYwbjF4ZDNoS3NDSm9H?=
 =?utf-8?B?RkdNM2lPMFI1MllHODNiQ1preWh2bmV3T0xacjUzRUpCYTFOMEU4L2ErSGRt?=
 =?utf-8?B?NVoxckdJenV0WHBrM0FCb2F3WDd1T3gzbjdROFhFTWRJMCs0cHRIZVNYTGVI?=
 =?utf-8?B?RkxkdTVFbXQreDUvVWRURG1icGFVOXJ3U1BZVm4wd0x3a2JkU0UrL2pZWHg0?=
 =?utf-8?B?WWwxRnZyS20zRjQ0cE9LK3hwY0tlS21uSHdGVmJtVzV6R05KNDhzb3R4MlBK?=
 =?utf-8?B?b2NLVE1QVm42c2Myb0laQi9XekJYRkZhR3JPdE1FTEpYOXNSbEFWeWY5WTFm?=
 =?utf-8?B?di94ZFZrTEZ2UHpPMjVUTzd6RWJ3RERybkN3RUprUklaQisvYUgrMnVRRDJ6?=
 =?utf-8?B?NWNJWmNhYlMzaVFNRUFTQWl1L1NMcW53U1RwU2J2ZWVhK1ROR3ZRdzZwN0x6?=
 =?utf-8?B?eHlzOStmWVZSSkswSW9ma2cremx3bE5ZKzZKV2tRYitHWkV6RnlXdGNNcmgy?=
 =?utf-8?B?L3pOcFNYdWR2ejZ5OHdQc0VycmFWTEQycHdvVCtEdmhvck9PUHJNalpGaTdG?=
 =?utf-8?B?S05WVEt0M05nN3h6VGE4NVBsTW1PWmI2WjRLU1R1YnBrZFlZZlZ1SnJ6SFdM?=
 =?utf-8?B?dHlhU2hLK1ZJanVOV3Rsa2RnclVyN3MwMlV0c0pFR2E3WWRDbjE2UXJEU2JP?=
 =?utf-8?B?K3hleVAvSGpmR2FDVVNmaGRmbTBMRVRoV2MyMEZMcEVhbm84N3ZDNXlGZGJq?=
 =?utf-8?B?TDNlSUxTKytXYkdpaklObldRSUpiZldZZHRtWHdJYWNlV3F4ajFqaFZXK2F0?=
 =?utf-8?B?K3NMa3J1V2l6Wms5KzNxeW5icWtpWC9uTnVSSlQ0ZG93Z0NLdmlGcmU5a0lC?=
 =?utf-8?B?cHA0UlVCSFBQbmdpUVVFOFk0RkRRYzZ5NlJ4UFZjMHp0ODBCTWNrRDMzSG5i?=
 =?utf-8?B?d1VMeHk4Vk9Nd0cvUlRtZGpkeEdqMk9pWWorb3hBZ0RaOWtyN01ERTB5OTdS?=
 =?utf-8?B?OEdMM1VGbW9oWk85RDJMOTJnN2ZxdmRPUDN2VEZmOVh6Sm00MVFxd2V5UnRM?=
 =?utf-8?B?cHNIdFdiV1Q3aXZZa3lTYk9BZDFVYUtFMWRScExOR1Nid2dvcEhZUTVFMUhY?=
 =?utf-8?B?QjIyRzREaE56Q2xxM21lTUExSi9mWVpRenBWZzQzSEdtVHJKTHRKbTUxZFpB?=
 =?utf-8?B?SUdycVc0ZkU2Y3YxMUIycitoNGdkVlAyMFlxOVZ1aVJNeGpsYWp3S2pJbWto?=
 =?utf-8?B?cHNjdXVUcjhtb0JMTFZKNzNLTW0wVUNyKzhEV3ZSLzdldFpKN0NuNUgxY014?=
 =?utf-8?B?a2xZTi9DMU4wdVBJYjZRbDJsSXZGNTZ6UjVZZGp2c2V0UkZ1OFpqOUFuTHpH?=
 =?utf-8?Q?4gLwTOSudtemZKRyAnECOkjweKDIckA+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVk3MGlUTUxxMXh5NU8vY2dYa05SZHdCcnBpVEYwU2RsWWt6YVljN2hBWXpR?=
 =?utf-8?B?QjhjZ3ZOSHdzU25PVmU3aThxdUovTzgvQjZmMzlkSjNuTENBSEVzcFJNOHF3?=
 =?utf-8?B?blppRVZEVDc4dTBzblZWNE9lclFkV0EwYkRtaEtUbGVOSE5hV0pSa0JQNUFE?=
 =?utf-8?B?Y3BwZVQzZUZ5Q01kWFdITmlzckpqUWMvSk5DaXY2TkQ0M3ovc0I3b2c0QTN1?=
 =?utf-8?B?T01abW9YT3J1a3lHVTlQMENjMm41djZMTE5naUJVMkprSW5WS3NwWWIyaGhU?=
 =?utf-8?B?RUhNazFKMFd0cUMwVTFuQjR1VTRKUStEclViOHlTWG1RUm1VZFpmbCtNVUcz?=
 =?utf-8?B?aVVvNUNWQ0NnekdKOFBCei9MdDd4UEROaFcvTW1VNGZyQm8rL09qb2ZRRlR1?=
 =?utf-8?B?VWVUVnNmMHFzTEJEN1dhRk1sRUdIT1dvb005YXU1NlkxZ2Zsb2JGanduVVla?=
 =?utf-8?B?MVRRQXl6Q1U0R05sMkJIVjJjUjR5cS9iN1hPSEJOMmpiRTFPVjBabG9RVlQw?=
 =?utf-8?B?dVJlWUs2MFZjT3pUK01LMFR3Z2xUb0QzODRYTkFndU9wUEU5R2MvSHdHTTFX?=
 =?utf-8?B?TGtObjV1M2NpT3lsTm54aWRJUUxqL0t4MjhQWFhXUUZkVVFBd1U5QXByV3l4?=
 =?utf-8?B?d0hzbStuSG9jU3ovN1dLS2lybXVjVlJGQTRZenNmb0FwMDZyYUZ4N3JjOXRP?=
 =?utf-8?B?TEZ5dGRncEhkTW4zd0c0eC9WY01pMU5aeC8yU3BmZk1JYjRZcGN2TlJVV0wy?=
 =?utf-8?B?Z1V0V1d1dWgzakpXdHFEd1pVQ2N3MzNEcTI1TXVPR2NDdDhhblovWVN1Wmth?=
 =?utf-8?B?ak1aUjBCdmN0bDg0eHo1MVZST2hSOFRMa3Y1a2RZa0ZqOEtVaDFkZldaeC9K?=
 =?utf-8?B?MUNRSXdZK1dUcDBGNS84aG9tN1N5SlByM3dpT2p5Vm55WC85cHZSRFkrS243?=
 =?utf-8?B?a1VCVHFkVmlTSDBTMndtQi9wZ0F3d2ZmVUVyWGNsOVZ1d2M5TTBvTEttakp5?=
 =?utf-8?B?Sks1NGVsV0ZRWnVGVmRjM3FjWFpUN0JNVjA5UjJOUUhZMTdITUZiU2VMTXNw?=
 =?utf-8?B?eFlkVWVuSnJXc0psYlU3ZTJSVWdKY1ZBMU9GN05EL0lTblg4aG1oNEsvN0JC?=
 =?utf-8?B?b3NVTGYxWUNzd3plb3FOekp3KzY3bnM5NDBGOWwzVCtQNndHZmNWMUdyRUUz?=
 =?utf-8?B?N01UMlZPTGc2V1MzRUlabjYwUGMveGREN2lKMVlwbmEyQy9mUENsYWcxZCsx?=
 =?utf-8?B?S3BiN1ZlZlNSTGZWekQ3K0FOeEUyL2IxZEZNNG9QN0dueEJCYzFDeEI5L0hD?=
 =?utf-8?B?cU9hMFN6ckRkNmNyWm5OaS8xblVpSzBVUDNNY1ljT0Z2bVVmNldqTHM0NVBa?=
 =?utf-8?B?Q21WdXJHUFQ2dE9jNSthLzBxY0wyMUJ6SEVLTkUzc1JwOGZOMjQwbEFhUkdL?=
 =?utf-8?B?R1pyNHVJang5ajRwS25oc2x1TDBNWm9kSnJ0WEFJMkdYaVo5bnFKRStPNmNJ?=
 =?utf-8?B?NkdzSnhnanVjUm9jUmZrcHlVNFpKL2UzOTEwK1JyMXJnaURLd2ZzSDJTMnlB?=
 =?utf-8?B?RWpnTGRzdjdqTVM4aFJpS0NZUkRKeHRqT3lDZnVTSzFzMndIY3ZQOHk0bHdC?=
 =?utf-8?B?bG02MTlvZlYySEFGU0o0cHRkNEE5V3poRkxIcWRKamYwS083bWJoQjl0REN0?=
 =?utf-8?B?SXhWRTRHWVRBWklvV0pYb0R1cTJDeEo4djAvMFJKSld0Q3VyVzBDeWZKM2xU?=
 =?utf-8?B?NTBEWXNKUE8zSS9tZjJ1NlJQZkN6M0djOEdmQVBVMDZVUi9ndVBoS0dXdEFy?=
 =?utf-8?B?elk4MDZZY0JVeTZiRmpPRjJVR2lnY21BdzBFTEtRdjk2Q2dXb2IyK3BpTHZ1?=
 =?utf-8?B?MVJKRFVtN2NHRGJ4UFVqVktJVThYL0Vjc05tSkZNQWZaVVRQS1V3WFRHdXd4?=
 =?utf-8?B?eUhHcmdnM2FFeW4zVmRMakJOK1hQZU5WMTNONXVlK3pVMUpjejlsYjhzTFZp?=
 =?utf-8?B?RFV6MVh4eHlpSFhJUVNzVkJIYmNvbnEyNzFLWXMvK1grTittL21lNEpqamd6?=
 =?utf-8?B?YWhBMlVtenhGRDRMZm4yUVExSHdIbVpSWnIzeTRxV3dFWFVSZWdJazM3NGFY?=
 =?utf-8?Q?f/+9Y22ld+7LABv8Le8i1baIK?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451623c2-d162-4b74-fbe9-08de2e68ec4e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 10:28:51.1142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdcxrRIPlFXAqylpXWo43bRrOun115LMdXJsGVKr3KdQLAjW+/PgjxfjJNpLMyImE8BKHE044AY78/sA5jkmrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5218

Hello,

As part of XenServer Windows Server 2025 testing using Xen plus QEMU
we discovered an issue during install that would lead to either the
Windows installer getting stuck without making progress (albeit the
screen was still showing the spinning circle correctly) or a BSOD that
doesn't seem to have a unique number, the most common one was 0x50
(PAGE_FAULT_IN_NONPAGED_AREA).

After a fair amount of debugging and following incorrect leads we have
narrowed down what triggers the issue to QEMU emulated NVMe reporting
a MDTS value of 7 by default (so max request size of 512KiB).
Switching to higher MDTS values seemed to solve the issue.

The commit that made that change:

e137d20e7dff hw/block/nvme: add check for mdts

Didn't contain much justification for the change from unlimited to
512KiB max request size.

Windows is like a black box to me, but I believe there's some error in
the Windows logic that splits requests, and hence when MDTS is set to
a sufficiently low value, and Windows has to split NVMe requests, it
causes Windows to hit an internal bug.  This will be raised with
Microsoft to get the issue debugged and possibly fixed on their side.

From limited experimentation setting mdts to 10 (so 4MiB max request
size) or 9 (2MiB) workarounds the issue.

Would it be acceptable for QEMU NVMe to consider increasing the
default MDTS value to something higher than 7 to workaround the issue?
I've tested both 9 and 10 and they prevent the issue, I would avoid 8
as it's too close to the current one that causes issues.  I don't have
many references of other emulated NVMe implementations, I just know
about Bhyve emulated NVMe, which sets MDTS to 9.

If bumping MDTS to a higher value is acceptable please let me know and
I will prepare a patch.

Regards, Roger.

