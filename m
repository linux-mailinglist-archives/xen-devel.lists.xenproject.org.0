Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D10E1C1088
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 11:57:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUSQD-0000S7-J6; Fri, 01 May 2020 09:57:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rha=6P=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jUSQB-0000Ry-VZ
 for xen-devel@lists.xen.org; Fri, 01 May 2020 09:57:28 +0000
X-Inumbo-ID: 2816ebc6-8b92-11ea-9af7-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.78]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2816ebc6-8b92-11ea-9af7-12813bfff9fa;
 Fri, 01 May 2020 09:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0F1SrCJZGagszlZMESLfxC6Ae3iHXo8wo1NAom7Rss=;
 b=cBKc0F5WBNrVY9IZtWbxtMJOb/RAibEOGNARlFvqazEzo8YU3RuTBm6iZdeAT8jUlQ3neBqpFrhwQqsn0Mc8PouiEj8AN2mFWfKnCrHkoqp8nq4CdT+dFmuItScRlNAbTFcG0qmYbknoqiyYfOj4EkIyUBNgsNYQJgYtYAEwUsk=
Received: from MR2P264CA0031.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::19) by
 DB6PR0802MB2565.eurprd08.prod.outlook.com (2603:10a6:4:a1::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20; Fri, 1 May 2020 09:57:23 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:0:cafe::39) by MR2P264CA0031.outlook.office365.com
 (2603:10a6:500::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Fri, 1 May 2020 09:57:22 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 09:57:22 +0000
Received: ("Tessian outbound 4cdf5642225a:v54");
 Fri, 01 May 2020 09:57:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e7148ed3c3e5fdcf
X-CR-MTA-TID: 64aa7808
Received: from c87f2d2d158f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 84E024D0-5FEB-4C07-97DE-02796AFEF261.1; 
 Fri, 01 May 2020 09:57:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c87f2d2d158f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 May 2020 09:57:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cncbeMWCIPA+iKc46SLpzrYThbN/1N+DaCTqSLO6SgSpy0ZzVq8BvaSIAz/d75Ilxtukfri6t4NwIZFaJS2AymmeVWhaUuLuuoxJyL+xbhdfqr0F2HBAm9oXh35/35hwURyodJRbuyEhfV1bTMEcsTQupOIAGFEYNoIKRMBPNo+mxxjm16kvvxxcZbQgEMM9g7BKq1tjG3lqcz/qkZ7jeqSeBYrOuDtUcRXOiV567Iv0sccqxMu2m3cv3zRbHcbtQFgIjD5TiIN9SRvxd8u8W78cyMMmbNL9/6KeXgzrjnbzSba9RoRsXkv9T/FNX52fPrwoNgdBCgaCZisRTMV9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0F1SrCJZGagszlZMESLfxC6Ae3iHXo8wo1NAom7Rss=;
 b=A/96Hpi+KJh006hvX28FpiPAXiQuphE0pRhicgnk5RdUD1M4h+mwxibY2gKIETr88h4AYTtfa9e6UM9MnKfQFt9XjkQDjhe971kIDBOTkDKUQfOR8BNefw4vNPtvxmb5lNajCYEf8/7LYFqVEbSvsg1DXSX2nmCERhxjbgEb3Ql5fOujjkGHYCv2FAQ2d7fh3+qql8NzIRouZG3d80LRCPyJkXW4fmhR+e6N+oTyzBgE0ewBP1Bdz18inm2R6ubToHM5XV1/urlXED5a9+24XY19jyN4k23IOsd5vHbBuAUv0uig5ApXx6RzqBDK2rCDbIssIdjpTVL3+JCpGpzjgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0F1SrCJZGagszlZMESLfxC6Ae3iHXo8wo1NAom7Rss=;
 b=cBKc0F5WBNrVY9IZtWbxtMJOb/RAibEOGNARlFvqazEzo8YU3RuTBm6iZdeAT8jUlQ3neBqpFrhwQqsn0Mc8PouiEj8AN2mFWfKnCrHkoqp8nq4CdT+dFmuItScRlNAbTFcG0qmYbknoqiyYfOj4EkIyUBNgsNYQJgYtYAEwUsk=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3211.eurprd08.prod.outlook.com (2603:10a6:5:27::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 1 May
 2020 09:57:15 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2937.028; Fri, 1 May 2020
 09:57:15 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Subject: Re: Question...
Thread-Topic: Question...
Thread-Index: AdYffIk+nIOwP7iTQLuOs3KZB2G7LwAIaoMAAAAsHAA=
Date: Fri, 1 May 2020 09:57:15 +0000
Message-ID: <B8FADD00-21A7-4556-93B2-BF5FD2218D84@arm.com>
References: <f017c46e427a45ecab00c1c59413658c@glacier-peak.net>
 <907FA58B-240E-45E6-B452-9094531F715E@arm.com>
In-Reply-To: <907FA58B-240E-45E6-B452-9094531F715E@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.xen.org; dkim=none (message not signed)
 header.d=none; lists.xen.org;
 dmarc=none action=none header.from=arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5c4f3f73-9059-42a2-2195-08d7edb60b38
x-ms-traffictypediagnostic: DB7PR08MB3211:|DB6PR0802MB2565:
X-Microsoft-Antispam-PRVS: <DB6PR0802MB25651CBECB4A7C032F0E4B569DAB0@DB6PR0802MB2565.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: oBjo72NnGK2O8Ra+5xNkjw3W6d5cHu2TkWShUMGsdcP/r/m/yc25zCfHuRcCMpcIQjNtOFm3Gu7Lu+5ZyLCd8p2tsTg9LUET6fFpJ+dGwRM9EHpYZg0nixhzrYRD6IHyxGkoT+/BOEtl1ryfmLMOxpA9lv7AnY+1yxFU+2ijKMy85p7aU7sLv6JfaE5NpUBz5EsmXdGPzArPqSKzv7Vq4zJ3Ex6xjsKNIgQPO0kjyqcRK4LD6nadpmEmOw1DvRPmp3fN81zvTRwXUqeNBur7uXs5QAVn+AHOnI1UOAIRcfvspXxG2xmjVH/Dflw4QP+xLtEwJCn686LOBD/OEF9/pcPVvLaVhSqs/6sE59atq3/IwyzXnl7cKncITwzKl44dxM8T/WOHJem11jQI/vDnRnnJf3VmX9Y5JVH5OZqV8dIpGPLffsNHm4bZ6PYhm3a0
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(7116003)(4326008)(33656002)(3480700007)(6506007)(6916009)(53546011)(186003)(316002)(26005)(6512007)(71200400001)(8936002)(8676002)(86362001)(2616005)(6486002)(2906002)(66946007)(478600001)(91956017)(66476007)(76116006)(66446008)(64756008)(66556008)(36756003)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: dGsqayzU9Oqyf1EIHTnAfykUxurkJXy9I8+3DRPwAtPT1wvkHuUrQIjPWEs6pwSnwlD0tplhYFtLtcm3/2Fv55HNlpbIBzyC1QaM0JyiHH3ENsyspUVV86nave+7CgG9TTk9AxoUlNWQ8lcPLxAMlYmp6WOlkJzSNJcyw549qxmtNoFkXpxD9Exi9rIo03SFJPOVNa9DfLgx6rSpSDLkvW//GL/6S7ERxejjkhNKDAsXcZOg66+Pdeg6lVjirgSuruMNptKTjXA8TwU17WfUKOzB+X0lrxdyRg3MkYDoJ1w2czFG7CM1X3RyBHKJnEwMxxQUY2dDQx3CqKqL5SihPQRC62MNA+EQPFEyw08LqoHvnnSuwTPHbBIh7e9hTj4J6276WCS3/+w3FNcG4lJKGl1FBu0tqGHGU28iVcohRt+RjWbJga4Zy6+f14lT6sQPMUOlg2wTJu9BJRXUBVWO+zZJHG8XP3I7oamm6YwZg1LFtiRWtEvKknJC+T8kXM+6xcv5/xqDxkQqQtts+Jn/84Xc9oLMDsyjde6c1OmHfC6w0O+/kTkP41am6vLmstPEyS68f0/CaxNReD98kTIrqPEuLhjaP117bzm4hxv16rVVcC0yugRAraOdx0h7w6P4ZcvgG0Tt9GYK4hg4m6oD72mGojRx3Dw+BxsHd6qAh39/QkwpFo9g28RXfLRUVg5V+yV2nAUKe2Lf/FEh7QlVOQmNdrAnCLW9pIpeTE3EJwyKQBgphIq+3UGQKx05FYvDhC5ZUY2JRNVF7KUYmAK+nonA/+bR9+RFDPlz+VKyyE0=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_B8FADD0021A7455693B2BF5FD2218D84armcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3211
Original-Authentication-Results: lists.xen.org; dkim=none (message not signed)
 header.d=none; lists.xen.org;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966005)(70586007)(47076004)(6512007)(6486002)(2616005)(82310400002)(8676002)(6916009)(336012)(45080400002)(478600001)(356005)(81166007)(2906002)(3480700007)(5660300002)(82740400003)(33656002)(33964004)(36906005)(316002)(186003)(70206006)(8936002)(26005)(53546011)(6506007)(4326008)(86362001)(36756003)(7116003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0fc5a9de-2c2f-42eb-2a44-08d7edb606ff
X-Forefront-PRVS: 0390DB4BDA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +he/xF0WI55ClFbXkH+zs0RVHvwIgt6ziY2fqYljvxD7yuND6zng1z3MRVPmzXPjLrBAZZY55txLLtEa0eIH3hkn2Fgj4w3w3Hh9KZK1BjVeOfPm9MwH38V/Uiu9Ib5MIUUL6+apnmrUzao8QIyww5Q+EFRpxrVdoYZnhmSc5RoDeCI0+mo9JlaTggPVDd41pbregAKJ+rc+MZ4hrgVsDaDx08E5hypEH19Bka4/nqQTmm25hY7JIokZNxAe95dvCCXPXKYLZOzd0vX5audew98H/igKAkZcLuHHSsPXGy/T+Qyl+ZbpBtk8BxMhtaA2s8SxV7WfyoW9yIM9Z0s8YprgAw6w+jCL6AUa2MvQQgm4H9kWj+NUeKEP2eXeuJ/dYKNwc6+K+nf6dGjxkJHfe2s1EyoPUvgcXGljQll06fS7Aq2e5sZVBCPxgseQEFLLu65CVeClCCTlte/N7AfSCFvNqD+6Ap9Rd+AjwCX+YMEggxo3pldnT1wDlHCzlf8yi338J2CHcQAykAAmGtOcjw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 09:57:22.2883 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4f3f73-9059-42a2-2195-08d7edb60b38
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2565
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: nd <nd@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_000_B8FADD0021A7455693B2BF5FD2218D84armcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDEgTWF5IDIwMjAsIGF0IDEwOjUyLCBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5t
YXJxdWlzQGFybS5jb208bWFpbHRvOmJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4+IHdyb3RlOg0K
DQpIaSBTYW11ZWwsDQoNCk9uIDEgTWF5IDIwMjAsIGF0IDA2OjU5LCBTYW11ZWwgUC4gRmVsdG9u
IC0gR1BUIExMQyA8c2FtLmZlbHRvbkBnbGFjaWVyLXBlYWsubmV0PG1haWx0bzpzYW0uZmVsdG9u
QGdsYWNpZXItcGVhay5uZXQ+PiB3cm90ZToNCg0KU28sIEnigJltIHRyeWluZyB0byBnZXQgYSBY
ZW4gRG9tMCBhbmQgRG9tVSwgYm90aCBydW5uaW5nIFVidW50dSAyMC4wNCBMVFMgdXAgb24gb3Vy
IGJyYW5kLW5ldyBHaWdhYnl0ZSBUaHVuZGVyWDIgQVJNNjQgYm94LiBJIGNhbiBnZXQgVWJ1bnR1
IHVwIGFuZCBydW5uaW5nLCBidXQgYWZ0ZXIgaW5zdGFsbGluZyB0aGUgWGVuIGJpdHMsIGl0IGRp
ZXMgYWZ0ZXIgdGhlIFVFRkkgbGF5ZXIgbGF1bmNoZXMgR1JVQi4gSSBoYXZlbuKAmXQgYmVlbiBh
YmxlIHRvIGdldCBhbnkgbG9nZmlsZXMgYmVjYXVzZSBpdCBkb2VzbuKAmXQgZ2V0IHRoYXQgZmFy
LiBOb3RoaW5nIHNob3dzIHVwIG9uIHRoZSBzZXJpYWwgcG9ydCBsb2cgZWl0aGVyIOKAkyBpdCBq
dXN0IGhhbmdzLg0KDQpIYXMgYW55b25lIG92ZXIgdGhlcmUgYmVlbiB0cnlpbmcgdG8gZ2V0IGEg
c2ltaWxhciBzZXR1cCBydW5uaW5nPyBBbSBJIG91dCB0byBsdW5jaCBmb3IgdHJ5aW5nIHRoaXMs
IG9yIGlzIHRoZXJlIHNvbWV0aGluZyBJ4oCZbSBtaXNzaW5nPyBBbnkgaGVscCBhdCBhbGwgd291
bGQgYmUgYXBwcmVjaWF0ZWQuDQoNCkkgYW0gY3VycmVudGx5IHBvcnRpbmcgWGVuIG9uIGFuIE4x
U0RQIGFybSBib2FyZCB3aGljaCBpcyBhbHNvIHVzaW5nIGEgRURLMi9ncnViIHNldHVwIGFuZCBJ
IG1hbmFnZSB0byBzdGFydCB4ZW4gZnJvbSBncnViIGFuZCB0aGVuIHN0YXJ0IGRvbTAgcHJvdmlk
aW5nIGEgRFRCLg0KDQpNeSBncnViIGNvbmZpZ3VyYXRpb24gbG9va3MgbGlrZSB0aGlzOg0KbWVu
dWVudHJ5ICd4ZW4nIHsNCiAgIHhlbl9oeXBlcnZpc29yICRwcmVmaXgveGVuLmVmaSBsb2dsdmw9
YWxsIGd1ZXN0X2xvZ2x2bD1hbGwgY29uc29sZT1kdHVhcnQgZHR1YXJ0PXNlcmlhbDAgZG9tMF9t
ZW09MUcNCiAgIHhlbl9tb2R1bGUgJHByZWZpeC9JbWFnZSBjb25zb2xlPWh2YzAgZWZpPW5vcnVu
dGltZSBydyByb290PS9kZXYvc2RhMSByb290d2FpdA0KICAgZGV2aWNldHJlZSAkcHJlZml4L24x
c2RwLmR0Yg0KfQ0KDQpDb3VsZCB5b3Ugc2hhcmUgeW91ciBncnViIGNvbmZpZ3VyYXRpb24gPw0K
DQpCZXJ0cmFuZA0KDQoNCklmIHRoaXMgZG9lc27igJl0IHdvcmssIEnigJltIGdvaW5nIHRvIGhh
dmUgdG8gZ28gdG8gRnJlZUJTRCBhbmQgQmh5dmUgYmVjYXVzZSBJIGtub3cgc29tZW9uZSB3aG8g
aGFzIHRoYXQgd29ya2luZy4gSeKAmWQgcmF0aGVyIHVzZSBMaW51eCB0aGFuIEJTRCBmb3IgdGhp
cyBhcHBsaWNhdGlvbiwgdGhlcmUgYXJlIG1vcmUgZHJpdmVycyBzdXBwb3J0aW5nIHRoaXMgaGFy
ZGF3YXJlLg0KDQpUaGFua3MsDQp+U2FtDQoNCg0KDQoNCjxpbWFnZTAwMS5wbmc+DQpQaG9uZTog
KzEgMjA2IDcwMS03MzIxIGV4dC4gMTAxDQpFbWFpbDogaW5mb0BnbGFjaWVyLXBlYWsubmV0PG1h
aWx0bzppbmZvQGdsYWNpZXItcGVhay5uZXQ+DQoNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250
ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBh
bmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJl
Y2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3Qg
ZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55
IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0u
IFRoYW5rIHlvdS4NCg0KU29ycnksIEkgZm9yZ290IHRvIHJlbW92ZSB0aGUgZGlzY2xhaW1lci4N
CkJlcnRyYW5kDQoNCg==

--_000_B8FADD0021A7455693B2BF5FD2218D84armcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <95EF20DE4737C548B29A6E819B3B5C72@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IDEgTWF5IDIwMjAsIGF0IDEwOjUyLCBCZXJ0cmFuZCBNYXJxdWlzICZsdDs8YSBocmVmPSJtYWls
dG86YmVydHJhbmQubWFycXVpc0Bhcm0uY29tIiBjbGFzcz0iIj5iZXJ0cmFuZC5tYXJxdWlzQGFy
bS5jb208L2E+Jmd0OyB3cm90ZTo8L2Rpdj4NCjxiciBjbGFzcz0iQXBwbGUtaW50ZXJjaGFuZ2Ut
bmV3bGluZSI+DQo8ZGl2IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAs
IDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5
bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IG5vcm1h
bDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50
OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNw
YWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRp
b246IG5vbmU7IGZsb2F0OiBub25lOyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsiIGNsYXNz
PSIiPkhpDQogU2FtdWVsLDwvc3Bhbj48YnIgc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwg
MCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTog
bm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogbm9ybWFsOyBs
ZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBw
eDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2lu
ZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjog
bm9uZTsiIGNsYXNzPSIiPg0KPGJyIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBm
b250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1h
bDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IG5vcm1hbDsgbGV0dGVy
LXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRl
eHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBw
eDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7
IiBjbGFzcz0iIj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxlPSJmb250LWZhbWlseTog
SGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJp
YW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IG5vcm1hbDsgbGV0dGVyLXNwYWNpbmc6IG5v
cm1hbDsgb3JwaGFuczogYXV0bzsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7
IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3aWRvd3M6IGF1dG87
IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc2l6ZS1hZGp1c3Q6IGF1dG87IC13ZWJr
aXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyIgY2xhc3M9
IiI+DQpPbiAxIE1heSAyMDIwLCBhdCAwNjo1OSwgU2FtdWVsIFAuIEZlbHRvbiAtIEdQVCBMTEMg
Jmx0OzxhIGhyZWY9Im1haWx0bzpzYW0uZmVsdG9uQGdsYWNpZXItcGVhay5uZXQiIGNsYXNzPSIi
PnNhbS5mZWx0b25AZ2xhY2llci1wZWFrLm5ldDwvYT4mZ3Q7IHdyb3RlOjxiciBjbGFzcz0iIj4N
CjxiciBjbGFzcz0iIj4NClNvLCBJ4oCZbSB0cnlpbmcgdG8gZ2V0IGEgWGVuIERvbTAgYW5kIERv
bVUsIGJvdGggcnVubmluZyBVYnVudHUgMjAuMDQgTFRTIHVwIG9uIG91ciBicmFuZC1uZXcgR2ln
YWJ5dGUgVGh1bmRlclgyIEFSTTY0IGJveC4gSSBjYW4gZ2V0IFVidW50dSB1cCBhbmQgcnVubmlu
ZywgYnV0IGFmdGVyIGluc3RhbGxpbmcgdGhlIFhlbiBiaXRzLCBpdCBkaWVzIGFmdGVyIHRoZSBV
RUZJIGxheWVyIGxhdW5jaGVzIEdSVUIuIEkgaGF2ZW7igJl0IGJlZW4gYWJsZSB0bw0KIGdldCBh
bnkgbG9nZmlsZXMgYmVjYXVzZSBpdCBkb2VzbuKAmXQgZ2V0IHRoYXQgZmFyLiBOb3RoaW5nIHNo
b3dzIHVwIG9uIHRoZSBzZXJpYWwgcG9ydCBsb2cgZWl0aGVyIOKAkyBpdCBqdXN0IGhhbmdzLjxi
ciBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCkhhcyBhbnlvbmUgb3ZlciB0aGVyZSBiZWVuIHRy
eWluZyB0byBnZXQgYSBzaW1pbGFyIHNldHVwIHJ1bm5pbmc/IEFtIEkgb3V0IHRvIGx1bmNoIGZv
ciB0cnlpbmcgdGhpcywgb3IgaXMgdGhlcmUgc29tZXRoaW5nIEnigJltIG1pc3Npbmc/IEFueSBo
ZWxwIGF0IGFsbCB3b3VsZCBiZSBhcHByZWNpYXRlZC48YnIgY2xhc3M9IiI+DQo8L2Jsb2NrcXVv
dGU+DQo8YnIgc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBI
ZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlh
bnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogbm9ybWFsOyBsZXR0ZXItc3BhY2luZzogbm9y
bWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06
IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRl
eHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsiIGNsYXNzPSIiPg0K
PHNwYW4gc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBIZWx2
ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQt
Y2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogbm9ybWFsOyBsZXR0ZXItc3BhY2luZzogbm9ybWFs
OyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5v
bmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQt
c3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsgZmxvYXQ6IG5vbmU7IGRp
c3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyIgY2xhc3M9IiI+SQ0KIGFtIGN1cnJlbnRseSBwb3J0
aW5nIFhlbiBvbiBhbiBOMVNEUCBhcm0gYm9hcmQgd2hpY2ggaXMgYWxzbyB1c2luZyBhIEVESzIv
Z3J1YiBzZXR1cCBhbmQgSSBtYW5hZ2UgdG8gc3RhcnQgeGVuIGZyb20gZ3J1YiBhbmQgdGhlbiBz
dGFydCBkb20wIHByb3ZpZGluZyBhIERUQi48L3NwYW4+PGJyIHN0eWxlPSJjYXJldC1jb2xvcjog
cmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZv
bnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6
IG5vcm1hbDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQt
aW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3
b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRl
Y29yYXRpb246IG5vbmU7IiBjbGFzcz0iIj4NCjxiciBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigw
LCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0
eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiBub3Jt
YWw7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVu
dDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1z
cGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0
aW9uOiBub25lOyIgY2xhc3M9IiI+DQo8c3BhbiBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAw
LCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxl
OiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiBub3JtYWw7
IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDog
MHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFj
aW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9u
OiBub25lOyBmbG9hdDogbm9uZTsgZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IiBjbGFzcz0i
Ij5NeQ0KIGdydWIgY29uZmlndXJhdGlvbiBsb29rcyBsaWtlIHRoaXM6PC9zcGFuPjxiciBzdHls
ZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9u
dC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3Jt
YWw7IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxp
Z246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUt
c3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lk
dGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyIgY2xhc3M9IiI+DQo8c3BhbiBzdHlsZT0i
Y2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1z
aXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7
IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246
IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3Bh
Y2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6
IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyBmbG9hdDogbm9uZTsgZGlzcGxheTogaW5saW5l
ICFpbXBvcnRhbnQ7IiBjbGFzcz0iIj5tZW51ZW50cnkNCiAneGVuJyB7PC9zcGFuPjxiciBzdHls
ZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9u
dC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3Jt
YWw7IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxp
Z246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUt
c3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lk
dGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyIgY2xhc3M9IiI+DQo8c3BhbiBzdHlsZT0i
Y2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1z
aXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7
IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246
IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3Bh
Y2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6
IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyBmbG9hdDogbm9uZTsgZGlzcGxheTogaW5saW5l
ICFpbXBvcnRhbnQ7IiBjbGFzcz0iIj4mbmJzcDsmbmJzcDsmbmJzcDt4ZW5faHlwZXJ2aXNvcg0K
ICRwcmVmaXgveGVuLmVmaSBsb2dsdmw9YWxsIGd1ZXN0X2xvZ2x2bD1hbGwgY29uc29sZT1kdHVh
cnQgZHR1YXJ0PXNlcmlhbDAgZG9tMF9tZW09MUc8L3NwYW4+PGJyIHN0eWxlPSJjYXJldC1jb2xv
cjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7
IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWln
aHQ6IG5vcm1hbDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRl
eHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFs
OyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0
LWRlY29yYXRpb246IG5vbmU7IiBjbGFzcz0iIj4NCjxzcGFuIHN0eWxlPSJjYXJldC1jb2xvcjog
cmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZv
bnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6
IG5vcm1hbDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQt
aW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3
b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRl
Y29yYXRpb246IG5vbmU7IGZsb2F0OiBub25lOyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsi
IGNsYXNzPSIiPiZuYnNwOyZuYnNwOyZuYnNwO3hlbl9tb2R1bGUNCiAkcHJlZml4L0ltYWdlIGNv
bnNvbGU9aHZjMCBlZmk9bm9ydW50aW1lIHJ3IHJvb3Q9L2Rldi9zZGExIHJvb3R3YWl0PC9zcGFu
PjxiciBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZl
dGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1j
YXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7
IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9u
ZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1z
dHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyIgY2xhc3M9IiI+DQo8c3Bh
biBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGlj
YTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBz
OiBub3JtYWw7IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRl
eHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsg
d2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJv
a2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyBmbG9hdDogbm9uZTsgZGlzcGxh
eTogaW5saW5lICFpbXBvcnRhbnQ7IiBjbGFzcz0iIj4mbmJzcDsmbmJzcDsmbmJzcDtkZXZpY2V0
cmVlDQogJHByZWZpeC9uMXNkcC5kdGI8L3NwYW4+PGJyIHN0eWxlPSJjYXJldC1jb2xvcjogcmdi
KDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQt
c3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IG5v
cm1hbDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5k
ZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3Jk
LXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29y
YXRpb246IG5vbmU7IiBjbGFzcz0iIj4NCjxzcGFuIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAs
IDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5
bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IG5vcm1h
bDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50
OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNw
YWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRp
b246IG5vbmU7IGZsb2F0OiBub25lOyBkaXNwbGF5OiBpbmxpbmUgIWltcG9ydGFudDsiIGNsYXNz
PSIiPn08L3NwYW4+PGJyIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZh
bWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9u
dC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IG5vcm1hbDsgbGV0dGVyLXNwYWNp
bmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJh
bnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdl
YmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IiBjbGFz
cz0iIj4NCjxiciBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6
IEhlbHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFy
aWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGxldHRlci1zcGFjaW5nOiBu
b3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9y
bTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQt
dGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyIgY2xhc3M9IiI+
DQo8c3BhbiBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEhl
bHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFu
dC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGxldHRlci1zcGFjaW5nOiBub3Jt
YWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTog
bm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4
dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyBmbG9hdDogbm9uZTsg
ZGlzcGxheTogaW5saW5lICFpbXBvcnRhbnQ7IiBjbGFzcz0iIj5Db3VsZA0KIHlvdSBzaGFyZSB5
b3VyIGdydWIgY29uZmlndXJhdGlvbiA/PC9zcGFuPjxiciBzdHlsZT0iY2FyZXQtY29sb3I6IHJn
YigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250
LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiBu
b3JtYWw7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWlu
ZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29y
ZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNv
cmF0aW9uOiBub25lOyIgY2xhc3M9IiI+DQo8YnIgc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwg
MCwgMCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHls
ZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogbm9ybWFs
OyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6
IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3Bh
Y2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlv
bjogbm9uZTsiIGNsYXNzPSIiPg0KPHNwYW4gc3R5bGU9ImNhcmV0LWNvbG9yOiByZ2IoMCwgMCwg
MCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1zdHlsZTog
bm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogbm9ybWFsOyBs
ZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBw
eDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtc3BhY2lu
ZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjog
bm9uZTsgZmxvYXQ6IG5vbmU7IGRpc3BsYXk6IGlubGluZSAhaW1wb3J0YW50OyIgY2xhc3M9IiI+
QmVydHJhbmQ8L3NwYW4+PGJyIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBmb250
LWZhbWlseTogSGVsdmV0aWNhOyBmb250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsg
Zm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IG5vcm1hbDsgbGV0dGVyLXNw
YWNpbmc6IG5vcm1hbDsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQt
dHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXNwYWNpbmc6IDBweDsg
LXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IiBj
bGFzcz0iIj4NCjxiciBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1p
bHk6IEhlbHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQt
dmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGxldHRlci1zcGFjaW5n
OiBub3JtYWw7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5z
Zm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC1zcGFjaW5nOiAwcHg7IC13ZWJr
aXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyIgY2xhc3M9
IiI+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0iZm9udC1mYW1pbHk6IEhlbHZldGlj
YTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBz
OiBub3JtYWw7IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IG9y
cGhhbnM6IGF1dG87IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRy
YW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd2lkb3dzOiBhdXRvOyB3b3JkLXNw
YWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXNpemUtYWRqdXN0OiBhdXRvOyAtd2Via2l0LXRleHQt
c3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsiIGNsYXNzPSIiPg0KPGJy
IGNsYXNzPSIiPg0KSWYgdGhpcyBkb2VzbuKAmXQgd29yaywgSeKAmW0gZ29pbmcgdG8gaGF2ZSB0
byBnbyB0byBGcmVlQlNEIGFuZCBCaHl2ZSBiZWNhdXNlIEkga25vdyBzb21lb25lIHdobyBoYXMg
dGhhdCB3b3JraW5nLiBJ4oCZZCByYXRoZXIgdXNlIExpbnV4IHRoYW4gQlNEIGZvciB0aGlzIGFw
cGxpY2F0aW9uLCB0aGVyZSBhcmUgbW9yZSBkcml2ZXJzIHN1cHBvcnRpbmcgdGhpcyBoYXJkYXdh
cmUuPGJyIGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIiPg0KVGhhbmtzLDxiciBjbGFzcz0iIj4NCn5T
YW08YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9
IiI+DQo8YnIgY2xhc3M9IiI+DQombHQ7aW1hZ2UwMDEucG5nJmd0OzxiciBjbGFzcz0iIj4NClBo
b25lOiAmIzQzOzEgMjA2IDcwMS03MzIxIGV4dC4gMTAxPGJyIGNsYXNzPSIiPg0KPGEgaHJlZj0i
bWFpbHRvOmluZm9AZ2xhY2llci1wZWFrLm5ldCIgY2xhc3M9IiI+RW1haWw6IGluZm9AZ2xhY2ll
ci1wZWFrLm5ldDwvYT48YnIgY2xhc3M9IiI+DQo8L2Jsb2NrcXVvdGU+DQo8YnIgc3R5bGU9ImNh
cmV0LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6
ZTogMTJweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBm
b250LXdlaWdodDogbm9ybWFsOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBz
dGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNl
OiBub3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAw
cHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsiIGNsYXNzPSIiPg0KPHNwYW4gc3R5bGU9ImNhcmV0
LWNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGZvbnQtc2l6ZTog
MTJweDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250
LXdlaWdodDogbm9ybWFsOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyB0ZXh0LWFsaWduOiBzdGFy
dDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBu
b3JtYWw7IHdvcmQtc3BhY2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7
IHRleHQtZGVjb3JhdGlvbjogbm9uZTsgZmxvYXQ6IG5vbmU7IGRpc3BsYXk6IGlubGluZSAhaW1w
b3J0YW50OyIgY2xhc3M9IiI+SU1QT1JUQU5UDQogTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhp
cyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNv
IGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBs
ZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRo
ZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBv
cg0KIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlv
dS48L3NwYW4+PC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjxiciBjbGFzcz0iIj4NCjxk
aXYgY2xhc3M9IiI+U29ycnksIEkgZm9yZ290IHRvIHJlbW92ZSB0aGUgZGlzY2xhaW1lci48L2Rp
dj4NCjxkaXYgY2xhc3M9IiI+QmVydHJhbmQ8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNz
PSIiPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_B8FADD0021A7455693B2BF5FD2218D84armcom_--

