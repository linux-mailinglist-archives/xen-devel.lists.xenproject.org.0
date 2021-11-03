Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A9443E7F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 09:41:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220588.381909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miBpm-00089c-Ca; Wed, 03 Nov 2021 08:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220588.381909; Wed, 03 Nov 2021 08:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miBpm-000875-8Q; Wed, 03 Nov 2021 08:41:26 +0000
Received: by outflank-mailman (input) for mailman id 220588;
 Wed, 03 Nov 2021 08:41:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1miBpl-00086z-4S
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 08:41:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2db8c0a-3c81-11ec-8563-12813bfff9fa;
 Wed, 03 Nov 2021 08:41:23 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-gFYk2f6MMXqNhJDv3L74HA-1; Wed, 03 Nov 2021 09:41:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 08:41:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 08:41:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR03CA0023.eurprd03.prod.outlook.com (2603:10a6:20b:130::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 08:41:18 +0000
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
X-Inumbo-ID: d2db8c0a-3c81-11ec-8563-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635928882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0iEHL0QLbccmeJutcM9lxSVS+Qv9dQrsGkRl/zyoaRI=;
	b=QaTGQe+UXBzEvuSbsdBDII91jRQB7DayZqlAYtz+VqQWlKiRf+WaLVNWcNloSAvduEXKV3
	uh5b2IgIxuuvbcsnnEHlmgUVHs6FRy4Nf0h39G4F6NGSiSkNMGbh6TL2uGfsqi3XAcgvl7
	WPGC7pqAJXQcvljV/I8wYTs7ydMXHhA=
X-MC-Unique: gFYk2f6MMXqNhJDv3L74HA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4+dcMu/2eMH8F4NYsfYKNFIpLcJm7HxIbDuqyULLSYzEbQ/MVrILswBVmb+MSjGvazborFCNNg3KKmvUjjlPcCutBIIX4d9tmqti4NheYpX/XqPn7HALb/5xaTzZ6WF2FYW1IYcBvIlLfEqndv/4UjuaiA0rh/8H8bNHEcnvvQ/aeuP4C6iG2GuUYorCm1cGVqaHao14ciMCBUbhz68C0m1xqSK5rIcrvIXjfLXvFlVCiuMuO7Qmm6PC3Dd+K3KghaOQSzsV0aTdXctUUFWvU1/c0QMNAOhnEZUF2V3HmuDSyH3bQcCSl7jEAh6vilKQey6QYrwrlMZA/Az35+avQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m73GNml3GEXj5c+aoGrFbSvAaBjXR7mRF/9kTJuEFm8=;
 b=Cf0/wT3XGtyLtIyzTlONwZNcc/2FXEH/sqqbjg4ix7aoQT4gBEiYoJk6KDT5l4Q8SVr6w+nOUWDIJdZdi3/XveqTkAoMLuaAWvhzPO4vgj0S0yEOtqPLlMB7YvJPOhxvBeDvhAu2fsf56oYavcS+10hvF4ibdcsXL3UHTtZClSOtLeu89fRwx0OcI1OgUDVaryusLHaCqV2MyaGjpfrSe9PjveITeN5Ud/8QKizNX528bfqG7Y0Nms4jxlSjI3iQTk1PoetXttkqyhxiik6jM4Z6NJqVmg57DP2TmhlpjGUsj93PPGMIQiL7gSgWDKCoiuAZG+9MwynsiCW8i6Av8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ee482d2-3af5-b49a-facf-6a78ab672cd4@suse.com>
Date: Wed, 3 Nov 2021 09:41:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-11-andr2000@gmail.com>
 <YXfng3PqDI6C4yxn@MacBook-Air-de-Roger.local>
 <52b1533d-4aeb-29be-2611-9b50adea3f73@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <52b1533d-4aeb-29be-2611-9b50adea3f73@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR03CA0023.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d6ddd3e-b89b-4020-cb3d-08d99ea5b544
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7149549493D79977E3BC8306B38C9@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hcDLmJC9HDhHKjw2Xj8AlalU9+18XLAmCEYgq2VZAgLnCfg6KylvHEZzWYkaRCBprWtlrfGyvLfUz104Z/3YpZSoTearA1jwoQIismclUI7uN3inSCxvd4XrLD8orLE22u9GfaO6CKbxoBoPY1ig5rGdU3TQscVswdCmV3u/+74mmlFfw5i/xPogfnvKIGn4p0lUVuvDBBLjxX9EVInrB/V18ZO/lR+bSU/DGUco/XuRnRTlkC0NvfPJtJVYOGkyVe1MgyX6l9hEJur4mnAb+YES5wiUVPWg1pE0tTnA4jk0yToD1TroOMLq1ADzEx95zKpHeLENPuNNGlRh3XQf1r9RKXw5E1V9N5MfvN6h8HzFDM6JcG0tAw43l4ugJot5v5Mo5T+euChOeXvltozRcAoB76aNpwxJlx48WBNVXSzqhxn7E48mrxDeVYNmCZUfBCIdJHoZmv9q7qkSoli2g5wYG3DPZ20psXrthl/M5wQw1x856EtR0ZDuxbL84HdKhtA9+NfhjPhe5Wwpd6p8ApQ6KhrtgOxeWH+QrbaKc3Rpy5b3iORn64DEh8n0yzDipnQ35v7YnRFX5Bp2HbaAeedPgv2BKs37VtOlBtb7W/OjhclB/mgabALHOnOlrYKaXktsm6ldJepfTysWWQ75PiEP8e5s5p+wkgC39dKarv8ZOFp+CRjv2JChvseBztu/8CcfRIoZ57m9dazcogmg22Bn1Gy0GPewxQdNn60E/6LTb0j2aBUzFyJal+2dSvrL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(53546011)(508600001)(26005)(956004)(5660300002)(6486002)(86362001)(31686004)(31696002)(36756003)(2616005)(66476007)(66556008)(83380400001)(186003)(66946007)(316002)(4326008)(16576012)(2906002)(7416002)(8936002)(54906003)(8676002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qc6saaVJSmBfVLEXgux636NpVRDD84MZ+oP6lHLSWk0Tmpkpnds3stMNmB7G?=
 =?us-ascii?Q?c07KJn/LubRGhl243NJYD0E7Te4n8cdKwzQkaKqXeyuD3Yc4yGLV1/wG5hYZ?=
 =?us-ascii?Q?+Rt7ialo9ONKzVApyPb5uPV+WP+GcbKSCyA2AdFhM2knSNEJGYblR9BXQgX2?=
 =?us-ascii?Q?j0QlhekxseZsHFRbsYIbrUosUdWjHCWS4xEIuD7oojGMyLOXANzBvkgFIGJX?=
 =?us-ascii?Q?9BbyaBWGamkV8pVYLXPbl3ZnLMhfNXbxDRDzN7877H6xlgs9mDTFCBYJxAox?=
 =?us-ascii?Q?RmVe49MvOl0Lh/qNWnrhijwqMw0V9ts6Lx2IOdAdt+OmaGbLDgyuHomGzuO8?=
 =?us-ascii?Q?b7xWSshspKocQVUav2SD/WL7dQKWsUndS76j76sL/CKNUouwdvg9TB7LduH1?=
 =?us-ascii?Q?fOAFPU+Jyv0sPFpijD0rRus5WVCbrTGDf2/isXz+ARa0WD7r8XLw+5otlF7g?=
 =?us-ascii?Q?/D2KP5HE9azDA2WHEnGIVxGghV7kKOzVcUU95ePtGriLRGEjetTWyugDe0JG?=
 =?us-ascii?Q?C97kb6l5XtvZq5M54cDD1xeJgvwS8EPEeu9nFUqVAVdyv/SpO+ZxMMfJ8cvS?=
 =?us-ascii?Q?FzIle1PSR+HTdOhVcBVKHKUEVWSJVMC4PYrq8mcLMWfGQAki8LkjhdboidBD?=
 =?us-ascii?Q?zVfYR2F9G9sFT5Xvczu4NsN1qPneM4txE+lHELHDsNvPaTHzB7EOavMqQ6RG?=
 =?us-ascii?Q?6sYZjD7h6EQXcLUlSRhkgUE7eVaOVrYseJbtNfFN+Ni/3KMIwsDXslEOU+dT?=
 =?us-ascii?Q?fF28iK6q0nbTcuH1FYXI9AXHgiRVOAurQ8pTsCaoL1B/FzST1XUTC17schLo?=
 =?us-ascii?Q?MFPd/C96VGimA8g/XEUt5jDYshlKlvOnR3w57wfeNqXIMCW+QJi+378QyWyU?=
 =?us-ascii?Q?o+k7aojNzIdZJQtMrv4qqx1XcOcK5pxiZhMN5IkhtWXyG3W6rSxQVgZA9EM+?=
 =?us-ascii?Q?iA9cB2K/7FSS0+Q7hm07CaeAM1FQtOnsQ0/RFEunYuWehQQq3J91g4HrMXaX?=
 =?us-ascii?Q?HxX/NVe9bwclBHl2auMh49ud/PxqqO9QXuGF60pe5paRAdMsE11OwajWtXsC?=
 =?us-ascii?Q?QCW1Ny3LAVNL6JR0L8ceNetQe1BIL/Ar9DjrwR8Vrvu9d9KFCfOrX0OaqB9P?=
 =?us-ascii?Q?GxIZGXYT1/ulG6XLZpEgL9P47ewUT/0K34G8hIeLiNBAFgE2/Cs48REDdkf+?=
 =?us-ascii?Q?P0nSQ9Ur7Rc8F6GPVO07Au0y45FrsaGZNzFzAgfTZ65FkS7wbo7D0klIC9AV?=
 =?us-ascii?Q?FbdDHr/QdmPvKtdRpXCoArTPt/JD1tnx9KcAKugXdX6ZA5AkPCMyFaj8ogWm?=
 =?us-ascii?Q?a8bAqRnMCx1PAHN3mLfRGfP6hxmH1PzBGOhFNGvExQQE6MuHA+DnLOyApzmz?=
 =?us-ascii?Q?zUusGXtknlbZTeQp2XNfsmzxkXgk89iB/pyDSPbxKkuh21omQvDNb16x98pO?=
 =?us-ascii?Q?7BWOTZwJFmq5Lq57HS3SWW8ajc0hvYVse40+e6DO5UJCnUryqSFDMezTglwB?=
 =?us-ascii?Q?KlD2100U/Cv/lwwB1bXnbQqxyqsntW1SRzVOerrMxayDxWcO5pZzrCWRCLFS?=
 =?us-ascii?Q?cbktYejCvm5ZfyyrMVxBurxyPCvlRZKh8loA7mBbBDkjbp4mGEhyFToToxpJ?=
 =?us-ascii?Q?fAODpn1ukoEMt7OtRQTqtdw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6ddd3e-b89b-4020-cb3d-08d99ea5b544
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 08:41:19.8972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOHoTby8Tx+q45yYDOCu9Uij70ZoBq1OLT+XIgTU81P7/QQh6TAMlAqEu9UW9d9iQn4QcD7KNJX+a6ZlC1y4HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 03.11.2021 07:34, Oleksandr Andrushchenko wrote:
> Hi, Roger
>=20
> On 26.10.21 14:33, Roger Pau Monn=C3=A9 wrote:
>> On Thu, Sep 30, 2021 at 10:52:22AM +0300, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Assign SBDF to the PCI devices being passed through with bus 0.
>>> The resulting topology is where PCIe devices reside on the bus 0 of the
>>> root complex itself (embedded endpoints).
>>> This implementation is limited to 32 devices which are allowed on
>>> a single PCI bus.
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.co=
m>
>>>
>>> ---
>>> Since v2:
>>>   - remove casts that are (a) malformed and (b) unnecessary
>>>   - add new line for better readability
>>>   - remove CONFIG_HAS_VPCI_GUEST_SUPPORT ifdef's as the relevant vPCI
>>>      functions are now completely gated with this config
>>>   - gate common code with CONFIG_HAS_VPCI_GUEST_SUPPORT
>>> New in v2
>>> ---
>>>   xen/common/domain.c           |  3 ++
>>>   xen/drivers/passthrough/pci.c | 60 ++++++++++++++++++++++++++++++++++=
+
>>>   xen/drivers/vpci/vpci.c       | 14 +++++++-
>>>   xen/include/xen/pci.h         | 22 +++++++++++++
>>>   xen/include/xen/sched.h       |  8 +++++
>>>   5 files changed, 106 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>> index 40d67ec34232..e0170087612d 100644
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -601,6 +601,9 @@ struct domain *domain_create(domid_t domid,
>>>  =20
>>>   #ifdef CONFIG_HAS_PCI
>>>       INIT_LIST_HEAD(&d->pdev_list);
>>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>>> +    INIT_LIST_HEAD(&d->vdev_list);
>>> +#endif
>>>   #endif
>>>  =20
>>>       /* All error paths can depend on the above setup. */
>>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pc=
i.c
>>> index 805ab86ed555..5b963d75d1ba 100644
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -831,6 +831,66 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>>>       return ret;
>>>   }
>>>  =20
>>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>>> +static struct vpci_dev *pci_find_virtual_device(const struct domain *d=
,
>>> +                                                const struct pci_dev *=
pdev)
>>> +{
>>> +    struct vpci_dev *vdev;
>>> +
>>> +    list_for_each_entry ( vdev, &d->vdev_list, list )
>>> +        if ( vdev->pdev =3D=3D pdev )
>>> +            return vdev;
>>> +    return NULL;
>>> +}
>>> +
>>> +int pci_add_virtual_device(struct domain *d, const struct pci_dev *pde=
v)
>>> +{
>>> +    struct vpci_dev *vdev;
>>> +
>>> +    ASSERT(!pci_find_virtual_device(d, pdev));
>>> +
>>> +    /* Each PCI bus supports 32 devices/slots at max. */
>>> +    if ( d->vpci_dev_next > 31 )
>>> +        return -ENOSPC;
>>> +
>>> +    vdev =3D xzalloc(struct vpci_dev);
>>> +    if ( !vdev )
>>> +        return -ENOMEM;
>>> +
>>> +    /* We emulate a single host bridge for the guest, so segment is al=
ways 0. */
>>> +    vdev->seg =3D 0;
>>> +
>>> +    /*
>>> +     * The bus number is set to 0, so virtual devices are seen
>>> +     * as embedded endpoints behind the root complex.
>>> +     */
>>> +    vdev->bus =3D 0;
>>> +    vdev->devfn =3D PCI_DEVFN(d->vpci_dev_next++, 0);
>> This would likely be better as a bitmap where you set the bits of
>> in-use slots. Then you can use find_first_bit or similar to get a free
>> slot.
>>
>> Long term you might want to allow the caller to provide a pre-selected
>> slot, as it's possible for users to request the device to appear at a
>> specific slot on the emulated bus.
>>
>>> +
>>> +    vdev->pdev =3D pdev;
>>> +    vdev->domain =3D d;
>>> +
>>> +    pcidevs_lock();
>>> +    list_add_tail(&vdev->list, &d->vdev_list);
>>> +    pcidevs_unlock();
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +int pci_remove_virtual_device(struct domain *d, const struct pci_dev *=
pdev)
>>> +{
>>> +    struct vpci_dev *vdev;
>>> +
>>> +    pcidevs_lock();
>>> +    vdev =3D pci_find_virtual_device(d, pdev);
>>> +    if ( vdev )
>>> +        list_del(&vdev->list);
>>> +    pcidevs_unlock();
>>> +    xfree(vdev);
>>> +    return 0;
>>> +}
>>> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>>> +
>>>   /* Caller should hold the pcidevs_lock */
>>>   static int deassign_device(struct domain *d, uint16_t seg, uint8_t bu=
s,
>>>                              uint8_t devfn)
>>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>>> index 702f7b5d5dda..d787f13e679e 100644
>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -91,20 +91,32 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *=
pdev)
>>>   /* Notify vPCI that device is assigned to guest. */
>>>   int vpci_assign_device(struct domain *d, const struct pci_dev *dev)
>>>   {
>>> +    int rc;
>>> +
>>>       /* It only makes sense to assign for hwdom or guest domain. */
>>>       if ( is_system_domain(d) || !has_vpci(d) )
>>>           return 0;
>>>  =20
>>> -    return vpci_bar_add_handlers(d, dev);
>>> +    rc =3D vpci_bar_add_handlers(d, dev);
>>> +    if ( rc )
>>> +        return rc;
>>> +
>>> +    return pci_add_virtual_device(d, dev);
>>>   }
>>>  =20
>>>   /* Notify vPCI that device is de-assigned from guest. */
>>>   int vpci_deassign_device(struct domain *d, const struct pci_dev *dev)
>>>   {
>>> +    int rc;
>>> +
>>>       /* It only makes sense to de-assign from hwdom or guest domain. *=
/
>>>       if ( is_system_domain(d) || !has_vpci(d) )
>>>           return 0;
>>>  =20
>>> +    rc =3D pci_remove_virtual_device(d, dev);
>>> +    if ( rc )
>>> +        return rc;
>>> +
>>>       return vpci_bar_remove_handlers(d, dev);
>>>   }
>>>   #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>>> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
>>> index 43b8a0817076..33033a3a8f8d 100644
>>> --- a/xen/include/xen/pci.h
>>> +++ b/xen/include/xen/pci.h
>>> @@ -137,6 +137,24 @@ struct pci_dev {
>>>       struct vpci *vpci;
>>>   };
>>>  =20
>>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>>> +struct vpci_dev {
>>> +    struct list_head list;
>>> +    /* Physical PCI device this virtual device is connected to. */
>>> +    const struct pci_dev *pdev;
>>> +    /* Virtual SBDF of the device. */
>>> +    union {
>>> +        struct {
>>> +            uint8_t devfn;
>>> +            uint8_t bus;
>>> +            uint16_t seg;
>>> +        };
>>> +        pci_sbdf_t sbdf;
>>> +    };
>>> +    struct domain *domain;
>>> +};
>>> +#endif
>> I wonder whether this is strictly needed. Won't it be enough to store
>> the virtual (ie: guest) sbdf inside the existing vpci struct?
>>
>> It would avoid the overhead of the translation you do from pdev ->
>> vdev, and there doesn't seem to be anything relevant stored in
>> vpci_dev apart from the virtual sbdf.
> TL;DR It seems it might be needed from performance POV. If not implemente=
d
> for every MMIO trap we use a global PCI lock, e.g. pcidevs_{lock|unlock}.
> Note: pcidevs' lock is a recursive lock
>=20
> There are 2 sources of access to virtual devices:
> 1. During initialization when we add, assign or de-assign a PCI device
> 2. At run-time when we trap configuration space access and need to
> translate virtual SBDF into physical SBDF
> 3. At least de-assign can run concurrently with MMIO handlers
>=20
> Now let's see which locks are in use while doing that.
>=20
> 1. No struct vpci_dev is used.
> 1.1. We remove the structure and just add pdev->vpci->guest_sbdf as you s=
uggest
> 1.2. To protect virtual devices we use pcidevs_{lock|unlock}
> 1.3. Locking happens on system level
>=20
> 2. struct vpci_dev is used
> 2.1. We have a per-domain lock vdev_lock
> 2.2. Locking happens on per domain level
>=20
> To compare the two:
>=20
> 1. Without vpci_dev
> pros: much simpler code
> pros/cons: global lock is used during MMIO handling, but it is a recursiv=
e lock

Could you point out to me in which way the recursive nature of the lock
is relevant here? Afaict that aspect is of no interest when considering
the performance effects of using a global lock vs one with more narrow
scope.

Jan


