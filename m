Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705CD4191EC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 12:01:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196626.349544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnRT-0001a1-Sg; Mon, 27 Sep 2021 10:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196626.349544; Mon, 27 Sep 2021 10:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnRT-0001Xj-P4; Mon, 27 Sep 2021 10:00:59 +0000
Received: by outflank-mailman (input) for mailman id 196626;
 Mon, 27 Sep 2021 10:00:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUnRS-0001Xd-7w
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 10:00:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ceed6980-1f79-11ec-bc43-12813bfff9fa;
 Mon, 27 Sep 2021 10:00:57 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-27ozLIvAM_aVh9HdJOSefw-1; Mon, 27 Sep 2021 12:00:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 10:00:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 10:00:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.8 via Frontend Transport; Mon, 27 Sep 2021 10:00:53 +0000
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
X-Inumbo-ID: ceed6980-1f79-11ec-bc43-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632736856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3QPHlbDmOoVFRDmyzTvu3eGnri1US6M7NCW0Mn9uJVg=;
	b=U/T/EdSx09F1lDC5XV7eNmhNMg8vupCjm8VYJhrVukOvwlAwRv6X8WNVf0+9XJ/x16TXIU
	/OzMpqC/PQDDUOSJH3Ja8vrH/djumR030z3qRFPV3uBTI1GAvI7EXxUqe+1qVHuyHL5k3J
	XeUTR36Qq9LoIgkVfUuoBa7YdZkWezw=
X-MC-Unique: 27ozLIvAM_aVh9HdJOSefw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGRZhR9mbrSO9sfbctRfqWtlj2qBArFn3FU2gTfr6cQO1GtCCxq0hY2TlaHdQypNcxK9Afy3XiEMLpWZjZhKk2zosao/8a2KCAfIvhxMOslPbAQYlmXhREU9HwtSqGJ8cMjDS9Ft/uTmy/IsEhFkdY1QQBaW7fyz7hvnRygDKkL3u2q7R+lkg680ECwnlOhcJgPj0YaHDZ0DvKHfosxMdwFk3gbTmcQXfJHySOqJxfW7ZCWwfAONtJLjxtKo3JXRSYC3zBpfVsh6uw4RlJjA+JTG6Bgwkuz9IeekHzS6Dj9dHZ1WBoaGzhnYntMWMUbY4xoNR7U2DWJzXxDnEwMWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3QPHlbDmOoVFRDmyzTvu3eGnri1US6M7NCW0Mn9uJVg=;
 b=B5HCpACQC8dL0SYMyycn6bcutVSl4YymYZqivQ8hQheG20CUkvMyNF0I/Pqnh3trBII3l86Fs08qlctgoT4hrAxhELdLuL6xQglQLA+ICpVrRB8ZJxhchcqc8nYY8RtoXgsbK2nQt2Mhlnhx/HeiE1wUfMDgGRVOGtAozFtWN9weC4HrfF/kVMIJhO4sqmwfuFz2mxYg4J/kHwn4Dmk/tuvdyFF011jbu9yTvD+E/9UCrxl6Cv35ZBdLdGOCsFWAoy8GOqjTJ8fUqkEIGWMkW1z1zrULsI2Tiq56b/7uX5r+tdhlfS/pAK+u6T11nbFYkpDzSn6D2XDHQOUopPhIzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-6-andr2000@gmail.com>
 <443f57db-7b0d-e14a-88bb-78a31c0271d6@suse.com>
 <55beed13-3a7f-7269-870c-ee0361e23a1c@epam.com>
 <7b093c2f-33cf-ac9d-9583-f0d8b2bb4f48@suse.com>
 <23ae58de-6bd0-b299-a7d9-e6433d1b0689@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <56d30f56-d9fb-e7ca-f3e1-6795973d648c@suse.com>
Date: Mon, 27 Sep 2021 12:00:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <23ae58de-6bd0-b299-a7d9-e6433d1b0689@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43c36e06-8302-4bf6-f347-08d9819db17f
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7024F8EFB1B1530F4B70A4E7B3A79@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IZTP4X112Po/rLuFO7mcApaMdaNZPmnDXFPZ+B8lrd/nyxrBzxcJZwvjRRsx9YKtY9YuI2mayB18UVA18NbweSoOejKNvc5it+rAglMPA2vmn8tQLJ1w32SQ4J/P2mYSL0ULU7Y7/JYtQwjVq5B6YBTtug1+hndUetrwUwph7IiuxrzMsQ68y0C7oMlBex8DGdA/69oKFzirUVncz1FNFUFu0WJwX9dOmYgOpzjPH288BBQtLMhMHev6HO3c7xSuivN35Zo/HJfOB0fQRrYoI7t/IchJQEsujuqrOsNkV0Mx7Ftufu32+Oj9sZv1oQdib59m830m/x+19jA8RuePPA+NwrWBN/FTwu30b9/UsTvoZ/HTxZk5vAaXol7XwOZzZMFfqeg6Fl1fkBgC8m85MG1YQ5V4M0QMmBXWmm7iRXsfrzVz0qoqyDS0feu3b65zLjJJsT3pM59AyaHeh6L5GmZeCHAvMLSG7WMaKANZClFKjsoQvRHr5ZiXntnNDS9YYX7I2td75P//Ej9g/nXnv44tF3p4qT1QElFVyExbBR47RuMkTg85FhZ/0GiZ6/2UHOL7h7FB9bVLABaFX7dUsoARG1YdpRwxpmdVX4W1Hfypqum2Xm26vrDSTTUGfAohAH45WEpdtnm4D29yPwfRq4eDNMenbetWNHx0S2i8HKOR/QsAM17L5p8vmKRsGshrK7fI3uY8jvSSVoNsKhNFn0Ra6sMd9tAB3hiHsmvQKfE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(8936002)(31686004)(6916009)(53546011)(66946007)(38100700002)(5660300002)(54906003)(508600001)(316002)(16576012)(956004)(26005)(36756003)(186003)(66556008)(66476007)(4326008)(31696002)(8676002)(86362001)(2616005)(6486002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUpacXZaNE5HNmxZZmphSGNWb1BoVWJpV25TZnRKbEpBcWEwSm82SUREUFRM?=
 =?utf-8?B?R2I3RzBjY0gvYVZtMkJyWXk1TWV4YkFIZEZqMldoSUJjclA5QW5pM0k0d2Q5?=
 =?utf-8?B?NkpCQkcva1pBV2dHYUpJYVArSm16ZkJndUhhTUY1N245VUMydmRTbmhLQVRB?=
 =?utf-8?B?MlozbWRFVE1oWk5WRDBnbllUQ3Uwa25VQ0RNLzk4S1o3TVNuWUxhOThEci91?=
 =?utf-8?B?cTcxK0VvS2tvSlVlTUExOGt6M0Y5b0dmcHFnV3lYRGRZdDVFMk9qaUd3cnJ2?=
 =?utf-8?B?cXpTMHBwZ25lRGRpcmN4dXlHcFNKWkkwTVAyd2l4NjBCS05RWU1qUCtFTElN?=
 =?utf-8?B?RURSeGNKaUh3TW9ZNEdKSkFCOXdNZGVUSlpKS2VEWnBWbnpQL1VxTnozODJW?=
 =?utf-8?B?ZXo3WlFQdkVKOThpZWpLc25wTSsrSzg3KzdlcjVXSGVtOUwrbHc4T3o5NEgw?=
 =?utf-8?B?NUFrQXNNNjZlcXlzSElXc3NubVFpbFdVNDhYeDBzeXJPS2d1TWN4UFFkdGxJ?=
 =?utf-8?B?d3JMQjFtVEFFNGpHbnlwalpLT1UzbXB6eHRXK2ZOMGtJSGFVd3NzZkJDK3Na?=
 =?utf-8?B?NkEwbHVvYmt0UUp0cHhQbnNsWFc2QjlUNVBMLzVJdkRKcU1yakZTVXUzd3Fh?=
 =?utf-8?B?WkgzT1d2SzZ2eDJiTEFvNlBOdFlkOWs4NkU3L1o4bzdIcUNHaElVU3BOaFFC?=
 =?utf-8?B?aHRPTDdueE5TQjB4UVFsWCt4U0toV1Q1c1RoZFJOR3Rsd2VMdVEyYytIM0Rk?=
 =?utf-8?B?SEN6RXJJOGhUOEt4Q1Y5ZTRzaE1uYjE3dTIxNlRzdERQRnA3UHJqT3c0Q1R4?=
 =?utf-8?B?ci8veUdSNUFwbGNBQzNCdkYyTVh6N0lWOFN2MmZPMEtSSHI5cnE2VDEwUjRL?=
 =?utf-8?B?NmVNcG8vZmd1L3ZGVWh0Vkw1dklnQkUwWUVYelRnc3VaS1B3UGFxNUw1aGpR?=
 =?utf-8?B?b1VaU0dsT1NMOXVXTXBGM29seWcvcXJlYUZzRG5FUTZSNUwyTkpYZHdoMTNZ?=
 =?utf-8?B?UGxFcG5lRjZGVmNKbld0a1Y4d28wOXRGWE0zalEvNWdSdVVOZ3FpQjUweDVO?=
 =?utf-8?B?ZTUzaklkd3R0STJpK1BYaG0xa29wSlNMMkVpY0lRMkg1Vm1IRzBUNzRJNU9V?=
 =?utf-8?B?Qi8zY3FiTFFzd3ZzbTViNXFKcUJrOUM3RCs5bzE5dVJYNzk0R2paTi90cEx2?=
 =?utf-8?B?WXZIYUh5OXpIZjg5UnAvaEtQdVI0WXh6V3IxcitCREFYTHZsMndObDFJWXV0?=
 =?utf-8?B?c3Zxc2NpbEhISzRyaXREdXJhc1l0WkY5VVAyMFdQNFFxRFhmYlUxS3ZXUjlB?=
 =?utf-8?B?WFB4WjNkTUJIRU5pbU9HWGFLZlVjY0prQWd2ZGJGT0ZQZTE0ak1jczlsMW5t?=
 =?utf-8?B?d1cvak1wcWlYMytEUDV6SnJOenY2c1BKMmNVeThoYTRFN2V4cjI2Z3Vwb09J?=
 =?utf-8?B?VXRwbU15b2czOGpwclgrd3EvekxUUDhnMnF6dUY2eVFTU0R0a3ZEeVpQNVVB?=
 =?utf-8?B?VTFNVUZqMzMreS9VM0VETGc0WXptdTZOcjgvRUFhUkEyamZIcWJzNFZYMjRQ?=
 =?utf-8?B?VjVlcEhtQTZWbFdYZkI3YTBsQndvMmk5Y1VrYkc3RVlSMDd0ZVNPTUZXM2ZX?=
 =?utf-8?B?cUpJbFVaMStDQlZrS2Rqby9odnd0TGdMd1NjRlNacXJ2U0RTdFhiVTlnTVkr?=
 =?utf-8?B?ajk4WEZ5Vzk1WG9TZEZJNlFyNFU1eUxMeHlYUWxHM3grVERRL3RadXVkOTJW?=
 =?utf-8?Q?Pmv0EYsvyWQMrwYs3MOhwsyG7trvmnJKFLv72/i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c36e06-8302-4bf6-f347-08d9819db17f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 10:00:53.8496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyOOirY3esoiZ5/3prpvhQonZnki1GamHPaf5be/ZkXem8pyyTcFbmznhTvwwNJmBbxLQhH4Jq/ss/3FLPKeWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 27.09.2021 11:35, Oleksandr Andrushchenko wrote:
> 
> On 27.09.21 12:19, Jan Beulich wrote:
>> On 27.09.2021 10:45, Oleksandr Andrushchenko wrote:
>>> On 27.09.21 10:45, Jan Beulich wrote:
>>>> On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>> @@ -328,6 +328,9 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>>>>>        *((u8*) &pdev->bus) = bus;
>>>>>        *((u8*) &pdev->devfn) = devfn;
>>>>>        pdev->domain = NULL;
>>>>> +#ifdef CONFIG_ARM
>>>>> +    pci_to_dev(pdev)->type = DEV_PCI;
>>>>> +#endif
>>>> I have to admit that I'm not happy about new CONFIG_<arch> conditionals
>>>> here. I'd prefer to see this done by a new arch helper, unless there are
>>>> obstacles I'm overlooking.
>>> Do you mean something like arch_pci_alloc_pdev(dev)?
>> I'd recommend against "alloc" in its name; "new" instead maybe?
> 
> I am fine with arch_pci_new_pdev, but arch prefix points to the fact that
> this is just an architecture specific part of the pdev allocation rather than
> actual pdev allocation itself, so with this respect arch_pci_alloc_pdev seems
> more natural to me.

The bulk of the function is about populating the just allocated struct.
There's no arch-specific part of the allocation (so far, leaving aside
MSI-X), you only want and arch-specific part of the initialization. I
would agree with "alloc" in the name if further allocation was to
happen there.

Jan


