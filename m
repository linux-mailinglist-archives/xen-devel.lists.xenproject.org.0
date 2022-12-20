Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0130652389
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 16:16:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467121.726133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7eLM-0005V2-AW; Tue, 20 Dec 2022 15:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467121.726133; Tue, 20 Dec 2022 15:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7eLM-0005TE-7Z; Tue, 20 Dec 2022 15:15:48 +0000
Received: by outflank-mailman (input) for mailman id 467121;
 Tue, 20 Dec 2022 15:15:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7eLK-0005T8-II
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 15:15:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2082.outbound.protection.outlook.com [40.107.8.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c9d956a-8079-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 16:15:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7832.eurprd04.prod.outlook.com (2603:10a6:20b:2af::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 15:15:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 15:15:43 +0000
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
X-Inumbo-ID: 2c9d956a-8079-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWvVQ66fGxk+5OG/WOWfG/ZzBNBcYus+pyJe/usFo59I7jrhcggmNbzzOE9b0pPBjfS6IiIDdTgIY17+3XhiGPZMpoSX0F+61Yh1WIWttyqColjpq+IRFe/OebwO9917MYgv5Pz8wNz4vVK7uluO/qTbDemxMzTalgXG4oVKjFVslf42TUxg+JbyctYEgdaRNj0BYYNDrP5G/9Ogz5d6wOG4cO9g+Cd3+/1agJjl9OWeM2Bc8NCwLWVB6U4/bHA53y2t7JvEqGh/6AHv1rHuIFyfB2AMCYdzs+H0dqOPJSD2o/2TORKudmSeWrcHzMDx4WW3O1+dUI6XmvWEdQOKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ng7ZkDKheEp5vQSdVIDxyR9ss5uKnSuXcdpXQBfOiiU=;
 b=UggQ+240Uiaboy2T9DjWZw4fuqR+8Cvb5CIV8mBZfNgd4HELfsAUH1+1LLDSr6IDaBYU2K2xgP6iEXyoeUNZRLYP4QqcyNTLwgYaQxElAesMplgajez+CkgErP983LSrxlm910ZiJ81ywXjgtVAqXo+hRBElOltpSBc+L1HnCKxsqyxqqUJBKrwjO9B7xB1VEihbFOGxiMEYikiw2wCVrdI3CH6DMSUmEgChL2w2Itty+RDwVqh+4lnSNPuTG9abRltIlj/lcwT4lQZrcJBuNZ9DvmCO9dpCI6supUFLvECBuUThXiai0TCVMrj8eEaAYdYQtW/B9TsOr0MCeuA6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ng7ZkDKheEp5vQSdVIDxyR9ss5uKnSuXcdpXQBfOiiU=;
 b=XxRrN+JPfsYAnmOSNR0OsfX7ETdtF8VKBlcHuO6nTaf7jz6KW4ckWB20nBHe3KctB682qkSKb40TobbbTwfiD45VXlWV2tS7KNbN4IYu7NEYkN8xtoctXcwq2wqQ5UROPlISya+oxAJk83QyB0dF3ei06A7j3MGK2q6PD2t0LMV2MROrIhjj8lcLn0rrztJ/zaestPLwWcaHNUrl3uFy1LdoxfBnQfPnOR9aO51/SPlJxObgHi3Z5uq290B8FPmiZHrqJiA25tvIsdhnxiYj5SxnQ6eOL/a+caNmqbHvfnxjM4eq+B/BSHaxzcmsII9XrlovMV1ySHv0nzBLZmy+cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9870c796-3b1c-e867-fb7c-532441cc30d2@suse.com>
Date: Tue, 20 Dec 2022 16:15:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 03/22] acpi: vmap pages in acpi_os_alloc_memory
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-4-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-4-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: 9545bf1e-3882-46e1-f554-08dae29d0fef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GVHn+jdIcgK2Mb5KIoF8uVBbaQnsjzzMy2mw50ShGL3wnVUThrI9Mj5KF2R4kMPcoVham9+Isuy1MSv41AjW9TkriSMtbHTi8uR1O87Gzs4+bSHD4Iw8OInzoiaLJE/j0Qz4pl34eB5hUjfjTCJGTzhSGNrLA+7dpfNcFteVBHrohiMazYdLnCZdlVWi0XDuxxukt28cxdtf/PMJwtKBcMRunlh/PZPXfo+4fWOq4wOXaHnH6icyuAjs0WJL45Sucq/Efl2/YZfoescCDWF2TnyrUltVBXx3OYSbSo6xnYDhvMpTlIACeRptlecWIF56OFl4jT/k39wCK0Atig4eAvpgJ2/OFnJsOF5SrjOZV++9GnbviRFGjZOQs3FQuPvXeUUni+ddP/84euyHadir3yn9tV/bv6IvJsaxzkJd/GZy4OMTwZQ7TI0NlF5TrPXYPKnfEf3UgdWN+GhevBKndke9s2feZhAP5IQoh8PLcgl3Y8S9QPLtpNMNGZTjgKA6Xldqt5zsXvMEp6M7bOBxNuvix7LnhEMK+1FtOVeJRgheOFqqE5jseOXqttNg7HU130hpbASyTh9ulB692TCTgenGr4rsUOwi8HN3PI+spM3lsyj1QMdhaOc0bKsef7xYo7La2pXG4bxpmOIFm58vqtuWXMh3kQZ+ouqgPxOglvpSEHm5N1vF9ElzxkcYHihrKzWmXni4ONb1aYWYblTjAKZlbDjY5R8x6j6cnGx9epw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199015)(5660300002)(31686004)(4326008)(6916009)(8676002)(66556008)(66476007)(66946007)(54906003)(2906002)(6486002)(478600001)(186003)(6666004)(6512007)(41300700001)(26005)(53546011)(6506007)(86362001)(31696002)(2616005)(36756003)(38100700002)(316002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGR2RER3TGNaTlUwWUtQY2tiQzMrU1R6emRXSHhGY1Naa2Z6Y2xNVjkwZEZl?=
 =?utf-8?B?aEI3UXFXbXFSdHBEaWxFcTlZYVdDSzI3VGltYWNSQnNsRUk5SU41d3VXZ1ls?=
 =?utf-8?B?SDNCRms3SjFCQjdmQ1JPWSszdllqSU1HT05BOEovV0lKODFLTDVjRyt1QTBI?=
 =?utf-8?B?b1RmTTJWS05LQWdndGNMMmFLRFJmR1ptYlVMNzA5MnFKNGFDN1M5c1dRRFJB?=
 =?utf-8?B?UTdxYlI3aHBDcVpZckpiSWE3cWcweVdSTVpKZCtXRmhPcUtjck00UnpnRzV5?=
 =?utf-8?B?Ty9ZVU5MaG1kYzJ0SndhWC8zU1dNejNuRXhsUDNlc0NrNElzU3ZjRjRsdDFB?=
 =?utf-8?B?Q3VYMENEUzFoa1dEYmUzVHVRWUYzUGZKdTlGY241ckYvdXRBSjhzZ0h6UGx1?=
 =?utf-8?B?QU9VNGkrR3RLWFFGN3ZYb3FtZWRzQXhFUFQzMnpOUUJwSzZRUmRxUjlHNFZ2?=
 =?utf-8?B?Z2ZQZ0wvSWlpbWNvTldmVmZTZWEvRXVtcm9XdWlkSGdRSWNpL3NEbFVtN093?=
 =?utf-8?B?MWt2OFpsRW9qd2dYNkFGcXA1QVBnS0RWMHVlc2lNUGJteWVRTzJlL2JYSnYz?=
 =?utf-8?B?Y2tRT2JnaTErbmpoNXJkVkhnUzBzb29GWkpYd0tVNnptZ1VITVFPUytWSytl?=
 =?utf-8?B?RVcvbFdSeUtrYUNGeTdxbVg4UjVpQ3ptU2w1dURydFlhekFRNGJ1ZlJzODcy?=
 =?utf-8?B?L3k2Q0VEa1JyREltQVdwbXJZSnROQ09PeGdEeW1vb0czL0JhWVZDRVNiaEJY?=
 =?utf-8?B?bWh5VHc4ZG9xSGZocXh0Um1yTFNySmpzemRHRUtEd3lZcWpsLzBRY0xwdmIv?=
 =?utf-8?B?Wk92NkdmaVhWWTY5N3huYzdwaTN3K1R1S0lma0g4dWlla2dCT0dVT1VVeVNa?=
 =?utf-8?B?enZaT1ViREVGVklDWUY1WkV2eXlqKzJWNllNZE1yczBWbll3RHd1RFp6bXJr?=
 =?utf-8?B?WkkyVnU2YmxReWp5USt4bU1CQUdFejFqdUFrZXNKRVhJM0xnYjlmVXJIN29y?=
 =?utf-8?B?QTFIdWNvaXZPNWxFZXB2YmE2blVXRVRCQXpZWnNYc0RJcEpZang4b0kzcmtL?=
 =?utf-8?B?RFZJeUIvb05TSDRIOFN2dU1rNkJrV3cvYjZwVDdneDRZaE5qK2huRGVnb0t0?=
 =?utf-8?B?MFFaTnJPRXAzTGR0dkR3Z1FuLy9LVHNwZnJZeGRMTHNHK09DWU5nZkZsSGNP?=
 =?utf-8?B?TW9nTE04eHMzWVpLdHZxRWZiVjBBTFo4aFJtaFBpQ05DK0xjM0kwclVDV3pG?=
 =?utf-8?B?c0dzZlF5bkxsNlFhZTlIRTFTMVRlaHgxRklXdjU3ek9xRGFXbjlQZW56UC8r?=
 =?utf-8?B?NEZHcy9TZE5qTkVtWUp2VDNpMzlPVWJXNVdVOW9NWXd3ekQvRmd6STdFYUJL?=
 =?utf-8?B?MFZocVVKaHNwdVVYU05wclJacTJtL3hTTnhHWHhSajkrcEVVRk1oczRqelJC?=
 =?utf-8?B?KzN4VzUra3ZRWmpPVnJqWnZrRlVmczRJbGlrY1IvaWY3WTUwOFRXN0pjazdH?=
 =?utf-8?B?TzR1TzNZNGFXejB3ZWRmWGwrWWpNWkdORzVYNDVUSldaYXJPM0xON2ZybkFh?=
 =?utf-8?B?cVV4MCtiLzllYjhFY1A2N01wMDFLQ3dnWlhSZVgzRzVEalhlb1NKVkNzQ3VL?=
 =?utf-8?B?N0o2OGQ4cFZGaG1ETW5neHFoN0tXTHlrTmFJQUdxbXdyVmJiazRHUm1LalJG?=
 =?utf-8?B?UFVlaGhoRjlWaUlMT0lwaFovNUxReFduYmVoODhwOU5iL2x2SGlUaTI5bGtJ?=
 =?utf-8?B?QTUzencyR0Rtd2xBWjhzd0xZRHBOQU1MekFxN3Rwc2NkZFhLL09RWkx5V2pF?=
 =?utf-8?B?WCt3UFhSbWNkdXpnYU1WL0lyT2RSaXRYb2dWbE5IL1NlY2ZTU0pURU1Pc2xo?=
 =?utf-8?B?UXZEdlgwQkdCR2xqaXh4aVg3WFRXeGtCdHovZVNLZVdQcjV2d2dnWktybC9I?=
 =?utf-8?B?M2QvZ3NjQlBkaUJSbnYyUWxibkltTGJmZ3RRcUtlZERoWlJ6VnVkOTNmTzVz?=
 =?utf-8?B?NGM2SDA2YndJc0IwSWcxVnhCd2VOM1p3dVRVU0pXdVVmcWdVZHh0aysyMDY2?=
 =?utf-8?B?bEdwSGpQOTFpMklOay9WaEVoT00wNEZFNXZkRVBrakpuREhjTmFEb0JMNmUr?=
 =?utf-8?Q?D7lo7driaKxUeK9J+ej+VbkEZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9545bf1e-3882-46e1-f554-08dae29d0fef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 15:15:43.2567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08ZIpFZvSo4CSCNB0FZETM73v0XfvTz8VGkWMOXvHURppuTpug3VezG2RB6EEYYKNlqBwbCiaZFaJrS9nPYPUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7832

On 16.12.2022 12:48, Julien Grall wrote:
> --- a/xen/common/vmap.c
> +++ b/xen/common/vmap.c
> @@ -244,6 +244,11 @@ void *vmap(const mfn_t *mfn, unsigned int nr)
>      return __vmap(mfn, 1, nr, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
>  }
>  
> +void *vmap_contig_pages(mfn_t mfn, unsigned int nr_pages)

I don't think the _pages suffix buys us much here. I also think parameter
names would better be consistent with other functions here, in particular
with vmap() (i.e. s/nr_pages/nr/).

> --- a/xen/drivers/acpi/osl.c
> +++ b/xen/drivers/acpi/osl.c
> @@ -221,7 +221,11 @@ void *__init acpi_os_alloc_memory(size_t sz)
>  	void *ptr;
>  
>  	if (system_state == SYS_STATE_early_boot)
> -		return mfn_to_virt(mfn_x(alloc_boot_pages(PFN_UP(sz), 1)));
> +	{
> +		mfn_t mfn = alloc_boot_pages(PFN_UP(sz), 1);
> +
> +		return vmap_contig_pages(mfn, PFN_UP(sz));
> +	}

Multiple pages may be allocated here, yet ...

> @@ -246,5 +250,10 @@ void __init acpi_os_free_memory(void *ptr)
>  	if (is_xmalloc_memory(ptr))
>  		xfree(ptr);
>  	else if (ptr && system_state == SYS_STATE_early_boot)
> -		init_boot_pages(__pa(ptr), __pa(ptr) + PAGE_SIZE);
> +	{
> +		paddr_t addr = mfn_to_maddr(vmap_to_mfn(ptr));
> +
> +		vunmap(ptr);
> +		init_boot_pages(addr, addr + PAGE_SIZE);
> +	}

... (as before) only one page would be freed here. With the move to
vmap() it ought to be possible to do better now. (If you want to
defer this to a later patch, please at least mention the aspect in
the description.)

Jan

