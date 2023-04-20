Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC276E8CCB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 10:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523951.814398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppPhF-0005WV-78; Thu, 20 Apr 2023 08:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523951.814398; Thu, 20 Apr 2023 08:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppPhF-0005TB-4K; Thu, 20 Apr 2023 08:31:17 +0000
Received: by outflank-mailman (input) for mailman id 523951;
 Thu, 20 Apr 2023 08:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppPhD-0005T5-Hh
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 08:31:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7d00::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5acc986-df55-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 10:31:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7624.eurprd04.prod.outlook.com (2603:10a6:20b:291::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 08:31:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 08:31:10 +0000
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
X-Inumbo-ID: b5acc986-df55-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBJ87ElbuPgqpTjCkLnuMzZtb0yClOFQoRc3ESD0OqcQf6JVOsi2WMU7Oj5O1dC7uJrkWm9vmcbrb4RHMLSQYe7283VtdlCVqFRKbCOQdwDo0JLo+25lIx6B7JacCp4OgfCp7O8taVGscT0FCln9oJk9w74/NIsJcF0+87r/3A1VwxudrTQv5cyOWz9T/SiIXhcM23IjI6U76kEPJnG3srjOxFI5cXQJqBAzBnoYXZNoOWK1G+9feFpa2ji3DmErbu2D2IzeS1bkXx2S9JIK1sbgJNo48lPOtZNM7G4755X2Q25plM44zJUtyjuRqB0BsFzcjZflwzsItiU+pXH8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaMuU00G0QkFqYddEGM362WOg54PsulMYrJYjY/kpaM=;
 b=HiL3tbfRhsff1Up99UFZyYYBgklYLaREgueE4avqeFwD5wdIKLjtE8lORi1OWQCeIaH7fCrNVYTeLy79SDBoU4+FsCe2wpzy4MDmwgTcc1N+aaCPMMasM9X2gOj7uVzWykB0nle7KDc0WJL13zOUPKNMCvoUaSn2XT1MjTU7CiMU3Z+4VRZlNa62TGmaeJjvbeKLuhRZFD8juj1kYzD+pRSqQXDcd0BLe+PlAYqyOq7PHKrKJJO09j7qbCjNcovnEXNdSfdzDXIG7iYU+mxe2880wYm68CBzYaFV7oR93cB1Er1LXsbRfXWiFJJ3sSh2WfQ+HqZGydz6Ja6l3bhQqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaMuU00G0QkFqYddEGM362WOg54PsulMYrJYjY/kpaM=;
 b=Z2ks5EwYsw6TUjcX1XiRuJkNjLSolXjhcetFpU8nRpUnQqL3zRUjVKlvHK0fP3SqiBjtV1cdqdw4cmyed1r1qdheEzl0Xyu6ESZghDSyjEdnMXtg3YMgANDxbRr1lYNp24cuDNKs1jxa30G9J4Y0K37Ixo96uspIvNh6v8cBCsujrbuB5eeZ51jQlh66GOHFGpG/d9BwwnZFJYZw0BUsHI+6FGwDDcl40HWMrD/vqsJLBv16bXUBV80KNqWaCXEDZiy9t8R6mJsaYvkntb5zx3voOZ654HdhqW1WzQfuofCcb8a9I3xqHehE1zcqg6+fr2ybiGJeR+qiAomMHzZqlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e3246c7-6de2-b3eb-477f-99ef9bd1b33b@suse.com>
Date: Thu, 20 Apr 2023 10:31:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <116bb94f-955c-4c46-f16a-d7a5e1cc72b5@suse.com>
 <ZD6AejXJxQxAyrx1@Air-de-Roger>
 <c736271f-96ad-dfdb-48ae-b8e9cc002d9b@suse.com>
 <ZEAO8e9iTjmi86fr@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZEAO8e9iTjmi86fr@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a79e16-1da4-4726-58ff-08db4179984f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v3E2ZZA+bwK3SYtg9chPCu+3kSnBY/L2GhI8HJsDgYZu+ah72tbkSipIomAeSdGg9EZbYgNU+E9DW57FIH5wKO8QrpLTAYAKwkp+4zvmjIW/csUYwwQ+RchlV3+yLXfhqEbKKn6RymUXsBa8/JpfTwIyt2ZB1856kEdcurDoV9tiqkTXEzxXGqXCbon4BAJBIzN5detuIkbZg5A7jFDHg7wMFKwXYLSFou4vgWkWHjckIoZa3Hv6cG2JypRPP6Qf9uZVTlZ6iP+ni4iq9+1m0EM33kS/kLOlvbTGg+moTKMoE9/ZxKK+J/sFA6U7deoVSqBHctanA2liUkI+X1fS41EZeflsLrQ7O0LnAW9uDhmq23/Qwvv++l/utQq9NojsGP15D8sdP7NDsDLeZ3jsa+ECmhjyyPSabdL+wRbkEr8Nsm/lBcYAofz9eSRZ5lYU+MGA5bo8V2fHfRp9ulKEnIVKRn/zKKEiEjRUyYMmK3o5t92oT4qyr7bpy82WQB1q+TU2/xEvLcbpPyhRh+35ZM0VRXbBxiKg1Z2ZSm+h/ItYvX+Me/KsLT/YKfXni44ntJBuTomTC2bX/hF/ZQWlmq3MjTEEnSNOkAMJtXRj5KThR85lQDwzjc2J2+m3sfr9F3w80pxkZmWBzVvi5uQjGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199021)(31686004)(6916009)(66476007)(66556008)(66946007)(316002)(54906003)(8936002)(36756003)(41300700001)(8676002)(5660300002)(66899021)(2906002)(38100700002)(83380400001)(31696002)(4326008)(86362001)(6486002)(478600001)(6506007)(53546011)(2616005)(186003)(26005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFBIN0liWXhON0laQlN5NVNzQkNGNVlKZzZZQ3AyU1IvM2laNXRqTnEwSDUw?=
 =?utf-8?B?ZXdaemQwdGlYRnRxRkN5K2RUNXZ4a3M2dkNWaC83aEd2SVFXdzkzWTJkRnov?=
 =?utf-8?B?Y3NTdGRobHJBQW5qUWJDOGRCcmxMZnROaktCRTZ0YW00Ris0TW1zRXhlaGk3?=
 =?utf-8?B?SXdhU2dqVk1iYkIvdXpWR0pHc29FYXZ2SE9oSnZIQzc0RWE5K1R2b3psZG9y?=
 =?utf-8?B?c3pVZE9Db09aTTZ0aHFHZkxDUm5XVDBKbnZjNzBBOXVaSkVTMk5tU2dFaHhM?=
 =?utf-8?B?am9DUVpTTUZnU3Foejh3bXhOT1djMDR5bVNaQmtTNzJVR0phRjNPaWJIN0V3?=
 =?utf-8?B?Mi96d1F6MEpnT3JDSEV3cFNMVXEyQW9wTWdaYWs3c0VYck9pK2kxRlF6K3hU?=
 =?utf-8?B?YXVSVGFjVmpRMk9ZR2hsT2x2MlJjVVJ0SlJkWWJkd1VqV1VaaE51M2FnVzIv?=
 =?utf-8?B?cFRyeDRwc1l1bG4wVjhGWTFlVjhnbER3QlMyMnhRNnhqaW9mYWpnTTFxVDN1?=
 =?utf-8?B?ZlBkTWxGZUx3TXNIOWlPR3NEK1BrUDlJRW9nVkV2a1lXRmg2WGxqOUFwN3Q5?=
 =?utf-8?B?M2ljS2lzbHo4VHU3dVEvWWJKQmtLc2diSEFzYlg5Vk4zSEVEWVgzOVV6OTFI?=
 =?utf-8?B?NnNuZXR0SHhMcHlRR0NRcjJ1K0szWE9DS3dvYSt5Z1BRVGpGd2xodnB2Z1Yx?=
 =?utf-8?B?dW5YZ0F5MEpBa1ZVMVJ2QjRSVUdmL3FibER0UUtKeWY2U0szYkxFMUl3a2Iv?=
 =?utf-8?B?NlJ6bVNCZGZxV1cwTkMvTXd2a1dDUFppdFZ0WXNLV2VjSUZ3YWh6UW4zdHB0?=
 =?utf-8?B?enFzbURHb0M2dE95QS9aVTFtdVIzallaZFN4WFNPQkpDV1NwMUtGOHhtcG5N?=
 =?utf-8?B?RGpRMU5WRnJHU1Frd0U2b3dnV1RjbXJxTFFWcGhQMXRES2ZoYzJabWxJNkhI?=
 =?utf-8?B?eEt6aTdlZWgrY3EwV2dleXVyNEdLQXRlajBsY2xncFgxMUNiODFxNzRZUGp6?=
 =?utf-8?B?MWMvZnZBbzgrZDlZU0tha21OK2Vib1RJVE9zOHd0b0FIckNkcXNFMHByU096?=
 =?utf-8?B?Ung0c0llWHdQU2grcW5Xa3VnNGkzbmFYUWZoZUZocXgxcTNHS01RMyt2VXg2?=
 =?utf-8?B?cDNnSmVrR2l2c3FyR1l6eEVWTU1abzhPUk5mWjFveHhnOU1wSWcvV2cwWWNM?=
 =?utf-8?B?NDU2M1Q5dlhNaHY1UmUvOFNCejRjakpwSndzcDFia2IySldNcEFoOGllUHp6?=
 =?utf-8?B?YVRwaHhsOC9mVjlnUDlmR3YvSXJldjVqN3RtekIvSXZhQ1hwSUVSeElmWEhL?=
 =?utf-8?B?bGZKSU9vSEhwbmdwMXdyUEdYb1VjVTYyTCtiT2VBKzh4Z0o2aFJheUpUZ01K?=
 =?utf-8?B?STNHZ3hrcVlpRWtSSFNwK1MvMklzV0dVV2dNS0R6V3BnMENnTFZuQloxdkhu?=
 =?utf-8?B?amozUlpoK2IxdngrcnRpSHVGblYzV0hkK1dUZWdTSE41UjlnS3Q4R0taVG5U?=
 =?utf-8?B?WStRNUVac2pzMEtkWE1EU3QyNkVLN3I5WWZFZ1B3ZUUrQ0hRSkYxMmc4MmZQ?=
 =?utf-8?B?aU5XaXBtdVp0dU9sWHRPbmM2SGlON3U3TzFoY3VQalp6MExIcUFFcnM3bGFy?=
 =?utf-8?B?d25hbGVKTnRXaldGa3pJNmxqem10TUJvTWJXR1NzaHJaT2VlKy9uTjBQVGlK?=
 =?utf-8?B?UktZZEsvWlFEaTlSa0U1NWM4c1BnZVVEbnorWUFrS0U3Si9qUjdtMDFFM2FO?=
 =?utf-8?B?RXJ3QVhPS0YwTkZpdFFLRFJMTm5qbk9DRnA0UTNRWUNUZWl4ZzB0clRhQWJq?=
 =?utf-8?B?NHlrQ21ZWjUyd0ljQkM2OUgrZVJrS2VsWDc1NmlYaGlXclFxT2lpL1l1bUpm?=
 =?utf-8?B?OFZ1eTZxY1lZczVIQnQ2NVJXVmNxL2d3NHErNURKcVhlS0lqR2tIVXdQNy9M?=
 =?utf-8?B?RzQ2eTcwREZBVnNJSVIrUmM3OGFqbzIzMVAwMWFvNFc1djVLVGFVMTA5TjFl?=
 =?utf-8?B?c3hESzJZZ0lJU3U3MHlIOVVLTWxGL0txTWl4QnJuQVhKZUpIT1VmS3FJQkVw?=
 =?utf-8?B?SjNJWEJGREJhREx2WlQzM3BaWjZnY0xSTjVydndnN3l2ejRBQ2hrMTlzbFpG?=
 =?utf-8?Q?mu/0Rejr7Lp8xbVdnip6jB+tq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a79e16-1da4-4726-58ff-08db4179984f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 08:31:10.6960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ir2gkDC1/3AL9SrZmq8Go9LB+nVH4MFO48cICFCfhMF82r1gKM93JvagZLc1mFnmC0iIF2Eeh0RnpkuEij54Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7624

On 19.04.2023 17:55, Roger Pau Monné wrote:
> On Wed, Apr 19, 2023 at 03:58:10PM +0200, Jan Beulich wrote:
>> On 18.04.2023 13:35, Roger Pau Monné wrote:
>>> On Tue, Apr 18, 2023 at 11:24:19AM +0200, Jan Beulich wrote:
>>>> ... in order to also intercept Dom0 accesses through the alias ports.
>>>>
>>>> Also stop intercepting accesses to the CMOS ports if we won't ourselves
>>>> use the CMOS RTC, because of there being none.
>>>>
>>>> Note that rtc_init() deliberately uses 16 as the upper loop bound,
>>>> despite probe_cmos_alias() using 8: The higher bound is benign now, but
>>>> would save us touching the code (or, worse, missing to touch it) in case
>>>> the lower one was doubled.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Before committing I went back to read through doc and earlier comments,
>> in particular regarding the NMI disable. As a result I'm now inclined
>> to follow your earlier request and fold in the change below. Thoughts?
> 
> It was unclear to me whether port 0x70 also had this NMI disabling
> behavior when the RTC/CMOS is not present but it seems that port is
> shared between the RTC index and the NMI logic, so lack of RTC doesn't
> imply lack of the NMI bit.

Right. My earlier oversight was that the datasheet I had pointed you
at actually explicitly mentions the NMI disable bit (really NMI# enable
there, named NMI_EN) in a separate section.

>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -1305,6 +1305,13 @@ bool is_cmos_port(unsigned int port, uns
>>  {
>>      unsigned int offs;
>>  
>> +    /*
>> +     * While not really CMOS-related, port 0x70 always needs intercepting
>> +     * to deal with the NMI disable bit.
>> +     */
>> +    if ( port <= RTC_PORT(0) && port + bytes > RTC_PORT(0) )
>> +        return true;
> 
> It might make it clearer to move this after the !is_hardware_domain(d)
> check, as non-hardware domains don't get access to that port anyway?

I've done this; I had is earlier because when moved ...

>> +
>>      if ( !is_hardware_domain(d) )
>>          return port <= RTC_PORT(1) && port + bytes > RTC_PORT(0);

... below here it becomes yet more odd with the 2nd of following if()s.
But I guess that's still "acceptably odd".

>> @@ -1342,6 +1349,17 @@ unsigned int rtc_guest_read(unsigned int
>>           * underlying hardware would permit doing so.
>>           */
>>          data = currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(0)));
>> +
>> +        /*
>> +         * When there's (supposedly) no RTC/CMOS, we don't intercept the other
>> +         * ports. While reading the index register isn't normally possible,
>> +         * play safe and return back whatever can be read (just in case a value
>> +         * written through an alias would be attempted to be read back here).
>> +         */
>> +        if ( port == RTC_PORT(0) &&
>> +             (acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) &&
>> +             ioports_access_permitted(currd, port, port) )
>> +            data = inb(port) & 0x7f;
> 
> Do we really need to mask the high bit here?  We don't allow setting
> that bit in the first place.

I think it's more consistent to mask it off, specifically with the code
visible in context right above the insertion. The doc isn't really clear
about readability of that bit: On one hand in says R/W for port 0x70 in
the NMI_EN section, yet otoh in the RTC section it says "Note that port
70h is not directly readable. The only way to read this register is
through Alt Access mode." (I think the NMI_EN section is more trustworthy,
but still.) Plus if we were to ever make use of the NMI disable, we
wouldn't want Dom0 see the bit set.

Jan

