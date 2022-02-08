Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611E04AD474
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:13:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267804.461557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMYs-0001sR-4J; Tue, 08 Feb 2022 09:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267804.461557; Tue, 08 Feb 2022 09:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMYs-0001qc-18; Tue, 08 Feb 2022 09:13:22 +0000
Received: by outflank-mailman (input) for mailman id 267804;
 Tue, 08 Feb 2022 09:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHMYq-0001qV-VR
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:13:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b6c7229-88bf-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 10:13:19 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-BjCCoX7BMQWl_RCAg2HGOw-1; Tue, 08 Feb 2022 10:13:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0401MB2603.eurprd04.prod.outlook.com (2603:10a6:3:7f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 09:13:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 09:13:14 +0000
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
X-Inumbo-ID: 5b6c7229-88bf-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644311599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t8F7/gOjZAQoZtPJPDkVTRgvlJaJU2RInZ/UBusARmo=;
	b=Dq0nleNIz4h+iwbZPSq2IZnyR7CbEl1Erpb5UIouAYudpT9BsuJNULUufYmTLP6ArXnOY7
	HdfG8tkF489EPSyL+jdedlZ+sDUeqkRynJKiASZg0k0fc794ltByzpXWGZ1Oipcv2iuYrX
	w5zTgSX3gNSR6TtCXL5UtN67zhPORpI=
X-MC-Unique: BjCCoX7BMQWl_RCAg2HGOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVDm8f7zE55wNEJq3qXZ5WmOn4/mDBmOLErANAG00zrkGxC2it9Gpcj+XkSuRwQ/+I4yMwjI0jCz/pa9cSjidtbEoTZynxP2ON6VTSKC/CotMF37NhXDztZtUwxCnw4U+AvHmgYkVdlmb+/acPYKtbzWZmKyfir3Q77fDBLFGSsc+ye2meRcm+8057vTBy77T/QpO38D0c8WmK4PeLxhdn+Ppjvj8ZD4fcmjAOQo9aELTLxf2dxxasaoMQ3aTMIDwFnSv6rKZqbF5bRmT7edCdWhBf5DtWDzDTuQfcEr7AZityJXRBB2TLfvLjn5iKiYen1ytBQz1bJbx1JUJChW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZhkuTvk2s3fwfIlWlZJaCohiqBwMd3YeNsSCtrQL3c=;
 b=Vu8zKc36TgAkfSf2mcYWbxEwpMN0YbtS0LoG0mnsx2MZ7SJQ5rSCDGDOgK6QGavIG+BCIqO7kAifqd/VdrWhs8mT+G4if5zvMMiyvVo/tvy8OUgeYjII2d5CsEwF3sElJ0MpSdN55DJHkwyO5WIL1vIVpBYFVMFNr4DaatMVhsjSN1wt6VBZ7EYmoBX3XIL1wxVy0ohMtgc+lRwMcvB2skQ4OPUalBoYe9ioAbGGSZA396JMky7Q9dQoArDn15D9xd6DUf0lCO8/d1KayCPnreNwthwSJbLlzR90FY36g9xfAXs9B7RxW/KG5qE3sxfJfkVybE+w46wK17F6DAllSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <582ee8f9-7b01-4adc-6a8a-ce8b1dffd534@suse.com>
Date: Tue, 8 Feb 2022 10:13:12 +0100
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
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-6-andr2000@gmail.com>
 <16cea1df-3d0f-d404-2b88-aab47ad5548b@suse.com>
 <3fe6dbe3-51c6-f87f-23f9-cf2e1a924326@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3fe6dbe3-51c6-f87f-23f9-cf2e1a924326@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P194CA0009.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d30bbd8-8cac-4731-6d7c-08d9eae33ca6
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2603:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB26039A56CE9642499E956579B32D9@HE1PR0401MB2603.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z81AxXIi2wJ62/u6BGWAxB52iRu3NUfPVHJATWQQxl5nV/naePAYitQwi7VKskWa5ZWQ+gvk1zS81Yu25fMe/Xi2fL2nTVHRIr4vF9apSGfmeGkxODnjVrR5vpbHAwf7cnliFAdsgMDZSsUAc8tRgubmm2UgzUq+dNeqo6HpcpZ4gF2EX/7TlO/ylYwBkdAeNyo314M/4UJT3sG8h4caqnDmwMRdnlPJ03PqwjUcO/EsaNLjNlDtqevr/oQwKwkwHT4pXMvqKEgiXAARPmQhETruwHGhfdj9e+KkiwtWE6W9n52Do1UnmNDYy4A8mnLUB6n782xXKdzEEpRXsMlKKZzbBEsCmsDaAo57YVHNLsTJNrcbV5dTncnjQ4iqO+M27mJMNlHKNpXG/Ayw63EOI+OI5g0lFa972MbyWNT+YKH61Sq+mIJOn809pvd4A0UYd7aTMCUZ/RvVUo1v4phV/YYss+Xn8oldaq/9oDVOzgxWvXlO2jti6obrYuVdJ9mQV7Y9xOS9De5bBNisa21YIEvJkO7HaieumpjeTIrvbwjuwCMEN6MDoY0vu+5KnJ3JnWhvWqcr52mVhbm0hi4FX9B1FQi7BUOq8ERcWXv/cuBQ3RRhGRf04L6oij+nHU4PwD+Nz0VNK9aNeETs9hlm/oFECHjqtGXu4muInvgvbCWJXe8yfsLLI7+bkVZTDbaICUqGRKO/FHe2OjyxqmXudKkwRk9bMm6Atr0HhwQ9dCw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(4326008)(8936002)(66556008)(83380400001)(66476007)(31686004)(36756003)(508600001)(8676002)(6486002)(26005)(66946007)(86362001)(31696002)(53546011)(6512007)(5660300002)(38100700002)(6506007)(186003)(54906003)(6916009)(2906002)(7416002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4PAX8/gnif31izUV6TIw7t7bEy7bqw50yjwUOgAuzWq5Cb1PFFIHXUw/XY6N?=
 =?us-ascii?Q?dlBOHXPbkAoA9VQAYSAPq/fVpbuc4fENK5yafdCGGOjDBO3SnrrxwmuqkTP4?=
 =?us-ascii?Q?LjtGsMu92rkx5cZLJ89jGkBECrvZXJ41wFLUw36V1AJtQ1O/A0wKcFW6SEDq?=
 =?us-ascii?Q?nmhcFD69MRgVrdx4jPbE7I4cb27LloSaIMr+ZRo4+RjJyyWMvb/UM+Cb5OpM?=
 =?us-ascii?Q?hlv4mdZ8WpnjvUiCMChYzkfI5X0dbATfi2tTJQSkNY9NT8+d+mP7HkGbPdzg?=
 =?us-ascii?Q?K6ny0dvpOO7UVHajBzzfUZcVrnwJehT2zCoZtrMpV0lupnM2KDK19OiuLSP7?=
 =?us-ascii?Q?iBqMZJOeUPBlCpapDhHpLlZEKbMYaLVGvzQoXsQYAkIkSvAE0NRjDlvw/6EW?=
 =?us-ascii?Q?Reqq4DfkLuWZ+dfaXvlUsfwHIfl2xlhWj75nnlZDtKjOGyKCNDzAPZp2v1xq?=
 =?us-ascii?Q?8lTaO1XO2HI49RFIhlIoWwLhec3ys1ePmwTm2YQsxE4XXhU+SFidCjmwiNCF?=
 =?us-ascii?Q?s468gm02srW+MlajKmUSkp/lFiwhDPHYscaOvggYuJL7WL8KlcsxE2cWZ4ww?=
 =?us-ascii?Q?uSnBJIODRmjfzEjswMEMmHVESRkMaXnWCNUlgrI0Qani6Zf5IFb2Ncb15tgS?=
 =?us-ascii?Q?kZ17IxyNA2DKrNuttbXnTOOLNoqw/PpHFAKkynJb1VU8SfFJS+al0URT24bq?=
 =?us-ascii?Q?U6SaMlzN0HMNsZ1iRY9grX4/Vdadvyzgp34H6PSF7OIfB8y6BEyfgXH1uRgo?=
 =?us-ascii?Q?HUzE2y56RIxShAl0byA4jixqv9CqE3PyG4LgaUm7xPguM0wos/pdB+TpkH0D?=
 =?us-ascii?Q?eGiRbKJyarHlczxRThY+U/22Gfm5BzS6mQwih6pkA2ozSOW5qYpTtBIlEfOU?=
 =?us-ascii?Q?o1OYm1LnVVmfHvrpuVAhFb5VNx95zu7KY93fGuuJio5GHPPOhSVYQimI8Mbp?=
 =?us-ascii?Q?DowL75+1K18sScU9jfpbyF5xcFFfCdHvop1TBIGK4Gf0SVSTs2AZbf+iXFnM?=
 =?us-ascii?Q?S9OyT7EqFG/jvtYDMwC121nlcmsQW4QevjWZL5pZhlAgz69+oNIIpKVmgN9h?=
 =?us-ascii?Q?Awb+Oz85ewJ4B/FyPOY6tWq2r9luQnC2gVS5RYbmLLTB7EW8CaUo8riRBr4q?=
 =?us-ascii?Q?O20CbVQovfFSYZuHIrz2uV73BoonxJR6b/NWvnGJivWyx0tZLa0oLNPeebij?=
 =?us-ascii?Q?Qtssn0PH/4Ke62zkGPY/jYsls6tzU67cW9aeYKicc2snDvYh48U+kSGAynmT?=
 =?us-ascii?Q?L9l7k3nFBakggipEam/7ZSggLm0gV0uB+0n65ZO8Ch89CLyw2/GkFZc6ZgT8?=
 =?us-ascii?Q?pmSV4d5egOez66iY7a9fCGUUHXuZq0w2GFTY2HsYY+bfq4ADKJs+Ec3iOIkO?=
 =?us-ascii?Q?jDOnuqoWBBdm2nNvTgHvW5e44mpBbCc/tftJEljdw7A9Hg4LipU/tdrvgus3?=
 =?us-ascii?Q?2NNknP35235MUaO/yJbIE3XIRQ19j5SBgGQMQIpiS7F3THiQXlRFN5a8w1uJ?=
 =?us-ascii?Q?oEQSsglvxBnz3Ijod6vEWPMvJj6yW+levCPC8xfsYsIXp5ZzrHRbgwtuNdnO?=
 =?us-ascii?Q?7WHwwJsztGRKG0ptL4c3z3tFqITZnKTCbku2/QJJBBSyQDf2ce2PNcYPUYXo?=
 =?us-ascii?Q?CupkC+iRsP6znxLsWuBVfhQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d30bbd8-8cac-4731-6d7c-08d9eae33ca6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 09:13:14.7370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNeWbTCF3pGYFEK2FeE0tLSzP3jXqZ6i2xkCwYDKui3RRIsrnVpIRUioMMb6y8VCyVntZugHL2Ww5hgPdbWN+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2603

On 08.02.2022 09:32, Oleksandr Andrushchenko wrote:
> On 07.02.22 18:28, Jan Beulich wrote:
>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>> @@ -1507,6 +1511,8 @@ static int assign_device(struct domain *d, u16 se=
g, u8 bus, u8 devfn, u32 flag)
>>>                           pci_to_dev(pdev), flag);
>>>       }
>>>  =20
>>> +    rc =3D vpci_assign_device(d, pdev);
>>> +
>>>    done:
>>>       if ( rc )
>>>           printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
>> There's no attempt to undo anything in the case of getting back an
>> error. ISTR this being deemed okay on the basis that the tool stack
>> would then take whatever action, but whatever it is that is supposed
>> to deal with errors here wants spelling out in the description.
> Why? I don't change the previously expected decision and implementation
> of the assign_device function: I use error paths as they were used before
> for the existing code. So, I see no clear reason to stress that the exist=
ing
> and new code relies on the toolstack

Saying half a sentence on this is helping review.

>> What's important is that no caller up the call tree may be left with
>> the impression that the device is still owned by the original
>> domain. With how you have it, the device is going to be owned by the
>> new domain, but not really usable.
> This is not true: vpci_assign_device will call vpci_deassign_device
> internally if it fails. So, the device won't be assigned in this case

No. The device is assigned to whatever pdev->domain holds. Calling
vpci_deassign_device() there merely makes sure that the device will
have _no_ vPCI data and hooks in place, rather than something
partial.

>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -99,6 +99,33 @@ int vpci_add_handlers(struct pci_dev *pdev)
>>>  =20
>>>       return rc;
>>>   }
>>> +
>>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>>> +/* Notify vPCI that device is assigned to guest. */
>>> +int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
>>> +{
>>> +    int rc;
>>> +
>>> +    if ( !has_vpci(d) )
>>> +        return 0;
>>> +
>>> +    rc =3D vpci_add_handlers(pdev);
>>> +    if ( rc )
>>> +        vpci_deassign_device(d, pdev);
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +/* Notify vPCI that device is de-assigned from guest. */
>>> +void vpci_deassign_device(struct domain *d, struct pci_dev *pdev)
>>> +{
>>> +    if ( !has_vpci(d) )
>>> +        return;
>>> +
>>> +    vpci_remove_device(pdev);
>>> +}
>>> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>> While for the latter function you look to need two parameters, do you
>> really need them also in the former one?
> Do you mean instead of passing d we could just use pdev->domain?
> int vpci_assign_device(struct pci_dev *pdev)
> +{
> +=C2=A0=C2=A0=C2=A0 int rc;
> +
> +=C2=A0=C2=A0=C2=A0 if ( !has_vpci(pdev->domain) )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;

Yes.

> Yes, we probably can, but the rest of functions called from assign_device
> are accepting both d and pdev, so not sure why would we want these
> two be any different. Any good reason not to change others as well then?

Yes: Prior to the call of the ->assign_device() hook, d !=3D pdev->domain.
It is the _purpose_ of this function to change ownership of the device.

Jan


