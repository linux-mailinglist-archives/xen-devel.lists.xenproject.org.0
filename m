Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA723F615E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 17:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171582.313090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIY90-0006eK-BN; Tue, 24 Aug 2021 15:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171582.313090; Tue, 24 Aug 2021 15:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIY90-0006bW-8K; Tue, 24 Aug 2021 15:15:18 +0000
Received: by outflank-mailman (input) for mailman id 171582;
 Tue, 24 Aug 2021 15:15:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIY8y-0006bQ-8j
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 15:15:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9dafa9ce-cafc-4ac3-ab47-efe02ebf703b;
 Tue, 24 Aug 2021 15:15:15 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-9cKKHHLMORS-EA8MPVfy6g-1; Tue, 24 Aug 2021 17:15:12 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR0402MB3457.eurprd04.prod.outlook.com (2603:10a6:208:24::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 15:15:11 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 15:15:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0137.eurprd02.prod.outlook.com (2603:10a6:20b:28c::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 15:15:10 +0000
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
X-Inumbo-ID: 9dafa9ce-cafc-4ac3-ab47-efe02ebf703b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629818114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4F9+wtlWc6gzCQ12nWa1Lr6tWg8Uq6BYZncj66fcBvQ=;
	b=gCfht5BHvlgDAGyUtwVqMiDmRfj6aj2w3EPCpwxJ8GEXPJDZNYSwZDtbRDCVJdVgpNKJj0
	OnANvNziK6rc4+wKMSsBrlyZLNQW3zR8q5NvOpDF+RflpNL7/9U8wWhgsEbo7Diuuk3ybP
	3FWvQMQEU4wbPS8gFQS8REP1Mdpj534=
X-MC-Unique: 9cKKHHLMORS-EA8MPVfy6g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dm3Rk7dbRYCZ5elJCHd0PeEXdgflTGayJDrKAhLh5bbiODkrLuR8INtdXAhCG/LGPbvGHXaFmNCzXsB/K2qsyMuD+LTOIqA5HfvnPlT11mCPCXAJ8m+SEyIU9b/35rGyTBx7Nfgj/AUDN9leV/4y7AHBq+eXrXuzg8r5cJs75ZQUC41X7nHjYTVkOHmqj5w17tpLfBHITaZPx3r0aom5Ud+E7Abr2RbnpNi8/fG5WMHCP1Ge5WBaRifSGcjxiCs2cmCLFHTzj0FwWShmjkS3+hzfn/Tx+kcRmgvLWrXQW6s8CdoU293VyrWGA4olFpeqSGaJB3QEXN2RTwJDS8bsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuS99CRn7YeJd8GNv75Es8p1OswvHb7nNq/zIRRWXZE=;
 b=AZfbye+wzK7NdQa/Cvn+uFt7XYlbsdzcZyYJ/uUu1MQPYEFtjQQDG3Jhy1Niyb4RbucBctgn44XHi2VrfVPwj/3mC+Qan9ag+ixBEQFIReGIBF/1wPrg51alD3xlwEM8ohsllnaxHgVjea0zuezPuTiQH2mML3ROkamnZymivWm087lLtiHFLUxq1dVrNQI/xGoR+OEALQvBG5lQ++O+w79jrzFLt8xvuJ31yfbXN3LuIGsqO1xuE0fH5ZAQRxR203LTWIEPRBlALNx7NW92BiJ0AWcvOnh4L75h0vGsiF6QVIZ7zqkOxfbTJJEi4Du55JyJQzL7PIOTCAZe7vWXnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/3] x86/amd: Enumeration for speculative features/hints
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210817143006.2821-1-andrew.cooper3@citrix.com>
 <20210817143006.2821-3-andrew.cooper3@citrix.com>
 <606ce242-65d9-2180-8330-525fe5ec5562@suse.com>
 <351b2066-d01f-16d2-f1a0-bd7e2fe0965a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <968441f7-cf76-c98d-b256-18416ceca3bc@suse.com>
Date: Tue, 24 Aug 2021 17:15:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <351b2066-d01f-16d2-f1a0-bd7e2fe0965a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0137.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::34) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39ff595d-1cbd-47d1-3785-08d96711f713
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3457:
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB34574D4484A9A628DC264CE5B3C59@AM0PR0402MB3457.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dCk/vWaCRq68YurXXjEDB3q9Pv8h2EFfI9sdFiV51jo2mPYF6Ob2iyr3xb4Bb3MD4+rBoSfl50XJqCwuI9ZvKqKKBQ6rE62hIaCyBV2yoMQvDvmL1YRvrdPXL9+dWDz/rnvmdi7Nekmo1rJi4VHJPxAUoQrHyWvyfkNVAwkaXZfhEWPOY0zgHd+Lbf5XkUtXfssMXFidF7q7B6t7eE4mEZHOrh5Cd5smZKOJ3IDLRgm9bp3C7UCHsQDhY/H60NQb68r7WNmzvFQbVFK4F4pIlHmL0Uq+LP8eBRMNQGFRS9joz0UulCAjh8+fwTNzTfNQz9m0Yk9iWte/uRe3ZyDBIaGuQwvolsoiebRN3zaexIwiFmwoYxk1b+ryjsK2PzjCkqoN+VBxiLsC6wikKPMWlLI60hW1GKJgWFBa7y/y0rTo3IES7iwVLza7Dt4n71NT5YXXWwlwKAj+Pqda/0RfCy6dTHuRfBhBO5o+fC6uBsV/xEPnuiFqNFu3RUCec/rRGhD/1o9DlKfJ4w44LbsOFdv0RsM0Cbpvrb8yzPFiRb2mipMMkhtPoM1/knVXvVBjLvuBYK4CG/bqg8MpEoWqltZElNH8JIm/R+qQcUIJbX0ikg5/+/XrMn2oO/juR6xm96aePkB/S/eYH0fNWN3pcYs9wDcaeBL1s2RBaLEc1HJJXo64evyRQeD4w1R1Znn6G/FVboAYHVkPLYuKZzRIHVXzi0gPkkcppqywFU76lTY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(396003)(136003)(366004)(346002)(38100700002)(26005)(53546011)(186003)(478600001)(16576012)(83380400001)(316002)(54906003)(8676002)(66556008)(2906002)(66476007)(66946007)(4326008)(6916009)(86362001)(5660300002)(31696002)(6486002)(8936002)(31686004)(2616005)(956004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LCP+ZCGiIdMQjplK219WPOibDkSqYfvQ23ABEUSiNlpR9h82W24ePTwH5Qgl?=
 =?us-ascii?Q?tRfyVIv+cKXGRBvhoziXRKKp8+YtJ31B2Ae659eVaOmT93PcEdOFaYyJ/7SU?=
 =?us-ascii?Q?PpbfuCaYiCRqNrsSBKE4f1hC3n9pZk3lXvMvij817KGROGoaUUGt4TvhOVUH?=
 =?us-ascii?Q?Ymr+eTHbXrXQG8xk5Erq3k2fE4xYN8oXNzk6o7wtIwoBgB+ha0U9j/jWmtpz?=
 =?us-ascii?Q?ahIEWfyJHvUZajYuYAL7H656PAQJiv7/D8bY8Uk7QxzMHfC59GQhzLmL2JDT?=
 =?us-ascii?Q?CcerxHMrNg39j/1+vpzCBKzEgqOY6M4/fyb1gI7fvSkR24lwMTvCMBnqR+8n?=
 =?us-ascii?Q?idVuu6n4TVaB4N6tXcPcT5QwE/TrlVXR/i2Z5uiCSymq21xfwFIfP54RPWJY?=
 =?us-ascii?Q?OxVXGfrZCz/seo2WbA7HmnLn01AaoQyGmW/aBI59MFforqV8BSL6JqjVzZ2M?=
 =?us-ascii?Q?GvZSssfzjeylVHYJMmCnOJ8ctWvfr6drvZ5FWezpgVRwzplN8NlJ30RXLrzu?=
 =?us-ascii?Q?cqYBBWdsxI9JolDYSdTkOU8D50vcrANp4WDdnqh58ZvcNlP7j8oF1TgyQjrl?=
 =?us-ascii?Q?Z3ogU5cpNzxRkWPgkEo5OG9z58D4vy6IR5iLBkYKgz8mlU8F1fm2jgj/VIO6?=
 =?us-ascii?Q?kCyPD0p87651HDXXnAnxWYZrZDKuwMihvLSKrNigfkFJofF+QWmh0KC6ypPB?=
 =?us-ascii?Q?Fxa78u9+SXOSYOFDGuPySKfLGVtFOZGoI3trWTrwX0FtcYSYpjF8SJYPegVI?=
 =?us-ascii?Q?LE96Hc0uAJbBzS4DBROShuPypKq9ifGWaDziohvrxBq7r0gT2AtDQQ5nL95E?=
 =?us-ascii?Q?Rxf2II6m/9ymdoO1A5CncdagV+cNzYMH9KbeZ2V0WnHVI2UDy822to/6VA1/?=
 =?us-ascii?Q?tn8QGwpOZA/91w83gEru6mC2l7bSLkf4r4yT9RCyrLI7WMyV0gJyZzmc5wfV?=
 =?us-ascii?Q?VZ3oddvVtlvbTV1ncsmXoWnA9OFhkH9ua7VLlpZnyPc1f8Q1oEvKIFDwUMIx?=
 =?us-ascii?Q?rgeWjv1X3LTVZlheabIBC/Zxb69trgQU10sX1v7Igv7mgtgWEmlPiid5mAUq?=
 =?us-ascii?Q?S4xrcIXj4B2sA5/85mWoEDIKe/d7nnMzVCbsjfo0755GBhLPVxkhUOxAmnvV?=
 =?us-ascii?Q?Nkbr8qQWFPs7dvpzWpxI7ejapoNXAPrYc5hB0AFdrcXMFcM7YAPUM4G057NK?=
 =?us-ascii?Q?App4LrW8KjYbrYDZXZUAzPlQlpACzbVvHSnIaABB9RQUM7tdwfvH8okAfqHM?=
 =?us-ascii?Q?WyZwxhiYAobT4wSNbiNQVDRavUfNvN7GsiqC83KuBW0NLL+urj0uD7wjDysM?=
 =?us-ascii?Q?IiBONRtNZdzpNL8NR9pbC3xd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ff595d-1cbd-47d1-3785-08d96711f713
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 15:15:10.8531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75C1kWAFZ3TnVbavF+7DbmRC8S4JbkQA1HX1c+7GyvR1gAk4nRlUkLyrHIuOaGOu7jpgHPFYIXhSbwv2y6Ljqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3457

On 24.08.2021 15:26, Andrew Cooper wrote:
> On 19/08/2021 15:47, Jan Beulich wrote:
>> On 17.08.2021 16:30, Andrew Cooper wrote:
>>> There is a step change in speculation protections between the Zen1 and =
Zen2
>>> microarchitectures.
>>>
>>> Zen1 and older have no special support.  Control bits in non-architectu=
ral
>>> MSRs are used to make lfence be dispatch-serialising (Spectre v1), and =
to
>>> disable Memory Disambiguation (Speculative Store Bypass).  IBPB was
>>> retrofitted in a microcode update, and software methods are required fo=
r
>>> Spectre v2 protections.
>>>
>>> Because the bit controlling Memory Disambiguation is model specific,
>>> hypervisors are expected to expose a MSR_VIRT_SPEC_CTRL interface which
>>> abstracts the model specific details.
>>>
>>> Zen2 and later implement the MSR_SPEC_CTRL interface in hardware, and
>>> virtualise the interface for HVM guests to use.  A number of hint bits =
are
>>> specified too to help guide OS software to the most efficient mitigatio=
n
>>> strategy.
>>>
>>> Zen3 introduced a new feature, Predictive Store Forwarding, along with =
a
>>> control to disable it in sensitive code.
>>>
>>> Add CPUID and VMCB details for all the new functionality.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with one suggestion:
>>
>>> --- a/tools/libs/light/libxl_cpuid.c
>>> +++ b/tools/libs/light/libxl_cpuid.c
>>> @@ -274,8 +274,18 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_li=
st *cpuid, const char* str)
>>>          {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
>>>          {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
>>>          {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
>>> +        {"ibrs",         0x80000008, NA, CPUID_REG_EBX, 14,  1},
>>> +        {"amd-stibp",    0x80000008, NA, CPUID_REG_EBX, 15,  1},
>>> +        {"ibrs-always",  0x80000008, NA, CPUID_REG_EBX, 16,  1},
>>> +        {"stibp-always", 0x80000008, NA, CPUID_REG_EBX, 17,  1},
>>> +        {"ibrs-fast",    0x80000008, NA, CPUID_REG_EBX, 18,  1},
>>> +        {"ibrs-same-mode", 0x80000008, NA, CPUID_REG_EBX, 19,  1},
>> Here and below, how about dropping the "mode" part of the name?
>> I can't seem to be able to think of any other "same" that could
>> possibly apply here.
>=20
> ibrs-same is very ambiguous.

I'm curious as to why you think so.

>=C2=A0 The only other reasonable reasonable
> alternative I can think of is ibrs-psmp as an abbreviation for
> ProvideSameModeProtection.=C2=A0 Obviously, the "Provides" bit of that ca=
n't
> be dropped.

Then better stay with what you have I would say - for me "psmp"
immediately raises the question "What strange kind of SMP?"
While not tied to any formal naming, I could see "ibrs-sm" as
an option ...

Jan


