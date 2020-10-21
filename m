Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023B6294AD1
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 11:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9921.26203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVAo0-0001qH-C6; Wed, 21 Oct 2020 09:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9921.26203; Wed, 21 Oct 2020 09:53:16 +0000
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
	id 1kVAo0-0001ps-8v; Wed, 21 Oct 2020 09:53:16 +0000
Received: by outflank-mailman (input) for mailman id 9921;
 Wed, 21 Oct 2020 09:53:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xrJA=D4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kVAny-0001mo-Nc
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 09:53:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.68]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c6e2c40-8933-4e1e-ae05-e9749d41174c;
 Wed, 21 Oct 2020 09:53:13 +0000 (UTC)
Received: from AM6P194CA0104.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::45)
 by AM6PR08MB3685.eurprd08.prod.outlook.com (2603:10a6:20b:6f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 21 Oct
 2020 09:53:11 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::34) by AM6P194CA0104.outlook.office365.com
 (2603:10a6:209:8f::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 21 Oct 2020 09:53:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 09:53:11 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64");
 Wed, 21 Oct 2020 09:53:10 +0000
Received: from f470a11f0bf3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DD7DF5E9-F3B4-4517-A8DC-EF9019622224.1; 
 Wed, 21 Oct 2020 09:52:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f470a11f0bf3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Oct 2020 09:52:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5372.eurprd08.prod.outlook.com (2603:10a6:10:f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 21 Oct
 2020 09:52:32 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 09:52:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xrJA=D4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kVAny-0001mo-Nc
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 09:53:14 +0000
X-Inumbo-ID: 0c6e2c40-8933-4e1e-ae05-e9749d41174c
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [40.107.21.68])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0c6e2c40-8933-4e1e-ae05-e9749d41174c;
	Wed, 21 Oct 2020 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v25lfyaUstm8PThpObUVYD9Bmh+bNjHIuMIjN7EsQ2U=;
 b=3xP7moyYaJJFQ3WIjFC6OHZCODUF5EZ4Gsy1ZK2e9okMyhB11IIeq53EJDw3jlxf3cNt9vyC54i6TQFvUO2KL7zOtG6Qom+Esl0HMxMDyvJg5eTRmDlBlaSCKhUWYwQf35ypmyz4YWIFfwmqWzQPqlYSAnxABAiBb1cb0D+O5/I=
Received: from AM6P194CA0104.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::45)
 by AM6PR08MB3685.eurprd08.prod.outlook.com (2603:10a6:20b:6f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 21 Oct
 2020 09:53:11 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::34) by AM6P194CA0104.outlook.office365.com
 (2603:10a6:209:8f::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 21 Oct 2020 09:53:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 09:53:11 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64"); Wed, 21 Oct 2020 09:53:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1bb1e6501042aa78
X-CR-MTA-TID: 64aa7808
Received: from f470a11f0bf3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DD7DF5E9-F3B4-4517-A8DC-EF9019622224.1;
	Wed, 21 Oct 2020 09:52:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f470a11f0bf3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 21 Oct 2020 09:52:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnIujTW/NzpxkdvaRLYqI+yjtPHxaj85CGXu67aZWPfKtaI0OMhLuqdODC9C1k2s95YoLkfrA+QcG3ijn7SfiRyh7/J6wE8XDoGkffadD/XPaxTqvEN4bG4OqMDAIZWepzD9OOUCoBlkCiAeAzakDD/fP7RLMJw/lG8t+zQ+Sqae3RO3pkcL7VPyR/Lbg1yexsG1e96U0GWSe6IoGopa4hX6X4OkrvAroe21geH7FMwZQdh6cv8Kyu2gfzoGlD7825WH4rQhEyZQAN44xZ04TPVU2z/IGp0EwF6dwilOptiiZ145tTVV/pyDuHAp1RMTmGam9oO5QdtnR3edzalGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v25lfyaUstm8PThpObUVYD9Bmh+bNjHIuMIjN7EsQ2U=;
 b=jYcg2yvMfXDCeo/oYxzG5s8aGiF9Bw4h8QKU+Js/HDNTtoNIQBlbVnHmAgRuGpdew0b7oFjXL/PZITNneXB1Fz/dJZr8PWQcG0a2zOn4d5aQMrE9Rcn3Qg5R91vOS8kMxRjHl6DpR6ho9D85nWGEVypyNFfSG7yL9Rj+YQQIui4F1OjD7v1X0xR1XunmwECB2Z3B5wx2fgiF812Tfc5cBOyrM+zbJD6RMowaI5y2lw9plKoWue1XMNE3CIFqmt2OfZ10L6DEyEQwdWqzeT6Hz0Yg3eu4leBEC89O6dZXvK+dmPbhQtw4e8Ldp+QcFQD1m0trRc2g5KvngmBAch1r+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v25lfyaUstm8PThpObUVYD9Bmh+bNjHIuMIjN7EsQ2U=;
 b=3xP7moyYaJJFQ3WIjFC6OHZCODUF5EZ4Gsy1ZK2e9okMyhB11IIeq53EJDw3jlxf3cNt9vyC54i6TQFvUO2KL7zOtG6Qom+Esl0HMxMDyvJg5eTRmDlBlaSCKhUWYwQf35ypmyz4YWIFfwmqWzQPqlYSAnxABAiBb1cb0D+O5/I=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5372.eurprd08.prod.outlook.com (2603:10a6:10:f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 21 Oct
 2020 09:52:32 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 09:52:31 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "open list:X86"
	<xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Warn user on cpu errata 832075
Thread-Topic: [PATCH] xen/arm: Warn user on cpu errata 832075
Thread-Index:
 AQHWohbM+uoR14U9oEmwJFjy+kmnIqmW9/2AgABK1ACAABYOAIAAQVGAgADYZ4CAAITigIAI1nwAgAALgoCAAACPgIAAAZWA
Date: Wed, 21 Oct 2020 09:52:31 +0000
Message-ID: <3603E591-0936-4D2B-B310-8236AD4DCD7E@arm.com>
References:
 <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com>
 <26742825-25fc-0f82-2b20-d536e8380b2a@citrix.com>
 <90BC5355-EB52-469F-B0A6-ACAAB9AD9EF5@arm.com>
 <f49d478f-4efe-955e-c378-f2fa5fbc6a71@xen.org>
 <alpine.DEB.2.21.2010141350170.10386@sstabellini-ThinkPad-T480s>
 <C07DA84A-6527-4480-99CC-F6B26553E3FE@arm.com>
 <alpine.DEB.2.21.2010151104200.10386@sstabellini-ThinkPad-T480s>
 <a418ff3a-0476-203c-d3d8-add3706eea14@xen.org>
 <DFD23AC6-9F7A-4591-96B3-29F2A04718FF@arm.com>
 <1cd355a4-9907-1596-44d3-d524618e4a35@xen.org>
In-Reply-To: <1cd355a4-9907-1596-44d3-d524618e4a35@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 76d936e2-955f-476e-7045-08d875a71efb
x-ms-traffictypediagnostic: DB8PR08MB5372:|AM6PR08MB3685:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3685BE7F7493054C478FF8E09D1C0@AM6PR08MB3685.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yLOGIuIqMhjzzlvdovMbJnjGle4XgRV+S0y/Dglkvqu4jS/g2vpVK1vi5YSQ/w/1Jwpmv7M2oHvmevlYp9hC40L2rhWtxPi2y0R5Q40aMmuTjuZrvCvtzSvvZBkRlEmjteQiQG3eJaQ0IfnsLDFWn+vV1F5qhKTWsO2XdCvU3UMHM9D3fhZC13JdRwFgZ9UQIf8CSavuJ41coc7vRBWZru66ddMgjxkqrjJhQxoD5AZ6MHsCla6yuUo07bdWDzU4iM9oyP5GNxRPQM7fN/25BIuR3Pt0e4ptzr0dut2QBg3ZADLW6RG0WyT7f1HelaVm73sQQurn39t2sfMWJ/Ej6A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(71200400001)(66556008)(53546011)(66946007)(66446008)(54906003)(2906002)(64756008)(4744005)(36756003)(2616005)(76116006)(91956017)(4326008)(5660300002)(6512007)(66476007)(316002)(6506007)(186003)(478600001)(86362001)(6916009)(8936002)(8676002)(26005)(6486002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 Hp3kml/o6Ad+rIgVNJiGM/GU41+z0Zi+sUNQpZnywRVi6vAxzFhSqu4st3KJ+byNL6jEAH7X+lDuLivs5z1x/Ig7iLPzLQz/rO9hOJ63EWam4yo2Ph/LnXzeFffWYMaUHikwQkIE+r4BShHpuNKuRlYdrLKe923ourkHz/+Aofa6WeS6b+hB72ofszJWqn0F0TiHFKfFpE9q8D/WGvrTo5bbBFdjKbrx2qIuH5Dqlf9IeSicQB8zYJaiuenL7vrKnnyiwSxr7dDKMG7y10V8oKWunauPeLmwVi4mEyNLTZfXulxIX5nytBbo/9f359XGRmFKVYf3aF+QD+d5aNJBbpO7GJiZt0xSiCqzSGP1Cl+KbnGdIrnoiccgakl85MunmsH91zuokqXwNh2r7eLdPxa6Qn4mV0iN4v06IH9vN+o9sV1w5xs1QGbx1/CgDf2DkMKh9kWYQJDy1Jnt5Uh/4VBGJfjKIQqTieEZ+OZdvd3dB9BFNsTZPOTuhXEUNiy8tUhWppq5iv/fXE94Bcx+MSfYQBZ5JdUsITZeATBn6rVHZnHSmKqSM6ocayvzcwjeEh+Qs0d06YLhEqaa7o/qvZfZJDNrEGvaEsToQgBEl6IV0srMVdF6+Uvy3LfNnzRdvO7p1w2OzLZKQRm7eAt/vg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2802934B64B8434B94F013BDE81D3063@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5372
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ad7c8607-a346-4c4f-64c9-08d875a7078c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SY1UpT6rjNdnPVy1m6Ljau/N2+78CgRXktLor6JyOXPD8oMgPNiQlPXUlO5P3tovhC0PCwfEbdLDKLvm1AcpBQaQRbN/xWJfnHfRhIK8s/qV/r5UgivxsDtHUTojsLWmXOArA850z1W+AHNCZ5Gzm7N8ha12FviIzShvL3TLLHD3voIOdn+1VSwsaqYMrbTYC/8JNvW+cMb8h0usmYtq4nHGBpeSurgzCwjKZs4wGZX5v92aRqnTGdym84oPHGwQjnz9KrWAfB2vOxc7OmUpxEDSSOi9/Z6ET7OgmLzf+9gC9hkRGpzIeYWwEsPB0Hf1C1WIjr5XLrqplF/bZV2O7mC45F3w6mmduPYB3VK6gwIoVyPXdRP5cfubbJa6JeUMIGaZtwhoa31CMPu4KvDaBQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966005)(8676002)(6486002)(6512007)(2906002)(107886003)(70206006)(4744005)(2616005)(36756003)(81166007)(356005)(82740400003)(5660300002)(82310400003)(70586007)(336012)(186003)(26005)(36906005)(316002)(54906003)(478600001)(47076004)(6506007)(86362001)(33656002)(6862004)(8936002)(4326008)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 09:53:11.1208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d936e2-955f-476e-7045-08d875a71efb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3685



> On 21 Oct 2020, at 10:46, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 21/10/2020 10:44, Bertrand Marquis wrote:
>>> Bertrand reminded me today that I forgot to answer the e-mail (sorry). =
I am happy with using printk_once().
>> Shall i also keep the .enable implementation ?
>> At the end having:
>>  if ( cpus_have_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) )
>> in enable_errata_workarounds is quite clean.
>=20
> You can pick the one you prefer :).

Thanks, I will push a v2 shortly.

Cheers
Bertrand


