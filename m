Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0006E6979D2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 11:27:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495835.766264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSF0Z-0003gZ-Qf; Wed, 15 Feb 2023 10:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495835.766264; Wed, 15 Feb 2023 10:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSF0Z-0003er-Nu; Wed, 15 Feb 2023 10:27:27 +0000
Received: by outflank-mailman (input) for mailman id 495835;
 Wed, 15 Feb 2023 10:27:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSF0Y-0003el-R5
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 10:27:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56710fa3-ad1b-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 11:27:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8237.eurprd04.prod.outlook.com (2603:10a6:102:1cc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 10:27:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 10:27:22 +0000
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
X-Inumbo-ID: 56710fa3-ad1b-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8gR5uycbg06iBdVCrWEUcU/YmnU0nlEfOtqzd4yrjXuJvLiNhjlwleRRI51vmNZFOlzCskTsV14lhTUfgBZmpWqxhILjZiHPM8975NiFA0MLhrPaksYazeGovQ5RmmFA+q9kbBqD10oPaNsh6hh4TQNFybdQjV5Rh5XSrazL59+kBgj27V/5q3opcCeR4EDUeBDL5vKJ6T4+/xh8Cd2L2tCXXdfUYbuXprqce/vd22TwBv3ZJ/H/4XnG0ldF9VyS5iIKoRX2eXTxWSnwDuCJ3u42gcKfXUbKcTBFskb8Oy7oqJanSFo3V5NP1gEQkLrBAgDUeQXbep2Rt2QlEPnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SERSB7BNRhjB/1xGr5c4n0jNpMuSxfs9lzAEyQg8tEk=;
 b=aSdudF8wNA3nEqH1p6ka9Bgrx1LXh1w4SFKsYPxj6Gj4hvGS8vyvRkA5qy+CduNKLVxnJg1G75cuCvWIoDdpRN26wCpPmpn0ix5o0Fns/gzcqQHSXAn8Z1p1HRLZtJY+qt7VVcG3sUX1hF+GDSEix7fewSTZDf5OFqLmU29lzqIRj9DS7qemLr1EDvoLDVP8wZ90y8+pPtnb9K2WFY5jah+r79dIHP0lVI1DP1liXgg7ePQZCoBmPpSpScGXy6OnjP3qoq5d7/qxnEZ6q1tlU66uwlAdKDifBVhuWeizGmf0sNCdzWkDOpn2OTNnTP/ySg29uSBOWC030Ssp/lHAHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SERSB7BNRhjB/1xGr5c4n0jNpMuSxfs9lzAEyQg8tEk=;
 b=RzPo014JyGmrnbhNp7AwGkalAB9CnckFfq5lqqukLCtt2hEnSUgxJUSyXrnJT5QVsiUerg8MQsjtqeLAftiA7/17SM6rKkfDhrRWC5aLdKkpkymDK/tqZZpYnfRNY7IWlI1fv6CpPS1r+BtGcO+W/EsIQGiBqvKs6pcmwHi2qw3KrvHf2kSphPV47X69HV6yo/SgNyZ2d0oZ1MskVka/Oq58FshK3QmXOanW4WVJvYHv1/VqnKhI0ZNbgpiM9jNV1qpKtTZWW6hO4mQtyHTMRzdT0olQxWQZ77+oaoRk2Yd/vKzi+WD7TbL258Aakh8Ayp5ldSjhEkRaREU9iSo/KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9e26bfe-3b17-bc35-9d93-ac291ab6b710@suse.com>
Date: Wed, 15 Feb 2023 11:27:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/2] x86: Perform mem_sharing teardown before paging
 teardown
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <3af8dbf3134b48f6bbc8f917e5fecaf8daee1c3d.1676351034.git.tamas@tklengyel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3af8dbf3134b48f6bbc8f917e5fecaf8daee1c3d.1676351034.git.tamas@tklengyel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b146e12-eb69-453a-6e59-08db0f3f3935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J6ySn4wCocenkMgXbQQqBdB+QvdAAWUbaFM8/QI1HQ/anRSmGJQOyvP/eJ6J7M1mNxG77hrRMyErwTt32qhGmQ8BdV7xcYqTyjzJyIjOd1Fb9LOeauK7Yb59EbeAjtixQVoxUyOPn7S0PJPkKUc+/19u8yhIexZOqrySpLM5HINkGhLpc+0LQY5BYeQOdPFk6S/ckzp4f1ju12o5kL/fm+cezbiqhYv6YxIt4IuL/UHjlPCI2KqroLf9CIa0YrYDOZLTeWxfVSqxQgBXMVnr+a7DDGGSFuc5PIKoSCfbPzINGvoFEvMI8ZRRYDllmtIDuzDWbbfawJGKYw7QbwJSmDplH8ksqT3PTqnuqHm1mk/7DZIFQ34975PW/2Uyg5LSdo6D+97xijzk1KvY3+N9frHqWGnkgsqB+Hr+Egdr+B6+aO8APPg9x/k58+9Hu9FiJllOe5BOAcjPsYIvHhmWBjMG8vbH7Wb84YhDwZXYC1EvjbmAZRdU2c6qX1r31kUbGmqd6vSKETfAaZmh81A+P4yOCOit0NWgRYXdHDZNOAMmTdogdgQX+DptQtP/ZqXybi1b+3HNE5XDmdLGFyQf7kDJdw1IiFTtnD+83ouGnMCd5MRkbI4n90Ny7jTK9zxX+A+5CQn3MmrPAgS5fRWmwjZ3seqnSoG9XpmaupQQtdIpgnRJesxF4kmlxa6+we+7tWawspotJgqW9SImoLNlsjI1RWCwWbmMhWbYdpAtiSo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199018)(31686004)(83380400001)(6512007)(36756003)(2906002)(186003)(26005)(6506007)(478600001)(53546011)(31696002)(8936002)(6666004)(5660300002)(86362001)(41300700001)(6486002)(38100700002)(66946007)(2616005)(66476007)(66556008)(4326008)(54906003)(6916009)(316002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjQ0STJ1WkhXVm5pNUk5dGRwMlM3TmpVczVldHhCdkFmcG4yaUU5RDJSMnor?=
 =?utf-8?B?RXdkRVNmMUFIamlGOTJZd0FURzl0KzJkcVJxZ3hBSjh4V0lTazNhbVNuSmg4?=
 =?utf-8?B?aHFKRUw3TG5qdWdIMWc4d3dYWHBzbEZkZE5ua0x3TVoxZFNwbEt1cnNzRFl3?=
 =?utf-8?B?ZE05YmtSTUdvYy9HL0Y1QTFhUVlaaVZ4dGl4WG01ZzR3QWdrTXRxN09aYjlL?=
 =?utf-8?B?c2hMQ3pUNStDYkN5V3hpa2FaUG9XWElRVXZIcWdVclhSUFJIeEVhclFaNjRa?=
 =?utf-8?B?VXlzdm9keldjeEFUMXZzYmZ5b25lajRxLyt5Z1FJZDZCWUprdGZJWmo0Mkhn?=
 =?utf-8?B?bnUzbnZIY01OTUR3SDZ6LzZZRURGOGN0WmtIUnM3WkI2MzBCRGthajBIL3Qw?=
 =?utf-8?B?SkdSdGN5YUZzcVJzZVVqUEJJVmdrTEtGRUdMWWprVzlrR3JKRkdHK2pRdHl1?=
 =?utf-8?B?UklwL2l1akFoYldFQ0dhVjREbTFLYWJLL2ZKWi81b2tGTWRSVGtTSlErRHpO?=
 =?utf-8?B?TkFpcnZpUjNLODdpRDNFUDVUMzM2SmliTEhtdHlaaEl5YnV3MWUxRm9mYzNu?=
 =?utf-8?B?N0NCSlp1N0d1cCtGTFgvZm94VDZZRVRGWEZnSjY1OS9kMnNrZEpUNHRFREJn?=
 =?utf-8?B?cmlUY0FFSGxHanBvelQ1aGpZaHpoSkNaUk5Qd1dvVkcxYW5EcWMzNG5GNkU0?=
 =?utf-8?B?WE1BOTRMVUUvaldpVFVsSVVRUGovYXRteWVCRzlVK0JGUi8ydTlqZ2xoTFVu?=
 =?utf-8?B?R1F5aEQ5QXNkQXkyNkRXc2ZRTjhVL2ZkMXkwdzRuVjNkTDI4cFhkVDVvNzQ4?=
 =?utf-8?B?Y3BtV29kZG5xb1VMeDdNR04rU3AwQVc2c3ZoL1RrWm1HbzIyblB2QXgxdU5M?=
 =?utf-8?B?RExhdW9VaTVJNEIwOTFMcnRuNGRrRFovcjNnbW44dktOeFpBWFUzVDRXSWw5?=
 =?utf-8?B?L01Ld2xaOEhVbDBUVGxuZFNqS2hGeXhpam1zcndBV29zcStSa2wwMXZYaWlv?=
 =?utf-8?B?QjFsNnRZY1I4RHJXaDJYdVdzSG9aK0Q1VzB3TFRlR0xzZkV3Slk0OHBocytP?=
 =?utf-8?B?T2tKTXczbGNnK1laUWE0LzdxUDVrL1JWWWY5VzdXWHhuRkZ6SmRoWnhwUTF3?=
 =?utf-8?B?MG5LNlNjWm1hWTBTZUYvTERkaEVmT1R2c0lIWFBham9XTDVPQm9jOEdPNDdz?=
 =?utf-8?B?bkNOSGk3S0s4RHBCenJYWThZdis4MWcrMFNDS2RPQ3Z2SnVQTG9CVTRMNU9P?=
 =?utf-8?B?Ky9FYjAzSEhiRTdCa1FhU0llc29XRTVJU0tEMjJDWm1BKyt3QkYwQzIyVktM?=
 =?utf-8?B?dUIwWHBKTVlndE5jd1c5RG1BSW44aFhrZytFNklTblhnVERQVk44RXRoZWlS?=
 =?utf-8?B?S0N3RnZmMFg4QmcrYU5VMUphMS9YYWZKSU90dm16UXpQTDEzcHNuMmhmMlk4?=
 =?utf-8?B?QmN2clhSTE5ZTlgvdUxpbW0wUngzZURoVXk0L0tUMUE0dnEwSndMbFBJR1FS?=
 =?utf-8?B?NzFNQVkzSzl6UjZiellQUkNHWUdVVHgvZjY2cnBhN0VoUnFmdVp4TDJIeEU1?=
 =?utf-8?B?cE5NUnhqelkvcDFLSmRIcmtXdFFqNWRONmdJNWprWEFXelJqZ0hLUndnZ3Vi?=
 =?utf-8?B?ZjIzZmc0ZWRMcDJFZStmRzBWNmVkb1VRNDQ3Qzl4encxWXFHcVlYWUY3VUlr?=
 =?utf-8?B?N050RlFTUEsraUptS3l3c09zMkl1U29BVDZSYUVTK2Y3eldEUmk5Q3h0NStr?=
 =?utf-8?B?aDVPUVhmWCtreGFjWFVTb3Urbm01Z0twVXBIa2dBY2w1WFc1VzVDeHlhQWdC?=
 =?utf-8?B?Nm9EWGd1TVBrWFFWQ2NVd2Jtc3psN21aWlZ6Rnl6Q0RXbUx2cy9aTlQvNWg4?=
 =?utf-8?B?c1M3QWM2bzBObmFtWXNiOHA3UU1qQnBWOCsyai9jc1l6TDRQNFlSMTdXZjRD?=
 =?utf-8?B?SUhJUVE3S0R1NzZTK0RtTHYwRDBRbTJYVlczU3BqYUptd0ZEeDR6WGhzaDNs?=
 =?utf-8?B?bXRwNk1udDQ0WXBBcENsZ05iVFJyeTl6NXU4d1B0ZzRlSjVhalFvdndsMkxF?=
 =?utf-8?B?b29iQWRMQzlPWXBRemhQdVZNVWR5cnRScFR3VWRWK04xRDdYOCt0TTFIOGR5?=
 =?utf-8?Q?wpr05rWYoW7+KNMOnNuqEQ4vv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b146e12-eb69-453a-6e59-08db0f3f3935
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 10:27:22.2091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePCyLHgt+SbNHjcmUhfyZ/IDChpkv3VEELE7rS4c/+JeT9q710kQc3W+lI+E54JBZzqbx/WFrUb/MBfUBTg00g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8237

On 14.02.2023 06:07, Tamas K Lengyel wrote:
> An assert failure has been observed at p2m-basic.c:173 when performing vm

Please can you at least also name the function here? The line number is
going to change, and when coming back to this change later, it'll be
more troublesome to figure out which precise assertion was meant. Yes,
...

> forking and then destroying the forked VM. The assert checks whether the
> domain's shared pages counter is 0.

... you verbally describe it here, but still.

> According to the patch that originally
> added the assert (7bedbbb5c31) the p2m_teardown should only happen after
> mem_sharing already relinquished all shared pages.
> 
> In this patch we flip the order in which relinquish ops are called to avoid
> tripping the assert.
> 
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> ---
> Note: it is unclear why this assert hasn't tripped in the past. It hasn't
> been observed with 4.17-rc1 but it is in RELEASE-4.17.0

That's almost certainly a result of e7aa55c0aab3 ("x86/p2m: free the paging
memory pool preemptively"), which added calls to p2m_teardown() to
hap_teardown(). If you agree, this wants recording in a Fixes: tag, as
- being an XSA fix - that change has been backported to everywhere, and
hence the issue now also exists everywhere.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2310,6 +2310,32 @@ int domain_relinquish_resources(struct domain *d)
>          if ( ret )
>              return ret;
>  
> +#ifdef CONFIG_MEM_SHARING
> +    PROGRESS(shared):

If we go with the re-ordering as you suggest, then please also move the
enumerator near the top of the switch() body.

Did you consider the alternative of adjusting the ASSERT() in question
instead? It could reasonably become

#ifdef CONFIG_MEM_SHARING
    ASSERT(!p2m_is_hostp2m(p2m) || !remove_root || !atomic_read(&d->shr_pages));
#endif

now, I think. That would be less intrusive a change (helpful for
backporting), but there may be other (so far unnamed) benefits of pulling
ahead the shared memory teardown.

> +        if ( is_hvm_domain(d) )
> +        {
> +            /* If the domain has shared pages, relinquish them allowing
> +             * for preemption. */

Similarly, if the code is to be moved, please correct style here at this
occasion.

> +            ret = relinquish_shared_pages(d);
> +            if ( ret )
> +                return ret;

While I can easily agree with the movement ahead of this being okay, ...

> +            /*
> +             * If the domain is forked, decrement the parent's pause count
> +             * and release the domain.
> +             */
> +            if ( mem_sharing_is_fork(d) )
> +            {
> +                struct domain *parent = d->parent;
> +
> +                d->parent = NULL;
> +                domain_unpause(parent);
> +                put_domain(parent);
> +            }

... I can only trust you on being sure that moving ahead of this is
okay, too.

Jan

