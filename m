Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CD8285BCE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 11:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3371.9737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ5dc-0005Kf-Kv; Wed, 07 Oct 2020 09:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3371.9737; Wed, 07 Oct 2020 09:21:32 +0000
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
	id 1kQ5dc-0005KG-Ha; Wed, 07 Oct 2020 09:21:32 +0000
Received: by outflank-mailman (input) for mailman id 3371;
 Wed, 07 Oct 2020 09:21:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kQ5db-0005K8-2s
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 09:21:31 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.66]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f32b8c8b-7695-4b0d-b875-4b6cde1aac11;
 Wed, 07 Oct 2020 09:21:29 +0000 (UTC)
Received: from AM5PR1001CA0027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::40)
 by DB8PR08MB5419.eurprd08.prod.outlook.com (2603:10a6:10:118::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 7 Oct
 2020 09:21:27 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::f0) by AM5PR1001CA0027.outlook.office365.com
 (2603:10a6:206:2::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Wed, 7 Oct 2020 09:21:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Wed, 7 Oct 2020 09:21:27 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Wed, 07 Oct 2020 09:21:27 +0000
Received: from 23d9524963af.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 09F4ECDE-2030-4623-B40F-436B17CBA708.1; 
 Wed, 07 Oct 2020 09:20:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 23d9524963af.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Oct 2020 09:20:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4363.eurprd08.prod.outlook.com (2603:10a6:10:ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 7 Oct
 2020 09:20:48 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 09:20:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kQ5db-0005K8-2s
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 09:21:31 +0000
X-Inumbo-ID: f32b8c8b-7695-4b0d-b875-4b6cde1aac11
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown [40.107.0.66])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f32b8c8b-7695-4b0d-b875-4b6cde1aac11;
	Wed, 07 Oct 2020 09:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71dI6c17l9Vcvg63H2T+BIJ5G7zSdn5YP3pLav/4aTs=;
 b=gFEAHn58isla8Dt77LaAEX/s/ni1KWRNH5geqevuWRfFiEhoAYc6uN7i0dGWbVJrA8V2TwqSd+qBKLglRB9FUxh8rgBDwVQjI6cagh+u3I9r6SveGqJIhqarEdnSVBcnbpCB5inInuJh1Uuh8i0u04ccVCni95BsBgd+S8H8oQc=
Received: from AM5PR1001CA0027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::40)
 by DB8PR08MB5419.eurprd08.prod.outlook.com (2603:10a6:10:118::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 7 Oct
 2020 09:21:27 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::f0) by AM5PR1001CA0027.outlook.office365.com
 (2603:10a6:206:2::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Wed, 7 Oct 2020 09:21:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Wed, 7 Oct 2020 09:21:27 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Wed, 07 Oct 2020 09:21:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 73a5ccb73a81ad19
X-CR-MTA-TID: 64aa7808
Received: from 23d9524963af.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 09F4ECDE-2030-4623-B40F-436B17CBA708.1;
	Wed, 07 Oct 2020 09:20:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 23d9524963af.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 07 Oct 2020 09:20:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nb6LWLR94p56Gb+La6S0CK6aBMJked2TAQv0V+253s1yq3hbA8wbp59BP/65dmGWry7IQ23Wxws5ZuHIQ8BJDMExt/jSl1HYnPbXOYD+oEXqq9+7K/2gm1WOlFXI5oIIJGHzeHMvadQC7entnPjg2+QpME7gomq/PbR0IbesniRpr7Blc5ghM6dgSY8gJAxjoA2BOAraOOBbsCatiPrhIayct8r4VeOZy3eklM7Qw0j5ZK+nmp8xa9wJSu1smwVW8hh8ESfMpSKovnq83Gsycn2zXPuqnWGqlcvveX2qjpqEByPnSOjpPHlA/PnyPhaj0o1A3hR1Fn/RD/ABS/XWIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71dI6c17l9Vcvg63H2T+BIJ5G7zSdn5YP3pLav/4aTs=;
 b=hLvbScfd5h0oiVcZBv2y8Nuk9dFHLVMSzDz7T6ISlRXJN1S80Yons+8C1LGB3EvcI3vk3QEVhrcuagqkR6MyI9fClA6OChJtRA3EWmEmjdYq+OsubddDEMlR18BZgDgmFKU+dr2OvuMDmb64tQbi4RgwoECa1HrBMU7XMJugRt5l2fByD3reUtNRMIRBKXZRsXYWIGPhkvM2AtlQoQ5dmWu1menIo803qbfEZcIUdF7izGqfHq/Guo6kiVozcQp+9SZjgi7zWUEdSm4QpD5FcgdKMxeT4qIQExFz1GmUkKdlpSGydmSvud6Ocz5lvikMsWlbQA1KEOKGPWJx/g/tWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71dI6c17l9Vcvg63H2T+BIJ5G7zSdn5YP3pLav/4aTs=;
 b=gFEAHn58isla8Dt77LaAEX/s/ni1KWRNH5geqevuWRfFiEhoAYc6uN7i0dGWbVJrA8V2TwqSd+qBKLglRB9FUxh8rgBDwVQjI6cagh+u3I9r6SveGqJIhqarEdnSVBcnbpCB5inInuJh1Uuh8i0u04ccVCni95BsBgd+S8H8oQc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4363.eurprd08.prod.outlook.com (2603:10a6:10:ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 7 Oct
 2020 09:20:48 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 09:20:48 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] tools: use memcpy instead of strncpy in getBridge
Thread-Topic: [PATCH v2 1/2] tools: use memcpy instead of strncpy in getBridge
Thread-Index: AQHWnIQKr7DQ0C+zLEGkNYhGKt2Q8KmL0a8AgAAEzgCAAAThgIAAAeGA
Date: Wed, 7 Oct 2020 09:20:48 +0000
Message-ID: <B4AB3195-CA48-4845-85E3-F21F3773945E@arm.com>
References:
 <bc191370356c300f84a16d10345d4a0d646f5bae.1601977978.git.bertrand.marquis@arm.com>
 <30a4ddc0-9443-ab02-341c-ae08af7fddea@suse.com>
 <B3E4C5D5-5999-4D92-8F56-FFA7019CD9BA@arm.com>
 <209289fb-6de5-07d7-5597-2bf8d0a58f6e@suse.com>
In-Reply-To: <209289fb-6de5-07d7-5597-2bf8d0a58f6e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 24a2fd58-1631-4f52-f189-08d86aa25e4b
x-ms-traffictypediagnostic: DBBPR08MB4363:|DB8PR08MB5419:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5419058428FC1BC8210949649D0A0@DB8PR08MB5419.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jk/vQXwZN8xepcSCeLKd/cLbARTKOyJZZyxW3cx2Ch5PlFuQjAC9w+xULa975ENA4Js/iMerzF8P9cZjxV9qvc+Oh0Q5BWxTc3aNiH5BentJvW403gd8FdVW1K/0SOxfQlQgFItEZrUxu+7BXNQbRjFdoYrOU21Xj2nmk8XP7JeAP+06Vy5eUEMuBlaChMKynM9Z4G8UZpojzfQ0N4YoIqWx6W0Tu4ByiWQgV90SZppa2aVjtTaagfKwqO8NRHmOJOEw4HoqM1BbvHwaG2C99efRXJIoIilyZGEUvrbVCmTLiIgtQgLRPrq3JMSAzYZtZlv2qXn5QDIjDx2QLQ53sA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(396003)(376002)(346002)(66946007)(76116006)(66556008)(71200400001)(5660300002)(86362001)(66446008)(91956017)(33656002)(83380400001)(66574015)(6512007)(478600001)(8936002)(6486002)(2906002)(54906003)(316002)(66476007)(64756008)(186003)(6506007)(53546011)(6916009)(26005)(4326008)(36756003)(8676002)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 tEdEp6tTJu9DB3n6Wj5tChTNrUD7jGxxgSsURry1g0mngIEVB2vy8m/FHE2XR0qX3NvmjqYXqnPMNviCEWVRodgyuA4nxdTZmgzmnqYTe5Ep7Ekn9ctmyPYZUHIIbZdUCu5gQkdAYrBs/lOHIPUf8RaTiD/yxrI7WX2WjDTKzmKQeS4KCJ4dyBKksCwYI9ddZUrHq1DLoMq9BxetP20Do3+h/99b7pvTDFVVaxrjTeIvnmDcXcIERw4IUkgpnfkk59s0fl5LErluVoymDpNshv6ypYfkxw7sbos2nmqmo2Rff3h0XcVV0NNOLuz0xwCsMg/0nHr+wqpMR9+X+bkiN2unBEYBjWYtbR9l4gH0FlQdZvmuAq/r1EyfeGCPXoqGKvfJ1M5Ydv2/QjrI6cjYPf9giqE/XK6QCYBLl73O64IA5pT7rp6xClucEnClta6XElCP4cVd0T4uJTvBUAsqV6VkWjWq3cG4izA/92LZ+yL0MYqmMtuYeNA4banCZzMb1LOspp7qWD6RSfKYHhROIJSpGFRHpTCRgt28oO0WKjtzjX/9MA9S9Ln86wWifczaodmbBAEKAy8ssScFaIdzwtItCAnVNsXIZWX1l5JYV0i6LBdP5HLsDV9yxeueAd11AdXKWpeVQQw3/4DmvjJYlw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <968305C6C69D374E9608DD7BAEB74582@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4363
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e8718368-bd11-43bf-3393-08d86aa24717
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4ZT78+GBn6MJK8hqcxAUSS8r3cVYBDdz7+e5vWWOtWdgMQuAFaa6p0Cmdih3cjmepaNh4q5kIrTo4payIsQQbPmKftQc/4YJFjB4GXz8GypJ70ctZFKz6X33ECScFdA9ZAOyQDqrXF9dn40c6VeeCBZsGbs4pfYvHEJ+ObPZlwDPLOPgBbYHsDM8t61PUlq1fTVANJsM49cyjxr8As7wEpbh6Bs8zzW+N0u3SgYwH5BgAY57gXFh3JMFVjQb0HP8SNNi/I4Ud2pyG0ijgpNxtP6WRDzA5x1+YFCq2YNzXwroSpRAhaAfesIJhlfmZ5MSG94tnwBTDqN25PlKuOpXzKqLA/FAYMXZyBEiWRr8JH8DukS8FEJ2dnpL0et3+Un6jQM6+eciQWOHVtaeKMFvVg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(346002)(136003)(46966005)(83380400001)(26005)(2616005)(4326008)(8676002)(336012)(186003)(478600001)(6486002)(70206006)(356005)(70586007)(82310400003)(8936002)(81166007)(6512007)(5660300002)(82740400003)(47076004)(86362001)(66574015)(36756003)(6862004)(53546011)(33656002)(6506007)(54906003)(2906002)(36906005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 09:21:27.1592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a2fd58-1631-4f52-f189-08d86aa25e4b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5419

DQoNCj4gT24gNyBPY3QgMjAyMCwgYXQgMTA6MTQsIErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNy4xMC4yMCAxMDo1NiwgQmVydHJhbmQgTWFycXVpcyB3
cm90ZToNCj4+IEhpIEp1cmdlbiwNCj4+PiBPbiA3IE9jdCAyMDIwLCBhdCAwOTozOSwgSsO8cmdl
biBHcm/DnyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAwNy4xMC4yMCAx
MDoyOCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4gVXNlIG1lbWNweSBpbiBnZXRCcmlk
Z2UgdG8gcHJldmVudCBnY2Mgd2FybmluZ3MgYWJvdXQgdHJ1bmNhdGVkDQo+Pj4+IHN0cmluZ3Mu
IFdlIGtub3cgdGhhdCB3ZSBtaWdodCB0cnVuY2F0ZSBpdCwgc28gdGhlIGdjYyB3YXJuaW5nDQo+
Pj4+IGhlcmUgaXMgd3JvbmcuDQo+Pj4+IFJldmVydCBwcmV2aW91cyBjaGFuZ2UgY2hhbmdpbmcg
YnVmZmVyIHNpemVzIGFzIGJpZ2dlciBidWZmZXJzDQo+Pj4+IGFyZSBub3QgbmVlZGVkLg0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5j
b20+DQo+Pj4+IC0tLQ0KPj4+PiBDaGFuZ2VzIGluIHYyOg0KPj4+PiAgVXNlIE1JTiBiZXR3ZWVu
IHN0cmluZyBsZW5ndGggb2YgZGUtPmRfbmFtZSBhbmQgcmVzdWx0TGVuIHRvIGNvcHkgb25seQ0K
Pj4+PiAgdGhlIG1pbmltdW0gc2l6ZSByZXF1aXJlZCBhbmQgcHJldmVudCBjcm9zc2luZyB0byBm
cm9tIGFuIHVuYWxsb2NhdGVkDQo+Pj4+ICBzcGFjZS4NCj4+Pj4gLS0tDQo+Pj4+ICB0b29scy9s
aWJzL3N0YXQveGVuc3RhdF9saW51eC5jIHwgMTEgKysrKysrKysrLS0NCj4+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pj4+IGRpZmYgLS1naXQg
YS90b29scy9saWJzL3N0YXQveGVuc3RhdF9saW51eC5jIGIvdG9vbHMvbGlicy9zdGF0L3hlbnN0
YXRfbGludXguYw0KPj4+PiBpbmRleCBkMmVlNmZkYTY0Li4wYWNlMDNhZjFiIDEwMDY0NA0KPj4+
PiAtLS0gYS90b29scy9saWJzL3N0YXQveGVuc3RhdF9saW51eC5jDQo+Pj4+ICsrKyBiL3Rvb2xz
L2xpYnMvc3RhdC94ZW5zdGF0X2xpbnV4LmMNCj4+Pj4gQEAgLTI5LDYgKzI5LDcgQEANCj4+Pj4g
ICNpbmNsdWRlIDxzdHJpbmcuaD4NCj4+Pj4gICNpbmNsdWRlIDx1bmlzdGQuaD4NCj4+Pj4gICNp
bmNsdWRlIDxyZWdleC5oPg0KPj4+PiArI2luY2x1ZGUgPHhlbi10b29scy9saWJzLmg+DQo+Pj4+
ICAgICNpbmNsdWRlICJ4ZW5zdGF0X3ByaXYuaCINCj4+Pj4gIEBAIC03OCw3ICs3OSwxMyBAQCBz
dGF0aWMgdm9pZCBnZXRCcmlkZ2UoY2hhciAqZXhjbHVkZU5hbWUsIGNoYXIgKnJlc3VsdCwgc2l6
ZV90IHJlc3VsdExlbikNCj4+Pj4gIAkJCQlzcHJpbnRmKHRtcCwgIi9zeXMvY2xhc3MvbmV0LyVz
L2JyaWRnZSIsIGRlLT5kX25hbWUpOw0KPj4+PiAgICAJCQkJaWYgKGFjY2Vzcyh0bXAsIEZfT0sp
ID09IDApIHsNCj4+Pj4gLQkJCQkJc3RybmNweShyZXN1bHQsIGRlLT5kX25hbWUsIHJlc3VsdExl
bik7DQo+Pj4+ICsJCQkJCS8qDQo+Pj4+ICsJCQkJCSAqIERvIG5vdCB1c2Ugc3RybmNweSB0byBw
cmV2ZW50IGNvbXBpbGVyIHdhcm5pbmcgd2l0aA0KPj4+PiArCQkJCQkgKiBnY2MgPj0gMTAuMA0K
Pj4+PiArCQkJCQkgKiBJZiBkZS0+ZF9uYW1lIGlzIGxvbmdlciB0aGVuIHJlc3VsdExlbiB3ZSB0
cnVuY2F0ZSBpdA0KPj4+IA0KPj4+IHMvdGhlbi90aGFuLw0KPj4gV2lsbCBmaXgNCj4+PiANCj4+
Pj4gKwkJCQkJICovDQo+Pj4+ICsJCQkJCW1lbWNweShyZXN1bHQsIGRlLT5kX25hbWUsIE1JTihz
dHJubGVuKGRlLT5kX25hbWUsDQo+Pj4+ICsJCQkJCQkJCQlzaXplb2YoZGUtPmRfbmFtZSkpLHJl
c3VsdExlbiAtIDEpKTsNCj4+PiANCj4+PiBZb3UgY2FuJ3QgdXNlIHNpemVvZihkZS0+ZF9uYW1l
KSBoZXJlLCBhcyBBRkFJSyB0aGVyZSBpcyBubyBndWFyYW50ZWUNCj4+PiB0aGF0IGRlLT5kX25h
bWUgaXNuJ3QgZS5nLiBkZWZpbmVkIGxpa2UgImNoYXIgZF9uYW1lW10iLg0KPj4+IA0KPj4+IE15
IHN1Z2dlc3Rpb24gdG8gdXNlIE5BTUVfTUFYIGFzIHVwcGVyIGJvdW5kYXJ5IGZvciB0aGUgbGVu
Z3RoIHdhcw0KPj4+IHJlYWxseSBtZWFudCB0byBiZSB1c2VkIHRoYXQgd2F5Lg0KPj4+IA0KPj4+
IEFuZCBhZGRpdGlvbmFsbHkgeW91IG1pZ2h0IHdhbnQgdG8gYWRkIDEgdG8gdGhlIHN0cm5sZW4o
KSByZXN1bHQgaW4NCj4+PiBvcmRlciB0byBjb3B5IHRoZSB0cmFpbGluZyAwLWJ5dGUsIHRvbyAo
b3IgeW91IHNob3VsZCB6ZXJvIG91dCB0aGUNCj4+PiByZXN1bHQgYnVmZmVyIGJlZm9yZSBhbmQg
b21pdCB3cml0aW5nIHRoZSBmaW5hbCB6ZXJvIGJ5dGUpLg0KPj4+IA0KPj4+IFRoaW5raW5nIG1v
cmUgYWJvdXQgaXQgemVyb2luZyB0aGUgcmVzdWx0IGJ1ZmZlciBpcyBiZXR0ZXIgYXMgaXQgZXZl
bg0KPj4+IGNvdmVycyB0aGUgdGhlb3JldGljYWwgY2FzZSBvZiBOQU1FX01BWCBiZWluZyBzaG9y
dGVyIHRoYW4gcmVzdWx0TGVuLg0KPj4gU2V0dGluZyB0aGUgcmVzdWx0IGJ1ZmZlciBjb21wbGV0
ZWx5IHRvIDAgYW5kIGRvaW5nIGFmdGVyIGEgY29weSBzb3VuZHMgbGlrZQ0KPj4gYSBiaWcgY29t
cGxleGl0eS4NCj4+IEhvdyBhYm91dDoNCj4+IGNvcHlzaXplID0gTUlOKHN0cm5sZW4oZGUtPmRf
bmFtZSxOQU1FX01BWCksIHJlc3VsdExlbiAtIDEpOw0KPj4gbWVtY3B5KHJlc3VsdCwgZGUtPmRf
bmFtZSwgY29weXNpemUpOw0KPj4gcmVzdWx0W2NvcHlzaXplICsgMV0gPSAwDQo+IA0KPiByZXN1
bHRbY29weXNpemVdID0gMDsNCj4gDQo+PiBUaGlzIHdvdWxkIGNvdmVyIHRoZSBjYXNlIHdoZXJl
IE5BTUVfTUFYIGlzIHNob3J0ZXIgdGhlbiByZXN1bHRMZW4uDQo+IA0KPiBXaHkgaXM6DQo+IA0K
PiBtZW1zZXQocmVzdWx0LCAwLCByZXN1bHRMZW4pOw0KPiBtZW1jcHkocmVzdWx0LCBkZS0+ZF9u
YW1lLCBNSU4oc3RybmxlbihkZS0+ZF9uYW1lLE5BTUVfTUFYKSwgcmVzdWx0TGVuIC0gMSkpOw0K
PiANCj4gQSBiaWcgY29tcGxleGl0eT8NCg0KaXQgaXMgcG90ZW50aWFsbHkgbW9yZSBjb21wdXRh
dGlvbiAoY29tcGxleGl0eSB3YXMgbm90IHRoZSByaWdodCB3b3JkIG1heWJlKS4NCg0KPiANCj4g
SW4gdGhlIGVuZCBib3RoIHZhcmlhbnRzIGFyZSBmaW5lLg0KDQppbiB0aGUgZW5kIEkgYW0gZnVs
bHkgb2sgd2l0aCBhbnksIGF0IHRoZW4gZW5kIHRoZXJlIGlzIG5vIHBlcmZvcm1hbmNlIGlzc3Vl
IGhlcmUuDQpJIHdpbGwgdXNlIHVzZSB0aGUgbWVtc2V0IHNvbHV0aW9uIGFuZCBwdXNoIGEgdjMu
DQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gDQo+IEp1ZXJnZW4NCg0K

