Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA549568268
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 11:04:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362001.591833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90xD-0004Eq-Ut; Wed, 06 Jul 2022 09:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362001.591833; Wed, 06 Jul 2022 09:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90xD-0004BT-Rr; Wed, 06 Jul 2022 09:04:15 +0000
Received: by outflank-mailman (input) for mailman id 362001;
 Wed, 06 Jul 2022 09:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o90xC-0004BL-Hd
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 09:04:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60069.outbound.protection.outlook.com [40.107.6.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9aefa537-fd0a-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 11:04:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3474.eurprd04.prod.outlook.com (2603:10a6:208:1e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 09:04:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 09:04:12 +0000
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
X-Inumbo-ID: 9aefa537-fd0a-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oe7zn9FJw8YnXXzmcpSHnDSAAluHhlPqFewSD8eISNQ6CyujGdOZbZksbatVll9qmZJnU/GDeeLflSRsiS6BjjKD/S5auq0b0kZRK9oZesmHqjqb4dN3Ck0URnhmA8zUY94TZD2IrxqEQWW6WpKwShwIYvx4g8Igv27haiXWeDX80uRXHMn4F01cFlpk9rjYWcvttcOp5/AXWabsbYiCnzxb8pNuIJKGcWmfHOW2dotPRHQeaqToM4OTm++xSdWB/wQFQnN8MbbO6g3SPMVcer8UtzY3VxPp6Q0h3xcGBk+0NWjgfgYe4fIhIP9LGZmWuDCBJmLQ5w6G0eHNyrbxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4nFSsecvelAWpIaWprEtG0wVFTJDUOXDZi4Qvv0RFg=;
 b=R8qin8ZqFgUmbh09fY9NV/1qt9EtZVtqHscwWDTsunBCnro+1jytqxsBg3ongWozPUpJA1il4YSh60+fVbliawlPah/QoRkY0RfY5ugFOc3Xyk4PlxxDm8A6wlkEghv4vOAKZvAh9sq6hcyYVQlV+srK8mp/veFQgcwireZJ2y0uZQ3kB/gPAQltD1nRNRqPhXErEJWdoy1fvyBT7xUUii6L4bRTffw5LlIHUkZNKhzee7XsbsCV+gEOTMH0Vn8IW2y+EUkYu95H/5acNNn+/ozFskXYXIIBoxtLcSg5XKdMwZAZEZH0lxBiLE+dyFFcVvgnxNlZa5HuO4zlu7uXOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4nFSsecvelAWpIaWprEtG0wVFTJDUOXDZi4Qvv0RFg=;
 b=1Dgci40YPLVLBgCdVQoTA5+P5vmG9QbdZKc8kPJX964wZnPMLR4oLQRU7RFLEbI6XgM2n+crkPwoTFzP+5MZ9VrvXfG+XORUGgcA2Da4NCbQiEFu9qghWs9SUut5EFYrueoZlGVKRfwlu6Y3p91g97Ulh7yHVn7Dc6qZc/7fZJJSI5BBLJ2TbjJQPe3zXHR9Yfv/7c4CZTMKbM6TKYOjqBVQimClvPd1UdWkvSC47KlUE3R2iLLr0toZGT3vrEJRGxnEWBsUs3MKz6yZuq7QfDQzG9I9IIf4Sz3UjLVM35D4XrK2vW6qp1NABodbnayl6wGfD7PUEXCfEGtf4WWQxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2377d0fc-1234-56af-fdef-935bdf8322a3@suse.com>
Date: Wed, 6 Jul 2022 11:04:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] iommu: add preemption support to iommu_{un,}map()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220610083248.25800-1-roger.pau@citrix.com>
 <AS8PR08MB7991720A18EC4E6941C5B9B292809@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991720A18EC4E6941C5B9B292809@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0100.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8c1b04f-2257-46af-72a7-08da5f2e7e98
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3474:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	28QWXheLeHAY3sU19lFLqO1Fyc5OeSEbNpUON8EhDmdNj4LjPQJw5ad4aUtRxmR4JdMUYZha+WMKtw6mIYHIVnaJIaqyFzjpWawJfsJMmnxmyzMKDKhV7ZMfYKHrfrNwXXhxPz0PK8HXhgLk5N3I6jSmJe96Tsqjob51WYTY82OUaYlqK3lVCN1fK097h0POvn2ZK1HxOrnEJkz/AFZD3zn+VBfkAzcW6vq33BC6kK4kokpbUZTvCj0y5e7DjTOMyoWDDAGjqIYtG9CcU1dRiC6MiYredIxT15AVfIRDt/iK/wYdS3bP2x2dUt7vl2LzxA0qjwPH2D7RObRBKXuw3ME3pjVjwni1wJ0RMbqJFJJDEJ41MoZp9PeE2yNeMnTpMF8DiPySDaAsdhmL8bIeaU/DCKC9Id4EH/NNotjLyCW59BP/HuNI8xO8wZZ7xMyEXhJwqPFURhhMC4GZ2dj/Iay/LPjoz1AzDbX4VHfo3RDHanaXvdCpeLR2VHww16VOaPS8Ilet8zQdWEr6lL8AjpZR2HOuEb1uXhopiSaOfGBvL/Pc++i/dysRvzumswN6TpdsXlHv0jAdo9RvGQhIfngJKSQH6yJAX8QkfsO8yefzfso6m29S1seTO67CSB62s+Xr6mXoruiHJSy2MitJ9De03OgXzOb7hQ5Mz+IH/xsRuc4Gl+9qFQ/8u+rU03C/xqXACuDHwVZAVKlDiGXSvsKvvhCdF3PJH/F2J+V8H/DG4/SOy6R1VIpvYWGrTdu/RjfumjZx729VdpDZfzcAL+P2y0adae771/Z2SsLI0yydF3/Mb89F4NIW5l8rmM7iq5Fl/80T7aDu/n2NFr54JdWRXCyVtpyqbKUav4w6Tkkl6IaY8ylTTCAzcnYWPiLk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(396003)(366004)(376002)(186003)(26005)(6506007)(83380400001)(41300700001)(2906002)(54906003)(53546011)(316002)(36756003)(31686004)(38100700002)(966005)(6486002)(8936002)(31696002)(6862004)(5660300002)(86362001)(2616005)(4744005)(66556008)(478600001)(66946007)(6512007)(4326008)(8676002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEJ2bE43ZjQwMlZFNldjVVVBUVBHMUJadXBVYTF6QWVRQjFBQ3JYWXlZN085?=
 =?utf-8?B?VzVNYko3Z1hRMC95TkpXMGhSbXNBYkRwNUxYay9OT3UycExxRGJHQlNCb2pG?=
 =?utf-8?B?d3dLN0xOL1BsM0lCTDhtSFNMYzJrQXhERXRBOFRBZisyWDhFTFhoUmlYSlRO?=
 =?utf-8?B?VjJlTDZ6ajQrdFhUcHZldzl2Mk93QitNNU5RVGcyQ3lMaHEzSURtY2Yzam03?=
 =?utf-8?B?K1l1N2NnbFJWRmVEZExjczMzZ0FyQWpSN3Z1UENUeGNyNDRRbktoU1hybHZB?=
 =?utf-8?B?MlQ4WU5HMHNOVURmYU5ZSzVlcmIrTGIzRHkzS01hNW8wd2ZhSGdad3hEUCtu?=
 =?utf-8?B?K3EzNytNNHhEemY5aUZGK1V6ck5wTmlxRDBGUFFIZUtoU2RKemMyTUtBbDMy?=
 =?utf-8?B?eW1sMXczQmNHRllRUE1CaWtIclcwVmxTZk1jZlJLMUI4RGFOc3pYZGpuK2Ix?=
 =?utf-8?B?RVZWWXpNQ2NZS2RsekdiRTZZbU1VbkVtM0pVZmtwWDVvQVdhUFRocDF6akpU?=
 =?utf-8?B?YVV6b0hQWmRYMk1VRGdGTUE3TDNkK3YwbzZHT3Y0U3pzck16Z2J1RUV0ajFp?=
 =?utf-8?B?cCttR1EvYkFQVnU4UEJRdUtlLzJDWnMxWXo3UGplbE5aRlJUL25CeEl6aWVh?=
 =?utf-8?B?MlMxVUtTM2NWUWRrN1A3VE5oQ29ZdEhPdmtYWG92b2lsV1hyVTVUcUh2UUl1?=
 =?utf-8?B?dE9aTnY2SnhQZkJuNit4aVdmRVVPaGEzSUxwR0hpWFNuaE04M3BXdTVXcm15?=
 =?utf-8?B?OHBLQWVCVzk1WGJXamdyaVR6UTlQNi9hTktKaHlkUEltQnJTcXE4VzFZeFF5?=
 =?utf-8?B?WWsrcXlDVHpFOGRRRU9WMDFIeGNxVVU3NnN4ZW5HWkM4Y1lHbXZONFZmaUhn?=
 =?utf-8?B?LzJmZTJaS3piQ1RSV1lPYmJzZ3ZyZUF2bnZvbjBPOFBMY2ZWeWFVZ1NnY1FR?=
 =?utf-8?B?TnFoY2w0Q1hXL280SEtPeXM4Q3V6ZFpBclJOVW5JS0J3UFhybm50MGlPT08r?=
 =?utf-8?B?TGpCNVkwb0JKQVgvTzNBck4vYkd1SG42ZE9FclhBVmNYNFVwbWtJYi9DaTNj?=
 =?utf-8?B?YVRDSlpQWnVDbGwzRjZzL0hlOXZsM1FmTm1STkNOYW81Q1NMaEhTRDErbFdi?=
 =?utf-8?B?elZXQ1VhZGxLeWthaEp3aUcyRThhb3E1aW1NL2h4c3BXTktVTzhBOFp0QmVo?=
 =?utf-8?B?U2lETlBRNHBKODRoOHUxTjhRRm11TEVvVHJ4NU1DRXFCbWFpT29IYVdJZFgy?=
 =?utf-8?B?TG1ZbzRtMVFMTHl3MnlCU2xoV294dG55NGFJZkZEcG4rcEl4UFJJcDhjK1BC?=
 =?utf-8?B?QlBwT3ozekFtVm9tTnJTRDlmSW1YQmVBaVBXS0VmUFFCUWF0Wkc4RFY1ZGgr?=
 =?utf-8?B?OVBvcEVKeHBMelNMV1E1Yzc3SHp2ZlZrVnFQcWY0ckt1cjJzb0FFNUs0d2pD?=
 =?utf-8?B?WmtBVzVOdmZPM2VvWE9TS1Q5ZE13NW1jQWRkY2g1eG9LekFnbmg0SXlxTmNo?=
 =?utf-8?B?QmN6b0RZN1J5dkdOQytuMHNTTlJGQlFGVUdKZzFYM3dOVHd3M014SmFxN01z?=
 =?utf-8?B?V1dkTER5eExDWWRDanFsRGwyQlk5ZW9aOFdqenlMYk5xcjQwQlp3TzN3SmNj?=
 =?utf-8?B?ZmZUcUxyQlpVS3JVektPUTJqV3o0QndPdVhTOGlIOHhWWkxJOTVIVmhoaklI?=
 =?utf-8?B?VjZtSkZiMS9wZERHeGNPWi8wRHpUWVV5aXlRbFZjQVdtYXVGK1ZXYTJpcitJ?=
 =?utf-8?B?QmlTYVEwV1FIK0xHSkFYK28xVEpBY0NJMzdLSitOWkVTSCtBNHVZWDJUYVFF?=
 =?utf-8?B?MXA5OTZKN0lPZTEyZTY3TWdrRjJJRzlReW8xU2hEMklLME9hcHNRek1zNXhI?=
 =?utf-8?B?M0lnRVVYRVJPTDMxNzRvQktoWk1zYThDZ2t3bkY3YXp5WndyTmdUdnN2eGtz?=
 =?utf-8?B?ZkZ2WmkvMmZlY3ZBMStZRi9zTW5KeENIVXlPbitKbVJQd0h4SHRiNFR4SWZh?=
 =?utf-8?B?bXdVUlFNOFJqeE9DWHFXekROV2RvU2gvcld4cUNSemJ1OGlIa0w1M3hiRksx?=
 =?utf-8?B?OFdCTW41WXNlM0ZnNTVDVXB3aDUyeUI2Y3dPSkl6OVNkV0JBM0IrVzVUbld5?=
 =?utf-8?Q?JNV46V30fAq1Fv3Kil+teUVAH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c1b04f-2257-46af-72a7-08da5f2e7e98
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 09:04:12.4963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoaMjyAJZByn0VFt04tIjR/FUOMgS1yfwN1tl+9W9T79AYoezESGS5pHpkf8d5PzFOQRD9bHJJv8Bud6Zxqrbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3474

On 06.07.2022 09:31, Henry Wang wrote:
> It seems that this patch has been stale for a month, with actions needed
> from the author. So sending this email as a gentle reminder. Thanks!

There's no action needed here from the author. See
https://lists.xen.org/archives/html/xen-devel/2022-07/msg00166.html

Jan

