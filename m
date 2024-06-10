Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D64901F77
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 12:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737146.1143309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGcLh-0002FZ-Jg; Mon, 10 Jun 2024 10:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737146.1143309; Mon, 10 Jun 2024 10:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGcLh-0002D9-GQ; Mon, 10 Jun 2024 10:34:01 +0000
Received: by outflank-mailman (input) for mailman id 737146;
 Mon, 10 Jun 2024 10:33:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GtSS=NM=epam.com=prvs=289119432d=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sGcLf-0002D1-R9
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 10:33:59 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0ffda67-2714-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 12:33:57 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AAL1hA015120;
 Mon, 10 Jun 2024 10:33:52 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ynynjg1t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 10:33:52 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AM9PR03MB7489.eurprd03.prod.outlook.com (2603:10a6:20b:272::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17; Mon, 10 Jun
 2024 10:33:49 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7656.012; Mon, 10 Jun 2024
 10:33:49 +0000
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
X-Inumbo-ID: f0ffda67-2714-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsFpwTm8cxnCnqtJNL0KbuAlWwAwdEw1uF9VgR3D1wmhzQat9EvGdt1zccDqLMr/HKsrBO2mD/g5YuyTPbCNZuFKUQgKfqxycTpzaWv7Vxo5MHejD0VdtNYmkSmMU6+i8HQ+1kCsT0mimTf0Gk0p+TTbQ0gwYNNOwQtRujn5rxpP0Voa+thepv72ni7t02jCJR08snZmfsDWarVpAa0Dak232J4wScwBY9hp8T/L29a+EU2DznAIxq6GBfBigq64KVTlWz6WNHuHiAHxPuiX1sxh6mDU1m1J8i7DTYHfmDr95CMtsOJflb4ZSwpI4pJTq3l1WR4GCCE9Xq/w05ng0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cd1moHxhc1xm770fqgTpoNlWwNdQuDUv7YAsKOXFusI=;
 b=G0Q4zyTM42oYWrw2l8Z6fsMpB8mGU6cw7A0Q3Fhc/YrNUmOq4D1ETpC868cC+2o7pt+DHcx+eQuub8vDJGS1P3MyyGBbCjJwFcQMQzbmCiFUsSz3VTD7iSwMt6GLm2TCyfKXjEdHZhGEwM7eHnMdDbp23l3OSPpCcD7arjgZM4aPoMJm5kdGUM7S6qywhq1Ks4KFYI7myHohXcp0D9MmRlkxZkATDtqf/z3koPJ5SWzHbuiOrxB/1p9nC/w3ZKOf6skeDqMH8pUE/rjmYkv39BQZmo5HWlCFKQ62pzRLc5AITLdkuTwC39B5+gztYiwCT4qFvA/Oif4ZPweeCt5L8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cd1moHxhc1xm770fqgTpoNlWwNdQuDUv7YAsKOXFusI=;
 b=oKi0f8sPNNJA4p+AB6jF5/JKo4sC0T91DB94f8T+mT60Fy6HVFpmgIlbQt9zA4o49OxZH/pJIsVEd4NLibMmx32+ENtbX/2TuTxO/EAfnOiR3tJWaEXopTFyqxIsii/NYN+xH/0QXZmiELpyjV6COGcAFUxQpYyG8+ns9SnAYF3aW93+ets9zETQzb4Pz90Ld4atP7q8TYcCDRm/SRJglpO344/xdtocmlPQN0p/5vgCfFelCcXS1t26cW9qTfq577wdQFM00KznMZhS9B3LLXYcAn6wLdjZvGauFGHb+AYywjZ3/8PLh6puoXFciw2ovcpjKDvm/nb002FWjtmBDg==
Message-ID: <cc33b870-4ada-43b3-aad5-d938a12a970b@epam.com>
Date: Mon, 10 Jun 2024 13:33:47 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 03/16] x86/p2m: guard altp2m routines
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
        Jan Beulich <jbeulich@suse.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <acb98c1c52613555a59cd27aad853a24caef0e19.1717410850.git.Sergiy_Kibrik@epam.com>
 <ade6ba3c-5a53-463c-97fd-34f6ec7dacaf@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <ade6ba3c-5a53-463c-97fd-34f6ec7dacaf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::21) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AM9PR03MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: e45265c4-9e7c-4e24-9ae1-08dc8938d0e9
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dG1SSFF2bTIzUDMrNVVVTHMrdHM4RmgzWlEvMFVYbTBBc0hLSUdmRTNTMzhV?=
 =?utf-8?B?dUVvUEZidFVjZnRuUndCUGk5d1pNRmVxUFV3LzlDbHROdHFKRkFBaURCRXdl?=
 =?utf-8?B?dW4xbVNuZzV0V1l6YXQ5b1MwNDVTbkJRc2VzbE9iNGRDRzhVcU5ZME9heGk3?=
 =?utf-8?B?dU16VXN1Mm9ycExZQnNkRmtWbGVDU0dnV1JRWm1FbUw1bXcrSWlQam4yRUpw?=
 =?utf-8?B?M2MvUGlUcGpnK3pOVVFsbm5LWjZoYzFabHN6aE1IVWFQQUxIK2VjSVF1eG51?=
 =?utf-8?B?US93OElENlVKM1ZxRjJ2YkRNZEdLUVEyekdLWERiTnMvMThCb2R4aGJvT1Ro?=
 =?utf-8?B?SnQxcFlYK0hUcTFoTzhSK01rQ2FKN1BldHNQQk5IWDhvOU5PVytEM1d0b1Vn?=
 =?utf-8?B?aFJEOXZheTFLZlJaN1R4ekVTVmhHTW90TFdCamd6akpPQll1Vm1ObFhNKzZI?=
 =?utf-8?B?TGM5QUpDL1dsZ3pJK2F5cHExNU1CbnZucTBsK2pxK0ZRUndibEtQVmpQTjJ2?=
 =?utf-8?B?QkkrWUsxN3F4QlMrOXBSc3JzVDkyMXg1dXdLaDdKbW55ZkVnRnNEdm1Md3Nh?=
 =?utf-8?B?WXJEVFEyR1hCWTNOSE55ZTNVOFBaRi9TTkxtNlllWGpYN1hhcVV3azY5TmNY?=
 =?utf-8?B?cHB2M3BELzlFWmpIUVpSdEwwTENuYmVkRGh0OWVETDU0S09meWpQdkFaRXBJ?=
 =?utf-8?B?TVZIWU04SVhzNENzeDhVaURoUVQxdTRQd25oMzBmeVRseTRpUW1VRzB1TzNR?=
 =?utf-8?B?TmxVc2habDI3a28yaVhLME53WkQrcEQvRVBoZGhHSDdBSlIrWWVTZlovTXJs?=
 =?utf-8?B?d2lkTHdMWWZwcStZZ3hlSGFFNWRlcVRKOE5nQUNPSDY0Q0Z6SmhiZU42M1E4?=
 =?utf-8?B?TjdpVDV0dlgvMmw2UzNSSzVkVkxycXZFNEpJNjNvT0tld3BTa0NLTzJXUGt5?=
 =?utf-8?B?UG9ybVdrdjRYTEwySWxNeTFoQXlpcjdOU3pZbllBV0RPSGkyU0NJa2dQUExi?=
 =?utf-8?B?QzRvdzJyZWJ2SG8wRzZNMmVGS0RzdWR5Y3ZIRE5nQkxyUXNNRHB0cTNBclBv?=
 =?utf-8?B?bHhQRlJEbHpiQUhTdUx6ejU3UDIxTjlNZkhmbWl0cjlQaWYrZm50T1gyZnds?=
 =?utf-8?B?Z2hnKzQ5ZzVTRjBmbDA2TlZ3UXF1QTNkOFkxdTM0Q0U0U0VjRW8weDIwN0VS?=
 =?utf-8?B?elhNTllFdFl2bEJJdFIrWnAxWTVyQzczWEhzWUpWY09YdjZwTjZyeEg4V0hh?=
 =?utf-8?B?OUtZMFZNYmhRYkJaUDRWbnM4RGI0eXVQLy8rOVlibkVaeXhlRE92ZTkvSmZl?=
 =?utf-8?B?WlBBVDJ6NE5PdFZUQ2pWUXJ3b05td0xkTDUzRnFDRkZXbWhoTHJPcHZSeDY0?=
 =?utf-8?B?ZVJPR0VjTU9qVk9oQ2xOeStOUGZEVk10eTVGZUFWWkpEYjR2Q0hZQTJuQThK?=
 =?utf-8?B?L0xUeDhuT05jZVFabi9aRzVGYkcxODI5MzZnV2hzRkZFZXVYbGY3VTZ5dnIw?=
 =?utf-8?B?M2FVTDZiWXFrVzhobzJNZWhrVURQaGR3MUo3U0hDcEp6ZzJVMVMzTnpQRDJ2?=
 =?utf-8?B?SVc2NHl6ZElHa2N1QlV0aWdyaXRzSjRKL2dKZ0J4L2pnaTJwNnB0dWNkWXFW?=
 =?utf-8?B?djlHMWVGMXg1SzV5L0Vta2RyL2w3VDFwbGFScWNNbkQ4b1hIRkRyMWdjVkkv?=
 =?utf-8?B?dkM0c3dOaXg4UUtCQ1RySmdiUFdaeXBOakF1RnZuRS9JRjVSdGV1TXJvU2xV?=
 =?utf-8?Q?fI9/ilahh37ANtxMoHALSgF6VtcYygTZ1DAQHXl?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cXQvdC9OY3pDb0V6M2s3OFZhclBHeDdob1dPL1llTElyRW9JNGFqWHFkZjMx?=
 =?utf-8?B?TFZwak9Xc0RxYlpzb3RVMHozb2lTcDhJTlV1b0NHdzBIMUI3QlpvZUNXQnFC?=
 =?utf-8?B?Y2Rrb01jeGJxM2V5ZGREOHlUNFNRd250SDJtc2JYZWRCTnJjTGhmQmtjS1FZ?=
 =?utf-8?B?d0xLZ0IxSWo1R1BKRzFxTWpaL2U2N0JDQU9IS2c3cHoyNCtreG9kS29ubERh?=
 =?utf-8?B?MkpkamJVa0IzVlNnVkE5MEI1NzBRV1dVVlNOcVBteExJbDBuZTkxTUhZdmQr?=
 =?utf-8?B?WmlqZjZuOExMZzBvanJDT0FUWlNMZzV1Rm5DcFJnTVJzTlRGZ1lDbFBESjRP?=
 =?utf-8?B?WVE4ZVdkbnZFVEV6MXprTk1qZHprMWhnc1dBeVoyV1NiaGZYcjJycW9aYy9Z?=
 =?utf-8?B?a2tNc2lRbzA2ZUw2UExVUk9IYmxKZGpoSDhEcVZNZHFlZ2o1bld4N0Z1TEpN?=
 =?utf-8?B?cmJDdXFzTGRyYnR6RkRFNG4wUnZzZEhJWURYSm1WbjRPUTFqY0E3SnNENnRi?=
 =?utf-8?B?bHF3dEpjMUMxVU1IR3UxcnM2UkFQcUtrK0tpZVFqWkhTRzRYaHFRQ1BraUpT?=
 =?utf-8?B?SndaQnk0YXRUbmlTeEthbkx5aG54NmdKTkdjL3dqdHpTNm5GMk1RMnRlN2pG?=
 =?utf-8?B?MzllUFhvbjhoQk0xUUIrdGFEZU5pbmtPK3VUZXBaQUNHeU1wdllnR3FjZ1NQ?=
 =?utf-8?B?bDNtQ2ZsT2o0RzBHVzdXSER1ZHhMY3lsdDJRdUZYVTU4T0QrSXJQWngvNUVi?=
 =?utf-8?B?OGJVMzNUY2c5TWtDczlPY2FvSTRET1B2dTlCejJmTitmejlIMVRSVVlFcEtl?=
 =?utf-8?B?T3FyUlNQSUVHMEpFS2Q1WmhwanY5VG5YT3dlSGdiWU9UY09XZWFMbitQNWF4?=
 =?utf-8?B?TXdjQU1oOFYrUG9EY2JjYTMxNnlGeGZ2SUthY2ozNE5GOWdnNkJGTnRIWm94?=
 =?utf-8?B?SGR4SDdrRjVNeWExanVXeWU3NTlZUTVpY2I2cy9yNzQzNkxrWTlnbU9ySitn?=
 =?utf-8?B?RnVrb3UvMXM2TVBXN2VSLzY1Vmg0RlZUNHExdTJPUUsxemFwYTFEQld6UDlH?=
 =?utf-8?B?NzJKRXBDUUNtRXorTGljS0lPSng2SytVSjJrRXZlemNYaE9XdlZSbjA0ajZo?=
 =?utf-8?B?bjlMU04wNEhvWHBYNElpdDlncjBYb1hqc3MzNW1kWStJQkJ2NmNJdEdrSjh5?=
 =?utf-8?B?VUp4RWxtak43aEgrVWpJblR0TGRRZDNmRlVtUkNrbldnN3FMY3FXaUNzeXpp?=
 =?utf-8?B?cjBNMWxXQWlpNTcxZGZTNlRyQU0xZCtaanNpMFo3OXBSd2l5SlhZaFVwNlB1?=
 =?utf-8?B?dmNuOEV4OVJxZUlVaEg1ZGpJbDNYcC9GL1cwM29JbGdiRHZqdGs4UndSeTdV?=
 =?utf-8?B?RkNBaWxvTWE2a2hGUUtEMU00bDNzdE5QVEwrUU5VU3g5YnExd0p4aEl3a1Iz?=
 =?utf-8?B?Z2k3NjBobzZXZHZhNldqbWdWVUVlSzRuNFo3T1RvS1hUbHF0WENxNWVxMmdX?=
 =?utf-8?B?UXpyRnhIdUQ5QWIvMmdiTW03RWRYaGRQUTJteFgvMXg5cTdkUmJhamxoRHgv?=
 =?utf-8?B?aWZVSnZxZnRRbnBrb2pScGtjaGVjSFZZek9SV3kvajJBTWlnS015ZDN2djNh?=
 =?utf-8?B?cjJTb2RKSS9uUjNmazhSSUZpeHhhOFpBZ24yZVJxTHE4Wlo4cnpINU5OT01u?=
 =?utf-8?B?MFhzVm1FRTduOU9ibzFTWjZDTFNZKzMrblp3YzlZL1V1ZXQ5VDdOU21jU1Bv?=
 =?utf-8?B?NmkvOUtQS2g0OVhoSkVsVGpEekgxaytSaTdBdThRZFZaenBlRVdIdVpxYkRq?=
 =?utf-8?B?a1lPUE41eHVEQ2FSTWdCM2tJRHZIa2pGRnIvdThjL3IyYmdmalB0YWRxajlt?=
 =?utf-8?B?ZjdPNXFTSkxhSEdUeUxvTi85UlBTeE84WXIvTXRoT0crR1NoWGZaZWxvS3I3?=
 =?utf-8?B?ck1ZWlZqcFZhNW9DR2EyVGUwa241bVpyd3NIa1J4ZzB0M2txT1cxU3NpZWhj?=
 =?utf-8?B?UmpxYlVHZTFvRW1nOG9Fd0s1Y0t5eUlFRlk1UWNtYmdzeFQyeXVZNkhkU0NS?=
 =?utf-8?B?NCttWTlVdFZTZFdlQ0hlb1gxWjA4UnEycVZ3ODAwMVlFUDAvL09sT2M4NTFW?=
 =?utf-8?Q?pS4L7APfWVGMMfcnOPA331nCh?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45265c4-9e7c-4e24-9ae1-08dc8938d0e9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 10:33:49.7165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFu8ohnSSI2Tt+3bk7MXP6isqv3P1IT3n6/WsCnHhgmNFVK4jcFBsDUPyYyTnX8lBdgsaz7BgIEntrnaRk9yxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7489
X-Proofpoint-ORIG-GUID: BRopdfu_bHSNrzpGm3nvHzt7pjvt0zn0
X-Proofpoint-GUID: BRopdfu_bHSNrzpGm3nvHzt7pjvt0zn0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100080

hi Stefano,

07.06.24 10:32, Jan Beulich:
> On 03.06.2024 13:11, Sergiy Kibrik wrote:
>> Initialize and bring down altp2m only when it is supported by the platform,
>> e.g. VMX. Also guard p2m_altp2m_propagate_change().
>> The puspose of that is the possiblity to disable altp2m support and exclude its
>> code from the build completely, when it's not supported by the target platform.
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> I question though whether Stefano's R-b was valid to retain with ...
> 
>> ---
>> changes in v3:
>>   - put hvm_altp2m_supported() first
>>   - rewrite changes to p2m_init() with less code
> 
> ... this.

could you please take a look at this patch once more, after it's been 
through these modifications? Thank you!

    -Sergiy

