Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CCE280172
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 16:40:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300.4367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNzjV-0006Ui-Us; Thu, 01 Oct 2020 14:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300.4367; Thu, 01 Oct 2020 14:38:57 +0000
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
	id 1kNzjV-0006UJ-R7; Thu, 01 Oct 2020 14:38:57 +0000
Received: by outflank-mailman (input) for mailman id 1300;
 Thu, 01 Oct 2020 14:38:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e2ni=DI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kNzjT-0006Tn-LS
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 14:38:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.61]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd93f433-6cd1-4e84-a3c8-3454135f7275;
 Thu, 01 Oct 2020 14:38:53 +0000 (UTC)
Received: from DB6PR0202CA0038.eurprd02.prod.outlook.com (2603:10a6:4:a5::24)
 by HE1PR0802MB2300.eurprd08.prod.outlook.com (2603:10a6:3:c5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Thu, 1 Oct
 2020 14:38:50 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::d3) by DB6PR0202CA0038.outlook.office365.com
 (2603:10a6:4:a5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Thu, 1 Oct 2020 14:38:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 14:38:50 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Thu, 01 Oct 2020 14:38:50 +0000
Received: from 59a62720c051.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CDAAF065-18DE-415C-9192-CE5D502960CB.1; 
 Thu, 01 Oct 2020 14:31:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 59a62720c051.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Oct 2020 14:31:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3692.eurprd08.prod.outlook.com (2603:10a6:10:30::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 1 Oct
 2020 14:31:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Thu, 1 Oct 2020
 14:31:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=e2ni=DI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kNzjT-0006Tn-LS
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 14:38:55 +0000
X-Inumbo-ID: cd93f433-6cd1-4e84-a3c8-3454135f7275
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.61])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cd93f433-6cd1-4e84-a3c8-3454135f7275;
	Thu, 01 Oct 2020 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOKLAeyUWz4Ug8BSxfPKBhSvBLMnNmCHuvGaMrq1An0=;
 b=vENXuakr/R9+SYqmOiGpPY17hW6PHMOrYQc3m9pERoymjZ03LxYgg1YogfAndUeH7zZA/UttoQrf2vJO01gKbDZcU2iWGOZtJz9xaN/ov0hWo3pGA7SqDtFs7n+pdwba9ykU3TrUyTjvhIGgfrgJFnMLXzsTLOFaOsRR9afqvZI=
Received: from DB6PR0202CA0038.eurprd02.prod.outlook.com (2603:10a6:4:a5::24)
 by HE1PR0802MB2300.eurprd08.prod.outlook.com (2603:10a6:3:c5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Thu, 1 Oct
 2020 14:38:50 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::d3) by DB6PR0202CA0038.outlook.office365.com
 (2603:10a6:4:a5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Thu, 1 Oct 2020 14:38:50 +0000
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
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 14:38:50 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Thu, 01 Oct 2020 14:38:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 84e36ada68b97d24
X-CR-MTA-TID: 64aa7808
Received: from 59a62720c051.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CDAAF065-18DE-415C-9192-CE5D502960CB.1;
	Thu, 01 Oct 2020 14:31:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 59a62720c051.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 01 Oct 2020 14:31:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+EHIAoPpTuKd0LliO6vjeLusJAPQsS3cg0eh72Q8gi65ad5EAXv0O7AHdNWByPOEE4JSK3hk9O1Pymo1FCLz137uo8kdWu8dXAooQ9PBC2Ufb5D+h59VOOC5o9Ww7v0H/FUEhTrbY4y8TIMwNrFORdO5mw8kK7vIGONt7Uxnf9AUuRwoNXjvJQq1LBiF7RV8qvv2PeFpD/HA1lA432RV6nnHyJ7NQsfTZO0cYRw2pHXb7BqbXebnHAo+2ptc8jbUydEOQWvhyJQDMR5yIsVQwZ/6Q3hDcsEolhJ/NkaqDIz/p2HPFNDsPWGsfp5JVYtDZq57i3buHQl6XjcpzXjQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOKLAeyUWz4Ug8BSxfPKBhSvBLMnNmCHuvGaMrq1An0=;
 b=Nh1U+6vSHprhFknP9fjxUDbPwUDD9dlQu3pvHN6fVol0IM1JN8pw8jGNvFYEVTa2QqJTKGc2vDd05IQykfOXbKsz1A9HUKrJrsrNlF0c+t9GDycvYGjbsV3vnTW/94+NHydIHXgNz4mBOh0w/jiMI3FiNNV7/ezLe/nrheTJSfYJnKC7RcD3OedHF0N0NgaFw7+lR8BtsTXxzTUO51YntmvYWjfNe6u6sjskkxRD3z2XHq5ti3G/MuKQN1ZfiZBHweNGgmHH0B2gmibFBNA+9JjGMY1172HW5jKkHQzxWuOdenCPKcKyf5hld4DcbrMs6AZ+yuh6mFOFZ48UlOAphw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOKLAeyUWz4Ug8BSxfPKBhSvBLMnNmCHuvGaMrq1An0=;
 b=vENXuakr/R9+SYqmOiGpPY17hW6PHMOrYQc3m9pERoymjZ03LxYgg1YogfAndUeH7zZA/UttoQrf2vJO01gKbDZcU2iWGOZtJz9xaN/ov0hWo3pGA7SqDtFs7n+pdwba9ykU3TrUyTjvhIGgfrgJFnMLXzsTLOFaOsRR9afqvZI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3692.eurprd08.prod.outlook.com (2603:10a6:10:30::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 1 Oct
 2020 14:31:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Thu, 1 Oct 2020
 14:31:07 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: George Dunlap <george.dunlap@citrix.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
	<ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Rich
 Persaud <persaur@gmail.com>, Christopher Clark
	<christopher.w.clark@gmail.com>
Subject: Re: [PATCH RFC] docs: Add minimum version depencency policy document
Thread-Topic: [PATCH RFC] docs: Add minimum version depencency policy document
Thread-Index: AQHWlylr89SNNL419USyeHY3I7qFNKmC0KsA
Date: Thu, 1 Oct 2020 14:31:07 +0000
Message-ID: <683E2686-1551-493B-A3AE-D0707C937155@arm.com>
References: <20200930125736.95203-1-george.dunlap@citrix.com>
In-Reply-To: <20200930125736.95203-1-george.dunlap@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 003177c3-df4d-46e5-1bef-08d86617b65b
x-ms-traffictypediagnostic: DB7PR08MB3692:|HE1PR0802MB2300:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB23005D58764602F02A5370C59D300@HE1PR0802MB2300.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4G7lzglvis1bX1KzZ3QCFXASkVSc4jUV/Ho1VszI62CpY2G42VaQoTtruE4hNvQ9ToOHdww6V2vdc7k2xRm85828PFiPWTPwTHQWXqkPf0o444JngxerLgP+4dEOPc+StioObX0CwFJnC9Nz6l6QjNelxLC/xHEII9+PfGg2M8zCItFkfL1xeoqhynp6mzkXQ+pedFoPqzkAEDdqsUMzs9FBtPBPO1nLuzrs7A7f99pYoLoZ0V3sGpQXDKSR1M9sW5nFyNWD60b0R8/Zneu92LEy2oTSTJWi/psmeepTa8ocVXTtiMHq+ZNB7Pt9CRVrK+PSFavaBhy8+LOwW3zv+UUMwnENYmqEd/NpeBs6RHCOU0uF348CKSgpMLLs/Vh4wOhzG7+mdIi5efM6siloxg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(83380400001)(6512007)(6486002)(71200400001)(83080400001)(4326008)(8936002)(7416002)(6916009)(86362001)(2906002)(2616005)(966005)(26005)(6506007)(33656002)(66446008)(8676002)(66556008)(66476007)(53546011)(316002)(91956017)(36756003)(54906003)(186003)(478600001)(76116006)(66946007)(5660300002)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 IzKFFH7djgFTSBXcRNocajZKBnAQW5sIk3d8bTCh/A9jPlUtdLYUVeZ3zQOdpsFZdj6Twtgx3KR9j+iNZI7k8ZYE2KiqzEcK6J4gYMk04aSxoYXy1p37xjH6TMXbf8dG8bUfKvNSaQjoq4QgbDv3M2uYKMVyoZqtge5ED+L9QW/6arefTWy2ebjO8NamSOv1ErbjcDhVl0BxHytomFR2i5Tu1c3DpijnFA+WJCi4zsYd2f3b5Cjdyc+yqkw/Kd3jgrAKT/8WtuICgUJFZQqc0xSNrucu2JKK6h3vGpPz8UtknzzPufFUGQymLsYxe0Qn4pc+HgQLg6gHNXuHcHkInBykOLWPLjuCBhP+aNI2WFYECnb4U2kL4qxzpH+cMpDLYS3KmjHRnQiYfDrFOE0p55qmo4THtey0xYa1wVtzFiCabcv6I+NedvbAt9+441RNRSCmbW8WXaBsGp0OCmJsi4drGUtjDofiidh3T74NKdaUNXUCtfd2dZsG+riY5arTiJErMlYguU9yDsbCA3LrjXYRTJwyNnCr2bWlNIRNT9y/l64xm3ao4Tq3IPsZtbotjh2ScU7Coxsmy2kl7pKwt/Zv5aGr+u9nyZHIdojQ7zBt3377FTjALbhMO+Gu19v5A8dOaNtvs0tZd7vpJFBJnA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F2E096AD44E24E44810CE58BEDC731E8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3692
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	137f9c97-8a51-42c0-25e8-08d86616a2b9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lwXe9FH09fx6Wh8h9XD8zwPgqgiE3DTwHU7Cv/eO3MQgpYM+EvmHnaYpTFH0gg4w2hJS3Cdk3LUQLlcK+Ouwu4E5GVjwyApR5hECicTbYLiADT8a95x5hWm3QXAkOB2cFMUXPmxbvzhww7GyIBZ697DKJ0M/ABsK130V2oAv6KnamGcZL0qVn/pI2BxlLxKUxYJxtSQ7QE4eEn4zryqHxaFxTRiwoNL4iFnZwG77Wq4ZxJzHKihrhXQkuYX7yU9NpaF8594AnVx9M62nk3F+V/ga94wOtGnJ6QsP9vZrQ56Q19gZnLeA7V724ojXEgk1H2zqenNbOrFH1icw2MNNzLi84cpPypUSjEOM8jZjvLQtNbUppJFqMr7lW92IoMuKzlYaNhuOPKeq8vBqzbhglJwQB6Us3EcricYlIsvEqr9jqcmuOGe3YUBhgFX13Ae0SNF/Yw53n9GDJiraEQxu9Fw1LcpT4WvILsRIrdXUHME=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966005)(6486002)(186003)(2906002)(47076004)(966005)(33656002)(4326008)(6862004)(82310400003)(6512007)(36756003)(107886003)(83380400001)(86362001)(82740400003)(8676002)(2616005)(83080400001)(356005)(336012)(54906003)(81166007)(6506007)(5660300002)(53546011)(70206006)(316002)(70586007)(8936002)(26005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 14:38:50.2555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 003177c3-df4d-46e5-1bef-08d86617b65b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2300

Hi George,

+ Christopher Clark to have his view on what to put for Yocto.

> On 30 Sep 2020, at 13:57, George Dunlap <george.dunlap@citrix.com> wrote:
>=20
> Define a specific criteria for how we determine what tools and
> libraries to be compatible with.  This will clarify issues such as,
> "Should we continue to support Python 2.4" moving forward.
>=20
> Note that CentOS 7 is set to stop receiving "normal" maintenance
> updates in "Q4 2020"; assuming that 4.15 is released after that, we
> only need to support CentOS / RHEL 8.
>=20
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
>=20
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Rich Persaud <persaur@gmail.com>
> CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
> ---
> docs/index.rst                        |  2 +
> docs/policies/dependency-versions.rst | 76 +++++++++++++++++++++++++++
> 2 files changed, 78 insertions(+)
> create mode 100644 docs/policies/dependency-versions.rst
>=20
> diff --git a/docs/index.rst b/docs/index.rst
> index b75487a05d..ac175eacc8 100644
> --- a/docs/index.rst
> +++ b/docs/index.rst
> @@ -57,5 +57,7 @@ Miscellanea
> -----------
>=20
> .. toctree::
> +   :maxdepth: 1
>=20
> +   policies/dependency-versions
>    glossary
> diff --git a/docs/policies/dependency-versions.rst b/docs/policies/depend=
ency-versions.rst
> new file mode 100644
> index 0000000000..d5eeb848d8
> --- /dev/null
> +++ b/docs/policies/dependency-versions.rst
> @@ -0,0 +1,76 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Build and runtime dependencies
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +Xen depends on other programs and libraries to build and to run.
> +Chosing a minimum version of these tools to support requires a careful
> +balance: Supporting older versions of these tools or libraries means
> +that Xen can compile on a wider variety of systems; but means that Xen
> +cannot take advantage of features available in newer versions.
> +Conversely, requiring newer versions means that Xen can take advantage
> +of newer features, but cannot work on as wide a variety of systems.
> +
> +Specific dependencies and versions for a given Xen release will be
> +listed in the toplevel README, and/or specified by the ``configure``
> +system.  This document lays out the principles by which those versions
> +should be chosen.
> +
> +The general principle is this:
> +
> +    Xen should build on currently-supported versions of major distros
> +    when released.
> +
> +"Currently-supported" means whatever that distro's version of "full
> +support".  For instance, at the time of writing, CentOS 7 and 8 are
> +listed as being given "Full Updates", but CentOS 6 is listed as
> +"Maintenance updates"; under this criterium, we would try to ensure
> +that Xen could build on CentOS 7 and 8, but not on CentOS 6.
> +
> +Exceptions for specific distros or tools may be made when appropriate.
> +
> +One exception to this is compiler versions for the hypervisor.
> +Support for new instructions, and in particular support for new safety
> +features, may require a newer compiler than many distros support.
> +These will be specified in the README.
> +
> +Distros we consider when deciding minimum versions
> +--------------------------------------------------
> +
> +We currently aim to support Xen building and running on the following di=
stributions:
> +Debian_,
> +Ubuntu_,
> +OpenSUSE_,
> +Arch Linux,
> +SLES_,
> +Yocto_,
> +CentOS_,
> +and RHEL_.
> +
> +.. _Debian: https://www.debian.org/releases/
> +.. _Ubuntu: https://wiki.ubuntu.com/Releases
> +.. _OpenSUSE: https://en.opensuse.org/Lifetime
> +.. _SLES: https://www.suse.com/lifecycle/
> +.. _Yocto: https://wiki.yoctoproject.org/wiki/Releases
> +.. _CentOS: https://wiki.centos.org/About/Product
> +.. _RHEL: https://access.redhat.com/support/policy/updates/errata
> +
> +Specific distro versions supported in this release
> +--------------------------------------------------
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +Distro   Supported releases
> +=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +Debian   10 (Buster)
> +Ubuntu   20.10 (Groovy Gorilla), 20.04 (Focal Fossa), 18.04 (Bionic Beav=
er), 16.04 (Xenial Xerus)
> +OpenSUSE Leap 15.2
> +SLES     SLES 11, 12, 15
> +Yocto    3.1 (Dunfell)

Yocto only supports one version of Xen (as there is usually only one xen re=
cipe per yocto version) which
can make the version here a bit tricky:
Yocto 3.1 (Dunfell) supports only Xen 4.12
Yocto 3.2 (Gategarth) support only Xen 4.14 but has a Yocto master recipe w=
hich should actually be used
by someone who would want to try Xen master.

So I would suggest to put Yocto 3.2 here only.

@Christopher: what is your view here ?

Cheers
Bertrand

> +CentOS   8
> +RHEL     8
> +=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +.. note::
> +
> +   We also support Arch Linux, but as it's a rolling distribution, the
> +   concept of "security supported releases" doesn't really apply.
> --=20
> 2.25.1
>=20
>=20


