Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4C0CA322C
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 11:03:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177493.1501765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR6Ab-0000t4-6l; Thu, 04 Dec 2025 10:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177493.1501765; Thu, 04 Dec 2025 10:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR6Ab-0000q8-2u; Thu, 04 Dec 2025 10:02:41 +0000
Received: by outflank-mailman (input) for mailman id 1177493;
 Thu, 04 Dec 2025 10:02:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TdJQ=6K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vR6AZ-0000q2-Fx
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 10:02:39 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ae17e8e-d0f8-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 11:02:35 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7854.namprd03.prod.outlook.com (2603:10b6:806:433::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 10:02:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 10:02:30 +0000
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
X-Inumbo-ID: 5ae17e8e-d0f8-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WK5zaLch4mwK5Lvn8pl1sZSFcVcG8Y9oBZwZVFvsop8d5T7hiLV3mb/1rE2A0Js5mbrECOCXKG43sfvbbjYCC48ytE59VNas0W47hq+wRS0RxB2iFrWuwsMq1ZhQZdNO6WX4hhX9G+H4xOJxPsXYRmW/6y9jOvHTVZjQloAjrJdCWEQF+6Xxtz00aZ5wqnXVTOq8dWoZw79B4Rg2QS0VB0CwzRZxpsjEKjcAtj9yK8dUXoumAWbRRwkZUD4ZsGmjMtYbIap0+d6qOqZb/cwRB9xYs7tPGwfnrmgVI7tSccZDZ6uqg5I0eujVUwS+8tLwqRfE5SjTzAy8lB7PtutQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCweXumEBpQ1J8/fMoYiqHa55RBu7WSdw1mOHcoC2xw=;
 b=BIKioVY5xbYiEpKn/VU64l1Gh5bXqiO4A+ohodYC83LNLdG9lbB1pCAPjLkkyGLYAvbLdXHPYiXWKcG5s9sSJ4CMtMJfJkeKVV01t6DVICGWpmMlQw9FUrEzWTy0i18HCc+cpd097Seiy0eUAnQPIVZCXGQEVPG6TeY132Y7mECpxiJPHJORSyN/nkLBQS2rsybyGXctwKj3EITLM/uBXp0Zjlf7RQobPriN+zcjXRz+mgXLyA8b1/znJfATwwH+1jfdjYaRsNmHr3npSHACZ6VxEZ3QEZdJ2w8UIoV+5E2HRiQq5FlZUD7ZgF4MIAG30A8g8R7TUry2bXW+8C/SAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCweXumEBpQ1J8/fMoYiqHa55RBu7WSdw1mOHcoC2xw=;
 b=x9OPoak4w/J9S9irLy4JtZnI8xKi+BjC7g9oXAFPSpbGENiKfcfdkXBcQjlAG9lY6mAwqdLDqxH5PBH5CRzaCPkK8Y5t6YVOwHaJLcuK7AIE1I9uuYEjQZYrnWUXbFiHggjTadccvSN/qXuMEFtdEsp7nHAGbBxkt872qkyPg94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d477a21c-b621-46bb-94ce-4775b2b6a90e@citrix.com>
Date: Thu, 4 Dec 2025 10:02:26 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>
Subject: Re: [XEN][PATCH] coverage: add extended coverage capabilities
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251203222436.660044-1-grygorii_strashko@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251203222436.660044-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 9152e1f9-3b94-4d39-65c3-08de331c3c96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0pFcjhmZE9UMTJHTm52aUlhazEvMVBOcGFqa1ZQL1R5Q3krSmNyVDBKeEhr?=
 =?utf-8?B?S2RuUkhFMFE5NHBWeHpQRVlMN1lPZDlraWF5SndRSXozSWtLd2tML0VkdUEy?=
 =?utf-8?B?UkxDTTBCM1hQZWFmdmxaSDNTWnVib3o5U2hCeGM4T0xLdjE2L0hLUjFwWlV2?=
 =?utf-8?B?QWV0NVlpSkVXSitCb09EamZMUG43ckdoS2tDVVI5YVJIUEZocGZYRStwVXZw?=
 =?utf-8?B?UGhxUDZsNXNvQ3R4aVI0bmlwRFJYNy9XUDVqZkdkS1QrMXNsUGpnMmNQQXlF?=
 =?utf-8?B?bWZmVHYxZDNzWXkrTFUwOThodVJSRWFMYnpVRmdlc3RTRExMbFlnRHFZcFBP?=
 =?utf-8?B?YVkrRXdkaWJRc0FENG01bGdyMWRmbU9rY0ZTblFNK1NtZFhDTWthVHZxemJK?=
 =?utf-8?B?TkoxS0IzZ210TW1IVkdtMWRoSzZ1dUFBVmNPR3Y2UmNXT1F5cVZSSisySk5y?=
 =?utf-8?B?NkNJcTZhZXBHOXhES1gwQWdFNTVoTDd3L0dqTzBGYnVhUjgzRjJJSXlFNHJB?=
 =?utf-8?B?T0tqQ1RnNk4zZWpvNC9WK0xUUU8xMUowVEZ4d29HSUdJQStMMDYxWWdNME4v?=
 =?utf-8?B?YlBEdHRpQWpDRWJGN2tyQUhFNEhSVklQR1dkTFJkTUh3Z2JOTlcwQXFnSllL?=
 =?utf-8?B?SVlwd3loNGovd1RIWWhTMzlmUDZnYk1TVitXeTJZb0JaRWpNQzBjUEhJUVNW?=
 =?utf-8?B?MzRQRnhWalJqRmJ1cTc5RHJPcGNtY21scUNZUlpBTlRqaU5XRDJSRGQ0OGFE?=
 =?utf-8?B?a2xBYnErZWkrdS93UnZQVFlxR2VCeU51WWk1U2trVngwMGxIeGFCUHZkSkJI?=
 =?utf-8?B?WE0vTWdaME9oa0UyK1lyZitMd2tRTHVFdVUrMzVRdWpQbW1DT1llcGJIalRC?=
 =?utf-8?B?WFBMcU16eHFBMmVXM3RFbE9IUkhUcERCa0lTaDd2UGhKVXdxSHZuazBiREkx?=
 =?utf-8?B?bk5GSDB2VTZESmVhWC9ubVdtTHVRanVYMnNYa3BtVld1S284czZ3TzhhUExz?=
 =?utf-8?B?WlNOVlJrWi9PVThWWGF5U0ZNbVQ4OUluTEsrenltdjd4WWxhSlNGR2EreVZK?=
 =?utf-8?B?QzZvY1hSTWJrcnNSampDQlhlYUNMeitPM0pmdnBXbmxJOFpnek0xVnMxVHBO?=
 =?utf-8?B?aEhyMGhFNWE3bmgxZ1p3MXM2dituMTluUy9QOFh6Z1JrMCtuK1ZDRXhGd0tq?=
 =?utf-8?B?UmFhVWZ4bXFHK3JIdUZMZHJVZVFTZ1VTbTkwcWc2Q0czb0s5UTh1aGlMeG5L?=
 =?utf-8?B?Q1JnTVhjUytsN1BkdEJFeHNST1lpa0hobVNLVVZkZWNYMCtBSTNHMDdHdUtk?=
 =?utf-8?B?VnpIYjN2ZS9OTk1WRzRyU2ZlL3JvWWlYK3RnVWVadHhNZHhhUk9HYjE5S0dl?=
 =?utf-8?B?UjNPeWszK2NtMEliZVFyWVZZamZTT3hhWmltMGF3cmQwUXJQdENMZmZBSXlv?=
 =?utf-8?B?SVdJZFdmbTMrOGpNR3IwdTc4blhaMDU2d3pVNTE5eDBxdmlLRkFldFJ1OWlP?=
 =?utf-8?B?QnBKVEZhL3FxMjdvRlMvSGNBNW9MeDF4dnpkZVFYVzN5NFBZN2preDZLMmVz?=
 =?utf-8?B?cFFhVlV4Qk1lYzBycW0yN0NPOThYOSsxVEhVaUJIcUlSbEJsWC8xa1VZUng0?=
 =?utf-8?B?WUFBMUI0bzVwN1NQVEw2S0dPWXoweWdDOEYzUmRKaThKUHFJbGNPRlI3QTVm?=
 =?utf-8?B?YkFlTTZ0WHdhZk9vT3hjVU5JNDFTQ29Mb3lzK0VzMXRjWmUzWlU2MGtsRk5t?=
 =?utf-8?B?aEhzS1F1RllwZ01xbjJIVm9YQnIrRkpuTDlOck5CdUlEYUkxekI5WmhWdXFi?=
 =?utf-8?B?cmlZZUJPSmJ4V1FZbjVIa1YxN0xSaVJwbGQ2d2p4dEVRRE5PQTM3ckJkOS82?=
 =?utf-8?B?SHVjSkFwMXRiSndQV0x1dE5zRWJ2bVZmSkhJWkdsR2dtQlE2bis0WUc1TVF3?=
 =?utf-8?Q?nF41+PDrAQHPLc1LeXF+tftf3KlPjQ7V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VklxVFNGRHpqYnZTaGtYdXJES09YQ2wveEZJTkNzaXFIWDFtRnoxc0h2NGJV?=
 =?utf-8?B?UFRQclMremh3VzlBZnhOSGt3NkEra0x0TWVPNXdNQzRUSWFDK1Q4aTdYR2ZP?=
 =?utf-8?B?QUhhT1pJT2preUtPc09vb012cGJJRkRrZ1VaUkl2YUNUQVJ2SmU4YVFnVk1O?=
 =?utf-8?B?dHNPdC9SeXpxVGxiYisxNmRTVEVIOVRPdnZWenhScGpsanFCVHA1Ry8rc1hM?=
 =?utf-8?B?MzZNbWVmK1FuY1hwQ0swME1Ib0dPTlVodENZc1FpSUpsNVY5aEFNWTBkOC9Q?=
 =?utf-8?B?dXRVcSsrSHkrQjVZemRDYk5lem9rbzVXMTlxV3JIdGFSWUtPaFZYYzNkVXVj?=
 =?utf-8?B?UWpjL0hmamxZcUxGNktNY1ZwZFFBYWpxWTBRU0RudVFiWGI2a1krZVR6Qy9L?=
 =?utf-8?B?UVc0amFidGVYWDhRUVdDVTdROG40eHhvQ2RKd0JPZWRBZllVRzdROU9MQ1py?=
 =?utf-8?B?RFFRbFU5V0NrZGZTTkk5QTl6NUNHT1NFV09qVzlFbXpJa0tXS2thMGhZNVBk?=
 =?utf-8?B?N2V4aWtpamt4cFRjY2t6UUFZeG9ZR2pKV0V2dzd4dTNJVGZZQzRKanBlM015?=
 =?utf-8?B?c0pPQlNESHl2UDNldC9OWVQwTnQyZWtmUXBCTnBjUyt4aExhRDYzWTh2amt1?=
 =?utf-8?B?QmJUS0NaM3BVc0E2S25ZUkpWc2RvNmhvUGkwVXFNdUR3MDBoS1RJQ3BmWFRh?=
 =?utf-8?B?WkhqQWhzVmJLQ1lzWGVHVitLWlBHU1c0YS94bUhQbXJGU25pRXlldGVoWVN4?=
 =?utf-8?B?aHdybVJiVFB6Wk5DelFWRFNPUnlMNHBYNkFpR2w5NW13NlpQV1lCYmp1RGhP?=
 =?utf-8?B?cUEreG1yQXVPbTVCUWQwanNZdUx1Z1hGZzBWUDVVMWZSRXZMQ2tKN05TcTlk?=
 =?utf-8?B?S1NsRUtRZnpocThOUUExTkJDQ09Fajh5Q0l0ZEV0QXpxa2ZUWnVMcHgvWVha?=
 =?utf-8?B?TU14RWlBYkFnOXFoODhvazRnWGtrNlI4ZVVEclFZZWN5MnhDcWFIa0d1cDBX?=
 =?utf-8?B?RER0MkxJTGNZdVFpcEhSYlEvZ1U1QTF5YWZZQmFySTZSY2t4R1JWeU9BcG5q?=
 =?utf-8?B?MWFZeGZhek0wNEY1Tks2K0xFaTdNVXVybjIyY2Z3V2dlbTFOYTFEbUI0Uncr?=
 =?utf-8?B?Y3F4MXhrMURPcGlMZWc2eUJmbHNnelczYmxkRWw4MEw3MWIxRitScE9YYUYx?=
 =?utf-8?B?YnU3ck5UQnZBcDExS0FjSjdxVll4aEFRM1hIZUtpS3VSN3U3UHdDUk9WYjZD?=
 =?utf-8?B?N0g3TFNBNHpEYUs0NDc2cVE0cW1nQnBFZG16NTBQU1dpNU54aHMrR2xSeEg5?=
 =?utf-8?B?aEFURTFMTDl0VGVGbzROMWcyRW92ZktVMlFUT2Q1MFAxVHMzMUhvT1JQUDl1?=
 =?utf-8?B?TzdCSy9wZVkxSHJZQ0RiUTZXa1JlbmVrUGhNUEdoUXVHTmFCWVcvdVM1UDVM?=
 =?utf-8?B?SzhnZDhoOElqRHY0RGJ6WDJodUZvbjA3OXl6eVVhYUZJQldHZTJvV1dGUnYv?=
 =?utf-8?B?czNIdUlSK290SlVHeU1Fczl2ajhoNlJDcmZxbUR1Z01tVTFtUEIvT3VNSHVh?=
 =?utf-8?B?eU5IUDZEQXhjRWxmR1NLYW9seXViclVJOUsxQU94T1dSZW5ZbE15Q2xUT1Jh?=
 =?utf-8?B?QnZzZDNva1ZrdFJNcjk1Rm45bzNWQ0xMRjZpK1g5TG5EZVoramcvYUsyZURG?=
 =?utf-8?B?SUc3WkdlaHRRYmdJV1lmempFWWJKc3l1Mm9XVEV6K3p6dFdiUEo3OXJLQVdh?=
 =?utf-8?B?eE0wVE1FYVhreE1LdHNwMThMOUh0dmNncDFXdk05UFpTUnBKUWFXL3dDRnFi?=
 =?utf-8?B?T2x6QkNoNklrMkRUMiszWXVQcjNMR2RTNU91MmFMTlFWbmtLdFQrMXVWRnBo?=
 =?utf-8?B?WTFOL3Z3TjBzbG1WLzNpcFArT1dBbkxZZWZjNnE1Zy9RWjdEcXZrVGZuN3ZO?=
 =?utf-8?B?SkYzajNtb3l5cHB3TE1sRlhFSHcrRDJJY1B1c0RDZEJFdmYralBTbUc4K0NE?=
 =?utf-8?B?Qzc5QkNaTGFKNWdmeXhEYXV4QjM1TU1TcThaeWdVdHRsRjdqdVcxY05CTDky?=
 =?utf-8?B?SUtGS3dsY0t5ak5oVU9YNFJESVZ2UWVuNVRlNmNyOENGcklyVC9oQitPTFM0?=
 =?utf-8?B?dVRZbjVLcmtzMWhMVFZsSDN2UnRLTFp0TVMwaTI0a2dIY0p3TkRPTlhLU2tZ?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9152e1f9-3b94-4d39-65c3-08de331c3c96
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 10:02:30.2674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIMHOWClcXY/yJ6jKzmYvhv6SlARK1OhXapFvHrYy1SXm926mecDCvRh5LfWCNGpXlsBIC3eJ7eu7ZVC9i3rUUhreXnra8gBoSqiwG6j6kI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7854

On 03/12/2025 10:24 pm, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Added CONFIG_COVERAGE_EXTENDED to enable coverage for .init and lib code.
> When enabled - Xen .init data will not be freed.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>  xen/Kconfig.debug          | 10 ++++++++++
>  xen/Rules.mk               | 13 +++++++++++++
>  xen/arch/arm/setup.c       |  2 ++
>  xen/arch/x86/setup.c       |  4 ++++
>  xen/common/libelf/Makefile |  4 +++-
>  xen/common/libfdt/Makefile |  4 +++-
>  6 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index d900d926c555..3e04e1a3992b 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -44,6 +44,16 @@ config COVERAGE
>  
>  	  If unsure, say N here.
>  
> +config COVERAGE_EXTENDED
> +    bool "Extended Code coverage support"
> +    depends on COVERAGE
> +    default y
> +    help
> +      Enable Extended code coverage support which include .init and libs code.
> +      The .init sections are not freed in this case.
> +
> +      If unsure, say N here.

IMO this is unhelpful.  Noone wants to opt for the model we've got right
now.

Instead, I think we want:

config RELAX_INIT_CHECK
    bool

and have CONFIG_COVERAGE select it.  There's no need for any user
visible option here.


> +
>  config CONDITION_COVERAGE
>  	bool "Condition coverage support"
>  	depends on COVERAGE && CC_HAS_MCDC
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index 2b28d1ac3c18..6d66a2332fb0 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -260,6 +267,7 @@ $(obj)/%.o: $(src)/%.S FORCE
>  
>  
>  quiet_cmd_obj_init_o = INIT_O  $@
> +ifneq ($(CONFIG_COVERAGE_EXTENDED),y)
>  define cmd_obj_init_o
>      $(OBJDUMP) -h $< | while read idx name sz rest; do \
>          case "$$name" in \
> @@ -272,6 +280,11 @@ define cmd_obj_init_o
>      done || exit $$?; \
>      $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
>  endef
> +else
> +define cmd_obj_init_o
> +    $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
> +endef
> +endif

This wants to be something more like:

@@ -261,6 +268,7 @@ $(obj)/%.o: $(src)/%.S FORCE
 
 quiet_cmd_obj_init_o = INIT_O  $@
 define cmd_obj_init_o
+ifneq ($(CONFIG_RELAX_INIT_CHECK),y)
     $(OBJDUMP) -h $< | while read idx name sz rest; do \
         case "$$name" in \
         .*.local) ;; \
@@ -269,7 +277,8 @@ define cmd_obj_init_o
             echo "Error: size of $<:$$name is 0x$$sz" >&2; \
             exit $$(expr $$idx + 1);; \
         esac; \
-    done || exit $$?; \
+    done || exit $$?
+endif
     $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
 endef

 
to avoid duplicating the OBJCOPY invocation.

> diff --git a/xen/common/libelf/Makefile b/xen/common/libelf/Makefile
> index 917d12b006f7..337a3a8e1b35 100644
> --- a/xen/common/libelf/Makefile
> +++ b/xen/common/libelf/Makefile
> @@ -1,5 +1,7 @@
>  obj-bin-y := libelf.o
> -nocov-y += libelf.o
> +ifneq ($(CONFIG_COVERAGE_EXTENDED),y)
> +	nocov-y += libelf.o
> +endif
>  libelf-objs := libelf-tools.o libelf-loader.o libelf-dominfo.o
>  
>  SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
> diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
> index 6ce679f98f47..8c62563ccdbc 100644
> --- a/xen/common/libfdt/Makefile
> +++ b/xen/common/libfdt/Makefile
> @@ -5,7 +5,9 @@ SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
>  # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during runtime.
>  ifneq ($(CONFIG_OVERLAY_DTB),y)
>  OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
> -nocov-y += libfdt.o
> +ifneq ($(CONFIG_COVERAGE_EXTENDED),y)
> +	nocov-y += libfdt.o
> +endif

both of these simply want to drop their nocov-ness now that coverage
does work for them.

~Andrew

