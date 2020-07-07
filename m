Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434192168AA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 10:57:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsjPm-0003UM-42; Tue, 07 Jul 2020 08:57:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YS/2=AS=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jsjPk-0003UH-EQ
 for xen-devel@lists.xen.org; Tue, 07 Jul 2020 08:57:20 +0000
X-Inumbo-ID: dca8dd0c-c02f-11ea-8d34-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.46]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dca8dd0c-c02f-11ea-8d34-12813bfff9fa;
 Tue, 07 Jul 2020 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sKcIoIro8jAD71R2JkQzhnw1ZF/34x5Ir5puXLGjCQ=;
 b=vWir7w8QXznbzqvoyJukaSLfeTbCbzH5PGvn7XybeaZdu46ZsE9XdrZv5O8Lilm0rs0UmBbiJGJgvn/6LqXcVqO5pM/ZroQVY+omvqyuxR3nYuFkcfvBht0+mEOA6oHa4MTPIg8WO963wZ/fL+1m1ZvtfG7OM+Lr1gTN5Zp+Bx8=
Received: from AM6P195CA0063.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::40)
 by VE1PR08MB4717.eurprd08.prod.outlook.com (2603:10a6:802:ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Tue, 7 Jul
 2020 08:57:17 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::26) by AM6P195CA0063.outlook.office365.com
 (2603:10a6:209:87::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend
 Transport; Tue, 7 Jul 2020 08:57:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.24 via Frontend Transport; Tue, 7 Jul 2020 08:57:16 +0000
Received: ("Tessian outbound f7489b7e84a7:v62");
 Tue, 07 Jul 2020 08:57:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 70cb4ee3251b1d0c
X-CR-MTA-TID: 64aa7808
Received: from 11ffd43a1040.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C9A3401A-1131-49B7-925F-E9C0EFB42405.1; 
 Tue, 07 Jul 2020 08:57:10 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11ffd43a1040.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Jul 2020 08:57:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OX68sRS29WL05KYMF9+60Syr3IGMiIe55Ng4ZqFt71qQRz3WmLT2NBYtPaEXki8hDKNDXbAj5AHUZ34S9DMCZnfUVFIqNiVUtQHMZIVIq1v5Ixa6PhMxMrS8m00q2cLwxhwosnqyPiVf2Gsp+K0faTarW6lwVqeS436M1so0GshVjSexOZHtuL3/MHZeKzNG0JNhFX4+GVNWaDxVCfALFMIow9S8ECygBA1/B4KSsUITmi0FFSqVu2yvFUkJmrzC/VOQRSCnVBWhVgeGJZTYhwVLFwTYsQzeXh4TXEEeNp3DMDfL2C+gb4lTcBnv+bqHFxmLzqOjcNeZB0bH3FWcaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sKcIoIro8jAD71R2JkQzhnw1ZF/34x5Ir5puXLGjCQ=;
 b=ZWV3IYG0jG3x1BuqMsMZJvIaPh/0ZK26B17Q6XdxomKiYp0r8DVw3DpeePwWoq3+pJSUI9JhSHELwRX7roRqWBykMkcdpCIauWuC52ixNLXSboNKHdEA6zoX801WzkVm2+XHHXYFxicF9u8v+aP0cAb/T1xDVjRuw4BEtQ96+0/nb1tH5MzEa7MHttRwAVlYVM0PM+fVSFW/TnxwNGGX2TbD50qNQBA0uNPKnEJLwckWvV4rWZOXoEXCjqz/h0W7Cx8XiOBo7iSMwkwZdzZTM14XsD4r5DEJ9o79hGtauKrYA9IqY4pKBat599DukC/zgWRxPC1Q/B1xYKrKT04xtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sKcIoIro8jAD71R2JkQzhnw1ZF/34x5Ir5puXLGjCQ=;
 b=vWir7w8QXznbzqvoyJukaSLfeTbCbzH5PGvn7XybeaZdu46ZsE9XdrZv5O8Lilm0rs0UmBbiJGJgvn/6LqXcVqO5pM/ZroQVY+omvqyuxR3nYuFkcfvBht0+mEOA6oHa4MTPIg8WO963wZ/fL+1m1ZvtfG7OM+Lr1gTN5Zp+Bx8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4821.eurprd08.prod.outlook.com (2603:10a6:10:d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Tue, 7 Jul
 2020 08:57:09 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 08:57:09 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Manikandan Chockalingam (RBEI/ECF3)"
 <Manikandan.Chockalingam@in.bosch.com>
Subject: Re: [BUG] Xen build for RCAR failing
Thread-Topic: [BUG] Xen build for RCAR failing
Thread-Index: AdZUKc5JeR7gPpESR52uLkZK1kYwOwAEsnEA
Date: Tue, 7 Jul 2020 08:57:09 +0000
Message-ID: <1D0E7281-95D7-482E-BF6D-EE5B1FEE4876@arm.com>
References: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
In-Reply-To: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: in.bosch.com; dkim=none (message not signed)
 header.d=none; in.bosch.com;
 dmarc=none action=none header.from=arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4873d8e8-c3e2-40a6-20dc-08d82253bf57
x-ms-traffictypediagnostic: DBBPR08MB4821:|VE1PR08MB4717:
X-Microsoft-Antispam-PRVS: <VE1PR08MB4717BA89AA82BA858A67D7599D660@VE1PR08MB4717.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 4/yZjpNpOhhZexbSnTRTtuLjulDJBER+lvam6IgYL1rEZxoQyZQyf/TWHtIa73zEUzdJyv+2oDlK9Xc++5kC4q9sF3YbIUrto25pzyViurw8LcqCCqYgIrIOEnBFklMf83ggGvqc8j1/RK5b2tPPTwRoZV+U1jjpmy/TxxWgtiv7QjtydYtaf/tZk3Ot3p0QTWI1vY1ECSPkqS3iTEFPxIvuY7N/iB1BN2A2Rv/fcyCJ0uDsI/o3rAgsNnSSZk4u+6fZfUvzAyNyW/nE1FU7MaXMTIwzldUXnTpt3yIJ3RyTxczQgNlJBg25CLO45HSK4nipVURpORuCuB0FP/gRqfOhq8iPHWjK1dScBjmjorl8sWtFSQYyARWOrgiW9RuWVXtuLGLDdteMmbtKVyTTAQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(83380400001)(71200400001)(2616005)(478600001)(54906003)(316002)(33656002)(8676002)(6486002)(966005)(4326008)(64756008)(66556008)(66476007)(66446008)(66946007)(8936002)(6506007)(36756003)(186003)(6512007)(5660300002)(86362001)(26005)(76116006)(2906002)(91956017)(53546011)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ZayKnGFHRjxhuk/S28EXwMT5Fzz+T/dsX2mvRpv/1WLCFbsiXChzt7ZOOe6ZZc17gg9yvREnCDS/EasENpIt4niD96sLSPiZoMNLClAvth7AqPpsZrsMJ8d4EdAVGf0Vrq5sgUE9CQCpv86nbo6wnITnx5INq+hFMh7rqEWzsuGRT3FSz1pRwoJLTh5wQJrUFmMj2XYzuvBB2oA9WWaAtwsfmkCQIRM+kql4kyBloQ8lw2U3VjBdUmDqkhfNJUGi8ypFHYUch7zYIEJtlDI4hJtTDmydyq8DIfQwXm85cnekI1GVWZ6kTeEFFKf2mMJKSDL6jtWvb451EuZ0V/0G3zEwUiudwXJd9ymzJv+JIbsKciHM2llC1Bc+zrklrR5qJfSTzFhLI2EWt5fKHRPiaUqVnQLMdDuifdF82Ln62PZ3X1mledrwWF11F8DIglRNpxgwFvgMLPay4h1IfmMJagJxA2cxYPfm+sUN+nCp86g=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B31A79F50FB5534181755F7D6D684453@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4821
Original-Authentication-Results: in.bosch.com; dkim=none (message not signed)
 header.d=none; in.bosch.com;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966005)(478600001)(8936002)(186003)(26005)(356005)(966005)(81166007)(6512007)(82310400002)(47076004)(86362001)(6506007)(82740400003)(6862004)(53546011)(6486002)(36756003)(54906003)(2906002)(5660300002)(83380400001)(8676002)(316002)(36906005)(70206006)(70586007)(33656002)(4326008)(2616005)(336012);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 13c5bc66-201b-4f90-6962-08d82253bb46
X-Forefront-PRVS: 0457F11EAF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6fItP/KM3IOwE3s3k7zvbJBbFhkFTYOaaf3xIGbYwnf0q1wLHGjN0OScowZcQ5wAAMajbsFUmYPTZKfdpKMbJnpZdV/b2ryLR0vN6DQhgzhY1Bg50MVMabfEdth9aFy4tL7qHOtE2PAkeCEeFPIWwh0oRLQQlcB6TnXRf4mGdZMxfARy+Q6+e1T7rMT+1B4+pS10kT3OeeW2/9pmakDSLMWoBf8XpjmeE6i7533OG5Armji1Pc3ioUh752A2DIdNg6E6BgIfAMB3tfbe3oorc2/bsn4mnmv7BnqqpF7hQO+8FIkeiFgH0/z2oQmkV01uDVv+w/0IH34HnMCu6zBrmIzLwZIxsG6036jOSrpp1fT4IoRIKX7B7Kz+mM845JMIo3tvMucr1JTMpahQf7D0wx5LZ2MrZyhg71AVsNdxU+9w4HdcYsXfmUj0S0KwAIFkheAyEDVhLF+ECxcLtXnDEZDrJZBXhNJ7LtTxYsRSuvw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 08:57:16.0143 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4873d8e8-c3e2-40a6-20dc-08d82253bf57
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4717
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
Cc: nd <nd@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 7 Jul 2020, at 08:58, Manikandan Chockalingam (RBEI/ECF3) <Manikandan.=
Chockalingam@in.bosch.com> wrote:
>=20
> Hello Team,
> =20
> I am trying to build xen hypervisor for RCAR and following the https://wi=
ki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/Salvator-X st=
eps.
> =20
> But am facing the following issues
> 1.      SRC_URI=3D"http://v3.sk/~lkundrak/dev86/archive/Dev86src-${PV}.ta=
r.gz in recipes-extended/dev86/dev86_0.16.20.bb is not accesible
> Modification done: SRC_URI=3Dhttps://src.fedoraproject.org/lookaside/extr=
as/dev86/Dev86src-0.16.20.tar.gz/567cf460d132f9d8775dd95f9208e49a/Dev86src-=
${PV}.tar.gz
> 2.      LIC_FILES_CHKSUM changed in recipes-extended/xen/xen.inc
> 3.      QA Issue: xen: Files/directories were installed but not shipped i=
n any package:
> /usr/bin/vchan-socket-proxy
>   /usr/sbin/xenmon
>   /usr/sbin/xenhypfs
>   /usr/lib/libxenfsimage.so.4.14.0
>   /usr/lib/libxenhypfs.so.1
>   /usr/lib/libxenfsimage.so
>   /usr/lib/libxenhypfs.so.1.0
>   /usr/lib/libxenfsimage.so.4.14
>   /usr/lib/libxenhypfs.so
>   /usr/lib/pkgconfig
>   /usr/lib/xen/bin/depriv-fd-checker
>   /usr/lib/pkgconfig/xenlight.pc
>   /usr/lib/pkgconfig/xenguest.pc
>   /usr/lib/pkgconfig/xenhypfs.pc
>   /usr/lib/pkgconfig/xlutil.pc
>   /usr/lib/pkgconfig/xentoolcore.pc
>   /usr/lib/pkgconfig/xentoollog.pc
>   /usr/lib/pkgconfig/xenstore.pc
>   /usr/lib/pkgconfig/xencall.pc
>   /usr/lib/pkgconfig/xencontrol.pc
>   /usr/lib/pkgconfig/xendevicemodel.pc
>   /usr/lib/pkgconfig/xenstat.pc
>   /usr/lib/pkgconfig/xengnttab.pc
>   /usr/lib/pkgconfig/xenevtchn.pc
>   /usr/lib/pkgconfig/xenvchan.pc
>   /usr/lib/pkgconfig/xenforeignmemory.pc
>   /usr/lib/xenfsimage/fat/fsimage.so
>   /usr/lib/xenfsimage/iso9660/fsimage.so
>   /usr/lib/xenfsimage/reiserfs/fsimage.so
>   /usr/lib/xenfsimage/ufs/fsimage.so
>   /usr/lib/xenfsimage/ext2fs-lib/fsimage.so
>   /usr/lib/xenfsimage/zfs/fsimage.so
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
> xen: 32 installed and not shipped files. [installed-vs-shipped]
> ERROR: xen-unstable+gitAUTOINC+be63d9d47f-r0 do_package: Fatal QA errors =
found, failing task.
> ERROR: xen-unstable+gitAUTOINC+be63d9d47f-r0 do_package: Function failed:=
 do_package
> ERROR: Logfile of failure stored in: /home/manikandan/yocto_2.19/build/bu=
ild/tmp/work/aarch64-poky-linux/xen/unstable+gitAUTOINC+be63d9d47f-r0/temp/=
log.do_package.17889
> ERROR: Task 13 (/home/manikandan/yocto_2.19/build/meta-virtualization/rec=
ipes-extended/xen/xen_git.bb, do_package) failed with exit code '1'

The configuration from the page is using a rather old release of Yocto.
I would suggest to switch to dunfell which will use xen 4.12.

Current master status of Yocto is not building at the moment.
Christopher Clark has done some work on it here [1] in meta-virtualization =
but this is not merged yet.

If you are trying to build Xen master by modifying a recipe you will have i=
ssues as some things have been added like hypfs which are creating the issu=
es you see when Yocto is checking that everything was installed.

Bertrand

[1] https://lists.yoctoproject.org/g/meta-virtualization/message/5495


