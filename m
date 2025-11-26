Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFAAC8A185
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172783.1497884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFtn-0000E2-Lj; Wed, 26 Nov 2025 13:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172783.1497884; Wed, 26 Nov 2025 13:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFtn-0000CQ-If; Wed, 26 Nov 2025 13:49:35 +0000
Received: by outflank-mailman (input) for mailman id 1172783;
 Wed, 26 Nov 2025 13:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wUbM=6C=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vOFtm-0000CI-2U
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:49:34 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc4daf72-cace-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 14:49:33 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6545.namprd03.prod.outlook.com (2603:10b6:806:1c4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 13:49:30 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 13:49:29 +0000
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
X-Inumbo-ID: bc4daf72-cace-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJ3489wGh/PNA79CzBFckU6z8VD/xMePmya7ilwZeAsb48vFvh0YDUEt/3oD04jk3FycCksBoZHR9ukjwQqGpc8GRZ3M602nzer9AOqfTyZxizoOl5ICE61n+VGvVf91HzLo0vh5Ih2wFuT0S7aAsmeL2yUO3IYsR38xb43OoYxgqryB93oWIdaM3C/4pqH4YJfhOUuQPXc4lkImvZSkzA+GlXK+H3KrVbYop7CCID9LJC52mqRxd6T2WJEhRBwpY6rVJJ2HuARSgjM5Am+6kLwJM2WVI3Otjh1wJ6+ynG/SrnsZdVInw1Cw6ZUanpcwZ5lkH9yem9hLKsFDXvJGkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsVmPjpoxJHpN+mK2wwGORCgleyryOyF/tU3YFcGrfc=;
 b=AJvHSNf6aDyXwkE3DjxCM4C5YsIYfvhneacNi3Dcywe4I8JDZttM4E8+klijzqXWtNvynzlCluVb7BnhuMtAPTTD7UoPyUZ4E0t+5o/5KxevDBCE/N1HsfmdO0g98FhzMsc8ucbGQ07Kb9IJt2UmGoa7pb466+ZajSgexMq98XsoklWL+kr1fIMj/gFbEgpaBpbiYsxm++NqunrDhYsnrL8JuZVc8SnIJRuj0lzFLGZARytZWoShMsPAQSuj8rN9mm2PAeH8miTaL92iLINQw7uiHFzyvnGWkesD8KoLY0tcvRQMuGPajnuVbRA5R98If0DYaakGXfvmK3myfrSWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsVmPjpoxJHpN+mK2wwGORCgleyryOyF/tU3YFcGrfc=;
 b=GCOTIH3G6rjYJUHKA8ZblvtaHr73xZgF5UpS06NdNTjj5ai0bfo63ehlAXVAv6KvfivQHRuVe8EvUeXoEVsKK5vxGz9tsmds+xbjazYkoEw/SxDoGIIN04COzfAIaq/hgUnKCn0Sual8h8fu2CWZco/E1E+FP/aisLroI+tar1g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 26 Nov 2025 14:49:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/viridian: fix calling of
 viridian_time_domain_{freeze,thaw}()
Message-ID: <aScFZVHdW2ef0tNE@Mac.lan>
References: <20251126112942.49031-1-roger.pau@citrix.com>
 <4f3c5cf3-cdba-4162-a9b1-4afe683c864f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4f3c5cf3-cdba-4162-a9b1-4afe683c864f@suse.com>
X-ClientProxiedBy: PA7P264CA0418.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e44887-07b6-46f3-fc66-08de2cf29f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXpzYWZFeS9NSHhBK3VCaURDVDdKdnVRaGpsdm5QVkdDTDkvaGRad3ErNGpF?=
 =?utf-8?B?bk8rRmYvZnlvRWtJRzhocnZvQVhmamZEaXdGZGtxcWI0bnpkTXBhakhtNWJl?=
 =?utf-8?B?OGdBZmFsOXh1UWtLbENZdGZIYjNMQnF6VHpKUkFFU1UvdEp5aUtOZmFSbUNK?=
 =?utf-8?B?YXRvRFFWYkFpVG53MDFlMENHNHJKUG5RMlRkZ2x6eXF2UUxyNjIwbTZQZ3d2?=
 =?utf-8?B?cC92aE9sOVhXaXUxeE02ZUhlMEF3Nk5SR2NmKzFNQm1LNzVNNjRCSlRVRkR5?=
 =?utf-8?B?aVFvTWFrTlFaU3lnMUNmY0xQVTJmYlc3Vld2SFFYNFZTcDkxMVQ1VkNzVjhq?=
 =?utf-8?B?cEhNakxFeHhEaE8xRm1FRkRXcVo2Wjd2Y1BLSW5VN0h4QnhkZjlQWXJmUEs5?=
 =?utf-8?B?NkxzOWNQZU1iRzBZaENrR0JXYVAwdHhkTFhCVnBNaUlKYk90ZHVqZlQ2YTA2?=
 =?utf-8?B?Tko2cEhwRklNN0xORC8rZloxY2VEMGovWFcveU9qbzJxUjkwWWF0blZ2eEpJ?=
 =?utf-8?B?NGlmMENpcmdvZ01kbW52MHQ4ZVF1RDhIUWxnS1EvVEdBb0g4ZjN2OTVPWUNp?=
 =?utf-8?B?cSt3N2h6Q2FEZ082Ly9qVHpTZUNOVjhEZjhYdFFkYmJ5Mno3OU4zb1lnd0RP?=
 =?utf-8?B?bnJrUmh0cWtVT0dCaFlxS0I4SmRBcGQ3NStLRVdDaFA2ZTV0WSt6eTVsc0JL?=
 =?utf-8?B?OVNSUUtWM2VrTTJUc2RMa25SWFNuc2xzVUZPSkRvZXA3K1k4NlEwdll6L0Ro?=
 =?utf-8?B?dGJZUHJzb1ErUUh1ZmdBYm1ULzFiWGpHTFJsSTNrRGV0WTUrWlBjaVJNenBh?=
 =?utf-8?B?ZmQ5RUN1dW91Y2pUVG4rWWlhdXNIQnBvWDZ2NVpoZmZyUU1zclFhV2xjb3hw?=
 =?utf-8?B?eW0rU3htYm85NE91NzJOQnlsYWsxT0RTNURmK0VEQlZQaUxiMHVzVkkzd3VN?=
 =?utf-8?B?STdsWndDbFd4REZBNHFNclgxRXc4RWVrZDhOQ2R4VXRybklwNytZZTJsUmJQ?=
 =?utf-8?B?UStrVlMyWnJ1Z2FRbkNtRW9RejhBdG1KK3E5NkRjK01xajJtOEJkRDNaVmRu?=
 =?utf-8?B?SzgzL1hXRlY4VGZIU2FsTVpwbFZWK1g4QTdwcW5pV1FmN0srdEluNmlRMEZy?=
 =?utf-8?B?M1pEWU05WDkwQjFtZno0c1Y0NUFxR0ZpeFNONFgza1lBOTF4dFdlQkN1VlhB?=
 =?utf-8?B?Y2l0K01HekdPNUJqMVNzaGRoUGVQbU9Wa3ZsU0xkUmdiNVMxVXdVTTYvK29S?=
 =?utf-8?B?cG1LN0VMam85TXZ5U0RjWHZ5K1o3WmRObzZRSUk1MXNrMTlFYnRyTGpQdWln?=
 =?utf-8?B?NTJSOTRsOG5Qc1U5R1puaWF0WEp3VHBRaUU4MXExUkZKV3lMRjdZRzdKWnlk?=
 =?utf-8?B?aDV6SkNSbTBmK21iVlkrWmM5b2RzZXRnZU9LSzhGSTNyTTRUWmc0c1JIeldv?=
 =?utf-8?B?VG9mY3RjV01XczZqUkFPNDh6SGI0UVNxM3FDZXprYXduZmpUZ2Q4bmJpK1RD?=
 =?utf-8?B?SUszdFVKZkRQKzVMenB5NE5SdHlKa0VVQnBxMXllVTRWdVNBRHc3MkIvNDFF?=
 =?utf-8?B?RVRmTHM1aU9mVUhlTGxSa3RlalBIMVpuRUNGSlk1dUpOdnlVOHh4ZHFpNkw1?=
 =?utf-8?B?YjdvWUY3NXF5ZjZnVDkrTG1qZStYWFliSDBYSVlnODJybXdxbVlzdEJTbkF0?=
 =?utf-8?B?cVdZeXZvaFljRzlvbU1LaEU1VFA3YXBhVFVHVllJdTVvU2kyNXRmT0ExZ3FR?=
 =?utf-8?B?ZmdsOGlDUUZKbWcwKzJwN0ZDRmJXS2thN0ZxWmZCNlRUWlZpRC8rNnRTRW9v?=
 =?utf-8?B?SWVsUXNPSExwVE9GTE43SDJWaG9xOG5GbUtBWGFYQ2E0S0hLeDBxbzFQZmgr?=
 =?utf-8?B?TU1vSlR4NHZ4OE1pbzZCNGdXZ2lVZXh0UWFQQW9mZmZPaUk0TWkwVmVRdEcv?=
 =?utf-8?Q?7LLMXziOX3cILAJeHfXrGr/Gc1UDdgw9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWhUSWdMNElBejJVMkw2OTNNV3hFYnhwblZXUk1jbUtCcWhFYmVyMkRyVnBw?=
 =?utf-8?B?YWt2V1JYOHZkUGo0UWVNSjZXZWZNMTZiV2xPS3JvMHJ0RllDTVU4a0pPZHZG?=
 =?utf-8?B?VmJVd3RzYU9qaTR4aVJFT0kzQUxvem9kcUU1NGlQTlVQRDFrNUVrNC9FS2Jw?=
 =?utf-8?B?MWtmWGFnMUdVdXdvWGlWT05NSnJadkowWDUvOXk1eGRCZVFpZUZKanZmNFFs?=
 =?utf-8?B?N0RkSFhCTzZvVVZjLytSdmR3WEhUaUV2M25iR0hiN1I1bDdKRG5LK3ZROStP?=
 =?utf-8?B?RHhtbzdvV0JjaFQ2L0dnVy8zNTFYRURnd0k3VlN1V1FQUG5kTDlhNGpwYWRs?=
 =?utf-8?B?bzJrVFVxbnZQck1KUlZTOWpIMG1iY0tJeHViVThHaFRIVkFkdnBIek5MQVBp?=
 =?utf-8?B?NG5NTTlSbEJEM01BYzlhYkxSWmJiMGJNckwzdVhNWG5iRThFTVdWNUFDL1kv?=
 =?utf-8?B?SW1mYjdpR2plekMvRDU4TDZLS2FkYTdNTG03Q0txVi9MdThFcHFMQ0s1OE90?=
 =?utf-8?B?d2dBcXN5QW1LRCt3bGx6R2NRU0diVlNRdkNpOEQrTUdFMXNKZjVsdlpNMGFF?=
 =?utf-8?B?ZWxCSHVzbmw0RlQvYW9pRGRkNWM5MFdpckttN3plTjRXWUZDTXhuWWVJK1BJ?=
 =?utf-8?B?STJFaGF5YXhyOFJxS2pRdzloaFhiNTF4TUQraGRhNHdFS2NBZkdKUFRVdHp6?=
 =?utf-8?B?bmNaelQrM1ptN1R3Sys1SmlKbkhvM3RQcithc09vczZFUGFIeW5aUEMyWXpv?=
 =?utf-8?B?bWZPaFVMWHZDQ291aE1vYWtic0NRVmZJZnFNTEJpNDFqTWIxQmF4TjFkTVlw?=
 =?utf-8?B?ZHZWMzgxaVd2dWFJcGRxQ0o1SHlWVFlYbDhRWGwzK2xrZjBEbkZOYmszOTZS?=
 =?utf-8?B?NGd6bGt6cFFuYnRMY1FEWTJkUmhqUGtRTnlRTWZWMG1aVlB6bS9ySk5JeTFz?=
 =?utf-8?B?MjZkWGZNYXI4TVZwbjBjRWRINjJoYk9ha05FdHFGUFFFeHlBdGxyYURvVDU3?=
 =?utf-8?B?SWx2S3FUZEdmWUFpN0UrNjMzQm1LbE8vK0F4SFI0WXRlNFJSc0hEMysva2pk?=
 =?utf-8?B?MHZ4T3EwRjBDVDZDSWZyUGRCWjVGRkUyQXg1eVpQRGhVSjJYSWd2TTJNQ0hO?=
 =?utf-8?B?dzRvL2lzdjFCZkx0QndtaEx1bjd3b2RkbmhkeWJYeHFsWGsrOGwxQ2RudjVK?=
 =?utf-8?B?VVNjaUszTkg3djROeWlhYUJSbEgrcHFaWmdpcnFuY0xxSWtZemR1OVJRV0hi?=
 =?utf-8?B?WEdidjNxRFRxQkFldzlqeHp5YkNTOWI1OExtN1FkME92aklKd0FJcjJJaFhi?=
 =?utf-8?B?ZXdqOFRSbVpjd3BXbzZJbEI3bkhlaWNIeGpnbTViOXhZYW4zZVl4WHRoalUz?=
 =?utf-8?B?bHNJaHBhWTc2d0FOWWlzU3FJUFYxZnUzTkMrK3JCSlRRL2puTlNaNzhZR21B?=
 =?utf-8?B?bXdVaGFyaVNzY3Y3cDdRa2IvTmxuZWxBc2FRcENJSVNhbHU5SEJickNZTVEz?=
 =?utf-8?B?ajB5TEtaKzVpTGFGV2dBMWtXZVFtT2lXamx5YndMc3E0bG8xTmI2UlNjYmFn?=
 =?utf-8?B?US9iM2pXd0ZyMEZQQVA2WW5rQzJBMzRLVzFzSEd6T0kzRzBnMExRNjFzZXR1?=
 =?utf-8?B?UVFjdkpvRitjZi9OZVVaMDdlOFdJKzhtSWZKNjFKWWIvcnBKT0ZYbFZGOW5l?=
 =?utf-8?B?LzV1RldLL2xKekZBcEJ2Y0R2TzZJQXBGek5YalFtOTR6bCtxb2dWOG93N0Q4?=
 =?utf-8?B?TE9yMUh1cVNtQ3p0YlQrcytqR2tsYnFLdm5zVHNaMC9NMkJQeHZxRm5mc29n?=
 =?utf-8?B?Q28za1Z5dFN4TDJLa3cvVS9RVEt1NFJ4bHArMXBtSDBOSThPTkZ1dnlpQ2l1?=
 =?utf-8?B?UWhRdlNML0k3Umd1N0xXRzQ3Vk1zdCtaeHphVVpnTFU1dnpBNmVtWVp2RXY4?=
 =?utf-8?B?b1BIazhyRUs0UE1JWHBldEVYTzBXOXFUS0s5YSthNnhpdW5IcmtiVG9NWE1W?=
 =?utf-8?B?SGoyZGFPTVNoYmsyTXFyOUgrTVZGdkJDbWI0UVpIeEY2TzZPTjVUYm5NQnhy?=
 =?utf-8?B?VVozS3RYL2xlUHhoVElRN2VFYXRaZnZjVFdSQ3BORGlYWmh2REVBRHlHa0p0?=
 =?utf-8?Q?TaPeBHLJtVQwhECqQkAqQGnxI?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e44887-07b6-46f3-fc66-08de2cf29f2a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 13:49:29.9366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hszxd7Kiu5SVqdaVTxUJGJXAZq4hJYPVSlrNsqvY+sxKrwa+cH/856v6JEfsOjJb2Y/ewTdTxDnUaLi1+2i52g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6545

On Wed, Nov 26, 2025 at 01:44:25PM +0100, Jan Beulich wrote:
> On 26.11.2025 12:29, Roger Pau Monne wrote:
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1547,8 +1547,7 @@ int vcpu_unpause_by_systemcontroller(struct vcpu *v)
> >  static void _domain_pause(struct domain *d, bool sync)
> >  {
> >      struct vcpu *v;
> > -
> > -    atomic_inc(&d->pause_count);
> > +    bool was_paused = atomic_inc_return(&d->pause_count) - 1;
> >  
> >      if ( sync )
> >          for_each_vcpu ( d, v )
> 
> Isn't this racy? Another CPU doing the INC above just afterwards (yielding
> was_paused as false there) might still ...
> 
> > @@ -1557,7 +1556,8 @@ static void _domain_pause(struct domain *d, bool sync)
> >          for_each_vcpu ( d, v )
> >              vcpu_sleep_nosync(v);
> >  
> > -    arch_domain_pause(d);
> > +    if ( !was_paused )
> > +        arch_domain_pause(d);
> 
> ... make it here faster, and then the call would occur to late. Whether that's
> acceptable is a matter of what exactly the arch hook does.

It's acceptable for what the Viridian code does now, as there are no
current callers to domain_pause() that rely on the Viridian timers
being paused.

TBH the Viridian timers would better use the vPT logic, as that
avoids having to do this manual housekeeping.  I suspect vPT wasn't
used in the first place because when using SINTx the same SINTx could
be used for other purposes apart from the timer signaling.

As a result the current logic to attempt to account for missed ticks
is kind of bodged.  It doesn't detect guest EOIs, and hence doesn't
really know whether the previous interrupt has been processed ahead of
injecting a new one.

> Furthermore, is what the arch hook does for x86 actually correct when "sync"
> is false? The vCPU-s might then still be running while the Viridian time is
> already frozen.

I've also wondered about that aspect when using the nosync variant.  I
think it's fine to stop the timer ahead of the vCPU being paused, the
only difference would be whether a tick get delivered in that short
window ahead of the pause or afterwards, but that likely doesn't much
difference for the purpose here.

Maybe it's best to attempt to move the Viridian timers to use vPT
logic, and possibly get rid of the arch_domain_{,un}pause() hooks.

Thanks, Roger.

