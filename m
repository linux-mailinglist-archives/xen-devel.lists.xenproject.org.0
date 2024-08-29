Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F19964083
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 11:49:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785607.1195085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjblj-0003zd-2D; Thu, 29 Aug 2024 09:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785607.1195085; Thu, 29 Aug 2024 09:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjbli-0003wU-Ui; Thu, 29 Aug 2024 09:48:42 +0000
Received: by outflank-mailman (input) for mailman id 785607;
 Thu, 29 Aug 2024 09:48:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4mUO=P4=epam.com=prvs=5971918609=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sjblh-0003wO-2c
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 09:48:41 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc646126-65eb-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 11:48:37 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8jJa6020670;
 Thu, 29 Aug 2024 09:48:24 GMT
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazlp17012026.outbound.protection.outlook.com [40.93.64.26])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 41anrnrad2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 09:48:24 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PA1PR03MB10772.eurprd03.prod.outlook.com (2603:10a6:102:484::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 09:48:21 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 09:48:21 +0000
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
X-Inumbo-ID: dc646126-65eb-11ef-99a0-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUDSnMHxUO2KJBhnhOzhDIgTtiSVl7fJ3JKvzV+2/rX2fqFJAmjnrhrn4SrijW7HiqzETzODIlejN+Ihowfb2f896ISQU1vX44sDcLOB3CyuRr9QEFvrNrqFlBUKPAMLJXGarop2keIhbscJlNTGX9gKlBeur4JF/uqcmWGtAHLQm5w9OHgp0NDHZ5avoZv6z+cO4SLcNB1gSZjh5Of6DkX2P1WAuRTbzLe5YYYETc+yOND6b3lhmJ8wMsegtO2QUtALocnG1EJxDFlXKazclC+C5Ks500eQoNGEsSnpPVkjKI+Xm1WhEnTy0eeAkm8wF/vHSsYU7mhqyobVYZxelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgER5DsOgs79K3ivRSOoBr4SXrbT3Cq0I8G6lG1sDmA=;
 b=I3akgr6BYw7SojFgEtn47Z4J7RhJtqDkeqfoklULN9M/Dy2e1R3VpT0VJ2/h6OTr34EphQcQ8X0yzz/23mGrEhE8wu+NWmHhmyI6+ASM/EUchWvtYGmrKBvpX2GCk6Qyd6Rzvdaw4Kmh59LWEKdtSAVDcaGW1gtuNTmTyfTUWZTmdJVOJCkq1otbJZqzObrkEj3LHTkgPDn11Lyc1oDBRJ/UbwdJT8RVkKZhmwAcjm8WErH2VybLGUpP6XL5Vvp7SPlxNDi4lTc2BbEnDbY6QAOFsZCSUjWLldgYf1zAag2YZJm7XotHbVkLvq3lmaw0v29ttDmorJB9AFmPwbqTrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgER5DsOgs79K3ivRSOoBr4SXrbT3Cq0I8G6lG1sDmA=;
 b=YAFD2/8AWdEysu3PsGAf5IHZwwAg+2JS5Tmm0YArHRs9bBDR36rqqxbrBMv3sFb2wMQwAcXXeMiZavUEJ14VY/rnK2jeSd3yb1hEDsioGx93mqQRckTaMajzOYHRNPg2pTWbb47i037IBSLA3dMzMYlGVO9bIYFKPeXxvDYDNfdzar29lrjpUl6jYPs8vwq7wyGM4lkeI355SAGPIfIS167ka/SHw0JCt8gyRE7YWK3k6W8x/OHjDgxZNm7qv5Q+83ptiTVUaay7rF0w3I0DtYZ2YfB3TYAJwjzNOp7cxN1BH2+oGUU3vHjuBJv8OKKJz1PjW2V9IPvqyI1Na6zpUQ==
Message-ID: <7e798639-98f4-4b7b-bab3-14f4f6da51d0@epam.com>
Date: Thu, 29 Aug 2024 12:48:19 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 5/5] x86/amd: optional build of amd.c
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
 <3c641433fa7cfe1f7fdc918ab32086835a2e13eb.1723806405.git.Sergiy_Kibrik@epam.com>
 <5675ea5a-0c14-42e2-b817-d9576a1f64b7@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <5675ea5a-0c14-42e2-b817-d9576a1f64b7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::18) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PA1PR03MB10772:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ee5b46-328a-406a-0628-08dcc80fb7fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2U4NzhrSThmRkNVM3ArTWVDZkpZazJCUEZGRUdXNXVtUER4OTdON2d6ZmhY?=
 =?utf-8?B?L0hTa3NFVWZoWkUyNmpoazl5eE5xbzViYzllOGNtby8xZWU1cUwxVkVZeTVW?=
 =?utf-8?B?UUI2SVVKajNxV0EwcnRFRVgrajFXbk51QkVQWDBPdEJlaUFOY0FNZVFxQUNT?=
 =?utf-8?B?TGsrMWppamZsQ3BzRkJKSnFSSVMydHJ0VFZEUWRLZGxmSzAxTTJxRFMxNnBl?=
 =?utf-8?B?R2I4Mmhwb1QvRHpWbGJyQXZiU0RlTWF6OStlTjB2dTJlcHdsWDdpeE1HcE84?=
 =?utf-8?B?QVkwT1lRcEJ4Qjd6ZVdCV0NJMG1zWUtlTUpBQzRCS1NOZm1yTUNnYTdxRWdk?=
 =?utf-8?B?V2pEbUxKMzIxWjhkSCtxV0RNaGdPVVl1K0pHdVRoYWwwOTFqbldhdkV3RUpK?=
 =?utf-8?B?aUtZdVhwVmlFVW5OM2NWSjYrNDNjRTV4bjdleTJMaHVnb096czB0L0tDWmZG?=
 =?utf-8?B?bmx5VWJXcDN4cStTN1RnRlVTWTdtT1NyYSt1ZW9BMno2OHdxQ2wzaUdYRWpY?=
 =?utf-8?B?Y294cTQ3aDhlei95QmNKK3M1YXdaTmtwbE4vb3dWRDVBYVVTVnNWS1FCLzQ2?=
 =?utf-8?B?MEVpQTd6OTAzcXBMMWU3WXdJRFlsNWJBdGlTcVA0d21XRE96YzV4eHhzY1k5?=
 =?utf-8?B?SVlKOXpBZlcwVjNuZUZRbVlKcG9qdUR5NHFNbUVEeUZ2a2k2OHVUNHFzSkhB?=
 =?utf-8?B?V2VSWnl3UlhYYnErT3VWdHA1UTJIYWZvdmloVEY5dkJVa2ZnekV1QVIzQ3JK?=
 =?utf-8?B?ZFpVK0Vod0xpY21XcHhTWXFnT2FPMzBtZzB4UFRET21CU2VjaHpaMjg4NDh1?=
 =?utf-8?B?eE14alEvVDB3dURkNlFLYldoYlNKMGVCaTNDemcrSXR5V1NxRlErY21UZit2?=
 =?utf-8?B?clFoNjBYREY2RC9wODVXRCs1REt0N3ovS3NteTlEM2ZVY0Yyay9Md0cxNkNu?=
 =?utf-8?B?WDIvTUU1TTFDQXU5V3J5bTMyQnFDNDdLcFd3ZFAwcDh3S3V6Z1VJK3ZEMXc5?=
 =?utf-8?B?ZFJUcG1aWUZXajZaZExweU9oOFY1WXEveldIeWtOalNSY2RnOE9nY09WWG0r?=
 =?utf-8?B?aEszNU9TSW5PREJKakd0bjE0NWtKVUxDM3ROYm04S1ZSTG9MbEdWWGV4TE5T?=
 =?utf-8?B?UEZrdk1ZK0tCQm1BNlJRVDNTK0VtN2lqYkJuUnlncHhjRUxRWEZ1SUZ4TG1n?=
 =?utf-8?B?WUFPck1hUTI4aVVMU0hwZE1zQkVQNE45cC9oVlJac1R0bVFrK0lVVWF1Rm5S?=
 =?utf-8?B?eHRmTmRDaDl1K203Y2tVTUJhRHN1YkhiTEExcTYzazJONjk5YlRXbnp0U1hO?=
 =?utf-8?B?eCtCSXlKaWJVTUVhNW5wOUpjMFo4Y3pHNnZlQXk0NzB2dTVBaTVzRythVFU5?=
 =?utf-8?B?alJSQmpPSGszN3lBVUxYdUQ3RU9PZmVEakhZTjhaWEhNT1NtckcvaytyUGh2?=
 =?utf-8?B?bU5OREZicklNVHQrSFd4ZUVnUkxnMk56bGsyeE9jMldqNTZHd1FoR0E2dW91?=
 =?utf-8?B?dHJ3NDBrZVB4cm8zZCt0RTVOZTN2OVZRSnkzd1dGSWZTZXNWZUVGMmU5UVV2?=
 =?utf-8?B?U2IxUURYMzZzWkJPc3MvL2hrVFhvTGU3T2hrR1oyWFlIMnFhZnMrN2NoOE9T?=
 =?utf-8?B?UHQzM1JiVWluK0puaFBMelhzTll2cDJ1MmlNcUsyM0ppamxMbStGQWRDNm4y?=
 =?utf-8?B?ZFBKMzJCQUg3VWtTZjlHQWJSOGdSZHRrM2RpWXdYY2VTcklLNG5Ga0YzODQ2?=
 =?utf-8?Q?jIwgsJNFyjm1E6NmRo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1ZjbUV2VVh3WnplVktac3FockJOL1MwUHFpZWJZdVFhSDdnRDVEUGtMK2w5?=
 =?utf-8?B?dW5CUC9oRjJ0V3llZ25Cc3JFellpNDJMY2pVazRxYVFuZGxIOVdUWXVRQ2hV?=
 =?utf-8?B?UXh1RjZjNUFSWFhaVEJ1MHE1QlRWRTM5WDB0b0Q3WElYY1ZOSWFOQ2FSZEU3?=
 =?utf-8?B?NFpnQllweXViQUV0K0xNUnczdWpNRFFrS1pLOUZlRm5wQWNTZndJZDF5bjlC?=
 =?utf-8?B?NWtGMGNVbDQyZC8yV2RWRkQ4K0hjblJvOUZQYmtieUEvcFR6emZhSTZHa3lQ?=
 =?utf-8?B?VkpITHRsSEd0dzBQTkQ4eVhyUVZnc1lBTGFUSGw2dnJSNlRKcmVUMkhDNTIw?=
 =?utf-8?B?QzYxVnRxTzZLbnJ4akIzazJXQldRUkJGVlpnTUhoTmFISm9qRUc5L0dNWE42?=
 =?utf-8?B?QWZ4dUdSa3ZqSytuSjBaRDBmUFVzK0x1dWR0RmN5dWwwRk5jekNCenQ1MFdk?=
 =?utf-8?B?dWVLSEkxcHRnNFlweEdES0VzNWJ0b01rcGpHTHhueGc0UTU1UGp0UjZMNkov?=
 =?utf-8?B?bG16bnkwQzFZY3FWRjZRWlR4TW1kd0YxbkY3MG1mL1NGTS9od0RnaVZYK1ZU?=
 =?utf-8?B?SjlwMTB2bVQvT2dXbGM3WXNMYXoxSnN0eWZMOHlUUjE1MnQ4TzhFeVZTdk01?=
 =?utf-8?B?c1k5OFZWakFjbWd4bE15WEdmeGRreEozc1MwOFpubm5PeWc5TG05WS9jN2Jy?=
 =?utf-8?B?RTliVE0xNWNBK0Q4VmNLNWhWV1hZNDVFZ0ljdEZLVVVLN3JMVXYrTFQ3OWFB?=
 =?utf-8?B?ZmZCZUxOR1ZyWG84OVF6blBjUHNZbHF4dVZhL2ROcVk3ZXl0WjIvaVdKNUVj?=
 =?utf-8?B?Q1BKZVZsbzRvdytnK2ExS0h2Zm5RajU1MTRNamt4TmpNNE5NbHhOazUzcGtC?=
 =?utf-8?B?YWltVG9XWVJObFMzM0s4OHhXY1pBVmdKakZlVENGT0IybFkxQzVOZ2V3UGI4?=
 =?utf-8?B?ZHNaRk1aZ0xmQVVzd3FzSG9RWit0RVcrOGpGSnd2WlFkTjFDYTQ0R1lrOTJ4?=
 =?utf-8?B?bks0cnhHTnlMTS9Xak5GNlhsakJ1NGZJbGRqY01PaGxZM1VDM0FvUHBtTzhQ?=
 =?utf-8?B?dnZTSzdFNkFJcHgzOGlVbXZTMFpVRW9WY2JVa21qeW9zanBFcXprdm9mdm1x?=
 =?utf-8?B?a1d0OFBpRllSN2ZoN01rMlUyNW5OVkRid3ZKK3VCOGNKRFQvcTFYLzhDU0R0?=
 =?utf-8?B?SzVVZzNYK3p3QmJ4c01xQmdScndialE0SExSM2FGQ212aHJIZFpzSHFnM1E2?=
 =?utf-8?B?Y2pVRG5lOWFKNlZ3U2t0Y29hUFMvWjh6NngzTDljNU5Tc011V2ZLM3ludFNB?=
 =?utf-8?B?K1M0eEEwY0MwN2dGZnFJbk5EVGJSaUllOEdCL2JDS2FyQVNmRzZyWmVKM000?=
 =?utf-8?B?T2ExZEhINEZqMTR2VWwyb2RrRmZsUThtSkxHbFJqMGRIR2JacHNMUHhmbWFU?=
 =?utf-8?B?NFRhSWJDQW9iajRTVHJRenFRaVhTWldoVjcwUFZxSlNTVkF0cm1DSzZ6UkZl?=
 =?utf-8?B?bk95dENtbXVrZE5Bd2g0ZE1VekhiMUdwSGtLQ3pxMTFoU2QxS3AxTEJuWVFo?=
 =?utf-8?B?UFBYN2RLdVljck0zcXR2WHFCNllIbnl1QWZNTWFIdjJsbzVGOEZGSWVGekZU?=
 =?utf-8?B?Wkd5UzFKQUNvaWt6dEw4NnVPS1hIZHNmcjF1OHFxRjkvZWpMVXh5SmFpdXFi?=
 =?utf-8?B?WnUzbTExbXNzYlFLcDl3WWhwT1BkaWZQcEFJSC9hcEpoYm5LdVZHbk0zMVFX?=
 =?utf-8?B?eW5yQVFmZ0htVzBoTEdhYUk4cnhRMzZiSXc5OGs5V05JZmNBeEltQVM4QUtN?=
 =?utf-8?B?WTNqOVZwek1DNTdmaU5kWUhpKzlITTVGcGozcE9tMXJ4Rk50RG4zdGltOHBj?=
 =?utf-8?B?WUJyWHA5Y1FpQTU0Yi9aN1N4T1ZyN2VBb0trekRqbWx4K0VhVzFuL0pvR0dW?=
 =?utf-8?B?bVdwUFo5SnBWOHZOR0pEQS9XMDdRS0pMWkZjK1ROdEtVKzhHUm12a2wrd0k2?=
 =?utf-8?B?Y0JtU0hoR00vRTFQRzRuZFJTdEd6RWNrVXdoM0ZNM3owTkhJNTRGVzNBREVT?=
 =?utf-8?B?UmJTZXFLbG8yWkVhalAwczc0RjVPbjl1UXVqVTBBVUxNRmNIRHdDKzIxM084?=
 =?utf-8?Q?yIqfI++Q+X8LBvQZ79SvFq4b9?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ee5b46-328a-406a-0628-08dcc80fb7fa
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:48:21.7713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+7U9XIQDcFk1L5O9rOLSk9zdMASWjOGWTrQppuDu3dN0ZXHQINlYvtN7r9/VKlwbTCp+Z89djqVeJbN2M1l0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10772
X-Proofpoint-ORIG-GUID: xrqv9oct9Q5Bf5hD5jQE7KR5chkBzQz9
X-Proofpoint-GUID: xrqv9oct9Q5Bf5hD5jQE7KR5chkBzQz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408290072

19.08.24 15:36, Jan Beulich:
> On 16.08.2024 13:19, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -919,7 +919,8 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
>>        * Possibly clear previous guest selection of SSBD if set.  Note that
>>        * SPEC_CTRL.SSBD is already handled by svm_vmexit_spec_ctrl.
>>        */
>> -    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>> +    if ( IS_ENABLED(CONFIG_AMD) &&
>> +         v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>>       {
>>           ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
>>           amd_set_legacy_ssbd(false);
>> @@ -953,7 +954,8 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
>>           wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
>>   
>>       /* Load SSBD if set by the guest. */
>> -    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>> +    if ( IS_ENABLED(CONFIG_AMD) &&
>> +         v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>>       {
>>           ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
>>           amd_set_legacy_ssbd(true);
> Instead of these changes, shouldn't AMD_SVM become dependent upon AMD in
> Kconfig?

It could be done earlier, yet I haven't done so since we briefly touched 
this before and decided not to link {AMD,INTEL} with {AMD_SVM,INTEL_VMX} 
then:

https://lore.kernel.org/xen-devel/9a973f18-e0af-456c-8b07-6869f044519e@citrix.com/

   -Sergiy

