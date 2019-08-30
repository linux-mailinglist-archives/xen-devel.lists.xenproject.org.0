Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B786A32D8
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 10:42:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3cRv-0007cr-3C; Fri, 30 Aug 2019 08:40:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rh0z=W2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i3cRt-0007VK-R8
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 08:40:02 +0000
X-Inumbo-ID: be6f9732-cb01-11e9-8980-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.57]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be6f9732-cb01-11e9-8980-bc764e2007e4;
 Fri, 30 Aug 2019 08:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGT9YH9p6azSMowrxmSwm6trTNZbQTAk5yiLmTrmUiU=;
 b=mbmFCogR8IAO8n3xvf7smeg+x5yC7S1qrHs5bWH7p3qNy1ZjOQwN48twLpz++J6Zs3NvKkmzpfCnSKSQC85BhZNlQN7z9BU1GeowyopDxVLiKQht9S29pk5AKvHDURxTsCgDP3YdcE42O+OJzh7ayTf9hWe5qgnyfb3WPo+UogM=
Received: from DB6PR0802CA0037.eurprd08.prod.outlook.com (2603:10a6:4:a3::23)
 by AM5PR0801MB1841.eurprd08.prod.outlook.com (2603:10a6:203:2e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Fri, 30 Aug
 2019 08:39:52 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by DB6PR0802CA0037.outlook.office365.com
 (2603:10a6:4:a3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.19 via Frontend
 Transport; Fri, 30 Aug 2019 08:39:52 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com; lists.xenproject.org; dmarc=temperror
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 08:39:51 +0000
Received: ("Tessian outbound ea3fc1501f20:v27");
 Fri, 30 Aug 2019 08:39:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce4f17bbcbb3b2f8
X-CR-MTA-TID: 64aa7808
Received: from 3ddf30178b44.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B41527FC-56D6-4598-A33F-C19E755D20CF.1; 
 Fri, 30 Aug 2019 08:39:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ddf30178b44.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Aug 2019 08:39:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lW9Vy/Y4eDxjZ2/nSlHIPZ1ZMS0Jv39La0yfAXaIcFhKZrmp4lIQnoLScbxkuNCwur0Y3M5ZgVDT86paxOvy2M5Pks7seWaIqHQp1g4n8mnUZLcLg76/aqeKlyyQZTp9EGfgiy4lKus5KHG3RncniwWmZcmCrtQVVFhPQ3D2pEjLHRJzWCO6qOTBZ7zG67wYkcb5bl5J2cxdd7q85U1pyMmHai3rzpERA5pKGjPGQfpLroqLXlfUvxrbtpDGUr22d5m/Zz3Du559kAFF9Zgro4+c1I0ph0UQi1+JgkW2sU0WU1trjw5yUsYl9VRaP7O5rup7hGMcpDjyH1CC+66AIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGT9YH9p6azSMowrxmSwm6trTNZbQTAk5yiLmTrmUiU=;
 b=D+ZM4jwFHyxjqTX6iGt8vQVolUei0wd/qb/CJka2/3/hYH+zf2i+8L/o6+tAKrbwhhdD2T2CExr3vnRoJEMHoaQk5nZXRtAhOZDiSG9R8l1PA3nTPalvSxE+QzIUwvboOsvLP0hUYIyVD3To4xaQYzB1sokmePwMHmpDo1FMnAwjuBaq2H2iPofaJZ6rP7KnW2ah0Ymy8obuRrTGZn+tip+Vkt0BWhS/T1stlLLg161yhHsgIi/VWo1zNhScjiUgwVRZJ9QjeLY2ThoM+UjJ50MXpSFPz71jn2UQNN9TgIDTpWgOSmtXV5FsHdWbXYBjoBonVSrliGsPsxlAVbabOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGT9YH9p6azSMowrxmSwm6trTNZbQTAk5yiLmTrmUiU=;
 b=mbmFCogR8IAO8n3xvf7smeg+x5yC7S1qrHs5bWH7p3qNy1ZjOQwN48twLpz++J6Zs3NvKkmzpfCnSKSQC85BhZNlQN7z9BU1GeowyopDxVLiKQht9S29pk5AKvHDURxTsCgDP3YdcE42O+OJzh7ayTf9hWe5qgnyfb3WPo+UogM=
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com (10.175.20.10) by
 VI1PR0802MB2253.eurprd08.prod.outlook.com (10.172.13.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Fri, 30 Aug 2019 08:39:40 +0000
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::a954:a45a:ed8e:75d2]) by VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::a954:a45a:ed8e:75d2%7]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 08:39:40 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Peng Fan <peng.fan@nxp.com>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Catalin Marinas <Catalin.Marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, Robin Murphy <Robin.Murphy@arm.com>
Thread-Topic: [PATCH V2] arm: xen: mm: use __GPF_DMA32 for arm64
Thread-Index: AQHVXtqjidV/KwEkYkeguLx++Vlcn6cTXzGA
Date: Fri, 30 Aug 2019 08:39:40 +0000
Message-ID: <d7477406-a8a0-5c3c-13dc-2c84e27b8afa@arm.com>
References: <1567175255-1798-1-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1567175255-1798-1-git-send-email-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::15) To VI1PR0802MB2431.eurprd08.prod.outlook.com
 (2603:10a6:800:af::10)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2a01:cb08:86b1:6600:a573:4b2e:766:58a4]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: eaff6689-ee53-4967-87f3-08d72d259fac
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0802MB2253; 
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2253:|VI1PR0802MB2253:|AM5PR0801MB1841:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB18413EE37F8C4B25979C75CA80BD0@AM5PR0801MB1841.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0145758B1D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(199004)(189003)(6512007)(2501003)(76176011)(6506007)(102836004)(46003)(25786009)(53936002)(6246003)(4326008)(486006)(256004)(44832011)(446003)(476003)(2616005)(11346002)(14444005)(386003)(99286004)(53546011)(81156014)(81166006)(6436002)(478600001)(6636002)(2906002)(31696002)(14454004)(8676002)(305945005)(7736002)(36756003)(2201001)(316002)(6116002)(86362001)(186003)(71190400001)(66946007)(66556008)(52116002)(66476007)(66446008)(64756008)(71200400001)(5660300002)(229853002)(31686004)(110136005)(54906003)(8936002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2253;
 H:VI1PR0802MB2431.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: sHroK7arnOYZKzytftVqgGl08BJppyFSFkUsrPJFtuLWfvNohcGynmAlDFA5B5mZy8QoLUd0NJah9mNvwdlaAE0ryMTj5uJUWRXvbW0fIcYx4J+RmjQpZ9j3ENCcYza5luYUUE+43V1op1SHCnaQklp7hoPJHaCqh8aHKHmJBveLFbXXEB0UcJnlh3NTBhaeqBP46hIdSwVBj3T87eZfoHFatO29I8T+PVGllfTMnraxCFOPAl6ba45trys0NNfrt/rH9P3v6Q/H2jzgoc1dmzMhNoeBEtrWbD4kdeeSrBZxhBwa1jxzSTp/OnW6KoC4Qbc3EPEuBi5UpXQ4r0nhrrUoFd1ys0JM08+JgkgNPjgc+UFm0ML5GO6qHVflqSBHBRCUz9xlHdwYWuJdMUjncsK+U2t5XZHrUj8KFR5D/kk=
Content-ID: <4B6CC26985B43A458DE7D52F68DB5C74@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2253
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(2980300002)(199004)(189003)(70586007)(107886003)(4326008)(2906002)(6246003)(86362001)(2486003)(2501003)(23676004)(47776003)(76176011)(356004)(336012)(6512007)(31696002)(25786009)(76130400001)(53546011)(436003)(63370400001)(229853002)(5660300002)(186003)(102836004)(63350400001)(6636002)(70206006)(126002)(11346002)(2616005)(6486002)(476003)(2201001)(446003)(6506007)(386003)(26005)(486006)(316002)(110136005)(305945005)(99286004)(7736002)(81166006)(478600001)(81156014)(36756003)(6116002)(50466002)(26826003)(8676002)(31686004)(14444005)(8936002)(22756006)(54906003)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1841;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 95763250-b297-4c66-7cb8-08d72d25992f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR0801MB1841; 
NoDisclaimer: True
X-Forefront-PRVS: 0145758B1D
X-Microsoft-Antispam-Message-Info: GVZu2blVoVgqsilPXUDlMPNFRErNZtFlzIngbqXELP/CQzVTlTcqkEqWZnVPUhQwnBNSwaftvzdPdNY8+gga2q/nF4g7/c8oDzWNcr2zEvDgmazn5+jtwZrAmmAUtxQupnXy5KoV04wKV8u6a3qwkGzOXRK10/03igdqPHQcuhy+n1uTTuYftTq85zCBFPsZbcb6O7yAIo1j4RI6eZGfalyrjS73Pm2nLrk1p9JoikdZER19OhvCbDailAqeT8dYaV8zMnzmJaFMbEvaLnvBI7al8oRz2yNUiOFw0SF3/1Kux7v5OkYqi3TXXmG6JSSuECtKggKUpLZLlR8kgvB+muLgapSXi1ABUZW48ZWhxlU7HbyQWrlZnrV0aYRmZfNwcOM+7hB4Zy0IVU+uhy7YcWFeIdDyxKCGcT5ZelSIpCA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 08:39:51.1578 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaff6689-ee53-4967-87f3-08d72d259fac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1841
Subject: Re: [Xen-devel] [PATCH V2] arm: xen: mm: use __GPF_DMA32 for arm64
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, dl-linux-imx <linux-imx@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGVuZywNCg0KT24gMzAvMDgvMjAxOSAwNDoyOCwgUGVuZyBGYW4gd3JvdGU6DQo+IEZyb206
IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiANCj4gYXJtNjQgc2hhcmVzIHNvbWUgY29k
ZSB1bmRlciBhcmNoL2FybS94ZW4sIGluY2x1ZGluZyBtbS5jLg0KPiBIb3dldmVyIFpPTkVfRE1B
IGlzIHJlbW92ZWQgYnkgY29tbWl0DQo+IGFkNjdmNWE2NTQ1KCJhcm02NDogcmVwbGFjZSBaT05F
X0RNQSB3aXRoIFpPTkVfRE1BMzIiKS4NCj4gU28gaW50cm9kdWNlIHhlbl9zZXRfZ2ZwX2RtYSBm
b3IgYXJtMzIvYXJtNjQgYW5kIHVzaW5nIF9fR0ZQX0RNQQ0KPiBmb3IgdGhlIGZvcm1lciBhbmQg
X19HRlBfRE1BMzIgZm9yIHRoZSBsYXR0ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZh
biA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gLS0tDQo+IA0KPiBWMjoNCj4gICBGb2xsb3cgc3VnZ2Vz
dGlvbiBmcm9tIFN0ZWZhbm8sDQo+ICAgaW50cm9kdWNlIHN0YXRpYyBpbmxpbmUgdm9pZCB4ZW5f
c2V0X2dmcF9kbWEoZ2ZwX3QgKmZsYWdzKSBmb3IgYXJtMzIvYXJtNjQsIGFuZA0KPiAgIGZvciBh
cm02NCB1c2luZyBfX0dGUF9ETUEgZm9yIHRoZSBmb3JtZXIgYW5kIF9fR0ZQX0RNQTMyIGZvciB0
aGUgbGF0dGVyLg0KPiANCj4gICBhcmNoL2FybS9pbmNsdWRlL2FzbS94ZW4vcGFnZS5oICAgfCA1
ICsrKysrDQo+ICAgYXJjaC9hcm0veGVuL21tLmMgICAgICAgICAgICAgICAgIHwgMiArLQ0KPiAg
IGFyY2gvYXJtNjQvaW5jbHVkZS9hc20veGVuL3BhZ2UuaCB8IDUgKysrKysNCj4gICAzIGZpbGVz
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybS9pbmNsdWRlL2FzbS94ZW4vcGFnZS5oIGIvYXJjaC9hcm0vaW5jbHVkZS9h
c20veGVuL3BhZ2UuaA0KPiBpbmRleCAzMWJiYzgwM2NlY2IuLmQwODMwOWM0NWU2YyAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9hcm0vaW5jbHVkZS9hc20veGVuL3BhZ2UuaA0KPiArKysgYi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS94ZW4vcGFnZS5oDQo+IEBAIC0xICsxLDYgQEANCj4gICAjaW5jbHVkZSA8
eGVuL2FybS9wYWdlLmg+DQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB4ZW5fc2V0X2dmcF9k
bWEoZ2ZwX3QgKmZsYWdzKQ0KPiArew0KPiArCSpmbGFncyB8PSBfX0dGUF9ETUE7DQo+ICt9DQo+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS94ZW4vbW0uYyBiL2FyY2gvYXJtL3hlbi9tbS5jDQo+IGlu
ZGV4IGQzM2I3N2U5YWRkMy4uODI4ZjQ5ZGM5NWY5IDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybS94
ZW4vbW0uYw0KPiArKysgYi9hcmNoL2FybS94ZW4vbW0uYw0KPiBAQCAtMjgsNyArMjgsNyBAQCB1
bnNpZ25lZCBsb25nIHhlbl9nZXRfc3dpb3RsYl9mcmVlX3BhZ2VzKHVuc2lnbmVkIGludCBvcmRl
cikNCj4gICANCj4gICAJZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWcpIHsNCj4gICAJCWlm
IChyZWctPmJhc2UgPCAocGh5c19hZGRyX3QpMHhmZmZmZmZmZikgew0KPiAtCQkJZmxhZ3MgfD0g
X19HRlBfRE1BOw0KPiArCQkJeGVuX3NldF9nZnBfZG1hKCZmbGFncyk7DQoNClRoZSBuYW1lIG9m
IHRoZSBoZWxwZXIgaXMgcXVpdGUgbWlzbGVhZGluZywgdGhpcyBpcyBzcGVjaWZpYyB0byBzd2lv
dGxiIA0KeWV0IGl0IGdpdmVzIHRoZSBpbXByZXNzaW9uIGl0IGNhbiBiZSB1c2VkIGV2ZXJ5d2hl
cmUuIFRoZSBoZWxwZXIgd2lsbCANCmFjdHVhbGx5IHNldCB0aGUgZmxhZ3MgaW4gb3JkZXIgdG8g
YWxsb2NhdGUgbWVtb3J5IGJlbG93IDRHQi4NCg0KQWxzbywgSSBzYXcgYW4gZS1tYWlsIHN1Z2dl
c3RpbmcgdGhhdCBfX0dGUF9ETUEgbWF5IGJlIHVzZWQgb24gQXJtNjQuIFNvIA0KYSB1c2VyIG1h
eSB0aGluayB1c2luZyB4ZW5fc2V0X2dmcF9kbWEoKSB3aWxsIHNldCBfR0ZQX0RNQSBhbmQgbm90
IA0KX0dGUF9ETUEzMi4NCg0KSSBrbm93IGR1cGxpY2F0aW9uIGlzIG5vdCBncmVhdCBidXQgaXQg
ZmVlbHMgdGhhdCBkdXBsaWNhdGluZyB0aGUgZnVsbCANCmZ1bmN0aW9uIChvciBvbmx5IHRoZSBh
bGxvY2F0aW9uIHBhcnQpIHdvdWxkIGJlIHRoZSBiZXN0LiBUaGlzIHdvdWxkIA0KcmVxdWlyZSB0
byBpbnRyb2R1Y2UgYSBuZXcgZmlsZSBtbXszMiw2NH0uYyBpbiB0aGUgcmVzcGVjdGl2ZSBhcmNo
IA0KZGlyZWN0b3J5Lg0KDQpDaGVlcnMsDQoNCi0tIA0KSnVsaWVuIEdyYWxsDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
