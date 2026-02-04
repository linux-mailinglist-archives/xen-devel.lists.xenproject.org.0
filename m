Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL0CB1AGg2lLgwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 09:41:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844DBE3461
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 09:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220220.1528929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnYS7-0002je-Dp; Wed, 04 Feb 2026 08:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220220.1528929; Wed, 04 Feb 2026 08:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnYS7-0002iD-Av; Wed, 04 Feb 2026 08:41:35 +0000
Received: by outflank-mailman (input) for mailman id 1220220;
 Wed, 04 Feb 2026 08:41:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hC1S=AI=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vnYS6-0002i7-27
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 08:41:34 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b6c1723-01a5-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 09:41:28 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB8296.namprd03.prod.outlook.com (2603:10b6:8:292::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 4 Feb
 2026 08:41:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 08:41:25 +0000
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
X-Inumbo-ID: 4b6c1723-01a5-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MF5X7M5qRdz8SYZ7iErUCV0HUhP9cfdIWX1LGbgAfFO6UjPlJf2jrdixMFfkdvPgPUUBJ6ylRRL1x8kLeoVQiIf4p16f4S43nQTRd8PzkRSqYXeiMAc8zDLgOhN8YLeZCd4oT5BILqNxYje2/eE0f7fb6O0DY53BwuPhK6K4XcNVRJ0xdIJqcweMq9jFHxyqnUsI0FbWTUHfpJR2LSwmq3NAMG5H7cE+RkGTvdh/u5xTyULv5VWGqR/y1RW4uyrrft84v1s6MCIPT7EJ2Gq3nKr3091kyDPBhi/IgPciwuFIfKs7hWQQU70Hv4eMutem9dce5BxK+cW3KOTE3lwFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGopkz/bIIEaSGdKEG5Vd+N5uBrmxdyBCJrzVRYlQfk=;
 b=gha+Bfirvdy2+yPbBPuPSWN+k8v+s4HDVaUcG8IQ6VCMMUr8T5gnRXzHh7jw3gXm89UQKr4xSlTQ3df3IGKy7sGhGty5Uv/MS4iKG9NjiWntrQjJbUjqXIwGUFfRVIGspJ2ZPpVdDAO8nlIklkQD46xeKUpvN3rPKWvJx3sDAzIfrrH9sFcmXVWcf/sIcb8prhlTNVmcXWZuSB7hcJRvJsuQdedsZC7T+rOK8/+JaHaVJp2VvQUfxpC3ok4vvov5WdBgKMyP+60ORYe4BZwMHtCwlnj0zF2aQSHKCMcH571/wy08JS6gUF0McSbgBANrsc1xmF4qMP/beylZW5Xg1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGopkz/bIIEaSGdKEG5Vd+N5uBrmxdyBCJrzVRYlQfk=;
 b=mG/mOsH3jt36PedUlRAEvANCTCWkygQPtn9eJyfngFQM8aCC3lANZPhSLv1IUnTEpJYjjmVoNBzTOEyGyRs+BZMx3GmLrylSYuF65R/vpMIJqYyVcOwFt0WM6Cl0AGS6DOkDpzavBnUfZLbmFGDjxei7uxV3flykABm2yvBeGTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b7c3ef89-6f5a-4062-8e16-091abcf9acd2@citrix.com>
Date: Wed, 4 Feb 2026 09:41:21 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/domain: adjust limitation on shared_info allocation
 below 4G
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260203101017.56962-1-roger.pau@citrix.com>
 <aYHL0CChPShMUtHw@Mac.lan>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aYHL0CChPShMUtHw@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0019.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc1e314-e45b-4876-f85e-08de63c92e99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVNCeWlnYklxWDhoUXA3TmNkUmsyTGlDdTgxQ1ZLcVRIL0htYXRvSUMrOUh1?=
 =?utf-8?B?RkpvaVlOT3lzZFdWWHh6b2hRdjV5UUkyRUR1Zk9UQmgzZ1FVYnBLODhtVnNx?=
 =?utf-8?B?QTZkbmZ0czVqdEc4ZFRRTkxNVFNBd2tlNGl6dWFReTIwWWFBS3ZiWmkwS1Ns?=
 =?utf-8?B?aGgrdVRIOWRHcG5lVHRyek1IR2xuSHp1MlM2dEttdnRERU1hRjhtNlRkWHho?=
 =?utf-8?B?bklzQ0I3Y0FuNVE1UWVsMEtCOTVLb0lIMWRqSjNGQ3VvK3ZJeW00aUtnMS92?=
 =?utf-8?B?OERSZkRQNHhsQlkzUkk0Um5CSmM3eThDTStlQW9mY1V1TUc0YXptYnV2aVE4?=
 =?utf-8?B?alhXRTNUV0RIZFk4MWZlL3V0Uys5TUkrVnl4T0Z6b0lLdVpueUtpRW4rUnho?=
 =?utf-8?B?eGxickJMUzZTbDB1aE5LRlIvekJlSlBoaWhzWHlDaHo5UU1OT3MvTU9YT1lY?=
 =?utf-8?B?WUNPek9RQTBBUHNadGVnOVBmZE1ucmFZRWp4SjJNaGgyQ2RYdGtTY2dubjQ2?=
 =?utf-8?B?bHdtQU1UcWdtQTZHM2drQ2ZCZ1d0aUNRQS9KTm5qam51bkZUaGx6VHNFaUZu?=
 =?utf-8?B?RFc0YnZzNVRQTWEraFlpc0lrNTIreU94Y254MmtGNzd6M0x3dTVlUFNmNXpy?=
 =?utf-8?B?aXdpMlpubWg4eHpxWUZyaVFwdkRJVk5RZzdJczYvQ3ZITnpjMkI0ZDBnaWpn?=
 =?utf-8?B?VmF3SVVlZ2h2UFE0dnZGcFVIL2kyRUNkcWdXeEtyMmRSRjRQUjVid29zVS96?=
 =?utf-8?B?N1Q0YlN4N2dZc0NrTERCZDFta1NiazBBWmxnck1ENWlzVVF3Q056N3JvZVd6?=
 =?utf-8?B?R1hkN2RKZVo3bnB1T01mM2FXOFY3dTJwa25tc1UyaDFxdlQvN2w3aEhFdVRK?=
 =?utf-8?B?akQramM2V2xVOHZ4VnVnZm90ZjNnOUVQZU15U0ZkZFJkN2l1d25RZ1VaNnJs?=
 =?utf-8?B?V0ZKVDhOWERFMEJBYUt3alFoWWVQcG9jbkxQZnY0VEIzNy9NckZSQi81WlFH?=
 =?utf-8?B?UnZ1WHI2Z25DdjloejRkbDV5elVvVTZpSjMxbk84VEJxTDNKNUZjUFg3Rm5v?=
 =?utf-8?B?eDJXU2EyNGV5K2ppSGdMdzFQeVl6bUJMR0pxdHI1V2lBY2Z5cGtHNnk4S3F5?=
 =?utf-8?B?Tk5LdFNmRy83N2F4eUE3em9hbEVuRDl1K0orK0lPc282clgxMEh5M1hEMExw?=
 =?utf-8?B?UkFOSW00eTFrUVFzL1Q1SU16eWI3VnV1NzVXakppRjhDMnZCaHV5WDNzNlJN?=
 =?utf-8?B?V1VPZzdMYjJESE1ibkY5TW0xWFZoNUduUWJLMUFkZTlaS3BmWkdsOE5JR3pI?=
 =?utf-8?B?bHdzZUF4VEIzdTBmcVh1UTRFbFpDUmVkTjJkTGtXaENiMW1pd2Q1b1U4TGdr?=
 =?utf-8?B?WkVVTUVMVEU2YU1ONXlLdER6TkZ6VGFiUGhBNU5CZm03bndkcFB0UnJ4UERz?=
 =?utf-8?B?d1liTEFjUmtPK1hvV2Y5SFcrYzVMeWJNSFBXdXRhVElLQ3lad1hsSVJ1SmZl?=
 =?utf-8?B?am1zMjJnNFBjMlcyZktRTm9reWJUa1o2UWphM092a1FKU21sVGowQXZYbWtv?=
 =?utf-8?B?KzN6ZFFiUDAvRjlvWml1TmZ2bGhTREdReWtTYjROb0ZVdUlhWVdUTHROM1Bh?=
 =?utf-8?B?NTRFL3p4SHVmT0dXc2tjakpZT25yQlBueW1rYStMa2w5ZDNDY2FTSURHc0Vm?=
 =?utf-8?B?VE1wU2Uzbk9aM1FVNjl6SlhPSlJubDNWcnp6T2pHRzUweXFIS25HdWUvaTJx?=
 =?utf-8?B?bGR6Wm11cTc0dUVjRndORmdhYVlzMmRGMWI5NkxVazhod3NjaGJDQW9UMUEr?=
 =?utf-8?B?OWRhMmdZdi9SMWJydzJrL2prV09zY3RVOGZ0cEhEU3hVeHJYWWdjL1V6OEli?=
 =?utf-8?B?MFJtOE56N215aWtWdmkyMXhTSktwdlo4TXo2d25GNTV4NU1TYmtKdFkzc2xp?=
 =?utf-8?B?TFUxWUNIK2hIWTFnak9vN3RXK1ZzV0tES3h6cmJIZ1V5WVlFVE4xTTExdngy?=
 =?utf-8?B?STVYUlhxZnJ1RFBUeVp5TWxrS2NzZGg5aWsxNk9UMlVDRmlVa2RBNDNIWjVQ?=
 =?utf-8?B?SmNOeStHSzZ0YURzbExQVmNYeXArQzluZ1h2WUp1VHQ3c2REbk1HV0JZZ1hj?=
 =?utf-8?Q?VTHw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2dUR09zMjVXWWxzUzZucDBCSWJmcHZkcFhZWkdQeHhkWWQ1Njl3U0hodlVO?=
 =?utf-8?B?WUh3dVZMQlkvRjVKYXpId1l0K04ydlB3OGdEUWszY01PZGhQaFdLR2ZpekNZ?=
 =?utf-8?B?Rk1GWjRuN1Z2Mnk4L0ZWNTY4dWpqVkFkM1NlV2NxK3Nndk1rU2tWSU9WOHhn?=
 =?utf-8?B?Yy8rVzR5Vk5oQ0RqanA0bHE0WGRPUlY4TEJlTFFUeXlhd1VkSms3RVdYZlJj?=
 =?utf-8?B?cndRZCtpYlYxUk8ydlVvUVhDc3p2VkpvcG1saVdWT2tjeTAwU0tlYlRyY2Ew?=
 =?utf-8?B?MGZMTFJvdVcyR25qSWNZWVlTbkd5cjFVQlgvZXdQZFlDNjgzZmw5VUx4TStK?=
 =?utf-8?B?cEZha3VJTGJXdGVMMjRRa2JBbEFJdnpLcUpUTnQzWEp2RnNQRm1MdUd3OURF?=
 =?utf-8?B?R1pobUZ6T0hFaHpJb0tIQXVBbmFRcW54OVNGd0J1Vm95Ykh3cmE2a1doYUJq?=
 =?utf-8?B?OGpWemhyYXExNERlRWxGemVoYkthRjF5eG9iYzhyNHhYT3p2Yk5wV1F4N1dW?=
 =?utf-8?B?SElXNW5CcTlRak5IQVR2VFlUMk9zQUg2aW9uZHo2ak1DMHY5RXE1YkZ0MUdT?=
 =?utf-8?B?VmZQMVAxVi9RazFzNFNlMnNMTVBLZmhsRnM3d3MyOUtRS0pNVDJtQUh0WlYr?=
 =?utf-8?B?ZjhiNVZmc0NjUEpTUkxzOWFoUGZPSHNIYStmNDBKcVhwOFRTeU9ZaUpwZW9Y?=
 =?utf-8?B?YW1xWEIzT1ZYVnJoMXRZTi9Cb3hMZk54Wi8xSnNBZ0xQRGRWbU01alFwZnBO?=
 =?utf-8?B?VVBoamN5T0M4dzFCY0gzR2pCUzhqR2ZpU0kwYitnMW8zS1NIdFNoSG1SVlhx?=
 =?utf-8?B?aDJQNHRLeGVBbjgwSGl1UDhzb29GNWxnV2hnclFiMzYxVUpVN0lMb3pmWjM0?=
 =?utf-8?B?cit3WGpHZFN3eGlTaEtFL0R3VjNXak9PcHFaZzRwUmVNQm1kakZNUU5SSk9U?=
 =?utf-8?B?Z0cyUzIzZElrVGowa09xRDZjSzVtNGhBMFFoMkZuazRCRWtTa1BnWmlvYk5S?=
 =?utf-8?B?ZGl5R1h6RFJQZmlNY1FVT1lwOXNhaS96UzMwalFCcGhvNzlDWGQxV29HUkU0?=
 =?utf-8?B?bkRiMTloUk5PNW41TWxBNUtzejByM1I1cFFReTd3MFNTUzk0UllRSHZHdlpz?=
 =?utf-8?B?ZDVVUE5uY1V3UlppcDdKUmNNTjgvaDVFdFJrcEYrQUZFajE3azZDNXcwMFdh?=
 =?utf-8?B?Z2s5WTZ4RkhkR0pFRGdZaElVZnNVNnduS0lNaHdUOE1zVGtHM3I2QkFHNmwy?=
 =?utf-8?B?LzBrNE5oODJSZldvVWpaalFyZzJDbExCZmppU2d4RytEQ0llUVZ6SXVseTFl?=
 =?utf-8?B?WHgrMG9SOXhJVXBoM1ZaQlI4ZmpaaC94b3hPKytWSFIwK1VYQ3pSY0I2K1Vn?=
 =?utf-8?B?QWk4RzRVS0dHMVlCNFptSUNSTVpUODhlcjhzaitTaElQT281bzlzVFpTYXlK?=
 =?utf-8?B?UElidERLWUVKUkdBc2dyaUxlVnlpa1RnU2NDQ3RQVFhCQnNFOHJHSVlNTS85?=
 =?utf-8?B?VUJMZUVXMzhBbldCNWl6REFET3psNXo0M1RDc0xMMkZncCs5eUlPLzNHa2N4?=
 =?utf-8?B?d1hQNXJQNFJSalk0VUJPR2xSTFo4SWFlUWszOFp1NCtWVU9rdjE5UkZVNVVK?=
 =?utf-8?B?bUhLZDZQUjZiQ29EcU5YYVJzTDZsOWliVUx5WWRqckJBd1NQeEhJY0kyOTEw?=
 =?utf-8?B?T3dFSHRsRHJJakt3VDVwbDNVY1FVVFA2cUhCMHJmQ1kvY2dXVEQ2aWMwcjI2?=
 =?utf-8?B?L1pYUW03SGVlM3dkQy9abTBFY3F2bWVvVFVMVUJhMDlNOWVYQ2ZCV2ZnSEZn?=
 =?utf-8?B?UVkzUzhUcm5SRXlaUkI5VlNPRkZrZ0MrSk9QS0pOc3V3QnBuajhwVndpZ3Zx?=
 =?utf-8?B?czR1WHFJYmFFYkR3T2dGWFQra284eTUwK3d4RE5uZmVZZkFTVmdjdHlyUEdN?=
 =?utf-8?B?SWh4RUJzMUhCTW1WRndSa2lUUVZ6S3gyWllxZDV4MlBwR1J4MThwWURYOVoy?=
 =?utf-8?B?OWpOOUZ2SjBpRnVnS1NvQXNrV3pheHZ3Q3c3WVNxK244OWM1TVV3amNieGl5?=
 =?utf-8?B?Q0tKZzA4ei9oY1NWbE9SYXlGa3JVazQyZmRPK0xvOTk1V3dRSkcxVkxhME9t?=
 =?utf-8?B?Ymp2ODZyZE81Ni90RXFKcTVJdTg3bnJHN2NiWTdzYVZBMVNrZXJJMXpGTU5P?=
 =?utf-8?B?c0cvSm9wSDIwanRLZDJCalB0OUVFa1VpTzMyYWV0bWlFbUhmWDd5aE9wVzRi?=
 =?utf-8?B?blhWZXZmc2tQaGNlam02OTJSVVZGZytjRHJNQVhKMDFPRndmSnBmT1paZWlV?=
 =?utf-8?B?KzJlTTV2MFNMMFBVdzdZOFlXU3duSkxtdGFKMzdKQnExV1NqeTdPQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc1e314-e45b-4876-f85e-08de63c92e99
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 08:41:25.5266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SH6bWmGHLYW9cm9fl8Shyf/ySO6jPDG9NjZFCW69bfz6KQDl0anQkwBptSsrhU948WwR0rdIra5I/Sb0e97owf2iPm49ZspbXJJ8tHaKU7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8296
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 844DBE3461
X-Rspamd-Action: no action

On 03/02/2026 10:20 am, Roger Pau Monné wrote:
> On Tue, Feb 03, 2026 at 11:10:17AM +0100, Roger Pau Monne wrote:
>> The limitation of shared_info being allocated below 4G to fit in the
>> start_info field only applies to 32bit PV guests.  On 64bit PV guests the
>> start_info field is 64bits wide.  HVM guests don't use start_info at all.
>>
>> Limit the allocation address restriction to 32bit PV guests only.
>>
>> Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/arch/x86/domain.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>> index edb76366b596..4163568043b1 100644
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -882,10 +882,13 @@ int arch_domain_create(struct domain *d,
>>          goto fail;
>>  
>>      /*
>> -     * The shared_info machine address must fit in a 32-bit field within a
>> -     * 32-bit guest's start_info structure. Hence we specify MEMF_bits(32).
>> +     * For 32bit PV guests the shared_info machine address must fit in a 32-bit
>> +     * field within the guest's start_info structure. Hence we specify
>> +     * MEMF_bits(32).
>>       */
>> -    if ( (d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32))) == NULL )
>> +    if ( (d->shared_info =
>> +          alloc_xenheap_pages(0, is_pv_32bit_domain(d) ? MEMF_bits(32)
>> +                                                       : 0)) == NULL )
> Sorry, this is wrong, it's too early to know whether the domain is 32
> or 64bit.

It's probably fine to have this become an unrestricted xenhelp
allocation, and for switch_compat() to make a restricted allocation and
copy.

When constructing a PV32 guest in practice, the set_compat hypercall is
only moments after from the domain create, and it doesn't matter if we
discover lowmem exhaustion marginally later

That way we don't have a PV32-ism continuing to impact the all VMs.

~Andrew

