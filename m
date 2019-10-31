Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DFDEB8F3
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 22:29:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQHwp-0007Qh-Qs; Thu, 31 Oct 2019 21:25:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=msrb=YY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iQHwn-0007Qc-WD
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 21:25:38 +0000
X-Inumbo-ID: f8c31ec9-fc24-11e9-9551-12813bfff9fa
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.42]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8c31ec9-fc24-11e9-9551-12813bfff9fa;
 Thu, 31 Oct 2019 21:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtijWd1TxBAcoE9iGkUpm6wBjxyTh9jt8dz1vRibbIw=;
 b=GTXsRJY+GjfnhVGA2xsvtpYF4cHHT3nRbFZ5A5dOgZgEx4rX82vNFBGf6aJp8lOYyk0jYuKYAzhCi6ZygdFmxZBwDmmA/njAKA/gSrdNiAPGyaP6dxS4M8ijKFpUyf91jCMWUfVdavPxWO7ahYPPTlsjqEeSk69oTwmm4DDvNwM=
Received: from AM6PR08CA0038.eurprd08.prod.outlook.com (2603:10a6:20b:c0::26)
 by AM6PR08MB3864.eurprd08.prod.outlook.com (2603:10a6:20b:8e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.23; Thu, 31 Oct
 2019 21:25:32 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by AM6PR08CA0038.outlook.office365.com
 (2603:10a6:20b:c0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.20 via Frontend
 Transport; Thu, 31 Oct 2019 21:25:32 +0000
Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=none
 action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Thu, 31 Oct 2019 21:25:32 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Thu, 31 Oct 2019 21:25:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 319ffbaebb980fd1
X-CR-MTA-TID: 64aa7808
Received: from 21fe550abebb.1 (cr-mta-lb-1.cr-mta-net [104.47.1.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D3158F08-4DD6-45C9-9AB7-AD43C9686E03.1; 
 Thu, 31 Oct 2019 21:25:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 21fe550abebb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Thu, 31 Oct 2019 21:25:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6BmvO6uY3YHFJF0W72z1YFUSIN91zCZzDAa+NNB6Rfu3z+HQOAoo0dTi8+LRxjv6vFNCMEYvcfnHR5E7Kq2BnJRDSNuBSDHFCx1+aUHSEwGmSy+6/1FD6kBoRWBGbhIRtHdVST6cKnMlDXAA/qBPBrD4QdScFF7vXHrlmD83AsjzXaBaxl8nbP7InOMRlzGQ1PEiLy5uPObEgh37kWoH8siKKPivsrwUx+8PMd9NIqyab6QhMJ0MggEVhaSWGbzzUhSppYfrsoX4EU79nx8X2rIhF6hvBigEdX1t619RpOTFSVtdGFzvkBWntCvkglMnujoVHYnX/e2goyB/bH1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtijWd1TxBAcoE9iGkUpm6wBjxyTh9jt8dz1vRibbIw=;
 b=BfjYwKo2z4sc2GK1Om4RCFAZc0322mOCTBpHgZSawvr7nbEcCFKF3lrLNRU+vvBmylECPdN/7JVYmdy3KQjuMCWPWbTb0D/LwEhLp8r8Gt5+xQ6CgW4UWh6ZwE/x+EuDVQHCCnBek4LzRjGEW7U/Jt9gb1bS2rzYcMnvEOaun7OEtOzfC4NBCu5zexf2uEJunyRUiOrKwq6r+MUEccyqFTbp+DwVBSUvJB3dOy+dnIg5BnwR7vRuJ4kJPGvPP6WvVH/KTR4y0nEOhq01KHfLETfNlJBhqJ0Lz56OQ3et0D26yrgPdSkEE12nRkRydCUdWP9OXGfHXM1iSiItlN6Xcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtijWd1TxBAcoE9iGkUpm6wBjxyTh9jt8dz1vRibbIw=;
 b=GTXsRJY+GjfnhVGA2xsvtpYF4cHHT3nRbFZ5A5dOgZgEx4rX82vNFBGf6aJp8lOYyk0jYuKYAzhCi6ZygdFmxZBwDmmA/njAKA/gSrdNiAPGyaP6dxS4M8ijKFpUyf91jCMWUfVdavPxWO7ahYPPTlsjqEeSk69oTwmm4DDvNwM=
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com (20.179.44.81) by
 DBBPR08MB4281.eurprd08.prod.outlook.com (20.179.41.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.25; Thu, 31 Oct 2019 21:25:24 +0000
Received: from DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9]) by DBBPR08MB4554.eurprd08.prod.outlook.com
 ([fe80::c053:72ca:326d:18c9%4]) with mapi id 15.20.2387.028; Thu, 31 Oct 2019
 21:25:23 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] xen/vcpu: Sanitise VCPUOP_initialise call
 hierachy
Thread-Index: AQHVkCF8KTaPg/jFk0KydVsCruQGrKd1QyQA
Date: Thu, 31 Oct 2019 21:25:23 +0000
Message-ID: <7bd1d625-d501-6ca7-f951-9f42066436bd@arm.com>
References: <20191031192804.19928-1-andrew.cooper3@citrix.com>
In-Reply-To: <20191031192804.19928-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0043.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::31) To DBBPR08MB4554.eurprd08.prod.outlook.com
 (2603:10a6:10:d1::17)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8fab83b7-d98e-4dc0-f5a8-08d75e48dc6f
X-MS-TrafficTypeDiagnostic: DBBPR08MB4281:|AM6PR08MB3864:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <AM6PR08MB3864FAD3C1E883A8B3C6C49180630@AM6PR08MB3864.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 02070414A1
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(199004)(189003)(99286004)(11346002)(76176011)(52116002)(44832011)(64756008)(186003)(26005)(66946007)(66476007)(66556008)(66446008)(305945005)(7736002)(446003)(476003)(36756003)(2616005)(31686004)(8676002)(81166006)(81156014)(486006)(5660300002)(31696002)(8936002)(86362001)(6436002)(6306002)(4326008)(6486002)(71190400001)(71200400001)(966005)(256004)(229853002)(66066001)(6512007)(54906003)(6246003)(478600001)(3846002)(6116002)(53546011)(386003)(102836004)(6506007)(2906002)(316002)(14454004)(110136005)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4281;
 H:DBBPR08MB4554.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: a43gnXdjziHDfXmiTf+WrsbvIXn0IL94K7IV2Gt7L84r46FlIWXEvaCl38CrVGMwxSO9tNc5MSc/XwijeoTi6VONZPj23zue8DAwhU9nVHotSvh5Hx+jdshvjZRH1ioXTiTUzzV47KAPyIBSYOLSU5/Yw/DZdhUEKq82pabQgOYc8bIZrPrmSTsD7VUh5drtFg9VJy+dvwZTj/FRu2CMeLfzMLJvaYmKH9vofpCBjZGaPiHQHrLDxjk2/z2wHGVodv3MD6qeOZO4eVF2ymYDTbDmixhihYuT+CxmdE24G65LliXrVhsY+LguUWf1IzE+FJTeFoZMkFf4jFHWbmdSNEG0moOJb9tS+fiCgMGvoCPYSakoUyYAi16PXOkSoCHos3XQry87Wz6KPsjNYtCgWYXMqTIU7w4Oi37zyJhV3Tz+N3IffOFXWMciI105yAXVumzJyXuycm+mdgffKq8qM52j1srtJoAiHQzMKKcVHTE=
x-ms-exchange-transport-forked: True
Content-ID: <8A6FB4EF7B4FA3429CD4DB4C1C133125@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4281
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(1110001)(339900001)(189003)(199004)(316002)(478600001)(5660300002)(76130400001)(70206006)(70586007)(23676004)(2486003)(76176011)(26826003)(66066001)(6512007)(6306002)(6486002)(99286004)(8936002)(14454004)(229853002)(36756003)(25786009)(36906005)(50466002)(4326008)(966005)(54906003)(110136005)(47776003)(6116002)(81166006)(31696002)(105606002)(22756006)(486006)(11346002)(7736002)(3846002)(86362001)(107886003)(6246003)(386003)(6506007)(53546011)(102836004)(26005)(186003)(31686004)(8676002)(2906002)(81156014)(126002)(476003)(336012)(2616005)(436003)(446003)(305945005)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3864;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 41426532-b464-4b2e-19ef-08d75e48d732
NoDisclaimer: True
X-Forefront-PRVS: 02070414A1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BrNs8lRq/UnvjQ53uSclgqMWKcnyulJCLLFuMVXv0SUj64/I6ShW2JxQ92rpjaOUp2pS9nB/Qg2HHdvlC/5bh1cqwEgLbGu/mkn/JriUPubNpmrqKuql8JfZzGnJzmpLiUP92EjWAFEM5KM4VX2nT33CflB694vx3UMRqTp8tnMlrFwRfPN4n/IV02JKI+gQpOFMu322Fd5fkRz/0U7NYGBbXSpGKiP0LpQLNO7qPm6swk47t0Bjqs/dmobaXCa9Cv+Ccs49TT739HLSMiYsXwI3w/Y65cwHGkxHrTxC/P1jCBHjaM/kIpdcYMBVCaUb+xb1AssJLZYuc/oAsr5CXYoSKk4eMvDBUKE5CpkOCqFxztiqHyt25fGEPi+MaSjLajjcobaKQhiMD+DMB7NDtSu9YcGhRVTRc5ftwWx5qYPEBxxhtEww/jkDp10ph4QOTV98q8RTV3X2P0OtroHQj4oOtWpDj08UJLKViCR/a2o=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2019 21:25:32.4665 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fab83b7-d98e-4dc0-f5a8-08d75e48dc6f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3864
Subject: Re: [Xen-devel] [PATCH] xen/vcpu: Sanitise VCPUOP_initialise call
 hierachy
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDMxLzEwLzIwMTkgMTk6MjgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IFRoaXMg
Y29kZSBpcyBlc3BlY2lhbGx5IHRhbmdsZWQuICBWQ1BVT1BfaW5pdGlhbGlzZSBjYWxscyBpbnRv
DQo+IGFyY2hfaW5pdGlhbGlzZV92Y3B1KCkgd2hpY2ggY2FsbHMgYmFjayBpbnRvIGRlZmF1bHRf
aW5pdGlhbGlzZV92Y3B1KCkgd2hpY2gNCj4gaXMgY29tbW9uIGNvZGUuDQo+IA0KPiBUaGlzIHBh
dGggaXMgYWN0dWFsbHkgZGVhZCBjb2RlIG9uIEFSTSwgYmVjYXVzZSBWQ1BVT1BfaW5pdGlhbGlz
ZSBpcyBmaWx0ZXJlZA0KPiBvdXQgYnkgZG9fYXJtX3ZjcHVfb3AoKS4NCj4gDQo+IFRoZSBvbmx5
IHZhbGlkIHdheSB0byBzdGFydCBhIHNlY29uZGFyeSBDUFUgb24gQVJNIGlzIHZpYSB0aGUgUFND
SSBpbnRlcmZhY2UuDQo+IFRoZSBzYW1lIGNvdWxkIGluIHByaW5jaXBsZSBiZSBzYWlkIGFib3V0
IElOSVQtU0lQSS1TSVBJIGZvciB4ODYgSFZNLCBpZiBIVk0NCj4gZ3Vlc3RzIGhhZG4ndCBhbHJl
YWR5IGludGVyaXRlZCBhIHBhcmF2aXJ0IHdheSBvZiBzdGFydGluZyBDUFVzLg0KPiANCj4gRWl0
aGVyIHdheSwgaXQgaXMgcXVpdGUgbGlrZWx5IHRoYXQgbm8gZnV0dXJlIGFyY2hpdGVjdHVyZXMg
aW1wbGVtZW50ZWQgaW4gWGVuDQo+IGFyZSBnb2luZyB0byB3YW50IHRvIHVzZSBhIFBWIGludGVy
ZmFjZSwgYXMgc29tZSBzdGFuZGFyZGlzZWQgKHYpQ1BVIGJyaW5ndXANCj4gbWVjaGFuaXNtIHdp
bGwgYWxyZWFkeSBleGlzdC4NCg0KSSBhbSBub3Qgc3VyZSBJIGFncmVlIGhlcmUuIExvb2tpbmcg
YXQgTGludXggUklTQ3YgY29kZSAoc2VlIFsxXSBhbmQgDQpbMl0pLCBpdCBsb29rcyBsaWtlIHRo
ZSBrZXJuZWwgaGFzIHRvIGRlYWwgd2l0aCBzZWxlY3Rpbmcgb25lICJsdWNreSIgDQpDUFUvaGFy
dCB0byBkZWFsIHdpdGggdGhlIGJvb3QgYW5kIHBhcmsgYWxsIHRoZSBvdGhlcnMuDQoNClNvIGl0
IGxvb2tzIGxpa2UgdG8gbWUgdGhlcmUgYXJlIG5vdGhpbmcgYXQgdGhlIG1vbWVudCBvbiBSSVND
diB0byBkbyANCih2KUNQVSBicmluZy11cC4gV2UgbWlnaHQgYmUgYWJsZSB0byB1c2UgUFNDSSAo
YWx0aG91Z2ggdGhpcyBpcyBhbiBBUk0gDQpzcGVjaWZpYyB3YXkpLCBidXQgd291bGQgcmF0aGVy
IHdhaXQgYW5kIHNlZSB3aGF0IFJJU0N2IGZvbGtzIGNvbWUgdXAgDQp3aXRoIGJlZm9yZSBkZWNp
ZGluZyBQViBpcyBuZXZlciBnb2luZyB0byBiZSB1c2VkLg0KDQpDaGVlcnMsDQoNClsxXSANCmh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjQtcmM1L3NvdXJjZS9hcmNoL3Jpc2N2
L2tlcm5lbC9oZWFkLlMNClsyXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1
LjQtcmM1L3NvdXJjZS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMNCg0KLS0gDQpKdWxpZW4g
R3JhbGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
