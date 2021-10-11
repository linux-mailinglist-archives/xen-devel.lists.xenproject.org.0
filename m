Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469E2428CBD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 14:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205912.361340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZu9T-00041q-BD; Mon, 11 Oct 2021 12:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205912.361340; Mon, 11 Oct 2021 12:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZu9T-0003zC-7Z; Mon, 11 Oct 2021 12:11:31 +0000
Received: by outflank-mailman (input) for mailman id 205912;
 Mon, 11 Oct 2021 12:11:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfEM=O7=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mZu9S-0003z6-Dy
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 12:11:30 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::61b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 649fc7a0-32ad-47c5-a784-2935b9a5d7d2;
 Mon, 11 Oct 2021 12:11:28 +0000 (UTC)
Received: from AM4PR0902CA0009.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::19) by VI1PR08MB3965.eurprd08.prod.outlook.com
 (2603:10a6:803:dd::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 12:11:19 +0000
Received: from VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:200:9b:cafe::17) by AM4PR0902CA0009.outlook.office365.com
 (2603:10a6:200:9b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 12:11:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT062.mail.protection.outlook.com (10.152.18.252) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 12:11:19 +0000
Received: ("Tessian outbound 2e7020cc8961:v103");
 Mon, 11 Oct 2021 12:11:18 +0000
Received: from 01f5a5b59deb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8043191C-5374-43E4-A771-E74CBC484794.1; 
 Mon, 11 Oct 2021 12:11:08 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01f5a5b59deb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 12:11:08 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR08MB2678.eurprd08.prod.outlook.com (2603:10a6:6:1b::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 12:11:05 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 12:11:04 +0000
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
X-Inumbo-ID: 649fc7a0-32ad-47c5-a784-2935b9a5d7d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=os/eX9L6AOkcfX4liSeRkJtaGkcuWy6sOz4F7zelP78=;
 b=ribdkTZk2d1YBatRzGHiC6lk1gU/9J74vbS0bWRp9Sv8BuJfA7PMn3ZjmAMhwlOjnSttFRhuVGMhb4cdHSLzCsTz71uaoqoZOelvbRHGfnv7JYVE4mRclblAnXFzWlnUWkR+dDITUPj8cKFQ8exnXfTeOQ5cH2oDl5h3WifRmgk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4e4e86584cdc100a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btuzEr6nwtMC780Yk2UXT728YYdPSdiPN1Y1ESRqamDU9ptier4dO86y1hGQJ8Cc1fgWnvG6i2DN2LkM1gjtgN4eEFwZPimpU6l7VLNw01Oal3LXKdy017HbhfnZV1duy01aV5OI0vUy1uq0FcT8J1rK2ys1mv6BSZ7rUiMyUDrmAlcn3/Pi8sEAIZYVgcoV+9tJGs+JLZErPTnxQGnszwgek8hsn8rdbPYKbgi+OCS5EQswx7QFmoMw30sdt95d70b6bDhf0TICWOlcJxYlnYJHTR0WXFtujIRkAAXuSDrnneAaXdIGb6vqmaGZxpfu2NDIe3eYMvo/Ff8ELALYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=os/eX9L6AOkcfX4liSeRkJtaGkcuWy6sOz4F7zelP78=;
 b=UIwvXH+R/rwS+nC7/yhdpbxiLfOG0Mg6IREXfFXawUSAIRDC9mVzOCNQJj08eQjb90NeMGju8b0RdXj8C9a3jeXLTlbu415g+/QICQuZjNNSYWxJt8Uzeo5nDEU6p4EdaJsACaV9zseZhhUaGMA7q3fP1oZjFWq59TgIenVcManf11hauCieD1tklC5zmU1nRL8i3xemiqta0WakWLL6NGeeHSyuLddOLACaXY7N1vOprSPcHtCwkcFStsTl7j1f1EdzduDNcZiy01a0NQZz+h74cm6OJzEUxdMrvmz5V02+qvgF1NJ7qcsacGRdaQdUDfGTyn0OXRJ6T8NEPPIioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=os/eX9L6AOkcfX4liSeRkJtaGkcuWy6sOz4F7zelP78=;
 b=ribdkTZk2d1YBatRzGHiC6lk1gU/9J74vbS0bWRp9Sv8BuJfA7PMn3ZjmAMhwlOjnSttFRhuVGMhb4cdHSLzCsTz71uaoqoZOelvbRHGfnv7JYVE4mRclblAnXFzWlnUWkR+dDITUPj8cKFQ8exnXfTeOQ5cH2oDl5h3WifRmgk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Topic: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Index: AQHXutl5d8zkP9bsD0GXT4+5QPGclKvNtfkAgAAGc4A=
Date: Mon, 11 Oct 2021 12:11:04 +0000
Message-ID: <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
In-Reply-To: <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fed305a4-c33d-421d-5c69-08d98cb03bb3
x-ms-traffictypediagnostic: DB6PR08MB2678:|VI1PR08MB3965:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB39655E31E4EE994AE260AAF09DB59@VI1PR08MB3965.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rwm/4hMbNlTALI/9Fjfpr20UbHQyogFz/PNt/WKuFklfBij81CKTwgWoagTMzx1phwku2aYYr4xPUxK7CtXs/idqPu6/7s7/rS1nmlwDFyRUGGO/pCCD/quXIgiB1Nb4SMiYfcJOwl/5jBkk2yarL6D/z06/N2dwYm+1rZhY27W9/Oqp6bEYxINzPXpsOLZNsscf1njuWgJirzGjrUN9fLGnmUCN8AAfM5DIQ5SolBUHObLrcNppWAdWFP8I7UvCKpTOyydKyFQMGhPDqyjFDPQisGx5XupkxFjjOvXD4uO5e2RnUD/sMpAmPtt09NmQT3J1236jZqlPLlBzuaNB2t5K9z7ha8FhCxy2dN47FB9q3bcr3S47W96ZieA0k4mbqOQvjqCzQzk7DfDEo1fFT6TJYoJ/zbDK+l1esl2iVb3exGAAlqSd2iEKSDsuBojNrbBwGyq6hfHDPYOlreJ1H5j1AaicOwTRlBHXkTd7JgtLMCHi9VbHgqNllLNWl9mHi7Dtdq4Luww9r8GRdYyfaTizt5UOWJmi5K/MgzF9yolwZGJhc5f4mDKIZduniu/Wkmr3vBxk/Aoo0orR9skROPBYYRTGeoGnj0TU3P6bwTInVbPiRtl4mBL1to39TLZCGjeyIlJrf+kVR/i+MZfd20O95mNZ+XuqP4wW21uSqZGBRvoytCLPGGH/zhbUw6GIlhByj1/gpPvr0N2LSciPiDHh9TTfS7dSDqhRcr4C0Jlp0Job6fJY6m2KJCmJffQc
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(5660300002)(33656002)(26005)(4326008)(6916009)(38070700005)(6512007)(4744005)(316002)(83380400001)(86362001)(8936002)(36756003)(508600001)(38100700002)(91956017)(76116006)(64756008)(66556008)(2906002)(66476007)(53546011)(8676002)(66946007)(54906003)(186003)(2616005)(6486002)(6506007)(122000001)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBA956A7909ADD49BBDD6821981145BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2678
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b979b828-8637-431a-b2bb-08d98cb0331c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A77PJIUjc+aczOPjJx2Bxblitj7f8iRRZy8YXoKub4RuxKRj0tuCRJrfp/L8CuXrZHA8AqBLIyM6oP271uOgpjFIbgJQWk9GH/0lsZB/40obtYqG+qBzY7KTBYvRJ65yFCQUjLNwC4Unaqw5r5b740g9nGYlHqDORQqiZgD1aEa4iT8Lqt2wAMVe40SwQfSvc1G/pbORL6qtUjZKw6FiFbrVAjIIHrcL4WiW80vGSlXdMNYswXWTrC89QpaC+GHto2tPkgJvZstEVgtR7YV+q9avGaVeXTfLGCsxHbtCbtLYNP3pi2yLDyz5iR2iyNffH/XnFf4oOo295KPkVmTT02Vmray/ZddWxdsB/xcliaW1U2n24KtUJn87zNppbS8Cw1mXRbrdd3qTU6lZxmi1y7bdK2TVGPomMxkJknGg2a1+UFa7Den80siEg0xOQ0YV/TRbeY3NTfRQRsLj9yMLNsjI/Tx7KZWoq3Wr3wr7Yypc7RwxOZe2VeD5MjoIt0cSiEdYwbdUcLRIWcMGkit53J6NJnF/mzYI+FBir8i83ZsU2A/wY1eALS+On7n9xT1Pu8V6I5Ua4q+BbsUYJfIN6cuPNHmPfl2dwolqkSuGQOrakADQrbtsQerRCcyiOAOOBsulSbAJ9bZTVxUDYs5gDs9ShiWWWywmK+MVhst2b+UhgX7gVkZexte+L1X7RuM+BbdPUEyBWNeXi/oFRA/7ZA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(33656002)(316002)(86362001)(107886003)(4326008)(26005)(82310400003)(8676002)(70586007)(70206006)(6862004)(186003)(4744005)(53546011)(5660300002)(54906003)(6506007)(2906002)(356005)(336012)(6486002)(47076005)(83380400001)(2616005)(81166007)(6512007)(508600001)(36756003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 12:11:19.2289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fed305a4-c33d-421d-5c69-08d98cb03bb3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3965

SGkgUm9nZXIsDQoNCj4gT24gMTEgT2N0IDIwMjEsIGF0IDEyOjQ3LCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIE9jdCAwNiwgMjAy
MSBhdCAwNjo0MDoyN1BNICswMTAwLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IEFSTSBhcmNoaXRl
Y3R1cmUgZG9lcyBub3QgaW1wbGVtZW50IEkvTyBwb3J0cy4gSWdub3JlIHRoaXMgY2FsbCBvbiBB
Uk0NCj4+IHRvIGF2b2lkIHRoZSBvdmVyaGVhZCBvZiBtYWtpbmcgYSBoeXBlcmNhbGwganVzdCBm
b3IgWGVuIHRvIHJldHVybg0KPj4gLUVOT1NZUy4NCj4gDQo+IFdoYXQgaXMgdGhlIGNhbCB0cmFj
ZSBvZiB0aGlzIGZ1bmN0aW9uIGFjdHVhbGx5IG9uIEFybT8NCj4gDQo+IEFGQUlDVCBsaWJ4bCB3
aWxsIG9ubHkgY2FsbCB4Y19kb21haW5faW9wb3J0X3Blcm1pc3Npb24gaWYgdGhlcmUgYXJlDQo+
IElPIHBvcnRzIGV4cGxpY2l0bHkgZGVmaW5lZCBpbiB0aGUgZ3Vlc3QgY29uZmlndXJhdGlvbiwg
b3IgaWYgYW55IG9mDQo+IHRoZSBCQVJzIG9mIHRoZSBQQ0kgZGV2aWNlIGlzIGluIHRoZSBJTyBz
cGFjZSwgd2hpY2ggaXMgbm90IHBvc3NpYmxlDQo+IG9uIEFybS4NCg0KUENJIGRldmljZXMgQkFS
cyBjYW4gYmUgaW4gdGhlIElPIHNwYWNlIGFzIHRoZSBQQ0kgZGV2aWNlcyBhcmUgbm90DQpBcm0g
c3BlY2lmaWMuIFRoZXJlIGlzIG5vdCBpb3BvcnRzIG9uIGFybSBzbyB0byBiZSB1c2VkIHRob3Nl
IGNhbiBiZQ0KaW4gc29tZSBjYXNlcyByZW1hcHBlZCBhbmQgYWNjZXNzZWQgYXMgTU1JT3Mgb3Ig
YXJlIG5vdCBwb3NzaWJsZQ0KdG8gdXNlIGF0IGFsbC4NCg0KQnV0IHRoZSBJTyBzcGFjZSBkb2Vz
IGFwcGVhciB3aGVuIEJBUnMgYXJlIGxpc3RlZCBldmVuIG9uIEFybS4NCg0KUmVnYXJkcw0KQmVy
dHJhbmQNCg0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQo=

