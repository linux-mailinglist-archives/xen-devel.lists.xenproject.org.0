Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B888E294BC3
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 13:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10026.26444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVCFO-0003es-2j; Wed, 21 Oct 2020 11:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10026.26444; Wed, 21 Oct 2020 11:25:38 +0000
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
	id 1kVCFN-0003eT-VB; Wed, 21 Oct 2020 11:25:37 +0000
Received: by outflank-mailman (input) for mailman id 10026;
 Wed, 21 Oct 2020 11:25:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7u2m=D4=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kVCFL-0003eO-Oc
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 11:25:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 606edfb3-9be4-4ee6-8d9e-132c6abf49a5;
 Wed, 21 Oct 2020 11:25:34 +0000 (UTC)
Received: from DB6PR07CA0060.eurprd07.prod.outlook.com (2603:10a6:6:2a::22) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (2603:10a6:803:47::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21; Wed, 21 Oct 2020 11:25:31 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::e4) by DB6PR07CA0060.outlook.office365.com
 (2603:10a6:6:2a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.10 via Frontend
 Transport; Wed, 21 Oct 2020 11:25:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 11:25:31 +0000
Received: ("Tessian outbound 68da730eaaba:v64");
 Wed, 21 Oct 2020 11:25:31 +0000
Received: from 8940dd5145f2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9C258253-1410-4C2D-B750-927DAE103C69.1; 
 Wed, 21 Oct 2020 11:25:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8940dd5145f2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Oct 2020 11:25:11 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM0PR08MB4930.eurprd08.prod.outlook.com (2603:10a6:208:157::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 21 Oct
 2020 11:25:09 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 11:25:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7u2m=D4=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kVCFL-0003eO-Oc
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 11:25:35 +0000
X-Inumbo-ID: 606edfb3-9be4-4ee6-8d9e-132c6abf49a5
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.43])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 606edfb3-9be4-4ee6-8d9e-132c6abf49a5;
	Wed, 21 Oct 2020 11:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt3ypk5J9n7FEDuyUQmx2wmugEqyA1CsfIiZPKiuawk=;
 b=RSQusM3fygUpQ4pnYF8k8thZGUEwVsicVTWVpDsz3J1dCh44InvS3e1stpfXAS++NGY//5W80/EmKgBwVXKRSpkAdIHfYrSYmnbhTv2DdG89zcPrYR1amjRUSFI3G90fanmkALi+5zW2AAGf03axIbaxBAAKwUBll8RBPj6cGDE=
Received: from DB6PR07CA0060.eurprd07.prod.outlook.com (2603:10a6:6:2a::22) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (2603:10a6:803:47::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21; Wed, 21 Oct 2020 11:25:31 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::e4) by DB6PR07CA0060.outlook.office365.com
 (2603:10a6:6:2a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.10 via Frontend
 Transport; Wed, 21 Oct 2020 11:25:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 11:25:31 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Wed, 21 Oct 2020 11:25:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e175e76036575f01
X-CR-MTA-TID: 64aa7808
Received: from 8940dd5145f2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9C258253-1410-4C2D-B750-927DAE103C69.1;
	Wed, 21 Oct 2020 11:25:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8940dd5145f2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 21 Oct 2020 11:25:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwwDUJDwnr2++1WD2gqe741o8ywB4pdkhd4iGvD4EL/huLwCEPzVD18v2VLQdJxua/gnSqNhTB0egTjxtL6kJAXyEBURwQjQVfRamrIbATVMEjjqYP1coXiBV/dgexp22HauyzcJCNOuPxg+ZKjTgN2nrUsupBQkFvu1XD+8/gmGWeWTBqUE12Fpa2+L5641yRl1hXNlrjQgZ/LT/VPR7be3vjm4DmoXO2gVL1Rx3WQ22JHKfkrBaRfH6e5i1JW0ayuD/Lvlq+swAbulY4itM7qx6TY6TJEaUZ9FoH+CvCFc9+OTv2tqgXS91887zEBaWtBCgIO1CC1SEZBT4bvCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt3ypk5J9n7FEDuyUQmx2wmugEqyA1CsfIiZPKiuawk=;
 b=dvceMxGZMInyVKtVVCGrimUoTzGfUbpAK6ObK/YNBi96a6sRqcOd/J/rQAZZprJlwy44GP2NCYmcdU6KF913daqWTqbqMyZ3rrBXE4NoJ9knYucGjs1Yfp/mwCBxO+ElvV7jYHJeMwx+McwMA8G5rSqUYkk4+LAAbmVu7KQmCPzJdn+POqWxLntoirtmsut2H8nALXU17UfdebSpH/Ttf8LG0MZpooykSEvNmJIFvaDv1Fg4hGzt61FGPJg3ca0skzfCbJwjoc0Z6e3olOJQCLQZnZLsk7+7EFocUBvyKd4PL1rF9xT81BrxaX7MsrlXcy2LmLITjRx1GSS/TkRtMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt3ypk5J9n7FEDuyUQmx2wmugEqyA1CsfIiZPKiuawk=;
 b=RSQusM3fygUpQ4pnYF8k8thZGUEwVsicVTWVpDsz3J1dCh44InvS3e1stpfXAS++NGY//5W80/EmKgBwVXKRSpkAdIHfYrSYmnbhTv2DdG89zcPrYR1amjRUSFI3G90fanmkALi+5zW2AAGf03axIbaxBAAKwUBll8RBPj6cGDE=
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM0PR08MB4930.eurprd08.prod.outlook.com (2603:10a6:208:157::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 21 Oct
 2020 11:25:09 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 11:25:09 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index: AQHWoVvrkmJwOYERdUOadvid1OghFamgw0AAgAEzsQA=
Date: Wed, 21 Oct 2020 11:25:08 +0000
Message-ID: <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
In-Reply-To: <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 48fd1fdf-6f07-49f1-62b7-08d875b40519
x-ms-traffictypediagnostic: AM0PR08MB4930:|VI1PR08MB3085:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3085EC2727A7A02CEAD4E2B8FC1C0@VI1PR08MB3085.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 37TRDc2FV2gjkbC79MGUJkwHiX4Rm4uqAr5rXNg8Elmgabo5a6Vwmb0zk81NZwFdnOtsi/I5gcj/HuULbj+qd6paA1ih/r2H5GP/TkS/dE1TU7Bp9Je3kd/twBPmcmRDUjiljmiVfWc6l3djIZoNqLUq64N4Rv4MXCCIH8+5/N8dX/JKs99IBm4VU4LscKkDyINo6k+qiQnO+QHeFGHVMBFY6AU8WYhSYmhL5C6BU/NiuYklhUsH9Lua/qDKjgKRYY9y/Ywm5yjTgIgnkFaQckUvfq8rCGTRoheSDn1fvGzgBV94Bi8z+tTKSxrC3f8xrWZtlm6meLRl+xKJoGZJ5Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3490.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(83380400001)(66946007)(2616005)(5660300002)(36756003)(6486002)(71200400001)(478600001)(8936002)(6916009)(26005)(33656002)(186003)(316002)(64756008)(6506007)(53546011)(76116006)(66556008)(86362001)(91956017)(4326008)(8676002)(55236004)(66446008)(54906003)(2906002)(6512007)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 KA+dX8KWl6u4QS1Pw70TssBz+vwg2YnuavgjPmB4PACBSfd6saJ0je1hAxN5bkQDwr3wigUglsboH+TBOKroBwaneUY5/iA9RjzPngiSmuN1E7lhGrLQrHiQkBAVUAvnCKqTWRtXb+BPl+903Sf9aCSk6pVRYTNovnB1dyQmIEozYrSWzMqHRCMTPSHKNH3YLYDleJvviigjm/kVavrpQIfjyGtN8pQwytmeQNqt7fmable/IlzezHafGfLlzfJh4DYeAxrNSZmH50faeSwU+4A/Bp+N7d+OzF99ak2u6BbZ8HwNlsQw9uJfOmpHteSiy9jqgjg6YsXIqqS4MUk0zrensv/sJRQhmrBkyEmBWJaVsBk3B5eYRFwAt0wH7FqRWkc8Nkt0qZg5InMQcBc5/MjOiVGtY48EtVUO19cf7K7AG5ThXiZSw0y/JVYx9VngLl80mzds43ybC4h9w9qSop8Y2/jU1uTI9oAUh1c8SP2HQoZzkVm4saxEXmvFuDLxHzY1EbM8X5/UAIM7lWK1EF2DSZDEB71lNwVNkyhSIs2rni2EQvv9DOqb5A2Xw7NbwqZeAf9JUK0R03fFDonEl2LOBYzZ6P1usQEBsJSKVC+e0GNMjoyqw4eU+DP97pRSMDokSw29NpUKmb1GGq3z3w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B83730D3261B0D4183A22F1989ABB0EB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4930
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c6801180-073d-4db8-dfa0-08d875b3f7d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SPv2iJc1tIeQbwJ3OKm09iEOErvKX294tMFBVn4Qf/mWGxlt7K+lBgcY3z8c3vh4Kp01QPO0zp3fF8Gk+TxhyBH6xv+qHThpGwqbK50bzglIRkiTKLUjXN8obumrWmJyqnrNW2NZgv/OjiuzPSqD4zOHXk91sdJHRXgi1byyO8g2iUXL/NB6+ozYJIOjh0G7oQX0O7SEwuHsH8Yo1XDj86iVt3kXMYAm+VY1Dse7bQrcB7qp8hUCcvPqG4rYGch+HqTdLoG3sLYNMdtKqYIsTo9VxeMuT8DfU+cH6gmmzQugwmQuYHkLBg2jfNSl6SWCJWnNYyBn7+BV1iQuxZhKzYm7rDtllz+zZhCAIuEmqqOoZtqLhoNFqQ889/yHQ0YQ/feCvvyYuTY8Klb2dTLWwA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966005)(8676002)(53546011)(33656002)(8936002)(316002)(186003)(70586007)(26005)(70206006)(55236004)(6506007)(2616005)(336012)(36756003)(81166007)(2906002)(6486002)(82310400003)(4326008)(356005)(5660300002)(86362001)(478600001)(54906003)(6862004)(6512007)(83380400001)(47076004)(82740400003)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 11:25:31.2958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48fd1fdf-6f07-49f1-62b7-08d875b40519
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDIwIE9jdCAyMDIwLCBhdCA2OjAzIHBtLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIFJhaHVsLA0KPiANCj4gVGhhbmsg
eW91IGZvciB0aGUgY29udHJpYnV0aW9uLiBMZXRzIG1ha2Ugc3VyZSB0aGlzIGF0dGVtcHQgdG8g
U01NVXYzIHN1cHBvcnQgaW4gWGVuIHdpbGwgYmUgbW9yZSBzdWNjZXNzZnVsIHRoYW4gdGhlIG90
aGVyIG9uZSA6KS4NCg0KWWVzIHN1cmUuDQo+IA0KPiBJIGhhdmVuJ3QgcmV2aWV3ZWQgdGhlIGNv
ZGUgeWV0LCBidXQgSSB3YW50ZWQgdG8gcHJvdmlkZSBmZWVkYmFjayBvbiB0aGUgY29tbWl0IG1l
c3NhZ2UuDQo+IA0KPiBPbiAyMC8xMC8yMDIwIDE2OjI1LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+
IEFkZCBzdXBwb3J0IGZvciBBUk0gYXJjaGl0ZWN0ZWQgU01NVXYzIGltcGxlbWVudGF0aW9ucy4g
SXQgaXMgYmFzZWQgb24NCj4+IHRoZSBMaW51eCBTTU1VdjMgZHJpdmVyLg0KPj4gTWFqb3IgZGlm
ZmVyZW5jZXMgYmV0d2VlbiB0aGUgTGludXggZHJpdmVyIGFyZSBhcyBmb2xsb3dzOg0KPj4gMS4g
T25seSBTdGFnZS0yIHRyYW5zbGF0aW9uIGlzIHN1cHBvcnRlZCBhcyBjb21wYXJlZCB0byB0aGUg
TGludXggZHJpdmVyDQo+PiAgICB0aGF0IHN1cHBvcnRzIGJvdGggU3RhZ2UtMSBhbmQgU3RhZ2Ut
MiB0cmFuc2xhdGlvbnMuDQo+PiAyLiBVc2UgUDJNICBwYWdlIHRhYmxlIGluc3RlYWQgb2YgY3Jl
YXRpbmcgb25lIGFzIFNNTVV2MyBoYXMgdGhlDQo+PiAgICBjYXBhYmlsaXR5IHRvIHNoYXJlIHRo
ZSBwYWdlIHRhYmxlcyB3aXRoIHRoZSBDUFUuDQo+PiAzLiBUYXNrbGV0cyBpcyB1c2VkIGluIHBs
YWNlIG9mIHRocmVhZGVkIElSUSdzIGluIExpbnV4IGZvciBldmVudCBxdWV1ZQ0KPj4gICAgYW5k
IHByaW9yaXR5IHF1ZXVlIElSUSBoYW5kbGluZy4NCj4gDQo+IFRhc2tsZXRzIGFyZSBub3QgYSBy
ZXBsYWNlbWVudCBmb3IgdGhyZWFkZWQgSVJRLiBJbiBwYXJ0aWN1bGFyLCB0aGV5IHdpbGwgaGF2
ZSBwcmlvcml0eSBvdmVyIGFueXRoaW5nIGVsc2UgKElPVyBub3RoaW5nIHdpbGwgcnVuIG9uIHRo
ZSBwQ1BVIHVudGlsIHRoZXkgYXJlIGRvbmUpLg0KPiANCj4gRG8geW91IGtub3cgd2h5IExpbnV4
IGlzIHVzaW5nIHRocmVhZC4gSXMgaXQgYmVjYXVzZSBvZiBsb25nIHJ1bm5pbmcgb3BlcmF0aW9u
cz8NCg0KWWVzIHlvdSBhcmUgcmlnaHQgYmVjYXVzZSBvZiBsb25nIHJ1bm5pbmcgb3BlcmF0aW9u
cyBMaW51eCBpcyB1c2luZyB0aGUgdGhyZWFkZWQgSVJRcy4gDQoNClNNTVV2MyByZXBvcnRzIGZh
dWx0L2V2ZW50cyBiYXNlcyBvbiBtZW1vcnktYmFzZWQgY2lyY3VsYXIgYnVmZmVyIHF1ZXVlcyBu
b3QgYmFzZWQgb24gdGhlIHJlZ2lzdGVyLiBBcyBwZXIgbXkgdW5kZXJzdGFuZGluZywgaXQgaXMg
dGltZS1jb25zdW1pbmcgdG8gcHJvY2VzcyB0aGUgbWVtb3J5IGJhc2VkIHF1ZXVlcyBpbiBpbnRl
cnJ1cHQgY29udGV4dCBiZWNhdXNlIG9mIHRoYXQgTGludXggaXMgdXNpbmcgdGhyZWFkZWQgSVJR
IHRvIHByb2Nlc3MgdGhlIGZhdWx0cy9ldmVudHMgZnJvbSBTTU1VLg0KDQpJIGRpZG7igJl0IGZp
bmQgYW55IG90aGVyIHNvbHV0aW9uIGluIFhFTiBpbiBwbGFjZSBvZiB0YXNrbGV0IHRvIGRlZmVy
IHRoZSB3b3JrLCB0aGF04oCZcyB3aHkgSSB1c2VkIHRhc2tsZXQgaW4gWEVOIGluIHJlcGxhY2Vt
ZW50IG9mIHRocmVhZGVkIElSUXMuIElmIHdlIGRvIGFsbCB3b3JrIGluIGludGVycnVwdCBjb250
ZXh0IHdlIHdpbGwgbWFrZSBYRU4gbGVzcyByZXNwb25zaXZlLg0KDQpJZiB5b3Uga25vdyBhbm90
aGVyIHNvbHV0aW9uIGluIFhFTiB0aGF0IHdpbGwgYmUgdXNlZCB0byBkZWZlciB0aGUgd29yayBp
biB0aGUgaW50ZXJydXB0IHBsZWFzZSBsZXQgbWUga25vdyBJIHdpbGwgdHJ5IHRvIHVzZSB0aGF0
Lg0KDQo+PiA0LiBMYXRlc3QgdmVyc2lvbiBvZiB0aGUgTGludXggU01NVXYzIGNvZGUgaW1wbGVt
ZW50cyB0aGUgY29tbWFuZHMgcXVldWUNCj4+ICAgIGFjY2VzcyBmdW5jdGlvbnMgYmFzZWQgb24g
YXRvbWljIG9wZXJhdGlvbnMgaW1wbGVtZW50ZWQgaW4gTGludXguDQo+IA0KPiBDYW4geW91IHBy
b3ZpZGUgbW9yZSBkZXRhaWxzPw0KDQpJIHRyaWVkIHRvIHBvcnQgdGhlIGxhdGVzdCB2ZXJzaW9u
IG9mIHRoZSBTTU1VdjMgY29kZSB0aGFuIEkgb2JzZXJ2ZWQgdGhhdCBpbiBvcmRlciB0byBwb3J0
IHRoYXQgY29kZSBJIGhhdmUgdG8gYWxzbyBwb3J0IGF0b21pYyBvcGVyYXRpb24gaW1wbGVtZW50
ZWQgaW4gTGludXggdG8gWEVOLiBBcyBsYXRlc3QgTGludXggY29kZSB1c2VzIGF0b21pYyBvcGVy
YXRpb24gdG8gcHJvY2VzcyB0aGUgY29tbWFuZCBxdWV1ZXMgKGF0b21pY19jb25kX3JlYWRfcmVs
YXhlZCgpLGF0b21pY19sb25nX2NvbmRfcmVhZF9yZWxheGVkKCkgLCBhdG9taWNfZmV0Y2hfYW5k
bm90X3JlbGF4ZWQoKSkgLg0KDQo+IA0KPj4gICAgQXRvbWljIGZ1bmN0aW9ucyB1c2VkIGJ5IHRo
ZSBjb21tYW5kcyBxdWV1ZSBhY2Nlc3MgZnVuY3Rpb25zIGlzIG5vdA0KPj4gICAgaW1wbGVtZW50
ZWQgaW4gWEVOIHRoZXJlZm9yZSB3ZSBkZWNpZGVkIHRvIHBvcnQgdGhlIGVhcmxpZXIgdmVyc2lv
bg0KPj4gICAgb2YgdGhlIGNvZGUuIE9uY2UgdGhlIHByb3BlciBhdG9taWMgb3BlcmF0aW9ucyB3
aWxsIGJlIGF2YWlsYWJsZSBpbiBYRU4NCj4+ICAgIHRoZSBkcml2ZXIgY2FuIGJlIHVwZGF0ZWQu
DQo+PiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+
IC0tLQ0KPj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL0tjb25maWcgICAgICAgfCAgIDEwICsN
Cj4+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUgIHwgICAgMSArDQo+PiAg
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYyB8IDI4NDcgKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPj4gIDMgZmlsZXMgY2hhbmdlZCwgMjg1OCBpbnNlcnRpb25zKCspDQo+
IA0KPiBUaGlzIGlzIHF1aXRlIHNpZ25pZmljYW50IHBhdGNoIHRvIHJldmlldy4gSXMgdGhlcmUg
YW55IHdheSB0byBnZXQgaXQgc3BsaXQgKG1heWJlIGEgdmVyYmF0aW0gTGludXggY29weSArIFhl
biBtb2RpZmljYXRpb24pPw0KDQpZZXMsIEkgdW5kZXJzdGFuZCB0aGlzIGlzIGEgcXVpdGUgc2ln
bmlmaWNhbnQgcGF0Y2ggdG8gcmV2aWV3IGxldCBtZSB0aGluayB0byBnZXQgaXQgc3BsaXQuIElm
IGl0IGlzIG9rIGZvciB5b3UgdG8gcmV2aWV3IHRoaXMgcGF0Y2ggYW5kIHByb3ZpZGUgeW91ciBj
b21tZW50cyB0aGVuIGl0IHdpbGwgZ3JlYXQgZm9yIHVzLg0KDQo+IA0KPiBDaGVlcnMsDQo+IA0K
PiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

