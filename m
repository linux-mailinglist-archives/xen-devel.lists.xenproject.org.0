Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8BA234621
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:51:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UUo-0001DO-Pr; Fri, 31 Jul 2020 12:50:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy6+=BK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k1UUn-0001DJ-LE
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:50:45 +0000
X-Inumbo-ID: 724c2fa8-d32c-11ea-abad-12813bfff9fa
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 724c2fa8-d32c-11ea-abad-12813bfff9fa;
 Fri, 31 Jul 2020 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9MF/oavr0y5/X8dO6kF96zbmF0lsxqm7Y8/nZ2i0X8=;
 b=kTPrVbCBpA78hU6BaBDFf5zoZ3UVzEIGirpo092gDQSFepiJlRylIjgpOl+Zl+sl8tBNR587Lj5BxdKODX0MRvC796njVYCK/Um9Lmqq8NFgJVxV2JPADFSc/mTvMQAANwKoTNYWrEGAxwfQG50+9kmcXXXxBuYwvBNt1xs6Ms0=
Received: from AM6PR10CA0049.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::26)
 by DB7PR08MB3436.eurprd08.prod.outlook.com (2603:10a6:10:44::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26; Fri, 31 Jul
 2020 12:50:42 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::69) by AM6PR10CA0049.outlook.office365.com
 (2603:10a6:209:80::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Fri, 31 Jul 2020 12:50:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 12:50:41 +0000
Received: ("Tessian outbound 1c27ecaec3d6:v62");
 Fri, 31 Jul 2020 12:50:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a3a6ed7a05af89a
X-CR-MTA-TID: 64aa7808
Received: from 7b243da7026f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B286AB7A-7B52-4A9F-B5CE-977E2A6DD0BB.1; 
 Fri, 31 Jul 2020 12:50:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7b243da7026f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 Jul 2020 12:50:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImZboK/CfedxKZgBDzLijCuH6rPwmYg1/gbjOV6TKUjqxpsZ1U69U5BP8U7MT7rKPZIzZTMQOJKPa6eP8BWMiyEm4sHbRLnuFxQW2TLUL6/mhRKPs7rBdiI3KjF3sgPRE6qBhnc0CrgXgjHfI/Uzbf6Vq5bB/Woi9Bw4tIhWhHD6EC16JV32QEWCUkmJvOgQodrNhRG+jC3GffQuqBcyw9YnAYU12lXquMfFyFiNpgZJUxRTEyg6fB29GS6DFP6zjBufxxzaiJ2JjauCxuunjCTxEphA1cMdapJL4iM9fvkWPYb0px3D1gJMIJ64gz0gqrOeL/rgfpCHNk4lMmLpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9MF/oavr0y5/X8dO6kF96zbmF0lsxqm7Y8/nZ2i0X8=;
 b=cPXZcoam9aSWw/JOFi3ZqThr+aDwllKeroTbJ761xFSM/tZ+VsqK43c7UxH3+j16cTPRaV1AHrGQiWACpAxrlTxg25Ha0EL5CCdJSCidUiACAazWOAXy8iiTx5oba+0evTANMbyEqlAcbY6VZ5XUupG1bI2OIeF9urIeRfnUs1CiDxyikWukWAWFQlUVgZmOf2FIeJJzd0LivFaEFtZ3lV891J+fP6PDBmggAo8XujxA69HLoH65ahWHGaxy2Fw36t98bkj0LRV3EVzAXL8x0VsizITJMikE5BLOKeuqH3F3oQcspB/Mcp+xOnsiEUqsYhaJroQaeUnBdcA4WDR0bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9MF/oavr0y5/X8dO6kF96zbmF0lsxqm7Y8/nZ2i0X8=;
 b=kTPrVbCBpA78hU6BaBDFf5zoZ3UVzEIGirpo092gDQSFepiJlRylIjgpOl+Zl+sl8tBNR587Lj5BxdKODX0MRvC796njVYCK/Um9Lmqq8NFgJVxV2JPADFSc/mTvMQAANwKoTNYWrEGAxwfQG50+9kmcXXXxBuYwvBNt1xs6Ms0=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3850.eurprd08.prod.outlook.com (2603:10a6:10:7b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Fri, 31 Jul
 2020 12:50:34 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 12:50:34 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: cmpxchg: Add missing memory barriers in
 __cmpxchg_mb_timeout()
Thread-Topic: [PATCH] xen/arm: cmpxchg: Add missing memory barriers in
 __cmpxchg_mb_timeout()
Thread-Index: AQHWZpQy56S+RNuVHkeeRq+c5Nj1s6khpTQA
Date: Fri, 31 Jul 2020 12:50:34 +0000
Message-ID: <0A749DCC-C7A6-4E4F-BE90-E06C93CE8E91@arm.com>
References: <20200730170721.23393-1-julien@xen.org>
In-Reply-To: <20200730170721.23393-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.126.203.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 10903d63-a5f4-4ae5-016a-08d835505558
x-ms-traffictypediagnostic: DB7PR08MB3850:|DB7PR08MB3436:
X-Microsoft-Antispam-PRVS: <DB7PR08MB3436DAC54F6C6CA694739C749D4E0@DB7PR08MB3436.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: DAzUANyVmquk6vqHJ/bB+7cUI6EhxTBrrbZ+8ZxCOam7uSrhCgNv89/3oBc2TXNOFCX+mMqrVMYGaZkX/vAN4cevEqf14KVOQqaOSZbRQ2gWfnP1VQoSrWdZE4RGep1neph89MalRg/JxVAWNnbfH5NwuiU/+hNoVWw+8RuLtELw+joBq2tiCEVHtsZc47v02wpru2+unH6QLvzuayhtrs95kOyFfSiWLB5aXQyHtMkuXTqlaGK3FKuZ2fzH10fYRx7ZKCrJ3o08fAoY26kBPsGWDGDHONZ2MURadQNoz7eANciFJ37mYQFv2309IJ8uDXDPDRxD9+EWEhUHVMF7a/+c5z61JGfw5dxgDsPlKmOcOGgLY3JPan58dgeWxKXG
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(2906002)(2616005)(33656002)(5660300002)(83380400001)(186003)(6916009)(4326008)(66476007)(66556008)(26005)(66446008)(64756008)(8936002)(71200400001)(76116006)(66946007)(53546011)(6506007)(316002)(6486002)(478600001)(54906003)(86362001)(8676002)(6512007)(91956017)(36756003)(133343001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 7WYOdE1QYgHueJfkGenuWIv/eCTW26CItAlPZu1A6Sdz3Lz0j0JV72aufzS7gIk1zZ7kQmOqV/ntTZxog8J2wJ1KIH24IyKhnIT7W95ySMsuNrduj016iqkYKwN+vUCje5oGvdm2PnxR1MqB/JESPb4+crODslSVcA7Wp9sKdMMFzPoz9h3d0N3/iJVeFt5zetpe3TnTixPFGH9tesG/wR89+TC3rqogRke5SO3Xm8dpvYu+iEMT6CKNWCDGGnoq7NUsFSCtkcI4d31SBcw0bswyb4evvBMMQw8aItNEdVSJtyCD5xUDZ03hbO6ZYv50leUp0jOIzMZVB547kCrvp8oJLoge2DKAbQT7n4gxkAVNbWZCNdMuo8CvMeEbSaM9mckArButDWrXkNxbkK757XFpH95nnx507e33vzeM9WPnE20rmifg7NLJSV6dkRmoL0TgobAthpcbjU2APAtDODDFXyNJdJHCxzx2DdKaVu01/zdyiTkIkofmCTV0TBgdO3fUwD0oOJcRvlPmB+dVvGlotYLl/uwfKHPFUdoDROm3iPWhr4e2k0jMG9UrAU45b7yJxfHIF3capcCZVhzfVQ9K9gD3UKlf8TcAFlTb7t/k80A9KehUDr23MNGsFu9Q9btTeHtYg0BS7hkouxyh+Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <49A0913F5A683248BCC859DF04FBBE17@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3850
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: a74ecf65-c831-4c3b-7b7c-08d835505118
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ltAD5OT5TfsVqdOWvXG6rybuPUjU9vt2d2SPpobEDFKYTilsYI/aepeQfrkPlzJIWfQNKc1IGeUcGxwOB5frkuq0ASEdJCoYeKjXgfAsy3P3k4EI/kJ+Urqvofmp/JpPU88gitYFZOLDruWU/2bo/dSegnPSNOmtCRcuJFcy5wRobhBSAhj+elRgya37ukiwiB0RE38Q2JnniTriYZeK8vmyl88lYJ6dSyzob3Nwky2g3UHrNqtZR1bO01+RBZ4+U4UmNRQb+lTtw6HRPs9ZtH0AtMgt3IcQjm4q+RSQzuD8p8mPJzf3+JGhW8dO0yX0HRJoj+UuQFCcByV3ZltQWymiw7bbCcG47OkdyW2nQPMCV9TVKcf+1Dr0oi4BEEbvxe3ZDrqLPuxe/QQjUSWXIMsHpqSlxZnchwMATlVuMnM=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(46966005)(2616005)(6486002)(336012)(54906003)(6862004)(86362001)(36756003)(6506007)(53546011)(478600001)(5660300002)(8676002)(82740400003)(81166007)(6512007)(83380400001)(36906005)(4326008)(356005)(8936002)(47076004)(70586007)(26005)(186003)(70206006)(2906002)(33656002)(316002)(82310400002)(133343001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 12:50:41.7822 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10903d63-a5f4-4ae5-016a-08d835505558
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3436
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, nd <nd@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 30 Jul 2020, at 19:07, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The function __cmpxchg_mb_timeout() was intended to have the same
> semantics as __cmpxchg_mb(). Unfortunately, the memory barriers were
> not added when first implemented.
>=20
> There is no known issue with the existing callers, but the barriers are
> added given this is the expected semantics in Xen.
>=20
> The issue was introduced by XSA-295.
>=20
> Backport: 4.8+
> Fixes: 86b0bc958373 ("xen/arm: cmpxchg: Provide a new helper that can tim=
eout")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> xen/include/asm-arm/arm32/cmpxchg.h | 8 +++++++-
> xen/include/asm-arm/arm64/cmpxchg.h | 8 +++++++-
> 2 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/include/asm-arm/arm32/cmpxchg.h b/xen/include/asm-arm/ar=
m32/cmpxchg.h
> index 49ca2a0d7ab1..0770f272ee99 100644
> --- a/xen/include/asm-arm/arm32/cmpxchg.h
> +++ b/xen/include/asm-arm/arm32/cmpxchg.h
> @@ -147,7 +147,13 @@ static always_inline bool __cmpxchg_mb_timeout(volat=
ile void *ptr,
> 					       int size,
> 					       unsigned int max_try)
> {
> -	return __int_cmpxchg(ptr, old, new, size, true, max_try);
> +	bool ret;
> +
> +	smp_mb();
> +	ret =3D __int_cmpxchg(ptr, old, new, size, true, max_try);
> +	smp_mb();
> +
> +	return ret;
> }
>=20
> #define cmpxchg(ptr,o,n)						\
> diff --git a/xen/include/asm-arm/arm64/cmpxchg.h b/xen/include/asm-arm/ar=
m64/cmpxchg.h
> index 5bc2e1f78674..fc5c60f0bd74 100644
> --- a/xen/include/asm-arm/arm64/cmpxchg.h
> +++ b/xen/include/asm-arm/arm64/cmpxchg.h
> @@ -160,7 +160,13 @@ static always_inline bool __cmpxchg_mb_timeout(volat=
ile void *ptr,
> 					       int size,
> 					       unsigned int max_try)
> {
> -	return __int_cmpxchg(ptr, old, new, size, true, max_try);
> +	bool ret;
> +
> +	smp_mb();
> +	ret =3D __int_cmpxchg(ptr, old, new, size, true, max_try);
> +	smp_mb();
> +
> +	return ret;
> }
>=20
> #define cmpxchg(ptr, o, n) \
> --=20
> 2.17.1
>=20
>=20


