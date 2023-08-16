Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B0C77E058
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 13:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584737.915537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWEgk-0008Ox-Pg; Wed, 16 Aug 2023 11:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584737.915537; Wed, 16 Aug 2023 11:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWEgk-0008N0-LT; Wed, 16 Aug 2023 11:27:46 +0000
Received: by outflank-mailman (input) for mailman id 584737;
 Wed, 16 Aug 2023 11:27:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWEgj-0008Mu-9Y
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 11:27:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaf6877b-3c27-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 13:27:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9856.eurprd04.prod.outlook.com (2603:10a6:20b:678::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 11:27:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 11:27:42 +0000
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
X-Inumbo-ID: eaf6877b-3c27-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiYEtmfVOslSO7z8i3r23DZYObeYULZE6vvM0wsR5Hr/tsKPtmML1FT1AQe8euMXtGtoOBUZLLKU0eM3h3qFb2uxWi+wmO5xnt1x/RTRClaiJr1kodfYUIJ5yFPvZMZ/+EGa7aA0+fPsMVHqteC8TfhL/MZAsJXMR5d9MboCJraNGKFRDvRaaSHT8vpWYZWPlidg0MOFi4YBVdEOtULrvEJftg08cPFEj93yYpmRtviH5w+eaK86jzz6zRjyAXfipEY7WGpn1UsmcV2C2N2ZBLUetBd6xso315FPQpXgybQY3mPzOQ4TfUB79th85UqfyBDCQf3w5rRF8/QmKh9+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doY4Q2liMCIgFlO7Ct1gzLTvOBrm0XKCaD2n6KBOZ8A=;
 b=NUqTXMSi6IoD8I0PVyTkUiQ7DGOthuu130ZbnmKyjvVIlMDq8XFhYXjRsNj/qTHoLwhddRAaBbE43DdRPfHuZhSfuk/mO4kmfOR6dSLPbxYvm/HrkS0lqJI2ceonF/GNAgiVFpEcoD4+RLP/PwuLeNRcYHl0H0bQ6Zdt4mn1N5S5QCUFf+WYgZKwtK5H4jfjpQsshQvmV6TwuUq4JO8pvNczZk86mTDp7Rf9KBkK0nlIoaNdQggDImZoJx5ZBiZrZCp+9wrF9HHhxgWW4BRV4cAqJZtaXqSOSGu9TXGEFwgQtInn2uEByDZL5EoVaFxSoAX1WoaA/yVinrWwI0Z6Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doY4Q2liMCIgFlO7Ct1gzLTvOBrm0XKCaD2n6KBOZ8A=;
 b=2SzVu10ymSHYTG1j8q1jZjGF2e5pi13oCulQfULCAameRuBL9pq4G3hzhpagMaAXEvPovV6ChQ9IeNfNzsQrvDdxynJaRX13Y9AhVwzp8zAl0aP3/jHgAtrdzKml//X7fDyWcZ6rC90liaKmiRAZsgsQhNkdT/C/SZjfxbfksbFy0XYP1tUG9laEExHTF96MmsAxbmbnXioFpx02UPk/+3HvzTQ4c47iS56XsLOrC/rWI9ZJpjqKry+KwNEvxoqpTHNoxbH+MCfcBAHw8CE4XEXNaRX0lqvk1kt5r1TNo4O7I8JWnQKHFG5d0w12h1rvXHFWJVNUUCeHt6tbmdWgBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44d233c3-4b85-c70b-0ab1-a67452884025@suse.com>
Date: Wed, 16 Aug 2023 13:27:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 0/4] Make PDX compression optional
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
 <64dc988b.df0a0220.d6d82.abb3@mx.google.com>
 <f8d43f0e-bceb-674d-c3d9-ddca4fd491df@suse.com>
 <0912c8ed-f2a3-4fdd-a210-f015c0e3f48f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0912c8ed-f2a3-4fdd-a210-f015c0e3f48f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::25) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9856:EE_
X-MS-Office365-Filtering-Correlation-Id: ebaf7f26-9dec-4f7b-571a-08db9e4bce0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ej42T6xynuMoVD9RZ4DtE1qGqxL9tJAzqmMODtXRnWGB9mo9kGUCU9yFuXmlDRDRv20+s/Gfbuh0CiwZFro5jZdPCbCSL1WA1fr/ujHecTndrsqOUpXXNEAXn3l3Cr/KXaj31MREuEO8wZRUXNG2yPD9AEUtk/1JkDRB/VR9ZtZZ3YQF+o2mVEb/RO8QZEOsCG8q/MawWdFfodFnzn06ZoYkqlyQAAK4EpNvPzV6k/iIQGh2EfUUzYYySqLuW+MoCw8yk8PPLAJH+A06K9qVPcetqvjXjRr8++2A+VUUWejk7d92QFvNAO8eGSAZ9TSg83YJ70hDSSy611Pfvo91g/tyk3gj9nkYOjv5xuDSX2FdKElOAzPPC4mQRctwJ+PPs0R26ojfOymnlbwamyEUe1m/DVSouJBoIQzY4QRk/+UnBU9LOREaHvr9RIirT7RNu7eNExNNPf51/gYMcOruLUXEt+6VprTYvCdSSguG0l7VR2D5o8fUlLlqVTedlCbXX8mdMyTI8bGqlk7LeO+1vufs1cjWn0nykZbNUUGJ+zjvBlxUB1zLNP+SJo/f/yyxS52R3TOivWzIlhAxzXz5gQ3D661aI8elpTQxTrpZEuOEoIGrKE1BjRo1koBaOvPBOvV+5O8J8kP+P2OHVe8YWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(1800799009)(451199024)(186009)(316002)(54906003)(6916009)(66946007)(66476007)(66556008)(966005)(41300700001)(5660300002)(38100700002)(31686004)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(7416002)(86362001)(6512007)(53546011)(31696002)(6506007)(36756003)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmVGWWVFMVpQMFVUWm1OMHFyWW1yTWZJaFJVclkrcVoreDNPcXpFUHJNb2k5?=
 =?utf-8?B?SS9JSFpMNVdjY3pLY2Q0Y1RQQm5HQzZzWUhOemY3QnhLWXljQmlla2MrNEow?=
 =?utf-8?B?TEVuR1NZR0tjdEE5UE10Wkt1Vk8rck9XZTF3YVd6ekQwQnV4SXByYVIwSCtP?=
 =?utf-8?B?RnlwTDdyaWppd2JhSldzenh6enZ6WGtQdU5heHZmNTJOeSt4QmFiOWVXZUt3?=
 =?utf-8?B?SDdIWEFBNDNsekp0d3FXY0FsR2Y1VnpIYkRiSUR1eWFYM0pOS0NqNjk3L3ZU?=
 =?utf-8?B?NDNpejJjSWg4QVZMNWdFWmVaL1JqMzE0cEFFQ2o0T2RMN2Evd0ljRHFUMkZ2?=
 =?utf-8?B?QkkwdWxxTm4yUG9WRHFWVExvUzByUjZOdlJmMlRqWk9acGd1cWE0ZmhMditt?=
 =?utf-8?B?c3hjSnJsMVFmUEhsbVZzVTdUS2I2dDZxNDdpRm9KM1FLL1ZpdUtrTVFrajc4?=
 =?utf-8?B?a0pGTG1RRDl6S1VQWHBGckdHRG91WEFYZjYraTZaWDgxSlB3OEwvK0o2K0pi?=
 =?utf-8?B?cUU2K29XVzNTa2dxd1R6SXFxa0xLczY5b0RFV0M3UHhlL0dMWWs0czhrajlB?=
 =?utf-8?B?Z3RlajJ2UU92Um1NdzhFNnJEWWI1cWJEeDJLeWN4eWd5bktrVmVHczBCdTRI?=
 =?utf-8?B?UGxHcTdneVN1YUJnMzhYTmRrcUdwV3BOd01sRHhkelEzOHJzYkZBQnlUTm9Z?=
 =?utf-8?B?NVZMcDFmMW9vMldObDR0TERpK1QybDg5NzdkWjlUMDRSY1FSV1NGL3J0UnRn?=
 =?utf-8?B?U2Zsc2k5R3BmVW5zYjVGcDIxMGV3djNFbnNEbmRhQ084VUZxa3AzNytuclc1?=
 =?utf-8?B?T1Q3alVnS2ZSZ3ZYMVFJbXBBV2dDMzVuRHlqOEFNNmJnSDFtTERQNFZDSmFy?=
 =?utf-8?B?ZlJjL241dEFFVkI5ZS9DMVZHUUVPNGpCczlKeERUQnNpNWdUK0ZlaFM0Q3hJ?=
 =?utf-8?B?dXYxeG5nWlZoZG1JaUE2OVRyTUNyQU1uNTlOY1d2M2VsNWVld2tiZzdWQUNT?=
 =?utf-8?B?Q0xXMDVSMFg3QThSMi9JMjB4Zmh0aUpIdzg3aXlmNGtLS2NKS1BNWjZDWjgr?=
 =?utf-8?B?bTZVa2o1bEg2NXdLR213d1FEZzRPY3ZIVmc4bjR0bUNvUXdQTWhTSldOVEJT?=
 =?utf-8?B?U0l2UjgyVnhVWkc4SlZJSmNmc3ZHWWlhMkRKZWdlb1hNVlBaM0IzSDkxRmdn?=
 =?utf-8?B?R0xtYkZ6WEdKUFhmR3ZKSEc3RlJ6allLNlRUcytpTHMvT3c4ZzlZQVcvdjdW?=
 =?utf-8?B?cjdkNTREd1J4SXd5WGE4UTZpeVBMNnpxMG44WnlVSCs0ZWlubGdHOGl5SUUv?=
 =?utf-8?B?ZlJpcU1NT3RuTm9Jb3RXdnpnQkV1OVUwZ2lhZXYvVWdETUpxTUZoZjVIdE5m?=
 =?utf-8?B?cTZ1OVBDMTFnTVpXY08xZjIyZnRaTGJ2N3NYdUF6Y1kwZVNiQ3RxTGcwQXJ6?=
 =?utf-8?B?UEgwUkZsbXJieDlpazVVYVVHaWhJVmRKbXZVdjdNUDZvbG1TVGZFVjVraW9D?=
 =?utf-8?B?MDk5ODZGdkZjTy9oeGdMeUgzaWs4akRUdDJnbC9PaDRLM3htTlZLd2h1Q2x5?=
 =?utf-8?B?eFc1TGZXR1h1R0xKbmlvbk5LWHFCczIyeUxSeTNzN0h5b29FOTZDNW1TcGlJ?=
 =?utf-8?B?M1o4NnR3bndvQUo3cTduTlo1aERXQWsvRHFZcFNjcjZodlQ0dWI5Q3g0NjFF?=
 =?utf-8?B?VitmMER0dUNOcjByTEJjSkVUSmM4Z2tJMFBYVUJ4NkNjRFVtQ1pMUU9oYVlK?=
 =?utf-8?B?dk93MlJHUlljNGxySmR6cFBNR0JzQlh4eDJRcFk5a0plazROSTc0WVpEZ0hs?=
 =?utf-8?B?MFVseWlJR2U1bktLR1Y4TGJYbDJON0dLdUkrL042VU4wZ0RGQnM0bGIyRkxK?=
 =?utf-8?B?Nm9TblFrcUtYUTNQQjFtUC9aMzhBdFNNekFxalg4RUJ6ZktlRWkvWVR1alMv?=
 =?utf-8?B?VkFMbitZZGYyU1FaMXREc0dNVnBpYzBvSlhUOWhidTV1czg5YTZOcFhkZDIx?=
 =?utf-8?B?dnAxRUdvNzZWeWl5bEJQTWFkTkVVS1hEUFJMTlNhdjg1cmxLV2RxNm1sTGRt?=
 =?utf-8?B?UTcvd0JxeWE2OFdJNXdKOVIvVURtUEtHWUNGczE1V0JhSE9XMWxUbm9JaHZC?=
 =?utf-8?Q?OkjQs/Fzn+MT7N+hGuXKNh1FH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebaf7f26-9dec-4f7b-571a-08db9e4bce0d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 11:27:42.1150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQOLUWjNtbKPikBgmE7WqrSkqsHAmKA8XIAS9oe4x4yg0p31cIBpNnJk6474ruEYIDSKIANdgnTfY7gx7+pTtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9856

On 16.08.2023 13:12, Julien Grall wrote:
> Hi Jan,
> 
> On 16/08/2023 10:43, Jan Beulich wrote:
>> On 16.08.2023 11:36, Alejandro Vallejo wrote:
>>> On Tue, Aug 08, 2023 at 02:02:16PM +0100, Alejandro Vallejo wrote:
>>>> Currently there's a CONFIG_HAS_PDX Kconfig option, but it's impossible to
>>>> disable it because the whole codebase performs unconditional
>>>> compression/decompression operations on addresses. This has the
>>>> unfortunate side effect that systems without a need for compression still
>>>> have to pay the performance impact of juggling bits on every pfn<->pdx
>>>> conversion (this requires reading several global variables). This series
>>>> attempts to:
>>>>
>>>>    * Leave the state of pdx and pdx compression documented
>>>>    * Factor out compression so it _can_ be removed through Kconfig
>>>>    * Make it so compression is disabled on x86 and enabled on both Aarch32
>>>>      and Aarch64 by default.
>>>>
>>>> Series summary:
>>>>
>>>> Patch 1 Moves hard-coded compression-related logic to helper functions
>>>> Patch 2 Refactors all instances of regions being validated for pdx
>>>>          compression conformance so it's done through a helper
>>>> Patch 3 Non-functional reorder in order to simplify the patch 8 diff
>>>> Patch 4 Adds new Kconfig option to compile out PDX compression and removes
>>>>          the old CONFIG_HAS_PDX, as it was non removable
>>>>
>>>> Already committed:
>>>>
>>>> v1/patch 1 documents the current general understanding of the pdx concept and
>>>>             pdx compression in particular
>>>> v1/patch 3 Marks the pdx compression globals as ro_after_init
>>>> v2/patch 1 Documents the differences between arm32 and arm64 directmaps
>>>>
>>>> Alejandro Vallejo (4):
>>>>    mm: Factor out the pdx compression logic in ma/va converters
>>>>    mm/pdx: Standardize region validation wrt pdx compression
>>>>    pdx: Reorder pdx.[ch]
>>>>    pdx: Add CONFIG_PDX_COMPRESSION as a common Kconfig option
>>>
>>> @Jan: Just making sure, are you generally ok with this series as-is?
>>
>> Well, okay would be too strong; I still don't see why my runtime patching
>> series isn't re-considered.
> 
> Do you have a pointer to the series? I would be interested to have a look.

Sure, I can dig it out a 2nd time:
https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg01616.html

> That said... the problem with alt-patching is this is architectural 
> specific. Right now, this seems to be a bit unnecessary given that we 
> believe that virtually no-one will have a platform (I know we talked 
> about a potential one...) where PDX is compressing.

But it defaults to enabled on other than x86 anyway. So it seems like
it's generally wanted everywhere except on x86, and on x86 it can
(could) be patched out.

Jan

