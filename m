Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF68245B3BC
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 06:08:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229845.397695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpkVV-0006Zw-7G; Wed, 24 Nov 2021 05:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229845.397695; Wed, 24 Nov 2021 05:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpkVV-0006WW-3l; Wed, 24 Nov 2021 05:07:45 +0000
Received: by outflank-mailman (input) for mailman id 229845;
 Tue, 23 Nov 2021 17:15:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VsJ3=QK=hotmail.com=yanluyi2010@srs-se1.protection.inumbo.net>)
 id 1mpZNp-0003nz-N7
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 17:15:06 +0000
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01olkn20804.outbound.protection.outlook.com
 [2a01:111:f403:700c::804])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4cd7967-4c80-11ec-a9d2-d9f7a1cc8784;
 Tue, 23 Nov 2021 18:15:04 +0100 (CET)
Received: from OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1a2::6)
 by OS3P286MB2216.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:19e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Tue, 23 Nov
 2021 17:14:59 +0000
Received: from OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9c31:6396:f5d2:35e6]) by OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9c31:6396:f5d2:35e6%9]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 17:14:59 +0000
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
X-Inumbo-ID: e4cd7967-4c80-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLfHUfHDDYpqtGOQPllFxRtuSpWT6WLRsNIAhCIYm65iX2SUHH3TWmQpbjtQfP0ql+0zQZBOc/doJe23dp3Pn+07uQMTEcm39fVYNpAPptA7rnvcLo6uuKiPKFrkl7DnXp8kSMgtMHhWUEpKvSVV5p1un3ZUIsLLQI22YHUd1Q4Ivs9Qn8WF6DxsAI9lmjzs116qJiNjImAiLYtgLcoLfFy9HK/QDzxJU1AyZbSwF2rq470tVnW1ooop0lPkSpLKM9CTAzMg/SpJaP1XjprquTVrRgdiR5Kr4axbz22KJKGpSjV2IfjaA5s21Bv6dCyX9kaRd73Ie1m7GC09x5vSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPu+n1MCAiGH80dsmwp7Eg014lgaHobIuWXt39a25pw=;
 b=BSnFXGFflMNHU+tKMmhGZ9h0gv408cYF0DM9xMKkUmPtulzjobgR4wgUzaNhGmbUYeky3vAtaMO1JP6aAQME2SPTd7wagX038qHn8JPd5qEWoEF+M6/83Mpz8YPYeM1++UVQRrbGRIXEpfahz8zmlKLOGl2A/WgGKuk4VfHp5Cy5KxtoFZ6jfv5Gr15RlfvClS6H4lMG1JaGKfrJJ5PAC5dO2gFZWZzGitNhwdgMwaWB0Ffbgr9+8K1kl+GpZFin5xapG09J6KowDORPOghygiNbUn8sdQQRmbQR6V2MJ8YdhVzmPckHd0owCTuOCyggGoYL8k5fDDxsqE42/mGN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPu+n1MCAiGH80dsmwp7Eg014lgaHobIuWXt39a25pw=;
 b=SqAOwP46LsxcrZt/Tn8lLOl3k7a8X7ZMWdBXZ8OyV8mdju439bbzYBl7Szb33dAiW5z+QrHNfk8B0UWkPt+q15yBUt2FR7RgT8pA+0mcUZNNjKtwHnK9XiIuRWLCDWaqfKSO1A3ABsvQaf8m/8XcGsyN6F3bqE/TmcIpUeoZLAWj1CQW9CgUf96WtDc++9A0qgohEdupSyn8mY23nohFKhiWKEdLoLiomSkLoaSsgvtq9X6XbcXUkHgzLrU4mh/vAsGTj/F/qvj1hG79IGnqm8N8XGYVPKZ5GGVmsC5kBsI8gEM5b7C8xz5XZXV/qriiheASaarjV+OWmmWQLQ4rew==
From: YAN Untitled <yanluyi2010@hotmail.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "tamas@tklengyel.com" <tamas@tklengyel.com>, "aisaila@bitdefender.com"
	<aisaila@bitdefender.com>, "ppircalabu@bitdefender.com"
	<ppircalabu@bitdefender.com>
Subject: About support for memory event on AMD CPUs
Thread-Topic: About support for memory event on AMD CPUs
Thread-Index: AQHX4Ivyto+Oc0SSQ0aRZryw/8JAGw==
Date: Tue, 23 Nov 2021 17:14:59 +0000
Message-ID:
 <OS3P286MB1995471B56ADDC423A4EDC9FB3609@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 82a30604-7731-0f07-d47c-a7cc38443806
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [3bhbTluaqpWQN9JFW4AqGh52yTUcYKoJKBMuSJUqdxY=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9239ae34-f881-449a-df2f-08d9aea4c7a0
x-ms-traffictypediagnostic: OS3P286MB2216:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bP0Ah2FFXQ7r18WMCzTUzIGSoWdloz2cDLgDOfsA1NB631GwFPzurB0KkNFJLIGEf7vqlnQ3r/lTmyXGIUeUHGjbeESnxkp9xs6ZrwA5jAUv11u5XrUid8OoEruwVbMXhwhjQkDLD9QNuBEYCd3maf/eKjsVCdl5nr90RxPBImPZC8roaY2iV02qmgQsy5puBzvIJiv+dG7Smb6UtJ4Vp9D7quVhrfg4ZhG+CoND1RcQ+IEGbmXl5ufCzJ/60BPgF/GAdqkBXAZlifLvsPyzuv8qQQxd2yJD9N6b9So1wZmtQGjc9ujQNmI6EeqvAOSAlDhJuFn2gYQTXA+aYI53+dCMsemlffmY4Sn8/OEh7SlMMG57jDWzwj1fnSPEw9w79wFZvio8A4LO+VewQWCnIx4tyHIywWSwsbr5q+JxgypFe1XTotcpUv4jFNsfRndR4isv4KVwizXjPkf+sVYAuTHdJeJeg+FEOxzbXjcH5WchToA9aW2yZAGHJMO82TSlfhAQRbhNRA+dqPULaBrLML7J6hLZBwJcLw0D7/KiGcgpCtiTUJDm9bcfnJ2k3GzJ7IIYAxrdjCRz9cJ41pU6tYiKGcrGXvxhLqEWKvQ2+d4iQsRGakDBnlHKYVLuLGmy
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 UNUenQ9KUbgPFXhNtn4R+U5dAN7274UXuyD1cqmwYoL8/L6neazYmS6x/TlPAxx9MEud7re6U+w8xPvpDZDnDMsRBhw2aZXtVcOlWsRqkdi4wg60RohDIsfshhVnG+IWmHdMnI8+7uZni39QYFKslhrwLPS5KDqPvznmuHP8Sjz+Dy2FSD97eottXauwokC6hb3bbxzywq1/ACzKjWnGoB/ypJqzT2I5jS7oDOA0ywQWpo1aKEZtCkAaOM1Flokq5We0yhBdD6C6ei7EMV607X4Z7BPxsCLf7EEm73WHpy6IGSnfilTPrj04HK+1q9l5UDGG+SDzdlBfoGUcptg3qXwvxxPEeO6XKQb3hPGct0aRkgRNfjlgraNSlGS4yhUfyXrnU1jY0zHF/xGzJVbmaC+ki/By/E6+u9QYVqWx58+gURJeqLEtSGubCzCS1ehpQqcq5ZHiuaa1jfTuPx3uhlo2WCqf5JWMWba3WfhHPJLVW4YIMnCeaUiJNd6nD0U6tZIL4og3SyQFLmLtv1N530/U7Y6shXoO91Wib0LVvo+zTRFrfxA8tqhrEaupO1FphEro2DCeMDQnJAdMLdDOaXWiC4K5Z8Mk18eTtqAmruqT7EMdvzl0//+a4LzsuQWY3ZZQoFygor36OuOJagPSkg4vk4kJMIqUY0UOPflkoxrHMh70fHRHL4WhEczCFW66R6Cdg2jUhAY5XuWtGrcQvQ==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-18f16.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9239ae34-f881-449a-df2f-08d9aea4c7a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 17:14:59.5828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2216

RGVhciBkZXZlbG9wZXJzLAoKU2hvcnQgdmVyc2lvbjogaXMgbWVtb3J5IGV2ZW50IHN1cHBvcnRl
ZCBvbiBBTUQgQ1BVcyBvciBpcyBpdCBnb2luZyB0byBiZQpzdXBwb3J0ZWQ/CgpMb25nIHZlcnNp
b246CgpFbnZpcm9ubWVudDogTGliVk1JIDAuMTUuMCArIFhlbiA0LjE0LjMgb24gYW4gKipBTUQg
Q1BVKiogKDU5NTB4KSwgNjQtYml0CkRlYmlhbiAxMSBEb20wLgoKV2hhdCBJIGFtIHRyeWluZyB0
byBhY2NvbXBsaXNoOiByZWdpc3RlciBhICoqbWVtb3J5IGV2ZW50KiogaGFuZGxlciwgc28gdGhh
dApJIGNhbiBjYXB0dXJlIGFsbCBtZW1vcnkgYWNjZXNzZXMgd2l0aGluIGEgc3BlY2lmaWMgcmFu
Z2UgaXNzdWVkIGJ5IGFueSB0aHJlYWQsCm9yIGFsbCBtZW1vcnkgYWNjZXNzZXMgd2l0aGluIGFu
eSByYW5nZSBpc3N1ZWQgYnkgYSBzcGVjaWZpYyB0aHJlYWQuCgpXaGF0IEkgZ290IGluc3RlYWQ6
IGFuIGVycm9yIGZyb20gTGliVk1JIHNheWluZwoieGNfaHZtX3NldF9tZW1fYWNjZXNzIGZhaWxl
ZCB3aXRoIGNvZGU6IC0xIi4KClNvbWUgaW52ZXN0aWdhdGlvbjogYnkgaW5zcGVjdGluZyB0aGUg
c291cmNlIGNvZGUgb2YgTGliVk1JLCBJIGZpbmQgdGhlIGRpcmVjdApjYXVzZSBpcyBvbmUgb2Yg
dGhlIGxpYnhjIGZ1bmN0aW9ucywgMSkgeGNfc2V0X21lbV9hY2Nlc3Mgb3IKMikgeGNfYWx0cDJt
X3NldF9tZW1fYWNjZXNzLCByZXR1cm5lZCBlcnJvciBjb2RlIC0xLgoKQWZ0ZXIgc29tZSBzZWFy
Y2hpbmcsIEkgZm91bmQgc29tZW9uZSBlbHNlIGhhdmluZyBhIHNpbWlsYXIgcHJvYmxlbSBbMV0u
IEkgYWxzbwpub3RlZCBMaWJWTUkgc2F5czoKCj4gQ3VycmVudGx5IG9ubHkgdGhlIFhlbiBIeXBl
cnZpc29yIHByb3ZpZGVzIHRoZXNlIGZlYXR1cmVzLAo+IGFuZCBzb21lIG9mIHRoZXNlIGFyZSBz
cGVjaWZpY2FsbHkgb25seSBhdmFpbGFibGUgb24gSW50ZWwgQ1BVcwoKSG93ZXZlciwgSSBjYW4n
dCBmaW5kIHRoZSBleGFjdCBjb25maXJtYXRpb24gZm9yIHRoZSBhdmFpbGFiaWxpdHkgb2YgbWVt
b3J5CmV2ZW50IG9uIEFNRCBDUFVzIGZyb20gaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnLgoK
QW55IHN1Z2dlc3Rpb24/CgooU29ycnkgSSB3YXMgc2VuZGluZyB0aGlzIGVtYWlsIHRvIHRoZSB3
cm9uZyBwbGFjZSkKClsxXSBodHRwczovL2dpdGh1Yi5jb20vbGlidm1pL2xpYnZtaS9wdWxsLzcw
OSNkaXNjdXNzaW9uX3IzNTM3Mjk3NzcKCgpVbnRpdGxlZCBZQU4=

