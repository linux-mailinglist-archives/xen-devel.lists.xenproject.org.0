Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA836324DB
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 15:03:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446619.702276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox7Nd-0007A9-Ub; Mon, 21 Nov 2022 14:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446619.702276; Mon, 21 Nov 2022 14:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox7Nd-00077m-Rm; Mon, 21 Nov 2022 14:02:37 +0000
Received: by outflank-mailman (input) for mailman id 446619;
 Mon, 21 Nov 2022 14:02:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox7Nc-00077g-TG
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 14:02:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7d00::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2606bc7c-69a5-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 15:02:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 14:02:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 14:02:32 +0000
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
X-Inumbo-ID: 2606bc7c-69a5-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkY9CRI/ZBJj+43CC5yEuSMdyRs5x5jxpg6wrnu+0PeGBMCw1jheQGQ5U7msP6BgxibLTDLrhcU16PbTPFl7SWA5yrXaGmTd0Xy8+BrwE9YGHzM6uwovyZBSW7HFPqwidj2inN1ucq0wqiNoubkU+lPDdILxVcgKO8smhnK6SSJ8yHEiO13LMarAQjsBB2JVWbUdKraVMFaXFdeMcImKA++hatxlp/TJx4D4UWk3ysHKZGb7igfLMq836CCtt3v095jkL6lbIO/VOFcE4xT+t7uGtfgkvuuPMVP6UiakxiWTPVcWPdn/bI0lVNgPJZjwEwlWdo//QWFchNHd2AdveA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPGbfdI0s5RvrhldWpZ8LqzeGn10EJlf7jOZx4NJznk=;
 b=IkpKNQNEeTGxu7IvfjnwBH67qOoceh+8vLZhG8Sf66sGjZqBWUka+YkRhIxCj+M2TkZDEL0KCYxLd2uqu57zOgc6G+aFYRFndRkaoka2jAnUASA5AhZWSJPooB8sKbm0dmmllAeiq15vnZTGFkHPd9pXX7PihEyZUu5ccj7gkJ8q/Ck1uqefhI61NTrZsU2uNnZwVMj8rbjQzfIDmqA949nSWcMNuCNPZlK8ZNQY/yaR8xI5Tec8ZkWqPqsD/Tusdch9vjm1yzf1c4le3TMnnj708EvsdQ6+JWvck53MOuDQ5qqEJ0U+5t/V5lEhsFM8KTOo8au7Pd2HvUiwNyusYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPGbfdI0s5RvrhldWpZ8LqzeGn10EJlf7jOZx4NJznk=;
 b=02zimt1lVuSDEoZQr9wxXkm8BsBxL0JYk2OuqPQqzEPOKAFRjGQiXzl6OqurXMk50atHy/kzTTTyqbEVvU21sb/GI/1eQ0sWMPRWLF5ktuttyll1dhGTPgVj2aGolxMxmAd/U5zs3D46ujTJi6/wcPw4Yi3g33Vkr8FXHXmYFNSwXpDglyiWyaoiwBJCOiATsrk8tGET1vWTCnd2xvj/rGPaz9UqdbboTStLcoO9+PTIP/F6KVjRfs8R1j5Td6jpHrdVihgmNvm8zU9gRwa0ovRNLtS44tnihQsFe+MTcXO7o9CeIAEV4y7VN3vsIEUz4JQeTMppLDoXgq5xm3YX5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d1042d77-eb5a-6577-9ec6-e6a7997f15d7@suse.com>
Date: Mon, 21 Nov 2022 15:02:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/3] acpi/processor: fix evaluating _PDC method when
 running as Xen dom0
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Alex Chiang <achiang@hp.com>,
 Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221121102113.41893-1-roger.pau@citrix.com>
 <20221121102113.41893-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221121102113.41893-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b3abc2-9446-423c-352f-08dacbc90913
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DuPP+lxt05pBk77p1hv5/L+Uh4Uz1fptLao2+kV8gQ2fMBevwZN6FGv0z2YYM5XkNVSDbj4UHcCoyHalR7CCD5CkRHv64wmK3LHKPXLXtqipOb1Q1RPdVo1leh1kV9O06Zpm+fK2VwMItbMB9FUxCbQn025GAs9ovvIcccRgI75meGEdRgYd6/mZktaWGRQqxOzrx3bGJZ2cWzs65YEtUJkktPES2GDsUTynzzg7hewGtcUrASW5EQOKimyjYwBJmQ/XdexHiiX972q/qpcQ0eyIvG6y98+J8+LkWdHIvm3rRUUx1iykZ/OJYcAFFtgKnvXegZit3/5T+Gicy4sa03dAqKXtwKDwadshrkMqnMpw2eeSpBz3JBbpgoDET0R7F8jOYVAUuG7kilZEWC2kWIbjyO3kHSKxPM1S8ihJ1g7Yo1sSUPyix64xmBOvpwyoBukV+fFNHPc6dXBO86dZIEwkx3paRF/bNt2U4CK2ZZD9zuOTHe4UAHTIYurmmXtTe0Zgk5/MfQ3sCXq8ia/rQT1p32cKZWYtnC8CHkdWhAFl0Fm/Qupo0Zqy7UopbvlcxHWRQ8P/Qljcl16aKWuFwqnjcLf3f9syx4+iJEKg1uCpy+HoBvjaStJ+YLeQOcj7WVCO6UCsIvr1NaNVqKxRV0kpIwnxWyV0dddr/+i7XjHq742yviF2z19J652pkmWn1zbMxQCNn2fqgDubBu3tnSqryAszs++Un8jhxnl2y/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199015)(6486002)(26005)(2906002)(86362001)(36756003)(6506007)(31696002)(478600001)(6512007)(38100700002)(53546011)(2616005)(186003)(4744005)(8936002)(7416002)(41300700001)(31686004)(66556008)(4326008)(66476007)(8676002)(5660300002)(66946007)(66899015)(6916009)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm5lNmpQT0pQTDc1c1V3T2pxVFNNUEthNkVnU3dCei9yQWxkREY3YThoQlha?=
 =?utf-8?B?SkwrbkV0TW9maG5yQ0JoNXFnVGJNTWp5QWVFTHR3TUsrdTNkdHQ1OGhMeGVQ?=
 =?utf-8?B?cDE3OVRjRWowWjZtQXVYZ3JxeFZlSkxwUXhsSnFuUks5dEFQdkpkclRRUXkr?=
 =?utf-8?B?YnZwL1FqWkhxMEpwbWFNTUlxQU1LeFpaaVQxdUJnY2JMV2dNaDNKTEF3clg3?=
 =?utf-8?B?ZUx0QlROR29pZ0ZvS2pPRS81VGJHMnhOUytNVXFCdllMRjBjeTlLejI4ci9m?=
 =?utf-8?B?VTJkTzNZajhWYmo4ZllhbzdsRDZGcTlZaFVGbk1kbXpVK3lQZkdMdjljYzE5?=
 =?utf-8?B?T3l5OVlRTGkzQkFJUUZaQS8zUG5OZE8rYWswY05mRVUwNHFMQkhCcVNlamgy?=
 =?utf-8?B?NWt3QTE0ME0yRFFHL1Bzc3Rrbmc5eDVic3k5ejdvbzlPMnpQKzQrck95UkZN?=
 =?utf-8?B?ZHJnMU8yRkpZTDg5NGIzOHNYK1I3SS9XZUhDVGlXc3luWUE2UzRrUmhsWEFq?=
 =?utf-8?B?U1JSM3QvaUFMK3dUOGs4NGF3eGFyOFU3L1ppWDY5RVBVQmRVZGxINDlVbStK?=
 =?utf-8?B?UGw5MG15MjRXdllaa29JMEt0L2N5N3BZa3VGRjlua1RYc09PTmNrelVyYTMz?=
 =?utf-8?B?VFZRWTV1c1lPeTUwa3NiSUNLb1M0L2Jsa3Nzbk1wRE5ibGV1MjJZTkJwd2E0?=
 =?utf-8?B?NzFneTczYkpTbWQ2Y0N4NHl4SjZUL0lyWm93ZTV1aWpHeUpwUkVldnhOMndT?=
 =?utf-8?B?cUJNM0FKejJkd0FUSHQzS3N0MlBsVEtTeVNWSUZkb2o4ODNUaTNTZG5rMlBz?=
 =?utf-8?B?T0pWN0Uwb0dFTEFvdnM1TXBHcWpkMWw5WUt6Q0kxVmhXeU1BOHBwWU9vblZu?=
 =?utf-8?B?bml4RlFtRURHUnhFSU41amJoT3B2M3g0RkxFbGt2c0RvNG8vZHp1Y3BLN0cz?=
 =?utf-8?B?OGRIZkdpVjdNelB5VnRUVjdBWWZEbVJ3SU9rYkUwYmRYckd0ZVhMb0lxWnFY?=
 =?utf-8?B?SUw2MVFQcHRJeEFQZTVEcnV0b2FqV3BmYU9QZndsNzdxb09lUUloY042UXlQ?=
 =?utf-8?B?MkpJVUdsci9GQ1FLS2JQNG13OE52ZmhaT0pZRzE5RzE0RlRraFlrN2JFektr?=
 =?utf-8?B?T0hwM1o3OU5sMUhDYUw0WTQ5UFRtL1NUSVhweG5kc1hJbEVvVzJWZHpaSGJQ?=
 =?utf-8?B?RXlXUU4vWkFpdzk0YVNNVDVlVEtaNSs0aEFOZlh0V1ZMSWdvYmQrWnZ6L3F4?=
 =?utf-8?B?MTVxazNrbWNRc0JoVExoakV5RCtjU3AwVWhYWXlONWhkbGRuUGozZGgwZXNt?=
 =?utf-8?B?bmMxUDVIa2F6M2RTcFdoZ2ZYMTR5UGxrbm5BWCtwWFFMVXR5b2N3QjV6WXhG?=
 =?utf-8?B?UmZiZHhMcWp5K0NQRjNiV1Nya1VGMWJMSktRcTY5V2kwVC9aaDhZM3pIZVhn?=
 =?utf-8?B?cERab1FsMG9ObXFEMzVIOHBRVlUyZGx4MEhRRHF0SFVURS93ZDVBbmFvbm9B?=
 =?utf-8?B?aGR2UjRreUczMExKY2ozbndhWk1Jamx1Uzc3K21PSEtuZzN6V0hPUFlYVGtp?=
 =?utf-8?B?cHhmNTFCWWxVV0JsYUlZSVczSHZwZXNwckFuY0tiaE9idGRWTzdLTE1IbVRk?=
 =?utf-8?B?clE4aDJHd05IVHZ2SEdFMkMzcFdVRTgxUXVMZ3kxV1RYQlNVZ2VvTGdtZ3R4?=
 =?utf-8?B?TkwwNUhFZXRjZVdGZ3k1UERGYmdodlV3ZmcrbXp3cnJtcXhyTHlwQ2ZtSmE0?=
 =?utf-8?B?dUY0NkV4WmEzeWNhVGVZOUlQRXBTTzdRL0xha2VXK2lkVElyeUdxbWdhSU1x?=
 =?utf-8?B?YUlNOG1oWjFuakNjT0F2SGIrVFJhUGdQZ2hIWER4b2YrZ255MEY2OTZLT1hm?=
 =?utf-8?B?RVBKeGFzWDZkL0s4RVhTOGhKR3gwbU5nYWZabmlWRU1WcWVPYjhlTXI4VzIz?=
 =?utf-8?B?Q3pxOS80eUdIVERNZmpUcWhNS3hjVXJsQUR6Q1lXVEpqTitkME1oTS95QStr?=
 =?utf-8?B?R29sS1lLeGpXZlIrRDlYZlFtYzdUekU2NlA1emhrTVpDNDR5RHREd0RlZ2xN?=
 =?utf-8?B?VTVXcG9DSWdMSG5WNzByYzFMS2ZRVU42d21hbE1tVDBZeG56RDNHOVlMVTV6?=
 =?utf-8?Q?NLE628SCRMJYg6PiYRIyfgGhh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b3abc2-9446-423c-352f-08dacbc90913
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 14:02:32.9496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wzfbLPY2e+GegVkJLZJ4Gt34eX1XwWbmzN+nFqJMiAwV/tbb95HEMMhcTC8De2WP7DD77Iu6mtgnAgJNHAJCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909

On 21.11.2022 11:21, Roger Pau Monne wrote:
> @@ -47,6 +49,15 @@ static bool __init processor_physically_present(acpi_handle handle)
>  		return false;
>  	}
>  
> +	if (xen_initial_domain())
> +		/*
> +		 * When running as a Xen dom0 the number of processors Linux
> +		 * sees can be different from the real number of processors on
> +		 * the system, and we still need to execute _PDC for all of
> +		 * them.
> +		 */
> +		return xen_processor_present(acpi_id);
> +
>  	type = (acpi_type == ACPI_TYPE_DEVICE) ? 1 : 0;
>  	cpuid = acpi_get_cpuid(handle, type, acpi_id);

We had to deal with this in our XenoLinux forward ports as well, but at
the time it appeared upstream I decided to make use of acpi_get_apicid()
(which meanwhile was renamed to acpi_get_phys_id()). Wouldn't than be an
option, eliminating the need for a Xen-specific new function?

Jan

