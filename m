Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E8B6F4059
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 11:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528419.821538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmVV-0006PL-Eq; Tue, 02 May 2023 09:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528419.821538; Tue, 02 May 2023 09:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmVV-0006NR-Bm; Tue, 02 May 2023 09:41:13 +0000
Received: by outflank-mailman (input) for mailman id 528419;
 Tue, 02 May 2023 09:41:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptmVT-0006NJ-Tj
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 09:41:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78286036-e8cd-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 11:41:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7025.eurprd04.prod.outlook.com (2603:10a6:208:19c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.25; Tue, 2 May
 2023 09:40:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 09:40:40 +0000
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
X-Inumbo-ID: 78286036-e8cd-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gyqu7AJGv+KGQ9CFoLTS5HhonlItsa+4ojydPRjvGnG61qfrkaHP7hN9DKIfa2oxhWXvZgfofi1tXsY3+eAFZCLFMZL5sucz7a3Vi+ElgXQ8GgyuZAnf9Ahwq5ffX8gNtwCqrzcYvi9xeXtHYYMw9QKMmv6fp9y9qpVlj4GOQI9oaTfz4FHsmCZW/VfU9VWUT0EqMBmiIm3VKVjAtI7VvEezAb37HSNZSzbY1Ph4HXNzQHFSV8/hRLn/k4vPQ2rS9Ro+DkZn+o/WajDPvkgCydp1QF2CNzKUtMu9OtnHhVgvHcShaL7k5PsBy6rOyMAi0n02RgqO4rEevdGBx1nFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWd4VHl3QwgEFRTdzx+i/fqQiQZSGVt6HDdW7tgg490=;
 b=XcOXzrRx7JKFyOmfAuR6qIjpDaq0Fl1YrcW1oVpyVttBoL3TjPSuFUKxdYa2f6Wq3G796ey9Ue8IvRHLm4JjeCX0wK3UA4m7JFr7gItXZVqwhbBMUDEHnc1SNijjz6FLCq9LpRIAt9vVQvOXbDM6vEAUCuxIxJ40Qfm3Lppc7TjdE95ek7aPLehAqsf6Z1BU/79puweuVQJxqPYcYhjYK3TAdc98Ax9eNtlKwWYsFLYf7YGR2iqRoTGFPZUBisWPlDCFHSZVfhebs3JZCIFoyr2nhu62xwGWlpLHEWTVnZva+ZJ5pjxeNaWBVhnSacuM3t/zDKyBWTM7aPx/BaFebQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWd4VHl3QwgEFRTdzx+i/fqQiQZSGVt6HDdW7tgg490=;
 b=UJWTe1tRoi9ZJD62RQeVdubkRyl2+l2vf8b2aOy0v5/fA/qMPEBETg/0ke1iso+a9WwROZnbeVYEaTLHgtUyR08K5QaidsI9Q26pKNxVe5uShajJu1U6OoRZ865ti0at/astLFnlN1xFhfhPt2A6VwU7OmzibyxiOgf5VHDhaGMQm63YT9DdZqAhGOTE6gYfT+DrjaffvUarNMUZNM5mXGJ+Lfl4+C/+xiSMK0k+xdSrWvwemlrN8Ppo6nbYSreQ0hAT4J6g/xqVro+TeE5nxRIp8dkSp8gF8JmSi36eznYJ6Cx+5HXtFgJ3ty6WO1DcIGakcjU6Iq14TFtc5B9JvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9339daaf-533a-4758-c25f-164c27f56043@suse.com>
Date: Tue, 2 May 2023 11:40:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] sysctl: XSM hook should not cause
 XEN_SYSCTL_getdomaininfolist to (appear to) fail
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Jason Andryuk <jandryuk@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <26064a5a-423d-ded5-745e-61abb0fa601c@suse.com>
 <afc999f3-fbe0-3b52-2f8a-b8b5a36eda87@citrix.com>
 <ZFDY9/mXw1gr5HgI@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZFDY9/mXw1gr5HgI@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 02054f07-810a-415e-577f-08db4af14a4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uPTnxV2UK5Lchke2f8bQUOGrw4skonr6hID1Aju23aBSXkmLERCf1T6rjQQYbneCJP41Naztfe+K2jfzU4JIY+UenbVOMig2zd5NMsRhywWEJ856IAjOo3Oh2W8vYkZHCtUnhScKxEQ9lrt/dQl/e2yy1lwvTtE3jZ98igOMDyqEdg8SGQd7W0kwI2aniymNCsuRQy++qf4xaGprixlmXWsP4BtxMuQp5ACKbpykYE56oyYqVSM/6yPdhYg7jChP3JzK/fC6UD+QIW5biUPgS9JT/YLfiPtRcWGtYT8IcaiJbWtW2Xaq7UBaEqK4quc+Q7DWEE1xXxD/FZaGD0Qrq/iCWKpEkwVIXPV5ep2N1KF8zHSdeC2HojbwOow2ZiV9KO9pa155v9SkeGZJO/udr4Ofz5egyKHdmw3CdZj8o6wb2Kj7bUbxeM+qfJ4dC85P1aqy5oopF30LGI3pWSlYv+f+gI0WZoWp+lZeL2NtyvSinuNI+HkhcfXuW5c2vFl7EtiCLAWADW70SRkeLrfgYcNvcHBIPGqzdLhLXxQft7S7fPRMx2G5+INPdkbhatbzmp0tFFh0JiGckcgTl7w79+ilRE0OV6X1CaVB8BNbdAwf67P3lC/bqM8ksDQ4vYe0CpMAx/q4ntAorPPQnximlg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199021)(86362001)(36756003)(31696002)(38100700002)(66556008)(8936002)(316002)(7416002)(6916009)(478600001)(5660300002)(41300700001)(8676002)(66476007)(66946007)(4326008)(2906002)(83380400001)(2616005)(6506007)(6486002)(54906003)(186003)(6512007)(53546011)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGJJN28wU3lzZE9lM21hWll1dHkzNmJTeGMvZG9RZCtkR1d6R01zVTVvVUg4?=
 =?utf-8?B?aGNsOFZKUUJFWTBaZUNwdDBZUVJNWVlaWVhleUlvdExMMWdJYzJXVy9CZ3Rv?=
 =?utf-8?B?REV0TFhxSmhldDhQekpHVGEyWWNWZzU2ZThPd2doaXhLOWdwcjQ4eUlYSTFq?=
 =?utf-8?B?cU9Pc0ZyY0d3QkdRT3JRYnRPK2szeFVOcjN5Q3VOWE1iTDVwbSszbzF6SXlk?=
 =?utf-8?B?QjFwcXJLQU95cEtubkM1Q093T3ZjZHVWQkU4Z1dUZFpPQitqaG53TzRDMlZN?=
 =?utf-8?B?bXNuNWVXZDRTMkxVc2xmaU9ZN1ZlU2ZHZjJIWC95VHVvYzd2WHVQNHdMYTJQ?=
 =?utf-8?B?azhHZ3NzYjlmeUkzYWZQb0JEdkF3M09TOFNEamFzcml3eTdBM0h3WEQrKzRm?=
 =?utf-8?B?a1FPOXJ6Y0F4QzZuU0tSTjE0UCswQ1ZTMlBNRDFEdWJNbHJIcWhQaXcxRTM5?=
 =?utf-8?B?QlErUVRzWXdGVzJIV0c0YU9YMGx1dWFGYTRTcDRZMXRMOWNmdlVoWlFPeEEv?=
 =?utf-8?B?Q1VHMWZtZ3lodmMwUk1YbE9OVDN1d3NyazkvdjcwVlJsTS9CWWtENjM3bjRB?=
 =?utf-8?B?VEQrSHJRb2JsZDdQRVltMEN3dnpwWVFuSEtjTlJhSGZzbnZURWRhTE5XS2x1?=
 =?utf-8?B?dU1PdG5vQTk4cWUydTRnR1ZRa25mZThRUjF1TVVHNlFTS1Y2bFAyaHB4dEZu?=
 =?utf-8?B?cVYrVUhuMnFIYWtURndzZDNSaGlzQ1h2SVR6TnlON3JUUWVHTWZ2cFNZK2Jp?=
 =?utf-8?B?L004a0tvdkdVcW44RE1XakFoalZLWkNHY0RiakV6UXNYUVArOER5bjFVeVNv?=
 =?utf-8?B?bHBKK21pQWQ4ZUZnZmlqUk5sd2FBNWx3VEpvYzJpaWpOOWNrY0MrVVcxakd5?=
 =?utf-8?B?NlZLb1Eyek9GOEJSZmhvaktpK0FhRkdaamUyN2R2b2FUUWZ2czVmU05aMGVx?=
 =?utf-8?B?UWpHalc2d2ZlRmkvVjFBTHF6eDlQbEJCTlg5dGFGUUF3c0hxbEFRWHo4RjND?=
 =?utf-8?B?SzgwdjFZU2Y2dUpxSU9DRkxrRzVvY3lHTXZkdXZjOXFzcU9RRFRBSW9nQ3FC?=
 =?utf-8?B?NUtBY21PYXEvNHhYL0szZml4NEcraTVmLzJvVDNKTnF5YzlSdW8zMmJwa1BC?=
 =?utf-8?B?K25IMXZEcWZNMkVTa05KaTFUNmhMMzF0bDF6RVVBUUQrREpHR1ExYmRnTmUr?=
 =?utf-8?B?alF3UWE1Y3VhdGlORVJjWXNuTk9zb01DTkVlSXFyZFlYdW8xSmNuaDZ0MFFE?=
 =?utf-8?B?WTBtTTlRbDZib2VPMUNuU3JDcTlDblJpR0FJbkNON2JZWDc2SExXYk5DdDVJ?=
 =?utf-8?B?NW9UaSt0MXlsc3UwNXBlbXdKZjVkcUpzMkE3NWRycWFVcmRFM2FIaFVZUUdZ?=
 =?utf-8?B?RTBQeVBsNy9BTFl4MmhWV0xrR3dWeHBSVFU0Z2tXVDk2OE1Od25rR3JDUU9B?=
 =?utf-8?B?NmY0djJTYTQ4N1NPb3pBdTRYY1IwWUVjOFJCdXl5VmFKSFJyZFVoS3lDSjFp?=
 =?utf-8?B?cFVzUlNwOGpZUVhyMXZ2d1RzYlQrUjRDNTMwcnArNENLdHhEL3QrVFhiZThx?=
 =?utf-8?B?amxXc1d4TEhsWmNmV1o2RFcvYUpXS1VwdGZ1MWp2b1NNeU04Rk1maHNPQ2U4?=
 =?utf-8?B?Nk03WEh4QlVBUFhDUFFzRHpiUjhQeEdJcUJFQnNDMmN5R2lkTXF0U1JjRzJh?=
 =?utf-8?B?Z252YzMvamVOMUVyOUI4YjNBeFk1L3ZqLzRwRGF3eXRzdWg1KzdyWFViUmZ1?=
 =?utf-8?B?UnlxSEtNUFVrc1B2djJiQWhZbjNsV0k3N1pkVlJEYXZEYlV1Sm1BVDJsSU8z?=
 =?utf-8?B?empFRFpkOUJXMWl3QkR0RzRoSTdGMm9YLzErSnlhdEwyMVRlNFFheERsOVNz?=
 =?utf-8?B?VEgvY0RhUkpLYVdoV1pYWWhrY1dtUkhQWitWVTR0b3NBakx6ekdFNFNMMmN2?=
 =?utf-8?B?cVBxdUlaMkx2cnFiRkRCMlhPV3o4dGgwMjhiQ1lMWmhObVBYQTU5bTVneTgv?=
 =?utf-8?B?U3h3Y2l2ZVpUK3FaOFBBSkVqNTV5ekl3VkVMNHE4S0hEVUlhMGZhOXk2Ryt4?=
 =?utf-8?B?VTlhV0ZjVFh5akJVYks4b0dZRU1KMmUxdmNZYWFvVFEwUC9WRzd3WXFBTnZX?=
 =?utf-8?Q?kc8+8uCyuJM+u7ebljEOE6pxn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02054f07-810a-415e-577f-08db4af14a4e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 09:40:39.8579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2yoxfCuPyz2KfyXTCUiAWOkJWNHbZ8Z7fPdU20xwwS8p/8ei8DnZDShG2mZ4zTI/oYNqvCVsvoq4fuar1+T/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7025

On 02.05.2023 11:33, Roger Pau Monné wrote:
> On Tue, May 02, 2023 at 10:27:39AM +0100, Andrew Cooper wrote:
>> On 02/05/2023 8:17 am, Jan Beulich wrote:
>>> The hook being able to deny access to data for certain domains means
>>> that no caller can assume to have a system-wide picture when holding the
>>> results.
>>>
>>> Wouldn't it make sense to permit the function to merely "count" domains?
>>> While racy in general (including in its present, "normal" mode of
>>> operation), within a tool stack this could be used as long as creation
>>> of new domains is suppressed between obtaining the count and then using
>>> it.
>>
>> This would not be the first example of the XSM hooks being tantamount to
>> useless.  I doubt it will be the last either.
>>
>> With the rest of Alejandro's series in place, all requests for a single
>> domid's worth of info use the domctl, and all requests for all domains
>> use the systctl.
>>
>>
>> As a result, we can retrofit some sanity and change the meaning of the
>> XSM hook here for the sysctl, to mean "can see a systemwide view" (or
>> not).  This moves the check out of the loop, and fixes the behaviour.
> 
> Don't we still need some kind of loop, as the current getdomaininfo()
> XSM hook expects a domain parameter in order to check whether the
> caller has permissions over it?
> 
> Or we plan to introduce a new hook that reports whether a caller has
> permissions over all domains?

I'd be inclined to make the existing hook recognize NULL as "global view".

Jan

