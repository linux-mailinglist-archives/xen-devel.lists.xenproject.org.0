Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07B34AD5E1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 12:00:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268168.461953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHOEH-0008FT-6j; Tue, 08 Feb 2022 11:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268168.461953; Tue, 08 Feb 2022 11:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHOEH-0008Ck-3X; Tue, 08 Feb 2022 11:00:13 +0000
Received: by outflank-mailman (input) for mailman id 268168;
 Tue, 08 Feb 2022 11:00:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHOEF-0008Ce-Ut
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 11:00:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 487c2bc5-88ce-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 12:00:10 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-lxl6MrSWNjGaZ4GbGlfq7w-1; Tue, 08 Feb 2022 12:00:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4089.eurprd04.prod.outlook.com (2603:10a6:5:1b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 11:00:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 11:00:06 +0000
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
X-Inumbo-ID: 487c2bc5-88ce-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644318010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cKaYqyWeGEl4hRwBmsyRI1igQfea0K+13RcnakpviB0=;
	b=X0EQtyPMJ9f4nF8r9qzhTNJqa+TWxYm9VzOmhdtVf/m6GCVh0/vByGej8yz0TwrHM5zU7F
	/TSreGbrp9Oda0omCxm/9J8khejKwDYuzYsXqt/0Ig053oWOguU9e5v5EvpAn0MwxiEPq5
	m91ws8Zbr++3nFbFAIzfxevTtd3lhM0=
X-MC-Unique: lxl6MrSWNjGaZ4GbGlfq7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkMKdBp1P9xPZ3eGVudrlIMWMtHWIp5qdiKxQcAEgysA39YOgSLE9MjHJZwAdO0PgiZX72ROzmKc7HSv5zIcpaw4M9mQlYQGsPTzUtcQ/IX5hUM3hmZnj/b+5sBgGALexVYuejbanbXRCmr3DxfNjXQRDb4clrYUgX5vNMvw/6VCSLLeXgKiqh25Md0cKa9eo+2zgM0+kwXlNv4S38Sz5WeGftLoUhNxVTySoKZgDCXZ2+PcAMQ/EmS9tm4kg+V/7Ra/7MpPCIdC/C1u4FtGn56L7182DcdiRK05PfKI/e/etKD2lj9wPiM1uZl9E8nrP6gZmxT4agLGyiAzlFLLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCal8ZReqiUW5PQSJNxA//qqzbD5gjyCZua/UOGerqk=;
 b=QFHWDk2GnEnNdlq6ybM6TcCpifVULWXacCZrSz65nQYSPu4f+K0XfST28nCKTnJ+CoDBbUMMW8DcaERmgrokbM7mq48nKCjRTtbrWny4HuvLH9Kc+KpSGpqQeQD3Cqzjg6YP0J7lgugP1m2qzm4BwrphGBfOERFCENsJAxB+dyHySXeEKjhA45BnxuSRh8mo8q0cDR/pifVQTbQJ5lq94Az9zGPWAUJIWWlt8vSGNaph2+gbll9yt4aIhJrV1A/AIa8pI7XPWgBNI/csk1E33JE3G/0v4z7TQILGxHCrsTFBaFSCXNEaw46Afyck+pb7mrRpJci7Mcyd5m3q/U1Ixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf584e13-f257-9355-50fa-c35e8fc8cf5e@suse.com>
Date: Tue, 8 Feb 2022 12:00:03 +0100
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
 <15c16171-f196-38d2-370c-38627935a21b@suse.com>
 <20762939-6b7e-ff60-7c1a-d47c4767ff4f@epam.com>
 <10cd89b5-a804-3354-26d8-bc271bd9c5e6@suse.com>
 <15022045-bc92-e3df-b005-aeec5e36a078@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <15022045-bc92-e3df-b005-aeec5e36a078@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR04CA0005.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d661f3db-58f3-4240-65d0-08d9eaf22a26
X-MS-TrafficTypeDiagnostic: DB7PR04MB4089:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4089244872DB254F476159E4B32D9@DB7PR04MB4089.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	blVI3Mg3ez1doM/HhEvidO1nsWn6kq1MMw13IWM77k0bqlIfOVSpwHg8MkHfmXO0H2dBWuOY+SQ809JCqRLcf05gG/uwNzeKCL3I91/wOW61ukQw4BsmsxbccgnT3oUDf9d26irsvm+QgR3zgRhjCq3s6QKjllIs7iEbK6+UZ3DM01ahf2a7JHfBpm76ZmWzaGE7/KiQgmtSGNyhAM55a+meCfiIlV8qBI04Wi/w73iB9z/KxZ7XXsKXT0cHCsiuNG3306wafMSYeVFYX/Do5aQmE8TwaNJXumbnaXwjKc1DCpdw3om2a3a1J2x4q5gpcPvBfWeHf2IbUwYOBR/SCZ3YkJsijfDk23ggzK+cHoBzYwDF3y/cmYpVNt86td8go3nj6CezClN+Sig4JpbmWxhm0dxQO3aiyIJFVafkFhQg7yBX4qNrSNwfCfSv7Nv/rbvxrkwjCtu2d1QV8qgK8moPoUvvlLONRE9yQNqblVb1yzshpaC9nh/uv99a+PEuWK1n/ApDNFnhnCuF+KysGaiv7NyToKc5k070OvQfVjweH3Weoq4aGZDVKFu8NVmI9h8vjfouElH0JUWM45tA8R/sozyMFHgwuw7axWEuSHMvbZ/zbML9BwwIncUBBIINmiQYc1+0DABydBTkrdSkTIFvo3LSv7+2bpgT8HDHTRJMFH1iL3qkJa1t/iAOv06maYYZ+DP8AbUG6O7ku+a+LZ9V0hevOErK/bDrK6emuaA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(8676002)(4326008)(66556008)(66946007)(66476007)(6506007)(2906002)(508600001)(8936002)(6512007)(31696002)(316002)(6666004)(54906003)(6916009)(7416002)(31686004)(38100700002)(186003)(26005)(6486002)(83380400001)(36756003)(2616005)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JLvTrwrOyfD86Bm+H8rwBKRbXnQObcQVVzwVXRQZPXhUaC7v3aAZw2TzZ1ve?=
 =?us-ascii?Q?nQwsenZF82IMs4GxxGOjtoqvskRQcwK7YPblOQpIepfw4WXwalMobHcAw9Lw?=
 =?us-ascii?Q?4BcT5euL2Ypzc6Gb+IvpFELvc5Lqlb0l7E8UUotiH47NNvv2wUPHDq6N6nJl?=
 =?us-ascii?Q?XRw3j4hPdakxY08QLkdrxTN+s0EkAg9Ywn01bJNYFqr1KkR23Xwb31lXolGu?=
 =?us-ascii?Q?Cvf8C3TCGVeMaA7L/OV7u3i7EMb0i/mmCApRjVc0kW7VnhF+N0iXMYHNNu/k?=
 =?us-ascii?Q?J9AeBEeJOjz9fcaegHYQiZ2gm2LRjReqSt/IBDhCgfJ1o3p9oewNkgBspF/5?=
 =?us-ascii?Q?6I03yJ9XvABoUujvNO7Hu0E9XOjnq9MyIv2AWflJMDBJtXgu5SxjwaR/HhDs?=
 =?us-ascii?Q?bnAdOTZF8fly+5N+a8+MvO5/5Mxxhku5G3RwNJmNhPbwyqLsOuzofcAMvvf4?=
 =?us-ascii?Q?vrYaTH/3jmHQV72YSqa9OTJ6+s6tzpWdLnjYaUP3IQRCRZueHP61zJKCkOwo?=
 =?us-ascii?Q?ZIyzQL5PTpGt2LbFkhoiomApnMBypDhZ1nfESqeCZV0CPiLTWf3+o3ynbOnQ?=
 =?us-ascii?Q?KmrNdNZYy+ETYlipaArDzciPoiqzwK0x9kK6tvBtKYayXoZWExjM50TkywTX?=
 =?us-ascii?Q?lR5W28uxWHJ/f4x6HwI87RN/FNEb1fyS7YBrp9gJe2VO33GLiC2afhMuDiWF?=
 =?us-ascii?Q?fHzzP5XzPP86ilnFkGhMf8P4cQsIACz+TI44QqAJ2rXaOdwIfdotEe83WBfU?=
 =?us-ascii?Q?AiMN+I4sZ+C5Vpy0FcHn+lXEhWKUPO9hqauFuGZYNGxF9O93ID8js5GKis7z?=
 =?us-ascii?Q?OPXHAbbCL/ND8BaDfSh1Us4u2WeHM+eY6KPmcgLBsjbNRfcwyapZYUPS2XHG?=
 =?us-ascii?Q?Qb8mnn141tSCZGtgRuAHA0nGr67MlZ1Vmam7/N3tBTgzO9mLooANIwJQ2VRq?=
 =?us-ascii?Q?AfhD09giIyEJO+TOn0pkUnvCAgigAtw8eyFIXQIdOW06MX0ErmaZrePFf4s4?=
 =?us-ascii?Q?CzNnoMcRK8bi6poc91rMdafSoQ6vwqPnvd07IzzO38YRHfVwsz+DlB+5BoRA?=
 =?us-ascii?Q?/Fls31WTdW7Two7CMTVr+PtpKGWmPgkSrbZWmOyw2RcNCRV3n/BdJ7+a3ORy?=
 =?us-ascii?Q?0CPosXZHD4uh/tJNT2PoGvYgj67MSYhadsEV/K6KGa9D85mtMykq0/PYIcnh?=
 =?us-ascii?Q?5I2SgtQt9WUCo3UbInn4v4uDsJvRzrqbEyfO9sXEKLUODm7gSwOhi0wcFc6E?=
 =?us-ascii?Q?DrazavoyoKTKcnYw9NbNtypIn6MafIFeLDYwR9NuawGiuAOcu6/HIFX1wKEL?=
 =?us-ascii?Q?pK/z0DCi0KhjZE8pHoNWnbc50jqT2bim5K3FbTHt01CVJ07aU/Si7A9YAB1F?=
 =?us-ascii?Q?wakWXe76v+9+Z8yv7VGZEuZdIR5Wk1GGyGdPcrVcIvroOhMcvfJU5oowzAdd?=
 =?us-ascii?Q?75Ix7HBLj149VyVA3pZF34uzMIBNMqGuOgyWlkAiI1GrZhNYnQG5P6Ooo980?=
 =?us-ascii?Q?fIFcwEMYXM+TzANT+44mn6AJupgJNn9uXHl74/EuYbsDHpNlzELL9ot7qNLP?=
 =?us-ascii?Q?ms1756M48Aj5wtKUQZRZ6vDj3ok95WehpsRUFXoeT58k+jxuhuW28trYTW5Q?=
 =?us-ascii?Q?fji+r1vCqabLaMi597iNB4c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d661f3db-58f3-4240-65d0-08d9eaf22a26
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 11:00:06.1342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MxiSB5wIkRt6udngr0PgeFeEql+mLA3MKgkjRPDBNxM1XrSDDBc063wwqQ2GDcYI5eOvysXzZsahUwBtxZbpTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4089

On 08.02.2022 11:52, Oleksandr Andrushchenko wrote:
> This smells like we first need to fix the existing code, so
> pdev->domain is not assigned by specific IOMMU implementations,
> but instead controlled by the code which relies on that, assign_device.

Feel free to come up with proposals how to cleanly do so. Moving the
assignment to pdev->domain may even be possible now, but if you go
back you may find that the code was quite different earlier on.

> I can have something like:
>=20
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.=
c
> index 88836aab6baf..cc7790709a50 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1475,6 +1475,7 @@ static int device_assigned(u16 seg, u8 bus, u8 devf=
n)
>  =C2=A0static int assign_device(struct domain *d, u16 seg, u8 bus, u8 dev=
fn, u32 flag)
>  =C2=A0{
>  =C2=A0=C2=A0=C2=A0=C2=A0 const struct domain_iommu *hd =3D dom_iommu(d);
> +=C2=A0=C2=A0=C2=A0 struct domain *old_owner;
>  =C2=A0=C2=A0=C2=A0=C2=A0 struct pci_dev *pdev;
>  =C2=A0=C2=A0=C2=A0=C2=A0 int rc =3D 0;
>=20
> @@ -1490,6 +1491,9 @@ static int assign_device(struct domain *d, u16 seg,=
 u8 bus, u8 devfn, u32 flag)
>  =C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(pdev && (pdev->domain =3D=3D hardware_do=
main ||
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdev->domain =3D=3D dom_io=
));
>=20
> +=C2=A0=C2=A0=C2=A0 /* We need to restore the old owner in case of an err=
or. */
> +=C2=A0=C2=A0=C2=A0 old_owner =3D pdev->domain;
> +
>  =C2=A0=C2=A0=C2=A0=C2=A0 vpci_deassign_device(pdev->domain, pdev);
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0 rc =3D pdev_msix_assign(d, pdev);
> @@ -1515,8 +1519,12 @@ static int assign_device(struct domain *d, u16 seg=
, u8 bus, u8 devfn, u32 flag)
>=20
>  =C2=A0 done:
>  =C2=A0=C2=A0=C2=A0=C2=A0 if ( rc )
> +=C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk(XENLOG_G_WARNING=
 "%pd: assign (%pp) failed (%d)\n",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 d, &PCI_SBDF3(seg, bus, devfn), rc);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We failed to assign, so re=
store the previous owner. */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdev->domain =3D old_owner;
> +=C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0=C2=A0=C2=A0 /* The device is assigned to dom_io so mark it =
as quarantined */
>  =C2=A0=C2=A0=C2=A0=C2=A0 else if ( d =3D=3D dom_io )
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdev->quarantine =3D tr=
ue;
>=20
> But I do not think this belongs to this patch

Indeed. Plus I'm sure you understand that it's not that simple. Assigning
to pdev->domain is only the last step of assignment. Restoring the original
owner would entail putting in place the original IOMMU table entries as
well, which in turn can fail. Hence why you'll find a number of uses of
domain_crash() in places where rolling back is far from easy.

Jan


