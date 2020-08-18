Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 931252481D8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 11:26:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7xsI-0007WO-HY; Tue, 18 Aug 2020 09:25:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTNL=B4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k7xsH-0007WG-7s
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 09:25:45 +0000
X-Inumbo-ID: 7ddf16dd-93af-44f3-ad3e-a4673d5fcae7
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::60d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ddf16dd-93af-44f3-ad3e-a4673d5fcae7;
 Tue, 18 Aug 2020 09:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJrvrzYO3Dt1vauXHL61hull8LpSzwVyuJSl+jxhaXY=;
 b=Lqwzc1LX4o4s7VxkJQz5sOVBz0Ei//IjTVIak//dFJqFdV75bB4/UIQEMDeVjjuHEK5I9a3J5OYnXC4S16sG2tUnni05sshsOlTlXTJVNT1kltu7LTL8veFMttBfY4R2uGiZZTGgYuu+f2xaGsmUEPPW7SmsaY9cQF6KzXDHH98=
Received: from AM5PR0602CA0002.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::12) by VI1PR08MB2975.eurprd08.prod.outlook.com
 (2603:10a6:803:44::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 18 Aug
 2020 09:25:41 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::4c) by AM5PR0602CA0002.outlook.office365.com
 (2603:10a6:203:a3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Tue, 18 Aug 2020 09:25:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 09:25:41 +0000
Received: ("Tessian outbound 195a290eb161:v64");
 Tue, 18 Aug 2020 09:25:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 64c80489600e0e09
X-CR-MTA-TID: 64aa7808
Received: from 9a3bea9a0ba7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FAC883BE-6F4B-4C0C-82AC-4CD51185AB57.1; 
 Tue, 18 Aug 2020 09:25:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a3bea9a0ba7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Aug 2020 09:25:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noXUGZSZeU7oisVTQkVm6mVk+kvqonCF03R1Lnj+Y9Bail6Ad4cALXLoJVUheec0ju3EaCTVtbgvzovf51+qGLaOUn43ibhIIV9p7dFjqyp2N1jHAT0hOsRbDCJtwV2mYJloycH+upTlAfr2+aOZ4y4F42lcFdtTsZ95q4lVamidZannNcTMKaa4CFnIdc+CJg/Xqd3+IOuRsOynzxHcANmOsP87eU4NKB41cTVYM6HggliyRdkHsWoxqQZ56JqNhIRVBejBmqlpB+5lXdJA97erhn8N3CZj70gSBB8HyxfeHoMiWFhkuiy0rWYjPGNEQ4qCrHSDt6CtDcTz+/E4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJrvrzYO3Dt1vauXHL61hull8LpSzwVyuJSl+jxhaXY=;
 b=mOiqbKnFoP0v8bj3mcMrCKTfjpB0FZGqS7RViTMoX2ktjun3quVPF9BfEAa/Rs4XCoA175eHxXZEAxfosh/ORD3ilfMB8wmXZtdh+7B4qbGNrHR7/BWpHC5d1XVDVpu8W+bC8uuAC74fC4V/hScbGW8qG1XYT8le7LFqw25H2okOEoggP7YDzlph2M85k23tFEr+xpgu7yVbGUywZkvYij3NpeeyoilTweneMGe1DRSLg0SHJ21rnap8WJ8BUPPJhaQGzDO2EsY5mqI8eE7zWWLvRl2LUNcXRrWT7isUeXFJhmOfUWXxzBIKrEJCezO4QiSucjTrmq3kTbNNT96X5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJrvrzYO3Dt1vauXHL61hull8LpSzwVyuJSl+jxhaXY=;
 b=Lqwzc1LX4o4s7VxkJQz5sOVBz0Ei//IjTVIak//dFJqFdV75bB4/UIQEMDeVjjuHEK5I9a3J5OYnXC4S16sG2tUnni05sshsOlTlXTJVNT1kltu7LTL8veFMttBfY4R2uGiZZTGgYuu+f2xaGsmUEPPW7SmsaY9cQF6KzXDHH98=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0802MB2438.eurprd08.prod.outlook.com (2603:10a6:4:a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.26; Tue, 18 Aug
 2020 09:25:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 09:25:33 +0000
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
Thread-Index: AQHWdQ1DgIquqcpHPEOT+qWxYeHAMqk9lfsAgAAC9AA=
Date: Tue, 18 Aug 2020 09:25:33 +0000
Message-ID: <139F007F-5C70-4AB3-B2BC-3A7D414A5C06@arm.com>
References: <20200818031112.7038-1-wei.chen@arm.com>
 <ef6a40d7-7def-3726-870c-f9bf22e2a388@arm.com>
In-Reply-To: <ef6a40d7-7def-3726-870c-f9bf22e2a388@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ea8b2bf9-d4ce-4509-d720-08d84358ad4f
x-ms-traffictypediagnostic: DB6PR0802MB2438:|VI1PR08MB2975:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB29758CAEDA86DCB5E90DF6369D5C0@VI1PR08MB2975.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: vXg1+IWOexyfYe9iENyJikkBYf5/1fxD4MsSBsOCiC5hKDf/radeHV75Lg4CLwxGCSczTV+HfE/3EJM9gXG9UfSA4AHg5XLgjXqNY7DRFnPALEviopGUPAcpRQCJIHMwpjMoamkmXgYTT4ceiYzUqgzK8TxB5OzfXCRA1Kc6Y/zm5JIp6bl4kJcfkKNRMUkh9VhrbFyotNAORuccrWAgD7x2rYhvn20zPwvM58A9jx0juldv+Qjx+LyZQgLjowcsmOGyNysNuRWCYMm1EdgjZ4tOIT+Wm3LSrzeHwhS6k2nN6MuqQ59K2givIHsGZQWYmLmJHipuUP/EkrkBtFGS2v3huZiy1SqFsfE6VmYszTMpBFFuwPkxUoUs8agKtJQZSH5DbZu67ACYPhb836ViVQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(966005)(91956017)(64756008)(4326008)(37006003)(26005)(6636002)(8936002)(66946007)(33656002)(316002)(71200400001)(5660300002)(66556008)(6862004)(83380400001)(186003)(2616005)(76116006)(66476007)(66446008)(36756003)(86362001)(54906003)(6506007)(2906002)(6486002)(53546011)(6512007)(478600001)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: FaovXTtjByqjPhNixw6HH9Ovuk5zPMpq+jKANqml/SO9d12zdEVbtZHbr0+ZB21bAT254r+al/sZvcoVl9Islh63Rh6+Ch549FSoZDdMRG/uxkTXi89vSB1HS0XNDZfKizp14bSfE9uT304wkFfTUijRtBM4dqwyJPbG+7ECaIzo+1mLNnHV3Xi0H32ugpTxWJo3pDWCVUVvz9b3cV/ZJ+EL2Cf7XvaY2gcVwHtAONQTYuK0apji4OTyf+dSDNb4w+23xa0YW9cDyHF6/lit4L+cCCneWFQcm09eSyx9Qd7LxsfJgSV/LFACMWsjTMxHEUsJ61TdGX3swFr0t8qV9AKaLyvFpNUZH80oW1kobaewtBMoSaWLKBrkmhCmyJLWpXJXhxip6h3J9cEXdz4wLjFDvCr9NYuIQRX1C6geGB39zb7xdoYOnhXYjOTjEaMyDMasd+URCgHhmKovhscIRdiv3JvuWeMaVW6AUFn+JvvYUBeQj95n4UofbfmgAN4+oHXxYrPWMd85Lzncgt0seHBiyPOnAtm9HqKi0B+CVxkPno74PCKKlu1C/mn+dmxG70jR2BVpHSasUnUFy46vK7kYPM3dWirioAqaB7/28b9GnVFU8qSwk8zloam7ZMoxPqq9/nmn8AK3Y8sV4INJZg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <34CE161A86C12E4294E39E9E269F3EE3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2438
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4085d35c-02ff-4e84-6147-08d84358a84c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OWW7k0Vch1ztQUa+4Qze3BwISS9XKE3K9yJl37ttp9zAr97YUAt39nuXKdOtgZK5GjZ6U1dYVjOn3Ewxf1QYbaJ9ja3IG9LwmmH+nzpdRQCM65wIO76mHmOVB0fMu860bYAhcDCpuGpNqqXPLSRU7xBPgjSDpjhaTM73SMawWw6Ji402mV8fmHI/ED8PxIQdRLcxeYJWfVfp+KenvIAZ5f8e22SePd5r765nvg3PYyVUgmw6LnM8HonJyKhO1IKTs8pviIi3oc6eY8RWRwj6tNLnsIVJsIkNqUDzIhNX/VZVATdphChgwh9fZ6vYalUGx0WljBP4VMnf48tQrE+uwqZtXuAfADJ9xHBLkSEHRqN9npEbhGpeQUu47SOY5jGAbUmhU8Ik0/VM9g+DHsNQfdougeVrgZHhtOgRWWN5FWu4kfYO8xCOdykTdSz6/XH45AVJyF/rcCf0xH5kL2Rf4y4qtS2dZ39Tsy6rfOM/Lrc=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966005)(54906003)(37006003)(6862004)(33656002)(6636002)(82310400002)(86362001)(2616005)(47076004)(316002)(36906005)(478600001)(4326008)(70206006)(966005)(8676002)(26005)(70586007)(83380400001)(5660300002)(53546011)(6486002)(6506007)(36756003)(336012)(81166007)(82740400003)(356005)(186003)(2906002)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 09:25:41.5709 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8b2bf9-d4ce-4509-d720-08d84358ad4f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2975
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

DQoNCj4gT24gMTggQXVnIDIwMjAsIGF0IDEwOjE0LCBBbmRyw6kgUHJ6eXdhcmEgPGFuZHJlLnBy
enl3YXJhQGFybS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTgvMDgvMjAyMCAwNDoxMSwgV2VpIENo
ZW4gd3JvdGU6DQo+IA0KPiBIaSBXZWksDQo+IA0KPj4gWGVuIGhhcyBjcHVfaGFzX2ZwL2NwdV9o
YXNfc2ltZCB0byBkZXRlY3Qgd2hldGhlciB0aGUgQ1BVIHN1cHBvcnRzDQo+PiBGUC9TSU1EIG9y
IG5vdC4gQnV0IGN1cnJlbnRseSwgdGhpcyB0d28gTUFDUk9zIG9ubHkgY29uc2lkZXIgdmFsdWUg
MA0KPj4gb2YgSURfQUE2NFBGUjBfRUwxLkZQL1NJTUQgYXMgRlAvU0lNRCBmZWF0dXJlcyBlbmFi
bGVkLiBCdXQgZm9yIENQVXMNCj4+IHRoYXQgc3VwcG9ydCBGUC9TSU1EIGFuZCBoYWxmLXByZWNp
c2lvbiBmbG9hdGluZy1wb2ludCBmZWF0dXJlcywgdGhlDQo+PiBJRF9BQTY0UEZSMF9FTDEuRlAv
U0lNRCBhcmUgMS4gRm9yIHRoZXNlIENQVXMsIHhlbiB3aWxsIHRyZWF0IHRoZW0gYXMNCj4+IG5v
IEZQL1NJTUQgc3VwcG9ydC4gSW4gdGhpcyBjYXNlLCB0aGUgdmZwX3NhdmUvcmVzdG9yZV9zdGF0
ZSB3aWxsIG5vdA0KPj4gdGFrZSBlZmZlY3QuDQo+PiANCj4+IFVuZm9ydHVuYXRlbHksIENvcnRl
eC1OMS9BNzYvQTc1IGFyZSB0aGUgQ1BVcyBzdXBwb3J0IEZQL1NJTUQgYW5kDQo+PiBoYWxmLXBy
ZWNpc2lvbiBmbG9hdGlpbmctcG9pbnQuIFRoZWlyIElEX0FBNjRQRlIwX0VMMS5GUC9TTUlEIGFy
ZSAxDQo+PiAoc2VlIEFybSBBUk0gRERJMDQ4N0YuYiwgRDEzLjIuNjQpLiBJbiB0aGlzIGNhc2Us
IG9uIE4xL0E3Ni9BNzUNCj4+IHBsYXRmb3JtcywgWGVuIHdpbGwgYWx3YXlzIG1pc3MgdGhlIGZs
b2F0IHBvaW50ZXIgcmVnaXN0ZXJzIHNhdmUvcmVzdG9yZS4NCj4+IElmIGRpZmZlcmVudCB2Q1BV
cyBhcmUgcnVubmluZyBvbiB0aGUgc2FtZSBwQ1BVLCB0aGUgZmxvYXQgcG9pbnRlcg0KPj4gcmVn
aXN0ZXJzIHdpbGwgYmUgY29ycnVwdGVkIHJhbmRvbWx5Lg0KPiANCj4gVGhhdCdzIGEgZ29vZCBj
YXRjaCwgdGhhbmtzIGZvciB3b3JraW5nIHRoaXMgb3V0IQ0KPiANCj4gT25lIHRoaW5nIGJlbG93
Li4uDQo+IA0KPj4gVGhpcyBwYXRjaCBmaXhlcyBYZW4gb24gdGhlc2UgbmV3IGNvcmVzLg0KPj4g
DQo+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4+IC0tLQ0K
Pj4geGVuL2luY2x1ZGUvYXNtLWFybS9jcHVmZWF0dXJlLmggfCA0ICsrLS0NCj4+IDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZlYXR1cmUuaCBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vY3B1ZmVhdHVyZS5oDQo+PiBpbmRleCA2NzRiZWIwMzUzLi41ODgwODllNWFlIDEwMDY0NA0K
Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9jcHVmZWF0dXJlLmgNCj4+ICsrKyBiL3hlbi9p
bmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5oDQo+PiBAQCAtMTMsOCArMTMsOCBAQA0KPj4gI2Rl
ZmluZSBjcHVfaGFzX2VsMl82NCAgICAoYm9vdF9jcHVfZmVhdHVyZTY0KGVsMikgPj0gMSkNCj4+
ICNkZWZpbmUgY3B1X2hhc19lbDNfMzIgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChlbDMpID09IDIp
DQo+PiAjZGVmaW5lIGNwdV9oYXNfZWwzXzY0ICAgIChib290X2NwdV9mZWF0dXJlNjQoZWwzKSA+
PSAxKQ0KPj4gLSNkZWZpbmUgY3B1X2hhc19mcCAgICAgICAgKGJvb3RfY3B1X2ZlYXR1cmU2NChm
cCkgPT0gMCkNCj4+IC0jZGVmaW5lIGNwdV9oYXNfc2ltZCAgICAgIChib290X2NwdV9mZWF0dXJl
NjQoc2ltZCkgPT0gMCkNCj4+ICsjZGVmaW5lIGNwdV9oYXNfZnAgICAgICAgIChib290X2NwdV9m
ZWF0dXJlNjQoZnApIDw9IDEpDQo+PiArI2RlZmluZSBjcHVfaGFzX3NpbWQgICAgICAoYm9vdF9j
cHVfZmVhdHVyZTY0KHNpbWQpIDw9IDEpDQo+IA0KPiBCdXQgdGhpcyBpcyBvbmx5IGdvb2QgdW50
aWwgdGhlIG5leHQgZmVhdHVyZSBidW1wLiBJIHRoaW5rIHdlIHNob3VsZCBiZQ0KPiBtb3JlIGZ1
dHVyZS1wcm9vZiBoZXJlLiBUaGUgYXJjaGl0ZWN0dXJlIGRlc2NyaWJlcyB0aG9zZSB0d28gZmll
bGRzIGFzDQo+ICJzaWduZWQiWzFdLCBhbmQgZ3VhcmFudGVlcyB0aGF0ICJpZiB2YWx1ZSA+PSAw
IiBpcyBhIHZhbGlkIHRlc3QgZm9yIHRoZQ0KPiBmZWF0dXJlLiBXaGljaCBtZWFucyB3ZSBhcmUg
Z29vZCBhcyBsb25nIGFzIHRoZSBzaWduIGJpdCAoYml0IDMpIGlzDQo+IGNsZWFyLCB3aGljaCB0
cmFuc2xhdGVzIGludG86DQo+ICNkZWZpbmUgY3B1X2hhc19mcCAgICAgICAgKGJvb3RfY3B1X2Zl
YXR1cmU2NChmcCkgPCA4KQ0KPiBTYW1lIGZvciBzaW1kLg0KPiANCg0KV2UgY2Fubm90IHJlYWxs
eSBiZSBzdXJlIHRoYXQgYSBuZXcgdmVyc2lvbiBpbnRyb2R1Y2VkIHdpbGwgcmVxdWlyZSB0aGUN
CnNhbWUgY29udGV4dCBzYXZlL3Jlc3RvcmUgc28gaXQgbWlnaHQgZGFuZ2Vyb3VzIHRvIGNsYWlt
IHdlIHN1cHBvcnQNCnNvbWV0aGluZyB3ZSBoYXZlIG5vIGlkZWEgYWJvdXQuDQpJIGFncmVlIHRo
b3VnaCBhYm91dCB0aGUgYW5hbHlzaXMgb24gdGhlIGZhY3QgdGhhdCB2YWx1ZXMgdW5kZXIgOCBz
aG91bGQNCmJlIHZhbGlkIGJ1dCBvbmx5IDAgYW5kIDEgY3VycmVudGx5IGV4aXN0IFsxXSwgb3Ro
ZXIgdmFsdWVzIGFyZSByZXNlcnZlZC4NCg0KU28gSSB3b3VsZCB2b3RlIHRvIGtlZXAgdGhlIDEg
Zm9yIG5vdyB0aGVyZS4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQpbMV0gaHR0cHM6Ly9kZXZlbG9w
ZXIuYXJtLmNvbS9kb2NzL2RkaTA1OTUvaC9hYXJjaDY0LXN5c3RlbS1yZWdpc3RlcnMvaWRfYWE2
NHBmcjBfZWwxDQoNCg==

