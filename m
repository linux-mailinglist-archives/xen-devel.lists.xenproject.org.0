Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A319C66C066
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 14:57:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478628.741913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHPyt-0005NG-MF; Mon, 16 Jan 2023 13:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478628.741913; Mon, 16 Jan 2023 13:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHPyt-0005Kj-JS; Mon, 16 Jan 2023 13:56:59 +0000
Received: by outflank-mailman (input) for mailman id 478628;
 Mon, 16 Jan 2023 13:56:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHPys-0005KK-MJ
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 13:56:58 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2064.outbound.protection.outlook.com [40.107.105.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a32658fc-95a5-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 14:56:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8295.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 13:56:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 13:56:53 +0000
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
X-Inumbo-ID: a32658fc-95a5-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLMcxJCTMbskZ+XBgKOlEOVJAA6FsiPhk14PiS1k8auXdgRa7BDAlw0iscObYSjObUec6xjz8dcQLuPoKjrldpOp3qZNbx5STFNA5EVah/x9MJxnOP3OGOFyDJXm2BaKz1Nv9soPe15ADlM8JZRSgT5m6kmrywuUOuLv8ROgLWPu7wyFJP5Wgu/CiAqw65XEk4hlLP6/RcxWzR5leaPzjtpDN106yqZcvikmemTTh+w4lNJYPNLfw+p+wvLbupC6+ODTR7mzE/BaWOdxqDDBqt3bnY+z77D0Y7zhCZii6HchAcWQdDjoU8spN6P4EjrOxsddnRnEz3yKT17zFa3VYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w31jkP7aOjVeauELbRNQ2T+6FKKrIvCsUNdDh5v2KVw=;
 b=BHCkBWZxgy55Sh8TdWaWIJpkcxKsEh8TWj3xcgQXOgjFPqRzVQAF9hfsXo5h1V3IJrOHDpADNVQlcfU1IphuisNyA9YhFYnpfA/yTF3uqiRbtai3MyyXzI3IV+V0nIJYAvoEDUxHDVatWVOM0PztF2+ae+hdmPQFemPC+4Qoc6noLTwJgM478nH0VPEMY5MN+qvmwTowDdgsDQX4Mv0F5AYJTidIhBW36QR+wbJc3ow5TdnkSZoeHq7G4iGMqxHMuE5dIAHtdb+A6lpvmr4Qre/pNhfz/Mz8Nogc2ajd5e7ERFlZcCWVs/BsJJuKqpQ1P/+82IetZd2okIMPqEK0XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w31jkP7aOjVeauELbRNQ2T+6FKKrIvCsUNdDh5v2KVw=;
 b=LIt6JG8j6pW7iYrfNuFIU+cgzjiJCfc3oyobSn8wF5CLpYX/EUewHUkfkTW43eY9EhTV2BQQJ2bi0iHYxAOk7XI8k3E2TPvY+yeLJAYIYTPYetSYfmTZttIpPg/E+X0WY6wG2oXcrEH4dozSp8IdRoLLGVBcpA9EAnDETm60vhggszSK873BLlbcLLJPTU6ZQ2GcRr3mfaaz6Ldsn5YKmAdQj43ORSDYY84/oMc9/cSbBsURsfkX278F2qSvrERKqjmE5xgGhivSgXJRuj/T18zqFZyT+rd1PH9jnpudBK1k/YRvpWvfilhXg8LTbpe4OMSjgQrrQEVJTJCakefX8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59a9637c-e7fe-a99b-43eb-1aff7ffb4b76@suse.com>
Date: Mon, 16 Jan 2023 14:56:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86/hvm: Drop pat_entry_2_pte_flags
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230116120201.2829-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230116120201.2829-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d8dbad-0e68-4cd4-f132-08daf7c9859a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZW8xKNLQ43mCBkyNP8kKWVixbg5Is2upY+cFKWxhZ/HNaEJkgGd2QMCHl/6blpzaFSgOuMZ3Mh/DZd1+RWtaqP3xvrEC0al0w3P1ALz7nw3Upc7RjHcgUoBEJ9KRvE67Nh2fdyFJOV7wlGA/kQCqU7oGpdWxRebuqtEpYQ/bVwfS+mFeTAC1S1YAfxhUyZHkxgclfeFPyD9/IZfQQAdjoijrVMO8nER651QI9gQAzHtZt1FafuqoGB8xzOZRyMdNLpY7MXO6l3WTj+ZOna/+26A6R9IkAOruMTSk51hiXKGwYKtur7tW84Ty/a+kjRlwOzRMNCJhEJLoKsTH1MKhvXYzz7MEOjgEEywi0rqjxY/DsVUpW4bDnd/zCJn5K9N2xYu8gvb5muNTS7QLtTqm6o7bpzpw2UfSrCVNeBqw1XRx0ZAMkyl2gz4JtcTlZzhSa4Or/OZmjARcj2VlNsPYrW6WpwrEt5sMjaC55UgiFiFLNs896Avlvon01dvMcdJZ28j2NxSIZnzS0vxHJcYllih8JHtCUYmbOlKHas+kAA/L+fw0xq15y5/HPhYpzfuIlmORlaA+dOxREDeT1LjgzYVsz+ymJVWVW9oukoUDNzCG9ooh292XHe3nJsve8Q/3g+Vv+aY9t+j2AaxGXQhADK008I5wY8LkaE1fADnF1xK6D7XAxS45iKCcyTNVNQTVlRWpDPtnkamkzxfgS9SQz/x7FZMelzF0u6K/lFv1/bU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(346002)(136003)(366004)(376002)(451199015)(5660300002)(38100700002)(86362001)(4744005)(2906002)(8936002)(4326008)(66556008)(66946007)(66476007)(8676002)(31696002)(6916009)(478600001)(6512007)(53546011)(186003)(6506007)(26005)(2616005)(316002)(54906003)(6486002)(41300700001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXhzUWRnNDRLczhFZTR3WExnRmlTQjV5YlFBMkk3RUYrR2FsOGc5Q24zRUdv?=
 =?utf-8?B?NHJmdFZIS0Z6WTFVcU9EUW04cG02bWFqM2xkQVNJMGZ2N1RjcHhvUEFFRE1Y?=
 =?utf-8?B?VEJxeWVISXlnR3p6V1dzQzh4aFlaLytJcG85SjBYd3BXMUNKYWdrZkRjRnAv?=
 =?utf-8?B?TmhGZlNGNzhMNzM0M2FCb3ZDQWRTS2NLSlpnbDdtay9oaSs5YTU1Y0lGTmgr?=
 =?utf-8?B?cUQ0VlA0aW9mVy83R2x1K1hUUExhOUlKWkpOM2w0WXgwckJROW84V3RSL2Z0?=
 =?utf-8?B?TU5sdVpGSS9tYWJMdmorVURDYkFlMkpkZUVTcy9CK3EyOUs2TVRYa2kyQ2Vj?=
 =?utf-8?B?NDNMNUdxUXpId3l0MndLZG1wK0c1Z0txcWFtbkJhR2J0NEJxNU85SGtSdTk0?=
 =?utf-8?B?Q254NDE3d3hQa1ljaTUwTmlhQU9xZ3dBZHZreVhoVUFteVpnb252Q2pJMVVy?=
 =?utf-8?B?cDNDN01jd25RbDU4eFMvcGhYM2VSOFdtNTY1OW9DM2ZSUkpvak8wNFdaRi9E?=
 =?utf-8?B?N1VJU3lxNzNTNHZUQXB6bThVanRaOEhUUSsyQUhqWTh3NnhiaWphOUgxNlFQ?=
 =?utf-8?B?cnJrajg5VWVEbERLZGZPb002OFR1bXpYYVRESnhlNmlmVXprMFpUWmJqbjM4?=
 =?utf-8?B?a3FlRUE2NVNZalpGWkl2TWM3QjhNOWVrRGRDbW0zMHdBdE5ic1l3cHowNG5L?=
 =?utf-8?B?MSs4T21lMTM4ZTR0STgzamFBcU5DU1dXcjFidS9jVGsyamp3MXpxTEZ1MUIv?=
 =?utf-8?B?L3JLV0ozNm9GY3R6Q3JXRnBTTHU2dW1BYlZVVHJRYkcxT1kxREJFK2M1SjA1?=
 =?utf-8?B?QndvMVprRWU2SGJydGpranNXcU9KeS96OFRBQVNIa3kwMklnT2E0UWwzZlhn?=
 =?utf-8?B?NnpFSHNVbGFrME9SNkptZyswMDh1d2VrTWpmVmppdmczcmkvd1JndmNjamht?=
 =?utf-8?B?SnlVVFl5VVlodG8wK3dyWXZ6NkVVN1o2cmtULytTVStqUEREK3RSTGVPYmN1?=
 =?utf-8?B?dGVuYSt3ZnN0RnNOYllSeGlhVmVCeEFsNW80c3NmbWdXUW9NazVhSzdQL3hK?=
 =?utf-8?B?N2FqMGZPL2ppTGtvbFFaZTlkMXBtRVVTc1pmQTlEdC9jUnpwaHRSSzFHemg4?=
 =?utf-8?B?L0o1aWwyQ0RJd3JpT1UwNGFaTVVZdUQvci8yZjZFZVFoK1YwT0dDcFlHTW41?=
 =?utf-8?B?N2ZKNDIzeHZPc1ZOM2p0SHRLOVhFWU1DWWJpYkw5QzRyVUFlMU9QYTdxVlBr?=
 =?utf-8?B?N3h1cTA3QitDTVd1eTRhNFRkaFlmQkNod29GcFdrUUtXYlNpTy9KRmJQWDFI?=
 =?utf-8?B?anByMXo3VWxudHdkNEpKeDZDakxFNkxhR3JaTmtDNEpmMWFvZDRpVkljTi85?=
 =?utf-8?B?MjZ3RC9BYUVhNjZTVnEvUE1Pb0h2QjV3UmRUa0ZXNDF3UC9wVm95a2p6MndB?=
 =?utf-8?B?dzZJMUM1SEhJdlN5Y2V2TXI5clNaWVBSb2xmVnVCUGNIZDZ5WkRCWWxhYksz?=
 =?utf-8?B?SEk4NGVLQzNpWTM2WncyU2pkZWY3Vk1rY1NJcUFPUEprNm5KTjZhdWluSTVp?=
 =?utf-8?B?L3g5Sk9raWdVLzVRKzVZeGdZeGpLVDVIT09JVHRNeDZtUFJWd0ZjWWZqRWVV?=
 =?utf-8?B?dTBTWlIrVUdpTE9ZMWluMTJ4cmYwWWV0MmswQ3JwbGVJUlBrUjZGaDVvNmJz?=
 =?utf-8?B?MGlidHB6UzBoWGxNY2FrMnIvdHhFK0ZMSnJiVmhFY2RSR2dOOEx0RXRQbzdJ?=
 =?utf-8?B?cDlIYVlQMDFZY2ZGZ0J6QWF2ejJuT1cxcUV5ZXd2eW9GMVUzS09BNXErYzBY?=
 =?utf-8?B?NXF5TEFLTG5tM0lnMUhMdERnT1VMSjh4c3N1aGxXcnpJbWRlNlpQWWVPekds?=
 =?utf-8?B?dDhhRnVlMlM4Z1I4QXlWUkpObk1SUllmd2ZpRkdLTXB2VmRmNHJGZjU4R3lo?=
 =?utf-8?B?b08rd2VpdUIrMTJwL1Rkdm8yK3dscHpwMFpHVlNiVlZOWHQxY21lUkdhNzVQ?=
 =?utf-8?B?d3hDdVRETkhsTHN1dnJuOUt5ODVEVWpKaS82WWlHWTJZaTZMMzNtdnJoQWg3?=
 =?utf-8?B?Qnh3RlR6UkVkT2NQWkFNQ1pHQTFHZG9GZTVUTTBCcWU2eVY2VTd1K3VpdXdt?=
 =?utf-8?Q?fjidgvI7P1bDIZcTTd3OTVMEF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d8dbad-0e68-4cd4-f132-08daf7c9859a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 13:56:53.5544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Bz1ZYfWtEA8Z9XFkdLHQp86OJ6c4M2+TxR3PH7gG+gT4buMQxwQJizsLsXnyc9uMqyxzsCgpAzjLHnci7ewcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8295

On 16.01.2023 13:02, Andrew Cooper wrote:
> Converting from PAT to PTE is trivial, and shorter to encode with bitwise
> logic than the space taken by a table counting from 0 to 7 in non-adjacent
> bits.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



