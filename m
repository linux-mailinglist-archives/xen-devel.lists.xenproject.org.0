Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5F3419615
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 16:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196933.349842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrRn-0002Ub-4q; Mon, 27 Sep 2021 14:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196933.349842; Mon, 27 Sep 2021 14:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrRn-0002SO-0B; Mon, 27 Sep 2021 14:17:35 +0000
Received: by outflank-mailman (input) for mailman id 196933;
 Mon, 27 Sep 2021 14:17:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUrRl-0002SI-Hv
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:17:33 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76bce6eb-f72b-4bf5-a924-21dcd9f9df83;
 Mon, 27 Sep 2021 14:17:32 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-H8Q34x9PODy28DvvTqhCNQ-1; Mon, 27 Sep 2021 16:17:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2957.eurprd04.prod.outlook.com (2603:10a6:802:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 14:17:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 14:17:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0010.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 14:17:27 +0000
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
X-Inumbo-ID: 76bce6eb-f72b-4bf5-a924-21dcd9f9df83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632752251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/q5MK7EPL24fpKUHgKon7EQFXJWgnC9xdYrW+2UuBKc=;
	b=MCS/odGUBiNZyQkxUg2qw5Q6qpTLBTdY8ct5I3GDwFVHfS5A1wjCsAXGGqNxXQY3WVsKOO
	ZDoJcTx1YvpXOtMKZEOoLoVU9MuT7Uzvp2yrwnOnmUgYFn8HEwOe95bbjCjQdB7kwQldDa
	bPSG5TMOF0IpTFYZJpXFOj/S0+sAOwQ=
X-MC-Unique: H8Q34x9PODy28DvvTqhCNQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik222J2n8WKOrtkQq9c68GNpUM1h3450cFk5/zkE8Wb6riKi29jOQpm+jDXoJrp5ftpXgGVngOOLBopS2J7PK466zeXokfKbA1Y6XKVApXaPgOgGiVcS5Nzzs2baRol+1flww1NsIhCEseZ/x8t/L3XjjrvoqKdK4Lj4sHT31o9djBnANJ5OJSrFpzmOD3D2M6vy8bdAeEm1mV3Pe6lkJcIzjvSxLuhX9nCYac3sAtNI5xztgfWNeJ0pCe1XWx8Mjg7Uzl0pMgV+5qZzkG3p2mkWvP+H5Aw66eGELf9hD30R1LUcQKUB0+kts00gRY0+zwgCEgamZ19SM4X1ZWW6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/q5MK7EPL24fpKUHgKon7EQFXJWgnC9xdYrW+2UuBKc=;
 b=SCzg+hali+lSRSuRIruz9atVOxXjI3pEKrWspDbu5PoJK54vJEwCVxDXD/93NaNgOXHGZhNCUeDptzOKBOGVU3HyHAkkNgG+0ByWSh1gWlNRSgHFPPu3NK9xy+xUMJGRGWgXFMVuDABytmI77NfWeDe1vUcF7NqMRCqRrFZiPHy0xFw+D4vuhE5+VxsqXuHV6vMV0yfsva0O8BQ8nKU0//ILWQLfe1omd2wK5LguCdC23NxNqegTsiS2goOnaHdA1s0Wn5hEfy6LXvQDuzqcEuVVFkn8pcLEPvJIbYVqWi5RE4sLhhKge0Nw1WLp9umwMzGHuBemBTyF3Eg1teWBGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
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
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-12-andr2000@gmail.com>
 <df675ecd-3774-4b5e-241b-0a68e36c99f9@suse.com>
 <d08a9d34-5f75-f266-f8fb-95594fb0a8b0@epam.com>
 <3dcba7a0-6984-a9bf-6121-5003bbc2ccaa@suse.com>
 <27378eb1-7dad-29a4-a136-c9e5e55a2067@epam.com>
 <299f330a-3a99-e87a-d182-762247371e3d@suse.com>
 <e0ee94e4-4076-ac51-f5a8-d895220d1522@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67bf6cff-5e1f-0770-f212-b6bc0d82838e@suse.com>
Date: Mon, 27 Sep 2021 16:16:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e0ee94e4-4076-ac51-f5a8-d895220d1522@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0010.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ebd5346-1300-435c-b2d2-08d981c18921
X-MS-TrafficTypeDiagnostic: VI1PR04MB2957:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2957FF930EA1235A0DE94AFAB3A79@VI1PR04MB2957.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c8t/WbZTnSh/4RBA1TZc1h6jn7BdM0qDMXmfCBIQsyXsypuY3AWEs2kc8DFILAKVDlAcsATihOCw5WU9jfqMIkwLniuyGd89S8tw8QAp7I3aMP2UU5KFolf9K+sopEY7weEWO3s56R7bCV4HA+7ru5DxT/lMG4MfMEZomhmey3PjuClxO6VWkhHlzO/WqXEbwsngUW0pgQyCLV731dHAtt8Xv2VzpGZ04Y/iLcEnlw//MsK0iU/jD1PgRh2NmCPjYwNp8UcP5Z2Bf+U5nL8QND+ag+KIug2Ped0yF9qjxNYQr5ikQ2/K9wypRgKprCtYp8Zdw051GzPIEZDwsx8Hr+9r8a68OPCoxQ6E74DANo5IlvS4pVt+xqr1d5MWxtXcECVSaWCakGyIqURXkXrwUdRDTvy+l0eF56jldEHi0T4vuByK7+VduLyEbDLYvXciBt7GawzhK77zW6JZV2PTZ8IJQlxWDzVoV6qIcXxKrMg8XzGmjz68ESzt8BPYRkRx4ajNJOm3EHr8zeVRg8toEtx18bhkq7FPAIGUMaqcrIzXx/NEKU6wlCZktrhgWxv0FmRzgiw8lTqtv8Lj0UDHFgbvthKjvASIB+u7PuIEa6EbauhdIvz6Z7P5BtfzcXYY3vtcsuhde3ZJJXn0n0QMJcyq6FqFKNySE+6pyRwaqLOgTzZgUpmWU94NH0zTb2d1Ios6Fgx19P80mSWAPbPijLoQgLB5cr3+GICz1Z29BY009Eb74XHypIfnO46/buNj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(508600001)(2906002)(53546011)(8676002)(186003)(36756003)(8936002)(31696002)(54906003)(956004)(6916009)(6486002)(38100700002)(316002)(16576012)(2616005)(83380400001)(6666004)(66476007)(5660300002)(31686004)(4326008)(66946007)(86362001)(26005)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVRuT0VYem9BMjZZNC9XZ3BTMUhoQkVVRlZMUk1id002VU9sTjA1Ny9EWFdL?=
 =?utf-8?B?UWlKblFQVUw1OUZUREpjd3F5cFhTT1U0RDlldUtDeDBib0V0K1RlcVNzaGpv?=
 =?utf-8?B?MjBCVDBnZFpGUTEzelhHcDhmQU9CREdyVVZjSHdGOTBzS2pWc1hrRHF4YXds?=
 =?utf-8?B?aTM1RGtkMjFSNzgybXZNbkw5RkF3d29Yc0ZBQlNxRkxKSjZHL2xOTXB5djVR?=
 =?utf-8?B?b3UvM1hpWHJwUGYyZWo5cTMvSlBMTTh2UjJwS05lMDM0aXBkY2k2SVVqWUxm?=
 =?utf-8?B?azNucTBmL25lcnNDMGltMjJvbEQ3ZEdJZGQycDRtYVFTUHJYam95UzB0Rmk1?=
 =?utf-8?B?T2lvWE45NGxHR28yZ2NGVTkzc1VjZ1hHUmw2VVRJRHNoY1dSRG9qc1lpTmFN?=
 =?utf-8?B?STlvTUZ0ZU9sY2Jqbk5hbzNVWk1qa1BYOWllODduSUloUE1IZVNUZE9xeUJ1?=
 =?utf-8?B?VE8veXJPSE9Tendyb1EvT0tIc3VUZkJVczZ3b3hNZzgzVzBpM25iaklQY0hn?=
 =?utf-8?B?UWU2Tml3TlBqY3ZQeDAvQ292eXA0bTFSMUJFUFBxc0FXVFZOajVuNjdkYjQr?=
 =?utf-8?B?ZkZiZzkvYVV3bmJTT0xFV3hTMDR2ci9NVVFMM3VQWmQ0MHovUkhUb05SUVR1?=
 =?utf-8?B?Nloza0d3ZStidFhrM3V2RCtyVDduUU1SalJkZEZ3dSsxb1VGREkwZ3ZFNjcv?=
 =?utf-8?B?ZmpqN05hYm9KQzR6SGhJQVNCUUdNMEd5c21QdnlHZnZocU9QZzZZdGpCQ01m?=
 =?utf-8?B?SFlLcTIzRXYrSWR0d0x1SXhuYjVwc0tVa1RmV29Nb0lDSEF4Q1JMTU1BSFJN?=
 =?utf-8?B?aUw0dmY4dnNTMTJwcWZMMUxabHJlUTlJVzVkVXRtREd2d1Yra2M1K0R1VmxU?=
 =?utf-8?B?dVNnTm9PVU9TMDlEaTl4UExiRmltTzVNT1doQmZpUkNDOUtlRWRlKzRubDc0?=
 =?utf-8?B?QUVKUGp5cW44RG9uSkVkZ0crZ2ZnSGxxbytWTmJJTjNrQ0h6QTJNTnVMVEt4?=
 =?utf-8?B?TDVRK2tyNnQ1dUpKTUh6emJwdWl3TEN3clQwNzcwTjd0SS9sU0U1ZnpocWhY?=
 =?utf-8?B?THlsU2luZUYwWFdRWmVWRDhUc0hqeElsdmJFc3Q4bkExMGFZN0ptY1pFbnA4?=
 =?utf-8?B?ZEpOTFZVako1OEpFQ3JLQ2NNQmg2dVlLNnQzWEprQy9WWFp3amI4c2gvN0JR?=
 =?utf-8?B?RFp5aTZqZlJqdUYyN0NOTEtCaWRrSkh5RDIvb1lzcGZ0WlNyN04vN0Z2QkNN?=
 =?utf-8?B?MmY2aDB1MHo0RU53YzRPeDZoZUlQT0tHc0pjSnhTNitiY2N2SmpOeWtBQnBT?=
 =?utf-8?B?eFlNajcwem5tMFVIS2dZWnJMM3RoSmNpUjN5MjBOa29IczFyUHk3WnBJeSt4?=
 =?utf-8?B?djhTcC8rK0tBcXZzUUlTdUduRUx0NVl6UzV6SVd0SUFXdnMrU1FvZ3RNbUV6?=
 =?utf-8?B?bkNneThZU2crb2hVZG9JWHloMUJzT1kzUW5yL3pMSVArZnozVFFVK0xLVWd2?=
 =?utf-8?B?RURvM2tURERBazVDNlc2MVFLUGxnQlk1dUlLL3RuZjNVUnl6cEh2cVZXK0pJ?=
 =?utf-8?B?RllxRmRpZjAyVUpyTnNwTGdtdjIrbUt5SklrbVFKNldqK2tOaDJsaGkxcUU0?=
 =?utf-8?B?VkREKzhoZlAreUw1RXcvanVGVXU3N0hXWWFlSHliRGhxamRsZVRscTBKUUlO?=
 =?utf-8?B?OXRNaHlNSVRDNXp0SURlT05yMXRLbEJKbVA4VE1JUXFidVRmK1VheXloM3Vn?=
 =?utf-8?Q?gDpITFQaZlSJs7xRfeuCUnCEUNY4LI/QUWeOWFX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebd5346-1300-435c-b2d2-08d981c18921
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 14:17:28.0173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stVNI6L1RmoQns9FnQ38lTL8uhTSqt4+Bq2RsAl8mIvuosyZZSsaCnxLyauqve/SHAYKCTWuEHWiBoRhRb6/FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2957

On 27.09.2021 16:04, Oleksandr Andrushchenko wrote:
> 
> On 27.09.21 16:51, Jan Beulich wrote:
>> On 27.09.2021 15:43, Oleksandr Andrushchenko wrote:
>>> On 27.09.21 16:34, Jan Beulich wrote:
>>>> On 27.09.2021 14:08, Oleksandr Andrushchenko wrote:
>>>>> On 27.09.21 14:31, Jan Beulich wrote:
>>>>>> On 23.09.2021 14:55, Oleksandr Andrushchenko wrote:
>>>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>>>> @@ -890,6 +890,31 @@ int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev)
>>>>>>>         return 0;
>>>>>>>     }
>>>>>>>     
>>>>>>> +/*
>>>>>>> + * Find the physical device which is mapped to the virtual device
>>>>>>> + * and translate virtual SBDF to the physical one.
>>>>>>> + */
>>>>>>> +bool pci_translate_virtual_device(struct vcpu *v, pci_sbdf_t *sbdf)
>>>>>> Why struct vcpu, when you only need ...
>>>>>>
>>>>>>> +{
>>>>>>> +    struct domain *d = v->domain;
>>>>>> ... this? It's also not really logical for this function to take a
>>>>>> struct vcpu, as the translation should be uniform within a domain.
>>>>> Agree, struct domain is just enough
>>>>>> Also - const please (as said elsewhere before, ideally wherever possible
>>>>>> and sensible).
>>>>> Ok
>>>>>>> +    struct vpci_dev *vdev;
>>>>>>> +    bool found = false;
>>>>>>> +
>>>>>>> +    pcidevs_lock();
>>>>>>> +    list_for_each_entry ( vdev, &d->vdev_list, list )
>>>>>>> +    {
>>>>>>> +        if ( vdev->sbdf.sbdf == sbdf->sbdf )
>>>>>>> +        {
>>>>>>> +            /* Replace virtual SBDF with the physical one. */
>>>>>>> +            *sbdf = vdev->pdev->sbdf;
>>>>>>> +            found = true;
>>>>>>> +            break;
>>>>>>> +        }
>>>>>>> +    }
>>>>>> For a DomU with just one or at most a couple of devices, such a brute
>>>>>> force lookup may be fine. What about Dom0 though? The physical topology
>>>>>> gets split at the segment level, so maybe this would by a reasonable
>>>>>> granularity here as well?
>>>>> Not sure I am following why topology matters here. We are just trying to
>>>>> match one SBDF (as seen by the guest) to other SBDF (physical,
>>>>> as seen by Dom0), so we can proxy DomU's configuration space access
>>>>> to the proper device in Dom0.
>>>> Topology here matters only in so far as I've suggested to have separate
>>>> lists per segment, to reduce look times. Other methods of avoiding a
>>>> fully linear search are of course possible as well.
>>> Ah, with that that respect then of course. But let's be realistic.
>>> How many PCI devices are normally passed through to a guest?
>>> I can assume this is probably less than 10 most of the time.
>>> By assuming that the number of devices is small I see no profit,
>>> but unneeded complexity in accounting virtual devices per segment
>>> and performing the relevant lookup. So, I would go with a single list
>>> and "brute force lookup" unless it is clearly seen that this needs to be
>>> optimized.
>>
>> Just to repeat my initial reply: "For a DomU with just one or at most
>> a couple of devices, such a brute force lookup may be fine. What about
>> Dom0 though?" If the code uses the simpler form because it's only
>> going to be used for DomU, then that's fine for now. But such latent
>> issues will want recording - e.g. by TODO comments or at the very
>> least suitable pointing out in the description.
> 
> As we do not emulate virtual bus topology for Dom0 then it is
> 
> clearly seen that the code may only have impact on DomUs.
> 
> But anyways, virtual bus topology for DomUs is emulated with
> 
> a single segment 0. We have a single list of virtual SBDFs,
> 
> again, for virtual segment 0, which maps those virtual SBDFs
> 
> to physical SBDFs. So, we go over the list of virtual devices
> 
> assigned to that guest and match the virtual SBDF in question to
> 
> its counterpart in Dom0. I can't see how this can be optimized or
> 
> needs that optimization because of the fact that Dom0 may have
> 
> multiple segments...
> 
> So, how would that comment look like?

Well - if the plan is that this code would never be used for Dom0,
then all is fine as is, I guess. But as you can see the Dom0 plans
on Arm wrt vPCI weren't clear to me at all.

Jan


