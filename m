Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986B02A6636
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 15:17:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19204.44445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaJas-00031Y-Mu; Wed, 04 Nov 2020 14:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19204.44445; Wed, 04 Nov 2020 14:16:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaJas-000312-JU; Wed, 04 Nov 2020 14:16:58 +0000
Received: by outflank-mailman (input) for mailman id 19204;
 Wed, 04 Nov 2020 14:16:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osUd=EK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kaJar-0002s9-3T
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 14:16:57 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.49]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2267d75b-aafe-4f21-a847-b9980201ff96;
 Wed, 04 Nov 2020 14:16:49 +0000 (UTC)
Received: from DB6PR0202CA0019.eurprd02.prod.outlook.com (2603:10a6:4:29::29)
 by AM0PR08MB5236.eurprd08.prod.outlook.com (2603:10a6:208:155::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 14:16:46 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::b1) by DB6PR0202CA0019.outlook.office365.com
 (2603:10a6:4:29::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 4 Nov 2020 14:16:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 14:16:44 +0000
Received: ("Tessian outbound 68da730eaaba:v64");
 Wed, 04 Nov 2020 14:16:44 +0000
Received: from b9a50f5acd47.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FFA420FE-CC34-43C4-954D-EC6ED4B6BECB.1; 
 Wed, 04 Nov 2020 14:16:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b9a50f5acd47.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Nov 2020 14:16:18 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB3348.eurprd08.prod.outlook.com (2603:10a6:208:65::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 14:16:16 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:16:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=osUd=EK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kaJar-0002s9-3T
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 14:16:57 +0000
X-Inumbo-ID: 2267d75b-aafe-4f21-a847-b9980201ff96
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown [40.107.4.49])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2267d75b-aafe-4f21-a847-b9980201ff96;
	Wed, 04 Nov 2020 14:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upmY6GkKu4VTBCTd9WqVCDvt18zRTVI/l3y6CIdNFAo=;
 b=TUIFgyhe0/DxzKtZuKy0CvwX4mz4/A8ukUfcWEy1iTqPic1D5f91PLNk/8Waf6JwX+F86Qz7E3UyUL7+KqbcE2z0HlgiJzTOYHjSvthPHF0wPSam+TLOfNbwz+HkHxk4uSMOctUTFd7PieJVkTXJv3Mxv2+xQubYA2WIR+M0f6Q=
Received: from DB6PR0202CA0019.eurprd02.prod.outlook.com (2603:10a6:4:29::29)
 by AM0PR08MB5236.eurprd08.prod.outlook.com (2603:10a6:208:155::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 14:16:46 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::b1) by DB6PR0202CA0019.outlook.office365.com
 (2603:10a6:4:29::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 4 Nov 2020 14:16:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 14:16:44 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Wed, 04 Nov 2020 14:16:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5785e2cbd48e885e
X-CR-MTA-TID: 64aa7808
Received: from b9a50f5acd47.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FFA420FE-CC34-43C4-954D-EC6ED4B6BECB.1;
	Wed, 04 Nov 2020 14:16:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b9a50f5acd47.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 04 Nov 2020 14:16:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRnIUVY1/7cWb+S6d0KgJVf2QpwyEEVmmMuSIkbxxZMHxcVKSQ98Yxpy5pDf3sKaD642trrMnKPwPJ3en1ZCsyo0VEQyPNSCOhdz1LJL7wHhcOUyc0wZUB0lr6yfnoSYTD5xlkzHGURCvd+kkLmABYHpHSkj9mATNZNCgVw7eKr+y3f1cmIbcOJr9monLlqnxwgg0LQ6OvPT2zXUR0vb1oDKyRb8xOdZ8AtghUnQ3wmNTyXlMNoSGJ88OdVxus0GKaJDIjeJUKVN4dE+f5VfshzKy/LxjJshxFO0Dsx6jEndzVnucEYF5P+vtgdSmOSOI/tOC6Blxk1QW15fryJbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upmY6GkKu4VTBCTd9WqVCDvt18zRTVI/l3y6CIdNFAo=;
 b=GfqPt/y57mRPnofZxTKgznMvgK36DF3DlZdLgAPA90es6IyDGPGBbl8mkn44CtJB0mf+7NaO5uHBroupGvXpKUhdDF1i+R4CiqVLRcHBvvIDQnPT+OeeswUXITm69BffkOE8C+ccUoTq12tE8mmJs87iYmvCwFqWoVd6YoavFwxgDaxaeoa8Xyt2nyIG8Y5l+v+cNmZD6fpHFAUqKqChqY+crGER/MFlK8HARB76015G1+gDqtNz3uTcEylShd3OCGSXIFcuCs07LzUijMp9xay0ZCjECOl5g4bILHtM9RDS1KC5SMJkfqBxmgaadwauqT1k42cXFgE3l6Cv/2ryFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upmY6GkKu4VTBCTd9WqVCDvt18zRTVI/l3y6CIdNFAo=;
 b=TUIFgyhe0/DxzKtZuKy0CvwX4mz4/A8ukUfcWEy1iTqPic1D5f91PLNk/8Waf6JwX+F86Qz7E3UyUL7+KqbcE2z0HlgiJzTOYHjSvthPHF0wPSam+TLOfNbwz+HkHxk4uSMOctUTFd7PieJVkTXJv3Mxv2+xQubYA2WIR+M0f6Q=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB3348.eurprd08.prod.outlook.com (2603:10a6:208:65::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 14:16:16 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:16:16 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 4/4] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled.
Thread-Topic: [PATCH v2 4/4] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled.
Thread-Index: AQHWsfqNTWzum2g39UK3EjJMrmB9Oam4BigA
Date: Wed, 4 Nov 2020 14:16:16 +0000
Message-ID: <C6FD39DC-1462-45EB-8909-B5F582A159AB@arm.com>
References: <cover.1604417224.git.rahul.singh@arm.com>
 <7b60501fa689a4f2795ea6c34a7475d288f154a9.1604417224.git.rahul.singh@arm.com>
In-Reply-To:
 <7b60501fa689a4f2795ea6c34a7475d288f154a9.1604417224.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6571f7e1-5f97-4308-c260-08d880cc4259
x-ms-traffictypediagnostic: AM0PR08MB3348:|AM0PR08MB5236:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB523667A7B8E259D752BD2B289DEF0@AM0PR08MB5236.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:167;OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AAxdgpHdZ4i5nkOosYXRLjYURQMzO7o3E70q70T8kWAKW1Q4Fd/14ZyY/FKe7xsPuT9ASRz6PLgW+pizB7d1S6YCHODasrhDMW0EhZ1EfgD4m5j/QYJkCMvuBfzGtnoW/RCRTZzpv/W+cbsTOLqGMdWumY0TFdCoZJ6joG+eCoztC2i3IfvBw4K83IxsiHwXItrtmEOrrZYW45DddkI1BeHBapQMd40XINSXrB9UDSAMLjSBxfKcgcOF4VyM7SxyZ9fxiw70Jhz7akQLB0sIn+Zdg00T6yFm76ZHmdhjX8v0/Thtt3dmz67FuQ5CeNw1
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3682.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(478600001)(54906003)(316002)(6486002)(5660300002)(186003)(26005)(6862004)(37006003)(6636002)(8676002)(91956017)(36756003)(53546011)(2616005)(64756008)(6506007)(66556008)(86362001)(33656002)(6512007)(8936002)(4326008)(66476007)(83380400001)(66946007)(71200400001)(76116006)(66446008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 FeRFkbMoJqc/xSJFgPC3PT6mIxi1DRb6Z5rwsmQfLGWuTv0KFsapVhxfjScD9aHR9bpEXckRDs34NjnRmNOy6+MUfVXFpZRcnZyKu+5mCWFpJY2cIR7zdgescg28tgJIKoeRAD8HIR2ACsVPfNgNfObJFx07A9qE6cNoC/asPUyS0If2uzZ98MqI9TrFw2E6PtCfnYfwiBTFb3CMIANq4oA02W6eZTZAo3B/p+XZJJj2B9Pd1GQ2XC739iIaitga6otgTftXybHb2WKDB7BL8NAj2Mn7JZRizjhu3pYzw1OEjoMycj+rq9BavoNVUvS3GqdYIG+AWy0o9vl3LMJaOE1LnmEOF3/VV/toHVUuuEhgtV/H6sD2aQFeDH00ITrN2OFBD2qCj/Qp581cvmNbtBi39aMQizr0LCdoCj3ZFP8pLuAnybr7wOa/75zDUH4I+TeqXslMt82/4mKRIGdRxCQjtEJCX9Lu2klAQATzuyMo0KFRip9I1yGf9zhYZH3P2zhmKUMuVJJtMr8XNa/5VM0k+oSUYWRzrIkTMcfuCRvVvuYvQhJ2Qxx8XgQvHgoVAy+8V4AP6dHQ4kHviXbJSWjL3FijSc9f5sq8kR1MYDHSBu2uQTLguUiHhPWS3E5FMclY3yQB7XTOmBQYd80hig==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9899AFDE507BE740912BE97C4DAF98E2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3348
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c2c89170-a34e-4ef0-45ff-08d880cc31b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T7RB0pcODv9Wm2SGq4/AnqdSSJ6vDq62I6ENNzKkg8MuORS1e3laMijsh8sCMEw4mG5IiA0vCxHdEPPMjNSpMy1Q+7BQrcf6TXJgO4ZKOXs4ihVC1dlRJ2qNp41wtpOind+fTpylnw4QuQZisE5NRx6JM+fSLrnqSlTHPyU9SaMyUv+q0jkNTYgRYUBjwDkZFnJMWgpXlm5FGvVuOE+DuoDLYEWMyoyFD07Ay9U6Xp1+lw6YM6s/ReJRJsyJ9Vp/nLDEQDO2ELbdHxdNOzph7S28gfwoqYCXgQh/aRUOL0oqYSUxuM9gPb6KqYaDzlZ3WiHwGBNKsnBxvM0pRI9E1xvIne1myTq1BkLO8GO2VPJ5S7nymOt71Bg6rf7BlkNm1IyMpKtuF2IA+Xnw6ht01Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966005)(54906003)(4326008)(36756003)(47076004)(5660300002)(6862004)(478600001)(70206006)(70586007)(316002)(37006003)(8936002)(82310400003)(82740400003)(26005)(8676002)(336012)(33656002)(6486002)(356005)(6636002)(81166007)(86362001)(6506007)(53546011)(186003)(2616005)(2906002)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:16:44.7727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6571f7e1-5f97-4308-c260-08d880cc4259
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5236



> On 3 Nov 2020, at 15:59, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> If mem-sharing, mem-paging and log-dirty functionality is not enabled
> for architecture when HAS_PCI is enabled, compiler will throw an error.
>=20
> Move code to x86 specific directory to fix compilation error.
>=20
> No functional change.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
>=20
> Changes in v2:
> - Move mem-sharing , men-paging and log-dirty specific code to x86 direct=
ory.=20
>=20
> ---
> xen/drivers/passthrough/pci.c       |  8 +-------
> xen/drivers/passthrough/x86/iommu.c | 13 +++++++++++++
> xen/include/xen/iommu.h             |  2 ++
> 3 files changed, 16 insertions(+), 7 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.=
c
> index 04d3e2c0f9..433989e654 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -22,7 +22,6 @@
> #include <xen/iommu.h>
> #include <xen/irq.h>
> #include <xen/param.h>
> -#include <xen/vm_event.h>
> #include <xen/delay.h>
> #include <xen/keyhandler.h>
> #include <xen/event.h>
> @@ -1418,12 +1417,7 @@ static int assign_device(struct domain *d, u16 seg=
, u8 bus, u8 devfn, u32 flag)
>     if ( !is_iommu_enabled(d) )
>         return 0;
>=20
> -    /* Prevent device assign if mem paging or mem sharing have been=20
> -     * enabled for this domain */
> -    if ( d !=3D dom_io &&
> -         unlikely(mem_sharing_enabled(d) ||
> -                  vm_event_check_ring(d->vm_event_paging) ||
> -                  p2m_get_hostp2m(d)->global_logdirty) )
> +    if( !arch_iommu_usable(d) )
>         return -EXDEV;
>=20
>     /* device_assigned() should already have cleared the device for assig=
nment */
> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthroug=
h/x86/iommu.c
> index 875e67b53b..b3d151a14c 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -23,6 +23,7 @@
> #include <asm/hvm/io.h>
> #include <asm/io_apic.h>
> #include <asm/setup.h>
> +#include <xen/vm_event.h>
>=20
> const struct iommu_init_ops *__initdata iommu_init_ops;
> struct iommu_ops __read_mostly iommu_ops;
> @@ -315,6 +316,18 @@ int iommu_update_ire_from_msi(
>            ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) :=
 0;
> }
>=20
> +bool_t arch_iommu_usable(struct domain *d)
> +{
> +
> +    /* Prevent device assign if mem paging or mem sharing have been
> +     * enabled for this domain */
> +    if ( d !=3D dom_io && unlikely(mem_sharing_enabled(d) ||
> +                        vm_event_check_ring(d->vm_event_paging) ||
> +                        p2m_get_hostp2m(d)->global_logdirty) )
> +        return false;
> +    else
> +        return true;
> +}
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 191021870f..493528cee3 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -381,6 +381,8 @@ DECLARE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
> extern struct spinlock iommu_pt_cleanup_lock;
> extern struct page_list_head iommu_pt_cleanup_list;
>=20
> +bool_t arch_iommu_usable(struct domain *d);
> +
> #endif /* _IOMMU_H_ */
>=20
> /*
> --=20
> 2.17.1
>=20


