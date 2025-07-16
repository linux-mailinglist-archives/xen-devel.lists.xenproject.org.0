Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82877B07672
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 14:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045156.1415209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc1gv-0002wz-AN; Wed, 16 Jul 2025 12:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045156.1415209; Wed, 16 Jul 2025 12:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc1gv-0002uK-76; Wed, 16 Jul 2025 12:56:57 +0000
Received: by outflank-mailman (input) for mailman id 1045156;
 Wed, 16 Jul 2025 12:56:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nLWN=Z5=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uc1gu-0002uE-Hp
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 12:56:56 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59679483-6244-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 14:56:54 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS2PR03MB9813.eurprd03.prod.outlook.com (2603:10a6:20b:60b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 16 Jul
 2025 12:56:51 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Wed, 16 Jul 2025
 12:56:50 +0000
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
X-Inumbo-ID: 59679483-6244-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEhuZf6QOvZWgLRCCH5nR2TTwu767dJLwUXdkmOqTzhbdrwIQcTG6ogvVCZcAcDPjPtGTcZ6FisHpLeIwEtuV68rXToynljVwislVFyaeBjFtx0t50zig2ZMBnBU0ptJ+L0gil/NyQ/OVvLnYOhF9Q3EjohPwyRhpWlXul8jg4ijGV+5zRksYfXrilddA39KXrw3U4SQW3nWBihnqP0gwDj5gotmfNu3wEQZjduknzDVndmwBtFb5+ah8OMH2rhWCpE0HIE5C7Xj+NKRR4MKd5zYZt/bYzJqFHe3q7MuqE7i9yptMnZg80PKGmZplIrcA0KHDsd2qKKe0jmGhyx2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2z6kbeGw1rsXRouFac/auiCtAWgswobtyGX+5rNt5dU=;
 b=YGI8Qasaj5j+hkZ1sPUdI2NMCep7+lEf9ZtltlGA4hA3j9qQ7L0LEeQ1LXz5IJlnz6h2o4TXh0bWZB+wzsqm3y8gEz/5gbItNr1vNnH+QSmTc/EUJcnTe8eHkTy3SYposNtQiWZgOpvC+H9yqP5AENfWbDJ1t2rz6NBmml7i5vFwr3D86HjVINP1+BjTnBOtD1rSYjuKRPap+GRpafQpubr4ppFIregP58Syh15C+FgpW6sG/IRaLeo7YRHV39bdbwPxHI+RbCmtBcyfgpWgOIEPhDJieyl7K3lrNEW+ILI0B2yYg5OPUWy6IiG7FbEOTo1EsNTrKTAkMSMxCipD1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2z6kbeGw1rsXRouFac/auiCtAWgswobtyGX+5rNt5dU=;
 b=LQgg+54frPtXz2Q1ZBx6qrt+HCpLLnuG0/gukeCXjZv02uoc+SD1N7szEPRi7xWh2pAfdf6caOKjzZNRgMNY5uwjqmgdNbCCQjaqRzvJSvqFq5y5EYuoOIVYl+Wp+HxHk0yhYrk/uytWBfwk6U1gQb+l6sulZzVy/YrXjhiVKVfid1x7h6Ds8lmMYFUWk63cqJx81KDYEh/aHIUHbfe1iC3uIU2nf99OYIplTEL7odnrOkc0hMo059tG/xuHmgwLGivEWRHB05eJ1JxTki07b3+dpTKE+ohKtjp91Q0wO3MUsDeT8pjlW32CeioM+UMiNDV6jk72FcznUUb3/yFcAA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation/eclair: upload code quality report artifact
Thread-Topic: [PATCH] automation/eclair: upload code quality report artifact
Thread-Index: AQHb9lEYwGCRPRkK2kiiTUs1DdPB3A==
Date: Wed, 16 Jul 2025 12:56:50 +0000
Message-ID:
 <d805538bb4f0f03286969cc5f04fcc2252c10d0e.1752670553.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS2PR03MB9813:EE_
x-ms-office365-filtering-correlation-id: 2fa023ea-23e6-4a20-7359-08ddc4683b68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ME1f0aYsifNc2mVGwGCT8yN8UUTxd33MUNbW3ndep7fpIrKq3DRF7bXwp1?=
 =?iso-8859-1?Q?P3FtsF7AD9+0u9axzOqQxWlEBuAe/X0wdErOfJFJfPt4y1X5p7C3O/bpGx?=
 =?iso-8859-1?Q?bHOVaKQWqMSqBpzFNgVpbKtfReZuEknMqQhCzK/uLlM5yftOCi9pV6uFYa?=
 =?iso-8859-1?Q?VIUid/g6fXuo2qhj5EjVruRT19nU1RSy/mOVpq1mxvCidkiyBsjU69/EOw?=
 =?iso-8859-1?Q?0f/xNo6qhPSvdkcPEltnZ5/q0Z9daC2yIO5W3CyztX2gkU039XvpiRhm6B?=
 =?iso-8859-1?Q?47SoN5i6AKFxxinMRDtNPtxE8TYAT0omrrcJJKU0A5TmbYQPlRrT8Fxn5R?=
 =?iso-8859-1?Q?XNtfV8hvY/aooELHS4ea7GwwNFANNQCCyZZDbVL5JJmPcwf2btMomNXoNd?=
 =?iso-8859-1?Q?fYhfNzkSIUOUfp56AUqR6+okSqK+0AjJZ087PtXNL2HCRiU6G4mUTM159c?=
 =?iso-8859-1?Q?CaPt9uHpw8KiUf01G/5859XE83K6/nMPvOnMwifIRwKbpHu2PACp93RL2a?=
 =?iso-8859-1?Q?ko8rDDOF9EY0Hw5yD5szfZGftBUp7deh9Emiu8e4q7aXFQX+zCORGfuppL?=
 =?iso-8859-1?Q?cKuGSO9vVO0G0JkU468plZ/mPKi8BDOvKbEjlIZBcwfIjnpqJThSvxNPqs?=
 =?iso-8859-1?Q?kJQkWe2naU/zt30d0KopVlI+HWGUxiqXumI/YtuzLJTlwI0uqFROE20M3t?=
 =?iso-8859-1?Q?WeJ6pcLLkb8wRcl3qSSiTFn2D8MV0fuifIznk7TuLjT0WTJu5byQsEPFgg?=
 =?iso-8859-1?Q?kPm0H4rnwPInE6mJqB0oIckmxwXVwDw0Lp1QP57eyA5GDe1BKe58WTXTI1?=
 =?iso-8859-1?Q?H/gWBfaVcmophQnFODdqJiBRdGfy6R9lHGp/GKKFV8GNkd1O5bHry3ugQ/?=
 =?iso-8859-1?Q?3GKoF6KPEHlnURIheXTRJ6ic8Cz9K25jyf771HNrOdSENXMq5Htcjn80j+?=
 =?iso-8859-1?Q?4HgG0mpGzaMsV6OP9i1f1ad0cvz5iOy58RvWApa8Ay2Vy5JHQg0J+yy7hi?=
 =?iso-8859-1?Q?e16Li6zMpXdti9XIwlWymUR5vvxhiCNQkBhhXMwX6mJ/nFcow7YN5OPILF?=
 =?iso-8859-1?Q?j3zq4vwRZ8GelzTB62mLV7nU3rjT5gTSrBfbb3m+TQMdGSSAevOOSL5c5G?=
 =?iso-8859-1?Q?ydSLAp3sUHlnYPeTK900+KwWRk1YfQ8zX6Bi7fF+oV7Pg3NG68l1hNCxz8?=
 =?iso-8859-1?Q?d6QEhEh5hVmLqQzTtKUae1HeIyRHHry8eJn3Wvsaf57zqbKUFJNbaXVOQ1?=
 =?iso-8859-1?Q?AXNWqbr+51fcYEiN1j8W94RzilzF61k4m3WBDlBD5wO+15fGf3AVvzpjBz?=
 =?iso-8859-1?Q?eOgXCctXamq8pDkPOFCE5pq5Nlk06RNMMLia5nzDINr5dvOtCa0UlpRsBI?=
 =?iso-8859-1?Q?0QneAUulF5BbE46RcIVA+Hz4KRsnlssVBOVmCnFDqNzmnRIl/e2mV02HPv?=
 =?iso-8859-1?Q?a9vACBlxsjiL63rtmpBUH1UmgQWUs3Nqncd4mtHReXeMtHjcfwfWvv0i9I?=
 =?iso-8859-1?Q?pHnb69lMx5cV4gLm0eEK4cRUC5K5CZ+VJPwX9DYDSgfg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fsG2MXUfZp55nm7VJqYzWtzDkcZqx6fE3Aqbb3P+1FUwRt4s/fxm3u6Wpf?=
 =?iso-8859-1?Q?w3FOugCrR9KxrQ3C4J0TEkwAfcwK7g2SeTtBbu1gVG9WcvCfemx3sONFr4?=
 =?iso-8859-1?Q?pkIb5q6vPwhX83to6xbcCzocaCoIPVKW62hWxf8OCE9PgvG6M4ncw1uhaa?=
 =?iso-8859-1?Q?5RNWfLzbjlWq0UGVQiOKDVth13kmV8q1ZtW+T1oZ2/9W/vJhnKjXWa22e0?=
 =?iso-8859-1?Q?ov4NALZIpDHzRPGgEbQK5EsBJV84JDc1KSKOalZebCTetiaZ9NFjEVucCz?=
 =?iso-8859-1?Q?NQaLomEvxQ6Z1hkcpH8TVSDFVNFA2uFTdtljF6wLpRj+JgalnUAoRJDXhw?=
 =?iso-8859-1?Q?9aLRjIn4TlO3Lpt7kb9ueCIF968yoaIx3fyYCsImnNrIaRxwTo76eQnthv?=
 =?iso-8859-1?Q?DjDNsXSg9a0p1iEJR4DZCvmKNbNRir/aA89Z43/TMR9ej9mfnQlc+Xgus+?=
 =?iso-8859-1?Q?ampNpD7FoLrsRJIsj2G3FxyKkXxBYCdG0aILVe+XChTNt/Ao2Gcgd3xRKz?=
 =?iso-8859-1?Q?bPHwN0aCvpe+PvUq5D5EvrTLNtn1zoRfbS8kE+15yleoWIZ8W3XeFAtyfx?=
 =?iso-8859-1?Q?G8qZwjZ+9mtM1jlhuQloZMiBFf/LdjD4rc5C2hKALMAIJaIaNq/VC2B7V7?=
 =?iso-8859-1?Q?lfDEzMJuakCVxrIlPCIX6fqcVxnV+wuPlv1TQUhspAUWAP1a9b0H85iPj4?=
 =?iso-8859-1?Q?8Y2maWnALgswtWxgQ6/cs7PV7N234q2BWgoUfVD8GZQ182ruwuFIBRxUqT?=
 =?iso-8859-1?Q?3zZjWETsa2JbmPF7RBkc6VZqA1QprA+dcpdqIHysqp1E29OZMpx1PauEl+?=
 =?iso-8859-1?Q?4Al9+Yhv1l8WEvuhnpqAznNaV5XfLYAkDgXU09mFp3DQC6niqiDtJ8ELEB?=
 =?iso-8859-1?Q?yIc2dTYcgD83gGJdIYkeUEBMYpFMUpuq2tT6635f0wTe1CCpgXKHomrVvq?=
 =?iso-8859-1?Q?T0Nnfo0UMqrRmQnFQCJ9t52Gob6+XAB0LXJ9BoiDYBzo36FTtNsZrzKYKp?=
 =?iso-8859-1?Q?aY+y3dq2qxnFelZQUZQya4XW2JI/TTorvF9Lc+UvPreWTUtqNRWDBg+qwu?=
 =?iso-8859-1?Q?IAQMOWEloow0RDTJX/O6Qy+WyY2ZuJJtlrF8cgY+InUB7wzni9Jiy+qHuS?=
 =?iso-8859-1?Q?1nxxlhBQ0b5aSTUCGXRI/GPSuhjtXVZdb0VVVLNBuXJlKCRLh0zMZ0HvQR?=
 =?iso-8859-1?Q?uoV0JUHJaHJ0kxRmUS+mlxzHA0fMsnhms+qHDEdiNh+/NoIJZbVb0rD4sd?=
 =?iso-8859-1?Q?Xu7YoTbKZfsLEMi4jfZsAcB+ikDrL2uYyUbSMyDdW0uXxs+4alsvdWM5fw?=
 =?iso-8859-1?Q?2mZPdVyI2mNgZFmE9mkm5bEaX2p/yMSthkPGegCHFuDIhcevXT1+kG33aI?=
 =?iso-8859-1?Q?fT+KHdrefn4rGEwJ7RhAgeTFS+nxRkgMUsUKLKjJxl+UD7EcNyr1pfMXpj?=
 =?iso-8859-1?Q?QEW96Wveg5DRq6Xt4nij3sgIqm2KvgictmsimlRXEioFxBnp/rbxRCuM8i?=
 =?iso-8859-1?Q?M+PJYIgOPfJAzC+zMv7GKJv+atS2DLYK/W1A9fm6Q37g+JdBeqDjAC1ouQ?=
 =?iso-8859-1?Q?yvtrmYl6sUEMfKbDqbY8OijJIUDthI7qmmwTYoPHdEdKApdbRnaI0pjxE0?=
 =?iso-8859-1?Q?yCjKMkKunnTIGzA7KWNbZr10f7gxwgQyIlvDhOi8AA/I2mOZt2YOnwgA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa023ea-23e6-4a20-7359-08ddc4683b68
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 12:56:50.8339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6YdNXoA0MA63DC0GKeusj4LI14ABto7v9Imuww88UVaeBP7I1MLm+mPw+XbWwLBcACGfvV2o4pTaB1ted94auUJ+2V11iZvO//UpNC/oHwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9813

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 automation/gitlab-ci/analyze.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analy=
ze.yaml
index 9102362601..d507210067 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -17,6 +17,7 @@
       - "${ECLAIR_OUTPUT_DIR}/*.log"
       - "${ECLAIR_OUTPUT_DIR}/*.txt"
       - '*.log'
+      - '*.json'
     reports:
       codequality: gl-code-quality-report.json
   rules:
--=20
2.43.0

