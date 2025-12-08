Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0475CAE42B
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 22:45:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181137.1504233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSj22-0001Sd-JM; Mon, 08 Dec 2025 21:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181137.1504233; Mon, 08 Dec 2025 21:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSj22-0001Q3-G3; Mon, 08 Dec 2025 21:44:34 +0000
Received: by outflank-mailman (input) for mailman id 1181137;
 Mon, 08 Dec 2025 21:44:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NKnm=6O=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vSj20-0001Px-I4
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 21:44:32 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 135efdb1-d47f-11f0-b15b-2bf370ae4941;
 Mon, 08 Dec 2025 22:44:30 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by AS2PR03MB10057.eurprd03.prod.outlook.com (2603:10a6:20b:64b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 21:44:27 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 21:44:27 +0000
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
X-Inumbo-ID: 135efdb1-d47f-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlMhamKnvJPyMvof1eaPLPI5LyhOV7c/6XhtbDM9sBfqJMUbBtg6BhPqNbKGmEBR8Y7+HkwdK3i+lsVjBdQmuQaJwzO4NRIJL7JjJId+v7lZ6nqh75BYLlc6q9j0NQ+FxptOQz9o1eOh1j4xSrpiM1pczKFhM2tJh2RaoZeYhpi8WN+b1RRzUo+6xdJz50qMll/bD92Z5aB9E/oT0bGjjaWxdMAfTgIxgCL6sATEHGdWNqu4Uc8KZsvsdW4g7OO4aWPUGt9n81KQEt0xtJXeOPKqiZIlRuK7TVLbvty5frU3g+PQMkeIUVv0npRbg9kcglH2Jq/Fov7L9yOIypFtyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaceH2yTTW7R0FX7Ph5XRZ16Jx/b2pfEswPV2OYmNAk=;
 b=ecPCJKvwRAwrg7KB2AwozBL0djiZOIogZeUHQFpUS7yI/09K2eSbLSo/O712k0EYCNW9SrOgFfEWspK65jfpHToAPDK2/hbVzArfunIlax1SPw8qIS8VTT77/I2AcdnYTpbAJr7bzEha3iYVoDSOocfx0324XaQvEymwKTVLbX+VXaKOl5bUDTfW3P8iLrpus/NBHf2G/Aw+xY0v4P7pvp0PSPG6tMhREAe/CsKqKL1RJMF98r3gmytToSNhP0+ShzVnnq3SGKM8zcJc/d+zETizymuf0+k5B96pJTn2F/Xdgx0OQ52PA432wCdDFwsfq8JHsvheVqL290eJvcF2GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaceH2yTTW7R0FX7Ph5XRZ16Jx/b2pfEswPV2OYmNAk=;
 b=fKNSmURS/ZU6G14UOZTcGH8HeL1x1EIn7MdoLfsvkA4J94Uaz9V42Q/z/vyN3V8ZqSRBwpjKncIm14FI/cfP0xzfW34Y8aOXRjxJHYwT8IaQ9t2JhT8VDBdACk7u7VLBh0eSPycFn9dbTw2PU2chCOVVu3nqUX6HK4AA0crglG1lHVLhYwX7edOHlwFrqxpQl82M7PYTR0j7AG4P7flXh6oQVdLBL9YUv3cmjqz5CwQme/bt8OBCeamL3U3ScOEDD80CS0+GUp8P8K3tSXVeai0c7aHIWXojt7V3je4jD3uEiwOyegILGfZ7bHm3bBP5CvixUI6O8A+bHpVGm12HaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <4ec39256-3850-4a57-9876-ba50fc5d65bc@epam.com>
Date: Mon, 8 Dec 2025 23:44:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] domctl: Provide appropriate error code when PIRQs are
 not supported
To: xen-devel@lists.xenproject.org
References: <cover.1764961645.git.milan_djokic@epam.com>
 <b38b7b65630d1f167d1589d21556be1493c180be.1764961645.git.milan_djokic@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <b38b7b65630d1f167d1589d21556be1493c180be.1764961645.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::25) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|AS2PR03MB10057:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a88c72-00a7-4511-906f-08de36a2f5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RThOY3F6MlkrTDc4bWRvcmNYODlIS2pGWXM0Nk9LcXIralRmM0hiazhkYnZn?=
 =?utf-8?B?MjEwYitmRFdBSHZWRTB3eGRUNWt2TzVNckFNT0U5RkJiUUZJbEpQN2FNMXk2?=
 =?utf-8?B?Z3lCZnpzalkvV0lDcVFXTjFocEk3UlVIdytKbXR5L2YyT3dpNS9rNVV4OURn?=
 =?utf-8?B?UEhmQk1XVVhOVnAzWWtzQ010T3ZPMDJjVE13a1pMZldFdEZDb2RmaU1Yd1ZK?=
 =?utf-8?B?UlNwLzM1SThNOUg5dHJ6Y0JKU293dzZ5UXgrL1lpekUwL0RmVzh3RUxaZHpI?=
 =?utf-8?B?dndDS1dUSDltd1ZMYm9DU1NycjdMa1FkZTErVTBGL0t0ZHNXZTI3aHhwdnFD?=
 =?utf-8?B?SUs0bDIwSjdUalAza210aFNjV3grQW1ZOTkydkpXd2paRVdlcVgvNXFRcW9x?=
 =?utf-8?B?R3IrMUR3Rld5N0V2MlFWMDVMbUxueDVYQlBhUkFEdEpIa0xrWVcxd25rTFhP?=
 =?utf-8?B?Q25BVWVuem5GK2ppcWwraWZxVG5IeTZvcENlQjFaelh1aHQ5Z0ZCdGduc2Z1?=
 =?utf-8?B?WU9MS0VzQzh5T1dycXVSRHZyTWx0eDdJVUxBYUZERXFEUjcyVU1FVVRadnpt?=
 =?utf-8?B?ZUg1eDd2aWhjcEpSVG1WQ3RHd09ZRWczalNtWXJvaEZDaVFLK2ZzQnZmMFNL?=
 =?utf-8?B?bGVpeTg4VkNZcnp0RU82bWRqRW9CUWNiU0t0bDM0NnhoMlpYMDFKa1VXdzR0?=
 =?utf-8?B?MDNXN2U2dFpaZFEwK2FuUHV6Q1VDdGowaHpMV2JpdG1KaUVTNU1uQWlkQm80?=
 =?utf-8?B?aE8yM1FmNmVsOExWeWdFampvTVdYM3prRmtoY1c1SnlKYnROZGx1UFpWU3hs?=
 =?utf-8?B?dER6MVY2MDNsTnROc3kzWjhrbml5cVMxTi9SOVpEQkNtWkpOMy9qNGxUT0pt?=
 =?utf-8?B?aXpnUy9zZTNSeVZ4MnRGVGxlK3QxZEZaV0QyNm1xVFRTNUlvWlkzKzQvS24w?=
 =?utf-8?B?djZ4bUsrUmxkbzRNQkVVZGxydUFkYTIrbWFGU1EwNkt1T3lZZmdIRmtYSVRJ?=
 =?utf-8?B?UE9iRFBPRE40VEl0OCtiT1oxTFN4T3R6TWtlbUlRbGptazh1dS9DYkxkbmpS?=
 =?utf-8?B?dktlK0h2MjVrYkJMbUQwTjJuVk1iK01OMS9xS0g5bDVOOEdoYUYxRy9ld1Iv?=
 =?utf-8?B?QWUvT1JZSDlBK3pRSTB3K3pFaGc1bmtKek4xMDY0OW1kYW1RUmV1R2dQRE5J?=
 =?utf-8?B?N04xdmg2aVBuclFpcGlWUTcrSFBLM3NiNnhlMWZ1SFlBeGxWNmVLSDE3NnY1?=
 =?utf-8?B?NzF5c0dpR2krKzZiVXIvY09MRkV6WHFpT1RENzB6SnJXZldxbzBqSThDejFv?=
 =?utf-8?B?a0pNVjVHbTNqczBmcXpVaGQ3dC8xdFhYaFl5MUR1UlpObTEvUzZxSUk2YzlB?=
 =?utf-8?B?Z2dsNmIwdWIrM3JoRytnb0FQb2tvV0JnMHRHYWZPUUlzN2h5Wmx0cks5MExP?=
 =?utf-8?B?dzF2ZDUwUlpyWGRNK3NNNG1UM3BKQUYwL1RhekZsYzd4SmN2VjhHcXBiK2Z3?=
 =?utf-8?B?eHo5Q3kzWFV1ZHNDRTdsVlZyQlEvU0hNK2RTR2FqVEFRVEtwbnhPdk9MTGMz?=
 =?utf-8?B?aGJIMy9pV2FwOGhFT0xZcTFnMjVUVU9HKzhCL0dMV25BY3NLankwaVVzMVVF?=
 =?utf-8?B?VnZGZklHMk40MmRoWHZnNHJUR3R0TGpabmZVaVl0ekQ5cHluc1hPZVRTdnBx?=
 =?utf-8?B?b0xUQUgzdUlPVDcyMlM1a1o4MDZJVUdOVTJ1SWNsNVczS2pVN0NCOE11anhh?=
 =?utf-8?B?eGVlV3VVNkVzU3JrQnkvWjl6ZjZ5NFRLK2xxazY3bWYyR1Y1Q01iaXpSNEpE?=
 =?utf-8?B?QVFnNU56TExOMWQrU3U5VFp5WFNnZzRjenRtZFRqMEgwaVZoOWlaREF4L0sr?=
 =?utf-8?B?c2kvZ0wvZHJSNjJlZHdVZ3NGdzhuWGh4c1BVVWVHKzJOSkZiNk5QQzFDaEFS?=
 =?utf-8?Q?7sAIVKCvlAOuQXQ+WsKm5YMmL8RXYk6p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2ZQV3R4OVdaK2FUREFSQy9BWU5Faml1NnZNS3lVM1VZcG9WQ3pmOWJYNWRz?=
 =?utf-8?B?UmpqbjV5aE9hRmZiQXhCM0RwMCs2djZHcHFPdVJuMHNzeDJrVHQyZmRqNys5?=
 =?utf-8?B?RlZlQnY1ekRGNHZCdTAzUytnc1Jpc2RwWWx3blJPdklBSHcxbi9PVzkyaXk5?=
 =?utf-8?B?Y1QvYlhsOEpHU1hkN3BiczcrelkvdGlSZ1E1bXp3U1hKZFFra05FcTlnRHZK?=
 =?utf-8?B?RUI1SDZveHVBYUdBY0dGOTZRSVpvWnozTmFkVjZZRk4xeU9jZUp0ZVltRkU5?=
 =?utf-8?B?dmtLbVFscHN4NDRleXJPUTlGR0UrVmlWZzFySldYc2N6bFVZck9VTnI2N3Jk?=
 =?utf-8?B?TlE4NmpHU2dUangxQTh5ZXd4a3JNcFNxR1Q1S1hHa21GRS9jMUt3QnVnOElF?=
 =?utf-8?B?cEdLR041QkoyRWJjazZSS0YxTGxpMU1GeVVaLzVweDlxMkx4VHJUbTg5Ukov?=
 =?utf-8?B?ayttSDNEdE5ocXp4TnN3RWJaYTN0Z2VmK0pWK01zaUoxd3VBTHM4RTd3YWRY?=
 =?utf-8?B?VS9ya1kyM3hLdTJxNUFrbWxCN2pkN3duM0ZhOWVkbGhJVVgra0ViWGMyWlhx?=
 =?utf-8?B?N21WZ2FzYXI5czBZUDk5eXVJMVVneXBJVUljTm1kTnJmVjlDWGZaZDRwNEZR?=
 =?utf-8?B?SnY0SFZvYi9NTm9ydGFrck5lTDJXSmJHRmZ2emRMdXZsZXZrV0pMM0dzU3FP?=
 =?utf-8?B?N0p6M0pTNk1WK016eVlsR25LTEZqN3V2QVVCdERieXJqV2tvQjFNYll0K2l1?=
 =?utf-8?B?b2toOHhReVlVVjFsdkFVSmVhdGc5dkNwMndiTnJINjJWOGNxNUxSS1Zndldr?=
 =?utf-8?B?UzI2NHdObDJ4VnFDTmZRY21tY3lSREZxWXZXdnNaVEx2WkpTTm84WVFsSUhW?=
 =?utf-8?B?SDEvTXFuMGlDeHRKSDhleExCYzhFK2Rzb0pPdDNrdlU0V1ZiU1ZISldoWjUz?=
 =?utf-8?B?cHRuT2cxUlE4ekVFOVZuNWJWbmY0dk04cHNES21FN0VJSmxUam5QK011VlVT?=
 =?utf-8?B?WGdFSGc0MU56YURQRHFQb0cwWHRQUFBpVUFjKzVoM05ueHBESEZtRllNazRC?=
 =?utf-8?B?V3ZCeGNheWxPTWxpcWlJNWR1YmtFZy9uUFhpYmt3aU0xSnhEaEJJWnhTYnhw?=
 =?utf-8?B?T0VmUkFhUGc3aGd4cS9FV0NEOHBwdlRkR3BLb1VTa3lVS1ZZK3NURE91bEJl?=
 =?utf-8?B?aUl1bDRNRzVtYkJzOXRzYmRDemRKYmtKTDBkWmloYnNOK2VBdWN0TWZrZ3RK?=
 =?utf-8?B?RXR4NVpFL083ZjNiL2h5ZThWY2NZb3FSb0FMNC9DeEt1Z2kyMEZubTJNbnVk?=
 =?utf-8?B?Z2Nxb2UxS3hGN3orWjgzL3I3SlRuM3ZPWG5YWTVNTHJlSnhhMVowN2NKbVly?=
 =?utf-8?B?OVZNWnlTQXpReGl4dGk1K0Z2S2ZZTFdEY3FKWEN0WEFob2VqcWxIcmEvaVdM?=
 =?utf-8?B?RXF6Zk53UFFWZy9pTlVRNjJPeVE4UnRxcDlQNk5kd0I3aU1Xa3lhT0tUMEt2?=
 =?utf-8?B?c3BHNHU4ZTJxOG9ueWlWcDQ3TmJzTUdtS3NuUEdlemg1QW0xamlwci9QYjZy?=
 =?utf-8?B?aDhPbkhGMGhidHkyYnZ2Y0hDSDNPQXdqWXpMKzd4NTBxb05WUlFmQjg1QnJu?=
 =?utf-8?B?dzNtSWJEMmJxYlp2QWZ0Q3RhaG1BM3BxcnRkM3owZ3NEVk9uYVlRUng5eC8w?=
 =?utf-8?B?ZEZWTE1OMDdyamhlS3BZNHpKejJYdHZOYVczQk1Pbk1EcDI3bmFBWGhuelpV?=
 =?utf-8?B?YTJPZ3FGZGRucjNUdWNFV1ZLbVlaRUFFWWV6RWFQbmxWSUtwd0VXTkZGa0h6?=
 =?utf-8?B?ZGpYaS84d3F0SlFmZnpCWFcxbjJXb1lQOUZNZkNxR2pIdmYzR3hyV1NsMGRR?=
 =?utf-8?B?TXVOR3h6cFhxWUVDTlAxRktCa3FyVEhhYk5jVWNLOTU5dkxGTDRUNFR2VStI?=
 =?utf-8?B?RWtCR1hFNTN3MjdsQzhheE5neDJHUGJvTnFZRSs2SFFObHFqVkc1QTBYQXJU?=
 =?utf-8?B?VmFrRHltN2Q3SnJGL1A3LzFHbmtFbUkreXhxTDBGY053eE92NkZMbXlTK01X?=
 =?utf-8?B?VlkwK25sZ2txRllJY01EWGZrMlcwNXM2dGFtQXpBdVlNbVljU09tTER2QjB1?=
 =?utf-8?B?djlVODlhMlN1c04xTTJHaS9KQVI0dG1oRnhBbTlHTWwwemYwOHJBbDJRcmYy?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a88c72-00a7-4511-906f-08de36a2f5f8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 21:44:27.3456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXlZog4EcVOm1d4lhmdZaiW4RpbUdKgimPu7sUL6NLAAVdk2edU8PTmKh2BcR3zAt/YWPAqvYHVtloL8nSnTA44kwJ9tO+d9UfP3YZQbnhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10057

Hi Milan,

Thank you for your patch.

On 05.12.25 22:36, Milan Djokic wrote:
> When PIRQs are not supported (e.g. for arm), XEN_DOMCTL_irq_permission
> command is not handled.
> This results with default (-ENOSYS) error code returned to control domain.
> Update command handling to return -EOPNOTSUPP if control domain
> invokes it by mistake when PIRQs are not supported.

> Also exclude xsm_irq_permission hooks from compilation when
> PIRQs are not supported.

Could you please do not mix such a clean up a changes with functional changes?
It deserve to be standalone patch.

> 
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/common/domctl.c     | 6 ++++--
>   xen/include/xsm/dummy.h | 4 ++--
>   xen/include/xsm/xsm.h   | 6 ++++--
>   xen/xsm/dummy.c         | 2 ++
>   xen/xsm/flask/hooks.c   | 5 ++++-
>   5 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 29a7726d32..159864bc99 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -638,9 +638,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>           }
>           break;
>   
> -#ifdef CONFIG_HAS_PIRQ
>       case XEN_DOMCTL_irq_permission:
>       {
> +#ifdef CONFIG_HAS_PIRQ
>           unsigned int pirq = op->u.irq_permission.pirq, irq;
>           int allow = op->u.irq_permission.allow_access;
>   
> @@ -656,9 +656,11 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>               ret = irq_permit_access(d, irq);
>           else
>               ret = irq_deny_access(d, irq);
> +#else
> +        ret = -EOPNOTSUPP;
> +#endif
>           break;
>       }
> -#endif
>   
>       case XEN_DOMCTL_iomem_permission:
>       {
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index e801dbcdba..6f6de161f9 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -555,14 +555,14 @@ static XSM_INLINE int cf_check xsm_unmap_domain_irq(
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, current->domain, d);
>   }
> -
> +#ifdef CONFIG_HAS_PIRQ
>   static XSM_INLINE int cf_check xsm_irq_permission(
>       XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
>   {
>       XSM_ASSERT_ACTION(XSM_HOOK);
>       return xsm_default_action(action, current->domain, d);
>   }
> -

[...]

-- 
Best regards,
-grygorii


