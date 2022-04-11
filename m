Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078274FB9A7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:29:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302906.516774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrIN-0001dH-Ix; Mon, 11 Apr 2022 10:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302906.516774; Mon, 11 Apr 2022 10:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrIN-0001bP-Fw; Mon, 11 Apr 2022 10:29:19 +0000
Received: by outflank-mailman (input) for mailman id 302906;
 Mon, 11 Apr 2022 10:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ETZj=UV=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1ndrIM-0001bJ-6V
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:29:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37ff999a-b982-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 12:29:08 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-6YUzrs5MMLCEGA5iNRMSsQ-1; Mon, 11 Apr 2022 12:29:15 +0200
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 by DBBPR04MB7676.eurprd04.prod.outlook.com (2603:10a6:10:20e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 10:29:13 +0000
Received: from DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::a4bc:f02c:559e:8afa]) by DU2PR04MB9067.eurprd04.prod.outlook.com
 ([fe80::a4bc:f02c:559e:8afa%4]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 10:29:12 +0000
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
X-Inumbo-ID: 37ff999a-b982-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649672956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yfThRfML+hr4ye7efofyzOVXZzB8YhPFE89Du6Ougic=;
	b=V9nTPaagE5JfqjWBpKxnSb6LVl/zMFOUYNlKFf92DNx4T3+td304FORQR0rM/Jo5iX5tdL
	RvOZ0q+HTCGICrkwHJqxrI1KumNRBcrRZ6I0ARdvYMMebGnfJjPm3TvSplVApiZiTPcz93
	VTQPsbzv+QiinYVkZpS9wvBPp9yhKdc=
X-MC-Unique: 6YUzrs5MMLCEGA5iNRMSsQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2X962yLzcbeDF1qYRlTWWAPi0hoGdYtcuong23hc6QgD92DP+Hg2HaMmH9ZNf26Pa5WGvnGJpX/HeWxJLF7o95BkPHxPWSlw8fJ1vor1GljcA708yOMba+ohsDF6Vi+MyPzyPZYeCEfY2JeoDSMD6x64CBw3Q+grByokwRYiE958F3giTpWKdrUl/i0taMdmxTboJW1fZeOlDeFev8XqFIfZtUGd9XDavddP8G3nJLC501nuOvz5z0MjxOexDUXohwybZo/bh65T9Mfy+OUUn6oNu5oJAvYw/1TdXzGAK9GcJq0ubhyKIdy3WcniELNWxGG/PNWJn0xjv35C0R4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfThRfML+hr4ye7efofyzOVXZzB8YhPFE89Du6Ougic=;
 b=gSV9p529un9FrFomrp/jSYcG7m1feoZuaQaoB4N7eVzp0WXZE9PXSlpf8a6tnX76u/EGry2wQHmvCSWm2x306/arAwMaYNZ3r0LiMpP0ZC1VAZEZjz1+uPvYwv9Oy1IseX56koX59CDEWWagkp8WAqWahjZFFHgfuRm09fH04lQJiFidXisZV6dip9NiOf6hGOE4rbnmfWU/7Kg7SCF0NGnNHlPYWWb9WowgsqhcayoeXU2HyUiN+ArqKB5Gg97ayctIqIZayo71y8FITeBpMvL8LCOl/7rkdu0sU+EKUAfhjyfqHWAV0WjR7HKjNXdJ+zSliZtyVvjtLwrj/KU1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "Luca.Fancellu@arm.com" <Luca.Fancellu@arm.com>, Jan Beulich
	<JBeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>, Juergen Gross <JGross@suse.com>,
	"Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>, "wl@xen.org"
	<wl@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, "Wei.Chen@arm.com"
	<Wei.Chen@arm.com>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index:
 AQHYSyUF7vKDj5+7J0Gv64nYja1AHazluEIAgAArboCAAAYQgIAAjXIAgAPJp4CAACWGgIAAIU6A
Date: Mon, 11 Apr 2022 10:29:12 +0000
Message-ID: <48f1e07cde7001967657b8bc7cc89406a72972e5.camel@suse.com>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
	 <20220408084517.33082-5-luca.fancellu@arm.com>
	 <93aac581-8105-c8e5-f7c9-fca850667f33@suse.com>
	 <4F1CCE02-DC8C-478C-AFFC-A67290188ECB@arm.com>
	 <511b60be-c6c6-d13a-b9aa-40e67e5a1b1c@suse.com>
	 <alpine.DEB.2.22.394.2204081320210.3066615@ubuntu-linux-20-04-desktop>
	 <1be2f46c-700b-6af1-a74a-d090196c9f5f@suse.com>
	 <CE2F688A-70F2-40C2-8B8F-A3694EF8F395@arm.com>
In-Reply-To: <CE2F688A-70F2-40C2-8B8F-A3694EF8F395@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.0 (by Flathub.org)) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba741202-3e6f-4067-6c4a-08da1ba61f49
x-ms-traffictypediagnostic: DBBPR04MB7676:EE_
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-microsoft-antispam-prvs:
 <DBBPR04MB7676686319466BB2D53C10E7C5EA9@DBBPR04MB7676.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 c7qro2BLzbrNNEOXXVvOX3wneCNkxIAPIHBdA744iU8HNclgJuKwa41UzO/WkOLEbYyzjDZc+2gVaXxZ9jBH+ZY/e58/qB1Dmtfpl5uTc8S5Fx3ioFaN6MlYPbEpMewDUWSc0m6KuCTTfx1VpungwvDK/9XcZqA6g0TTWu3C0t3Mol55tSSGDl/giTSJOEKZR673hYRwrQ4c+hQ0qbq9zCRSBzl2dUdiI1BoULBZBcXE3c2mV4BCD+GM0h/FwVdEtReUqvgC+45a1CDngsm89CVPDitvareHdcTKCfkwn56+5RXl5RxowKU3I7mV0oFiCKhZjk/TLIJ3BDzCGCwi/lwVBZrQT46RBxOxcJYP6iLAuKjqk2NQKX5tSFBA2sA1f8AKha+sx52/F+ew9mKduS25+tJHZhQtH0N6c+nCudnVnTDD1Rt4h0qIUcM+lxmP5jiIlXCSJbuuR10YdARVNJfD7f+BPMgzUmt4lP92N8wXKRtfrKF/ZOyR4Q5tGBpKNEbDv1y4bYPzKsPyiPnzSVRxgnRZyvWKON/nMsCPjgFTf0E0HUpCT9sXnGuyJUkJ8hpfY7lwR4vdXbIWl4ex9CMc8kj8MwyioGBwHFQ9t62KlWeMflzq2Ov7B+C+p3z2brBRR3lYfkwHi+SB+k3A05m5vH/IZE2davQouWmodDKSnWNRlLSRhqUQN2GKKjcL348A2hVG1tTVtCntKS3lhpZuWN3UHQX++IaCoCyk3ep/A5mJ0c5esFwyJvoojo4PwJtCcvkdAT6Pm8Tq2XmwPaKHNLB+TFTAUuvSrEVoy6xHQChd8OUl42a0K2Mdr+19
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9067.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(71200400001)(54906003)(110136005)(316002)(6486002)(966005)(26005)(38100700002)(2616005)(36756003)(508600001)(2906002)(5660300002)(66446008)(66556008)(76116006)(66476007)(122000001)(64756008)(91956017)(8936002)(8676002)(6636002)(4326008)(99936003)(53546011)(6506007)(6512007)(38070700005)(86362001)(7416002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TzZvRmR4NC8rd0srNFNMTmtXTnJTQks2Mk1WUURFQ1pnWThRYnFhWElWOVVu?=
 =?utf-8?B?L2E1bUYrb01uOEE1akRLUTkrWTg4cy9IaVduSTAwRTROQ3U0RW9MQjdRM3Zi?=
 =?utf-8?B?eVVyQ2dIbkVLbXlRalVBQkEwK3JiaVZFN1FmaUI2NVFHcm5MZGJqZVdJbXdo?=
 =?utf-8?B?UTVQVURybTM0TFRBS2FvK1FKeFl4Y09nV0ZOc0F0RGtEM0V3ZUVlS01ITUdE?=
 =?utf-8?B?ekpkNS9FUi92MmMzWXRGMFdBblZFS0cxMWRFMXYrcVNCbHFXc3k2ZEhUMUpY?=
 =?utf-8?B?QkxScVRXUU9MOTBaY3k5OEk0M2ZuYkZONmRDcG5uc0pGNXRwNDdoOUQzZUdP?=
 =?utf-8?B?UmRuMHpUdWhlZnc5VGlScXFtd1JaTE1sYmtKN0xmekFVMUJnZzdHRVg1NkNq?=
 =?utf-8?B?ZUlUUXIrSklPVEVBRFZNU1NSSEp3TFBHQnpTTHZFRGZibUhZQmhKMkhaYmo4?=
 =?utf-8?B?ejV1cmxMVk4yT2RPcy9YSDd0VkRhNk9WdGRiOG1LbEhQT1NaeFdmblJLbHJR?=
 =?utf-8?B?MDVwbnI4ZVhYYjhoU09DYnBCVlFDVGtGZ2RyVFNMUVU5dmRPNm4wQ1RrcDll?=
 =?utf-8?B?ODJnVnY5M0V4ZW8wMUtxNzBxMnM3U2MybDc1NjZKcWZVdmxRVUljbUYyb0FH?=
 =?utf-8?B?a0RsNmNKWlBqY044VUNjRGtPbGtqbk1tWlczWm5zeFUrRTN6ZHFyaitzVlAx?=
 =?utf-8?B?RnJOSWdKZitkeEx5ejVBSExpdEFQbklmMDIwTGJ3eVpMYjAyRFl3ektSTjZD?=
 =?utf-8?B?d2k2dDJoeXdEbEN3eHhKTlY0N3FtYmtEUGR0dDcxYkVEQ09ubHV2bFNqT2lE?=
 =?utf-8?B?OGpaQ0tCditERFlvZ3VzL3ZNOGtMU3FnY25lUFBMUVF5NS9NMkNyZ3lHODN2?=
 =?utf-8?B?M1lwVkw0WDdwV3JtTXY4ZWtvUm9xbTl2M1hEZHYySDlzdzZuMG1wdmhCY3Rq?=
 =?utf-8?B?d1I5NnhJVFpsOHhCdFFmd2lCRXBza2xLOEZBTlp5bDFEYzVMdkpqWE5IS0Ra?=
 =?utf-8?B?OUFnemhobjlBMFpLZE11dE1rczdTdCtJSXlsOGdmUnhZaEtUSWE0U2x3d29Y?=
 =?utf-8?B?VjVFS09sczJETXkzS1BkUVhMVkpWWnhvSi9adk9LNzczb2MvaVBlbGdNMUdq?=
 =?utf-8?B?MU5XbjNQa2ltSjU3R2tRWm5iTG45YlRHUys4NzExeFFWVnhCODJEdzRFWXM4?=
 =?utf-8?B?R2FHWmhRMGh3aHF5SGRJdUx4ejZ5bFdRd1N1cXFxZXNrNEhseHFVNVRodUtu?=
 =?utf-8?B?Q3ZXQkxZTUEwTkV2OThDZXdzd3ZaUUw2K2k4LzYzN1pVSDFEUXM5Z0tjMlBK?=
 =?utf-8?B?cnFvazF2VkhJdDFRcXA0dmVqekZvV2JwWnRiV1NjeUg0T2R3TllQL2Vkc3lr?=
 =?utf-8?B?KzkxVDVPNGcyR1JtM252U1VkSDI1MHRqeU5Zenp6a2JRUW1uakpxTWhPWWdo?=
 =?utf-8?B?UjIzUTlycGZnV1M2aGpWaXlaOEhMWHdPeVlKL3Uzd3NaS21xUWlPTDUwVXpQ?=
 =?utf-8?B?ZER4OFJWVEVYdHJ0TjBtK1FUZUJDTU56eVE5SVRBd0M0RGNoTTRsNjZpRUtR?=
 =?utf-8?B?VUVGWUZIbSsyamgxYnVENFRwWjIvdTk5V1U0YWhjMnVWOXdHNEtHb1pMbzh6?=
 =?utf-8?B?ZGRoYmRrSVlnZUNTN2JwUFhJY2x1cTAvZDJrM2tUMFY0M3JBcjZJNDhtWVVn?=
 =?utf-8?B?UjkvVmJrVFR3di9DT0RrUHVHUEZOVExCdk9TL04vTDVWeEx0SFNJSDY1ejZj?=
 =?utf-8?B?T05zV0hSMXlVUkdYdzZxOHJSMFQwakdFK2JSNXNuMjN2MCt3TFB3Mzh3QWZY?=
 =?utf-8?B?NnhQRHhhUkJwYmY3bEFVNEhmZ3ppYlp6UXVtSkcrWnFOSWtpR2lmb1NrN2Fo?=
 =?utf-8?B?bUFFSHErSjl0M2ZZbmx1QlppRUhxSzVxTWdwZU9kRXN3UFk5YmQvVjlYTGJX?=
 =?utf-8?B?RmpEZG1rSUdSeHRhV1Z2bTJDRHBib3c4ZHp6M3gxSE80RGNVaW9xcVJDa2Vo?=
 =?utf-8?B?Y29sWHEybXVJRHVRQTM2WkRsQlVYSm8rSmRnMjlkMWg1VTNWOXYwVkt0emRD?=
 =?utf-8?B?UlhURlUrMzFwWWtIUW13S1BtdGxEQUNWMmFRUGJlMkY0NzRBakVjSnJzb0pp?=
 =?utf-8?B?REtFYmNCcTZUTms5dVVzUHVvbWM3WkdhVEpnQlAveTdmSmdzaDVXeUt2RXRC?=
 =?utf-8?B?WFljZGkrakNSZE1YZlZDRFMyVjllQi90dDNQeHFnTVRpTmV6cUxhYjhNcHNG?=
 =?utf-8?B?NTZsOVNDK1BjbjZCOE52RS9uakZpVDlzSFN4MEJkME54KzhFbHAwS0FENHR3?=
 =?utf-8?B?WVdjMTVrUHNCRit6dUdrcVhpdG9GNXg5VGVsRzQ2QUZyMzBLVEd0dz09?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-extpEdLskcwa37ps4Brb"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9067.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba741202-3e6f-4067-6c4a-08da1ba61f49
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 10:29:12.7429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YW+RfT4bV09naFEchoL0gWB2LDTKgybW80wEBcm63Qv7XGNkoGawr4+OvOtZidPaE0jgk8DlVfxI5YdTtQE5ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7676

--=-extpEdLskcwa37ps4Brb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-04-11 at 08:29 +0000, Luca Fancellu wrote:
> > On 11 Apr 2022, at 07:15, Jan Beulich <jbeulich@suse.com> wrote:
> > On 08.04.2022 22:25, Stefano Stabellini wrote:
> > > In my opinion it is best if the maintenance of boot_cpupools.c
> > > falls
> > > under "CPU POOLS". Luca, you can retain my reviewed-by when you
> > > add
> > > the change to MAINTAINERS or rename the file.
> >=20
> > Yet even then, with cpupools.c living in sched/, ...
> >=20
> > > I don't have an opinion if it should be called
> > > xen/common/boot_cpupools.c or xen/common/boot-cpupools.c
> > >=20
> >=20
> > ... this one may want living there are well.
>=20
> Yes I agree with you all, I will rename it to xen/common/sched/boot-
> cpupool.c
> and add it in MAINTAINERS.
>=20
FWIW, I agree as well. With something like this, IMO:

CPU POOLS
M:      Juergen Gross <jgross@suse.com>
M:      Dario Faggioli <dfaggioli@suse.com>
S:      Supported
F:      xen/common/sched/*cpupool.c

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-extpEdLskcwa37ps4Brb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmJUAvcACgkQFkJ4iaW4
c+60PBAA6eZq/y3cul+tPOjn79ntoQdxX0CZRF46XT6E6JYhnm7aHDfo/wf2QDnG
EYst389FnCtOM9SwJeBKvW7S8zNGsBKzF9YkxDY3C/R9gq+sL4HToHzJPni06XHG
4x2/YVBf+TbR1MasjvmXni6cD6lxD+78KPp/+GulLIZpL6T2MbQqLgIL1/Qz2Hey
O6u4FHZ7U3vuPNHU1d/MkjyCr/1IUis29sn40krWi419ra2Kwoo3mN6ze/9tfP+7
HZXNGZ5VipAGMtMgNAyizyL1bIw5kV936zBDuywA4CIs93TKLZJ+Nn4X3fdqJv0f
juP6CCEejaJU1EDRCkH9arDM/A3huosybrg5DalyAeCqt9NRFTZmhg/TQkGXV1wB
8mcduGxcAQEVnwzJMb5uXh3HjDvVgFSnzeAFNZk1x63LpQyyGZJdsaH9Ki83oV2W
VuuE8wGcmBMZjGmGwf4i5EaAB/DhA4//eY02SuhSfMTQgXfOKFhzJm4Wz6aXWC6B
LXPDev8XzWe7Hp4219esd7RgXAQ5pqNJHl93ODDkyWDNJppznTxTpt2aMqodNOAK
dMGrTJxhAS4xuKmX/lNc468rdqOUHNwfU2+m4/mcN7GWqmQ5hIv6Fzgygtssf/eb
mivscvjWCcY789G9AT+xDnq2pXL8kheZPpW+ZQAvT8yRy7hLhiU=
=upll
-----END PGP SIGNATURE-----

--=-extpEdLskcwa37ps4Brb--


