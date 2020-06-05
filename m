Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043EE1EF236
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 09:37:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh6uV-0007kq-U3; Fri, 05 Jun 2020 07:37:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/r6m=7S=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jh6uU-0007kk-Bi
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 07:37:02 +0000
X-Inumbo-ID: 5747a614-a6ff-11ea-9947-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.43]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5747a614-a6ff-11ea-9947-bc764e2007e4;
 Fri, 05 Jun 2020 07:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS4GeH4syZsy3Q4SJZki0dJdK4ND1m4un0EFcCshH+M=;
 b=NosHQ5kd5qvK0c+vsJRa5LnlAu9S0Ug77/9u4euA8uM/vOsthi/aZSs50jhm+gwjevMu4FEmYQ+8UuyvLO4W5eyRigCMwvnfPe8Ksb02JmjAPz8YCc+THMaGTiYzX6F6B9OuFG5eVxpgSP8DysX9ZswdleeK9a7afiFBhXgmTdo=
Received: from AM6P191CA0046.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::23)
 by DB8PR08MB5097.eurprd08.prod.outlook.com (2603:10a6:10:38::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 07:36:58 +0000
Received: from VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::a2) by AM6P191CA0046.outlook.office365.com
 (2603:10a6:209:7f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Fri, 5 Jun 2020 07:36:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT062.mail.protection.outlook.com (10.152.18.252) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 07:36:57 +0000
Received: ("Tessian outbound 1145f7a293ca:v59");
 Fri, 05 Jun 2020 07:36:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 11b8019d5157e191
X-CR-MTA-TID: 64aa7808
Received: from e926d9de3310.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6FFB7350-1F37-4B3A-B88E-9B572D622BF0.1; 
 Fri, 05 Jun 2020 07:36:52 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e926d9de3310.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Jun 2020 07:36:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFr+vkharbEUx3TpKrqsS0PpSIz+6321uOwyFNztoiV0NXrHueDgQQCktZmn+8PFSt2d+Td8pwaPpaxzQTsPqjzaqLRxMj12J3ZFjpnsC41zGFQG/WW+nQDXmgG03rDNTUe2jKx1xe3kx0GQseCeqA2+WwTE5pZvPJBW54SbBogAEptXjiMjsLr2KFufePx2wGaPW8HT7bxSv+UMKfgEhAXeilbsnTxEAPjYa+u94DTYMzZQSVcnsGPiYFR4qOX4+re0t6hxjQwnTEndzepgfsxirSM9vv5IzbPa8LzUz3JPRzVqGo9b8CC0KirNVcZ9SP696exCCTALG2BanBF33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS4GeH4syZsy3Q4SJZki0dJdK4ND1m4un0EFcCshH+M=;
 b=OxWQUqjmZzX9C4pm6JNLWk4cBPmXga23MC9a3ZQLNgpL13NNdyJprZ7KZS8rYd8RzyPw6LyJku1kcatIPeyH2kCR5/jT0TyahjA+pDq858PpbUqQ7alfbYf9pC5covNBzo/rQoUBfobH0jmxCPKfkzOeW29ytTYJUwi+uZ+mOEidYEbEyPIoIPBos6Cb4JJRSAfTpy8sWJVmQWoP2GaDbjGP+CT6PFY7nfB5kAoxmo5tAKG3a79LoDH4bhYmaMb/6riwNnqnPpvkXvYvtzCoq9Jfwb1s7pLXDkKO3E30K61ZjtJJA1pVzsuw8oEQ7pLB66Rhs6zyt/6Zqj4fcmv9Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS4GeH4syZsy3Q4SJZki0dJdK4ND1m4un0EFcCshH+M=;
 b=NosHQ5kd5qvK0c+vsJRa5LnlAu9S0Ug77/9u4euA8uM/vOsthi/aZSs50jhm+gwjevMu4FEmYQ+8UuyvLO4W5eyRigCMwvnfPe8Ksb02JmjAPz8YCc+THMaGTiYzX6F6B9OuFG5eVxpgSP8DysX9ZswdleeK9a7afiFBhXgmTdo=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB2953.eurprd08.prod.outlook.com (2603:10a6:5:1b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 07:36:50 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 07:36:50 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: CodeWiz2280 <codewiz2280@gmail.com>
Subject: Re: Keystone Issue
Thread-Topic: Keystone Issue
Thread-Index: AQHWOBaIAfEL/lLkK0WiNSn4kZcZc6jDwRQAgAAfVYCAACZwgIACvmKAgABfPYCAAA+JgIAA6NEAgAAP9wCAAAJxgIAAEuGAgAAfEwCAAGmFAIAAh2UAgABV34A=
Date: Fri, 5 Jun 2020 07:36:50 +0000
Message-ID: <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
 <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
 <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
 <25953300-f69d-19a4-9215-49cfedbd16ed@xen.org>
 <CALYbLDh3C02+CV88LqR2zv+ggRgup-Qhi+udGzgePmkdM0KcFw@mail.gmail.com>
 <deee1523-cfb5-f186-11a3-33fa1f7b94c1@xen.org>
 <8C39F9D0-8351-4671-9A39-D5D4BFF02BD6@arm.com>
 <3ff17aa9-0aae-d598-40ce-4e90d4e50cc7@xen.org>
 <00E14EAD-BD23-4A3A-872E-0C47C26B7B41@arm.com>
 <c2466674-a56e-08a4-7f3f-2438d5565953@xen.org>
 <CALYbLDjNptWfVMGjw801y6f0zu40b2pzBnLS+w2Zx5eVStCUYQ@mail.gmail.com>
 <da23ecc8-60f0-8a26-58d5-ea692dcf0102@xen.org>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
In-Reply-To: <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dab7e4f5-1cfe-4f0c-7114-08d809233a55
x-ms-traffictypediagnostic: DB7PR08MB2953:|DB8PR08MB5097:
X-Microsoft-Antispam-PRVS: <DB8PR08MB5097C3B2E41082B0C95EBE349D860@DB8PR08MB5097.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: G6eKBvkPDUJpxurHI+QaGpDakSzHI/uV7g6dS7k8P3ZXxqR0izssxtP+UILCrTdHWAcm+WWYG9HDzh2+ucSBwyvtIqGaeH57e7/PdrZm/0MpTTiMnE95ouvYQeEEcX68YPeGFdJerkMCVNbMKrGmmIS1jlCkuP2Pe+ljOgt9f5TReL0x9yRdT4XgAvvnEyhzOaGAvJvW1vRrKxS9cSF8AHMKmuE+nUs2fxt+80FHsuiquD6gbPLHaGwxMLvnQMS15/O6y8PDg51vgQHCAZfJBWd1HOadwgvSA3SkEpuZdMnY7iCU+fm73RXyVmz3hEGvp8VcNJPvch/3sNU4ivyB7/E/pQYy0N6B8IuWRYxXmtBFrUShIWitxdSmHiz6XBan7Tin9sb3LjyG42ep3Q0AtA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(2906002)(71200400001)(6486002)(5660300002)(186003)(6512007)(36756003)(6916009)(26005)(7116003)(4326008)(6506007)(53546011)(2616005)(91956017)(66946007)(54906003)(478600001)(64756008)(316002)(86362001)(66476007)(966005)(33656002)(76116006)(83380400001)(66556008)(8936002)(66446008)(8676002)(3480700007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: eRf1A9iMPCHbm2osfjOH8HGiNPa29cKhNsfxMkD2EHzKO0nJm3IjBQtDhvcevZ+3y1+EJBORAj8nhe74jeWgYmCm5g8xG9GJZ+KWYiHkhBOnwwd+s/a6N1OtVctZhM2YYwICEZ1kNSIkSTi4Hg4GyELw1jzkAv70doGwU00RQvUyr7rnoxkVQcEXwWeDZZhRTDLRJLWjmoVwJU4DXkH8rqaqT+ienHeEuUdZPbYN9QL0PNEffHTHFlXdE0osCRAneMNPHV/yye1989I9jqrdwDDN+CzUPzG8BPQLlm8tv98pzYxD0sSuBRg08g5P/IEtgQIBArapw5V8rxrkIFp4fILLw3w7ZfIxTeERxV8LIPWuW5wml8hC4WXHys7YTq4XMJETlyS4tkMeO7Isbw1n+Sj7qiiJU0rjijGXA1hK8OIfuPrjvz7oLi7GvFhQCUJxdyHfqrRm9gfRs20yD+68//g5qwHw5nA5aS+JL57kVJA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F07A1C8C7DF914B9301268046F2B8C6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2953
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(53546011)(186003)(26005)(6486002)(47076004)(70206006)(70586007)(5660300002)(6512007)(86362001)(966005)(81166007)(7116003)(356005)(8676002)(3480700007)(83380400001)(82310400002)(36756003)(33656002)(316002)(336012)(6506007)(2906002)(54906003)(478600001)(8936002)(4326008)(2616005)(82740400003)(6862004)(36906005);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9adf43f7-289e-4833-3715-08d8092335ba
X-Forefront-PRVS: 0425A67DEF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f5hyy50exEbq++K+KjY14NijEjIGzoiG3czuJ+AUtrzHQ5JmZlfj69F1nQQ6PpVZTOCcjZY/x5VINgN9EZaEliO1IlajiO49mDCyGqcxjVlDEI734dtgDN5LlWJsEceaqm1wbuLfIxX0kfEqz3FK6Nci4ZYPAM3oK1R2/EIcpZRNjhzddvLZ7lEgq6IdBiIU717UOMEP17/oarWYeQS82Vb6BTbezVCMM5KvINOkZCg7c2ACzKzmJZP5ANwW+MLLKwvgoxHnaorW+c2lLPNhtI53dU4B+xUrrQWN8+Kvg027xE7oz7/OyBXiU8zTSlAjlzFhujMI8AoZuKybe7V9GK7CEZSoFZ1Jj0ktO58jzqqDcKjCelrtON6RY6yjLMJ9Z5yxA+C/FuAnaiM2VcJoKvBgHTKeFQfURbFWoNNyFqg3AgMSWI5JzIYUIptyO3KbXMydobS3D8vGrjfVSKRFDtQWYYHngibHIidcTmDOLmA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 07:36:57.9029 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dab7e4f5-1cfe-4f0c-7114-08d809233a55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5097
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCj4gT24gNSBKdW4gMjAyMCwgYXQgMDM6MjksIENvZGVXaXoyMjgwIDxjb2Rld2l6MjI4
MEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gVGh1LCBKdW4gNCwgMjAyMCBhdCAyOjI0IFBN
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4gDQo+PiBIaSwNCj4+IA0K
Pj4gT24gMDQvMDYvMjAyMCAxMzowNywgQ29kZVdpejIyODAgd3JvdGU6DQo+Pj4gT24gVGh1LCBK
dW4gNCwgMjAyMCBhdCA2OjE2IEFNIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3Rl
Og0KPj4+PiANCj4+Pj4gSGksDQo+Pj4+IA0KPj4+PiBPbiAwNC8wNi8yMDIwIDEwOjA4LCBCZXJ0
cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4gSSB3b3VsZCBoYXZlIHRob3VnaHQgdGhhdCBsaW51
eCB3b3VsZCBoYXZlIG5lZWQgc29tZSBtZW1vcnksIGV2ZW4gc21hbGwgaW4gdGhlIDMyYml0IHNw
YWNlIGluIG9yZGVyIHRvIGJvb3QuDQo+Pj4+IA0KPj4+PiBZZXMgaXQgbmVlZHMgc29tZSwgYnV0
IHRoZW4gdGhleSBhcmUgc3dpdGNoaW5nIHRvIHVzZSB0aGUgaGlnaCBtZW1vcnkNCj4+Pj4gYWxp
YXMgYWZ0ZXIgdGhlIE1NVSBoYXMgYmVlbiBzd2l0Y2ggb24uDQo+Pj4+IA0KPj4+PiAgRnJvbSBt
eSB1bmRlcnN0YW5kaW5nLCB0aGUgb25seSBkaWZmZXJlbmNlIGlzIHRoZSBwYWdlLXRhYmxlcyB3
aWxsDQo+Pj4+IHBvaW50IHRvIHRoZSBoaWdoIG1lbW9yeSBhbGlhcyBhZGRyZXNzIHJhdGhlciB0
aGFuIHRoZSBsb3cgbWVtb3J5IG9uZS4NCj4+Pj4gTGludXggd2lsbCBzdGlsbCBiZSBsb2NhdGVk
IGF0IHRoZSBzYW1lIHBsYWNlIGJ1dCBub3cgYWNjZXNzZWQgZnJvbSB0aGUNCj4+Pj4gaGlnaCBt
ZW1vcnkgYWxpYXMgcmF0aGVyIHRoYW4gdGhlIGxvdyBvbmUuDQo+Pj4+IA0KPj4+PiBOb3RlIHRo
YXQgQUZBSUNUIHRoZSBzZWNvbmRhcnkgQ1BVcyB3aWxsIHN0aWxsIGJlIGJyb3VnaHQtdXAgdXNp
bmcgdGhlDQo+Pj4+IGxvdyBtZW1vcnkgYWxpYXMuDQo+Pj4+IA0KPj4+Pj4gSSBjb3VsZCB1bmRl
cnN0YW5kIHRoYXQgc29tZSBtZW1vcnkgaW4gdGhlIGxvdyBhZGRyZXNzIHNwYWNlIG5lZWRzIHRv
IGJlIHJlc2VydmVkIGJ5IExpbnV4IGFzIERNQSBhcmVhIGZvciBwZXJpcGhlcmFscyBub3Qgc3Vw
cG9ydGluZyAzNi1iaXQgYWRkcmVzc2VzLCBidXQgdGhlIHdob2xlIGxvdyBtZW1vcnkgc291bmRz
IGxpa2UgYSBiaWcgcmVzdHJpY3Rpb24uDQo+Pj4+IE1hbnkgcGxhdGZvcm1zIGhhdmUgZGV2aWNl
cyBvbmx5IHN1cHBvcnRpbmcgMzItYml0IERNQSwgYnV0IG5vbmUgb2YgdGhlbQ0KPj4+PiByZXF1
aXJlIHN1Y2ggYWxpYXNpbmcuIFNvIHRoaXMgZG9lc24ndCBsb29rIHRvIGJlIHRoZSBpc3N1ZSBo
ZXJlLg0KPj4+PiANCj4+Pj4gVEJILCB0aGlzIGNvZGUgaXMgb25seSB1c2VkIGJ5IEtleXN0b25l
IGFuZCBzd2l0Y2hpbmcgYWRkcmVzcyBzcGFjZSBpcw0KPj4+PiBleHBlbnNpdmUgKHlvdSBoYXZl
IHRvIHR1cm4gb2ZmIHRoZSBNTVUsIHVwZGF0ZXMgcGFnZS10YWJsZXMsIGZsdXNoIHRoZQ0KPj4+
PiBjYWNoZS4uLikuIEkgZmluZCBoYXJkIHRvIGJlbGlldmUgYSBkZXZlbG9wcGVyIHdvdWxkIGhh
dmUgY29tZSB1cCB3aXRoDQo+Pj4+IHRoaXMgY29tcGxleGl0eSBpZiBpdCB3ZXJlIHBvc3NpYmxl
IHRvIGFsd2F5cyB1c2UgdGhlIGxvdyBtZW1vcnkgYWRkcmVzcw0KPj4+PiByYW5nZS4gSXQgaXMg
ZXZlbiBoYXJkZXIgdG8gYmVsaWV2ZSBMaW51eCBjb21tdW5pdHkgd291bGQgaGF2ZSBhY2NlcHRl
ZCBpdC4NCj4+Pj4gDQo+Pj4+PiANCj4+Pj4+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGhhdmUg
YSBiaXQgbW9yZSBpbmZvcm1hdGlvbiBvbiB0aGUg4oCccHJvYmxlbSB3aXRoIHBlcmlwaGVyYWxz
4oCdIGhlcmUgPw0KPj4+PiANCj4+Pj4gSSBhbSBjdXJpb3VzIGFzIHdlbGwsIHNvIEkgbG9va2Vk
IGluIG1vcmUgZGVwdGggOikuIEdvaW5nIHRocm91Z2ggdGhlDQo+Pj4+IExpbnV4IGhpc3Rvcnks
IG9uZSBvZiB0aGUgY29tbWl0IG1lc3NhZ2UgWzFdIHN1Z2dlc3RzIHRoZXkgYXJlIHN3aXRjaGlu
Zw0KPj4+PiB0byBhIGNvaGVyZW50IGFkZHJlc3Mgc3BhY2UuIFRoZSBkYXRhc2hlZXQgWzJdIChw
YWdlIDc1KSBhbHNvIGNvbmZpcm0NCj4+Pj4gdGhhdCB0aGUgbG93IHJlZ2lvbiBpcyBub3QgSU8g
Y29oZXJlbnQuDQo+Pj4+IA0KPj4+PiBTbyBJIHRoaW5rIHlvdSB3b3VsZCBub3QgYmUgYWJsZSB0
byBkbyBETUEgd2l0aG91dCBmbHVzaCB0aGUgY2FjaGUgd2hpY2gNCj4+Pj4gY2FuIGJlIHByZXR0
eSBleHBlbnNpdmUuIEZvciBhIFBvQywgaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gZm9yY2UgTGlu
dXgNCj4+Pj4gZmx1c2hpbmcgdGhlIGFyZWEgYmVmb3JlIGFuZCBhZnRlciBlYWNoIERNQSByZXF1
ZXN0LiBUaGlzIHNob3VsZCBiZQ0KPj4+PiBwb3NzaWJsZSBieSBtYXJraW5nIHRoZSBkZXZpY2Vz
IGFzIG5vdCBjb2hlcmVudC4NCj4+Pj4gDQo+Pj4+IEFsdGhvdWdoLCBJIGFtIG5vdCBlbnRpcmVs
eSBzdXJlIGlmIHRoZXJlIGlzIGFueSBmYWxsb3V0Lg0KPj4+PiANCj4+Pj4gQERhdmUsIGRvIHlv
dSB0aGluayBpdCBpcyBwb3NzaWJsZSBmb3IgeW91IHRvIGhhdmUgYSB0cnk/IEkgY2FuIHByb3Zp
ZGUNCj4+Pj4gdGhlIHBhdGNoIGZvciBMaW51eCB0byBkaXNhYmxlIERNQSBjb2hlcmVuY3kgaWYg
cG9zc2libGUuDQo+Pj4gSSBhdHRlbXB0ZWQgdG8gZG8gdGhhdCwgd2hlcmUgSSByZW1vdmVkIHRo
ZSAiZG1hLWNvaGVyZW50IiBmbGFncyBmcm9tDQo+Pj4gdGhlIGRldmljZSB0cmVlLiAgVGhlcmUg
YXJlIGxpa2VseSBvdGhlciBpc3N1ZXMsIGJ1dCB0aGUgbW9zdCBnbGFyaW5nDQo+Pj4gcHJvYmxl
bSB0aGF0IEkgcmFuIGludG8gaXMgdGhhdCB0aGUgZXRoZXJuZXQgZG9lcyBub3Qgd29yay4gIEV0
aDANCj4+PiBzaG93cyB1cCBpbiBpZmNvbmZpZyBidXQgdGhlcmUgaXMgbm8gYWN0aXZpdHkgb24g
aXQgYWZ0ZXIgYSBzbWFsbA0KPj4+IGhhbmRmdWwgb2YgbWVzc2FnZSBleGNoYW5nZXMsIHdoZXJl
YXMgYm9vdGluZyB3aXRob3V0IFhlbiBpdCBzZWVtcyB0bw0KPj4+IHdvcmsgZmluZSBldmVuIGlm
IGxlZnQgaW4gMzItYml0IG1vZGUgKHdpdGggdGhlIGRtYS1jb2hlcmVudA0KPj4+IGRpc2FibGVk
KS4gIEkgZG9uJ3Qga25vdyB3aGF0IGltcGxpY2F0aW9ucyBiZWhpbmQgdGhlIHNjZW5lcyB0aGVy
ZSBhcmUNCj4+PiB0cnlpbmcgdG8gc3RheSBpbiB0aGUgbG93ZXIgMHg4MDAwXzAwMDAgYWxpYXMg
cmFuZ2UgZWl0aGVyIHRob3VnaC4NCj4+IA0KPj4gVGhhbmsgeW91IGZvciB0aGUgYW5zd2VyLiBB
cyB3cm90ZSwgTGludXggaXMgd29ya2luZyBmaW5lIGluIDMyLWJpdCBtb2RlDQo+PiB3aGVuIGRt
YS1jb2hlcmVudCBpcyBsZWZ0IGluIDMyLWJpdCBtb2RlLiBTbyB0aGlzIHN1Z2dlc3QgYSBkaWZm
ZXJlbnQNCj4+IGlzc3VlIG9uIHRoZSBwbGF0Zm9ybS4NCj4+IA0KPj4gR2l2ZW4gdGhhdCB5b3Ug
cmVjZWl2ZSBhbiBoYW5kZnVsIG9mIHBhY2tldCBhbmQgdGhlbiBub3RoaW5nLCB0aGlzIHdvdWxk
DQo+PiBsZWFkIHRvIG1heWJlIGFuIGludGVycnVwdCBwcm9ibGVtLiBDYW4geW91IGNoZWNrIHdo
ZXRoZXIgdGhlIG51bWJlciBvZg0KPj4gaW50ZXJydXB0cyBpbmNyZW1lbnRzIHRoZSBzYW1lIHdh
eSBvbiBiYXJlbWV0YWwgYW5kIG9uIFhlbj8NCj4+IA0KPj4gRHVtcGluZyAvcHJvYy9pbnRlcnJ1
cHRzIHNob3VsZCBiZSBzdWZmaWNpZW50Lg0KPj4gDQo+IEkgYW0gYWJsZSB0byBwaW5nIHRoZSBi
b2FyZCBmcm9tIGl0c2VsZiwgZG8geW91IHRoaW5rIGl0IGNvdWxkIHN0aWxsDQo+IGJlIGFuIGlu
dGVycnVwdCBpc3N1ZT8gIEl0IGp1c3QgY2Fubm90IHNlZW0gdG8gcGluZyBvdXQgdG8gYSBkaWZm
ZXJlbnQNCj4gaG9zdCAob3IgcGluZyBmcm9tDQo+IG15IHBjKS4gIFVuZm9ydHVuYXRlbHksIHRo
ZSBpbnRlcnJ1cHRzIGZvciB0aGUgbmV0Y3AgRXRoZXJuZXQgZHJpdmVyDQo+IG9uIHRoaXMgYm9h
cmQgZG9uJ3Qgc2hvdyB1cCBpbiB0aGUgY2F0IC9wcm9jL2ludGVycnVwdHMgb3V0cHV0IHVuZGVy
DQo+IHRoZSBub24tWGVuIGtlcm5lbCBvcg0KPiBYZW4gbG9hZGVkIGtlcm5lbCBmcm9tIHdoYXQg
SSBjYW4gdGVsbC4gIEknbSBub3Qgc3VyZSBob3cgSSB3b3VsZCBjb25maXJtIHRoYXQuDQoNCkNv
dWxkIHlvdSBjaGVjayB0aGUgY29udGVudCBvZiAvcHJvYy9pbnRlcnJ1cHRzID8NCg0KSSBkaWQg
cmFpc2UgYW4gaXNzdWUgc2V2ZXJhbCB5ZWFycyBhZ28gb24gdGhlIGtleXN0b25lIDIgcmVsYXRl
ZCB0byBpbnRlcnJ1cHRzIGFuZCB2aXJ0dWFsaXphdGlvbiAobm8gd2l0aCBYZW4gYnV0IHRoZSBj
b250ZXh0IHNob3VsZCBzdGlsbCBiZSByaWdodCk6DQpodHRwczovL2UyZS50aS5jb20vc3VwcG9y
dC9wcm9jZXNzb3JzL2YvNzkxL3QvNDYyMTI2P0tleXN0b25lLTItbm8taW50ZXJydXB0cy1yZWNl
aXZlZC1vdXQtb2YtODAtYW5kLTkyLQ0KDQpUaGVyZSBtaWdodCBiZSBzb21ldGhpbmcgdG8gY2hl
Y2sgaW4gcmVnYXJkcyB0byBsZXZlbCB2cyBmcm9udCBpbnRlcnJ1cHRzIGZvciBmb3J3YXJkZWQg
aW50ZXJydXB0cy4NCg0KUmVnYXJkcw0KQmVydHJhbmQNCg0KDQoNCj4gDQo+Pj4gSQ0KPj4+IHdv
dWxkIHJhdGhlciBydW4gaXQgYXMgaW50ZW5kZWQgYnkgc3dpdGNoaW5nIHRvIHRoZSB1cHBlcg0K
Pj4+IDB4OF8wMDAwXzAwMDAgYWxpYXMgcmVnaW9uLg0KPj4gDQo+PiBJIGFncmVlIHRoaXMgd291
bGQgYmUgaWRlYWwgOikuDQo+PiANCj4+IENoZWVycywNCj4+IA0KPj4gLS0NCj4+IEp1bGllbiBH
cmFsbA0KDQo=

