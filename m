Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB97E577EDD
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 11:43:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369449.600873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNHt-0002PC-I4; Mon, 18 Jul 2022 09:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369449.600873; Mon, 18 Jul 2022 09:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNHt-0002NN-Dl; Mon, 18 Jul 2022 09:43:37 +0000
Received: by outflank-mailman (input) for mailman id 369449;
 Mon, 18 Jul 2022 09:43:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDNHr-0002NH-Tg
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 09:43:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17589cbb-067e-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 11:43:34 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB4573.eurprd04.prod.outlook.com (2603:10a6:803:73::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.22; Mon, 18 Jul
 2022 09:43:31 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 09:43:31 +0000
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
X-Inumbo-ID: 17589cbb-067e-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToWbAoIGmWiB2JWApOjwq1nhSt76bY9RiF0g9NFpNhfIDGzQ5a4+vLw+c282uSno9JsIttFZx2Xd7j0Bq/7VZOsoH3CQwbYAkZ0wO2IL5WeFXUgkY7HAIEfo74JPdDpc1T71VqStpvikYEnfMarVLNw9Yi+Pxar/gUmnIDVDiCqetcyXbqbvjtXpBcspsAka4zXdn9c8cHJQvbfg+MPwDjlTq39o+WRYurAMsBHXqGCyQD1+56+mf5SUeasZ3R0P03Pt57Yp+bvsYEnQBWyN0pWVHLN7r8Ux8RrUnyIuQnp4ZMmWizVew91mG9naaCzm+8h+xYAHbO94yCdtL8ZpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dLd18yrvmKkY6RdSDTFDHEopdb2NaPYrmYREfKHUus=;
 b=hIX9SvDy+rREyE1J9KlzI1guSPK5BGBZCXylBp6P6ae4m4Ij32yf8YPthulCmV3BpwxAFC0dECFkF9cw09dbqVgtFNLltb0yB/BHr4UvN3pwfrGUB4E53tqviteOeXuQta/0RLu1Te1Ll2tRYNy+riHLJtQwcE35VnQaBzEn24m5WEG7TE6Eeh2L778oug4/ybl4TctvxByiYFlKxG+wV/AXBqPcw66I/moQa7UijQkGSXr3jZK0ic7KU9EbUfK3y3NtdImqhP0Cx3NoMORXG91AZYOvY+5n5xx/m5ksh7Djl2HUpEd8CHxmlQ4F7aFIywCzN1CSMygO4rK0DmOzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dLd18yrvmKkY6RdSDTFDHEopdb2NaPYrmYREfKHUus=;
 b=hCYsDc1YtFfgBoQst5OllSrTalLdYIsDaGvrFSdyetpCsir0JbcrbvquB1q39+Kso4W3E+s8AdTBAy9L4iGCtPYmsbVw4YA8s5JoF6ru8W6ayyLAuTpKKTWA78HahfyFBetAJrpPzx/CgsZoKdtJLPL4HIkcBznZGvwRDxjzKJO7bqHYsg7TixEFe4OV1CByRdh92q9y7Thf0CDGeXVNNZvGM+H6x8hCpBUI6aqdtgr50d86cgzaAs5+A4+F7TlGeGIhEYuwdX0NIpuAhL1drwj7U6G+b5Q1+4Yw9MJx/rY/bzKvfsB2wYQGwWFAaHmfPFEUNm7TS2AY7gDgzrgjBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0242a659-fcf9-74cc-102c-df775123b7ac@suse.com>
Date: Mon, 18 Jul 2022 11:43:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] xen/heap: pass order to free_heap_pages() in heap
 init
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220715170312.13931-1-julien@xen.org>
 <20220715170312.13931-4-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220715170312.13931-4-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0608.eurprd06.prod.outlook.com
 (2603:10a6:20b:46e::17) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 983c5309-74b5-407c-d63a-08da68a1f9cb
X-MS-TrafficTypeDiagnostic: VI1PR04MB4573:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HRWtpXBB8QMsljIOZ9zIhjn5BtPwx1W1D8BoEClfvIvJLuMLQdvewDg4kYFjeExChbeO4JU0KjtTCqmHuOGpbGkbeseCdMQAtvErZGsNFzUoysfBbooAWS097H+b7ocxYFQQ1w2COSQxPFoAlK2kMHCzio8d/4RCub+5sHDEOe1CpQEfXDk879bYOGDmno8EG5u3Eh/HVHwRZCaMnAOpN1jntcYGUzLLSUVNiCq0fZEBisF2TZJ9GMoGfWRHSFvZyRcbjP55mipRn+ji2b378hpEhquawNnKGX17SMdf/EvmD6Gk09iNlu64R98ePvNjMrctTDzBqtmQh0eYCpaI2wgP6oGiwDUP/AunuKZnEfZ8q0E5iHEVgUkrJ5BrpVyCr/b20vjvB+2FV7NqECKpLW2hPqLVt9WEKaOzOE4CWLYKoBuO/amqjfHxtFYA9Vk/QON1Pcym2dEp6Oopd2D9mg0eehXKR7UzVA4rP/KneHXBKRn34n02pNWy7YX6apzoF+nLX9Z4JPGo0hSo126paiKscxwYvFXpjR91qpZfDsgOFtySK7JusvUWbRDMFfstKHqIEzUswu2/YMKDALHwMnO2MeJF4D8dwk7H5cYwBC4xjOQ4PgrTEeQnur641VSPmmPem2W+DnBL74iaGl0smxyDfj3Sph3PuLpAykvw7iXDSYtcVxe0nWT8jaXa8CaZqgGh+rA+PftX5WbqtpBYbtk7I2WtrD/Y3OWYtF7l7cd4HM+2jLq3TH1b9ge3DqZAjqsVA+qpg4cSrsm4grsZ9ZXgHh8y7Pz9Rf7nGU6bAR8uvqjYnpfj29K+10E85iirCEuEmU9rNcKi1exKj3gfwtWGRriBkIwRGxgFitkWtLQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(376002)(366004)(39850400004)(346002)(66476007)(66556008)(66946007)(4326008)(8676002)(8936002)(6916009)(316002)(54906003)(36756003)(86362001)(2906002)(31686004)(38100700002)(83380400001)(5660300002)(26005)(186003)(53546011)(41300700001)(6506007)(6486002)(478600001)(2616005)(6512007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWtLUk9uaGR2RGNEaTQyTnQ4Uk8rcWV5V3NQbEVRMzZSeWcrNG13Um5qNGJN?=
 =?utf-8?B?emJxVVFab2lWa3BDOVp2Vm9CYkU2OVU2TlVPb1dnVmlpZUxRaUNTYjNGVmRv?=
 =?utf-8?B?Y3dVYW80all3MGI3QzU0eTlaRGdxVnUrTHdRa3B2ZWYwYk5pRE53Y1hkL1l5?=
 =?utf-8?B?WDBmVXlVYjdaSC94YWcwV0tZQW4ycHByOXFFUDM3dWdKbjJuMUd3YTBpbXg2?=
 =?utf-8?B?VVNZSDZUcHR1TXRSeEx0cjhCOUhUaEFzaUJsNDZVdlpJL3ltZGZEeW5PTDFR?=
 =?utf-8?B?U0EzWHYxWitmdHBZd29NblhwQ2NvUmE1N0trc1V2YXhBZFdYbFlGUHpBY1Rp?=
 =?utf-8?B?N0ZtQVdzbCtqM3Y0U1hua3FiVHBzMXRNeUZwREpWNWhFRHdSZSt3VVBDcG5S?=
 =?utf-8?B?RC9VYXpabmVQak1zNkRQNUF5eXR2cVJ6bVFHQnZCaEd6RENNVW1POWJBeEFH?=
 =?utf-8?B?UFRwNExvM2JyTjhCbHd6ZGhxdzRsOWtveDFrajhFejlwMnp2alhhc2VtNHc5?=
 =?utf-8?B?bE1ZZG9lOXR3aWZkQ2Qwd1VaOVhQUTRWcGtBWEdDU09MUU5TNGpyNStsUzJz?=
 =?utf-8?B?Z1IwRDNvOW11SWJjbnVJbFB2ZG1nOXJMQXFMUlFlaEx3eHlKUmtvWlE1c2x0?=
 =?utf-8?B?Q08yRzhnaGVMTk9Dby9TK21GcjRxa1FkRjN4bndKRlZ1V2QwTXdoWWRzOE9X?=
 =?utf-8?B?UmZ1Qy9haytpZHdsYjRmQWN3M0M3NFVqVnhKNy9vZGtaWno1RGR1aW5LV1o2?=
 =?utf-8?B?TUdoU0VFekN4OWRjNUl6ajhUVlRENWVCZWptYmpVS29EYlRVeUNZczRrVk5t?=
 =?utf-8?B?Y1NLbmF1UzA4RTJYbzFNVExsU2t1cHppWmU5L0pVbnJ4RlV5anY4Ty9MWStK?=
 =?utf-8?B?WHZSMXpBTzFnQWZjUStnSHNZS2wwUC8yVDByMUZzUzh5N2dwOGU2aVRWd2g2?=
 =?utf-8?B?T0hjTjRBVEoyVjJjbjZQclpPZEhUTU94Tk8za1hlc1orcjd3QlJyS1NhZWxx?=
 =?utf-8?B?U01IVFFuK3BGb2thcTBjMFVCS1dQKzQrYlRDcjFsaGVaOXAzYlBaWnZLbW5q?=
 =?utf-8?B?cE8xS3QwSnh0Y1RBQkF4cU1nZnZNZUJHcGM4QWowT1JEbElQZjk4VmZiUkRv?=
 =?utf-8?B?SGJuWlFiRStmNEhsdmVyVkU3Rk5KL0xZSmN6SEJ5VWJoQ3FsTnhadkhOdVY5?=
 =?utf-8?B?V1pLcDdPL24wKzludjJ2cm1FNnhOZlAwVWd6dm1CTkpCTVRjTU8wekVKYU1N?=
 =?utf-8?B?d3F2aW9BbkFtMkVMNUxoRG9BN2dVOHV6VEdTSDV6bWtEOWVFMGE1U280azB0?=
 =?utf-8?B?QVBOSE5oQUQ2SlBwTUxFYVRhbVpJcGIzaEwxVDNXMVRlNDFCV203YUl5a2ZN?=
 =?utf-8?B?cUdKczBYbE1ERVV4YUtHQ0c3dStKREZRd3dneDBZQ21kei9VQUtwM1V2ek8r?=
 =?utf-8?B?UXp4Yk1wYzVFVDR3OXgyRjNhdnVaTC9tVnQzempBckxmd2ZNUXRRZGtwSHRV?=
 =?utf-8?B?dGJvQUFoUlJVcUM0MkhVL0NGVHZtS3lsL2tETm1GT1BNakVIRVBUMDNheGtS?=
 =?utf-8?B?aEw1UWhXUzQvSE1QdHA5cEZKSG1Ua05ubGh1bmNJRXJTdzZZVUJqMXlYdFZD?=
 =?utf-8?B?aTFVYjRwWHo5RTZwZi9QZ1FJUzJTYytZZVIyV1AxZDlFb1Y2blV2bWtaK2F3?=
 =?utf-8?B?RWJ0T0x6NWVIZlZUbDNpcm05VmF0UVlxNHI3a3dmdHR5OUJkZ05tVWxzb3pH?=
 =?utf-8?B?WWJTeWxWQkJmcCtkMGJtTHRmQW9OWlYxSGdHNVFEWlNhOElYbFY0VjN2OTdl?=
 =?utf-8?B?Z00vU3IyUUtYT1A5Z0tDeFhCR2hxYzJSRzZGT0RCdlNQbFBQNVJFckVJWktn?=
 =?utf-8?B?VDQyczZVRXl5VXo1QnVRSEIxVkxTQWltQkoySnR3VUQzUldNOS9WNFh0N3R1?=
 =?utf-8?B?eVV0SG0wWWFLcEdRR0g1aGdZeFRMRmN1VldIUWpGS3FrZ25ydVBIcGFvOGVu?=
 =?utf-8?B?ZU0wbWRhcktUdWtSLzl1NlVHQWNMTEVNeHkrRzVubmJkVTd5NDEzbEFBNnhU?=
 =?utf-8?B?QWRyZnU1RGhVNHg4cTZIZXNhZXZ6K0tKblhiSkYxY3l1TGFqTGZsNHg4cVVY?=
 =?utf-8?Q?StyZl6li/N4jxCrUz4hlk4W5T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983c5309-74b5-407c-d63a-08da68a1f9cb
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 09:43:31.7661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSeh9h30FpYVMyJT1eVHFCWIyuDh1w21wzTg/WyeNyN/XPQSxMdkBSmAH3nsYpFPZrtn+6tq+GbKTGDe7dotmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4573

On 15.07.2022 19:03, Julien Grall wrote:
> @@ -1806,8 +1806,22 @@ static void _init_heap_pages(const struct page_info *pg,
>  
>      while ( s < e )
>      {
> -        free_heap_pages(mfn_to_page(_mfn(s)), 0, need_scrub);
> -        s += 1UL;
> +        /*
> +         * For s == 0, we simply use the largest increment by checking the
> +         * MSB of the region size. For s != 0, we also need to ensure that the
> +         * chunk is properly sized to end at power-of-two alignment. We do this
> +         * by checking the LSB of the start address and use its index as
> +         * the increment. Both cases need to be guarded by MAX_ORDER.

s/guarded/bounded/ ?

> +         * Note that the value of ffsl() and flsl() starts from 1 so we need
> +         * to decrement it by 1.
> +         */
> +        int inc_order = min(MAX_ORDER, flsl(e - s) - 1);

unsigned int, since ...

> +        if ( s )
> +            inc_order = min(inc_order, ffsl(s) - 1);
> +        free_heap_pages(mfn_to_page(_mfn(s)), inc_order, need_scrub);

... that's what the function parameter says, and the value also can go
negative? Preferably with these adjustments
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

