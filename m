Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A375525D6E7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 12:56:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE9Oh-0004pc-Ks; Fri, 04 Sep 2020 10:56:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9G2Q=CN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kE9Og-0004pP-0R
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 10:56:46 +0000
X-Inumbo-ID: 089b48bf-f19d-406d-851b-da4f021a8859
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 089b48bf-f19d-406d-851b-da4f021a8859;
 Fri, 04 Sep 2020 10:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21JxvkH47vBD89OzEuOImPAsXAXLHcVJa8sWol1TPgY=;
 b=BCYLIF18wo2hEipwRfDmUMAQ7HAqKVVSPtMuFm5Ky13TqG3KKeDU6fRBgUuGTw08/38viFN4hOd1D6L6l4WVIt/1n2mgM7ZTPWtsWeroxxQx62LiQr8XtkAs3+3HrZSjnfcSbe1Ud/qFvw/S2Vt9KMt1vsDnRjzUjF4Jc+5tHaM=
Received: from AM6PR0502CA0043.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::20) by VI1PR0801MB1933.eurprd08.prod.outlook.com
 (2603:10a6:800:8d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Fri, 4 Sep
 2020 10:56:42 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::ab) by AM6PR0502CA0043.outlook.office365.com
 (2603:10a6:20b:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Fri, 4 Sep 2020 10:56:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Fri, 4 Sep 2020 10:56:42 +0000
Received: ("Tessian outbound a0bffebca527:v64");
 Fri, 04 Sep 2020 10:56:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 41915922217b811f
X-CR-MTA-TID: 64aa7808
Received: from 9bf011f20638.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C9D8BBD1-2A77-4563-A7F8-AE5D2B7A8AF2.1; 
 Fri, 04 Sep 2020 10:56:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9bf011f20638.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Sep 2020 10:56:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHjq5J75aRWVhoMWNCYzXARQif2djWo1wG4iYgkT5/oZkuEkc1+XyisxyRdsQnSJKsMq55KADo9Mjh2h3/hAS7O4LRT/9yq+3JBPihmio2FY5Th2uc68l5wgTQ4z5jXBHXLvquwZuSFQ5pNug6ZCHc0p+KiGrNp/6aSrq5WePCTaCfBWldb5FDPsvT2C7zmrH8ggBe+yiKrNCPCNEUKk6Xrk7l86JCXUprTnlq2Tdoc8VLXBcRP3Ek7xunpah7B2NYp2WRTXvofahHsBzy3KJs0CLBfg9my0l3QW4cpZ2Uf8lgpB7FI9l3pd/QceqwbVTFNmiZAsxP+p/Hn41wFpHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21JxvkH47vBD89OzEuOImPAsXAXLHcVJa8sWol1TPgY=;
 b=nJqsiS8sEsHXLj39fnl5411X0TpI6ujruTuth7cUM7BbVSG2WoG/2v77NhffaLGo1PSIFr68rKVujJpYU5GUZw8zUJjUUmYmf8NLpARkI+mtTXhRXpNuwP0h5anW8tPzp7xeL3QszGrCRwyZghHrpJe76IIpu0HIXZfpS1zhTibYG1YJGQex1La3atfb0E8hryDwo1OJrmNF/zDHcP6Yj1EJt5FLs00z8F+mRhwUMZk2XXDX2t0RWP+/U1iA4BHEpqBaK2LnZVEMym/sFwnEKoGKg2v/64k4UeJEMCh7aP5L3hqpvW5ysYkXgxDrZ0lFwoj6JASa+auDFT4+4ExZYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21JxvkH47vBD89OzEuOImPAsXAXLHcVJa8sWol1TPgY=;
 b=BCYLIF18wo2hEipwRfDmUMAQ7HAqKVVSPtMuFm5Ky13TqG3KKeDU6fRBgUuGTw08/38viFN4hOd1D6L6l4WVIt/1n2mgM7ZTPWtsWeroxxQx62LiQr8XtkAs3+3HrZSjnfcSbe1Ud/qFvw/S2Vt9KMt1vsDnRjzUjF4Jc+5tHaM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5369.eurprd08.prod.outlook.com (2603:10a6:10:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Fri, 4 Sep
 2020 10:56:04 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3348.016; Fri, 4 Sep 2020
 10:56:04 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "open list:X86"
 <xen-devel@lists.xenproject.org>
Subject: Re: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Topic: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Index: AQHWgqFQIv5YQfrx8UWhPeAs1v6hhqlYRMuAgAAGaQCAAAHFAIAAANcAgAAA44A=
Date: Fri, 4 Sep 2020 10:56:03 +0000
Message-ID: <C8F498B4-3184-4230-A5E4-13B7EABAE3A7@arm.com>
References: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
 <e0c040bd-8b85-8dc9-37ee-04dd83adf072@suse.com>
 <6D291A71-A0A6-401E-B9F6-BF6F992E60DF@arm.com>
 <48BB5235-F9FD-4E81-8CAE-59BEFB24DDC0@arm.com>
 <E40FED16-38FB-443A-B1B4-8B0444829A06@citrix.com>
In-Reply-To: <E40FED16-38FB-443A-B1B4-8B0444829A06@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d2d9e2d-ac62-4acd-2f50-08d850c1355e
x-ms-traffictypediagnostic: DB8PR08MB5369:|VI1PR0801MB1933:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB19332910535E01EB9B44601D9D2D0@VI1PR0801MB1933.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Yi21tPY7D+oJjQmoHgLxHKKCgVSj3TkrfyIEchhf0mJbo7HpHf77xIIp7b5cKsO7f2yyAQC9mHGcniXU9CNXAwLlUcwrebjWAgKxagmm4yFZ0GkWxeIWQsOfR9cfBlFbuxzE3ORce7VkGf8Ez+RZsZNa30qtElrSLDbjfuVGWNfSqK0U58VP8eKBH4ElVvumTjLH/PCBH4vZLw73e3jHtL+WTbs0rXBy/uzuD1EPF3ajSiwehXcHARybKuc78GNxFf/LVK1Vk3tGYhPF+p2faza08qLpeTnY4gmkulucr+tTXziTVhK4RKslx1gQwZChKcItAiuJcKrsyYFgmJseWA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(316002)(4744005)(5660300002)(8676002)(6486002)(33656002)(8936002)(478600001)(26005)(186003)(6916009)(2906002)(4326008)(2616005)(66446008)(64756008)(66556008)(66476007)(71200400001)(6512007)(76116006)(91956017)(53546011)(86362001)(66946007)(6506007)(54906003)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: XbA+dFiVrBL1ez/URJAEoVxCmOzy+tynbG2O1iLokGDG8QZmK/LGPPbejHternMALyjJaBdOWv9nMfvd/ZK8bgKdLX33/RQckNUTEY6V6dPKDgY+jONJ6lZ75eohqLjfSDefjLZAZNkziz1Z2BvtVlLNYl6qV/j9iefDl9uS6hJ7RIT58eH6i061fReY1RXa8E1CR2JBcm8J7C0foDyxFLdRuEKz42sI3ql+lXb2AZufZZTFPEqG7ffl1qq7QgqjuEA9wU1oH/fG8m0VghN1YwPQGoEsah98e68a+gAnNB6bBRrV0GTN5TTROtfbdUOXbejofjCraeX1VhQXvlE1zXoX1FCNw6J0D3JAr7cyAil46fYcok0Mn4Xc++ncN/yqyg1n7i7ZxZf5f699E9aB00NqTTxQDU2n4yYPPds8xt1GC7uXcthK56wWSwiHYSY/2O+CRjDGCD9bvtbe0b3V+ElIioReWsT+hH3BnhpDBOp/ii9ZCN5TE0dwCkICuzwO4QIjj84LciZBIId2wJMGl/Mo5ap7gLx3Du5Ume2tkZqeMdWhI4GmIFXAobCKKqzriGm94yQ6VwoK5CtaEX1f2EVIX++Ned+o0SeiiVL38BzsoSsNdqw6A0RcZkDZ+TZzhP+78tYcH+/OuPPVu/Db7g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AE66292C09EEF46918BE001DDA960CE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5369
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: bf321147-7494-49ce-7e0c-08d850c11e5b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f7v5Yyhk7gCUuzIvU4nzoMR6a6NyGDA8CWLzE8w7AuwuKOzdsBain3HgOWmcJSEgyOUgxTRpvN7htY6l5UstwUg1/2qUKHR/gEBkCn9gYeLruOpp+mif634B5jd/wrbe5suxA8AuLc/5XT4PAsstgErgWVkQY9se4PiNOkaHOJA9pzE+TURTuL+HtYYpPPBbpTW+0RnZwwy1XbhUamcyYz76vAay+wi3XdjVgUjoY8VlvjssyjdxFp/7E08Yy2ttexx4Rdop7caKdtZKLUO3MymxuVlL2YELo6ipmAv9Rh1l4oZ2eOaeJNyg80PQEzju/zeJqk7yacc+TrU6z4fac3t+uKrVAEyqWxFbS+uRSZKNftzJPmLdGLCNdE9E3dkndS6cVZFwNMuHvT4+mG+PMg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966005)(86362001)(5660300002)(6512007)(186003)(82740400003)(478600001)(47076004)(4744005)(36906005)(26005)(54906003)(336012)(70586007)(53546011)(356005)(2906002)(6486002)(81166007)(33656002)(36756003)(4326008)(82310400003)(316002)(8936002)(6862004)(8676002)(6506007)(70206006)(2616005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2020 10:56:42.6650 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2d9e2d-ac62-4acd-2f50-08d850c1355e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1933
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gNCBTZXAgMjAyMCwgYXQgMTE6NTIsIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiBTZXAgNCwgMjAyMCwgYXQg
MTE6NDkgQU0sIEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4gd3Jv
dGU6DQo+PiANCj4+PiANCj4+PiBJIHRyaWVkIHRvIGFkZCBhIGNvbW1lbnQgYW5kIHRoYXQgaXMg
d29ya2luZyB3ZWxsDQo+Pj4gDQo+Pj4gUmVtYXJrcyBmcm9tIG15IHNpZGU6DQo+Pj4gLSBIb3cg
Y2FuIGkgYWNrL3Rlc3QvcmVqZWN0IG9uIHRoaXMgPw0KPj4gDQo+PiBhbnN3ZXIgbXlzZWxmIGFz
IGkgZm91bmQgdGhlIHRodW1icyB1cCB0aGF0IGkgaGF2ZSB0byBjbGljayA6LSkNCj4gDQo+IEkg
aGF2ZSBhIGJ1dHRvbiB0aGF0IHNheXMg4oCcQXBwcm92ZeKAnSDigJQgZG8geW91IG5vdCBoYXZl
IHRoYXQ/ICBQZXJoYXBzIHlvdSBkb27igJl0IGhhdmUgdGhlIHJlcXVpc2l0ZSBwZXJtaXNzaW9u
cy4NCj4gDQo+IEJ1dCBJIHRoaW5rIGFkZGluZyDigJxSZXZpZXdlZC1ieeKAnSBpbiBhIGNvbW1l
bnQgd291bGQgd29yayBqdXN0IGFzIHdlbGwuDQoNCldoZW4geW91IGFkZCBhIGNvbW1lbnQgYXQg
dGhlIGVuZCB5b3UgY2FuIHNheSDigJxGaW5pc2ggcmV2aWV34oCdLCBtYXliZSB0aGF0IG9uZSBp
cyB0aGUg4oCcUmV2aWV3ZWQtYnnigJ0uDQpXZSBtaWdodCBuZWVkIHRvIGNoZWNrIGlmIGdpdGxh
YiBpcyBub3QgYWRkaW5nIHRob3NlIGF1dG9tYXRpY2FsbHkgc29tZWhvdy4NCg0KQmVydHJhbmQN
Cg0KPiANCj4gLUdlb3JnZQ0KDQo=

