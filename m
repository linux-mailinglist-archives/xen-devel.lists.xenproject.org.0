Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA5B4CC068
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 15:54:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283405.482405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPmqg-0005a3-S9; Thu, 03 Mar 2022 14:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283405.482405; Thu, 03 Mar 2022 14:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPmqg-0005X5-OU; Thu, 03 Mar 2022 14:54:34 +0000
Received: by outflank-mailman (input) for mailman id 283405;
 Thu, 03 Mar 2022 14:54:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOOP=TO=santannapisa.it=Andrea.Stevanato@srs-se1.protection.inumbo.net>)
 id 1nPmqe-0005Wz-On
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 14:54:33 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe02::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3bf0e45-9b01-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 15:54:30 +0100 (CET)
Received: from DB7PR03MB5002.eurprd03.prod.outlook.com (2603:10a6:10:74::22)
 by PR3PR03MB6634.eurprd03.prod.outlook.com (2603:10a6:102:7d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 14:54:27 +0000
Received: from DB7PR03MB5002.eurprd03.prod.outlook.com
 ([fe80::746a:e27:47ff:3e90]) by DB7PR03MB5002.eurprd03.prod.outlook.com
 ([fe80::746a:e27:47ff:3e90%7]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 14:54:27 +0000
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
X-Inumbo-ID: d3bf0e45-9b01-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwdSq4JHCRv6+PM5EDt3NHHrzbI4JnF1iItf4rCfyTPP/7AN3s6Y8+Pqg0USYbxjEhxydf7zYgB/4TCe9gaPAdcHf+xzwzlKdCR/JNx2yBnNIoAC+Bkw/gf0DKn0cyRbQGpZL6jwD44O0ZvRDxeWmBgz5wOgUGQ2MQtH+UvhhrUosGIitFw5kOBKhOX8/QLKAc+64NMlt2KC/gOfwLkHitdNYnVxNfEzxy1SRZ6NrtQq/QF3ZpVZv+buvgcNWgeO/jkXS3UMndLk/KE5lA+PQENoci+1P9jiETW5NlhUSimJoGTOK7SFur+RN7xVMmmotLDUUr4VGd2obHTpg1VU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UunJEetloyMh7rCIYjzvirMbz13ExSe++WoIbmllPOQ=;
 b=h4CRLvECpyy7HN3+LXB+vQBkHzFr6FurryY97hzgPrVglXe+O7TwvMHeoyVSmt+FBKdBrKHcyASis71MlP7BDPYqZ5LpapbHLbEJTou8GRLtd5ExutZDO7hqIr+439KtUuj49D5nPTax88oXbOREriyIyJ00pIOe+f5/5M3jKlW7QFiIg4ASxn/SivFn0H84ysXqhneaWmXwHF0dE0nDoxgcheM2pSt9Gbk+cFRJM6UnC28oPzg92sl8lP/KpwKGL2TAoN1DFD7+Ac3cS9z3myQAiWEc3ktcWWn7qw8gHWzJee4E8bes296EjFZH7FdXY8XL5rbK129aqefSY8ol1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UunJEetloyMh7rCIYjzvirMbz13ExSe++WoIbmllPOQ=;
 b=KW1MFLuYY90fvAbC/m2AtCHQk5AikQJgfonn1uOqrS+bnsd0SG/Ehn0E4Pxdx32G+DLexFC4//c9ZJi1ZnXVoZ/JXjRUyhRpAU8Jyqgqkig4fO4O8U/hqT+JLWyyZYbjN8mVwMzcIgdsekO+rgKmNICZP1vmXu4WGJad1/YGRHc=
From: Andrea Stevanato <Andrea.Stevanato@santannapisa.it>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "roger.pau@citrix.com" <roger.pau@citrix.com>, "ian.jackson@eu.citrix.com"
	<ian.jackson@eu.citrix.com>, "wl@xen.org" <wl@xen.org>
Subject: Network driver domain broken
Thread-Topic: Network driver domain broken
Thread-Index: AQHYLw1qzygpamMN3EyejpXz6IEhzA==
Date: Thu, 3 Mar 2022 14:54:27 +0000
Message-ID:
 <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: eaa5c839-fc2d-33ff-55c0-aaead7f8ad6f
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f0e5251-ab22-4f61-9f89-08d9fd25b6bf
x-ms-traffictypediagnostic: PR3PR03MB6634:EE_
x-microsoft-antispam-prvs:
 <PR3PR03MB66345B91E46157157B2DFA2D98049@PR3PR03MB6634.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ztqpIASjf+oWhY96BoXpIhnzEIMhbVWFw89sMENqUuo5Ga8ZQ538I2wr5K/Yxyj+XcjqVw83fCeN2x2Y6BqOxcrqROC4ob/IcszpLd1CO1UPiLLyW+XJ7TFM9r2ioe2HuWH4auEdGjtO7l1ybFHUgokArQQzq9v7/CWBdq3vYpXpqt4cGpx5kiwB0P05sBCcwNVrcloSYyVHvzQbk84n2T/9VZ3fanEYGFIPq9VDWRXFsXSKIZWdpMyphC7RKiQN2NqrZJJPcacvVUmw6mD0xwpZ+h/21icZLCa6ug2Adk+k81JzhqUN7VWbY78Yy6YymIpP7yOKSxGGdETeirYHI2MlHkMRjedx1mYC3kQtturRQtPlebG9ow/rJEXVhsMgcIZo5NRrZDHqRrEh6IKm0iIEQIZnM2Q4CJtAk3WryAmdvlPkaIBzIPcos6njl8vJxlZNs2hpsb/H2dIuee7hx1d+QdJhXLW2EVlM0iTIExhRcZRFi8StyOsHP6XywT73nph14ZjJgOQNhnlk0ZirWb+PWHe69F6rsVaQhEcQwXIFm0PF6UtEvkm74hnclDijM3DqE30Kyq1W7ZYI/OHwyOj98SCtzZ9c2suAXqDco5Jf1HxPd0zx0eZibcL8jXIUwqd7mo9lMeAZkzn9/R5zm4/mMLxlOgO81ED14e4JQLxCZ+D/kIiFv8VL17A8ut1dMz/Zem8xZaefSY76OBymMw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB5002.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(86362001)(122000001)(508600001)(2906002)(83380400001)(38100700002)(71200400001)(8936002)(54906003)(786003)(91956017)(316002)(38070700005)(186003)(26005)(6916009)(3480700007)(76116006)(4326008)(5660300002)(64756008)(6506007)(30864003)(8676002)(52536014)(33656002)(9686003)(7696005)(66946007)(66476007)(66446008)(66556008)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+42mLBsf68dHkTeoDkStaECs+1SC413FR6LkDKBZhhcDvIOaY6gByJ76jC?=
 =?iso-8859-1?Q?SSMVU/yY5IXPC8NEcq8RZDEx0XM+s/vj8lPNJFvWwfeVaTaGXAzpAjXSac?=
 =?iso-8859-1?Q?2S7YVCH9goMwOrcWtypsOuoemvZLxLohPJeAwbafsvQIAAdh7nVel9grNs?=
 =?iso-8859-1?Q?r6z7zvtoUQI3GrdnbuVWpwWrrn1uB/Rq0hPqP9yaWCmfLpwWU93iUe4aNi?=
 =?iso-8859-1?Q?H0UXJjacMzw00IDorMDUT7gmOkXYCnKwIpBUjDtnqfwn8E9soOwRSpsGQ1?=
 =?iso-8859-1?Q?EqC4ND7z55YSICRb+DGDj4f/xxk92+Yh1zonSO+bZOxyYFKA12UHJox46k?=
 =?iso-8859-1?Q?UZShUbHt0Fzy1no2h4bjoILI9ydO130LDo3dZ6780Q75f3WuhkdKmrc1Lz?=
 =?iso-8859-1?Q?3cMvXfijp2M9DJtoq5kLZJs+jASmD72Duo0nBII26y4x0af3DOm1ZVc7dp?=
 =?iso-8859-1?Q?Lq3SR+v2ADkzgzy6wmUq6mxU/KB7BWoZ5jGNX6DqvPNcTP+0PbYSql3MqM?=
 =?iso-8859-1?Q?BmelWsEuyfncR2CH53qZPcql3qLREOmvbyeQyPu7Xbr9TRhRbpouTnOsxP?=
 =?iso-8859-1?Q?2GTnwNzioT2Uh9xf+H4zQG30cA441WGOcyAlteF6PfZnurD0zYqUtiGZfW?=
 =?iso-8859-1?Q?1C8XJKBNUlYtm6a2ZuGQDAVKHOJDIAZ/AKKIHbPM0zO3iCogU/Rvm2xF1C?=
 =?iso-8859-1?Q?8ysSGICzHrYhZX1ZFcvaTZ/NGHP5eYuLfWabzxmf7QOS4XIEHMa79Lg9hZ?=
 =?iso-8859-1?Q?ouphRuxzu3SYeSxz/t97875/YhffgUmDEOHP5qkf4XrHuHftx1G0Sqh7/y?=
 =?iso-8859-1?Q?m2soCldmbDpJV1XfXoSuddEwn3UnT8CGIKBnuVRxZNQaQ+ghDYv2iS5c9H?=
 =?iso-8859-1?Q?HVekGnoGKgL/ocu/G4QW80I8iI0N6RfmzHam0Li33dc56FYb9OoIE12bB9?=
 =?iso-8859-1?Q?H65H3CsWLLUfvg8PhfW5IhRi1Yl+wUYMEiCHgkrcf/1tK7npEAacSZIGRa?=
 =?iso-8859-1?Q?pZJOgQGeovrUS+hPzSuTA97gITlb1TmlyFgfxlKm319m4GCZRQ7Br7/BrW?=
 =?iso-8859-1?Q?Zhy8tPM5gZ2REcsU6JlYzAZXGZuP3M4s2dxGUyHOHxcUP6bjDhvletwWY0?=
 =?iso-8859-1?Q?u9zybJO8pWIOmLB2931BBWlG/Gh+L1vFCxTau1Q8Pgg6p/kGGLis57SJC+?=
 =?iso-8859-1?Q?s9MaYHrOI2pjcqcWe/lucTo+J2FcrK/X9RH/U88Vm9X/cR1T+e3LiVCtEE?=
 =?iso-8859-1?Q?Eu2yxG9rZzmqI7T6MUWarLSA6SSVdSU4JpkonUPDTpqylGqdpghRA2NdjE?=
 =?iso-8859-1?Q?qjq7yiUHEHaAcpQl1fUkU4h3oBhTDAkme7eiEB7rhk+Is9Ty2iIWe3RANG?=
 =?iso-8859-1?Q?fRjsukGZbGHwUF245T9TYjnuMeujdoAj7ZIefbDXBg95APm7EAvqykV/eo?=
 =?iso-8859-1?Q?CrtdZY/9mr/ffreqvSQ0hznislDHPr1pCsTWPBt1hhXjtJK/jt8w9dag1b?=
 =?iso-8859-1?Q?UMbtAreHPrUVkkpGOWjZ/V1w2V3KS9FG2huIA9rFh7vRKVzoW0qDl2TrPJ?=
 =?iso-8859-1?Q?xZsH1uvl7wmaPGBaOF0HMMyn7kkXKJLDYEaowpWw1We4gF+bKp2liic7tl?=
 =?iso-8859-1?Q?WUr2NCjvuJOHbOj0aIj+QlLgrhvuhD7RNJxqWP3pKe+a1u2NebvAf7SVyb?=
 =?iso-8859-1?Q?Y6RtRHukOk2ngx6E2cR4lP1AtPFQ5EJwCEGfPkK412p4XdOWQGa5CgB7QY?=
 =?iso-8859-1?Q?noIXR3hswJIppPk/PKmfKlip529TBiBEslPLcnf6ZgZcUp?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB5002.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0e5251-ab22-4f61-9f89-08d9fd25b6bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 14:54:27.0795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ypOusGcm2NEhGljRNeaHKA9xY2wdUsOY+BLh8PFCV40mMmQKRG0V4OP3g2jfqB6uuwoLGqlYeELa5HicmtsHRSeHgt1ecHpeay64l6JSv85/MdtwvACr4Npxgeq8nmQp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6634

Hi all,=0A=
=0A=
according to the conversation that I had with royger, aa67b97ed34=A0 broke =
the driver domain support.=0A=
=0A=
What I'm trying to do is to setup networking between guests using driver do=
main. Therefore, the guest (driver) has been started with the following cfg=
.=0A=
=0A=
name =A0 =A0=3D "guest0"=0A=
=0A=
=0A=
kernel =A0=3D "/media/sd-mmcblk0p1/Image"=0A=
=0A=
=0A=
ramdisk =3D "/media/sd-mmcblk0p1/rootfs.cpio.gz"=0A=
=0A=
=0A=
extra =A0 =3D "console=3Dhvc0 rdinit=3D/sbin/init root=3D/dev/ram0"=0A=
=0A=
=0A=
memory =A0=3D 1024=0A=
=0A=
vcpus =A0 =3D 2=0A=
driver_domain =3D 1=0A=
=0A=
On guest0 I created the bridge, assigned a static IP and started the udhcpd=
 on xenbr0 interface.=0A=
While the second guest has been started with the following cfg:=0A=
=0A=
name =A0 =A0=3D "guest1"=0A=
=0A=
=0A=
kernel =A0=3D "/media/sd-mmcblk0p1/Image"=0A=
=0A=
=0A=
ramdisk =3D "/media/sd-mmcblk0p1/rootfs.cpio.gz"=0A=
=0A=
=0A=
extra =A0 =3D "console=3Dhvc0 rdinit=3D/sbin/init root=3D/dev/ram0"=0A=
=0A=
=0A=
memory =A0=3D 1024 vcpus =A0 =3D 2=0A=
vcpus =A0 =3D 2=0A=
vif =3D [ 'bridge=3Dxenbr0, backend=3Dguest0' ]=0A=
=0A=
Follows the result of strace xl devd:=0A=
=0A=
# strace xl devd=0A=
execve("/usr/sbin/xl", ["xl", "devd"], 0xffffdf0420c8 /* 13 vars */) =3D 0=
=0A=
brk(NULL)                               =3D 0xaaaaeaf3b000=0A=
faccessat(AT_FDCWD, "/etc/ld.so.preload", R_OK) =3D -1 ENOENT (No such file=
 or directory)=0A=
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 3=0A=
fstat(3, {st_mode=3DS_IFREG|0644, st_size=3D7840, ...}) =3D 0=0A=
mmap(NULL, 7840, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0xffff9f45e000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libxlutil.so.4.14", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0200\0\0\0\0\0\0=
"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D68168, ...}) =3D 0=0A=
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0xffff9f45c000=0A=
mmap(NULL, 131784, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9f410000=0A=
mprotect(0xffff9f41f000, 65536, PROT_NONE) =3D 0=0A=
mmap(0xffff9f42f000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0xf000) =3D 0xffff9f42f000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libxenlight.so.4.14", O_RDONLY|O_CLOEXEC) =3D 3=
=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\16\2\0\0\0\0\0"=
..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D861848, ...}) =3D 0=0A=
mmap(NULL, 925752, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9f32d000=0A=
mprotect(0xffff9f3fa000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9f409000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP=
_DENYWRITE, 3, 0xcc000) =3D 0xffff9f409000=0A=
mmap(0xffff9f40f000, 56, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_AN=
ONYMOUS, -1, 0) =3D 0xffff9f40f000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libxentoollog.so.1", O_RDONLY|O_CLOEXEC) =3D 3=
=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0P\r\0\0\0\0\0\0".=
.., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D10368, ...}) =3D 0=0A=
mmap(NULL, 73904, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D=
 0xffff9f31a000=0A=
mprotect(0xffff9f31c000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9f32b000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x1000) =3D 0xffff9f32b000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libyajl.so.2", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\22\0\0\0\0\0=
\0"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D38728, ...}) =3D 0=0A=
mmap(NULL, 102416, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9f300000=0A=
mprotect(0xffff9f309000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9f318000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x8000) =3D 0xffff9f318000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/lib/libpthread.so.0", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\300j\0\0\0\0\0\0=
"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D113184, ...}) =3D 0=0A=
mmap(NULL, 192872, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9f2d0000=0A=
mprotect(0xffff9f2ea000, 65536, PROT_NONE) =3D 0=0A=
mmap(0xffff9f2fa000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x1a000) =3D 0xffff9f2fa000=0A=
mmap(0xffff9f2fc000, 12648, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP=
_ANONYMOUS, -1, 0) =3D 0xffff9f2fc000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320I\2\0\0\0\0\0=
"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D1428872, ...}) =3D 0=0A=
mmap(NULL, 1502000, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9f161000=0A=
mprotect(0xffff9f2b8000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9f2c7000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP=
_DENYWRITE, 3, 0x156000) =3D 0xffff9f2c7000=0A=
mmap(0xffff9f2cd000, 11056, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP=
_ANONYMOUS, -1, 0) =3D 0xffff9f2cd000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libxenevtchn.so.1", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0@\f\0\0\0\0\0\0".=
.., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D10240, ...}) =3D 0=0A=
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0xffff9f45a000=0A=
mmap(NULL, 73856, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D=
 0xffff9f14e000=0A=
mprotect(0xffff9f150000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9f15f000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x1000) =3D 0xffff9f15f000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libxenctrl.so.4.14", O_RDONLY|O_CLOEXEC) =3D 3=
=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\203\0\0\0\0\0=
\0"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D154752, ...}) =3D 0=0A=
mmap(NULL, 218504, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9f118000=0A=
mprotect(0xffff9f13d000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9f14c000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x24000) =3D 0xffff9f14c000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libxenguest.so.4.14", O_RDONLY|O_CLOEXEC) =3D 3=
=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0PB\0\0\0\0\0\0"..=
., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D77248, ...}) =3D 0=0A=
mmap(NULL, 140880, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9f0f5000=0A=
mprotect(0xffff9f107000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9f116000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x11000) =3D 0xffff9f116000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libxenhypfs.so.1", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\300\16\0\0\0\0\0=
\0"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D14432, ...}) =3D 0=0A=
mmap(NULL, 78048, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D=
 0xffff9f0e1000=0A=
mprotect(0xffff9f0e3000, 65536, PROT_NONE) =3D 0=0A=
mmap(0xffff9f0f3000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x2000) =3D 0xffff9f0f3000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libxenstore.so.3.0", O_RDONLY|O_CLOEXEC) =3D 3=
=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0 $\0\0\0\0\0\0"..=
., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D31176, ...}) =3D 0=0A=
mmap(NULL, 107088, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9f0c6000=0A=
mprotect(0xffff9f0cc000, 65536, PROT_NONE) =3D 0=0A=
mmap(0xffff9f0dc000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x6000) =3D 0xffff9f0dc000=0A=
mmap(0xffff9f0de000, 8784, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
ANONYMOUS, -1, 0) =3D 0xffff9f0de000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/lib/libdl.so.2", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0@\20\0\0\0\0\0\0"=
..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D14296, ...}) =3D 0=0A=
mmap(NULL, 77920, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D=
 0xffff9f0b2000=0A=
mprotect(0xffff9f0b5000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9f0c4000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x2000) =3D 0xffff9f0c4000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libxentoolcore.so.1", O_RDONLY|O_CLOEXEC) =3D 3=
=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0 \10\0\0\0\0\0\0"=
..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D6104, ...}) =3D 0=0A=
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0xffff9f458000=0A=
mmap(NULL, 69768, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D=
 0xffff9f0a0000=0A=
mprotect(0xffff9f0a1000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9f0b0000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0) =3D 0xffff9f0b0000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/lib/libutil.so.1", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\21\0\0\0\0\0\0"=
..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D14296, ...}) =3D 0=0A=
mmap(NULL, 77840, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D=
 0xffff9f08c000=0A=
mprotect(0xffff9f08e000, 65536, PROT_NONE) =3D 0=0A=
mmap(0xffff9f09e000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x2000) =3D 0xffff9f09e000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/lib/libuuid.so.1", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\30\0\0\0\0\0\=
0"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D30680, ...}) =3D 0=0A=
mmap(NULL, 94240, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D=
 0xffff9f074000=0A=
mprotect(0xffff9f07a000, 65536, PROT_NONE) =3D 0=0A=
mmap(0xffff9f08a000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x6000) =3D 0xffff9f08a000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libnl-route-3.so.200", O_RDONLY|O_CLOEXEC) =3D 3=
=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\200\327\1\0\0\0\=
0\0"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D536688, ...}) =3D 0=0A=
mmap(NULL, 609024, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9efdf000=0A=
mprotect(0xffff9f05a000, 65536, PROT_NONE) =3D 0=0A=
mmap(0xffff9f06a000, 32768, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP=
_DENYWRITE, 3, 0x7b000) =3D 0xffff9f06a000=0A=
mmap(0xffff9f072000, 6912, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
ANONYMOUS, -1, 0) =3D 0xffff9f072000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libnl-3.so.200", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\360\221\0\0\0\0\=
0\0"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D141304, ...}) =3D 0=0A=
mmap(NULL, 205192, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9efac000=0A=
mprotect(0xffff9efcd000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9efdc000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP=
_DENYWRITE, 3, 0x20000) =3D 0xffff9efdc000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/lib/librt.so.1", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0#\0\0\0\0\0\0".=
.., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D31032, ...}) =3D 0=0A=
mmap(NULL, 94568, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D=
 0xffff9ef94000=0A=
mprotect(0xffff9ef9b000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9efaa000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x6000) =3D 0xffff9efaa000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libfdt.so.1", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000#\0\0\0\0\0\0"=
..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D38800, ...}) =3D 0=0A=
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0xffff9f456000=0A=
mmap(NULL, 102416, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9ef7a000=0A=
mprotect(0xffff9ef83000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9ef92000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x8000) =3D 0xffff9ef92000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libxengnttab.so.1", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\20\0\0\0\0\0\0"=
..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D14368, ...}) =3D 0=0A=
mmap(NULL, 77984, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D=
 0xffff9ef66000=0A=
mprotect(0xffff9ef69000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9ef78000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x2000) =3D 0xffff9ef78000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libxencall.so.1", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\17\0\0\0\0\0=
\0"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D14400, ...}) =3D 0=0A=
mmap(NULL, 78064, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D=
 0xffff9ef52000=0A=
mprotect(0xffff9ef55000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9ef64000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x2000) =3D 0xffff9ef64000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libxenforeignmemory.so.1", O_RDONLY|O_CLOEXEC) =
=3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\16\0\0\0\0\0\=
0"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D14392, ...}) =3D 0=0A=
mmap(NULL, 78000, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D=
 0xffff9ef3e000=0A=
mprotect(0xffff9ef40000, 65536, PROT_NONE) =3D 0=0A=
mmap(0xffff9ef50000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x2000) =3D 0xffff9ef50000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libxendevicemodel.so.1", O_RDONLY|O_CLOEXEC) =3D=
 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\23\0\0\0\0\0\0"=
..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D14400, ...}) =3D 0=0A=
mmap(NULL, 78008, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D=
 0xffff9ef2a000=0A=
mprotect(0xffff9ef2d000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9ef3c000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x2000) =3D 0xffff9ef3c000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/libbz2.so.1", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\27\0\0\0\0\0=
\0"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D70472, ...}) =3D 0=0A=
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0xffff9f454000=0A=
mmap(NULL, 134160, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9ef09000=0A=
mprotect(0xffff9ef19000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9ef28000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0xf000) =3D 0xffff9ef28000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/liblzma.so.5", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\3403\0\0\0\0\0\0=
"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D153496, ...}) =3D 0=0A=
mmap(NULL, 217104, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9eed3000=0A=
mprotect(0xffff9eef7000, 65536, PROT_NONE) =3D 0=0A=
mmap(0xffff9ef07000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x24000) =3D 0xffff9ef07000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/usr/lib/liblzo2.so.2", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320&\0\0\0\0\0\0=
"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D120648, ...}) =3D 0=0A=
mmap(NULL, 184336, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9eea5000=0A=
mprotect(0xffff9eec2000, 61440, PROT_NONE) =3D 0=0A=
mmap(0xffff9eed1000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x1c000) =3D 0xffff9eed1000=0A=
close(3)                                =3D 0=0A=
openat(AT_FDCWD, "/lib/libz.so.1", O_RDONLY|O_CLOEXEC) =3D 3=0A=
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\360%\0\0\0\0\0\0=
"..., 832) =3D 832=0A=
fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D92056, ...}) =3D 0=0A=
mmap(NULL, 155664, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xffff9ee7e000=0A=
mprotect(0xffff9ee93000, 65536, PROT_NONE) =3D 0=0A=
mmap(0xffff9eea3000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0x15000) =3D 0xffff9eea3000=0A=
close(3)                                =3D 0=0A=
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0xffff9ee7c000=0A=
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0xffff9ee7a000=0A=
mprotect(0xffff9f2c7000, 12288, PROT_READ) =3D 0=0A=
mprotect(0xffff9eea3000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9eed1000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9f2fa000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9ef07000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9ef28000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9f32b000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9f0b0000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9ef64000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9ef3c000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9ef50000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9ef78000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9ef92000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9efaa000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9efdc000, 8192, PROT_READ) =3D 0=0A=
mprotect(0xffff9f06a000, 16384, PROT_READ) =3D 0=0A=
mprotect(0xffff9f08a000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9f09e000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9f0c4000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9f0dc000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9f0f3000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9f15f000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9f14c000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9f116000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9f318000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9f409000, 8192, PROT_READ) =3D 0=0A=
mprotect(0xffff9f42f000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xaaaabaa10000, 4096, PROT_READ) =3D 0=0A=
mprotect(0xffff9f463000, 4096, PROT_READ) =3D 0=0A=
munmap(0xffff9f45e000, 7840)            =3D 0=0A=
set_tid_address(0xffff9ee7a0e0)         =3D 813=0A=
set_robust_list(0xffff9ee7a0f0, 24)     =3D 0=0A=
rt_sigaction(SIGRTMIN, {sa_handler=3D0xffff9f2d6570, sa_mask=3D[], sa_flags=
=3DSA_SIGINFO}, NULL, 8) =3D 0=0A=
rt_sigaction(SIGRT_1, {sa_handler=3D0xffff9f2d6630, sa_mask=3D[], sa_flags=
=3DSA_RESTART|SA_SIGINFO}, NULL, 8) =3D 0=0A=
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) =3D 0=0A=
prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=3D8192*1024, rlim_max=3DRLIM64_I=
NFINITY}) =3D 0=0A=
brk(NULL)                               =3D 0xaaaaeaf3b000=0A=
brk(0xaaaaeaf5c000)                     =3D 0xaaaaeaf5c000=0A=
newfstatat(AT_FDCWD, "/etc/libnl/classid", {st_mode=3DS_IFREG|0644, st_size=
=3D1130, ...}, 0) =3D 0=0A=
openat(AT_FDCWD, "/etc/libnl/classid", O_RDONLY|O_CLOEXEC) =3D 3=0A=
fstat(3, {st_mode=3DS_IFREG|0644, st_size=3D1130, ...}) =3D 0=0A=
read(3, "################################"..., 4096) =3D 1130=0A=
read(3, "", 4096)                       =3D 0=0A=
close(3)                                =3D 0=0A=
ioctl(2, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0=0A=
pipe2([3, 4], 0)                        =3D 0=0A=
fcntl(3, F_GETFL)                       =3D 0 (flags O_RDONLY)=0A=
fcntl(3, F_SETFL, O_RDONLY|O_NONBLOCK)  =3D 0=0A=
fcntl(4, F_GETFL)                       =3D 0x1 (flags O_WRONLY)=0A=
fcntl(4, F_SETFL, O_WRONLY|O_NONBLOCK)  =3D 0=0A=
openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) =3D 5=0A=
openat(AT_FDCWD, "/dev/xen/hypercall", O_RDWR|O_CLOEXEC) =3D 6=0A=
openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) =3D 7=0A=
ioctl(7, _IOC(_IOC_NONE, 0x50, 0xff, 0), 0) =3D -1 ENOTTY (Inappropriate io=
ctl for device)=0A=
openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) =3D 8=0A=
openat(AT_FDCWD, "/dev/xen/hypercall", O_RDWR|O_CLOEXEC) =3D 9=0A=
openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) =3D 10=0A=
ioctl(10, _IOC(_IOC_NONE, 0x50, 0x5, 0x10), 0xffffe6e417f0) =3D 0=0A=
newfstatat(AT_FDCWD, "/var/run/xenstored/socket", {st_mode=3DS_IFSOCK|0600,=
 st_size=3D0, ...}, 0) =3D 0=0A=
socket(AF_UNIX, SOCK_STREAM, 0)         =3D 11=0A=
fcntl(11, F_GETFD)                      =3D 0=0A=
fcntl(11, F_SETFD, FD_CLOEXEC)          =3D 0=0A=
connect(11, {sa_family=3DAF_UNIX, sun_path=3D"/var/run/xenstored/socket"}, =
110) =3D -1 ECONNREFUSED (Connection refused)=0A=
close(11)                               =3D 0=0A=
faccessat(AT_FDCWD, "/dev/xen/xenbus", F_OK) =3D 0=0A=
newfstatat(AT_FDCWD, "/dev/xen/xenbus", {st_mode=3DS_IFCHR|0600, st_rdev=3D=
makedev(0xa, 0x3e), ...}, 0) =3D 0=0A=
openat(AT_FDCWD, "/dev/xen/xenbus", O_RDWR) =3D 11=0A=
openat(AT_FDCWD, "/etc/xen/xl.conf", O_RDONLY) =3D 12=0A=
fstat(12, {st_mode=3DS_IFREG|0644, st_size=3D1602, ...}) =3D 0=0A=
fstat(12, {st_mode=3DS_IFREG|0644, st_size=3D1602, ...}) =3D 0=0A=
read(12, "## Global XL config file ##\n\n# S"..., 4096) =3D 1602=0A=
close(12)                               =3D 0=0A=
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) =3D 262158=0A=
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_SHARED, 6, 0) =3D 0xffff9f45f000=
=0A=
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) =3D 0=0A=
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) =3D 0=0A=
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) =3D 0=0A=
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) =3D 0=0A=
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) =3D 0=0A=
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) =3D 4096=0A=
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) =3D 0=0A=
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41820) =3D -1 EPERM (Oper=
ation not permitted)=0A=
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) =3D -1 EPERM (Oper=
ation not permitted)=0A=
write(2, "libxl: ", 7libxl: )                  =3D 7=0A=
write(2, "error: ", 7error: )                  =3D 7=0A=
write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_c=
pu_bitmap_alloc: failed to retrieve the maximum number of cpus) =3D 87=0A=
write(2, "\n", 1=0A=
)                       =3D 1=0A=
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) =3D -1 EPERM (Oper=
ation not permitted)=0A=
write(2, "libxl: ", 7libxl: )                  =3D 7=0A=
write(2, "error: ", 7error: )                  =3D 7=0A=
write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_c=
pu_bitmap_alloc: failed to retrieve the maximum number of cpus) =3D 87=0A=
write(2, "\n", 1=0A=
)                       =3D 1=0A=
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) =3D -1 EPERM (Oper=
ation not permitted)=0A=
write(2, "libxl: ", 7libxl: )                  =3D 7=0A=
write(2, "error: ", 7error: )                  =3D 7=0A=
write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_c=
pu_bitmap_alloc: failed to retrieve the maximum number of cpus) =3D 87=0A=
write(2, "\n", 1=0A=
)                       =3D 1=0A=
clone(child_stack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|S=
IGCHLD, child_tidptr=3D0xffff9ee7a0e0) =3D 814=0A=
wait4(814, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 814=0A=
--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D814, si_uid=
=3D0, si_status=3D0, si_utime=3D2, si_stime=3D2} ---=0A=
close(6)                                =3D 0=0A=
close(5)                                =3D 0=0A=
munmap(0xffff9f45f000, 4096)            =3D 0=0A=
close(7)                                =3D 0=0A=
close(10)                               =3D 0=0A=
close(9)                                =3D 0=0A=
close(8)                                =3D 0=0A=
close(11)                               =3D 0=0A=
close(3)                                =3D 0=0A=
close(4)                                =3D 0=0A=
exit_group(0)                           =3D ?=0A=
+++ exited with 0 +++=0A=
=0A=
royger told me that it is a BUG and not an issue with my setup. Therefore h=
ere I am.=0A=
=0A=
Cheers,=0A=
Andrea=

