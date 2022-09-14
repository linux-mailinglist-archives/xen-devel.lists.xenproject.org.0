Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B5F5B8124
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 07:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406760.649123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYLNS-0004xP-3e; Wed, 14 Sep 2022 05:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406760.649123; Wed, 14 Sep 2022 05:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYLNR-0004tw-Up; Wed, 14 Sep 2022 05:56:01 +0000
Received: by outflank-mailman (input) for mailman id 406760;
 Wed, 14 Sep 2022 05:56:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCPW=ZR=amd.com=JESHWANTHKUMAR.NK@srs-se1.protection.inumbo.net>)
 id 1oYLNQ-0004tq-2E
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 05:56:00 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5ebf529-33f1-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 07:55:56 +0200 (CEST)
Received: from DM6PR12MB4564.namprd12.prod.outlook.com (2603:10b6:5:2a9::18)
 by PH7PR12MB5620.namprd12.prod.outlook.com (2603:10b6:510:137::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 05:55:51 +0000
Received: from DM6PR12MB4564.namprd12.prod.outlook.com
 ([fe80::d0bb:4d4d:7767:19fd]) by DM6PR12MB4564.namprd12.prod.outlook.com
 ([fe80::d0bb:4d4d:7767:19fd%7]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 05:55:51 +0000
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
X-Inumbo-ID: e5ebf529-33f1-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1hd5NzTcH5votb7d4p9u27VB+RcWboZf2YORpTrwgfdpL1t5Z3AjJu2XsaLfXlmcB0zV2mWUR+eCOOtgt6BxemhjLvfI/M6Jl5t+TiJG9iQI9kk56MJf+tZcml88CEc42mbQqpoKvVNxtJ3CskqoUFTmN4zv6p2IOYNhycuR6t3jNaJi9CoX+Rxrco6n9rlnQLO04FAknuqGCSl/ee3gFQXRE5irKrerCAq8IHEpFk7TTMIFv21SUJxJBSXjSZSmeEmzcIG954SEx0NVPpxcWf0tmdZi5SGijf1owTc8Ay/vewzpMeUYmy6c0l9C3BIamEtUyMNlcHTCDb2gfAb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hvt5w/5N7F1waSWEQjT0FDXkcIy0ZJfe/mRHfozCXc=;
 b=TFd+xdDsYvklve5fVugOw84/t+XrwW/t02syGmlutf3ZHPnoO155fqHVczA9o5zGU4zXU3CFs1XsXbGietwxCM+7a4D7qHjwbbxAXFLDeircmrGUKqHx36mvqWDgkh/opINA59vuRHprLDkK4n9iHQhETjZ3RxHZuY7UVVA5UuVj6tt8QZodCakI+UqGOj2QCZYQ4i2DD9Iwk2+mzE/hO5mcoFqhPRJe6OTRfPFD94gYHTknP/QraCGoLWHauBjBgOM9pOCb4QZVtTKi+Lus9AFxFEtQbThqTZ/4Up50/eWW3YvMyF8HnMZ73udjmaczxTKSDgaDHciIj7ZvM1w8oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hvt5w/5N7F1waSWEQjT0FDXkcIy0ZJfe/mRHfozCXc=;
 b=cojL1pqAEbO8X3S3wEc/ByQgqQjmzHSiMk4yq0YLtgb8LinC8yi3qHbUmVvlHqVrvpydV/dN2nBH9EFsfnGN/oTTEqf+3lHF2iW9eRwxQmWye+MSSmOjtDyl3c1hzTeFWCzfb62FbGyiTD+SOzPdIThg5wIgq4xtGO8HbwlbE7c=
From: "NK, JESHWANTHKUMAR (JESHWANTH KUMAR)" <JESHWANTHKUMAR.NK@amd.com>
To: "Stabellini, Stefano" <stefano.stabellini@amd.com>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>, "Pandeshwara krishna,
 Mythri" <Mythri.Pandeshwarakrishna@amd.com>, "SK, SivaSangeetha (Siva
 Sangeetha)" <SivaSangeetha.SK@amd.com>, "Thomas, Rijo-john"
	<Rijo-john.Thomas@amd.com>, "jgross@suse.com" <jgross@suse.com>
Subject: RE: Linux pin_user_pages_fast fails on Xen
Thread-Topic: Linux pin_user_pages_fast fails on Xen
Thread-Index:
 AQHYw/FtbHk6dXjix0qU8E4gYrQhY63WppaAgADmKYCAAIgNAIAEgvEAgABFGKCAAA00AIABH/CAgABrF7A=
Date: Wed, 14 Sep 2022 05:55:51 +0000
Message-ID:
 <DM6PR12MB4564ABD712E3FAF8B93922F2E6469@DM6PR12MB4564.namprd12.prod.outlook.com>
References:
 <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop>
 <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com>
 <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
 <9f11a181-75cb-aadf-2ce8-8bb6737af9ac@suse.com>
 <alpine.DEB.2.22.394.2209121819430.157835@ubuntu-linux-20-04-desktop>
 <DM6PR12MB4564760C66FFA15ADAE2B014E6479@DM6PR12MB4564.namprd12.prod.outlook.com>
 <DM6PR12MB4564E946E0E08F71B1CC125CE6479@DM6PR12MB4564.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2209131629370.157835@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209131629370.157835@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-14T05:54:39Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=0f1e805e-0243-482c-8c24-1dd1e468d677;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-09-14T05:55:48Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid:
 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid:
 420cdc04-f722-4214-aaf5-bc769e6bc339
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4564:EE_|PH7PR12MB5620:EE_
x-ms-office365-filtering-correlation-id: 49441053-ab68-41a0-2627-08da9615c7ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9mnfMXYEpX3vJ2qTLYBvFLib2lBiGXVkWadAT5lguYAre9NA50WId5cHBAfP76VpgqJgwMaKdT1meO9qRLz60+gHRHTlRzOZMMVUpioNCbxe3I+vUXwH+dK4CyVWTlTQlcpETi9+xLMAG0Bypa5CT00HMRMg/6IjKm7sckr363oczBN/W9/T1R0W25yICtlvgF/yOaRy8UeSY3oXuj+cajopBHiEo28zQPjhJTppMKCk8IDOs1Js7G+Nup3khZAq6UwWP5chY6rV7+NaEwlqRjwjouMNUesJn7ckmX/ho6r3WoXB50Fjau5KxyHYhf7LAg7TIwgn3jXvfhoE1jS+wcMF8qYvb9ph1c27i6TM1zqz+Wg6FrDX9qbv/K/GvVk4dPCSKdLtZtfG7acJWSSuRTKsqhCM16jr6GLH08eyUDYdkTOF4EQCFZNTZiWZaGaUSLGqf9eni1+J89grUexwrai+bHVGEcM5QP4oZZjERN+p6DQbWNsZexvvfotHyzT4Mi+2YSILeKLSRJajyXjEw0c7i3HwAv2EfcHFL8kWQ5pscgUaQPQHyEcdH8fu+1pLTSW+FcR1ks0rsNEblEiFmPbbTH7eKzl7W3cVwvp1gO/Dgg//YxqKHgGMaIcsgji3KoAprexu4hthtNKwh/IBtslSFlMJgI1aOnrFKj+swzzCUhZtrx9zOmiIC9xEawydsgluHa4h2qiMUhy7Xas89bsOIzRky3vxZmOH+32Xk3R8PvRx+Je/8bDdvKobgby94qPPZoIEnYQZzocO9VT3T70dZNJLB43d8AUbG4J+vag=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4564.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199015)(8936002)(186003)(33656002)(6506007)(26005)(41300700001)(71200400001)(38100700002)(6862004)(478600001)(66446008)(6636002)(66476007)(8676002)(83380400001)(53546011)(66946007)(966005)(316002)(55016003)(64756008)(4326008)(66556008)(52536014)(76116006)(2906002)(7696005)(5660300002)(122000001)(9686003)(86362001)(54906003)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pax/rVO0LGCGAKxLKN3A39HJUZnUMywM+o7aCEX8mdTPC7qsenO5SgB2Tvi0?=
 =?us-ascii?Q?k/FQRibe+T203MWZldMWKB2UpWoy5K7DvAFqu2JXkaygC6/jDscurievGMdm?=
 =?us-ascii?Q?JK0TBQ8VxwM/YhC9GVjwbr/JQatCZn9diOsj8f79woNRaIZxGLkFfiVb9oJp?=
 =?us-ascii?Q?Skub/rW0QJTzF1O/1k3dSwHIc0vW05zMEmCXL4Cjo9YmK8xPGB0phvI3Rv4f?=
 =?us-ascii?Q?jmnhxdED347KFnyIVrC/dqccy9ieF+t56piv9mezY7VRE9uKdkYiGagbowh2?=
 =?us-ascii?Q?N2DUK0Uz6xbELptnKvKKodAITPllAGYGusC5NY0AN91OxoztD1jNam9PlG2k?=
 =?us-ascii?Q?n1o9/TRF1pRqpmZzBN4dwz1FHyhJjycJKwP3mqBQGqrXUV39aCHKI65l9rK5?=
 =?us-ascii?Q?LaBl6xF1Fb4DvS9fxieiqwOa6pWNiF0+63dIQ8Hy7AGAnsxjmnUsIBc5HNL3?=
 =?us-ascii?Q?NaGhw6/7tbAS2Th8f3R73mj9sb9RO0Il6YX5+N4IJYiX/ba9Vw1Baf5Yi2dC?=
 =?us-ascii?Q?ktRVhrBSqojguLJMep5bdaRBnwjho9NIknmIe+iOVZVmX7SBYlHOwHShaKGo?=
 =?us-ascii?Q?le+BJteVqadzPHS/NzJiW5ArOaTwuMnXpFEJwLwx0wNm93US99Dh0pfrttCF?=
 =?us-ascii?Q?AYRdRrJcR8Z/I6rqelGwhUF30i4wp8JVrkKF143ewRiFF8o2SXzJkM2rIiSo?=
 =?us-ascii?Q?x2xEDBY3qFh7Fyup/gNhomH8BXyt0+J8jyA77uby+tyFGu2ROlz7ptS4wkg0?=
 =?us-ascii?Q?Rsf2kVjeGxKvsvK8+JOyAHcwiQ+0HydsUEuWPb7ez95k9CnhFkoRcnHtIBoc?=
 =?us-ascii?Q?hc8YCSFKRfRjVBGNQ+XdlHD+FccV0oOJhLcdxD2Qo3MZ06kkuO2gzJknisHo?=
 =?us-ascii?Q?mzU+HXH8LduUKXgFdcC8kYdUeY+fIwW1MTa/VoSWYAFiVyCmAr2gCWKlQ/8f?=
 =?us-ascii?Q?LPxM3FYMspuN0EanajPa82gosEDkV9yQaHPLwXWqftwTDvEnor7qxczLSnfZ?=
 =?us-ascii?Q?X046Z8w2qSftHIuKFsu744Hy1AdwMGjnJ1AEBMUP3wXLw9P8iFcTlrbffIof?=
 =?us-ascii?Q?1emyxZAI851nwvl2dB2UzNTUuGlNQrru8aDyU1rj5GeCD9vUkqi78bt3ih7+?=
 =?us-ascii?Q?4oEuHnyuJ5/iU+qy3+PZgo2TrvheQD4NCU0UntWGfqYiD6nXmv/UvhcAgbKr?=
 =?us-ascii?Q?TBWg0MzU0EaRnnZ5T12a2Ug1r94BdslNVnKJruSxTS8LOz7T1H9KuWOBUXz7?=
 =?us-ascii?Q?fOhEI7OzGaf1NVnTDqRc5kzE8FKYLrKdpu6qm9rmYMCzKmSLycN7OXcrY90c?=
 =?us-ascii?Q?mjYD3lhFLUA2MElQpuvbJUEGUE6Erjh7SJifF2A3HB3TnTcNvZYl7/+dpKW0?=
 =?us-ascii?Q?M2DKDARQWmI8Yw9DgEiMspXKmOu7KhS166H4mDEY6k/wXzMsFqdumYjtRoeA?=
 =?us-ascii?Q?85/wFei0BjCJvtStIv+sEMIrAJSTg7ZvrIFg5/HtdpKIBsptUplMC9Cx76EK?=
 =?us-ascii?Q?Xy1TKxRhC9V7jKOefRIUKhauwaGIo/j6U766Hs7CW5TWIEtgOenBLkN2oK88?=
 =?us-ascii?Q?JxhZOcjD6/0ErGZvAEphOM4po2/D5Y07+bVhX0TH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4564.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49441053-ab68-41a0-2627-08da9615c7ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2022 05:55:51.4214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ixW4aj5YVl3bXg0L1XEW9scDpvU/w4BtT8Hj5zd+f3MAlJmrndn7yGf2tRPQ6CCe00W9HXpBEggVUpnkGxSuUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5620

[AMD Official Use Only - General]

Hi Stefano,

Thanks for the suggestion,

>Do you know if it works if you remove VM_IO | VM_PFNMAP from privcmd_mmap?
>> Gave a try, looks like the DomU doesn't boot without these two flags.

Regards,
Jeshwanth

-----Original Message-----
From: Stefano Stabellini <stefano.stabellini@amd.com>=20
Sent: Wednesday, September 14, 2022 5:01 AM
To: NK, JESHWANTHKUMAR (JESHWANTH KUMAR) <JESHWANTHKUMAR.NK@amd.com>
Cc: Stabellini, Stefano <stefano.stabellini@amd.com>; boris.ostrovsky@oracl=
e.com; xen-devel@lists.xenproject.org; Rangasamy, Devaraj <Devaraj.Rangasam=
y@amd.com>; Pandeshwara krishna, Mythri <Mythri.Pandeshwarakrishna@amd.com>=
; SK, SivaSangeetha (Siva Sangeetha) <SivaSangeetha.SK@amd.com>; Thomas, Ri=
jo-john <Rijo-john.Thomas@amd.com>; jgross@suse.com
Subject: RE: Linux pin_user_pages_fast fails on Xen

The problem is that drivers/xen/privcmd.c:privcmd_mmap sets VM_IO | VM_PFNM=
AP, and either flag would cause check_vma_flags to return -EFAULT.

Do you know if it works if you remove VM_IO | VM_PFNMAP from privcmd_mmap?

Juergen, do you think the flags are necessary and useful? Any suggestions?


On Mon, 12 Sep 2022, NK, JESHWANTHKUMAR (JESHWANTH KUMAR) wrote:
> Missed to update the Flag details:
>=20
> Flag for DMA Mapped VA - 0x0C0644BB
> Flag for Local VA 	   -  0x08100073
>=20
>=20
> VM_IO and VM_PFNMAP  - Set in DMA mapped VA but not in local VA.
>=20
> Regards,
> Jeshwanth
>=20
> -----Original Message-----
> From: NK, JESHWANTHKUMAR (JESHWANTH KUMAR)
> Sent: Tuesday, September 13, 2022 11:05 AM
> To: 'Stefano Stabellini' <stefano.stabellini@amd.com>
> Cc: Stabellini, Stefano <stefano.stabellini@amd.com>;=20
> boris.ostrovsky@oracle.com; xen-devel@lists.xenproject.org; Rangasamy,=20
> Devaraj <Devaraj.Rangasamy@amd.com>; Pandeshwara krishna, Mythri=20
> <Mythri.Pandeshwarakrishna@amd.com>; SK, SivaSangeetha (Siva=20
> Sangeetha) <SivaSangeetha.SK@amd.com>; Thomas, Rijo-john=20
> <Rijo-john.Thomas@amd.com>; jgross@suse.com
> Subject: RE: Linux pin_user_pages_fast fails on Xen
>=20
> [AMD Official Use Only - General]
>=20
> Hi Stefano,
>=20
> https://elixir.bootlin.com/linux/v5.16/source/mm/gup.c#L975 is the -EFAUL=
T returning for our current use case.
>=20
> access_ok is fine.
>=20
> Regards,
> Jeshwanth
>=20
> -----Original Message-----
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> Sent: Tuesday, September 13, 2022 6:56 AM
> To: NK, JESHWANTHKUMAR (JESHWANTH KUMAR) <JESHWANTHKUMAR.NK@amd.com>
> Cc: Stabellini, Stefano <stefano.stabellini@amd.com>;=20
> boris.ostrovsky@oracle.com; xen-devel@lists.xenproject.org; NK,=20
> JESHWANTHKUMAR (JESHWANTH KUMAR) <JESHWANTHKUMAR.NK@amd.com>;=20
> Rangasamy, Devaraj <Devaraj.Rangasamy@amd.com>; Pandeshwara krishna,=20
> Mythri <Mythri.Pandeshwarakrishna@amd.com>; SK, SivaSangeetha (Siva=20
> Sangeetha) <SivaSangeetha.SK@amd.com>; Thomas, Rijo-john=20
> <Rijo-john.Thomas@amd.com>; jgross@suse.com
> Subject: Re: Linux pin_user_pages_fast fails on Xen
>=20
> On Sat, 10 Sep 2022, Juergen Gross wrote:
> > On 09.09.22 22:25, Stefano Stabellini wrote:
> > > On Fri, 9 Sep 2022, Juergen Gross wrote:
> > > > On 09.09.22 04:11, Stefano Stabellini wrote:
> > > > > Adding more people in CC
> > > > >=20
> > > > > On Thu, 8 Sep 2022, Stefano Stabellini wrote:
> > > > > > Hi Juergen,
> > > > > >=20
> > > > > > A colleague is seeing a failure on x86 in Linux Dom0. The=20
> > > > > > failure is pin_user_pages_fast with addresses that=20
> > > > > > correspond to foreign memory
> > > > > > pages:
> > > > > >=20
> > > > > > - QEMU maps a domU address using dma_memory_map
> > > > > > (xen_map_cache)
> > > > > > - QEMU calls an IOCTL to the TEE subsystem with the Virtual Add=
ress
> > > > > >     returned by dma_memory_map
> > > > > > - Linux tee_shm_register->pin_user_pages_fast Returns -14 -=20
> > > > > > drivers/tee/tee_shm.c
> > > > > >=20
> > > > > > Once upon a time it used to be the case that=20
> > > > > > get_user_pages_fast would fail on Xen because we didn't have=20
> > > > > > a struct page corresponding to foreign memory mappings. But tha=
t hasn't been the case for years now.
> > > > > >=20
> > > > > > Any other ideas why it would fail?
> > > >=20
> > > > I think we can expect that access_ok() isn't failing.
> > > >=20
> > > > I assume the mapping was done allowing writes (sorry for paranoia m=
ode)?
> > >   I was told it was verified: QEMU could read and write to the VA=20
> > > returned by dma_memory_map. From /proc/<qemu-pid>/maps, the VA=20
> > > assigned after the mapping is pointing to /dev/xen/privcmd.
> > >=20
> > >=20
> > > > Other than that I'm not having enough memory management skills.=20
> > > > It might be related to mmap()-ed foreign pages having=20
> > > > _PAGE_SPECIAL set, though.
> > >=20
> > > Do we still set PAGE_SPECIAL for foreign mapped pages? It looks=20
> > > like it is not there anymore? If PAGE_SPECIAL is not there, then=20
> > > they really should look like regular pages?
> >=20
> > See the call of pte_mkspecial() in remap_area_pfn_pte_fn() (mmu_pv.c).
>=20
> The kernel version is 5.16 and the return code is -EFAULT. Is it the foll=
owing -EFAULT the one that triggers?
>=20
> mm/gup.c:internal_get_user_pages_fast:
>=20
> 	if (unlikely(!access_ok((void __user *)start, len)))
> 		return -EFAULT;
>=20

