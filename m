Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DF87F410E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 10:02:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638545.995206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5j80-0006Os-VA; Wed, 22 Nov 2023 09:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638545.995206; Wed, 22 Nov 2023 09:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5j80-0006Ls-S7; Wed, 22 Nov 2023 09:02:36 +0000
Received: by outflank-mailman (input) for mailman id 638545;
 Wed, 22 Nov 2023 09:02:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5j7z-0006Lm-Bx
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:02:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df817cbc-8915-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 10:02:33 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6884.eurprd04.prod.outlook.com (2603:10a6:208:183::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 09:02:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 09:02:30 +0000
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
X-Inumbo-ID: df817cbc-8915-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nq4nYbHUSLajTaeGcFBmH2SXRFP1Ff/Vy6xsfFHB1yAVz+XVmilpHE4sK/RZxzrwdIDDAD+Jpal+0GffuLajoEWbK3M5kaWIgFyOqDI8j/+D91yh123diVvOwoonb+J0cbifmQxTn8w5cmRxxrRNGfYOfs8jmqgcco+fFF+pj3cj84oY7fPKhx01joKS3R9KVAiMMIblv6ouEOFw+wgZ2PDOGUm7dH0K4ZiJZLB700l76Zxv5arYkTM9sIYHU4i7a9edOpgxilXpaeplnHoVDp5TjkuOjXKRga8EDyYR4Ft6VrPzy5UYCZ8wMeqclm+YQYJsu364/qwzG1EMF8H+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zj3X/6Jmr6zaeIXBU8E2HyfA91/z3ErQzvS2XyJClCY=;
 b=QcIeTuFzFsjOHE9xy95c+ixaz5E7mtkvmZcvzt+NQFaOfd64SA2k4WORb0AAoGg05qJkQNjeYmO1taJ8uSmLBP2ktoxUyGTVJuNjVA3uiwx5O0oBqSNDoL6WYvP+vqa0MrNHF+xQ6ly9kY8j6kEhmFp+GuBUsdJAfAgQyDELUCxCvYXVepKGNyi18QQtnHRzM2yRMHeo3e21wOZSSOcnaV/rdOsayx2+a+e8l0bwcKYTmedwbSsDKP2jwTFoZqKEdhnG/J9DQDgHR5wiolk6g1baG9dSFHl5pi1QbfTPWWK99JeY3Ni45KqjwWePjyDvvmmvv8WIJIkyUcPP/hDstg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zj3X/6Jmr6zaeIXBU8E2HyfA91/z3ErQzvS2XyJClCY=;
 b=LWFrhe4Pwpb9ilvxRw1oT6f67ugZrXh9cfzxm0ycT2TjymwVPmhak9JBv1zZIa6QSwrgjAPGOBmzqobiaeFt2SvRBE8oHW4XudPCee4U4WrNupNQWRzJjhCI8GxPqzbZYLw83NWikc1M30QJUFK9RcQbEmUfTxZWzJ6o+r9ZEs3GDMUXGzmFsDytON1tzXaVAPONNVu26h0xv2rz6w83ZOZ7JOmUFWuTMfPKnLAfQK6j9SD/NwkpZ1al7D9ZwIHtOHYpBAD2woAmkNaPWT2ZD7yVWq2qqlucYKHEliVMoYXEOvJHx79vhx2AFICMvmsjH2vCsY8bUu2NHEIZBOQh5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a6c8bac9-5bbd-44cc-b516-51a8a57d360f@suse.com>
Date: Wed, 22 Nov 2023 10:02:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/setup: Clean up cmdline handling in
 create_dom0()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
 <20231121201540.1528161-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20231121201540.1528161-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6884:EE_
X-MS-Office365-Filtering-Correlation-Id: edd2fefb-d34c-4381-4680-08dbeb39c239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RChRQMOUcnPEVPD/mg6MehGVK07EDf2H1GffEgZq712xjE+s2V8oFScNnZR7gXaBKYfsgLxeqIgI7+9DyTORlW7B+31+CVeS90weSJ0YG72R2GaCbzwVthsQNzjzHjY406I9zTk+OFXPQl5km7kPdXgwsoxQRLypIG/tGScE1u2+htJcJYCFaQY5k7UhTUZbrPcPTI5vXq68QM3LJL6c4FYVM7kjtvLlkmq4qnQs9RJ7EGuL08pPHcgs4ZqmYt+XzRfBT4CKwrStxvsx44RbwIY5+EfpL3I8mw1dUHiJulqcBEXEXR66DkQsmhzSq+Ff4Lsa420VVYzy/yj7AwRumI4u02wT1KG5UX0rDgSKxQ/Jv8oKeNQd2ZZOuehsaovfzFyE+qah0syoaJrKC+PbLmRN3adbJury5owEs2mfoXPH13J5+QxogPlIpaNC5+aGYWfN8b9VKwd4quc+che0e8PDSMwJDR1aK0Xjk2/kRAfDCLKwXCuplMx4aO7VBJYeKWJABJE/OaRMXNF7ZIiH0AwX17Gli/PJSPoD1RkaDU/5HiuP1T4YexS8/vCf8V9LsdwJ3fgdVI9/h9hwvOzMOG7YOwxLBi3Q/ylLuyWu1MSt+bJAx1ILlao+R3nhpqjZt9n5/5VlAP58eydUPSdEbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(31686004)(66556008)(41300700001)(86362001)(4326008)(5660300002)(7416002)(2906002)(31696002)(38100700002)(66476007)(36756003)(316002)(6916009)(66946007)(54906003)(8936002)(6486002)(83380400001)(8676002)(53546011)(6512007)(2616005)(6506007)(26005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGYvUUE0NVN6WGZiT3RwaHZIRjJKMGpxUVQveklzTnJ3cVpuNGsyU1cybFNK?=
 =?utf-8?B?UTRYS0QzaU5wMzQ4WVgwSXhCTjJFUUhUSldGMTU2TVRCMGxLeitCWnYvNUxr?=
 =?utf-8?B?bU5zMSsrQzNra3ptV0Z4NjNsckxlRWtTclZxTDFIZHREeXR2SkFxbWFtTmpi?=
 =?utf-8?B?UjFHbnl0angvalNqOFAzcWhyY1FuSVNsVFVmTGlnQllLb0dKVjMvUy95dTQw?=
 =?utf-8?B?SjMvQld2OXI3a2ZqMUtxeVVYVmxtSFl1NjY5TUZsU3lGRk1EVVltUjJGbGhl?=
 =?utf-8?B?L09GV2l1VVRpR29OMW9wVjEzdkdueTU3TFR0akRzQW9zcWFZcFcyamNGejlx?=
 =?utf-8?B?NXFpMGxsZGp2aUtremYyY05IYXp4elJxdFpPSkpMWEp3ZnJsdThqUUpGUXhL?=
 =?utf-8?B?cTJDd1FhdnA3Rm9xMlc3eXFON2JsV2pqZjVzVjhjY2ZoUTdQSGs5MWhmbWZR?=
 =?utf-8?B?U0ozUXYvOTlkYTlqcE55M0c2WmNUbGNtbitQbjZLYVRrNjZ4cmVkUWRoK0JU?=
 =?utf-8?B?WXdtZWNNU0VMMjJzOW9qMkVZcGtSSzRrNkkrZDhSWCt3YW1ERkUvUi8vUG12?=
 =?utf-8?B?NmpvQjliTXhsNEdhQlNRNDNndlVpRDlrTkJkWGwwd1UyamFCVFc2S082NlhS?=
 =?utf-8?B?NTdqRS9sNjJjT2FjdE15NkZ5TTJhcUU5bTk2cXJ4cS9wN0N5QmJvK212QTIy?=
 =?utf-8?B?ZU4waU9DZzVDNU5CLzE3bkdyMVZJWmhOQzcrc0UxMTR6NE9ac2VRcENWUWQv?=
 =?utf-8?B?c0RTRXpERWlMUmVhTmFkVkxJYitQRGZkMkZZSElxSWVoOUtPU2pUY3VYWVdB?=
 =?utf-8?B?dXpBc2IvZE43Q3JkcGR3aXhMQksxRm1lVWZ5T0hkVnN1bEFPRmNVS09pSjha?=
 =?utf-8?B?NXFNeDVMMDMvN3NOd0dYS0F5NlVScGdTUEV0a25oajNORFlUTkx0SmdnQVha?=
 =?utf-8?B?NE5OMGlHbDNzQ3VtTkNRelFteXRTUnYyOHJIb1Fhd05mMlRvMHNZM2Y1dWFU?=
 =?utf-8?B?b2ZaVzI4RkhKc3pBOEx4QWZVYktOcnJ5QnNUSXplRzVpck1CRXhYeVpPanZJ?=
 =?utf-8?B?N3RwQm1HbCtHTlRQZXVQQ3lpVjUvZ0s5NGtzQ1RSd2plVlNoRFlSay9mT3hG?=
 =?utf-8?B?MHJHZ3BBbnYrNFV5OE52VGQzRUUvdFUxOUpSbzZscWRqOHFiTktjcFRNdnNT?=
 =?utf-8?B?TlZzKy8yRnRVL0IvTm95SHNDUGJ2eURTejJqdTA1VytvNlBRanB2QVV0UXJ0?=
 =?utf-8?B?RGlacGw0c0ZqRlkxYm9NbS9NcGR6VFdhZVp4VjY1NTZpMVlhcDloMjgrdVBs?=
 =?utf-8?B?eE9KOWtNeXN3RDNCeVhVMWVmRUsvVDdrOXhTMkhQc0ZoNDZrU3JmczdRWFBh?=
 =?utf-8?B?OXg0TjdzeWFqUDhZeTJWWE5vZGxhTXJaUkxKcW1ON3hIbk5TWGlTb2Z5cWV5?=
 =?utf-8?B?Tkt0Q3oxTFFQQ0pjL3RhZHJzY3dpTlVubU1iTTFtVzBEL1FuNkRnT05MMWo5?=
 =?utf-8?B?ajc0YWZRUGZqN0cxWXFEUUVWRmxPdUNJbzNCQjdTWHMvdXI0Z0hsRGNXVm5T?=
 =?utf-8?B?dUVJb1VlNXM1ejVNK0FvM0hlQXhEV0NqU1BFWGlRb0VGaTVpQ29KVHR1eGVm?=
 =?utf-8?B?Y3ozWEVRV3NET3BkWC9nYlhZVEgvdFZQckx5RERycWJ6WHVuaUZsK2V4MmV0?=
 =?utf-8?B?bVF2Mk8vV0U2YU5TT0Y2R3JWQy93ZnFKMURBcHVtOGhKeEtNeXF3TEdyN3V0?=
 =?utf-8?B?VGlDcXpqVWExY08waU9pSHpidkNzcEdlQXNhZDd4bEFuZitQSHZ5d1NkbEcv?=
 =?utf-8?B?cUd4WnhiTkFnc09nL0JpY1o2bkdBd0dwQnJTT3lyYUFLYW9KM1FLY2tlOFF1?=
 =?utf-8?B?ZzFNRnllQUFIVXR0OWJMMmxMcGhPMHZiK1ZvdjEvVjMxRzZISGROR0FKeVRq?=
 =?utf-8?B?WTNOenRvbmdUcXErbVZiNlFlUmpwNkRjc1Q1bDlFc256TytiMHowS1dOYVRv?=
 =?utf-8?B?NTk3aGsxZHFERDZOQUNnWGkzeSt2dURUTUlYeDh0NmRRbll0VnQvK0F5d0ZX?=
 =?utf-8?B?RkRyRkhER3drSGlrMG9TOVc4bEU1d2J6YUlJbXdjK2hSTHdpMHpEMmErVGVW?=
 =?utf-8?Q?r1/7iWiSjPBkzEiOddTb+askO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd2fefb-d34c-4381-4680-08dbeb39c239
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 09:02:30.8829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lq9fdIO3l3hTGx81C6ZrQBLVme1Q/BD16Iibxz9PbDsK/lt6SSCCSmzHmY44PH66fV5rV53WreL/dWEN/bMbXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6884

On 21.11.2023 21:15, Andrew Cooper wrote:
> There's a confusing mix of variables; a static dom0_cmdline[], and a cmdline
> pointer which points to image->string before being pointed at the static
> buffer in order to be passed into construct_dom0().  cmdline being a mutable
> pointer falls over -Wwrite-strings builds.
> 
> Delete the cmdline pointer, and rename dom0_cmdline[] to cmdline extending it
> to have full function scope.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two remarks:

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -873,6 +873,8 @@ static struct domain *__init create_dom0(const module_t *image,
>                                           module_t *initrd, const char *kextra,
>                                           const char *loader)
>  {
> +    static char __initdata cmdline[MAX_GUEST_CMDLINE];
> +
>      struct xen_domctl_createdomain dom0_cfg = {

While I think I see why you're adding the blank line there, I'm not overly
happy about you doing so: Our usual use of blank lines after declarations
is to separate from statements, not from other (in this case non-static)
declarations. (And really, just a remark, leaving it to you to keep as is
or adjust.)

> @@ -913,33 +914,30 @@ static struct domain *__init create_dom0(const module_t *image,
>          panic("Error creating d%uv0\n", domid);
>  
>      /* Grab the DOM0 command line. */
> -    cmdline = image->string ? __va(image->string) : NULL;
> -    if ( cmdline || kextra )
> +    if ( image->string || kextra )
>      {
> -        static char __initdata dom0_cmdline[MAX_GUEST_CMDLINE];
> -
> -        cmdline = cmdline_cook(cmdline, loader);
> -        safe_strcpy(dom0_cmdline, cmdline);
> +        if ( image->string )
> +            safe_strcpy(cmdline, cmdline_cook(__va(image->string), loader));
>  
>          if ( kextra )
>              /* kextra always includes exactly one leading space. */
> -            safe_strcat(dom0_cmdline, kextra);
> +            safe_strcat(cmdline, kextra);
>  
>          /* Append any extra parameters. */
> -        if ( skip_ioapic_setup && !strstr(dom0_cmdline, "noapic") )
> -            safe_strcat(dom0_cmdline, " noapic");
> +        if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
> +            safe_strcat(cmdline, " noapic");
> +
>          if ( (strlen(acpi_param) == 0) && acpi_disabled )
>          {
>              printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
>              safe_strcpy(acpi_param, "off");
>          }
> -        if ( (strlen(acpi_param) != 0) && !strstr(dom0_cmdline, "acpi=") )
> +
> +        if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )

As you're touching this anyway, how about replacing the strlen() by just
*acpi_param? We don't really care exactly how long the string is. (As an
aside, strstr() uses like the one here are of course also pretty fragile.
But of course that's nothing to care about in this change.)

Jan

