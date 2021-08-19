Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 615363F1766
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 12:39:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168533.307703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGfRx-0004AI-Hi; Thu, 19 Aug 2021 10:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168533.307703; Thu, 19 Aug 2021 10:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGfRx-000485-DA; Thu, 19 Aug 2021 10:39:05 +0000
Received: by outflank-mailman (input) for mailman id 168533;
 Thu, 19 Aug 2021 10:39:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S1mW=NK=arm.com=Jiamei.Xie@srs-us1.protection.inumbo.net>)
 id 1mGfRv-00047z-CO
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 10:39:03 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.64]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf80f67a-32c1-46f5-9682-d6ff33c716c2;
 Thu, 19 Aug 2021 10:39:00 +0000 (UTC)
Received: from DBBPR09CA0031.eurprd09.prod.outlook.com (2603:10a6:10:d4::19)
 by AM9PR08MB7243.eurprd08.prod.outlook.com (2603:10a6:20b:432::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 10:38:58 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::4d) by DBBPR09CA0031.outlook.office365.com
 (2603:10a6:10:d4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 10:38:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 10:38:58 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Thu, 19 Aug 2021 10:38:58 +0000
Received: from cc47cea1d179.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 53AFC11C-4D8B-42CF-960B-E583DE1AFEBC.1; 
 Thu, 19 Aug 2021 10:38:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc47cea1d179.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Aug 2021 10:38:52 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com (2603:10a6:803:3d::28)
 by VI1PR08MB4110.eurprd08.prod.outlook.com (2603:10a6:803:e3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 19 Aug
 2021 10:38:50 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::a931:b3e8:a3af:3a67]) by VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::a931:b3e8:a3af:3a67%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 10:38:50 +0000
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
X-Inumbo-ID: cf80f67a-32c1-46f5-9682-d6ff33c716c2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoCj1wwPs2hEM26IIYkd/0xdN5zLl4laNPR0ZuLI+58=;
 b=WBA63obilaMkDQxhX7wRXWq3s6/0yFMCQacgi6K7qO+v9W5SsWHmoNNAQz65UKoc2FuK625QmZaQCZf3k7/WDyaW0JMaGT4Zh+Fp1XECL7Rn4NI2zab14CQ1+Pc2FZwbUSloBITlG4jFUiJgMyKl2eexVdXMrUvyvgAEr9rYpYI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTgb8o8b8JEWChLVD7AgsFOwgmdl2iMe91DEg6K/F2/WmRY1jwJau/5s6djeQs8vdfUfO1X5XIdvb09nxhyDtrBgf0gGxVSf/Wc60Qqq5YvBQQgiXGhLePo7aZptjXiDxKWRXKsEEY56GD36AieMpVAhuZECIwHfazuqlBWq20m6W8Czi90M+5ivc+T//ku+5bqqjVCVqmCb2RvSrOIg6bAQ0Zgd2P3Yfnz5SSewUTLyX1hrglo4gYtpUS5faaCs7yNFipZCSm0/7KaR3e2hoBasBR/Bqi1VI/7IDK+2fpuHXEP3ZCixsogTGEL2Lxqkv8UBY0Bx+lIIn39ZR+1lLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoCj1wwPs2hEM26IIYkd/0xdN5zLl4laNPR0ZuLI+58=;
 b=NhKl+uqabBMQr4kB1Eqn4OMeyfdNbkeARw9QagXRJIcO38asraASl0GIFkVzf3iiy5a+vVpd89jQMnmUHws42NsO/Wh5IrixvNcLJLMFRjZ4p7c2ySs6/eRQJU+ng52TSG0isps9nW58x14yziIO7kmekQ6GWaN3dZwlixnztqdLFWssyhSkJJBp4BTVY2GVY0XWZLKYUaifZ9Dbmz2FBSt6ddTOgx1BlNpJZPP1bK5G67SO8KZwumrlv0FbDFAhlD/5BcFdFghgsqRpjnECUCgnSVlp+4S8rN4qo8kGUqv7S5OYHNukW06uPh2IyV238AfYh4qnTzPpv/ZSLKf3zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoCj1wwPs2hEM26IIYkd/0xdN5zLl4laNPR0ZuLI+58=;
 b=WBA63obilaMkDQxhX7wRXWq3s6/0yFMCQacgi6K7qO+v9W5SsWHmoNNAQz65UKoc2FuK625QmZaQCZf3k7/WDyaW0JMaGT4Zh+Fp1XECL7Rn4NI2zab14CQ1+Pc2FZwbUSloBITlG4jFUiJgMyKl2eexVdXMrUvyvgAEr9rYpYI=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, nd <nd@arm.com>
Subject: Some questions about virtio-net on Xen x86
Thread-Topic: Some questions about virtio-net on Xen x86
Thread-Index: AdeU5cKJ2Iuh63HAShmSu85qvWY46g==
Date: Thu, 19 Aug 2021 10:38:49 +0000
Message-ID:
 <VI1PR08MB3056C6F2FF2916207824CC1492C09@VI1PR08MB3056.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C2E780D59DD4A54AB0D06E9FB1916D26.0
x-checkrecipientchecked: true
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3982f261-0923-4e19-4a77-08d962fd8d00
x-ms-traffictypediagnostic: VI1PR08MB4110:|AM9PR08MB7243:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB7243E9E377FA8D00CAE23B8A92C09@AM9PR08MB7243.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1284;OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d1+lCAfiYtIdXhm/UC6XJ6PIGe4JoISzabxUcUIkhcBlTTiLajn4MxJcQhU9Bbo8LYBev500qrumWIK3eO1pGvhpi70gss0LEcjJI213N76Duh+aX/IjcGALBmAvY1MfEK31cbc9km6bHma1cxs5KV3yrF/dPRaz6t0gSAhbVpGW/NqKk8mNITjyM4gurkeN3Qr+btj4Wl+TJk1rvZfifSz2J3yUPaj0Pw8L/vDddNpks3HmdNgUtd1Mck48E7nVYgr8c6CBHWh6mM9Q4WgI0L4lVraSObskLYoFaUh9MmdEGCphwuHPGz3JZW2OoROtOf17pEhprx8UbO4qF7mu/QJFVdq075HkyN4BcIl0IWA6q3O5tR/kHGjbXw2xVuCqnX9KlYKqpHvQdNO9JJWWBZEe0eQGlUpvzq47he8azJGq2p8IqnRBt5llgaKtq3bZHLIy8p4zhWh4hT+LcnzuCwxCJJ2Emo1SAa8d4ayx6WdxcEtPmq/pjW5cO0FkY1aDevj96nPudBXQHz7pqiHD5APadQ2OSUzbVc0PFyFqZXYxWCE5SyTAA5pbus8HxyepFsReJmy84MG447dhW6STm5mdPHfNW+NEO11MpwOSXldrDoabNIu7Y+umRyu95nR0gKfa+tqtcRhVG/7e8ST1hUg10LyYB7Z4zKBx1G8kYNWdCS21Q9lKBq6+VzRW/DcvxJ7gqohQ/0xBCs0uii4RKrkA5bUZ3fX+xmI73iNcwqmKrpwsqa7c9nxBRJGzg/SAtQ7isf0OSEUbAGyIdeB24ytI8pJke7fyn2v4afjPauHNPJ5Y2gM47jp3CRd+9Ts9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3056.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(76116006)(66476007)(54906003)(5660300002)(38070700005)(66446008)(64756008)(316002)(66946007)(26005)(8676002)(9686003)(2906002)(7696005)(86362001)(66556008)(6506007)(33656002)(122000001)(6916009)(966005)(4326008)(71200400001)(55016002)(186003)(52536014)(83380400001)(8936002)(478600001)(38100700002)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wCTcLd/YKKLNxOFgzGIuPpevhiL8xpqEKsbn7BR6RgWvPPCphh12T7kdO34N?=
 =?us-ascii?Q?dOK22/xTXpfi7B8J6kEf63eSP+NHRP2SB+Km8tDAfzW6Lk/JF/jCS5E+KQgU?=
 =?us-ascii?Q?mV51uh3vW3Zze8MnUNWkbkhWc90dywsSPXd5ThBYd7vKR9Z3P0HGIeCk16rN?=
 =?us-ascii?Q?twmN1FmokB3GMpJFlqeFR9FDi6ZGsEBSxgYaxhoreNXe43BSK9EA2RLSVw66?=
 =?us-ascii?Q?c7r/LxRCPKqv4t9ZZfTufg8br2CBzM7A9OljeIwENSnFmNcaFjUDcLSSFCQc?=
 =?us-ascii?Q?hqtf11nE2l2H8vAlZ9wk2NUVUCJp6vsYhpLtGBG6h3PBpf9PK3lFMco9HbKn?=
 =?us-ascii?Q?5uMafVyeaLLucnx4jl5YE3XgWfLEY9U/fUrVD/XUouF8fZV87ZLRZPo4f2fq?=
 =?us-ascii?Q?Ls/w/PKLD6BmicDY0pqqLTaSnz/5pEuGbHnUPYJPtrZw1R7w9kpU2iR7S3ke?=
 =?us-ascii?Q?49CAgIom0isW6P1U/PVJdD+BiX6uiWcn4xIJFUwGm2sOszrxHUptltSF3jNL?=
 =?us-ascii?Q?c65d/hTG4svUK8m1t0bNhuKDSBuUsDIqp+eyf35NCNxlNHt0Cmc39I62GTFc?=
 =?us-ascii?Q?rf8kjFlkdmnbrLgnOJX74LLEWKYE5Legjwsl0Hja0Fjx9xS3uzhqTYiWKwPo?=
 =?us-ascii?Q?YmemqbML8NxH84pW4zhhrDganEJHqvzGBtCdCn6hXtIErlWMmOkI/GA2PQJw?=
 =?us-ascii?Q?XmcYFYl1AK2EnWtLyJCkWTWS9mwHyMos0pxW8A7B76ZRo7dlCkYfyGC2VBfv?=
 =?us-ascii?Q?OGvgVBj9ANirgPXY6NXZhlRyOYMqjVqehilMCg1clfE53poTrBVPhkGt81jQ?=
 =?us-ascii?Q?eOghO1u9KEDI0AXhM1DWFwyETOs/gt3Xr+t8+nAPVmARbW2vXVMhjwtFLZFI?=
 =?us-ascii?Q?MCqq41JJop7xKPinknLJpAieE3zMCnvG8A6SIjAKjq1Yi78WY+pNB9soW7nG?=
 =?us-ascii?Q?B1z3pyNHeZZy/2LC3ElSX3kAWsk/srtkXFwCjgHVDaYVqMvbrcdKH2HZ2QpV?=
 =?us-ascii?Q?r5ieMtcYPbYJvYPo6dyQT18CSJBNC/23QEx+mKmCXTIXXqsxsRBRsGmawJWT?=
 =?us-ascii?Q?5/zbFNdy2+4oWLUHeVjWh/lyukdtlZ/Yf9ZtsduWamsPIQbkbz/Q9ETCt9P7?=
 =?us-ascii?Q?mYIkTA7BZClTekvg8n1QQGJ0wqdfbKPHhWG/RDe95GgeLH4dM/xfrhDN0BC7?=
 =?us-ascii?Q?TpXAUvbAdDxH2hZh4ljiMnkZTxi/fImdmXLycyX0+CuzxBkn+go0LfuI0RKS?=
 =?us-ascii?Q?EvHHzLG533FBJcEq0giht5tAM58KAR03CvSsMZRO1NcpsZIlcpsanliPxSbi?=
 =?us-ascii?Q?RX9mRTTp3n4WDrKm+ML/XfjW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4110
Original-Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	630f55ec-70dd-4566-4d7b-08d962fd886e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	958/mfdYQV1t5+ipEXvKOuwU57Pk1cDZn+KoXq3N7xAariRE7R/nLmHw8CRhE8vcavATCHzHtwJTluBnFLiliFfNIi+8kgHPq0LgQFRHT/dF8zl3J1c/rZM/gj9OHnK8w5zIkvLY7/p0N0UiNtd8nHh2Jpf7sNO2oDJtlqDCwwEIVcdRXspGreM83tXbLr6L3x40U4WZMSS0AhyBIJMoVGMRh8QfqjD3qkkCu6nZY0QRhIySnOu62vmvphhuBa4QaVKmrN9z2lbZ99fnlxoBHj2VtiWG5umdGgAIE61/Iy3W1d4xzDmoRJEcgwYUPy89vLX0xfQEnn/p8CZ7oZqRkgddfoNVGSSTt+yYWd+p8xehIAYDCUNBIf1Qg5y7nKGELDjT02FlNr4E2p2we4QT9OvA2sX2tUBHE6qYXRT4yvo2T8PRxAbvNAzATnA+w2FI4HJBnpbdCxdZwDbHHQGVf4cQoj/nBCsREHYsgv1mZVlGFyMusanLLTlaiumFeLqb+GMfZZ9oM24uiLLNsvG30ofbY1WGkVmhHnSSE3uGPvofidA0KSHTp+DviIiIHqzIRrHwU8tIORYhFvNEzUMWtl78gbPcjM35wdRgLZK/nVb/q7R9JOvwVYOf0O0ok3m/hjIOCxQU/6IClftTphEehaM0MzqgEq+sQLLX7MWlgKQdlDlO/JYFSf2EWr4x7lrT1T3i7q92stnC99bZwhIkf8QhQW551PiIoclKhZ2lIsuIK5YYITg3AapoP+NR1UpgapWhe8HgtxjAomL4TLQ9e4h59aUA9MHjVjenZvT0Ot4K8QboO8atoDg5pVEYMOcS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(36840700001)(46966006)(70206006)(478600001)(966005)(55016002)(316002)(70586007)(6506007)(54906003)(8676002)(52536014)(9686003)(336012)(47076005)(86362001)(2906002)(36860700001)(83380400001)(82310400003)(81166007)(4326008)(356005)(82740400003)(8936002)(186003)(7696005)(6916009)(5660300002)(33656002)(26005)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 10:38:58.1420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3982f261-0923-4e19-4a77-08d962fd8d00
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7243

Hi all,
I tried to run virtio-net on X86 machine according to the Wiki page https:/=
/wiki.xenproject.org/wiki/Virtio_On_Xen.=20
And I Encountered some confusing problems.

The Qemu version I used is QEMU emulator version 4.2.1 (Debian 1:4.2-3ubunt=
u6.17)

The content of guest.cfg is as below:
type =3D "hvm"
name =3D "g1"
memory =3D 512
vcpus =3D 2
vif =3D [ 'model=3Dvirtio-net' ]
disk =3D [ 'file:xxx/rootfs.image,xvda1,rw,backendtype=3Dqdisk' ] kernel =
=3D "/boot/vmlinuz-5.4.0-80-generic"
ramdisk =3D "/boot/initrd.img-5.4.0-80-generic"
root =3D "/dev/xvda1 ro"
extra =3D 'console=3Dhvc0 xencons=3Dtty'

I enter the guest shell. Use ps command to get the running qemu command as =
below:

/usr/local/lib/xen/bin/qemu-system-i386
-xen-domid 31
-no-shutdown
-chardev socket,id=3Dlibxl-cmd,path=3D/var/run/xen/qmp-libxl-31,server=3Don=
,wait=3Doff
-mon chardev=3Dlibxl-cmd,mode=3Dcontrol
-chardev socket,id=3Dlibxenstat-cmd,path=3D/var/run/xen/qmp-libxenstat-31,s=
erver=3Don,wait=3Doff
-mon chardev=3Dlibxenstat-cmd,mode=3Dcontrol
-nodefaults -no-user-config
-name g1
-vnc 127.0.0.1:0,to=3D99
-display none
-kernel /boot/vmlinuz-5.4.0-80-generic
-initrd /boot/initrd.img-5.4.0-80-generic -append root=3D/dev/xvda1 ro cons=
ole=3Dhvc0 xencons=3Dtty -device cirrus-vga,vgamem_mb=3D8 -boot order=3Dcda=
 -smp 2,maxcpus=3D2 -device virtio-net,id=3Dnic0,netdev=3Dnet0,mac=3D00:16:=
3e:30:1a:6e
-netdev type=3Dtap,id=3Dnet0,ifname=3Dvif31.0-emu,br=3Dxenbr0,script=3Dno,d=
ownscript=3Dno
-machine xenfv,suppress-vmdesc=3Don -m 504 -drive file=3Dxxx/rootfs.image,i=
f=3Dide,index=3D0,media=3Ddisk,format=3Draw,cache=3Dwriteback

The network-related parameters are
"=20
-device virtio-net,id=3Dnic0,netdev=3Dnet0,mac=3D00:16:3e:30:1a:6e
-netdev type=3Dtap,id=3Dnet0,ifname=3Dvif31.0-emu,br=3Dxenbr0,script=3Dno,d=
ownscript=3Dno
"

Get the interface info as below using command 'ip a'. The mac address of et=
h0 is
00:16:3e:30:1a:6e, the same as in the qemu command, which made me think
 virto-net has run successfully.
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group=
 default qlen 1000
    link/ether 00:16:3e:30:1a:6e brd ff:ff:ff:ff:ff:ff
    inet 192.168.200.3/24 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::216:3eff:fe30:1a6e/64 scope link
       valid_lft forever preferred_lft forever

I made further check.=20
1. I run command 'lspci' and got below message. But there is no virtio devi=
ces.
00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02=
)
00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton I=
I]
00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
00:02.0 Unassigned class [ff80]: XenSource, Inc. Xen Platform Device (rev 0=
1)
00:03.0 VGA compatible controller: Cirrus Logic GD 5446

2. Run "ls /sys/class/net/ -l", what I got is as below:
lrwxrwxrwx  1 root root 0 Aug 19 08:15 eth0 -> ../../devices/vif-0/net/eth0=
 lrwxrwxrwx  1 root root 0 Aug 19 08:15 lo -> ../../devices/virtual/net/lo

Run "ls /sys/bus/xen/devices/vif-0/net/ -l", what I got is as below:
total 0 drwxr-xr-x 5
root root 0 Aug 19 08:15 eth0

It seems eth0 is not virtio-net, properly a pv-net. I am really confused.

 I have the following questions:
1. Does Xen x86 still support virtio-net based on QEMU backend?
2. If yes, is there anything wrong in my guest config file?
3. Is my way to check virtio-net in guest is right?

It is highly appreciated if you kindly tell me about these.

Best wishes
Jiamei Xie


