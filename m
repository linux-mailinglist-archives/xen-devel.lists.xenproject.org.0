Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D625C35295
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 11:44:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156098.1485398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGazL-0005TG-Gy; Wed, 05 Nov 2025 10:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156098.1485398; Wed, 05 Nov 2025 10:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGazL-0005Qg-E4; Wed, 05 Nov 2025 10:43:39 +0000
Received: by outflank-mailman (input) for mailman id 1156098;
 Wed, 05 Nov 2025 10:43:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kLci=5N=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vGazJ-0005Qa-Uw
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 10:43:38 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47be7431-ba34-11f0-980a-7dc792cee155;
 Wed, 05 Nov 2025 11:43:35 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB7850.eurprd03.prod.outlook.com (2603:10a6:20b:431::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 10:43:33 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 10:43:33 +0000
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
X-Inumbo-ID: 47be7431-ba34-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fhc/ZhB1WIhBFHTaSDR9ElLDODt4hyqfG6dbY75IwTZeBp6FN35HSAsDt3wNRD+dxF8Wvzx8cY/Ouw4TNGHQMd21aErA27Qb69qSUZf1hyuumIn8yKGRu/VymNQait8O5ekpPNoM9rZy6rvHRqGidPnB9+hg37SEgRgKhHCDGdH1DqedDc0jxRMXr3k2rZi97/J21DI/Sb2zG5TEl85r04mz8XHNEE+7pD7jGvS6P64j2dQJ/C6vG3Ouug+PN3hk8goBDvZPdZh53xoV1mobC9HA7xiBQVRBh01dDsi5547gNqY0K0gvgQtpDTZqmAHZZvy1rpMJxbov90E/fNY4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRGZMcfCwTi8UrNj8i4pmZkdfJpeanRI9kKk9JsV5CE=;
 b=s5oTlDtF44G/BKmRwemPhzLV5HnrvW1Z7+hwYkDe2oYgqQYAW6zkDUa0SuSdLCRetps/zv9mqPAgZU6QpPd+oCIrEQ/k/+e2UqlCt9lnPRCFBk8/yRO8PIh3M9vX7pWsfU0rrxS6cWt4akZcAfBtf14tnH9iLoLGzt9w/MCZXdF/XrTvgks8TELD+yhXrDTzGmgsDfnJxM6Xm1hfUS3rGWVXc76aN3cbb5XY3bZV/t2aEWT/dTSlb4a6Ku0A0uW9wDn/hk+vF7Rs/jpO9eobf7Ocf4l446jL6v8Te7DDqEleH5tizRT+LpzYaXGpLCMhS5kwszHDm2Mf6CJeScnhsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRGZMcfCwTi8UrNj8i4pmZkdfJpeanRI9kKk9JsV5CE=;
 b=sC2VgcGptXZ1g+ML78Mzt6RO4NuUDQwVQRMSg/61UPlhf/yQuY+xdqf96SAFUlQ5OO/OcyhVXc5/UX0KmPPeIOpsdeNgFpuSXSdpYGQQtldLHhYpDKYKUKnJQovZvk6wMAofuBgf5odSGA3rPYKyrZAv5F4fnm79Q/2nl6TRiVFyL0MvNjeNWvkYAcFpmhs+QMm2BoquTK5i/HoBeMfuqxFliZIG8sSPDZ5+UcxQcnfYuP2Cm9BkIKJLqbFTghjm1nuW88hCnAbSh34+3M7uZw+pL3j5Kpn8lcUwI/kkAz3mMman96S30gl0z27/zTcWYbi/z2EYM7wTEMRPu7x//Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <e4f69cb4-6552-4e75-808e-af58b138522f@epam.com>
Date: Wed, 5 Nov 2025 12:43:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen: make VMTRACE support optional
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Penny Zheng <Penny.Zheng@amd.com>
References: <20251031212005.1338212-1-grygorii_strashko@epam.com>
 <aab7824b-4485-41f4-8ad6-572ffa0ca4f3@vates.tech>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <aab7824b-4485-41f4-8ad6-572ffa0ca4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AM9PR03MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef3dcbf-5866-41cb-dc81-08de1c582a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVF6OHVBYXdJTzJ3eTNEQWcycTVJRGlEVFJqemFmMmlTbklWK09sdGUrb2lJ?=
 =?utf-8?B?SU13TFVNdGd3Z2NZckVrMlRRZ3VGcENndCtsb001cVRERDZ2Q2FaY3BQcHFM?=
 =?utf-8?B?Q0doYmZiVGRIdytxbzhhNkpjV29oOW56REo5Yi9DRDdpcm9PTnRKWXFXWlNW?=
 =?utf-8?B?NDcxWUJYdG1DVHVHd3VSQjdlYncyc0hOSUhyYjlmeGFENkVLUzM5TlVZeGJk?=
 =?utf-8?B?S2ZpWUhjZFFvbWNPdEJDUWVwa0RXMFJpSjhRUVo2d1FwbGRnUi9Wc3BhZUVM?=
 =?utf-8?B?Z1RqelpYaHpSNXM0TGRwaU5BbGM3WE8xQkxjZDFxWHVCVWZXL2MvZjlybGgz?=
 =?utf-8?B?bHlkajNROXdSMHdqckNmVnpFUGJWd3E0cUl1dWRGMmU1ZnVGZVlNSTRyN1k5?=
 =?utf-8?B?SC96UzFGbytlVXdRUWY1MjFUMXpleDVUSXlSampaSkZZZkNEbE1KVW5pVVJy?=
 =?utf-8?B?RHR3aHczNkdlUjRab3JDd1pwSWd5cXFrekdCd1NULzNZNDkyeHhCTXk4VU94?=
 =?utf-8?B?Zk5ySXorTmZYaEh6aUJRdWtpNzFsZ1dGY1FCY3JoWEhEOGVTSFJ1UTdHT1JQ?=
 =?utf-8?B?T05DSW9OV1EyUUlVVlVuL3dLeVhsTjBwSUVQZExFbG04Z0Jac0xNVXFMY3g3?=
 =?utf-8?B?NW5EMUZ1TXcvc1BOaUphdXpwVlNNdHdOVDlUS0dBOTllWHY5M1UwVUxxSTNU?=
 =?utf-8?B?UkdLdTlFSjROSWYwVUdLS2lSMTE4dXA0VU40VCtRK2xXcTVKcFdUQTRDejNV?=
 =?utf-8?B?dVZROTRzZEU1L1o4K0VHNit6SWx2ZTVsZFZWbW93Nk40UVVydE42ZHN6Rncx?=
 =?utf-8?B?cFdhVmxZTkpOZ0Q3T0dTWEZJODUzM0tCanZGU0ppN3ZWSmwyVVBFZCtjbzBm?=
 =?utf-8?B?QlZGSmRDMmVxZjFqTERFbXpFMTk5WlZOTnUzRjNzRmZ5dDlBYzFIUHl2QXhU?=
 =?utf-8?B?OENLb0x5bzJuc3dpSy9GQitkV3ZJWStUbkdwd1REaFFjZ3Z0czVWL3o3bXg5?=
 =?utf-8?B?ZUZVdXhlb3NXakFKVVY3RzUrVndva3lHQ2ZXTlZLZ0dseC90ZGZxWUVzMWNL?=
 =?utf-8?B?dWZOWldqUXBPL1pOb1BWdm9oVGd6MmlnbVR6Vlh2VGZUVVZQaVl2NlNVb0dS?=
 =?utf-8?B?Q3dBMkE4RWNKSmNxcE9zL2pxdUlPaXNiNWtaeUJhOTBIUExaSjJsZUd3TEZ1?=
 =?utf-8?B?eVl3cUs2VDhwQjViSVdhV01MNFQzb0J0UlVKSFFOQVpxQUpFb201bEV2dUpV?=
 =?utf-8?B?VkduUEdtNEtERlNzYm81NlllKzF0UGd5MnNqMnZzdXNqcWF0eDRsMXdsSUdH?=
 =?utf-8?B?YUFMd1YvRDdHVG9EK0V2Y0dQMDdkYW51aTVTRWR4dFBJKzlSYTY1R3FCZW5X?=
 =?utf-8?B?OG8wa29TTXhBeWhGempydU95ckduMVpyNlg3ME5uUThQajJnSXo2OUN3NTFw?=
 =?utf-8?B?MzdNM2lLSm5GYnhJR2VPNDFtd2g3bEFBN05XcnhIYjkvU1JOL2UzNEc4RkEx?=
 =?utf-8?B?ZXhESkhjSFc5YVRyU0J1T1hOUExIVHRZTmdUNGhXU1R6ZTdIRFUyRTUyb255?=
 =?utf-8?B?bWRxRHNNZmc1ZGxpd3NuNG1uUUM1YlNPZDJsaG5FVkYwODJzalo2Qk10WExq?=
 =?utf-8?B?YWdyYVdXdVFJNDZKVisyQVM3ZGNmeGNGaDV2R0R3ZkpMalI4aFFHVGJRcXJw?=
 =?utf-8?B?eVYyK1NVcGxDcDk1cmZzbkFjaGUvS1ZhbnlJdkNlTU9FMWpVMVREcnFBeU5D?=
 =?utf-8?B?TGlKOWlBYlRIOTBNK3pUd242bUFYdG8zUzVLcS9ZQkNUT0VLeHdVWDNNaElR?=
 =?utf-8?B?RkEzNHgwV2RzU2JRZWVGTG10YlcwOGtjbXhxckZpWkhaMC8xYitvd3ppM290?=
 =?utf-8?B?T2Q5ZWw3cXdXN2hna2thOEhjUmZyZHhYaDdTTC9jT3NmSkk2bUFkdUorZlFn?=
 =?utf-8?Q?YNcaBDW0wHSHyqur2KA9k+bGvYaW8Gpy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGgzQXFiQUVNdHFxRlBPZFR6TnNLYzRON3N5OFg3WjZTT0czRDQyVjRFblE2?=
 =?utf-8?B?cEN6K3h4bkFzZWZUd0VLeU5wWitld2RVQmNtWU9sMGNLY0pQK3JJT1oxeGZ3?=
 =?utf-8?B?b0o3eEEzSVBITFlkWmdtclB2VSt0TThhMy9CRXM0Qi9Jd3VDdlBwQUxnNHdl?=
 =?utf-8?B?TEZSUFRtOUVXcEt2V1BVV0o2VXdhRklzRUk0d3gyUCtWYlJzclNXU1dpOE5O?=
 =?utf-8?B?ZWd4T1ZWR0RMTlNyc2JGSW9JUnExRkRuUmtEbSt2RjZGcFZORGlFSGFuNnlC?=
 =?utf-8?B?R01PVXAveEdCU0hJK2h6bnlsb2tFdXpubVJUUzRrN1lJWGJ5SG9aNEk3VS9O?=
 =?utf-8?B?SC9UOTJEbGZEejR4RGZFNUh2RVlhM1VMMXJ3TENPY3ZTb1NvVHE1Nmt5anda?=
 =?utf-8?B?MWNRYmg2V2Z1VDI1Uk9QTTk4TGE0bkFOellMNEY5bjhuL0VISDlwRzVOWHpm?=
 =?utf-8?B?KysxeVJSSWxwZnQ3cDFYU2VBY3BwU283dDJOeWp0Q3JwTldmSVIreVlPbFhM?=
 =?utf-8?B?NTBwRm9JNCtsdnBYMlJyMTdLNXFQSDJDVEJpR0luWVZmWmwwYm1CMWRFd1BE?=
 =?utf-8?B?VDZxRVhCV2tqMlVlUC81RndwMlRtU0pNZnA0cVg3bVhGaWN2YVlrREFZTnJM?=
 =?utf-8?B?dEFvdEFYeXdPWmpsRVFlRGFiWGJqQU43ZmNKMmRnb2VRSjJRQkRVdXdpaDNB?=
 =?utf-8?B?c3VIaHQxbFhSaTBacHJRNmYvOWtlYStVOVNCOVBCQ1NIb0h3L1c1MHlDQ3Bi?=
 =?utf-8?B?dW5NaEgrZmk2YXRTNWMzaDJGQ0hqNm80cHNPb1NlTXo5M3dxTUIxSWcrTllZ?=
 =?utf-8?B?Y2l1SFpGN1pxYmg5MDl1MGNocVYwdUErME51YUFCanpaNmFhMFdSVWU0Q2JO?=
 =?utf-8?B?SFdXOFhWMEdTM1pzUWVINkk3M3U2UG9wTGNLaWlCelhEOGlZMmRBem0rTG90?=
 =?utf-8?B?YjVYeUw3NG5qTEV1MmJSL0tBazdPb1o0VHF1WWp3TDBuYTFCMFo2bk1qWVdZ?=
 =?utf-8?B?MVJOdDI1T1FFZzM1djhGejlIU3pXeEpHeWs2Ulg0ZW5pWjg5U2FFbmFodDlM?=
 =?utf-8?B?dCtRRDhaZ21kaGtXc0QvajZaSTBDQ2ZWVk5yK0prVU11VVMzNUFYcGVRSkZR?=
 =?utf-8?B?NUlSQVRzTFB6WFpJZWRsS3F6Z2RieWcwZlY4Z2lkcU1VTXpCZ3NiNUlONzZQ?=
 =?utf-8?B?RTVQckZnVEJ6UEdzcEo2eGpQck12ZjJuZ1NYbzRJQ3daeE1neEVxMWZoTlhp?=
 =?utf-8?B?d1RLNmcya2tObWJjRlVvWkFkZUp1MGVKdjg5MXBhbTE0dnRXWGpjK2l5V2tR?=
 =?utf-8?B?dzkweEUxdUVFTTR2ZXVBaEZidGp4UmVReVdNUGFqRjRuVG9IcER1Mk5hT2Fp?=
 =?utf-8?B?WVZRYjhPRlZmRlZ0SnhFZGtBVzZhV3lLUGp6VS9pUkx4VE11ZVpFT2hYNDNn?=
 =?utf-8?B?cVVvd0oyVXB1ZVMxS2x3S2lrek1vRkV4MFp5U3dRbzBwZ1RYN1hPSmdFK2tB?=
 =?utf-8?B?bkErUHBaZ2JaL3loMkV6QzFJZk8zdlJjV2ovNFpoRDJWdDNiWU96WDRHRzUy?=
 =?utf-8?B?RURpTWxKVkE0amp2RHNtdHBCQ3huV2l4amw5M1JQaDE0NWZkVmZJMjVrbERa?=
 =?utf-8?B?ZnlvbXk2c1YxZllxckRlZG5BdnlIWUJmSk9kZ0EvU0hkUXNpNHlMWGl0azVN?=
 =?utf-8?B?MjNOVjJzQ2QxSzFZWSswUlkxRUlKdENHNytVU3FyRnlRR3N4SEkzd29TdHQr?=
 =?utf-8?B?VlhEUzliZnRNYVhRMUhobjJwV2pTclh0QjlzbXZWNVJqZFZyYlkyMTlTd1pp?=
 =?utf-8?B?UDNlaGlDSzVwTHRQWndBTk5SQ1lKZmo4aU5CSDEwVTB3NTQxS3Yxd2Q4bTNj?=
 =?utf-8?B?MUtDbDU4K0RaRlFIV3NZU0h4Wjl3RGJlWGRJM281aHcrVEV1VHFiNWxEUHZV?=
 =?utf-8?B?amRheGZDZ0lneGxzQUhHUG1ScVZidjBuMlNDNWtucnRlYytVV1B0Z3Zic0N4?=
 =?utf-8?B?ekxvdXBBL2xHdjJqcStNazhEN2poY0ZSUEZ3Wmp6S1oweEtVOUNtSTFLOXhV?=
 =?utf-8?B?RWZBS2V3Wkxid0lHeFg3WmtPbGlFVktNN2s4OEcvZnRCUS95WFFoMTNGMEJo?=
 =?utf-8?B?RFZTZWlRQkN3YUZsbkFjSlV3M3lLbkxWWkloNnowTGs4b3ZXTDlCQzN6U012?=
 =?utf-8?B?Nmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef3dcbf-5866-41cb-dc81-08de1c582a91
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 10:43:33.1578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3h9acnDYCxUjWoKI4Ci/zFKyclZELP2lzfzqGVYfJ5pWySiQqAId8NhkQXpJCz30qkjzo5Wy8JSNO+NlAnCP0KZ2gItfJ5ViLuycA0fCiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7850



On 03.11.25 11:47, Teddy Astie wrote:
> Le 31/10/2025 à 22:24, Grygorii Strashko a écrit :
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> The VMTRACE feature depends on Platform/Arch HW and code support and now
>> can be used only on x86 HVM with Intel VT-x (INTEL_VMX) enabled.
>> This makes VMTRACE support optional by introducing two Kconfig options:
>> - CONFIG_HAS_VMTRACE which allows Platform/Arch to advertise VMTRACE
>> support readiness
>> - CONFIG_VMTRACE to enable/disable the feature.
>>
> 
> I like the idea of making it optional since it's only used in specific
> contexts.
> 
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> Based on top of patch "domain: adjust soft-reset arch dependency" [1]
>>
>> [1] https://patchwork.kernel.org/project/xen-devel/patch/c9c8c9c6-a155-4986-bf77-5766cdcd6024@suse.com/
>>
>>    xen/Kconfig.debug                       | 15 +++++++++++++++
>>    xen/arch/x86/domctl.c                   |  4 ++++
>>    xen/arch/x86/hvm/Kconfig                |  1 +
>>    xen/arch/x86/hvm/vmx/vmcs.c             |  2 ++
>>    xen/arch/x86/hvm/vmx/vmx.c              | 10 ++++++++++
>>    xen/arch/x86/include/asm/guest-msr.h    |  2 ++
>>    xen/arch/x86/include/asm/hvm/hvm.h      |  9 +++++++++
>>    xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 ++
>>    xen/arch/x86/mm/mem_sharing.c           |  2 ++
>>    xen/arch/x86/vm_event.c                 |  6 ++++--
>>    xen/common/domain.c                     | 10 ++++++++++
>>    xen/common/memory.c                     |  6 ++++++
>>    xen/common/vm_event.c                   |  3 ++-
>>    xen/include/xen/domain.h                |  4 ++++
>>    xen/include/xen/sched.h                 |  4 ++++
>>    15 files changed, 77 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
>> index d900d926c555..70ec4f0d14a5 100644
>> --- a/xen/Kconfig.debug
>> +++ b/xen/Kconfig.debug
>> @@ -155,4 +155,19 @@ config DEBUG_INFO
>>    	  "make install-xen" for installing xen.efi, stripping needs to be
>>    	  done outside the Xen build environment).
>>    
>> +config HAS_VMTRACE
>> +    bool
>> +
>> +config VMTRACE
>> +    bool "HW VM tracing support"
>> +    depends on HAS_VMTRACE
>> +    default y
>> +    help
>> +      Enables HW VM tracing support which allows to configure HW processor
>> +      features (vmtrace_op) to enable capturing information about software
>> +      execution using dedicated hardware facilities with minimal interference
>> +      to the software being traced. The trace date can be retrieved using buffer
>> +      shared between Xen and domain
>> +      (see XENMEM_acquire_resource(XENMEM_resource_vmtrace_buf)).
>> +
>>    endmenu

[...]

>>    
>> diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
>> index fc349270b9c5..f4c8696ce54e 100644
>> --- a/xen/arch/x86/vm_event.c
>> +++ b/xen/arch/x86/vm_event.c
>> @@ -253,7 +253,9 @@ void vm_event_fill_regs(vm_event_request_t *req)
>>        req->data.regs.x86.shadow_gs = ctxt.shadow_gs;
>>        req->data.regs.x86.dr6 = ctxt.dr6;
>>    
>> +#ifdef CONFIG_VMTRACE
>>        if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos) != 1 )
>> +#endif
>>            req->data.regs.x86.vmtrace_pos = ~0;
> 
> This if-def looks very oddly placed.

I assume you are asking for hvm_vmtrace_output_position() stub, Right?

> 
>>    #endif
>>    }
>> @@ -303,12 +305,12 @@ void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
>>    #endif
>>    }
>>    
>> +#ifdef CONFIG_VMTRACE
>>    void vm_event_reset_vmtrace(struct vcpu *v)
>>    {
>> -#ifdef CONFIG_HVM
>>        hvm_vmtrace_reset(v);
>> -#endif
>>    }
>> +#endif
>>    
>>    /*
>>     * Local variables:
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 7dcd466e5a12..2be6ee03d004 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -136,7 +136,9 @@ struct vcpu *idle_vcpu[NR_CPUS] __read_mostly;
>>    
>>    vcpu_info_t dummy_vcpu_info;
>>    
>> +#ifdef CONFIG_VMTRACE
>>    bool __read_mostly vmtrace_available;
>> +#endif
>>    
>>    bool __read_mostly vpmu_is_available;
>>    
>> @@ -318,6 +320,7 @@ static void vcpu_info_reset(struct vcpu *v)
>>    
>>    static void vmtrace_free_buffer(struct vcpu *v)
>>    {
>> +#ifdef CONFIG_VMTRACE
>>        const struct domain *d = v->domain;
>>        struct page_info *pg = v->vmtrace.pg;
>>        unsigned int i;
>> @@ -332,10 +335,12 @@ static void vmtrace_free_buffer(struct vcpu *v)
>>            put_page_alloc_ref(&pg[i]);
>>            put_page_and_type(&pg[i]);
>>        }
>> +#endif
>>    }
>>    
>>    static int vmtrace_alloc_buffer(struct vcpu *v)
>>    {
>> +#ifdef CONFIG_VMTRACE
>>        struct domain *d = v->domain;
>>        struct page_info *pg;
>>        unsigned int i;
>> @@ -377,6 +382,9 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
>>        }
>>    
>>        return -ENODATA;
>> +#else
>> +    return 0;
>> +#endif
>>    }
>>    
>>    /*
>> @@ -825,7 +833,9 @@ struct domain *domain_create(domid_t domid,
>>            ASSERT(!config->altp2m.nr);
>>    #endif
>>    
>> +#ifdef CONFIG_VMTRACE
>>            d->vmtrace_size = config->vmtrace_size;
>> +#endif
>>        }
>>    
>>        /* Sort out our idea of is_control_domain(). */
>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>> index 3688e6dd5032..66dc7f7a0a41 100644
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -1155,8 +1155,10 @@ static unsigned int resource_max_frames(const struct domain *d,
>>        case XENMEM_resource_ioreq_server:
>>            return ioreq_server_max_frames(d);
>>    
>> +#ifdef CONFIG_VMTRACE
>>        case XENMEM_resource_vmtrace_buf:
>>            return d->vmtrace_size >> PAGE_SHIFT;
>> +#endif
>>    
>>        default:
>>            return 0;
>> @@ -1198,6 +1200,7 @@ static int acquire_ioreq_server(struct domain *d,
>>    #endif
>>    }
>>    
>> +#ifdef CONFIG_VMTRACE
>>    static int acquire_vmtrace_buf(
>>        struct domain *d, unsigned int id, unsigned int frame,
>>        unsigned int nr_frames, xen_pfn_t mfn_list[])
>> @@ -1220,6 +1223,7 @@ static int acquire_vmtrace_buf(
>>    
>>        return nr_frames;
>>    }
>> +#endif
>>    
> 
> Given that vmtrace feature is fairly isolated in VMX code, wouldn't it
> be better to move all vmtrace related functions (including vmx_init_ipt)
> in a separate vmtrace.c file and make such file gated behind
> CONFIG_VMTRACE ?
> 

Are you thinking about:
  xen/common/
  |- vmtrace.c
  xen/arch/x86/hvm/vmx/
  |- vmtrace.c
?

or smth else?

[...]

-- 
Best regards,
-grygorii


