Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00E3BB426E
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 16:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135950.1472861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4K7W-0006rm-BE; Thu, 02 Oct 2025 14:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135950.1472861; Thu, 02 Oct 2025 14:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4K7W-0006qL-8J; Thu, 02 Oct 2025 14:17:22 +0000
Received: by outflank-mailman (input) for mailman id 1135950;
 Thu, 02 Oct 2025 14:17:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddTC=4L=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v4K7U-0006qA-A3
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 14:17:20 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80872679-9f9a-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 16:17:19 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by PH0PR03MB5671.namprd03.prod.outlook.com (2603:10b6:510:35::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Thu, 2 Oct
 2025 14:17:13 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.015; Thu, 2 Oct 2025
 14:17:13 +0000
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
X-Inumbo-ID: 80872679-9f9a-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IPSSk3BNZMTeVPblVZwb3QDi/aVyhufcWitiOpUKPhK+sAckCkBjrhqpKErQiI+Jrt1PWseqCA3M4YgnYLuyfwejnecXVzM4j2PpKtVl8jIf/DwYmqBabXkitCGYrkQI8z7dusSO2d70oTP0XG23lrpLLVA66wL5KFsTTjMbspf+xDy59h5bC7GWDDovG+JPcfhBHzQagdVoOebtMIdABcSW00GMruECguuVMYam+5LsP3c7Vq8yk9kTbZGTuwHpoA2JSEFNXY/cCokY2AjSclAFIiTz7952XyiQX/VzukgpKyTHJ6b+32IaZkFsBDhQf50fvNXw2C06MUIZ5U3SQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GlJZgu1I08gU3lyyayPdY1D5LMp4kTrrPWL1agCM30=;
 b=UH5asstDnHaBO/ZRSJAnQBqJYsrWKhMWURfv5udGn6kOemIrgTJfllkWD10wwAAK6cdZySs5SrbQvpw1jGYxZktOr8F7pKWyT34MpI1REG3l6yAOdcNlwDvWFNiNHu1l7Z4YQQbOdxzLp9UzL5InGiE0LIFmY64TIRwxURmcrs36Oo2gy5VntUlBxe7lG6XQUhDj5kxhRVM7lLiaLPDME7vBIiHgwUXuPIhbmXr/av+QN/ov2VqABPBhmgvbIZnIPK3ohUWN94yxJcGQCd+C64211tAonq3CDs5SUTp1rxbnZnvB0LMd/kIBRsixDu36LO6qiSV59EJioaSTZlsT9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GlJZgu1I08gU3lyyayPdY1D5LMp4kTrrPWL1agCM30=;
 b=D8BzSDUG+IVv/3rslonxbVtkTTvEz/9zMalxpfMHNzsGlz2wRGStubSG9KoN0BOmzAP42OpKPHvNnfAla3Jv5ZbB7hQiKM06vAYY6v4V7/GDevbmFvKTTSuD0zakzglXhH8RgW6bKglT/cPFZ68x9piCBVvLA7XsLT03yVNARwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 2 Oct 2025 16:17:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH for-4.21] x86/hvm: fix reading from 0xe9 IO port if port
 E9 hack is active
Message-ID: <aN6JZTlumMF2B0ym@Mac.lan>
References: <20251002102200.15548-1-roger.pau@citrix.com>
 <1b4bcb40-d62b-47b5-847f-b6e16906f52e@citrix.com>
 <aN6APR-CUc9xRjfM@Mac.lan>
 <DD7W410Y9LYL.GD6FXC9Q6H37@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DD7W410Y9LYL.GD6FXC9Q6H37@amd.com>
X-ClientProxiedBy: MA3P292CA0010.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::12) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|PH0PR03MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c7a840-db97-4514-d27f-08de01be61c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUNqeVliMDZ4ZUxReU9aUVZrdUk2Mlo4eFhnYmMvSDhOUGhMUlJLc0NyQUl0?=
 =?utf-8?B?QWFWYlhzbWRZTitiWEpIeGFZRVVWUVdYbXJ0czVIL1BNOHpEVlI3UmdCRjB0?=
 =?utf-8?B?RHVuQVJCTUIvbEUyLzZmQlM2Um51V3RnR0tHWDdtTHFRVnM5b0RMSkxiMFdI?=
 =?utf-8?B?ZzdJT1NyRUtnL0lIRkpuWFNyVDQ2UlR2eHdsUWJrUlFCWDRnWUcyajNHTnA4?=
 =?utf-8?B?dVVNTnJZWVpyOFFpRmJWOWZRN2FZand0aVp5NmVVa0FQazZHTTg4MHd5OHFP?=
 =?utf-8?B?MHZLTXV6TU12dERZMWh0bFR2aWR3RU9KcXAwWUg1YnExQTJZdlEzV1hheUxN?=
 =?utf-8?B?NGZzRldsbUFhSEthUUljQjBTcHRDL0NMWWprbHdmeGlVWnZOMHhjd1Q3SS9V?=
 =?utf-8?B?S2RFbHQ0eC9tbzdqdlk2WWg2SUhqRndKa1BmZGxPL25KNkVnNzdIN0lmL0hP?=
 =?utf-8?B?L0hEdnl5dlVTQkJLaWZib1BweTZlR0hNQkVVbDRTeVRuOXpsQ0ZpS1FVbWpr?=
 =?utf-8?B?TmdSYyswUnZIU1ROdmhhSU1za2IwWWpMOHBISmlueU5XaG1ubzBvRTA2b3hh?=
 =?utf-8?B?SEpmM0thb2IxVVpVSnJFekJFWXZMWkZsOHJtNUFKNEk5SGFNUk5tV2dvOEJo?=
 =?utf-8?B?bXZmNGJyNmVyN1BhYzVQdHQ2WjgrMzdBbXM3eW9iMXhVMllncm1yWGtvMEF4?=
 =?utf-8?B?Nm5oY0RtdWR4MjY4U0tLUlBCYVVhL1FJWk1CeE5pNGpQTTRpdmdybkpuczll?=
 =?utf-8?B?aVVCVWRpc1Y4R1V1a1Fhc1A5VW1Qd09wZFM5QWswVFQ5OWJQOExoaGFvVnFp?=
 =?utf-8?B?aWVUWWlDbkdNbFFvMFF0bkxUNTQzWisrSUdFcnJDZGhlUXRzNU8rMVBWUDZm?=
 =?utf-8?B?MXQ2Mi93emJxV0FyUkh2LzN1WkJ6THVoeW1ZaTNKNm9BQ1o1blMzQVR4anI0?=
 =?utf-8?B?all6SWpMSVdVcWVubG01YlF3aUV5M0RtRDRxQ05nK0JFRlNjWHhGTEJhdUlt?=
 =?utf-8?B?VFpIaGZxT0o0b2NLL05td053VWpnOTFGZjRZYWJJNnhrdi81Rjh2bWtwRzVj?=
 =?utf-8?B?MDd6cElwUjRQR2dnV1oyVXdKekFOU2RHdEcvVCt3OFdpL2o1cFBsNVIwZGlB?=
 =?utf-8?B?eFJoWnJIMjFpeFg3TVR1OFNjbW5JNUdvWWhoTFpsdmZ2Skc2YTJyQVVITkRl?=
 =?utf-8?B?UVBRdWtvUTBGRDNzaHN1cXJaZDlHdUVtRGlNV2UyVWJGcHN0T2g2SFpGZHZ3?=
 =?utf-8?B?N1RRWjNkMXE5Y2NoQk9meTBzUWIxMG83QUYxZXlwaUNpNEJnSGhqa2docDdn?=
 =?utf-8?B?MmtBaUdVdUhXNkt5VTZqN2swVWNGMkxWUkFCWmgxZFVUNEd2R0wwSFBnenR1?=
 =?utf-8?B?dFBoNFVjZ1hkQ2hycEpUbFFZTHVQY085a1hDRnViUFhqYlFuUnJGUzFkZEow?=
 =?utf-8?B?S0FteHIwUm9NblRoRVZ3TUxpcnlyN2ZBeFg2YzdyK1hvVXNKWEpZZ1lTNSsz?=
 =?utf-8?B?MHc4aW8wcUhYVjA5UGhIQWhWQkV3VFlFTVJSbFdEbHFBb3djZWpXY0t6azVE?=
 =?utf-8?B?UG1aVXhJOWl2VWZwUmFyWHBsK1lqMnQyQXBNOEUrbmtac2V6T0ZUcE51U2hQ?=
 =?utf-8?B?YVdRRVBVZUgyb2IyQnRwdlZmem1aNTRRMmo1Tnc4M3lNTFAwSUs0cHV0cnlX?=
 =?utf-8?B?K0Ftem9FeGoxSWQyWkJUZnc4dnJHaFV5TG82QUlUelg5dFpZNTl2VURWZkhJ?=
 =?utf-8?B?R1o5MjZDamFqUWhnVVNQTk1KNVp1TTdsZzVDTUI3NWtBSEo5WjVNQ0o2eFUy?=
 =?utf-8?B?LzJ4NVJHLzFWQlRwaGVFTkxTNWQxY014UFhseVZLVXVwa3JDdG9RdVJPNS93?=
 =?utf-8?B?QWxCVTNkYUtDeiszdjRXb2srdE5DNDhKdGNnVUpGK0RLN0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1o3QzVvQVlndFkwOXEvOW9Jck9PQTk4TVVhOG9VdGNrM2pYN2N5RFdnNEZ3?=
 =?utf-8?B?WXVNMVpYd05CSnl2VTlXaHpleXJyTTE0Y1hydWZleEVTWDBsbkxHRzhwTUdF?=
 =?utf-8?B?VjQrZExqQkYwdzlsczc2KzVUN2ZoTk80SXRKbFpEWm5qNVNkUUFlaUczb3Vu?=
 =?utf-8?B?cVcxSDBlN09OTWljM255cmxOYmd4bkJqNmVudGlURW9NZWFLYW92OUFsbmts?=
 =?utf-8?B?cEV3aGxBT3V1M0NZUzRNRzRobS8xMmxuRFJ6MXVta2tNN0haM3J1VjhUNXZ4?=
 =?utf-8?B?RWJibVJuaVJVaUh1MCtKRXZGdkdId0RXZjl2d0loODR3L1ljRjk4bVZGendw?=
 =?utf-8?B?SElqU3B0WmlQaW55NG1FUHcvdDlhMXZCVzh6MFB4VHJ3Nm5jRHAxTEhrUjds?=
 =?utf-8?B?QmtGUDJtSlNZSEZpTDlVSjhYYVdxUUtLT2QvWE1OY0JDekhlN2c4Y0ZhblBB?=
 =?utf-8?B?RkhBc1lualBuSlNaM3Rqci9KQzFkTEdYVmo5aW9YTGNyeXNzcjRmSHE2bnRi?=
 =?utf-8?B?MTk5QXUzTkJpK2V6L3lhV0JoWTByaWovRVRtQVZ3T2I3cXg4ejVpZUNwM2VW?=
 =?utf-8?B?Mkd1RXhaWHM2eEs0VUJDZWR5RVd5dDhIdlJ4UnZkMnRnT1B2WGNpNHVwNW5t?=
 =?utf-8?B?N2dxZjZrUGI3NlV0T0FzMEhtdFgvbVB2SitIQUxyZGs0Q2tSOXhMMzcvbFRo?=
 =?utf-8?B?dnZON09FVkhldFY5bCtQVkVST2RoNTFWQ2x4aHhxV1JkblhlTnZxQTByYWZn?=
 =?utf-8?B?TFJWdXdwSW04bTVNYmRUc3VkTU45UlNMMmZMTFF3eURUckpaSEl1dXRPV2tW?=
 =?utf-8?B?K1VqRUhJakFPWXh2UmNHQTJVZmd3MjU3S3FtT04rdGU0ZC83eWVLVGM0SEtk?=
 =?utf-8?B?R0ljc29obWxlUkNpZGxEaVp2M2dHdUdSekJoQ0JlUWR4TWtFa3pIa01oUkZ3?=
 =?utf-8?B?d0xweXU1N3htUWwyd1E2eU5naWsrVkU1QjNPOTZJZGJxWnloWnlzZGFreGVh?=
 =?utf-8?B?R0J0S1FRUVVVbEt6bnRwMWpJd0t2OUxQQ2p1YURRYmFNMnYxWDlSQkZVQ2lo?=
 =?utf-8?B?bnBGVm5MZCtDY1JkZEpnQktDNERTRDB2WDRGbmdQdDIxQW9zU2ZCSERqZmpT?=
 =?utf-8?B?K2d5NzZPc2dTVWpIVW8vaExiWHFuODFMbEEvY1ZyM0p3cWRhTWN0U25DUW9n?=
 =?utf-8?B?R0xJNEc3cXZ6R3Z6a1lKWkIrTDFUSVBEeXJrd0xBMmRtTDZGNzdVTzBqZW1H?=
 =?utf-8?B?UWZiS1I5VEtXaDZ0a25CNVVZT2xYTVY2S2d4WmxyS0daUENBbVpCR2wxcHU0?=
 =?utf-8?B?YUJKTDFxK01mdzF4TmFRVnovM1JyTHRHa0YzRzB3U2xWNnhTbEk4eU1BN1Az?=
 =?utf-8?B?Sjl5T0g5MFUySEM1S0lMTGJTK1JhckRxeHBFNXFhY3pBNm42L09mVG9WNFEz?=
 =?utf-8?B?WHVMa21LTTd1VXV2NHFrdmxpZ3NkRjNIVm5OSVE1clNCWHI4c1hIUXUzMU5G?=
 =?utf-8?B?dUJIdUxVMi8wT3dkZXpFNmNoaEZ3Y3huaURTTUlIdWN5aTdLRHhTK1Q3VTZD?=
 =?utf-8?B?aXN0RFNjNkNTZ2R1TGFTTHFpQ1V5bTVDdGJZcUprRjhDeWlXM1FLOVhXZ3M5?=
 =?utf-8?B?UWZkV1EwK0s2S0c0akI2Wk8xdEszamw2eDMreENMRk1CTDhzUEFWR2lCUzNk?=
 =?utf-8?B?aEc5RVYwWHNrOHhwSVFzTXdiK0tvV2VPZE5XaTJHRVVSUDBhcVFPRXJLdWdY?=
 =?utf-8?B?RVhuaEVmdmdlTU5EbC9HcFFsRWFqQ2lKZFRPbXVYZDlJRzFTWFRMMVpsWHhF?=
 =?utf-8?B?SXRiWm9UVzdqd3lONzhmZEFyd2JQcFVkRHpLTTU5bVhpR3V0bkJGMDU4VTY5?=
 =?utf-8?B?cnVJOWtJdmM3c1VwaDh1U0xnMDFxRTJsaVZqMUZmYmMzWWpvWTlXbVVLalp3?=
 =?utf-8?B?elgrMExtY2dFTDNLSlpPQzZlZStudGJwbEQxWE9YaXQ4ekdncHhUQWFUNXVl?=
 =?utf-8?B?UVhmNXlBLzhCZ3NuV1c4MTY1ZExhVFVJQ01XeFd6WGw1aHVTZzB6YTd4dVND?=
 =?utf-8?B?SEJVcll0L1FUUzhSaG9UaVcwYVhneFJTenczOFkvdmVBSTFVdjlDdUx5b3BV?=
 =?utf-8?Q?ffiGW26ccrJATQrnThN/moTn7?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c7a840-db97-4514-d27f-08de01be61c8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 14:17:13.2610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbFgKdt246rmbfeNWIyxm+jJBoFJfJFW2bMbTaDnKv8cpCFb5Rbyk2/JCwrcHEXWqpMZnZIYzIYyV8mieEZBpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5671

On Thu, Oct 02, 2025 at 04:02:00PM +0200, Alejandro Vallejo wrote:
> On Thu Oct 2, 2025 at 3:38 PM CEST, Roger Pau Monné wrote:
> > On Thu, Oct 02, 2025 at 11:37:36AM +0100, Andrew Cooper wrote:
> >> On 02/10/2025 11:22 am, Roger Pau Monne wrote:
> >> > Reading from the E9 port if the emergency console is active should return
> >> > 0xe9 according to the documentation from Bochs:
> >> >
> >> > https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html
> >> >
> >> > See `port_e9_hack` section description.
> >> >
> >> > Fix Xen so it also returns the port address.  OSes can use it to detect
> >> > whether the emergency console is available or not.
> >> >
> >> > Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
> >> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> 
> >> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> 
> >> That's been wrong for rather a long time.  How did you find it?
> >
> > I came across the documentation above and I didn't remember Xen
> > returning any value for reads, which sadly was indeed true.
> >
> > This was because I had the intention to suggest Alejandro to (also?) use
> > the port 0xe9 hack for printing from XTF, which should work for both
> > Xen and QEMU.
> 
> QEMU doesn't support 0xE9 though?

AFAICT it does:

https://wiki.osdev.org/QEMU#The_debug_console

However when running QEMU on Xen as a device model writes to 0xe9 are
handled in the hypervisor, and never forwarded to any device model.

Regards, Roger.

