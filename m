Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F20EBA39D5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 14:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131559.1470600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v27ZQ-0006sv-UE; Fri, 26 Sep 2025 12:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131559.1470600; Fri, 26 Sep 2025 12:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v27ZQ-0006qs-RS; Fri, 26 Sep 2025 12:29:04 +0000
Received: by outflank-mailman (input) for mailman id 1131559;
 Fri, 26 Sep 2025 12:29:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehmb=4F=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v27ZP-0006qm-PO
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 12:29:03 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fecfc39-9ad4-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 14:28:58 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9669.eurprd03.prod.outlook.com (2603:10a6:20b:5ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 12:28:55 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 12:28:55 +0000
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
X-Inumbo-ID: 5fecfc39-9ad4-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mz/UgKGvXq6ednsMqSl3YteR5Hp9CurAVaF3TNvLfyFATl4qdyRlw+xXeOxA00DpYDJPqqONV4fjVN3jWz941l2QoglrJm4kfFaggi0nDYtSifHWVDA3St+fwfBfZiKvkqzGppozIK5AGBvoLe0dkJlT0BUOU2Pdl0bZ4xfw2wjw64RwrVCuihtuiHiT3IPtccdvpl1CGIidP4s3Gi9FWWr5QtyiceaxDCSzRPjKLlixd0X+Od28CfsDFHBK6z2bWzzIOJURCYnvw0VJBFLLjFq3ADpIVydN2TY7jrsb/LH/DsaeoZi+l2xHruwTn/W0rb7gOsZhIHoI6ubOqkBcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wq81Y4dULNBPDroSA5Et3rTPoT0k9AJxKviMCWTCA5I=;
 b=IaDH7lSZtOiMjo4m6ImdHceJgU5GJf7rYXfTosx43h4YVT32omhZ29BzDGYT6gEVn/i825E+7tne/kHyViF0SQvH7O+UaTME69LAOmefaLlctRDDjREugVEbFs07TgEGAl1xlA+qgIvqZeyz9mziGXZkO3umz21HngGqYw+3SVjaf9ZeHI2Pv+1ktGfQGdQXeTDsFaWz0sBw6tRM9XfjveU435gfq2L2n85xKzz7ERlxMaFYSnmPonkM0eKZD3kdW50DGnruLIaaqbWYs29kRN27Bi853u5Mqf5zA2l+8ghiSJX96F1OTJUqV2GgtURaITGxXCj8mP5XtJ9UGh/T8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wq81Y4dULNBPDroSA5Et3rTPoT0k9AJxKviMCWTCA5I=;
 b=hXc3jLNBzdyGsf49nI/Cwa15MYcKYSig2LcIMQ9mwSWpAl+UaqSIUgtq0Oecb95+sYIB1QIti7AdmYhzR9cTncE7dAbfuUx2TVNvW5W0UdtCLBoLHMpK2Me/DQbLLlaNjisLSUGe0MhkY6smUprd1C3csBVMWDrHTJgqF1DlNETIx1AGg6021TQBVJAncug+So7dvEvZr2CXBIIIdPsFuKG6nb85mFqUccKFhbnvOQn36kTdw44ImkQIbdi+EwKIXEIj0TJyjqGki+p8uq3GEMkld8VQIba0eQppDIsJeHhW85vebQ/WcxIpWK6oR6SXkymLD0RxvoHCXcxmELBQ1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <1650c978-833e-447f-b14c-ef816673d842@epam.com>
Date: Fri, 26 Sep 2025 15:28:53 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250925195558.519568-1-grygorii_strashko@epam.com>
 <a90600d2-a6aa-43be-8977-6d407ef7bb06@suse.com>
 <f6354369-80fa-409d-98ef-d0d67c823807@epam.com>
 <67dd3659-916b-4e64-afe2-e13fdc8d31f0@suse.com>
 <DD2OQUPHOOV8.2IYRM1EKH35Y6@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <DD2OQUPHOOV8.2IYRM1EKH35Y6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0344.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::7) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS2PR03MB9669:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5d6633-2cc1-4f64-9f97-08ddfcf84274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3FsNS8rbTNqQmEyYXJxT2ZTamgxQWRHVjg3UWFReHk1UVNYRHJCNDVHcWth?=
 =?utf-8?B?RTUzWGhPcDd6MTB0cjFRVlVIemF6Ymp3RkFiVXJNWjdWUFJzYWpCL3E5TW1D?=
 =?utf-8?B?eFdkcm1RcDdrZG4vRnNaa3BCYnp0ZFV1YlZNZzZlNGdwaGxObzhrMlJiWkxh?=
 =?utf-8?B?YUw1Mi9HakZkeldOblF3eXVmaUpHWWViOFo2Y0xxM0w0OWdPckJzVFd4ZVZy?=
 =?utf-8?B?U1dDZ09GaGFsRnMvelVZWUdoczNWMm9CcUhYSytrOG9tZEptaFpjS3BIaHh4?=
 =?utf-8?B?OXkrSTh0N3hTRWxzdmQzeG5RbUpYQkQvSFZFbXdtYkxqS0F3c2xXSWxuQ0ts?=
 =?utf-8?B?eDlQR2QvQ00rdHpaaWFwdVozajVodGlTNGJNd0tuUm1mQklENFRQSnhZd1ZU?=
 =?utf-8?B?QXBheEx0OEZ1SnVYWnZwOVRkQnpzb1VrME1YeXVhUTI4amRKQSs5VlVnMjVq?=
 =?utf-8?B?cEpPVk9YVjdHdWRXOTlFSEhNQlltRkZTQU1ab1lZdEFNQVRRMUhxOVZrRnZY?=
 =?utf-8?B?VzMwUFdXZElqanZlUVlCV2F4QXByb2JtVEpwK2wxOUIyRU9NUm9ybmdrYkhx?=
 =?utf-8?B?Y3labGxab29TVTBtR0V0UkJOdWFWWUI3Wk95Qit3N1kzZXZ6WTVyRVh3N1RC?=
 =?utf-8?B?RDFiWU9vVlZCN1hqVDZpZjI5UFVRRHB2TWY5NS9IdE5jQkNLNTF2Uy85TFBj?=
 =?utf-8?B?aDdUK1dzeWRVdkxUYTBsbEpuK0pWZ1BEL1doK0l5KzlaODlRcHlQdDNyL1dM?=
 =?utf-8?B?OWZzeFFKa1VUQXZxM2dpamQ3d09HL0hmMUJZb2k1YjUvOStNZlUzR0ZPaUlp?=
 =?utf-8?B?VFU3Q3lTSHpra1N5ellXNDdSa2pNa2NUVFdFNmc2c0hwS0EyZVF5aXJRb2pt?=
 =?utf-8?B?RWdlMDFQSC8venVzdWtlVmkwZEFvQ2d2MzB1N0lzRXFkUmpJMU1ISVNWYXNs?=
 =?utf-8?B?cjdVbDRnSzdpeXNOMk9ucHE4NWZmMVZPVXZDR1JJOEIya1RPL3dvbXcySmNx?=
 =?utf-8?B?RjdpL1YwR2Y0M2N2MVhoS1o1MkpraEhYWWZ3OHJyWXU1b2RmUlFnRElKNk9K?=
 =?utf-8?B?TjBtbUNGcVZvQ1JCQlVxSHhOOHlxL3Jjemg5czlaaWVkTFVSMloxN3JlbkVW?=
 =?utf-8?B?Q1pLT1RoU3BtZlZNUzJDTlJxR3g1UWdGSnNROVRnTGlmR2RXRWFsZmJuYitv?=
 =?utf-8?B?VmhGWkMvbFNMRnMyeHZ4MXFDSXovYWpxTXMvMXFLdE8wdUN1aGJYTGFDRjBP?=
 =?utf-8?B?ajduWE8zamdkdmhid056ejlIMnh4SHpTTEh4QWRndEMyallHd2FhbjU3R3pJ?=
 =?utf-8?B?dHJTWEF0NHY3L2VHb0VKM0VMNHJ5SkFrcWVNbTVWeitDYVp2NnI5U2poT043?=
 =?utf-8?B?UlhrK3FQeDVJa2Z5ekJHTzBYcXdxYjBKNm9CWGw5YmFPTDFMQTRSTnppcDVt?=
 =?utf-8?B?Z3JsUm1pZCtMcGthYzh1N05qV3dxcmh1dXJvdnVZaGh0WHFBc2hBT2thNlZn?=
 =?utf-8?B?VVFRY3ZkTkdteWhxYklkaFZFZUR0TzdiUDJKdENKb21ZMHNsaUNmMmJnRTdL?=
 =?utf-8?B?czZ0VEdkK0tXanFkTVdQcDh2bFZCZmV3Z0dXYy92S2xpTWJvMUZrSDFGazFU?=
 =?utf-8?B?V281QkF6OUpCVjA4N3ZUbkoyNFlmZGo2Y2MzZHY5bWRhbmZwQld1QmZjNFRj?=
 =?utf-8?B?R3V5Ui9KVFBUK0RINzNkT1lpNVdSNnJLSDcwSVYwY25JQklZdXFQdlNpNWYx?=
 =?utf-8?B?dEF3NkwwdjYzb2pWSXJWc0JhaGYyTzUwMmxOUVNZeXd0Ynl6TXdwS2tMSmZP?=
 =?utf-8?B?Z2NmMG5NMEQ1cmxHcE5KRmhBSEh4WWF6WjRGU3FtL25OcWE0VkxHcnhxY25T?=
 =?utf-8?B?SmoyZ3ZkSTd1RGVicWh6N2F5YWluQ3VPb1luVlNYYVFoRkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODJOenJpSFpUYkhiSTdUaVNHc0ZmT3dzZTRHTnFtTVBZT3BwdE9MZ2RRVUxK?=
 =?utf-8?B?dEIwZHR6VEV5THlIWER0ZjJGeldtWDc5bmczUmlUQjYxN2lxaFd6Z1JnOENW?=
 =?utf-8?B?bUZML3RJekJjVmwrOWxxLzVlTTQ5eXNEb1RHK2wybkplQnFHT1IrS01Cck0z?=
 =?utf-8?B?OHhMbkluYzVmNVUrRnMvYXZoZy9zWVZhQjkvNGFhaHpQSnFzck1mNFNuZVBh?=
 =?utf-8?B?MVY5SmJqdGZ0cmlvL29EQStGRUxEcGFpRVZwQVdzUDFqVS9MenVlZEJQRTZL?=
 =?utf-8?B?NWZFZmRUd0JzUjhHRll1cCtoUW5HTGxPOEFkM2RsT1ZKMExHZWx3MUFtRlZj?=
 =?utf-8?B?NjUxQ2ZGQm5yT002T3I4M3hMeEdBVTNtWUtyZHBzTjN1ODV5UjU4UzVvZ29G?=
 =?utf-8?B?MThsM0ppYUR2cDB5Si8vSWFwRnZIcFN1THZycVVBV2I0SktRSUlLc2JDb05u?=
 =?utf-8?B?NWRiSDJjMUFnMUtHZkpsWnZoSlB3MVYwOXowaXJIOUcyR0dLZ2M4WEFneFIv?=
 =?utf-8?B?UFNzZEtkV2M5RUlJRHRUN1p0SEllbFQrZ09aeE5JMnpTYWt4dGlhWFV5Rk9O?=
 =?utf-8?B?bGVoTTdOOE1wQ29WT09USFJHVm11Z0ZBdERjU1lxcis2L2t2YzRoNi84Sng5?=
 =?utf-8?B?RjhrcFhRZ2pOVjhINUFXbjZsRXZDeEZ3SDlqcCtwL0xRRHU3eEhTbEI3WVZU?=
 =?utf-8?B?TkVJM0FBbGwyTkw3Zm5XOTBFTWU1elZpdXh6Mk0xOGNPRy9RQ0NJcnRIem1v?=
 =?utf-8?B?a0lHajhTajJ2OFRReVRLd3ZLY042RTZYNTd4SnRyb1RtWE1YS1UwNmZWb2Vl?=
 =?utf-8?B?eHBXa29hM0dvVmx0aFA5a2g5SVBUUWZZOE5VazlmMjhscjRLd1pCVTZrc0xu?=
 =?utf-8?B?aGRxOUVPMlZZQ1JLOExPMk5UUDFrUm11YnE4ejh5ZysvR05ES0duR05NNm5a?=
 =?utf-8?B?UTgxaDZwMTJtK1F0OGNQa0QvcEM5T3Y0T3ZUUTNGeTdPb3ZzVmNwZnlNNzRF?=
 =?utf-8?B?c1IzM0hEYnI4S3A3ci8wdVArUE92R2lleTM1SEJsSXplanpHQXY0bmdyQjkv?=
 =?utf-8?B?cUFGbzlKT2xLaGJUVFhMSXUyellkTDEwSGtkS012bWpiYVFTMzBmNnhzVE9Q?=
 =?utf-8?B?YlYwNkNKQjdKcFZ0QTZmeUVwRVpLdkRJRm8vMjl3V2dicjNPckRlcFJtTnFC?=
 =?utf-8?B?ZERhOGhrcllsYXU3TER4ckwxNU1uODZiWUFTSWY1K28rbGZ2djYrbFBMZ2Q4?=
 =?utf-8?B?dmdicGo0QVR5U0ZMZDU0czNtNUdpSGRkNlY4WXFwMUM3cnNOWnE0MU5hRzM3?=
 =?utf-8?B?MjVrbDVlTFlWeVFZOCswZW9CNVJLdFpHT2orS1huQlF2TzgwdkNWTGZYNWZM?=
 =?utf-8?B?QWR3YkZ4SG9KbnNTeURyS1UzSVNjZmVBSDBmUUNzdkpTWmQrNFpDRVBKOWFF?=
 =?utf-8?B?RFNpZnRRa3hHMUVialpLeURQMm1QdDJraEpCM1NXSFFIZkljR3dFczBXQjZu?=
 =?utf-8?B?RkdZRmMwTDBza2cvNXBVWnJsNjRnQ01NMTJnbjQyb3FOUUdZazBUM2k5S254?=
 =?utf-8?B?aHlrbU1IUEs2QWRiSXBIcG5TSzdWSG1NMEVLNWJidEFvYXlrczI4cnFBYkVx?=
 =?utf-8?B?Z05NYVZLT0pvYUFXM2Zsam9MTlZQOEZVYy9kZEI4VE1EZ0p1ZnBQbklPaW16?=
 =?utf-8?B?YUhpKytFSVM5WnQvT1Q4b1FNVFpZNjJTM293Z3djU2d3bzU2cU9lOXFqTC8x?=
 =?utf-8?B?Q2FFNVRIQ0p2QytWU2FyRWZSaHFGcUk1UGdscmRMVnptdVg5Q1BWalQyWHZk?=
 =?utf-8?B?ckdqRXkwckVmZFkzYkRHUjUzcHd2Y3ZGd3ZiOHdWNnR1WEhtblh5MytmQjZo?=
 =?utf-8?B?N0I1UU5KaFZMNzYvcjlRclpDUlN4M3Blck0xaHVmZVhHVWJXT2tNb2NFQzI0?=
 =?utf-8?B?bms5YmlYd2lVc2ZTa0FWK2JVMEpDV1Ntako0RWZsWFFoMDBCc0NFeXNVcU5v?=
 =?utf-8?B?UFlKK0NjN1RoNHlhMVRUZzRvd2d1S00xMWxmV20yUGNKYkJ3WGhRTjlYSHJo?=
 =?utf-8?B?eCtxSDVtZHEwOXhPWm9GalFMUXNYWlpnK0c4dktPZjVBVHVDbHg5MHNQQ0lH?=
 =?utf-8?B?R3g4MWt1NEFkYXcySXFNMUx0Ni9PUzVHa3IvSlVrMlNzamFjWXIzNGJoZjhT?=
 =?utf-8?B?T2c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5d6633-2cc1-4f64-9f97-08ddfcf84274
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 12:28:55.5504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsWHvq4urHaZcxslSNIa6W0n6nwjpTteFGJbIyvqUIYSmNMCg95JSkMMCHc3jDCj4xWvhhUR3kR6Lzyz8F1v+PhYS9RX6KWiWmyITq0JK8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9669



On 26.09.25 14:12, Alejandro Vallejo wrote:
> On Fri Sep 26, 2025 at 12:52 PM CEST, Jan Beulich wrote:
>> On 26.09.2025 12:38, Grygorii Strashko wrote:
>>> On 26.09.25 11:17, Jan Beulich wrote:
>>>> On 25.09.2025 21:55, Grygorii Strashko wrote:
>>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>
>>>>> The LAPIC LVTx registers have two RO bits:
>>>>> - all: Delivery Status (DS) bit 12
>>>>> - LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
>>>>>     This bit is reserved for other LVTx regs with RAZ/WI access type (MMIO), while
>>>>>     WRMSR (guest_wrmsr_x2apic()) has appropiate checks for reserved bits
>>>>>     (MBZ access type).
>>>>
>>>> Question is what the behavior is for writing the r/o (but not reserved) bits.
>>>> I wasn't able to find any statement in the SDM.
>>>
>>> Me too. Usually RO/WI on most HW.
>>> For example, LAPIC MMIO "Write" will be ignored (WRMSR will trigger exception).
>>
>> My remark was specifically about WRMSR, and what you say here contradicts ...
> 
> Not quite what you're asking, but writing to the X2APIC_ID register does trigger
> #GP(0), so one would hope writing to RO bits triggers an exception too rather
> than being WI when mixed with RW bits in a register.
> 
> Now again, it might not in order to avoid #GP(0) on a race.
> 
> Definitely worth running a silly test with wrmsr_safe() to make sure. I could
> see real hardware going either way.

I see following code in Linux apic.c

	value = apic_read(APIC_LVT0);
	value &= ~(APIC_MODE_MASK | APIC_SEND_PENDING |
		APIC_INPUT_POLARITY | APIC_LVT_REMOTE_IRR |
		APIC_LVT_LEVEL_TRIGGER | APIC_LVT_MASKED);
	value |= APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING;
	value = SET_APIC_DELIVERY_MODE(value, APIC_MODE_EXTINT);
	apic_write(APIC_LVT0, value);

where RO
#define		APIC_LVT_REMOTE_IRR		(1 << 14)
#define		APIC_SEND_PENDING		(1 << 12)

This means writing to RO bits (at least LVT) doesn't expect to trigger exception and
changing that in guest_wrmsr_x2apic() will break existing guests.

Xen has the similar code [2].

[1] https://github.com/torvalds/linux/blob/4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4/arch/x86/kernel/apic/apic.c#L2251
[2] https://github.com/xen-project/xen/blob/382dd0d166cb85139d86ff26fd96af102ae4fef3/xen/arch/x86/apic.c#L244

-- 
Best regards,
-grygorii


