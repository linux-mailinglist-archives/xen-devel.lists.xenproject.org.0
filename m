Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D904F419167
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 11:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196579.349489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUml3-0001Zw-J3; Mon, 27 Sep 2021 09:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196579.349489; Mon, 27 Sep 2021 09:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUml3-0001Wu-Ew; Mon, 27 Sep 2021 09:17:09 +0000
Received: by outflank-mailman (input) for mailman id 196579;
 Mon, 27 Sep 2021 09:17:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUml2-0001GS-Ct
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 09:17:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b69856d3-ed26-4515-ad7b-33884b3e85a2;
 Mon, 27 Sep 2021 09:17:03 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-GNQkiIwDN4eqRvy3XK1mbA-1; Mon, 27 Sep 2021 11:17:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 09:17:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 09:17:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0282.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 09:16:59 +0000
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
X-Inumbo-ID: b69856d3-ed26-4515-ad7b-33884b3e85a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632734222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tNKvu3ro9YeaYI6egGAfV3uRkgbGoPHqahZniehNlok=;
	b=GDmfXn9Zg4flioi/rcIbsPgNLY9juVPkNQUOpKmjFaPpw0UOMN6b7/DQCMC1TFuswR7ZSV
	EEuY/yjtfZ8lZTj9vpFSS4YcRg9ERCPyWRgz1l3zC3pA3xsAJLeav4jryt2GqVl1VktPzs
	Lsn37INTpx/bty6Rd/TVHlzIzz1pkyI=
X-MC-Unique: GNQkiIwDN4eqRvy3XK1mbA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ak5IaRTf1oDK1zBRoZd/wumU1AKNZMq/GllqXquZyO3xgDmxYVNCqtoboTG5vY7dfYd5QepIi8eYF64JiMDKseNxDuygK7xdftgvuxfDsBax2KkG3w8mpsC0CiGhys+Ql4wXG1pd2WzEN9UY/nZVG3E9K7PaREzswMGQ3ORcBAjAYoKn+kl/MetUL8ToJ4Soz6zRWuuhroX+HvENFBZKcpbh54agtyW7mFPBKNv5DrXcXY4Y7cvrY/tLNCn3eao8ShQ75lXu6ZZWo/sUSSX8OETYRxeK4kveQ8gmyrHlkXK2oCxOgrbniEd6aW1mOXqJtHqXUkylFe44+Eg9cBsPXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tNKvu3ro9YeaYI6egGAfV3uRkgbGoPHqahZniehNlok=;
 b=gl2mKlkmAIS+LS3eQP2Dbo8FyMWsiuv9bLfknfCYkJDwy+xoWYr5wPQ2Bgjswk/1auzVtQTiL/tKj/Sur/fR7uMOQZ39/IxH9ePC3RgwmYkZi4+iHdboJH8/XNfjw7yP3M4Xu/SHkiFRw6HmC9O2KSEBURdNEoFzKL2/i1JxpEFqgSBYmPBqaUCVysJrMgfEwwOGVKCDwy82VaRoO5e+jsM6uw6jW8nmnM+c8VFMMlc85hf2RJ0CxaLRZtKWEMi+30VwJYurVBPyMLu7CdehazYmamAHuP7MZ285KJme4icFQDkK2AxRgFFWl3LOollCLBRzAAADeNTkYczA7ugxow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to enable
 NUMA
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-37-wei.chen@arm.com>
 <alpine.DEB.2.21.2109232029450.17979@sstabellini-ThinkPad-T480s>
 <56e0cc0e-7405-74b0-eb4b-07cd9cdae225@arm.com>
 <alpine.DEB.2.21.2109241237210.17979@sstabellini-ThinkPad-T480s>
 <4e6f7222-59c8-7853-cf2c-076620efa244@suse.com>
 <CAJ=z9a1wOd6Hct50O_3B5q3o-bvhgMFy+A95gYMPfz-YL8uFDQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <42eb1303-1b45-5489-eac3-855f4ab35eb5@suse.com>
Date: Mon, 27 Sep 2021 11:17:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAJ=z9a1wOd6Hct50O_3B5q3o-bvhgMFy+A95gYMPfz-YL8uFDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0282.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae98d9b7-eb47-4b14-42d4-08d981978fd7
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2703719EF123BA6027972D5AB3A79@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IN5LFcd7EhLsxob6X+JdrcgTHqfThrJLyRftZ1t+eaxOxnjKAcbhgEsZv7ynpTp70tS9qzc1BywVw8Unlnt/SHaEj2qlTl4Y7Ai9janmQAUsqUKm2SGwcM5mpan6NEy8aLjzKLxGq8F5ucq8HaSL+k+ijNHGDBUbCWVJi2Al6RSd7Mo85E+RRezCiRaZztmfxCZgeQIZbGwesJkvocmNJwALE7yCbyXY+8IHNb2/vKXeWuPzrjw5TxBb9q7B4IUnsd0YMDEXulfbM/mY66sOsCs1j180nIrTf6mrNWhzFT09DL7o0Xa4xxv6WWXNjqzZGOwI2E/qeTJX+KTVcwMwgSoHSz4vnpzrRme4oiKKVY0MzB/+3sT31KTellM4BMdpN3Qs9WgpzU9X0BuBJvfbxT5lxcqhUP3WRPM5n76jzUuWoASCdJU5YdQz1bzRQhCU8z5aqgHPWMEgpflA4lG7sQ2u+TXD1twvUtWlvowC4LdSqwQ+Gbdt2UNhGSwkLBpOIB+HHJ6iinBBjuo6CCULgg6YeyeeLGfrGmwIv7f3TAtkMZXLT6Q8lwSaC+xzHsoiloJCauwZWJipCr0p5KFjFZw2VP7/L5h3ZrjYKbLPRcJ4xRuSRuJ6PcDt03BhfIkqxHsHTfssthPEMPtOfl//M05IopRzHaM8iMLZUAldHQbHnIbyRM07zVDagCL4hFjP6zXRFYpTiCBE2LydX4JCNqLzkQ8VTDHhA6x2fR/w3Poyqi10Z+RQBfCxDPE6Zfb5v12FIThnUSb+HvvsijiJ8ZXEBHw2/m59Vp87zANYb0MEq0kEIPPWUWWf8pYxSdX40WyGkZnFasKzAfiuH4AThQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(66946007)(956004)(53546011)(31686004)(8676002)(83380400001)(6666004)(4326008)(5660300002)(6486002)(54906003)(16576012)(316002)(2616005)(38100700002)(2906002)(186003)(36756003)(66556008)(66476007)(508600001)(31696002)(966005)(8936002)(26005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3hvZUVFYVBkdkZIRTRhajA2WUVsa2toUTlTODBkUFNwMXRZUHZQVkxpVVl3?=
 =?utf-8?B?UW0rVVF4eDNLSG5WNlRHdW51UjdoOTdWUlpId2tkTHh4UjlENjhBS3Jtc1lJ?=
 =?utf-8?B?QnBiTGh4TnA5Vi9VRlpORmFVLzdoaTVwSEdRTVhLZ2FBUEVsbDM5OStDcFFh?=
 =?utf-8?B?QUFkaWpraElsSVFiZWRyaExWd2htVXF3YnhLODlpOWRvbU91ZlR4eDBQZjA2?=
 =?utf-8?B?UXpwVzVrck5aTktuYXc1RnFDNFhuKzJIVjhCLzVSZFdkY3pNanFRcGtoNDdC?=
 =?utf-8?B?Y0JzaXhhamZrY1JKcTFuTVZCM2tYUzJTMVVQKzRGeHBmRVhCVnpiNnpJMjgv?=
 =?utf-8?B?TXQ3TU9NR28wWkJHdVdBbkN5NWNXSjV0MU9BaGE2RlAyM3BZMm9nV0UrQmxT?=
 =?utf-8?B?ZDBKUE00WjJhN2RxcFJaUWFiaHRBZHk1amVlRFd3ZTJyckdQWjV4eCt1VHIz?=
 =?utf-8?B?L2xoeUtoNDlicmZxcHNuQm03ZE5FMllYRTUwN21mWGJ5bXlvZjJHZkJlVFB6?=
 =?utf-8?B?L1JaOEVmeC9rd0xOSnBCQ3pkMUJpYUVzS3VNOHR6MFhJaVpyditKcFhvUzBD?=
 =?utf-8?B?NGdpZElsZ0dDekpFSnEyYkhQODJSbGhJYmdJcXUyU2Y5OGthS3prQWtZNGFX?=
 =?utf-8?B?K0xOYmxjV1RIOThkNnZ2dlUwUUlYN1pJMjV5OWZqOGg0bmR0M1hOVVVGNEdQ?=
 =?utf-8?B?cDFuc3g5UWhQZm1mblZKVmJGYjFhZzBlOG4veFN2Z2JnN1FvNEhaNmUrK3R0?=
 =?utf-8?B?VFpHelhpeENNbzNuQ3ZZeFdKbTdROW5IaDRDeitTd29vSnVCWVZMOWdac2tX?=
 =?utf-8?B?c0dGOW5VUkR0ZGIvajJyN05BeXRFWURObGhKOVNtbmVwdmh1ZDJxK0YvelZa?=
 =?utf-8?B?NGVoZVdZMUtKb3BpbUxTalFhQjlzV21DY0xaOHQ3VHJFbnE5UEtqdW5GeW10?=
 =?utf-8?B?OWk5RUFpWTlkSFFzOWdKL1A0a2hpeE5KdENYYlpaY2M1Z0ttNmtXdDR1QlZi?=
 =?utf-8?B?MUlRbG5LVTZTVGN2S3l2QVhVRjhpejRaajh4NGpHTmpUbU96S2hIZkNqdXZt?=
 =?utf-8?B?RkRwMFQ4Z3hXYWJMVXBMZGtueWRYQnFiSFg1aGVQVHFkNDlvKzJFY1pQNXlO?=
 =?utf-8?B?QmN1eHRxempObEFUOXlPR3RTWndNRGtGV0RVa2hBNDVxSlJjTzM3RmtKdnJT?=
 =?utf-8?B?WTRmMjduU2NHOVRuYWx2dHlHSjJEMGM4N1I5QjAvQkN6OHNVZlZyY0RtckdF?=
 =?utf-8?B?aFhlbVk0d0oyR1J1RjErL2JYRXplLzJGNWc3WmpWREdLNks0U3VvMmQvZ0w1?=
 =?utf-8?B?Sy8yVklBMHB0KythT0pLcTBwanovdjBEdS9HZTdUd0FlUFprb3k0ZnFlcHNR?=
 =?utf-8?B?Wk50VlZ0aTFlTVpFTThuY1hJZXFGRE83RDUyT09vWkY3Z0NBR09xU3pCVVcy?=
 =?utf-8?B?T1dWc2p2SUc2T2kxM0ZmWWhzQWdJK2NRKzM3L3hNRmM0Q3lCNTVWN3o3dmY1?=
 =?utf-8?B?SmhSVlZqODdvUHRNbnk4cWJKVytOVEVSSE5PeXp5bVdPSWNXbS9zWkIyYnVV?=
 =?utf-8?B?M2x1djh4U3UzTkhxWVI1QzI2eHFuV3N4UWJrRWsvN3RsSTZFY1R5VjZuY1JF?=
 =?utf-8?B?dVQwZWExVzVPQkpybjd5UU52Q0NENGJHakIzM2JCRHk5RnhiY3hnU3hmbzNP?=
 =?utf-8?B?Mysyc054OGxvTE5kaSszY0gweFNXQTNNbnRpQjl6cTQ5NHA2aGQ3ejY5U2dH?=
 =?utf-8?Q?PIGY7PwbSHSrgQf6Na5YE7h+ML+NgeFIDnkVQbV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae98d9b7-eb47-4b14-42d4-08d981978fd7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 09:17:00.3839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32OxsL5WquP7L4BUlUsJDnSOTqAgqXkDyjoyt8d04FDD2T0jB0wTX64rVBzYiaLTNV5WVANaH4j1IDsiYRc80w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

On 27.09.2021 10:45, Julien Grall wrote:
> On Mon, 27 Sep 2021, 10:33 Jan Beulich, <jbeulich@suse.com> wrote:
> 
>> On 24.09.2021 21:39, Stefano Stabellini wrote:
>>> On Fri, 24 Sep 2021, Wei Chen wrote:
>>>> On 2021/9/24 11:31, Stefano Stabellini wrote:
>>>>> On Thu, 23 Sep 2021, Wei Chen wrote:
>>>>>> --- a/xen/arch/arm/Kconfig
>>>>>> +++ b/xen/arch/arm/Kconfig
>>>>>> @@ -34,6 +34,17 @@ config ACPI
>>>>>>      Advanced Configuration and Power Interface (ACPI) support for
>> Xen is
>>>>>>      an alternative to device tree on ARM64.
>>>>>>   + config DEVICE_TREE_NUMA
>>>>>> +  def_bool n
>>>>>> +  select NUMA
>>>>>> +
>>>>>> +config ARM_NUMA
>>>>>> +  bool "Arm NUMA (Non-Uniform Memory Access) Support (UNSUPPORTED)"
>> if
>>>>>> UNSUPPORTED
>>>>>> +  select DEVICE_TREE_NUMA if HAS_DEVICE_TREE
>>>>>
>>>>> Should it be: depends on HAS_DEVICE_TREE ?
>>>>> (And eventually depends on HAS_DEVICE_TREE || ACPI)
>>>>>
>>>>
>>>> As the discussion in RFC [1]. We want to make ARM_NUMA as a generic
>>>> option can be selected by users. And depends on has_device_tree
>>>> or ACPI to select DEVICE_TREE_NUMA or ACPI_NUMA.
>>>>
>>>> If we add HAS_DEVICE_TREE || ACPI as dependencies for ARM_NUMA,
>>>> does it become a loop dependency?
>>>>
>>>>
>> https://lists.xenproject.org/archives/html/xen-devel/2021-08/msg00888.html
>>>
>>> OK, I am fine with that. I was just trying to catch the case where a
>>> user selects "ARM_NUMA" but actually neither ACPI nor HAS_DEVICE_TREE
>>> are selected so nothing happens. I was trying to make it clear that
>>> ARM_NUMA depends on having at least one between HAS_DEVICE_TREE or ACPI
>>> because otherwise it is not going to work.
>>>
>>> That said, I don't think this is important because HAS_DEVICE_TREE
>>> cannot be unselected. So if we cannot find a way to express the
>>> dependency, I think it is fine to keep the patch as is.
>>
>> So how about doing things the other way around: ARM_NUMA has no prompt
>> and defaults to ACPI_NUMA || DT_NUMA, and DT_NUMA gains a prompt instead
>> (and, for Arm at least, ACPI_NUMA as well; this might even be worthwhile
>> to have on x86 down the road).
>>
> 
> As I wrote before, I don't think the user should say "I want to enable NUMA
> with Device-Tree or ACPI". Instead, they say whether they want to use NUMA
> and let Xen decide to enable the DT/ACPI support.
> 
> In other word, the prompt should stay on ARM_NUMA.

Okay. In which case I'm confused by Stefano's question.

Jan


