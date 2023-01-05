Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70965E653
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 08:58:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471675.731619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDL8G-0005KF-BN; Thu, 05 Jan 2023 07:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471675.731619; Thu, 05 Jan 2023 07:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDL8G-0005Go-83; Thu, 05 Jan 2023 07:57:48 +0000
Received: by outflank-mailman (input) for mailman id 471675;
 Thu, 05 Jan 2023 07:57:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDL8E-0005Gi-Fc
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 07:57:46 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2074.outbound.protection.outlook.com [40.107.15.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1f8aea2-8cce-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 08:57:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7191.eurprd04.prod.outlook.com (2603:10a6:20b:11c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 07:57:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 07:57:41 +0000
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
X-Inumbo-ID: a1f8aea2-8cce-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eB+bYGx7rKD0h3IHROmfe58JArXY3sX9rdfEYrKV+m5mvUe2g3WCJJil5hsBGub70gxleslJ5bVgApS7TpFF2XvDH2qGj8DecX5ZtjMlzXftgALuIPJtQEWA6gLQmZznKYYwWjEj2tClsKmQr7jULRbFY2DbolQumyJi101cLaGSb+/5TqdHe8tBcETbKw3pEYWn+NxyJ5HdsYLHMqcx+DrjBRDqkbOjEs3zzpFK/Z2pQemApNEXkvsp6bQHZKxCdhYt/P6bAiyfSq/P9RgK5PdpmdeaDhoOdWvNGEFBWrlamYqsfNK03EWaymW78XLO6TZZdSKHYrfpb4wKDyxxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2u/5XapuE10KqU2DCj7P5PcSdhcY/Y5VJzSmMaxZnD8=;
 b=LJu3RGSRt/odNK8gTey0v+AIFAa6CrKIr+UJbkTXsLRexf3968W+tdZveCO0ImuBQcmiz2Iyy+MadgtF3BaD6XbxUqZ7Oz2ilPBW2VaGfJjYbx9veK+4bbq/e5LclcU8r4t98zE3wWmWFSHaABjzx4EVdU6YVNlHO3nChL1zHFSMAZTDrWH2J3F1qE2hgjXpPgbZHHG7XPWnwaVM/7c9v+eYu/tP3P0XRtlrA6CKgl8+MS4ETNLp08rXGnfEfI9pWaLWuTNW0SRexIcFOQmR3e+u8fK5UpUVPeW7b51hFXGH4xXoykfSCqECb/pLkkEeVtSXmQHKCIhkuzFYCGJKaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2u/5XapuE10KqU2DCj7P5PcSdhcY/Y5VJzSmMaxZnD8=;
 b=ZDANJ3SVwo0ih9wc7RpvJsCGQEeYWWhCcV0ywCVt3c+tsjAjxrNUiCZnFCGFISCI031fglVGwmaRWnh+WBqVFZCh2b+h3lrH4LHUxxT+0hIS/o5sI9oCgmi4XMJ9pjPjJ4Jv+wjyA1tmSovcx9TpGOjmiSIPDGgaoifdWbYBg5/gxD6+Fr1sFyUXQ+xvdCZFkHHGjj2dJYqaOG95EYhovXaEGCxiOOXWGDNvIHviuB++G7PSiT7q1HhC9u6fiFIKA3h0I+xfZ91w4bcTx4q4Rb9nqhGS/mB7/hhHI2yvMx3ZJmZBIh0A+qkuHwRI01qM8ACgxBwSfTNYxlMLaeDigg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ebaf70e5-e1ba-d72d-84f2-5acb7e38a6bc@suse.com>
Date: Thu, 5 Jan 2023 08:57:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] xen/version: Drop bogus return values for
 XENVER_platform_parameters
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-4-andrew.cooper3@citrix.com>
 <540a449d-f76d-eb16-4f98-c4fb3564ce98@suse.com>
 <7dd00ce3-a95b-2477-128c-de36e75c4a34@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7dd00ce3-a95b-2477-128c-de36e75c4a34@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: f49f8969-8513-4cbb-e33b-08daeef2857f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TBx8dCfGUESSCwjM3zUdMwNaFoPJpNtAJyRsE23ibH6JPGFR85nJh2IqmWwSrPVf+wYLc1Aku2woP6SCkrsr6FDkWchCFhDLTPAYOSBX/p8nN6u2mmCNQv5CW+Itw2flSHndTQk8npBSlrItUlRT/2YwujnXPTNCUT/FmWBtEPiCmD4+xM5Hpev2NonWYSQ9qEiUpIzVrQ59Pp1VNlx86Klwznug+/lqaCr/2rXdoFTxIkpyE3zRZ3GONPvFDs2Wf4H0wk56k3t+QUD+rnFwzF/hFSVSCJQj5btiKWY32rsSNvaLz2cv9g1NOoRdaLZBf/n5KdbNjn6zuKOyN7AaDPsLo9pk8dmRyXu9NObUMifk9L1XTKDdqvMy0gqRFe5u0r68Qcpxhsftp15IVM5UMpAVGOGOpmH6ZjV2kffVnjhTb8y6066whzfil32E32IMB41XwNECtWQLcKg4A01SMO9Lg+5jnp9aoM+tnawo/fKWpFT/rfneKl0kLfhx0yNM6mF7H0lT6h6zavLAVCgm95I3f9CmxHGieGN2fJSCDKhPHn1tB2kHKTpGcUF82nx3uf29gDSUwUTyEXTsyh+m3WfHKCJS9OKVRJeSfJIrtB5P+1ySx5fzZcIJTVlQxdfKgR2dIRt4wWInwY3iyBKsiWFtFhXkecqHLxjB7KNGwf0OwDltpLn4thRtfwq3N5Sj5/Kp+x2q1A+eLO+PHjxzWrSwxnigQU6Q4e+pkILEwHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199015)(26005)(2616005)(6512007)(186003)(31686004)(86362001)(31696002)(36756003)(38100700002)(316002)(6916009)(54906003)(2906002)(41300700001)(4326008)(66946007)(8936002)(5660300002)(8676002)(66476007)(478600001)(6486002)(66556008)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnQ5OXhFQzZkRXdiTFJKaytlQVdQTGowSXBwbXlIclNNN2xJWituYnpJZ3B3?=
 =?utf-8?B?emsyTmcycVlFLzd1eGNndXVkenpRYkdEUnhjVEUwclVQOGtrdFQ0dzAxNnVm?=
 =?utf-8?B?V3J3Y2laenpaRExtYVgzajVJL21EQnJaRUNoWHg3L3p0ZUFyMnRlM3hJMWp1?=
 =?utf-8?B?SXN2KzBPRUF6Q1pCZVdKK0JocVBpY0Q2Mm5Jc056K2RSazRpdmRacEJpRXg1?=
 =?utf-8?B?OFhxaFMxN2dGa1ZtU281bG1Sb29Cck9kcUZsaFZoREE3anY3VGE2NzNtSENU?=
 =?utf-8?B?bVZicXNsMEFGSnNaSS8rVFc1WjBoUmh2TnR6VGFvcU5vUXUyMEE2WHJHWlBU?=
 =?utf-8?B?cUd0NERNSHpueWUwekpmTFlNZFRSS1k1TXFUSXMySGxZdnlybGNvZVp4NDVu?=
 =?utf-8?B?UGtOVXVHUFkwQlJIdmtrNjB0cG5xQXZtRUZCN2l4WTVCVHZ2TTgrRkM0alRu?=
 =?utf-8?B?UDNHcXZkcmhWd004SU1CdnR1NVNwMUl3dlV4b3VoNTVodTZMQ0dqWS85ZDVt?=
 =?utf-8?B?NFRGWitDRStMOWZsQUdOblIxWUt6ZVp0OXJjTHZibEVaVzh4OE1zMlQwU1BC?=
 =?utf-8?B?OEprYlp4bXF0RmNvcWF4MkNLMVdaZnR5Wlh1My9vS2U4WGRXbHBLWGJoQThZ?=
 =?utf-8?B?WCtUVVZxOUxhOHlKTC9IeTdJanhPa2h5ZE04Z3JwT1hMZTZoai9UakdJRTZQ?=
 =?utf-8?B?dTlSclQyQm1LZURoaVpzSkVObkxSV2pQR3RzMmQwWUpQY3gwaks5am43TklY?=
 =?utf-8?B?RzFNZFFzcmJMN08rYWd3V1NucHpJa3JkSGUzblB4QitGcUIxaUlheTBnNUZC?=
 =?utf-8?B?bXVKVjZaUGwwdkR2UW90Wm5MWWJnQk14bTVpak40bVpsa25lZ3EvOUtUV0ox?=
 =?utf-8?B?akZYQTVMSkF0anVua3dzUTRhd01KMmRlMjdDdVNkekRrem5sWmJVOXhpUnZY?=
 =?utf-8?B?eDBaSTNzR0VMc1FSdEQzdkR6N25ReEpZdW5oaEcvR1BIWWNxVGRFa1N5TWMw?=
 =?utf-8?B?cWpLNjhLZy9SYjB2d2I2VTJWT1FQK1lZRlNxRm5CcUc1OEVyTEQxMzEwYytk?=
 =?utf-8?B?N1pyRm82RW9MRDdxbUd3M3grM1IyUWdHRDg3MEkvSjMya2RrZVkySk9pc1RI?=
 =?utf-8?B?YmJ5bDlNaGQ3RVZRczB6MXk0SFM3TlhZeTFES0tiUEViSS9naGNIWE5hdTZZ?=
 =?utf-8?B?d2lPRVNBSUR0QlBnczRjYVhiZXNmQjk0SFhlNDdudmkxSEdoNGc3amUxRFZp?=
 =?utf-8?B?OCtjYVJaUEFQQjlORHlQN2RVdHE4bUl2djMyWHc1cUY5VHZpUUxGWUFZSjV3?=
 =?utf-8?B?NHpRaU9PRWZLRkJPMS9EbWpnNGlRUEdZYUw3OEUvRjV6VWN0NUFPbURPSm4x?=
 =?utf-8?B?TUZiOG95MUtEb3EvZU1Cd2U0bUVLUFlGaXhNYzB3UXgxQW16dzk3T1lzaGFK?=
 =?utf-8?B?Y1RFUDhKOTlzbnYvRmdMY3ptZkN1enJ5R2N5WmNpKzBROTFnQWltUHdFVFhu?=
 =?utf-8?B?S1pUL2xwS1NkRnZOWEMzVVp5MUh1RHovcXpWMEdtOXFBVEs1MVJtR2lEakRs?=
 =?utf-8?B?bEYzYXJXemJ0VjFxZVQ1dEJ4Q0lDTzZrOVc3cFF6WFdPYlhRZ3pZVG1OZ2U2?=
 =?utf-8?B?MjBuTVFuN0t2RXV2TXpWVk5oQXBnbTIwS3lZcjJRZzFIMXJrZ3llRDhDQjVX?=
 =?utf-8?B?ZzhpZUFsK1pCcDRaenVIZTM2RExUUEk5b1hKQjFIandnSi9JRkxCQVFSc0Jh?=
 =?utf-8?B?YU9JNzAwQVphejZnYUJKd2NiWW9IeXM5bXZuUFJ1ek5maC9jS2hER1B5MGdl?=
 =?utf-8?B?VjhtZ2V1bllzdEtGbVMzL0dXOW9Zdis2dnE5K1F4WnU1aU1aNnNyNjJtSmdI?=
 =?utf-8?B?VE9QenllM2hPSlhIMG51Ri8vdmF0eU03NEVjRVVhLzVCWXpXS1FiMURmdlow?=
 =?utf-8?B?aWtuMDlGUUZVSjVJeWd1bnFRL1JIbXo5d3phRDIxQk9XS3pWdFJpdFllQlRM?=
 =?utf-8?B?aWV2UWdYUlZDZUJRLy90U0l1YmxXOHpJQlYvdmFRNU9CNC9RS3N3Vk5LRkxk?=
 =?utf-8?B?dlNjaTlyTGtpWjRjRy9IVmpGZDJxbkxMZEtOWFpPbGgyR3pTZWhNSnY0Y0FM?=
 =?utf-8?Q?e/cMS6grRiLS5eNutA6SVGzGA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49f8969-8513-4cbb-e33b-08daeef2857f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 07:57:41.6999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0h4Hsz3EAHq1BFz+A73zKaLfpIH1565Nws3qTHJXO7E/S1+SxLUPq7a0oCbQzO73AgiDMAr7427rL/GSjkrhHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7191

On 04.01.2023 20:55, Andrew Cooper wrote:
> On 04/01/2023 4:40 pm, Jan Beulich wrote:
>> On 03.01.2023 21:09, Andrew Cooper wrote:
>>> A split in virtual address space is only applicable for x86 PV guests.
>>> Furthermore, the information returned for x86 64bit PV guests is wrong.
>>>
>>> Explain the problem in version.h, stating the other information that PV guests
>>> need to know.
>>>
>>> For 64bit PV guests, and all non-x86-PV guests, return 0, which is strictly
>>> less wrong than the values currently returned.
>> I disagree for the 64-bit part of this. Seeing Linux'es exposure of the
>> value in sysfs I even wonder whether we can change this like you do for
>> HVM. Who knows what is being inferred from the value, and by whom.
> 
> Linux's sysfs ABI isn't relevant to us here.  The sysfs ABI says it
> reports what the hypervisor presents, not that it will be a nonzero number.

It effectively reports the hypervisor (virtual) base address there. How
can we not care if something (kexec would come to mind) would be using
it for whatever purpose. And thinking of it, the tool stack has uses,
too. Assuming you audited them, did you consider removing dead uses in
a prereq patch (and discuss the effects on live ones in the description)?

>>> --- a/xen/include/public/version.h
>>> +++ b/xen/include/public/version.h
>>> @@ -42,6 +42,26 @@ typedef char xen_capabilities_info_t[1024];
>>>  typedef char xen_changeset_info_t[64];
>>>  #define XEN_CHANGESET_INFO_LEN (sizeof(xen_changeset_info_t))
>>>  
>>> +/*
>>> + * This API is problematic.
>>> + *
>>> + * It is only applicable to guests which share pagetables with Xen (x86 PV
>>> + * guests), and is supposed to identify the virtual address split between
>>> + * guest kernel and Xen.
>>> + *
>>> + * For 32bit PV guests, it mostly does this, but the caller needs to know that
>>> + * Xen lives between the split and 4G.
>>> + *
>>> + * For 64bit PV guests, Xen lives at the bottom of the upper canonical range.
>>> + * This previously returned the start of the upper canonical range (which is
>>> + * the userspace/Xen split), not the Xen/kernel split (which is 8TB further
>>> + * on).  This now returns 0 because the old number wasn't correct, and
>>> + * changing it to anything else would be even worse.
>> Whether the guest runs user mode code in the low or high half (or in yet
>> another way of splitting) isn't really dictated by the PV ABI, is it?
> 
> No, but given a choice of reporting the thing which is an architectural
> boundary, or the one which is the actual split between the two adjacent
> ranges, reporting the architectural boundary is clearly the unhelpful thing.

Hmm. To properly parallel the 32-bit variant, a [start,end] range would need
exposing for 64-bit, rather than exposing nothing. Not the least because ...

>>  So
>> whether the value is "wrong" is entirely unclear. Instead ...
>>
>>> + * For all guest types using hardware virt extentions, Xen is not mapped into
>>> + * the guest kernel virtual address space.  This now return 0, where it
>>> + * previously returned unrelated data.
>>> + */
>>>  #define XENVER_platform_parameters 5
>>>  struct xen_platform_parameters {
>>>      xen_ulong_t virt_start;
>> ... the field name tells me that all that is being conveyed is the virtual
>> address of where the hypervisor area starts.
> 
> IMO, it doesn't matter what the name of the field is.  It dates from the
> days when 32bit PV was the only type of guest.
> 
> 32bit PV guests really do have a variable split, so the guest kernel
> really does need to get this value from Xen.
> 
> The split for 64bit PV guests is compile-time constant, hence why 64bit
> PV kernels don't care.

... once we get to run Xen in 5-level mode, 4-level PV guests could also
gain a variable split: Like for 32-bit guests now, only the r/o M2P would
need to live in that area, and this may well occupy less than the full
range presently reserved for the hypervisor.

> For compat HVM, it happens to pick up the -1 from:
> 
> #ifdef CONFIG_PV32
>     HYPERVISOR_COMPAT_VIRT_START(d) =
>         is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
> #endif
> 
> in arch_domain_create(), whereas for non-compat HVM, it gets a number in
> an address space it has no connection to in the slightest.  ARM guests
> end up getting XEN_VIRT_START (== 2M) handed back, but this absolutely
> an internal detail that guests have no business knowing.

Well, okay, this looks to be good enough an argument to make the adjustment
you propose for !PV guests.

> The only reason I'm not issuing an XSA for this is because we don't have
> any pretence of KASLR in Xen.  Pretty much every other kernel gets CVEs
> for infoleaks like this.
> 
> We feasibly could do KASLR in !PV builds, at which point this would
> qualify for an XSA.

I would question that, but I can see your view as one possible one.

Jan

