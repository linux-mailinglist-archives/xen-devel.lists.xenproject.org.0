Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EA764036B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 10:34:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451658.709451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p12Qi-0002UY-0X; Fri, 02 Dec 2022 09:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451658.709451; Fri, 02 Dec 2022 09:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p12Qh-0002Sb-Tq; Fri, 02 Dec 2022 09:33:59 +0000
Received: by outflank-mailman (input) for mailman id 451658;
 Fri, 02 Dec 2022 09:33:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Q3E=4A=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p12Qg-0002SQ-Hh
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 09:33:58 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bcf25d7-7224-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 10:33:49 +0100 (CET)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8472.eurprd08.prod.outlook.com (2603:10a6:10:404::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 09:33:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 09:33:48 +0000
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
X-Inumbo-ID: 6bcf25d7-7224-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeyOfGfnutdjeXAhcQWOJdWZPG18NbPFcE6+rBFIrHLnRYn5LlX1eTzksQKO4RqJGdlFXINCt2IPeecMyfkFi4sVQKwTbSJHfgseQbVSPLeN6Qk0lPWbivjNHos2mD2z2fd4e5czJ+KOYmupZu2S3bAXSZEfXWdcuLbDUtuZWFbQCAHu+r+4xBr8uNGkgnhNd9eBIqgcCmGoAdicxfEv55uVdS8HWINkgp8Jw5LUeogDUi27FZg7FKYXWBNkm6Rqushe+7vVawENODmiV1yD2G3edKI7P85ICVED0OGdi1ODLLTTq1wR73mZQM3iMH1G7YZoAD55EdaCXnyZv/OJjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0GCjhDCulr+WDeFUE20MjFw/ZLfEtUh7io5SHUjfec=;
 b=QGEbdAA3l3cDncKb4bgitvtDVOKfQVOPe5HrD297oMJvyXUPKd0kLs1jn8B48dURbkrY5QtZaG8kurYQ4nc9UdnxCZhHTdv9EirPpNGpbhGhxNfzqzMpziSVbknHT5hkk4FV04CPasU0IUGyZcVssA7dTrdynwTWMCH6SmLSKXjTNN+mpqARInMPv61pi+LtNwPrv6MDKHvdBUf2ckIk9SerOEGW2XkoUFjst4qvIPsawuXJ/2cBN6I5m7UTcbIPmgA9gQ/VbIn90iIp/EZRSaoppzcbS/SpJWqHTA3ugRLxQWGzPgatCA6W3yMg1OnXrTENVir2gSm8Xt/XHKMUiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0GCjhDCulr+WDeFUE20MjFw/ZLfEtUh7io5SHUjfec=;
 b=sfPgToJtICTr+uCQoE0q7yAPz7medLyGggZLaj3pzizGT4mjfDq+wZDWEc/4AyWbt9gLboyf3INWUzL33huCDaBM914ZFDnVo2egAX5D6laWULMzJOx1F9LgdubACZmcnaHKitTabKE6qqd0qrtFLBCYSoK8ATx2+Bsx3NMV4Lk=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>,
	Xen-users <xen-users@lists.xenproject.org>
Subject: Xen 4.17 rc4
Thread-Topic: Xen 4.17 rc4
Thread-Index: AdkGMQsDrGSUBS47TV6lomtjnujk/A==
Date: Fri, 2 Dec 2022 09:33:48 +0000
Message-ID:
 <AS8PR08MB7991AECD8B64836A5D874A6F92179@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C73731C8E914F745A53AD8F7451AE39E.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|DU0PR08MB8472:EE_
x-ms-office365-filtering-correlation-id: e2ce2439-3f16-4f86-0a76-08dad44850a1
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 yUep9/U1mfL7t4XM69yEvjek4ptqVhMq25rFnsZcPwWEkGCMvW1U8uEhg2J50RsHAM5ClnQYYMlJ8Gsw1uWinReQY2B9LCY8K+NbDKGBWVBMEBe5DyYJ4jHB1Y5ZcN5ILd3Pi0NO3j6ucgBlm4qXIixTNdYiyHE6yIghGB3B88dTuQpLITZO+ot+p0dRevgTKJ5gcX6zSE3xW6rkt5UmTE7ObcWvJ+LdKTZsCSYQ8+3cC6zP+nVZENf0iYxEZbJMzj6OKnDpoI4oHOhspxP6Puppm4Re+vrz3CQJe026+t16Y1mIV21cG5g4FU/TkNtOjaE95bE3QTWusvhEU22pC2V4pk3/30lDKFBlXtFfv5ziGXFAAACvbjzGdjS17jWhUIUssW/IFlu9yMc91TDdWQ213/2jTUtnlCIgb/gBVjDaj1uYqlkwKZi/PHYlS0mu6aJmdds6dchI5y2VHNquGCLWT0P/b1cHAWd65N3vUsh3vqkQOM+z1utFCp0CsmsO7p7B5ybkihtb0pb8Q9QsDVCl0/e1Ddls3a6VUAIxzUgFlGIzQE1zaThOSRWop6fndI3yocD0XI/ZP27N05otWvWD+VJGNhbOIaOpvWor3L++XUZKs47tZy7q2d/43UrjHQZKF+BzefpNfNqFHRozyv5EY0gsNqYWxUH3Cwe2pwFYJZe9ewUdQCNTlZCYxZSW4/C1FQ8OZeSb5LpREeeid5vQY1jHJvSjod4sTBW2Jxd0EJ9CUzjRm4ZbOg2cRvhxpDa9jylBxgdj3JcIiDXnpQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199015)(6506007)(7696005)(71200400001)(38070700005)(966005)(9686003)(478600001)(26005)(66446008)(110136005)(450100002)(7116003)(316002)(8676002)(66946007)(66556008)(64756008)(66476007)(76116006)(4744005)(41300700001)(186003)(8936002)(5660300002)(52536014)(86362001)(83380400001)(2906002)(122000001)(55016003)(33656002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uu55V9IYCB2bPhmRvPhuuE60PJY71pCl+SUVR3ztRafMOrgj2+hVnjw0YXM0?=
 =?us-ascii?Q?bJfletwlLu+yWIoLzUT+vpzgQlcC3RTOBw1HpnE0tOopRTN+DbG2hmzDh4Ui?=
 =?us-ascii?Q?MTPQ913B4kzrVw8rIEPABNmP1QNxfzIOoiKCHnUyMqA+GVfy1bcKXfstRW/O?=
 =?us-ascii?Q?Gg+EhlE1UwHeezuOi8BYx8jTQZLMuskA8JT1NPR2vCOLGAfoYBEEELA40JCW?=
 =?us-ascii?Q?ZHLWFVwjVAc6bNLAugZnGZ2QypEZc446MLsHSPqoaYLszr/5b1VrMUd2kjfl?=
 =?us-ascii?Q?PKohtm5KO0OuaxHHWPDGceRnsV++tl2Q1XNxRcWqo7ZUuXqLE8kOYC9nQZnL?=
 =?us-ascii?Q?RTAcwZTQwfDhobGt/r0Tna0YOJAP7PfiYzcgov+6Xh7X0ZL3nIGe5BjRnbw6?=
 =?us-ascii?Q?FcK0ORK3UV1EK3hA1j65+vsy4oGe+xZD2eKdeSaviB1mBpxQcqGr8nKTvsKn?=
 =?us-ascii?Q?Cjyv9bs+Jq96t+dU5hzyGo3URzrKVeoJkU44ZROEb57Y8Kd5z+uONSlHB4IX?=
 =?us-ascii?Q?tidQjVtnMN3ml78RzVIilf4E7y606h7ZJTwGJCSHe/4Jzu7NBcx08hUy4G63?=
 =?us-ascii?Q?IJCxajMOFHY/2lHLdmWaMmJEL9rouz1YLZ7rTEvGr6hm/2xCWllcjgJrVsGe?=
 =?us-ascii?Q?h9yp6Y9NEF9OFBHVKDFiTnfh8pbhg3Z1U064zs8Q7lOaX2gSUQ5aS0FRD8ca?=
 =?us-ascii?Q?B1zTPvb+Wta/hBLAvNgWR7aJ6ypUnDwAmgTQaQKbKsupFA/HgOqhZ4CfinEu?=
 =?us-ascii?Q?64ER6DoeVlTEoLfldRAllBD83mdf1DEPnbjwO/9+R+2wKyhe8z0niUHDUWWm?=
 =?us-ascii?Q?Y1hKuM/XFtmeR2sCHqRGhgzQlZeyXKZBcd+7vq8ms0b58EpKnzTenoOjeoio?=
 =?us-ascii?Q?b3wjGpYxZM84Jec1TrDNnJd+vhsB56Zger51LOtprX7UYS8Kb33auNzcUfZ8?=
 =?us-ascii?Q?qNU5CiWjNk3ZJ2cvcBZOQM6OTCyKFmumhs8eWxgsZ5bQmd+LSfDV9Q3d/3OU?=
 =?us-ascii?Q?JWdm43w+iTAlRz0YI3XYBf7FwxP/RqzLdgA7dhFZfx7ZsqCWxaFkdfHelNIg?=
 =?us-ascii?Q?yj3W27i7wZzJ/vh+FgYHdykkBI1z2v3Eui5Fr+FfFBjwCF961N6OvZUpFJeA?=
 =?us-ascii?Q?SyfyLKeG0OgovhOlS3zNeGhXmrQqCTs0CMV63SsmH1SaN4+dnXG1txoynNJd?=
 =?us-ascii?Q?EvtGBU5lCeGuWZwREGq/5hfPrEbOYlg6x3LWc/9lnSBSrEocNgxO1cxLLj6F?=
 =?us-ascii?Q?rUgCjK0kR+60KEdI+zSKSpe7KAEzksgITYjEsDDMP3d+xvmkIE04wcXh0pTi?=
 =?us-ascii?Q?9tVuBlozqghomaZclSIyg5vWdXr02sZiycV5Q+AjIZy6sOr9s4N2EqKcSQDF?=
 =?us-ascii?Q?dKLbv+3QQzX5HroPOSn1VSoz8FXy+ujm3nmrswE5Tb8FI4rZ8y1hr1uEe2vi?=
 =?us-ascii?Q?4cXKwiiyln5Adayb5WtP+OTvTMiMcr5iimf+/GLGT05V9tMbSVQ58XvrWT3Y?=
 =?us-ascii?Q?EARBDxIpZKqNo0LISbIS5K29RN/rGUrtzPkYVuHAOmqBDXwagKi8NSGH8puY?=
 =?us-ascii?Q?ZYLcicu4ixH4XEckCd5cOK3YMDXVZysdP6i8Ti9m?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ce2439-3f16-4f86-0a76-08dad44850a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 09:33:48.1499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QJevbroHfrQK+6uVIba8/TIbdWcJ7gIdg6lqezCJC/7i1K5PnD5Hq2Glxc0aCPNfcmyBXfEFiZT+FziPKaLMhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8472

Hi all,

Xen 4.17 rc4 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.17.0-rc4

For your convenience there is also a tarball at:
https://downloads.xenproject.org/release/xen/4.17.0-rc4/xen-4.17.0-rc4.tar.=
gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.17.0-rc4/xen-4.17.0-rc4.tar.=
gz.sig

Please send bug reports and test reports to xen-devel@lists.xenproject.org.
When sending bug reports, please CC relevant maintainers and me
(Henry.Wang@arm.com).

Kind regards,
Henry


