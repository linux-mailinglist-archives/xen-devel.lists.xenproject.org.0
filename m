Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E51798251
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 08:24:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597796.932157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeUug-0003W7-VV; Fri, 08 Sep 2023 06:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597796.932157; Fri, 08 Sep 2023 06:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeUug-0003TY-SW; Fri, 08 Sep 2023 06:24:18 +0000
Received: by outflank-mailman (input) for mailman id 597796;
 Fri, 08 Sep 2023 06:24:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeUue-0003TS-O3
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 06:24:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5551de4f-4e10-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 08:24:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7406.eurprd04.prod.outlook.com (2603:10a6:800:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 06:24:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 06:24:11 +0000
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
X-Inumbo-ID: 5551de4f-4e10-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqZxpUnVD0/OidsJXyqguha9YVF4xNoU/XCVvtg+luabRS7XQnx/p8tHsfKUuksoBvg47bGhJNohH9O57GbqHLNDhEG2H/DbptJrVFX7e11C9CklBDTyyYsMOK/Nj1Hfz57wRrL5wB+ELUsOcOZk43cwLN9Vau3zTwUgGtWhF+7F+IOOeoKkh5cNz4fLTHbJdhkf+2Wkle89xjIml88srGezFC6Xe0CE6dAwYzftHsak1pqWz2sM+EVME4HbIqAzvsKgRRgxKZEyRxYi3gP68H70m5SZG0e/WMvk94a9piCbpYUBJaOw/TIGwK7zhNPWjO6IzqJp2AtJ2CPW+epdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yme6FN46mKlGHgHCpH6tMqbxJt/dWIZo3ChgSrg+J64=;
 b=LTr9YhinW2Sd8HVYX6VxhRUsXXjkRBhTC1m9OdRrfdsPvfqHxt/wtterFvA61MxrldFG/cVbD8n/HLBda1gX5UQ2CjMjSbfbNw5gPwyNsyAX1AM/dXgN/yYS3pFtq/b11GZcXd/nZonTrDmXnT9Vya5gKForNC714ENn5+gHw7vxT/pmtZvsYdFcWXig8YwiZCyksALFzlB7Otxv2idNl2Rbm/9TScTA8sWffnmbR2zg6Cxa2rOGoHQXOy4y7Ez3cm1yicJwUwyuBku/k3zc90Bu1Pq5nyS6PglDa+JmvW/ZccOc9VGlHIzCToHdwWqiTwQ0tJ/j15r4ga98QxdChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yme6FN46mKlGHgHCpH6tMqbxJt/dWIZo3ChgSrg+J64=;
 b=eyVhZQkaMzZEL+juKA0RRSadKTcyOBs/Lxd4Ovkg+d8suwoXiDhZrHKaOW5Rn+WLCCQoSjbVHkSBvZMQ9tM8Rzx/lUsU5mX08Z5OEhE/l+Lbu7+XtS0XafCMeGrMsyqXPXiA27enkExmP1E8fJ+xxdVf4zduKgOYp8Q0Fc1CDBgtB7SJam2P3LZYAU5C1xM8lAiKv580rNyj5go5Qew9qj22hKABRm8UyemEJWNKyksoaAkWNm7FfbgFWI/8o1ptrBgEM6GmHT6ZbwSNyISzLYMhGgyCMBQqpTzK48Blj2pxuEbgZV5+4UqtVhC2JeIrqs5v2D9j848LHyVS50UmTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ebf82139-08ed-b461-a49b-f89e9d8d5253@suse.com>
Date: Fri, 8 Sep 2023 08:24:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 4/5] xen/vpci: header: status register handler
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230901045742.235975-1-stewart.hildebrand@amd.com>
 <20230901045742.235975-5-stewart.hildebrand@amd.com>
 <3b816ecd-e7a6-c6a9-9b42-b9287deac111@suse.com>
 <d8de036e-8774-ca96-3fa4-1c9bd087ea7d@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d8de036e-8774-ca96-3fa4-1c9bd087ea7d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3a7198-c187-4bdd-67e6-08dbb0343732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Gn3Fz5I9K0wWUZIIMhcnmD7i6x+dPFZpdWztYhsbDGJUWRgM/mlP6Xe+SaT6WaicUF7I4/7bYSM1Glp0bwHuu8NEgtfozobrLHeD1yOTQWom4AWUWJP051E2xUvOZGIb4nM6TABjrCx8WIxPoQD6f4tLs1+WwYsrprkDKb+OCiweNLDSzFylRV6wrbEb0nn+KmBrwdMcWnYiTHiRDfJprOJ4FMN1dDHe895tqY2GYeTdM9Bhgp++5iejQOgXCg/3P88aiCzQ6T6UXu41gxgwuk1l2dM45gwGNiStmB6GnZqQIUoDTEtrhY+p72EXOuTeDZ7UAqcW87rIUUzOsCFGITBn2BL2txay5DlWgUmHEvyNdL/iSSe/vqdbAsZEnisR9ECGtJLudgBKHdepGMZxVRUo5smxsrjQPllQy42HdiygjPrTdpW5gi231IjDh25uDyeF57zXIdS+U5gacgGQsgIVl/MIFQZnDYoEQB3/vN6vW7iJlZRLYJjFSwAQQ3Q03LsUPy7e9IAd6wJ1ZS1fTgWS8G6PCWtybFqmjQzf1Kw/gY9o64DLlgfaOVqbdbimJiXbEsvcxGGYXa40I5mb0KMqldye5B7c8eaZ8IrA54jHI9d8Au/niw/VC9C+2Gew8ZiNTrzjeJSDIn8iSMsCGYASLwilc2EchptrSOETOZgXyKnhuOCrCh2Vt1GDdbX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(346002)(39860400002)(1800799009)(186009)(451199024)(38100700002)(36756003)(86362001)(31696002)(6916009)(54906003)(53546011)(6512007)(26005)(2616005)(316002)(5660300002)(66946007)(31686004)(66556008)(66476007)(6486002)(6506007)(478600001)(2906002)(8936002)(4326008)(8676002)(41300700001)(83380400001)(43740500002)(45980500001)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0x5RitqQ0FrNWNDQXBqeis1ZG9tdkhmM1pHdGI0YWtwYWJ1QTg3REZ0bldW?=
 =?utf-8?B?RTRxTmNJTHU1RTNSa3oyTzZmbjl0K1hUaEFmV0s3dVF1QVpHS3VJZXhIY2E3?=
 =?utf-8?B?NTVyVXc3YUxSNVhJaXFjQlRiakpGVzRRSW5CUjBmMFZrdDQ4ZTNSUjAxc1Iz?=
 =?utf-8?B?aG4zaGV1N2l3eEY4QWx2bFQ4aHVJU2FTa3l4SnE5V2t2MXIwb2pNZk9HeFZG?=
 =?utf-8?B?b0hOSDRvR09HN2U0YUxxVnVRQjZ2b2NER04vN0VEOW9tRXk0Sk0wU2N6L1pJ?=
 =?utf-8?B?bHpJM2pqY09MWXlndGt4T3BReDlNMmt5YmU0ekFDSjZjY0QvM1U1YTYra3do?=
 =?utf-8?B?T3N4bnZMWG1RMkJVb1kyRXQvTm16SlNQVmRQVnU5VkpGeTNJUHJzczZtNkJP?=
 =?utf-8?B?NEQrOXM4S3Z0Z1J2dmFDQXp6clZpU0s5MUhxZnFQekNsK1lkcEpIaVpFcjBY?=
 =?utf-8?B?bGFjTUl0NVNjdUNrbTMza3drV040eTdUSDcvK0E5UHdRa3BpdUdDb3plQk1h?=
 =?utf-8?B?MFE4QjYwSkJWV0VCUkJHZU8yM2VldUhaSGp2bWY2dkRkaE85NGdZMmJYaGlj?=
 =?utf-8?B?anRqNE80ZkE2Sm5YcENUc0RBM09KYVRwTG10eGV1eEtQVjc2SXVyNnRiSnVT?=
 =?utf-8?B?UE9VeVkxbWlpRUZ1UDJFMWZuT09RWVpzdU5rZDcxN1hKcktHV2h2SHQzTmMx?=
 =?utf-8?B?UnJuWExCRTk3MUh2ZHk4cHFNUlVWUjNLYXZGOTJPU2U3dFdRRkJhSE9ieE5t?=
 =?utf-8?B?WE5RdjZJQUxESGI0VU03YjdQQ3NYVCtvR2kyTXlHNmZjNFpJTHE1RlRTcW9I?=
 =?utf-8?B?d05EUHRMbnBJdHRKaVp4U0FqVDRqZTlReExDc0NmZXd0TjJRemJOU1FjVDNL?=
 =?utf-8?B?UStmYm9JMFI4RzcvcVBIT01aM0NCY2hVR1VLazd4STFDeGdUUlBnTXFvc282?=
 =?utf-8?B?WFNYUTdMbXlwUzNLeWc2T1JSY3NUT2crQUVBZnVYY3hRNXpHQU1DNkdqU3Jn?=
 =?utf-8?B?YWY3dGRVYTRRaWl6bFBCUXVRa05WMWF3YUhqbjVCbU9GcVd3MGZCeXRrdTRq?=
 =?utf-8?B?VGcyMTlGNGFLb0FyRDl3dnRnazAzMFJqb0JpUDJoSHlCTzdTTFdETWw3Tjhl?=
 =?utf-8?B?U2dxRHgrS2Vnc002Mk9xRzJlWWNMSTF5RDAxMHM2U1ZGSkxOSkhjK1FFTDIz?=
 =?utf-8?B?SG5SUFk2Qkx4TVFsbFdLdTloTGo0bi84WktwcHpsMzFzOVhzV2xZN0FYYnF5?=
 =?utf-8?B?dUdTTWJ3bGdJbVMyTWZONWhtdklDQTZ6c0RkTE0yQmw2a3UyOE5hWWM2RHhx?=
 =?utf-8?B?Ui9OUlFPbU9NaEwzQ25YRlBsMEtValdabFFFcW4xaG4zMmd3L0NhVy94aWZ3?=
 =?utf-8?B?RnRTREFvR1phVm5zRlZkMG9oY1NLWEV1eEJtMDNJaWtaWFA2VU84MnUwR2hu?=
 =?utf-8?B?ZHJrQzRDWWI5ak9xRm1qd05OZzJqcWhwTXpvVzE2bk95Z2ZQQnQwQ1FGdllS?=
 =?utf-8?B?eW9xVTVwcmdqUWVyUFR3M0o3UnIyTkU2Tm1ENlRRL1I0VUdMM3RmRkJ3Nlly?=
 =?utf-8?B?emhUd25pQ2E3R0daOUhmWjdhNkFkUk1SdEk1dWdyaWJZQm1USndEYS9MV2Iv?=
 =?utf-8?B?eml0UFpmNjlXWUpvWWhUSHdBVGZvSm80bHd5TmZhaVFvQm4vSzh4TU1JNmZp?=
 =?utf-8?B?N3NIckZDaTgyT1NMTTdtcGpLQ2h3K2NKY0RITkZlZWZqc2ZzNmJwL0hGKytw?=
 =?utf-8?B?T0VkM2VwQTI0bFpmRW9mZkZ3bHQ5TzVUWGhJdzQ3YVFWM0k5RkxIeTJXTlk3?=
 =?utf-8?B?L3lyYzQ0c244QVRuUlVrQnRhRSs5U0RTa2dzUkpkWEdqNTk5a0c0aGFlcWVK?=
 =?utf-8?B?UXp3ZkNIQXFIcGlLcDlMcC93WEZva3laVFNRZXpwdEhHRlRLd0QwSXVwK3hQ?=
 =?utf-8?B?NlVSZGUvWTNycE1vV09TMjJ6d0xMemJwREVPZTl4QTJuWXNQNkdRVythRXlR?=
 =?utf-8?B?L1ZrdjFId0U5QVE2TkM5akVkZVZXejhSVXo1Y3phVjJ3ck9iUDhwdzVORTV3?=
 =?utf-8?B?MHBSaUJTWTZUOEtlellBbTRkNU5zSlp2aVF0UzRrVm9EMC9kS1l0eDFLTkhS?=
 =?utf-8?Q?UAmgRvXEG+Y7BHGCHimAUHL72?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3a7198-c187-4bdd-67e6-08dbb0343732
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 06:24:11.5304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QUw6ydfIqm3Ysu9KTEjcvSZELkLqDBfBGF8d3R9EeaCDLgOY8VaTZ/mczLx2tcr7oAE5eeV0mTPOVtyFme0SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7406

On 07.09.2023 23:29, Stewart Hildebrand wrote:
> On 9/6/23 04:22, Jan Beulich wrote:
>> On 01.09.2023 06:57, Stewart Hildebrand wrote:
>>> Introduce a handler for the PCI status register, with ability to mask the
>>> capabilities bit. The status register contains reserved bits, read-only bits,
>>> and write-1-to-clear bits, so introduce bitmasks to handle these in vPCI. If a
>>> bit in the bitmask is set, then the special meaning applies:
>>>
>>>   res_mask: read as zero, write ignore
>>>   ro_mask: read normal, write ignore
>>>   rw1c_mask: read normal, write 1 to clear
>>
>> With the last one's name being descriptive of what the behavior is, would
>> it make sense to name the first one "raz_mask"? (Also a question to Roger
>> as the maintainer of this code.)
> 
> Another possible name is rsvdz_mask. See below.

Ah, yes, that's better even if for now we won't need rsvdp support.

>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -413,6 +413,18 @@ static void cf_check cmd_write(
>>>          pci_conf_write16(pdev->sbdf, reg, cmd);
>>>  }
>>>
>>> +static uint32_t cf_check status_read(const struct pci_dev *pdev,
>>> +                                     unsigned int reg, void *data)
>>> +{
>>> +    struct vpci_header *header = data;
>>> +    uint32_t status = pci_conf_read16(pdev->sbdf, reg);
>>> +
>>> +    if ( header->mask_cap_list )
>>> +        status &= ~PCI_STATUS_CAP_LIST;
>>> +
>>> +    return status;
>>> +}
>>
>> Do you actually need this function? Can't you ...
>>
>>> @@ -544,6 +556,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>>      if ( rc )
>>>          return rc;
>>>
>>> +    rc = vpci_add_register_mask(pdev->vpci, status_read, vpci_hw_write16,
>>> +                                PCI_STATUS, 2, header, PCI_STATUS_RESERVED_MASK,
>>> +                                PCI_STATUS_RO_MASK, PCI_STATUS_RW1C_MASK);
>>
>> ... conditionally OR in PCI_STATUS_CAP_LIST right here? Without
>> capabilities the CAP_LIST bit becomes kind of reserved anyway.
> 
> Hm. The PCI_STATUS_CAP_LIST bit is a read-only bit according to spec. Given the rationale below, we would want to preserve the value of r/o bits during writes, so this would essentially want to become a RsvdP bit. I wasn't planning on adding support for RsvdP bits here since there aren't any proper RsvdP bits in the status register. If instead we are okay with treating the PCI_STATUS_CAP_LIST bit as RsvdZ, then we could do as you suggest, but I'll plan to keep it as is for now.

I'd say leverage rsvdz (with a comment) for the time being, but let's see
what Roger thinks.

>>> @@ -424,9 +450,13 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>>>          uint32_t val;
>>>
>>>          val = r->read(pdev, r->offset, r->private);
>>> +        val &= ~r->res_mask;
>>> +        val &= ~r->rw1c_mask;
>>
>> Personally I'd fold these two lines into just one (and similarly below).
> 
> Will do.
> 
>>>          data = merge_result(val, data, size, offset);
>>>      }
>>>
>>> +    data &= ~r->res_mask;
>>> +    data &= ~r->ro_mask;
>>
>> This seems risky to me. I'd rather see the same value being written back
>> for r/o bits, just in case a device doesn't actually implement a bit as
>> mandated. 
> 
> Regarding writes to read-only bits: okay, I'll assume that Xen should take care of preserving the r/o bits (discarding the guests write value for the r/o bits).
> 
> If, on the other hand, we would want to rely on the guest to preserve the r/o bits during a write, then the ro_mask would effectively not be doing anything, so may as well be removed.

We may never rely on the guest doing anything the way we want it.

> In either case, for partial register writes, Xen will take care of preserving the r/o bits for the remaining bytes in the register.
> 
> I'll make this change for the next version of the series (assuming Xen will handle preserving the r/o bits).
> 
>> For reserved flags it's less clear what's best, because in
>> principle they could also become rw1c once defined.
> 
> Well, it depends on what version of the spec we read.
> 
> PCI Local Bus 3.0 spec section 6.1 says: "On writes, software must ensure that the values of reserved bit positions are preserved." PCI Local Bus 3.0 spec section 6.2.3 also says that we can essentially treat the whole status register as rw1c. Huh, that's odd.
> 
> PCI Express Base 4.0 spec defines two reserved bit types:
> RsvdP: Reserved and Preserved - Reserved for future RW implementations. Software must preserve the value read for writes to bits.
> RsvdZ: Reserved and Zero - Reserved for future RW1C implementations. Software must use 0b for writes to bits.
> Both RsvdP and RsvdZ are read as zero.
> 
> I'm favoring using the definitions in the newer PCI Express Base 4.0 spec since they are clearer.

+1

> Regarding writes to rsvdp bits: there are none of these in the status register according to the PCI Express Base 4.0 spec. The older PCI Local Bus 3.0 spec is in conflict with this definition, but at the same time the PCI Local Bus 3.0 spec also conflicts with itself by saying that the entire status register is essentially a rw1c register with reserved bits that should be preserved, which doesn't make sense. The newer PCI Express Base 4.0 spec is clearer, and appears to have resolved this inconsistency, so I'm favoring adhering to the newer PCI Express Base 4.0 spec.
> 
> Regarding writes to rsvdz bits: in this case Xen will write zero to the rsvdz bits (discarding the guests write value). This is how the patch already behaves with the res_mask, but I think renaming it to rsvdz_mask will make it more clear, so I'm inclined to rename it for the next revision of the series.
> 
> Regarding reads of rsvdp/rsvdz bits: I'm assuming that Xen should return zero to the guest for reads of reserved bits, regardless of what is actually read from the hardware. I think we already are already on the same page about this, I just wanted to explicitly state it for clarity.

Yes, we are.

Jan

