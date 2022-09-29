Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A7C5EF45D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 13:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413665.657458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrmj-0007o3-Gv; Thu, 29 Sep 2022 11:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413665.657458; Thu, 29 Sep 2022 11:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrmj-0007kd-DT; Thu, 29 Sep 2022 11:32:57 +0000
Received: by outflank-mailman (input) for mailman id 413665;
 Thu, 29 Sep 2022 11:32:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odrmi-0007kX-JD
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 11:32:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75cefc35-3fea-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 13:32:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 11:32:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 11:32:53 +0000
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
X-Inumbo-ID: 75cefc35-3fea-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTsnRs6Axqqt8YPX3oDUz9pwkC/7LH3wKjBfM4/06+FNzkuqhb2yDePGkKlv/imZVUMMtNhy0OadqIY8Y9E8Ov6aVwYHVIld/1cJcr3xHPFrOmjP7RfPCcY6N+isnCPExW6mJHaaQyFn5GFBmvyzbKS6xq9dRjJOipnSwgXhhgDr8U9aTAJUHqZYeZFg2zrAkD3xsz8DCRBm3AAeczVSuVPhLB3ymBlFz7vO/d/FICQDJWJXegCasy/FBo2u8l8VmTmHDjDpcAsKrCCbKYSjkRFeAwanePgWXWUYGVsm/86mW6+ruJMnfUHBa+Iu+rcoNvWZ0yQk6GMWmbRh2I7Tfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e8biq75uQu/4U7m+07C5R7B/p4UnYz5av0tcBksW6I=;
 b=jRW2SMfJVJkpbnRB4DFesDhVCZj5qRiW8k2LzFNpcdnXJ4jNfd3ThO2MeuVP0CUlDG5EsrEYb9zJ9QhU9m18gu3zBsXPI/iXqFWwd55iauAnIWuvE4+J5PDVTYW7K+lE3pqdUbXaMlHczHniE/aoKLSkzVonQR/Geq2bA/7eKXi8NsvCz2cSXMr9LIezlVBa0xNPfdL+nHucWsK2Rks6O16QEhFkCcdwLWpJf1rks1I5lmkDcnEYkq3cKRqUWp9uN8HjrAIDnQDBq1uo57dboHWV2K91ladeOK3pqUfhGqtYfwqOe/QWnKZTM1r1OvxAeu3fvUK5/LnrWzkVGTsUDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e8biq75uQu/4U7m+07C5R7B/p4UnYz5av0tcBksW6I=;
 b=h0BhWPkXEo8KdQogHx8GWxHZByz9m4E9gPhpQZWpAu6gasV6QinAjLoSU3p9vOe4LKja2JaA2qhmjVjsaNdcGw5aTrYcfyL9K2Mg8jw8BBwuH+XyhvMExL5ylxzkCTbWAgRT1lxepkZpOOQNBOgJ9xWTgPkI2hiSUD1LhzbGDzNs9DFWaArWq4oVNsNgAZwWHalWaLK10Fhxzs1lrJoYGAo1k3k9UMtHhO2ncGidsiC997aUh1vCgRFgp2I7K9emsl7Z2z9cENEywfsZys/1gB/+pKEy8UU4K1BvcRzPNir4zDqedKh6rsz1C7tjLaURXT+uC3DfinhOf0ldrItcag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a3d38a8-bac3-fa59-e882-0d95a8d3e5d0@suse.com>
Date: Thu, 29 Sep 2022 13:32:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Proposal for physical address based hypercalls
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
 <850214fa-7e26-8a19-c318-9ded849fffda@citrix.com>
 <6d2e1b23-2299-01fd-0e79-1c9ab1b5bace@suse.com>
 <94aab958-c141-4c43-a249-a55d8e5be735@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <94aab958-c141-4c43-a249-a55d8e5be735@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0601CA0072.eurprd06.prod.outlook.com
 (2603:10a6:206::37) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: c1127a95-e1a1-4676-a070-08daa20e58cd
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KYqFDHe8u7Ijczu0v24/xeXTDqq6HchmS/X5d5ynI3RUsIJ0LIYB+ZptbQl/U5Yw852ahr8PxJ1fKV7DEVt5xy99/PQa4OOnXhKo0mlTshvENEAwH5tnlbKxlEfFue0YtPJ3tEzNF4AI6SnY+NDQI8LhgOglXIDlTXZu5xAKwiLGo343s07xJdD7PvJFxakVVSXLg9foqAbUMOm+WCGuDl9jVGapEWxAu5WltIN1whN84HII7QJEjVcps6LRMehuDMVZko25GehpuZ/jZVaE7ULjTkTWOrHnahOHhJ2OSHRPyjg3QGzWwkf5aFwPxWZ4sL0zaML64AK+o9yULoSi5/96mLM5VuW3o2WZc5roiHYpCPg38zhmsUpyy/1IIqdKk0vsVbCdcDizo8mihEVgomol4tsSGjborgoqMlCZZhK7s4rUOYr7xKmNhl/hGapCmKGEQ2Bri/9+/iOutsa9Kfh6FaR0/LvOBRElSNeG5yHTd4XshMM6kRbwiafFRjGrqxsEP6asb8rX9RQF2MyTRQJoY+vienXlri+I6jVSW4hcbzKNBmMG0oSWWSuBGv6W+QtFhWQ67Oa8u9N3xNrK9AG6Cjsr104/hh5K19T6K3IZXKd/0AwDt6Die4uPJxgHeAwcqWI05lXoaVKvlmHfNCVkAUpyJQRkpOrYRz2Kcr0UrO17j+3ogmJgRyP+RgREhJ1w9BUQcyuRJBwoBIcHbSdruaY4B2q4i+s0dmWQdle1yP9ZbCcIRk7DaTyoAtejultRdN4KjwTu6nFrFgLUF0siTH4EIwPnxaqOEF6W1TNBVFl55hOyzm0WuvtwVKfEzaWvwbFHsKCaAQr8FciBiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199015)(186003)(53546011)(2616005)(26005)(966005)(54906003)(6486002)(31696002)(6506007)(478600001)(6512007)(38100700002)(36756003)(86362001)(83380400001)(5660300002)(8936002)(41300700001)(66946007)(66556008)(8676002)(4326008)(66476007)(31686004)(66899015)(2906002)(6636002)(6862004)(37006003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1RXWVE2T2VlYk1IK0dQb3B2ckk5Ulh0RTFWTldpeGxocGFtdzZiWjgvTzRL?=
 =?utf-8?B?dG1YU25idSttT05zMXZHTmEzMmp1SkhWYmNSMTlzMWJoZ0xieUZhMnFheTR0?=
 =?utf-8?B?NWRMdm1KRUp4eHN1ejlWZ0Z3aEJhMFh2ZlJlUUN0eXJOTllDNTc5eEQ3S09w?=
 =?utf-8?B?Q3FwN1ZwMko2SlFqNVJidDR5TEsxbWRkNTZEUHpEdmNHOHhOUXdpNTl3WFpC?=
 =?utf-8?B?TStxQm9NTi8rNS9VOVNQN2ZzcUl1N1dDb09Qd1JrMEo3SmJGRktZbDE0TEhj?=
 =?utf-8?B?MWlxNG5udGc0c1lWK3NnMituWFJ3cW9ZK0ZHTnRwMHBKRDMzR2lZa1VseThN?=
 =?utf-8?B?dVVRc0JqNkNxTkREOTBrZGhBaHo2ZWdSRXNGcFNLVHp1bWdhYjhLeTJTR3F2?=
 =?utf-8?B?cHdyRG9PNFlWbXFQNmVxV3lpUEwzbUdpbytLVEhTbWZVblE4cXVTZ3JFK3Rj?=
 =?utf-8?B?TDdjR1VZSnZEZ0FPTU5lL3l2VE9sREMwa3VKemJYeXJFZnZHdHhrUmhueW5l?=
 =?utf-8?B?UWl0djRsQis4N1ZLNVdSWUkxSXdwQmJTTkREYnU5Z0dQNDhxL2d5VVc4THQ3?=
 =?utf-8?B?TWY3MnZ2TjVva2xUL2l2ckpBMjFXUXd0TDVoUnJzbllhdTQxa01oWWFxa25p?=
 =?utf-8?B?N1N6YmdFUHkvUnBwYWw3S1RsUzVjeXc3ckhUZ3hFREx5eVhESXFPbnVBUEEv?=
 =?utf-8?B?SHJtajJ3eTRuKzRXS3N1ZXFDSTN0VDU0S1A0bklpbFo3QjcvWkIraW5ybDEr?=
 =?utf-8?B?eVVOZlpWemtia2VyR3AwOWw3UGVUTTdERWdVcjlaTktCdDB0ZDdIUDRsWVJH?=
 =?utf-8?B?TndkWUV6cEZLN3lLTGhrb1E3VFYyQ2JGdnluRmJYT1M2UHBmOE45cSt0dmM5?=
 =?utf-8?B?cmR1UGlaeDQvdXNlZjZuekVpNGdyUXFmZU1IbERnR1VUckF1Wi91aXVTTnJr?=
 =?utf-8?B?UFgwZE85ZWJxc0lvTEtwQ0JaYzY3UEUyYllIL0I1RnJrYXQ5WkFXSlczSG9T?=
 =?utf-8?B?UEkvRk1HS2I2emNiTHcrSDVFQ3FIdXhEVUxBb3VLSjR6TlFMMWpzc3VDNUlj?=
 =?utf-8?B?VW1hV25IbnBVQm9rK1FpYTk1VzNvUWVZSUNXOTNhRmJVZVpmbURMcTZCVnls?=
 =?utf-8?B?cWk3am1hOUVVVXprWmttN28vZUVPQ3JDQ3V0ZFF2aFZDNjluYUJFWHc5cEZB?=
 =?utf-8?B?MVUvdCtxN1dzZVNPQjlvWnlUK1JFdHI5ZWNjNjBTdjlSU2N2WVpvNUFMMGt0?=
 =?utf-8?B?TW9JSi8vbkRlMFI0ZUtodjMxTkVOeUJXVnlTS3lCSlpsZ0FxKzQ3QTZDdE40?=
 =?utf-8?B?WmJieU1EUDZpd0JWWWZvTzNYMDBHOXlndTN6TFF6KzJnOEhwcXFiVjlDSHZC?=
 =?utf-8?B?K0x2WEVyV3RkVGl4b3AxNThDRWlIYkpuR0JKUnhWdTgxbjRYTzZ1M2lvTHpo?=
 =?utf-8?B?Q0hWc2dRODBlOEI1ek1aSjZIS09XWSs1S05aYm9LVnh0dHF5Zm01ZmJVbVBy?=
 =?utf-8?B?dHpVRitXd25NYkNEWVNwTDNPSGFGSE9MUjZUR2xZMVY0SWd5VXM2QXRvcEh2?=
 =?utf-8?B?OHphaFlCeEZkT3EyR0dwc29saEVmb0Z2T2dWZWVXZkROTjB6NVBOcG5ROFpP?=
 =?utf-8?B?VUc4RHhvTlJDaTFuZ0hKNW9vcWZwc2R5a29vWnBUc3BDbHpBeEZDbFJkUnIz?=
 =?utf-8?B?clZJU1AvYTREMjBLVDZMWmlrd3lFeVAzNnUyVGtpbGd1RGhUeE5uNGgxa2tK?=
 =?utf-8?B?aVo1dC9Cb3M4Mm1IendQOHFUekw4QmJaOU5NYk1ON0prdGN6eGQ0ZHBOdTl4?=
 =?utf-8?B?azRjMkl3blpmZW9IcFJYWDExNEptQkFhMUxRWnNicWQzdzl4cG85dG5WN3g1?=
 =?utf-8?B?TWJtQ1l2Y0hGODZmMHVPcFZNRU5KT2RlSnRJOTMxMTlIQnhxSm1nZnhnMVkx?=
 =?utf-8?B?NHM0K09PNVErU0FDR3V3SGF1Y0ZyZXZRWTJmNVVmRjBCYlRpUDBrRHphNHNC?=
 =?utf-8?B?ZjlSbjNnK1BWbVVUR0tCTHlQWmdXUXdtbmhtSjV1dkVjZFZEbXovNmozU1Ax?=
 =?utf-8?B?T08xUEFpS0Z5RHRXMktLYWw3dG5tMCtrYmZOUmVSc1p3VCthbUw5Y3hVM2lB?=
 =?utf-8?Q?fFwJsBPL3VC6s9Q0UVGjt9e1W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1127a95-e1a1-4676-a070-08daa20e58cd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:32:53.0552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJlVrly2YDEStgB18moR24qWUqKVJ0c/i/fdVXBksJ9v/9XKUEUQ3xHMmjt7dkrRzHHGhEp7XOsGvowUf0l0gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

On 28.09.2022 15:03, Juergen Gross wrote:
> On 28.09.22 14:06, Jan Beulich wrote:
>> On 28.09.2022 12:58, Andrew Cooper wrote:
>>> On 28/09/2022 11:38, Jan Beulich wrote:
>>>> As an alternative I'd like to propose the introduction of a bit (or multiple
>>>> ones, see below) augmenting the hypercall number, to control the flavor of the
>>>> buffers used for every individual hypercall.  This would likely involve the
>>>> introduction of a new hypercall page (or multiple ones if more than one bit is
>>>> to be used), to retain the present abstraction where it is the hypervisor which
>>>> actually fills these pages.
>>>
>>> There are other concerns which need to be accounted for.
>>>
>>> Encrypted VMs cannot use a hypercall page; they don't trust the
>>> hypervisor in the first place, and the hypercall page is (specifically)
>>> code injection.  So the sensible new ABI cannot depend on a hypercall table.
>>
>> I don't think there's a dependency, and I think there never really has been.
>> We've been advocating for its use, but we've not enforced that anywhere, I
>> don't think.
>>
>>> Also, rewriting the hypercall page on migrate turns out not to have been
>>> the most clever idea, and only works right now because the instructions
>>> are the same length in the variations for each mode.
>>>
>>> Also continuations need to change to avoid userspace liveness problems,
>>> and existing hypercalls that we do have need splitting between things
>>> which are actually privileged operations (within the guest context) and
>>> things which are logical control operations, so the kernel can expose
>>> the latter to userspace without retaining the gaping root hole which is
>>> /dev/xen/privcmd, and a blocker to doing UEFI Secureboot.
>>>
>>> So yes, starting some new clean(er) interface from hypercall 64 is the
>>> plan, but it very much does not want to be a simple mirror of the
>>> existing 0-63 with a differing calling convention.
>>
>> All of these look like orthogonal problems to me. That's likely all
>> relevant for, as I think you've been calling it, ABI v2, but shouldn't
>> hinder our switching to a physical address based hypercall model.
>> Otherwise I'm afraid we'll never make any progress in that direction.
> 
> What about an alternative model allowing to use most of the current
> hypercalls unmodified?
> 
> We could add a new hypercall for registering hypercall buffers via
> virtual address, physical address, and size of the buffers (kind of a
> software TLB).

Why not?

> The buffer table would want to be physically addressed
> by the hypercall, of course.

I'm not convinced of this, as it would break uniformity of the hypercall
interfaces. IOW in the hypervisor we then wouldn't be able to use
copy_from_guest() to retrieve the contents. Perhaps this simply shouldn't
be a table, but a hypercall not involving any buffers (i.e. every
discontiguous piece would need registering separately). I expect such a
software TLB wouldn't have many entries, so needing to use a couple of
hypercalls shouldn't be a major issue.

> It might be interesting to have this table per vcpu (it should be
> allowed to use the same table for multiple vcpus) in order to speed
> up finding translation entries of percpu buffers.

Yes. Perhaps insertion and purging could simply be two new VCPUOP_*.

As a prereq I think we'd need to sort the cross-vCPU accessing of guest
data, coincidentally pointed out in a post-commit-message remark in
https://lists.xen.org/archives/html/xen-devel/2022-09/msg01761.html. The
subject vCPU isn't available in copy_to_user_hvm(), which is where I'd
expect the TLB lookup to occur (while assuming handles point at globally
mapped space _might_ be okay, using the wrong vCPU's TLB surely isn't).

> Any hypercall buffer being addressed virtually could first tried to
> be found via the SW-TLB. This wouldn't require any changes for most
> of the hypercall interfaces. Only special cases with very large buffers
> might need indirect variants (like Jan said: via GFN lists, which could
> be passed in registered buffers).
> 
> Encrypted guests would probably want to use static percpu buffers in
> order to avoid switching the encryption state of the buffers all the
> time.
> 
> An unencrypted PVH/HVM domain (e.g. PVH dom0) could just define one
> giant buffer with the domain's memory size via the physical memory
> mapping of the kernel. All kmalloc() addresses would be in that region.

That's Linux-centric. I'm not convinced all OSes maintain a directmap.
Without such, switching to this model might end up quite intrusive on
the OS side.

Thinking of Linux, we'd need a 2nd range covering the data part of the
kernel image.

Further this still wouldn't (afaics) pave a reasonable route towards
dealing with privcmd-invoked hypercalls.

Finally - in how far are we concerned of PV guests using linear
addresses for hypercall buffers? I ask because I don't think the model
lends itself to use also for the PV guest interfaces.

Jan

> A buffer address not found would need to be translated like today (and
> fail for an encrypted guest).
> 
> Thoughts?
> 
> 
> Juergen


