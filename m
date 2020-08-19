Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53E82497F0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 10:08:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8J8M-0004Q8-Hp; Wed, 19 Aug 2020 08:07:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=63PW=B5=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k8J8L-0004Q3-78
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 08:07:45 +0000
X-Inumbo-ID: 9a2e00c7-f99e-4080-b8c8-f3ab474b46e9
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.66]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a2e00c7-f99e-4080-b8c8-f3ab474b46e9;
 Wed, 19 Aug 2020 08:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNvjMurd60zLOvm4fLgGrM26MzhfGHKAxFO+9aWk63I=;
 b=oaph6jX6pcEjerS6SxDpSGEWjm5rOa0BD/OifC8EXuZ8edk8Iep0DL0/QnNZxQAHqLZh5T8Iam1zdAq4qF+1tyHkdA/I8p6fHMwUI89hNdB3iVl22HRH+4uep8jkrrQ5lXitd81VF10U+o2bSADv/cXRIhNsMw9ulGgICWBQkGI=
Received: from AM6P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::31)
 by AM6PR08MB3253.eurprd08.prod.outlook.com (2603:10a6:209:49::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Wed, 19 Aug
 2020 08:07:42 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::c3) by AM6P195CA0018.outlook.office365.com
 (2603:10a6:209:81::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Wed, 19 Aug 2020 08:07:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 08:07:42 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Wed, 19 Aug 2020 08:07:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6fa280b70bd7b59c
X-CR-MTA-TID: 64aa7808
Received: from 7f51c55257c6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A0C37B81-3505-4CE7-A53F-69D173D36764.1; 
 Wed, 19 Aug 2020 08:07:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f51c55257c6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Aug 2020 08:07:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRyw1Ant41x++zu6fv1iElDDPUVE+JCLHOVyVDflQkCK7tHzq81dU2HXAvgBbpzzyREAJTZlSEN8dPDzON703Q8MavCvR7yRkWReBQ2+ejP6rd+3YZQwbfWlsEEDuoZDPaD2IHGTbkbaaw3FhgwOEB0TLL92h9pF0h/HV12OWOL/rrDpMTNJfe7wDK8u79/Ak2EXn4XgR9NXUaO4VpezSfDYQ6EIcTJn85RlDPRsZ/oBMtHmX0BtXVJH4jgv49hyiMHLRdoMupC2D97QaO6vKxieb+DZAnpkh8ocaFYGRhDwaiiVUE+VXnDf6CsropH93Ix8a9MlCXYsOryXwy4RXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNvjMurd60zLOvm4fLgGrM26MzhfGHKAxFO+9aWk63I=;
 b=Cm3J3fSprUBQ0qKB0DmIw4LxOGW1H75PgHWvF5qQSJmmFdAS+qY6X/8D3MlRTLH/9pLIcydnI1GW/TkfMBS2qRZRUHbDcQp9G6uT0UBLkTAMWbxY31oCzRcAIcL0icWs2z7G68kHlNgxTXNyZrx1NV7eQDYbtUanuA3GLkfNivERgvIk93XOjOi78F4n7TU+WddR8tBJaKzrd+afmFHxZDZaEUg4otSG2r233zDCHiKyePk5n5CDRCYB/QLGYFtDoUu7P6YIopG+v0KFHGX0K2G24GBkOKbh45ow1qyBx+etOq6miO/JWY2eWmijlJT/KatmXbqV9S189uFfg6W31Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNvjMurd60zLOvm4fLgGrM26MzhfGHKAxFO+9aWk63I=;
 b=oaph6jX6pcEjerS6SxDpSGEWjm5rOa0BD/OifC8EXuZ8edk8Iep0DL0/QnNZxQAHqLZh5T8Iam1zdAq4qF+1tyHkdA/I8p6fHMwUI89hNdB3iVl22HRH+4uep8jkrrQ5lXitd81VF10U+o2bSADv/cXRIhNsMw9ulGgICWBQkGI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4712.eurprd08.prod.outlook.com (2603:10a6:10:f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 19 Aug
 2020 08:07:35 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 08:07:35 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
 <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, nd <nd@arm.com>
Subject: Re: [PATCH] tools/firmware: Fix typo in uninstall target
Thread-Topic: [PATCH] tools/firmware: Fix typo in uninstall target
Thread-Index: AQHWdZZYLV0mkUIjl0y+t0BUAAo9j6k/FGkA
Date: Wed, 19 Aug 2020 08:07:35 +0000
Message-ID: <E26561BF-A4CA-4FE9-AE4D-1367A539DE47@arm.com>
References: <4a2e7aa6edba3d4130a80a7cd7e230f03c91ce6b.1597778748.git.hubert.jasudowicz@cert.pl>
In-Reply-To: <4a2e7aa6edba3d4130a80a7cd7e230f03c91ce6b.1597778748.git.hubert.jasudowicz@cert.pl>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: cert.pl; dkim=none (message not signed)
 header.d=none;cert.pl; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 37f1184b-77a8-4cce-3b66-08d84416f2bb
x-ms-traffictypediagnostic: DBBPR08MB4712:|AM6PR08MB3253:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3253035783FA2738A81CE8599D5D0@AM6PR08MB3253.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1923;OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: OYi2DY+U8YjjSqOo/DgDzqFJp65PtEa+Xg2v3hKeKJ3FcIw+L5S3XiTVUDQATDvSg8EMKotefOTy/uxYN0XgGgO2dkvQsGTwqaIcHpNE4LFpNpoF+Hr4PAXvOt0KDcku5mdt2ZJuKtWx7v1Dt2WECV5hywJb5JYlwiKBNvrrZJMwMNpqeiBjPKPaOr1RpDaMZMVReOz1BxumCTqI4Pki5B86JJKmUJTXECqBZELGM9qYrRV+WBfKS3mPCLbpmV0Ee7AZIlJq8cWvAqI5JdCUR2pP0R8d9SQRXlruuMl/Pz4VrAxyr0EISeqNA9SyRPDpSmfeUdEqzA8CKCSjf4gRGw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(71200400001)(5660300002)(91956017)(76116006)(66946007)(66446008)(66556008)(64756008)(4744005)(66476007)(83380400001)(2906002)(36756003)(86362001)(6916009)(8936002)(8676002)(33656002)(54906003)(316002)(6486002)(26005)(478600001)(2616005)(186003)(6512007)(53546011)(6506007)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: hKPu4Z34HSp8fQh0qCq9ZQaURKwMBPESsQYjWyzD+TWTYiATL/TZ2qV1YKtgTH29xfFscYhAcKyKN17eLFDUksBFKqufFuSW3uOpFtI+dozSeF1Yb+bFRyzBuGTp910EzS0Ko9Qi/kJh2kHXN5PslX1k68fqXPlE2NZqbX6NGQTBS9Vqfw2RHk+2tRI7iESnAFbm+3qcptL1Q4aIiIv4L64Rtt9OkvP/mO37ZfYxB5EiRprvprYT2Yq1xVYkoBl4G1+swutzUcDzdgApz1E1VlzzGVmRQ6FWJtSjIgXIMptuZa8VsSiu8e6k0b7kybZR1HlZizmxLQNLI8ylYNoUajD8gruVHDsNSdKvNPz1Aq/4LhtD+iJfeZ94cgWbF6llIYAH3Y/c53HCLk/7yK9CvZV6tPb4FUgoLUNTVlp5hcbEDv9Ty1nTDfxhBm8936AWnwFSQ9BBwXibTJ7KR+Qj3JWXMUsFXEFDzhWstoGMocUfAiEsRIM67oH+NS5/Z7ClVm1WRk/p+4txWLMyN15NgV5nxSH3n6HVwvcmxBJQ3624bPQArhM9kqvy31v2TD0oFFBp1h06j/lQ/ZuYOX3lBTXSJPMftNyj8SuVkG0lCfK3Wa0t0BPpyqf1G2EPU6GNEAPPZ1IN3sCv063uZDK2wQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <90D4868C21C4644390556003F9654960@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4712
Original-Authentication-Results: cert.pl; dkim=none (message not signed)
 header.d=none;cert.pl; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 32e90a55-3872-4798-b6dd-08d84416ee5a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8UVvH4v7jpBN925Ya9REUoL0CGPcaTxSQAObjvEnPmobmCYnwgUb7WmhIzLWPkysdsbcp9VV07N/8MAni0igoDZNveMVLJEe8Mbeb/4KRCCKyqUNZL92sSwKTiFtZ5fo7B9pkCSiGK4xCG5pniUU3j+cLyeMzkO5+YqzbkHttp8WN2xjw6CSRFmsX/ExEd66ywwKYfzWPRXjJFj9J3jHSui9SMmbcjhi34i/p2E739GAYx77HwQ3d2m6c9F1u16pUq0bauHJpM9TOxTyAWy7woZUIFx9B0J+jysrTgpyt5c3AjP00x61KSJFhnSI0o6olw5TMPDzvNlC0tAts/NGHAabBN99N1XzRN/WgnVku21eV8BjoEAAMELnuygdkk68BMUSojSwZHuPAATIkcuRlg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966005)(54906003)(81166007)(8676002)(2906002)(82310400002)(82740400003)(356005)(336012)(6486002)(478600001)(83380400001)(186003)(70206006)(70586007)(26005)(47076004)(6862004)(6506007)(36906005)(6512007)(2616005)(316002)(53546011)(4326008)(8936002)(33656002)(5660300002)(4744005)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 08:07:42.4721 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f1184b-77a8-4cce-3b66-08d84416f2bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3253
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



> On 18 Aug 2020, at 20:29, Hubert Jasudowicz <hubert.jasudowicz@cert.pl> w=
rote:
>=20
> When ipxe.bin is missing, make uninstall will fail due to
> wrong switch (-r) passed to rm command. Replace it with -f.
>=20

Having a make uninstall is quite unusual.

But the modification looks right so ...

> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> tools/firmware/Makefile | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/firmware/Makefile b/tools/firmware/Makefile
> index 809a5fd025..1f27117794 100644
> --- a/tools/firmware/Makefile
> +++ b/tools/firmware/Makefile
> @@ -72,7 +72,7 @@ ifeq ($(CONFIG_OVMF),y)
> 	rm -f $(INST_DIR)/ovmf.bin
> endif
> ifeq ($(CONFIG_IPXE),y)
> -	rm -r $(INST_DIR)/ipxe.bin
> +	rm -f $(INST_DIR)/ipxe.bin
> endif
> ifeq ($(CONFIG_PV_SHIM),y)
> 	rm -f $(INST_DIR)/xen-shim
> --=20
> 2.28.0
>=20
>=20


