Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A96B24693
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 12:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079693.1440422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um8M4-0005sP-A1; Wed, 13 Aug 2025 10:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079693.1440422; Wed, 13 Aug 2025 10:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um8M4-0005q6-6W; Wed, 13 Aug 2025 10:05:12 +0000
Received: by outflank-mailman (input) for mailman id 1079693;
 Wed, 13 Aug 2025 10:05:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1pw7=2Z=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1um8M2-0005pg-PP
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 10:05:10 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc90451f-782c-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 12:05:06 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by GV1PR03MB10519.eurprd03.prod.outlook.com (2603:10a6:150:162::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Wed, 13 Aug
 2025 10:05:00 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 10:05:00 +0000
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
X-Inumbo-ID: fc90451f-782c-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/f1wrCunYSi9hEmbrVqL6x+yr68nkJiAa28wkHCbZh4v1WHJOiT8R7Zo8Bn2I4XLhRYkmt4+qxn0rOdqOC+CiOy6mGchjsiEBpCH9E6aFnMzTQ5MiyHmL9qcyfeK1zw2Vt59aL0206CJ2FQ6Cf1mo49BtldljTnfkhtSMWmomcOgzghaDAE4SYEwS9wQ+hYYn53MLS1LQf/ZeJTMHE7766pY0Qi36+KWdZ0LZXG7wtMDrYfuUTtCFpKSX/hcTKJ0/yAOvBoiuj8hhaoXCV82TsIAjI3yfgrox+2DK4B17/bQPc8a3O89m2yoiXttpuBjGxNY1qTw3Z3sL31Ow2qLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tBlqXZx0U7sf4hcYNtpSiCENvKVuXui+HqEWO8CTxI=;
 b=MVpS3pL7Egrsb+b/j40H/VA8+7ZhEnKeNmq/9yonRO1FS/To5+7aGQKidJANWHV414UdzA/DPjlVuvvxnqvgpnCtpyvC96JOQmWBLyIrzNULw3FXGKqQ43xgiCUxezzWZdiTXEGjqHjpeOWeiJApI2NqeJOB4fT8khE2c5oP9oJMtJjLa0X8eJRdVN/P95NO37VJFWC9kk8ivMQ7JWKp2eO/5OE+sjfHMSVHaNjyRYpI9U8pYL3fW4Uh2DMFaLZABXjAHJKOJmrga3CCdBogzpq5MKKB1ZBuehS4VCg8n4wDAQPErKtlnvsUtRmedC26HNRqGFY0cq11tXadVCE+PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tBlqXZx0U7sf4hcYNtpSiCENvKVuXui+HqEWO8CTxI=;
 b=eg04rsXevstnK/YueAjwo+2zbUCCGK/lu+kxLh+I9slS1WPVqMwPtlkqbzc146cp5xa6oH08jgWnOybK3I9HjkePGaQBFceozfPGnNOlsHfJvDh8XH5z/c6p1jt6SROEIF3d9r1lQXodJ5y1bvcKOlhPnBezMyN8M1OAtIPu14GuqzBtV8stZsV6BoLLtjcXHkT5Th4xkbd5qowRi1FX6MLvROwh+ajt4Ya9kBHwaWNY0wBRKPlnaYcKP6K5Zw3ECA8xn21UvOyLfil2ScSQyBXaDR/0fn/26kyzdzNAfno2ZJjSRFzsK7UgsB5h3CIVhy0kg5OjEJD8d9LLSep2Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <12ba4388-ee23-4e17-910f-9702271865ad@epam.com>
Date: Wed, 13 Aug 2025 12:04:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
 <CAJ=z9a1eM6M+Gagond9TiFtF7c7EEQKOKHANcvDWDhW_3JzqOA@mail.gmail.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <CAJ=z9a1eM6M+Gagond9TiFtF7c7EEQKOKHANcvDWDhW_3JzqOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0159.eurprd09.prod.outlook.com
 (2603:10a6:800:120::13) To PA4PR03MB7136.eurprd03.prod.outlook.com
 (2603:10a6:102:ea::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR03MB7136:EE_|GV1PR03MB10519:EE_
X-MS-Office365-Filtering-Correlation-Id: cef162df-f2ed-41f1-f322-08ddda50dd54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eU1JY3hMZkszaG90RjAwK3UweVhxU04xZHlrRUJBZzBvbkJXWGRWaWNubHJz?=
 =?utf-8?B?VVJzU1JPT2RUKy9pdkZ4TS9OeVlTQVQzZXZMdXlJMTdseFlveFB5emNScWhD?=
 =?utf-8?B?Q25SK1c0dUtOeVpkNXlVaHUyQzAzOSt5YS9hOEVkOEdPTkZ4WXBrQWFSN0wz?=
 =?utf-8?B?UnRmSEN6QUJSREx5ZXljQjZJNUtJb1B6MnByMU1MdFN1WllMMGVhejlVSFhH?=
 =?utf-8?B?WWhZM2JFek9SSGVvclJoRmwxaGl0RGpIZU9KV1NUVUgxWTZOYlpWd0h2cnhV?=
 =?utf-8?B?WXFlNktieGpWNFlXUDRXWTBrTkZZU0lOM3RpUlhoL05scXA1MWY0ZGV3V0JK?=
 =?utf-8?B?UkZKa0FQN0wvN2hUUGwzMDZyWUNMRmtERHpSTUNVbHovcDF3ckZFS1dHWW5u?=
 =?utf-8?B?cWZmeXVHbW1LZWYzaUYzcnhoZVhuRnZlM1BaZ20vTkJWVExGdE1yalFCYTd1?=
 =?utf-8?B?eDNidEphclZ2Z0VacWIwNThDS0pnWElVQmVUU0hGbCtzK0hKWktES3RUKytD?=
 =?utf-8?B?cHlwV1Vsd0hBQ2R0Zk9sUWQwZEppUDlMQnBNUHJlbVBRTEQ4MzlZNWlRdFZa?=
 =?utf-8?B?S0JzT1ZmaitMTTFRU2hnc3ZnbW8rZ1cvczh6em41cXZqZXFFUFlQNlBHaFJ3?=
 =?utf-8?B?U3V6c25LT1lXaFVZbjd6SjEwNnZBcXZqaDR1d21nTTd2STVma3ZmbEhDNWJI?=
 =?utf-8?B?a3NSTHB6anJaY0QwZVgzK0tLVmhTaEtCTTc5a0k1VUtBNkxrSXBvdFlUNG9H?=
 =?utf-8?B?T1hDOUtHVlo5VkJMUGU5bGhvdDJNNGEwUFpIQ1RCc2RQVUE4Ukd1RTRpamJR?=
 =?utf-8?B?WFRjZGRxSFdleDRpS3Yvamt1SjhpSzQ0UXZCSGdWbllsQnR5UGN5ZUtibkFE?=
 =?utf-8?B?YWI4cnNCNmdlRXkvcHRiZlp2ZUIyNGxYd0c1U0NOZFZPcy9nUGR2RTQ2VFBH?=
 =?utf-8?B?eThtSDNuczBIQzRQbTJxUDJLbk1xcVhLNXQ1czJjTmJ0ZHBmZjY1NHA1TWlP?=
 =?utf-8?B?QWo4dytjb1lBNUsrLzh4aXVDbzA5a2dDMDFOczVENEc4OVFoTWhnaU1EUVkr?=
 =?utf-8?B?ZGhaQXNKUTRCZ0VYMkR5V2RJMUhhYzJkWGVRTzU4WmNoWlRVRC9aTXo3cm10?=
 =?utf-8?B?NDhvU0ZlRFlHQW5Oa1lyOUp2L0NWdWp4SG1XTHFpRlpWcjNRbFZPSkdZOXRq?=
 =?utf-8?B?ZExKSDVpZVNhSzZVMzFCVEFCM1RaVVVCMmx6YkhRWURHMStvazlHaEJjL0hK?=
 =?utf-8?B?Ry9qZkRpWVFTdzBwT0VpeG5CdGFCOXRSS0JweEZOWkJrTTZqR1VrNGlGRkk2?=
 =?utf-8?B?elFVNkhTOWJoSUVoaWwwcWdGUFJpSVJXUVd1OEF3SXdZa1hkb2dmVU1NK0tx?=
 =?utf-8?B?cEJqREw1NFpsaUFpMnhIZnN1WnVEdWZHNGNXQ3M0UkwwZE9JR0puakJUTEo3?=
 =?utf-8?B?eStNSFpKTFFzSVVvR1RkeFMxWkErNlZsSXg0YlZWaWJRb0ZlMGtUWEgzSDU0?=
 =?utf-8?B?ZTlyZGRNMkZpUVoxcE5xYW9UWVJ5QWYvSi9wSWR1YUVudXZMRnI3QlBEdjFi?=
 =?utf-8?B?QWwyaUFrdEZ6MFpNU29OL2Y4OXBteExTMHRSRlpYWFN3dXUzdGRJZmhmKzVW?=
 =?utf-8?B?dVdORnJ0RmVuL3haS2lUZ2hnWDBRSGtWQ05rRnRjMDRydHVYeExNRG43TlVm?=
 =?utf-8?B?OGNXOW9Ramt3WDV5ak9GTlJwQitkTXAzaHFZbkF4OVV3WGc0cU5aTUJuM205?=
 =?utf-8?B?T043OG03VjJ5Qzc5bXRIVzZkeXU3SjJNL2JzcVFHTTlNSm9mOXJqbTJueWt6?=
 =?utf-8?Q?ibk1lKD4Tt2Z76+Tu0Hp9i5NGOeuaifKAT7PE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1lUUHRwbHVTcU4yOU5TM09RSUtwRHZkNHU0dVRhQ1Y3K1dpVmpFS0V2YjQ3?=
 =?utf-8?B?V0hXTjQ3a29BdjhyTW11dDhoeUJyc0RkeEEvZG9xbi9MZ2I3MEx2UTdaMm1T?=
 =?utf-8?B?Z1daZ3p0M3RLV3hhejdRYnc0Vy9SZXc5aUFmT2IrbUU1Ylk3alY2VmtaTDNt?=
 =?utf-8?B?RmJneDlzOXh1c3R5QzdjZXNjbWZzbVRuc3VHeUt4VGo5RjZyMWZoSlkrWDF4?=
 =?utf-8?B?UjRDZVFIN2JwbjVPcnZyY29BYytqNzFESzhPRWhKaGc0WWczRTNkR21sdGtx?=
 =?utf-8?B?eTdwWHdoeFhyMjBwNXlQRzVScDYybk9VWHVOdlNqcVAycUlVNU5Dayt2eHZR?=
 =?utf-8?B?Z3F1SVVzVnhRYUtseS93dXZueDlvakxPR2xkcVpsMkdxdE1MK3djODV2WEhL?=
 =?utf-8?B?K1BMbTlXUGczUHJUeGdwclMzV3FwVzJNbTFXcmwycEhpZ2p0SW45TjVPVWxq?=
 =?utf-8?B?V0JiR2R6aitwakhpWitFNWhtSDRub0JQcXgwbHNwOWJHYTJYdDlab1d5dzYr?=
 =?utf-8?B?U3I3M2p6VS92VGRhWk1kVXNLZnVaZHY3ZFI4b1BSdXVCdnU2OGFMeGZQaHVP?=
 =?utf-8?B?bnNaYm1QVVJYdXJ5Vm9NMElKWENmN0JQZTF6WFV4OHVPQXNOM1ZtaWt3VjZx?=
 =?utf-8?B?NGVwZkhrajUvM093eGUvVUI0WlV1eCtUZXREbjNOQ0NuWmVaWFpTV2VzRjVv?=
 =?utf-8?B?elNRUVRDQXR5a2Q2Q2Y3RU4zWHhjTnluTXFXTXdKT3JJRFRjSGdSd2w2RGtI?=
 =?utf-8?B?WXhnOU0xaWFBcm5ienlicnlxSFhRb0J3RlB5K3h6REFGaG5EZURvanFuSitC?=
 =?utf-8?B?ODVjM2x6Z053TkFROXlBUlhCVTFPWlBySDRUUWFIOEFSMnMrSWlEdktNTDl0?=
 =?utf-8?B?UWx5S2hld2l3S1RXWlhqcm1yWkZkWUpESWdEQ2tTL0lvZlJ4dXBUejJReEFO?=
 =?utf-8?B?a0tRZ3pwdTAxaGVzbW10c2h2UGZ1eENwNDc2TUZBVTdqQnY0UzVaZGJZUFpS?=
 =?utf-8?B?WnNPcnFzaUJvZVlkZWxDOXllSkhlTFhUWXo1bXlNS0NOQUg1Ym90KzhFSytR?=
 =?utf-8?B?b21neTNwdDJaa0Q4TlJjaUIvT283VnQ0d3N4NjB3Qk9kNERkZktSZ0NmaHlP?=
 =?utf-8?B?eDBqTjdkT0d0Z05kOVNsSFViS1VkYXQvRDdMandid2RESHo0dVBxZzVnQjdK?=
 =?utf-8?B?c0tNR29RNEdldnA0bERYWVFVam0xOEJ2WVJWRWdqQVc0U05GRW5tVjlPMTVJ?=
 =?utf-8?B?NUFFT2VoZ09FdUhnVjRBb1U3ZDN3MjRRdlJjYmxKcXU1TVlXVlhIYWZqRUtz?=
 =?utf-8?B?N1htak1pSnJpbUJtY3pCcnNTTUZaZlZYV1NSUUpJVTUvWitId2ZMODVJV3Ey?=
 =?utf-8?B?MVp4cHRkRTVkaXVBU1ZveHpON1ZoWFdzZVhJbmZvV1JxNWJuOFBUVGxGc2Yy?=
 =?utf-8?B?bjY3OTBKbWFYNS9xUGNFRFNab2dobWhMbUMweCtKUXlnRXNsOUJLOTFYaGdO?=
 =?utf-8?B?TXZMUGJaMm4yY0lMWGtSS3ZDTVo4Q1k0S2MraDQyU1BXWEFuVUdEbjhXczBD?=
 =?utf-8?B?NmoxLzFIWERnZVdFbUdRY2U1L2lNa1RzUW1BTTZLb0trSTJBSWtwalVsZU9L?=
 =?utf-8?B?d01NTmdMRlJYV2FqTWFmTEJwOTlMa3lUVUN1SnZLRkc1Ykk0RkRFbXY0SXkz?=
 =?utf-8?B?RWwwZlNzbGc3d3VuUzhrY1JUS0t2aUx1a1RXSEJTbHBTdm5nOVZpb0c4TUY0?=
 =?utf-8?B?VWVvNjBFQURmSExuZkROSk5ZVXZrZjZBUEh2T0dIL3YwZlp6Qm1ndFZOdjZM?=
 =?utf-8?B?VUd2MEx2ZitQajdtZjgzL2x4eU1KSDFram1BZHJPQzBZams1L0VkRld6UHVC?=
 =?utf-8?B?c3JNeHlYSTFjNnJKcTZHMVJNYjRYTEg2WE1NYUU2K1pyWHlLUEpyY3p5dE91?=
 =?utf-8?B?Qi82bHRtUi9tUzJPbmsyNzFTQUFydjNYU2R1ZnNSYW1IMGJvVHpLWWpvWk51?=
 =?utf-8?B?d2pFUzl5YzFiVVAwWGpPTzREWjlWakZTL25FZjc0ZDdqcWxHV0FkM3JnUEhh?=
 =?utf-8?B?YnNIb2JFNFlBYmNac096cWlYRWRFL1ZTcmdwQ0Iza3pXRVFaTUg0OGQ1am1N?=
 =?utf-8?Q?H3H2O1MbWHYqHxJJ+mI0qM47+?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef162df-f2ed-41f1-f322-08ddda50dd54
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 10:05:00.4441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jx28lSQjNiRKVRcRDfHgwEgpPAsF8EsPtHyTIlx7KlVZ/rpWxpssefWI54Wb5AqLKQi5n8pepduTJAAeD7iRfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10519

On 8/7/25 19:58, Julien Grall wrote:
> Hi Milan,
> 
> On Thu, 7 Aug 2025 at 17:55, Milan Djokic <milan_djokic@epam.com 
> <mailto:milan_djokic@epam.com>> wrote:
> 
>     This patch series represents a rebase of an older patch series
>     implemented and
>     sumbitted by Rahul Singh as an RFC: https://patchwork.kernel.org/
>     project/xen-devel/cover/cover.1669888522.git.rahul.singh@arm.com/
>     <https://eur01.safelinks.protection.outlook.com/?
>     url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-
>     devel%2Fcover%2Fcover.1669888522.git.rahul.singh%40arm.com%2F&data=05%7C02%7Cmilan_djokic%40epam.com%7C03265dfcc1a94a11e83f08ddd5dc0edc%7Cb41b72d04e9f4c268a69f949f367c91d%7C1%7C0%7C638901863296475715%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=bdsPyXoIqvzwWIWk0Ot3BDOu8yAaF%2Bq3Vrs4wsmZJEA%3D&reserved=0>.
>     Original patch series content is aligned with the latest xen
>     structure in terms of common/arch-specific code structuring.
>     Some minor bugfixes are also applied:
>     - Sanity checks / error handling
>     - Non-pci devices support for emulated iommu
> 
> 
> 
>     Overall description of stage-1 support is available in the original
>     patch series cover letter. Original commits structure with detailed
>     explanation for each commit
>     functionality is maintained.
> 
> 
> I am a bit surprised not much has changed. Last time we asked a document 
> to explain the overall design of the vSMMU including some details on the 
> security posture. I can’t remember if this was ever posted.
> 
> If not, then you need to start with that. Otherwise, if is going to be 
> pretty difficult to review this series.
> 
> Cheers,
Hello Julien,

We have prepared a design document and it will be part of the updated 
patch series (added in docs/design). I'll also extend cover letter with 
details on implementation structure to make review easier.
Following is the design document content which will be provided in 
updated patch series:

Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
==========================================================

Author: Milan Djokic <milan_djokic@epam.com>
Date:   2025-08-07
Status: Draft

Introduction
------------

The SMMUv3 supports two stages of translation. Each stage of translation
can be independently enabled. An incoming address is logically
translated from VA to IPA in stage 1, then the IPA is input to stage 2
which translates the IPA to the output PA. Stage 1 translation support
is required to provide isolation between different devices within the OS.

Xen already supports Stage 2 translation but there is no support for
Stage 1 translation. This design proposal outlines the introduction of
Stage-1 SMMUv3 support in Xen for ARM guests.

Motivation
----------

ARM systems utilizing SMMUv3 require Stage-1 address translation to
ensure correct and secure DMA behavior inside guests.

This feature enables:
- Stage-1 translation in guest domain
- Safe device passthrough under secure memory translation

Design Overview
---------------

These changes provide emulated SMMUv3 support:

- SMMUv3 Stage-1 Translation: stage-1 and nested translation support in
   SMMUv3 driver
- vIOMMU Abstraction: virtual IOMMU framework for guest Stage-1 handling
- Register/Command Emulation: SMMUv3 register emulation and command
   queue handling
- Device Tree Extensions: adds iommus and virtual SMMUv3 nodes to
   device trees for dom0 and dom0less scenarios
- Runtime Configuration: introduces a 'viommu' boot parameter for
   dynamic enablement

Security Considerations
------------------------

viommu security benefits:
- Stage-1 translation ensures guest devices cannot perform unauthorized
   DMA
- Emulated SMMUv3 for domains removes dependency on host hardware while
   maintaining isolation

Observations and Potential Risks
--------------------------------

1. Observation:
Support for Stage-1 translation introduces new data structures
(s1_cfg and s2_cfg) and logic to write both Stage-1 and Stage-2 entries
in the Stream Table Entry (STE), including an abort field for partial
config states.

Risk:
A partially applied Stage-1 configuration might leave guest DMA
mappings in an inconsistent state, enabling unauthorized access or
cross-domain interference.

Mitigation (Handled by design):
Both s1_cfg and s2_cfg are written atomically. The abort field ensures
Stage-1 config is only used when fully applied. Incomplete configs are
ignored by the hypervisor.

2. Observation:
Guests can now issue Stage-1 cache invalidations.

Risk:
Failure to propagate invalidations could leave stale mappings, enabling
data leakage or misrouting.

Mitigation (Handled by design):
Guest invalidations are forwarded to the hardware to ensure IOMMU
coherency.

3. Observation:
The feature introduces large functional changes including the vIOMMU
framework, vsmmuv3 devices, command queues, event queues, domain
handling, and Device Tree modifications.

Risk:
Increased attack surface with risk of race conditions, malformed
commands, or misconfiguration via the device tree.

Mitigation:
- Improved sanity checks and error handling
- Feature is marked as Tech Preview and self-contained to reduce risk
   to unrelated code

4. Observation:
The implementation supports nested and standard translation modes,
using guest command queues (e.g. CMD_CFGI_STE) and events.

Risk:
Malicious commands could bypass validation and corrupt SMMUv3 state or
destabilize dom0.

Mitigation (Handled by design):
Command queues are validated, and only permitted configuration changes
are accepted. Handled in vsmmuv3 and cmdqueue logic.

5. Observation:
Device Tree changes inject iommus and vsmmuv3 nodes via libxl.

Risk:
Malicious or incorrect DT fragments could result in wrong device
assignments or hardware access.

Mitigation:
Only vetted and sanitized DT fragments are allowed. libxl limits what
guests can inject.

6. Observation:
The feature is enabled per-guest via viommu setting.

Risk:
Guests without viommu may behave differently, potentially causing
confusion, privilege drift, or accidental exposure.

Mitigation:
Ensure downgrade paths are safe. Perform isolation audits in
multi-guest environments to ensure correct behavior.

Performance Impact
------------------

Hardware-managed translations are expected to have minimal overhead.
Emulated vIOMMU may introduce some latency during initialization or
event processing.

Testing
-------

- QEMU-based testing for Stage-1 and nested translation
- Hardware testing on Renesas SMMUv3-enabled ARM systems
- Unit tests for translation accuracy (not yet implemented)

Migration and Compatibility
---------------------------

This feature is optional and disabled by default (viommu="") to ensure
backward compatibility.

References
----------

- Original implementation by Rahul Singh:
  
https://patchwork.kernel.org/project/xen-devel/cover/cover.1669888522.git.rahul.singh@arm.com/
- ARM SMMUv3 architecture documentation
- Existing vIOMMU code in Xen


BR,
Milan



