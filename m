Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9130CBE6B8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 22:57:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDEJh-0007Um-Sx; Wed, 25 Sep 2019 20:55:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KYcU=XU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDEJf-0007Uh-Oj
 for xen-devel@lists.xen.org; Wed, 25 Sep 2019 20:55:15 +0000
X-Inumbo-ID: c2f61c9c-dfd6-11e9-97fb-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.40]) by localhost (Halon) with ESMTPS
 id c2f61c9c-dfd6-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 20:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PSWjHywEiVSpvbfRn49YjIsVFoTokK0MZQ4dtXax+g=;
 b=Z17J+JPWjBEuaiV4/8PsLdWOPQ7s5rGE146k9q0A6jOpXo9N5krwtLAT7jD+8gOI//JMWsOsqBpn+1uzoIz8M2SJDp4+X+jIZRiWxL64ZtFeCCCay/GQhlFcv5m8R6uC2KDk191hq7jzbRTUhFFd1JG2MTJlqw4Q703hrLjvTGo=
Received: from DB7PR08CA0055.eurprd08.prod.outlook.com (2603:10a6:10:26::32)
 by AM6PR08MB3016.eurprd08.prod.outlook.com (2603:10a6:209:44::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.22; Wed, 25 Sep
 2019 20:55:06 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by DB7PR08CA0055.outlook.office365.com
 (2603:10a6:10:26::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Wed, 25 Sep 2019 20:55:06 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=none action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 25 Sep 2019 20:55:04 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Wed, 25 Sep 2019 20:55:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4f605c9dfff260b6
X-CR-MTA-TID: 64aa7808
Received: from 66959bc614e6.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 35FC35FB-A3F8-46D0-A20C-1F880A5CEF04.1; 
 Wed, 25 Sep 2019 20:54:57 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 66959bc614e6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Sep 2019 20:54:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8DrniWQK1HnjxiyrwNym4Jb6qqf1HdLuTTo2IvpR0DQ7AveETnWcYb2uvNOOt1/GyWEPJwBco1iYHyF0TvPD3TMcsn9GkGJC7+wcz1yMN/lCUIiH3XpuJDOJ3MIbjmJqSQ5ek5ovkJxdBDkTw3U9HxzE5EUvupSiSuXnrJ3qaJyBVsbN7mhWHWmJ2e+r8MJ92JIwQz3E+DmwGoLMP2kNQOgih19OKRxoLjd+j8y8gYvpPukyYUprtp8Soq+ElF7QPphcyNvg2MgjeiE5+T9B6ZKu1++eMwH9oNmBH82VnLn497n3I26AWY+HLvmubEoRgo5p8Hn+geDHOloa1w9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PSWjHywEiVSpvbfRn49YjIsVFoTokK0MZQ4dtXax+g=;
 b=fXu9V+bOsUQzpnWJ232/VeNx9FL0LLtTVf5MWVgtJUx96TQbgD1SOXLkmquplg4RTg76+L7/7AlvwSq9Hh4/hFZ6KRaHRNZ3pQOSGvjKAZd/m/QptuccrbtEXJoqJa7dXYuig9km3t/QeK/4z+idgn58lSUXBuTlVOwlGddqXJsymm0Rg0Q+wCfb8A2Qx2XaK5xWiQf/HYeBfiBpZRd3bGL0hvehZF501xDJE6/9V5lRf3FGWzXjNR9CkJ6gSd53YltZV6h9H2PITuxDB5M8w6qJF1fv11b2oRgoAdMXn/CRCiw0a36elFQCqL2NJE9fdivuP0iDHBac7R6QHKM84A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PSWjHywEiVSpvbfRn49YjIsVFoTokK0MZQ4dtXax+g=;
 b=Z17J+JPWjBEuaiV4/8PsLdWOPQ7s5rGE146k9q0A6jOpXo9N5krwtLAT7jD+8gOI//JMWsOsqBpn+1uzoIz8M2SJDp4+X+jIZRiWxL64ZtFeCCCay/GQhlFcv5m8R6uC2KDk191hq7jzbRTUhFFd1JG2MTJlqw4Q703hrLjvTGo=
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com (10.175.20.10) by
 VI1PR0802MB2512.eurprd08.prod.outlook.com (10.175.20.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Wed, 25 Sep 2019 20:54:55 +0000
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d]) by VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d%12]) with mapi id 15.20.2284.023; Wed, 25 Sep
 2019 20:54:55 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v5 3/8] xen/arm: introduce kinfo->guest_phandle_gic
Thread-Index: AQHVc9H4VfH8CJdYOkWCA5Kgl4p5v6c831AA
Date: Wed, 25 Sep 2019 20:54:55 +0000
Message-ID: <6236073a-9930-4704-8f73-3a4956e37f58@arm.com>
References: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
 <20190925184924.21691-3-sstabellini@kernel.org>
In-Reply-To: <20190925184924.21691-3-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:e6::25) To VI1PR0802MB2431.eurprd08.prod.outlook.com
 (2603:10a6:800:af::10)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1fd7da4b-bea3-4a47-1c4f-08d741faa42b
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR0802MB2512; 
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2512:|VI1PR0802MB2512:|AM6PR08MB3016:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3016B0BE0156746B7F60EF9880870@AM6PR08MB3016.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 01713B2841
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(199004)(189003)(478600001)(229853002)(102836004)(2906002)(3846002)(476003)(186003)(26005)(86362001)(6116002)(6506007)(386003)(66946007)(66446008)(31696002)(81166006)(6486002)(6436002)(53546011)(76176011)(66556008)(64756008)(5660300002)(446003)(36756003)(66476007)(6246003)(8676002)(6512007)(52116002)(44832011)(2616005)(11346002)(316002)(31686004)(8936002)(81156014)(71200400001)(6916009)(54906003)(71190400001)(99286004)(486006)(256004)(4326008)(305945005)(14454004)(7736002)(66066001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2512;
 H:VI1PR0802MB2431.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 8mWGJxEygwQegWr58jT6Gh2igXwZVcdFibb1rZ9diS3AmZDxd0tsrVRqcbjFsevJnRa3d1dzI5O9CEFk93z+eg7pJ5569iq8n+UE7xTTpFrTQvB/1VpjSwXkCOaw8NGFjFPB2+ibWMt+JsfhC3YbR2EAmD9Bz0XuIew22s77wnJHZeH8jrR36qrq0BIoQ3WbmiwLjlmOLcvy1iIbynTc6kaEwFLi3ixX267YJm3s/2iV9afz/1EhflvSrMXoWYaRrg+Dalyb3wy9mpOi6shvj/lN2NjnWwjhdSdnmOqGUgNw8T/LFkRtVs4hvApgndagPm4ssYB+PimeXcZEXCVIAg5utn1dIYaX7nz40ImP/GoWwqWwv5g4UJI/M9yj5d/YieqRdpn48f74q9AF2vusxOxgXa73LAin/iYfkbb/JdI=
Content-ID: <43CB8E82BE31DC4CBCA34CEB35388F0D@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2512
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(136003)(346002)(189003)(199004)(86362001)(102836004)(26826003)(66066001)(229853002)(47776003)(76176011)(36906005)(316002)(486006)(53546011)(386003)(6506007)(81166006)(7736002)(11346002)(478600001)(6486002)(3846002)(6116002)(26005)(186003)(2486003)(63350400001)(446003)(22756006)(8936002)(81156014)(8676002)(5660300002)(436003)(36756003)(23676004)(6512007)(107886003)(31686004)(4326008)(305945005)(6246003)(6862004)(31696002)(99286004)(76130400001)(2906002)(70206006)(126002)(2616005)(336012)(70586007)(25786009)(356004)(54906003)(476003)(14454004)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3016;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 757d0390-5219-4b12-c8dd-08d741fa9e86
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR08MB3016; 
NoDisclaimer: True
X-Forefront-PRVS: 01713B2841
X-Microsoft-Antispam-Message-Info: aRwixKTzmWDGtzQaMA8sk+jgMpOwWjRIk0pG1WvGGWE9aUde9qsQIIYYFbcbX1O6Rw7te8amLCNDz4FrN6hw7OVnz2IkZvk/oeueppSxEWMNczL6qoyhJT8MuIbbozBES6+1nkVhtv2sMwjF1woI7EnrrvlgHi4N1OMiFBPB7mX/zV4QAR8vkA6l7ID4shJx0720TDyk4puAaM1J5JB9sP2Jv7rq8wZeVGgCjyCxUmjl//DRv31AeMdmPpJslDg4a1HloinTchh5L5y26sIdZx1y6ZSY+i06lAfSjWNdPSlbKMH4Bm7Jti7I7119WdkYryjUjKpI2qfBt22trbXjRAiH4CvUqeckbeM5KFaCpxVZns4ZUTD7M7KMqV0vA1vjVi6iUGNSizrcZtTIf8PexFor3ZFCkgVBIJKbKNoDwWA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 20:55:04.7532 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd7da4b-bea3-4a47-1c4f-08d741faa42b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3016
Subject: Re: [Xen-devel] [PATCH v5 3/8] xen/arm: introduce
 kinfo->guest_phandle_gic
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Achin Gupta <Achin.Gupta@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, nd <nd@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDI1LzA5LzIwMTkgMTk6NDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
SW5zdGVhZCBvZiBhbHdheXMgaGFyZC1jb2RpbmcgdGhlIEdJQyBwaGFuZGxlIChHVUVTVF9QSEFO
RExFX0dJQyksIHN0b3JlDQo+IGl0IGluIGEgdmFyaWFibGUgdW5kZXIga2luZm8uIFRoaXMgd2F5
IGl0IGNhbiBiZSBkeW5hbWljYWxseSBjaG9zZW4gcGVyDQo+IGRvbWFpbi4gUmVtb3ZlIHRoZSBm
ZHQgcG9pbnRlciBhcmd1bWVudCB0byB0aGUgbWFrZV8qX2RvbVVfbm9kZQ0KPiBmdW5jdGlvbnMg
YW5kIG9hc3MgYSBzdHJ1Y3Qga2VybmVsX2luZm8gKiBpbnN0ZWFkLiBUaGUgZmR0IHBvaW50ZXIg
Y2FuDQo+IGJlIGFjY2Vzc2VkIGZyb20ga2luZm8tPmZkdC4gUmVtb3ZlIHRoZSBzdHJ1Y3QgZG9t
YWluICpkIHBhcmFtZXRlciB0bw0KPiB0aGUgbWFrZV8qX2RvbVVfbm9kZSBmdW5jdGlvbnMgYmVj
YXVzZSBpdCBiZWNvbWVzIHVudXNlZC4NCj4gDQo+IEluaXRpYWxpemUgZ3Vlc3RfcGhhbmRsZV9n
aWMgdG8gR1VFU1RfUEhBTkRMRV9HSUMgYXQgdGhlIGJlZ2lubmluZyBvZg0KPiBwcmVwYXJlX2R0
Yl9kb21VLiBMYXRlciBwYXRjaGVzIHdpbGwgY2hhbmdlIHRoZSB2YWx1ZSBvZg0KPiBndWVzdF9w
aGFuZGxlX2dpYyBkZXBlbmRpbmcgb24gdXNlciBwcm92aWRlZCBpbmZvcm1hdGlvbi4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4N
Cj4gDQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHY1Og0KPiAtIGltcHJvdmUgY29tbWl0IG1lc3NhZ2UN
Cj4gQ2hhbmdlcyBpbiB2NDoNCj4gLSBuZXcgcGF0Y2gNCj4gLS0tDQo+ICAgeGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jICB8IDM2ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LQ0KPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0va2VybmVsLmggfCAgMyArKysNCj4gICAyIGZpbGVz
IGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYw0KPiBpbmRleCAyMTk4NTYyOGYwLi4zMmY4NWNkOTU5IDEwMDY0NA0KPiAtLS0gYS94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jDQo+IEBAIC02MjcsNyArNjI3LDggQEAgc3RhdGljIGludCBfX2luaXQgZmR0X3Byb3Bl
cnR5X2ludGVycnVwdHMoY29uc3Qgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywNCj4gICB7DQo+
ICAgICAgIGludCByZXM7DQo+ICAgICAgIHVpbnQzMl90IHBoYW5kbGUgPSBpc19oYXJkd2FyZV9k
b21haW4oa2luZm8tPmQpID8NCj4gLSAgICAgICAgICAgICAgICAgICAgICAgZHRfaW50ZXJydXB0
X2NvbnRyb2xsZXItPnBoYW5kbGUgOiBHVUVTVF9QSEFORExFX0dJQzsNCg0KU29ycnksIEkgb25s
eSByZWFsaXplZCBpdCBub3cuIEJ1dCBpcyB0aGVyZSBhbnkgcmVhc29uIHRvIG5vdCBzZXQgDQpn
dWVzdF9waGFuZGxlX2dpYyBmb3IgdGhlIGh3ZG9tIGFsc28/DQoNClsuLi5dDQoNCj4gZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0va2VybmVsLmggYi94ZW4vaW5jbHVkZS9hc20tYXJt
L2tlcm5lbC5oDQo+IGluZGV4IDMzZjNlNzJiMTEuLjc2MDQzNDM2OWIgMTAwNjQ0DQo+IC0tLSBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0va2VybmVsLmgNCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFy
bS9rZXJuZWwuaA0KPiBAQCAtMzYsNiArMzYsOSBAQCBzdHJ1Y3Qga2VybmVsX2luZm8gew0KPiAg
ICAgICAvKiBFbmFibGUgcGwwMTEgZW11bGF0aW9uICovDQo+ICAgICAgIGJvb2wgdnBsMDExOw0K
PiAgIA0KPiArICAgIC8qIEdJQyBwaGFuZGxlICovDQo+ICsgICAgdWludDMyX3QgZ3Vlc3RfcGhh
bmRsZV9naWM7DQoNClRoaXMgd291bGQgYWxzbyBhbGxvdyB0byBkcm9wIHRoZSBndWVzdF8gcHJl
Zml4Lg0KDQo+ICsNCj4gICAgICAgLyogbG9hZGVyIHRvIHVzZSBmb3IgdGhpcyBrZXJuZWwgKi8N
Cj4gICAgICAgdm9pZCAoKmxvYWQpKHN0cnVjdCBrZXJuZWxfaW5mbyAqaW5mbyk7DQo+ICAgICAg
IC8qIGxvYWRlciBzcGVjaWZpYyBzdGF0ZSAqLw0KPiANCg0KQ2hlZXJzLA0KDQotLSANCkp1bGll
biBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
