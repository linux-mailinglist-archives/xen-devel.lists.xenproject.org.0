Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 573BF67CAFF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 13:38:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485024.751950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL1Vg-00064q-Vk; Thu, 26 Jan 2023 12:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485024.751950; Thu, 26 Jan 2023 12:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL1Vg-00061X-Rw; Thu, 26 Jan 2023 12:37:44 +0000
Received: by outflank-mailman (input) for mailman id 485024;
 Thu, 26 Jan 2023 12:37:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pL1Ve-00061R-PN
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 12:37:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38dd6c5e-9d76-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 13:37:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8053.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 12:37:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 12:37:38 +0000
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
X-Inumbo-ID: 38dd6c5e-9d76-11ed-a5d9-ddcf98b90cbd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KS8JjwTi2Cm019snbcTlDX+lXxVZMY27NFiFVEwhE6cIL6vdCBUMEVp8auuzNbrxehgE2cgXabnynfmxGKU26b6jX5i1e5j4pAHy2csiNNhNTZKJJ/am/UXqMk6C4FAgTkXLkwLOy2G/dmGmBBcrAtNwhHCyaNPWCSjhfNUgj4IBivF8Y3KzqjbPzHD4VIjv/wgL3eum500KBC9g5TPfP+Hl6fg0X6lbYJfMC0hMABn7jpgnZMDJU895VYps6KHl/p5PPu6xLlGWZwwhbOTI+T8C1BAU7y8aYdJs6MX+WFs0hWl77SGbdkb1PORmMQz/+xpxBy49cHGZUaLg2D3apw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D364SC4S/gkKE4hjHkfXwMrR0SoocseV35E26O+8DJI=;
 b=Em3WMlbJwe/Cl+wOaWmsr9tarfEXBRHgprT9JCusKyh7gzbx6HH7F0WkH9cDzNzHH0/ai4HRZ+1FWw6AJotUeSE8jcExKsJQNpIW6/QHPWRwZseJJKnzzulOdIySeGgb/lMq2LdGJacQPukWECgBYyjKmYA+AbUkNHLkR3sLpoSfDyqaqfs8SF0oxrOItCCTkN8V5UXmnnhAWHJULcfG+6JunC4aEUxo+pP03ZJlBAQMzIw7PDxeJMu/Fml0E49BZSAF3RvoPrE4eX/j93fRNMANFcE4DvvNIryc4Vm0bfMLV0EMWLw7qvoR8CveaGDaaSEUylkzmhfhiny6aD50Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D364SC4S/gkKE4hjHkfXwMrR0SoocseV35E26O+8DJI=;
 b=Wzcn9R4LdSN1X6jzbcv+hXEBD4KRBFcj0eQ7OUmx41X/7nk6APXPP0ijOvehVZYSFT1P3qVCKNApt9lXm6Z/jF/mYVItMpKl1BXY+ShfadUnODESu8r4hjUpgreaHmTOmuY++oJ12OOOJzReOdWqeSDam5m6LOJpy00kpY453eW5I9SnwQKIPNnzx/ft34ZaaWP7No/3wlMMgZT1oWuboJq/wbvnZTVRnYpiaxUnJtL7qR8ynZk3BVtsaHEzzOuSfJs54iAJM9/2EcBkDP8PY/xzpNMWxF/o6MvkW7LyKFnO7eKzFyZ0NV6+f/Ydy4WdxBCkH3GfgaXa+Fwe7XSUIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19d5a912-cfdd-80f2-5233-15f04cfc2b88@suse.com>
Date: Thu, 26 Jan 2023 13:37:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 07/11] xen: add cache coloring allocator for domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-8-carlo.nonato@minervasys.tech>
 <a74381ce-d204-1f40-7ccc-2be3bbc3ebd1@suse.com>
 <CAG+AhRUKWfJBf5C0uqfzePMvxN-gc2gYup+oBRBA2DXnNW-txw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAG+AhRUKWfJBf5C0uqfzePMvxN-gc2gYup+oBRBA2DXnNW-txw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 09f0ba3c-14cb-471a-09be-08daff9a1bea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jyE3kqjMbtfjHhG7SLk1fstbWn3hN/rlPuu8ZBWHnLKks/R+ksQb++/1ZK5qg2e69WH6GiY56PNBUoKpYnsiJCdklmJAqCPeULdtR5H8KRXK3SwMxoFlnPagS6j7RikTWtiNCAF+VrvxsezLeG9QuIDUW7XwJyVSUm76rmsFfxWTfLiUQsFZmZLMPpe1+iKm+WfinvT8y31uj1j69xuC3dM8Nh7Gy4FiYei1SAyRfHgCK7hSdmSK+xTQmOrfQnaGS6mPSaIOHA9Hgj/Bk9EpzeQgdbt3FgRTksI9E6FMvH9hgzqy7NgxKQ2Tl5BBlGFAGkTBV5fECKhBCA0NShe0PZsoqxWpF8b3slEcx7fbBzMc2I3Mebeu3rZ2eywS1zJmlvohaze5sxeJ03LQ6/K2ujZeI5eW3gXsPRDYXQb3NG6M1VvRultwuKqLq1cCbWaW9Ur3cWp761t2qrvvDRGWog3xvB9RqV5TdTeBW6eVKufhoGJxN4rKC7x9vxlxWfSBwSSjsy/T+GWNZPAdQzW2sIOFl5OG0SenwFJ362gD9YZnFTT31aimZ4b4izJ5iAPbJ7TtVM4Tfk8FJ6KOOaaD98VUn5OvocBi0M5o0suoVyMQNOF4eHS5qMee//YH0gULHvicVBiBrhOv+Gz8ifV2uluKUU/dPWOPryV4AEtWIFQNQlbL3WwBXGzXNImmqOscDZzqu62PIMA/oqGJB2s0O5gkE8NWY0+1yQzvL3t15yk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199018)(38100700002)(36756003)(8676002)(6486002)(478600001)(54906003)(31696002)(316002)(6916009)(66476007)(2616005)(41300700001)(4326008)(66556008)(53546011)(31686004)(6506007)(86362001)(2906002)(66946007)(186003)(83380400001)(6512007)(5660300002)(26005)(7416002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG9RSGFDeG9mejJwV29MOE5zTG9vZ01hUGNrY25wN0dwSERTZU9OZ0gva3Nm?=
 =?utf-8?B?eGg4Nm5MR0FhN0xBSjdLOUFQNGtJZUxQeWYrMjA1RzlCd2liOHJEY0pYclhk?=
 =?utf-8?B?Q2lCMDR4d3ZkT2dhbGlMQXJPTFphdjRVVStsVEUrQkp6UEhoM3dlVFR5QU1T?=
 =?utf-8?B?Qy95azVNYlI0b3hFd25WR1ZaUkowVDZZZ2hLY200NmVHa2I0SEpRVlBrcFJF?=
 =?utf-8?B?MlpEb2VmTCtDUDhmN2pqQVMvRktBclJNajdsemwyeU5DeUhrbWZ3cW5UVkhm?=
 =?utf-8?B?b3kzK0UyeWhOSjg1TEljc3pCb1d3c2pKN0dLYU1kVEVadWJtZ3Q5STUwS3p3?=
 =?utf-8?B?S25hWXd2bDAzbHpGK3Z1YWxrVkFtREJTSzU5MkQ2QUZuVS9oTldnYnY4d3N3?=
 =?utf-8?B?cmpOTURZN0dEd1laWms4SmZFMmx4MXcxSWNpd0tJY1lWNDBmaEcxeHJzTUFR?=
 =?utf-8?B?ZmNpVXgwbk4wYTNKcEVCTG5wTmNuNW1vMkpTZWdQM05tZytkU241dVBIdEdF?=
 =?utf-8?B?a2FtR3I5azd4TjJpUnBES3phZjNsRGNFSXpXRjU3eDREckZJMGxlSHRCN01S?=
 =?utf-8?B?NVYzaDJtWmhrekhvdjVFeXhLbWZ2T0FMdzNLMVhXT0pkTGdrMUpGdkNYZUF4?=
 =?utf-8?B?ZHJtZG16WmQ1UkhzK1BtZnZKQUVzYm9tcmM5QnFDdC9Ra0NIRGNhdkJLbnpZ?=
 =?utf-8?B?TEJQZjRTZ2FMalFPS2lEQXN1ZVM2TkQ0Q2llaHo0OVl0NG1EWU1nMjFrZ3Y0?=
 =?utf-8?B?MVdRaENHOUhrV1ZFN29BdFZSV2dOdDlWbThZcmtBN0pSM2ZONUE0Z2IxR2Fh?=
 =?utf-8?B?d3JOcVYxRHMvc3dwRGtraHVHNnJ0dWE2Mk1jeFQ5L0FLblpGY2lvQjJFNXFF?=
 =?utf-8?B?dWhER3YzUFRyOE8zTWM4Ynk5K0NDQVNFL2JrL2ZIMFNxaGozQ2pNa0lTZFFQ?=
 =?utf-8?B?MmkrRW15WTFtR09Xdkd3UWNEbU8vMzRZTnJvMk9XN2hwVkF5cUJ4cURCYVUx?=
 =?utf-8?B?VFE3K3lzWmc4dmNOeTUvc2phRFNROW8rNDNVNXV0VFZWTzZ1N1lmT2daZUNF?=
 =?utf-8?B?cysyQXBZLzg2djBVajFqcGhPT0o2YkNuOFlUNUtOaHNHYngvc0dvNU43dThw?=
 =?utf-8?B?RVBlRi9IQzRCL1pENnhiaGRhTDM3TXcrUk9pZGZxZU90ZVc2by9LTXB4M0tk?=
 =?utf-8?B?bUlzRnlnSWNIbWpqNjNJRVZOTll2aFBKN2NERXc5MFBwQUNDQ2NWQmZkRWs3?=
 =?utf-8?B?VlpMb3FLSmpQQnpnRkt2ZzU4dmdnbSs4Qk9nVXVoM3ZaaWpnTXRmV1psQ1Ra?=
 =?utf-8?B?U1hoZnVBNmhVZ1VqOTMydzhSTWhoUjRibDIxai9nK0RJampHSXhKczB0MlJu?=
 =?utf-8?B?Z0RWSldLa2VEdUJ1WFJ1aE8xRXVaRUV1VERrVy9TZ09tdExiK0w3ZWluSElo?=
 =?utf-8?B?ZG5sY2lsWVZLTllVOWRyUmtLODZMSldNU3JFclZrdmNIRkMyT3RCZHZQbko3?=
 =?utf-8?B?TTVyR3V2QUR0WVlZTmFselVuTW55OWR3bzluenUxYXMwSHM5bEJHT1JVWFpS?=
 =?utf-8?B?ZjZtQkc4M0FhT2lLVnJiemZQUkE3b3BvbXpUL090dXBzSmg4YUQ1b2RxL2JE?=
 =?utf-8?B?OUdST3Zab3dPUm5jN3JsWFZ1WE91bGJRcWJyb2FLTVIwejhnT3ZEb1padWQ0?=
 =?utf-8?B?R1ljY3U1dXdBVGFka0tNYVFpalVDSnpNbnovaFJQaWs1S2tGVEpBUEpjWWJ6?=
 =?utf-8?B?NnNZS2xIS25FOW1laVl3SlF5Y0VtSlJNS242eHlHTHowTzdrb1pjMitkWmxZ?=
 =?utf-8?B?QzZiZWk0dk9RQlVnU0hRaG9kajZZbmpzcWZ5cGQyVGl4NGFoNEFCZ0VVL3A2?=
 =?utf-8?B?ZGZEOUVBR1pPZkxjcEFiSys5Y3lhRzhWQkp4VEJkRjdUZWNEN2N6bmkyRXdV?=
 =?utf-8?B?NXRVTHk2Y1lmY2U1NG5pWFlMQktJeHdlcW5hbG9yNTBrZTMwbkRHTVQwZHhM?=
 =?utf-8?B?ZVBGdmIyNXovVGJvK0lBNDI3NE5INStwc0gxZDdpT05JQ3g4clpHMWRIZjJJ?=
 =?utf-8?B?clA4eGNtdmpHU0ZmUDJDVUVpRlVVRXZYMUg0cXZvZmZwZWw5Zk83b3FDMUNW?=
 =?utf-8?Q?0Ma4JK20Ldt9N5UvjUe9Ne74z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f0ba3c-14cb-471a-09be-08daff9a1bea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 12:37:38.5809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CuCTrSrq/FTlzAbTumJAlMFzOdap78ynIpOW2/u/jZO8bU86pRd9YBlPWq8eXdmCkCe67eQRMbpUq45OMonf+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8053

On 26.01.2023 12:00, Carlo Nonato wrote:
> On Tue, Jan 24, 2023 at 5:50 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.01.2023 16:47, Carlo Nonato wrote:
>>> From: Luca Miccio <lucmiccio@gmail.com>
>>>
>>> This commit adds a new memory page allocator that implements the cache
>>> coloring mechanism. The allocation algorithm follows the given domain color
>>> configuration and maximizes contiguity in the page selection of multiple
>>> subsequent requests.
>>>
>>> Pages are stored in a color-indexed array of lists, each one sorted by
>>> machine address, that is referred to as "colored heap". Those lists are
>>> filled by a simple init function which computes the color of each page.
>>> When a domain requests a page, the allocator takes one from those lists
>>> whose colors equals the domain configuration. It chooses the page with the
>>> lowest machine address such that contiguous pages are sequentially
>>> allocated if this is made possible by a color assignment which includes
>>> adjacent colors.
>>
>> What use is this with ...
>>
>>> The allocator can handle only requests with order equal to 0 since the
>>> single color granularity is represented in memory by one page.
>>
>> ... this restriction? Plus aiui there's no guarantee of contiguous pages
>> coming back in any event (because things depend on what may have been
>> allocated / freed earlier on), so why even give the impression of there
>> being a way to obtain contiguous pages?
> 
> I really need us to be on the same "page" (no pun intended) here cause we
> discussed the subject multiple times and I'm probably missing important
> details.
> 
> First, is physical memory contiguity important? I'm assuming this is good
> because then some hardware optimization can occur when accessing memory.
> I'm taking it for granted because it's what the original author of the series
> thought, but I don't have an objective view of this.

I'd need to have a reference to a concrete description of such hardware
behavior to believe it. On x86 I certainly know of an "adjacent cacheline
prefetch" optimization in hardware, but that won't cross page boundaries
afair.

Contiguous memory can be advantageous for I/O (allowing bigger chunks in
individual requests or s/g list elements), and it is certainly a prereq
to using large page mappings (which earlier on you already said isn't of
interest in your use case).

> Then, let's state what contiguity means with coloring:
> *if* there are contiguous free pages and *if* subsequent requests are made
> and *if* the coloring configuration allows it, the allocator guarantees
> contiguity because it serves pages *in order*.

I don't think it can, simply because ...

> From the fragmentation perspective (first prerequisite), this is somewhat
> similar to the buddy case where only if contiguous pages are freed they can
> be allocated after. So order of operation is always important for
> fragmentation in dynamic allocation. The main difference is speed
> (I'm not comparing them on this aspect).
> 
> The second prerequisite requires that users of the allocator have exclusive
> access to it until the request is carried out. If interleaved requests happen,
> contiguity is practically impossible. How often does this happen? I view
> allocation as something that happens mainly at domain creation time, one
> domain at a time which results in a lot of subsequent requests, and then
> contiguity (if other prerequisites hold) isn't an impression.

... the "exclusive access" here is a fiction: Domain memory is populated
by the tool stack. Such tool stack allocations (even if properly serialized
in the control domain) will necessarily compete with anything done
internally in the hypervisor. Specifically the hypervisor may, at any time,
allocate a page (perhaps just for transient use), and then free that page
again, or free another one which was allocated before the tool stack
started populating domain memory.

Jan

