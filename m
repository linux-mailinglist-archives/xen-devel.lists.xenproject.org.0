Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87697839BE
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 08:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588111.919569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYKbx-0007Jm-76; Tue, 22 Aug 2023 06:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588111.919569; Tue, 22 Aug 2023 06:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYKbx-0007HQ-4E; Tue, 22 Aug 2023 06:11:29 +0000
Received: by outflank-mailman (input) for mailman id 588111;
 Tue, 22 Aug 2023 06:11:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYKbw-0007HK-Ad
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 06:11:28 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe12::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b96c20e5-40b2-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 08:11:25 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS4PR04MB9508.eurprd04.prod.outlook.com (2603:10a6:20b:4cb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 22 Aug
 2023 06:11:23 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 06:11:23 +0000
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
X-Inumbo-ID: b96c20e5-40b2-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJCKNFpd+Wu8Rjznv2LOd5lajoiUPc/lcpt3873vUe3hLHXTBI+Ke+C6dN6BbzgMRNfDr/SPxh1Kv5NuVpSixHx+x50/A1TRs2gSDYecPu8FJ6oPDrk1TWMjKHl2rSRpqhGT5BWkkdxoTeUu56W3iATRIvAkX2G9TPSoEdlxe91wd0yqXf1eepF5+PMt0dlgVqhiiVr+6cXGa7i2E1foqOzl++9fpp68hnjXmwdqEoL5FtdUg55wmjn7dFHwt/qv6/kNrtFwfOR1sA1npPDHpK0ciMEYUGzNVVB47oFvvEvHXLuvNcZLLzKNPeqQVI5hCEesYzgWFvEoo5kcrARQNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnLEAw++czESjGt7Xvw23vbMd7aJHSWd5LtoFIQGk9Y=;
 b=AZAOci5gHvaT9E6srP2gSY3GRRtVtcxHQJxtVdQDE6H313zUo4orSzxQUjzD9A6qz10su4iCAph+r77QOPfT4I8S99VWJxk37YHxFzTc/VHcLzWPSQyqg7tRaVQGK2VS26axq/Te9TgmJTvqOS6LYsYKeJM75YEc5ojneumK9NNcWDeDt4lH+zn45wABFaR7KmF0/cV/zkT91ZpbtvORlXdT1CnilQvV6a3qQAtt+HihpWmF4eUTsSpUNydfnOegs1UgLWuzkjbjATho5HXOTqbf2fOpt1+r61YZUYKegCIMPSYV+WSC58gPmDJ1nk6gfMCbwVtXckPwOUJGcTxANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnLEAw++czESjGt7Xvw23vbMd7aJHSWd5LtoFIQGk9Y=;
 b=E+BvYjggXVq/i87NTRZktb6Tjfxw50tJpxX0whHbfQWfjWvvZ2WxT/e1egAMkAEN5onh+eje3h3BhZ4YOY5jeHm5NE+DPbf4p8k8LI0HT/2Q3tuo/tYhm7PYhKj//cTrdFrlm8+pYG4bn+AGysDMUZXJ1mvOYzXzZjikmpv0DJ0Xu1ndDa7XSvQWomDZLaVY7MWhoLmTFECV1Ha2ehGLFT1+0Damd2WWa0mNkxOTK92QIm4BELkZ4zDx1G/zVN9dUO5EepSac5i5UESuR/8QrAdoLsSvtd5hBvCWu03POW9vp56VfShj3JBVicGiLjs2nSygR2ZqhCgD4yGvIFv0TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1fd0b3b6-0771-66ad-9b3d-85358ab4102c@suse.com>
Date: Tue, 22 Aug 2023 08:11:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] docs/misra: add exceptions to rules
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, nicola.vetrini@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230819012410.1754839-1-sstabellini@kernel.org>
 <5400f672-5ae6-4559-920f-5244bcd83c57@suse.com>
 <alpine.DEB.2.22.394.2308211803170.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308211803170.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS4PR04MB9508:EE_
X-MS-Office365-Filtering-Correlation-Id: 8362aafe-44f9-4384-d74d-08dba2d69c0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7T0FWxbr8oC8Km3ACNh3ayEMh7X/bt6T06lnihVyK4kssnCaF5P+ZOahOLc5AOqiP2vTLRi9bfKbeR7+jfZnXX9lK8UZjnVkVp8E5w4kdsXHNL8oYANDEpxAQzlfjmavgdMPRmWcUPhOzhEn/aIADT06EznjakbSzuKyVQePHlRQFyptEk+8fJeJ/lBTI4YO8FXa3WaQxlFMa7k5uMlyxRQ64qU2sLRSGuY+kWMRvoBJIVHwJg8CS7CTjmDzvUYE4hflldj15m6FkyLD86XatqRwk8YMnQx9G4lU+Ve24qQtQLsF/TgknNxGnyhEyYbHH+goWhbOnF2XTJECYCadWkLKD3ZjDLHt8+pBA0oAzYI1dZpDXXHWbt/DFfNFfVebiWS5Qf/eseOH9+nMybL02JT5oCXo+Yq0FY1qdB6m8UfLVphO+WbtIEb+K243k5ghYqjgBMgZhzYHPYYPc9wAku4IFf8jO2ALc+Y+S6LDY9i3pKf8LsVzRKDWlQStndlWmFvmMw8cWpW/moHYPP8Grr5/bO2KmN+267OwnRUxk4DZL8B4iualMYPIZnj3q9Ytq0xirPncnk1UN9rt6NbfZFrvA9Ss0tG+xHM3v7uXCrzh0FZW7GHOFH8Cwn1q7GgMvD0z5JqZsPIiDIk9UYx5Tw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(186009)(1800799009)(451199024)(66899024)(2616005)(6512007)(6486002)(26005)(53546011)(6506007)(83380400001)(5660300002)(4326008)(8936002)(8676002)(2906002)(478600001)(41300700001)(316002)(66476007)(66556008)(6916009)(66946007)(38100700002)(31696002)(36756003)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RW9tSjJMYXc2U2hlMk9PS1pIMnhLY21VY1FEZUIyU2ZPbk1mTG80R2ZCQVVi?=
 =?utf-8?B?UHhoVU9lRzJjSmx4d0dhNEU5MlpWMWR2WG9DSnBmdE9VVzk0ZUtnZ2h6a0d0?=
 =?utf-8?B?dFFIeGtOOWN1UEc2VUZJajZrZlBtUjdwV3I0NGs0NDFuZmljdERpRTAwSEk0?=
 =?utf-8?B?Q2w5UHZDQlV0VkV1OXlGTXJFS1hKODdqUFd6Q1lOeFRpV0lPYWJzNk1wVkpU?=
 =?utf-8?B?YmpZbGVYZUJUcDA4aFMwdHh6amZPL2xEQ1BLRVdXSUJJWGVhQXh6c1V6Zkhj?=
 =?utf-8?B?cTB6QWVxbFJVRlBxTzdjZGt3UkVra0NqUUNlZ1EvS3VVUWlid3F3Q2x5Z0hN?=
 =?utf-8?B?ejB0bE1IMUpzL1lRLzNiSFlBbEhXUVNFVTMrZnRTSFI3cTh4NEFrL2VscExm?=
 =?utf-8?B?ZlViN201dUU2Tk1mKzJWVmNZTFpkdW5rZEFNaGdyakF2U2REME4wOTdqUE1w?=
 =?utf-8?B?czF2bTlTZWxRL3dPZ1Nib0NJSWVBTmFURVUyTHY5SzViUG1qV3VDTG4rQUta?=
 =?utf-8?B?bWM1Zi9HSHFCQWoyMG05UnpjVFNqalNyVGpYWEFWZFlxVXF2bXkvN0tRdVRv?=
 =?utf-8?B?U1JNSGJ3aXRwM2pPQnVaMy9wd0RDU1pCNzVveEFNMlFRM1ZiU20xdUVOSWxZ?=
 =?utf-8?B?ME8vL0YwaFhTNm5WdENIQTlKZVdhckl1TkdEM2Roa1dpQjlxbGVya2lqRlN1?=
 =?utf-8?B?TVhibUczSDY1aVdsTC9uU0ZLdC9OSHdoeW92dkNzUzFNUUxnb2VpQ1JnYUdh?=
 =?utf-8?B?Q1lMSFVhamkvekZsb1NnZ2d2U2kxaHJRQ0ZvTTBMUmpaUHBqVmU5Y3NoV29o?=
 =?utf-8?B?SEF3dDNVMHFqT1dQRFdSWWY3SUl0VFJjT0NpaTUzUmFUQTNZOEJndERBN3d6?=
 =?utf-8?B?dmlLTTRxdDVJaEtnbTZ4SUxiMS92OVZDTE1CZGtmNE1nS2VHMU5jOGpObDVT?=
 =?utf-8?B?clBFZXlaUy93WW1jcDBUU0xhMEtKSTh0R2lTWU9lUktuaWdQV2dYZmRCb3hy?=
 =?utf-8?B?M1NzajAvZGNOR0l4bGd2RTdIcEN5RFFBcmtqYzFrY08xNDE0VWlmRFo3dUNk?=
 =?utf-8?B?eGxCSUhtVmxUQ1lEU200MlpINVAwQXVHclozbk1PNlN4MGpRRk9vNnBJWnBX?=
 =?utf-8?B?MmQySVNwQWJBa2R0bEdnL1F5NzJSaVdnNjNKUVh0cmxmU1loWVNQOFBMRzRm?=
 =?utf-8?B?Mkc3ekYycnN0YjNwd0k1UEVxb1IvVXhZMDhRWk9UUm1KNURydUhTSXphdFM1?=
 =?utf-8?B?Sm9xb1pKSzFBSGo4SWx6U1ptTDV0dEQ1R0V2ZHpMSXlHc2JRUHUza0tYTDI1?=
 =?utf-8?B?Y2lraEl0YzNZR2hmMDdodlA2T2F1aWtIVWRwNktsb1RKZXZ2NlZvVnA2c1la?=
 =?utf-8?B?NlROeGxiRWcvL2tLLzhNMm1MMW5PdFZRYkhndFZ6UFA2eWR4cFRVbllxQVNw?=
 =?utf-8?B?dHBtVXcxN0h1b1ZuaFpMTmc5TVBKR0hjYUUyOHl6eXo1SW9JT2lEMlVUaVNJ?=
 =?utf-8?B?alZQODRwcDFUcmZJc2kyR3E0V3hGeW03TWJudlZOOHlRdnBUSlovbTF4R0Fw?=
 =?utf-8?B?Y01EdHJvOUxJdHE3R3NZTUZ4aGxaQi9IeEZBK0pKRFROc2xQZVAzTVR6VmxD?=
 =?utf-8?B?UTBNNStQcDFhTDNOT1pPdTJCdEZJQ3RKaUVMM0RNQmpEZmhEd0REaFRPTFFL?=
 =?utf-8?B?UVI4YVJQcnNTVk53VThrcmVwWFIrRTdackU4cWh5VDFCR25DR1FrUmp2QnRm?=
 =?utf-8?B?WThVcnNyZlBPWFBSVmtRQ2x6MytIVGxoV2FRbkpIYS82TFlxelNXQThNV3Jz?=
 =?utf-8?B?cDdGMVhIdEVFT0h6REZiUWg0N1lIWWNGUVFaUmFvWVdMMjBhWTJGQS9yKzhH?=
 =?utf-8?B?MjFWZFQ4MlVMdjNaVkgwMXA5RzBRbUgrOG1PK1JNdTIzWHprdlB3YWR5UGRH?=
 =?utf-8?B?TEZncXUxdFZ1Tk9sR21BTVE3Y0tMblRvbStEaGtqTEI2WnNNR1crM1NaYmxL?=
 =?utf-8?B?VHRNdFFGN1lVaVdEWVFpTTkvdXlwWFBEVW00NWpKTzNEUFBzMjl1eVZmNVly?=
 =?utf-8?B?dThKVE1yUk9wOXZkT3l0R0hrRGxnSk1YL2RaQnhYMjBVSVAxZ2U0alBwYzBy?=
 =?utf-8?Q?kYx38jnLjR7dDSKyTyHczJJDv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8362aafe-44f9-4384-d74d-08dba2d69c0c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 06:11:22.9415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIqDay6yE+RVhsDkJIh9VWBg3ib3cS4hlzgBhpdc+jB0k1ACFXlod6w82Tab43JI9yWcgyld3FL27QlSSTHgZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9508

On 22.08.2023 03:40, Stefano Stabellini wrote:
> On Mon, 21 Aug 2023, Jan Beulich wrote:
>> On 19.08.2023 03:24, Stefano Stabellini wrote:
>>> @@ -106,7 +107,23 @@ maintainers if you want to suggest a change.
>>>     * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
>>>       - Required
>>>       - A project shall not contain unreachable code
>>> -     -
>>> +     - The following are allowed:
>>> +         - Invariantly constant conditions (e.g. while(0) { S; })
>>
>> When (and why) was this decided? The example given looks exactly like what
>> Misra wants us to not have.
> 
> This covers things like:
> 
> if (IS_ENABLED(CONFIG_HVM))
> 
> which could resolve in if (0) in certain configurations. I think we gave
> feedback to Roberto that we wanted to keep this type of things as is.

Ah, I see. But then perhaps mention that rather than plain 0 here? See
below as to whether a complete list of excepted constructs is wanted.

>>> +         - Switch with a controlling value incompatible with labeled
>>> +           statements
>>
>> What does this mean?
> 
> I am not certain about this one actually. It could be when we have:
> 
> switch (var) {
>   case 1:
>       something();
>       break;
>   case 2:
>       something();
>       break;
> }
> 
> and var could be 3 in theory?

That would be a unhandled value, but no unreachable code.

>>> +         - Unreachability caused by the following macros/functions is
>>> +           deliberate: BUG, assert_failed, ERROR_EXIT, ERROR_EXIT_DOM,
>>> +           PIN_FAIL, __builtin_unreachable, panic, do_unexpected_trap,
>>> +           machine_halt, machine_restart, machine_reboot,
>>> +           ASSERT_UNREACHABLE
>>
>> Base infrastructure items like BUG() are imo fine to mention here. But
>> specific items shouldn't be; the more we mention here, the more we invite
>> the list to be grown. Note also how you mention items which no longer
>> exist (ERROR_EXIT{,_DOM}, PIN_FAIL).
> 
> The question is whether we want this list to be exhaustive (so we want
> to mention everything for which we make an exception) or only an example
> (in which case just BUG is fine.)
> 
> Let's say we only mention BUG. Where should we keep the exhaustive list?
> Is it OK if it only lives as an ECLAIR config file under
> automation/eclair_analysis? There is another very similar question
> below.

First and foremost we need to have a single place where everything is
recorded, or where at least a pointer exists to where further details
are. As to this being the Eclair config file: Shouldn't any such
constructs rather be listed in the deviations file, such that e.g.
cppcheck can also benefit?

> BTW I think both options are OK.
> 
> If we only mention BUG, we are basically saying that as a general rule
> only BUG is an exception. Then we have a longer more detailed list for
> ECLAIR because in practice things are always complicated.
> 
> On the other hand if we have the full list here, then the documentation
> is more precise, but it looks a bit "strange" to see such a detailed
> list in this document and also we need to make sure to keep the list
> up-to-date.

Thing is: This list shouldn't grow very long anyway, and also better
would grow / change much over time.

>>> @@ -167,7 +184,7 @@ maintainers if you want to suggest a change.
>>>     * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
>>>       - Required
>>>       - A typedef name shall be a unique identifier
>>> -     -
>>> +     - BOOLEAN, UINT{8,32,64} and INT{8,32,64} are allowed
>>
>> I think this permission needs to be limited as much as possible.
> 
> Maybe we should take this out completely given that they should be
> limited to efi and acpi code that is excepted anyway

I would favor that, yes.

>>> @@ -183,7 +200,10 @@ maintainers if you want to suggest a change.
>>>     * - `Rule 7.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_01.c>`_
>>>       - Required
>>>       - Octal constants shall not be used
>>> -     -
>>> +     - Usage of the following constants is safe, since they are given
>>> +       as-is in the inflate algorithm specification and there is
>>> +       therefore no risk of them being interpreted as decimal constants:
>>> +       ^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$
>>
>> This is a very odd set of exceptions, which by stating them here you then
>> grant to be exercised everywhere. Once again I don't think special cases
>> dealing with a single source or sub-component should be globally named.
> 
> Actually I agree with you there. The problem is where to put them.

safe.json?

> Right now we have docs/misra/rules.rst with the list of accepted rules
> and their special interpretations by Xen Project. We also have the
> ECLAIR configuration under automation/eclair_analysis with a bunch of
> ECLAIR specific config files.
> 
> Is it OK if the constants above only live under
> automation/eclair_analysis and nowhere else? Or should we have another
> rst document under docs/misra for special cases dealing with a single
> source? 

As per above, I think putting anything in Eclair's config file should
only ever be a last resort. Wherever possible we should try to put stuff
in files which aren't tool specific. Where necessary special tool
settings can then be (machine-)derived from there.

Jan

