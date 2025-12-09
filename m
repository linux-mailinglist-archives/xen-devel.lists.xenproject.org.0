Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65251CB0808
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 17:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181939.1504907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT0EF-00014M-5j; Tue, 09 Dec 2025 16:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181939.1504907; Tue, 09 Dec 2025 16:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT0EF-00011d-1h; Tue, 09 Dec 2025 16:06:19 +0000
Received: by outflank-mailman (input) for mailman id 1181939;
 Tue, 09 Dec 2025 16:06:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/6M=6P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vT0ED-00011V-9h
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 16:06:17 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc63b7d9-d518-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 17:06:13 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by PA1PR03MB10920.eurprd03.prod.outlook.com (2603:10a6:102:487::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 16:06:11 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 16:06:11 +0000
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
X-Inumbo-ID: fc63b7d9-d518-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaugGz+5cgUz47SfLFuBxJb8Q8z5jDs2Isoh2HYgEhWj+QjBex3nA6vI9/cWlkhzGiSE56jzyH5vLhHkxFnkQ4/FHFJe6zTymakjerasioxiaoM7SehSASAn0xzCietUYhGW0TnS1ED6TWyjIN7j8sbvaaN2jycjEpPadc6+ru8GFAou5MZwSmSQJCbi/j7lTaCWmdX3laQNo9wNXqLl5Mr6bIv04zvw+Eb+31+ccJ67VtjgLoNJGFNIyMUfbcqq/8eiMJu6GiMEa6lPGIg8yOUBpB88S/a690Oy/RvbURpWK/3iFXlyaBARQp8krF8PwAo3bq0DSV6WEruxzbqE2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ekjQOCbCdvOSvnHkmr+p7Bj7eN/UBCvwHGLisoA8Ds=;
 b=Nw1QW7zGc1PajyYZ4DZ9PU6KuAJv1G7H5xBKv6qJgtnsSUBXsH/gY1vYgukRe8ONLgZkMTcBzAKc+zVmJImjSG7HZAKBB5SfVLKI8ID7lyqon8JeECWV/Yp7GQmjatXMM420znQOiVAuJFbrF218N3ADx9POVtZs1xWYnOhB4PGI2g18SWTSLlHKHgWK/DkpJX24I/0sZmBs8nqhRtadHgQgWYMcTYszFzAZo+dopatoOeHc3E+FUUYCvH+q03c2e5ZlI6CVwe85XDDy0eoQFhYY3iZmDx0qf2qS0XD+UB0bAHFE4C6R2mhD8Ps6zT1Dz2bA9KhpQYkKmYLd5twyiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ekjQOCbCdvOSvnHkmr+p7Bj7eN/UBCvwHGLisoA8Ds=;
 b=ojO4tDUp/gHukte5zd3rzmCM+Z7mbLiqx97cMmNkAjJLz3vigGxEUiErNJv3Yz/Ms0rTZStMipSynOIoME742/SRjV+lPNt7ydMJr5F2DscSEgDFBl5Kce7XugXHXpilQAJa5KDvW7d1Hg3R5DOO8G6c5UUSIPic/TVP1BMEE/4IEmZip97Z0Xlv/tVSQXU2Vp0gu4raHM+daPpT9e2AyntkIvYOuCeuRskXeg93KvVw3hDQ2br7EppJ6A6fCIG3iLvWhnj5zBj76OJcwyt37cAspXZegcaTJNHbyXc/k1BqB2nBeVSvxicnWQSQUVs9aOzhQmEzpdU/qu9Gr+EmWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <147c917d-5ec4-4134-b531-3483d445283a@epam.com>
Date: Tue, 9 Dec 2025 18:06:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: Unhide writes to d->arch.hv_compat_vstart
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251209155719.2098440-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251209155719.2098440-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::21) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|PA1PR03MB10920:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ec7842-6521-4145-b3f8-08de373cdf49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0pBVmJuYTdiL3JPa3dKR0thV1FpVkJPYVpsc3FDZkFkMUZsUWpYc05SY1g3?=
 =?utf-8?B?bUtTVElZUUtudjM5WVJRMmNGYUp6VTVxaE51eU0yNFNRYmpZVkh1NVVQdjVr?=
 =?utf-8?B?aXlnK0FHRUttbkR4aHhjN3N1cWFSQjFzR3pRTG1zL0VaaXJPaEhqdFBrWkcz?=
 =?utf-8?B?N041Wk9NYmZwWWhKTkt3OGFHa2NwV3pDWVdKc1N1QWRHSGNuQ0IzK01kU2Fm?=
 =?utf-8?B?RW10MkNydnA4dFRFTy9yWURadCsxY1psME5rREkxcGMzNzBsdDRwempZU1do?=
 =?utf-8?B?czFFVlF2OFJoeDloeUd2L09EUStKc0NUNVpxbXQ0RHBQNDVPdTBzWFVEbkVK?=
 =?utf-8?B?Yzd2YXB2alNRb1UyZEZMTThBaE9GazNLNlcyWnJjdnlNTFIrZ1A1aERsa1dn?=
 =?utf-8?B?MWFCVjh6N3NIUEtLaU84UituMDhMUUlPQklCNjlDSDk4RVFtRk51Rm0zUXRN?=
 =?utf-8?B?SmtrWHVXUWFyT3dWa2ZCdFJSeDA4RUtxeUtTNXZsbGZ4NEk4MlJwRkNqK2Q3?=
 =?utf-8?B?RG5KRkxBWDZ0TThSZ3ZpTFVSZHBuaEhRSzlsQ0tIeHYrK2RZVEZLdUwzRldV?=
 =?utf-8?B?a0JGVWMxRktxSWNINEZZTVExVjJWN2wrUXovMERSbTZILzVCdXY2VmN6TE5p?=
 =?utf-8?B?NHhHWlN1V01BMTlvbkFNU0tNbEpzTmlUTXloSkZSSUR3VlZhTnlObm9Yak1N?=
 =?utf-8?B?cDJlNVBwbCt1N0pvbFhyN2RUcWZMbUNWYUlQdDJpemIrTjNIK29HVEhjbk1Y?=
 =?utf-8?B?WnYyQ3dkbDNXdHlTSjN1b3NHT1hESU5aYytjUjBsYWZxbDlhbUxaQmp2enNY?=
 =?utf-8?B?bndkY2l1SWNTOGxwN3JkZmtFNUsyYy9KTU80bTVSQ0tMblhacHBsRTVwdVFs?=
 =?utf-8?B?dCt1MDdkNVR2K3FxbVJ2QWtDaVlmb0dwU0UxM2R6VnB3ZmpkKyszdGsxNVRL?=
 =?utf-8?B?M1UwMzcvVnVwaEVRWWsvcFdlVGpnUnFqa01jRFhGVHJmS1hJS3gwSmNyWWJG?=
 =?utf-8?B?ZDBYL20ramlVN3JzK0xoM3ZFOGJiUHc5a0JiS2tReG1HTWRLS2h2S1kwZU9T?=
 =?utf-8?B?LzRXVzErY2VCblE3K01jY3NJd2FUL2dWUFJuTTl5Y2lhV1EvWXN5VGV4Ykww?=
 =?utf-8?B?OWxzbTlocjZFZTFrSUZQL1ZhaFZDOVQ3NURrTklFUkNtTVZkaWdrWTEvdHdQ?=
 =?utf-8?B?d3FjWWhNUmpkL0pIWkhLTi9zZ3NEKy84VThRL0ZaYVpyNGRCRUpBV0h2ZlFt?=
 =?utf-8?B?NmRnNHVlbncwMWhpbjdQSFVvUk04Z1d5NnBMWUQyWDFKWTlnaXVhczZyR3Nx?=
 =?utf-8?B?a3JoVGJzMzBUWWJYaTV0SE5DcmVwTCtmME9lZWpMdkNyTjBOcDMyamhZTDFx?=
 =?utf-8?B?NjhIWGlHVHRKMTNteEE0R3BvWWFJSUp6dWtNN2pzdjJVL1I3bE9wNm1aQ3VX?=
 =?utf-8?B?UGYycjFGczQ3VVlaaFBlYWszRWpYMVdiYnBhYjgybzg2cWhTVERjOXBkK2I4?=
 =?utf-8?B?RkMwbGlIRzRleUtpVzJibkdxcHZlUElFMEZrVEpvc1M3TlljYlB5b21DYk9F?=
 =?utf-8?B?V2laNzRaWVY0REJYNFdoTWl1YnphMDh4TnJsUUpPbVJOZEZhSjZiTnoxR2NB?=
 =?utf-8?B?T2d5dFlpWUt3U002SUNuNG1tNGdnbUdiNVNtTDZuNm1sSzB2TXVvZDJyR0RY?=
 =?utf-8?B?Nit1MTgwUHhpZUp5OGRwWXJxMGd6VFIrdzRMTmEyRWhaclloVEp0bEJKS3A1?=
 =?utf-8?B?eEVlUzV6U2ZSQXlxYmRUUDc5ZlZEUWdITnF2NHE3STB0cnQxbjd2Yk81dlIr?=
 =?utf-8?B?aS9BRjVHeFdFa1BPM3J4WVQ4SElHSmRIN01tcE9pUDdWaG1nVXAxZ1RhZnFq?=
 =?utf-8?B?T200dWZlWUFkTW5EdmhOeU9uaW5abFVmOFpnZDhyd25GNC9hUDJ4VWVQMHhC?=
 =?utf-8?Q?mbu0E5ix8vQaxY/KvL2v/UtZtQcs7orz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjJBMVh5VEtla2xmNmVHQ3o5akx1YXNVWndQRXE4ME51RDRZek9QditwYnBD?=
 =?utf-8?B?eDJuMUhzd09iKzViWXhuVDBnRW53RG1GM2xFZnRyV09FRThzR0t4dEhWN09u?=
 =?utf-8?B?NEpMWFJBdlU3K1lYdjVNN29kQnJsMThGbDlOTlRnR255TlpiOFFEMTFodXVm?=
 =?utf-8?B?UlZ3NmtNMnl1RXhaS3BIK3d2N0lTRk1zWXFZMVBRdlFsekgzdEZRK2txN2Yv?=
 =?utf-8?B?dCs5VnlSdUZtUUFtancvV1hKcGVlTHk0b25odjdhMFo4K3B3bVE5dW5TQUs1?=
 =?utf-8?B?QmkvZnFHOW5aRTZ4Mys1bzA0UWxycE5VNHlMUXF4RDQrYi9WZEJtb1pKOG9w?=
 =?utf-8?B?YldFRW53SlBCbEdQNlR4QklERVNwcXR1NHlTbkxnMEkydkxReXBpdnVuVytk?=
 =?utf-8?B?Y2VyWWNWdjJ1dEJ4aWNtZzZhLzByZVZ2YlJJcFlOQmVDMEYyaW9uTndXODY3?=
 =?utf-8?B?ZzRub1RsN3FQaFpJVk91SDUwVmlISU5ZaUFaczI2b3BYSm9mTTgvb0E5ZEx4?=
 =?utf-8?B?aWFJUUtyeXc5eUtVb2E3b1E5QzFEWkxvTUtxS2cvbURPNDRRR0lDQjA2amFi?=
 =?utf-8?B?T3oxTE1wR3N4SERVZ3ZOS2FrbXZWWnBwbWNNbjl4dUxrMURVQkYyZCtZM3dT?=
 =?utf-8?B?NXk0TFU3Z3hqblY2eDFMNnYxNVUrcFJ3QUdwaXpqOE9PVndRNGRJQXRrSHJR?=
 =?utf-8?B?SktzUFA4RlR2eUpSNlNGdFJoUnc2bEt2RnQxanV2ZnRjSzJTNUg5ZE9tb2t0?=
 =?utf-8?B?OFkrT0RFeDN0SnF6Z1NCclRHeTlRVlo1UE8zNjVGY2RYbXg5eXZyY2xQd1E2?=
 =?utf-8?B?L1N4MmNscTF4YlRuaEo1VFRLQ0UrUnFSRG5pUTJQanlrMWtxY3hTZko3WDZX?=
 =?utf-8?B?bXJ3dVJVRUg4b2VHMUhtelZBcVVwNC81dlhZMCs3aGlCTkRSekFFZW1hamJw?=
 =?utf-8?B?YXhLYmdjUlk0bDVGTkpISFBHdW5SNndzSkUzVmh1N0lMMFlMSE5OZUhrQytJ?=
 =?utf-8?B?SkUwNlRQTEZaQSs3eTdxM3pXUFBXWW1NRU96UTB1bXpkd1N5TklOZTRONURC?=
 =?utf-8?B?Z3FKMVA0cThVOU1YWGpWRU54Qy9ER1VPUk11RFJkclpwN1FqUHhCN1FrVFla?=
 =?utf-8?B?UVFXTTArdDFERno5Y2JGbm85NzJObFpKbFE2WTN5TzdwZW1ROWdYWG16Y2lw?=
 =?utf-8?B?MWoycStBempOcE9jNWRwMk5NTzFZVHkra3U2M1BRbUxkOGJLa3BROHRoU1dD?=
 =?utf-8?B?UUtMOUc2akZ5bjI1SDFPZE5CaXA5T2NMRzM3YVlBeDN2ekttTVhNWVhaSjl2?=
 =?utf-8?B?R2VmSjZSbmg4MDNma3kwdHlOOVR3VVRTTFVQa1NpSDJ4ak4yQ3BrenAzdmt4?=
 =?utf-8?B?V0ExU01xcS91OW5jVG80L0RUM0UwVjV3QTZ6MTFGYldYUkhLekhnNm41TnQv?=
 =?utf-8?B?QytVNURiQXdCV3lZcVRsTng2ZjlXQXFVVnREck1XaE1ZUVNQUnJTZWxVUWxx?=
 =?utf-8?B?Qkk0VXllQnhvbFFkY2VmS2NkUUs1eFVlSi9GQ1R5MFozM3FuTmxFZVJDTE1i?=
 =?utf-8?B?UENNSzdreitiRUVvQkFTRVY4TzlOVk9saWpKS1FldFNKWEgwditscUNBZkNC?=
 =?utf-8?B?SVRuRDZXUUhvNFVuSDE4OFN3enRIb0dVM25aS2lITm05bjNxM1UrZG5KOWpj?=
 =?utf-8?B?czN5cTNkdjJIdUtaMWVqOUVFL29Ta3VkYzV6YmVuOW1EWHYwSE5ZRTdsbUxx?=
 =?utf-8?B?eGtYSExQRGV4T2NDdGllVHNzQ21sbUw1Ym1vTEw5cXN2UHFYMU9uT0FxYWFp?=
 =?utf-8?B?UEIxSnErdm4walZCc2Q1L09Dd2o2eEhrekhBaCt1UUx0WkxSQ0pMa2g4eUdo?=
 =?utf-8?B?eGtXT3djR3NxWkU4eEhiTVpBY1dXSVhYWTI3Vy9EamQ3clltUVV6TzQxM21Z?=
 =?utf-8?B?R2Q2Mkk1ZnNybld3bGsyUGVmTU1zOFhidUprTXFMV3FWaG9NV0hHcDJKSmdK?=
 =?utf-8?B?SXoydnBkNFVCWGFaT2hRWUErVEYrUm5ndURIZkJ4N0c2V2J2TXcvalNSWXRM?=
 =?utf-8?B?RzJYUjBXNVV3dmFoTmFsY1ZBY0pBa2d4STMrdjVxamdqK0RlK1V5K2tNUVJY?=
 =?utf-8?B?RUFUSkExV1dlcWFTQ2oxWk9nUVZEZmhaNXRTQ0lyRWM1b1MvemJvbVJFRnpv?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ec7842-6521-4145-b3f8-08de373cdf49
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 16:06:11.8025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0J+KqgtEJvdYKzcRtsm8v775WgqxXh6bzY4CY/iDSnHrwr7XrtlAHNkdEGItt+UIa9D3n0kwcmxecWJHJSQv20XeUe5SgCG0F5Z1Jyob++0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10920

Hi Andrew,

On 09.12.25 17:57, Andrew Cooper wrote:
> The variable is never 0, but because the writes into it are hidden behind the
> HYPERVISOR_COMPAT_VIRT_START() macro, it does a good impression of appearing
> to be 0.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>   xen/arch/x86/domain.c        | 2 +-
>   xen/arch/x86/pv/dom0_build.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index bd75d044a01b..d33a42c8824c 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -891,7 +891,7 @@ int arch_domain_create(struct domain *d,
>       d->arch.emulation_flags = emflags;
>   
>   #ifdef CONFIG_PV32
> -    HYPERVISOR_COMPAT_VIRT_START(d) =
> +    d->arch.hv_compat_vstart =
>           is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
>   #endif

Any chances it can be moved in pv_domain_initialise()?

>   
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index 21158ce1812e..fed03dc15dcf 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -521,7 +521,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
>                   printk("Dom0 expects too high a hypervisor start address\n");
>                   return -ERANGE;
>               }
> -            HYPERVISOR_COMPAT_VIRT_START(d) =
> +            d->arch.hv_compat_vstart =
>                   max_t(unsigned int, m2p_compat_vstart, value);
>           }


Thank you.

-- 
Best regards,
-grygorii


