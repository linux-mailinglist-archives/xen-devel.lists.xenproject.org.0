Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCFA285DFC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 13:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3444.9912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ7R7-0001IM-0Q; Wed, 07 Oct 2020 11:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3444.9912; Wed, 07 Oct 2020 11:16:44 +0000
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
	id 1kQ7R6-0001I0-TU; Wed, 07 Oct 2020 11:16:44 +0000
Received: by outflank-mailman (input) for mailman id 3444;
 Wed, 07 Oct 2020 11:16:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kQ7R4-0001Hr-Ra
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 11:16:42 +0000
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (unknown
 [40.107.9.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7dc95637-f59f-40c9-b920-ab7859968748;
 Wed, 07 Oct 2020 11:16:41 +0000 (UTC)
Received: from MR2P264CA0051.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::15)
 by PR2PR08MB4842.eurprd08.prod.outlook.com (2603:10a6:101:22::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.39; Wed, 7 Oct
 2020 11:16:38 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:31:cafe::ba) by MR2P264CA0051.outlook.office365.com
 (2603:10a6:500:31::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Wed, 7 Oct 2020 11:16:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Wed, 7 Oct 2020 11:16:38 +0000
Received: ("Tessian outbound 195a290eb161:v64");
 Wed, 07 Oct 2020 11:16:37 +0000
Received: from 796f53b6a22b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FFB60F4C-7344-4548-A168-453E7C391813.1; 
 Wed, 07 Oct 2020 11:16:00 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 796f53b6a22b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Oct 2020 11:16:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6315.eurprd08.prod.outlook.com (2603:10a6:10:209::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 7 Oct
 2020 11:15:59 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 11:15:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kQ7R4-0001Hr-Ra
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 11:16:42 +0000
X-Inumbo-ID: 7dc95637-f59f-40c9-b920-ab7859968748
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (unknown [40.107.9.81])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7dc95637-f59f-40c9-b920-ab7859968748;
	Wed, 07 Oct 2020 11:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/QhCZxTrkW3hYNCBauAC1+dF4KNigcGhgl9RNRhYXo=;
 b=YRlJGOiqKHx16JzLMVkmPLwm7npmJacC4x9p1BjWJ8thQVyoFwo2N7qAPruwsv5zC/fFsPBJWYNWLejMUc4zPAa0rizlisi8U9AHiO8MzzsIMj5pEoriJ4oBSuAPO792I8mL8gWlE/4lXpfW3vShamv9y6nyv4wIVb8qJ5L/5uQ=
Received: from MR2P264CA0051.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::15)
 by PR2PR08MB4842.eurprd08.prod.outlook.com (2603:10a6:101:22::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.39; Wed, 7 Oct
 2020 11:16:38 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:31:cafe::ba) by MR2P264CA0051.outlook.office365.com
 (2603:10a6:500:31::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Wed, 7 Oct 2020 11:16:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Wed, 7 Oct 2020 11:16:38 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Wed, 07 Oct 2020 11:16:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a6b6457fa893111d
X-CR-MTA-TID: 64aa7808
Received: from 796f53b6a22b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FFB60F4C-7344-4548-A168-453E7C391813.1;
	Wed, 07 Oct 2020 11:16:00 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 796f53b6a22b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 07 Oct 2020 11:16:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feOJJI+hdM+E+HtJ2duzACofUcML44k0MMsCtERwsVdBy4Cc1+Sj1ew+izJPYVa4u5iX4tSjwRNe9VnuyWoIBHU+JUuM1ZGFfq3VImVqnfnt3jYxfxQ0crIC4SvzoOxtqqQ7+ufHvdftB2LVhq86xB98m7DbYFNjQiJgS6UQOapv7q3NsQSSBJ3TjdR4HLzsKnffBW7XR5DBhsR2I38PcPE+VdC8O4koBz2svFDcjHolh9Pe126+fqmveS5h3pdN13QTOKHXyGj2olOM2n2VCVlJ/C9DXujtBzXmWDiG/2XDp2HRoivSgR+59j+GTWCL1c0VA7PmVSAzZRu8SOM7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/QhCZxTrkW3hYNCBauAC1+dF4KNigcGhgl9RNRhYXo=;
 b=H+HnQZXxTF9M8Imge2x4c7fQWRcNSze7MjAp7tPqy91Lsf5/VZ+ospTC8+SgNw+rYyZR49KrhTxwwNdLwDZ9mkV5C08Jgfv97sfQ2SB3+EDG0QQ01SWnHSIrMyt9uwtbMbnjCjG5c3QgBj6y+hU2CIYeO7MEMg3WJc0W8p3mphPb0XITFSlWyI90WvlyYxEgpwxq2BLca5HMX/u8LvTulUV2UAcsKI7545jcoT2piagTXrC1jtXwVGZdsiuK1AZaWmcmySVA8Zi8lPYCnTSmyL613tD94LMWeIBbHWC/PXDp6UenjCuuThlH9rndRZtmGNdOsgEDUwLlUxBZ+/Z86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/QhCZxTrkW3hYNCBauAC1+dF4KNigcGhgl9RNRhYXo=;
 b=YRlJGOiqKHx16JzLMVkmPLwm7npmJacC4x9p1BjWJ8thQVyoFwo2N7qAPruwsv5zC/fFsPBJWYNWLejMUc4zPAa0rizlisi8U9AHiO8MzzsIMj5pEoriJ4oBSuAPO792I8mL8gWlE/4lXpfW3vShamv9y6nyv4wIVb8qJ5L/5uQ=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6315.eurprd08.prod.outlook.com (2603:10a6:10:209::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 7 Oct
 2020 11:15:59 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 11:15:59 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Wei Liu <wl@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, "open list:X86"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH] build: always use BASEDIR for xen sub-directory
Thread-Topic: [PATCH] build: always use BASEDIR for xen sub-directory
Thread-Index: AQHWmKjTj7VmlPYcLkSjqrrhNFG5S6mEOTwAgAfIdACAAAH7AIAAAXkA
Date: Wed, 7 Oct 2020 11:15:59 +0000
Message-ID: <0379442A-7104-425C-9897-CBA11E7CCE0F@arm.com>
References:
 <556f6327acea2d0343c93da28f1fc17591afd402.1601564274.git.bertrand.marquis@arm.com>
 <706afc44-a414-33ff-da94-b92f7a96f1fc@suse.com>
 <78C4CCD0-403B-4670-A2C2-C1BB2AD498FD@arm.com>
 <20201007111042.2vbyppns6yef55nf@liuwe-devbox-debian-v2>
In-Reply-To: <20201007111042.2vbyppns6yef55nf@liuwe-devbox-debian-v2>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 58c63a26-51fe-4091-f6e6-08d86ab27590
x-ms-traffictypediagnostic: DBBPR08MB6315:|PR2PR08MB4842:
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB48422C0BEAB5DB5E4F19DE279D0A0@PR2PR08MB4842.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 t9yWq+K579JWueIZsnbiH6pzLvHsvLM43WcfvFUnR1AjTgoj0AN5L+oc8rKsj+JndnyEh+Qwl6OpLxZt0b8KOsIZ52iguV6DYZtv2OLQb8kjg/NEr5c1s+mR2zfRoxmB/0rDGyd3SRLlS4EaT18ykpbxU4qb2yyAdk0crKvcVjwowkUeUeR7QRkpw9ARWSKKeBdn7oMbmNSQeE4J88y+0jmNHvdk+bAd+pVQS+HHzj3AdmM9j72beEQ3qGRkFLo0sBJYlztaaJyTz4nCUHPOuLAoGDaXU9imKGKc8nPpFfwICjZ4FQ/w87yFRlcYVdX13xhA6ms/mdZ22A4Gt7LJEA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(54906003)(26005)(6506007)(316002)(186003)(53546011)(2906002)(71200400001)(2616005)(36756003)(8676002)(6512007)(8936002)(7416002)(86362001)(66446008)(64756008)(6486002)(478600001)(4744005)(5660300002)(4326008)(66476007)(6916009)(33656002)(91956017)(66556008)(66946007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 JMUQ8sBfenpXtDbmBLTw0AA49MauoDZXwaQ5c+Ub+PnohCLbJeI8lg/QjXpS7f1XFnQFoflcd/UAAFp0S1LiPjVRqhw+IYO8x8D442K/NCPFgWnwshG4wCna5Nh6wy480QDv+Xo8iLCk+fDYFr9R9WPFJnjuspw7iGzFTz4sqTzM00co+0U0A6yRqjbDI28JC/jSYJUkVOdnmeq5ylLN4GgodxhPJvwJ2Bb3CNWCkkAaJxdyfuPPfTP3ExzyfO6PIS1kxt/pgZz8LGS+t27bwjfzEL4G5Iab26UNLwACM7hf3i5JAIRTE3JwXrjKLeP2ZysptYgtOQpUX1h9qt+5OQTUHckcnKlG1hY/6Y+69yR2V8SRkCkbx+EAr1m0uApm5NLxfHcdgWSzKI9ka9NLQW37lRMyUlDbU1XEIDu3EdRqTzxYP6JBIq9F350Foo/c6A63BquBSlE0kZBwu1QjMo5Q/VphlAqgj5/CThRUqQkuGFdEozdtrzhi0rSLvb+eGAkHNy/BMsxpsXElGgp5KvNhWKUrdbCHdXzxH7LDc483YxHighBRn/815tHTzJ76fsjyTePQHRHFXiVcFIv0fMi227BU3eQKil+uIdOerM5Vs0GVdCgS1CKcyXxtqxoROUoN82nWg9fYGYUgGL4eXQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5BC9E4FC0AE1FF43ABAE4933B1A1C87F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6315
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4ad1d6ad-92c1-48f1-87cb-08d86ab25e66
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ndBQZFoEa12+16esnhxPEmFN70aZ9XCpITg+/0JlFZIecfdtTkJqdAz4XJxi60vzcXfh5PuFHbw8rIdO0dQmbPvv73hc8Cstpkgc7pE3t8zAUTj6bon7uK4HucLo4mwmaTGr40PeN6Dmj7v9MtGBliiRrCSP+Jv8n9Ap0JcFGVAtOwAAKE2HrzzZ82AAqAK0ha0jfySc2Ay79WQEHQ64EkIgZ62PqqfQipfU60FKldDs3j5OxiTnBis3ucu9Bhxn7rHujTzMaJwsEH1zg3AgSbVst8lKTr8g3Q0THPCqf5Dyj9EN1jxq1I5+x3OBpgm0JiEHMMsF2I5XtKn4K00VCfO2a6phKPsMbCgRftYm4Pvtw9r1j+CrzXZCaAbry/te4h49bxsfHw0q37gwIgQd3Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(46966005)(53546011)(6486002)(186003)(70206006)(336012)(36906005)(70586007)(316002)(2906002)(6512007)(6862004)(47076004)(33656002)(356005)(4326008)(82740400003)(8676002)(86362001)(8936002)(82310400003)(6506007)(81166007)(36756003)(54906003)(26005)(2616005)(478600001)(5660300002)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 11:16:38.0973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c63a26-51fe-4091-f6e6-08d86ab27590
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4842



> On 7 Oct 2020, at 12:10, Wei Liu <wl@xen.org> wrote:
>=20
> On Wed, Oct 07, 2020 at 11:03:37AM +0000, Bertrand Marquis wrote:
>>=20
>>=20
>>> On 2 Oct 2020, at 13:12, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 02.10.2020 12:42, Bertrand Marquis wrote:
>>>> Modify Makefiles using $(XEN_ROOT)/xen to use $(BASEDIR) instead.
>>>>=20
>>>> This is removing the dependency to xen subdirectory preventing using a
>>>> wrong configuration file when xen subdirectory is duplicated for
>>>> compilation tests.
>>>>=20
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>=20
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>=20
>>> (but more for the slight tidying than the purpose you name)
>>=20
>> Ping: Could this be pushed ?
>>=20
>=20
> Done.

Thanks a lot

Bertrand



