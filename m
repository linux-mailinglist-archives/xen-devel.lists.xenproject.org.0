Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AED28E3D6
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 18:01:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6818.17945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSjDF-0002fw-Jh; Wed, 14 Oct 2020 16:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6818.17945; Wed, 14 Oct 2020 16:01:13 +0000
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
	id 1kSjDF-0002fX-GK; Wed, 14 Oct 2020 16:01:13 +0000
Received: by outflank-mailman (input) for mailman id 6818;
 Wed, 14 Oct 2020 16:01:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kSjDE-0002fS-7g
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:01:12 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::610])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53490081-4d95-4b2c-b35d-e42036191d7f;
 Wed, 14 Oct 2020 16:01:09 +0000 (UTC)
Received: from AM6P195CA0029.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::42)
 by VI1PR08MB3245.eurprd08.prod.outlook.com (2603:10a6:803:48::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 14 Oct
 2020 16:01:07 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::63) by AM6P195CA0029.outlook.office365.com
 (2603:10a6:209:81::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Wed, 14 Oct 2020 16:01:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 16:01:06 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64");
 Wed, 14 Oct 2020 16:01:06 +0000
Received: from 262c79338bce.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5AA6E9BD-A7A5-4496-B86F-CEBA4DC5B97B.1; 
 Wed, 14 Oct 2020 16:01:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 262c79338bce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Oct 2020 16:01:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6025.eurprd08.prod.outlook.com (2603:10a6:10:203::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.29; Wed, 14 Oct
 2020 16:00:59 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 16:00:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kSjDE-0002fS-7g
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:01:12 +0000
X-Inumbo-ID: 53490081-4d95-4b2c-b35d-e42036191d7f
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe08::610])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 53490081-4d95-4b2c-b35d-e42036191d7f;
	Wed, 14 Oct 2020 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibaylR7xBjPsK6RSBCivOJaDHm8ur6lAqEqHCqFu66E=;
 b=H/cF/AtL4le7VBBwD7ljXoAiFxeEAuEiU/5RPaZU+gxduj2J4f30Ghs74P5toxmUqT8D0f1RZqvo50atnjljykrluJIpw97XeGOSBmJOJTed+ASZB1ouh4AxfGXuB3jTRXp207/pO4Pdb1FTc2NxIHPCiEczHuGiVKlo5IhBCE4=
Received: from AM6P195CA0029.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::42)
 by VI1PR08MB3245.eurprd08.prod.outlook.com (2603:10a6:803:48::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 14 Oct
 2020 16:01:07 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::63) by AM6P195CA0029.outlook.office365.com
 (2603:10a6:209:81::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Wed, 14 Oct 2020 16:01:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 16:01:06 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64"); Wed, 14 Oct 2020 16:01:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f6ddcbd06d6467a8
X-CR-MTA-TID: 64aa7808
Received: from 262c79338bce.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5AA6E9BD-A7A5-4496-B86F-CEBA4DC5B97B.1;
	Wed, 14 Oct 2020 16:01:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 262c79338bce.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Oct 2020 16:01:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFwRAeuTl6I9b+HPZciS4XNqT9JKU+IZ9bd4zlsYlOx6QOy9pYEhfuGW3alO6kaDKVk8DQnzul9Y3ffdI9Vypj03g6Uy13cZ9LSGIeWZ7sU/3aM7FGkw2WRk5q0M4LP9UOyokBHlkFS7Bq+EaQqYSJgA67MZhjUADoZrTMwNNTcFvzd1e5M9ibC4zwbmBagG+s4KsCSv7okkiLvQDkLqIKojeJh0A6dLj/Cabxpzlf7DiuS3qPM2UQCXc2PyJyJyZ/mdnjS/7HHDycdajc4rlWvLKHyblynZURc5B1j8qpA4T61V3KRbpJfX7YKA8axxIRK+QSDLjeX1AgTpcNpQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibaylR7xBjPsK6RSBCivOJaDHm8ur6lAqEqHCqFu66E=;
 b=jwRMq9QRiYu/v0wOt6TPc3/DMkAozzNqbB3F64NKWtML1g3Czy+qmzpy/YV8kbuR+Fxjhh0JDdbnbQkZF4BKsxHSfzjES5n7yhcztVl/j5gkVSq+WPUCeU871IigS7oxVNpYx3nemXdygSxVWcz5yOWR2W5w4A0R7lSXf2HW/hPsqcjj1ru9IPVfctWNE0rvVIivVTpt19zMco8gZi8Hj0lD2XU7ELjn5HKjNKUmAIuWZ/c9UNuJEFTIeimBknnQRP3D3UAJIQ50nk0oIzfMkG31i9UmpPSRd2LfOxk7feqxzgOKmJ5L5DZNO+HIo0IB9XjSHaDIybtIuh9E+Nh85g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibaylR7xBjPsK6RSBCivOJaDHm8ur6lAqEqHCqFu66E=;
 b=H/cF/AtL4le7VBBwD7ljXoAiFxeEAuEiU/5RPaZU+gxduj2J4f30Ghs74P5toxmUqT8D0f1RZqvo50atnjljykrluJIpw97XeGOSBmJOJTed+ASZB1ouh4AxfGXuB3jTRXp207/pO4Pdb1FTc2NxIHPCiEczHuGiVKlo5IhBCE4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6025.eurprd08.prod.outlook.com (2603:10a6:10:203::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.29; Wed, 14 Oct
 2020 16:00:59 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 16:00:59 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Warn user on cpu errata 832075
Thread-Topic: [PATCH] xen/arm: Warn user on cpu errata 832075
Thread-Index: AQHWohbM+uoR14U9oEmwJFjy+kmnIqmW8XGAgABQygA=
Date: Wed, 14 Oct 2020 16:00:59 +0000
Message-ID: <5A45EDA3-B01B-4AC3-B2CB-77CF90D024AD@arm.com>
References:
 <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com>
 <c22235d1-9124-74f2-5856-58f7f44dc0b7@xen.org>
In-Reply-To: <c22235d1-9124-74f2-5856-58f7f44dc0b7@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27926528-d4c9-41ff-a525-08d8705a5c20
x-ms-traffictypediagnostic: DBBPR08MB6025:|VI1PR08MB3245:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3245A8B490A0F123623E4BA89D050@VI1PR08MB3245.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:120;OLM:120;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ztfuT7BNSnUVjJSduyh+arVBldEZ/PIkMz1TSVB8cJ0JNqO3d+xEmb2dUi8Zr1TfiFx36QSDUEWd86orvJuoQ5oyhhfaFLI59U+2OytoVfPIjReqNmMszyQhPCERTXt2iPgD4gMgaWta+zEHCpynNOAhIFKdJUQtkvz9utRUDjrqx9McBDx8wZJRl7CSS/G5NkG/rUJAgQxi2LYUe5iQb2UqqcxNrLgEx3Paps0BMIwOTr/LNAfrw3QaTQj1uVLWXKHbS+U99Sq15UNsSP8i/iOLBY3f9Kx9NMfJjSFaC8bwUTgtWx1De2fxr5Iw4dOAojz6P4kNvPErKVcujxnTuywth/8nFl7lTaJkZsAwL+tLw9NMtvAo0w+mIJ0ynivmw97TMFY0xv0JA+2b6QGVdw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(83380400001)(966005)(36756003)(2906002)(4326008)(8936002)(478600001)(316002)(64756008)(33656002)(5660300002)(54906003)(66556008)(66446008)(2616005)(186003)(6512007)(66946007)(66476007)(83080400001)(86362001)(6916009)(71200400001)(76116006)(8676002)(6486002)(53546011)(6506007)(26005)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 ziw5gO5PR1fH5Ref6A3Oq7KZrXgdV2B95cSydud0GJfAeJoJeOyT49BxOm3rc2a/TZg4apcFDk26krnzsY9PJYZnoqu26zwMqfyDlYqk7wlLvmMuVB7prZi16kgKpDlrpWBPEzezfRKo0iuQcCxUXTTYEV+eDuY3Twzv7gbBnFNEeIJDv8QW14CfCTu0+5i1FiUhmECryg19710ogq59qa+aabJz5qVojjrr5w5AbnY+bdYu3n+ZY0Nj/37zsMk7HpDIjum9d9et9LBee4H215N+IKaNEF6zCj8Aep6s9eUp2m5VU4sC9gxU65IHakRw4WkU/jf7ri1CUNXoppKqk/0F3Lsv91DHZQjdHHu6mBMQsPg7k+i0tbI1qD/tjknywnF7PuBO3tdJnMcvpEta6jPvDZqRCwZoFJr3lROCmrBs7ovMOHF8XiVQk269AJfINxoa6m2TxmaBz7oibg2ke0xSpjpSjELfB1gotMhQO3fEIaq92OfKffijIR8UzqzkDKjIxzAIaSzBw+vFHyfRZebNsSHY9ZjuDeyEDBfYkZ/PRpgikhXgTRb2ARfTG/LJXplX5BnmrLWOwSJxspno4FdqF32cDEHIKgYi4gDTtIf1vB8wseuaXsxapoi4vGDDd66M9DbkozrJ2OIfxAQjFQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <69A21FC582315C43B8FF1BDB528DFF0A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6025
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	271e0cdc-5325-4e9b-0dec-08d8705a57ab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MFgI2EM3gGRgdxDeMqvSBVPaZEFlxMIgkPS+FGb/ue+pGyTScQt+QGojrah1zrYMVJOs36NzArNJCAX+bNThq+tQ2RzZe0zXGSlzNKvxrHzdAO6aB00WCBhd4CKlznvLk4Tz4A5wwIqbY0S7K2BKWJh3vn1I8ADps+7Y3xvs2TNu7enJzgN2vlOB0jZBrCBEGiEFEQH6A20s6+RNDXFY8aREUjJYxJbFvxU5rM5e+TnV5FIfor3OakDC5SBBAWbK+25xeiwyXvORPx2XM43UmP4T6gI7ZxiQdSSVlrjinqcZ8q8Dqqo07+RDNV2BYeeRDqYqZH2B05leVAQ72ZBBmzdYH0Z/skiOHLkfpW5Vm43FJs8Ib4ikUOw1iX59jFaktibS1xJMEGc+aIfrSDcO0Rh4c3brLD19/XhrRK5ED/T499ghgVx79DR0Hg8h0UiVcIou6FOo1WLFd5iJzutJQpdh4f4PHigNQnjkMCKI1JE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(478600001)(33656002)(36906005)(2616005)(5660300002)(54906003)(6486002)(82310400003)(316002)(6506007)(336012)(186003)(53546011)(86362001)(26005)(107886003)(47076004)(4326008)(8936002)(966005)(8676002)(2906002)(356005)(36756003)(70206006)(83380400001)(81166007)(6862004)(6512007)(83080400001)(70586007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 16:01:06.6816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27926528-d4c9-41ff-a525-08d8705a5c20
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3245

DQoNCj4gT24gMTQgT2N0IDIwMjAsIGF0IDEyOjExLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiANCj4gT24gMTQvMTAvMjAyMCAxMTo0
MSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+IFdoZW4gYSBDb3J0ZXggQTU3IHByb2Nlc3Nv
ciBpcyBhZmZlY3RlZCBieSBDUFUgZXJyYXRhIDgzMjA3NSwgYSBndWVzdA0KPj4gbm90IGltcGxl
bWVudGluZyB0aGUgd29ya2Fyb3VuZCBmb3IgaXQgY291bGQgZGVhZGxvY2sgdGhlIHN5c3RlbS4N
Cj4+IEFkZCBhIHdhcm5pbmcgZHVyaW5nIGJvb3QgaW5mb3JtaW5nIHRoZSB1c2VyIHRoYXQgb25s
eSB0cnVzdGVkIGd1ZXN0cw0KPj4gc2hvdWxkIGJlIGV4ZWN1dGVkIG9uIHRoZSBzeXN0ZW0uDQo+
IA0KPiBJIHRoaW5rIHdlIHNob3VsZCB1cGRhdGUgU1VQUE9SVC5NRCB0byBzYXkgd2Ugd2lsbCBu
b3Qgc2VjdXJpdHkgc3VwcG9ydCB0aG9zZSBwcm9jZXNzb3JzLiBTdGVmYW5vLCB3aGF0IGRvIHlv
dSB0aGluaz8NCg0KVGhhdCBjb3VsZCBtYWtlIHNlbnNlIHRvIGRvIHRoYXQgeWVzLg0KSWYgU3Rl
ZmFubyBjb25maXJtcyB0aGVuIGkgY2FuIGRvIHRoaXMgaW4gYSB2Mg0KDQo+IA0KPj4gQW4gZXF1
aXZhbGVudCB3YXJuaW5nIGlzIGFscmVhZHkgZ2l2ZW4gdG8gdGhlIHVzZXIgYnkgS1ZNIG9uIGNv
cmVzDQo+PiBhZmZlY3RlZCBieSB0aGlzIGVycmF0YS4NCj4gDQo+IEkgZG9uJ3Qgc2VlbSB0byBm
aW5kIHRoZSB3YXJuaW5nIGluIExpbnV4LiBEbyB5b3UgaGF2ZSBhIGxpbms/DQoNCnN1cmU6DQpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvY29tbWl0Lz9pZD1hYmY1MzJjY2VhY2E5YzIxYTE0ODQ5ODA5MWY4N2RlMWI4YWU5
YjQ5DQoNCj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5t
YXJxdWlzQGFybS5jb20+DQo+PiAtLS0NCj4+ICB4ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgfCAy
MSArKysrKysrKysrKysrKysrKysrKysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKQ0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYyBiL3hlbi9hcmNo
L2FybS9jcHVlcnJhdGEuYw0KPj4gaW5kZXggNmMwOTAxNzUxNS4uOGY5YWI2ZGRlMSAxMDA2NDQN
Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJt
L2NwdWVycmF0YS5jDQo+PiBAQCAtMjQwLDYgKzI0MCwyNiBAQCBzdGF0aWMgaW50IGVuYWJsZV9p
Y19pbnZfaGFyZGVuaW5nKHZvaWQgKmRhdGEpDQo+PiAgICAjZW5kaWYNCj4+ICArI2lmZGVmIENP
TkZJR19BUk02NF9FUlJBVFVNXzgzMjA3NQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgd2Fybl9kZXZp
Y2VfbG9hZF9hY3F1aXJlX2VycmF0YSh2b2lkICpkYXRhKQ0KPj4gK3sNCj4+ICsgICAgc3RhdGlj
IGJvb2wgd2FybmVkID0gZmFsc2U7DQo+PiArDQo+PiArICAgIGlmICggIXdhcm5lZCApDQo+PiAr
ICAgIHsNCj4+ICsgICAgICAgIHdhcm5pbmdfYWRkKCJUaGlzIENQVSBpcyBhZmZlY3RlZCBieSB0
aGUgZXJyYXRhIDgzMjA3NS5cbiINCj4+ICsgICAgICAgICAgICAgICAgICAgICJHdWVzdHMgd2l0
aG91dCByZXF1aXJlZCBDUFUgZXJyYXR1bSB3b3JrYXJvdW5kc1xuIg0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgImNhbiBkZWFkbG9jayB0aGUgc3lzdGVtIVxuIg0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgIk9ubHkgdHJ1c3RlZCBndWVzdHMgc2hvdWxkIGJlIHVzZWQgb24gdGhpcyBzeXN0ZW0u
XG4iKTsNCj4+ICsgICAgICAgIHdhcm5lZCA9IHRydWU7DQo+IA0KPiBJIHdhcyBnb2luZyB0byBz
dWdnZXN0IHRvIHVzZSBXQVJOX09OX09OQ0UoKSBidXQgaXQgbG9va3MgbGlrZSBpdCBuZXZlciBt
YWRlIHVwc3RyZWFtIDooLg0KDQpJIGRpZCBkbyB0aGlzIGFzIGl0IHdhcyBkb25lIGluIHRoZSBz
bWMgd2FybmluZyBmdW5jdGlvbiAodGhhdOKAmXMgd2h5IGkgcHVzaGVkIGEgcGF0Y2ggZm9yIGl0
KS4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHJl
dHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICsjZW5kaWYNCj4+ICsNCj4+ICAjaWZkZWYgQ09ORklH
X0FSTV9TU0JEDQo+PiAgICBlbnVtIHNzYmRfc3RhdGUgc3NiZF9zdGF0ZSA9IEFSTV9TU0JEX1JV
TlRJTUU7DQo+PiBAQCAtNDE5LDYgKzQzOSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXJtX2Nw
dV9jYXBhYmlsaXRpZXMgYXJtX2VycmF0YVtdID0gew0KPj4gICAgICAgICAgLmNhcGFiaWxpdHkg
PSBBUk02NF9XT1JLQVJPVU5EX0RFVklDRV9MT0FEX0FDUVVJUkUsDQo+PiAgICAgICAgICBNSURS
X1JBTkdFKE1JRFJfQ09SVEVYX0E1NywgMHgwMCwNCj4+ICAgICAgICAgICAgICAgICAgICAgKDEg
PDwgTUlEUl9WQVJJQU5UX1NISUZUKSB8IDIpLA0KPj4gKyAgICAgICAgLmVuYWJsZSA9IHdhcm5f
ZGV2aWNlX2xvYWRfYWNxdWlyZV9lcnJhdGEsDQo+PiAgICAgIH0sDQo+PiAgI2VuZGlmDQo+PiAg
I2lmZGVmIENPTkZJR19BUk02NF9FUlJBVFVNXzgzNDIyMA0KPiANCj4gLS0gDQo+IEp1bGllbiBH
cmFsbA0KDQo=

