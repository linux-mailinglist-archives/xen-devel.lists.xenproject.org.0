Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4F7B2C4E5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 15:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086593.1444794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoM9B-0002zP-63; Tue, 19 Aug 2025 13:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086593.1444794; Tue, 19 Aug 2025 13:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoM9B-0002wR-2C; Tue, 19 Aug 2025 13:13:05 +0000
Received: by outflank-mailman (input) for mailman id 1086593;
 Tue, 19 Aug 2025 13:13:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1y2Z=27=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uoM99-0002wL-VD
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 13:13:04 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bf07732-7cfe-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 15:13:02 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DU2PR03MB8008.eurprd03.prod.outlook.com (2603:10a6:10:2df::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 13:12:59 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 13:12:59 +0000
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
X-Inumbo-ID: 3bf07732-7cfe-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gR5A7h9/YP2PSK6jiwDC2CWlrrn4u12SEMqnTCayGo41j2zNnHD7M5YEuNLUvbEbwVIpf77UFbZwUC9VQB9GNfG+e9jaVFeget+SNL2wEbA3Aeyrq+eN1sBSBTYiQSfAngVvRgomgUr466GvlygWW2Q0LgdA8scOECEGwLiEER07u6H/5gqlR9xPL0KopTZnD/VjWGEpRAJz8l62YkVRjTF2VM23sard5j6wb3/Wuq8XrWuCaurh+eGaXBVzknxHyZAsAMj1FbokQzD/wLwjO4kJOUm8l7f/7FH5RkhCzil0ta1QL1fbimifUnBva0EBYM3U4SVXM0q+0dmXwTflRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPZxSKcQaWuKR5coz534mrGqoRFpYRqP222CZDriAyU=;
 b=Y06dDKw20JVaKtZKQa0sAyDNhHVrdrki19oq4TlqabShxI2asqi8AEFMOOVzUCg2SthkogU86oh8QxYI8JNSof4qSr5exIRekR069h5dZXojDoGDXfjlKdUdavNcFPV7lOrqRNOMCRozSFN3/5eZHhERriDStuCwcmit4Z0gtJE3kI/+JH6uKHt0CaenandkJ5AklcIk/diyYwn4etBE6JPTXblvL9xe9/IZ+5lS8rVipZKOea11QssoyAi4HjX6PqDcpts2NZkMLqHGPx1d6atl/E7atGy+ISxV90o53lW4xWQF4LVlmVg4FVL0Cy+O1r0i1Tv3/afcSFyE8Tn1qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPZxSKcQaWuKR5coz534mrGqoRFpYRqP222CZDriAyU=;
 b=vEFLkfWZrGAzTdE+5+gJN2tTmaXJnCqRakQnwj0z8cCfdcbbyMEkCrMhE501iXaMPZF9jo60vAQ8UvDFx3zB5wUQN8ATfRJhYkXYC3nKdpzerq41q254m/Fgdm2qeEitk3sJgDjJKeuRQP267yoJJ5I7E2IbtzbrvfMjwUrx9LHEMcXJQntanV/9b3rd67Au5smesDNDfUQ538y2sXYlENd2wixGu/WPYxXCueOe7I0C7HxoaOW/uu2VovblOCRVzvgcfP9NHLpU+x4Su/zEQGJLV0bhsNHJswGAoAnZK5iCJwgK/6NzAynNEjvjQXYrZFVQjz5sQD3A9VNYrDzjmA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH] misra: add deviation for PrintErrMesg() function
Thread-Topic: [PATCH] misra: add deviation for PrintErrMesg() function
Thread-Index: AQHcEQr89D/JS5GCrUaBbORYWk1wAQ==
Date: Tue, 19 Aug 2025 13:12:59 +0000
Message-ID:
 <5944d87aae330246b7dab6eebd04d5d71a7d7e8f.1755608417.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DU2PR03MB8008:EE_
x-ms-office365-filtering-correlation-id: 193ff3fc-eed0-4ce6-b88f-08dddf221eca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|42112799006|376014|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9fWbqyJiY8p6qQed305aKpMnYMmY6eg28PCz3EN5eXmUVKJVcnTaQQrQzu?=
 =?iso-8859-1?Q?ZWmxvHqylXQcLxHnBP4dQhcIn/4jkTK6yzLZUXvQETbajP9LIwDHYS9S7Q?=
 =?iso-8859-1?Q?X8umaj7+9yVtZ9FAr2tNIfHHBvSG98Qm0Z2UY12AyLDL6xhY3v9gE6nRX8?=
 =?iso-8859-1?Q?ySAUB2+UaU/ObnR4Nhg5RXvtyVDUu8VfTluiC9o8cprLPpW6e1I9gmzqXI?=
 =?iso-8859-1?Q?3nW99yDlVbPDCP6JfBK2/u7CSLRsGvyT5GZwTsW8BtEI+b9z4H+NXwAxam?=
 =?iso-8859-1?Q?kwsiAvJXYkfrmKe+8aNmoGZdqIh8bFnOacTyFymuOqg/nNGxi1zhEN0Iqr?=
 =?iso-8859-1?Q?+UOLZ2ZoET0ZtfykdA8x9KRA4LC48qQeZv686t2xez7KqahFdVxLMSbJdY?=
 =?iso-8859-1?Q?XUSmBNBkET1tkM3cz+ngPGcJrVPmbPq1sHdZaxGafFRuA1UXoeXt8tt4Fe?=
 =?iso-8859-1?Q?5tD8x64E20ch2TlWlKB+b5BJfeAQeIAZ58UWQtLK+zpileLFhTLUK4VgrJ?=
 =?iso-8859-1?Q?p3TxqEExtl5A5gHyYtrQryCUuYupo91vJyPn6nnzTvxg29vZD9PR+v8shw?=
 =?iso-8859-1?Q?BVIMBzkeBl69eGGP8gbfOphICgv1sNdAqXtvIGsdJxB+7YAIbi9FfaJDZq?=
 =?iso-8859-1?Q?7jTsmjBdxQCvPABy9qvScDwl0hANDcPXX/C77NDyvR/aAoq9lsxNeu5Pes?=
 =?iso-8859-1?Q?pOdoztX3tfrQG0KchiPCeMRAdcu82SmPdrF9LtYFLbKQCpC//yBHhwUqml?=
 =?iso-8859-1?Q?zEU/dsyX/p1I0cMZDzGURHH7hkYqEPavce66AwFeOIx1vIE3paQXD2Nmnq?=
 =?iso-8859-1?Q?HENlDtfR9ve/hzE/mzwqRUf3x0MlQ4yhoVCBIoiUVuZX16WXAMznM0QcE2?=
 =?iso-8859-1?Q?K0P1HUKh6CEQMrWcamjqlIMVO0RCm7L9tZmpha8osq7/NnNUVbvc4gIyzI?=
 =?iso-8859-1?Q?EWjh+yA1BS7kYvLsTsUyj3ZGR83Tt4jfMtOPCT7Si0OG7ZLFhnhh39O2Te?=
 =?iso-8859-1?Q?sin6CFuw5yHAyJwA3KNkBZp8uFPTNm0w8wJKsMLGNATS6XaZBPSRie82Ai?=
 =?iso-8859-1?Q?MxwKT1Ggk1X9SUIl5x99lAggjwQ9NE0IEeqwiM4d2hDoiGMpvjOuUBBr0L?=
 =?iso-8859-1?Q?iUFO7VA3A7YT3SseS2fcra0kDJJIrL3flyhMr8jk/BnP/5qMfSN/uaq2JO?=
 =?iso-8859-1?Q?8mABlWDqhBQpoqjmIYMVYCyB+ux8Kbfn65qNzMjjLu6hBwtQAlGH1rBLGS?=
 =?iso-8859-1?Q?YwYHBHA8i0nPRtkXo2ECqFUWsZndM61VOKjI3XcfVfNwv+QHHRK/qP0kNl?=
 =?iso-8859-1?Q?0yI95zhzlxL0KrhVFFDjURDBv3isqqirBIV0FCQ6W+5OCTi+rSiLpfN1oO?=
 =?iso-8859-1?Q?bMhNDEjP5fMUWtR3aTouCPxU3hu49CWPdwQEr5S9jce0Y0thDcbkhCcceT?=
 =?iso-8859-1?Q?ICNnF8GANyPY6FsZhbjePEMh4b1piyksDqke+wtuyeFyQAgEUhF4HXfumV?=
 =?iso-8859-1?Q?0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(42112799006)(376014)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QUAM4rp+QHXW6lUYc8h59zd9lExpovJ/PlxBzbYdf/cKgN1YvvSIyMz/cP?=
 =?iso-8859-1?Q?GzEo62r5M4jlt5EZBHL8WRF0qi+U5vfSliXNDzXY9kNbHkN+mXCJtxLgs2?=
 =?iso-8859-1?Q?xBeKpKrAm9XWVIHvZ5WSmD9Q8uF6wIfjpXCIl6jD6zrJBb1M6MZn6sIX34?=
 =?iso-8859-1?Q?o3dfX9Q570I0nnvG2ITqYQd6dg5KMP7YMyhF8hFtfhesjRUsfla1WPxX0g?=
 =?iso-8859-1?Q?O0wuRS0Nbz7VzW4ypbtszMs5TlZb35J8q6Z7LpuFO7IOj7fkUtor3/ANCV?=
 =?iso-8859-1?Q?RiYjYrTQLf3Z41cR+TjAZxx9GZ1qTjYFe0ER3nBuGPap73upA4QRPzEb8X?=
 =?iso-8859-1?Q?UqxenITGv6WH4FURnjqJJj1VizKSJSr8B/ly2HG7dpP1AmiJRTyVp8tJ5S?=
 =?iso-8859-1?Q?zJBTWSHkrNqyQik0P1kOdqplidO6ouikNb/5q+qyT4MKg228pBpXPCssKs?=
 =?iso-8859-1?Q?fvZjiZERu2XvZNgTdX+CruSzUlg0nT29IvGrPj03MhkI7s6HdiMBEHY/1M?=
 =?iso-8859-1?Q?9fhiVDcTxg3JdcYuBi6FPNr2uqNS8b2UgIsJWnhROrMX/mG7iEahySMaag?=
 =?iso-8859-1?Q?58pZ3Te230w0lAWn+80h7uCUkn94RpLIiBKyaG+LJl+sLlxkZG686Sz2gq?=
 =?iso-8859-1?Q?JenrVHR5o0upfycTibw0X/doij96KBToxhVkP80t9+TU2mv24Vp6Vh9fmp?=
 =?iso-8859-1?Q?ELwo6ISdOWd40vhDclK7TCjPpGiUJqsOM71r69AcWejHtSZyOVn/tkCbt7?=
 =?iso-8859-1?Q?MZIfBmAnufNsm5irRMmqmuiD6Ua67Cb1C2n9+ih1GcFiHAQCClLmhoUNbY?=
 =?iso-8859-1?Q?PJlldjykM/OKPz+ze5CZ9RJyNUc/wy8Mr02ZcJwjYvmuS8tRki9o9e8I9G?=
 =?iso-8859-1?Q?j4ZwIzI15sza1RQJ2I3591GTl7LCoXFGTGpKe7m7NxN9oPOD00DxB+nE00?=
 =?iso-8859-1?Q?9EICHG4KVartclwbH1QG5Fs0AXaAffEg4oDAW7+hEmVTWJpAQzi9Vt0LCi?=
 =?iso-8859-1?Q?YqNfCqXZYBz9CU5q9usSHDn2gVMsPgYN+qArmnm2HmU1Hv7uYcoVhrxFvB?=
 =?iso-8859-1?Q?dcys9t/vpINjHk3MRYhWN0P5uJuXT6/ZmIsOLG7EvuXt3d0jF5inu3pTBe?=
 =?iso-8859-1?Q?9eqN6t6RlQdHsfbLZwAljRNMNuQJzktbL1gF9B+R6/Mf46s0/B+9DLuyzb?=
 =?iso-8859-1?Q?etpM5rXmUUGSxZwy/yQa9+fdurzr390CkPWGARtrxjKjC28YuUIV8hjijR?=
 =?iso-8859-1?Q?OxoU7DJv+kq/3CZlfmLJSvREqzd6xrOyxj5rp/+lPSsoc/grNjnGNLj2ai?=
 =?iso-8859-1?Q?uFMhNowgFcHmbGNXiAgWrBwQ2ZkdG1ecDiysd9PhlWZ3KRUoG83Rv+oWD+?=
 =?iso-8859-1?Q?Aku7uHFL5b0YGicceFcrJGfo0KAizk8uSh7/AZzSETVDg+2/vHU38JHbOM?=
 =?iso-8859-1?Q?etIHE8ccGLJPZYSQfHF+RIX+nvKKOWDj4EsrDYCPFZLzlFJG9E5P0FEVxA?=
 =?iso-8859-1?Q?8jzZXEeKDOZ28S/h/nvYwXLmZr/eymdnB5birKFJymB8IEWg1dFN1Ovyzf?=
 =?iso-8859-1?Q?W00EKR5170/zRuuahKrUiN1fFCNqJ/H9zx1GmLfQ+q28ONqLXggaSn8KJe?=
 =?iso-8859-1?Q?mn8/B3ojDgphInLUlj80PRREGbFu2tATlzacbanfyceb9dJUL1lStUiA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 193ff3fc-eed0-4ce6-b88f-08dddf221eca
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 13:12:59.4758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WtKZOLcUpkJYjVT2ry01IEaHXJ9p8vtuACe/KxYDgITu4gW2CiCM7YCX+8D6qlc1X2TO/RQReE6LTYCqztmgGFuqYiDrkurRruYAV+W+MFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB8008

MISRA C Rule 2.1 states: "A project shall not contain unreachable code."

The function 'PrintErrMesg()' is implemented to never return control to
its caller. At the end of its execution, it calls 'blexit()', which, in
turn, invokes '__builtin_unreachable()'. This makes the 'return false;'
statement in 'read_file()' function unreachable.

Configure Eclair to do not report this violation.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1991518214
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33..5c262aa5ad 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -41,6 +41,10 @@ not executable, and therefore it is safe for them to be =
unreachable."
 -call_properties+=3D{"name(__builtin_unreachable)&&stmt(begin(any_exp(macr=
o(name(ASSERT_UNREACHABLE)))))", {"noreturn(false)"}}
 -doc_end
=20
+-doc_begin=3D"Unreachability caused by the call to the 'PrintErrMesg()' fu=
nction is deliberate, as it terminates execution, ensuring no control flow =
continues past this point."
+-config=3DMC3A2.R2.1,reports+=3D{deliberate, "any_area(^.*PrintErrMesg.*$ =
&& any_loc(file(^xen/common/efi/boot\\.c$)))"}
+-doc_end
+
 -doc_begin=3D"Proving compliance with respect to Rule 2.2 is generally imp=
ossible:
 see https://arxiv.org/abs/2212.13933 for details. Moreover, peer review gi=
ves us
 confidence that no evidence of errors in the program's logic has been miss=
ed due
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 2119066531..8df3c207ff 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -97,6 +97,13 @@ Deviations related to MISRA C:2012 Rules:
        Xen expects developers to ensure code remains safe and reliable in =
builds,
        even when debug-only assertions like `ASSERT_UNREACHABLE() are remo=
ved.
=20
+   * - R2.1
+     - Function `PrintErrMesg()` terminates execution (at the end it calls
+       `blexit()`, which, in turn, invokes `__builtin_unreachable()`), ens=
uring
+       no code beyond this point is ever reached. This guarantees that exe=
cution
+       won't incorrectly proceed or introduce unwanted behavior.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R2.2
      - Proving compliance with respect to Rule 2.2 is generally impossible=
:
        see `<https://arxiv.org/abs/2212.13933>`_ for details. Moreover, pe=
er
--=20
2.43.0

