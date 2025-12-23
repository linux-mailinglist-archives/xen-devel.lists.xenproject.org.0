Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94905CD9C73
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 16:29:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192637.1511768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY4K0-0002A3-Sv; Tue, 23 Dec 2025 15:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192637.1511768; Tue, 23 Dec 2025 15:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY4K0-00027O-Q1; Tue, 23 Dec 2025 15:29:12 +0000
Received: by outflank-mailman (input) for mailman id 1192637;
 Tue, 23 Dec 2025 15:29:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vY4Jy-00026z-OO
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 15:29:10 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f21ab05-e014-11f0-9cce-f158ae23cfc8;
 Tue, 23 Dec 2025 16:29:08 +0100 (CET)
Received: from DS1PR03MB7871.namprd03.prod.outlook.com (2603:10b6:8:21f::17)
 by LV3PR03MB7454.namprd03.prod.outlook.com (2603:10b6:408:1a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 15:29:02 +0000
Received: from DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3]) by DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3%7]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 15:29:02 +0000
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
X-Inumbo-ID: 1f21ab05-e014-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RU6v/q7HVuCWYPlmh40cqnsmLiOD5uBkAm9syO8EN386kw2C1gCZwdXyzkzC0V5sBFDUdVA8De7K3d68J88Fh7aQ53+iMkeOJQYROf89s+LbJdQE5qFtUS4B1jYBwclvwRvhT9H0CEUpRYi5+S8bew6X9t4juMzcYyYR0gzUmSipmy6zRYsg3MUJI3R3yjTmGnYns218hk6yFvpz588z6K/iGN3rzn8vFVJ6J6ifBC6l2YOOvEMCDRUDcTcUbOmk3ZSTYP+NECq+eJcsoSIVoB91VRC4B4lMZ8zY659wnEHbqtLSVrh4PVet42FceQFPdcePu2SY25yuPYmRucd6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSyDiyWSDKUTgV1t9GfaDAwenOHIaspIc0I0p4xdfuM=;
 b=MCAUe/+1t8HuwXlvsVimyJCjHRySg5iNnI7bEkaapYyLoxYlFsAXg29WM3qrptA2AXi/Hq2/0tdBAJrkm8cvvBAyT90WNV9dKx24G3V5vY5jbjAbNHAwZflBl+5SVvj9ucb83SbPexMbqQaGSHcPaA5eo1VAgj3RLsyDSUahPNjA4FMlB89amWXVkASwVbtbLkEW9ANCvbK7qG2/6D7fYNzA1cB2I1bPZweNaO65ZQ2Rb6oJ28ltSvx3aJXYeDZodiQgmCIE6xbIo6ioU7ZjoGVPlGjCerVnKPqukpOYvZdn/za0q6XgEJ4t5Qoa0n5zncDigtFyKDdPd0QC19Rrlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSyDiyWSDKUTgV1t9GfaDAwenOHIaspIc0I0p4xdfuM=;
 b=rq+qG7qJqIKzRpiBelbf0u8PIDqsMKLoWfkzQ5lrEhEu96co3ZgzDOCKd0YocfT4T2f+smi035pqs8f5RqKE9MnofaNmRXeaDD0bkwkVbZPbYeb3KKsatxSACLZTuK9a90BTA2muyXJ4XfNw7oNkIp0WV5eXGYw/h++yCatjRyc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 23 Dec 2025 16:28:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] vPCI: make vpci_add_register() an out-of-line function
Message-ID: <aUq1OwdjVdqkt5Ov@Mac.lan>
References: <70e156e1-c51f-40a7-83b4-2d228a102367@suse.com>
 <4db98b05-5277-4ca4-a6bb-0054490a0280@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4db98b05-5277-4ca4-a6bb-0054490a0280@amd.com>
X-ClientProxiedBy: MA3P292CA0070.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::7) To DS1PR03MB7871.namprd03.prod.outlook.com
 (2603:10b6:8:21f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PR03MB7871:EE_|LV3PR03MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: fb09e3a3-a1c5-49f7-670b-08de4238006d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MllKaEJuRFNEaFM2NjBSbDBnOXUxajYxWnpmb2hqKzdRUG9LaEJrY0tiRnh2?=
 =?utf-8?B?M3Y1MGxTR0lGcytjVlJPMmYvODhyV1hRWjU5aGJWWURtZkxOT3U5Ykt1S2t6?=
 =?utf-8?B?ZmNqdDhoWUc4dEdwVENQSjRLVmIzNDZMRTBhWnhsNDBObEg4MHMwWXlvL2JM?=
 =?utf-8?B?dnUyLzJZSHRSS0UyQ0Rsa053WTdmdVVJanBFTTI5UHBtNDIvdUlnZXFzU0hx?=
 =?utf-8?B?SW5rekVIQ1lVWEhrNGo3WWVWQTNmWllWekhQQnZpbXVDN1JickM0MGlZK25z?=
 =?utf-8?B?YmpZeFNoSWxMYXE3MDZLRzc3SEFraWZhakNNR3pubEhCaWluaUIwN0x5cGx4?=
 =?utf-8?B?TU8zblNubUp1dWVGTW9GWFdPTFpZeVdlbGFjSjVMUHpkQlZCRVdHSTZsQSt4?=
 =?utf-8?B?M2RQbmVORkI2bW1oZXZXY2VDM2E2a0owRFFiL1FnU2hrd3NPS2ZteEdvZ1Er?=
 =?utf-8?B?a2RMcGozUzRQMEtGalpTdGVsVWZNQU0rdSs3VWQzdFV0L1lpZDdkanBNYjRR?=
 =?utf-8?B?eDNhK1kzek1KV09mTnhvL0RPbUxmMDRxWnVycS9yVHA1eWhHbkZjUE55NTZK?=
 =?utf-8?B?Y0o3c00vVUwzaWVmdWZXbitZV1FBaTN6RS9KdllFUDZHQlA0dm8vWTJrcitC?=
 =?utf-8?B?MUhtOGw5UW9tZ3Bqbkt4ZDV1U0s2Z0dUSElmbmxLT2dFWDV3UEhoRkJRQUZG?=
 =?utf-8?B?N2gzOHpRaTdtSVp0Q2FHY1EwL2Y4UzY3dVJvQ04xRlFhbXBnTkZzZUlUT2dM?=
 =?utf-8?B?R1ZJeExXN3hqT2YvVW4vZ2MvUDZhYW00c0x0My9DTGxXS2t3dzRRMkFnZlo5?=
 =?utf-8?B?WnVGSjhVaWFkNjFySVNUYXcvOGZKTFUxUXRSZ1FqU2hFWm9pdm15S3hReEx5?=
 =?utf-8?B?QTRSZktGdXpWdVZiUHZqZVA5KzBOZ0ZqRXM2UTdTeEszd3piV2xFeit0Tm50?=
 =?utf-8?B?N3JSRmIrdE5CdGVTMExHbThON3BqMlRlY01tdzJXMlpwVGpvc21md0RiamRR?=
 =?utf-8?B?QkNJSkt4aXlscHNEOEZURVE4QWs1VTZLZGV1cUxVc0lEOXFLS2F2OHphdldp?=
 =?utf-8?B?YUgzbkRCS09QRWg0WWVWWGtZdEF0dzVEUDMwdVNFUjFKcW9Wem1EeHkvM1Z3?=
 =?utf-8?B?OHgydm9PeGMwWWZYTzN6OGNxSXdTcmFXcEhldHh6dkZhRDVFWXpJNDhSY3lP?=
 =?utf-8?B?U1hvWnFtZ0VudGZaSGZYOU5DbGFqODd4bjJQRFBRalRhbGpJQmc3bjdoeCtp?=
 =?utf-8?B?SXluSVEzTmx0eld0dVFqSnAyZGxzMHRoZGVyckFuMXlhc3VBdHdoSys3Q2lK?=
 =?utf-8?B?V3NBcUtlaGlMWUVvck5jMzl1aUpmWUJmd0NqZ2dMSkN0NmpNbDR0NFJBQ2hH?=
 =?utf-8?B?WlFTZkI5T1Rjc1lCckxPd3pEbGorRWN5anBRNFNEVm1FMWVhOHE4U25JUnpo?=
 =?utf-8?B?d2hWTTNWRnVwcFZzWlFRcEJHUE5uejBaYTF1STVUc2VRcFowQ2UyR1lYTDBh?=
 =?utf-8?B?MnVOUTFPMjVBOElMUDFPSmQ3ZVJZZzdFUGNqU1M0TkttUkF0NkEwYm5Vd0dN?=
 =?utf-8?B?OVI0aU44NWtWY3d0Y0IyUjVTZ2dHeUFtSjBOUllIS21nK3NnL21VMHZ5NmVu?=
 =?utf-8?B?aWsvdjAva1dya3hXTTFidTRuWDBpSUIyQ1M4b3hpemMveSs0bDZkRHJFQ051?=
 =?utf-8?B?Q1hjNGtIVXE1NlBPSWRDamhZdUJ1RFVXV0FUNExRVlZLei9jYlp5ZUw4K3ZY?=
 =?utf-8?B?WnV2RWJKbVZUM0wveGpEQmNQL0tMZmFlVVp5Y00rN3FmYVZoV1U0eHUvd0Qr?=
 =?utf-8?B?SWZtSXcrVTVMdjYvZVpPaGdhNE04ZnRqN0o4b29qaTVsYUsrY21FblU4bmg5?=
 =?utf-8?B?SDZEaHVTUnVjdE9qaEVBTlVrSUwzUmE1TjhtRGt2akdmcUl3RjhkSHAzcjJV?=
 =?utf-8?Q?p9J0UxMZMUcbb0PxpUCmDKumf9xDuM1k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS1PR03MB7871.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkRYMU94ZHpaSFJHMzdKWEMzck1MaWQ5Nnc2NkJEc3FPeFVVa0s2bVRKNGdu?=
 =?utf-8?B?ZlBIY1JHdU5DaEpMeDBtT3dJM2FBR2J2TS9uRUE5ZmN2dFdqRGJ2QW94QVdj?=
 =?utf-8?B?dlFpNEcwaEEwdjkwYjVUekFSVVZ2K3BuYkhQMjd5ODZlSHJxSjJISjBlTjc2?=
 =?utf-8?B?SjdEUzlFUVlFczZ5S1IvVFJRT1lqTzNXbmN2bHVDOVBJajNiYzRzbFZEaHpF?=
 =?utf-8?B?eE9kcFQxZVo5Nlp6dVNYeTgydUFmVmdTeU9sbGRLN3Bob3puQkVCVkluMkMr?=
 =?utf-8?B?TE9LMGNGY25tY1Y5U216TzVwVTVZcFR0QUNlL1JuVE1mVlJuZ3dyRE1iMHBS?=
 =?utf-8?B?ZmVjNlh2ajFpVmVZRU0zTVBMdWR0NDJZNGVqYmpZQSt0WU51MlErWFRnaWZ6?=
 =?utf-8?B?SmIwaFN4Y3BZZjR1ZzdHT2VFRFhXdDdpSSt0VEJGb3VOR3Ixd3hzU04yRWlq?=
 =?utf-8?B?eTNCZHZibWFWblowOVNwbnd4TDIwSmFnVGdTZVFpNUxBVFp4em1OdEczNUts?=
 =?utf-8?B?VjMyRFZMTzdyRjc3T05XbnpKVG1kTVorZ3VZc3JEd1BSSm84QnlOK2RleG91?=
 =?utf-8?B?UEFFV09nOWlpV2dCcGFzZkdrSGhUaUx4TmM1R1ZZTXZtUzZYNkFZWmZJT3Er?=
 =?utf-8?B?cm1oLzIyVDEzekVvYVFiSVUzbWRERzh0Sy9iODdqOVFRVmNtOVdwWEVrRGR2?=
 =?utf-8?B?NEtHVVlGSUZYdE5STjlDOUhEV1JEKzdtV0V5Q2RUdmI1Zkl0RFpGWmtjdU9O?=
 =?utf-8?B?cGlxR0xvamhPUGFTNWpWc2hnbXpuc2Y4WnRzeE1jcUMzTGh0U1h4b1pEQURQ?=
 =?utf-8?B?dXEvcEtFMm90dlR2cU0xeUFlUjF4VW1lM3dGQW1Gd29Jd2Y4WmFyM0FiTmNw?=
 =?utf-8?B?RldVMnJMdm0xamp3MmlDbHlRak9seUpnZFlKTjlhS1NtVDJwTys0V1dSNStS?=
 =?utf-8?B?R1dtVDdlajJXMHZsQy9FUUw0VklUMXF5RDRQc1pxSmV1UEoySUdFbEs4WnZv?=
 =?utf-8?B?Wmx1SEZ6Z0daTkFJd2xiRnFSMlB2cVkzS0xJVDBBRUdkKzFTMnZMdng5NmZF?=
 =?utf-8?B?SjhzZ2dRSzBoVHp1NzJkdzZOZVFhVmJaUk54dEJvUG5YRDZuZjNnQS9LNXo4?=
 =?utf-8?B?V2loWjZYTG5CWEwrKytTeE5kZ2VWZ1h2dVNZcnh5SVgwQW96aXhITnpod3ZF?=
 =?utf-8?B?bEhNS3BaMllzQTJhUkhBSXV5UHdBMDJzeEdnbXEzR2RPbFp4ZXFXaGFZQVJK?=
 =?utf-8?B?MEFwZGpmU2hmVVJjaTNjSEVsL1Y1VDVjQkxBWlVsMXI3RWtzekJFdCtSZXE5?=
 =?utf-8?B?QVk3TW5qUjdaMzJqbDRhb1lFdDFsOHNZSTF4czFvVkl2SThtaTBXRFNscnVr?=
 =?utf-8?B?Zmd0L3RDdkxJdnN0R2JRU1d2RHc4d1VJa25iOEwwSXdWcGYvMyt4Si9Rb3Fa?=
 =?utf-8?B?WXBwOWVNbjJKdmloN0p0RHNaOFluNzJJOFlycHFiS0gxNWExSk9Jek9mZEVu?=
 =?utf-8?B?ZitKRmRBamVJWnlNVUJ6SEVrYndKOG9qV3l3WCtzRFdlR0RxODk1QlArWXh6?=
 =?utf-8?B?ZEF5dDRSbkQrclh0dFNxMGZMMjdMSmdGU24xcFZKZi9PdkJXK1B0ekVNYXE1?=
 =?utf-8?B?d1dwdXphRHN0MkxzNWU1bGtQZDlLS3QxWU53eWpJN3VXSTFHZ3RDQm0rb3Zu?=
 =?utf-8?B?QUJMQ0VueHlOd1Q3MlF3YW1mSTIzWkVzYjNJYUdTRjVCUEJieGNiUWtVSnJk?=
 =?utf-8?B?WFVUZWcvSFkzQUxqNHFIYkNraUpmejN3UVRkUS9ZM1l0QmpNS1RFVWlHT2Rp?=
 =?utf-8?B?d3EweDM1TFArR254Zm5MYncxZkUySG5LZWF6NkhLQllDdGNHU2tkUUg0Tkdy?=
 =?utf-8?B?VVlVQVRHR3NWV0ZjMEY3bG1YR2krVCtBczhkc2ptbm1LVUJvd0VVN1VLOTA2?=
 =?utf-8?B?WUFManhZbEl2Q2U2ZXdjZXZ5YVVGQ0RpNUtXckRiYm40VGFYZFdQNUdaZ2VS?=
 =?utf-8?B?YmdteWhTYUg3Z2pVR1pwSzlDZENwUVRSaHlSdzdVSi9VRFBYS3J6dVVkektO?=
 =?utf-8?B?ckJQSVgvYlp3ZitJUk04bHpNdytVZ2IyVm1DZ3NMcGoxcklYaDh0Rk1ra0Vh?=
 =?utf-8?B?NUNxa0FxOHpibStIdzQ0bGFIMWt0UmVIeStZcFo1UlhkVldZZXkxNXpjekhw?=
 =?utf-8?B?ZXNoZFcrT29JbnFTUDJyUCtXVmovb2czbDBSV1pWWmZqeTlmT0djaURhWG5p?=
 =?utf-8?B?ZkFIZFBjUlhSUDhGQzdUR2FIZFN6SHdrQnFXSVVzMExUYUd3STFwZktJZFJw?=
 =?utf-8?B?MHp1OU1xaFRkcEh2WlNHcEJhRDFJUXBrK0V3U1ZwQXptamZqWWhwZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb09e3a3-a1c5-49f7-670b-08de4238006d
X-MS-Exchange-CrossTenant-AuthSource: DS1PR03MB7871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 15:29:02.7813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ef0JZynXHtJBjTm9622ZrobDcmEUAarnU2NB9kRh+jPxjaTI/dbTc2G4e09BUyPQmryKvrW62tBxaab556Wkww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7454

On Thu, Dec 18, 2025 at 11:02:40AM -0500, Stewart Hildebrand wrote:
> On 12/18/25 05:45, Jan Beulich wrote:
> > Calling a function with 10 arguments is inefficient on many architectures:
> > x86-64 allows for up to 6 register parameters, Arm64 for up to 8.
> > Everything else needs passing on the stack, i.e. forcing the compiler to
> > emit stack manipulation insns at every call site.
> > 
> > Shrinks generated code on x86 (with gcc15) by over 250 bytes. The gains on
> > Arm64 are a little less.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> > ---
> > Why is it, btw, that the declarations live in xen/vpci.h? These functions
> > aren't supposed to be called from outside xen/drivers/vpci/, are they? In
> > which case their decls may better live in a private header?
> 
> You have a good point, they could very well live in a private header IMO.

In fact most of vpci.h could become private.
vpci_{,de}assign_device() must obviously be public, plus a couple more
to satisfy calls from external sites: vpci_{read,write}(),
vpci_dump_msi(), vpci_process_pending() and vpci_reset_device().
Maybe something else I'm missing, but not a lot more.

Thanks, Roger.

