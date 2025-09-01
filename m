Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74A9B3E0F6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 13:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104453.1455513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2Mu-0003QK-NL; Mon, 01 Sep 2025 11:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104453.1455513; Mon, 01 Sep 2025 11:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2Mu-0003NC-JY; Mon, 01 Sep 2025 11:06:36 +0000
Received: by outflank-mailman (input) for mailman id 1104453;
 Mon, 01 Sep 2025 11:06:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOc2=3M=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1ut2Ms-0003JX-K3
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 11:06:34 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8052a6a-8723-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 13:06:33 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB8104.eurprd03.prod.outlook.com (2603:10a6:20b:447::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 11:06:30 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 11:06:29 +0000
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
X-Inumbo-ID: b8052a6a-8723-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMasfdw8axzPYbBUTuO09ZMw+yTyXsuihNW5hXlInwW3CKZeDwYORoOnte6+V1fqRaojcRV7isCtzIg3cnZN8UdwU5icGILaAHd+J8aM6+gZeL9eghHhy7qkRwBNhHfFT79bEQdfv+Lo3QZxhdwTOc96m0xXo3fAhM/Nzdrc26J41uTe/o8k94Adliaho66MULs5MSg4FpAPP5hgk71rHrfsmQ4l5JIlLB/VnHNo1swV21miBsLqL52vQbtmL4ly9IojV8sY8BnbVUT6oPtYlAMSpmvtTPxVK7IbW/7nNH2JoybFD8i8TSTwSh0onXISzx6+96Jrr+mkFP/AHoPzwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPmehvgRoVJseIJoPkT6z5iM1lJIxRKBTRbybEsV81I=;
 b=SqJcWH88ySZPw1mzEoVGxd3UN2d1cd01dlmKa0nMyJAWCtGJSNbzayVvrNdKQ+lr3gCtbERe6M4y79Ri8w+1fUl9gEePK/SO6hjr0ZsuvlnLGeXjwPbi+I2QmMH72iPRqKlJuuPBCZm+PkMA6ez8q4745VBgLwr4kDG11DAeMo/KfzhBxjXk+kasYbnQV+vMupa5iPg0MVF4oLhmxTJRkJ+m1M9oezmZ/rUpzExH2d/ZHbKNLQXqrME6nklDSPNYzfzX/SjiiKO43yi4Hg2Mn2VxD2GTSFry8qHRgfwdOu2v1vYhrnMMCeSlw5XOVI8XqJPwSznljOK/vpb//d5DDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPmehvgRoVJseIJoPkT6z5iM1lJIxRKBTRbybEsV81I=;
 b=X2J/FtqERS+Hi+SX6hrm/f1vmmSAwsiSMe0Sa5pTq51PJWy9G9z27b+nY4MGj1Oijy55ITKveMDaD0fh7W6kudYaoNz/Jc+E5lZv35N156/d5ZYNYLM06a++hxzlmOukAs3+AfWFg3KXr9kdx6t1ySfpLIK2YHxnGDZvIJzOxWI39KFRK7Rbms2oaf28rOTxtnqUaNqUPaoxFsnVrxz91aiDKvaBBnGcPFcMZuSVhLAWdzEeOe+8Rip1vKNo8LLhN8mtWtnEMQEFnU6mAulGpH8C7kxIDh0+wbq9DjLVQSL54+p0U4J7og9H69Xob38FLOuyMzWUUYpmWzf94x6pnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <65727710-0a88-4fff-bb5b-9cf34106833c@epam.com>
Date: Mon, 1 Sep 2025 13:06:26 +0200
User-Agent: Mozilla Thunderbird
From: Milan Djokic <milan_djokic@epam.com>
Subject: Re: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Nick Rosbrook
 <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
 <CAJ=z9a1eM6M+Gagond9TiFtF7c7EEQKOKHANcvDWDhW_3JzqOA@mail.gmail.com>
 <12ba4388-ee23-4e17-910f-9702271865ad@epam.com>
 <b1f79b84-d0c4-4807-87a7-1cf94e58ecee@xen.org>
 <a5943713-85fa-48ad-86fe-5698604ed8c9@epam.com> <87v7m93bo0.fsf@epam.com>
 <6c80a929-8139-4461-b11c-e6ac67c3d2e4@epam.com> <875xe6ytyk.fsf@epam.com>
Content-Language: en-US
In-Reply-To: <875xe6ytyk.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::43) To PA4PR03MB7136.eurprd03.prod.outlook.com
 (2603:10a6:102:ea::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR03MB7136:EE_|AS8PR03MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c41796-1ce4-472d-5927-08dde94799b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzgzNTBySGJ4NTBFakwwMVFkYUxUYkRkWExKTitzZW5FRXVXMjlPRGUxYXAz?=
 =?utf-8?B?QnZGY0JoOGFsOTgwU0lLbm4vYWhPaUhEZmdJdldMbGxqS1Zqd3cxL0l4enNa?=
 =?utf-8?B?UDErTlJMU1FqWEU2OGlMcUtOemRKVUhKQXR5RHcvOGc3b2JFTENpN1lFcWdQ?=
 =?utf-8?B?YTYrOWJlQkpUOHNRYnJyQnlJdmpIcDNXai9UeVZjbVhHdS95cmlzNzVSZmpr?=
 =?utf-8?B?RllCT2grT0FlS1lCN1hRY2wrdHJ0QW1oQzEzTm5HMld4OHB2Q2FJN3hGcFF0?=
 =?utf-8?B?NnJWd3djRVRwVjJ6cGREV1U1VXlpMHVOTm45N2dMaTFFUEg4RGxjcnlPbDBx?=
 =?utf-8?B?bWo3bkljQ1ZpU285d2F2Qm9UdXhRZmZUeTJqRGdwTFNBSHJyOGpBL2g3WC9P?=
 =?utf-8?B?OW1GMnhGMkNHaVhjN09MVUtvbnNmN01KTmN5ZlpuZ2lrbytUZFkxQ2VsR3U5?=
 =?utf-8?B?UklCSURJMHBHNkprZ0pGbnllbjZ1VFd0SVRDMndVenlsVG96UWxZS1Jheld2?=
 =?utf-8?B?ZlFjUVpxYjNMdlY4cmtBUU9nT1J2Wjd5WHpka29teFgyS0hJRVdpWC9Pb0RJ?=
 =?utf-8?B?UEkrL28rZVNrK1NlaFh6dlA5ZjVzUnEyOWFxanpWZ1JBZzFwRzNpVzl5N1FE?=
 =?utf-8?B?QmM2Y0Z6dGVrWS94QkhjYzVkcGdkSUNma2t6R3MxY0RYVjRxSjk1Yis0dTU1?=
 =?utf-8?B?SGdXSisyOEVkU2RBZ0FlM01wNFBZTzh1dmZXVFdFeWFpeGtKeEZIMzF6M01H?=
 =?utf-8?B?SHY4YkhEVkl6Vk5pdWQvMEtDRzdMUzU3Zmg0c3RYb1pEbXRQM1RrRXYzdlBY?=
 =?utf-8?B?TTl4MDV1NlA0ekE0K0I2dFR2eGpIam9DVXBKRXdpM0YyOWdLQ2IzTDVsYmNs?=
 =?utf-8?B?NEN2YXJBZjNBR1Z0TGtuTU9kL3NTcWVyTXpqZHBoak80WjZJSGJwNEYxZnYy?=
 =?utf-8?B?UGRna2NXU2J6ZTB4Nm85eFRUa2VHVUpuQ05sMEZ4UWI3a1hHMEpwWHZ0YTE2?=
 =?utf-8?B?b2t1U1dtVDNzWnpHN0hveHZZQWZscjJSb05VcVNmREkzaC9UeTdUTkdzR1pk?=
 =?utf-8?B?ZUw0c2FzYlNEUnJmcFgwaGRNVWdOUnRxbHI0QzU2VWRYb0Uwam8veDZvRW54?=
 =?utf-8?B?U3ZxTzg3Z0ZFWFZBQ1BEWjI5OGY5aGQyNlZ0dW5KaS90ZllvRG8yL3EvcUls?=
 =?utf-8?B?cFhYSTFYNnp6QnFGb09ONzUvcndnRkZsbXdkLytyZDZySVVWM1IvQ2Y3Yjdn?=
 =?utf-8?B?ZmR2ZUxYMktyYk0xQ1BuMTQ2SVdLK1Z4M2ZmTTQ4T1dNem0xSlNWTExlUEU0?=
 =?utf-8?B?ODMxNDUrTUM2NFg0NllCWWF4QzJ2TW1hTmhaUnRJSGFXaEtkQ3g5VjdOSDZi?=
 =?utf-8?B?OTRBUzk0dXFXdkdnaUtwOWllVWdtcFZ1WEh3ZkRRTHBhTWhFWERJSGVjMFRm?=
 =?utf-8?B?dk1oWmRJclZZZWpQVFNPUkZleThqUmJCdkdkZ2d5dnlXb3Q0M0RLbDlNeml1?=
 =?utf-8?B?WTMrTXJYWldkK2wrVDVKNnI5bHBJSkpqbVU0S2pXaHVSR1IvdHkwRDVERmtQ?=
 =?utf-8?B?UlJ2L2lJMjNuMTVQWVlXMDZXZk8xN2ZwdkRwL2JqVDd3ZXJWcnRaU3g1Z2NW?=
 =?utf-8?B?MlBaR1QrTU40UUJLaXd1ODRoTGRIeU1rbmlhUi9jTjVFSmdzUWkwQUgzbjQ4?=
 =?utf-8?B?Um5JalR0cFMyWjdKekVYOFNXcXZFSmJhK3JCbmQyRWpHRFcwcG15WlBwTkJX?=
 =?utf-8?B?Q244V1h1bDdsR3h4TXlFVzAvVk1pSnA4T1hocWlhaVV2OThlbC9VQ2l2RHU2?=
 =?utf-8?B?ME9KaUJPaCtYS0RuWkhaUmt6aW91NXdGVkd1WFRNTk5ybWx2ejhJMHM2WUMw?=
 =?utf-8?B?NHBCMHZKZTl2Snd5cis0Z2ZNeGFVZVJpeldUZU0rWElXTzdDTGd6d3JybG45?=
 =?utf-8?Q?SpCHrYe4XcQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW9oNU02aE9BK2MveWtST2Y2S3J4aTdWV3FSSEwySkVDZmdYZGlhYXhhY01Y?=
 =?utf-8?B?NzM4NEFBWU5QMmtvWlNNWExuR29rbXJaS3NSeURNbFB1VnlqWlk0cWVPSzYr?=
 =?utf-8?B?Kzl5andFcE4wN2RwRzF1STZUdEJ4OUFOQUsxbkh1V0lpYklvY1RiemhuemF1?=
 =?utf-8?B?bEx2UFBsZEo4akdsZU5UcW5xSlJiWkdFUjd5WDdreW9TVkJXWlR2dSsxMzAy?=
 =?utf-8?B?Rm5KSE1LbkZwcjl6cThFWjlUemZvZTB6SmhOY3phSGMySFloU0R3Q3IvZitX?=
 =?utf-8?B?djMweVFpQkdRU2hVY1VQTElQS1JqOE1DWGEwZ1JBdTlZQnBidU51ejZxU2Ur?=
 =?utf-8?B?Z01LdnRhYm41a0lNU05rcEd5VnRMbUtDN3dSTU9oSy9IbFpYMFlpOGhHWWRX?=
 =?utf-8?B?OXFGcFM5ZW9IQy9HeTBQTWt3Q044KzlqNlBQL2NzV1ZXWmpIakQ3NFZieUNC?=
 =?utf-8?B?a1cxbmdNUjZHZVE1WG5rRGhJdmdNdm03VW9VWkZlOHZXMzdLMUFRcmNhazV4?=
 =?utf-8?B?OFJOSDQ0eUVoUXlDNXJabXRuYkpheFBJVkJJaFZ3QjJEb3oyRitkd3NTVlNv?=
 =?utf-8?B?SzdyOVN1YkNSbHlZOXJRcjJxUlBuR1ZJcTRVUHlxZmNDMVp5UTl1RGNBMGRI?=
 =?utf-8?B?VGw5ZzRRalp4V3czWnVieExpS3lUbEkreWViZjJlQWd3cE9GZXE5WWM5eE9k?=
 =?utf-8?B?VWVXWFY4ZE0zdUNlamxXM2FSL212NFMyTGp3NWp1d0FMREJDS3lDbFNGS0Q1?=
 =?utf-8?B?TzhBVE9GMW9YaUVKeC9sOGxMeWRpK2IzQ25ZQkU2YXRmUEErazZJNUROajFZ?=
 =?utf-8?B?MDZyVmVTSjF1VXJwc2Uxc3FFa3dGUXdtc3dJOFNNeFlubndid2RIcjZmTDBO?=
 =?utf-8?B?T2NWMi9tRDBFSGIvZ1J0VlpvSmN5VXFWUktDS2FFbTd5eWFia25jTS9VeVo0?=
 =?utf-8?B?TTJzMkI1RlhaUDFldEtscUQwdURyMTY3Yzgwa1hnYXZLYkg4Mlh1ZC9iWDlQ?=
 =?utf-8?B?dFIralZ6OGlqQmhMekpXek5acGhBbm9Lb09pU01NeXRVNmM5U2JNZUlKZmc4?=
 =?utf-8?B?MzRhL0laS3BOaW9ST211T2xhZ2FNQ1QxaE9qdFVpVXlydVBBVEU3YnJYMEp2?=
 =?utf-8?B?NEhNTHBUS01yMU90U3gxSEovR1pkZy8rbWRDUEYyV2NhT0NDZW1vaFprQWtn?=
 =?utf-8?B?SDhBRkZSZU9GeEVmdk5LTm1IT0t5Uy95eDl0dUZ6c3pkOE5OeDhwbDBFdkFI?=
 =?utf-8?B?MFRDVnVtV0E0RnVXZTFiQTg5eHVIcGgvL0lhQ1E5c05FZmFUNzAzZ0hhMnJj?=
 =?utf-8?B?c2xQQVR3V2xWdFBxRWcvUy9MOEcxall3TStIZVZ6TWFZRVlMZjBWMHlHRXNZ?=
 =?utf-8?B?UFRyVzErQ1hTbWcwamppdUJlK1Y2ajNxRTNINjlCcldCdWR3VkZyd25OVGRn?=
 =?utf-8?B?NGdUV1dEOXBjV1ovNnJIK1VuRmtxbDYyb05zN082eGNWNEFobXkzbE9sdGlC?=
 =?utf-8?B?NTI0UzFLaG5ucXEvQlJyRVFoRXhyT0tETlJvbktDK2FQVUdRclZ4Wk9FSUZ6?=
 =?utf-8?B?b2hwQTNBUjFXaW55aVhyY3FGY3lhRnBxbVg3bWFvZUw0Y0JiaEFRYm9CUTdi?=
 =?utf-8?B?dFhoN2JTVXJBdW9IVkxBQXZLZHg5SVlNM3ZOKzNFRUErU2pEMzFCRkpBb2xG?=
 =?utf-8?B?UWtNRmJ1SFpxRzdYRmxrajNEcGNkbE1vNEdCWXVKZlQveVB5VElYWVJWYkdG?=
 =?utf-8?B?QUxodTB2SXNmZHhuUFNIU2w5K0tjUHo4NTlTbi9lMThnbVpQdFRVL0lNM1Fs?=
 =?utf-8?B?RDlKMVJtaUlvdFU0REhROXRBWFVva25ubWFKWTAvTTVtcnMycG5ZQTI1OW1D?=
 =?utf-8?B?MzdpcDR0RTMxVC83VlhXaHRlOGIyRG1zRUpMNmhXYldMTVRwaHlFSVBXZ3hu?=
 =?utf-8?B?VmR6bmtncENKYTJRM21JOHprSGRTT2xydCt3bUhxc0t3WkxlUHZyWHFIZVJr?=
 =?utf-8?B?WVBoekkxMjY5aS95TXBzSTgwQmFTY0hpSGQ2VStNSUZDcnliYU81ZzBIck5N?=
 =?utf-8?B?VmJaaTZESDVHaHNGQitYa1JrQldMVzUwMi80ZXFVU3IvbXZTdGNUb2R5Um9j?=
 =?utf-8?Q?baizcSSVGgdy/Ih1IDJ8W2xjA?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c41796-1ce4-472d-5927-08dde94799b2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:06:29.4470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCnsOFBJi3RaaumqQfCS1+VYsq2a4EItog7V369Jy8Eq79VQxAEzY2Lb8ImVtgmYwMFqr4Z+q2dMzHHeSkZkvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8104

Hi Volodymyr,

On 8/29/25 18:27, Volodymyr Babchuk wrote:
> Hi Milan,
> 
> Thanks, "Security Considerations" sections looks really good. But I have
> more questions.
> 
> Milan Djokic <milan_djokic@epam.com> writes:
> 
>> Hello Julien, Volodymyr
>>
>> On 8/27/25 01:28, Volodymyr Babchuk wrote:
>>> Hi Milan,
>>> Milan Djokic <milan_djokic@epam.com> writes:
>>>
>>>> Hello Julien,
>>>>
>>>> On 8/13/25 14:11, Julien Grall wrote:
>>>>> On 13/08/2025 11:04, Milan Djokic wrote:
>>>>>> Hello Julien,
>>>>> Hi Milan,
>>>>>
>>>>>>
>>>>>> We have prepared a design document and it will be part of the updated
>>>>>> patch series (added in docs/design). I'll also extend cover letter with
>>>>>> details on implementation structure to make review easier.
>>>>> I would suggest to just iterate on the design document for now.
>>>>>
>>>>>> Following is the design document content which will be provided in
>>>>>> updated patch series:
>>>>>>
>>>>>> Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
>>>>>> ==========================================================
>>>>>>
>>>>>> Author: Milan Djokic <milan_djokic@epam.com>
>>>>>> Date:   2025-08-07
>>>>>> Status: Draft
>>>>>>
>>>>>> Introduction
>>>>>> ------------
>>>>>>
>>>>>> The SMMUv3 supports two stages of translation. Each stage of translation
>>>>>> can be independently enabled. An incoming address is logically
>>>>>> translated from VA to IPA in stage 1, then the IPA is input to stage 2
>>>>>> which translates the IPA to the output PA. Stage 1 translation support
>>>>>> is required to provide isolation between different devices within the OS.
>>>>>>
>>>>>> Xen already supports Stage 2 translation but there is no support for
>>>>>> Stage 1 translation. This design proposal outlines the introduction of
>>>>>> Stage-1 SMMUv3 support in Xen for ARM guests.
>>>>>>
>>>>>> Motivation
>>>>>> ----------
>>>>>>
>>>>>> ARM systems utilizing SMMUv3 require Stage-1 address translation to
>>>>>> ensure correct and secure DMA behavior inside guests.
>>>>> Can you clarify what you mean by "correct"? DMA would still work
>>>>> without
>>>>> stage-1.
>>>>
>>>> Correct in terms of working with guest managed I/O space. I'll
>>>> rephrase this statement, it seems ambiguous.
>>>>
>>>>>>
>>>>>> This feature enables:
>>>>>> - Stage-1 translation in guest domain
>>>>>> - Safe device passthrough under secure memory translation
>>>>>>
>>>>>> Design Overview
>>>>>> ---------------
>>>>>>
>>>>>> These changes provide emulated SMMUv3 support:
>>>>>>
>>>>>> - SMMUv3 Stage-1 Translation: stage-1 and nested translation support in
>>>>>>       SMMUv3 driver
>>>>>> - vIOMMU Abstraction: virtual IOMMU framework for guest Stage-1 handling
>>>>> So what are you planning to expose to a guest? Is it one vIOMMU per
>>>>> pIOMMU? Or a single one?
>>>>
>>>> Single vIOMMU model is used in this design.
>>>>
>>>>> Have you considered the pros/cons for both?
>>>>>> - Register/Command Emulation: SMMUv3 register emulation and command
>>>>>>       queue handling
>>>>>
>>>>
>>>> That's a point for consideration.
>>>> single vIOMMU prevails in terms of less complex implementation and a
>>>> simple guest iommmu model - single vIOMMU node, one interrupt path,
>>>> event queue, single set of trap handlers for emulation, etc.
>>>> Cons for a single vIOMMU model could be less accurate hw
>>>> representation and a potential bottleneck with one emulated queue and
>>>> interrupt path.
>>>> On the other hand, vIOMMU per pIOMMU provides more accurate hw
>>>> modeling and offers better scalability in case of many IOMMUs in the
>>>> system, but this comes with more complex emulation logic and device
>>>> tree, also handling multiple vIOMMUs on guest side.
>>>> IMO, single vIOMMU model seems like a better option mostly because
>>>> it's less complex, easier to maintain and debug. Of course, this
>>>> decision can and should be discussed.
>>>>
>>> Well, I am not sure that this is possible, because of StreamID
>>> allocation. The biggest offender is of course PCI, as each Root PCI
>>> bridge will require own SMMU instance with own StreamID space. But even
>>> without PCI you'll need some mechanism to map vStremID to
>>> <pSMMU, pStreamID>, because there will be overlaps in SID space.
>>> Actually, PCI/vPCI with vSMMU is its own can of worms...
>>>
>>>>> For each pSMMU, we have a single command queue that will receive command
>>>>> from all the guests. How do you plan to prevent a guest hogging the
>>>>> command queue?
>>>>> In addition to that, AFAIU, the size of the virtual command queue is
>>>>> fixed by the guest rather than Xen. If a guest is filling up the queue
>>>>> with commands before notifying Xen, how do you plan to ensure we don't
>>>>> spend too much time in Xen (which is not preemptible)?
>>>>>
>>>>
>>>> We'll have to do a detailed analysis on these scenarios, they are not
>>>> covered by the design (as well as some others which is clear after
>>>> your comments). I'll come back with an updated design.
>>> I think that can be handled akin to hypercall continuation, which is
>>> used in similar places, like P2M code
>>> [...]
>>>
>>
>> I have updated vIOMMU design document with additional security topics
>> covered and performance impact results. Also added some additional
>> explanations for vIOMMU components following your comments.
>> Updated document content:
>>
>> ===============================================
>> Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
>> ===============================================
>>
>> :Author:     Milan Djokic <milan_djokic@epam.com>
>> :Date:       2025-08-07
>> :Status:     Draft
>>
>> Introduction
>> ========
>>
>> The SMMUv3 supports two stages of translation. Each stage of
>> translation can be
>> independently enabled. An incoming address is logically translated
>> from VA to
>> IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to
>> the output PA. Stage 1 translation support is required to provide
>> isolation between different
>> devices within OS. XEN already supports Stage 2 translation but there is no
>> support for Stage 1 translation.
>> This design proposal outlines the introduction of Stage-1 SMMUv3
>> support in Xen for ARM guests.
>>
>> Motivation
>> ==========
>>
>> ARM systems utilizing SMMUv3 require stage-1 address translation to
>> ensure secure DMA and guest managed I/O memory mappings.
> 
> It is unclear for my what you mean by "guest manged IO memory mappings",
> could you please provide an example?
> 

Basically enabling stage-1 translation means that the guest is 
responsible for managing IOVA to IPA mappings through its own IOMMU 
driver. Guest manages its own stage-1 page tables and TLB.
For example, when a guest driver wants to perform DMA mapping (e.g. with 
dma_map_single()), it will request mapping of its buffer physical 
address to IOVA through guest IOMMU driver. Guest IOMMU driver will 
further issue mapping commands emulated by Xen which translate it into 
stage-2 mappings.

>> This feature enables:
>>
>> - Stage-1 translation in guest domain
>> - Safe device passthrough under secure memory translation
>>
> 
> As I see it, ARM specs use "secure" mostly when referring to Secure mode
> (S-EL1, S-EL2, EL3) and associated secure counterparts of architectural
> devices, like secure GIC, secure Timer, etc. So I'd probably don't use
> this word here to reduce confusion
> 

Sure, secure in terms of isolation is the topic here. I'll rephrase this

>> Design Overview
>> ===============
>>
>> These changes provide emulated SMMUv3 support:
>>
>> - **SMMUv3 Stage-1 Translation**: stage-1 and nested translation
>>      support in SMMUv3 driver.
> 
> "Nested translation" as in "nested virtualization"? Or is this something else?
> 

No, this refers to 2-stage translation IOVA->IPA->PA as a nested 
translation. Although with this feature, nested virtualization is also 
enabled since guest can emulate its own IOMMU e.g. when kvm is run in guest.


>> - **vIOMMU Abstraction**: Virtual IOMMU framework for guest stage-1
>>      handling.
> 
> I think, this is the big topic. You see, apart from SMMU, there is
> at least Renesas IP-MMU, which uses completely different API. And
> probably there are other IO-MMU implementations possible. Right now
> vIOMMU framework handles only SMMU, which is okay, but probably we
> should design it in a such way, that other IO-MMUs will be supported as
> well. Maybe even IO-MMUs for other architectures (RISC V maybe?).
> 

I think that it is already designed in such manner. We have a generic 
vIOMMU framework and a backend implementation for target IOMMU as 
separate components. And the backend implements supported 
commands/mechanisms which are specific for target IOMMU type. At this 
point, only SMMUv3 is supported, but it is possible to implement other 
IOMMU types support under the same generic framework. AFAIK, RISC-V 
IOMMU stage-2 is still in early development stage, but I do believe that 
it will be also compatible with vIOMMU framework.

>> - **Register/Command Emulation**: SMMUv3 register emulation and
>>      command queue handling.
> 
> Continuing previous paragraph: what about other IO-MMUs? For example, if
> platform provides only Renesas IO-MMU, will vIOMMU framework still
> emulate SMMUv3 registers and queue handling?
> 

Yes, this is not supported in current implementation. To support other 
IOMMU than SMMUv3, stage-1 emulation backend needs to be implemented for
target IOMMU and probably Xen driver for target IOMMU has to be updated 
to handle stage-1 configuration. I will elaborate this part in the 
design, to make clear that we have a generic vIOMMU framework, but only 
SMMUv3 backend exists atm.

>> - **Device Tree Extensions**: Adds `iommus` and virtual SMMUv3 nodes
>>      to device trees for dom0 and dom0less scenarios.
>> - **Runtime Configuration**: Introduces a `viommu` boot parameter for
>>      dynamic enablement.
>>
>> vIOMMU is exposed to guest as a single device with predefined
>> capabilities and commands supported. Single vIOMMU model abstracts the
>> details of an actual IOMMU hardware, simplifying usage from the guest
>> point of view. Guest OS handles only a single IOMMU, even if multiple
>> IOMMU units are available on the host system.
> 
> In the previous email I asked how are you planning to handle potential
> SID overlaps, especially in PCI use case. I want to return to this
> topic. I am not saying that this is impossible, but I'd like to see this
> covered in the design document.
> 

Sorry, I've missed this part in the previous mail. This is a valid point,
SID overlapping would be an issue for a single vIOMMU model. To prevent 
it, design will have to be extended with SID namespace virtualization, 
introducing a remapping layer which will make sure that guest virtual 
SIDs are unique and maintain proper mappings of vSIDs to pSIDs.
For PCI case, we need to have an extended remapping logic where 
iommu-map property will be also patched in the guest device tree since 
we need a range of unique vSIDs for every RC assigned to guest.
Alternative approach would be to switch to vIOMMU per pIOMMU model. 
Since both approaches require major updates, I'll have to do a detailed 
analysis and come back with an updated design which would address this 
issue.


>>
>> Security Considerations
>> =======================
>>
>> **viommu security benefits:**
>>
>> - Stage-1 translation ensures guest devices cannot perform unauthorized DMA.
>> - Emulated IOMMU removes guest dependency on IOMMU hardware while
>>    maintaining domains isolation.
> 
> I am not sure that I got this paragraph.
> 

First one refers to guest controlled DMA access. Only IOVA->IPA mappings 
created by guest are usable by the device when stage-1 is enabled. On 
the other hand, with stage-2 only enabled, device could access to 
complete IOVA->PA mapping created by Xen for guest. Since the guest has 
no control over device IOVA accesses, a malicious guest kernel could 
potentially access memory regions it shouldn't be allowed to, e.g. if 
stage-2 mappings are stale. With stage-1 enabled, guest device driver 
has to explicitly map IOVAs and this request is propagated through 
emulated IOMMU, making sure that IOVA mappings are valid all the time.

Second claim means that with emulated IOMMU, guests don’t need direct 
access to physical IOMMU hardware. The hypervisor emulates IOMMU 
behavior for the guest, while still ensuring that memory access by 
devices remains properly isolated between guests, just like it would 
with real IOMMU hardware.

>>
>>
>> 1. Observation:
>> ---------------
>> Support for Stage-1 translation in SMMUv3 introduces new data
>> structures (`s1_cfg` alongside `s2_cfg`) and logic to write both
>> Stage-1 and Stage-2 entries in the Stream Table Entry (STE), including
>> an `abort` field to handle partial configuration states.
>>
>> **Risk:**
>> Without proper handling, a partially applied Stage-1 configuration
>> might leave guest DMA mappings in an inconsistent state, potentially
>> enabling unauthorized access or causing cross-domain interference.
>>
>> **Mitigation:** *(Handled by design)*
>> This feature introduces logic that writes both `s1_cfg` and `s2_cfg`
>> to STE and manages the `abort` field-only considering Stage-1
>> configuration if fully attached. This ensures incomplete or invalid
>> guest configurations are safely ignored by the hypervisor.
>>
>> 2. Observation:
>> ---------------
>> Guests can now invalidate Stage-1 caches; invalidation needs
>> forwarding to SMMUv3 hardware to maintain coherence.
>>
>> **Risk:**
>> Failing to propagate cache invalidation could allow stale mappings,
>> enabling access to old mappings and possibly data leakage or
>> misrouting.
>>
>> **Mitigation:** *(Handled by design)*
>> This feature ensures that guest-initiated invalidations are correctly
>> forwarded to the hardware, preserving IOMMU coherency.
>>
>> 3. Observation:
>> ---------------
>> This design introduces substantial new functionality, including the
>> `vIOMMU` framework, virtual SMMUv3 devices (`vsmmuv3`), command
>> queues, event queues, domain management, and Device Tree modifications
>> (e.g., `iommus` nodes and `libxl` integration).
>>
>> **Risk:**
>> Large feature expansions increase the attack surface—potential for
>> race conditions, unchecked command inputs, or Device Tree-based
>> misconfigurations.
>>
>> **Mitigation:**
>>
>> - Sanity checks and error-handling improvements have been introduced
>>    in this feature.
>> - Further audits have to be performed for this feature and its
>>    dependencies in this area. Currently, feature is marked as *Tech
>>    Preview* and is self-contained, reducing the risk to unrelated
>>   components.
>>
>> 4. Observation:
>> ---------------
>> The code includes transformations to handle nested translation versus
>> standard modes and uses guest-configured command queues (e.g.,
>> `CMD_CFGI_STE`) and event notifications.
>>
>> **Risk:**
>> Malicious or malformed queue commands from guests could bypass
>> validation, manipulate SMMUv3 state, or cause Dom0 instability.
> 
> Only Dom0?
> 

This is a mistake, the whole system could be affected. I'll fix this.

>>
>> **Mitigation:** *(Handled by design)*
>> Built-in validation of command queue entries and sanitization
>> mechanisms ensure only permitted configurations are applied. This is
>> supported via additions in `vsmmuv3` and `cmdqueue` handling code.
>>
>> 5. Observation:
>> ---------------
>> Device Tree modifications enable device assignment and
>> configuration—guest DT fragments (e.g., `iommus`) are added via
>> `libxl`.
>>
>> **Risk:**
>> Erroneous or malicious Device Tree injection could result in device
>> misbinding or guest access to unauthorized hardware.
>>
>> **Mitigation:**
>>
>> - `libxl` perform checks of guest configuration and parse only
>>    predefined dt fragments and nodes, reducing risc.
>> - The system integrator must ensure correct resource mapping in the
>>    guest Device Tree (DT) fragments.
>>
>> 6. Observation:
>> ---------------
>> Introducing optional per-guest enabled features (`viommu` argument in
>> xl guest config) means some guests may opt-out.
>>
>> **Risk:**
>> Differences between guests with and without `viommu` may cause
>> unexpected behavior or privilege drift.
>>
>> **Mitigation:**
>> Verify that downgrade paths are safe and well-isolated; ensure missing
>> support doesn't cause security issues. Additional audits on emulation
>> paths and domains interference need to be performed in a multi-guest
>> environment.
>>
>> 7. Observation:
>> ---------------
>> Guests have the ability to issue Stage-1 IOMMU commands like cache
>> invalidation, stream table entries configuration, etc. An adversarial
>> guest may issue a high volume of commands in rapid succession.
>>
>> **Risk**
>> Excessive commands requests can cause high hypervisor CPU consumption
>> and disrupt scheduling, leading to degraded system responsiveness and
>> potential denial-of-service scenarios.
>>
>> **Mitigation**
>>
>> - Xen credit scheduler limits guest vCPU execution time, securing
>>    basic guest rate-limiting.
> 
> I don't thing that this feature available only in credit schedulers,
> AFAIK, all schedulers except null scheduler will limit vCPU execution time.
> 

I was not aware of that. I'll rephrase this part.

>> - Batch multiple commands of same type to reduce overhead on the
>>    virtual SMMUv3 hardware emulation.
>> - Implement vIOMMU commands execution restart and continuation support
> 
> So, something like "hypercall continuation"?
> 

Yes

>>
>> 8. Observation:
>> ---------------
>> Some guest commands issued towards vIOMMU are propagated to pIOMMU
>> command queue (e.g. TLB invalidate). For each pIOMMU, only one command
>> queue is
>> available for all domains.
>>
>> **Risk**
>> Excessive commands requests from abusive guest can cause flooding of
>> physical IOMMU command queue, leading to degraded pIOMMU responsivness
>> on commands issued from other guests.
>>
>> **Mitigation**
>>
>> - Xen credit scheduler limits guest vCPU execution time, securing
>>    basic guest rate-limiting.
>> - Batch commands which should be propagated towards pIOMMU cmd queue
>>    and enable support for batch execution pause/continuation
>> - If possible, implement domain penalization by adding a per-domain
>>    cost counter for vIOMMU/pIOMMU usage.
>>
>> 9. Observation:
>> ---------------
>> vIOMMU feature includes event queue used for forwarding IOMMU events
>> to guest (e.g. translation faults, invalid stream IDs, permission
>> errors). A malicious guest can misconfigure its SMMU state or
>> intentionally trigger faults with high frequency.
>>
>> **Risk**
>> Occurance of IOMMU events with high frequency can cause Xen to flood
>> the event queue and disrupt scheduling with high hypervisor CPU load
>> for events handling.
>>
>> **Mitigation**
>>
>> - Implement fail-safe state by disabling events forwarding when faults
>>    are occured with high frequency and not processed by guest.
>> - Batch multiple events of same type to reduce overhead on the virtual
>>    SMMUv3 hardware emulation.
>> - Consider disabling event queue for untrusted guests
>>
>> Performance Impact
>> ==================
>>
>> With iommu stage-1 and nested translation inclusion, performance
>> overhead is introduced comparing to existing, stage-2 only usage in
>> Xen.
>> Once mappings are established, translations should not introduce
>> significant overhead.
>> Emulated paths may introduce moderate overhead, primarily affecting
>> device initialization and event handling.
>> Performance impact highly depends on target CPU capabilities. Testing
>> is performed on cortex-a53 based platform.
> 
> Which platform exactly? While QEMU emulates SMMU to some extent, we are
> observing somewhat different SMMU behavior on real HW platforms (mostly
> due to cache coherence problems). Also, according to MMU-600 errata, it
> can have lower than expected performance in some use-cases.
> 

Performance measurement are done on QEMU emulated Renesas platform. I'll 
add some details for this.

>> Performance is mostly impacted by emulated vIOMMU operations, results
>> shown in the following table.
>>
>> +-------------------------------+---------------------------------+
>> | vIOMMU Operation              | Execution time in guest         |
>> +===============================+=================================+
>> | Reg read                      | median: 30μs, worst-case: 250μs |
>> +-------------------------------+---------------------------------+
>> | Reg write                     | median: 35μs, worst-case: 280μs |
>> +-------------------------------+---------------------------------+
>> | Invalidate TLB                | median: 90μs, worst-case: 1ms+  |
>> +-------------------------------+---------------------------------+
>> | Invalidate STE                | median: 450μs worst_case: 7ms+  |
>> +-------------------------------+---------------------------------+
>>
>> With vIOMMU exposed to guest, guest OS has to initialize IOMMU device
>> and configure stage-1 mappings for devices attached to it.
>> Following table shows initialization stages which impact stage-1
>> enabled guest boot time and compares it with stage-1 disabled guest.
>>
>> "NOTE: Device probe execution time varies significantly depending on
>> device complexity. virtio-gpu was selected as a test case due to its
>> extensive use of dynamic DMA allocations and IOMMU mappings, making it
>> a suitable candidate for benchmarking stage-1 vIOMMU behavior."
>>
>> +---------------------+-----------------------+------------------------+
>> | Stage               | Stage-1 Enabled Guest | Stage-1 Disabled Guest |
>> +=====================+=======================+========================+
>> | IOMMU Init          | ~25ms                 | /                      |
>> +---------------------+-----------------------+------------------------+
>> | Dev Attach / Mapping| ~220ms                | ~200ms                 |
>> +---------------------+-----------------------+------------------------+
>>
>> For devices configured with dynamic DMA mappings, DMA
>> allocate/map/unmap operations performance is also impacted on stage-1
>> enabled guests.
>> Dynamic DMA mapping operation issues emulated IOMMU functions like
>> mmio write/read and TLB invalidations.
>> As a reference, following table shows performance results for runtime
>> dma operations for virtio-gpu device.
>>
>> +---------------+-------------------------+----------------------------+
>> | DMA Op        | Stage-1 Enabled Guest   | Stage-1 Disabled Guest     |
>> +===============+=========================+============================+
>> | dma_alloc     | median: 27μs, worst: 7ms| median: 2.5μs, worst: 360μs|
>> +---------------+-------------------------+----------------------------+
>> | dma_free      | median: 1ms, worst: 14ms| median: 2.2μs, worst: 85μs |
>> +---------------+-------------------------+----------------------------+
>> | dma_map       | median: 25μs, worst: 7ms| median: 1.5μs, worst: 336μs|
>> +---------------+-------------------------+----------------------------+
>> | dma_unmap     | median: 1ms, worst: 13ms| median: 1.3μs, worst: 65μs |
>> +---------------+-------------------------+----------------------------+
>>
>> Testing
>> ============
>>
>> - QEMU-based ARM system tests for Stage-1 translation and nested
>>    virtualization.
>> - Actual hardware validation on platforms such as Renesas to ensure
>>    compatibility with real SMMUv3 implementations.
>> - Unit/Functional tests validating correct translations (not implemented).
>>
>> Migration and Compatibility
>> ===========================
>>
>> This optional feature defaults to disabled (`viommu=""`) for backward
>> compatibility.
>>
> 

BR,
Milan


