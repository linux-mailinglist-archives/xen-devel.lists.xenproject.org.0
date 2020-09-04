Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A56725D8EA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 14:48:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEB8B-00088B-3U; Fri, 04 Sep 2020 12:47:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9G2Q=CN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kEB89-000886-Mt
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 12:47:49 +0000
X-Inumbo-ID: 47a9f4d2-4956-44a1-b2d0-26452d5790e1
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47a9f4d2-4956-44a1-b2d0-26452d5790e1;
 Fri, 04 Sep 2020 12:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vB4G5DwbZk1WbD++IQcduL+CGvSv9yehnnhdE+ZDBW8=;
 b=ynT92zHHV2NL50beQckrzf2NMfgvFU0mjXz2NUdlnP4H7HHJ4NAKWgTlp6u24/7uLSUkmY4/xMx+ADPlCJj4lnEsG2rdKnSVRyFOPxa1KUsibDBmTEuWeEBxVS5QU3RKMPYSgYlmHqL2jQWaJ+KMw9uBrAeWQ74z6/ej/jB1DcQ=
Received: from DB7PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:10:52::30)
 by DB6PR0801MB1669.eurprd08.prod.outlook.com (2603:10a6:4:30::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Fri, 4 Sep
 2020 12:47:46 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::3f) by DB7PR02CA0017.outlook.office365.com
 (2603:10a6:10:52::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Fri, 4 Sep 2020 12:47:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Fri, 4 Sep 2020 12:47:45 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Fri, 04 Sep 2020 12:47:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 013e03c754ba32e9
X-CR-MTA-TID: 64aa7808
Received: from 7682f164fd5a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FC8B886D-4635-4A41-98F9-22D51C9941CD.1; 
 Fri, 04 Sep 2020 12:47:40 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7682f164fd5a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Sep 2020 12:47:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuRy7S0c2sG7Qc0WzjJWgoqfgrSFw/2jZaJmRE20QxBA4NCFgRjldxFfT6pnaglIR6zBMRwHnuVAW7B/39Eyo4As8jljaNxJJtnRyWy8MKv5XQNeTBrvvhNpL8r1dBxjhExpcj4EifxsEMkbisNTIHGGgXYCHeo8gzHOVteTQXPoVCqQ1SYhdUMPxUSZxXdTYyEdJcKfMarZ/vCMSK3sNG/hWXOz6c+Tuwhnz0KVW5u5XIz1d/5YtZ/8OP9Jwa2mEJphEN3duAybY3i1RfymNkrIJEQK8bGPlHUWPHzH1k8MejhQcTApn6pk+l1j7i5B/OhWWQY9gvsM1OlWXArztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vB4G5DwbZk1WbD++IQcduL+CGvSv9yehnnhdE+ZDBW8=;
 b=dfhvu5uFoVSge0Q7WwAFdSgfgQ1niFJKu2WW/Akyn48xP3Azskk/ZZY755EgDDFlp6OiUzTRyNZGMW6AVomg1jeqp10Z7XHGQetJZVUL1cSasz/4B3zeNRSiMHgzuv3yEVlzY9f6DzqV7Ph/yPKtxpPYizMg7RGz9yhVJfxPY/e5QWkFMcRYe1f4Y488e3NGxpC66Ya+Iorn+jDMH1h1uGQhLiDCPuf2lMU2cMUk7uWx9P0Y66B7urRjejNCj5Vt+9l2GeU29v6GqwQzb0Ap5hOt+5/Ar2pXcFy81KFa45aXl6Vw7uEUFL2J2ie+BZ85vcuPxIQ3O6eKFdcNgCSTbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vB4G5DwbZk1WbD++IQcduL+CGvSv9yehnnhdE+ZDBW8=;
 b=ynT92zHHV2NL50beQckrzf2NMfgvFU0mjXz2NUdlnP4H7HHJ4NAKWgTlp6u24/7uLSUkmY4/xMx+ADPlCJj4lnEsG2rdKnSVRyFOPxa1KUsibDBmTEuWeEBxVS5QU3RKMPYSgYlmHqL2jQWaJ+KMw9uBrAeWQ74z6/ej/jB1DcQ=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3033.eurprd08.prod.outlook.com (2603:10a6:5:17::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Fri, 4 Sep
 2020 12:47:39 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3348.016; Fri, 4 Sep 2020
 12:47:38 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, "open list:X86"
 <xen-devel@lists.xenproject.org>
Subject: Re: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Topic: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Index: AQHWgqFQIv5YQfrx8UWhPeAs1v6hhqlYRMuAgAAGaQCAACE7AIAAAXCA
Date: Fri, 4 Sep 2020 12:47:38 +0000
Message-ID: <79258C14-9F21-4DCD-B24B-9C1620003BD8@arm.com>
References: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
 <e0c040bd-8b85-8dc9-37ee-04dd83adf072@suse.com>
 <6D291A71-A0A6-401E-B9F6-BF6F992E60DF@arm.com>
 <a1e46c3f-503f-b00a-b789-28c1f9c61640@suse.com>
In-Reply-To: <a1e46c3f-503f-b00a-b789-28c1f9c61640@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 145aff28-f099-4e7f-03ab-08d850d0b8f9
x-ms-traffictypediagnostic: DB7PR08MB3033:|DB6PR0801MB1669:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB166981BD87AF011364B395C99D2D0@DB6PR0801MB1669.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: j8M0o2Un/tsZZIRKA/VBB+4lkiVsofauS6slOqyyuHExLlMOLbnAN5f9XzM3eF7tgrs66E0RVNeY1L070cvI6Vd0v4S0JtF511sk4TkM8FeaoFhA07Efp9MneypW2DSiqwoL+Wez8uoZ4aNtDVGrrtJkTC1RKMC6kFhLXRcC3qTcpbIBdoXzz3AvgZf3DxcQYGeLWFMfoAeEIDKRTSmamXghsq5KC+y0Tjo9eC+or2xFAKO50K6Nt29QN/99dDyd2kqZzarEpdBQ9+kWOEUZO0me/kGwqRgxuh8s4B4oA+BN0ZCPzt6moY3lg6Y8Qy61n4XRqNeDrT9HPFCR8VGRVzK84Lo/KR+pIVE1U3+jcJYn3PW2c/n2yfq1hfpUkCos/c5umyNXrEZJd4uPCBKMaQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(54906003)(26005)(6512007)(53546011)(316002)(33656002)(2906002)(4326008)(86362001)(36756003)(6506007)(91956017)(5660300002)(6486002)(478600001)(66446008)(966005)(8676002)(71200400001)(66476007)(64756008)(66946007)(186003)(6916009)(83380400001)(76116006)(66556008)(2616005)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 9H9eZe7ymK0udKm23M0Q/zDB2A0LwuN5wTvbw1YR9y9eldP51c50A4N1/raaseQD5/1Wxgf0eTqxqOXyBH4q6AOJlQfJ3CJGR3viUsMG7Wuqx5avfJpfTziKGHN1yG64pWRQz5l/6AYLiELAccj6tHHE0EkQH4rOD0j1L/b3kvsy1x1Q8U/pkDFWU0u6oafKVT0P8oQR9QiTP9RGnI83ieNJ3UdUBxq6Lj0GCu5UqGAc9E4FYABlla/kqhjdqBNbS1bVppWWspGaaO++IYVkjgbbY3XvGQKPV33cWSwQS8YWdi+0cwV93MClWYCZMne47eOUxkKOh0qNhHmChNRFPKXpQ7q+30CDiMrRra1fLg1mOq4iYceWBRvjBZzlpJ+jwx3qflu62wYymfENSRG5aaG4kvSkBI9uE0nzlK6a04IqgMAO8DX24K2kVMdNDBSBE6fIVifID630Jnfn/9bJmWsCCTGDwqXBa1SNRTHsfNk6Ahd8BT4ibz5oYcQ9OuCShY5aaFaBIQ7/iSoAQxVeUCMpdNM7Qd16B/L4Z1G/K6TxsDU0HF4RfyqhTf/xdDqe489zr6aisoIPP3uxeBZd5YHMtxw5hNXE6pYeXatG+AbD3hUrc4TElQtwUknc2u/o6Icx9LkPQ+Oo5L8v/YdZHA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <107E2C2DBD8F524FA148035E7AFBF2CF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3033
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7c0acb86-a290-463b-caf9-08d850d0b4cf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZPYLAepXW9PJM0SjE9mhf+guII7MJRjhfOZa1WvrHgjjIhQqQn0Vp+Xg72lih8d+4ReJ0zH4TW/LVVpmhkVXppcRDW5Nv40CqKcmCpU/M5NJqbqoSQC3lTFcg+AVh1vRP2WmNxw4LiK+/GJ4U1zUu6xqJxjUrKNnts4LqKZ2douaMP7YfCFE2l3HLHaUXISIoR8HVZKNh8tGVO3le7MsA27benZIEwtkHsp20r0LkRZzLSQPQuKXRUUlBZ4JB6uVialZVi9Ky8ky+eXEqbMetXe8vIqYwRjV1Q3lN75W+6Io+EEfOXsplhQ+OhZKE4WKXem2PsrsEjO49Dma3feT962sNMdABtw6MvW6qqqkL/xpEdYsQSQniVBLI0HIL8FCNCCZdLcA6lGczc9jZPLJPTMITZAucqtq/JUZfiJam0a5kCREPQ0GI9+HRD9UYHKzeCKijfnZL8bjSKiRCTj1JIw5GNwk96vEXPvqEh4v8fk=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966005)(356005)(8676002)(6512007)(54906003)(186003)(33656002)(47076004)(81166007)(8936002)(36756003)(336012)(5660300002)(2616005)(966005)(86362001)(6862004)(53546011)(6506007)(6486002)(4326008)(316002)(26005)(2906002)(478600001)(70586007)(82310400003)(82740400003)(70206006)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2020 12:47:45.9602 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 145aff28-f099-4e7f-03ab-08d850d0b8f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1669
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

DQoNCj4gT24gNCBTZXAgMjAyMCwgYXQgMTM6NDIsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNC4wOS4yMDIwIDEyOjQzLCBCZXJ0cmFuZCBNYXJxdWlz
IHdyb3RlOg0KPj4+IE9uIDQgU2VwIDIwMjAsIGF0IDExOjIwLCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDA0LjA5LjIwMjAgMTE6NTQsIEdlb3Jn
ZSBEdW5sYXAgd3JvdGU6DQo+Pj4+IEF0IHRoZSBjb21tdW5pdHkgY2FsbCBsYXN0IG1vbnRoIGFz
IHdlbGwgYXMgdGhpcywgd2UgZGlzY3Vzc2VkIHdoZXRoZXIgdG8gY29udGludWUgdGhlIOKAnEdp
dGxhYiBleHBlcmltZW504oCdLiAgSXQgd2FzIGdlbmVyYWxseSBhZ3JlZWQgdGhhdCByZXZpZXdp
bmcgSnVlcmdlbuKAmXMgbG9uZyBzZXJpZXMgd2FzIGZhaXJseSBzdWItb3B0aW1hbCwgYW5kIHRo
YXQgZW1haWwgd2FzIG1vcmUgc3VpdGVkIHRvIHRoYXQgc29ydCBvZiBzZXJpZXMuDQo+Pj4+IA0K
Pj4+PiBUaGF0IHNhaWQsIHRoZXJlIHdhcyBnZW5lcmFsIGFncmVlbWVudCB0aGF0IHJlcXVpcmlu
ZyBhbGwgcGF0Y2hlcyB0byBnbyB0aHJvdWdoIGVtYWlsIHdhcyBnb2luZyB0byBsaW1pdCBjb250
cmlidXRpb24sIHBhcnRpY3VsYXJseSBvZiBvbmUtb2ZmIOKAnGRyaXZlLWJ54oCdIGNvbnRyaWJ1
dGlvbnMuICBBcyBzdWNoLCBpdCB3YXMgcHJvcG9zZWQgdGhhdCB3ZSBjb25zaWRlciBhbGxvd2lu
ZyBib3RoIEdpdGxhYiBQUnMsIGFuZCBlbWFpbDogdGhhdCBmb3Igb25lLW9mZiBvciBzaG9ydCBz
ZXJpZXMsIEdpdGxhYiBQUnMgd291bGQgYmUgYWNjZXB0ZWQsIGJ1dCB0aGF0IGZvciBsb25nZXIg
c2VyaWVzIGFuZC9vciBsb25nZXIgdGVybSBjb250cmlidXRvcnMsIHdlIHdvdWxkIGVuY291cmFn
ZSBwZW9wbGUgdG8gc3dpdGNoIHRvIHBhdGNoYm9tYmluZyB0aGUgbWFpbGluZyBsaXN0Lg0KPj4+
PiANCj4+Pj4gV2UgZGVjaWRlZCB0byBjb250aW51ZSB0aGUg4oCcR2l0bGFiIEV4cGVyaW1lbnTi
gJ0sIGJ1dCB3aXRoIHNob3J0IFBScy4gIEFzIHN1Y2gsIEFuZHkgQ29vcGVyIGhhcyBwb3N0ZWQg
dHdvIFBSczoNCj4+Pj4gDQo+Pj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC94ZW4v
LS9tZXJnZV9yZXF1ZXN0cy8yDQo+Pj4gDQo+Pj4gVGhpcyBsb29rcyB0byBiZSBjb25mdXNpbmcs
IHRvIG1lIGF0IGxlYXN0LiBGb2xsb3dpbmcgdGhpcyBsaW5rIEkNCj4+PiBjYW4ndCBzZWUgdGhl
IGFjdHVhbCBjaGFuZ2UgZGlyZWN0bHkuIEZvbGxvd2luZyBlaXRoZXIgb2YgdGhlIGxpbmtzDQo+
Pj4gYWZ0ZXIgIlJlcXVlc3QgdG8gbWVyZ2UiIGdpdmVzIGEgNDA0IGVycm9yIChhZnRlciBnaXRs
YWIgbm90IGJlaW5nDQo+Pj4gYWJsZSB0byBzaWduIG1lIGluIHZpYSBHb29nbGUsIGJ1dCB0aGVu
IGJlaW5nIGFibGUgdG8gc2lnbiBtZSBpbg0KPj4+IHZpYSBnaXRodWIpIG9uIGJvdGgNCj4+PiAN
Cj4+PiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2FuZHloaHAveGVuDQo+
Pj4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9hbmR5aGhwL3hlbi8tL3Ry
ZWUveGVuLXB2LXNlZ2Jhc2UNCj4+IA0KPj4gSSB0aGluayB5b3UgbWlzc2VkIG9uIHRvcCB0aGUg
4oCcQ29tbWl0c+KAnSBhbmQg4oCcQ2hhbmdlcyINCj4gDQo+IEkgZGlkIGluZGVlZC4gTmV2ZXJ0
aGVsZXNzIEkgdGhpbmsgdGhlIG90aGVyIGxpbmtzIG91Z2h0IHRvIGJlDQo+IHdvcmtpbmcsIGFz
IHRoZXkncmUgKEkgYXNzdW1lKSBnb2luZyB0byBnaXZlIG1lIGEgdmlldyBvZiB0aGUNCj4gdHJl
ZSBhcyBhIHdob2xlIHdpdGggdGhlIHBhdGNoL3NlcmllcyBhcHBsaWVkLg0KPiANCj4gVGhhdCBz
YWlkLCBmcm9tIGFuIGVuZ2luZWVyJ3MgcG9pbnQgb2YgdmlldyBJIHRoaW5rIHRoZSBtYWluDQo+
IHRoaW5nIG9mIGludGVyZXN0IHNob3VsZCBiZSBzaG93biBpbiB0aGUgInByaW1hcnkiIHZpZXcs
IGFuZA0KPiB0aGF0J3MgKGltbykgY2xlYXJseSB0aGUgZW50aXJlIHBhdGNoLg0KDQpJZiB5b3Ug
bG9vayBhdCB0aGUgc2VyaWUgc2VudCBieSBUcmFtbWVsIHRoaXMgaXMgYSBiaXQgbW9yZSBjbGVh
cjoNCi0gb3ZlcnZpZXcgaXMgZm9yIGdsb2JhbCBjb21tZW50cw0KLSBjb21taXRzIGxpc3QgdGhl
IGRpZmZlcmVudCBwYXRjaGVzIG9mIHRoZSBzZXJpZQ0KLSB3aGVuIHlvdSBjbGljayBvbiBhIGNv
bW1pdCB5b3Ugc2VlIHRoZSBkaWZmIGZvciB0aGlzIGNvbW1pdCBhbmQgeW91IGNhbiBjb21tZW50
DQoNCkhhdmluZyBldmVyeXRoaW5nIG9uIG9uZSBwYWdlIHdvdWxkIGZpdCBmb3IgYSBzbWFsbCBw
YXRjaCBidXQgZm9yIGEgc2VyaWUgdGhhdCB3b3VsZCBiZSB0byBtdWNoLg0KDQpJIGFncmVlIHRo
b3VnaCB0aGUgaW50ZXJmYWNlIGNvdWxkIGJlIGJldHRlciBidXQgbWF5YmUgd2UganVzdCBoYXZl
IHRvIGdldCB1c2VkIHRvIGl0Lg0KDQpDaGVlcnMNCg0KQmVydHJhbmQNCg0KPiANCj4gSmFuDQoN
Cg==

