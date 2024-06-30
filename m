Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8CF91D1B1
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jun 2024 14:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751170.1159059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNu8v-0007e0-2B; Sun, 30 Jun 2024 12:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751170.1159059; Sun, 30 Jun 2024 12:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNu8u-0007bl-Uj; Sun, 30 Jun 2024 12:58:56 +0000
Received: by outflank-mailman (input) for mailman id 751170;
 Sun, 30 Jun 2024 12:58:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l6Lh=OA=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1sNu8t-0007bf-IM
 for xen-devel@lists.xenproject.org; Sun, 30 Jun 2024 12:58:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80775327-36e0-11ef-90a3-e314d9c70b13;
 Sun, 30 Jun 2024 14:58:53 +0200 (CEST)
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by DBAPR04MB7256.eurprd04.prod.outlook.com (2603:10a6:10:1a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Sun, 30 Jun
 2024 12:58:50 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7719.028; Sun, 30 Jun 2024
 12:58:48 +0000
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
X-Inumbo-ID: 80775327-36e0-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K67OslUj1PHceXHb3iYsgDi0KI9bswlwloV6cY5oqBqtmeHsn4KQzM2d8Zy09D85lGaFHOwBVzEjymGHEIfJJ73PPkYlnae8tJaw9h9rwf+1n8lD52sopisOFk021d9GaQU5UP43tckZr8mKnxBLuR6NoNMrd7AT2SmpzdajqesQtVlvWbz/dmW6fJk7ZZ9K2z+5A97GZJQYDFosq7AvLxrvC/VcrNllrj3xz+Fmai30yjjfvEK+2TEo+6vHIaoMAD3jDAmSlD3K4iHockIL+050C5xegRU7Z7egrgs/m1x/Z6SCvtMaX8RbioLji2XzEhulWVcsLeLoNC5ppuLjpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LevxgQALKoyX7I4IsIHT/q6K6uuqfAWoIbxrhrubsC0=;
 b=S0BcRjx9wWMloD1nxVRrInKYQdstx4wkYCW9OSkJnlVZfTNtkhVHx/grONpc8ctEzbKYuAJfrylPyppzgmkLsoHOrXsfyblhPJx9gSX7E8diGTWU8OASCFYpBjQCq4uCEmGeruBx/+xP7RkGHcRq5d5ums5XfiqfLhxRdydCIu0mx5D2kCfVEat2vwTWRfZAA/A37OZs9xa66ikvMDwUBhGapSxxbp6Vom5zBLLMBb3xMd7D0U+8SJDUHUJdrTGfoR792ClRkauUZKZv6b9VuFPxdq60+LAPN1GWoYocxloSIyCDSoOFMG2eYSv/+usk6exD56Oq7DauTjXUgAGDWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LevxgQALKoyX7I4IsIHT/q6K6uuqfAWoIbxrhrubsC0=;
 b=b9Vn83CleT75Qy2h5tIcfuLI9w8Pm10orWuIwzR017NEPt+Z7bjlwuwyuNY9+zwQV7UMqnwWzzs3wXquGGd0iDG1bhqIXl7QxjiT+hlSILqXSF17PO7eU0FoeXydiQftm6CaQRJMAAuPb3mkOoViUMJDkM5N+EgGB1tIkmgZDNQ=
From: Peng Fan <peng.fan@nxp.com>
To: "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>, Viresh Kumar
	<viresh.kumar@linaro.org>, Julien Grall <julien@xen.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Question: xen + vhost user
Thread-Topic: Question: xen + vhost user
Thread-Index: AdrK7E1vVcASzE7XRqm0wkYJXBBDZg==
Date: Sun, 30 Jun 2024 12:58:48 +0000
Message-ID:
 <AM6PR04MB59412237BA10A23EB79D5C0E88D22@AM6PR04MB5941.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|DBAPR04MB7256:EE_
x-ms-office365-filtering-correlation-id: fd5c4f59-6209-4a24-9739-08dc99046260
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5gqq+dv/8L3N8athVe6Qg3atZpo6g5toG6WyQX7eUrZP15sg5qJyK9I1zWuQ?=
 =?us-ascii?Q?4k55qv1u8JfMvazbwcqx/t/LE1WkhN55KrQV017uutQHqAzsEsr8ZThJrw/z?=
 =?us-ascii?Q?W09KXuNsVfY3frH/I9joLXVCI4Mwh1JwxxsnZJlorxRI5qAdGnScLosmVjfo?=
 =?us-ascii?Q?+kL41Qe9XxdTvItuicXaJRboIBGrUCSdQus4dGkGl1+C1V1iN5Heq704RQNX?=
 =?us-ascii?Q?v2uskCrAl5IxUf3y3G+/onGzzaGACbFjmVkiNU7r6qwv9xxWbVWXx5E96+U7?=
 =?us-ascii?Q?qm8a8FiMAgyR7Ret7eGu0MMDcNVEN0K6625VTLFv8GLvfGA357q4qdnJkuLO?=
 =?us-ascii?Q?d30GAry3Gb7PiXdx2WzylhEW4MwCjlxy8I2+GWUMBPE9Y+CDBcYW0NjyT3sK?=
 =?us-ascii?Q?zLFJ3avm7MNMXG2oKyxrS1kDU86zdFos8CrewZs356i1534qkgr7siFDIZId?=
 =?us-ascii?Q?9zyUep/E+1gPsZHUFbjKANZTQ2D4yGfTyHVSSWfDD+RFR84cLaLmf4criKtO?=
 =?us-ascii?Q?X1MiCYUVRsQk73MFfgCUkuxVGdwuienY0WUgWNSHOw7nwByPFyjjWJUT5i3Z?=
 =?us-ascii?Q?NqBms8pcjpWgsNf4KroNbTiI6gOuG9ZuXazwoG0yiFhEwjBpvmjOcHwr7hmg?=
 =?us-ascii?Q?14KaYkjLSccUfFJ7XXooEfzPjjzrdmh5iVrMQ3OFQIABW54b83S/2lH/PPWH?=
 =?us-ascii?Q?Vm9czfaR2Fi/9HCeAKTXGxkm55a5VfKmVe3QkYh5krgp2H4rfSPRhU/UIrKh?=
 =?us-ascii?Q?vNJ1Gy0yfVhMlKk0nArCvDhjnjT00yRNUAcqxAWNkYxEP7BQO1GCfpU0UP1+?=
 =?us-ascii?Q?AEZOgo72pVYiKxrGNICW2B9fMfkLj2ejR+iHju4h6ihq6jlM8QRaBvIXPxkA?=
 =?us-ascii?Q?YjTcPoIATIRyoOebLbAYDN3jqRYonFLzwhBEeRTF6OJOgl4WBAb9cJIabaZc?=
 =?us-ascii?Q?hVKNDfpZooqQhShKg/D//xzHv8UchlbsZgF/98TzDFUWDapyIbcooV0enaYy?=
 =?us-ascii?Q?j57rRDfchEDgVwGuT54AQNayXcWPe0HVYmSQaQTr7GIv/UFyVVHP1zGRLoue?=
 =?us-ascii?Q?LfprA0Nf8BQ4xQVud4uRv1YJukwgE6mfqYssBexwa6rULxIDzrgajt7J4sh8?=
 =?us-ascii?Q?q0zdbC07iRQ7QgMPK9QQ1LgDFwRDm+KuqznPCbpK0BptKAN2M+TVwdqQxj4A?=
 =?us-ascii?Q?5xkXRNMQLyNtsAzfdYey2sNFLtTaQj2HptQ58rb3FXbVpfQ8n9aYhtG8qtb0?=
 =?us-ascii?Q?6UFDGWf6j3PZznqK94PcGtCiL1KNtz50X5KPSdkcSY8rGcFD+wksZBOpMe06?=
 =?us-ascii?Q?OJ7CprzSweAiDb7vpjqXKp0yf2HqHSmoqRj+YuIzFdm8fteHmKQcOTgne5Uw?=
 =?us-ascii?Q?7yuiqTjyrh/S3vCUkU7NbxBK0QtJZ4phum4jfXyJJIp2E1bGyg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WrVTpbZMB56FpDrpWEcJF8ehcpfdkXiIM22qpqT1sH38qIBTgQEfEKmRUvDQ?=
 =?us-ascii?Q?5KYV5ITGAqo0Gv0dCdNkYLhiYkOyQpMLpTcI14uFv97IHQ2ZBr/PzNYgeesX?=
 =?us-ascii?Q?k1qeq5r5EwCDOzT6CXPKEmEZXiAoKLH+sCgTU7jxTnAgmUTZYu3tGnbXgxuE?=
 =?us-ascii?Q?pUZj9+4pAxSzW3oA/3XyD1PUn5DJE2UBQibVsv3WJ+mhtiYDmAMLdAtpo9H+?=
 =?us-ascii?Q?2LtatjfhUDjVPVFwa/ArI7tEOsWYbodVx+cd1NTs0yRgHh6ORNXqyLopxs7F?=
 =?us-ascii?Q?t28D13LFY6iuw/+GU7Ggy1IbJgnex6Ggmuya+Hjx2QUxrGoF4xcFRKe96P8Z?=
 =?us-ascii?Q?goErq07Y0KD/HG9ftQEAsHVGG6f/RZZwNqMNMhDaH8j+zMLt5nDzUzBBucWY?=
 =?us-ascii?Q?4seMw6DeFSY6GNdR1AsugYuOaOBSmSfkofnfC6Ddi1ht7gYzElVImzHhp1XB?=
 =?us-ascii?Q?F2Nihz088Pldn1mZMcOIHF5t2KXn3YkEH9JPLBMsmn3heNEX44TYmAl05mC+?=
 =?us-ascii?Q?HP5EGBFzZ0/wo4/vVvu7cFrY6KnOB8MGNaCsXmVvziWJLYT1pLhYhJtpzBP0?=
 =?us-ascii?Q?943oNHj7wESFgeHFfmKkxFmQmF0dAeGx2IgMFFmvCaFXAtShP5ntcIO/0A/y?=
 =?us-ascii?Q?dppPRlwm7UiihhgPS1qDrRcTV6G2r+HlUorEY8b1+Dc4jMy5wqdItpQd9lBz?=
 =?us-ascii?Q?KZxvQwjxb2sqd7qnFx+JH44qC/yf1/KTWO6liKDSMi8H7Hg/iFB9NzkSzCxy?=
 =?us-ascii?Q?INtqZl7TkwP4Gmuv2DSeO3d1/W8OCt3dxQIFv66i9YURlarDSqfgNqw9J23o?=
 =?us-ascii?Q?WfaF7isVIenseMeYBaiBZla9J9IUMtGUUlWtG2sa9t9Tlt1tl+bO3cjULwH9?=
 =?us-ascii?Q?Z+R/FMBq86DUdH3fJ227Gu6hywEdmYr014nBT/zHFfLUaZ4AD8iyBY3hxjnC?=
 =?us-ascii?Q?2ZF/KMh6m3SkcyMZ4AYOUL5Wa/R4ZLzpDFvpqOu5Yf7ObMwF1mN6SzodNOfn?=
 =?us-ascii?Q?5Imoi95L0rtrvzRUq9eZZwlBN0DBo3kgZ+tzphlJx/W4xlN42Cx9EnJQKUta?=
 =?us-ascii?Q?CV1NQ8vngbo/M3tqzD+fFfdWJ6dcAVxHmtmrgl6QUeEPSRaS6aenyAkTo2+f?=
 =?us-ascii?Q?5OUA+wQ/XKo6WrKg6LEp8iPPpZQqNx4ddLiZ+VjFN0uIvT9ELMNB+cdvf7XI?=
 =?us-ascii?Q?k6FblJO/riiu4M6c0BLxK6GxRLyXbAkfvOwl5sd3HVNwc15KP3dPX/lFn8rh?=
 =?us-ascii?Q?TV9ToR46l1YO37xZXAGzO/beM1sUUepijk3CUVBvVPSpBnQo3XKyHE1ADwqc?=
 =?us-ascii?Q?0b91FHo7OC8fFsZFIuoa99PVG7sG9wNuMWvgkFLgM/wulI41J6osX0acT3tR?=
 =?us-ascii?Q?9g5BVJOf+6QqkTQnWkMvoOBPKAfm7uCOd+NizzUyzuK0lJJXokz4qFM7Y8hY?=
 =?us-ascii?Q?4nAfq1xrTocdGMsM93JlxjdUagFXZeZfFYJrEBSFA6RcA1L1AELhBGAc+Vts?=
 =?us-ascii?Q?y1/cwR00OpR6So/tvgtrsAvCYWdW+0jdaR9LSaUExDMwe29PXbe9zRGao/b8?=
 =?us-ascii?Q?23PauuqOmG+h2Gf5xLg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5c4f59-6209-4a24-9739-08dc99046260
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2024 12:58:48.8735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /icqyzxgA3aDq9mrRSRsfrQStKH6IjyLpQpy5tEht+TTd/c6BOTm6NQoPy4FKijcOP5zyqXN2CO4YVvr02LZFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7256

Hi All,

I am trying to enable vhost user input with xen hypervisor on i.MX95, using=
 qemu
vhost-user-input. But meet " Invalid vring_addr message ". My xen domu cfg:

'-chardev', 'socket,path=3D/tmp/input.sock,id=3Dmouse0',
'-device', 'vhost-user-input-pci,chardev=3Dmouse0',

Anyone knows what missing?

Partial error log:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_VRING_ADDR (9)
Flags:   0x1
Size:    40
vhost_vring_addr:
    index:  0
    flags:  0
    desc_user_addr:   0x0000ffff889b0000
    used_user_addr:   0x0000ffff889b04c0
    avail_user_addr:  0x0000ffff889b0400
    log_guest_addr:   0x00000000444714c0
Setting virtq addresses:
    vring_desc  at (nil)
    vring_used  at (nil)
    vring_avail at (nil)

** (vhost-user-input:1816): CRITICAL **: 07:20:46.077: Invalid vring_addr m=
essage

Thanks,
Peng.

The full vhost user debug log:
./vhost-user-input --socket-path=3D/tmp/input.sock --evdev-path=3D/d
-path=3D/dev/input/event1 ./vhost-user-input --socket-path=3D/tmp/input.soc=
k --evdev-
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_FEATURES (1)
Flags:   0x1
Size:    0
Sending back to guest u64: 0x0000000175000000
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_PROTOCOL_FEATURES (15)
Flags:   0x1
Size:    0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_PROTOCOL_FEATURES (16)
Flags:   0x1
Size:    8
u64: 0x0000000000008e2b
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_QUEUE_NUM (17)
Flags:   0x1
Size:    0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_MAX_MEM_SLOTS (36)
Flags:   0x1
Size:    0
u64: 0x0000000000000020
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_BACKEND_REQ_FD (21)
Flags:   0x9
Size:    0
Fds: 6
Got backend_fd: 6
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_OWNER (3)
Flags:   0x1
Size:    0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_FEATURES (1)
Flags:   0x1
Size:    0
Sending back to guest u64: 0x0000000175000000
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_VRING_CALL (13)
Flags:   0x1
Size:    8
Fds: 7
u64: 0x0000000000000000
Got call_fd: 7 for vq: 0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_VRING_ERR (14)
Flags:   0x1
Size:    8
Fds: 8
u64: 0x0000000000000000
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_VRING_CALL (13)
Flags:   0x1
Size:    8
Fds: 9
u64: 0x0000000000000001
Got call_fd: 9 for vq: 1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_VRING_ERR (14)
Flags:   0x1
Size:    8
Fds: 10
u64: 0x0000000000000001
(XEN) d2v0 Unhandled SMC/HVC: 0x84000050
(XEN) d2v0 Unhandled SMC/HVC: 0x8600ff01
(XEN) d2v0: vGICD: RAZ on reserved register offset 0x00000c
(XEN) d2v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
(XEN) d2v0: vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_CONFIG (25)
Flags:   0x9
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_GET_CONFIG (24)
Flags:   0x1
Size:    148
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_FEATURES (2)
Flags:   0x1
Size:    8
u64: 0x0000010170000000
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_VRING_NUM (8)
Flags:   0x1
Size:    8
State.index: 0
State.num:   64
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_VRING_BASE (10)
Flags:   0x1
Size:    8
State.index: 0
State.num:   0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Vhost user message =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Request: VHOST_USER_SET_VRING_ADDR (9)
Flags:   0x1
Size:    40
vhost_vring_addr:
    index:  0
    flags:  0
    desc_user_addr:   0x0000ffff889b0000
    used_user_addr:   0x0000ffff889b04c0
    avail_user_addr:  0x0000ffff889b0400
    log_guest_addr:   0x00000000444714c0
Setting virtq addresses:
    vring_desc  at (nil)
    vring_used  at (nil)
    vring_avail at (nil)

** (vhost-user-input:1816): CRITICAL **: 07:20:46.077: Invalid vring_addr m=
essage

root@imx95evk:~#

