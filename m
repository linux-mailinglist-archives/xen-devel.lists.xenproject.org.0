Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F292452C56
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 09:02:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226183.390792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmtPZ-0005FS-5e; Tue, 16 Nov 2021 08:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226183.390792; Tue, 16 Nov 2021 08:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmtPZ-0005CW-1A; Tue, 16 Nov 2021 08:01:49 +0000
Received: by outflank-mailman (input) for mailman id 226183;
 Tue, 16 Nov 2021 08:01:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmtPX-0005CG-Oj
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 08:01:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71e0b567-46b3-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 09:01:46 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-8JuVNTJ5M5qriHWGYTj3qw-1; Tue, 16 Nov 2021 09:01:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Tue, 16 Nov
 2021 08:01:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 08:01:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:20b:100::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18 via Frontend
 Transport; Tue, 16 Nov 2021 08:01:43 +0000
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
X-Inumbo-ID: 71e0b567-46b3-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637049706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zixRn1NqrMw3t2fgK8+MWmmu6RuRJmC1vOrAKhJopok=;
	b=n2OIw/kZX2exLJpl/KkSNr4Kt44eYFt66gGI+b33cBxVukCUDaVKghhPS6FKb6W+rQ8ush
	ezTydRaHbv0XmwXuZTHGX/3s+YBD0a1nBfe3NX+KNc9mtxzkeEKktCqT5jkdDQ14PbxIVE
	gs7tdOEaMQZ6h/obGV5I4cAyrHMKbig=
X-MC-Unique: 8JuVNTJ5M5qriHWGYTj3qw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ga4zCu27zoVY1KuV2CxIdAb1QttjS4DUx72cBzTF3iys3HknOkDIZ7ERv6GDEGBSTquy4Jr8l2pJe5oIynCQekwxP8bfGkrhGoZDt+buWZHRSBTqbfUiZ0LHm4hUUz97ZPJqtuXBM43JvQnpJzdU3OHzC+yCxMMUpmxeD074lQK63gz3+R8Vntiv2Z09e+bWKSP+lb9ru0LOSufdlSe3YuQM64r8QF5wQZ4HSdCfGefTRm2/tby4ZbEUoM8fe2zBMhcCZOGklSuIFLxp09GMoRzx+/KCTxf1jO+/+h8SmvGb1YqVMKnnznBkLgI3BOK7LkHBnz6xAsT2J2yvFxYacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqesUy8IFBZ/7k21mDj5KKOLPbhQSdCeHuJWSmoWtd4=;
 b=TTur15DWAHyK77jcTHQqMRtmnj6KeByPdHcGtmYqWGXA3/ql4VerDBD3AWKsc7pURKxwmbqYHgQrCv4f7y3VzkPkgb+c0wWjQ3ZbjMN3FzC4idwfcgSEUvYcHBAbxJtJMK1tNuLOYNytVXdRNEtih9FHFTxv3LAmvSq7kdmgjOVauASIeZN8R39rTwtY1HfdfDsNKAilUuoC2QpvLRj/lk/HBh2qW6CW/xR32l3o4bsl8IvjHlDSRQzw4mntNat3vFbxtQyDlaRMBfGrReSewnzEgZcbxiF57xmByJpP8HzlHcZyLUXAdLdhH8reEoikws7VgSsZMRFanW5mC+YzyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5b47cd28-5264-9f24-38a0-e9dec6c2c1b4@suse.com>
Date: Tue, 16 Nov 2021 09:01:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
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
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
 <4e12f7de-19cb-bc79-4df0-6fb52538a944@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4e12f7de-19cb-bc79-4df0-6fb52538a944@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR02CA0023.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc07d1ed-8885-41cd-3aea-08d9a8d754ac
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43515C1DC71C62B02F63D6E3B3999@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rogHzti7Xao5DEqZmLKZPo6RX7KC9WMwdeC3dKRd7BEX0zXocQJM1/9jb5e6m4cXgUABwXJTWuOlAOmPJ252X6sXDzSRBLqqzNyKASQMuI6Jo44lnhSHvlLCL0nlO6jqkGngyMGqeb4MuEBUt9830yrNWYz88C+7GewL44tJ9eL8Hkp55NJuwQ0Hd2yj+N0+PrGrMOGlCjmX8/2sNGsK0P3aVf4B621N17GP4j2/6VUyRo3ICSeHESvY3KmrrsxtW98QFQz+HcyJnH0ASvLI7M3wa8OWeS6LtaV/Iae9+RuEJyXYvmpCLfyiXmYZchVAts4COz2zNuEGA9z/v6MqQgxXSQwJVowOk8vTu76g0HBZS5MiVWuy/9bkog5QLCclek6hds/QSRV8XVDId96lqsw/oeA6alVxpaRTmVFqjH6KCsAgLDM6rNabo9p8ycuu+5fmW/GWqc8PmDXrufY52BsDjOKXONlupp2+iHt9+3RUf9tcubt/A15ehi2ZcVZz44G3LN84tvRi3DQFelpC0Qp05DOjUlOc/q2w1SfhQix/2kRhfMEgXL5LQx1g45JgafgolkevBYli4RzLrVekDSGJqKbOYmBGat9TrNiRKnzWcN1spttO2B99SEglrt5Sf3XlNP3Z1M73kY1kweo5RkTx03TyV70DnCkJZX/U4X4kUV8syojLddoRIljb5AUEw3PuwmSzHxIz9TUEj6Be+3eDEmdPlSC8ew1Id+GI2EXf8PUNcwpoXSG8cbUDJd8g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(31686004)(66476007)(66556008)(66946007)(36756003)(16576012)(316002)(6486002)(53546011)(38100700002)(956004)(5660300002)(4326008)(7416002)(86362001)(8936002)(54906003)(8676002)(508600001)(2616005)(31696002)(2906002)(26005)(83380400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iDBU3w/TkSVA2QoTnnsdR8lWQe8vbGbDS/8wC8oh3jmSXz8PK+uwf9nsjkaf?=
 =?us-ascii?Q?dNQ7ZiziVvRIdttzDrmHh18yKu/LbaWpSxKolOJNDA+j8CAHaMIrCpJUuv1B?=
 =?us-ascii?Q?fj8uswujuTgx5hpj0PdD3DTaiK5fr0QljA0Ya7vxS6+tt6Ae5sUqMDUXv8cn?=
 =?us-ascii?Q?22Eti2nlkz6ig5Ws7A7VtDOY88x+5WvyasWrfd4zR5frnfRwnPzn9ySoCxYc?=
 =?us-ascii?Q?Swgxy1Gs/4/Mnl/T6bROWor5QTnnyB/kKzHPhQrDEjl/tOVzA+awEzwCkGSq?=
 =?us-ascii?Q?J0Y9R8DMZVF1lYULlDHUUXTpGP3kEPh0w8fRkvFhtlILZpxbrpZ9ihMlSNOq?=
 =?us-ascii?Q?8PHkQbsuQpiwSC28GWUhqkdy8AMfh7usFlq993TZ5LNeBe8QdMgnHpKdGODD?=
 =?us-ascii?Q?BIa6L/1I3C9go0Gpg+OtG7WVOuAi2YrAG/BKkQLjlF3f2dW/jEDNcvOGP0jU?=
 =?us-ascii?Q?ddMpsJqEOhNoPN+ApN9VXU8up+nJwZg15n/RAS93jqg/+a23W3AbJ74Js0PT?=
 =?us-ascii?Q?i88X1OYMlcozTc+f0ULhniQjWw/2x3Zhsw81BmSsidJ1tj8zk2vBzLQ0icH5?=
 =?us-ascii?Q?xnf3sjDlNnQDZZU/UPUDhY9Eb/YOKotOtG3w1FXxkx2qFhqnFR20RQdFmhHY?=
 =?us-ascii?Q?dyq0bI1NvMHo95lH9yYB8DcmKnvwy8SZSWKyYNfGo9Obda3w4GDkcwfFeog4?=
 =?us-ascii?Q?cTF2+JVR3X1QdrazXjFmF7DDzfTciojhmZFGFCIKgF2Ij5ffC+pHSTMTs4J5?=
 =?us-ascii?Q?ticovHBGL+3mW40aHaczwaVZapmdjLyLlQatBvxgR7WSveI5UrATkkne6DDJ?=
 =?us-ascii?Q?XWZ1rPfnnSL/WT9xwUmi3yG5L9FEJl8gSU1WCJOSbsButYB1XpemzQC0fv+G?=
 =?us-ascii?Q?ELYHMV3DAJ6NI6MWgIhp0ESKbFnATfc4aI4nLwQfesuyZDo8A8cEk4KFarMW?=
 =?us-ascii?Q?jVXeniArlXO0Ef5QLeqAYwjyzOjATfUVyd7/Zoyo058na7yPIC0zjMoBRJ1E?=
 =?us-ascii?Q?nH0foWyYAp4fQdE+GslvjwhfQnspWi7OKqQ8WD3RZ7+32Yt6ePSW9+Cpko55?=
 =?us-ascii?Q?DBXorr3DfnhWZXWzmbg7zfobQ5cP0UxUASYOrGFrNy6mNfd+/kbsJo2euGj1?=
 =?us-ascii?Q?Er/JWj3GYD8P7+BiwBElIv4XuFC3OxByiDgWNG/swDjRkD15dRzBnmtLt20m?=
 =?us-ascii?Q?QxKyg5nHEJVhyIrT4G+L/bCeSF8+lGqiiqnga61iho+qbLuIqf83K4uhNxCW?=
 =?us-ascii?Q?8j3fx9/MnplxTfMlZOZv8tN/7uY5f6DXwhLPyAq3+NpXaxWBA3JUJt4YKIR1?=
 =?us-ascii?Q?v7tRIc+CU/oaYUk+JtwJLeqZWSft5DqDsjm50sIdGtuvcJTKb5XmA6HQFFlx?=
 =?us-ascii?Q?MLgoy1Ykc42OXmWhoAyMx2vVwDdpcopgXfcy64NR+NdGfDl6bqQKuduQV2fK?=
 =?us-ascii?Q?wBXjvm8RG+XM3u/gDrnZFEguFkeMUMKYE1QV8O0nT6KgPOc1x3etHZqBA1tA?=
 =?us-ascii?Q?fBLfTxSg3EGHiIEce0Bxyrwp+gFyswJhL3b669xnRutzKOcXR1YTo4lPOC7K?=
 =?us-ascii?Q?WHS7Rto6vOabBAMcdj1oHei3x6f44U2etUtX4dZTBZIgL8XaiMDfKgs2rOQb?=
 =?us-ascii?Q?uuKlL086PMoaHYcykLt4LKo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc07d1ed-8885-41cd-3aea-08d9a8d754ac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 08:01:44.3143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfyAjznWbwKuxwYHPZJYcLxzOM8dEwmuPZSr3pgagiXdWvX5ETWwSGRBgk0bwJYZkexvXj/pkX81JRCHcx1YxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

On 16.11.2021 08:32, Oleksandr Andrushchenko wrote:
> On 15.11.21 18:56, Jan Beulich wrote:
>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> When a vPCI is removed for a PCI device it is possible that we have
>>> scheduled a delayed work for map/unmap operations for that device.
>>> For example, the following scenario can illustrate the problem:
>>>
>>> pci_physdev_op
>>>     pci_add_device
>>>         init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE=
_SOFTIRQ)
>>>     iommu_add_device <- FAILS
>>>     vpci_remove_device -> xfree(pdev->vpci)
>>>
>>> leave_hypervisor_to_guest
>>>     vpci_process_pending: v->vpci.mem !=3D NULL; v->vpci.pdev->vpci =3D=
=3D NULL
>>>
>>> For the hardware domain we continue execution as the worse that
>>> could happen is that MMIO mappings are left in place when the
>>> device has been deassigned
>> Is continuing safe in this case? I.e. isn't there the risk of a NULL
>> deref?
> I think it is safe to continue

And why do you think so? I.e. why is there no race for Dom0 when there
is one for DomU?

>>> For unprivileged domains that get a failure in the middle of a vPCI
>>> {un}map operation we need to destroy them, as we don't know in which
>>> state the p2m is. This can only happen in vpci_process_pending for
>>> DomUs as they won't be allowed to call pci_add_device.
>> You saying "we need to destroy them" made me look for a new domain_crash=
()
>> that you add, but there is none. What is this about?
> Yes, I guess we need to implicitly destroy the domain,

What do you mean by "implicitly"?

>>> @@ -165,6 +164,18 @@ bool vpci_process_pending(struct vcpu *v)
>>>       return false;
>>>   }
>>>  =20
>>> +void vpci_cancel_pending(const struct pci_dev *pdev)
>>> +{
>>> +    struct vcpu *v =3D current;
>>> +
>>> +    /* Cancel any pending work now. */
>> Doesn't "any" include pending work on all vCPU-s of the guest, not
>> just current? Is current even relevant (as in: part of the correct
>> domain), considering ...
>>
>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -51,6 +51,8 @@ void vpci_remove_device(struct pci_dev *pdev)
>>>           xfree(r);
>>>       }
>>>       spin_unlock(&pdev->vpci->lock);
>>> +
>>> +    vpci_cancel_pending(pdev);
>> ... this code path, when coming here from pci_{add,remove}_device()?
>>
>> I can agree that there's a problem here, but I think you need to
>> properly (i.e. in a race free manner) drain pending work.
> Yes, the code is inconsistent with this respect. I am thinking about:
>=20
> void vpci_cancel_pending(const struct pci_dev *pdev)
> {
>  =C2=A0=C2=A0=C2=A0 struct domain *d =3D pdev->domain;
>  =C2=A0=C2=A0=C2=A0 struct vcpu *v;
>=20
>  =C2=A0=C2=A0=C2=A0 /* Cancel any pending work now. */
>  =C2=A0=C2=A0=C2=A0 domain_lock(d);
>  =C2=A0=C2=A0=C2=A0 for_each_vcpu ( d, v )
>  =C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vcpu_pause(v);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( v->vpci.mem && v->vpci.p=
dev =3D=3D pdev)

Nit: Same style issue as in the original patch.

>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range=
set_destroy(v->vpci.mem);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v->vp=
ci.mem =3D NULL;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vcpu_unpause(v);
>  =C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0=C2=A0 domain_unlock(d);
> }
>=20
> which seems to solve all the concerns. Is this what you mean?

Something along these lines. I expect you will want to make use of
domain_pause_except_self(), and I don't understand the purpose of
acquiring the domain lock.

Jan


