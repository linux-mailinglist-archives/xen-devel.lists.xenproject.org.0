Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD845B1E05
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 15:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403348.645429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWHGl-0003S4-Ps; Thu, 08 Sep 2022 13:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403348.645429; Thu, 08 Sep 2022 13:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWHGl-0003Pz-Ml; Thu, 08 Sep 2022 13:08:35 +0000
Received: by outflank-mailman (input) for mailman id 403348;
 Thu, 08 Sep 2022 13:08:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56Vh=ZL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWHGk-0003Pt-OI
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 13:08:34 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00056.outbound.protection.outlook.com [40.107.0.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57a5a675-2f77-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 15:08:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6408.eurprd04.prod.outlook.com (2603:10a6:20b:fe::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Thu, 8 Sep
 2022 13:08:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 13:08:30 +0000
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
X-Inumbo-ID: 57a5a675-2f77-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+HOvvABwF7y48ieTVDjz11JGunpV1poH85wxSAGW6lEXoixaAsNA5X1A5JXxSDBDlgs3t1kQhPtZigWPDkATXA4VZG2/1dkO+L9CmdTaqd3O5DhDnmryTt27lj8n3LktGrExdbUC/x/WykvcqztMonYxE4zZB6w3sc0GlcR7DYpH/G+6OQMcxbmoSMjJS3Kzh4z0UAJ+hPalFnXGfaf3/aLX3YRr7BWZVUESbfqpZE9a4HlQ+1w3jp3QLlvc+nnHMkfTXLpyytzTjbkU4I1POKFZp0fGlOR8khXKjvJaKgDK2uEgak7mckxn1ENlrVI4qo7F+NfDI1E3k4og9iIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nd080d/W96RLhwf4IfX72LwUsiztqY2/mwC0sYSn8ys=;
 b=A4bDBy8s+UqHd6f9CQ+NmlL9LIBSvRZmhzawItme/2KICEPb8Yk0G0KUyKFsqPud2TEvulyHPUXsZe7HM2Ku0hHFPqzPhLgUVdxAfLTXXgV+cZndWpWbqQ4Eu4DSwgHZQVzXZn1Di+P9MfHDJqoBpGfF7jxi6Tqy3HNKCR96LbsABDc2ceEUJEC2OogH1z9frUsUXZbFBdLN3oax9VifO87TYswp13Pnx6cE5ceh2I91TJH4SA1to6K4KSjFJqeO9Dd722nWJerReIe5w1rD8ThuoNPPecjW/d35ja4LFGwPspn7GN3Bf6DVXMR2aXzrR/BDBl0U8og7Yrbq8Sq5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nd080d/W96RLhwf4IfX72LwUsiztqY2/mwC0sYSn8ys=;
 b=VjQvSLnT5sPQS4VG+UHDzqujV+2i8T0u3nku3mYfKDdeFVNtwWvK5/DkNUhc/3krQxBnbXmwnTRA7oziIl2CqCIqZZeMXqbaYiUfpLcncyndrbXkKFYS55ZWxVlrlwIrPOd5BeYLsXHDGSd/KDA22nSNxyEitx1unnPo7d3+d7kMqbBJS5JLly72DvjRDrkl94HGeoNNiLSfTP/5mTqDwJBrwj3wkVwWP7jRGSqGr1Yy9QIJzsBNUSWgawxpobabAsuq9MFW8mWYcKPI4qUWgCUoLGs64VlDEA8iphCTXryB1v7kLtNa20lSGa7rgp18eJWkKt/7fd8kKZCdFGU83w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee6862b0-5c05-5124-7573-0d67ba89cd5d@suse.com>
Date: Thu, 8 Sep 2022 15:08:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/locks: add dynamic lock recursion checks
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220908074619.18221-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220908074619.18221-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0046.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:458::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM6PR04MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c48967-847f-43f8-7a4c-08da919b3a1a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JBbGre+IkcQMjCAKpyQ+RkeOTYN4VAXbxx8FslYQ53J019EmbjkWNFJdy4iZEYhfy3tjSUsbijezXPB+DMltrwvtdNnql45hbTkUxk8ExIFJ7XRZQ9ELIhXCpJeEQRDT58N95KNPTyny/iAQfZsgWEhrcbkqSDtXfMSZLc2uSI1roUlV07+2bhKkS6IOj2RO+9PCvQWi/4ORd+tC9srE7WOgp5IqnpeG8v+6lFyp5h9XcPv4c+CVHnsY9v8jgd3PO5IXziGRJoUOumhSKPr/NdBw9JD+VlXUqDbE3pq2m1kPG9C5l+6gfYXikWxGqMfIdTdAxHNmHiRRLLceT86aBbLuZ6Mz4jP7Li1sNqVl9lrglEuCiCDFuCxhEumFvbR54FUkIgmnOoL72h5m/svC/EVvxKHGjSHmPWMsXZo5pnDC7b1gXn6WCqrRxJqFFAqt8zL6FKN2Zjo4O+JJFGA+DvwPC+eUFw/3AM1Vv+kcFzedWgO1DCxWHQErf3FgwJGQJny0O1iIy8W2tc2hnhdZO58JW8L0gB4oYxcO09x4Dw2wKRlvrb5rsTf07irL/j3+c46EbdSIBuXsgOgoQ2UBN0sFxH7WWocvLegr3pr6joub7m667XnRj47oGJGBGtCdtj1Vv6wuCaAKkFRZwl5xiz8WCi06EthaWSzcRo6IMkaiHbO9buJy+EJJ6R40UFH0Tlq9fiuQfqa4iosLBpe//g7petU+oVep/9yq2MhD/329ek0ChcHmZca+g4EFykycDo2RK/sk35IheTlKG+Y4t21Ccm+RvQDaNTXXwGj8dEo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(346002)(396003)(376002)(136003)(8676002)(83380400001)(66946007)(8936002)(5660300002)(66556008)(6862004)(66476007)(6666004)(26005)(6506007)(478600001)(41300700001)(186003)(6486002)(2616005)(4326008)(53546011)(86362001)(37006003)(6636002)(54906003)(316002)(31696002)(31686004)(6512007)(36756003)(2906002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlY0SWtOMzNIRmMwZmJYK0N0V0k2RlE2cElFY1RFK2h0WVhlVjlkZXUxWUlS?=
 =?utf-8?B?U2w1aGoxSWd6Y2RVZW5RR0MyUHlvOGxEZXVZK1h4N3BZcjMxUjlkSFVKRW56?=
 =?utf-8?B?dUhTQUtTRlJ3YWMvOXo5c0pwQ1F1OWt2Z1VQVm1rQVdsNTZnSHBYand4eTky?=
 =?utf-8?B?OTJqbjd1aHM4MldENmdkOW1pUVROeEUyV0RzUXNseWFFQm9PQ0lWWG9WSTFZ?=
 =?utf-8?B?cWlEdHJad3YxQWc4YWU3L3c0TmV1UFl2V3dsVGxyZ3Q0bzlaSy9BVjhqRnMz?=
 =?utf-8?B?NDNqNjVyNjUyclJvTkZGWW1sMFR0V0xBRm8wVWYrZVNZNjY1ZGQ0ZDRLZElv?=
 =?utf-8?B?Y3JRaHJwRjZiVW9peVNoRnc2Vm9Wa2pVanVQamZZS2poWlE0bTlBSTQwL0h4?=
 =?utf-8?B?ZTJDOWZYdDNQV2pwYjRUNTJIb2IyN0RzQ1JBQUs0MlREZS8vdk85bUtFTndJ?=
 =?utf-8?B?RURsZ2NBYVdiKzlhVXZhZDZONFQvbnBUMnhvKzFqd2NXdTg2Sk80eGNzekIx?=
 =?utf-8?B?NEhnUWgxM2lyWlVubkZRS2Z5VFpvMjFoSzBqVkcvV3NjVm9kK3F6VWFDUnhZ?=
 =?utf-8?B?NWxpYzZSTkxnQ25jWVNpUml3L0NHTTVudjZCdFEyV1ZjaG5uMGZPbzhWOFd2?=
 =?utf-8?B?a3N4RWJacUFBY0lIYVN3RlRoOXk0NWM2ak5jWEFud2ZnOVc2enVNazU5ZE1M?=
 =?utf-8?B?bXFnK0ptalJQQ3RYcTUvaGJqWGdmalFaZnkyWi9mK1VZSU03TlpTZVhSd1l6?=
 =?utf-8?B?Q2h1RTVrMElZdDdZRTdtUGx1bS9oc290L1BDZEVvRnp1T3VvTm1xR29zMVM3?=
 =?utf-8?B?OExiUVVlUXhObGhJT1RFQUtzczByWXlkUndNVGhrVTVCbWpIRi92SzFQbDRl?=
 =?utf-8?B?VjNJS1A3aEJZckZNSW5sTnkrbTliZUZoRDJvZmdGZTAxRXYxQ0xyS3h2cTNq?=
 =?utf-8?B?TGpPUmF5ZE4rVjBReU5PYTU5cUJTOEZHTjhxSkYveEEyRWJOb1lwVFFmLzZ6?=
 =?utf-8?B?VEt3QlkwVHlVeWFFL3lWS2x4ZXNnOExuRDJJb2lEWTFqaGY2cGp2UVJuSldC?=
 =?utf-8?B?cUpad2V6ZWR6UWhQL1M5VE11Nkd5VFl6U2g4czdTWENkaERnYzFteGpCbUVT?=
 =?utf-8?B?Vy9ITC8wM0pQekRXTmRjdW9xNHVXQXN6dWVxWVhTRktwdGFINkRHd0RIWWJi?=
 =?utf-8?B?VVdKT1dOSHdwb0NFb1lCeWt6WmNZc1dFZGx2ZXRXY0JwUmp2Y1ByRGU2TUVk?=
 =?utf-8?B?blpnTG9pRXUyT1ZOMDRLaFlVNDZzWkoxODNPNHNuTjIwNVJXdkxHNjZlQnhy?=
 =?utf-8?B?UVBRbllqZmdvWkZmUFl5c2VmbitmdUNjVmthc2szZmJNcDcycE5SaGlFSDBj?=
 =?utf-8?B?RHBmaUxEeDRMNXN1WHpoMGZZeXRiTk1CdFhEZGtWRUhWbFZ3NGNiN3k0citU?=
 =?utf-8?B?azJpb2EzSnhOTTdQLzEvS3ZnNGxQQlhpSHlaZDhZL1ZvekFxUmJWQk5PZk9j?=
 =?utf-8?B?eWtxK0tuZ25YWXZHMW9lR01CYjYwcDZvNTFVTDBWaExMSkdsNEhIMTRnNmJF?=
 =?utf-8?B?RlV5MjFBdWhIendydDlScHUraGVFSyt1WTExM2kxR0g2c3VKWGU3UWwwNGZD?=
 =?utf-8?B?NXV4ZlkzMUFzUWxCL0ZjSkMwQStsdXJ6L2QxQUhmemtqZForVW00QmpSU1l1?=
 =?utf-8?B?L0RSdEV4eVZLQi9qNlIyYWhIbGNLbWkyRDgycUNwaTRSVWpBeVN1cmVENW1P?=
 =?utf-8?B?YmxnWmpZZFc2UDlCekFkR29FS09QczJFMytvWDBzbE4rZ1c5VmQyb3Fuak9v?=
 =?utf-8?B?NXZZbXFmeUxuWU1XOE5xZ1RCMmFEdFo3TmdKTHVQMjNVNnM4VWFub2NRM08y?=
 =?utf-8?B?bU9jZUd6TnluL25YS3FTSWllM1NrS005V3UyNTI4WGc4aWUwNUp2Qllvcm5L?=
 =?utf-8?B?L0VwZDZLTTNrTlNIeEgrODF0NlhyS3dGc1dHbzcyY3RXVnQ0TXEwaU1iRUV2?=
 =?utf-8?B?ZnNTRFVNQkNPY3ZpZEwzK2NSandUc3NvclA2M3ZzWk43MnpOL29GMFFNbktj?=
 =?utf-8?B?djFJQXg1U1FYMGlmNEpmQm8rdUZYQ0RUZkkySGtjK3R5OTFKNXJnN2Rlb2lw?=
 =?utf-8?Q?WuxBe7ga2cIsuIoso769qmuVw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c48967-847f-43f8-7a4c-08da919b3a1a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:08:30.8681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfuiu0FzU4GU84Eh1KwIC3JnmbqtuhbKEFtPstuaApJq+sF7YWwouhvl3h26QYtVmXl/PVVQwncoX4F0NeB/OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6408

On 08.09.2022 09:46, Juergen Gross wrote:
> Add checking of lock recursion to the hypervisor. This is done by using
> a percpu data array for storing the address of each taken lock. Any
> attempt to take a lock twice (with the exception of recursive
> spinlocks) will result in a crash. This is especially meant for
> detecting attempts to take a rwlock multiple times as a reader, which
> will only result in a deadlock in case of another cpu trying to get the
> lock as a writer in between.
> 
> The additional checks are not performance neutral, so they are enabled
> only in debug builds per default, as the checks are active only with
> CONFIG_DEBUG_LOCKS enabled. The size of the percpu data array can be
> selected via a boot parameter.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> Further possible enhancements:
> - record address or file/line of locker, too
> - add sanity check when exiting hypervisor or going to idle that all locks
>   have been released
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

But left in the queue for 4.18, ftaod.

Jan

