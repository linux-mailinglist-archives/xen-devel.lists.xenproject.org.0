Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FB4AD553
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267957.461722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNRj-0007Va-J2; Tue, 08 Feb 2022 10:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267957.461722; Tue, 08 Feb 2022 10:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNRj-0007Rj-FF; Tue, 08 Feb 2022 10:10:03 +0000
Received: by outflank-mailman (input) for mailman id 267957;
 Tue, 08 Feb 2022 10:10:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHNRh-00078Q-EG
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:10:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4563d369-88c7-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 11:09:58 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-U343J_WmOr-wpPEEa0YBWA-1; Tue, 08 Feb 2022 11:09:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB9PR04MB8218.eurprd04.prod.outlook.com (2603:10a6:10:24a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 10:09:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 10:09:55 +0000
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
X-Inumbo-ID: 4563d369-88c7-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644314998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M4rQrqktJ9qJOU8aq5h0JOM+mOJ+07dcVGkOMEmv3Ck=;
	b=acdGRz8neZEhNMytXdxmv5mpAUOkMe1PqSD8rC88lQcS9R+tA6gBgzJvNkEIDAxPuj+Sjf
	GttCSTHb/URvf3r6bc2PSDahg8sPyH8Hgv0ov4F6b2Z+I6JIoqYCHX3w+p4pve1zsdhbEo
	pQwZcjqENssIKKvSJN2LtwM8xVR4s8A=
X-MC-Unique: U343J_WmOr-wpPEEa0YBWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqVJFj7sNgfZVlz3CqJWIBdFHb/QrIdWunhXsdoL3ActASxI3ADx11SdcQrN1lyDSPWwURui48jvvsFyl/Ph9sGKeVrDABuSEcFUn64/x0bv999ifpSsYQ6K6m43DLJg4TS3bfqexGNObHFpK9Z5Nj6GCNOcGTYkaUUr3f6bdTFZFsaVAz2d3+avG3apidmEQn5kHpGig3BvCSdA0IWaoWw9ZvOCZPDnr7Px1n0kIrso0slvWWVx8XvCxAIOPbUxSgvV0+DsPo9sBir9h0zsrt/fN0BIoodHiiUSBsim/7tVxa4BSvsoMuDoTLWJ7f86D4kELQWCNmvbGM7H2ZPxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVBiVm4gVmAPZf44A3S0k2OTUtggg9jjCjlGY834ecQ=;
 b=GtnU6GtUf3Dt6RpSWa2FJ7iQ+wQyrO0gCAt7PLfVvuJ2QtEf7j2cOIFTxsDkhAVnghCCLmaK7DPbuGjbtC+M0epbMDVowvFgZul8I9fN7LnmhARkVuz0zty1xBS1oGjF1PB/EfWJT3YI4KMdbng+EOBLHFs/mHJVOzl75Xgz/tzpRhvgFETBgeMWsuU2zccfWEOqBumtK8f2qfd+WSDFTD7EDc9ic0CFlycxo6ufEQEIaXYAhrons6tr7D+rLkKh2aGtkyVS/siNnoGhANciKak4CrsdWvhJMrASBAm6pTFeMOHi+EXDdBLuHbhFEJw9HxYLCCjg0V9PPFK7MUqaxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15c16171-f196-38d2-370c-38627935a21b@suse.com>
Date: Tue, 8 Feb 2022 11:09:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-6-andr2000@gmail.com>
 <16cea1df-3d0f-d404-2b88-aab47ad5548b@suse.com>
 <3fe6dbe3-51c6-f87f-23f9-cf2e1a924326@epam.com>
 <582ee8f9-7b01-4adc-6a8a-ce8b1dffd534@suse.com>
 <e225553b-b29c-0448-fb9f-f8b513d9f77d@epam.com>
 <0fd8a0ac-dc91-287e-536e-1684892837ab@suse.com>
 <9f58a8ff-44b4-3249-5858-9988644b2d4e@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9f58a8ff-44b4-3249-5858-9988644b2d4e@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0097.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06402a20-0202-4a9f-b230-08d9eaeb27b4
X-MS-TrafficTypeDiagnostic: DB9PR04MB8218:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB8218BD96DF7800699E9D0B36B32D9@DB9PR04MB8218.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V0vURm6mwcW5aCUWICI0+v/w+YwMGgTk0Gyz1RCClS0i0XBSUxGFuETSfCO37VsvNENMhIa0CnskKi+OXEk6i/Oy6Ir4lr7XTYkNkkLRW26buKoPu1h6av4+/o565i2zoeh0YRhfR9URLMTyM5hlSUSY/46GTnz/8zR/38q4HbUiFmrY4eptJ+DBVIwDWSzJuKvHl7LE9ejrM5qjE9CKtIybycfhHiBjjIu/IhrSjZPK5JDLzUi7GB3pPg1rKht9XU8KjbdApnkI9SRZQs2fYPK8JeyHsrxpTHYXLf3DoCnB6YYbVpG/PlVvFGwKBLxyAQf9DtJBVgPxGoHaKroWvxgzwGYK0l/ZBLx+f5olagshdq/V3JKLssDFEtM63+VSqRE363AIq4unQS9pQfKXpQgXVIlKRD7+TuqtE9fYr+5bpZ4Dq/Vr16dlHZA7m7SN9oWPXAhXfEPrqza5WWvL/5r7N2tRn7WaHl0C+/clPwmAzX425NIZIdfjfZ/pVuYAesYT06pFiqDdNB6TsOtpN+6zfCwZaO3P07btl0L+VbGmLgR/C3Smp5k3rLkfv9faSgg5Qiu9iugZWuj4PT5PyjFuoPLnoFjSiR3jgluIc2N+UEyDTXz/k1IntF8WUIhQEsxFo6RMjsRhpPDxOWNgEFsv4rXUGFm4cHqAo0dr/vOkXSh3AIhEdoCCixvF3brHEfrpUnz9XjAn+BeWRhTI3k6QyZhcBfvBTYRIocz3FX8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(4326008)(66946007)(508600001)(8676002)(8936002)(86362001)(31696002)(66556008)(6486002)(7416002)(66476007)(5660300002)(6916009)(316002)(54906003)(36756003)(2616005)(6512007)(6506007)(83380400001)(53546011)(186003)(26005)(38100700002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kz9O6S7R5Yk+kmkxYlAdBznCcJym/VC0z+fxEBBz6S6sQGn9F0auMvL8OIi/?=
 =?us-ascii?Q?/1IAb+pn4NksHa4Wu3wusVIu+wHyCAVqcKW2+kyp/muprRdsXor2rw7FmU42?=
 =?us-ascii?Q?5bn1UnjAt4b1e+YIgXcMtjE+8OsNgy1VALcvI+qIAFhjb/Ex0WyE1/ePZAbU?=
 =?us-ascii?Q?YehSEbkx1PfDbyxukWumEaEOUQH/gMKLxYKQ5yVBrxJbi/PXJ3Vaz3f4olaj?=
 =?us-ascii?Q?t3I8UTDI4RdTw/N9ur10Wv+u3e5bnY4eaf8K/ariVsgqrYixdnt1A8eoNlsW?=
 =?us-ascii?Q?2e8QxktCgW477CV7jSLAYTbCm2o60K2ytCS9MUPLCUc/I4+Emk/fyRqUWla/?=
 =?us-ascii?Q?Z24Fmufrsah+ZjJ/idXP306NMHtApa7uc3BSVMdmiMTqgnPQQJdO/qoRetYL?=
 =?us-ascii?Q?1WTo4bPRUpzpUPzEZdgfSrEQfJJhLHJ/eMHu4UAzSEup6me3VNFrTA32vFMu?=
 =?us-ascii?Q?BoklSn9lRvSMKAkY3M8xC6jzYH00eIy6e37LeOkG1ITpIo3nKnUfdm2oCBmR?=
 =?us-ascii?Q?oYV7+GW8r2GjDa3/Js3yF+jv4YSKUx4v7Ff51/GG4wJObSvIa62tXOu1ntm+?=
 =?us-ascii?Q?Toz+dZ1d9ejEJ8pMFiEB02sAREg2rPRoLUGkTkN4VXkjjWE1xD6IuY9dSD4N?=
 =?us-ascii?Q?aqrK04T22gDNYED4I2EDoznI66m4ftxNAbEwewd1vwyCDVP8tELqLbGvT9BA?=
 =?us-ascii?Q?ZuG+eGis/DDfz5zbtgM5+B0EVjN/dqoAzmB3fX2jdmS38p3/sqXiYzBLgV3Q?=
 =?us-ascii?Q?qIoclu49P4tzvYFafz6uVaVeQd4i/z7rDmdL0BcwPkutbIzqQjwkvPd3m7Ze?=
 =?us-ascii?Q?sIg6HWqtSPbF+a278jy8YR4yThbadgwunqdyVDnsk1TVlOiySBGBBjKSxKUq?=
 =?us-ascii?Q?zxJr7vj1eeAM9uw89lmCxaMDTCAdWii5Kf1pLD/CcuHgTWL5M9laH+8+eHIP?=
 =?us-ascii?Q?04Xb8oqhfAvbu3t3hSle8wb51FDsBzK7I7YIt1enoKO/dPAsWKG3qqTMQZRY?=
 =?us-ascii?Q?7x6SXiPLFqtoG8knt7hgmVVKVtu7huiNSqPkteN85VN0Hq0BygeC/NXPP+IS?=
 =?us-ascii?Q?+a9MQuiVBZ0+VztBuFNiUNMu1GntX89tpUGu1WNG3+KiPMMUw8uBpg2zVONh?=
 =?us-ascii?Q?TeJvhK2dSH1n0lwrUiTZB5RNRbeBTDLeuRqo5VFjTg4RS1uAuZFEAnKJRZY6?=
 =?us-ascii?Q?7+0BK+UPQYnJLOrk4OFaklvel1M6r+7wnU3PK9Yo+c9mGx936dYhsClMQdIa?=
 =?us-ascii?Q?rRFQwmNvhJb2Ld+RLwXKPj56YV7ab1f7cljfG1YVs3/fND5Hnp+s/R1ycG8z?=
 =?us-ascii?Q?//kqBF9rQQEprtnh8qreI05ILpMKHTINXSRQCUS+73eNBuUJnIXpHIViWlIH?=
 =?us-ascii?Q?ZJg07wdayRAHKP7ZdxeQQmEWmRGyNBU8N9B2Aan6wQnkoy4sDnpuUW+tvTlE?=
 =?us-ascii?Q?lQPeAI2yTBVYSARdrpxnNiCg4Kvdl1mTs4VkJyPC8PREdCf+eTKgghMXfvkc?=
 =?us-ascii?Q?MrRxNnoP1eTjwZjjxBwBSYwRFmTeAiZKPHbPgKL+RwoSpqATk2fMNfspPs1L?=
 =?us-ascii?Q?rUQeYuzsYKr5e/C2w6FD2/1cuY3ftBtFr+h+WBMo+0T4grXddJQskfgK6B4N?=
 =?us-ascii?Q?UNcXBrKxb8eIpkfQrNVUPME=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06402a20-0202-4a9f-b230-08d9eaeb27b4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 10:09:55.5722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhh0cw1qJAwNpCNfIia+QwI8UEV5hWlpAergCwfe36xja5+HPUYzsnB8bNZM1H8LeunXydEQUiCYj0BzB0LMDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8218

On 08.02.2022 10:55, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 08.02.22 11:44, Jan Beulich wrote:
>> On 08.02.2022 10:27, Oleksandr Andrushchenko wrote:
>>> On 08.02.22 11:13, Jan Beulich wrote:
>>>> On 08.02.2022 09:32, Oleksandr Andrushchenko wrote:
>>>>> On 07.02.22 18:28, Jan Beulich wrote:
>>>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>>>>>> @@ -1507,6 +1511,8 @@ static int assign_device(struct domain *d, u1=
6 seg, u8 bus, u8 devfn, u32 flag)
>>>>>>>                             pci_to_dev(pdev), flag);
>>>>>>>         }
>>>>>>>    =20
>>>>>>> +    rc =3D vpci_assign_device(d, pdev);
>>>>>>> +
>>>>>>>      done:
>>>>>>>         if ( rc )
>>>>>>>             printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\=
n",
>>>>>> There's no attempt to undo anything in the case of getting back an
>>>>>> error. ISTR this being deemed okay on the basis that the tool stack
>>>>>> would then take whatever action, but whatever it is that is supposed
>>>>>> to deal with errors here wants spelling out in the description.
>>>>> Why? I don't change the previously expected decision and implementati=
on
>>>>> of the assign_device function: I use error paths as they were used be=
fore
>>>>> for the existing code. So, I see no clear reason to stress that the e=
xisting
>>>>> and new code relies on the toolstack
>>>> Saying half a sentence on this is helping review.
>>> Ok
>>>>>> What's important is that no caller up the call tree may be left with
>>>>>> the impression that the device is still owned by the original
>>>>>> domain. With how you have it, the device is going to be owned by the
>>>>>> new domain, but not really usable.
>>>>> This is not true: vpci_assign_device will call vpci_deassign_device
>>>>> internally if it fails. So, the device won't be assigned in this case
>>>> No. The device is assigned to whatever pdev->domain holds. Calling
>>>> vpci_deassign_device() there merely makes sure that the device will
>>>> have _no_ vPCI data and hooks in place, rather than something
>>>> partial.
>>> So, this patch is only dealing with vpci assign/de-assign
>>> And it rolls back what it did in case of a failure
>>> It also returns rc in assign_device to signal it has failed
>>> What else is expected from this patch??
>> Until now if assign_device() returns an error, this tells the caller
>> that the device did not change ownership;
> Not sure this is the case:
>  =C2=A0=C2=A0=C2=A0 if ( (rc =3D iommu_call(hd->platform_ops, assign_devi=
ce, d, devfn,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pci_to_dev(pdev), flag)) )
> iommu_call can leave the new ownership even now without
> vpci_assign_device.

Did you check the actual hook functions for when exactly the ownership
change happens. For both VT-d and AMD it is the last thing they do,
when no error can occur anymore.

 My understanding is that the roll-back is
> expected to be performed by the toolstack and vpci_assign_device
> doesn't prevent that by returning rc. Even more, before we discussed
> that it would be good for vpci_assign_device to try recovering from
> a possible error early which is done by calling vpci_deassign_device
> internally.

Yes, but that's only part of it. It at least needs considering what
effects have resulted from operations prior to vpci_assign_device().

Jan


