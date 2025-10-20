Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B02ABF2357
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:50:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146482.1478901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAs8o-00014Y-Qi; Mon, 20 Oct 2025 15:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146482.1478901; Mon, 20 Oct 2025 15:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAs8o-00011U-NO; Mon, 20 Oct 2025 15:49:46 +0000
Received: by outflank-mailman (input) for mailman id 1146482;
 Mon, 20 Oct 2025 15:49:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vAs8m-00011O-Tr
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:49:45 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64a16352-adcc-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:49:43 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by PH0PR03MB7081.namprd03.prod.outlook.com (2603:10b6:510:29c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:49:38 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 15:49:38 +0000
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
X-Inumbo-ID: 64a16352-adcc-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJVqvYlyDKzDiJnv5nY4lUo/ct4xw/BVo+ekQpAsby3QQxjjskIIYr5DUNIzVpfJRD5pI3etl+mXIK+rtGmkSejySlCNmcKNFLiXXGtpeR3bxgjE7mS9BCOIMue3whAz/6ICzqNGOUey5M4YWdA6247004d+qu3EyLrjzEYWFnhnyN41IzMlmdJ7kUXqxxuzUZtQ5BQIkgrs1Qe1SqgFeoZoneiw8iMsm88kUHNf8gq+LhKhVdGyRAvTBxsYRQ2kByAMZ7o2apPX0Ymty3gWDybmxPeZ3DCeJh3xXe9lod5gOr7KpNo9GAjkE1WgSONEpqEqzqZoW6hUUPQLs+7Lrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5yqGut900tx9/A6PfDezcUhZewG2tafuI9dz8d6f3U=;
 b=rTg7YqLTERmQljRX+odvbhQPdBL7C57zTKHJLTDHKQsbcJoNx8mpvNsT3QFnitTEJtYrGYbK7P+oQAGAhHz3wjcoswc6C85kUqHnZcnubcr39RWE7uttZCDVGGuOWUpSMjr5xMlCfx2zN4Ec/fUGuhNwQy0Ov2GYVvjwwy6wM93OIeVrGwOBZLh7C2KZOggg1/foqxl0OaInTylEVQFnUVvb3gGFDNhipm0Q8IHmupOLJjC0Lc8x69J9yZ+OGw+zKyLYdNv/Y0z1Q9ilhEd5PdxeZFwMYqfWbb1RWKqvA4YteoW+4jaHHUBS90BHL1BmL7VkAxVKVFcnI4h9Csf/Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5yqGut900tx9/A6PfDezcUhZewG2tafuI9dz8d6f3U=;
 b=H34SuzMwBQwsWcIZInlEfh92c/KmhW90ML1QiMb+Dff9iVOLGwhtQSKMwaRuMrdlX6Hg/1YnxlZ+Hq0VNmR1f2kulFUuXQ9j1eiAsMjVxe+SVA7ZKxeKk0twwm0vCCSCT/X3/n8f7fFMSMnbTDyF5F7wtR1yZIBrncMsB7sbwQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 20 Oct 2025 16:49:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 03/10] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
Message-ID: <aPZaDJZiPsOazcHN@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <64d52793-be70-4ae8-9bae-ad88f6379395@suse.com>
 <aPEc3VWLI0ofq22f@Mac.lan>
 <39f00b12-a3f7-4185-a8fa-2c99c43695d9@suse.com>
 <aPH8Waqi5hJyCuzO@Mac.lan>
 <1e14d71a-4c23-46d9-a123-475a22bdc856@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e14d71a-4c23-46d9-a123-475a22bdc856@suse.com>
X-ClientProxiedBy: PAYP264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11f::22) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|PH0PR03MB7081:EE_
X-MS-Office365-Filtering-Correlation-Id: 936b0776-5c5d-4b64-5c50-08de0ff045b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWVLa2pFZ2RzaUw3STVib0R6SjQ0djc3NGV2TTc0WG56andzc1JzekNHOHFG?=
 =?utf-8?B?bmRoYW1TTDIxRmhxUkRqYlpPM0Zjd0V3RGJVTGxBR0dzTW1sUjREajBPaEtq?=
 =?utf-8?B?aStORVlhMWhGNGMrcktXSWFyVFQ5WDAxSnhDSU53RXV6eUI2cmJqdFBneFF0?=
 =?utf-8?B?UWRoVjVZdmIvbHM0ZGdSbkR1RmllYU1uZEtlcWhHdmpBZjFCckRKbUFmam5W?=
 =?utf-8?B?Q0VwcGVzT050YjRXdmQ0cFloTkNXMGtTbnBlWDNvZGxOSU0vOFYwQnkxQTlG?=
 =?utf-8?B?ZStBME1UdmtDSHd5cXpxMk5Ob1dCTTRUSk0rMTJLcFAxZ2R1M3Vla1gxQmpl?=
 =?utf-8?B?empYZjZXUUg1Z3g2UmFMV1ZsdE1yTEhoVEVaQWlkcFp2US8zdUtRTVlkbk9M?=
 =?utf-8?B?b3RrKzVVYmRTRk5CcVhlajhWZFJCejZHZ1J3NDc0a0UwQjJLNnRsTEg5aWZh?=
 =?utf-8?B?anY5czVjV3lPcWlFako3S1JycDdIcDhvS1Z3dm9POUlacE12azVLZzliRU4x?=
 =?utf-8?B?Q09ScldmdGFIS2E5WDNlOVRzUWhmS3hNOWZmU1p5MEJOTkF6cVlLZHRTZnpQ?=
 =?utf-8?B?b2dyRnIzNUZxMzdXRkxQRmpaL3ZNaTVoYTFGYUR3Y2x1ZFVCZnp0OHVHQlI3?=
 =?utf-8?B?OVNrdTlRRHc1bnhvVnY2cGZGRFo5b3ladVV4a21TTzRNVW85Nk1LN1duN2to?=
 =?utf-8?B?VHhWOFN5Mk5jRUdlTmVyQ1V6ZS9WbUlxOWZNNTlieVlJR3N3alMreVhHb3N2?=
 =?utf-8?B?M2RFcnovQ0t4eUZ4SGtXY2xlcFQvbGNUNlFhd2tGWGpVMklzT0F1UVlkVkxJ?=
 =?utf-8?B?QUhJTnFiS2FVV0ZhNlkzSHk0SVhBV0hRaGtUa2lPZTVHM0oyRmk5WURPRjRh?=
 =?utf-8?B?VGRZWnFiVHBPa0o0cXUyZlk2eFBjMzhDWDJaQkpEMWdocTdhZXFsRFBoS0Jy?=
 =?utf-8?B?aHRiZmRpMmdESWE3bzl1Zm5QUm1CazZGSUtzQzlTVkYramFydzZZSlloeEVm?=
 =?utf-8?B?SzNTakttbDh2VEt4ZGtJYVRVZXk3YW1hdDgraE0zbUUwRGo5aGFnZmdmcmp0?=
 =?utf-8?B?cGg1SXkwZFVYWFZoYmJ0OWtPZGpzUkh3TGRDajgwbWRSYS9zVUFpSDF1SzRj?=
 =?utf-8?B?cm9XRHZSRnNwMlQyTFRGRlE2REFsaTd0ZEFKL2tsMWFuZ2g1NllnUndHanZU?=
 =?utf-8?B?NEZmVkxaMnA4L2lqZE9Yc0k1eG9keGlBc0taQk9wYUFWUzQvR1k1bHdUZG96?=
 =?utf-8?B?ZU5vWmJ3NVQrcEFHR1dRWFNaRWZLYjRTVlZ2cXQvM09QdWpENjVPT0o3N1Zz?=
 =?utf-8?B?VjhZR2M4Z0xqaTJxYmhTWkU5czZCbzFsOWVsbjdtUjdMQTB5V2RSN2J3WjlQ?=
 =?utf-8?B?ak16VE9iV0E4NXJVS0Rzcjh1OFFqZG9nK1JRc0xiRHVDS2t0T3NLZWkxb0tj?=
 =?utf-8?B?SlA2TUpXd3A0c1B6Ky9kSGNyT3pGMGhVNmludHJ6eGJtcCtnYTdsQU9QdkNv?=
 =?utf-8?B?MWJlblg2aWRRVkhuMGdKczhuNWQrSE00SW5CSU1Yd3pVSGRvSmxUOUlrYXBM?=
 =?utf-8?B?cWwrSGlVSnVxQ3p4WUZPS1RlblVsc3k3clQwMThSeGFxVjIrRlBpNkdXcXBn?=
 =?utf-8?B?YTBINHlsWm5hL3NEclh6ZzVLb0Y5dDQ1WTBJell2Tzc5MFRRZzlNQThZcm9M?=
 =?utf-8?B?R25IRzNtdnl6S28yYjJsTVYyb0JwazhWN2FqUkZpNHIzS2RPeHh1Vm1SVFRl?=
 =?utf-8?B?NWwzdzRWZUFmS1RMRytMelBUQzdDNTNjeVBDMVJyNXZIVDVISmMvN0pwYnpn?=
 =?utf-8?B?RUZMN3l6cDYvMEc2WVhCdnhoaTJ6ekpQU0ZMRHZZOFo0Vmw3Z2Y0bVFXcFZ5?=
 =?utf-8?B?NDRMelBRY0JTSVNXbW1YeXo4NkJWWDBBbkRGVHoyZ3hIdG8xV0xzbWpSVG9C?=
 =?utf-8?Q?9iunoP8Z7PfVPNfIm4SYNVtZz+ia5DFf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enZTSlpwci85NzRRU2N0VkR5QktyZ2JvQTlZK1VTd1hGcXRxb1Fyck0vMkUv?=
 =?utf-8?B?ejVCOC9HazdFZm9UOVk2djE4bTQyaEFiVmhJZWJYb25Rc0xnWjRka1Bid1Er?=
 =?utf-8?B?OURhUzd2R3NTR1NEZWRmNjJRSTVOMUwvZnlNUVVxcCtDWnVUampHZ2YrbEpC?=
 =?utf-8?B?bU5Ed3NGd1c0MHBGODFDSGMrb3JwVk5GTFJnR2VsMDF0Z3NXekxtbzY0bTl1?=
 =?utf-8?B?S1hwdDVQVlFsZXpsNm9KTlQxVHZ3SDVtZ290TlN6MEFzVjdKeSs5Ti9hN1pS?=
 =?utf-8?B?c2srTkplWU11N1FOdzlBZEtOZm04MFR4eXlXZVhGN3hGYW9Pc0RubStGdm5t?=
 =?utf-8?B?bitKQnhEQTJ1L3pSTGVHRjJ3dmhCdHZ1d2VOUU5mY05xZlR2UWE5M2FvbEEw?=
 =?utf-8?B?T2ZablRYTEpQeXVoelV1eGpyMExYZ3pySEZCaExrUk82RXg1QkpQdWJyVFBo?=
 =?utf-8?B?bGh4WWlsRmllUmliaVJobVNLTUcweEc4eFNOWFFVdUZLVlZ1dkszNlpxclVI?=
 =?utf-8?B?QW8wUTJxd2xrOVJBYkxoQWRrVWlHdU5VeE81VXBEZDh4ZVJsczlocG9VelZk?=
 =?utf-8?B?bTFtL3FXOVo0aW9LaEJGTHQ2NWh6NDVWNUdDV1lwb1BEVnlVQ1FoQ1Rrakxl?=
 =?utf-8?B?REhaZm1pUHQyQzR3ZFJYd3o4NHg2WVVmMXRNWll4dWlxQXI3Y0VpSG5Fc3hI?=
 =?utf-8?B?WWQyRHVDMmxHYnh5dE1aeERpdDhicmFheHFPMkM4UHNQYWQ4cDNKcDJIakhE?=
 =?utf-8?B?UEdhUnNoamIyZXNyTnhMcTBsQmxIYVA0Z25qS0RLOUdjckZ3Snd5V08xbnJR?=
 =?utf-8?B?ZDVIdm9rMHVQa0Q5Ynd2S1VxcVhxT3ZhZy84R0NLamM2T1kwUG9wNHU5dzRH?=
 =?utf-8?B?N2JMelR3MDJxVWVGL0RpNXlxSVQ0M0VKTzlmZ1RjS3hRaTRVZDVKMUJhUGNH?=
 =?utf-8?B?ZkZhRzVlUCtWK2FCTU5YZzYrOWlCTU1VeVdqUW5EMjY4TnBBTEV4cktxaml1?=
 =?utf-8?B?cGZQRzJzcFR1M1BNcUNxWVR2SExzM0RxZEpWUVIwNWxrVFZBT3RRZWpZR0JF?=
 =?utf-8?B?bktaU2JYUVNDVE90dXFNZEd0MTJGZDJqdzZ4YjNQVm1icVo3ckh4L0U2THBM?=
 =?utf-8?B?WDZHemNDMEVCUW9xR0dCZ3ZIUXVVT2JIbjJCSUR3Q1JnY0tMRVVkZjJVYnI1?=
 =?utf-8?B?aktnTTU3UGlUcTdGS2lUYmthK3dXOTJsa3YwaHlvb2dIVEcxcjBsSVU3cTd2?=
 =?utf-8?B?ZC9zVjgrZ0ZoMDhnQmV2am9mQjJSbXpmdnFjcEExR256ZmNyMTBweXFlVE90?=
 =?utf-8?B?RGRGMzdTSjA2YVkzdnRMQUFQMk5zbTczTHB4b3E4RFRyNStCNExYRmpiazFC?=
 =?utf-8?B?MjVINmlaVWFsL3pNNWZhdk8zdkUvd20wZHFIdnVENUpndUdyV3B4NHRlV1NG?=
 =?utf-8?B?MnBJdGNjeUVEL2FUbnpZRCtaRWdtNzM1ZHMxc2gxbFVKNmVjYVBCUGtNTTVW?=
 =?utf-8?B?eUJQVzJYc3ZUZjFsVFE4ZGZGKzdvbllZTE5objJNc3graDNkbFdYVmVjWWYy?=
 =?utf-8?B?N0VBb1dkNm5zV2QzRk1OTWZrSFpwaXIyQlR4REtGT1d2SHVEL2dpNldSaG1O?=
 =?utf-8?B?YkxqSHQxb25MMUdFci9CcEpmSms0d3dZdEFzdGFjWW41YVFmSklwZ2hrYXRD?=
 =?utf-8?B?K3FUZ0tZTUI1bWZ3dmFBekVtdVRRcnFxbGl5ZlF2WkFEUEZaSndKSC9RZzhM?=
 =?utf-8?B?bExUVksyZFJkZ0M3OFNSQ3pZRjFUdnF4blk0NG12Ym9rbWlqZHZlNXcrVUhJ?=
 =?utf-8?B?cFBzZDdWUDhKcXhIOXphN3lsajZKeWFmd3NVc1NtdzlsYkNOZW5wYmVVZytt?=
 =?utf-8?B?aHN1QmJYTzFZL0VwcjVTbzNxbUdld2V0OFFQME80cXpYOHVNRVovY1AxczRZ?=
 =?utf-8?B?V0VFaW9pTm9YeEo2emZUV3BZNU9Jbmk2YkNSMnF0Q2Z6SHl2eWV2R0hXeXZr?=
 =?utf-8?B?QVN5NXRlVnpkVDVVWTdNOGk1OHJsczcrUXc1bDMxTVI3YU4zU2xleEx3bldC?=
 =?utf-8?B?VjJHczNPWDk4U0FudEUxZGhQSTk5cFJXNDYzdzJneE9WYWExVnRBUVAzVHAr?=
 =?utf-8?Q?SgQGe4dICDbwRr2mnrsGKz10D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 936b0776-5c5d-4b64-5c50-08de0ff045b5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:49:38.3907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfiocohZWd0uL65C8+ub/ApKTBMxLPgoN7R9o7mOfYaEebFKXEyaKQBJtHgr56RePZhIy+mteLyYbYRSkLirJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7081

On Mon, Oct 20, 2025 at 07:53:51AM +0200, Jan Beulich wrote:
> On 17.10.2025 10:20, Roger Pau Monné wrote:
> > On Fri, Oct 17, 2025 at 09:15:08AM +0200, Jan Beulich wrote:
> >> On 16.10.2025 18:27, Roger Pau Monné wrote:
> >>> On Thu, Oct 16, 2025 at 09:32:04AM +0200, Jan Beulich wrote:
> >>>> @@ -497,6 +503,7 @@ static void set_channel_irq_affinity(str
> >>>>      spin_lock(&desc->lock);
> >>>>      hpet_msi_mask(desc);
> >>>>      hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
> >>>> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
> >>>
> >>> I would set the vector table ahead of setting the affinity, in case we
> >>> can drop the mask calls around this block of code.
> >>
> >> Isn't there a problematic window either way round? I can make the change,
> >> but I don't see that addressing anything. The new comparator value will
> >> be written later anyway, and interrupts up to that point aren't of any
> >> interest anyway. I.e. it doesn't matter which of the CPUs gets to handle
> >> them.
> > 
> > It's preferable to get a silent stray interrupt (if the per-cpu vector
> > table is correctly setup), rather than to get a message from Xen that
> > an unknown vector has been received?
> > 
> > If a vector is injected ahead of vector_irq being set Xen would
> > complain in do_IRQ() that that's no handler for such vector.
> 
> As of now, setup_vector_irq() makes sure the field isn't uninitialized
> (i.e. left at INT_MIN). With that change dropped (see below), there
> would indeed be such a risk (on the first instance on each CPU).
> 
> >>>> --- a/xen/arch/x86/irq.c
> >>>> +++ b/xen/arch/x86/irq.c
> >>>> @@ -755,8 +755,9 @@ void setup_vector_irq(unsigned int cpu)
> >>>>          if ( !irq_desc_initialized(desc) )
> >>>>              continue;
> >>>>          vector = irq_to_vector(irq);
> >>>> -        if ( vector >= FIRST_HIPRIORITY_VECTOR &&
> >>>> -             vector <= LAST_HIPRIORITY_VECTOR )
> >>>> +        if ( vector <= (vector >= FIRST_HIPRIORITY_VECTOR
> >>>> +                        ? LAST_HIPRIORITY_VECTOR
> >>>> +                        : LAST_LOPRIORITY_VECTOR) )
> >>>>              cpumask_set_cpu(cpu, desc->arch.cpu_mask);
> >>>
> >>> I think this is wrong.  The low priority vector used by the HPET will
> >>> only target a single CPU at a time, and hence adding extra CPUs to
> >>> that mask as part of AP bringup is not correct.
> >>
> >> I'm not sure about "wrong". It's not strictly necessary for the HPET one,
> >> I expect, but it's generally what would be necessary. For the HPET one,
> >> hpet_msi_set_affinity() replaces the value anyway. (I can add a sentence
> >> to this effect to the description, if that helps.)
> > 
> > I do think it's wrong, it's just not harmful per-se apart from showing
> > up in the output of dump_irqs().  The value in desc->arch.cpu_mask
> > should be the CPU that's the destination of the interrupt.  In this
> > case, the HPET interrupt does have a single destination at a give
> > time, and adding another one will make the output of dump_irqs() show
> > two destinations, when the interrupt will target a single interrupt.
> 
> Just that as soon as the interrupt is actually in use, what is done
> here doesn't matter anymore.
> 
> I continue to think the change is correct for the general case: I'd
> expect these special vectors to normally (just not here) be used as
> "direct APIC vectors", in which case the IRQ does have multiple
> destinations.

I think it depends on the usage of the vector.  There are indeed
vectors that are active on all CPUs at the same time (like the current
hi priority ones).  However in the case of the HPET vector that's not
the case, it targets a single CPU specifically.

I think it would be best if vectors that are used on all CPUs at the
same time are initialized using cpumask_all or cpumask_setall(), and
avoid having to add a new bit every time a CPU is started.  It's fine
for cpu_mask to contain offline CPUs.

> Problem is - if I don't make this change, I still expect I ought to
> make _some_ change here, as the following "else if()" might be getting
> in the way. Then again the vector_irq[] assignment also isn't strictly
> needed this early, as set_channel_irq_affinity() deals with that
> anyway.
> 
> Bottom line - I guess I'll drop this change, realizing that adding
> something here later on may then be harder to understand.

I have plans to change this soonish hopefully, which I expect will
make this clearer.

> > If anything you should add the CPU to the affinity set
> > (desc->affinity), but that's not needed since you already init the
> > affinity mask with cpumask_setall().
> 
> Indeed.
> 
> > FWIW, I'm working on tentatively getting rid of the
> > desc->arch.{cpu,old_cpu,pending}_mask fields and converting them to
> > plain unsigned ints after we have dropped logical interrupt delivery
> > for external interrupts.
> 
> I'm aware, yes. And I realize this change - for the HPET case - would
> be getting in the way (to some degree).

Thanks, Roger.

