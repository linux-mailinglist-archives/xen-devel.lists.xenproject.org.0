Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201CB5ED70B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 10:03:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413159.656686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odS0c-0001WL-3A; Wed, 28 Sep 2022 08:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413159.656686; Wed, 28 Sep 2022 08:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odS0c-0001To-0B; Wed, 28 Sep 2022 08:01:34 +0000
Received: by outflank-mailman (input) for mailman id 413159;
 Wed, 28 Sep 2022 08:01:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odS0a-0001Ti-BY
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 08:01:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60040.outbound.protection.outlook.com [40.107.6.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2e3687f-3f03-11ed-9648-05401a9f4f97;
 Wed, 28 Sep 2022 10:01:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6999.eurprd04.prod.outlook.com (2603:10a6:20b:de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 08:01:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 08:01:28 +0000
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
X-Inumbo-ID: c2e3687f-3f03-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0GEpvtgePt7+khs1D1IcmJB8+29dPegO+2B5Wq/+Ed0CMfSZprL37OpJMs59KHA3mgMfvZbd4GAt/bFJieL1LmRdGibR4vkT7C1YoFmpSefgJv7PXABVLdkpNY7bOGZ9AQdiqIxRwKCf1rwPrXCGW8uzxsAaVuE4ubNLnTyeflt4VjXD7Zir8PrySJLfqYdawdWi626538izSm+hZkTu7JOzV5NjrEWTwpjCERlcJvX4VRq825ZG1m/e01qt2ufGQgVSWMcUCnZx5Xl8TPGcZe4YcT+ChGQeySqpmvByhdZrXIWZZcrCNAusPYTY2McvtAnTZk+ICGwxW6SUvvoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omiiGGBA9Y0nyz+SvNAtNjvZxtSrppAg41tJmWHsaGQ=;
 b=GngGiJ4BbiukZFAigSBiO9koGYGIfAlWO+gHE6OUAhemaUhDLF3j/vLAW+3RaciFBteow7ai1CjVfSIuAaKJiQj/80S6KMVD9ygBB5ir4ySnpiX5TpA828sAqCQ3dGtzSNXc/TWJDpT8r1cyCedptOPLwPM9G8xzEVm8y8iAEqS1aRIlVntFmbBhPH7IsbyA7Ep5dmw6l0WjNzpxnsDpCB0BIBXVEynDprxs6ixxJrNKSdij6Mj8Cp6RyTs1P1LnR7UNwDeHkycVZmqHFPMmIfUrjvO6OJ2dke6vz9NI7E+Pl3fONUHr7RoGs5WbW27lSexApec5oazjW8fadBpwtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omiiGGBA9Y0nyz+SvNAtNjvZxtSrppAg41tJmWHsaGQ=;
 b=QsJtD3var2tfBLAXRDc/hM9rL31Z5iBmKBNQVoeyvEevXiqgQ25/vkFuDk3AP/wt+ZHOPMam7y+IpSnxbwo6fRVwUzjHR0n6RaGZrR+WfzlmQ+Y2ToApM5aAHgFwKzUCF7NbgNcOMFlWiBPB3XWrU2lCBrHv5Zhwsu4sYF7ps+m82dm1UJ7nVyQotMN0w+N1ybchI28ZFHGxHnqdVT25/GrIVkS5m5aep/ZAYgfi/+qjEIcmV5h0B4Qu9aa9Qf5TI1wOWIAIH+3Q+e2BQ3p5zTdLr05cqPsDOCNUQt0pEj5QF1f2ZrB3LcBnMyxz/RDaIwt4lz9PA6TKOjI6ruza0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ff79be48-8146-0b33-bdb9-ad9f33083559@suse.com>
Date: Wed, 28 Sep 2022 10:01:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] x86/ept: limit calls to memory_type_changed()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20220927153937.39389-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220927153937.39389-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a96860-6978-4c0b-7efe-08daa127a5af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8AKNAvwfdVJ97VObtNqUfrqBiiSM4tl3A8TVnkJQ0CWUFvsJlPGucNQ6h45jhbKgqsQEeM4ZiBEZNz2S3z9CNilBC2pwIGpGokHmDtymOvHPPCQs+c3o3spNmpfMpoIavmNQ69EZ7zBuZFgBHAvvBo0Nkc7FgdqaL8MrDhzWu2wjpko32IXQ0d07QF+PrPo7U07+pL7mPsR0yRx0syaJ1nUneE5/s3U9Si++o18HRwhLH5gaImw54TczHK8gAk4MQsCUuUG3lQJrofEMSq5Nh1r0SKKuG7TqN+/Nzpj30Eo2kue1up03Ex8L8bEE6YOmIEleY78Lhd1WnNNpfMc4KJfcYnk1/IPWEmgNqTBo77NcmNFUvKYU3tGYtGDppV/XikwbQHbJAWm4BwD3y/vA9PZgKPQNcylkRTZs+rHR44o+3mlbUwEh0OevrJbcu3jAqjIOwdZ9LOekphoneOL20qFYW726HMQajE1NFYueLJNjxlKrvLGi4flax22vBWc10JYViOzDVfBcW9qPpGtjEvFHOlaqr4uMeyRmGBEOndYX+ktYz2V4gT9eDWIhuRGb9/W0sYuRgUhg/+mWmwI1Az+0Ahr2Gr80wLBPpXJnAmwOKc9BI54Iibt70BWx6fBz0b+0FX0IB+5bWilLN/wn7msl3n4Mh7uRPaki8aGv3BLmlZEYK5jpBYud7EljcuQlEIBj4ZLy17pQ+09IauF20ORQwayX3X4RJiffoehkn8CLZ5ZM8kmIhZm4A9l8u6raSvw7uQq08hhLcHx7XFRKGC92uvjL+MRX4udVz/CtC5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199015)(36756003)(54906003)(6916009)(316002)(31696002)(86362001)(7416002)(31686004)(83380400001)(38100700002)(186003)(2616005)(53546011)(26005)(6512007)(478600001)(6486002)(8676002)(6506007)(66476007)(4326008)(66946007)(66556008)(2906002)(41300700001)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlRwMm0xWVlxc0tINitjeU5xZnVrdUgrTlNubGYwQlJwVlN0TmN1VWxQZXdN?=
 =?utf-8?B?WGpPT2Q5VkE0aG9zazZxNWFCR3dURGtjbE12ZTBmajYxN0pOaWFQdEdzb1VH?=
 =?utf-8?B?aTlBMTJqVm1GVHJYNVBybVZpOVZla0N6WVVOT1oxaXVqU1FhZjU5akljdlVV?=
 =?utf-8?B?cFE1VEhLNkZieVc1L2VBMTBiOFNHNVN3M3FINW45dnc5bml0SCtKcjZ6SldX?=
 =?utf-8?B?UXh3QXJsZWtTRmoweVJ6cWlxczVpWE9JWiswY05wTThRRjhhcHVXcTYvUVpm?=
 =?utf-8?B?bkFndWhGZzhPTHRrMEFrcHl2U1JXVHhBWW1LaHZZMWpvd0ZsTUhFYkJ6Vk82?=
 =?utf-8?B?bVpRTkZMZ2VENDJQM1hxVmVzYmVQMlVnTjFIbXp4bDEwY3o3OG13eUxEZzkr?=
 =?utf-8?B?TVdoNlIvU0o0UDhBWVZxdy9MckozUDBRSTNEcnZnQ1VEbWE1TUlPQjhFMDVy?=
 =?utf-8?B?MWp1cGJnWFdpb2o1SXQyTlRuUnkvejVxaFo2clBNT3REOUFsRUVPZ2dTREJB?=
 =?utf-8?B?dzZrYmMxQVllQTVzUG9XSy9yb3JJRThFTGxzS1oydi85eDhMb1k3K1hEN1Y4?=
 =?utf-8?B?ejZyVlBCbm5FNldyQy9DRkZublNZVnFyd1JsL0I2MzNGZkRsK29mQWxXUUdG?=
 =?utf-8?B?UHRiRXFiOVBGYVc4M1c4WHBNQldzVmZwcXVaU2tFZEQ0cUhWbmhQb3AwK3Ux?=
 =?utf-8?B?bllDTDRXblZpK1gvYmxJd0szbnNJb3M2eVFQdzBtTC9EdGFpejhsSG9KNXpr?=
 =?utf-8?B?eHYrWHBvZW4xcWUyWjI2VDhZUXJvVXFaTkorMEVYTVBwd05zOG1qTGZIeVV6?=
 =?utf-8?B?T0FLc3RFTDlSTWJOalpOdHFoQ1RJWlRlempUZGN5MjNWSlQ5QmkrNnA4RTIv?=
 =?utf-8?B?SFhYQ3RoSEhzS2JnWTNPSG5lMnVGWG4wSDIyaFRFcFNNTnVRMWY2aW1pdWQr?=
 =?utf-8?B?T01VMnR1MkJoY3M1aldoQUtEYUExd0I4MUx2N1V4aFVPZ2NMVUFXNkN3cHBR?=
 =?utf-8?B?MG9ZQmx3cVhQdmtGOHZjSWJWd3Q3Z1F1cElKak0vQi9KbkdEQ3hrTTZ3anV2?=
 =?utf-8?B?RDJVbHdoVDJ4N1BJSUhtRGF0VWhTV1VZZi80VERnZXhOVlJ0UktJUEdLQzRN?=
 =?utf-8?B?WUExVS9ocS9RNG42bWg1eXJuSU1NbnM1UXJwMjhhWVhOanlBNlRHZG5sWFk3?=
 =?utf-8?B?SjhjS2d3ejFEQll6Y0VGaHFYTC9KOWk2dmtlZFJLTEl3azlvc1BrSU02SjVo?=
 =?utf-8?B?TDFHN0cwWWFNLzZPWlgwZEJGN21yN0JmanRuaEYxWWNsc1dLeU9aN2ZCVEtD?=
 =?utf-8?B?WFdlanFRZ09HSkVPdkQ5T3Y5dUMxZ201MnZ6amxjUnQzNE8wZnlaWm5NUTE3?=
 =?utf-8?B?amdLekZ6eklxWndXbUZmQS9yektBZHVtNjNuUEd3aVNiclJ0MGVFMHV0QUYr?=
 =?utf-8?B?N2sxNjAzcFBtaHdpQ1VYRXh5cmUyZUxBRW5lRTkyMlJBYlNkdWx1bGh6eGR6?=
 =?utf-8?B?K1VtYzNzaUxuTDEvYkxiL3JWSVdJVjhheXBoS2xPTlE1MUZib3daREZ0OG5o?=
 =?utf-8?B?MGU3TTBlRzdJa3NEcTRLR29IT3UyV0c5YnRCQ2VkT3pyUHRvcU94RnQwSXF5?=
 =?utf-8?B?ZEJLUnlUV0VBVzNpNFNOeFFLbnF5bG9sR1dVVUhGZHROOWJRMU9meXBVa2hU?=
 =?utf-8?B?Vms0QlFtMG10THRkZUtTNzhEM013Z0FnU2JHbVRzeEJ4eXhPWDVRQ1pEMC9R?=
 =?utf-8?B?OFhNUEI5Tk5ZRkhRTThGM0VRc25qa2hERlJpQUFlUEVEM0c0NDQ4d3BGREo3?=
 =?utf-8?B?THk2c0VFZlRSZU5YQXpKVWlHTVZ6NVBtR0lsTEgwdFFFVStUMDB4b0RKbXNr?=
 =?utf-8?B?aWVETm42WFBYdUwvb05kYnBiVUZCQ1ZKM3hmWnJGK2EzVG9kNnlMNGVidmV1?=
 =?utf-8?B?aEhMUGpMbERLYnU2Qm5sYjdMNDBCR1FQdHN5ZzRkSHBLUG9nRFFkUkNTdVpp?=
 =?utf-8?B?VjJNQlR4dVZXTE1JKzdaNzhsdDRtNk1jUnAreUJCbEVXSUM3T2g2SVl1Ukth?=
 =?utf-8?B?K0V5UDIrQmsydDNvN3A4Z3dWa1pOZjE3N09pdDBUM1kzaFVxMnZPWk5VQU5y?=
 =?utf-8?Q?IAe3FjuWKR4XYUD9BDADEQDbF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a96860-6978-4c0b-7efe-08daa127a5af
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 08:01:28.3134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8GAc+Mx1t4xBbBLqBjdooFWextzPqRXKWudR0wkkwsIH6m8Z+hvalFLS/w1wEPtoaFYXk9vlGFH8s/fc/fBOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6999

On 27.09.2022 17:39, Roger Pau Monne wrote:
> memory_type_changed() is currently only implemented for Intel EPT, and
> results in the invalidation of EMT attributes on all the entries in
> the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
> when the guest tries to access any gfns for the first time, which
> results in the recalculation of the EMT for the accessed page.  The
> vmexit and the recalculations are expensive, and as such should be
> avoided when possible.
> 
> Remove the call to memory_type_changed() from
> XEN_DOMCTL_memory_mapping: there are no modifications of the
> iomem_caps ranges anymore that could alter the return of
> cache_flush_permitted() from that domctl.
> 
> Encapsulate calls to memory_type_changed() resulting from changes to
> the domain iomem_caps or ioport_caps ranges in the helpers themselves
> (io{ports,mem}_{permit,deny}_access()), and add a note in
> epte_get_entry_emt() to remind that changes to the logic there likely
> need to be propagaed to the IO capabilities helpers.
> 
> Note changes to the IO ports or memory ranges are not very common
> during guest runtime, but Citrix Hypervisor has an use case for them
> related to device passthrough.
> 
> Some Arm callers (implementations of the iomem_deny_access function
> pointer field in gic_hw_operations struct) pass a const domain pointer
> to iomem_deny_access(), which is questionable.  It works because
> the rangeset is allocated separately from the domain struct, but
> conceptually seems wrong to me, as passing a const pointer would imply
> no changes to the domain data, and denying iomem accesses does change
> the domain data.  Fix this by removing the const attribute from the
> affected functions and call chain.

Personally I think this adjustment would better be a separate, prereq
change.

> --- a/xen/include/xen/iocap.h
> +++ b/xen/include/xen/iocap.h
> @@ -7,13 +7,43 @@
>  #ifndef __XEN_IOCAP_H__
>  #define __XEN_IOCAP_H__
>  
> +#include <xen/sched.h>
>  #include <xen/rangeset.h>
>  #include <asm/iocap.h>
> +#include <asm/p2m.h>

That's heavy dependencies you're adding. I wonder if the functions
wouldn't better become out-of-line ones (but see also below).

> +static inline int iomem_permit_access(struct domain *d, unsigned long s,
> +                                      unsigned long e)
> +{
> +    bool flush = cache_flush_permitted(d);
> +    int ret = rangeset_add_range(d->iomem_caps, s, e);
> +
> +    if ( !ret && !is_iommu_enabled(d) && !flush )
> +        /*
> +         * Only flush if the range(s) are empty before this addition and
> +         * IOMMU is not enabled for the domain, otherwise it makes no
> +         * difference for effective cache attribute calculation purposes.
> +         */
> +        memory_type_changed(d);
> +
> +    return ret;
> +}
> +static inline int iomem_deny_access(struct domain *d, unsigned long s,
> +                                    unsigned long e)
> +{
> +    int ret = rangeset_remove_range(d->iomem_caps, s, e);
> +
> +    if ( !ret && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
> +        /*
> +         * Only flush if the range(s) are empty after this removal and
> +         * IOMMU is not enabled for the domain, otherwise it makes no
> +         * difference for effective cache attribute calculation purposes.
> +         */
> +        memory_type_changed(d);
> +
> +    return ret;
> +}

I'm surprised Arm's memory_type_changed() is an empty out-of-line function.
This means the compiler can't eliminate this code (except when using LTO).
But then cache_flush_permitted() (resolving to rangeset_is_empty()) can't
be eliminated either, even if memory_type_changed() was. While gcc doc
doesn't explicitly say that it may help (the talk about repeated invocations
only), I wonder whether we shouldn't mark rangeset_is_empty() pure. In a
reduced example that does help (once memory_type_changed() is also an
inline function) with gcc12 - no call to rangeset_is_empty() remains.

Jan

