Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385B0A69482
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 17:15:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920907.1324940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuw4E-0002w8-8T; Wed, 19 Mar 2025 16:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920907.1324940; Wed, 19 Mar 2025 16:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuw4E-0002uD-5s; Wed, 19 Mar 2025 16:14:54 +0000
Received: by outflank-mailman (input) for mailman id 920907;
 Wed, 19 Mar 2025 16:14:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19Ti=WG=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tuw4C-0002u7-Rd
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 16:14:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2612::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48bb5765-04dd-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 17:14:51 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI0PR03MB10298.eurprd03.prod.outlook.com (2603:10a6:800:201::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 16:13:51 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 16:13:51 +0000
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
X-Inumbo-ID: 48bb5765-04dd-11f0-9ea0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3u5ep23Le6t5TQz6h6XzEMRzWqj/M6W/2C593QQxfxkXO6sCWItK2+dNrh/lchb/cEz84A3sTyst2Q6pvZOUVnCHXAArPmVzmitOhipppmVdUzBqNQmt4XDU+UP2YIM2dIEBHgExzwqj2SQ8OjennyjmJ21959S80zBpGBbb9YJijl0PIxRivm6DgOI1SlxzfgT5g58ot0EJxYqXbLKzemXgtZynDE4sSUmKGfmkQDvt0lWQranjmwQzLVxmRJAxwyR6NI/oAS06E3W44ewxoIIhlomZjbTrBai/6Zey0FsZG9rP2iKXH0qhOByCTP1Nz0dybd6hiWKDTF4bi4h8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLCcdKAguHzShQg7XYGba/AY6INtUFpDDhoSvsAekdc=;
 b=BYIsROwq5gTg4YY2xry0RisGBZbX+8jtyikhGdM+d1nPsHKeUwqZLJ4HAADdBHu+6z+x8xTqccc5c59qwcxnsL9ZdWX0AA/OzByDYFa4p8xzbubU9ao0FvboFUau9eeQpiMiIvUDDvbMi6kuk7t5r5B6/k5Fp5yV6+cK6FRkAiCIg1NMbbPj4vEY+j4z8hEKELaEOzRsSQMWqdDTjHBWYwYEpOIijGcpu9Y5WSEp2lqvfjzbg5/JTtIgQqoHV5xoTQYUsKfCP6aKQ+3iTaRRwRX5N9GmdHHKRezNGPZvfsc1t8UX//UC9ODsUOkiu/h1dZzQAs9W4sgBOxRmI+W8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLCcdKAguHzShQg7XYGba/AY6INtUFpDDhoSvsAekdc=;
 b=QvEVbckfkOsvFx/0ogAM18BX/GSrQSFG5VkjtIYx+GDHdcA4niCKGdJKb0uyR/oHC1oGTmootqrn2p7yjM0YRLQMsQpWtz+/xH4Yx8fvJdXmLIkPQRa8aL2Vk/GvdjjUcruWRA004YvyZK8BCqqanPgmZmRT+uje5D+NdYN3SFN4FT+v72xMy3CzOTlAuR28X/QNp75nBKGLsGa/jEA3lwXd4OCWtF5Isn7TNOrmaRwMltTvxdHDU77dYucMa8+n4+ioNYniQ7YWt4YnAp1uUgl2InFw8GpcHpReXJP9Mng+r9ps/UjChIDvSDx21qmXTqO+9QWIBgDqm0GnT9xoUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <257d612f-62ec-4507-8e18-f8e10fb20975@epam.com>
Date: Wed, 19 Mar 2025 18:13:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/16] xen/arm: introduce a separate struct for watchdog
 timers
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, Mykyta Poturai
 <mykyta_poturai@epam.com>, Mykola Kvach <mykola_kvach@epam.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <18a8a86ca0c1b884278d635fb18b3b53e062f10e.1741164138.git.xakep.amatop@gmail.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <18a8a86ca0c1b884278d635fb18b3b53e062f10e.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0365.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::8) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|VI0PR03MB10298:EE_
X-MS-Office365-Filtering-Correlation-Id: 02912ced-accb-4393-0940-08dd6701098a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXRpZDBWZFBIZUhKcnlQbEVJVExFY2ZiZ0l3K0tEZXFvUG9qSFUycU4rL3Nm?=
 =?utf-8?B?OGJySkw5dWRsenRHYXd2VHExTmNJbHlXUXdWWFpORVpOUjlJeTlYODcwdU9n?=
 =?utf-8?B?c1F3N1NmYUFSZy9ORWh6VHkyM1p1WTZsQlM3K3ZMcGNNNjhDMVJlaUJRVmVK?=
 =?utf-8?B?d3hIYXZYb3ZaN2RVNlNjb3FHcjRPT3ZxN0xOWVBnNmtzSlArVHNZbVNaN2FR?=
 =?utf-8?B?KzZKdFFpeFlXZi9sUjdEdy8rQU1QQ0dXQ1JBME5oWlp0MVh1UWN3OGMxckVT?=
 =?utf-8?B?MUNWbWw5VTJWS1BVOW1Jcjl0amZpWkxNVk04cUhrclUyVFZrVUNRN0xmaVZP?=
 =?utf-8?B?WjNSMXdPclpTZ3Z4U2NhKy9Cb2dnKzIzaWRuZXlaQ1VzS3p2SzJ4VlVzL2pM?=
 =?utf-8?B?bzg5bU1WQmhWalF0RGFzc21EZEdVNTBwVTJOeUJPV3M0eHY4akJ4N2pOREl3?=
 =?utf-8?B?UStocnlYNGN1dDUwL3ZEODlyMThzRmd4QUQ4ZVRrM0toNURTOWFkYThXdVNk?=
 =?utf-8?B?MzZiT0VMYnFPTnBUMzB2ZEtyR2ExZTBZWTFhNXhRLzRRV0ZiUW1kT2hudjlV?=
 =?utf-8?B?Wk14dVJPUmNqSnN4b1BrcjNwenpEWXFDRGFZVFlmSkVkcTdjNDhJbWhWamtz?=
 =?utf-8?B?UTFKeTdvZENPaTNNbDN2WGxTc3pwcm1DMi9DUG9VYmdjdDdYeWp6Q01uNklO?=
 =?utf-8?B?aFNjRHRac3Q1dEtWRUQ0US9xanh3bHhCdUxLaDFGM0VFV0VzK3Ixc3dNckZh?=
 =?utf-8?B?a3MyRDdTbjdRaDkxYVM1WWdiY2F2cndYTFlydDlYa3RVU3RwNkgrNld3MGg4?=
 =?utf-8?B?alBMaUU4cUc1dzV2UktNMTRWdElIS2pYZFc5d3dFNHM2M3NsWEVQbzcrRkpD?=
 =?utf-8?B?SGJ0RkFrcFNiVUtWNWFJK2RBK2hUUURPNC80d3cyQ1hoWmQxL0wzcGNZNENs?=
 =?utf-8?B?bHkvamtKWXNoRG1qZndlRHpuTXlZUlhNZnNCVUw5OUpvRlRnRDBjU3FCVFdU?=
 =?utf-8?B?WHlFRUZ0MDhIeWZlMzYxQktKYll2ZHZBT2l0TE42Q08xZUJhMTZVYmJyQUdx?=
 =?utf-8?B?clRLaUJuL2NwWnVmem1xTUdncE5wemRlSFZyS1pOa0w5SGFuMXpJRW8xSGpm?=
 =?utf-8?B?WnRvZTBFeVVJYVFCTmhTVWg0MHFuZ0VxOEZSYWJOUWgxUlJBZUF5UUNTai8y?=
 =?utf-8?B?UXF3T3dNVjhrUGc3UXFSTFZKcjdpOVJqU2FvMlJlVU5zbyt6MHNWY3dOaGZT?=
 =?utf-8?B?MmgrZklmNjNCbERSbEZGcDF4VEIxTHNiWHlzQ2VhZ3dwQ3pLRjlVaVRmUnhH?=
 =?utf-8?B?SWhoOE1CTy8rcEk2SkRuL1V4WHZOUEs3UkF5R1IrbENFdDMvSEVBUmtNWVZJ?=
 =?utf-8?B?L2wyRG1PTk9ycDFuZU1aL3VnclMzWWRaWGZIaFFSQkpFeVVZVnJjaEFUcE5D?=
 =?utf-8?B?ME03YmFKeGFKQzJWQ1o0Qi9JdSsyaTh2Sm9SMTFnS0F3TWs0N3p6b3AwRFVa?=
 =?utf-8?B?aWNrVm8yTDV4bzkvSmkreVV2NmdiK1Z5c1BMR3RjVFVYUExhc0Y3WDk4OEVS?=
 =?utf-8?B?SndXK2ZNVkRrRGlGR0lvL1lVWnpwSnNLTTJ3ODZ5aGYzb0hTWHR3ODlIRDFQ?=
 =?utf-8?B?K1krb1gvZ3FVMkxtRHp3aEU0Yk9lYzN3LysrTFJnTDhnQndRZVR4T0g5a2hj?=
 =?utf-8?B?QzlYcGJ4TVNZdHRSOTU4SXU3b0Rrd3ZpV3BEN1Ara09tV1BUdGlnVHdKdFp6?=
 =?utf-8?B?ZHQ3WDhMWCs5a2I2N2lKRlUxOHd1cmVNQ1d0RUNzV3BXTkVYRDRxUkhIbVJY?=
 =?utf-8?B?TWhhckI2U0xuS2FkajA0ZUFNRitNeFVuK3BXbEMvaW41MTZmQzd1VEt6ZlRr?=
 =?utf-8?Q?HPf5oyY9HKNLp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0ltQzQwK0pEVGduOXRrc0hGeFAwT0FNTmhZWGR1cXdJSzBpTWtyZEdCZzAx?=
 =?utf-8?B?K0JKWW9uV1A5VUlzVCtWWkRPc2lkWWxEWEdMTXkvdjBXbllPSzNFYVRDQ0NU?=
 =?utf-8?B?UG5UUkRNRUE5SFVPNFRQd21qVy8vV3p0YmljckNSMUpaZ1lxMFJ0NXlFUEo1?=
 =?utf-8?B?bDhPaEhoNFdMa3BkK0t1UHVSVnk2UXBDSG0wM3BuUlNDVzd3MkY0clRRL2lm?=
 =?utf-8?B?NXV0ZExNWlBINFQwVkN5MVhrNnZLcmJCdlhwWEtCNjdKRno3OFo2MTZQbllS?=
 =?utf-8?B?aEZsSHBzRCswMmF1RzUxSS9qNFVKOSttWFlUazJXZGxVZ0xtRkt6U1BFaTBr?=
 =?utf-8?B?UHJTUHpzY1lobFdwKyt6SHlMa2Rranh3UEdYQ2VjcG55QW1Hc2tVVTdWU1Ax?=
 =?utf-8?B?ZXh6RXZrZ0tNL3IrTVpTbE1CTkg1SmNCQlRZSGxuS0toN2ZuN3gyQkZFTTVu?=
 =?utf-8?B?bUJkdUxlaVN4NVFmd2gzOHMrOHdPOVRjTEZsbU5sLytjUElSS2xsSmZRRmVE?=
 =?utf-8?B?Y1BpRzRVREtpSk02c2dlZE9PclROUVBTdUlad2hJMytlWE0xZVI4VlZWUE1M?=
 =?utf-8?B?UE1oR3FsSG9lL3h6NkxVYTBKckFWLzF4MWI4TC9ZRVZYaDhvOWFqVjhrK2w2?=
 =?utf-8?B?UlExdUsyZHQ3MkFWT1BFU200V1Bldit2SmRLWVNaNmxDMXpZOGI1Y1NLL3Fk?=
 =?utf-8?B?S1pXbnFLaC9kUFZjNnZWL0ViSjh1T3RpR1NUVmNVdzVvK0k0SmN2MSt4THpF?=
 =?utf-8?B?MUFmUnNnREp1bDlEOGVleTVGbG4xZmlKVDlDTHNkR2hhdWV4anc3VUV2U1Zv?=
 =?utf-8?B?MkFsa0lQYUV2YnNlTERsREIzU2QvcTZUUXhvdUVxbFJ2Q1FoSUFmTnpaR3Zn?=
 =?utf-8?B?RDF6ckRPTW9SYnluNXRjTjdqaGdwNWIyODNGdGpkbVdaeFQ0YURtNnBOZHpx?=
 =?utf-8?B?c0Q3VzlZWFM2UjhMdWlYUGRyMGJzRmlJeHU2eGNnR1pDZkF0UWoxSWpSRjYy?=
 =?utf-8?B?OHBiTlRvSXZxV1ZtSHVQelhCeGduRmFzdHcwQkRwUHp1eGFwMWZ5MWYyNE1I?=
 =?utf-8?B?YmVoNXBrR3lmQXM0UTYyeENYbis1Sk45Y3F6b1Vtcll1eUZZOEZ0MFk3elJE?=
 =?utf-8?B?Z1lVem1aTFQrSi9CVjBiazFab3NqcEExWmh6UTZiL0tBTUc5allpTTNuS0NQ?=
 =?utf-8?B?dm8yc2I1NExxRXFDRUxKbGE1WXd1M0ZFVnM1Q1ptOEwwWERYUE9mZXNvUDc1?=
 =?utf-8?B?Q0NrcEZEcmljdHJEejNZZEttLzJsUlc1RUhkQnNBbm5VVlR6a3Q4c015ZW5J?=
 =?utf-8?B?cXp3SFBxb2RDOEtrUlluN3EzK0RoVlhKd1N3SFhIRi82U3BnTEVpTEdwc1Er?=
 =?utf-8?B?aDBmVVdweHkzcnByb1dWR0grNTFmcWY4VWhmWFovUk1tSXJBZjJHcXJRUld4?=
 =?utf-8?B?bVdyTGNlZTdDMk56WUZ4Ny8zK3E5M1VIb09nZDh1SklLMy9qL3JrWUlFVGlT?=
 =?utf-8?B?ajczY3BGbkxScjg1MlYrK05xZWU4K0grcWg4QzdsM3d2bFZnZDhkS2ZYaGFZ?=
 =?utf-8?B?MUtKd3VKU2VYaURqUnJiYitoOCtQaGhGUHJiVkduSjlRc2d0VEw2MGVlWDdj?=
 =?utf-8?B?RFhGMVJBUit5TU0wUUJPV2JCSFhjZkxOemkyZEM0UjZQcENwS0NJNmpFV3Fy?=
 =?utf-8?B?K2QvczdQSU9JbjdpWWR1WEd1akdXWnlhZVQ0dXdreU4zdEI5YjA5amV2VkZY?=
 =?utf-8?B?ZTFCNk5sTzk4RGJrMkJaQnFaUkt5bGtoRTFFR2NWemdURXIzYjN4VnpIQmxN?=
 =?utf-8?B?bFZJVlNoY04rL1JCRHc5cjZudE5oblVyYjdmbGVoayttZEpvMFNLQ3dXTjJn?=
 =?utf-8?B?L2Joem9pbWpvSHNiaHN5VW5oWTZrSmNsM3hnSmxRWXBqTnRlUWFsWEJRNjg1?=
 =?utf-8?B?WnorVFBFYmc1NEJ2bGFlUHBkbEV5MmQreUhsTVNnMUI5NEpXTmdkVjFnbFRl?=
 =?utf-8?B?bXljNklXakQ5eTQxSEhxMnp5eXVNVUNoRkpPc0prNXNYcHFKN2RBUk9ZMCtw?=
 =?utf-8?B?SlIyalI1dUVlVE9tOVZNUEQyaVJIaTJLRWdxSDl3eFd4WlBhdVFnSlF2YlZI?=
 =?utf-8?B?Y011YzUyMHdiQUtlVTliOUs5SURKc0RLMG5GMm9GYnM3QlJ1ek11eS9uMzZ2?=
 =?utf-8?B?T0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02912ced-accb-4393-0940-08dd6701098a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 16:13:51.1272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +W9JP4mX3iSqn8fNLYRIlU1M5bxWm0l3yKJRakBqnt6Zr2FQWrQREzWL2yCjOvSj/TWlQBdumzr8jBgCNmFzshcQiPPURITk5HPRv6arTrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10298



On 05.03.25 11:11, Mykola Kvach wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> Introduce a separate struct for watchdog timers. It is needed to properly
> implement the suspend/resume actions for the watchdog timers. To be able
> to restart watchdog timer after suspend we need to remember their
> frequency somewhere. To not bloat the struct timer a new struct
> watchdog_timer is introduced, containing the original timer and the last
> set timeout.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> This commit was introduced in patch series V2.
> ---
>   xen/common/keyhandler.c    |  2 +-
>   xen/common/sched/core.c    | 11 ++++++-----
>   xen/include/xen/sched.h    |  3 ++-
>   xen/include/xen/watchdog.h |  6 ++++++
>   4 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> index 0bb842ec00..caf614c0c2 100644
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -305,7 +305,7 @@ static void cf_check dump_domains(unsigned char key)
>           for ( i = 0 ; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
>               if ( test_bit(i, &d->watchdog_inuse_map) )
>                   printk("    watchdog %d expires in %d seconds\n",
> -                       i, (u32)((d->watchdog_timer[i].expires - NOW()) >> 30));
> +                       i, (u32)((d->watchdog_timer[i].timer.expires - NOW()) >> 30));

I'd like to propose to add watchdog API wrapper here, like

watchdog_domain_expires_sec(d,id)

or

watchdog_domain_dump(d)

and so hide implementation internals.

>   
>           arch_dump_domain_info(d);
>   
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index d6296d99fd..b1c6b6b9fa 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1556,7 +1556,8 @@ static long domain_watchdog(struct domain *d, uint32_t id, uint32_t timeout)
>           {
>               if ( test_and_set_bit(id, &d->watchdog_inuse_map) )
>                   continue;
> -            set_timer(&d->watchdog_timer[id], NOW() + SECONDS(timeout));
> +            d->watchdog_timer[id].timeout = timeout;
> +            set_timer(&d->watchdog_timer[id].timer, NOW() + SECONDS(timeout));
>               break;
>           }
>           spin_unlock(&d->watchdog_lock);
> @@ -1572,12 +1573,12 @@ static long domain_watchdog(struct domain *d, uint32_t id, uint32_t timeout)
>   
>       if ( timeout == 0 )
>       {
> -        stop_timer(&d->watchdog_timer[id]);
> +        stop_timer(&d->watchdog_timer[id].timer);
>           clear_bit(id, &d->watchdog_inuse_map);
>       }
>       else
>       {
> -        set_timer(&d->watchdog_timer[id], NOW() + SECONDS(timeout));
> +        set_timer(&d->watchdog_timer[id].timer, NOW() + SECONDS(timeout));
>       }
>   
>       spin_unlock(&d->watchdog_lock);
> @@ -1593,7 +1594,7 @@ void watchdog_domain_init(struct domain *d)
>       d->watchdog_inuse_map = 0;
>   
>       for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> -        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, d, 0);
> +        init_timer(&d->watchdog_timer[i].timer, domain_watchdog_timeout, d, 0);
>   }
>   
>   void watchdog_domain_destroy(struct domain *d)
> @@ -1601,7 +1602,7 @@ void watchdog_domain_destroy(struct domain *d)
>       unsigned int i;
>   
>       for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> -        kill_timer(&d->watchdog_timer[i]);
> +        kill_timer(&d->watchdog_timer[i].timer);
>   }
>   
>   /*
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 177784e6da..d0d10612ce 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -24,6 +24,7 @@
>   #include <asm/current.h>
>   #include <xen/vpci.h>
>   #include <xen/wait.h>
> +#include <xen/watchdog.h>
>   #include <public/xen.h>
>   #include <public/domctl.h>
>   #include <public/sysctl.h>

I think struct watchdog_timer (or whatever you going to add) need to be moved in sched.h
because...

> @@ -569,7 +570,7 @@ struct domain
>   #define NR_DOMAIN_WATCHDOG_TIMERS 2
>       spinlock_t watchdog_lock;
>       uint32_t watchdog_inuse_map;
> -    struct timer watchdog_timer[NR_DOMAIN_WATCHDOG_TIMERS];
> +    struct watchdog_timer watchdog_timer[NR_DOMAIN_WATCHDOG_TIMERS];
>   
>       struct rcu_head rcu;
>   
> diff --git a/xen/include/xen/watchdog.h b/xen/include/xen/watchdog.h
> index 4c2840bd91..2b7169632d 100644
> --- a/xen/include/xen/watchdog.h
> +++ b/xen/include/xen/watchdog.h
> @@ -8,6 +8,12 @@
>   #define __XEN_WATCHDOG_H__
>   
>   #include <xen/types.h>
> +#include <xen/timer.h>

...this interface is not related to domain's watchdogs.
 From x86 code, it seems like some sort of HW watchdog used to check pCPUs state
and not domains/vcpu. And it's Not enabled for Arm now.

> +
> +struct watchdog_timer {
> +    struct timer timer;
> +    uint32_t timeout;
> +};
>   
>   #ifdef CONFIG_WATCHDOG
>   

