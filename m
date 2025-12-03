Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BD8C9F4D7
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 15:33:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176880.1501341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQnuV-0000GB-Qy; Wed, 03 Dec 2025 14:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176880.1501341; Wed, 03 Dec 2025 14:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQnuV-0000De-Ns; Wed, 03 Dec 2025 14:32:51 +0000
Received: by outflank-mailman (input) for mailman id 1176880;
 Wed, 03 Dec 2025 14:32:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Ymo=6J=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vQnuU-0000DY-CI
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 14:32:50 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0f6f815-d054-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 15:32:49 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by DU0PR03MB9056.eurprd03.prod.outlook.com (2603:10a6:10:464::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 14:32:46 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 14:32:45 +0000
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
X-Inumbo-ID: f0f6f815-d054-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynUPmaRP3eGF//xduvN4law3V4R+IPrjj8g+n2fZ/i4kaqOb9664Q38yO7VA89e5TEZ4CapyTlSN9SWgdC7nXA6Sk3Erl1U8ayjF1u6qSydQbF9QWpx70iTVXubFRhsOBNS2bCAzqyTIOvsovd6+HAAqsY0sSRN/4MeYd44OVj+p9ciOTGpNLARGjB7jEXWOskSoordUBUcSxpuykc38PaIyMPmqjk7LG7ex1toePjXtvjRZm73GUfwLKhcO54ijxsKGnrPSxg3oa+jUNL+4QtzBWllBErh3EnMA54iWIIWWxwf51Ij52hE9ojniDHjdWFnn3UO0Qmo1zs77+MrBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXK1X0YWQIWeNf42q7rA/LtFNPCr+yzLUG2W8AhPii0=;
 b=sukNRJbjIa+a8Ur1qwcJFjndhgrjPf9NoI51Sty1T+PUh8XpgDwb/E6RmQZbVaOOfMOvoobQcmCJ16hzFsSLGVFhQFN+z5Dvpn5i/Z3djCLNHJD9O30TyKYq8TOMGh5HjY3K6W7ejckGEpPI3mBqlR1axTIs9PymJNf3yR/QIMflDWt/7/xhG8LYIdgaZJz9TNYP2JpkKxYT2EJx3xaTHwWWAWzwekJJ0fuG3IgJIc2mv1eL73dbABALPTMJm2Iqu5bpfHGPzTRBVoBZX+13WR4USm8gbJsi5CWBdnIStwuEtCn8Jld2SdyXtuoyFp1dgoSJultFnSBERHcjhUKHJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXK1X0YWQIWeNf42q7rA/LtFNPCr+yzLUG2W8AhPii0=;
 b=f8mpbsvDhRHKAVcKgG5YDQmdZ31KuhwLMT0EmWvjKoenr8/Q178Givt8NO33UTCPyljM17R7y1L4vQQDp1C+t+dFziPhNUuMX+9IJHylxhgM7/h2BspropE7tlYnjJ+EnAeX+s+6uvmjpFi+x2ZqvKrDTi7p3o/briUX4b891ICVqHu6v/Cn8UIzI9PhRmISUyA+CWUbFYFUtV3S+E36RCWKCxDnH+GACqSuQUbRVVEgY0jMiLnfFibYJjTQ7u9JWwZIqovW4eSA5yf92iU7r4LZxusWOOezOYuIiHm/wkesK02VD6mnWu6f5j1cx35oy44Naz1hB60RXSRfYgekmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6a724a9d-dee8-483d-89bb-050aff381077@epam.com>
Date: Wed, 3 Dec 2025 16:32:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/dom0less: Increase guest DTB size for high-vCPU
 guests
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20251202193246.3357821-1-oleksandr_tyshchenko@epam.com>
 <98e9f551-cd8f-4c0c-aa79-144466e68df0@epam.com>
 <a1443030-f594-4f25-b12a-37974eae64d2@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <a1443030-f594-4f25-b12a-37974eae64d2@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To AM6PR03MB4600.eurprd03.prod.outlook.com
 (2603:10a6:20b:6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR03MB4600:EE_|DU0PR03MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: fc501fed-8704-4835-3921-08de3278d355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1lhOVdBdC9BT3M0NUJUbnFpclVUVVgrd21HcVB6eTBUdkw2MkdmWkovMXJE?=
 =?utf-8?B?Y2xUczc2NllnVlYyK2lrL1dFNW9LSm1tS1NGZDJ1bmx4Qkp2R0UrYlVVc05R?=
 =?utf-8?B?L2ZxSDBkeVk0d0lhR0hCbk1EQy93ZjVVUnkraGNqZ0VuSEtUeG5VbTRRM2g1?=
 =?utf-8?B?YnJ1TzZrVVRBM1NHZ29nYWpldXBxVmtzK2t5TUdDay8rOFhtUGx1Wnk4aVly?=
 =?utf-8?B?cTRjdWZOSmlUcUd6SDlOaTFTRU42R1o4cXFTcFNacGNwVndjVlFnSnIrSW9k?=
 =?utf-8?B?dWFCL2FyV3NmcjdKZ2JTTE9DOGhQaCtyUUtqSzhWRCtBRkRpTEhRV1lHUEM3?=
 =?utf-8?B?YWg4RmJuMFd5NFI0V1VJVVpxejRXUzgxc0ZUUkhsSHd3YkYwKzR2OGh2SGNp?=
 =?utf-8?B?NHk5ZHNmc25HYWVEekhyemFKR3YzUElXOVNCcVkwVHhGWGVoaDdnS0dCRVRj?=
 =?utf-8?B?RTBXNXJMU0IybUw1M05PaEdrOTV6cEhNWGhYQnBad3FzZU94aDJvY1FFSlpE?=
 =?utf-8?B?YVJkYXo2VkZUcXA2MlZmL2REeEpIa3hQMks3ZEgwUmpkdWF5Z1RsU1RtOE5E?=
 =?utf-8?B?MzhTczk4eFNNMmNPUWRDd21GajFOQzRsU01nNTBaTExyZjFSS3ZrZlV0NGZL?=
 =?utf-8?B?RFBhdGZndGh2aDV0UUpFWFBUY3pQUU0yYmg2RkJHdDR1cDg4bWJ1NlM4YWxh?=
 =?utf-8?B?Y25hMnVPMHJ4enZhRUE1OWlnckVLbXFHU3g5b2gvd2J0alFIbGNmSk9LWnkr?=
 =?utf-8?B?dWM2M0ZPK3ZaNDdXdDZtZTJBZmRGLyt4bEJlaXI2aytjd21ycXc2RXJYRDdY?=
 =?utf-8?B?WXgvb3ozMWFnSE5LQmQ2YWdmcThOVkJmdEZyTzVQRlZJenZ1RzdKU3BpTVRF?=
 =?utf-8?B?bWtIMStIVCtxekJKUG1vNGYvQk1vQ3o1aXJSNjdLWHdabk43TytvTVNZZW4y?=
 =?utf-8?B?ZmdSWGE5YjBFVk9TVWN6NXI3UWlPV2hrZWdsZzRERUlHUWhPVGErcTZtS0lO?=
 =?utf-8?B?eE9RWmV4WGF2c2pKL1F4blhSaU1ackxHOFgzbVFNemcvek5GMG11cm0rLzFi?=
 =?utf-8?B?eWhRRkRZaUt3eUZMRjZ3a0pPc3grcVc1bC9YS3VRWVFuNGRyWmFVS3dYQ1E4?=
 =?utf-8?B?Ym5IbEdtUGR0SEkrQk5rYitRR2YrRkZLVXU5NmliVGVYTythemVTc3M1Uytl?=
 =?utf-8?B?ZjRpd0s3bnA4LytMajF1dHJ4aFljVitCeG5xdEhrajd6Znh4TmYzOEU1SWxG?=
 =?utf-8?B?S0ZUbHJ0TzJ2QnN5dGk2eU80Q0hKMGpCS1I0M255OGdoMjRlOXpwMEJuRWgz?=
 =?utf-8?B?WUFjUFNWdFZMdGljeGZkRWJoN3ZMeFIydkJsNmZDNGw4SUFUZGJNL05IRk8v?=
 =?utf-8?B?alFzQTZaUEczR1hGRnNFNmVDQlBJOERjTHd0Um55MVhCbkFvMlhYbXVaRWdz?=
 =?utf-8?B?eWQ4aEpTa1JVc1c0VGlsUVpxK2xtVkhHV1luVk5nN1BGWGhkQ3pTSUxYeGpH?=
 =?utf-8?B?S3BQeVJ1SXdleXMrUmwzU3BYVStBY1BDNURiMWRDVWE1VzF6U3NKSnMxYW9P?=
 =?utf-8?B?UTYxaXBBU29vazNqdTdsajUvV0pMa0VXc3JTZ0dIaGFVYlczaTVwbkVrU00x?=
 =?utf-8?B?OUEvcVcrcHhPMGlucnFMQmhGcmdWZllFQ0l2cE5vUlJ3RXlLN2MrYVRhNXd1?=
 =?utf-8?B?WjFTRUNTczZTQkJjUkpsc05ya2VTazE0aWpZZ24zdmptUmhzS1NhRXM3RHd3?=
 =?utf-8?B?TCs4ckNFaE5ILzBFOHIvdm1OYU1MdXJQZTIwaG11V1pkb1RmY2swRDdVNjRC?=
 =?utf-8?B?T092clc4cGp4OVIyalBSd20yUjU4UVd3dGZGOVExNnpuTlMrYnRlenh6d2lR?=
 =?utf-8?B?eTRqWEhjeEFXdmFDWkxacjN2VXkzMkxMMTJNSzhOVUx1anQ3WGxmSHNNUUhQ?=
 =?utf-8?Q?ploPxLQIEDLk3rwfPkXaxCLLTVlU4dW+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTVJYmpXWnNPZ1dZb05mV0FRQmJLMmdhTE1PRW1USi93SmFsVnBhc2NjTEEr?=
 =?utf-8?B?R09JZUhHMUdDbDRpUERHdHN3eXlBaVAyNm1zaVErVmZrbVBrQm9zMmdIby9z?=
 =?utf-8?B?T2YwODVSSjNCbEFhMTBjWDNTWkpLeGYwVDF4TEgrSVRGSmZnOHMxWHdvdW5O?=
 =?utf-8?B?RnJWU3dvWElxdU1TWkxoV0Z3b1FPMGloWFIzTTAwOFJjZnVsT054ZWcxWnNs?=
 =?utf-8?B?TzFZdm00SmoyU0NibVJibjlSRkJyYkRRWFA2Mm5zWFo3VGVBM2FrQ3FpSnNm?=
 =?utf-8?B?Q2dYWDd4cDRoOURHSGpoV0gxNXhHcHdJeDRmbEs3eTJnbisxbXNoczhRemFj?=
 =?utf-8?B?ODViVjNxeFVKOUlWYVVyVGptWWMrZGx5KzU0OUdrTmJybWVXeDk4aDFheGhw?=
 =?utf-8?B?MHRudEJFVjRadVlhR3JyS2ZmYmZJQ0JBTVR1eERnNFkwV2s2VldWNVQvR1Iz?=
 =?utf-8?B?MSsxc0hnNGliK1hlWWZ4Nytzemc3MkQyZ2RKSUFZZlVCNzdLZmlOY3NUMm9i?=
 =?utf-8?B?Zjk3VzR2cGF0YXBVNzJrcDZuM2daMTE5dEFlMktrNXQyaGRXY0xBUkw0UnJP?=
 =?utf-8?B?VE9rVWdNOHgvRThPZnh4S1BPRFEva0VMU29uWDFEc0dFVDFwRmE5WnZzU29j?=
 =?utf-8?B?dGpXNjVNenhvUHZrYjUxYlhQNmt2Z1BKaTBWK3BkUE5zTG9yK1l5bHhYQzZM?=
 =?utf-8?B?THhIdDAzOE9WZHgzMkRQeEpUcGJGTWpKNEQ4aDBoMS9UblUvM1k1SFNpQlNN?=
 =?utf-8?B?QlNVcUxhWFlkcUxxM0hzQ0FDOVBQSlRKcElaSm1sQWJGYzQyOXYzMVBYcXMz?=
 =?utf-8?B?Wk5FN3FZWVdKR2hqL0xxcTRmem11YzhVRVc2R0g2bEFTWTlVSnJsa0ZpNDVs?=
 =?utf-8?B?V3NVRG1yWEJTTVpZVkZtQVNCQ21kZnlTNnExS3lUb1pkMWtWMzUzSUpPKzBW?=
 =?utf-8?B?T2Z4N3RqNGJnTWJPWHdYeGRXWHd5SGNIMTNLNWprZ3llcmp5R1BkZy83WHQr?=
 =?utf-8?B?anRCUWNkTHlkS1FKeDZlVUlUNmMwWTRlOCt1RHJTRm82U0hFWW5lRjlhNU0x?=
 =?utf-8?B?UmhlV3lIN0JxS21aKzVwQklZWEN2SjROdzcrMnR0VWNrT2U0VFVxU0oxYUc2?=
 =?utf-8?B?VWgydTQzYXkvbDRFV1E2UXRZb2JWR0djemU2c0NmZmhwc1FUaE9la1p1RWgz?=
 =?utf-8?B?bmV0VEZabGh0NFAvZ08xYWdESFZ3NDN2TGZaTmF6R01KcDY4Q2FZMkRTTFFr?=
 =?utf-8?B?T1RLZ3o2Ymw5RWdRY3NWeVNYWEdMNUM3MUw1L2xBKzJuYW4xRzR4U1paSHJy?=
 =?utf-8?B?a3dOYy83eDcrWWlId1U3aGN3OTd1Y05Dc3NJL2NTUTJVMVRGS1JycTNFVllX?=
 =?utf-8?B?UTQ2UEVxRlBwTC9XOER5MUo0ejVxTW9zayttOUpCaDJ0N29rMEhGTHFMZ0xM?=
 =?utf-8?B?bTFaOTdTem95aU9JcW15OHRiMk5TaVdDK3BDR25yT0s5UmpheFIyczZzaDhO?=
 =?utf-8?B?REREZ2s4bGVxUFMxd01VeWw5ck1qd0xjcnFqYnNyVHdtRmdHdVVnUk14amJr?=
 =?utf-8?B?REVkM3pGREM5YXJUWU8zdjBXN3JFYnpJcVV4cytYN21VVHVLUzBtdjJkMFVa?=
 =?utf-8?B?SmtERGpXbHBpblEwZ001SjV0Vm4wUUgyekNqaURxeHpjMGJDTEtOM1NiZ0VY?=
 =?utf-8?B?cko1K1pmYVFuZ2Q5enIyTHpqa2RicmZEV2xOeTRCdFNBM09JUURLUXpsd1pq?=
 =?utf-8?B?SU1KNVdqem5DNHZwRUk4cVZMeWRhL0p0WHZLbHRCQW1CRVNBcDdXUFZkYmJS?=
 =?utf-8?B?ZzNxNTBmT3d0Q2JZbEhYRmY1TVlRblpCRVV3U25zeGpuU09jVjBMa21XaDl2?=
 =?utf-8?B?VVUzQTNybmFTZnBMNzRjNDNZTXB5dy9EcHpadS9mdndUcUdLQkNZM1JkSVJm?=
 =?utf-8?B?anpvNzBIMVVjc1hzSis0WTJqdy8rNzJRY3F3WmRhbHMvZVpQbjBSMnoyYmlH?=
 =?utf-8?B?cS9kb1g0L09LMGwrMHNkWkdEMVZjRjFWNEF3d01MRTJ2d05yT0JKUzFiUjdU?=
 =?utf-8?B?ZXpYOXBoeGsvMHNnK3ZZVUF2RUN3UVM2QVJUVFA3WXFMWVMrMHh6WG4xNXBq?=
 =?utf-8?B?YzJVeTkzbG5wOUVXTFV6YldXSjNGcjA5OEc0MEdjeGlDcXZpZ0hWenAySEo2?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc501fed-8704-4835-3921-08de3278d355
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:32:45.8131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHV99XvINCT+AagqM/palxDaSTu13/KNIgx46I00n6930GMELNvH6eGi+klyNhy+knx+HrivbVt+bTtxTalmQs0ub/smQZrgqD7D2v+TPbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9056

Hi Oleksandr,

On 03.12.25 13:03, Oleksandr Tyshchenko wrote:
> 
> 
> On 02.12.25 23:33, Grygorii Strashko wrote:
> 
> 
> Hello Grygorii
> 
>>
>>
>> On 02.12.25 21:32, Oleksandr Tyshchenko wrote:
>>> Creating a guest with a high vCPU count (e.g., >32) fails because
>>> the guest's device tree buffer (DOMU_DTB_SIZE) overflows during creation.
>>> The FDT nodes for each vCPU quickly exhaust the 4KiB buffer,
>>> causing a guest creation failure.
>>>
>>> Increase the buffer size to 16KiB to support guests up to
>>> the MAX_VIRT_CPUS limit (128).
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>> Noticed when testing the boundary conditions for dom0less guest
>>> creation on Arm64.
>>>
>>> Domain configuration:
>>> fdt mknod /chosen domU0
>>> fdt set /chosen/domU0 compatible "xen,domain"
>>> fdt set /chosen/domU0 \#address-cells <0x2>
>>> fdt set /chosen/domU0 \#size-cells <0x2>
>>> fdt set /chosen/domU0 memory <0x0 0x10000 >
>>> fdt set /chosen/domU0 cpus <33>
>>> fdt set /chosen/domU0 vpl011
>>> fdt mknod /chosen/domU0 module@40400000
>>> fdt set /chosen/domU0/module@40400000 compatible  "multiboot,kernel"
>>> "multiboot,module"
>>> fdt set /chosen/domU0/module@40400000 reg <0x0 0x40400000 0x0 0x16000 >
>>> fdt set /chosen/domU0/module@40400000 bootargs "console=ttyAMA0"
>>>
>>> Failure log:
>>> (XEN) Xen dom0less mode detected
>>> (XEN) *** LOADING DOMU cpus=33 memory=0x10000KB ***
>>> (XEN) Loading d1 kernel from boot module @ 0000000040400000
>>> (XEN) Allocating mappings totalling 64MB for d1:
>>> (XEN) d1 BANK[0] 0x00000040000000-0x00000044000000 (64MB)
>>> (XEN) Device tree generation failed (-22).
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) Could not set up domain domU0 (rc = -22)
>>> (XEN) ****************************************
>>> ---
>>> ---
>>>    xen/common/device-tree/dom0less-build.c | 8 +++++---
>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/
>>> device-tree/dom0less-build.c
>>> index 3f5b987ed8..d7d0a47b97 100644
>>> --- a/xen/common/device-tree/dom0less-build.c
>>> +++ b/xen/common/device-tree/dom0less-build.c
>>> @@ -461,10 +461,12 @@ static int __init
>>> domain_handle_dtb_boot_module(struct domain *d,
>>>    /*
>>>     * The max size for DT is 2MB. However, the generated DT is small
>>> (not including
>>> - * domU passthrough DT nodes whose size we account separately), 4KB
>>> are enough
>>> - * for now, but we might have to increase it in the future.
>>> + * domU passthrough DT nodes whose size we account separately). The
>>> size is
>>> + * primarily driven by the number of vCPU nodes. The previous 4KiB
>>> buffer was
>>> + * insufficient for guests with high vCPU counts, so it has been
>>> increased
>>> + * to support up to the MAX_VIRT_CPUS limit (128).
>>>     */
>>> -#define DOMU_DTB_SIZE 4096
>>> +#define DOMU_DTB_SIZE (4096 * 4)
>>
>> May be It wants Kconfig?
>> Or some formula which accounts MAX_VIRT_CPUS?
> 
> 
> I agree that using a formula that accounts for MAX_VIRT_CPUS is the most
> robust approach.
> 
> Here is the empirical data (by testing with the maximum number of device
> tree nodes (e.g., hypervisor and reserved-memory nodes) and enabling all
> optional CPU properties (e.g., clock-frequency)):
> 
> cpus=1
> (XEN) Final compacted FDT size is: 1586 bytes
> 
> cpus=2
> (XEN) Final compacted FDT size is: 1698 bytes
> 
> cpus=32
> (XEN) Final compacted FDT size is: 5058 bytes
> 
> cpus=128
> (XEN) Final compacted FDT size is: 15810 bytes
> 
> 
> static int __init prepare_dtb_domU(struct domain *d, struct kernel_info
> *kinfo)
>    {
>        int addrcells, sizecells;
> @@ -569,6 +569,8 @@ static int __init prepare_dtb_domU(struct domain *d,
> struct kernel_info *kinfo)
>        if ( ret < 0 )
>            goto err;
> 
> +    printk("Final compacted FDT size is: %d bytes\n",
> fdt_totalsize(kinfo->fdt));
> +
>        return 0;
> 
>      err:
> 
> This data shows (assuming my testing/calculations are correct):
> 
> - A marginal cost of 112 bytes per vCPU in the final, compacted device tree.
> - A fixed base size of 1474 bytes for all non-vCPU content.

Thank for detailed analyses and info.

> 
> Based on that I would propose the following formula with the justification:
> 
> /*
>    * The size is calculated from a fixed baseline plus a scalable
>    * portion for each potential vCPU node up to the system limit
>    * (MAX_VIRT_CPUS), as the vCPU nodes are the primary consumer
>    * of space.
>    *
>    * The baseline of 2KiB is a safe buffer for all non-vCPU FDT
>    * content. The 128 bytes per vCPU is derived from a worst-case
>    * analysis of the FDT construction-time size for a single
>    * vCPU node.
>    */
> #define DOMU_DTB_SIZE (2048 + (MAX_VIRT_CPUS * 128))
> 
> **********************************************
> 
> Please tell me would you be happy with that?

It looks ok. One thing I worry about - should it be Xen page aligned?

-- 
Best regards,
-grygorii


