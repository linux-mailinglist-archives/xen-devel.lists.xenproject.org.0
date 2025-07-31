Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3849B16EDB
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:43:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065256.1430679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoG-0002Xy-Fy; Thu, 31 Jul 2025 09:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065256.1430679; Thu, 31 Jul 2025 09:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPoG-0002Tz-6R; Thu, 31 Jul 2025 09:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1065256;
 Thu, 31 Jul 2025 09:42:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XXc8=2M=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhPoE-00025Y-G8
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:42:46 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b567297a-6df2-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 11:42:44 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB9863.eurprd03.prod.outlook.com (2603:10a6:20b:53d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 09:42:40 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 09:42:39 +0000
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
X-Inumbo-ID: b567297a-6df2-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqJY9LgkwMzueJDdYVD1u834zbd71b5t4EWS6bUXmEIk5Vc5Pg5+8fyA2yPrNSf45HLY8/UxsK9lMLQub5TNSh+odiKctMF2yOFIawZJalx5rKtZF5PYcD7M5n9veL4lP6Gu3G5QY0n7zfIznEgwSxTq//Em9D4bv1Sz4uqph4mfHzBE6tcL7rMWqRmx8bDb4QbxBm8SKalhIZceFTkFKtJXwdpLVmLuFli9DU3RxeRBvXe3uzzFg4emRFumONpIigVVfKvH9w7ILIu/2/s0n2MP12Np6pZTfOCwcDsW3o3Me0QypVrwcWWLiLlfEcHkEUpxaED/LzY9v+a6KJ1HFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZFWJ3JcUdcRmkliwj+c+bFkHVDd7TDs/cFw2uD44MM=;
 b=LiuYwz5HQVSXEV5X5emBq1hWAic8Wq6LT9OxtjIgRkUaI8dezrt4Mzjq5aSCl7mWhFTYC1SKOe2TyeEHBI9NgmTHfUwILr7+U/+/O0LsTfdJ8V+Fe47fMX0VIDNS9j40w9I+bnR126i9nITmSoL/f/VlIu1z7VE/CMpGfsZv38bGhqbGR0c+V/arrEiSM/HSqZYL1IeZV+I+sau7sgfdJfNZ2boYi6Bz0tC63VAsHXTkoKHkNQjZ5u5L7VFK5gQrbzgLpbpfYZ+WxLURGsFphcdUU+pTDzTklYA8Gp55cU7ElV1GqpcRXJuRZvGRTfvfmMd1WFUONbbqFPp4Q//Fqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZFWJ3JcUdcRmkliwj+c+bFkHVDd7TDs/cFw2uD44MM=;
 b=nO6cxtOxiM5M1WBY2Dp7EmuVFUPwwGGgWMk3U7mbBYb/45uSOymOieDhLNBQi3ufmZmTmd+Nt90PkfhvHKBBfnWDBh3KFnezMNyckyFP4sK7wvOIU2/7itOfzW+QB9wwTz8Xz8t0BivvOHfRPR5AOGtTLBJVYQBMEH2RVDjwcgdreE32MywWAslDa2JuJDfIPACJj/EPBn7r62mIcSm6ARVglzv2z9j5v44sCsve4xIwtQAHvsrSyxxG2KYMVE7qFeb8W42zEYYoqA0IVJFmF8aSBRkgAandHJfA5z352nP+a5hltVp4loXEtMUOD3TFqKoBqYXJ6RNgxkQcVdOdWw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [XEN][PATCH 7/7] xen/dt: kernel: add assert(!domain) in kernel_probe
Thread-Topic: [XEN][PATCH 7/7] xen/dt: kernel: add assert(!domain) in
 kernel_probe
Thread-Index: AQHcAf90SU7mttt73EGvxVqZtaGOmg==
Date: Thu, 31 Jul 2025 09:42:39 +0000
Message-ID: <20250731094234.996684-8-grygorii_strashko@epam.com>
References: <20250731094234.996684-1-grygorii_strashko@epam.com>
In-Reply-To: <20250731094234.996684-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS8PR03MB9863:EE_
x-ms-office365-filtering-correlation-id: 2668ba71-4da4-43e7-5c37-08ddd0169703
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oANWwDzDtVIaMqHHqb2gRd+ax59OBpUoyYrsgUoWthpx7GnZU69abIJuwp?=
 =?iso-8859-1?Q?u2ZDfxt3VzkvP9Ctkbb2yGG04vC4uzsIFh20s2+wjgtMr6NEnpGZjzHrHn?=
 =?iso-8859-1?Q?sz6sjxWqtmDQajRAyltFWUPYF27P7novPS/rsaJuSBdJFgq61Ell1uTFs9?=
 =?iso-8859-1?Q?bxN+U82erLtim2PFGq0UbYZEFXVADFX1wBJ/jCaGQsVnPiBfIViCu0dXmJ?=
 =?iso-8859-1?Q?fuuMIFX5bhpHLSBr6K1GzL03B2vvKig9KBLc6mpJXJeVESThJd8fN8Fzig?=
 =?iso-8859-1?Q?VdYlzXI6UTnM+y9q/zN4QAoc4fgaMxlmr1VPLTRNN+cy1E09olPc9jzR1c?=
 =?iso-8859-1?Q?OaL/eAVaogMp8Pci0t2rR8DSlNmKCHqB6paLuOctWKDOEo+7N4+CRBT5/M?=
 =?iso-8859-1?Q?59uW7or+u0rIeXX8WR/ZT7jS8DbMuAhEZHiiXMKnozoA3RZlNvM9kOFD/q?=
 =?iso-8859-1?Q?JWIpkHN539Xu+aQA1K8XPSj+YaYqzsI9C6D/6NTMsO2smQA6dLPVZwNGfe?=
 =?iso-8859-1?Q?bIVYEztJ8wbRt/EdhAgEr1gMLQgELt1/IAOqmtqywORl6VewWgtWNCZ8+x?=
 =?iso-8859-1?Q?xbut+UUmhvJBfsaC0bvrGKz8PdS0Bn2ZXL4Eacx5m4jbNMQ363O3P9K56b?=
 =?iso-8859-1?Q?VEkaCRWq5KPQ65ZDZ0LrZa0EJh1ehq7GXYA6fCBvBsz0BcsIjPKCrRLOvS?=
 =?iso-8859-1?Q?ZYuDnq4mkqrexqzF/PF01QeHL/BEiQsRwMRMDZcIqysMOWMlQek4eO74D2?=
 =?iso-8859-1?Q?5AaHKBK1m79FbIE89i5e3PTgZcbYPMVA4rmnU929B8J6kyHz067umhppvF?=
 =?iso-8859-1?Q?O+d3VxPudbUbGOzAEMJQOla5BmSk7AKh32k3hlnkyWJX3w5/BSAXhk7Zkz?=
 =?iso-8859-1?Q?IsIvE5EpYJhh2tbitfXBvL8GaPKvwgg1hAr3Vjc1/Zw8wvSK32exTwjxgP?=
 =?iso-8859-1?Q?Hi/ehqT7SS9E0ZgszIW3cAquNDDo3CTPgPUZZunm0UuCJphqDM/TwpGjtK?=
 =?iso-8859-1?Q?lQNv3nAUTmOIpWIbuI95ozM3Dm77UEL8lXuNeYxHK2/B6okJxwDfNK/ssA?=
 =?iso-8859-1?Q?IQEMwZVA55iyHnxYdGnJrNzLSQvY9qrrTE0V3zSBCTUBYx/rNRnZLwhutx?=
 =?iso-8859-1?Q?cwNiep6+3czJMl0yrgg5fwQMP0uGvIaiNx2TAWb0TIDUgQZtiDizDPtlC5?=
 =?iso-8859-1?Q?9sT2tWOaGOjAI8p2wFOihTCTyr46sm4hbb3bPNP3Lwj5oQw+IvCYscADau?=
 =?iso-8859-1?Q?FhKnEzX5co1bix8PKrXe6cm7cNqenQAypZfc2YMcp/16UMvmTsN8HzASN4?=
 =?iso-8859-1?Q?dormweLtgCVlUhFfb5rWnzTVWRkPmkVrbNuhPhYLLDXp7H134/6f4BNuPL?=
 =?iso-8859-1?Q?/y1eFgjKqpSwR9VJFNw+FaV3WR72Dt4LLMWc/ZtUA9iEOTmY6hcI9f92Xi?=
 =?iso-8859-1?Q?r2vICwA7L+P5oJ8fdbJHTAp1MGYR0cpeYbUJMso6EtD3TEZZJckqhE6Apv?=
 =?iso-8859-1?Q?LftW28sqBgBZj8tNTFCg279kebXnV4Xs0sPltp4SzkdA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Pw5KoigUXU06dU2MJcRjy2wZYL2sZn+XZhUL8HjJ3J5tteJSt6lV5GkFQ9?=
 =?iso-8859-1?Q?QvNjRxDJEXayxySE8P3smC9cMvi9xOY10wTxClO5R6TaqrL7xGZOyDaq9P?=
 =?iso-8859-1?Q?BaOS7YUxOgJiSDnYe8ZerLENbnKAosGh8PDSaAgUIsQ6iA52G60p33JGOQ?=
 =?iso-8859-1?Q?lS1BvVja4j6RvTc60E1wMnptfirH137tBzvsNmH1tcqP12jZ3M4HF0iJRC?=
 =?iso-8859-1?Q?+l5JVaAIAZAZFAXuXvLTqflT0s0aYr/8oKTreTAxO64NRrNvxcP/x1F52Y?=
 =?iso-8859-1?Q?hBf7K12eaEyuzJ/QRjfpeRHrZ51icY2BZZgjELz0WqbBKsswkN6SLHRlAh?=
 =?iso-8859-1?Q?iOv+pXOMqyi/OE2YkLQD1a2Q+7Bdlu9qhlBl7RMkZVhl5pc/OP9CwN7YKI?=
 =?iso-8859-1?Q?mfEQNzvDgviiPQtMuQNpXictqtg/Xv/bhXFYBzW0FsMboIGa1n9ocxttGR?=
 =?iso-8859-1?Q?brAxNoZHMijES9Ira/lreOF0f2MRk2kdmgAI2BBMOQjspnKY8U/IbH8e94?=
 =?iso-8859-1?Q?0VWQRHp+Yi85VCwphj1AW8rnRrfnQNuv/jp1FFtnUZgRHv3gyKhXKk5Ckr?=
 =?iso-8859-1?Q?rLoolFPBfbPSOQ+QCKXXWvNx2v9QiCbXWMg62cw4TxQ3MDqO+wantpPtmL?=
 =?iso-8859-1?Q?ysu+bSUiA5l0Cz/XkURHSLGww49QMV+m8jMh8bJz7Oa23TT4fJsvgKgO1N?=
 =?iso-8859-1?Q?XFInGssSHCqXHICtolqKdVtKFgCkFAJmDWDmwNNL9FjSr6vM1z5lAba38g?=
 =?iso-8859-1?Q?Cx6AECb9Pa7TelwzP1YRCdgMB0DcHpi6by4nW0jiSACPzzmegA8LOYX6cr?=
 =?iso-8859-1?Q?5oqbMvlIT6fUtShTXSllF23RZo3XVjjAG6zAjKHrpKx9OJbP1sq/DkZROv?=
 =?iso-8859-1?Q?VpI1ZNm72qhpGAyznOwb7jsyjoa7WDbQBQMLeKmQxZvedyd6UGGE+La6f+?=
 =?iso-8859-1?Q?2ShFgElyTMwqQzF6T0FC8cVCItgLXjk5ASHf7chtUNDUG6QDDIG7z/Czbj?=
 =?iso-8859-1?Q?5WZowF3KhtMkFJBu+68dKeoL9WOAtQUzu9QdWtfOwzdp6PkM22xKEdGFzp?=
 =?iso-8859-1?Q?CHn1SrZ8/fYuSeTfK0lnNltCRkGH8cOGspnX7VTNTIHUsurveiWYnaj5TC?=
 =?iso-8859-1?Q?15i/BwzrXfu0IRSQziZBrCDmAkGN0GC+c2Vat9OcMxWM43lyxCDz6IZD8w?=
 =?iso-8859-1?Q?q01Ro2a1O8/ncRDieZTmuWrzGRCvMswsyFQCPorqoG9bCSY6Vwv/PNXb/C?=
 =?iso-8859-1?Q?1Sy7/HcjZdXRfZrOi5kGuY3Z+JYfwiOr9WPihO9ZJbIle0UTfdslQHCTUe?=
 =?iso-8859-1?Q?RS3veEZ5Suw1tLyIdF14B80rdw4l4wSBM3ecmVohlA6YTqSD7L5CP7HN+t?=
 =?iso-8859-1?Q?gZSVMcI1rg1nFNz9yZ3X/Fd7zonyFnY/fSUsRcdNi7U0g2Kq2Ar36XE2Vo?=
 =?iso-8859-1?Q?rrkxhU8KB/1Q+Irfr7TOGq8D6Y8obAKcoPAKi1kEXN+FNcstPZQ+SJ8cZe?=
 =?iso-8859-1?Q?rJDkOVGbvJefOuNkCg08ee/cpsgfBdSPE2XuqKVbPTenhyZ4a63hkHxiSW?=
 =?iso-8859-1?Q?qtnsfYPacwxacPzzykFZS1Xip3z4Dvzx3I6I0pWXNxJeig/5UhrcMrhOuZ?=
 =?iso-8859-1?Q?2M+fIS3Jym8v2k8RJN1ex6dZ04cS1ftuat26hGNEHYiXbax8fPRGVv+Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2668ba71-4da4-43e7-5c37-08ddd0169703
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 09:42:39.4946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8mhdvlPzLEuhV2y6hc1Mae1N36EARaiwpwgFSmw7ig0F/kO9Ghd1k5BtlZMxvUbHrsldbukyBQ0luAMHyDydHMnGVhwXWAAYfuF06N8MQFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9863

From: Grygorii Strashko <grygorii_strashko@epam.com>

Existing users of kernel_probe() reworked to probe guest kernel before
creating domain and any new users must follow the same approach, so add
assert to check that domain was not created before calling kernel_probe().

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/common/device-tree/kernel.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kerne=
l.c
index f67229f66d30..445a521607e0 100644
--- a/xen/common/device-tree/kernel.c
+++ b/xen/common/device-tree/kernel.c
@@ -128,6 +128,12 @@ int __init kernel_probe(struct kernel_info *info,
     u64 kernel_addr, initrd_addr, dtb_addr, size;
     int rc;
=20
+    /*
+     * Kernel probe should be done and guest type (32/64bit) detected befo=
re
+     * creating domain and any new users must follow this approach.
+     */
+    ASSERT(!info->bd.d);
+
     /*
      * We need to initialize start to 0. This field may be populated durin=
g
      * kernel_xxx_probe() if the image has a fixed entry point (for e.g.
--=20
2.34.1

