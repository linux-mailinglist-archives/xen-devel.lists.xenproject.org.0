Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC372C2860
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:41:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36236.68180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYZA-0006RD-VR; Tue, 24 Nov 2020 13:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36236.68180; Tue, 24 Nov 2020 13:41:08 +0000
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
	id 1khYZA-0006Pe-N7; Tue, 24 Nov 2020 13:41:08 +0000
Received: by outflank-mailman (input) for mailman id 36236;
 Tue, 24 Nov 2020 13:41:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lBCh=E6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1khYZ7-000505-W8
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:41:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.46]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b516c6c-9981-402a-99e8-cd038d8b2fe0;
 Tue, 24 Nov 2020 13:40:52 +0000 (UTC)
Received: from DB8PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:10:110::21)
 by AM9PR08MB5890.eurprd08.prod.outlook.com (2603:10a6:20b:281::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 13:40:51 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::14) by DB8PR04CA0011.outlook.office365.com
 (2603:10a6:10:110::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 24 Nov 2020 13:40:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 13:40:50 +0000
Received: ("Tessian outbound 814be617737e:v71");
 Tue, 24 Nov 2020 13:40:49 +0000
Received: from de7edbc90859.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54834EE7-6B04-4127-AF53-C815F1B7F397.1; 
 Tue, 24 Nov 2020 13:40:44 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de7edbc90859.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Nov 2020 13:40:44 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB4869.eurprd08.prod.outlook.com (2603:10a6:10:de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 13:40:40 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 13:40:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lBCh=E6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1khYZ7-000505-W8
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:41:06 +0000
X-Inumbo-ID: 9b516c6c-9981-402a-99e8-cd038d8b2fe0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.46])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9b516c6c-9981-402a-99e8-cd038d8b2fe0;
	Tue, 24 Nov 2020 13:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQYXXJD7A+pbrSCOAZuoJZB3aa9/kD52SkdCWdP8M7w=;
 b=iMEdH7gvbaT/8j3T2g/9+dWRnCEvOtPYsGHo09DCh0aPJ67KVeQlcUXqSJz4uXIF63wNMq89fq/Elzbc0JBNmJ78i484fq1DJ8kilSDgBtLByg4Y3qiR9KxfI+R1OS00jZuFtAyoujDx0hlpaTU1XVBdGsvUrOJj4ffhRTCP3Ao=
Received: from DB8PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:10:110::21)
 by AM9PR08MB5890.eurprd08.prod.outlook.com (2603:10a6:20b:281::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 13:40:51 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::14) by DB8PR04CA0011.outlook.office365.com
 (2603:10a6:10:110::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 24 Nov 2020 13:40:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 13:40:50 +0000
Received: ("Tessian outbound 814be617737e:v71"); Tue, 24 Nov 2020 13:40:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2f94e8ae1c33e08f
X-CR-MTA-TID: 64aa7808
Received: from de7edbc90859.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 54834EE7-6B04-4127-AF53-C815F1B7F397.1;
	Tue, 24 Nov 2020 13:40:44 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de7edbc90859.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Nov 2020 13:40:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJcgC5al6QzZL23EdhUITd8QO7fTG37sn9c8+BEPGDNya6cJvTfgeqBLHOvYsEMs7ek8hVRjlaO3vWG2oyKIVWkxmMSxwuiv0SpcNtcxUJhP24fz0bZhaFJcAYQnQsz+bYkzB7FG75r3TI6ExTb+Eaqd3q+FWeNobzBaP1aMh7dvPVciP8TyLftuL2YOJNcRaUMXxs+jN5BI1o+7+ldgW2Tcy27YqKiaPHpevawJcfOdg5GVFCauuVD/7qvj9imjVMVKLN7wlfeFxnB/ty21tUy+sm5+LBwkObwxUDFeZyQEZ74T1iJdu+0tN1revdLQO++/4HuvABDs+5C+xzqBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQYXXJD7A+pbrSCOAZuoJZB3aa9/kD52SkdCWdP8M7w=;
 b=ejOJByDK1a1gKopZcbBF4dPt+VySi6p424+ysL/5dp4VnB7fXMRweSLQB13kmL6u+bckEaNfJO4O4nZG1AtPspTaqvvjB3h5gdXRbuaJdu8QQsO5nWJKCZOXCLabuyFXGa6i0BqiWQS5FLTqJEFqhN7YTR17zVdF+Q85S5vWd9IOCp9Si82pSZzBxTm7pN0p0olxagIP5zMLL/0ps+d1CE2acjGa1w27fiTrtn2wANJECEn1iWfeZGo+4oxX+TCytc8bfm2o2BYN3agf9kPyN/hM1K0O5PsySDQmQN61CtsKZP+OCLFVJ3Y9s0rqanVHWrAU2Pg0uja1Bbh3VLtAog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQYXXJD7A+pbrSCOAZuoJZB3aa9/kD52SkdCWdP8M7w=;
 b=iMEdH7gvbaT/8j3T2g/9+dWRnCEvOtPYsGHo09DCh0aPJ67KVeQlcUXqSJz4uXIF63wNMq89fq/Elzbc0JBNmJ78i484fq1DJ8kilSDgBtLByg4Y3qiR9KxfI+R1OS00jZuFtAyoujDx0hlpaTU1XVBdGsvUrOJj4ffhRTCP3Ao=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB4869.eurprd08.prod.outlook.com (2603:10a6:10:de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 13:40:40 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 13:40:40 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A55 erratum #1530923
Thread-Topic: [PATCH] xen/arm: Add workaround for Cortex-A55 erratum #1530923
Thread-Index: AQHWwlLMxtsLDEfokUmiDVx2NYurAanXSiSA
Date: Tue, 24 Nov 2020 13:40:40 +0000
Message-ID: <E5A460E5-7D10-4314-98B4-0D90CD173940@arm.com>
References:
 <61a105672650e7470710183f37351b821b818d1e.1606215998.git.bertrand.marquis@arm.com>
In-Reply-To:
 <61a105672650e7470710183f37351b821b818d1e.1606215998.git.bertrand.marquis@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fd903b0d-087a-4c4c-a9de-08d8907e8ebe
x-ms-traffictypediagnostic: DBBPR08MB4869:|AM9PR08MB5890:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB5890888B55B51448026D2A31FCFB0@AM9PR08MB5890.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1k7htJBalYPJcR3r3i0JgVP0hvKT2lVfVHHp/tvbMTK9Fgaqh2DBDGXibcVtbI1nAPxdRPaluTFu9jUJYAy2C77Kpa8kIIHwvg81JIHJep7M62g634uWT67vCyhBEkWzX6JHwhkdTqGHjU77TBJZx4NUXF1DD3b/9LagyohVN+Zqy37XSjnDSHr2NscTqKQBMFxsEPpyj4Y59Tw7qFfggVs+vT19n7YrtgXDmTqjUr5mAClzdfTTJQXlEVEUDdCzAHWhn3IoJ1FUhz2cGQCN48aHjwJqxjLBhCOm79zkvXZ8+/Ix4De1G3d7Nc3ejAxpZE0f0919fEnVXE/Kf4xeGw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(76116006)(5660300002)(8936002)(64756008)(66556008)(66946007)(91956017)(66446008)(66476007)(2616005)(86362001)(54906003)(71200400001)(37006003)(8676002)(6636002)(6486002)(316002)(33656002)(6512007)(26005)(4326008)(6506007)(186003)(6862004)(478600001)(53546011)(36756003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?3bhdd1TS08abZ7krckLZ8Nf79lo6Bx2BpaFo8Kgy5D2iJXn05LMLcr8m7llu?=
 =?us-ascii?Q?2dNxMnROTDlDIFvLTYX7TYp4Y0DAjWckZdkUXEEjpSIPb6U2KNKWaU1AtG+o?=
 =?us-ascii?Q?RrPPwLFF60sUoqg32GPHFsy1qIgVLCheMSKVYke0oiX+aBopL1IhH7ITI0Qj?=
 =?us-ascii?Q?lHMDn3hgFyzEmK4Ph+5PTkcSMQ62Mzvxb+QFXG3JmpXTBUmg+TQ1/sNXYDJW?=
 =?us-ascii?Q?DJFzpvjmy7C0VA6CWRH8lajKY7pSk4pzkBaMLDrjKev3rXHETwIHqrUiC6b2?=
 =?us-ascii?Q?cP+ZMv7mwqQmBYN8dOYwtAJbRYmXHnh/GVnMH4xByFWDsG1mYPprXA6qda+0?=
 =?us-ascii?Q?mlygQT8P6kPI8P27kpbMWMVrHOL9eGG69ZHypDbuLxeNKoZwmkLXytJQ+tR+?=
 =?us-ascii?Q?CI2kZ2RQpbRimKl4LVjNhrsykUEOlKtuUIiupiJ6fBJsT51CGAn0GnqQE618?=
 =?us-ascii?Q?Eur838qqsRNyQsFlR9JKX2bPFPiJLzmJPn10439E0zXQ7cNQ0VTPEeTsuXMG?=
 =?us-ascii?Q?+mjyIppXqUpqwtyRb4fxpYhxWPYSBfBeqZ+UJ4xsQfNw7DqbTGvSkLhfL+3n?=
 =?us-ascii?Q?QEVT+8c59HkYYoM/b4TuR21yjlw0IGm1sqQJa8rls0NUIYmagm9VFMeddxht?=
 =?us-ascii?Q?bk4ZT5S2DNOZ+MLqnXL/LnaUekavvDdFxxivcKAOFHSKN9dXnC0MDhu7zxLZ?=
 =?us-ascii?Q?ojXaAUxSxJD3H4CHWEkbHg1nfHKR1yl1ZzTDdZrWyqV+IVEsgcfa64GRzlzk?=
 =?us-ascii?Q?dvwWyR8x0Og+p9bu1nz1DKbQAMTvRU3YN/Q9NK7vTzwpj6chJ/+OkXgHt1Vt?=
 =?us-ascii?Q?3l9rTpkocbz/0jdcTplzrCptVG5uSFRMbJqloC/3qwejbQBtOx20nWV5CBs4?=
 =?us-ascii?Q?K6vIr0S/UL7lBqw9RaamklrvIrHMttFt88tkNoBbk6kU3GdYds0Ux8dBEZ1r?=
 =?us-ascii?Q?w3hfz1vsDShwq7oFPC8lrDpp3lKpnKyjwT61ECJ6ufyMYeqPOV8pqGN9h1uH?=
 =?us-ascii?Q?i7VX?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D1904BFA5139EC45B7651B9D04A5CA40@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4869
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2f9ca3c5-284e-4893-518c-08d8907e8883
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wJ1/kcnak7xtOfiEpKZmGJeQhR1lKi4u7Fvv5p4uFXIbAzxpo/fDEK3VYZcZFocMaLsBdBXv1sUFgkh4g2/fHc4bSBMaMXJWGqH7O9uTvnhe4AdOh2l31M/tNqspfexhfqCtSEyEE3k0L8Vhswa6RhDCqDBvx+jMsWFZS2Q02Ov/CWOPJzsskcSrP8CAjO90ivbykU0zslS6Monn7tLvJr3pMlbo2iHrWvquCfZuYptU6K2mu2oIiPv+nP3ct+MEFm4JyN9oY/LWJVgj2ByyjT+iEOWnNIQD1n0IOWyt3PyLxRC+rF45QvFMHrci4oX0uSnqUcP98pSaHCdwtmXDlnyRXcdan3hoIqZ2GaE42157r/aScUPG8jf2tyH8RJSbkEZcNiJFw1Eu0Jm4P4Mhbg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966005)(107886003)(5660300002)(82740400003)(81166007)(47076004)(70206006)(70586007)(356005)(6636002)(316002)(33656002)(6486002)(336012)(4326008)(54906003)(37006003)(86362001)(36756003)(2616005)(53546011)(6862004)(6506007)(6512007)(478600001)(186003)(26005)(8676002)(2906002)(82310400003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 13:40:50.7974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd903b0d-087a-4c4c-a9de-08d8907e8ebe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5890

Hello ,

> On 24 Nov 2020, at 11:12 am, Bertrand Marquis <Bertrand.Marquis@arm.com> =
wrote:
>=20
> On the Cortex A55, TLB entries can be allocated by a speculative AT
> instruction. If this is happening during a guest context switch with an
> inconsistent page table state in the guest, TLBs with wrong values might
> be allocated.
> The ARM64_WORKAROUND_AT_SPECULATE workaround is used as for erratum
> 1165522 on Cortex A76 or Neoverse N1.
>=20
> This change is also introducing the MIDR identifier for the Cortex-A55.
>=20
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> docs/misc/arm/silicon-errata.txt | 1 +
> xen/arch/arm/cpuerrata.c         | 6 ++++++
> xen/include/asm-arm/processor.h  | 2 ++
> 3 files changed, 9 insertions(+)
>=20
> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-err=
ata.txt
> index d183ba543f..27bf957ebf 100644
> --- a/docs/misc/arm/silicon-errata.txt
> +++ b/docs/misc/arm/silicon-errata.txt
> @@ -45,6 +45,7 @@ stable hypervisors.
> | ARM            | Cortex-A53      | #827319         | ARM64_ERRATUM_8273=
19    |
> | ARM            | Cortex-A53      | #824069         | ARM64_ERRATUM_8240=
69    |
> | ARM            | Cortex-A53      | #819472         | ARM64_ERRATUM_8194=
72    |
> +| ARM            | Cortex-A55      | #1530923        | N/A              =
       |
> | ARM            | Cortex-A57      | #852523         | N/A               =
      |
> | ARM            | Cortex-A57      | #832075         | ARM64_ERRATUM_8320=
75    |
> | ARM            | Cortex-A57      | #834220         | ARM64_ERRATUM_8342=
20    |
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index cb4795beec..b398d480f1 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -514,6 +514,12 @@ static const struct arm_cpu_capabilities arm_errata[=
] =3D {
>         .capability =3D ARM64_WORKAROUND_AT_SPECULATE,
>         MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
>     },
> +    {
> +        /* Cortex-A55 (All versions as erratum is open in SDEN v14) */
> +        .desc =3D "ARM erratum 1530923",
> +        .capability =3D ARM64_WORKAROUND_AT_SPECULATE,
> +        MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
> +    },
>     {},
> };
>=20
> diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/proces=
sor.h
> index d3d12a9d19..87c8136022 100644
> --- a/xen/include/asm-arm/processor.h
> +++ b/xen/include/asm-arm/processor.h
> @@ -53,6 +53,7 @@
> #define ARM_CPU_PART_CORTEX_A17     0xC0E
> #define ARM_CPU_PART_CORTEX_A15     0xC0F
> #define ARM_CPU_PART_CORTEX_A53     0xD03
> +#define ARM_CPU_PART_CORTEX_A55     0xD05
> #define ARM_CPU_PART_CORTEX_A57     0xD07
> #define ARM_CPU_PART_CORTEX_A72     0xD08
> #define ARM_CPU_PART_CORTEX_A73     0xD09
> @@ -64,6 +65,7 @@
> #define MIDR_CORTEX_A17 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A17)
> #define MIDR_CORTEX_A15 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A15)
> #define MIDR_CORTEX_A53 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A53)
> +#define MIDR_CORTEX_A55 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_COR=
TEX_A55)
> #define MIDR_CORTEX_A57 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A57)
> #define MIDR_CORTEX_A72 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A72)
> #define MIDR_CORTEX_A73 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORT=
EX_A73)
> --=20
> 2.17.1
>=20
>=20


