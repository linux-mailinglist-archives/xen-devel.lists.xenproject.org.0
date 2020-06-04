Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE91EEC10
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 22:32:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgwWZ-0002CO-SZ; Thu, 04 Jun 2020 20:31:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dy7L=7R=ainfosec.com=quinnr@srs-us1.protection.inumbo.net>)
 id 1jgwWX-0002CJ-SV
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 20:31:38 +0000
X-Inumbo-ID: 620b1a16-a6a2-11ea-8993-bc764e2007e4
Received: from USG02-CY1-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:d::625])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 620b1a16-a6a2-11ea-8993-bc764e2007e4;
 Thu, 04 Jun 2020 20:31:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=SE8SKJZSt6xQNEmGLgiV9GF8P6Okk4uzWhZUcN0q7YBtwFPiJ15kiVZZ34J9ftidUYYPIw5yO+g3PkJuTN1Evb8v06EyHATSh0mRzvdPJUwbfbinB5dR5zhFS5KtLxvmr/Hj4qkfKDkcYxnVShZjvZYPrPaYXUiGqmbF7F11mtHZ+GoFIXfH4LkHLyVpQFolhwehjyUyS6CvlZjXX3iTcOFcT2c9hqQ9rLGLH+O+35pGlLd25Wt2Xb8z77K7zFzXvL6SaY2e+M2IvvtsAfj2kJyQWPGprMIGnvLsq23CA/gvqc/fWdALUkYe3wl0Is5BYUNF2IRNpH8/+iX8kpEVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59mar/+RoylVT7yyoQC/RF9nvtJV+CcBIhHU3qYaAlk=;
 b=f4NHssBaYPqqOjdGWrtEByGWKa4u+1NmB/PeDvdS9z9AQfhAxXnvwzqaKERoETfRxw2lhGBMVbiuSuBQ1SZ7+uZeaLNNm2U/ys8VwFaEaBOJ7s/LaVLMf3zlhApeg/QckYd4lorXb9H3pA0ziDzaRxXKQHPDdv58/GlFcluDyeIJ7Jx/t+kJVQQnv7yhS1XLb9JRq/1Njl6nO9XbFLeurTTxU0oTSTxISvbaQkjeabJFTeCFWHZBaVDKE0aT5XMsfNwLO4JT3FdnKQbw0KgcWat1A7XxRPv6Vb3JLPDSzwBxaXvqtKe+mU0Y3q1tuUmwn4GEN346KJRMbaw9Elwm5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ainfosec.com; dmarc=pass action=none header.from=ainfosec.com;
 dkim=pass header.d=ainfosec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ainfosec.onmicrosoft.com; s=selector1-ainfosec-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59mar/+RoylVT7yyoQC/RF9nvtJV+CcBIhHU3qYaAlk=;
 b=ToRj2T5rBoREdV1c19KfM49WHjkjOp4kt7RjuB/S52+hEGCtM6ixecBZagDHiTiVjMenbej8We9szpL1EtMq3mcPYZQtnAE5ac2lxmy2OY9/D48T6t+W6lG3ZCLtvNIK5mr1FwbH6TVMoCjUD4pJXeg+tmHYWLU5igzJf5UbUdQ=
Received: from SN5P110MB0575.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:41c::18)
 by SN5P110MB0430.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:41a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.32; Thu, 4 Jun
 2020 20:31:32 +0000
Received: from SN5P110MB0575.NAMP110.PROD.OUTLOOK.COM
 ([fe80::fc21:c1b1:b54f:8bc4]) by SN5P110MB0575.NAMP110.PROD.OUTLOOK.COM
 ([fe80::fc21:c1b1:b54f:8bc4%10]) with mapi id 15.20.3021.036; Thu, 4 Jun 2020
 20:31:32 +0000
From: Rian Quinn <quinnr@ainfosec.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Bareflank Hypervisor Community Call on 6/12/2020 at 3pm UTC
Thread-Topic: Bareflank Hypervisor Community Call on 6/12/2020 at 3pm UTC
Thread-Index: AQHWOq5p5w+0IvuZ4k2F8eRFCHspnQ==
Date: Thu, 4 Jun 2020 20:31:32 +0000
Message-ID: <SN5P110MB0575AC553EC055C1D947D688B0890@SN5P110MB0575.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=ainfosec.com;
x-originating-ip: [2601:283:4600:d83:5d70:a85c:ba25:790d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa32afe3-e9cb-4c16-9016-08d808c644f5
x-ms-traffictypediagnostic: SN5P110MB0430:
x-microsoft-antispam-prvs: <SN5P110MB043001D27A55F75478A838C7B0890@SN5P110MB0430.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN5P110MB0575.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(86362001)(8936002)(4744005)(5660300002)(83380400001)(52536014)(8676002)(9686003)(498600001)(33656002)(55016002)(66476007)(64756008)(186003)(966005)(71200400001)(2906002)(7696005)(6506007)(66556008)(6916009)(66946007)(66446008)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ainfosec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa32afe3-e9cb-4c16-9016-08d808c644f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 20:31:32.4036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 82614573-95ee-4948-be35-3c0a8fc6ff9c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN5P110MB0430
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

During the Xen Community Call today, I was asked to forward information abo=
ut the Bareflank Community Call taking place next week.=A0=0A=
=0A=
The Zoom information for this call will be posted to this issue prior to th=
e meeting. Also, if you have something specific you would like to add to th=
e agenda, please post it to this ticket as well.=A0=0A=
https://github.com/Bareflank/hypervisor/issues/915=0A=
=0A=
Thanks,=0A=
Rian Quinn=0A=
=0A=

