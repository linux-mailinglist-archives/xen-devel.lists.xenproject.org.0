Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6847CF32F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 10:49:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618991.963410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOin-00080h-1C; Thu, 19 Oct 2023 08:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618991.963410; Thu, 19 Oct 2023 08:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOim-0007yO-Ul; Thu, 19 Oct 2023 08:49:36 +0000
Received: by outflank-mailman (input) for mailman id 618991;
 Thu, 19 Oct 2023 08:49:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtOil-0007yI-U8
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 08:49:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c86ca2c-6e5c-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 10:49:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 08:49:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 08:49:31 +0000
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
X-Inumbo-ID: 6c86ca2c-6e5c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UI+bGUXjlz38rTBcvz1kCLZkD+wjYeGHVq0R2lHsYvKGeQG0RMt7u2Xwm0c4WiPsFDqKH+PpnFils4LMpY9VJ7LFyiRWdPsXepzDkdGU0FZ0k8cLGsK764+dtq5rgBnhKMoKY1Q6fqI1iTkBqaFaJDJiZhKFFKqUnqeMhHLe0YNbDlhOFuiGkPI/mHo+9BCEPOUJGmH6mX8Q2/2C6MzV1eeUCw1D0xHEYH3nV8ChP6Shmaayx3TET7+gg0AgPi8kyISbyWLTVCawDL92r6PVjgS7g0N/9Kn+gy5xRIe7fsXj4nCmLrWrng+yIu5z56++91+U44mMatnFtspBBK0how==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQvk9FqFmdxkh3g8tGijy/i8VZkTZKrmuQeKtXHGW0I=;
 b=euLj7VktIPPAwJ7GORbu5hBrjqEouBd/N/sTLNoWzX5k9ch/plokmmV+6GB8RcNTUaIbuuHeg1nhOUqic8OqXJ3FPhheJcoUN2CIJ7eCsXj7Z9hpPj2YrcEaxlxLGHNAdVyYXJZDepd4aEP47b9bq7jdl2eRj8cguKFXUxsUsoDyg5Zx/IzaTkz9I1oJx5D/75wJvghhGWC3uSJ2lIqrYryp21Of4XIf2AGinJk31MYJbi2B8fegSA7tSeJ6zgiHdIrXCojtMfVhQuXvYvU/szLIoM2w/Zufciw/vjy8W697Q15PSxZPaFbsNa2ejD6ndPrN9sJZOpWhhn15NCRtDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQvk9FqFmdxkh3g8tGijy/i8VZkTZKrmuQeKtXHGW0I=;
 b=I1+BdrslkSXgdDIP9RxgmgvkOrk3/j8R/1rmIR+IdojTtIPxffh1KCjBnka0t5/QqSwlVgI4oSB1pQFoBATMmoZJC4lnvmw6XqvOpx1dpVs4QNKlfImBtOwlEZLkOQTbZzqtjgP+JEhHDJtbACn+ccciixzm2nORazX8SX9FzdVzouKPSdN1sjOQ8EbcJBZ5Lp4eZ10WMQIFjTTn9cKR58SxhGPSk0akfGEcXza4ZzszoSnOzt7YDUKm5IBAyYTdoFkoPDThvjODjlwQJEmy4dKGjqAPhcYhsQnEddTiJiZOrflwdxs7YRI0R/2Z1ZNbXyQPcHrq1s2WOcAzfE3+mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45b73e35-29b0-99dc-ff91-251fe38d78ed@suse.com>
Date: Thu, 19 Oct 2023 10:49:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18 v2] iommu/vt-d: fix SAGAW capability parsing
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20231018160733.24655-1-roger.pau@citrix.com>
 <709ade00-9112-2866-4d2b-3bb718b13b46@suse.com> <ZTDlm_msZrFlhubr@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTDlm_msZrFlhubr@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9498:EE_
X-MS-Office365-Filtering-Correlation-Id: b2591d6c-a936-4b17-2004-08dbd0804f69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z4tcBXpYpfEUN94eUswV23F5q6THIFn04KP+Z63l7NPtPKP+w5xpkt9Nz5gseB7hKTN6s5CjqlH4vYLndDH3yDtUTWQl3eOkXr4dGuptKGzJKTPXBzZivGwjy1aLzPcEUlhqKWt+OU8s4SnINNmMLe9KD2tAPWlUIHrIaosOOJ63Jlw2Cdo0jgdAGMwvQx5Fd/LTDVfecegAe5P5tlAS/skPhhtwywpq9HfiWbmDByBHh5p+LhCZs+zXGLOIaYyoZmLWaByR6k5hCPER0FyBBJ9KsWjuu5sZCFL4X0gMTD8D8Bv2Cz2NnGMoZWEC2+6apn7hyWVxDlzgoYhtYcuFm+qTxdcWd8pOvq5FqFMr0WmXmYyGwTYUuOZ+xBwiiLR0cus8b2Yqw1Uk0xBBukYuANJiHHMZTbuq0oZ+oOu+Ap6BZbEkGHfmxslxxGr63dIyBS97GnHSKgQKXpVolGZZzmnqJBbIKwJMoAFesgEvMDZWL50NZ7SwX9X4SavIuHoqtJFQRX0l81WQkWxA174rlDkapMSRTh8CB0iOzRZRFNZ1QFqrWzOXQ4JauKLDkj3Fa/FqXWv9hICPWBZck9uZKs2G60OOhsXGWYr099gvjx6rV5UYgl/ddkMxh2j5f8/mzaqb1PmExWv7vMIwF2Uyzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(38100700002)(26005)(2616005)(41300700001)(6506007)(53546011)(6512007)(31686004)(83380400001)(6486002)(478600001)(6916009)(316002)(66899024)(66476007)(66946007)(66556008)(54906003)(2906002)(31696002)(86362001)(36756003)(5660300002)(8676002)(4326008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0pEZ1NrVFlvakQzdW1FUU9zeEJkclNqTUtTVDRZZHVnRkRYUUtncVBiQTJ2?=
 =?utf-8?B?a0JXcmI1NFgrQzNxT0Q4UmxhaGkrQTY0VWNVdU9meUNHbDdFZWkrQU1ZMm5y?=
 =?utf-8?B?SGdSMnZCSHNUZXZSUFdKZ0dCSnVzaXZRZ2lBa2JMOUtrUTlrbDZMNllQS3Bo?=
 =?utf-8?B?VmcxVFdlYzNkU0hUbVFUbm41QTRuVFRxYXpNS0FpbHp5cUNCZjdCbTJHVHMy?=
 =?utf-8?B?OFQ5K1pLY3ZyMWtCZEJMdWRHU0YxUWkwck1TRzlGZDhVTXlsYnRQZzkwOVFC?=
 =?utf-8?B?Y2FkR2FzSXBPcldZMnVyMWVBcTdWclZIZUtSQ2ZTWjNrVUw3RTcyajQvWjdB?=
 =?utf-8?B?b0pBTE9GNXJ4NmNiQjZKZGowckJTMGNEMkF6dlVPeEcxeGVWQ3NSdHU1S2ov?=
 =?utf-8?B?Z0k2S2F0M0UrZ2lJcFFDQXAxZzdXeWU1OTNnRmR4WkJ3ZVM0WEp2RGhvK3RO?=
 =?utf-8?B?ZCtRZHJwVU9ENXFhOEFXZ0R3T0ZCNzZrbjc0SStNRE1HeHkzZUZ2VjJuNUpN?=
 =?utf-8?B?QWZpVGhmZUg5VDZQQ0R5dTJzOTk3OFFXL2ZoeTU2N0RyMHpDa1NWTHJKY2E3?=
 =?utf-8?B?Yy8rUDk3aGN1Z0FaRjBjdGJWZkJRUVUzakJiNW94bUJPNlVrMlBlN0c1TVB5?=
 =?utf-8?B?eVlmdm9OZDUwb0hKdkVsa3grM2trVGJBZWIvckVoTEhQMVlVeklPaGt1aUFs?=
 =?utf-8?B?aFRrVi9YUzNsRk1IVWRjRURrVGNyYnIwOWl1VjBiV3RiOEVadDhjQVJmUFZV?=
 =?utf-8?B?dHlOYm9scGpmMDlzWFVCaCtlSmROTUJZa0hxWStjTGY2U2lXQUYxNmhraEFz?=
 =?utf-8?B?eXpJZFhJdUNPYjFyRDdYdVE1a3RxQjRLNTZ0Unptb0lickhiQytwbWxvd21L?=
 =?utf-8?B?SWJpWGdEZE52Sk9JajRGeFVwOE5xYUszWC9JbVpvdS90TUdhUUNnTXZ4NDc4?=
 =?utf-8?B?REdnenZLVlVjM3BpZG9zNnFIcElJTGF2RllyMVJsZzVVTlBLeVhFbloyMm1Z?=
 =?utf-8?B?dkxNRVp4WUY3SkJmYW0xdVhQTUJ0dWpUK0JpQk50eWllaWkreWVveVpVZXk0?=
 =?utf-8?B?L1Bua1NSY1g4VHNqcnh2eDNjeUp1c3VzOGRRTkJnQ2NyL0Y1WFNpaU9xcWVI?=
 =?utf-8?B?OC9YSWxpVkJadC9WUzBiZ0hFdUFxU2dYK3FLSG1iMFB3SmhMd1dBR1Y0KzVK?=
 =?utf-8?B?azZObjNtMll1UG15MFZSZ3ByRElhYjlteVRFUEJQUDJpRTQyelNvK1F4WVlt?=
 =?utf-8?B?bUdTTVlZdXNOYlJrTDRTZEhkZXAvUVZCcTFWRitMbXU1Q3J6aEtnZkpUTVJS?=
 =?utf-8?B?M3k4Y3ZUZkVXY2xkTGRPM3RIRzNkZ2RtMVM2U0lHdzcrbkN5ZnpMemJXSEZl?=
 =?utf-8?B?bDdoVUI3SlpDWGQzTElvK0VncUlCUGNxZUE0S3cxT2FaZnY1U0ZYMWNuMnhK?=
 =?utf-8?B?dHlVOS9xNkY0cDNFejNTcDAyOTNUR20zTmdoZTE3L1BTbTNOd1FQWi9OTWhB?=
 =?utf-8?B?WGZtUjAvSEFnT1FhL3BDSW9ZaWNiQVczUG5iNTBmNFBsVlo5MWxMZ3BWNFZG?=
 =?utf-8?B?TkFDNllOcWtiSzRoOWlLczNmS2VkeGNQUGc0WXhwUEkrbXd3anAvc0sveHdU?=
 =?utf-8?B?QUVQbXNldVdDOFdBc2I2RUt5Snl6QjlTcWtXTlpQTXlkNUhRbWJMbC9NTlg5?=
 =?utf-8?B?TmxDZzlmVjBuMCtxZ1R4bUJwZ0FJRXY2emZUdUp2c1RUbDdEVWw3cGJybUhP?=
 =?utf-8?B?THlxOG8xcnZiV2YrWGF5cDlCY0pBa0ZNa1FNdkVYWkc2VCt0Vm1wVVY4Qis5?=
 =?utf-8?B?NEhJNkhsdzVLT0UwcHpiRytONVpRS0E4U1lINzJmTDFVTWxKb3M5Y0JrK0Qw?=
 =?utf-8?B?Vktvd29sRkk4M1lJT25EYW80NERYQ3FieHJRQ2JBaFd0VWFhaGlOalBzaTdw?=
 =?utf-8?B?NVNhdWFFSDE1Y09GWkZDM1V1ak5FVThuRUFrQitOb0NoUmNYdmNIL0hQbUhZ?=
 =?utf-8?B?aXdVUFM2eWc3RVkvOVdEb3FPcjA1TVova3M2bjlXdHVSZzE1Tk1oam9aV2ZB?=
 =?utf-8?B?dmV2ZllpS3FOb0xORGlVUmxiaTU0dU1IYmxaL0lWRzNZa0Q1ZkxGRnpuMUdV?=
 =?utf-8?Q?ftEKu+oc0G4Q5vJQnAKcOqXHG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2591d6c-a936-4b17-2004-08dbd0804f69
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 08:49:31.0802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kb5m/wG9Oqg2fjojOCX2EDiNBcrLD5TkpC7gIXWVZ2IUqVWVpTWtjLUsvCF88JDuhoTbSlANNUwrDocnWCaerA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9498

On 19.10.2023 10:15, Roger Pau Monné wrote:
> On Thu, Oct 19, 2023 at 09:41:41AM +0200, Jan Beulich wrote:
>> On 18.10.2023 18:07, Roger Pau Monne wrote:
>>> SAGAW is a bitmap field, with bits 1, 2 and 3 signaling support for 3, 4 and 5
>>> level page tables respectively.  According to the Intel VT-d specification, an
>>> IOMMU can report multiple SAGAW bits being set.
>>>
>>> Commit 859d11b27912 claims to replace the open-coded find_first_set_bit(), but
>>> it's actually replacing an open coded implementation to find the last set bit.
>>> The change forces the used AGAW to the lowest supported by the IOMMU instead of
>>> the highest one between 1 and 2.
>>>
>>> Restore the previous SAGAW parsing by using fls() instead of
>>> find_first_set_bit(), in order to get the highest (supported) AGAW to be used.
>>>
>>> However there's a caveat related to the value the AW context entry field must
>>> be set to when using passthrough mode:
>>>
>>> "When the Translation-type (TT) field indicates pass-through processing (10b),
>>> this field must be programmed to indicate the largest AGAW value supported by
>>> hardware." [0]
>>>
>>> Newer Intel IOMMU implementations support 5 level page tables for the IOMMU,
>>> and signal such support in SAGAW bit 3.
>>>
>>> Enabling 5 level paging support (AGAW 3) at this point in the release is too
>>> risky, so instead put a bodge to unconditionally disable passthough mode if
>>> SAGAW has any bits greater than 2 set.  Ignore bit 0, it's reserved in the
>>> specification but unlikely to have any meaning in the future.
>>
>> May be worth mentioning that in earlier versions this indicated 2-level
>> paging support.
> 
> Oh, that's not even present in my copy of the spec from 2016.  I guess
> it was removed very, very long time ago?

Indeed, as mentioned in the commit you're fixing. Version 1.3 of the
spec still has it. Judging by the document numbers 2.2 may have been
its direct successor (i.e. no further 1.x and no 2.0 or 2.1).

>>> --- a/xen/drivers/passthrough/vtd/iommu.c
>>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>>> @@ -1327,15 +1327,24 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
>>>  
>>>      /* Calculate number of pagetable levels: 3 or 4. */
>>>      sagaw = cap_sagaw(iommu->cap);
>>> -    if ( sagaw & 6 )
>>> -        agaw = find_first_set_bit(sagaw & 6);
>>> -    if ( !agaw )
>>> +    agaw = fls(sagaw & 6) - 1;
>>> +    if ( agaw == -1 )
>>
>> Would you mind making this "< 0" or even "<= 0"? The latter in particular
>> would already cover the likely future change of dropping the masking by 6.
> 
> My plan wasn't to drop the masking, but use 0xe if we support AGAW 3.

But we will also need to deal with bit 4 (at which point applying a mask
is going to be useless code). We can either guess that it's going to mean
6-level paging, or we need to treat it as having unknown meaning when set
(implying that we'd then still need to either fail initialization or
disable pass-through mode).

> I'm fine with using < or <= if you think it's more robust.

Good, will do so then.

>>>      {
>>>          printk(XENLOG_ERR VTDPREFIX "IOMMU: unsupported sagaw %x\n", sagaw);
>>>          print_iommu_regs(drhd);
>>>          rc = -ENODEV;
>>>          goto free;
>>>      }
>>> +    if ( sagaw >> 3 )
>>> +    {
>>> +        printk_once(XENLOG_WARNING VTDPREFIX
>>> +                    "IOMMU: unhandled bits set in sagaw (%#x)%s\n",
>>
>> I think IOMMU: is redundant with VTDPREFIX (or alternatively iommu->index
>> would also want logging). Also note that VTDPREFIX (bogusly) has no
>> trailing space. (I realize both apply to the other log message in context
>> as well, but still. I'd be inclined to adjust that at the same time,
>> including switching to %#x as you have it in the new log message.)
> 
> Oh, I didn't realize VTDPREFIX had no trailing space.
> 
> Since it's a printk_once(), not sure iommu->index is really useful
> here, as we would report just one IOMMU has having an unhandled SAGAW.
> IMO if we switch to printing iommu->index we must also use a plain
> printk.  But I don't see a lot of benefit in printing this for likely
> each IOMMU on the system, and hence I would rather use printk_once()
> and not print the index.

Well, logging the index in printk_once() has the benefit of identifying
the first IOMMU with the issue, which may help further analysis if not
all of them have bits beyond 2 set. But I'm not going to insist on this
aspect.

> Feel free to drop the IOMMU prefix, but I'm not sure what to do with
> VTDPREFIX and the missing trialing space, as some users of VTDPREFIX
> already account for such missing space.

I'd simply insert a leading space in the string literal.

>>> +                    sagaw,
>>> +                    iommu_hwdom_passthrough ? " disabling passthrough" : "" );
>>
>> May want a leading comma (or some other separator) in the string.
>>
>>> +        if ( iommu_hwdom_passthrough )
>>> +            iommu_hwdom_passthrough = false;
>>
>> No real need for if() here.
> 
> Not really, but also no need for a write to iommu_hwdom_passthrough
> every time an IOMMU is initialized if the condition is removed.

This is init-time code, and hence the excess writes aren't going to be
noticable.

Jan

