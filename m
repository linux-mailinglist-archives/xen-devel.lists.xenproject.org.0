Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B31722096
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 10:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543549.848621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q65H3-0007dn-TD; Mon, 05 Jun 2023 08:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543549.848621; Mon, 05 Jun 2023 08:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q65H3-0007bW-QT; Mon, 05 Jun 2023 08:09:09 +0000
Received: by outflank-mailman (input) for mailman id 543549;
 Mon, 05 Jun 2023 08:09:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+s6H=BZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q65H2-0007bK-Kb
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 08:09:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e4960f0-0378-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 10:09:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8415.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 08:09:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 08:08:57 +0000
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
X-Inumbo-ID: 3e4960f0-0378-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktlHnLijpgGuec2FuyIdbj8CkIomovulfJ9YDFtXNs4Tfze7vvkGcOSHeF1RUB/D0+GjopCp5Ed/lwDQX7rh7ZWBkq1cnZ3gopkPWco8dLZkTnHz3LS/T+Q1ZRUVBKS1TcXpP7luOfRR8GSlaZxiDVzdBxpbF0rbLU6jhKViMzwydXvnvVELO/hWMkHovA9yepghuaJD/zqmgJK8qOypDIOPp1eguOHUQZH20zW5W5WQYDSzQfLfgQzyW2dSwugJ5sjv2bZQ+CnnpHU5Cijmlfl0YUam54dQA5yM3OXZCdZ/mgw/+w+EjyIQuGuQwJXk7TR0y/EZ19+xamWR1VyeDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opDx5UTKhOXq/hXoj1gMxO5LzzqCu++1K1Q+ZpTilCU=;
 b=hxW4K/GiionY5ilDsXVU3K5e6nlkwXvVKz7MsquShYzO2IhoSZ+zxNu1LNMiDcxOXAJHqiuz0cin+dLs+i6mrj76PFdg5dHpdeLLTliZB1uJiU7TCxmpM/a0OQ87Zo/TAdOEIfgGJ4R9em7lrg3Vn+aBcdALGivSd+SkLNnrOy1aqUGsHcS46ruh+fSwB1LuOw1x4DVY8UUc4jRmQisfQqgewm1QUxHG+VhJymuxCc0SqIu8TNEs0TN141D4NiAMh3FtjeuapfJexFx2Z8WefTX8jDV0fjxeSDNTr49/sn3cDEAcO+fm+g09KB3xI433NHInJX0zgy8OoZuXlGR+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opDx5UTKhOXq/hXoj1gMxO5LzzqCu++1K1Q+ZpTilCU=;
 b=o3PHUQS6pfY7RyAavHC1w1pAsdxJJCT841PeQC8yvIC47clfjPLf1wn7YHbsO+yCBwXJ4FDXgrcz8EwWbrKPOtBQjvxVLO8X/ZWK1h/ZKcpBn0r92q09ojt+z9sVWSciMchvCucfBC4UVBnp3emQOmgsuO2R6TBVgR39NQYp1uQqut353bL/TD+1qmaASkGBco/sw9wm0lfphj/i2+dPLDE1d1WlXLmpcEDlHNwHZ2uYpC2JzqrmF37llj/owQtg16hpxO7rFBXrS+bW83yXKwkCrpNH5DbsHq7S8twmoxGWL5Ns3lmfg8jN3Q7YX8x+t7pVRLp3vP/52xMcOe/+kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3aa0da8b-1bff-75a0-9806-44fe0375e7a5@suse.com>
Date: Mon, 5 Jun 2023 10:08:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 3/3] x86/cpu-policy: Derive RSBA/RRSBA for guest
 policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
 <20230601144845.1554589-4-andrew.cooper3@citrix.com>
 <1ce6bd53-089e-e8ab-3b54-2720a3fd2c12@suse.com>
 <bd03669c-66be-a64a-e73f-a80f372a6484@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bd03669c-66be-a64a-e73f-a80f372a6484@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d2c458-1021-4569-2388-08db659c1ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n0DG5e3l/AKpvdOp2FgH1HJcgJPyBs7mNPlAk2SL1oRrKa1yCNxr/gPJ1trOd/lG3Xka3/JX4+acwDPkS7fEIdaDj0orWTbyrb7Qsq/xga84AH6ZQuOt020G+QPVyfcU7EmZJXvCeEL/qy/U1QluBXtVeQQo6yifC9DZVnr9sMvonxtZkGLCXXnlZLsQPjG5lA07LbOnY/cszYyb76HZO2TbJWW1tdd/FOJIi0ohNq5wB+vnu7WDYlA5h3opROWEc0Quhdzl+WwJhsh8Kbz5aQpwG1Plc3DRG1jHi8iZyBd1rwHrxIaGQcZF7kXuGde4eYu0AtSF0Eucf5xEaMozyvbubc5EW3/NJFUZ80x3Uy7Hk9rVf1NXtQOKQQN5vtotO7giogy5akM56WGcH/LhSrUOmjr+xiKw6frcbKUn41n99NBcLpGW7xJZ264cLEEk9Cv9hFrfwpEK179FbWAfmK6oImaPIo9eCs5U+s3qpIw7Q1P13aRbvk8k0S3ULz+2oF1DGr74iLX77t0jyxmHtcrHVVhwFRhsvIKuUqx5l20SCXbIhao25ZMCFZbf+sPQ/HJIB91nDPzeUkwZn8KVKKCtZdzDuYFuMrtnBakSpJtW9SK79aEsW3KioVnMvSMTO7D6JSRc/a+7Nkp1FPngXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199021)(36756003)(54906003)(2906002)(31696002)(478600001)(86362001)(38100700002)(41300700001)(8936002)(8676002)(5660300002)(316002)(4326008)(6916009)(66556008)(66476007)(31686004)(83380400001)(66946007)(2616005)(6512007)(6506007)(53546011)(26005)(186003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTVodzFrN0ljYVg1RytLRFIrSk9QVXRSb2R5QlF0M25QQ0pZaHh0L0ZPYU5q?=
 =?utf-8?B?V2pNZjVmelNXalZNTXExWnRoU0IzYjNhSEhEWFV4UHpUOTZXV0o4b0RXRkF4?=
 =?utf-8?B?Q2VpcGVYbWZLRWlnbUI4bHIrK2pIWnlML0FLaWIxNmQxUnVNSFZxdG9Jd3RP?=
 =?utf-8?B?QjNsR0JiNkJuN01ET0orSzViSng2c2Y0Qm5xaW90b1FuTStwRWNJVjFzeEUx?=
 =?utf-8?B?OERxa0hudEFJbkc3dzNSamlTL1VhTWhQSXY2UG1uaEpIU3Z3M2w3YUs1QzZh?=
 =?utf-8?B?dmtRNzdSTGJKNkFtaWVjaVQ0MXkybTAwRE1tNkswSS82Nnl2RnA1YXY2U1BH?=
 =?utf-8?B?MHc2eEtabXJsOHVMbkRPSDBtWk83TUtYRVphWkRaQk9aY3ZpM1JjREkvYk01?=
 =?utf-8?B?MlF0V3JMWTJjWDZVQTdybkttTXFieVhUOUZ6dHQ3K2k5WkNJUS9HMlhrbDcr?=
 =?utf-8?B?ektPejlOUzFXSCtPclMzR0JibTZZbVhuZ2wreTdVWFNGRElxS3dHYlVCU1hp?=
 =?utf-8?B?TFV1emZHN2RNekFJckd5dTZma2FKVEI5bFkvdTRWQi8wMTFOV3Q1V2tBZ2hm?=
 =?utf-8?B?UVFSRTkzUDdjTDNkM3Z5OXJralB4Nmw5NFVRMFdBVnNaM2Y4clVHejl5K0xX?=
 =?utf-8?B?Y2NlUG5uRGpxcWF1SXdPbHdocUNCZ2VrZzYyZU5RNEhXZXFNaWwwajQwL2ZO?=
 =?utf-8?B?Qml4NHBhMkg0ZVg4T3pmZUZCaVdaWllIZmJMSSsvNEI0RVlzbnpPNmtVa2Ry?=
 =?utf-8?B?a20yRGRCd20veUlFL0RwY3Qvemc5cGRrLzk3VllIbnMrK2dQUHRlV1VsazNS?=
 =?utf-8?B?QmtETVk5UUNPek0vMkgwd25EbVhra3A3b2R1YkF5WXd6MmFLOVRhUWtEZ00v?=
 =?utf-8?B?YjI0cUl3Q3orYzJQVzJSaSs0ZDZzT0VaVlp5azdIWTJ3RmJoVXY5MWpUR0dQ?=
 =?utf-8?B?L3dHMWp5RjJJc3E4R0o0ejNYRERBV29abkhlRy8xVWF1RmczTlFlamdaVzdp?=
 =?utf-8?B?WVJVd3NFVmJtUStQMHNpQTNueXNxdTVWUDNtb0RSMHlJR0JLeVh5UVR6MndQ?=
 =?utf-8?B?ZU1rUU9UVkp2N3BVUjdMR2FWY29EdWVZNVRWVzJXZmhkMzlkSjk5THlNV0Ur?=
 =?utf-8?B?cTZ1Z3dyWGk3YlFJaC9LS1BRK1JZWVUxY2hGU25vd3A2OHhmeDJBSUZPNmNs?=
 =?utf-8?B?Z0QxMWFlOSs2QmZrV29CT2VpQ0pyUnJGcDh2c051UVZtZmk5ZHZ2U1ZKdFZ0?=
 =?utf-8?B?N09mN1BrVnV2aVY1WERWVEwzYUNqMzZxV0d4VS9LSDV6SlkrSUdXclBKRjlK?=
 =?utf-8?B?ZUM4c0FaZHhEdkFXV0tNVEhFV3B4djFKNmFaS0FkY3MvbTg5NjlZNG5vTGZy?=
 =?utf-8?B?dUtHdzdxdDdZY253V3RQYXk0OEJFbGU5RUU3eWdpc20yWjY0bHZLUnkrRVRq?=
 =?utf-8?B?M0lpTmlSZk9Hcy9OK1NFUGxSYmxCQ0ZBYncxZHYyWTBxTElhQkw4cmIwUit3?=
 =?utf-8?B?REhYS1Y2SjhpMjBZemR1ZlNwWXhHOEtVUTArYkFRWkQyeG94WUhFdjg3V3oy?=
 =?utf-8?B?YUtSTEhSQjR1UlpTTllwaUxYU0htZ2hIc0s5SWZDcFNWSXpVS3luYkw2Uzdx?=
 =?utf-8?B?aVNEY3FkY0FkTTh5U09hOVVjMjdyenRrdmJPcXNTeGcxZnVHMmxsYm9FeE13?=
 =?utf-8?B?R2ZwYmJ6YTZPUkhMM0t5U00zQUdVKzRjaEZ0c0NNWG5ITWUybFBCczkwUjVz?=
 =?utf-8?B?cys1Ym56dkxmKzliVG9ZQ0RxK0lCNXJlQzR5TmExaDJzYU5FaU5jQkRkTGNz?=
 =?utf-8?B?aTFQWmgwOHU3VU1Jb0o3ZDBOQW9oUk1paTh5Y2ZiQmQ1eTU0Qlp4a0JzVzZV?=
 =?utf-8?B?eFJRZmoxTEpJdGM5WmZZa0lmYlRUWjVoN1JPWTdFeFNmNmY5dWNkL1ZERkxW?=
 =?utf-8?B?QUJzMWxUS3dzOHZ4S1ZwTXQyK2RUVU5TZUs1VXlaRFdJR0loUHdBU3M2Tllq?=
 =?utf-8?B?VlgvOTRJWG5wZ2FacmdVbU1seGc1MzB1TWJseG9aMzI3ejlZRUpOZkJKd00x?=
 =?utf-8?B?NlZhMGYraTUzV3FwTEExaG9zUXNDZlgxYjdPQzNYRG44aTlsK2RZSzVLMGJS?=
 =?utf-8?Q?iWOhWtkCrqq1tLl2uirE4QTN/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d2c458-1021-4569-2388-08db659c1ca2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 08:08:57.6084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ah9dFVvEKnheyuA3b5fiILXBwxkUfc8Y85lz2nJ9E5UYjrv6K17WA06r6BZ7HNFWm8XUXYXZT8TubbEguqtiZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8415

On 02.06.2023 17:29, Andrew Cooper wrote:
> On 02/06/2023 11:20 am, Jan Beulich wrote:
>> On 01.06.2023 16:48, Andrew Cooper wrote:
>>> @@ -786,6 +825,20 @@ void recalculate_cpuid_policy(struct domain *d)
>>>  
>>>      sanitise_featureset(fs);
>>>  
>>> +    /*
>>> +     * If the host suffers from RSBA of any form, and the guest can see
>>> +     * MSR_ARCH_CAPS, reflect the appropriate RSBA/RRSBA property to the guest
>>> +     * depending on the visibility of eIBRS.
>>> +     */
>>> +    if ( test_bit(X86_FEATURE_ARCH_CAPS, fs) &&
>>> +         (cpu_has_rsba || cpu_has_rrsba) )
>>> +    {
>>> +        bool eibrs = test_bit(X86_FEATURE_EIBRS, fs);
>>> +
>>> +        __set_bit(eibrs ? X86_FEATURE_RRSBA
>>> +                        : X86_FEATURE_RSBA, fs);
>>> +    }
>> Now that we have the same code and comment even a 3rd time, surely this
>> wants to be put in a helper?
> 
> I did consider that, and chose not to in this case.
> 
> One of these is going to disappear again in due course, when we start
> handing errors back to the toolstack instead of fixing up behind it.
> 
> The requirement to be after sanitise_featureset() is critically
> important here for safety, and out-of-lining makes that connection less
> obvious.
> 
> I considered having guest_common_default_late_feature_adjustments(), but
> that name is getting silly and it's already somewhat hard to navigate.

Well, okay then. But may I then please ask that the three instances each
cross-reference one another, so touching one will stand a chance of the
others also being touched?

>> Similarly what about a tool stack (and ultimately admin) request setting
>> both RSBA and RRSBA? Wouldn't we better clear the respectively wrong bit
>> then? People may do this in their guest configs "just to be on the safe
>> side" (once expressing this in guest configs is possible, of course),
>> and due to the max policies having both bits set this also won't occur
>> "automatically".
> 
> The only reason this series doesn't have a final patch turning
> ARCH_CAPS's "a" into "A" is because libxl can't currently operate these
> bits at all, let alone safely.  Roger is kindly looking into that side
> of things.
> 
> It is an error to be modifying bits behind the toolstack's back to start
> with.  We get away with it previously because hiding bits that the
> toolstack thinks the guest saw is goes in the safe direction WRT
> migrate.  But no more with the semantics of RSBA/RRSBA.
> 
> I explicitly don't care about people wanting to set RSBA && RRSBA "just
> in case" - this is too complicated already.  The only non-default thing
> an admin needs to be able to express is +rsba,-eibrs,-rrsba to mean
> "please be compatible with pre-EIBRS hardware".  (In reality, there will
> also need to be some FOO_NO bits taken out too, depending on the CPUs in
> question.)

Not caring about such people would mean documenting very clearly that the
two bits used together is not supported (and then also their respective
invalid combinations with EIBRS). Otherwise I'm afraid "such people" would
likely include one of our bigger customers.

Jan

