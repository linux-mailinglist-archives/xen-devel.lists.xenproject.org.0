Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 040C8822816
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 06:39:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660881.1030552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKtxG-00088w-7c; Wed, 03 Jan 2024 05:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660881.1030552; Wed, 03 Jan 2024 05:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKtxG-00087F-4Y; Wed, 03 Jan 2024 05:38:14 +0000
Received: by outflank-mailman (input) for mailman id 660881;
 Wed, 03 Jan 2024 05:38:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OHFH=IN=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rKtxE-000879-MB
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2024 05:38:12 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe16::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 475fba3c-a9fa-11ee-98ef-6d05b1d4d9a1;
 Wed, 03 Jan 2024 06:38:10 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB9125.eurprd04.prod.outlook.com (2603:10a6:20b:448::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 05:38:07 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::ff06:bbb2:c068:5fb3]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::ff06:bbb2:c068:5fb3%7]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 05:38:07 +0000
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
X-Inumbo-ID: 475fba3c-a9fa-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heATBl+6ygAu0NFGIqYxgeJi4xiAMof+tnlj3zowroSN1qDlIdASkAf7gbk02Y0PkmvV8lwWenSRS5YpTrHn7ANwoUrgX9FffkMPHVChlF96m6pclKVQJCZ4XOSwg5fLmOaYbo6MGoQh8+dVBRdnDv2iJMnik6s9za5cBEWz7gDl/6+ex0WoQZNobrlS5MHDoAyL1RWvFQHTA/v62W8mB/ul1dWjik7N1ApGGRfe+rNJ0bYTLCfiAxzVXI6SYMeJ3n27fZzELnHJFXXgDWTAANUCKESV3DqPiSpPPTshP6Asbx9VNKMhvPwacEoln7Cgj2mnkmhcf6TuVUjNxsQQIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ETsO5+JX7KzNBcdLnVsyeZy/HIXoTag9YZ4/LrRo+0=;
 b=cKo91lBUrAJzynYEhKjiefnEjGt80ungN6ZoF1CQK+xfsQ1DhOSDZ2m55sgvIzvnushPMsLgWSSzuyKulYJWEIxRqiE4L6u504hSVgdDgQGvJH9KP4EWtw5+749625h03Awyd1jLejiyivoKpcIur/9vnfEitYnZcY574g9MIzTVxHq9jxJzuZmGEdfRWkcdm9ceOQw7NLXwhWyJwNDeiJ+vVTrlZ1XC3eqpa9apvviJj9MAt8aLOV+BYLfAikrIJx32M3R9XsJuBjeKDWTjU4Ty1khU/MXUpuitjIUnGO/gvSLkDYGkE/1lOIa9aSwIP5GsELnhnGupXWLpuO5lDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ETsO5+JX7KzNBcdLnVsyeZy/HIXoTag9YZ4/LrRo+0=;
 b=Pz8mKM7KuC9wQ4v1dLQJE/Q/a1GgWoVBwLuMMEAHeVLMqT8jvDWtyCMy4JYyTMY3E3TgT0JUcU0uzsQXTelv1CXNx5kO2OJpOQfW+wZVzJ2LiMdJLf94CRUHM4SuLY1J15vfhLKmU6g8Kc8Tqas/5qxepLf4KF56IhrRBm2IliM=
From: Peng Fan <peng.fan@nxp.com>
To: "vikram.garhwal@amd.com" <vikram.garhwal@amd.com>,
	"stefano.stabellini@amd.com" <stefano.stabellini@amd.com>, Oleksii Moisieiev
	<oleksii_moisieiev@epam.com>, Viresh Kumar <viresh.kumar@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Xen and Qemu virtio question
Thread-Topic: Xen and Qemu virtio question
Thread-Index: Ado+Bh/9MuDR+84cSOCs1HJKnhYJ1A==
Date: Wed, 3 Jan 2024 05:38:07 +0000
Message-ID:
 <DU0PR04MB9417F7A337D7CAA59B38ED038860A@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AS8PR04MB9125:EE_
x-ms-office365-filtering-correlation-id: 7eae12b5-2b29-4b64-793e-08dc0c1e2a3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SIkkDGz2y7P/QaJ845B567HW0IoBu0XA6lLHrfYjaCDO1NgwSY+zeo/mDvbwOD1mEjhGWWgCuGkN/Mv0iaJJx5H86GpVqieIJpHsmp+1iVUS2hNpXa18kxIZEBJ4bo9cQ8wYgTScXokTsggfAVQ+VgIaCslfSoXZreijm5pI/qp3/wgU8dpvP81CZt2t6kmYWCtmXMoylhNAuAYzHsc59Hnb+uy3uqJ8vrIaE/0us/yRqC37jinumN1IG3xxJE9CgLxpfu4ppyveqE60HS29lPGKbDF3ZP4eKiRj/yb6QuyVyScRdjW4FYeP8iTx9GRaDHK443wFv7XII6ow9SZCR1xxAIi5aNkC0WF0nKf/lOiTezdgT8wfx4emCmjPsshlIhFE4BsA6dK/IgvNYz89d/N1arPLIbQM2ZHyyZmLG3D0Tc/vhVSGNy9X4laDlmD0oaM9xXBR0ZTN072kRz9LR+H2kMCc9cgbfxuAg+BcUZjLd3HFdasXzlv7u1KMaw+gM/4Di9Xv9GcLj0QPIkx49ovJ8MEXu1Lgr9bGeQGo4cCFh1ArfY5EuZ8niit6u+bNBmOJm5rgJmjyXdFG1MwOh993FSbOWPJCqRpDteYg3Y0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(83380400001)(26005)(38100700002)(122000001)(52536014)(8676002)(8936002)(316002)(110136005)(5660300002)(2906002)(4326008)(44832011)(71200400001)(478600001)(9686003)(6506007)(7696005)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(38070700009)(86362001)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bmlGRtdi/MeCWKpAPXhSJguGx221EynbGDLnc0vsW0iGnKBsEu2yjx7Swwiq?=
 =?us-ascii?Q?r7QXfn2XPqt9Ca0kNSRmT0X9Na0g8ZECr9lsK2YHnnMQwYn37ml0VBlYpOhd?=
 =?us-ascii?Q?TtNzfZGq6BhrvHIVtVDFO/l4s4J7PVuY3TPjZAR/ygj1vu3nrwddFesAlIxr?=
 =?us-ascii?Q?T+9xmyEoBMsxZWHB1LDwHiLz54v8gQURTSnogn4a+UBn+OsVWGQ7ePMK5FWO?=
 =?us-ascii?Q?VmivWOz1qmIyfuUKe1S8hXXWh6B0nI+i5PpXglV21GRlkRw83T2vAhyM8OwT?=
 =?us-ascii?Q?v9hximSyH6TfNtqcUJzv30u5p3vFn63j0r+nQYqYKc5BgwaXRETS3gqoqZ6m?=
 =?us-ascii?Q?yPQm0Z4daH0TH9xDbqDDhQM/vWZt84VZFiatDeRDnLt5ZzVGnfbNPy2N3TwN?=
 =?us-ascii?Q?OJxQsX488TUwQMFa8M2tXQhvGib8K/amc8De59wWNj/yTAaww5cQksmC4rDC?=
 =?us-ascii?Q?2freKzgltKzaoAsaXSXq9X8qXAfowNTYNW7OJRsF0rKhKeoOnhLrfiKZ8C5p?=
 =?us-ascii?Q?Zi3NTrFr9mBplHOulkcfBfUsztye2geO+86iYUlKpqAsoi1MP1PHJoNPLYNO?=
 =?us-ascii?Q?V6zCd9slDg8VXyfOFVf99uZdzhdZiR3T3/gro5/WOvYZQdscHRWxNUxEk7Gk?=
 =?us-ascii?Q?C4feaq/9nCqXRIwJ8GfMd4fq0CFCIMdYUG7UpyJUaLwy+UN7p0iE1AuyICIw?=
 =?us-ascii?Q?x9TUUKqfcwTWs2pBJLoYYppGqgApgiSfiCxAPnvb9ctWVRO0+N8D/v152pjv?=
 =?us-ascii?Q?kUDOxnFHq6KN+8et5Rj++f6hNd6D2hrC95ZuvUdhQPpqOgeNOEsOuK6gdQIS?=
 =?us-ascii?Q?S/1DDBfZBRGrD/eDxj154Pc8upqJ8evYctNUvOdfiCX0sirDtDGiqRoGL8Op?=
 =?us-ascii?Q?3namDnAjAimgLhAAJHSbsvMV+YNHPyR2mVUWHeuyxKsPuqcwLa1YaLKhirJh?=
 =?us-ascii?Q?qpwgq90aiiEPd52ZCYQa3lAriHbq16eiyBQ1EwY8txvppF7VF6rmwk1QC0HL?=
 =?us-ascii?Q?/E9eB9CNzCWotwhtxT5Oj+rYnHg7DG3Pdr4LLgVXeDvI46XDialTAfAM1vVz?=
 =?us-ascii?Q?iceAcQLkVaMtE+d2m641fAAAs48jOlE4GESdTqgE8afJLpQushftc7pRmUC5?=
 =?us-ascii?Q?D4KRIGTZdrA0yieg/o/aps5tm/VSOQfCJSgcI519iGLUpxixTWWEoGZhzsJx?=
 =?us-ascii?Q?XcCxe73SCWxaMhbINT1RlBwihxWdAmGCAFH749ekQIqpw5s42U1szmOTwIZ7?=
 =?us-ascii?Q?DGbNGNBQgb8NvM6n2+XnbBRA62GmhZmwYhd4JiKLw7qNxYvFaXOjcRbWYknC?=
 =?us-ascii?Q?9laJKU8GXdi31EToPAuyWj3NtPbfPojZtfentra4L3x2UUtRW80pbIvgROVr?=
 =?us-ascii?Q?hldZmKFK0geeA6MXfXit/VHlsVEH7wnj6cIxC2/6FqJm+1a7+TQUmPl4oIIa?=
 =?us-ascii?Q?utTO9aOMBnGR2fV9PBbFVrdH5j/uVhvX275Ay4Rzm2qQhrBDKD/V+E97Ysf0?=
 =?us-ascii?Q?T61lD3YHZNJ3Xz4sukxl9Mze3MMDT93hrDvaM1sDQaB0Qy/RJvzsGPQPu2kk?=
 =?us-ascii?Q?6dfiiW96ApaA+95XAvI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eae12b5-2b29-4b64-793e-08dc0c1e2a3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2024 05:38:07.6580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6H3oYhtDg9DXnxP3deJaaGFJKSZVO4ybCDTElAwDatBzKmGaRTxSTR6RIS7/2vrM/BBl6njFTTom/7HPLZU5lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9125

Hi Vikram, Oleksii

I follow the slide virtio for Xen on ARM[1], but I met some issues, and
stuck for about two days.

I use upstream lastest qemu repo master branch, not qemu-xen.git
repo.

My start command as below[2], but seems I need first `xl create domu.cfg`,
otherwise it will fail, because xen hypervisor
dm_op->rcu_lock_remote_domain_by_id will return failure if domu
not created.  My domu cfg is simple:
kernel =3D "/run/media/boot-mmcblk1p1/Image"
disk =3D [ '/etc/xen/disk_1.img,,xvda,specification=3Dvirtio' ]
cmdline =3D "console=3Dhvc0 root=3D/dev/xvda rw"
name =3D "DomU"
memory =3D 512
serial =3D "pty"

I drop qdisk in the disk entry, because xen tool report qdisk and virtio
not compatible.

And the arg xen_domid should be same as domu domain id? Is
there any dynamic way to set xen_domid, start qemu when start
domu?

Does the domu dts still needed to include the virtio,mmio node?

however xl create domu.cfg relies virtio disk ready, which needs qemu
start first. This confuses me. How do you address this
or I do something wrong?

Then after xl create,  I quickly start qemu, but met:
failed to create ioreq server, then I see there is mismatch.
qemu use HVM_IOREQSRV_BUFIOREQ_ATOMIC to create ioreq server,
but xen ioreq_server_create will return failure:
     if ( !IS_ENABLED(CONFIG_X86) && bufioreq_handling )                   =
                         =20
               return -EINVAL;

So I change HVM_IOREQSRV_BUFIOREQ_OFF in qemu, but met:
qemu-system-aarch64: failed to map ioreq server resources: error 2
handle=3D0xaaaad26c7f30
qemu-system-aarch64: xen hardware virtual machine initialisation failed

Do you have out of box repo that works well? Including Qemu and Xen,
I am trying virtio disk, but will move to test virtio gpu soon.

I am not sure there are some downstream patches in your side to
address and make it work well.

Thanks for your help.

Thanks,
Peng.

[1]https://www.youtube.com/watch?v=3DboRQ8UHc760

[2]qemu-system-aarch64  -xen-domid 1 \
-chardev socket,id=3Dlibxl-cmd,path=3Dqmp-libxl-1,server=3Don,wait=3Doff \
-mon chardev=3Dlibxl-cmd,mode=3Dcontrol \
-chardev socket,id=3Dlibxenstat-cmd,path=3Dqmp-libxenstat-1,server=3Don,wai=
t=3Doff \
-mon chardev=3Dlibxenstat-cmd,mode=3Dcontrol \
-xen-attach -name guest0 -vnc none -display none -nographic \
-machine xenpvh -m 513 &

