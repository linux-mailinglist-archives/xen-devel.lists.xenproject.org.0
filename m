Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F6AB3897C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 20:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096723.1451369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKol-0008FI-Cf; Wed, 27 Aug 2025 18:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096723.1451369; Wed, 27 Aug 2025 18:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKol-0008DJ-8R; Wed, 27 Aug 2025 18:24:19 +0000
Received: by outflank-mailman (input) for mailman id 1096723;
 Wed, 27 Aug 2025 18:24:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urKoj-000703-82
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 18:24:17 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0991623b-8373-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 20:24:15 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by MRWPR03MB11023.eurprd03.prod.outlook.com (2603:10a6:501:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 18:24:14 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 18:24:14 +0000
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
X-Inumbo-ID: 0991623b-8373-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMvvLHaVv1+8dTLsVvXjhlbJ4qPYkr317PwOfjgN9coDItuOmf4qaalcKb8yB0cKJvghzYoMYfFsNz2C2+PYgTO0KbBPR04O9/xc+cbtOm+c7A0FNS0RP6p1zzeB+XNSmgvAEpOphi9G0XP2zszFTTE24tFgXjaTV8bgucAyhSYBtOA1e+5qnz45Xe4lofAWX9SpIsq91MbfDg+9esIS8OTE2X2FGiHvKIIew+dy03JuU2dk1O6IwaJRJ0nnOvHUfJ2Yuuge38QAEP0q2A+hNNtA1Iy6JeXLPD2pEMsoH2FDb9fOXRMWJO1343hOIrFM4vr2dt6obcFDI+QE0bnXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FM8UwXdPVdtJK8SQjKi99w43kbIEgGw3VBvnMlD7ASg=;
 b=hFN3Ud4LY2tvJeF0vhNxVVVmJRBeMVmELF0fygfsYT8TBt1uetDmK+mWkZWO0BhU3o418BgxwpgkCrnYgSRxhMH5mig5cytucHCq1qap6tg0gMinGUW9Iv6eoEUu8OkowInbpdkkPbw2Bi+gA/5lmVjLckdLFuQkrmDOUZfkYctvY/6kWZHmeHRAIhD9LgMimAfRWCrRmghQcRuE7EFGmy74Uq09xNTVtdW9cVMy5Ti0Z9CivS3w9XzQURUE3OEpE5um8I5Po4WVhLzQo+v2PyBxcqvpV+8zy2kzSg+R3rFJ8x6I8mGtCeLYmXz3YYHVgGh3RebnC5QLWyQP1BH6eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FM8UwXdPVdtJK8SQjKi99w43kbIEgGw3VBvnMlD7ASg=;
 b=BNz6j9HpKkaHJE75UO1oMwEUoINypVaxL6zywTolMn9HrmX3uHJuau9r9FGjmVZVRIGeC/hHlBROnulPz0dVuaw0T/8fT/qkDVAHIg7Leg772bVDnnogCe7i4KNog/nYDGuDVn0pwy2bM3iDlx3arPqvTc+cpeL0A5TMd3njMXBPireRqhfCQB/Qltzr2/uGwO3uFUplY3cOwNKtuZpsrIQqZQ9Lx9a/mzOiUtceDNjOvsFplNdQB3r+Qxe5SzfQ6qoxhVLQui4NC1AvAisT6oWnuhaiRq97V1U1LgAsuMoaalaF6NeM7X8V5zy2x9tru7g9FdP43YTOo7mmgE/pEA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 05/12] xen/arm: gicv3: implement handling of GICv3.1 eSPI
Thread-Topic: [PATCH v4 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Index: AQHcF3/KB15KvpnNkEu7nU8vywEQ/Q==
Date: Wed, 27 Aug 2025 18:24:13 +0000
Message-ID:
 <864522724dd6058952cad8b505b0589750b7f8d7.1756317702.git.leonid_komarianskyi@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756317702.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|MRWPR03MB11023:EE_
x-ms-office365-filtering-correlation-id: 4918f4ac-34c5-4db0-8b07-08dde596ecee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?nh6rG3yLcj3gO/nwW0JMe9gIxuOVZ0FsdSzhe5Gp4iAlGtUwpJgc4Gro9U?=
 =?iso-8859-1?Q?AI4zu23LPX6XWc63/MNphPvcTip52Y7izpihLRHO41bXnfbE3DnaNeV/CU?=
 =?iso-8859-1?Q?G8eZmcoG+eN9UTOwAu9nx/31ZOoXNnk1VK3U+TRS+m1O7cQki5eCDSMQ+X?=
 =?iso-8859-1?Q?qMxh9RXrTJATT8IAj3mbgwGNwH1uMJ3ghEqDIGJ2wMs7CPpWbnHUsh3ux0?=
 =?iso-8859-1?Q?n1I3TKpGguXHQEjNdVTBj5yvR3O/YaA7ItLFWgVVhq7INqRrMHdzq7pnSc?=
 =?iso-8859-1?Q?m37K3WIT5ruJbSCl8QwLP9+aBVOX3cczZ8nBnvRKzhG1H76Dc3vzM49hc0?=
 =?iso-8859-1?Q?vsUmk2Qtoq52IRD/mebYB3ChBUBXZYaFcCTBdpZgSM8vUrlwH+uFZGZvCY?=
 =?iso-8859-1?Q?rwiqr5opp5FJ8A6QVWyVzcH8fJsPQCcWb5OfbZA9eSDsK7XOQhTVPvqwm0?=
 =?iso-8859-1?Q?E/FKy0teFG0nbXw4E53Nk5BTSwxYlYfJ+snRfnKiDGH1yYqEeD6lbEmDDn?=
 =?iso-8859-1?Q?oKMQXkU/I2wuBIqa+Lx1p/eVzh6LufEkJ1g2LQEQx/NNwGJAfirtY+pEYj?=
 =?iso-8859-1?Q?H5U3P65Bdph53Pg/kDIKddQo0DkECdjCrjmkdm8Bn+fr3USwMPvinTbVeL?=
 =?iso-8859-1?Q?qA9QHAnTd5PAwmY/lBZX8/3zK75KAjjybY6BuDWcdPu56Cb7POJ0NQNgUK?=
 =?iso-8859-1?Q?+CwLLKoG08WscULE9MlUs55kL4cz05XEhfy8/uP5A8AjQkl+/vXDWWqqlA?=
 =?iso-8859-1?Q?SIdk9cxz0BOnJGBrHdzxGXgiXylHnHL9ItTvGscnSyBzSIvYEREXlmGwJI?=
 =?iso-8859-1?Q?gJZqrMujnP4O3IjqWAAhVU3wRreHzVxvGlaSxmlSO9HYi4HHKW6CVrcqRf?=
 =?iso-8859-1?Q?RmN3VRoXwA1/1fQa2w4kMVYPdAbRF+eRgYlt3EaVteXt6ivjp/j4YrLGsG?=
 =?iso-8859-1?Q?eTLGnidSmRjE4o1w3TBf651rF0R6HS031cVaqcLGGNhflA7m79RaGxbfqM?=
 =?iso-8859-1?Q?8WvIXhwdetyyr77H8Kvk9R2gOb1vdnvIfInENxv2fKCwQU7pb2kncFGMWr?=
 =?iso-8859-1?Q?cOb/Zx8N+deJMh2rgicM2CC7ielqW65MokbunVl34toWnEQKfCvs4h2sFH?=
 =?iso-8859-1?Q?O5653tqQafft2ZBBVZBv2ucIy9221E9iZtNRtEvNacB9HCVCfUax7EJH3l?=
 =?iso-8859-1?Q?2U82ZimbmMhQCDKqwlACHImPnan1tkJ60eUCB7PrIA3Z96k3/JDDTdNyib?=
 =?iso-8859-1?Q?0IdDssJzvDNFUz0fq96rS6pCZrhGcDZi9lA0B+DunyeD3BjaHGF7HLIoZ0?=
 =?iso-8859-1?Q?JTQVWzDb57nkr/Sh7y8zUc7vv7PPnnLEfbDsFOLnh0DDVbOGJSRgB4i0Xr?=
 =?iso-8859-1?Q?4dajNEibGuYfjhqO/8dURWyNDA9qx7CMgJX4KyCroWL7sjFODTaAHOALT1?=
 =?iso-8859-1?Q?9hnLhkg8eymJuo/8sRp4US/GbFDApEswhmgLwZxyU/er3SVxUncJjTDwTD?=
 =?iso-8859-1?Q?2G/JaFAX+pZR21ThepOIqJk7fQUEYwN49DsPl3aDEsUtB6Yh22NFPMVgAz?=
 =?iso-8859-1?Q?RinTu38=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?H+e2RKZ9C+/RcgMyLAeC3qne7l8A91hVANgFAwZSTcGNBvYK2lxklvjRSs?=
 =?iso-8859-1?Q?n6rWWpBx1FdV6YE18YUjtPFv1WxE9Q5BVKRdh+QQCLfESQ2P4+0W9gbFx4?=
 =?iso-8859-1?Q?+0iqlUlJXLuEPxcGQwZFSS+xNhlGgnXVsG9oZHH+Ny2g3Ho2PJtC316KLH?=
 =?iso-8859-1?Q?QsX7xWWJNMw4dsvXMpJoJ+AwCNgPDTXMlMmXgbuXA4fri6YKqci3UzUiYR?=
 =?iso-8859-1?Q?m/q726NvmvPxm7GvtDUJoKzd90j913HJ1zXWXLVzbj9fBiuSbs7P5AMjNR?=
 =?iso-8859-1?Q?Gcu/9c/sE7OcTNG7yZOdSWWAhWDk8jB2RcWBYka2ahFcmG3Hm6yw0JPiZX?=
 =?iso-8859-1?Q?GPEydhZCixvb07aLXiIa7EWtTZOOBRR9Hg0C9tQl06RL17X4Uv8qV2XrpO?=
 =?iso-8859-1?Q?yaLkYpUn4aMmlQpTOqNhD4mi2nBTOKcNn1Yf2zs8cKuQb3M5b8t6gfQHzY?=
 =?iso-8859-1?Q?pqbGDV9rZr57HSvLpbUfEKJJbmq40T/T3IpAQKofPs96aLaCnBYrf5F+mO?=
 =?iso-8859-1?Q?qhn8ujDzL1EbpN++AEDd8q+oYXJQjsVQT8IOQfYx1E7gGGyxSUEMFk6h1W?=
 =?iso-8859-1?Q?KSVHIi19hEoJtxxtlE6Us3ZU8i1eLtLh1DvILXCH3iCXJ/KUpGhpT1X00l?=
 =?iso-8859-1?Q?hQ45hPV3VcRlm4ntec1uCU62xCgLneaoPIrxOT1gYluHomKkEvax+kXKqB?=
 =?iso-8859-1?Q?mSFbbfz1nmYzfke7/IA5d5FSFXWqV20cmoHQs44+TEEj5lLu7NbB/o/juX?=
 =?iso-8859-1?Q?NFDzOAasCO8SsZPAWPqj+PNxspZK+Al88agyxgWb4zFadkB+sbbhNZDFeB?=
 =?iso-8859-1?Q?YCkM9iYei50OYBuTBK98HFPcoT16kyRwVlEj2h5UdeVxJIfblRI4T0gPCO?=
 =?iso-8859-1?Q?337lLUwfs6eWkA3A4q8hMWPGggCVltAdwJL0KwMBevVSpjamfc64+aKsat?=
 =?iso-8859-1?Q?FL8J944rU5q6rWpqgygozY0vuvttMxOoyVNEh5ID7TECME8Ke6fjUE/xPW?=
 =?iso-8859-1?Q?z7mt1OdRXE2IgHwr7fid5uo6B+nkvYLUTmlhFL0/0Ra49+gUtdY4svwd2l?=
 =?iso-8859-1?Q?Ba2T6xa5Agzq2paxmbks59ZF6hnEv/VLxx+1oc/BelIBGQHUjzujIUhjHT?=
 =?iso-8859-1?Q?LzLdC7AtQ4yxwbyBDS0zwjRwiBkKdAbhMNDdjfYgiIAEpsN4YTkRrxkpax?=
 =?iso-8859-1?Q?LJU1+0gemCjt+G53h+zY26Um2MbbT6cEGqCkGbXnX1wyihbB9wqS1iTf45?=
 =?iso-8859-1?Q?AmM3wok/IORkE0HQ46n3CiJEw47FQvdZyZUhZdq97A02yeHGnhWrywQGTZ?=
 =?iso-8859-1?Q?3FJ3hieXMYgAOwyPcR0DeXmC+QWiARO+R6cqXN3FSxynvy80SAQM8gIO4Q?=
 =?iso-8859-1?Q?RaPyj3r21DBRNL1vM+EGbHCD6qoD2/Gk/bJV9dnBjQOST8FB730/y28fOT?=
 =?iso-8859-1?Q?+yOCsPqEbqeA/dFQaeBy2PUK11lD+ABHtX4l+Cv8uDAI/fmzcXAQ8t1Rj7?=
 =?iso-8859-1?Q?g60eabw8/JdV5aO8RMtqJD0IFl1gtmJ/mNhFxF43oCBkMXbi37dxFMObFI?=
 =?iso-8859-1?Q?7Lk3mDIrnKm1bbtecZLFv3DIpHT1Ioo5PigWs0k8IqgjI8XT8gExvCOyfg?=
 =?iso-8859-1?Q?vi9/wb8norUZJOkLf6yQhVEb6GqXYIuzajZIdUWNDvLNEvyQz7eAXw9LSk?=
 =?iso-8859-1?Q?GtXlDVfitGFYioZ0uE0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4918f4ac-34c5-4db0-8b07-08dde596ecee
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 18:24:13.9069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vNqf3aV4FEHqxvf48Ty1I3UAdFqc2lCRtxUW4gT0fXmwF9DZWUYI+ACmVmoBBKllvJXASmhEP51IUCiNH2wlM1EMQtmsi/DxWN365D4B6L8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11023

Introduced appropriate register definitions, helper macros,
and initialization of required GICv3.1 distributor registers
to support eSPI. This type of interrupt is handled in the
same way as regular SPI interrupts, with the following
differences:

1) eSPIs can have up to 1024 interrupts, starting from the
beginning of the range, whereas regular SPIs use INTIDs from
32 to 1019, totaling 988 interrupts;
2) eSPIs start at INTID 4096, necessitating additional interrupt
index conversion during register operations.

In case if appropriate config is disabled, or GIC HW doesn't
support eSPI, the existing functionality will remain the same.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
Changes in V4:
- added offsets for GICD_IGRPMODRnE and GICD_NSACRnE that are required
  for vGIC emulation
- added a log banner with eSPI information, similar to the one for
  regular SPI
- added newline after ifdef and before gic_is_valid_line
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- add __init attribute to gicv3_dist_espi_common_init
- change open-codded eSPI register initialization to the appropriate
  gen-mask macro
- fixed formatting for lines with more than 80 symbols
- introduced gicv3_dist_espi_init_aff to be able to use stubs in case of
  CONFIG_GICV3_ESPI disabled
- renamed parameter in the GICD_TYPER_ESPI_RANGE macro to espi_range
  (name was taken from GIC specification) to avoid confusion
- changed type for i variable to unsigned int since it cannot be
  negative

Changes in V2:
- move gic_number_espis function from
  [PATCH 08/10] xen/arm: vgic: add resource management for extended SPIs
  to use it in the newly introduced gic_is_valid_espi
- add gic_is_valid_espi which checks if IRQ number is in supported
  by HW eSPI range
- update gic_is_valid_irq conditions to allow operations with eSPIs

Changes for V4:

Changes in V4:
- added offsets for GICD_IGRPMODRnE and GICD_NSACRnE that are required
  for vGIC emulation
- added newline after ifdef and before gic_is_valid_line
- added reviewed-by from Volodymyr Babchuk
- added a log banner with eSPI information, similar to the one for
  regular SPI
---
 xen/arch/arm/gic-v3.c                  | 82 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/gic.h         | 22 +++++++
 xen/arch/arm/include/asm/gic_v3_defs.h | 38 ++++++++++++
 3 files changed, 142 insertions(+)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index a959fefebe..b939a1f490 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -485,6 +485,36 @@ static void __iomem *get_addr_by_offset(struct irq_des=
c *irqd, u32 offset)
         default:
             break;
         }
+#ifdef CONFIG_GICV3_ESPI
+    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
+    {
+        u32 irq_index =3D ESPI_INTID2IDX(irqd->irq);
+
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+            return (GICD + GICD_ISENABLERnE + (irq_index / 32) * 4);
+        case GICD_ICENABLER:
+            return (GICD + GICD_ICENABLERnE + (irq_index / 32) * 4);
+        case GICD_ISPENDR:
+            return (GICD + GICD_ISPENDRnE + (irq_index / 32) * 4);
+        case GICD_ICPENDR:
+            return (GICD + GICD_ICPENDRnE + (irq_index / 32) * 4);
+        case GICD_ISACTIVER:
+            return (GICD + GICD_ISACTIVERnE + (irq_index / 32) * 4);
+        case GICD_ICACTIVER:
+            return (GICD + GICD_ICACTIVERnE + (irq_index / 32) * 4);
+        case GICD_ICFGR:
+            return (GICD + GICD_ICFGRnE + (irq_index / 16) * 4);
+        case GICD_IROUTER:
+            return (GICD + GICD_IROUTERnE + irq_index * 8);
+        case GICD_IPRIORITYR:
+            return (GICD + GICD_IPRIORITYRnE + irq_index);
+        default:
+            break;
+        }
+    }
+#endif
     default:
         break;
     }
@@ -655,6 +685,54 @@ static void gicv3_set_irq_priority(struct irq_desc *de=
sc,
     spin_unlock(&gicv3.lock);
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+unsigned int gic_number_espis(void)
+{
+    return gic_hw_ops->info->nr_espi;
+}
+
+static void __init gicv3_dist_espi_common_init(uint32_t type)
+{
+    unsigned int espi_nr, i;
+
+    espi_nr =3D min(1024U, GICD_TYPER_ESPIS_NUM(type));
+    gicv3_info.nr_espi =3D espi_nr;
+    /* The GIC HW doesn't support eSPI, so we can leave from here */
+    if ( gicv3_info.nr_espi =3D=3D 0 )
+        return;
+
+    printk("GICv3: %d eSPI lines\n", gicv3_info.nr_espi);
+
+    for ( i =3D 0; i < espi_nr; i +=3D 16 )
+        writel_relaxed(0, GICD + GICD_ICFGRnE + (i / 16) * 4);
+
+    for ( i =3D 0; i < espi_nr; i +=3D 4 )
+        writel_relaxed(GIC_PRI_IRQ_ALL,
+                       GICD + GICD_IPRIORITYRnE + (i / 4) * 4);
+
+    for ( i =3D 0; i < espi_nr; i +=3D 32 )
+    {
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLERnE + (i / 32) =
* 4);
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVERnE + (i / 32) =
* 4);
+    }
+
+    for ( i =3D 0; i < espi_nr; i +=3D 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) * =
4);
+}
+
+static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
+{
+    unsigned int i;
+
+    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
+        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * 8)=
;
+}
+#else
+static void __init gicv3_dist_espi_common_init(uint32_t type) { }
+
+static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
+#endif
+
 static void __init gicv3_dist_init(void)
 {
     uint32_t type;
@@ -700,6 +778,8 @@ static void __init gicv3_dist_init(void)
     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i +=3D 32 )
         writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4)=
;
=20
+    gicv3_dist_espi_common_init(type);
+
     gicv3_dist_wait_for_rwp();
=20
     /* Turn on the distributor */
@@ -713,6 +793,8 @@ static void __init gicv3_dist_init(void)
=20
     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
         writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);
+
+    gicv3_dist_espi_init_aff(affinity);
 }
=20
 static int gicv3_enable_redist(void)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 3fcee42675..1e747dcd99 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,8 +306,26 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+#ifdef CONFIG_GICV3_ESPI
+extern unsigned int gic_number_espis(void);
+
+static inline bool gic_is_valid_espi(unsigned int irq)
+{
+    return (irq >=3D ESPI_BASE_INTID &&
+            irq < ESPI_IDX2INTID(gic_number_espis()));
+}
+#else
+static inline bool gic_is_valid_espi(unsigned int irq)
+{
+    return false;
+}
+#endif
+
 static inline bool gic_is_valid_line(unsigned int irq)
 {
+    if ( gic_is_valid_espi(irq) )
+        return true;
+
     return irq < gic_number_lines();
 }
=20
@@ -325,6 +343,10 @@ struct gic_info {
     enum gic_version hw_version;
     /* Number of GIC lines supported */
     unsigned int nr_lines;
+#ifdef CONFIG_GICV3_ESPI
+    /* Number of GIC eSPI supported */
+    unsigned int nr_espi;
+#endif
     /* Number of LR registers */
     uint8_t nr_lrs;
     /* Maintenance irq number */
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 2af093e774..c10db9bd05 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -37,6 +37,44 @@
 #define GICD_IROUTER1019             (0x7FD8)
 #define GICD_PIDR2                   (0xFFE8)
=20
+#ifdef CONFIG_GICV3_ESPI
+/* Additional registers for GICv3.1 */
+#define GICD_IGROUPRnE               (0x1000)
+#define GICD_IGROUPRnEN              (0x107C)
+#define GICD_ISENABLERnE             (0x1200)
+#define GICD_ISENABLERnEN            (0x127C)
+#define GICD_ICENABLERnE             (0x1400)
+#define GICD_ICENABLERnEN            (0x147C)
+#define GICD_ISPENDRnE               (0x1600)
+#define GICD_ISPENDRnEN              (0x167C)
+#define GICD_ICPENDRnE               (0x1800)
+#define GICD_ICPENDRnEN              (0x187C)
+#define GICD_ISACTIVERnE             (0x1A00)
+#define GICD_ISACTIVERnEN            (0x1A7C)
+#define GICD_ICACTIVERnE             (0x1C00)
+#define GICD_ICACTIVERnEN            (0x1C7C)
+#define GICD_IPRIORITYRnE            (0x2000)
+#define GICD_IPRIORITYRnEN           (0x23FC)
+#define GICD_ICFGRnE                 (0x3000)
+#define GICD_ICFGRnEN                (0x30FC)
+#define GICD_IGRPMODRnE              (0x3400)
+#define GICD_IGRPMODRnEN             (0x347C)
+#define GICD_NSACRnE                 (0x3600)
+#define GICD_NSACRnEN                (0x36FC)
+#define GICD_IROUTERnE               (0x8000)
+#define GICD_IROUTERnEN              (0x9FFC)
+
+#define GICD_TYPER_ESPI_SHIFT        8
+#define GICD_TYPER_ESPI_RANGE_SHIFT  27
+#define GICD_TYPER_ESPI_RANGE_MASK   (0x1F)
+#define GICD_TYPER_ESPI              (1U << GICD_TYPER_ESPI_SHIFT)
+#define GICD_TYPER_ESPI_RANGE(espi_range) ((((espi_range) & \
+        GICD_TYPER_ESPI_RANGE_MASK) + 1) * 32)
+#define GICD_TYPER_ESPIS_NUM(typer)    \
+        (((typer) & GICD_TYPER_ESPI) ? \
+        GICD_TYPER_ESPI_RANGE((typer) >> GICD_TYPER_ESPI_RANGE_SHIFT) : 0)
+#endif
+
 /* Common between GICD_PIDR2 and GICR_PIDR2 */
 #define GIC_PIDR2_ARCH_MASK         (0xf0)
 #define GIC_PIDR2_ARCH_GICv3        (0x30)
--=20
2.34.1

