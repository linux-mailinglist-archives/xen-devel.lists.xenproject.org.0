Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042C27F0E31
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 09:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636490.992028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r503l-0002Hf-3V; Mon, 20 Nov 2023 08:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636490.992028; Mon, 20 Nov 2023 08:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r503l-0002FU-0L; Mon, 20 Nov 2023 08:55:13 +0000
Received: by outflank-mailman (input) for mailman id 636490;
 Mon, 20 Nov 2023 08:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r503j-0002FO-UE
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 08:55:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82d76971-8782-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 09:55:11 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9243.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.14; Mon, 20 Nov
 2023 08:55:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 08:55:08 +0000
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
X-Inumbo-ID: 82d76971-8782-11ee-98df-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3Z8akqRoxHg1lBKuqlNhp/XlFa61ulkxplhGU4jcPHsrpwa/C4daRHkXNQFEj5tXyskJjtH9b+VKpuWMy1Ltd8vrMuddD4oSBO1164BnLsrlNI+I3aqIAuGb3s07vtt0i7JSqvVCxxeVQLylS01FDVIzVUv+gPuYXzNH4ONTkdNQXhCriXWIj7p6C48xPeMxDt/++nbGMIO3nhiGQVWYb8YUA95Q84eIf6lB0x4PrQB2dMMFXruGouNTyhyiJij/fgEbbdWuEHNRrchTxRkf4GIQQGqCN853kWFocNim1QrTp1fFGxZQAl2SR3BucB85SDvMoMqxxKRIoaIxFRh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7SX/kL6XMd9FyKFEdgJWs02MD7/r4EbGB73Gq4gnNI=;
 b=K3NuC/5ka0/2LifMuPciPQc4lWjyOLDagvPv/gDfUuy6qwlyPMfYF9pdkdcjSU6S0inzhUyb8mFPMbz65rvoQw4lOXrPeCaDfcdFzd0/ENeMjLf/8C+jrsAWAhVEf4pFkmKmQagxSj0x/q+DCNFvapRxdZCpLAdFMWZEe3NakuT8lqwmjWGnImniUbvlaUogdnXRcJiJuRP5smQaOi2bCfVaS/wQthd2JkNiRopryUYpbuwRc1DpWZRCwuH05xPxH/o0RPHhKzUA+NgQGNfiYXLwyDpUATgwvfbpBiArVttxPIy4tx9xiDS8gXNuCKt7gkKcjBnYYM8cduA49ddFng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7SX/kL6XMd9FyKFEdgJWs02MD7/r4EbGB73Gq4gnNI=;
 b=PZyWYPj7e7dUvZWu78muYDJMAh6FNcoutCuUsYf2QMYQY2niFG0+SIp1XhYOY+CnvQ999YrRamfLnKH20AjhnPnNGoa4wr10zWD/sD9UiJnqx+TUwx7WExr8jfz+cHQNJnWjYHW550T+yDesozHNlVE+7+LSlj1ZEkgxPCerS8NzwpuOgHxZ4Bfl0svjQyO1KcsHS/kb8mHEufNnRM9Rbb/OpNojwTc90OFjyIz5ZTkW9Rp+uPi3ZSgvnrdBYxebg101m3gdQxolOnnwQMJYAOM2F0T50erVyC6ZpeerU8+vkLvYnZaV/oBRAVKlQS7QoBjEO/ja6r/XYJP/cNmH1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <31fc98d2-6bdb-4d00-94f1-d075b3ccd822@suse.com>
Date: Mon, 20 Nov 2023 09:55:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/17] docs: update numa command line to support Arm
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <wei.chen@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231120025431.14845-1-Henry.Wang@arm.com>
 <20231120025431.14845-18-Henry.Wang@arm.com>
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
In-Reply-To: <20231120025431.14845-18-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a5f6d3-01e5-4df5-2f54-08dbe9a665c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vgGwLt1VpotIgqKmtYhqnXmrUW8CxhtABsMX/Ql3ey3dwoRfJWZFRWNkKR4lNoxASLB9vEKzv7SddI4IRWm4NOtr35C7DZIZrxfJ4PLhZyYvlML68DLCwaB039rpp+RXmUwMyLuLIfKIRzPFtnNcbXhXHx7bT+z+cKvVmb2mzQBUhJ5S4JeuVXWdUS/l3omDBw9PBXmppsXOtC9SxAf3x8eIZMNsFaylXeucdBSammMrGmWBCJTZ3FnxODxHzl8DsggqZuATo9E/x2EFe9Sbj6wEpVz5t2vdiQcSbX7uUK5yPLQahc7Q+Y2PAn0BfF8L3KB7Kz6/cAyTtdXS8g+NAkylu6050ThxpqQbDZtsak3mayQlktkK21BrbYbOC08AqhvrKY90TQzq+2EbbP6FozqvORhtIlRwhdpC1YBrHFg6kfHWUrKC0DfQfJNnkeqLIXA1j1JaK1PGYPI/7JmyY0w9T6gwmAZWHXEezXxL+kzItj3EbYlhIjFFZActrc/6E53ih/oR1Zk/8NTIbT8bfGD/FgiPydXzQul1z8GSgvKWtlK+jP5FEeet8OGtPUm0BZqnlv4FJfJuabZ+beHJ5pW4CRYvrjmGzWq2RLWoAjgsZoh706bZVpWzZe6cFFQq74tST/9ublkjarFps6tRkGyeUQsKisFku79aV2osprQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(136003)(346002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(54906003)(53546011)(66476007)(66556008)(316002)(6506007)(6916009)(66946007)(6486002)(478600001)(31686004)(6512007)(38100700002)(26005)(2906002)(2616005)(8676002)(31696002)(8936002)(4326008)(4744005)(5660300002)(36756003)(41300700001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnRKckpjd1RleFJsQ09nOEFVaGJoOVhVMFFndEY3cHIzcFpBSm4wOExpWlNK?=
 =?utf-8?B?T0ZXSi8zMi8zejBZcWZtdkN4Y0o4eEJSSldMd1lNZDRaUTFER3pEazhHZlQy?=
 =?utf-8?B?WU5RaEw1L05DejdyVkJ1TzJlYXdDZjVVMTJWWHBhdm5tVi9GWTN2cEwwY3B1?=
 =?utf-8?B?TFd0VFVRS0VXTXpPSWM4eXFRdnJ5K2YyRVhVTmRHMzYzcHJrRTVRZHI5L0s2?=
 =?utf-8?B?N0VQU25ZVTM4ZEJNOFNURE1wUFVoc3lLb2pGbGdSQTRSRjZHRzR6WkJZQzJT?=
 =?utf-8?B?WmpaS2lQbGhoN005TW5JZk1lNUUzeFU0QTBVV1B2MzBBMmJoTzBsaVZlbW42?=
 =?utf-8?B?Nk9uQzRVZGpZTlpBYTBXczRRN3VhYXhYSmhleVNSVXFUWSt5Mm1kMVNCcjRF?=
 =?utf-8?B?S1lNL0d1SE1FNEFBTUp2LzVROCtkV3laZGxWRys0eFJzZUZtMVVCcFNnNlpU?=
 =?utf-8?B?bzFBZFIyNFcyUncwVDBWZldKSHRNb2ZwMC8zWDNRendLZ043MWVEbEV2dTBJ?=
 =?utf-8?B?Syt5dXpTMndGUnkvdkxLWlRPcmM0cFpRVzVKam5mMTArTERPUk9CVEtaUlhZ?=
 =?utf-8?B?UlJMZUxPVWZ0TmVIckpGb21BRmlrY2dnaE5yTk5ZSnhZbThIc0ZGOWZJQ0pM?=
 =?utf-8?B?TVg1SWtYYkxscEZtK0QxZWZHUWVPazR2dGtPd2FJaDBSdTd2VWZyZndNZDdS?=
 =?utf-8?B?em1tOU5DdzFpbEx4NEltb3dwTkl1RVRlaTFuZjRsczJ4NUJ4Wm9zMXVHRWg1?=
 =?utf-8?B?MXVKRjV5KzVlbFpOUnVjY3FJVTIvWDFydWhpRWFCTkFGUzVjRmQ1ZnRsaTdC?=
 =?utf-8?B?UzlmV001Sm93OFV3dlZRdWpub2lNVCtjQVBVZXFzU3ByLzVYbkcvQncvMkZ5?=
 =?utf-8?B?cWszcVE4L0FoSWdZRC9XVHorUXBCcFREMkFlV2ZjVHdUMnh1YVN6RG9BazZN?=
 =?utf-8?B?MnhtTTdxMHd2Q1hNbWVWZGZVemZnaFQySVhuSnM5RWx5a1BxQlRENVZRaXlN?=
 =?utf-8?B?eHB1cnR1eEZIQU9CYzlJMXJkcElhTk9nMkk1VmZ0QXc3WGE2dEZDTW5LRlJG?=
 =?utf-8?B?dnNrNGFYNUdlZGZST0ZGYmZRQjRHenJMdmJqbnBZZ0tGK3BwUlUxWE1EcWVC?=
 =?utf-8?B?MjdqSC9tbGozRTZDQ0h2eEJOL21JK1ZMTElJYUdwdHJISTdNeXd4SlhMdGhL?=
 =?utf-8?B?eTJJNkpzUkp1UjBsZXN1QkhzTnR0OFZLTERVQyt4QTZTdWJ2Y2owM1hESDhi?=
 =?utf-8?B?TjBVSHJFN0RiLzVNYkZJYXdoNlFFMzlxNFZ3aHlNcXJOU1VRUFFMNHVMYkV2?=
 =?utf-8?B?dnpQRzlGS1M3ZHZ1NTZKWEF0UU1ETGFxRTY2OXFGZkVYeWtUVEpndXplaU44?=
 =?utf-8?B?WnNHQzNKM1IwYStQMmtZN0x0M2NBQ0tzNzU1YmJPaVJFNHFGV0hNTWplaFFs?=
 =?utf-8?B?SUtGRUoxd3dBOFowQk94R2s0b2EwdGVrdWNmTTFoQ2lkUUpSUkFKeWJHQnNz?=
 =?utf-8?B?bGZTMWNFeS9GOVo5UkoveGthMGxEQlJnZktFa210cC92MmxiMFJYTHpFVFpi?=
 =?utf-8?B?bEtldHNqbUpFV0c4Y0hTUjNGU3lXV3R4aG9tdjBWTkVENnM5M0UzL0phL2kz?=
 =?utf-8?B?cCtyaTRCS2U0MHd4WWdVV09tamFKKzhzQk03bVhLY0ZqZjgyQVlQYWlJcE1D?=
 =?utf-8?B?cHJSV2tHd0dsS1R1RmNBcmZKT1g0R2ZvTUdiekNKcnNvelo0VUdXSC9OWE05?=
 =?utf-8?B?MlQ4cWVOanhOdFV0aXdPSHBrY0JPeEZkdU9LeWNXTG9DbHZoOFgza09oU3Vs?=
 =?utf-8?B?MnR2TnVnR2pxUnV6UGYvd250QjVLemx4MW91Yys5eFc2TGd1OFBHRm9mS3N1?=
 =?utf-8?B?djdoaldaWHVrdEE5R3RnZ2NXenlHT0o0YmQ1eGdCK2psT2FJMTZiQmgzeEJw?=
 =?utf-8?B?bmdlVmlMNENzWTFXcitVdVYyRHhsQlFyQUUwemxBZnpPWFo5YldRM2p1ZTdu?=
 =?utf-8?B?RDlpRVNIVzg5T3ZxRzZ5UUF6ejFER29VL2VUUGhhT3YvWEZoYmdTVjA2TEZ3?=
 =?utf-8?B?bERrZHFNdlJlZkJWdE1SYnhwMVFUaS9QVGJ4RnI1QlhKZ1MyKy9sLzZORWhW?=
 =?utf-8?Q?AA0H32At2vYk5zbiax33seT/N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a5f6d3-01e5-4df5-2f54-08dbe9a665c0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 08:55:08.4830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16rpslVE4YZvEFLejYpxG/rYLCKWSh9Xbp91uBfM31iF9lSVRhB+mbr6E+HNLgRuB2c+a2jcGfoVlUUJan2cZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9243

On 20.11.2023 03:54, Henry Wang wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - On x86:
>     - Introduce a new x2APIC driver that uses Cluster Logical addressing mode
>       for IPIs and Physical addressing mode for external interrupts.
> + - On Arm, NUMA aware scheduling in Xen is supported (Tech Preview).

 - On Arm:
   - NUMA aware scheduling in Xen is supported (Tech Preview).

Jan

