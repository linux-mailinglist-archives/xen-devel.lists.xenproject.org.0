Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC70D0A714
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 14:36:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198812.1515636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCeH-00035t-9u; Fri, 09 Jan 2026 13:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198812.1515636; Fri, 09 Jan 2026 13:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCeH-00033J-7C; Fri, 09 Jan 2026 13:35:29 +0000
Received: by outflank-mailman (input) for mailman id 1198812;
 Fri, 09 Jan 2026 13:35:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5fL6=7O=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1veCeF-00033D-EY
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 13:35:27 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d9e70a2-ed60-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 14:35:26 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5031.namprd03.prod.outlook.com (2603:10b6:a03:1f0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 13:35:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 13:35:21 +0000
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
X-Inumbo-ID: 0d9e70a2-ed60-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmJ2MhcD/t6EiZ5B+n/EYLYxaLB+2jzFUTtnOCBY9xWPxqFAuIotHfobmi1J8/cqIOqDhJv97JSJ7zEdxIj3Z3HYiXg0soChLQjkgPFZoRlr1OETgbcY4aC5uF2/hCZkwBFN8mKHqh28bPZxfYGWE55MO9T+Vr1zWMbEhDL0Qx/9Imi6wx7LGbCwePa+1TcDtBqEYf2KJY3BfUq+RgZBbEOPDTByQ1l3PEjH7XRm4PWq7gOaYgYziBaOyhCYXuJCjG1XPa8XhlNvNYGsxKPrqG8yL9SNO2892JbIBMI6RuoDVqabFBCkE8ziKzHdX9uHZhjpkuiqVLVnnmVEVJnlPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdL9bBnj8vt/gvQGyqnFLv6d4zNpW2N5Ve6nKesWXGI=;
 b=AWH93QfolJYzdBcEqwa1qTz99fwcKj0sgq8ZlzytAAea4z2dNZbqSXEmX3WT7JT1S9Y7L9QXM4gZen5Wji3xDicTUZ1EYGLQzBexvIqPOVj0R/VGM0cZ5kL85yI0TMm9sGG9ed/mgOTpSfSDZEVcZyidZG/wldamoYX/rSxzjMuCEa1CH5SQEu7LyOmnZR6HDqL+q/djWIK5+ULdDrJoaeBzsKspEssgNOMHGxY74y+TPvDcvjZXA4kn1MMb2T5a2OtgffGtaDVNuVWgwHczVdTSKvdvlCwZWacN8bIOgDrRQ2eKTGk5mz1VwDU2nHiJ2eSFGXWpRe4twu6Aj4UjFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdL9bBnj8vt/gvQGyqnFLv6d4zNpW2N5Ve6nKesWXGI=;
 b=p+wUJTGpECv0UPDZ2t37qhfsTsHUGghV3F4ThVd+aGY94P4UUbBXZpBrkmThYPXCGGdLxeq8ABnLyodi6DJQ4TowKSbL7o5mDzPtOuY67WVV/4h+sGbgkT5kzHkx2sBJu4JmHBCqGqRad5MRgwwL4hItjxrsSvW6UHyBzfNZiL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7f430ef2-ee29-43e9-85cd-21a8c450ee22@citrix.com>
Date: Fri, 9 Jan 2026 13:35:17 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v5 2/3] xen: move alloc/free_vcpu_struct() to common code
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1767803084.git.oleksii.kurochko@gmail.com>
 <fa8d4daa1ebb1b27dd9dd56f671bde2aa7beb58a.1767803084.git.oleksii.kurochko@gmail.com>
 <4b2e9f4c-ce8e-4090-afd5-45af183b9497@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <4b2e9f4c-ce8e-4090-afd5-45af183b9497@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0298.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5031:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c9d9d0-5b4a-47d0-f22f-08de4f83efd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zm5yVVRRVkIyTzcycTJFNDcyVElMbEtLQWtBK1ZxWTFXTUc5b1hreGxvWFRP?=
 =?utf-8?B?eDJFV0kyM1ZTTVRCSmZETHdtd2kvUER5dUdhK3cwRVd0NXBQUVgzTnZCcmFy?=
 =?utf-8?B?dGxDU1NaUjVIaXRQaVY1c0pEY3lETE0vVWdabU51YmtjOFRXMXlrYXFsQkpn?=
 =?utf-8?B?R3JlQTRRZEFmdnF1eE8vRWJpZE1tRFRNM09QUUQrc0ZtNlN5SWpPdEh0RnVS?=
 =?utf-8?B?TCszTXBkY1VMUVFwQ1Z6blFnS0g4aklOZWhjejNzSWVlbHpUNFBKNGxha3Az?=
 =?utf-8?B?YUg1YSs1UytNMFY1N2ZkUEpBazVlTC84WWxEN0NxbzlRL0R4VGYrbWVTOUJT?=
 =?utf-8?B?TDZmdklQUnhTRmRudk1HTUdCdDNMb29lNDRGRGtDb1NzWjV0d1F6TmZ3cWtO?=
 =?utf-8?B?RjhoVW9YdWdwaTRpOHhmMUhFdC93c1ZqSThWMEJOOC8rY0xIVWRBa3RsTTVt?=
 =?utf-8?B?akcxNHpyRk0wSUJlZXpSblpJRjEvQk1LY1NQMTNrcVY3dUtqanN5ZGFHYWZW?=
 =?utf-8?B?aFY4R3RSVVBVNVRJMXo1TTk5YXl2N2tPNGFXaXJweVZJN2FnOFFXNG9CSlF0?=
 =?utf-8?B?TlUvdGROODZqVGsxdUl3U0JDOHUvdGZnVElTWlRNNGw2MEJWd0ZNZnVZdHlC?=
 =?utf-8?B?cUE3NDMycmhySjRQYy9wVEZ3UnJmdlhHTzhqQ2ViYTlxZkVYc2FDWklrTkIz?=
 =?utf-8?B?U1A2WnArRU5oaVhJUHI0SnBYRWZpQVJPRWsxV2E5TzEyYzR4N3NpL3dYUDBQ?=
 =?utf-8?B?Z1NNSXhzQ1VqK1lCbkY3RmlQb1pFMnVpMGo2UURCZ0VYb1VaR2dkRUZManlN?=
 =?utf-8?B?VTFSMjBFRXVZVVE0RExFRXFFNjBCcjlOSGp2Z2lnRVJpdVRrY1BKbG5waVFa?=
 =?utf-8?B?YTJKam5vdW1WYUpoTVFsbWg4NFRiQUZEaUlKTEc1NkN5dDM0RCtiYmkwL1d5?=
 =?utf-8?B?a0ZuQ3pLOUVSRHA5MFZ4LzZLa1dCeGxHSlRCSFB5S0FhS1dTbnV1cmZCa0dv?=
 =?utf-8?B?S0VMRXUrYkxXbzNPb0tVWE9Va2ViMUdmelJmc3EydWw2TDBhVFFjSWFXUDBx?=
 =?utf-8?B?Q0hPOTVvK3FiZWZuNnhscjdST1VyYVNJL1dGZFNHRkxFaHRxbEpUMGVoVmJr?=
 =?utf-8?B?c3BHUnZXSmM0TXJVVnhjT3A5WFMrSjFYVXl1bnhiSE5RaERYejl5Q3ZtQk9U?=
 =?utf-8?B?UmwwbVRybERaWnp3N3F3Umh4dUd1cE4zalozME1RVzk1K2ZvQ0Y4K0RkSjRu?=
 =?utf-8?B?VEg0dFFoOXZhYkN2VnFZUEg2eWI0VjQxNzNoRkc5a3pxdE1YcG5vamdUWTBr?=
 =?utf-8?B?SnovelJyZ1BNcEdCeUZiUVdtY21UYU54Q0xCeG4yQS9wbUdsRlk3MUdNWXRm?=
 =?utf-8?B?cjJDdnpoQyszYStJZkRucGZldytQampjdDJxL3VwMHR5eTNwYmRwcVExNVk4?=
 =?utf-8?B?TjJ3T0htZ2hpYks0NUo1VnhyRnIybTdiVHp1b1QvYzVzVjNBYVJLRXZHOWJu?=
 =?utf-8?B?dVIzMVFvOWZ1UUNtS3h5TXNIWnVRUGtHdXZRVVlpMDdXeFpiUTNtWXhpUGto?=
 =?utf-8?B?RWpuYnBMN1F6YWNWb05JQjd2dWs5TUcrRkFqNEEvdVlQMnVXSzNSdHB0M053?=
 =?utf-8?B?cngwRDU1aHJQVy9jcmNOQTZaelova3JITG9XOTRDa0J3UWJvb1RiREFVMmN0?=
 =?utf-8?B?cjlqTFROTHgwK2FORklacGo3YjZ2MXNJcmwrSFJ4OEV0TWlNSEFwa1RBSVZv?=
 =?utf-8?B?anhaUzRtNCtUenB3MWUxYWZWcGk1V0N3bm1RbG9ZdzdNUDNXcGVtWnI3UXBL?=
 =?utf-8?B?bjNPTTc3aVljTU1DeVcwU2lXYkw4WWwxVWZwRFMyQ212ZG5JbzBWSVFNK3lu?=
 =?utf-8?B?QytHNm9KNVF4NTJDQmhidVZFaEh0RnFTa1dFM1lCRDJCUCtJa2g5QktuN05i?=
 =?utf-8?Q?ie0NjMbVpVB+EwTvk/4dF5YbN60qSa/3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0RKZFY5T3ZGUGZYZFdHeFhMZDZ1akdIbXd6a3Npb0VScC9HTFZudTcrRFNl?=
 =?utf-8?B?bjN2ejJaT3dkRDA1T01KSmU2Vnh6ZW5SdUxTMlNPekZaQzl2SzVGTGJobUp3?=
 =?utf-8?B?MUw2TEE3WlV6Z0Fhd256K1lTNkFVTWhESUFFN1Uwbi90d1lHT1FObHNrSFNx?=
 =?utf-8?B?TGE4WUJnR0RHbEdSVkRJZXZjZEFabmF0YVUxL1pkQjQvQjZoc0hYMDdheno0?=
 =?utf-8?B?UnNIMVUrUVlsaFJXMFVvWjM4ekx3SUlKOHlNYVdEZGpDRFIzY09JZ3dzOVk4?=
 =?utf-8?B?dGdoSGtFRlQwTkNIQ29IbDBKbzhzWXlVYlFjNWJJTU5qQ2pMZ2lzQzRrRThh?=
 =?utf-8?B?cWZ5N0w3czF0VWVyMUMrVTVyVFJTbnhGckVNTXFjWUpmMGNJRXBGK1FBazZw?=
 =?utf-8?B?a3NRMGZjcSswQ2hhaExWZFJONVZTR3BFczhHOUk5Qk1FM1djOEhpZHF0UlUv?=
 =?utf-8?B?N3ZuRUNoQjIwSENhMElESTRncUF2ajRkaS9qdjd2dlFYUzFDSDlLYXhCL1l0?=
 =?utf-8?B?UFYyOUwyTWhYR282d3h3K0p0bXZTMzdHUDBpNFI4QmlzWlg3L01VS3NPQUln?=
 =?utf-8?B?ejdac3pVZno4aWFNVEtwYTJsOHJMYmdVU1lCeVVoZGpqMzhsZnJvTTRrZHZw?=
 =?utf-8?B?ZVNLbGkxS1dhMjQzQnB4NjFId1dmQ2lURE03ZHZkYkhFQ0RBUFE4b3Q5TUlI?=
 =?utf-8?B?T0RmclJObVgyTGZQcGh2NTdhSjJLY3JVbkl5blVwYlJTWmVxL2J1RWZCcUY3?=
 =?utf-8?B?azZmazB5bEZOeThJUmF4SUk3UDJWR25CelU1ajhUanZxRER1QWxRNzZVZXVt?=
 =?utf-8?B?aUNkdjErTEVscTZKcENtSFJvTlkrVHE3RnloYXBrbEREWlFQekRvNzNpK3ow?=
 =?utf-8?B?UUg1b0tZUjR2elZDM3NUbnF6S2RxaDU0VGtUaXN2bE5EQm4rQlFnYjZCYmQy?=
 =?utf-8?B?VVZibEtoNG9PVTRtSkx6UUQwaU1aQXVJWHhtdWZYOGZEMHFpUUVoSkF6YXZT?=
 =?utf-8?B?di9qUHFGSHkvZk9IWXFuYXJQNitDQzRsMTFDL203L1I5bjNyZlV4TnppRTNG?=
 =?utf-8?B?Q2I5NzZoMHdac05MSzRLQVBKUkRManR3TGt2dVZxdkUyK0ZoL2FUZkRPOHZh?=
 =?utf-8?B?YWZsSDZibWxFdzZGRGZlc1YwVWtTTVArRk5Rc2tYcDhJUUIydnRXSnh3Q1A0?=
 =?utf-8?B?dEFzaVNsaDBhbVFoNVluOWd0a3lQVUlYV1kybm94NTVUME1zRWtzSG8wNDIr?=
 =?utf-8?B?eWptbEJWbUxQdFVub0sxbXZNQ1loZFB2N2RzRU4vTytFQS9EUndyTTVURk9u?=
 =?utf-8?B?YmJ3bkRvWFYzeE5OR0Q5a1pLUnZsQlBmcVEvSktpcjVwM2wza1hWSzBPa0xH?=
 =?utf-8?B?SVZMTTRkMlFuNm5RUFVLZzNCc1lsaUlrZVZ0aXVQM0pzSzdwd3RPUHUwS092?=
 =?utf-8?B?TWk2ZmR2SjJXaGdIY1dmdUREaFU3ZGM0b0R3SEdvL21WYzMvVnZqQ2RqOHVu?=
 =?utf-8?B?YkJuQ0w4UlVNNDRBOUVSK3ROSzFMSGNXM1hMK0FMTjdkck5nSnhjS2xjeVdQ?=
 =?utf-8?B?WEgzNFN4WkV6eWtQbzRhWTFUSDFmMXdHUHc4V0R5SStGazRWMWYvbGpqRnpB?=
 =?utf-8?B?cldpNGs3Y2cxUjVsd2ZIbldoYlFOcG10OVdjWkVRMjgwNWcwSmFPY1o4ajM4?=
 =?utf-8?B?ZWFsU1I3K1N3TklmdzRaUUFDN3g4dG5DRlJuaDJBdE51dlc1MkMrSWRuaTUr?=
 =?utf-8?B?bmhGeWhJalVuY2FUWkUrMEhlVjFFRU9Qd3FScm0veVhad3pYWnZVSDMvK3Q4?=
 =?utf-8?B?RDlxWHB5QVd2dVIzUGNqcEROeTA4dmFmVmt5bEc4SmEvMlpaR0RpRHlBK0li?=
 =?utf-8?B?bmtZNHFCKzJyRkVVWU1mRjZPM3dqMHFpUjlNUGFzVWlaRzdzSFl0dmJnNDBm?=
 =?utf-8?B?eEZYMzQvLzdHWVFtOWJuRGNaVWViVEdGU01MQjRLUldQeDNFcXBYZVRjQ1Fw?=
 =?utf-8?B?UFBKS3FIN1dISldsT0V2djlWVGJwZDZKZFZ0Nzg1Y2JWZm1kcXJCUGIrUW5R?=
 =?utf-8?B?eFdQekFCYlFxWFhnT3lkOER0cUlVZGc0MXplUVdHMGcxRmxHdWQ1Ylh0cnBr?=
 =?utf-8?B?WHV3NG1iSFd5VmZ1RXlFVXNTdzF2NXBGQjR2T0x2SWhlV0kvSzdTa1h1TTFR?=
 =?utf-8?B?OXZIeXQ1TUZNa21TcWQyNk8xcHBoczhDMUw4SEtxY1k5WWlrc29oMUlwUHUz?=
 =?utf-8?B?ZWxwTTRoRjZnaWhVYzIvRitPQmNqeU5tVm1hWWlrOFltdWp5RmRaZGJELzJE?=
 =?utf-8?B?eWRnZkwyMU1FZkpRdHFwNEFnQjNhcnpCSlladWd0bU9jYU9JaFlVVGFTdEhQ?=
 =?utf-8?Q?zRM2XTzKjZM+dTEI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c9d9d0-5b4a-47d0-f22f-08de4f83efd7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 13:35:21.7201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PNcqfxotMcCuzlaUCga+wO01TMxr2rgRF0CTWsaT405WPT4NT6INe3HFXFj5SLI3uNb+8qCeC/znt1IFcsPR3QU8MOd2YYh+/yuwoklync=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5031

On 09/01/2026 1:17 pm, Orzel, Michal wrote:
>
> On 07/01/2026 17:28, Oleksii Kurochko wrote:
>> alloc_vcpu_struct() and free_vcpu_struct() contain little
>> architecture-specific logic and are suitable for sharing across
>> architectures. Move both helpers to common code.
>>
>> To support the remaining architectural differences, introduce
>> arch_vcpu_struct_memflags(), allowing architectures to override the
>> memory flags passed to alloc_xenheap_pages(). This is currently needed
>> by x86, which may require MEMF_bits(32) for HVM guests using shadow
>> paging.
>>
>> The ARM implementation of alloc/free_vcpu_struct() is removed and
>> replaced by the common version. Stub implementations are also dropped
>> from PPC and RISC-V.
>>
>> Now that the size of struct vcpu for Arm64 is smaller than PAGE_SIZE,
>> MAX_PAGES_PER_VCPU is no longer needed and is removed.
>>
>> Finally, make alloc_vcpu_struct() and free_vcpu_struct() static to
>> common/domain.c, as they are no longer used outside common code.
>>
>> No functional changes.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> In case you need Arm tag here:
> Acked-by: Michal Orzel <michal.orzel@amd.com>

Thanks.  I think that's now sufficient to finish this series.  I'll
queue it in my next sweep.

~Andrew

