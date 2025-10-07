Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C124CBC069B
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 08:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138495.1474176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61bL-0001na-Ep; Tue, 07 Oct 2025 06:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138495.1474176; Tue, 07 Oct 2025 06:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61bL-0001lj-Ag; Tue, 07 Oct 2025 06:55:11 +0000
Received: by outflank-mailman (input) for mailman id 1138495;
 Tue, 07 Oct 2025 06:55:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v61bJ-0001ld-VS
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 06:55:10 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ccdbb17-a34a-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 08:55:04 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS0PR03MB7289.namprd03.prod.outlook.com (2603:10b6:8:120::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 06:54:56 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 06:54:56 +0000
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
X-Inumbo-ID: 8ccdbb17-a34a-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i58FI5bWjHFhruG9fJmHjXib2Q7vrvA40x8qAMe2NKrwjAO8FnZzWI//GkEHUgJ8yfUj1n3qOVMSs9s4tye0lr9qHwKcIAxB/73WS5d5Md4Fmw9jSsE0ihx4nlKuyYZwx+VwTSm+orSn7ss9IzyfEvNYlJy4MXRBZhqsyQbjJblKfF07fjmAUR8gokzX+sWb8wYgXXgewxTuRBGoCZLPktr/T4HL+2sgvHFUiNv+Lg0f2HBTK1JqsABTDbTFjA4n6bNwiABVrnJHCJK64hSiMjV2jvYjO/nIGyx1NvYF4lez2XBu0WSeM49hy4JGbO2ZQHObJR/YdcCFG8ebsbUJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6lduNxCGa+K6AvXUwITJ+IlBFencZYAk2Offe9aVy4=;
 b=IW8w7uxQ1VbGMRps7Ps2y01Pa07733uloDlzx4jHlI2TSfVMT/TnR6DUqTE+sbqanbMQl2Li2I1NanKFeTrqQsulneWj7DWG6sWqOsp+A13psSA+dA9TTmZeyHoVyceD3mC7m6RpEwoKdGZPlX8GCKqWy/ImePZAaLaddKceUxR8XizcAA/VT0YpoIUPqTO9JMp/1NidW7RgM4zhik33QAngm7fBLBoktOJj2zmKtEyTci4Tt7PHFiQH7xD/6uT1TP8sntKEzl6dIL94JE8U+igp4vllKYB/h+hi95gYLnzPflMXduy9o3im+w/brKlhyKDVNUhYpSmR1cPifxh0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6lduNxCGa+K6AvXUwITJ+IlBFencZYAk2Offe9aVy4=;
 b=KstbefS66ybxK8MILsz3C8q20K3dEzxRY5ScRxj4ga1CI+996Jq4dy7GwkDDXVfb66VlvFn5i00zBF+stzFtId5RvE1zCjvxRkexzI4EF0VgvrUVyuMPubehgU/LIDTqL4mQifnOkQsG1IefGCgDfkdOdjTw3Au5PXDx+7SBZwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 7 Oct 2025 08:54:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] Update Xen version to 4.21.0-rc1
Message-ID: <aOS5O2h767J1QPxs@Mac.lan>
References: <20251006200840.2171113-1-andrew.cooper3@citrix.com>
 <20251006200840.2171113-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251006200840.2171113-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MA3P292CA0015.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::11) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS0PR03MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f26f16-0006-42e0-5940-08de056e6c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVdwRTh1Y3NNODRLYW9adHo5TGlHaGxxblVxOURBaVlYRHMwZFVnblJwWHhP?=
 =?utf-8?B?RlBLYm42M2owQ0JyVVNPUEdrd3Y3Skw5MkpndXQ2VHp1cmRqbXN3cDNaVmlq?=
 =?utf-8?B?MkQrRG8zdjVrSGNOUmFicXFmclJFdUdDdVoxenFxMU5YcDBBM3hLNk5GWnY3?=
 =?utf-8?B?a2dwLzZidEZoWGI5RHJsMFV2VlIxUy9PamtNSXZWZERsVXNPNi9aajYrZGxr?=
 =?utf-8?B?eW0wK0krMjM0bUliVFlWOXkxQ00vajhvbjc4L3A3aTA4RjJnWVUwdm04Q05J?=
 =?utf-8?B?OWZ2aDBLcXh1Qkl0YVhnRFRqWURlODdnU0lCYWQ5NkxqUkhmS3U5b3Q5dVJR?=
 =?utf-8?B?SUFXd1IvZDAvZmI5Z0R6cS92SlE0SG9WT2s1UjdKeDdYT2hxbzEyd0o1OFVG?=
 =?utf-8?B?YStMdnlKSmoyYTAybC9ZMGNob1pLbm9xSjZReGtzRlFBRVJmZ2FzdjZYclFY?=
 =?utf-8?B?cVFtbjgyeUxDRUVNQkFtQnI3Y2lvYUtybGNmd1N4S3RNU1RuTnV5QmtDTDRw?=
 =?utf-8?B?T0J5K1pQeEx4KzdpYVMwV3MrS3YxL2NFcU12MU41RjZqTmhwWjlxZ1A4NzRY?=
 =?utf-8?B?MHFoSElzd1FyQVp2MnNYR2ZlVWg2VExFSnJPcEpYdGh4azZXbDljQ3hxRTdv?=
 =?utf-8?B?T0NVSktLeUJWVHFXSGdqRVdpMExMZ3lqSHY5UG5oc0U0RE9hOEVQVUxnSmZp?=
 =?utf-8?B?WUdmbFlTMm9idnJ4MWE4ZGhVY2dUdTkwcWkyMmNJVUg2QVB5Y0t1NWtSOHdI?=
 =?utf-8?B?UGx4eGJYdHVXSnRiL2pkc0RIOWg5V3lsY3FlcmVXTHlSNlVORWZSeEY1ZGlo?=
 =?utf-8?B?cWVCbFA0R1l0Rk5iQUhVQk5OTmg3YjliNWw1VUVJQ1VCYkxQWHhKM0RTWG9E?=
 =?utf-8?B?UUV6U2lhVXdBMWN6dFdFUmJ5dGduald1UlJQRWE3VytndElYZjJvODlTczNL?=
 =?utf-8?B?Y0Z2bXdya3pzRXlUbTJjc21VRDBYSlRZTGhoOEJrTEV1VEFQVWprdldxUFhv?=
 =?utf-8?B?ZVJ1VTlWZHpOVmNIUWRZK2hicjhxMGkzNDNQSS85QTBYRXZ4eE9YUkpjTlZM?=
 =?utf-8?B?eXFRMW14eGJxcFYzbFRBQjdKdEowMXNxd2V3eXdZV3h2YU5GNE1uTGZ1ZHdo?=
 =?utf-8?B?STluZktSUXpNWExjSnlnUitUdkdveFBscENYNm96OFQ0dlJHR1IzcGx5dlM4?=
 =?utf-8?B?Rm5senlBQXdldEhIY2ZudlZLZWNMdFZsb2lXT1RTd2tEcjJsWndBOFV6WDVX?=
 =?utf-8?B?cFZvTS9KQndIWWp4WjZ0ZUhZVkZzeDlrcFJyT2VOV2lRRS9veVJNQkovb3FC?=
 =?utf-8?B?aW9jZHE3ZjV2MlhIU0VCVGlGK05mNU1LOGh6dmg2M1BvVGw4M2dKOU12Z050?=
 =?utf-8?B?cUl1Q0lMUG0zSis1bk9WYjNSK1IwMzBZdllpQkVsZWJSa25jL1FjWm1nSEdJ?=
 =?utf-8?B?dVBCc2FuNUd6RndTK3NCRlY4YUNjTnJ6TGRIQzRCTGwzYnJsUHJLbU9va0x3?=
 =?utf-8?B?bVBETXVKRlA0YnhrMHB6RkxMeDk4SHBnTENrdEJnSGsyZEgrd1NOdFg5aFhy?=
 =?utf-8?B?TDh3OG1SY3oxQlVKMTRXSVQ4RGxJSjRROVFyR3NtRHRzSUUzZVpDT2ZqL01t?=
 =?utf-8?B?WHZKOGpoa3ZSMzlRT01RSlZVQ2ZtRFROYmxORzlWWUdiS2JiM2dyR3VUMVpG?=
 =?utf-8?B?Rkp6RDltR0xrdGIwVThyN1JEaTQwczI1QWFMQk9mNlBrekFtNW9RTk43ODcr?=
 =?utf-8?B?Y3B0VjhXOUNRQVp6Q2F1NXZqYTlQMUdjLzRDVXh2amNyT3hReU1jWm5Ta0tD?=
 =?utf-8?B?Snl3VUxCcUlYVXJaa0ttWCtDT0N6ak9aQ1BoNVB2NnZJdi9YeFUwOXZOMFkz?=
 =?utf-8?B?VXRzL1VleXdSOWNXTHVFU05Rak9pQzB6MjhCZnJ6aFpkV24rNUtseThwYlZ5?=
 =?utf-8?Q?DvYA+M2yj99KWb4y8gtVo491PT+LMsEo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjhQUjdsd0dJSXNxWElEK2NRcnE2ZlhPVVpEbkFsMStMN0pLYnpqT3k4Yll6?=
 =?utf-8?B?OEhzcW92emcwRDNuZloyUFBPaHNYM3JlOVF0MGJ2ZEhyZncyZnhBaEJ5UkF5?=
 =?utf-8?B?d1pyWldhY2RxNFVPb1dHSG44aVRCVDJIWTM5M2k2R1Jzd21mcWMrZ2g2N29o?=
 =?utf-8?B?b29YM2x3VHF0Q1Y3am1oZ08vZTBzNTNodjB6RjJYYkpVZnNXeTBGNFlJUWc0?=
 =?utf-8?B?Q0M3OXBGVVQrU2U5YVlKdlJ6aGVwRVJaRGJYRUJFekZYdXlIY01pZzAwdXRo?=
 =?utf-8?B?YjJtMGczY2RzaW9MMDQ1YWFpVEM3OTgrVjNiWGZuT3dsUmxmTklhbjlqaVIz?=
 =?utf-8?B?UjdxUExvd3VPN0lGeEpqaEttVC8yOVpYOHEyOER4cllNQzV3T2VYa0FnTnZE?=
 =?utf-8?B?WWhpWG5obXJ2NGNRYkZLb0V0d1RTSm1GM3BOWWVEV3N1dlNDOVVadmNvVy9X?=
 =?utf-8?B?U2Y4MVh4cnFPV1BuNktjQVdzQnZyWGY1QlFPL2ZsckVRSmVNZjVkcjJvOGZs?=
 =?utf-8?B?L2o1SlpxNlJvcFVNbG1UK1gyRFN6dTdWU0p4L1lwODFDbExrL2JhSXVZQ3J4?=
 =?utf-8?B?dTdTbUlBQXpUdEcyVUk5L3NMQ29BaFZrYi8rMkRvL1VPcUdVR2NpYkFkdFFx?=
 =?utf-8?B?VEhEL2tTRVBjcDk3aEFnYW5EL3hHc1FiWnMrOHUwT2V5ekRnWkh0S05rcEs2?=
 =?utf-8?B?OVZEcXhxcjZpVmlaQTZOSUY4R3psa3NMdzV6QlBHa09DVVVUZmJCaFR0aFRQ?=
 =?utf-8?B?YzZibkNvWC9lMWFscHdYbXQ3ekwyWnpRWW1iRUp1cWlKdEk1SlB6c3FKVHdr?=
 =?utf-8?B?VXRSMGFKaXVQYzg0NUx3UzBEVTc2NUtjTjJZTTNTeEd6UHBtbHQ4NU9CcjZt?=
 =?utf-8?B?KzNQWjlaWmh3eWhWZjlWVUE4SUlPZjBjYWNWdkNRYW5HQVBnNTF1bGREU3dC?=
 =?utf-8?B?OFdMSFRGSzJGSG53N2VNY0FocFpnQXB1QlBtUlYxNWFXTU1CVHNFa0MvYzZU?=
 =?utf-8?B?UVBiWExSVjljUTYzQzFmQXJHNS9GdFJPRHpKYWIzd1FrNzJCV1lNRXRSNFlB?=
 =?utf-8?B?MkljT1pNTWdhTkYrWm4zNG9BK0Q0bE03TUo1dzRqNDQzUjJsWUljUlJ0K0Vp?=
 =?utf-8?B?cnJzT2pMUTh1WUlsaU5oTDFKQXhnd2RMaVpONmpqNmF5MWMzTVhVaHQ2MUk5?=
 =?utf-8?B?TlJ6THNUTEQrdjg0OUQwMzQ2cDhPaE9BZ0g4L29zNTMzaHl4SW84bmVieW5M?=
 =?utf-8?B?Ykg0SW9YVU4wa3VVZXZNSjVWMEs5d0ltR2pMRE14OUEzQm92NnFvcDZxWkNh?=
 =?utf-8?B?K29NNEhNWk9PbW1IRzJEaElzNzdCS2NhcEJ0WFc0cGRRWDk5bVhaZncxUGYz?=
 =?utf-8?B?emMxaTJNNU50dWtEc0w3bmZkcnVsdTVlc1VTS29sVS9pWTRxMlRmbFJaS0NM?=
 =?utf-8?B?eGtJWE9ka1JaRUVCczhFU1MvVlQzUWw4emJGNFNSbVZBV0JzcDJ2a3BZUDVi?=
 =?utf-8?B?NURNMEJjUVFuQ2UrNUJNaEtuekxpS2pVZWR2c2hVMS9tMW9ZRTV2UjRTblFs?=
 =?utf-8?B?SVA0L0w1ZDFSUFdTNS9hTkZMYmp5aSttSThqTmw5NFRWZlRHTnlDeC93Vm9p?=
 =?utf-8?B?V3VueWxHOWtxRWtyWDFKY2tjTm5GdHNPUUZUWHg4cTRSNWN1THkxaHN6MGd1?=
 =?utf-8?B?NURDZ1o4Z2c5U0Z4VnNycXBVZXVXMStwenM3cjdiZVozU1BOTWJ1SjhaTVZ0?=
 =?utf-8?B?Q1BMdVMwOTJtd1VPazk5Z2NUbUxqMnNQODgrSmJqZUZJY3g0SDBPSkRIenZE?=
 =?utf-8?B?cUdWOU1ZRm45VEZ0Ym00d2NQYUY5STcrd2VtWUtCZWVnQ1MvcDNqQk1tVkZk?=
 =?utf-8?B?Tm9RWVowRWwyQVQzU2Rmdk9pZTVOSDU2MC9SZWxwcEJhQmFHTWtFTVJmOTZT?=
 =?utf-8?B?dDVqclpYaXloekFCRWtJRjhOclNLeFZPSGtrTEJYWlo0YzA4QVAxTTV1ZGNZ?=
 =?utf-8?B?b1ovZndvOFFhc0VLclVMUzN2QVRaQ1hXMHAwMGpMcmR0VXZJRngrRmorUFJB?=
 =?utf-8?B?cWZJVmR3NXZ6OWswT3ozeGtPSDNlY2NnTmlQdkpsTDc4Ulhrdmsva2tsVmJp?=
 =?utf-8?Q?cqDCzV7xHFmGhtJH9OnuKQZ1c?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f26f16-0006-42e0-5940-08de056e6c6a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 06:54:56.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Awn+sdD9jf6xcMTkCj4xDSuMUhqwT8jdw+3NQkwavHSinVK+9N524U5xkzI9OeQPsTd1Ph0nfI2zTekWsI9tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7289

On Mon, Oct 06, 2025 at 09:08:40PM +0100, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  README       | 10 +++++-----
>  SUPPORT.md   |  2 +-
>  xen/Makefile |  2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/README b/README
> index 9329f30e1366..eaee78bd7375 100644
> --- a/README
> +++ b/README
> @@ -1,9 +1,9 @@
>  ############################################################
> -__  __                                _        _     _
> -\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
> - \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
> - /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
> -/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
> + __  __            _  _    ____  _
> + \ \/ /___ _ __   | || |  |___ \/ |   _ __ ___
> +  \  // _ \ '_ \  | || |_   __) | |__| '__/ __|
> +  /  \  __/ | | | |__   _| / __/| |__| | | (__
> + /_/\_\___|_| |_|    |_|(_)_____|_|  |_|  \___|
>  
>  ############################################################
>  
> diff --git a/SUPPORT.md b/SUPPORT.md
> index eb44ee85fd12..491f9ecd1bbb 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
>  
>  # Release Support
>  
> -    Xen-Version: 4.21-unstable
> +    Xen-Version: 4.21-rc
>      Initial-Release: n/a
>      Supported-Until: TBD
>      Security-Support-Until: Unreleased - not yet security-supported
> diff --git a/xen/Makefile b/xen/Makefile
> index 49da79e10fb4..ba8c7147a2f6 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
>  # All other places this is stored (eg. compile.h) should be autogenerated.
>  export XEN_VERSION       = 4
>  export XEN_SUBVERSION    = 21
> -export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
> +export XEN_EXTRAVERSION ?= .0-rc1$(XEN_VENDORVERSION)

In previous switches to start cutting RC's we didn't add the 1 to the
XEN_EXTRAVERSION, see 19730dbb3fd8078743d5196bd7fc32f3765557ad for
example.  If we do add the rc number we need to remember to bump it
each time and RC is released.

Thanks, Roger.

