Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9427F802CED
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 09:16:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646576.1008965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA489-00005j-BV; Mon, 04 Dec 2023 08:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646576.1008965; Mon, 04 Dec 2023 08:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA489-0008VW-7u; Mon, 04 Dec 2023 08:16:41 +0000
Received: by outflank-mailman (input) for mailman id 646576;
 Mon, 04 Dec 2023 08:16:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA487-0008VQ-Og
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 08:16:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 727666f0-927d-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 09:16:38 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8490.eurprd04.prod.outlook.com (2603:10a6:102:1de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 08:16:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 08:16:36 +0000
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
X-Inumbo-ID: 727666f0-927d-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvxaTcmH1cIoT5XCoRvVLLLZ5cr35sIfPi2O8VhGkQcc7XEFWX/br3uXazpgY/bQmEIH7D8cUYCDZ8Y9jcK315ggUJk2jUm3Qt0rwRtM+NJYHbHoKMXfN0VSOOe/6CcdEiPH4IXpmFOxk9MJW9TJKKkSlmR2kGnLvizpA6oN4xDWfwLTmbeuCXmeTDz1ICH8VI6ApYcpCJkvCZQXvWMGOw6MDbLPL2ORPUj6tFxcobN6Qq/QYDO9hVGcc4KiLqs6sVn6MYSTt0jr09UZP8/lEu+PGEIH7LpNW+YeqJ9VqdydtJykHE/rnURUZbf1aiPYDCH5s25soRCwc0/7VO9tXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38WwFcSyBUYcdaWCImymQsSRdGzJQINUBhZhlB7Na20=;
 b=NXZVcV9GBTlVFAuRHn4RhlOT5Ijz+/U0JRWhcZGvAeEDGTNaepR3OJxg+3ARv0OeN3/qgsLUhyPpASFgcmWgn7ACsyjJCGr834rBu5iExwlwUUaBnhBbeOE5YGtqwBlFH0vLLWLfCaogufuNXAJEDTClxvtNmwP7/9wiRqCiGHXcNJaHhfe7Z8t0zZFHSn2WKxjMWZdl0CUBeNuPahZxzelrTM5niszfI4Bc1Zcz3dFX0Nq1tWNkWpeVEBMPkcrFFjFyHYiloZY5CXznqVehzpJYWeKmklXWkEJFP0qIGODIjXr1kwKdRRsV8anFeXzLAN0L5K1FCh7Rj/nPIiTGWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38WwFcSyBUYcdaWCImymQsSRdGzJQINUBhZhlB7Na20=;
 b=qyV4h8t5M6iALhvZ/oe41XNPP28uKwrvSgWmagz+zjBqtNuUPtpIOLlgm+mZuLz3fcu4tVyK0qs8LkVir+tqmCllk/IkmVrxSvMUAZDyNoeermkAUhmkv+21k0U6Wcw/2UwdHb7IAM//MoOxI2TpBKzSGnb+c4zb6eaK3mk7H5J/zJNKxwet/rCdbCWyPvYg9kGStZ1Mp9wlJPf3A91bSI4BJWwsfOZIQz6MO+7a8GDP4vaO4RCDJtn0htlhQ4RR4RSQgVoPNRFFpT2bR5SurpmaSwcR3kFUlLdVUIbgrcbp703yUJRbheT3f98C8NPL2nu4J7rL3cevpyCuIUsTXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1978d259-1531-4dcc-a106-d87f6f26885d@suse.com>
Date: Mon, 4 Dec 2023 09:16:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org,
 committers@xenproject.org, George Dunlap <george.dunlap@cloud.com>
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
 <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZJETPgXut62Y5RQyB8Q6Ruwqd656+iW+ark6WOXYEf+w@mail.gmail.com>
 <alpine.DEB.2.22.394.2312011253390.110490@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312011253390.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0370.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 1435dfee-4c03-4a3b-be9d-08dbf4a15514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8QjC9A+artuFTNAya/ou2it+yj7eCfd6hWVKGt283DjnLqXdmv0YnUvQU5hXy7XsBtD+r5GQdsTJc/nZ6H8A2IJpu0CJPLlcAVZbu8Pzij94dJOgT+h+2hv2qjrQXPI5fq2kDj0dgyeePI3F5do/l8b31DG01/34yOOOUp55uLyFO75cHdmdQMqx7id2sjwv9B/x4gmY3Ak30s1UUvc7K7pXWdUx3aYmLrJSoO70ZOgStef59OmZJNFvERAhlOi0HogRQuYpBb557QMWFYlkhdXt/uML/CweY0plokJODuqhhPcf/RUxshT0kA3weSc4sl4y/i60fQHRgC5pyXY+fSk8TZOexmdh8Rurx3pf6E9a79g736YnMPcOzGLWqB6VBH1ASbNc7g2+OHLd9IR7AfXKiZ0P6XrR0PQekd66h64jB+2VL47h5CU/l1monM4fLQzlFy7Gh6PgGnPYBsdZC5E04j0tqxdOmsc4CkuDK3kG1nk8Pul4sQjKl3/APDhy1XABU1MiPCaxOza/wsqf0dPSvt9A/d+vh8ok92hDro9mksuU8E91CeGnUTsv+qcOlqobtn/rk7kivLE3mYoWwWmxGBSLYAL4akX+En5y6JtPH2RJ1Dw/BErFXKDrgUJCa6hN59Y2GaMNk5XAHTG/tQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2906002)(6506007)(478600001)(6486002)(4326008)(8676002)(8936002)(86362001)(5660300002)(31696002)(54906003)(66476007)(66556008)(316002)(6916009)(66946007)(83380400001)(26005)(36756003)(41300700001)(31686004)(38100700002)(2616005)(6512007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3YvM0ZYTWtiWW1yTDNuRmN3Zk9ZSTgvZDN5ajh3SE9rSHVoTlhUOGdxYnVW?=
 =?utf-8?B?TFJnSStuK3dyWmF5L05qd3pxS2RwR2pBMzlINGtNRk5OdmpjNGRoUlExdDBp?=
 =?utf-8?B?TzBFY2NVdVdsYjdncXk4NTdiQi9pL2V1L1VWRXpFTVordUpjRklUdm1pb0lQ?=
 =?utf-8?B?OTQxQnltTWFoNHpxYWVOVEk3ZHREKzh3b3c1SGhUVmkvajNmak9jSkUvVUNG?=
 =?utf-8?B?eldhSWRCdVUvejBmRmgxQnh4L1pyQ3NMVERtVjRudWsrMXBVS1A3WDd0SzBm?=
 =?utf-8?B?S0RWbDBMQlIwWVVuczZ2MGpKdlVkL2l6UExWYXBYVHdBaENLNXNmVkRVMDBp?=
 =?utf-8?B?N0FqUUxqS25ra2Zta01lWm85UU5vdmovSnF2R28xK0NwYlkrdm9uVDhWZGll?=
 =?utf-8?B?WjNYQVppRXpuUW1nT0Z6REx1MmIzU01lMCt0ditLMmE2OUljb2tGVnNMNGNs?=
 =?utf-8?B?a2x0RVlXelJEa0hqRGdPUUI1c1RzRWp5KzBZaXlVd2pEanRVWGM0a1lZVitG?=
 =?utf-8?B?WEdsSGdUYWEyY0tLbTBndUNyVW50RnFhNTc2ZkU4NGVvdWljWm9sYjQ5YTNI?=
 =?utf-8?B?K0xFbzcyM3lCcmRiZXNPZUM1aTNDeE5YYVh0OHQ5Z2RUWkNCeVZMUTNycU9p?=
 =?utf-8?B?NnF3OWlxbDZEandlLy9JU3p3THRKcFNrc0JaQWdjUnlyMUF1WFYxQ2pFdndX?=
 =?utf-8?B?Q2tYZXZwbTk1RkNWV3VqSFhiM2tNeTZmdzdUcFk0QjBaY1JuUHJXWUtCSEFU?=
 =?utf-8?B?ZTRxZzMrZWRhZUFtbENTeVRHYVNwQXlRL05lMjc5M1BOUmFFalVISXRhVkhj?=
 =?utf-8?B?QU5NTm1JMjFScHp0NGxHWDZPMktCcTVZcEtESWt3cCtJMHpXZVErWnZFdC9Z?=
 =?utf-8?B?MERzQlhxZnZiSmVPZmpMQjJYSy9vQVFGTlA3QnQ1aDF6YXJSRHhNV2V5MGw0?=
 =?utf-8?B?Y2IycmNqUFJhZ0xrVnBpNmVWWlRNekU0TG1kVjAwY0VlZStVUmtWSit0ZFlI?=
 =?utf-8?B?OVNmb3ZEOHFzMEIyaVhyQmZBNzZSdXUvL0VSNGRScW9QTHkrNXM1VVNJZFV4?=
 =?utf-8?B?KzFzK2lSNVJXUXlCaW90d0dZbEdMSktnRUl0YUVUY1l0NEl3Qk1RcXo5TjYw?=
 =?utf-8?B?di9sQ2xJSmtNT1BPenNsbGxUcCtyaUoyVmhoem5HaS9STnpOVU5jRnZJem4x?=
 =?utf-8?B?Z3k0SmlrUlZsSWxwS2swUEN3c1JaT0Z4Y1dMRHZYN3hsYSttVFNVQnE5NVE0?=
 =?utf-8?B?OW4raUNPOUU5OVBzSGYyajZqOXRwNzBOcmUzdExtK1hQYjE2dTlWbkhTaEVX?=
 =?utf-8?B?TFRnNTJ5OEFwOW5jb1dTd3h5VngrdzhsWVA0c3N3TkFMeTlqV0ZUL2JFNEVY?=
 =?utf-8?B?YW45YUZBaGJsZXd0Z2tOeEx1dWpkbDlSMnBaMCt4T1ltQzRxUUxlMmJxYjE4?=
 =?utf-8?B?K09MMVZRWkhudmlsM0d0N3NEczcvaFhWTmNYbDB2a0loNWJLVldhV3FOVUpC?=
 =?utf-8?B?TjJYRU1oZUZTVG4xdEQydk5zdUtuYm9ZU1BCU0FkMk5LWCtGaWNvNmZacVNy?=
 =?utf-8?B?dG9UVG02NlJXeDc2WXVSMzlqcmdMYWt0Y3A1UGpFSEw4d1VwY1V3SWtGcE4z?=
 =?utf-8?B?MEVnOVRHSzR6VnVUOHlKU1EvZm13RVJ6N3pKYkJicDJFZGRMbU5kdWw3WWR4?=
 =?utf-8?B?bFdRbFgrNjljK0tVajRNeTREOW9zYUhYbi90SjJ4OGtwakdneG9sZmFYdDk1?=
 =?utf-8?B?MVVCM1pqeER0QXVZVjRSMnpGY29SYkVYamZ1Y2FRNUFVeERTSGU5VmRQRCtW?=
 =?utf-8?B?QkVOMUYzZlJJbi9LTVZUM204bSt2TWRneUtMdEZQUzJyM2NqUkVqZHhHZ0JX?=
 =?utf-8?B?bHhZTEZNVTJVU2xibm1nSGlZbEhpWGtxc3ZsVi9UQW9ZRkVtUGZBMDBqYmRi?=
 =?utf-8?B?blBBMlBzeFdkOU1CMXVsM3dIWUxKUzNXdytSY1pxY2RET21uSHdPVEdRMWEz?=
 =?utf-8?B?Tk1oZ2g3eERCNkNnZk9YQ0RCVit1M0o5QU5SMzVwN1dQUC9HWUJVQ04zeG0y?=
 =?utf-8?B?TWdEU0d0dkFobTNNUllnaFBCekpEWC83N05ORjhhL1g2L3VxSElWR1llWGxT?=
 =?utf-8?Q?NAnuIA1oJ+HzYq4A7MEuiJHtF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1435dfee-4c03-4a3b-be9d-08dbf4a15514
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 08:16:35.9977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BP/cU6roCDiBOhc8Z5Dy0IYbBvqj0Sh+brp8XKfIMRnjRXXZ0kC/yxMaUBaUrglSIr5giK/2gQqxJOL3/GMILg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8490

On 01.12.2023 22:44, Stefano Stabellini wrote:
> Replying here on a couple of different people on this thread.
> 
> 
> On Thu, 30 Nov 2023, Tamas K Lengyel wrote:
>> I think this form is bad and is not helpful. 
> 
> I agree with Tamas and (also Jan) that this form is not helpful.
> 
> 
> On Fri, 1 Dec 2023, George Dunlap wrote:
>> If most people in the community really do think that "broken" is
>> suitable for the documentation in our project, then of course the
>> maintainers should stop objecting to that kind of language.  If most
>> of the people in the community think that "broken" is *not* suitable
>> for technical documentation, then of course this isn't an example of
>> unreasonable review (although other instances may be).
> 
> I think there was a misconception when Kelly created this form that the
> push back was on the usage of the word "broken" globally in Xen Project.
> It is not the case.
> 
> I for example agree that "broken" can be used in Xen Project, but I
> don't think that it is a good idea to use it in that specific instance.
> 
> 
> On Fri, 1 Dec 2023, George Dunlap wrote:
>> [Andy] removing "broken" is a completely unreasonable request
> 
> I am in favor on moving faster and nitpicking less. Also, Andy put the
> effort to produce the patch so he should have the default choice in the
> wording. If the choice is taking the patch as is or rejecting it, I
> would take it as is.

I'm afraid there's also disagreement about where nitpicking starts. To me
"broken" in the context here is technically incorrect. Hence asking for
the wording to be changed wouldn't count as nitpicking to me. When badly
worded comments of mine are commented upon, I also don't count this as
nitpicking (there's always a grey area, of course).

Jan

> I might have a preference on a different wording and I voiced that
> preference. We could say that my request should have been optional, not
> mandatory. But when the majority of reviewers request the same thing,
> which wording choice should apply?
> 
> If we decide to ignore the feedback as unresonable or because it should
> have been all optional and commit the patch, what would stop anyone from
> sending a patch to "fix" the wording in the comments to use "deprecated"
> instead? And if someone pushes back on the second patch, would that be
> nitpicking? If we commit the second patch, what if someone send a third
> patch changing the wording back to "broken"? We risk getting into
> "commit wars".
> 
> To avoid this, I think we should go with the majority, whatever that is,
> and the decision has to stick. We have just introduced informal votes.
> We should have just used that in the original thread. By the informal
> voting, we have 3 against "broken" and 2 in favor (not 1 as George wrote
> as Andrew's vote counts too). 
> 
> The easiest would have been to go with the majority, resend the patch,
> get it committed. If Andrew feels strongly that the "broken" is the best
> wording, then a proper voting form is a good idea, like Kelly did (which
> I think is a full formal vote, not an informal vote). Except that the
> form Kelly created is too generic and has too few options.
> 
> In conclusion, I don't care about the wording. I do care that we reach
> alignment and move forward quicker. I think the informal voting
> mechanism is the best way to do it.


