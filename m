Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E65C14605
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 12:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152082.1482619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDhuz-0007Bk-3a; Tue, 28 Oct 2025 11:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152082.1482619; Tue, 28 Oct 2025 11:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDhuz-00079M-09; Tue, 28 Oct 2025 11:31:13 +0000
Received: by outflank-mailman (input) for mailman id 1152082;
 Tue, 28 Oct 2025 11:31:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pDzw=5F=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vDhux-00079G-WB
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 11:31:12 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99aab60c-b3f1-11f0-9d16-b5c5bf9af7f9;
 Tue, 28 Oct 2025 12:31:11 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SJ2PR03MB7449.namprd03.prod.outlook.com (2603:10b6:a03:558::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Tue, 28 Oct
 2025 11:31:07 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 11:31:07 +0000
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
X-Inumbo-ID: 99aab60c-b3f1-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLB5p2v8aBA12v2U9D2tsFZ/XSD4Hhsd8RLbe5iSnPawbkejYz5Rq6/dFZwoRHrUVmGRr5OJLSE/QAT+K0FBbeiFvFZSM6gF9FZ+tkhbI5d0QgjSAvKFyqF0mN5I2DBmc/lgprd7e7KfrLocPvoTCcTKjZVXaTjsXb7Q39sVc11yt9pfFnezz+X1TfuwGmLOzP4iYJZqlY2eIe5gL1lYiqfs1/il227rDbZbZgszCuP83/g/7ARhW9ZiP7pFiZt+LmDoLVPSbPiy3kQSoTAuENowE8189QiqK7sFdrWeHYaxj05G+FqtZAV6llTe6H8i2LIyckyLBHj0TdKyttTqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYz626zqTaA3grBmEjuJFI5Yw0/PBemhQmTa8z78L90=;
 b=LztNoh08VwsZH4pxpcDNmelT4N9p/e5XXhFsdx7UyIsmAZOb4mDdvr0jAjycqPbj9895SCKrc/ww3JgVHhXMjHZvqlRRmKljJyDnL12HDq20W9dZUKT6/ZTd8ALjMmbRRZdoKhVOZx5L4T0fgAST7Hps2JCIG+HW69FZrGGj1CieIs9haHXy75S5GxCIHHL0/lXa/B1y010ESbqXKNW9xEEPD775h8ibkcv+hy7h4CJqxwf2Bk+wquY4E122rwStN3Z4/D7HUkVv0owKN73lbqvPf4jsPcAWjiYmJ+QV/HsHfvTDzVdQDKHGd6PRP+BPBDi+d3/QfIaw6tY0Cy/UNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYz626zqTaA3grBmEjuJFI5Yw0/PBemhQmTa8z78L90=;
 b=qnVaTIM4Z82aDmfWZp2P8FxB3zUQZNAEjtGyziNsfgoltvXTt3B4iCiG7t+2zfF9jzVfV3Qmb573chZTlHUAabrcljMEyf5//xq0tlpuNeCkJm0UYOQdAdSCT8sEO22CRQCr5JFdYOcRsOgBFVAORaCi9LNUEcFKtAiQ5E9zv1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ad5d59cb-6208-40be-8212-9dbddbe2a8b9@citrix.com>
Date: Tue, 28 Oct 2025 11:31:03 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] x86/ucode: Relax digest check when Entrysign is
 fixed in firmware
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
 <20251027221702.3362552-6-andrew.cooper3@citrix.com>
 <61fcf602-4a4f-4936-a346-a650115e838d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <61fcf602-4a4f-4936-a346-a650115e838d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0101.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::10) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SJ2PR03MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4b5f5e-e66c-48e8-d965-08de16157c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjN2d011Y2I0UVBzaUUycVJSeGg5dDNtcW1ueG5IRG9mRkpjRU5tSWp4dXVt?=
 =?utf-8?B?b2JCTGtQd0hJRWJOdFE1WFFyTWoyaDFRcGZIVEJ1T1lqbExmby9mOGFlUHpS?=
 =?utf-8?B?TTdnQUY4Y0NPbU9RNHRFVFl2b1ZSd1YvdzFUazNUbVIvY2N6SGNHL04zenZL?=
 =?utf-8?B?UFlnZzNLdTduc1BsYWdQWC84Z1Z0YnJqaHEyMzJnNm82cW1XYjBJcS94WVZD?=
 =?utf-8?B?WVJVMGFwSXZ0UUl1aTFxOXhMUE94TDNQbGZvNGx4YzM3Z090bDcvdml4Wkxh?=
 =?utf-8?B?ZmV4UHVBeW54RVBkVWd6VUtLczF5ckgvNE1FVFZibTl3cytWNnA2TVBLUE1j?=
 =?utf-8?B?ZThFZ3djeXpDUnVUK2h1UUtycXV1UndsdjU4YVhROFZyeFYzbFZTYTN3ZlBZ?=
 =?utf-8?B?Z3paY3ZoQU9mTGFkTjhNT3FxZWpWWFlCNkIvNHNpN3cyQmxrSVhLNG9zenM3?=
 =?utf-8?B?TStydHYxVFUrcXhHL01kdWJLaHV5VHNvVDBSWmdHUGUyQTlCYXgxbndKWEZP?=
 =?utf-8?B?UmFrOWsyM2VTb2ZnY0lzUGphOEZVK2tMU1FDM01Tam8reGxTbFk5bGRDcEVB?=
 =?utf-8?B?YlZKSWlWd084QXNsRlp0S3BKbktKQ0gzUUtiQVpGSlBOZWM3WDVpeXFia0sw?=
 =?utf-8?B?Mi9VQlRDN0hxL2lRL1o2Y0FCbTM2aFpRSHNnT0tsRzIzRzhjNTh6S21HZzdG?=
 =?utf-8?B?RWxYSXdDTzVydjhnTVlGS2E1dTF4VVdZWXdWeFZBVVIrZ3BydC9Wczk4b2di?=
 =?utf-8?B?ZE5CNDN5dWZTQjR1TEs2dkxQUFdvRzROdDd4MFZSKzBqVjdTYjZVY1ovaFVq?=
 =?utf-8?B?MEh2aUtZM2tvblV5NHN3TWhSUkl5R045UklvWnF5djlkRDNpY0pKZkNIOG9N?=
 =?utf-8?B?dC9PSUV6eXE1WDlxRDM1c29uSFhJZXNyUGwvVkw3eGpDaGpTeFY0V2tGWlg2?=
 =?utf-8?B?TWxyYlBwM2NtKzNMc2J4enZqUkRENHFyY2Y4dlBYN242dUZSM0t2VTE4QlBh?=
 =?utf-8?B?S0xLWFhPSUxucHJocmNLOWpwTGExZng1aTRWTXN1QVJPNWdQRlV1UjdJT1Q0?=
 =?utf-8?B?L014K2t2MG9GWlB1ck9rRnh6ejRLV2Rpa1ovdUttUkV6T2U0TEQ3WmxDY0ZD?=
 =?utf-8?B?UG1ETGZSNE1lalA4blViUWtaTUFLRGFaSm9GUVJiUnFqdS9IQStWelBUdEJ4?=
 =?utf-8?B?ZG9GL2lGMllLZ2NEa0xEMTVOaERFb1J5dlgyMTQrVXVTd0NmNTZaTG9HL1Ez?=
 =?utf-8?B?cVNiWDNBdi9HRmdhUnlkRWFRS25sa3NWWjk5ekhkRnNkV1FXeGJvOVdVclVI?=
 =?utf-8?B?WDVtL2xwRUpVVGs0dVZTUFRWTmxQVWNwYy94Z0JVYU5valFhUnRJYWhTdXp5?=
 =?utf-8?B?K0RaVDlUY0lNN0w5a1c1emNVRzNBTjhpeDFPTjFNVjluZytKU0QxUWxQSm5a?=
 =?utf-8?B?ZzJNNVJoUDYxNE1UUmNWQXl0eHV1MXUyVnR5cndSSWx5WEUxV25NNDA5Qld2?=
 =?utf-8?B?ZVlhd3pWbWs3d1hNdlc0RjhCdU9sYUEwOU1QdWk0RzZMckI5c3N6eWVuZ1JF?=
 =?utf-8?B?TnBRZndKaDgrK0VsNUtrUzZuVEk5Snk2dzRtRTF2QitnQXhhWG9uNHZ3MVBw?=
 =?utf-8?B?bHM3RG5oU1E5SDM1YjNqa1JkT1RNUnprNm11MWExR0ludnR5QUwrMndoL25o?=
 =?utf-8?B?Mm5zNW1aTmJtSytRQ0V4QzFjdW80S0wrTEpsRFJ3czZwRDF3czNMQnp2WnBl?=
 =?utf-8?B?OEpEVHVtUUtYWFpRVm0vSUorODg3K2wveUc0VzVMVnFkNEIvM1ZCSVdseTJo?=
 =?utf-8?B?MUdVYmkxcEVPVDRXbDBjUTlqUDdraGNxRHRsVk5TQXJXTzJRRnI3RWthVFJa?=
 =?utf-8?B?amxoTUNnUG8wazExM29VODVwYlY2MEVTZTIzeTNVeWwzdUE4dWhrcUtuakRE?=
 =?utf-8?Q?oZFkSt0EbjXLqf1/Na6iOHwfI7ReaGA3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUNjM2NobFh6YWk5MzVIWmxJZGtrVkpVK1dsaW9OTWJHYzExQy9jeHp4UG1r?=
 =?utf-8?B?d29NeGlEM0pwOVVsTTk3dWhmOFcvRDYzZEJoRjQrNGo4RFFCVkg2eXIxc0oz?=
 =?utf-8?B?WGdmS3RnVUZ5dU5tZFJJejJUSWNoK0NPQVhyTjVOQUV2MlZWczc0T0wzL2xx?=
 =?utf-8?B?WEpLMzFQYmhDdzUzdW5hUjlEQ1E4c2c1VEszL2NRNWdvVnhlR2ptMEhZQ1h1?=
 =?utf-8?B?Qk5kaDFsSUhiZmpNYzdndzlCR2VjdVZIWHJSMC9jNFpTWllBM0wrOUw5Q0pa?=
 =?utf-8?B?QU5vVm0vSjFTdXQvaktjTkI1SG1QS2E5NWNBOWRmU3psNkdoQnNUekF1aVc1?=
 =?utf-8?B?bmJ6c2RtbjNsWXFTTlh2VFNvc3dya0hlVHQxVTlXOEY2ZENNcXljUm10UlU5?=
 =?utf-8?B?QWwxZ2U5a285UVQwN1pHTGFNNm9mdC9IY1I5UlBMcjlqYlVZK1JTWXlwRkZZ?=
 =?utf-8?B?Y2o1aVFKUTJGcjNGN2U2bjhZTDdUYkN2cXRmY1ZpRVlKVG5aemlCYy9ZaEdn?=
 =?utf-8?B?Z3B1YnpvWmpWcDZCM3JqdFNnUFZhMnBFKzhheUFqc05CUXdTMXozOUhGek0r?=
 =?utf-8?B?SzA0dFZNWk1kZmRLbVRPK0g1Tmg4bXVEcDVRZ2ZGNFhkKzVHb2llRUczRnIy?=
 =?utf-8?B?U0lUWC8xWnkrK2V0c1ZXaUQ1VkpXVEpDUTV5WWRQMnNnRzhaZTlwRHUyWmZD?=
 =?utf-8?B?R0JvWFdvNmI3UFlIUStrYTZNaFhtTVZNSElGNjBxL1hTLytodUR2MDFySW5p?=
 =?utf-8?B?Zy9FTlBwdFB1YzYvZmx1UjJGNzl1dTB4eEJyaUZsOTZwZjZqSmk4ZkFTTSth?=
 =?utf-8?B?V3dPUmdGbUQwOFdOMDUybjFNeFFIUTR0bU5XZC9uYVd0OTc2eEZveXdNK2dy?=
 =?utf-8?B?R0U5elp6a2ViemkzYk45YXlWOTV2eTgycld6WEFVcE1kWkVKRXg1RW96Y0g5?=
 =?utf-8?B?V1hLK1J6NFRnS0U3SDJKMEkzaTJudGpodWlPbjdydmVObENIQlh6ckVvdU9y?=
 =?utf-8?B?SnFFdHZBVVhJSmY5eUQrNUlCMERWb3hBQkRFUDViS04rT2NpWnF4QUJMSzNM?=
 =?utf-8?B?U3BTT2dkaVBKSUlNOXQ3bU12c3djVkdyY1daOXM5UEZDbHoremtWYnVhNmNK?=
 =?utf-8?B?UWl3NGZVMWN2MUFqbDVlZVJCeW5aTmIyV21TUVQxbjViS0dFaVRnYTBKMUR5?=
 =?utf-8?B?RUpmdG0yOW9GNU54b1ltYUdTL3hYTnBTK2doY0ZHUlBoYzE2VzB4ZTQxdy9C?=
 =?utf-8?B?QkRlVm9VOW1sZW5uVEJOODU4YzMveHJxMkVFeEVWcDc4ZDdLNk1uYXR5bmtv?=
 =?utf-8?B?VzVtNndJN2VlWHlZeFpHL0IyQW9Uck9hWHBwS05JNTAvekVxWE95aFhlOWg3?=
 =?utf-8?B?YzNOR2RBb2tEU0NISE9RM2s1QzhrWk1vbFU5K3NWcUJNcW16RVZ5UzJIUFhQ?=
 =?utf-8?B?MXorekNUZ1YxY3NmbkNZUmYvdFpEc2xrMlIxa1JlZlpybjNWSVRWTVhmSUVE?=
 =?utf-8?B?d3phdEFxRXdqM1pvSkZERVFndkhUcTE2WE5RVE54bHg4ZEQva0tlR3F0T3Vv?=
 =?utf-8?B?azc1aGRMWThSWXlDUUpTTFVONkdqZkZrZmo3KzN0dGlkc09FWDd5OUYyZVRJ?=
 =?utf-8?B?cW1yS0Q2RmtNQVUvanhFVjFhVlJxSU9ZSjA1UGJTOThKdGE1SWk4b2Evd2Fq?=
 =?utf-8?B?SCtNWnppSEdpNkJtaytYeUtZNk1mYlBDeTVJektwMHB0Tyt3cGJIREtudEMw?=
 =?utf-8?B?d0pXejFXZXlRekt3WE9JV1F1REEyU0tEK3Fuck9sUTN6c0xhU1Q0aEQxdXZX?=
 =?utf-8?B?OFlQYzdLYjcyZ2NVWlpTRmx5Zm1iOXRvK051bjBCMlhHT1dXdlJlMi8zVkxU?=
 =?utf-8?B?b0VnckViSit4K1B5QzQ2V1I5cUtDbVpseVdKNDdpNzV6d1A4TGNVU3pvTzBz?=
 =?utf-8?B?V2VDN3kwTEpYSVpHVTdmN2t3M1ZnVk9ZWWxCc0J4Y1J2b29GT3huZDJjRStR?=
 =?utf-8?B?MHI0Qm1ZczB6U2FlOXNpZmRJNGI0QW1JL3QyNDBTYzVoTi9vNnd4UkZwb3N0?=
 =?utf-8?B?SEJ1Z1dUVlF3MWdTY0JheTk3UmM5RTFSY0ppZVNEazlZalU0RGswL1lTT3Zp?=
 =?utf-8?B?cVduU2k1SGxySDZMWG5uZ3E5QjVqY1NrbTMvKy9OTjhLVThJUCtWRlFPWDNa?=
 =?utf-8?B?eEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4b5f5e-e66c-48e8-d965-08de16157c33
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:31:06.9166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDAu8X3FmNuy9j9GLYM8NK4YMl6LrcRVFcUy/MLvLNwlqVZGczY+EZqMFo0b+y1wf7VIQERgDE/tjSDuFZLGGp2lpTWv80BgmKMAeZic/j8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7449

On 28/10/2025 9:47 am, Jan Beulich wrote:
> On 27.10.2025 23:17, Andrew Cooper wrote:
>> When Entrysign has been mitigated in firwmare, it is believed to be safe to
>> rely on the CPU patchloader again.  This avoids us needing to maintain the
>> digest table for all new microcode indefinitely.
>>
>> Relax the digest check when firmware looks to be up to date, and leave behind
>> a clear message when not.
>>
>> This is best-effort only.  If a malicious microcode has been loaded prior to
>> Xen running, then all bets are off.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Like for patch 4, adjustments for Zen6 are then going to be needed here too,
> aiui. May be worth repeating that statement here.

Ok.

>
>> @@ -603,3 +604,82 @@ static void __init __constructor test_digests_sorted(void)
>>      }
>>  }
>>  #endif /* CONFIG_SELF_TESTS */
>> +
>> +/*
>> + * The Entrysign vulnerability affects all Zen1 thru Zen5 CPUs.  Firmware
>> + * fixes were produced from Nov 2024.  Zen3 thru Zen5 can continue to take
>> + * OS-loadable microcode updates using a new signature scheme, as long as
>> + * firmware has been updated first.
>> + */
>> +void __init amd_check_entrysign(void)
>> +{
>> +    unsigned int curr_rev;
>> +    uint8_t fixed_rev;
>> +
>> +    if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||
> Given the function name, might this check better live at the call site?

Possibly, but I really don't want to split the vendor check away from
the family ranges.

A family check without a vendor check in eyeshot is
suspicious-going-on-buggy, and this is called once at init.

>
>> +         boot_cpu_data.family < 0x17 ||
>> +         boot_cpu_data.family > 0x1a )
>> +        return;
>> +
>> +    /*
>> +     * Table taken from Linux, which is the only known source of information
>> +     * about client revisions.  Note, Linux expresses "last-vulnerable-rev"
>> +     * while Xen wants "first-fixed-rev".
>> +     */
>> +    curr_rev = this_cpu(cpu_sig).rev;
>> +    switch ( curr_rev >> 8 )
>> +    {
>> +    case 0x080012: fixed_rev = 0x78; break;
>> +    case 0x080082: fixed_rev = 0x10; break;
>> +    case 0x083010: fixed_rev = 0x7d; break;
>> +    case 0x086001: fixed_rev = 0x0f; break;
>> +    case 0x086081: fixed_rev = 0x09; break;
>> +    case 0x087010: fixed_rev = 0x35; break;
>> +    case 0x08a000: fixed_rev = 0x0b; break;
>> +    case 0x0a0010: fixed_rev = 0x7b; break;
>> +    case 0x0a0011: fixed_rev = 0xdb; break;
>> +    case 0x0a0012: fixed_rev = 0x44; break;
>> +    case 0x0a0082: fixed_rev = 0x0f; break;
>> +    case 0x0a1011: fixed_rev = 0x54; break;
>> +    case 0x0a1012: fixed_rev = 0x4f; break;
>> +    case 0x0a1081: fixed_rev = 0x0a; break;
>> +    case 0x0a2010: fixed_rev = 0x30; break;
>> +    case 0x0a2012: fixed_rev = 0x13; break;
>> +    case 0x0a4041: fixed_rev = 0x0a; break;
>> +    case 0x0a5000: fixed_rev = 0x14; break;
>> +    case 0x0a6012: fixed_rev = 0x0b; break;
>> +    case 0x0a7041: fixed_rev = 0x0a; break;
>> +    case 0x0a7052: fixed_rev = 0x09; break;
>> +    case 0x0a7080: fixed_rev = 0x0a; break;
>> +    case 0x0a70c0: fixed_rev = 0x0a; break;
>> +    case 0x0aa001: fixed_rev = 0x17; break;
>> +    case 0x0aa002: fixed_rev = 0x19; break;
>> +    case 0x0b0021: fixed_rev = 0x47; break;
>> +    case 0x0b1010: fixed_rev = 0x47; break;
>> +    case 0x0b2040: fixed_rev = 0x32; break;
>> +    case 0x0b4040: fixed_rev = 0x32; break;
>> +    case 0x0b6000: fixed_rev = 0x32; break;
>> +    case 0x0b7000: fixed_rev = 0x32; break;
> Acked-by: Jan Beulich <jbeulich@suse.com>
> (after cross checking with up-to-date Linux, i.e. including your recent
> correction there)

Thanks.

~Andrew

