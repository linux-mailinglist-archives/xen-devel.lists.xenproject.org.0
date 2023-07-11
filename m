Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F1474EC04
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 12:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561723.878246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJB00-0002YP-Lf; Tue, 11 Jul 2023 10:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561723.878246; Tue, 11 Jul 2023 10:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJB00-0002VE-I4; Tue, 11 Jul 2023 10:53:40 +0000
Received: by outflank-mailman (input) for mailman id 561723;
 Tue, 11 Jul 2023 10:53:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4LE=C5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJAzy-0002V8-LW
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 10:53:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3040cb71-1fd9-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 12:53:37 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by GVXPR04MB9778.eurprd04.prod.outlook.com (2603:10a6:150:110::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 10:53:33 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Tue, 11 Jul 2023
 10:53:33 +0000
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
X-Inumbo-ID: 3040cb71-1fd9-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m70MZORQ7vmNWOs7a6YkT+UFirL/+Bcb5byIXnN4ix1L2LXbrVfcYmQ+Ug2aXxW/w2ua2WsY8fkPIvj7sDl098Yo3ju76CusMsi/CRpQnmU0NQWEqljRF4ek0KXpHxkjhkRygrGj5QQ/pVq4OJtcIFR//6rWSt7EESXIQ5YSA2MM6y0jhUWDCKUnS52vHf2fEcSKhIELhYBS6dK28hzab1eYalmPYAQiQCtmuX5gEdaHctgWpZ3u9lvdipzsjzJ4s++B5mwIt219SsrzNUFlV180d/xet0AwUCAe6ZfDP2iXKSONlgwbrPB0PHG7kHSZnqKtQtLGEK4SFhwiOmx55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImXypYEyu21H6p1qvG+zOAwXIJTL6QMd7oYEe+O8FCE=;
 b=DDtKSjg0VzBvEj15ko47Vbz1ZhWkKaHw5lYt+kRsYFjXbJXE80RZcD0BuJiFegsz2Aj6ftjJ7HJmofF1zxw3FTTcbDaI7TEiUxNCLE772ywyuYCHRJ6VsoQw65AVW/dtqpZvRVNiFcMXlkUsUYP7LqmJMmh8eRHDOkg/sXEoUwO6grQSYZd6Cm/gn+rEeqe3ZGBp2bnCNZ/YdRtl4rQCKoO4okQfj9KRoSUrrHk4JVRxU6FPS5sVNkK8REN/ePJVmYbcSz2bz5ZwlGhHnNQHB2fKm3CVdYyXXUUxBJvtPKBu4BE+yn9kImbjAnuVlWogqDanWETIVZ4wp9n1+eaapg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImXypYEyu21H6p1qvG+zOAwXIJTL6QMd7oYEe+O8FCE=;
 b=oNbzFleaWAUrmQUcmrZfJGayaQp00MiBOMwzrevN8farliyQ7hHvjc1+YHI/HH3oykOaXcA+qr4Qno6NIq6dtM668Y1QsByXlWLo/WWoI8gxZNbbs1rOnMr6Y0LU51K5CuV4Nu4mQ/eORUGRvLByxKHFfmWtcWGExFBijntySi2nt/Z1DENXTZIADKMDUYTHJcUnJNnfnTIYDyVzpItP4Tgf8JxzHvEomy2ZdbJxABgKHoKit5vopw80jbPlJP5flHIdI55gtUYlKiCXTMnHU4I10zDRARybc7oPvlmCXHmLY+fnEILLRWk/Kpi+Z9ZLHaVnta4rUk0GCjTh2Yx9tQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1f79491a-46f5-5293-e92f-0e2b0b3efb62@suse.com>
Date: Tue, 11 Jul 2023 12:53:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the
 local APIC
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230707095338.44244-1-roger.pau@citrix.com>
 <92d16012-ff9f-693b-07c6-d45fe07a00a0@suse.com>
 <ZKwZBQ_0Z2c7NJNL@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZKwZBQ_0Z2c7NJNL@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|GVXPR04MB9778:EE_
X-MS-Office365-Filtering-Correlation-Id: f430c91d-709b-41c9-67c3-08db81fd11f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4zQMlJOoQd2vigtNqsM7SZ8ekvpHO+LeVXIAA9yWRRh1AjKR3l+Ehf0MwuXMScDwOgIm8TXmbV7Ac1Rmjponw+ddFh7XkIt6uZD0qTqUzP9fBJOoa6RH0QIex9B57K1GNt4NUSF2zxAVQRBSvchAhVfb8SiFu5bm44KZ6761E3F7OP9FRhUlGly3OC/U6xgWyfWCMb8k4eixX+7ZLxGpKcoyKX9UjDxKOR4y5GNtcuJjVK7UtmE6L+OLMhChU+ZOLafaRWDIyPEeXI0edPki8cUczFJY8KUADTHP8hX0zhLWF7Avv/TrmlcfV7AnsLznQiqKO5071J+a1IH1AyvZ3KTwA7vVPnbvnwwGB2Q+30rLDQGgyWUEz1nunSfWZmePOfia/n1FcUzjzE4Pl0hPux7jwHn71StZyDQkXd1/RxDH78C2UI/nIZhfG/FzQBh7Wvj3CZ8Yn0ytwu9CCUP5Cznlkf6PW6wQIWjMlk6aQ4hAjJl8edI/VuLAIIVFp8leYTQUNqzPWdHOzj94WTLvzV1nWCSovnpmSxryIomNB+FRHZK6L0Fw2yFgSMQSIDJ87InZGgZu01zQi3DbV3VOyRNGh1uIJ032vWOTEoYAwh2pzmhkIY6RYwqt/LQoGwNehKwBc+5Tes8Z2Vy+DHO7Tw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199021)(31686004)(66899021)(478600001)(6486002)(54906003)(83380400001)(36756003)(86362001)(31696002)(2616005)(2906002)(53546011)(26005)(6506007)(66946007)(186003)(6512007)(8676002)(38100700002)(5660300002)(316002)(6916009)(66556008)(41300700001)(66476007)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDlTdkdCbnhLVWFsUjdwUVFSTHVFeFBBc2tmdUErdWtNNGJ2MXVwVHdTMjNB?=
 =?utf-8?B?Mk5OK2R0cGhGYXJUYVRBa0YwTkk0ckJMSmNjZ0EvYXVGU3U5cERRSmc4M0Uz?=
 =?utf-8?B?QnQ5VEtVdVdKUVlsZ1BJZEhkdG1Nb01PM0NoS2ZMeGYwWWJRdTdLZUdxcERS?=
 =?utf-8?B?NkJaMG5MQkFiNUh3RGNRcUQraUl2bmt4Z1RZRFlyS2tUQWExcGJnWkh6b1ZG?=
 =?utf-8?B?eUhJS1NVTXZlcU5aSitGYWtkNTJ4L0d1bTdaaWMvY0NQU1FKUGlrNFQ0RVZr?=
 =?utf-8?B?dkZZNjRDaGRvc2VlQVQ0MGVLb25xU2lWRnEvdXpOK01rVklLV1kxOVpXL3RY?=
 =?utf-8?B?Nk51RVBMR2lzRUw4R1dpT1NPamEzRjlMSHlVMWVUb1V1RnVzRGtLT2REQzVI?=
 =?utf-8?B?VmZ0UDlETW9aYW1TdUhiZkFGQldkNHE4N2JBdTVESjlocnB6bEJJb3Z4WjVn?=
 =?utf-8?B?TGJoN3JKQkhoZ1JGVXc4RmNOMkh5aE00cWNJV2Q0OXE1RmVOQm9kLzhiYk5C?=
 =?utf-8?B?emVuSnhpanFhL2wxT1JqcWZNVXNIS1huZXpTelNIbWQyNS9WMHNaY3dleDk5?=
 =?utf-8?B?dDMvVXIza0lvOXhVQmplYTZ1d2h3ZG44Tmt1RmcvWkhsbFo3TURLeUlVMlFP?=
 =?utf-8?B?L21VYmlRMlBnTUdjbnlqSG9hclBURUFGSGl3NU4vUUhpNGZKeXFRN1hYdGVC?=
 =?utf-8?B?MnJGWkVnTXRxOTY4NS9Ud1BFbk5sUkF4djJFSHlHUG9iSGFxanZqNEtSTlJw?=
 =?utf-8?B?dTkrZ2R0K0xDVHR4UjAzZkQ2Ykp1ZWl4TUZlekpBVGloY08yWDdNUWJpeEQz?=
 =?utf-8?B?cnJDOGRhdXJJMVJFdEZnK0Q5NDNhV2d2aXVFeHhyck5pclI4NmZBV3FFb2l5?=
 =?utf-8?B?SjJEejRiQnZXSWgyN2FKTnY5RWlISlR2TkdkbVRmYmF6S1FDNmhlK0thK2Vx?=
 =?utf-8?B?dG9mTWM0bGdwZWhkcy9kMU1PaWRIRk1ycFROMEtMQ2ViL2JkTW9pam53SXlp?=
 =?utf-8?B?eDNibWtySDR2V2diNXJ5dWNGMm0rUkdPWGdlQi9HbDk5cHVGSWtzMHR2Nmxq?=
 =?utf-8?B?ckJ3NnFDZ0F3MWlqa09Yc2ttKzg5c01EbzdjT0N3amM4MlA3Z0IraGZBTXFC?=
 =?utf-8?B?ZmFTS3RsdTJMQmhjQmtYN1M5Ym1vampyeUF2Ny9vTjRpbVVmanBnclFINjZ5?=
 =?utf-8?B?bEVZaFl0ZkZ0U01pS1I3aFdMSlE3Vmp1VVYrKzRYWUtxZ1Z2TEdzREsyUGtv?=
 =?utf-8?B?OVFYWmlQYW5IenRnU0NzdUJkWmxrMDEvRS82MDhqelRTekJCR04vV3h0MjVK?=
 =?utf-8?B?K3Z3RkMzMndYclJWSm15eno0c1REWDdka1FOaXVmRHh2NmJzSlVGd01MclNF?=
 =?utf-8?B?angwYVY1K0VjSGc4YnFxTG1sNmxIZ1VYUGkrd2poVmM1UDRLT28rZ2lBU2hU?=
 =?utf-8?B?TDRjZTl2c0hUYW5LT0c1RVg5Rnp6NndLVnU1VkxxT1ljeGtvRnI3SEdPRzU5?=
 =?utf-8?B?eStWbVZFMEVCaFRkLzN6YVg4Q2s0V1FRMHdSdHdwd1l0RXJhYlp0T3NBZjl3?=
 =?utf-8?B?MUNVVFlOeUF1SGhXT0ZRTzl0VnFveW5QVzBxVy9US0JVSUpBdUlNTWllZEsz?=
 =?utf-8?B?OFNaMXcwVVkwdWxKYnFZd3BoUUpFYVpKNjk4UldtS3E4UmVISXBTeDB3TXdP?=
 =?utf-8?B?OEdLT0RxU0h5cm9KMWxRc3hYMk40eW1ONlN6NzhYaHgxbTZzcnBSdTR5ODd1?=
 =?utf-8?B?cFdyV0F0OFdsd2pKOUJ5K014NjB2TzZIN2VCc3dKQVJPc1hIQncvUU9OSmFQ?=
 =?utf-8?B?cGc1NjFQVVBnMFY0NGFSc0NBYkhiL1lPWmMxY3BsWmh6SHIrb0VIbG1PdGEv?=
 =?utf-8?B?NmIxak1oSExJRE5TZmRwazdpYWdvOXl3Wk1lL3Y4bjc4cTNLQzJURnFLN1lz?=
 =?utf-8?B?eExWbG14R2tkc28zUnRtNFhXK3VNWXlwMmdFQmxqVHFaT3ViUHJod3M1d3Z2?=
 =?utf-8?B?ZnhhYnJpdk4yay83UjFUZS9SL2VmWVhwdDRtUzR3K1I0OTZhSW02UTNRSmxI?=
 =?utf-8?B?bm9nNTFGZzR3QlN5U3VqTFNNejRlb004elA3VTZYZW5Wcmx3cG1BTWhOYzJB?=
 =?utf-8?Q?t8gDthgv4pG/fQYtjMGoOOl0m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f430c91d-709b-41c9-67c3-08db81fd11f2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 10:53:33.1703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2afEehFV8pZptisQlZPmqffdcniPZBM/4psm79xhMM0Ktq0/IcEXEFnpT7lBQHMPLBTbYIyyNyhyyvRjf9jkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9778

On 10.07.2023 16:43, Roger Pau Monné wrote:
> On Mon, Jul 10, 2023 at 12:56:27PM +0200, Jan Beulich wrote:
>> On 07.07.2023 11:53, Roger Pau Monne wrote:
>>> The current logic to init the local APIC and the IO-APIC does init the
>>> former first before doing any kind of sanitation on the IO-APIC pin
>>> configuration.  It's already noted on enable_IO_APIC() that Xen
>>> shouldn't trust the IO-APIC being empty at bootup.
>>>
>>> At XenServer we have a system where the IO-APIC 0 is handed to Xen
>>> with pin 0 unmasked, set to Fixed delivery mode, edge triggered and
>>> with a vector of 0 (all fields of the RTE are zeroed).  Once the local
>>> APIC is enabled periodic injections from such pin cause a storm of
>>> errors:
>>>
>>> APIC error on CPU0: 00(40), Received illegal vector
>>> APIC error on CPU0: 40(40), Received illegal vector
>>> APIC error on CPU0: 40(40), Received illegal vector
>>> APIC error on CPU0: 40(40), Received illegal vector
>>> APIC error on CPU0: 40(40), Received illegal vector
>>> APIC error on CPU0: 40(40), Received illegal vector
>>>
>>> That prevents Xen from booting.
>>
>> And I expect no RTE is in ExtInt mode, so one might conclude that
>> firmware meant to set up RTE 0 that way. Mainly as a remark, albeit
>> of course there's then the question whether to change the RTE
>> rather than masking it. What do ACPI tables say?
> 
> There's one relevant override:
> 
> [668h 1640   1]                Subtable Type : 02 [Interrupt Source Override]
> [669h 1641   1]                       Length : 0A
> [66Ah 1642   1]                          Bus : 00
> [66Bh 1643   1]                       Source : 00
> [66Ch 1644   4]                    Interrupt : 00000002
> [670h 1648   2]        Flags (decoded below) : 0000
>                                     Polarity : 0
>                                 Trigger Mode : 0
> 
> So IRQ 0 -> GSI 2, so it's likely pin 0 is the one the i8259 is
> connected to.

Then wouldn't we be better off converting that RTE to ExtInt? That
would allow PIC IRQs (not likely to exist, but still) to work
(without undue other side effects afaics), whereas masking this RTE
would not.

>>> --- a/xen/arch/x86/apic.c
>>> +++ b/xen/arch/x86/apic.c
>>> @@ -1476,6 +1476,10 @@ int __init APIC_init_uniprocessor (void)
>>>          return -1;
>>>      }
>>>  
>>> +    if ( smp_found_config && !skip_ioapic_setup && nr_ioapics )
>>> +        /* Sanitize the IO-APIC pins before enabling the local APIC. */
>>> +        sanitize_IO_APIC();
>>
>> I'm a little puzzled by the smp_found_config part of the check here,
>> but not in smp_prepare_cpus(). What's the reason for (a) the check
>> and (b) the difference?
> 
> This just mimics what gates the call to setup_IO_APIC() in that same
> function.  It makes no sense to call sanitize_IO_APIC() if
> setup_IO_APIC() is not called, and I wasn't planning on changing the
> logic that gates the call setup_IO_APIC() in this patch.
> 
> I did note the difference with smp_prepare_cpus(), and I think we
> should look at unifying those paths, but didn't want to do it as part
> of this fix.

Well, consistency is one valid goal. But masking RTEs may need to be
done more aggressively than setting up the IO-APICs. In particular
if we're not to use them, we still want to mask all RTEs. Otherwise
we're likely to observe each IRQ to arrive via two separate routes
(once through the 8259 and once from an unmasked IO-APIC pin).

>> Isn't checking nr_ioapics sufficient in this
>> regard? (b) probably could be addressed by moving the code to the
>> beginning of verify_local_APIC(), immediately ahead of which you
>> insert both call sites. (At which point the function may want naming
>> verify_IO_APIC() for consistency, but that's surely minor.)
> 
> I wanted the call to sanitize_IO_APIC() to be done at the same level
> where the call to setup_IO_APIC() is done, because it makes the logic
> clearer.

Hmm, I see.

>> As to also checking skip_ioapic_setup - wouldn't the unmasked pin be
>> similarly troublesome in that case?
> 
> skip_ioapic_setup is set when the IO-APIC address in the MADT is
> invalid, so in that case attempting to access IO-APIC registers in
> that case won't lead to anything good.

Of course, as I did say as well. Still if for some IO-APICs we know
their addresses, we would still be able to deal with those (if we
were to stick to this mask-all-RTEs-early model).

Jan

