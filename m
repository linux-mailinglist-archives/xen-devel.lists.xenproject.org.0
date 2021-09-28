Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 116BA41A90B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 08:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197586.350722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV6ol-0006x0-Kd; Tue, 28 Sep 2021 06:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197586.350722; Tue, 28 Sep 2021 06:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV6ol-0006uj-Gy; Tue, 28 Sep 2021 06:42:19 +0000
Received: by outflank-mailman (input) for mailman id 197586;
 Tue, 28 Sep 2021 06:42:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mV6oj-0006ud-OG
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 06:42:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6c14b39-427f-4b24-b7d8-90ba95a10584;
 Tue, 28 Sep 2021 06:42:16 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-0G3-M-bhOWGx1SuMmKlHkw-2; Tue, 28 Sep 2021 08:42:14 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6002.eurprd04.prod.outlook.com (2603:10a6:208:117::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Tue, 28 Sep
 2021 06:42:10 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::ac:a0be:c26c:908b]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::ac:a0be:c26c:908b%5]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 06:42:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0132.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 06:42:09 +0000
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
X-Inumbo-ID: d6c14b39-427f-4b24-b7d8-90ba95a10584
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632811335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WeglWZkQBdtppFapSy9NHOVS1TqpLDgaSzswyOhmizE=;
	b=Q2wdHyVeihmIIWilxP7WN0APOrRPXA2zywdhSWaExr5NPiHpZwc4jJ4PNPXmqx9eVTQx/1
	akyQrn5kaROZV+QOF/q+weXWjNJxJDFaZEoY1GZEKMOuP1Epz03tKEDnduFFfT197rhunj
	LeIOmJruZuyhkI1Ker4hY1QBi9Jsh+E=
X-MC-Unique: 0G3-M-bhOWGx1SuMmKlHkw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjAQ8TJ3uF3uByxqwzLz1k74PsIP74OTeGDJQinA20QYh/ODMLSNJ5QQ3mUJI1YEtYjs82f6jhY/l8Y9Lgckqlu0ZWQ8rtdRneyf14P/aKWHh4DbihSUw1n3pFhFz1LwP/JJpAP7diXG6mv2RimeIlpK9H5u/p4BUxo4F+khRUuh/KCQqACRQHaCGrSL3cLCu3zULECdiCOfHEtckYjeLJ2BQvvPSSJE7Ynrg/G/nNNknjpUX83Wdn/sUXSNgu2u/nmzNlA9rHw1iDNfLEHSK4+T993jUNiGLSPPt3c8OUeYEl4A52Dty0pqeZyrgmMmHL/ipJIV7jvRWm/G1IC2tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=WeglWZkQBdtppFapSy9NHOVS1TqpLDgaSzswyOhmizE=;
 b=l1XLrldlZgIUf/fvwRFYv19b+Ky68FVGoka7kULHCYTe4b+8iTCDb1B8hVdmWHbLzQLDmHL3aS1T20Zk9L5bPxpwK/GVxKP0pXLz3ZqgfXPF2xMhLIa9RvhKtzXiBMF/aoHiViy1l9Xr2qD8lN1X5knMemgzN6xEeoKzM4ARaJl3zXpStRnkbnVCdZ0xfflZGTfbnMHVs0pL3rB4a6m/qoL2SlrtsMVALX/+fVZVXWuE3W6rHraN+MCJamnM3jnjVSpWFo4nyomh9z1vKRzj7333ZoNnS5+X04GKOgoplA33BI31pW8jRgUbMksrylJDvi7xMc64m2KT93EkwJ/qAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and PV
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "julien@xen.org" <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Juergen Gross <jgross@suse.com>
References: <20210927065822.350973-1-andr2000@gmail.com>
 <e472468a-625e-6c4d-a9c2-85594e2ff908@suse.com>
 <accd0220-a9d7-145b-6632-9dee085ffc65@epam.com>
 <1cf5fbf3-6453-e258-3940-8b5bb96117b6@suse.com>
 <alpine.DEB.2.21.2109272112150.5022@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0b952b8d-0ebd-1c8c-84d4-f02e05bc2a2b@suse.com>
Date: Tue, 28 Sep 2021 08:42:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109272112150.5022@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0132.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::24) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b6bfc79-2216-4690-4c88-08d9824b187b
X-MS-TrafficTypeDiagnostic: AM0PR04MB6002:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB60022226134ABA6734736320B3A89@AM0PR04MB6002.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KyJTBonqIdK5Nq7JX+IMMfZPEiBIwpam3DWEaEUy8EDd77lCZj/SVHLlt5DDFT4QGrEq3yL8sgVhNL/8KPtWBn5jaecL1NcRzVMc06IzFqxFY/Xkq0AFh9VPHHTBTaNez8LJgKwVrOqD7XULGh3nhNgWnUaDPyUoXICYBKxpLyUlRXZJDwGaQFrGfahS+LZBYk2gNPSiD24Oa6upCAgbz4CIOJeHmURma3/ljI9ghlqIZSi9OCk8I3DO7wfcYBES3sIaEkTfmroTYhV0ZJ7DvcY51SdUctNFxY0rEqB05gwu4FeJAIug2K7unNy3ScZ9sciwl8ZwtvNh0tuFJZqhcPyJpiPYEt445VwhNR7SIPx+nFbcSu5X4VRthU4K3INbTLsjt7mTazMh7aRE/RzCx9vIXRzY2XXdmKLob0xKxRHhq3nTzdAalnLYzLEnajVxtgYB5wYmFBJvwNzg4YOtaCQ/OnUUWu1MgHk2ZcGl4dVWe/cO3fvDT/yK7OVxq7bRQPpuAYnywoIcKLE7Hw/ZMejykaIGYIOrKIrdN9EjA0ELtMW7DD0PUvkK09ry0Ciwj4kEzDklQvLWZZo0mMif3cmRpPlgGxltYZak4HGsmD07PfSmvjYo4SksIPXsZlKOh2Wx/Yuba9xKh8O6P8wKvppvsR6itazLdQyuS4VOl3rfRqspq8b+t1lHrdUndS9Joqt4NSvj3545rCXkSp7izlleKqItTa8RTXEdlyYuuuU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(5660300002)(316002)(107886003)(8936002)(8676002)(83380400001)(6486002)(186003)(53546011)(4326008)(54906003)(31686004)(16576012)(36756003)(26005)(31696002)(6916009)(66476007)(508600001)(86362001)(66556008)(956004)(2906002)(66946007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkNKRUszbE5vUlRwZ0NMMFdzbTh0Sm9QS0NWM3djc2pwS2F3Tk51YnZ0aEdP?=
 =?utf-8?B?Y1BDbmdkK29GdFhYRHpvSmFwWTJVSm1zVmpRNldWdFZkUG5na2d1ZmgzRHdR?=
 =?utf-8?B?Tmp5Z2JES0xNWUVwbUlpWnZKenJ0cEQ3M2pMNHIrL09LS2ZwL1dHam0ydWFX?=
 =?utf-8?B?QTJHZE82V3BYdzl1MFpGK3EzY3kzc3FiWUlZbW15MmVxbkZNb2hmM1ZHOVpa?=
 =?utf-8?B?dTZSV3UxSDJ2M1pjczF2ejM1ZzZRVk5KTjFURU1WRW5jdGpHTHdVd3loRlZZ?=
 =?utf-8?B?U3RUNTlrNnZ5M1g0cnZGNFlLM29PUkVYVERrUEFQaVh2RUgzMmh2Rm9DQi9t?=
 =?utf-8?B?VUkwK3c2d1pWNVZJNEV0Mm5NK21lcFJvYXg4UnBZdW9vUUFPT28zc255OXV2?=
 =?utf-8?B?elJtV2xxNjBnRnhSaGNlQmVGRFdObHdKUWU4NHU3bDVocTM5bnJRblllcndI?=
 =?utf-8?B?V3FrYy9tcy9aR3RSWG5QS2J1eUNjS052S0JIQ3hqWFpxYlBQVnBZQVMxU1JK?=
 =?utf-8?B?d0VRZmJEL3J1bGt5QWc3anZBSHFNMmdQREg4ai8zeE9TZWVPQklBSUhxSXQz?=
 =?utf-8?B?YmpWSldvazAzSGdLaDI4ajVmUUxHU2FmQzlpT0h0UUlXWGFVeVhIRG5qZ3NZ?=
 =?utf-8?B?WWU1aXJ3QmJrT1JvUnlVV25uUjF3Y0tiMUV5cFIrZHMxZjdlekhzQXFpQ0FE?=
 =?utf-8?B?YW9PZlFwemx4S2tCWXRTa1MvQ2R1RFZrdlNYR2VQUW5pR0Vaa0w3UmVUYVgy?=
 =?utf-8?B?eER1MzYxTmptK2dncmR0bElSK2ZjUVpVb3ErWHA3MHJGbE5EdmhDOVgrWncw?=
 =?utf-8?B?c3NPTk11R1F2a3A5WU41eWVvcU1QUzNwL3FNL3ZRVExrbDd6NlpnRmM4ZWJ2?=
 =?utf-8?B?TkRzT2VoSjd5NXExRS91WWdxWk9hWXNhRjN3QTBWek5jamZXZ05xNFlsczR1?=
 =?utf-8?B?Q1hYY3c2UjdtOUZwUHNDcFRRVElBL2Vwem40c0pZVHJRV2FsNEFVMDFsVmtq?=
 =?utf-8?B?RG1RUEJjVlphT1hTU1ozcERkNlJheTVEUmNwd2xXako2ckN6MFFpNlNZdlhX?=
 =?utf-8?B?bWcxSE1DenNLS0NVQVBaVndzcHkwcXNyaCtpQmZmTERmems1SUZRZVBDWjA5?=
 =?utf-8?B?b2hpOHZkSVFlTWM5UUNBRlgyN0gzcnBoR21wQUNRRlMrUVJmUzNKeWFmOG1W?=
 =?utf-8?B?STN0RlpjSGJuNGs5a2ZrWjJjVWlYY1lWbUlVZzhoUnNSWnJ2S0pIVmM1Mldj?=
 =?utf-8?B?TFRCQUhVSGV6TmVweGExRVJySll5RnROMy8xK2VyZFNPRUpiSzJiaWJNN2p4?=
 =?utf-8?B?bHNmbHdsdGpMTzR1bUNQK2VidkVjSjNyNDduT253ZUExclowenNQdGhLNC91?=
 =?utf-8?B?N2dMNFQzOStMUnVlVFprOVdFc1IwMUtLVlJubzZQc3RzWHRIS3BWWjhGSm00?=
 =?utf-8?B?emczbWxWZW94Q3N0VW9XMzdiaXdKMXkydXVETXdHMGZ1clpTNEg4OFVleWpw?=
 =?utf-8?B?SlRnTjBnZWRIT0daVWEvN0ZuaUx1Uzh2MkRZNHhFMmdER3Zoek9EYmZkSi9T?=
 =?utf-8?B?TTVWZmQ3RVliS2hJRlAydGxIUlhLMU90SEQvQTlmcVNGRW5BTUh1OXNjQ2M1?=
 =?utf-8?B?ZU1aQlkzQVlaaXJIZVpvTWtkOVZkZzlGaW84dWxiQVNIMnQ2SEFpakpqY3A5?=
 =?utf-8?B?ZmREWkFicm9VZTBiRTJiRnhuZ2Q5YjExNWN5MWNkbnM4a0lGYWMyTXljbkY1?=
 =?utf-8?Q?nhGLmG+RDd9nwXvxv8O1gFTlDZ2IpMs10N3gWZV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6bfc79-2216-4690-4c88-08d9824b187b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 06:42:10.2703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMudJ5KM71Sf+5MfV+5mF0+1ALQRHAkYY9mZOKS+1cDAXiSaLMlNYieBztoYS/9xmSTQ3WjlOUy2ZDMKROz9zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6002

On 28.09.2021 06:18, Stefano Stabellini wrote:
> On Mon, 27 Sep 2021, Juergen Gross wrote:
>> On 27.09.21 09:35, Oleksandr Andrushchenko wrote:
>>>
>>> On 27.09.21 10:26, Jan Beulich wrote:
>>>> On 27.09.2021 08:58, Oleksandr Andrushchenko wrote:
>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>
>>>>> Currently PCI backend implements multiple functionalities at a time.
>>>>> To name a few:
>>>>> 1. It is used as a database for assignable PCI devices, e.g. xl
>>>>>      pci-assignable-{add|remove|list} manipulates that list. So,
>>>>> whenever
>>>>>      the toolstack needs to know which PCI devices can be passed through
>>>>>      it reads that from the relevant sysfs entries of the pciback.
>>>>> 2. It is used to hold the unbound PCI devices list, e.g. when passing
>>>>>      through a PCI device it needs to be unbound from the relevant
>>>>> device
>>>>>      driver and bound to pciback (strictly speaking it is not required
>>>>>      that the device is bound to pciback, but pciback is again used as a
>>>>>      database of the passed through PCI devices, so we can re-bind the
>>>>>      devices back to their original drivers when guest domain shuts
>>>>> down)
>>>>> 3. Device reset for the devices being passed through
>>>>> 4. Para-virtualised use-cases support
>>>>>
>>>>> The para-virtualised part of the driver is not always needed as some
>>>>> architectures, e.g. Arm or x86 PVH Dom0, are not using backend-frontend
>>>>> model for PCI device passthrough. For such use-cases make the very
>>>>> first step in splitting the xen-pciback driver into two parts: Xen
>>>>> PCI stub and PCI PV backend drivers.
>>>>>
>>>>> Signed-off-by: Oleksandr Andrushchenko
>>>>> <oleksandr_andrushchenko@epam.com>
>>>>>
>>>>> ---
>>>>> Changes since v3:
>>>>> - Move CONFIG_XEN_PCIDEV_STUB to the second patch
>>>> I'm afraid this wasn't fully done:
>>>>
>>>>> --- a/drivers/xen/xen-pciback/Makefile
>>>>> +++ b/drivers/xen/xen-pciback/Makefile
>>>>> @@ -1,5 +1,6 @@
>>>>>    # SPDX-License-Identifier: GPL-2.0
>>>>>    obj-$(CONFIG_XEN_PCIDEV_BACKEND) += xen-pciback.o
>>>>> +obj-$(CONFIG_XEN_PCIDEV_STUB) += xen-pciback.o
>>>> While benign when added here, this addition still doesn't seem to
>>>> belong here.
>>>
>>> My bad. So, it seems without CONFIG_XEN_PCIDEV_STUB the change seems
>>>
>>> to be non-functional. With CONFIG_XEN_PCIDEV_STUB we fail to build on 32-bit
>>>
>>> architectures...
>>>
>>> What would be the preference here? Stefano suggested that we still define
>>>
>>> CONFIG_XEN_PCIDEV_STUB, but in disabled state, e.g. we add tristate to it
>>>
>>> in the second patch
>>>
>>> Another option is just to squash the two patches.
>>
>> Squashing would be fine for me.
>  
> It is fine for me to squash the two patches.
> 
> But in any case, wouldn't it be better to modify that specific change to:
> 
> diff --git a/drivers/xen/xen-pciback/Makefile b/drivers/xen/xen-pciback/Makefile
> index e2cb376444a6..e23c758b85ae 100644
> --- a/drivers/xen/xen-pciback/Makefile
> +++ b/drivers/xen/xen-pciback/Makefile
> @@ -1,6 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_XEN_PCIDEV_BACKEND) += xen-pciback.o
> -obj-$(CONFIG_XEN_PCIDEV_STUB) += xen-pciback.o
> +obj-$(CONFIG_XEN_PCI_STUB) += xen-pciback.o

But that wouldn't allow the driver to be a module anymore, would it?

Jan


