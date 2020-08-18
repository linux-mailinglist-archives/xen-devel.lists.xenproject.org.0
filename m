Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC9024864D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 15:43:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k81ss-0007xg-3O; Tue, 18 Aug 2020 13:42:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTNL=B4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k81sq-0007xW-1O
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 13:42:36 +0000
X-Inumbo-ID: 8de60459-e253-47a7-921d-025cda4bfb8a
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.64]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8de60459-e253-47a7-921d-025cda4bfb8a;
 Tue, 18 Aug 2020 13:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSf99w6nMce6ewQGvxYLhcIt+kwNsavNGcUWicCQh+s=;
 b=Ta8NU3GqTSt/GMQjlMQn6Rv8QssnkgfglTpOaX8nE5iHCAglnlN7v77XXaQoE72VAeSq4HclQZICCnKiz5/D6YSzq38NvSiw7AwnuOMY59JARsJ451a7x6KCjsEr/D5P5xnAf0eFW/Ju8UjQz9cFyjTUxyKyWGMZm5YfAEWdUOc=
Received: from AM6P194CA0043.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::20)
 by AM6PR08MB3319.eurprd08.prod.outlook.com (2603:10a6:209:4e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Tue, 18 Aug
 2020 13:42:31 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::e3) by AM6P194CA0043.outlook.office365.com
 (2603:10a6:209:84::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Tue, 18 Aug 2020 13:42:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 13:42:31 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Tue, 18 Aug 2020 13:42:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9f98ce80145f53c6
X-CR-MTA-TID: 64aa7808
Received: from cc7b704b6b42.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9EC85FCD-F48E-4CC3-8B40-E0D3A8B7D6BF.1; 
 Tue, 18 Aug 2020 13:42:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc7b704b6b42.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Aug 2020 13:42:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7hoL1b5gMki9z/H6cbkLSsI/UPfECl4pSgDfRS/bcuNowqGWQ7ABc+aELFIE3IpQdF4gN4tIPdQfLC7BMa+jZToI7vZJuz58vZb0+kmAyG+xhXW1isCgKXcU1JW1UgTQEYKMhq8lsXRN7325Igu2hq304a3ul/xY6+t9QgZ2jXo75v+bzvE2csChhIbUxhiTZRvGPHrAUIDOYxCQsr2iMUP+4YQwFN2CdGTMwqPrBq0riof1e4vkl9RYemK5VAPtyKlWyjWvbVlvxYRw3u/ERc5VjuxlJ5b/q7HezBECYXNjS67aGQDHc3FmQIcKH9isFFjqf30QElRIvzzw0e0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSf99w6nMce6ewQGvxYLhcIt+kwNsavNGcUWicCQh+s=;
 b=F3VCWU10M4044LI1NOML22WZrZjz0sHKI7AQF8hrsZlFKl3lkUqVgGUDBinKliulBfGu2IaG0G7dCTrEkUdNeJXJ0OdEJFkAwtFwXGRvdpLqMYjCuUypKJrG7mOPV+Sp1HEw9TeCq/uPtMNA16/FZHsuoVhDgXyEMh9aS1qPhPhaeHwxLVbH95lMt/Q5o3o6gl4hkHrE8bzgSzvkNhIKHkveQ9TuJbP5X+Sig8KBV4aZcjMrCv04xTvyBviB4epI4w0Wrlwfg0jZRysCpwk/RirGq4PTMLRcEEi6Go/HSsJ0mbDMGSy2EW87JeUKJj95H1Gl17KndZA/hO8hSiOeMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSf99w6nMce6ewQGvxYLhcIt+kwNsavNGcUWicCQh+s=;
 b=Ta8NU3GqTSt/GMQjlMQn6Rv8QssnkgfglTpOaX8nE5iHCAglnlN7v77XXaQoE72VAeSq4HclQZICCnKiz5/D6YSzq38NvSiw7AwnuOMY59JARsJ451a7x6KCjsEr/D5P5xnAf0eFW/Ju8UjQz9cFyjTUxyKyWGMZm5YfAEWdUOc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2694.eurprd08.prod.outlook.com (2603:10a6:6:1f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Tue, 18 Aug
 2020 13:42:23 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 13:42:23 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andre Przywara <Andre.Przywara@arm.com>
CC: Wei Chen <Wei.Chen@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Steve Capper <Steve.Capper@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, nd
 <nd@arm.com>
Subject: Re: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
 switch
Thread-Topic: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
 switch
Thread-Index: AQHWdQ1DgIquqcpHPEOT+qWxYeHAMqk9lfsAgAAC9ACAAAS3AIAACKkAgAATaACAACb6AA==
Date: Tue, 18 Aug 2020 13:42:23 +0000
Message-ID: <53293879-DCD2-407A-A7C1-561313879424@arm.com>
References: <20200818031112.7038-1-wei.chen@arm.com>
 <ef6a40d7-7def-3726-870c-f9bf22e2a388@arm.com>
 <139F007F-5C70-4AB3-B2BC-3A7D414A5C06@arm.com>
 <ba38efd7-2fdd-e354-7a24-bcd67f9793b2@arm.com>
 <D52E4104-F43D-4A8D-A135-79569EC0BDDA@arm.com>
 <f475e3f7-f820-7bd8-4b41-b8378ec7faaf@arm.com>
In-Reply-To: <f475e3f7-f820-7bd8-4b41-b8378ec7faaf@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 369ef68f-0e79-4642-3bef-08d8437c8e52
x-ms-traffictypediagnostic: DB6PR08MB2694:|AM6PR08MB3319:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33198DE6A375C00EAB3888C69D5C0@AM6PR08MB3319.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: oVVIbGleXPpt1CKX78xt6lSw0o0IOxmdeBajELaif4+/1Fh4bJoq2ELKp/Kgeu8FoNTw7YOjedQBWYHGqwnUETYHnhNxDU1hp5gT8ICeC416xWhQ0+dT+NxSidnNE9QrsDgJSZE738la1xYcc6erPfXFXpnW5m6GZh2H/H4f6t/dEltQfQ9oQHysMn4MU3Ge95YzL9iOynQm+NogsacbZ6IAgTDDR2DwN0umcJLuBIVxAlla1fBJN1pZeKT3CnNYWA8TG5bnW06DXfrFtnOiGAR1zkjP78g/qEM0X72msHECNqzlmxZdv/k/CnJfGLi/C0fQ2OvHozEQZfUZ7L4PUq/ewKmInB7wHFC38pJXWpe97C0xcm18wVpwDx5o8Ku+GX6M+5JeaDw0oKbnwHlR/g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(6506007)(66476007)(53546011)(186003)(36756003)(2906002)(6512007)(33656002)(2616005)(83380400001)(6636002)(5660300002)(37006003)(316002)(478600001)(8936002)(91956017)(6486002)(66556008)(64756008)(66446008)(966005)(76116006)(8676002)(66946007)(6862004)(4326008)(86362001)(54906003)(71200400001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: pX+BpD4HMaxzf3Mf+xU6IqjfqWjH9wwfJC46t99S+5lObIq1kGZY+R/r8wVrpnh86avzCCiN0nm1QMOyFcZXTVMMUYAE+UWAJkNbUdup3lnwzLO+GXYo6ag7ghozZVDeaW1B2OClqxDkU20gcOMkYOSgojvswvogC2DLO3wZrxxOWEdioTkpMQhKx2kq/s/arDAtC83UDdwVzNGVU7cbix7DYMab95I50keDIWy0x5ox5DN8HD2+8M2nhrU2k1ECsDvV5ejXtEM8YtB2ig5qSRnD0uwx7yqnjEdZwTnPTazyJgn/1fik388Ncsmk3UVYhyOMkM54hcn12MABpr+hQsh3BI2m/i1KbtlE19DilelsonnEAYUBNd9G9mPQsOhy1ZpXuN4VifORCBqaPgCAq/Mo1krTwdvSMnQLfKDe5WMnzyMDDHUKMimLVsszKna8sUfzdFME6QIO191OZS/ULxQZYvNVLqAjCwb7tceCH4M8IfY8xAsdgGqRm8GnCVmWhEFbeFthQZA9YnrazoaMWeltjRL/hxxa6pFvYP73aRp6vp7oAcu62qdwRGlBaWXRqY7q38Vslo3sdonfWomwfw4mzrOA1F/O3XglfQ8sPr/6eF/RibRUHfZmMMe8/TNAeX8fMxdkVPFOAdxodRDdTg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <56294FB107F91A429339E43090A7B747@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2694
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: a331cf36-71a0-4a28-df1b-08d8437c89c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z7rrwr/ih86of/JNZmcmti6KqWTWWalMIm0jR5HvF+k+fXnVVMujlncgZjpCwLdVn8Tv+VLrjSAjm9ViNDB8V4zN3RDumHYtSGFY0STrNSb/vgyuY8OK71TilkGZtlu92mDCfIUA8kh5FS1HL+3dqD7o0FFUScQ33L0K6DrLFBZAaWfPgjUEJpbWgFnHTU01fDDjECdGlevoSqDeSrISsWz5JZfftAWtiLhbVPI1qUvuhytNvRgoRwJ1zcmtN02u3g6hlc2E1qSO+qsFnjoXcMNxY0iBqELsU4jmq5awDASpiENS0BmkB5PwgNWBhBOG9kXzUl1purYdeQA90HZOK+0z+7AnGcOaedxmljPthr5rBnLxR0BHCt3M7swlLm8nKFx7CQUJEO1Ym6v6tsNwHS9T6b7x2L3ufRE6DWcXIh/9VRQZyC6aW13H5ZK4M6wK7m6hL07RZbipUfWkPEmfXL8ObSiX7+EBgK1pGv5ATfk=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(70586007)(86362001)(6506007)(6512007)(82740400003)(36906005)(26005)(53546011)(82310400002)(316002)(37006003)(54906003)(966005)(5660300002)(83380400001)(186003)(2906002)(6486002)(36756003)(4326008)(8676002)(8936002)(81166007)(70206006)(356005)(6862004)(478600001)(2616005)(336012)(33656002)(47076004)(6636002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 13:42:31.5045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 369ef68f-0e79-4642-3bef-08d8437c8e52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3319
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

DQoNCj4gT24gMTggQXVnIDIwMjAsIGF0IDEyOjIyLCBBbmRyw6kgUHJ6eXdhcmEgPGFuZHJlLnBy
enl3YXJhQGFybS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTgvMDgvMjAyMCAxMToxMywgQmVydHJh
bmQgTWFycXVpcyB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4+PiBPbiAxOCBBdWcgMjAyMCwgYXQg
MTA6NDIsIEFuZHLDqSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4gd3JvdGU6DQo+
Pj4gDQo+Pj4gT24gMTgvMDgvMjAyMCAxMDoyNSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+
PiANCj4+PiBIaSwNCj4+PiANCj4+Pj4+IE9uIDE4IEF1ZyAyMDIwLCBhdCAxMDoxNCwgQW5kcsOp
IFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4g
T24gMTgvMDgvMjAyMCAwNDoxMSwgV2VpIENoZW4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IEhpIFdl
aSwNCj4+Pj4+IA0KPj4+Pj4+IFhlbiBoYXMgY3B1X2hhc19mcC9jcHVfaGFzX3NpbWQgdG8gZGV0
ZWN0IHdoZXRoZXIgdGhlIENQVSBzdXBwb3J0cw0KPj4+Pj4+IEZQL1NJTUQgb3Igbm90LiBCdXQg
Y3VycmVudGx5LCB0aGlzIHR3byBNQUNST3Mgb25seSBjb25zaWRlciB2YWx1ZSAwDQo+Pj4+Pj4g
b2YgSURfQUE2NFBGUjBfRUwxLkZQL1NJTUQgYXMgRlAvU0lNRCBmZWF0dXJlcyBlbmFibGVkLiBC
dXQgZm9yIENQVXMNCj4+Pj4+PiB0aGF0IHN1cHBvcnQgRlAvU0lNRCBhbmQgaGFsZi1wcmVjaXNp
b24gZmxvYXRpbmctcG9pbnQgZmVhdHVyZXMsIHRoZQ0KPj4+Pj4+IElEX0FBNjRQRlIwX0VMMS5G
UC9TSU1EIGFyZSAxLiBGb3IgdGhlc2UgQ1BVcywgeGVuIHdpbGwgdHJlYXQgdGhlbSBhcw0KPj4+
Pj4+IG5vIEZQL1NJTUQgc3VwcG9ydC4gSW4gdGhpcyBjYXNlLCB0aGUgdmZwX3NhdmUvcmVzdG9y
ZV9zdGF0ZSB3aWxsIG5vdA0KPj4+Pj4+IHRha2UgZWZmZWN0Lg0KPj4+Pj4+IA0KPj4+Pj4+IFVu
Zm9ydHVuYXRlbHksIENvcnRleC1OMS9BNzYvQTc1IGFyZSB0aGUgQ1BVcyBzdXBwb3J0IEZQL1NJ
TUQgYW5kDQo+Pj4+Pj4gaGFsZi1wcmVjaXNpb24gZmxvYXRpaW5nLXBvaW50LiBUaGVpciBJRF9B
QTY0UEZSMF9FTDEuRlAvU01JRCBhcmUgMQ0KPj4+Pj4+IChzZWUgQXJtIEFSTSBEREkwNDg3Ri5i
LCBEMTMuMi42NCkuIEluIHRoaXMgY2FzZSwgb24gTjEvQTc2L0E3NQ0KPj4+Pj4+IHBsYXRmb3Jt
cywgWGVuIHdpbGwgYWx3YXlzIG1pc3MgdGhlIGZsb2F0IHBvaW50ZXIgcmVnaXN0ZXJzIHNhdmUv
cmVzdG9yZS4NCj4+Pj4+PiBJZiBkaWZmZXJlbnQgdkNQVXMgYXJlIHJ1bm5pbmcgb24gdGhlIHNh
bWUgcENQVSwgdGhlIGZsb2F0IHBvaW50ZXINCj4+Pj4+PiByZWdpc3RlcnMgd2lsbCBiZSBjb3Jy
dXB0ZWQgcmFuZG9tbHkuDQo+Pj4+PiANCj4+Pj4+IFRoYXQncyBhIGdvb2QgY2F0Y2gsIHRoYW5r
cyBmb3Igd29ya2luZyB0aGlzIG91dCENCj4+Pj4+IA0KPj4+Pj4gT25lIHRoaW5nIGJlbG93Li4u
DQo+Pj4+PiANCj4+Pj4+PiBUaGlzIHBhdGNoIGZpeGVzIFhlbiBvbiB0aGVzZSBuZXcgY29yZXMu
DQo+Pj4+Pj4gDQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5j
b20+DQo+Pj4+Pj4gLS0tDQo+Pj4+Pj4geGVuL2luY2x1ZGUvYXNtLWFybS9jcHVmZWF0dXJlLmgg
fCA0ICsrLS0NCj4+Pj4+PiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPj4+Pj4+IA0KPj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJt
L2NwdWZlYXR1cmUuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5oDQo+Pj4+Pj4g
aW5kZXggNjc0YmViMDM1My4uNTg4MDg5ZTVhZSAxMDA2NDQNCj4+Pj4+PiAtLS0gYS94ZW4vaW5j
bHVkZS9hc20tYXJtL2NwdWZlYXR1cmUuaA0KPj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vY3B1ZmVhdHVyZS5oDQo+Pj4+Pj4gQEAgLTEzLDggKzEzLDggQEANCj4+Pj4+PiAjZGVmaW5l
IGNwdV9oYXNfZWwyXzY0ICAgIChib290X2NwdV9mZWF0dXJlNjQoZWwyKSA+PSAxKQ0KPj4+Pj4+
ICNkZWZpbmUgY3B1X2hhc19lbDNfMzIgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChlbDMpID09IDIp
DQo+Pj4+Pj4gI2RlZmluZSBjcHVfaGFzX2VsM182NCAgICAoYm9vdF9jcHVfZmVhdHVyZTY0KGVs
MykgPj0gMSkNCj4+Pj4+PiAtI2RlZmluZSBjcHVfaGFzX2ZwICAgICAgICAoYm9vdF9jcHVfZmVh
dHVyZTY0KGZwKSA9PSAwKQ0KPj4+Pj4+IC0jZGVmaW5lIGNwdV9oYXNfc2ltZCAgICAgIChib290
X2NwdV9mZWF0dXJlNjQoc2ltZCkgPT0gMCkNCj4+Pj4+PiArI2RlZmluZSBjcHVfaGFzX2ZwICAg
ICAgICAoYm9vdF9jcHVfZmVhdHVyZTY0KGZwKSA8PSAxKQ0KPj4+Pj4+ICsjZGVmaW5lIGNwdV9o
YXNfc2ltZCAgICAgIChib290X2NwdV9mZWF0dXJlNjQoc2ltZCkgPD0gMSkNCj4+Pj4+IA0KPj4+
Pj4gQnV0IHRoaXMgaXMgb25seSBnb29kIHVudGlsIHRoZSBuZXh0IGZlYXR1cmUgYnVtcC4gSSB0
aGluayB3ZSBzaG91bGQgYmUNCj4+Pj4+IG1vcmUgZnV0dXJlLXByb29mIGhlcmUuIFRoZSBhcmNo
aXRlY3R1cmUgZGVzY3JpYmVzIHRob3NlIHR3byBmaWVsZHMgYXMNCj4+Pj4+ICJzaWduZWQiWzFd
LCBhbmQgZ3VhcmFudGVlcyB0aGF0ICJpZiB2YWx1ZSA+PSAwIiBpcyBhIHZhbGlkIHRlc3QgZm9y
IHRoZQ0KPj4+Pj4gZmVhdHVyZS4gV2hpY2ggbWVhbnMgd2UgYXJlIGdvb2QgYXMgbG9uZyBhcyB0
aGUgc2lnbiBiaXQgKGJpdCAzKSBpcw0KPj4+Pj4gY2xlYXIsIHdoaWNoIHRyYW5zbGF0ZXMgaW50
bzoNCj4+Pj4+ICNkZWZpbmUgY3B1X2hhc19mcCAgICAgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChm
cCkgPCA4KQ0KPj4+Pj4gU2FtZSBmb3Igc2ltZC4NCj4+Pj4+IA0KPj4+PiANCj4+Pj4gV2UgY2Fu
bm90IHJlYWxseSBiZSBzdXJlIHRoYXQgYSBuZXcgdmVyc2lvbiBpbnRyb2R1Y2VkIHdpbGwgcmVx
dWlyZSB0aGUNCj4+Pj4gc2FtZSBjb250ZXh0IHNhdmUvcmVzdG9yZSBzbyBpdCBtaWdodCBkYW5n
ZXJvdXMgdG8gY2xhaW0gd2Ugc3VwcG9ydA0KPj4+PiBzb21ldGhpbmcgd2UgaGF2ZSBubyBpZGVh
IGFib3V0Lg0KPj4+IA0KPj4+IEkgYW0gcHJldHR5IHN1cmUgd2UgY2FuLCBiZWNhdXNlIHRoaXMg
aXMgd2hhdCB0aGUgRlAgZmVhdHVyZSBkZXNjcmliZXMuDQo+Pj4gSWYgYSBmZWF0dXJlIGJ1bXAg
d291bGQgaW50cm9kdWNlIGEgbGFyZ2VyIHN0YXRlIHRvIGJlIHNhdmVkIGFuZA0KPj4+IHJlc3Rv
cmVkLCB0aGF0IHdvdWxkIGJlIGNvdmVyZWQgYnkgYSBuZXcgZmllbGQsIGxvb2sgYXQgQWR2U0lN
RCBhbmQgU1ZFDQo+Pj4gZm9yIGV4YW1wbGVzLg0KPj4+IFRoZSBmZWF0dXJlIG51bWJlciB3b3Vs
ZCBvbmx5IGJlIGJ1bXBlZCBpZiBpdCdzIGNvbXBhdGlibGU6DQo+Pj4gPT09PT09PT09PT09PT09
PT09PT0NCj4+PiDCtyBUaGUgZmllbGQgaG9sZHMgYSBzaWduZWQgdmFsdWUuDQo+Pj4gwrcgVGhl
IGZpZWxkIHZhbHVlIDB4RiBpbmRpY2F0ZXMgdGhhdCB0aGUgZmVhdHVyZSBpcyBub3QgaW1wbGVt
ZW50ZWQuDQo+Pj4gwrcgVGhlIGZpZWxkIHZhbHVlIDB4MCBpbmRpY2F0ZXMgdGhhdCB0aGUgZmVh
dHVyZSBpcyBpbXBsZW1lbnRlZC4NCj4+PiDCtyBTb2Z0d2FyZSB0aGF0IGRlcGVuZHMgb24gdGhl
IGZlYXR1cmUgY2FuIHVzZSB0aGUgdGVzdDoNCj4+PiAgICAgaWYgdmFsdWUgPj0gMCB7ICAvLyBT
b2Z0d2FyZSBmZWF0dXJlcyB0aGF0IGRlcGVuZCBvbiB0aGUgcHJlc2VuY2UNCj4+PiBvZiB0aGUg
aGFyZHdhcmUgZmVhdHVyZSB9DQo+Pj4gPT09PT09PT09PT09PT09PT09PT0NCj4+PiAoQVJNdjgg
QVJNIEQxMy4xLjMpDQo+Pj4gDQo+Pj4gQW5kIHRoaXMgaXMgaG93IExpbnV4IGhhbmRsZXMgdGhp
cy4NCj4+IA0KPj4gVGhlbiBjaGFuZ2luZyB0aGUgY29kZSB0byB1c2UgPDggc2hvdWxkIGJlIG9r
Lg0KPiANCj4gVGhhbmtzLiBBbm90aGVyIGFuZ2xlIHRvIGxvb2sgYXQgdGhpczoNCj4gVXNpbmcg
IjwgOCIgd2lsbCBuZXZlciBiZSB3b3JzZSB0aGFuICI8PSAxIiwgc2luY2Ugd2Ugb25seSBkZXJp
dmUgdGhlDQo+IGV4aXN0ZW5jZSBvZiB0aGUgZmxvYXRpbmcgcG9pbnQgcmVnaXN0ZXJzIGZyb20g
aXQuIFRoZSBtb21lbnQgd2Ugc2VlIGEgMg0KPiBpbiB0aGlzIHJlZ2lzdGVyIGZpZWxkLCB0aGUg
Ijw9IDEiIHdvdWxkIGRlZmluaXRlbHkgZmFpbCB0byBzYXZlL3Jlc3RvcmUNCj4gdGhlIEZQIHJl
Z2lzdGVycyBhZ2Fpbi4gQnV0IHRoZSBBUk0gQVJNIGd1YXJhbnRlZXMgdGhhdCB0aG9zZSByZWdp
c3RlcnMNCj4gYXJlIHN0aWxsIGFyb3VuZCAoc2luY2UgInZhbHVlID49IDAiIGhpdHMsIHNvIHRo
ZSBmZWF0dXJlIGlzIHByZXNlbnQsIGFzDQo+IHNob3duIGFib3ZlKS4NCj4gVGhlIHRoZW9yZXRp
Y2FsIHdvcnN0IGNhc2Ugd2l0aCAiPCA4IiB3b3VsZCBiZSB0aGF0IGl0IHdvdWxkIG5vdCBjb3Zl
cg0KPiAqZW5vdWdoKiBzdGF0ZSwgYnV0IGFzIGRlc2NyaWJlZCBhYm92ZSB0aGlzIHdpbGwgbmV2
ZXIgaGFwcGVuLCB3aXRoIHRoaXMNCj4gcGFydGljdWxhciBGUC9TSU1EIGZpZWxkLg0KDQpXZSBj
b3VsZCBhbHNvIGlzc3VlIGEgd2FybmluZyBmb3IgYSDigJxub24gc3VwcG9ydGVkIEZQL1NJTUTi
gJ0gaWYgc29tZXRoaW5nDQplbHNlIHRoZW4gMCBvciAxIHNob3dzIHVwIHNvIHRoYXQgYXQgbGVh
c3QgaXQgZG9lcyBub3QgcGFzc3Rocm91Z2ggd2l0aG91dA0KYmVpbmcgbm90aWNlZC4NCg0KQ2hl
ZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IEFuZHJlDQo+IA0KPj4+PiBJIGFncmVl
IHRob3VnaCBhYm91dCB0aGUgYW5hbHlzaXMgb24gdGhlIGZhY3QgdGhhdCB2YWx1ZXMgdW5kZXIg
OCBzaG91bGQNCj4+Pj4gYmUgdmFsaWQgYnV0IG9ubHkgMCBhbmQgMSBjdXJyZW50bHkgZXhpc3Qg
WzFdLCBvdGhlciB2YWx1ZXMgYXJlIHJlc2VydmVkLg0KPj4+PiANCj4+Pj4gU28gSSB3b3VsZCB2
b3RlIHRvIGtlZXAgdGhlIDEgZm9yIG5vdyB0aGVyZS4NCj4+Pj4gDQo+Pj4+IENoZWVycw0KPj4+
PiBCZXJ0cmFuZA0KPj4+PiANCj4+Pj4gWzFdIGh0dHBzOi8vZGV2ZWxvcGVyLmFybS5jb20vZG9j
cy9kZGkwNTk1L2gvYWFyY2g2NC1zeXN0ZW0tcmVnaXN0ZXJzL2lkX2FhNjRwZnIwX2VsMQ0KDQo=

