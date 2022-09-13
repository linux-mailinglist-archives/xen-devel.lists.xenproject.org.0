Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C065B679D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 08:08:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406139.648553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXz5O-0005ES-Vj; Tue, 13 Sep 2022 06:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406139.648553; Tue, 13 Sep 2022 06:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXz5O-0005Ax-S2; Tue, 13 Sep 2022 06:07:54 +0000
Received: by outflank-mailman (input) for mailman id 406139;
 Tue, 13 Sep 2022 05:35:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b6O5=ZQ=amd.com=JESHWANTHKUMAR.NK@srs-se1.protection.inumbo.net>)
 id 1oXya1-0001OY-BX
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 05:35:29 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3567431-3325-11ed-9760-273f2230c3a0;
 Tue, 13 Sep 2022 07:35:08 +0200 (CEST)
Received: from DM6PR12MB4564.namprd12.prod.outlook.com (2603:10b6:5:2a9::18)
 by CH0PR12MB5234.namprd12.prod.outlook.com (2603:10b6:610:d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 05:35:23 +0000
Received: from DM6PR12MB4564.namprd12.prod.outlook.com
 ([fe80::d0bb:4d4d:7767:19fd]) by DM6PR12MB4564.namprd12.prod.outlook.com
 ([fe80::d0bb:4d4d:7767:19fd%7]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 05:35:23 +0000
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
X-Inumbo-ID: d3567431-3325-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOKvTM2qqodYj2tOJW8tHBiGNCyiTdkuyTx/k+XtuMwkKTHozpsmbPE8x109sc/Bb1S49LFh2/rsvy3MVMDz1nqKWvqjsijhe1rw9GTTbkObz4ZxRTnL3VLMImZiHCIWsb8DwsvVuoPXGPcyZQTjlLzxOyAL2aSmLHZf7jK+zg+d+WaX/3K/pxq7JlQlHnE8s21iGT8/vYz5LdMZLFe0cBfLlc6mBx8/scUTCRCTN25RJcR4mgqN7t7/VQr+M0GlTEkylugW9LgXeaPg8haVnAD7qaYBQ0FN+ifFWIZ8V20+pHSaLIEE1s522Bk5Sc49WKAsQ+wH7laOFVjejsA7YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWZip0tRpXcF+5svqmGfGfLAz4B+pwQkh82ZzR/olYE=;
 b=miHdcRstnJWIGcFx19AnZGrZYHBAwEBybZJX8gP2ECbDEi6SQl8xlYTxeLSRNKEMtsRQyJn0qbPuJqR8wdUZUXLcP2PUcu27YrAl8pWoIm4I6WVbvyU1mk1c46tM2M/9Vg0dUKZehGvvn7jgQ/mfhUD4+7MTi7TUFcC269VOKt8Sr/Zk8CZz4Pldfr2DU6D0b4iJY8uG0Q1U0Je8XXLW3YIXjg7q046xwvnJNaKhPqw5D0xyqGtB2SMwVeOG+j5RSJSD/FzaLVLYZpah5yJn9KGvcB8MKRtzDcuNsemwfCYbRfiTPPZTLsIAi6hNvYdp4xMbQ7KcfjRxnbV9CPqfcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWZip0tRpXcF+5svqmGfGfLAz4B+pwQkh82ZzR/olYE=;
 b=NHhP3Qk0JCa0wwzcgTO1hxnHrotmAY9TJaF9byRFPZOvz7mmAZe5s1crPCOn/A86pvpQHDKYWiZON20OKHiuBhifAbg20my3TeL90CID+2b4XjD1U7Ol0NT9IPoboKMifFM2lxRsUSBFT/mywOCWTYFm/dgh/G5u9qdV8U4TZ2w=
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
Thread-Index: AQHYw/FtbHk6dXjix0qU8E4gYrQhY63WppaAgADmKYCAAIgNAIAEgvEAgABFGKA=
Date: Tue, 13 Sep 2022 05:35:23 +0000
Message-ID:
 <DM6PR12MB4564760C66FFA15ADAE2B014E6479@DM6PR12MB4564.namprd12.prod.outlook.com>
References:
 <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop>
 <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com>
 <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
 <9f11a181-75cb-aadf-2ce8-8bb6737af9ac@suse.com>
 <alpine.DEB.2.22.394.2209121819430.157835@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209121819430.157835@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-13T05:35:20Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=ac6f7c04-2fd4-4892-9f5a-0d147769eed1;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-09-13T05:35:20Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid:
 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid:
 994af694-58a0-4771-a281-be81576649a9
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4564:EE_|CH0PR12MB5234:EE_
x-ms-office365-filtering-correlation-id: a4f7aefd-fd84-4deb-922a-08da9549c169
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 V1I+AVqgWSBdC7IO2wmR9nZSUCp2pL8SVJTBumIAS2qwP//rh9zjsmXC66sxKdOTuXhyDhLU5d8tzyPw9CRo8pZI+Sduw31ExRbjXz/WpeSPo30jdFzPgYwzBsINUXHJQiB+T5WLPGUFfhxpyZfOgihoigiwBU5+H7y+L/tMvnd9JG7ClfNx7nzDoOWnIZ0NhxuDsHHZdI9Um37Bc1mDT8IlrOk4r8QkE3eLM1uCMniCZxiru9VnJXnvrUYABozuCAmgJ/kXg3cVS+9bX1klM6K2fMcP4AQ5/2O9q4r2q15ex1wG75CVkzgzXGRE+aa2xEGL9Iw928Qtf4zaF6i6OaMaOJB//2Y4POaFyd2f1qdwZQWztUChOMIGFKtspM3cQ/5MSJcZ3xohjnUiglcNi9XOBLrrB7civ4OMxy/MyWCujEs+82e/vc+RuktOhidq8Obz8MrygpIjM0Le8HYJu/DuXeAgkddyymRaTmT2toikufCL51lojP8q1jcyrlT2md8Z7n67XoqN4Rw3/bH5LBqPNCrIpnLta/3oR6x2F2M3QChehkimxjhzIqX4tJSPvCxw+zEKLDEDxMy/BtX/Q/QI8jS4JXhgCjlng8wNaIRkNlSlQfTu85fB0D3Jjl4V2chQAumeASkoh545SLwQRHpIWl8qrNoiIyG01NjzjcV83cF4cBt+sGTusA93mvJr1A3kV/FXDsp+bzmcd7yRYyseUzx39XFutQy8Y6z1hqH3z3sPi/ejxvV3Mw5xGSGZ9mzh5bQ9bOgmO1yVeEE7ftga34G8qS7gs5kSl00M/oo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4564.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199015)(4326008)(64756008)(86362001)(122000001)(38100700002)(54906003)(478600001)(316002)(66556008)(66446008)(966005)(53546011)(66476007)(55016003)(186003)(8936002)(2906002)(26005)(71200400001)(9686003)(7696005)(66946007)(6636002)(52536014)(76116006)(6862004)(33656002)(5660300002)(41300700001)(8676002)(83380400001)(38070700005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qEbC/M2vCJj+b2nWW/5JX+H1BGTKFuMMwU/lz4co9Qg0svLkobL8RXpPHZr8?=
 =?us-ascii?Q?KibxsjtYrPC5GJ3JsHIc1cQ2/8Z8IuUU8TrvAfjSYNyA8yKAFMbP2Xv5wU+K?=
 =?us-ascii?Q?TXT7x0/9NINLXMlZ++QZ9X4BDLKqdHs2XPK5zLqI/X2X/3F1P0ekhq5ltdud?=
 =?us-ascii?Q?FlgFORqdJ1JLE9g288zTgoA89QfPFbGhm466luD+rq94zIarVesNfOfsoIx0?=
 =?us-ascii?Q?0NW+GQdbHCWm4ICwPMamaxBnHLVf95J9ur2wHXv5qzOOIo27NG9rM4t51KYF?=
 =?us-ascii?Q?gzXRQ0rqyxh5Kxu3v3tBfSOlOhF1nGlyHdbKsyFVdakwj5FKrDhkrOTJQa8Q?=
 =?us-ascii?Q?9uiUE26L+zPn2efD39tVDHuZRV6VUok+8IKli8brDOMu9kQZ9kpzuLLlJaHQ?=
 =?us-ascii?Q?SuMVi9dAEOA+Qk2RxzOBcPuaxfhbXtpNTN+ijixA67GlUUiGIW5TERCN90Sy?=
 =?us-ascii?Q?we+QRlwkR8SYf72JwuUdj1QNabMSTMDG7r4FK3pgBbQCmKzoWX4iOCZEssYc?=
 =?us-ascii?Q?AN2s+t5XzN1xDtzjx3J2gUF+wuMiTO60lRM8w4EDIDI1V4JCxEeH9YjAulc0?=
 =?us-ascii?Q?cE8xYAaKzYsR+MnTo3A/opwz1ReLbaMJx4YAiNKoFsVxVetMaGgIowFhXlAC?=
 =?us-ascii?Q?dW5TEjRsjtyo4IAlORLUkquUvn1xXRGfAOANLOa2L2YDCTXz9SYzCfk0/tYX?=
 =?us-ascii?Q?63aNslufIRQOgwnZm4jBZAwT7wlABBMGzi7kxgl6XJQZRD5JONgw59Vn7lHh?=
 =?us-ascii?Q?S+azMXbWCbjCr/FVmvZ9vqdsmExwubONZNBDUuY2bzqixIQYTfTAnm/0U73H?=
 =?us-ascii?Q?2HntOVOqeQ1ZV5/MdNzFqBFSGGHJTPaS4FPfjmqGSQoJmVqhyketkcABbApr?=
 =?us-ascii?Q?aoDwnzuzn03dVFFgLyQ6vsHIVP5tboahvMAeENjaHl9VvfHMJrzIlbH7FE4y?=
 =?us-ascii?Q?HoG/MMGMOq5rjNLhNIP7tknTHZsXBPoWooeY3gkic+9AjhoqrRRLmwLI3zUw?=
 =?us-ascii?Q?DneZRGVtEhqxmgiRXfW3obJJZn12tr1hUCp5wNFj+K/bK2Gt+w8Lo/jvRFAS?=
 =?us-ascii?Q?knD68cRy/tNntPfU6FBrQi4fSAlqdMy4owJ/uy5gBwnRK+UQYW/BVXkFKXpw?=
 =?us-ascii?Q?m5M3X4H9MZok8XPONFBvttd/rn05GCjxynP5LUFnN22hM80tf3Tq53QH8oYU?=
 =?us-ascii?Q?yYGD6UPi5RCEy9X8oZL7hmSj1JWo3S594bCc3FveT8EL5mB+3NUW369RX1Tw?=
 =?us-ascii?Q?uHX3yu44BF4dmO2v0y4ul1LGAE8gzSU+tNQV9N3wRQWaCsbCHMR7zcE8q8Ww?=
 =?us-ascii?Q?drUvnAujLwhEeE9GjNJnD3vslHHXipBb+cqXI1110cuBOg4RWrK+9k2TLbf/?=
 =?us-ascii?Q?7X/jWWcI0LEWGAC307NuyPxnzCM7KOVukQEgnVAtqGA7YcvkPx5/dpD964dU?=
 =?us-ascii?Q?i5EMIiTWSlPVkrnFyo8H2XYPsYocChJeOb8+AD3ihtqR/n+OgC80kjk3fqF1?=
 =?us-ascii?Q?e4F2onrvcRbbPQz3hT/njFeJ/Uct5MrvgsgUzW5O4yzaITK+srlNUs7JVGiL?=
 =?us-ascii?Q?w2x3lXzNkx0/XvqJWLc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4564.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f7aefd-fd84-4deb-922a-08da9549c169
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 05:35:23.6262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kwbQ3pHOnhbXMU/FFn13YugrVZoOnsSXhfDI/HWCypQFLYnDF5ry6fciKa5PVIBt1pfPdKmIHW1sIuvRvwQyIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5234

[AMD Official Use Only - General]

Hi Stefano,

https://elixir.bootlin.com/linux/v5.16/source/mm/gup.c#L975 is the -EFAULT =
returning for our current use case.

access_ok is fine.

Regards,
Jeshwanth

-----Original Message-----
From: Stefano Stabellini <stefano.stabellini@amd.com>=20
Sent: Tuesday, September 13, 2022 6:56 AM
To: NK, JESHWANTHKUMAR (JESHWANTH KUMAR) <JESHWANTHKUMAR.NK@amd.com>
Cc: Stabellini, Stefano <stefano.stabellini@amd.com>; boris.ostrovsky@oracl=
e.com; xen-devel@lists.xenproject.org; NK, JESHWANTHKUMAR (JESHWANTH KUMAR)=
 <JESHWANTHKUMAR.NK@amd.com>; Rangasamy, Devaraj <Devaraj.Rangasamy@amd.com=
>; Pandeshwara krishna, Mythri <Mythri.Pandeshwarakrishna@amd.com>; SK, Siv=
aSangeetha (Siva Sangeetha) <SivaSangeetha.SK@amd.com>; Thomas, Rijo-john <=
Rijo-john.Thomas@amd.com>; jgross@suse.com
Subject: Re: Linux pin_user_pages_fast fails on Xen

On Sat, 10 Sep 2022, Juergen Gross wrote:
> On 09.09.22 22:25, Stefano Stabellini wrote:
> > On Fri, 9 Sep 2022, Juergen Gross wrote:
> > > On 09.09.22 04:11, Stefano Stabellini wrote:
> > > > Adding more people in CC
> > > >=20
> > > > On Thu, 8 Sep 2022, Stefano Stabellini wrote:
> > > > > Hi Juergen,
> > > > >=20
> > > > > A colleague is seeing a failure on x86 in Linux Dom0. The=20
> > > > > failure is pin_user_pages_fast with addresses that correspond=20
> > > > > to foreign memory
> > > > > pages:
> > > > >=20
> > > > > - QEMU maps a domU address using dma_memory_map=20
> > > > > (xen_map_cache)
> > > > > - QEMU calls an IOCTL to the TEE subsystem with the Virtual Addre=
ss
> > > > >     returned by dma_memory_map
> > > > > - Linux tee_shm_register->pin_user_pages_fast Returns -14 -=20
> > > > > drivers/tee/tee_shm.c
> > > > >=20
> > > > > Once upon a time it used to be the case that=20
> > > > > get_user_pages_fast would fail on Xen because we didn't have a=20
> > > > > struct page corresponding to foreign memory mappings. But that ha=
sn't been the case for years now.
> > > > >=20
> > > > > Any other ideas why it would fail?
> > >=20
> > > I think we can expect that access_ok() isn't failing.
> > >=20
> > > I assume the mapping was done allowing writes (sorry for paranoia mod=
e)?
> >   I was told it was verified: QEMU could read and write to the VA=20
> > returned by dma_memory_map. From /proc/<qemu-pid>/maps, the VA=20
> > assigned after the mapping is pointing to /dev/xen/privcmd.
> >=20
> >=20
> > > Other than that I'm not having enough memory management skills. It=20
> > > might be related to mmap()-ed foreign pages having _PAGE_SPECIAL=20
> > > set, though.
> >=20
> > Do we still set PAGE_SPECIAL for foreign mapped pages? It looks like=20
> > it is not there anymore? If PAGE_SPECIAL is not there, then they=20
> > really should look like regular pages?
>=20
> See the call of pte_mkspecial() in remap_area_pfn_pte_fn() (mmu_pv.c).

The kernel version is 5.16 and the return code is -EFAULT. Is it the follow=
ing -EFAULT the one that triggers?

mm/gup.c:internal_get_user_pages_fast:

	if (unlikely(!access_ok((void __user *)start, len)))
		return -EFAULT;

