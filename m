Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C73622B8BF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 23:32:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyiow-0005dB-2O; Thu, 23 Jul 2020 21:32:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yR9g=BC=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1jyiou-0005d6-S4
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 21:32:04 +0000
X-Inumbo-ID: f2aa6cc0-cd2b-11ea-878b-bc764e2007e4
Received: from de-smtp-delivery-102.mimecast.com (unknown [51.163.158.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2aa6cc0-cd2b-11ea-878b-bc764e2007e4;
 Thu, 23 Jul 2020 21:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1595539922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D5usojrMtMUPJ71Zs1JmL1qzPiqUSpu9P6KeeaZ6KJ4=;
 b=mIH4J7vdu9023eyrDMF7HKvctERBHZf/F0unNxr6L7KMUgu6tErJ2KQPM49KNXoCD0AXnj
 PUG7Y5LwNe+4eiNfF6PHDDmurO9H9qVVeAqiWXRB8v/tU5EOfwa1sUQkMpCYFiz1g115mX
 8NBOLlA4nlyyziXfWPva4Ir9FtnhzOw=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-t9ctjvbmPpCyPQBcC4IjPw-1;
 Thu, 23 Jul 2020 23:32:00 +0200
X-MC-Unique: t9ctjvbmPpCyPQBcC4IjPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/REZZfkqObDrwSuIDh9CeMvziu65/p+yNRFURh9S/9WXaEMg+hHxZZtP+UlTXagSKnhDMKEyoamzWVHTNPKC8P9GVF8+Uz90vzV1zjQBKpgSlSuRkS+/Kwsq579umLE5D4NVJT+DmJ+9TRDIQDMOlvK11CnLAXCUclQJtQlBB6sPnzoY93UZqGtkA6D1Ov5T8yC6nnr9HdF3qm4AYU/NHtICkB6OFhfjuHJBiX03wgHz4h/PF2akk4mnqmO85ooshLkJpNF1u1+EFv4cQRTg9YDNx5SWXGOffbMGG8nyqevmhqj5mHBfmhLMElPH2O+DeAkT6ui5eYUtRNAUDhSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BM+TQn3Nmw4ykgz8qpTTfxHrBNJcFEhAWOM6Tk3cPfQ=;
 b=h+iQYRIdplZH3cwU60rT8JP8sK1gCULOmjr+0AG7qMS8ka8ZqWKZhmvZV5+Ch4pxwVMh2enWosGaYPsL8Ouh0aZNuR45qlkc2n5Q3axGVzoW2yqcCaoXqKEYmHIEqqg8XFmsrNg5P47LmJxhMitYoFhJ3rMOFx7q/8MNpicWb5dbuehk21kXn/Z4gWqCMvt1WWTOPtICOm2w7VH7m4yaaE+61yhA76uupxhIc9vgdzKtNyA1pc+h15V9AY3sbUXoDjiAGCeKhI3749NXFgTaNobR9riHA14EmNuVXJIwbNoE30izPQJ9bL1yK3KDQfRcNCC0VGFfJRMWI+jdeWycXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Received: from VI1PR0401MB2429.eurprd04.prod.outlook.com
 (2603:10a6:800:2c::13) by VI1PR04MB4288.eurprd04.prod.outlook.com
 (2603:10a6:803:3f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 23 Jul
 2020 21:31:58 +0000
Received: from VI1PR0401MB2429.eurprd04.prod.outlook.com
 ([fe80::7cc0:b0a4:b951:90e2]) by VI1PR0401MB2429.eurprd04.prod.outlook.com
 ([fe80::7cc0:b0a4:b951:90e2%11]) with mapi id 15.20.3216.023; Thu, 23 Jul
 2020 21:31:58 +0000
From: Jim Fehlig <jfehlig@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] OSSTEST: Install libtirpc-dev for libvirt builds
Date: Thu, 23 Jul 2020 15:31:34 -0600
Message-ID: <20200723213134.11044-1-jfehlig@suse.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::14) To VI1PR0401MB2429.eurprd04.prod.outlook.com
 (2603:10a6:800:2c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-tbji.devlab.prv.suse.com (192.225.185.20) by
 FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.9 via Frontend Transport; Thu, 23 Jul 2020 21:31:56 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [192.225.185.20]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee3d7a32-9461-4b34-72ff-08d82f4fd426
X-MS-TrafficTypeDiagnostic: VI1PR04MB4288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB428878DA85280375DDAE0DD4C6760@VI1PR04MB4288.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hWrQp2tBLL3oQ254Gdmf1yjgxWrYP7CV6/PaDKWFSOLXKQJwWWS7i7dZGe4DYveO29TkbsrtC7nhWa9YqoUCboDBmMVRXeF+mG86ACAMKc9FidptBwK4LFUeGPLoCHrSze0sge9BzqQslJL4pKj3L6dXD8eY64K0u8n/iPontGW/+EHQRK7I6bFTQQbIUouUWSDm5EsSmLre5hJycBA9xhnNLjI/IBcvXcICQBVb37lUp1ZLdbdB2be8T5N+RXgAoPnuMrakKqVFgVsYE8ab3ZuL7cljGtp7Y7U5LsPxf/JNSCWctQTxJz+dSL+1kGYhdj8vNEO5F+p3XB4z1h2ctw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2429.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(376002)(346002)(396003)(39860400002)(2616005)(52116002)(7696005)(26005)(478600001)(956004)(16526019)(186003)(83380400001)(6486002)(66476007)(66556008)(5660300002)(66946007)(8936002)(1076003)(107886003)(6916009)(4326008)(6666004)(316002)(86362001)(2906002)(8676002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: tlWJsXLK75ihjczhOKK72UnrliGF3mkRWJw5vIPRmRjZQkdx3qUsU5B4xX617WA2LBXuN+D0DWX7MyKdFPW0ltx0liJIox9DNHckxpYovymY6xC4wIm1VVJGJcAJWmEnhiKJxJNILP2dRjsHE0+p/+AjFJij0nuzaJnnLwlYHiNyFgyeO+g+n6GO5E7Vcg5sbcwGs5SwzqPuqJZ0jpNMSPMbZ9C2YmVpltQsBNqhJhZRghpZoGkTEVcqOPaOHWnqkZdykzhwDHKJqK0RLtvKkHbIuoV3uqQgFtpp4ZUJWIuWs8yC4p377X1CYBSF2GWRhel8iS6tOWOn5Ni/H8KWTRaYGOyEyG5YB/qA6ECRQKc3LF8FY7BZZiOHiux0gVh0oh9s3lo3HNd8e8G3VCYKRWWy9ztH5DjX4cq2OeVxIx46sT9tnXftpkiEp0vRBsbSdVzDItam7VClHr9JOwG4bmwrkpxFc+1b7wJeaBjPOKEivLBYFPMuF4gZ1QvL4sSJ
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3d7a32-9461-4b34-72ff-08d82f4fd426
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2429.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 21:31:58.5464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzEXQwCABANF99lTU/JUncxHfQ4Ug2M0R8St64IJ7SHNjoCZpZdgLZn7EiEENBtsbdyIhVJSWu7KYnysRth/dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4288
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
Cc: Jim Fehlig <jfehlig@suse.com>, ian.jackson@eu.citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The check for XDR support was changed in libvirt commit d7147b3797
to use libtirpc pkg-config instead of complicated AC_CHECK_LIB,
AC_COMPILE_IFELSE, et. al. logic. The libvirt OSSTEST has been
failing since this change hit libvirt.git master. Fix it by adding
libtirpc-dev to the list of 'extra_packages' installed for libvirt
builds.

Signed-off-by: Jim Fehlig <jfehlig@suse.com>
---

I *think* this change will work for older libvirt branches too.
The old, hand-coded m4 logic should work with libtirpc-dev
installed.

 Osstest/Toolstack/libvirt.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/Toolstack/libvirt.pm b/Osstest/Toolstack/libvirt.pm
index e817f5b4..11e4d730 100644
--- a/Osstest/Toolstack/libvirt.pm
+++ b/Osstest/Toolstack/libvirt.pm
@@ -26,7 +26,7 @@ use XML::LibXML;
=20
 sub new {
     my ($class, $ho, $methname,$asset) =3D @_;
-    my @extra_packages =3D qw(libavahi-client3);
+    my @extra_packages =3D qw(libavahi-client3 libtirpc-dev);
     my $nl_lib =3D "libnl-3-200";
     my $libgnutls =3D "libgnutls30";
=20
--=20
2.26.2


