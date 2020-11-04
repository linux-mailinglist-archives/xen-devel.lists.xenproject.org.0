Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391DF2A65F8
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 15:11:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19153.44386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaJV3-0002P6-Ep; Wed, 04 Nov 2020 14:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19153.44386; Wed, 04 Nov 2020 14:10:57 +0000
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
	id 1kaJV3-0002Oh-BF; Wed, 04 Nov 2020 14:10:57 +0000
Received: by outflank-mailman (input) for mailman id 19153;
 Wed, 04 Nov 2020 14:10:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osUd=EK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kaJV1-0002Oc-U6
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 14:10:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abd61f81-acd7-49dc-9589-6f3b1d50b515;
 Wed, 04 Nov 2020 14:10:53 +0000 (UTC)
Received: from AM4PR0701CA0012.eurprd07.prod.outlook.com
 (2603:10a6:200:42::22) by PR3PR08MB5577.eurprd08.prod.outlook.com
 (2603:10a6:102:81::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:10:51 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:200:42:cafe::6) by AM4PR0701CA0012.outlook.office365.com
 (2603:10a6:200:42::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend
 Transport; Wed, 4 Nov 2020 14:10:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 14:10:51 +0000
Received: ("Tessian outbound d5e343850048:v64");
 Wed, 04 Nov 2020 14:10:50 +0000
Received: from 3309a66f0146.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1538297D-4C67-408D-9D30-4C74CCDEA067.1; 
 Wed, 04 Nov 2020 14:10:44 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3309a66f0146.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Nov 2020 14:10:44 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB3348.eurprd08.prod.outlook.com (2603:10a6:208:65::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 14:10:43 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:10:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=osUd=EK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kaJV1-0002Oc-U6
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 14:10:56 +0000
X-Inumbo-ID: abd61f81-acd7-49dc-9589-6f3b1d50b515
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [40.107.22.87])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id abd61f81-acd7-49dc-9589-6f3b1d50b515;
	Wed, 04 Nov 2020 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhDyhz0csRHAYH2N6Ig7dn10P+0PUlzAJJyD1Tm3b8A=;
 b=uluDOoZCIsd6t2V8W89WjArumgU09l73S0r9/qWV5iinvD9X35MqDENS465DGP6bKmyrPNKz6VuWavx/PCa4+/cs6N14vLU71ukr/FFRyYUfLb6h52Hy4WGh7ucQB1TONPs98oo7cE8R8NVnGMEKWIkflOKa8TOV6kCaJlQwiVU=
Received: from AM4PR0701CA0012.eurprd07.prod.outlook.com
 (2603:10a6:200:42::22) by PR3PR08MB5577.eurprd08.prod.outlook.com
 (2603:10a6:102:81::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:10:51 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:200:42:cafe::6) by AM4PR0701CA0012.outlook.office365.com
 (2603:10a6:200:42::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend
 Transport; Wed, 4 Nov 2020 14:10:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 14:10:51 +0000
Received: ("Tessian outbound d5e343850048:v64"); Wed, 04 Nov 2020 14:10:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a2b72125db14f3ca
X-CR-MTA-TID: 64aa7808
Received: from 3309a66f0146.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1538297D-4C67-408D-9D30-4C74CCDEA067.1;
	Wed, 04 Nov 2020 14:10:44 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3309a66f0146.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 04 Nov 2020 14:10:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKv0ekqTTJVPJBhEouYcpmgDO4cAD5ErUVoRN4MLwHvQrU2x2AsOtkpxpb4RXOvm7Z1QLt1xqPDfiXJajJCizDM6R8fVfxOEyBzVpRzbKojwAAipGS6mt6PWvof/pNcbu7ZUG9VkKDoxvR8EhpjbzqNayeGnK6hcYJjxfokTWl1E19elnJgmSmEmU0X32dLdbGyqUPUEZQqCc6UurcpH/Wj3Fjz3sNpYuF5KNOZPgjZISsFT9vcYqA4x8XbL8nBP5nvflGceYG5wytpIUaLBf5gy0jtiCmO+8NRxRfH6X74bJHruYGmvpWIPlRbSjh29qPEZlKWCgobBzi7dvkNMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhDyhz0csRHAYH2N6Ig7dn10P+0PUlzAJJyD1Tm3b8A=;
 b=boIC7HRriaCSvUuHpcmgVCo9Gjrs6CYl49IrS2iYPp1XFmfOu3OohUnDxG4jKvpgc0w3DXig7tZEDo/LlDpFiIdPNjeZ8hVV0YBu6UdodIsPy/q8wWuZXIjzrEcH/X/x4sBVl8V3Uzw2fLpE06j52MQjkShDDGVVU16fzJSa5EinU+LQbX8v7nDFSDB6tINce742muVeiMBRNX2w34HtzEgXqb87zID31wg88tGnlhyJZf5Xcz6/0CtWXNzibKhVsNmsXqEG2XhWDG0GYkmY9NayEts+ZsnT76WurzZ986oXauIiD0dYhHpvMgNf0eI7mZb1bI4CsvGQ5ziWvOp+Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhDyhz0csRHAYH2N6Ig7dn10P+0PUlzAJJyD1Tm3b8A=;
 b=uluDOoZCIsd6t2V8W89WjArumgU09l73S0r9/qWV5iinvD9X35MqDENS465DGP6bKmyrPNKz6VuWavx/PCa4+/cs6N14vLU71ukr/FFRyYUfLb6h52Hy4WGh7ucQB1TONPs98oo7cE8R8NVnGMEKWIkflOKa8TOV6kCaJlQwiVU=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB3348.eurprd08.prod.outlook.com (2603:10a6:208:65::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 14:10:43 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:10:43 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Rich Persaud <persaur@gmail.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Daniel
 DeGraaf <dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>,
	Roman Shaposhnik <roman@zededa.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH] xen: EXPERT clean-up
Thread-Topic: [RFC PATCH] xen: EXPERT clean-up
Thread-Index:
 AQHWrxxOadLsV5e3vEiMzomhqHWckam0fmYAgADlPwCAALC9AIAAvt0AgAAH4QCAABN9gIABG7kA
Date: Wed, 4 Nov 2020 14:10:43 +0000
Message-ID: <CA576213-6C2B-4F6C-9C61-EFBBE0FFB960@arm.com>
References: <alpine.DEB.2.21.2011031123420.5812@sstabellini-ThinkPad-T480s>
 <E359BD65-2917-4087-A6E1-0AD5521CF823@gmail.com>
 <alpine.DEB.2.21.2011031307430.5812@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2011031307430.5812@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 815397ca-6ef7-4469-9b07-08d880cb6f99
x-ms-traffictypediagnostic: AM0PR08MB3348:|PR3PR08MB5577:
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB5577B9A215362FFFCE67A3129DEF0@PR3PR08MB5577.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 O8uAL/yjEIjnbGeRkvbbko3Nl6Se4jNE8lGZQoMEtQNVCq642rOEBFf6xQwdYwc8zPw+tsSpXgLeqHcPQWy9jMY+rZbp0kMx/SbtDJ/zoTDx+xNYWFNgILI0f7uJzGLxVl+SycLIgWwros7xexnsdzKBd+46qhBT3DfdudgGos/GL6LjXyscbcDvdaCYPYjV6LCGjPTWiJXVHRws1ZCqC/yJgge5aaOuS6kesMfk1QAfUgDEezqWWDW/8OCFwl1PakXmTv9a9MEt8OuBWUV8nMuxQe9ykg46xyqAk5jPjqZwWBtoAqwqd75QglDqYyrFxHaKoG2BqtzGjZIKTtoLKQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3682.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(478600001)(54906003)(316002)(6486002)(5660300002)(186003)(6916009)(26005)(8676002)(91956017)(36756003)(53546011)(2616005)(64756008)(6506007)(66556008)(7416002)(86362001)(33656002)(6512007)(8936002)(4326008)(66476007)(83380400001)(66946007)(71200400001)(76116006)(66446008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 mnSFHwFuIB5C4wApsu5+mxHc22X0E92A4BYlz2q3JPscSEL1tmKgYE7GDaoExZwXXrA5Tmftv4yA9qaGLAN2QuzSNAMhWTsDDADg8q77xKXJjiVtwSi1pWxDFAaufbA/c9HrwVD/BAZIIGoZW/rPcBAyYCtYzoxugawzl/ow2ww1UndXUTQbSHJqNiJ/TYlVthuvCZIhtE89305I9LbpS30YxbzamNLUKos5PPkEpL44X3j02qnJXRvj+snmDHVDJKt2p8chjfponcnrCQ0X8DD/UfH3d4b7PGGQOW2r+SHobyWuHsO+tJUOWPypYT/7i9CaQxBiP7VEOuCQH+KnHf2JL9+JzkvsiDMTyhBssYZH5b+4N7qXnmP7mqta2BPWnlAPqMhguEyQoWe0Ku0qj5aYBnOCmmjNL6FVwf6VDxrMfoaINqO5zmd3kR9oJHACfy7vN6q2nF3EPRofRjM6nsbDWoe+AVCZ0XUqmhFzowVs738IZTckfSCPuFVeMJGqR7mwoAfUpsZ+pWRXMEY7x2TaMueCo2shBK+ivx/fPMoyUFKX8V/F1I1a6vQNiEcG42d5OIC+w4bDG1Vh81mcLOxAINTF2TpNOBlHz2hRmAUek+38mZrNYrbOzkuC4wiILsvspGQNUEI3ET/ABbqr8Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E9D4B1B93FEAE45AFC27E755C873CF4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3348
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e36ef100-eb3c-4753-b931-08d880cb6af1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fZzVIvABKM1A4dOD+anEzEzPnHVNHZukD00nCqGNx2Md/b0dqnxWt3SqG0Ggzk8o/0fcxP9/LCKucr9rkfGbMN3fxXqqc4Ej4JUkjL1fQ3LtTn3vbfnGjP9Ar304D+ovIfYDotrsN6lEDrxINnyJqtvBjk+xN1icIpztoDsYmIvfS+CtBLhUCEWJFh0S+NHS5ngDZsQ/2ZC3xAjFAtMKVC4GNFVV5Ld9jYbRP3M7fi7WLADJo+w0XnHNCqPW2mwiAVTZasyoQLImYN5f0fnirUDijj/VSAAo3Bt4n9VCrtR1mT1H+scvtlk/PpQnPO2VStc5MnLnSoyArmrsv+o5PqBh9IJoyIxozs+gApBO3h60Cj8fVxdywLJICVBV6Bq9mXT0rB1f9XCgm3S+Qqa1Fw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966005)(47076004)(4326008)(36756003)(6862004)(70206006)(26005)(70586007)(86362001)(82310400003)(336012)(356005)(8936002)(6486002)(33656002)(82740400003)(83380400001)(6512007)(107886003)(53546011)(8676002)(5660300002)(2616005)(478600001)(186003)(2906002)(81166007)(6506007)(36906005)(316002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:10:51.0451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 815397ca-6ef7-4469-9b07-08d880cb6f99
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5577

SGkgU3RlZmFubywNCg0KPiBPbiAzIE5vdiAyMDIwLCBhdCAyMToxNSwgU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgMyBOb3Yg
MjAyMCwgUmljaCBQZXJzYXVkIHdyb3RlOg0KPj4gT24gTm92IDMsIDIwMjAsIGF0IDE0OjM3LCBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+IA0K
Pj4+IO+7v09uIFR1ZSwgMyBOb3YgMjAyMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAw
Mi4xMS4yMDIwIDIyOjQxLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+PiBPbiBNb24s
IDIgTm92IDIwMjAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+IE9uIDMxLjEwLjIwMjAgMDE6
MjQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+Pj4+Pj4gQEAgLTc5LDggKzc5LDggQEAg
Y29uZmlnIFNCU0FfVlVBUlRfQ09OU09MRQ0KPj4+Pj4+PiAgICAgU0JTQSBHZW5lcmljIFVBUlQg
aW1wbGVtZW50cyBhIHN1YnNldCBvZiBBUk0gUEwwMTEgVUFSVC4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+
IGNvbmZpZyBBUk1fU1NCRA0KPj4+Pj4+PiAtICAgIGJvb2wgIlNwZWN1bGF0aXZlIFN0b3JlIEJ5
cGFzcyBEaXNhYmxlIiBpZiBFWFBFUlQNCj4+Pj4+Pj4gLSAgICBkZXBlbmRzIG9uIEhBU19BTFRF
Uk5BVElWRQ0KPj4+Pj4+PiArICAgIGJvb2wgIlNwZWN1bGF0aXZlIFN0b3JlIEJ5cGFzcyBEaXNh
YmxlIg0KPj4+Pj4+PiArICAgIGRlcGVuZHMgb24gSEFTX0FMVEVSTkFUSVZFICYmIEVYUEVSVA0K
Pj4+Pj4+PiAgIGRlZmF1bHQgeQ0KPj4+Pj4+IA0KPj4+Pj4+IEF0IHRoZSBleGFtcGxlIG9mIHRo
aXMsIEknbSBhZnJhaWQgd2hlbiB0aGUgZGVmYXVsdCBpc24ndCAibiINCj4+Pj4+PiAob3IgdGhl
cmUncyBubyBkZWZhdWx0IGRpcmVjdGl2ZSBhdCBhbGwsIGFzIG91Z2h0IHRvIGJlDQo+Pj4+Pj4g
ZXF1aXZhbGVudCB0byBhbmQgcHJlZmVycmVkIG92ZXIgImRlZmF1bHQgbiIpLCBzdWNoIGENCj4+
Pj4+PiB0cmFuc2Zvcm1hdGlvbiBpcyBub3QgZnVuY3Rpb25hbGx5IGlkZW50aWNhbDogQmVmb3Jl
IHlvdXINCj4+Pj4+PiBjaGFuZ2UsIHdpdGggIUVYUEVSVCB0aGlzIG9wdGlvbiBkZWZhdWx0cyB0
byB5LiBBZnRlciB5b3VyDQo+Pj4+Pj4gY2hhbmdlIHRoaXMgb3B0aW9uIGlzIHVuYXZhaWxhYmxl
ICh3aGljaCByZXNvbHZlcyB0byBpdCBiZWluZw0KPj4+Pj4+IG9mZiBmb3IgYWxsIGNvbnN1bWlu
ZyBwdXJwb3NlcykuDQo+Pj4+Pj4gDQo+Pj4+Pj4gSU9XIHRoZXJlIGFyZSByZWFzb25zIHRvIGhh
dmUgImlmIC4uLiIgYXR0YWNoZWQgdG8gdGhlIHByb21wdHMNCj4+Pj4+PiAoZm9yIHRoaXMgY29u
c3RydWN0IGluZGVlZCBvbmx5IG1ha2luZyB0aGUgcHJvbXB0IGNvbmRpdGlvbmFsLA0KPj4+Pj4+
IG5vdCB0aGUgZW50aXJlIG9wdGlvbiksIGJ1dCB0aGVyZSBhcmUgYWxzbyBjYXNlcyB3aGVyZSB0
aGUNCj4+Pj4+PiBjbGVhbnVwIHlvdSBkbyBpcyBpbmRlZWQgZGVzaXJhYmxlIC8gaGVscGZ1bC4N
Cj4+Pj4+IA0KPj4+Pj4gWWVhaCwgdGhhbmtzIGZvciBjYXRjaGluZyBpdCwgaXQgaXMgb2J2aW91
c2x5IGEgcHJvYmxlbS4NCj4+Pj4+IA0KPj4+Pj4gTXkgaW50ZW50aW9uIHdhcyBqdXN0IHRvICJ0
YWciIHNvbWVob3cgdGhlIG9wdGlvbnMgdG8gRVhQRVJUIHNvIHRoYXQgaXQNCj4+Pj4+IHdvdWxk
IHNob3cgb24gdGhlIG1lbnUuIE1heWJlIGEgYmV0dGVyLCBzaW1wbGVyLCB3YXkgdG8gZG8gaXQg
aXMNCj4+Pj4+IHRvIGFkZCB0aGUgd29yZCAiRVhQRVJUIiB0byB0aGUgb25lIGxpbmUgcHJvbXB0
Og0KPj4+Pj4gDQo+Pj4+PiBjb25maWcgQVJNX1NTQkQNCj4+Pj4+IC0gICAgYm9vbCAiU3BlY3Vs
YXRpdmUgU3RvcmUgQnlwYXNzIERpc2FibGUiIGlmIEVYUEVSVA0KPj4+Pj4gKyAgICBib29sICJT
cGVjdWxhdGl2ZSBTdG9yZSBCeXBhc3MgRGlzYWJsZSAoRVhQRVJUKSIgaWYgRVhQRVJUDQo+Pj4+
PiAgIGRlcGVuZHMgb24gSEFTX0FMVEVSTkFUSVZFDQo+Pj4+PiAgIGRlZmF1bHQgeQ0KPj4+Pj4g
ICBoZWxwDQo+Pj4+PiANCj4+Pj4+IA0KPj4+Pj4gV2hhdCBkbyB5b3UgdGhpbms/DQo+Pj4+IA0K
Pj4+PiBXaGlsZSBvbiB0aGUgc3VyZmFjZSB0aGlzIG1heSBsb29rIGxpa2UgYW4gaW1wcm92ZW1l
bnQsIEkgZG9uJ3QNCj4+Pj4gc2VlIGhvdyBpdCB3b3VsZCBhY3R1YWxseSBoZWxwOiBJZiB5b3Ug
cmVhZCB0aGUgS2NvbmZpZyBmaWxlDQo+Pj4+IGl0c2VsZiwgdGhlIGRlcGVuZGVuY3kgaXMgc2Vl
biBhbnl3YXkuIEFuZCBvbiB0aGUgbWVudSBJIGRvbid0DQo+Pj4+IHNlZSB0aGUgcG9pbnQgb2Yg
dGVsbGluZyBzb21lb25lIHdobyBoYXMgZW5hYmxlZCBFWFBFUlQgdGhhdCBhDQo+Pj4+IGNlcnRh
aW4gb3B0aW9uIGlzIChvciBpcyBub3QpIGFuIGV4cGVydCBvbmUuIElmIHRoZXkgdGhpbmsNCj4+
Pj4gdGhleSdyZSBleHBlcnRzLCBzbyBzaG91bGQgdGhleSBiZSB0cmVhdGVkLiAoSXQgd2FzLCBh
ZnRlciBhbGwsDQo+Pj4+IGEgZGVsaWJlcmF0ZSBkZWNpc2lvbiB0byBtYWtlIGVuYWJsaW5nIGV4
cGVydCBtb2RlIGVhc2llciwgYW5kDQo+Pj4+IGhlbmNlIGVhc2llciB0byB1c2UgZm9yIHdoYXQg
b25lIG1pZ2h0IGNvbnNpZGVyIG5vdC1yZWFsbHktDQo+Pj4+IGV4cGVydHMuIEkgcmVhbGl6ZSBz
YXlpbmcgc28gbWF5IGJlIGNvbnNpZGVyZWQgdGVuZGVudGlvdXM7IEkNCj4+Pj4gbWVhbiBpdCBp
biBhIHB1cmVseSB0ZWNobmljYWwgc2Vuc2UsIGFuZCBJJ2QgbGlrZSB0byBhcG9sb2dpemUNCj4+
Pj4gaW4gYWR2YW5jZSB0byBhbnlvbmUgbm90IHNoYXJpbmcgdGhpcyBhcyBhIHBvc3NpYmxlIHBl
cnNwZWN0aXZlDQo+Pj4+IHRvIHRha2UuKQ0KPj4+PiANCj4+Pj4gUGx1cywgb2YgY291cnNlLCB0
aGUgYWRkaXRpb24gb2Ygc3VjaCAoRVhQRVJUKSBtYXJrZXJzIHRvDQo+Pj4+IGZ1dHVyZSBvcHRp
b25zJyBwcm9tcHRzIGlzIGxpYWJsZSB0byBnZXQgZm9yZ290dGVuIG5vdyBhbmQgdGhlbiwNCj4+
Pj4gc28gc29vbmVyIG9yIGxhdGVyIHdlJ2QgbGlrZWx5IGVuZCB1cCB3aXRoIGFuIGluY29uc2lz
dGVudA0KPj4+PiBtaXh0dXJlIGFueXdheS4NCj4+PiANCj4+PiBJIHRlbmQgdG8gYWdyZWUgd2l0
aCB5b3Ugb24gZXZlcnl0aGluZyB5b3Ugd3JvdGUuIFRoZSBmdW5kYW1lbnRhbCBpc3N1ZQ0KPj4+
IGlzIHRoYXQgd2UgYXJlIChtaXMpdXNpbmcgRVhQRVJUIHRvIHRhZyBmZWF0dXJlcyB0aGF0IGFy
ZSBleHBlcmltZW50YWwsDQo+Pj4gYXMgZGVmaW5lZCBieSBTVVBQT1JULm1kLg0KPj4+IA0KPj4+
IEl0IGlzIGltcG9ydGFudCB0byBiZSBhYmxlIHRvIGRpc3Rpbmd1aXNoIGNsZWFybHkgYXQgdGhl
IGtjb25maWcgbGV2ZWwNCj4+PiBvcHRpb25zIHRoYXQgYXJlIChzZWN1cml0eSkgc3VwcG9ydGVk
IGZyb20gb3B0aW9ucyB0aGF0IGFyZQ0KPj4+IHVuc3VwcG9ydGVkL2V4cGVyaW1lbnRhbC4gVG9k
YXkgdGhlIG9ubHkgd2F5IHRvIGRvIGl0IGlzIHdpdGggRVhQRVJUDQo+Pj4gd2hpY2ggaXMgbm90
IGdyZWF0IGJlY2F1c2U6DQo+Pj4gDQo+Pj4gLSBpdCBkb2Vzbid0IGNvbnZleSB0aGUgaWRlYSB0
aGF0IGl0IGlzIGZvciB1bnN1cHBvcnRlZC9leHBlcmltZW50YWwNCj4+PiBmZWF0dXJlcw0KPj4+
IC0gaWYgeW91IHdhbnQgdG8gZW5hYmxlIG9uZSB1bnN1cHBvcnRlZCBmZWF0dXJlLCBpdCBpcyBu
b3QgY2xlYXIgd2hhdA0KPj4+IHlvdSBoYXZlIHRvIGRvDQo+Pj4gDQo+Pj4gU28gbWF5YmUgd2Ug
c2hvdWxkIHJlcGxhY2UgRVhQRVJUIHdpdGggVU5TVVBQT1JURUQgKG9yIEVYUEVSSU1FTlRBTCkg
aW4NCj4+PiB0aGUgS2NvbmZpZyBtZW51Pw0KPj4+IA0KPj4+IEl0IHdvdWxkIG1ha2UgaXQgY2xl
YXJlciB0aGF0IGJ5IGVuYWJsaW5nIFVOU1VQUE9SVEVEIHlvdSBhcmUgZ29pbmcgdG8NCj4+PiBn
ZXQgYSBjb25maWd1cmF0aW9uIHRoYXQgaXMgbm90IHNlY3VyaXR5IHN1cHBvcnRlZC4NCj4+IA0K
Pj4gSWYgZ29pbmcgZG93biB0aGlzIHBhdGgsIHRoZXJlIHNob3VsZCBiZSBvbmUsIGF1dGhvcml0
YXRpdmUsIGluLXRyZWUgZGVmaW5pdGlvbiBvZiBmZWF0dXJlLWxldmVsIHN1cHBvcnQgZnJvbSB3
aGljaCBLY29uZmlnIChidWlsZC10aW1lIHBvbGljeSBlbmZvcmNlbWVudCkgYW5kIFNVUFBPUlQu
bWQgKGRvY3VtZW50YXRpb24pIGNhbiBiZSBkZXJpdmVkLiAgTGF0ZXIsIGV2ZW4gcnVuLXRpbWUg
ZW5mb3JjZW1lbnQgY2FuIGJlIHNpbWlsYXJseSBjbGFzc2lmaWVkLiAgRnVTQSBtYXkgYWxzbyB3
aXNoIGZvciBkb2N1bWVudGVkIHBvbGljeSB0byBhbGlnbiB3aXRoIGVuZm9yY2VtZW50Lg0KPiAN
Cj4gVGhlIGdvYWwgaXMgdHJ5aW5nIHRvIGFsaWduIEtjb25maWcgYW5kIFNVUFBPUlQubWQgYnkg
Y2xhcmlmeWluZyB0aGUNCj4gRVhQRVJUIG9wdGlvbiwgd2hpY2ggdG9kYXkgaXMgYSBwb29yIGlt
cGxlbWVudGF0aW9uIG9mICJleHBlcmltZW50YWwiLg0KPiANCj4gVGhlcmUgY291bGQgYmUgZnVy
dGhlciBpbXByb3ZlbWVudHMgZG93biB0aGUgbGluZSwgZm9yIGluc3RhbmNlIHdlIGNvdWxkDQo+
IHRhaW50IFhlbiB3aGVuIFVOU1VQUE9SVEVEIGlzIHNlbGVjdGVkIGFuZCBldmVuIGhhdmUgc2Vw
YXJhdGUga2NvbmZpZw0KPiBvcHRpb25zIGZvciBVTlNVUFBPUlRFRCwgRVhQRVJJTUVOVEFMLCBh
bmQgVEVDSFBSRVZJRVcuIEZ1U2EgaXMgbGlrZWx5DQo+IGdvaW5nIHRvIG5lZWQgaXRzIG93biBT
QUZFVFkgb3B0aW9uIHRvby4gTGlrZSB5b3Ugc3VnZ2VzdGVkLCB3ZSBjb3VsZA0KPiBldmVuIGhh
dmUgYSBzaW5nbGUgc291cmNlIG9mIGZlYXR1cmUtbGV2ZWwgc3VwcG9ydCBpbmZvcm1hdGlvbiBm
b3IgYm90aA0KPiBLY29uZmlnIGFuZCBTVVBQT1JULm1kLg0KPiANCg0KSSBkbyB0aGluayB0aGlz
IGlzIGEgZ3JlYXQgaWRlYSB0aGF0IGNvdWxkIG1ha2UgbGlrZSBlYXNpZXIgZm9yIHVzZXJzLg0K
VGhlcmUgY291bGQgYmUgc29tZSBnZW5lcmljIG9wdGlvbnMgYXMgeW91IHN1Z2dlc3RlZCB0aGF0
IHRoZSB1c2VyDQpjb3VsZCBlbmFibGUgb3Igbm90IGF0IHRoZSB0b3AgbGV2ZWwgb2YgdGhlIGNv
bmZpZ3VyYXRpb24gYW5kIGRlcGVuZGluZw0Kb24gdGhpcyBzb21lIGZlYXR1cmVzL2RyaXZlcnMg
d291bGQgYmUgcG9zc2libGUgdG8gc2VsZWN0IG9yIG5vdC4NCg0KVGhpcyB3b3VsZCBhbHNvIG1h
a2UgaXQgZWFzaWVyIHRvIGdlbmVyYXRlIGEgZnVsbHkgc2VjdXJpdHktc3VwcG9ydGVkIHN5c3Rl
bS4NCg0KVGFpbnRpbmcgdGhlIHN5c3RlbSB3aGVuIG9uZSBvZiB0aGlzIG9wdGlvbiBpcyBhY3Rp
dmF0ZWQgY291bGQgYWxzbyBtYWtlDQppdCBlYXNpZXIgdG8gaWRlbnRpZnkgd2hlbiBzb21lb25l
IGlzIHVzaW5nIGEgZmVhdHVyZSB0aGF0IGlzIG5vdCBzdXBwb3J0ZWQuDQoNCkNoZWVycw0KQmVy
dHJhbmQNCg0KPiBIb3dldmVyLCBJIGRpZG4ndCB3YW50IHRvIGluY3JlYXNlIHRoZSBzY29wZSBv
ZiB0aGlzIG9uZSBwYXRjaC4gRm9yIG5vdywNCj4gaXQgd291bGQgYmUgYSBnb29kIHN0YXJ0IGlm
IHdlIHJlcGxhY2VkIEVYUEVSVCB3aXRoIHNvbWV0aGluZyB0aGF0IGNvdmVycw0KPiBhbnl0aGlu
ZyBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkLCBmb3Igd2hpY2ggVU5TVVBQT1JURUQgbG9va3MgbGlr
ZSBhIGdvb2QNCj4gbmFtZS4NCg0KDQoNCg==

