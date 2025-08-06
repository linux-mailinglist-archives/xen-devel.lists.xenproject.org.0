Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC85B1C738
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 16:02:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071815.1435188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujej7-0004Tp-KM; Wed, 06 Aug 2025 14:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071815.1435188; Wed, 06 Aug 2025 14:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujej7-0004Qy-HB; Wed, 06 Aug 2025 14:02:45 +0000
Received: by outflank-mailman (input) for mailman id 1071815;
 Wed, 06 Aug 2025 14:02:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5Mu=2S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujej6-0004Qs-Nc
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 14:02:44 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05e35f09-72ce-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 16:02:43 +0200 (CEST)
Received: from PAVPR03MB8921.eurprd03.prod.outlook.com (2603:10a6:102:322::9)
 by AM9PR03MB7679.eurprd03.prod.outlook.com (2603:10a6:20b:41c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 14:02:41 +0000
Received: from PAVPR03MB8921.eurprd03.prod.outlook.com
 ([fe80::1fbe:d673:80a7:6ebd]) by PAVPR03MB8921.eurprd03.prod.outlook.com
 ([fe80::1fbe:d673:80a7:6ebd%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 14:02:41 +0000
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
X-Inumbo-ID: 05e35f09-72ce-11f0-a322-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cusBqae8MRPsBRvn/hDzt4mG59LG592ur4YtODfnR04yq8ubCV+b/S1128GWbwrZr/J45LZs31pLhbDqKkLicjBWFn6gBs4u892MwJgF6s9v4G3RKpBja0oQN8eMClICmVpCaUVZY8ZIc9LWmoriefvmDIE/t16cm+CFthCKrJdx0NU4DZxfwTTukTkyAv8VFmuBhtAuoZqIfbBHuT9DXm6+wxYKmRZnwcPaFF7hZdHGJCgaD9QjE/eAi9ik6HBYNFg8CCq4IsGeZSKfZ3dTFIC7dO8jjqGH+ZE2fc5caP5PqJGeISeIAAFcsDVbA7i5tZpO7cUXrNomi5h+gsKbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Cdc0ktzQDdml5RqPtUhljE8PHrMsUFhA40Dp6jIjMI=;
 b=uSl1HblQrC+b/2mzGRjRzhKhET0kL31Ol603wXQgzBTQVJkUDzG+PbCPg7ySYvTFQf2Nj3BT5Ca3G7shwl3GoyedZpopQFnfBa0cssfPwCBHFWmQiQUp/bhjvLVjHLZC1ZChRYy6rYVA5zEjUbl8V8r8UaGJ04Oi/WjzCisvl/BmB1gWr1mlHSJk6iWHK87jcmfkn8Bzn1F2yvE7r7xT/y05xJUaT3NLn9KHggvndTpW7euyW/+pM8voDLoX+rirRFgmnCZBO32+0bOavPLnMDhh6dEUw5b2FHjW7GZcrdIC7ZWrs3JYknKymLiKezTRk8dhjx8TKJzO3lqjSdTAGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Cdc0ktzQDdml5RqPtUhljE8PHrMsUFhA40Dp6jIjMI=;
 b=ia24HRKnCFa2vBQG793r0fOaTgOgehfAXdTfSFFm9Va5ynhsGZdw0T2MThoTEd8u2DW2pdPcA10BCxv+LoeZ2Ur5Mcd4PN8Cmc5geWdrGHqsI4Y4aDNg+rthNuYkzy3PFspyr2Cbp2J7po4R0FzxESAQXnCGYOjohbFX5wJuEmKSDc8vS7wa6abPdJxlqrJuM1UnEJqQFJ32JmroevWJOWdP57Y6qUOWv41sH8uro000zRpU8nkyMIaL5ACGuDmZc9u6XDhVqIaZH6MyzlTMBkbvxxqBUt29hgXBOilE9yTI11rDZjoH7h0S2/4zXEkXC188o2HstBPDNaZxhZRgWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <07feaf5f-9565-4672-8d6d-6270d38f2da3@epam.com>
Date: Wed, 6 Aug 2025 17:02:40 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/dom0less: arm: fix hwdom 1:1 low memory allocation
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Denis Mukhin <dmukhin@ford.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <20250805190017.209711-1-grygorii_strashko@epam.com>
 <5807ed03-7db2-4ce6-9acf-c4d515fbd293@xen.org>
 <5a33ddf2-716e-4fca-8764-760dec9944ce@epam.com>
 <72f0d4bd-65b6-4904-8fd6-b714058923b2@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <72f0d4bd-65b6-4904-8fd6-b714058923b2@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To PAVPR03MB8921.eurprd03.prod.outlook.com
 (2603:10a6:102:322::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8921:EE_|AM9PR03MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: b3fe04eb-5d41-442f-d747-08ddd4f1e8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnhCdXhCeGZTNEZ4bzdOMC9PSDJwS0J0TkJySGRVK0tVTEt6TGRJM1NGMlNE?=
 =?utf-8?B?cHBuVkorbGIzQVA5NjU3bVhad0ROK1BXVjdMSldUU0lTWk9uSWp3RkswQ1hX?=
 =?utf-8?B?UE0yNWlQN09wQ2MwNzdJZVJ3TjVUdSs1Y3k5TkJaTngxL293M3hnbjAvVHQy?=
 =?utf-8?B?UlBkUnF6d3VSUG0zdExCR0dxZWs3ZHFyTktGUG95bTltY0FJWWtxSWl0N1B0?=
 =?utf-8?B?bjNBWm5aL1pvblJHVU51WEtGcFFIb29QTkIyN2hnOG1EdW9XaHBmSmtjOXI3?=
 =?utf-8?B?a05hckgvajJ1RDNGUlMwaTR4TTB1amg3UWE1RjRvZ1ZhK0pGV3lxMVhLYVkw?=
 =?utf-8?B?aEhuNTdUOXpFYitrNTAwY3BkSlZJdXk3MndFbmpibW1xZ2lWdVVuSDNKcmNq?=
 =?utf-8?B?OGJkWnJUbDNOekRRbjkxM1NrYXVmV2Rwb3BseXlHdFJ6dEZmdHJRS1VOdk53?=
 =?utf-8?B?cE1SclhETDJsRHNTM050SXZWakl4eUErUDZDck5FMUJRV3Qvay85cWZ2SUMr?=
 =?utf-8?B?QUFsUTQxbTgvYlQ5NzlYV3RFekFqKzZ5TjRyUVNSWGZzSUJLWFJROHl6RmJk?=
 =?utf-8?B?c29hOFkxNW9MbyswdU45R0VLU0ZUK0RISjN0aDdaVVpyNTg2Q21qSk1iM1FO?=
 =?utf-8?B?NFBHdmVoVGw1MkFkRVB6bmVUVnQvK3gzeDJOdC9zSUhIeFhteitxMzdleW9k?=
 =?utf-8?B?Nm4yOE00QURDL3ZMUVdENmlYcDU5UUZFZUFIQ0tJOWR4alo1UWoraUxtQlNr?=
 =?utf-8?B?M0t1YlpiZkpRTE9Oa0dFenBpQ2hzRzdpcnMya245MnhId2luRnZmenRGbFhy?=
 =?utf-8?B?LzN0QWY5VjAwSnRYblArdWdPak82aTRIZEFYbWh4STR1R243MFFZbFg4WHJt?=
 =?utf-8?B?a3NIV2h6aHpYV3BKOTVKeCttbEhieVc5U2l0QlFsV2JSc210bDI3UW5Cam52?=
 =?utf-8?B?Y1B2aUsyR0s0WUFUb0Fib3drc3BqV0ppaEpSRXVQdHpLRW9CaVZCNHIyanhl?=
 =?utf-8?B?TFpmN2pBWEtLd1hwY2dQWWRHNnpNbmxWaXZxcUx2Uk92enpzbDFLc3h6dGdZ?=
 =?utf-8?B?U0lTV2dZd0g4Ym1pR0tTMk9HS0E1dkhSc1VUaUIxOUxJL3VCajlKUWVhWWor?=
 =?utf-8?B?OWxUbDdtdWZyczI5Y3Zhd25YUURpbW5RaFB1dE4rV0FjMHk1b2RkNTl5VW1U?=
 =?utf-8?B?ZWVoUmxEcTdTMkJVMXlTczRXMkwrSmZveTZxb0VDOFBXOUtjR08yQkF1cXlU?=
 =?utf-8?B?NDBjdmJ1S3JGTElFRDg0L0wwc0xsY0U3L0FuWW8rSzNmTkZUb21qQ2ZaeXNG?=
 =?utf-8?B?NmxtT3pIVjl4bUxlbGQwZUIxZytaMHNzNTQwbzFjY1JGTVVjWE4rbllzdG01?=
 =?utf-8?B?bkFOWTE5Z29vTDVhL1RDRlpXc3EwV3BoL21FMHo4WllMcHFIczFTZXVxekdN?=
 =?utf-8?B?bFJCRCtMNTZQR3lrUVZ5UU82UGY0RXFyRWdQeUVheEFTRVc2VVVxSkdLNk9M?=
 =?utf-8?B?Ynd4TC9GWDFnQjRCTHAyM3paT1hFK2NPNzNDNk8ra3pkY3oveWFqTDhlUGFO?=
 =?utf-8?B?TVppT1plS1NMK2lYcnltU2o2NkR4RXQrbCtMQ0hhUE1STjlWVE5wZHpWZHNh?=
 =?utf-8?B?bWZiaktoeDdwY0prM0JEaDg1NkRZdStDUWxnSXJvdXB2azJJQ1gyNitsMUl6?=
 =?utf-8?B?OUYxeU1iaGxGSFFFT1JOR1B1RnFockt4cjRpVnR3enRDYTRjYk0vd2hxQkdD?=
 =?utf-8?B?RE15WnlqMjh6YUFrRkJnRHRzRUVGSlhyb0s3Znl5RjdQK0tSdkNmUjk4clYz?=
 =?utf-8?B?TkVTRDZsdzg4cDY3cXhLUG9DSjJNak9DcGEzdTZTMnN4RXlZbUFiRGlBa054?=
 =?utf-8?B?K013a2ZCU05GL0NjUmtkOUJpYlhlZ0hsUFBpeDlnK216THc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8921.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3hRVzlDQURnZzUvV3RiSzlhU0w5aXdZT1JKTkoyUUI2R2t5ZUFNayt3ZEhD?=
 =?utf-8?B?cGdHbldRL1V5bUw0a1U4NkxMbTVlb1VGaUdPOGpuM1FuTEFEaTF6NkdLNUNX?=
 =?utf-8?B?c0Vxc3JnZUtnSHFtZnlCOXNqYmtReFNZVE45NGFXZ0hsWkM3QmpFc2thWktQ?=
 =?utf-8?B?WVRpN0lTeU53Y0cyS3oyZy8xbjRpV3BlYWI2ZEE1SWVxQTdMNWdLdUg0V2pQ?=
 =?utf-8?B?QlNLK1UvNThPdHdEc1ZSZmVDeGFQNlpZcGp2MmMwMlNNb2ZzN05BRWloOGZr?=
 =?utf-8?B?YWovTzVaRVQxdjkzWWpkYWh5TUc4S3JjY3FqN3QyY3MxVXdVRW55TE9jdEJi?=
 =?utf-8?B?STBZYTUyaDZZKzF5ZU5VNUZiVFFINjVyZVUzUmNzMFJVdWs3cDJjVVNHMHZW?=
 =?utf-8?B?R3hhaTRHcUtiNkI5ZVMxZjFtRm5TV3NTMGNsWkVOaHVoSi93b1pLNFhLNGcx?=
 =?utf-8?B?VGFFUUFudDFWaDhQL1lpWWE4MGFaV3FrbGhpMXBud0Y1WGs2eHd6ZWh5eHBz?=
 =?utf-8?B?a3lQc3NOSHhSbU12dHpwQmZGYjZZMW16Rk41OHBBNTl5dmYxd3l1dGpNaTl4?=
 =?utf-8?B?Tk9HTXFiQUxZR3E2Nk5YY09kRDNIRzVwVlptd1JWdWJkYTBCNU9GVW56UmRV?=
 =?utf-8?B?WTdKcmFIbG1jelFuMTgzUzU0V2c1NE5WbHZQUloyeStQaFlHdUQ4OWtPRkl2?=
 =?utf-8?B?RVNWYzV4R0l1K3g5ZEF0NDJHaWFFOUE0UkV3ZDl5U3NpeDNYeEdZR2hlaDZm?=
 =?utf-8?B?dVo5S3FEajFmVy9mQ01ZSXcxeVJ6d0ozdEhqMGsyWENhSVpkRmVFZEJjN25k?=
 =?utf-8?B?ZEJQSHhueXFmMFVJdFhGbU1kQ21FNUIvdFhpRkM2bTJEM1pmR3czNC9CM0RE?=
 =?utf-8?B?QWt1R2hka1lTU2RWNm54bWhYSHZpZEY1WUNjWkFNQldGVTV2cS96TWZUZmV4?=
 =?utf-8?B?Uld4Y0ZWTjlBV2NQM2lrUldhMWRnVTJ0UHJaU1ZVWUVKVmk3aUQ2VnZMOElt?=
 =?utf-8?B?L29tOUJsNm83MkRiR0lKVlNndzBGQ0xFWDFIVnFIMmhuRkRUUUhXT1N6WE1R?=
 =?utf-8?B?NEMzNGV1NHRtZXdTMGFkTWIwdUpwdXlFdUJEUG8vTVNVVWl0bmIrK2NqeEFh?=
 =?utf-8?B?aUxBYmdmRi9veEFoMUJmR3FsdmphZFA3WHhhUHNvSHVHZDdMMHV3dFJvS1ph?=
 =?utf-8?B?NUhaRk16RWpoSERiMkNxb2J1VkdOWUZNTjNVbHNwRW1qTnR5amVreE9ra2Jw?=
 =?utf-8?B?VDJ4WWFPNXpjVjBnK0E0UDYxYnd3RGFybEYwZCsrR1dOYnU0TFhTZDNVM25l?=
 =?utf-8?B?RlpUaVRZelpmMG43ZjlxRmNYUThaVHVPa0ZZVG9RVVljTXcwME5sdW03NjZZ?=
 =?utf-8?B?M2p2Y1EzOWd3QW5RZlJUOWZqMFVZaUNVTnlPTlpFMEVJb1ZRVzJKUDk0OGtV?=
 =?utf-8?B?ckZveHlkOGF6dkU2TjRjSGZNckZjMW5oZW1keEZ5TjVXWHFoeWxUSG1PNGY4?=
 =?utf-8?B?WWlHbmgra3hXOVBsZGVXZTc0ckQ3amRZQTU2eW02eW1tcTArTXJnZTdUYi8z?=
 =?utf-8?B?TWtNUVhzc3ZRU09KNDJqTDZLcUorcjBCS0ZRc2E2SEExdTVmZ2JQNGhkcU9E?=
 =?utf-8?B?RGtiT21sSTloY2JTT2xxUUtZMHRGZGJwVTBrUVczaVczQVpvd3d2cjZpV3hK?=
 =?utf-8?B?UlFHQWZGaFlLdVV1ODJ0bmpmZzA5ODB4M3lWeHBZYlFSeU5xMTBNMXE1RHR4?=
 =?utf-8?B?SW8ra0NJSlppaHBMSFQrN1ZBeHp0bml5WkwxRHFaSnJCRzcvbGY1Tzc4V1Jr?=
 =?utf-8?B?OHVESXE3eEp0dzNCTVBBanE0cFB3OXRmVXJGZmNJSWx1ZTJhYk5NMjNmTTZN?=
 =?utf-8?B?WHBpK09WQUZHVVYxdEpTaENPeDRQSHBQTmJwdDdUaGcyVjh3K3FPZ3lsWEJa?=
 =?utf-8?B?MHZtdG81TjFVUUtBbjNmcnhMNUwzZndINFArMHl1UktKS294WXpEM3BvemEv?=
 =?utf-8?B?VGxEQnZOU3VucjZUQ2t4UU5mcDFoVEx4SGtRSUZNRmJVenhvTzByM0FjWER0?=
 =?utf-8?B?cUkxT0RMa0ZacmxoOVorb205djRGbkkzbXF0VjlGOFgxZTkwdnJacVo2UzlR?=
 =?utf-8?B?VFhZaTQ1QWgvZ3pIbzFXTDArRm5lQXFIZHdUWWZLTXUwOFIyWkhFZ2UvaEt2?=
 =?utf-8?B?ZUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fe04eb-5d41-442f-d747-08ddd4f1e8ad
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8921.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 14:02:41.4370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R51O8ush+c8zrjd+oCbQhpi9sQSQMeZs03d9v5MJk1Xhod7QcdUfUgfZrVSrvpAKqq/TaZiBgKrFsrhDq6Xt6AkfQhY05/tsw6/UphWrSUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7679



On 06.08.25 11:48, Julien Grall wrote:
> Hi Grygorii,
> 
> On 06/08/2025 09:19, Grygorii Strashko wrote:
>> Hi Julien,
>>
>> On 06.08.25 00:07, Julien Grall wrote:
>>> Hi Grygorii,
>>>
>>> On 05/08/2025 20:00, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> Call stack for dom0less hwdom case (1:1) memory:
>>>> create_domUs
>>>> |-construct_domU
>>>>    |-construct_hwdom()
>>>>      |-allocate_memory_11()
>>>>
>>>> And allocate_memory_11() uses "dom0_mem" as:
>>>> min_low_order =
>>>>    get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
>>>>
>>>> In case of dom0less boot the "dom0_mem" is not used and defaulted to 0,
>>>
>>>  From docs/mics/xen-command-linux.pandoc:
>>>
>>> ---
>>>
>>> ### dom0_mem (ARM)
>>>  > `= <size>`
>>>
>>> Set the amount of memory for the initial domain (dom0). It must be
>>> greater than zero. This parameter is required.
>>>
>>> ---
>>>
>>> If dom0_mem is effectively optional, then shouldn't the doc be updated?
>>
>> No. I think doc is correct because when regular Dom0(hwdom)(initial domain)
>> is created code goes through regular Dom0 path and "dom0_mem" is accounted for.
> 
> I understand this is used when dom0 is not described in the device tree.
> The crucial part in your sentence is "when", to me this indicates a condition. Whereas the current wording in xen-command-linux is using "required" with no condition. So a reader can rightfully think the parameter is also used in dom0less and have to be specified.
> 
> So I think the wording needs to be tweaked to something like "This parameter is required (and only used) when the initial domain is not described in the Device-Tree."

Got it.

> 
> Although, "required" might still be too strict because it looks like we would provide a configuration for dom0_mem if it is not set.

Correct - it will be defaulted to MB(512) if not configured + log notification "PLEASE SPECIFY dom0_mem PARAMETER - USING 512M FOR NOW\n"

Thank you.

-- 
Best regards,
-grygorii


