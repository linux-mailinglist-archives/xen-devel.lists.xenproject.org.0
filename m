Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9401F8C32
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 04:07:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkeWz-0004BH-Ot; Mon, 15 Jun 2020 02:07:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uIX7=74=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1jkeWx-0004BC-U7
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 02:07:23 +0000
X-Inumbo-ID: f321261e-aeac-11ea-b7bb-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f321261e-aeac-11ea-b7bb-bc764e2007e4;
 Mon, 15 Jun 2020 02:07:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eE2fSnfU0rqQevo9IDw/E3S8uo9e9dW/Tag+QaJALvNE9CGewuzLarajSGjvaCuU21WHnF33cioOJf2Uk0PuQ0MxfmX8c5u5WkwEP+JPZ2b8e9gKvxaKsy2CSZ+milv+zWV/9qA8tzHMqIOYRtjk+pECvBfsa+PIVa3X5NNfoWCIzMzzARZDXIqnmVYB4EtATkSmV3wFMbWY7EBYHaWvot4g98FncxcZNW5STw8BAwDJJaag1eSXNRXCBAoA+FAeUoayfILYQsN5sY8l/IhZaSglBb4dngCWJXUtZe7fPJ/QF+pxdjLA6oFWOjMSzNGQ9m26n42SPCjc2q9JbndSMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQQp9vYsqvwtbedk7b/0d9QHMLwJKtyURWXUHGrQSEI=;
 b=awXD6sW4kazUHdZZM39sDIxW0CFBfK6v+JPb5QKbPenrJmD7rLRXXOavNz7PC+x+Hzr9UIk4LrLYOGxR6QEcwLtt0Gxz1SS31N1TJQBmCcHSj9o/vM8fmA5MYKIpX9hiA4ZvPcKdhGPM9vQrxIsIhB9i1HzXeaTqeI46GT15tgcbbVPGUlTSWZ3xntw4DLLXckZYio0sybBp1iCh4f2g1agcIUr+kSb2nqs2rTAkON4IKHweRRJdhIDzHXN7O7Ga2ytqhitvporQ2j/vsgmz3WGsLKf+d74Q7ZTJzpPbDzboVop3AhoRwQPQj7MksR/AYVGwk/7XNto9BeoF09tBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQQp9vYsqvwtbedk7b/0d9QHMLwJKtyURWXUHGrQSEI=;
 b=G+poceodYg0pUlck3XnioHtUkojr2/8xhtIVdxA3grftSbsq4GOlzYaGqAVNBs0dQP6SHhgJuor/yI6qkW9VW/n6rnYClZX4pxzqHGALvTxjevLHgAK0VX+hN7Wy00m9JyzLw4nPjH4zcHrB2esHJQZZQqhmDYOrlHj8zSZ+iv8=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2871.eurprd04.prod.outlook.com (2603:10a6:4:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.25; Mon, 15 Jun
 2020 02:07:21 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3088.028; Mon, 15 Jun 2020
 02:07:21 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Xen-devel <xen-devel@lists.xenproject.org>, Jens Wiklander
 <jens.wiklander@linaro.org>, Oleksandr Andrushchenko
 <Oleksandr_Andrushchenko@epam.com>, "tee-dev@lists.linaro.org"
 <tee-dev@lists.linaro.org>, Stefano Babic <sbabic@denx.de>, Julien Grall
 <julien@xen.org>
Subject: TEE with XEN
Thread-Topic: TEE with XEN
Thread-Index: AdZCuN8SyGfGPx9hRva/eeajiUtqpQ==
Date: Mon, 15 Jun 2020 02:07:21 +0000
Message-ID: <DB6PR0402MB276091802866E8CB878A8130889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b4403eaa-4e49-4289-4228-08d810d0d696
x-ms-traffictypediagnostic: DB6PR0402MB2871:
x-microsoft-antispam-prvs: <DB6PR0402MB2871C6997194E11B1EB2CF0F889C0@DB6PR0402MB2871.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ioH7c2cbuWIse7s5vXjNI0emsjpFsqiDKdDdc3jC0k3fydMCZtXN32j7XjEsn+WoIxYYMk8lBuXPX3C8uF/e5vbe2TqVPV7aTmJC9bHz1e/j4EcJF64ydb/AthmYB2//atil1P+vnG33JdYllJ92rOx9zvoAi3ATh+qdQtWjRRKr/0arQeglK08qubMWFEfu7tugiBx9H2dsjf3lLM9zx8aHBdAR3wlum6oXsLrTKpROrGxMwDpbUgpUedSPM/gK124bVZjEHTaf8UYA7cRq5v1DNijneUu6O7GcW0o5PmKqbWbpJ6rvtfzExrKqYCliDyExKjlrIjllIHFbOqJRyA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(6506007)(44832011)(186003)(8936002)(71200400001)(4744005)(2906002)(478600001)(26005)(9686003)(3480700007)(55016002)(7116003)(66946007)(64756008)(66556008)(66476007)(66446008)(316002)(33656002)(110136005)(5660300002)(52536014)(8676002)(7696005)(76116006)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 2yIjDeg7vsinaFVsH7c3B0J2NH6gRAQpG77xrOBULJC993xl4mc6uM+ISNBvNrrde8/UF2ESuE8gWlqsSjNDJ93tj5OsMDNOMHa5ljdWff0BG8ATcYkXE2ilvyletmqQ8EaXK8Ef44vWBg9nQzNj9r2apQnqGL0+7WxUHdeKd6ZQJ1rcObHaSmOZcyLaNyg/Km0W/ONjjl5TSkZjLiat1r9Ox6we0p0yDIQuKxTPZqnIFGFGB3K1qQP7RflatH1TJhU6ZdLsUkw7twJSBvdnJtBecwauC44+sfZkVybCOsRJpYrZw1qjdICcu5a4Vky5FI9kwQV4RMSBmiNvqztx/EZMLuLnXhUoVpwEkla1jluEptV2yuIrBuCIN1+XPsIpczNtjOzBjeCcQ7c8pezQhHZirdZ53uP6ZxXHcchEa9jiaGC9cLvObY7CaWFNsjnlDVmQm+jdmGAPyfcxulMxpuGFoj0YYsIDl8j6gdkzUN0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4403eaa-4e49-4289-4228-08d810d0d696
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 02:07:21.0919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TcPJUo387310E6AfTAwgScEj48ssmBLJxmhdc9Tjy5VFF3Q7t0l94fB6zlpFnbRyhyB/IA2VgpSlweCXOi3tiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2871
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi All,

While enabling trusty os with xen, I took same approach as OP-TEE,=20
with OP-TEE running in secure world. But I am also thinking this might
introduce potential issue is that secure world OS communicate with DomU.
If there are some misbehavior in secure world OS, it might let XEN
hypervisor not work proper.

In my setup, trusty os sometimes panic in secure world, xen will not able
to control the panic core anymore.

So I am thinking whether we need to emulating secure world in a XEN VM
which is the VM running DomU. Just like what ACRN did to run trusty
os.

Any comments?

Thanks,
Peng.

