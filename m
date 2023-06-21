Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B241A737B93
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 08:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552456.862550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBrm5-00018Y-DV; Wed, 21 Jun 2023 06:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552456.862550; Wed, 21 Jun 2023 06:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBrm5-00016J-9A; Wed, 21 Jun 2023 06:57:05 +0000
Received: by outflank-mailman (input) for mailman id 552456;
 Wed, 21 Jun 2023 06:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBrm3-00016D-Pn
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 06:57:03 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d09916f9-1000-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 08:56:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 06:56:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 06:56:56 +0000
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
X-Inumbo-ID: d09916f9-1000-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQ4Tzp7/HkhxUouTNk8m91r1vMLYQXB32+BhgfXcHgwC8+9SJmiVSw5TCQJZVm/DRPsJroJmbiSaOKf8vqoR1QJZg/uH6XtS6J+mWrbpetzAZWKqAn/BCX0gwY3MtAZDv5WnS+YJucBEcNKzpXXCqfoFVgCkIjQrmKVrLQ8L19hNVjwwbNzN3TgwreLfXusCPrczUtkMY3mhwtDCmWozJYAVX9KWN+hUD4Xx/bgpx7Qds3DO8Anq2w49GpF2jOQolrLmHIGL+rfMRywPiwYOWknxDqqyHne4BbxhVKkxetE/FIu+vkARVMmSxtuTPKXTA4FygHzmOQdcoTefZtErAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ioBhKkfk5U4uCJZc2OqCp1mbVbF/nrPLy4/unNVhCs=;
 b=oYNdA2B4NHUWn1WeIveG5vPKNe9/bqBhVWfWh9+uZ8YjVul2svt0ZBmWrGD88yj+JkRJSPfPL8zDpg1d37LK2Cm4UWMxa1P/oMT9d4SBeO0JbfBuNt+v6VypyMtQdAsr/d/wYB4pA6u7ATQylVftDl1HukR2IWZGrbK5YpVnXpHQAS2DVZnusbSo4C/ryDrbe1MKV0f4K404Ck5epKtouff8/Jtn7dddKpBAy/0pcrRnxgJ/MY5uzhFQhS3XQ8jZ0GJcgbN0rEtYlFcVHvHecr88s+Qp4ykbRv0X4OvmFLVhMQZWxyYgzEtjFfrxiTRiIjirz2CZzbK3EWA5ISkO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ioBhKkfk5U4uCJZc2OqCp1mbVbF/nrPLy4/unNVhCs=;
 b=1WdBODuwWd/9xFUOidQF7VfHG+hLXv7to+UJsodNNdti0+pbF81mpD5L8ls0AHhwNWT/6xjpk+pIt9F+0/IaPTJUKdp8bIt7rJU2L2cV5ESaHz6wkqK2xeYrCfLrGx7cORDEyL/RYUzpWfRWzQxPdEaFrl3+5zOETlobU28oWnuiAn7dFyEs2K7dgFLVxg4t4k7tz9Evd3dlvw+a8st65DJrCDTTLMcKaNGUPIXO5Y8vmSX4tN/DidwAdYZlPSybholiAzynDo/H8UISBTPwetFsim3zJBuvMjnpJ5KClbW1oDoDRRHP6gLvfyqheVC9skZfXVvxe68/vHauvueG2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6ef8b0c-989b-48bf-570b-60c3f7bc1ded@suse.com>
Date: Wed, 21 Jun 2023 08:56:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 01/13] xen/x86: fixed violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <5aa3a54af456b8faee681a1d737c361abe89296f.1687250177.git.gianluca.luparini@bugseng.com>
 <c21f0bdd-ca78-d18d-2084-78eb094fc41e@suse.com>
 <alpine.DEB.2.22.394.2306201342290.897208@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2306201342290.897208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f8d713-6b4f-40d5-bac6-08db7224b3a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PykteVAV3PXo+86Y+nDIxDXwjjqaS6o8syfVSQJyFDe+w0V8ojdQZKdz3AKS/xTEVjviK1uf/dCmoNIjn2qoTeEvW/qZ+5G95WioDYA5NCn+kEv2sguGFY7DW1OEXsTlvbmaLL4+yEDQz4QqiJUHlnn1m/F8JARHahmDMr0IbVgClxqOi3t+nLwW3IR+rVT44vF8TpSnMCb8PuUxDJl4vZEHawQWOp05j9iXpdjrdAQDCxYNimlqypGJKrFSMKFCaDh2g67e7kHNqbdydsWJ6rR3Vm26MJtUlw6bD1y9Ui7Y5GYwWg5sCVq8HJ0Ky2N8s6+a0WAB4uP0fZ3WXNZKhHUyIrlsK8oqEBEStV1Dyq/NK5LiuGVx+w7FW6G3/JF08aTSloqzrSGNkgi4LaSr4sGFHIcbB3Jgoq160y07z5ETwbi7JYWgHC/GJ4P1U1bc3tnk1TlKDknhTnWPGyTN2sg80G+OvkvqsMuzgSKPjY1sG2bL8X4fdeYXJAEDSkAgF3+DAccPE5NE53wUNMZ2q6GnvJZniz5mO0fMCJPFYg1A50OePgSde4DSP6lN2oMKAPZgl2aqtJfiUyHqNgOXPjBodwfBo3nq4s7DhZpOKblSi8j3CtbL2SrRjHYsKGl2b4qFhv/PSLNWebIcGlhJZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199021)(38100700002)(7416002)(2906002)(83380400001)(31696002)(36756003)(31686004)(86362001)(2616005)(6506007)(53546011)(6512007)(26005)(186003)(6486002)(6666004)(54906003)(478600001)(66556008)(66476007)(6916009)(66946007)(316002)(8936002)(8676002)(5660300002)(41300700001)(4326008)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjlOWEVDWk9EelRiN3lqTTBTcUlxdGZWcjVYVlJuTnpoRFRCSXRLKy8xVHRD?=
 =?utf-8?B?TlowU05xNjlsaE9wUzQvUENFZGJ6bExIZVNWZ2NXM1A5VEs4YURKbnVjVHg1?=
 =?utf-8?B?eTdjNGFzSHAzaHZFMUNVc3RlZHljUi9Xb3JLZ2ZJaCt5WXZuWkJjTTJXdWt4?=
 =?utf-8?B?MWRSR1E3RVV0TGpVVVNkK1lqN2VpSy9MY1hpR1NaM2l6TG5zbUhlRWNqK0Rr?=
 =?utf-8?B?dVNVOVNQNzhPVWlqWHAya0YrUDRqbEVRMnNpb0VveXJpK3VlS3A2b1JybGFY?=
 =?utf-8?B?MzYyczQxR3hWUUY3QnV2R25lMi9OWURMeE9paTJ0UUYzZ0x0eXZ5K1Z2VDN4?=
 =?utf-8?B?aEtiR2Q2a0IyT1F1TnFzakIvNDhIaHdBWElWMnpIUE1WVnZzQlhBell5YUk3?=
 =?utf-8?B?TlFmNnRWblo4YkF5azM4cjNFTEFVeStGZFBKWkNIeTJyZFoxeGcvbHFXdExI?=
 =?utf-8?B?WXl0cS81NUg1N2lWazBYRGZIbFJaWHc5UGhLMGQ3bEFNUXNZWk1iRjEycGp5?=
 =?utf-8?B?ek9QRjJ6bVBPRVZCbVFSWDc4YUFURkxOVUZhTlNJV1RIWFNCNkhlSVNDUzhQ?=
 =?utf-8?B?Vm50OXV0K0RlTFFOMndNZ0gyeCs2NFRDT3FzTUgxSGFmQWpncWNISWVJSkM5?=
 =?utf-8?B?TGMyRi9MYVNnckFkQ3BWK3p5MFRST1B6eW5NaW1XZG9lbWFmRzQrT3A1Zjlk?=
 =?utf-8?B?SDZWMWJXcjBiZUVOR0FEZ1lJVThBY01aNThQYlpqMWtiUElibmhuUzdLOGZp?=
 =?utf-8?B?SEcvTXcrU2tDVjN4ZDdRWm93bVgzVFpzeDN6c1NURmtXQzk5L2p4RHJBZ2NE?=
 =?utf-8?B?VWFYR2hrY04wdWx5OGpDWXZhak1zK2toMXkzNElyMzcxcjlTVnFrOHduQ1dD?=
 =?utf-8?B?N2FSWit1L1pTc0V4T3VYVkhCQjJXTUZpemE2S1dMQ2JWZWlTZi9YVjMvZHVC?=
 =?utf-8?B?TE5lSDVRcTREdnVRL3RPTzJYRGoybnl0VkU4bTR1WUZrYWR5VEZhZ2Z1K052?=
 =?utf-8?B?eHh4Qmx4Y0ZVMGI2KzVmUVhaVDRCZXlvcm5vWUNucE9neXRrbzVDbDhEN3kx?=
 =?utf-8?B?NXJUVVdEdkpkd1lrK0UwSGJOYVNOR092YURDU0p4SGtxSk1OcFNMUVhOdVE3?=
 =?utf-8?B?aHpUa0tuM0dWN3JCMXl0SGd2QnY5eFFKMGljTTYxZm5rVC9EbnlpUlRrV3Nl?=
 =?utf-8?B?Sk9KaDJsZ01Mb25QQWtnUnZrME1Jd0VDS05CQXZBRWZTSkgwL2luYUg1WDR1?=
 =?utf-8?B?L1JUWGFPb21DaXhUdFhPTEVMdlYxQlk4N2lLQlZSb3JrMWVaUVUrQndnS3VF?=
 =?utf-8?B?eE1UNVNMNDhqY0xJa3pJekpFdytTWS9CRmFrQ1JKOERIRVgvb3Fadmd6VFVY?=
 =?utf-8?B?TVBhcjJQWVV2N3Y0ZWZ0VGoyZUNPWG5CTFMyTGdqU1ZESmdoMkVobWRkT0tk?=
 =?utf-8?B?NW42N1UzMDZJNGVGN3Q1M2g0R29MTTduRzdIaW5qbmRZanQyN0ErVXRrcFJU?=
 =?utf-8?B?R0dYS0ppQkE2QUZ1RExzVVl0dFhlbzl1YWFBRDBFbzZzQlBoajRkeXRlWWZN?=
 =?utf-8?B?NlFFR0lrLzFsbXl0cG1wb3BGV0w2SUFrSXRsbE1mQXNyc3IralVOSHFYVlJ0?=
 =?utf-8?B?eHlvMXIwYVNKZmZhaGowbXZvN05pYUZYVEVYUDFUOGZ3NHhXeGkzenZSaHhH?=
 =?utf-8?B?TlZvb3lzckhSOUtwOFpJUndnYVFyaWYwcnl3dmM2RGN5WVNUaU9sLzVUUzli?=
 =?utf-8?B?ekxyMXQvUURZOTkzVnFYRzVTTTY5UWVvY09JS1FZNEJ4eDZrRDBaMExkVnZt?=
 =?utf-8?B?UkM1RURWQWY0bjJJOFFmZmRRZWlpQ0pRbGJIWnZTd1NtTUpPdExTVUNub0Nx?=
 =?utf-8?B?M1dQVVF0ZDNuTWV0R3lVSWpTaHNaSkM3OWQ5ZVVIdVUzNXRnbHZtenVyOFc2?=
 =?utf-8?B?SnE2OTNrSU04a09jSTFydGJDejFDb2YxcEVDMXIvcjNJVWorclB1OTdwVHZK?=
 =?utf-8?B?b1hQOFRlV29Oa0hWQURuUXBMcFBwOTdZYTFQemlQenk1TXhFaFNIeGNrVFgy?=
 =?utf-8?B?RmNmd29lMTlEaWpRRjJGZjJUMFFoRWxhc3VEMmNKYmNMQ2VDNy9RUmw2TGFv?=
 =?utf-8?Q?m3GnVE+/TntbwbkKI3EuOsFDF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f8d713-6b4f-40d5-bac6-08db7224b3a9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 06:56:56.3008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 449GbAXqFHlF1wlNKxFAH45genfnS9ZLIYhoBtvWp5lrmWb0RitGJN9vOO0u6cFZWOLnmHU6cfEs/Z39L05uHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8536

On 20.06.2023 22:44, Stefano Stabellini wrote:
> On Tue, 20 Jun 2023, Jan Beulich wrote:
>> On 20.06.2023 12:34, Simone Ballarin wrote:
>>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>>
>>> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
>>> "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
>>>
>>> I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
>>
>> The code adjustments here are certainly fine, but I'd like to ask that
>> patch descriptions be written as such. "I propose ..." in particular
>> may be okay in an upfront discussion, but for a patch you want to
>> describe what the patch does, and why (the latter part you're dealing
>> with already).
>>
>> Furthermore I continue to have trouble with the wording "is represented
>> in an unsigned type": As previously pointed out, what type a constant
>> is going to be represented in depends on the ABI and eventual variables
>> (specifically their types) that the value might then be assigned to, or
>> expressions that the value might be used in. A possible future
>> architecture with "int" wider than 32 bits would represent all the
>> constants touched here in a signed type. I think what is meant instead
>> (despite Misra's imo unhelpful wording) is that you add suffixes for
>> constants which are meant to have unsigned values (no matter what type
>> variable they would be stored in, or what expression they would appear
>> in, and hence independent of their eventual representation).
>>
>> Furthermore the U suffix (as an example) doesn't help at all when the
>> value then is assigned to a variable of type long, and long is wider
>> than int. The value would then _still_ be represented in a signed type.
>>
>> Taken together, how about 'Use "U" as a suffix to explicitly state when
>> an integer constant is intended to be an unsigned one'?
>>
>> I expect both remarks will apply throughout the series, so I'm not
>> going to repeat them for later patches.
> 
> 
> Hi Jan, I agree with you. To further help Gianluca undestand better your
> suggestion, I think the commit message wants to be:
> 
> 
>     xen/x86/acpi/cpufreq: fixed violations of MISRA C:2012 Rule 7.2
> 
>     The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
>     headline states: "A "u" or "U" suffix shall be applied to all
>     integer constants that are represented in an unsigned type".
> 
>     Use "U" as a suffix to explicitly state when an integer constant is
>     intended to be an unsigned one
> 
>     For homogeneity, also add the "U" suffix in other cases that the
>     tool didn't report as violations.
> 
> 
> I also took the opportunity to make the title unique. Jan, if you are
> happy with this wording it could be applied to all patches in this
> series (with the titles being made unique).

Almost. In the case here perhaps: "x86/cpufreq: fix violations of MISRA
C:2012 Rule 7.2". IOW I think subject prefixes shouldn't get too long,
and past tense shouldn't be used unless describing an event in the past.

As a minor further remark, the nested use of double quotes isn't very
nice. When what is to be quoted contains double quotes, I would
typically use single quotes around the construct.

Jan

