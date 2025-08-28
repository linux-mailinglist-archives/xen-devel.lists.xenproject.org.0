Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18DAB3A695
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 18:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099672.1453468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urffv-0005gH-4N; Thu, 28 Aug 2025 16:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099672.1453468; Thu, 28 Aug 2025 16:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urffu-0005a2-VC; Thu, 28 Aug 2025 16:40:34 +0000
Received: by outflank-mailman (input) for mailman id 1099672;
 Thu, 28 Aug 2025 16:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCus=3I=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1urffs-0004ma-Rd
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 16:40:32 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4ec28fc-842d-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 18:40:29 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DB9PR03MB7705.eurprd03.prod.outlook.com (2603:10a6:10:2c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 16:40:24 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Thu, 28 Aug 2025
 16:40:24 +0000
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
X-Inumbo-ID: b4ec28fc-842d-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2pn63wYGG8eHzskl7iMOB2x4s6rlC3H1/m4DUhOx8Zk40D41FlfF8gEPk2g4TH08uOPEH7QReEVjFPmTJ6j91p49ZSqTVDxjt0w4ZYy6gHbXGGhxorSUcClc+/k5K/LjhbSIBXpKJFulNJVwJAb/fuyI6AAzbe1unEBkSvTpvURdPeCyaIICB0yEjRDxoJsvCP1gRiR+LGFBL6W0/zMdF9THNj5Ufa8mCKsslVqWu2PrGiIqykTfFqEJpRDwugXgvK0Vkhu+WqNeBL6DBjNOE6+FqpfLVBRaSk49kBvVeT1KPvNOKk7dTV3BWxzWwgmlCQkNCfJneQeWAM6r7fQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApiSBKYb9WwiYj42BLp24EBKNDx+m9o5ghwahhj4oZA=;
 b=PJXuzGwdCO5KwQnFUMp23JOp9iW0oJ48yDyQfpHNJTyugDwIJkPj4nRVzCw2XVowuSW1hs3HlL8SugLPDqKkutTlSfCzZSmLN86rbOcMjZ9TnYXkeYlWfwh872f7P/qaTmYtBakn1oh0IijDtpkZSZjYFD1FKiV6AEs1A9N/0hyvfa9J4vvnXzuSWPmcy2Wd4Z9ge7JnIdtZIfjJaRUC7+gEkxMCqPf3Wjtf91+PkQHC/z92DwNCHVqoM+GNOHfa2u16OP7IFjkcsaNEl5bQB4ZowCnlGeBq0bMX9QjhuN02zOiLkT/IrD/NgSCsMlUOMuAtWxMUbntZKg5k06E+sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApiSBKYb9WwiYj42BLp24EBKNDx+m9o5ghwahhj4oZA=;
 b=Z8KGmKerzWm2mifwwT7AubVGJ2OR/WR27OapTlV8Bcf79EqNFo7o98b1Dj2rD7P2QwC23oLKGNvEh5vAEem+B7mu1e+6vDJhnHQLqVQaDmiVAkQkE37QboWsXjP6rMbrbau/WpwjVhWE3U/FF3mxG7AQJpbzb0Gy5MJfNvH4u0GfgOzOGSipwAcpdJcgjgT98UZHb3B0OtnxZNDb0n0R3Hzq5pWSp7n7OiTgyK2wYS0BB2c0QZKMYcwzVSyIcBLqvgxcY0u6umCWZkMXVitKDFyGPZJEKj30dFdVXj9Sn32jfjj9cC1X0gdSPWVUvbx/6XmeG9F/jrf+qcEFghHQfg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v6 0/4] xen/arm: scmi: introduce SCI SCMI SMC single-agent
 support
Thread-Topic: [PATCH v6 0/4] xen/arm: scmi: introduce SCI SCMI SMC
 single-agent support
Thread-Index: AQHcGDpz564/CxWJjkScJHSOCdJ/3w==
Date: Thu, 28 Aug 2025 16:40:24 +0000
Message-ID: <cover.1756399156.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DB9PR03MB7705:EE_
x-ms-office365-filtering-correlation-id: 7f625ed4-e273-484f-e5c8-08dde651966c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?uCeWYRQt+qpmLHzSUqUfqETirDnCgygJvrjJu+39WVMwljk1F3RlQTqS06?=
 =?iso-8859-1?Q?ApP8gFr6QCRFDQyadyg5sDhw/H6D2I8yunlkdte62SJWfef9D2n8SoO5ly?=
 =?iso-8859-1?Q?uBq3k0dVGzilQC2mdutIk21SA7OhE7aqlvAqxwWGHWBVG4L6uDPWfTysmE?=
 =?iso-8859-1?Q?rw998e7+GD2WmqVkZsHdjUR8CYjqLUkfi8xszrspsxiYfk01itYD7jUFHn?=
 =?iso-8859-1?Q?cV9u59+hIEQ9sKQAyAy9cojeuw4e3tP3MnDrT/TiFdf2LJVQWEM/4nJSVL?=
 =?iso-8859-1?Q?0Wxc/tl/vvTXQpHWcAYyn0LMP534KGO3gwmK4642u3U8ulJ1YdIHTj2ZFd?=
 =?iso-8859-1?Q?zYDlQZ6OeP583O6LGs0bKedPAD4WseZ5rPsX8jCpqQ1Qt1UfeN3UyqhHEO?=
 =?iso-8859-1?Q?0dMG9qGrLaOuAcntI2hid/Klwcv10DofPYjEjxX+Ay8O7Oc2FCTtVwNXXF?=
 =?iso-8859-1?Q?Or7WeNCBqgie0ER7DELJIUyAJVfQK5WTU16ay5odtXbnLc7P6XvdTRzp4r?=
 =?iso-8859-1?Q?dU84IBVncOsX9JdkyjcOLRAEg79vQ2tgviJ3WWFQlHSc0HH3a0PqE+LyYZ?=
 =?iso-8859-1?Q?zlHByzf4g+TXCp8Ip8Pm3rEN8djJiNcS3gvhQf0YrNw0atoZ8d8n3tDKde?=
 =?iso-8859-1?Q?IP6TtutxBqFCUMnWzZLYDC/bOGmGyZE9Xz9HPXI0OeMcI5pB7f5A1Ardqz?=
 =?iso-8859-1?Q?jWEiPPxterIbCrWbKx268pZiPb25TrA9elLaP2zed+dmvk+I+oVR9ausbU?=
 =?iso-8859-1?Q?dLV9hlx4N23MkztqZVqaMJk/j5JyTCdhBxj2dG+u1pkEuZrVFFh76S0URe?=
 =?iso-8859-1?Q?uVKojbWglHTJK/3nNxjrFofLFdsxcnZDhELgrJLAW3tzGl+lEJGA32iwMM?=
 =?iso-8859-1?Q?a6gqhWGR/j+bnIXs9rU9Nw4ee/EoEp22NXk44/4pr8hS6vtU2Y29XtraOl?=
 =?iso-8859-1?Q?JH2q7yQcMvK30HDEvYuvmN5bPufsACyg96nfW3T2oO1KCT3/eVEWkuw9N/?=
 =?iso-8859-1?Q?IxR6de8dzYSLcxTXLLmYI7maBkjsZJpKcB4Jti7fd/Yfi8eNNIAs0HxP/x?=
 =?iso-8859-1?Q?OM5rYczdd39jE0B3WfoXnJC1ETM6ihVkg4m2LGqNao+Ym30nZpjDC7vCd8?=
 =?iso-8859-1?Q?MogiUDUV4XDW+5xaoKzrv6/P0zTcIGJQpAv69Hs+FNh2iSOvFoGyNDlEve?=
 =?iso-8859-1?Q?rUTj/y/oTClNTaCzuGJwr79aWhxFuGLwGW7ofYFjkxDYPvSAsR5eiFaScq?=
 =?iso-8859-1?Q?7H74v9cOG66lyLfSL4uYoUyzzdgUM0zbH/DyhlL2s9Aw3g9LFDEyaXpuD9?=
 =?iso-8859-1?Q?EVl0fO3sQtYqGX45DjlTdrMRCxKP9MHWmeNnP3MZpLr50dmvVGhuBpRgRR?=
 =?iso-8859-1?Q?rMCCGA8m136d2I3buZzfPmiMkFWqOxLB3w3kLjnS9/Paqef/lOKJKKhB5i?=
 =?iso-8859-1?Q?XTAdYEZ0KmouQGQrSumIRVBsrxG8JpWGA/GuHoqhLDSgOGrGzOPbqHe7HA?=
 =?iso-8859-1?Q?A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?odkfE0cpbgcKven9DOOw0YTg35u+NHCg1yGixQuVrjx9bYzpeB+33BDg5u?=
 =?iso-8859-1?Q?UJ3VCdvjq/S+/KKE0U270Fb8eXQZ9d6LVejVp2uGv8xrgLDZNhFAHDcNz4?=
 =?iso-8859-1?Q?zr6Bok4TL6DvobBUSw4tQuGIVDLGv+BakTI+SC77SPFpTcVxzppqLAv+rO?=
 =?iso-8859-1?Q?5BxcLC706Kf9wr+/GEtcOYtmBPxkOdpAciBcAZd+uDDkjhKdqLZwZ3D+LD?=
 =?iso-8859-1?Q?fSPS6cpuK5gmX1Rh18XzgHNH1eTksZODpq/2JMLVHQYf94ipfiTgJE6WL1?=
 =?iso-8859-1?Q?mm2GoCxWVTWOj3kDR0B0PHu3iJZX8Z2Gdk6xt3+hJ25kTcv5orfnE/gneX?=
 =?iso-8859-1?Q?ETnzLjdqCDGWZrB0NzStm2yMdYbAyfHp+3lPeaHycrbeFBn1XPPxS47RJe?=
 =?iso-8859-1?Q?kaOcEh7q7CL9CBJxLToNTiLZsyK6wI7ifY9EB03WBlLp1A6KdsrfQ6VlX/?=
 =?iso-8859-1?Q?216PLUsELKqtCMZkdZafNT1RkAtCpySmqappygCFD9DnhQfV5KwO1sjL5Z?=
 =?iso-8859-1?Q?7RN7zvxmbgBH/ZNwH02acCenBmZgwl1VdCNWQ+5AeNtogSDkn5vQ2PY4Ej?=
 =?iso-8859-1?Q?VecaC6dakhBOfMpG4mRkDt5UfQyLcnKRNmd3iU0cXxIcVhOAV4bXCXUuYZ?=
 =?iso-8859-1?Q?DFRQEm+MYwqNG/CSxUvI+T/EwJ3Ij1ljyBJsEwdpFglvH9Ur2FjD+Bg714?=
 =?iso-8859-1?Q?INsS3+L9x/GTRHh/pGUcguxwVLUSw7WvBah7vAR+YQ44IyXXY1Co0rRQGa?=
 =?iso-8859-1?Q?yAB046UoTZOmBsJKWMXTBJlxx25PNuQmeF1IKAxGL2f26+ZHlWpFsbm9Vv?=
 =?iso-8859-1?Q?MMgyVo0Qt3xJw/ROJA+bHkcvDn+VVbYSZXE/00RFCEip6EHMTEID9vWqIS?=
 =?iso-8859-1?Q?MPcQGR9BSZu7+DrRewV+IeNSpyAn8I3mVRy0Rci4A73TZWeEvDGHCYYs2F?=
 =?iso-8859-1?Q?UGda8BHZG7matV+AT37JOJSo2sPjsE1TnmyITvDQJw5qtGMMKdpgeXcUR9?=
 =?iso-8859-1?Q?5jSm2CEB5gOybCFXjBuVn4Ahe+DPGMOi8t54/9O97Al+M5OZQX5TYBHggi?=
 =?iso-8859-1?Q?wsRQLM93u/2gmtbHbtUZQrVGTJ9z43NOSzd0z/zTkYUuF+r/qOmpei0ZBU?=
 =?iso-8859-1?Q?qvhKQ97RImU9QAqjC+98ePB+HqbcdtT5A/z9NH08iwGMU4qdSQdvpBfQGb?=
 =?iso-8859-1?Q?P2Gc6y/giFny/r3+rh9/3V+rV1/ooarp6zPTJT8vO1Y1T0ssqbobRAR5CK?=
 =?iso-8859-1?Q?SS/6W7UJ2/KMJZY4AkDgY0oXaGCR5tbPH0hdIbbKCK115Jem7tgglycXuB?=
 =?iso-8859-1?Q?T4Zsb4o8zDPLzvbnVTHPaZgwqsJXxIIBZn6t2gKvTekR5fLjgSa8GiGi8L?=
 =?iso-8859-1?Q?ColoPdNVjmaKbDms/1Y4A6AqFbkzK3HSNu+Tcef5Mi2ZrkKCsMilI1m580?=
 =?iso-8859-1?Q?PokGFACtZvVKrxT7HPfqhWAjuuFxrBuDQeOgvJa+3+0AOXeyQkEO5RMCji?=
 =?iso-8859-1?Q?hLzbg4yHmaH2PYBBDsLalXZZHpwRade/tCTtez0WGrF+h0WuSdGNOiM97x?=
 =?iso-8859-1?Q?7NedmSLSqqLFUUQatLW6QcyxD7RsiWTvMYTq3UYbWFEOy2ZYx8XCwRGBo1?=
 =?iso-8859-1?Q?4JnDsuNu6FWXdzgDfVSpUwmsuRD6wqwwGnbIvHqivoHQ/KPpB0MVyJMg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f625ed4-e273-484f-e5c8-08dde651966c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 16:40:24.6879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RzoJ7iW/uZjRQPRrN5wbK4bf0LVs/VhquD1y5/rEVwaF2EDOB8oXbemrAmCFJ/Ois1I50k7Pi2PI3TWdmb9pWjdKCpNd6yvNX8O87sISE8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7705


Inroducing V6 patch series  on top of the Xen version 4.20-rc2
which includes implementation of the SCI SCMI SMC single-agent support.

This patch series is the first chunk of the
"xen/arm: scmi: introduce SCI SCMI SMC multi-agent support" which can
be found at [0]

SCMI-multiagent support will be provided as the followup patch series.

[0] https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieie=
v@epam.com/

Patch 1 "xen/arm: add generic SCI subsystem"
- rebased and refactored
- introduced DEVICE_ARM_SCI DT device class and used for SCI drivers probin=
g
instead of custom,
  linker sections based implementation.
- added SCI API for Dom0 DT handling, instead of manipulating with ARM arch
dom0 code directly.
- RFC changes in XEN_DOMCTL_assign_device OP processing
- Introduce arch_handle_passthrough_prop call to handle arm specific
nodes

Patch 2 "xen/arm: scmi-smc: update to be used under sci subsystem"
- update driver introduced by commit 3e322bef8bc0 ("xen/arm: firmware: Add =
SCMI
over SMC calls
handling layer") be used under sci subsystem.
- no functional changes in general

Patch 3 "xen/arm: scmi-smc: passthrough SCMI SMC to guest domain
This is new change which allows passthrough SCMI SMC, single agent interfac=
e to
guest domain
cover use case "thin Dom0 with guest domain, which serves as Driver domain"=
.
See patch commit message for full description.

Patch 4 - docs: arm: add docs for SCMI over SMC calls forwarding
driver
- add documentation section for Simple Arm SCMI over SMC calls
forwarding driver.

Code can be found at:
https://github.com/oleksiimoisieiev/xen/tree/scmi_upstrv5

[1] RFC v2:
http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.ol=
eksii_moisieiev@epam.com/
[2] RFC v3:
https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927=
-1-grygorii_strashko@epam.com
SCMI spec:
https://developer.arm.com/documentation/den0056/e/?lang=3Den

SCMI bindings:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/access-controllers/access-controllers.ya=
ml

Reference EL3 FW:
RPI5: https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
Renesas v4h:
https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4=
x-scmi_upd/

base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)

Changes in v6:
- rebase on top of the latest master
- fix return value of sci_dt_finalize() call
- add R-b tag
- added generated helpers and types go files
- rename cmdline parameter to scmi-smc-passthrough
- fix goto tag in parse_arm_sci_config
- add link to the scmi bindings used in the doc
- remove mentions about HVC calls from doc
- rename cmdline parameter to scmi-smc-passthrough

Changes in v5:
- update Maintainers file. Set role as a Reviewer
- rebased on the latest master branch
- Introduce arch_handle_passthrough_prop call to handle arm specific nodes
- rename dom0_scmi_smc_passthrough to scmi_smc_passthrough
- rename dom0_scmi_smc_passthrough in documentation

Changes in v4:
- fix SPDX-License
- rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
- move XEN_DOMCTL_assign_device code in separate patch
- Add documentation for SCI SCMI drivers
- xl.cfg doc
- fix comments from Stefano Stabellini
- fix toolstack code as sugested by Anthony PERARD
  - use MATCH_OPTION()
  - move arm_sci struct and cfg params in "arch_arm"
- add SCMI passthrough for dom0less case

Grygorii Strashko (3):
  xen/arm: scmi-smc: update to be used under sci subsystem
  xen/arm: scmi-smc: passthrough SCMI SMC to domain, single agent
  docs: arm: add docs for SCMI over SMC calls forwarding driver

Oleksii Moisieiev (1):
  xen/arm: add generic SCI subsystem

 MAINTAINERS                                   |   6 +
 .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++
 docs/hypervisor-guide/arm/index.rst           |   9 +
 docs/hypervisor-guide/index.rst               |   1 +
 docs/man/xl.cfg.5.pod.in                      |  34 +++
 docs/misc/arm/device-tree/booting.txt         |  15 ++
 docs/misc/xen-command-line.pandoc             |   9 +
 tools/golang/xenlight/helpers.gen.go          |  41 ++++
 tools/golang/xenlight/types.gen.go            |  12 ++
 tools/include/libxl.h                         |   5 +
 tools/libs/light/libxl_arm.c                  |  14 ++
 tools/libs/light/libxl_types.idl              |  10 +
 tools/xl/xl_parse.c                           |  36 ++++
 xen/arch/arm/device.c                         |   5 +
 xen/arch/arm/dom0less-build.c                 |  40 ++++
 xen/arch/arm/domain.c                         |  12 +-
 xen/arch/arm/domain_build.c                   |   8 +
 xen/arch/arm/firmware/Kconfig                 |  25 ++-
 xen/arch/arm/firmware/Makefile                |   1 +
 xen/arch/arm/firmware/sci.c                   | 154 ++++++++++++++
 xen/arch/arm/firmware/scmi-smc.c              | 191 +++++++++++++----
 xen/arch/arm/include/asm/domain.h             |   5 +
 xen/arch/arm/include/asm/firmware/sci.h       | 200 ++++++++++++++++++
 xen/arch/arm/include/asm/firmware/scmi-smc.h  |  41 ----
 xen/arch/arm/vsmc.c                           |   4 +-
 xen/common/device-tree/dom0less-build.c       |   4 +
 xen/include/asm-generic/device.h              |   1 +
 xen/include/public/arch-arm.h                 |   5 +
 xen/include/xen/dom0less-build.h              |   9 +
 29 files changed, 992 insertions(+), 85 deletions(-)
 create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
 create mode 100644 docs/hypervisor-guide/arm/index.rst
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
 delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

--=20
2.34.1

