Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63E91DE5B2
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 13:40:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc62E-0002jL-T9; Fri, 22 May 2020 11:40:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aod8=7E=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jc62C-0002jG-Ru
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 11:40:17 +0000
X-Inumbo-ID: 00c7dbbc-9c21-11ea-abb5-12813bfff9fa
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.61]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00c7dbbc-9c21-11ea-abb5-12813bfff9fa;
 Fri, 22 May 2020 11:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6AVmq4i3qqZSAG4+PoTdBB32oBNrQBYxRDH4Lj/iFE=;
 b=lxSlXWwu6cWLXfogweBGlmg4XfMEyn3PtmcwHEDUcZ4YZcgXPPt2sjflYpPqHRxImuE0SkQRgtkp4BMsx/Zmd/xvGxHZeMpqs4dgBtt3wjZJDJWcH5mayE+iKNuvz8D837exctCe6Bl61DiANrqVswi03k8Rlzsrr8XgDpIfohw=
Received: from DB6PR0301CA0047.eurprd03.prod.outlook.com (2603:10a6:4:54::15)
 by VI1PR08MB2768.eurprd08.prod.outlook.com (2603:10a6:802:19::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Fri, 22 May
 2020 11:40:13 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::7b) by DB6PR0301CA0047.outlook.office365.com
 (2603:10a6:4:54::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend
 Transport; Fri, 22 May 2020 11:40:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 11:40:13 +0000
Received: ("Tessian outbound 952576a3272a:v57");
 Fri, 22 May 2020 11:40:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 925a175fa93b1dcf
X-CR-MTA-TID: 64aa7808
Received: from f96988efb91d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D8C981BB-DB24-427B-A764-EB8EAABD3FC6.1; 
 Fri, 22 May 2020 11:40:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f96988efb91d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 May 2020 11:40:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knmBnsOgeEMK7JUoF8+6iPXcLAgMzGD7Mx8UzKVSlTdgpU85p/kLVuut9m+7esQNTN1siQ+CjrmcEH/VwkPn5D1V+nPl5npBq9kEiPL0sneAOE/m8Q+MdnLAA1ia3tIz3rUvgPBmFV9e5QWwOA8tBTnHedLvnvIkFlaWfu+kOn0h/AJ2nn7KYKRb1/eRXeuqa6HuYSNoYQ7nSMcj5AClprM66zJQ9OW4brtNxPGWRFr60ueb8LMFTuKvu8WKIeq0O5iZyxvSuLnRBjZFv7MIpKg9ztmcPeJjho29kiwO4d/uh3AdsKq0Oj+JD/o82en5wCafWav+zmOenhKFqug9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6AVmq4i3qqZSAG4+PoTdBB32oBNrQBYxRDH4Lj/iFE=;
 b=gySMzVmvCtX681uLFTFr4Q7QXyH7P0JjDxf6Z8tdPoOpIXIRpCTtPWFlWNkz4/czLNrCecVBwoiw5P1SQnRzIEGVzaXTiMEmjNATbuyusfzaIDicuEQNSsmuzpkbL9y1jfwFa9/Nw1DDbQg90OFzYLbhO3CnWX4HXvIONoBuoBJHQKbbB4m3yzHFHZTe3yLNVaRjq6e4htOQFT9Fp51O3UM3+d3ba/sV9/IqjAyNdNFjtSGr397c+xCG+aFJl1+ZY/LhLVyZUPVwdH92yzN3UtHRleanZp5Q4Bo8+QxydT/TP0UhEoSMLL9ldJGrYLH2co/ihMizaDSXpUxjuzuztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6AVmq4i3qqZSAG4+PoTdBB32oBNrQBYxRDH4Lj/iFE=;
 b=lxSlXWwu6cWLXfogweBGlmg4XfMEyn3PtmcwHEDUcZ4YZcgXPPt2sjflYpPqHRxImuE0SkQRgtkp4BMsx/Zmd/xvGxHZeMpqs4dgBtt3wjZJDJWcH5mayE+iKNuvz8D837exctCe6Bl61DiANrqVswi03k8Rlzsrr8XgDpIfohw=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3915.eurprd08.prod.outlook.com (2603:10a6:10:34::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 11:40:06 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 11:40:06 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/3] configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS
Thread-Topic: [PATCH 2/3] configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS
Thread-Index: AQHWIr9BT1TmXNUg30iaUVp4td7OCaiz5AWAgAAG4ICAACVhAIAABbUA
Date: Fri, 22 May 2020 11:40:06 +0000
Message-ID: <26610F4A-34B2-4B61-BEB2-ED2D16283B81@arm.com>
References: <20200505092454.9161-1-roger.pau@citrix.com>
 <20200505092454.9161-3-roger.pau@citrix.com>
 <C053A44F-FFDE-4C07-B1FD-76FA8456ADCD@arm.com>
 <20200522090553.eegs4fcltfqjuhzo@debian>
 <20200522111940.GB54375@Air-de-Roger>
In-Reply-To: <20200522111940.GB54375@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: efec5907-dfc9-4ff0-3d51-08d7fe44e424
x-ms-traffictypediagnostic: DB7PR08MB3915:|VI1PR08MB2768:
X-Microsoft-Antispam-PRVS: <VI1PR08MB27686E17A7B8113DB8540EDA9DB40@VI1PR08MB2768.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 4JrxUW+Lj2nQ+yyP6MUxyk8ZQYlbZupiLSP8hvzn70KQCb34Smq7Dy3LjX2gSsoRfkUhr7IZx4BoOIO5a41bWIgjSr5jmS3CFI8xUZX2JYIXrATtdRXfxpbVq6oUKyClBkPWS4jmJRfdt5vwvz2uasoFY/lmNO/hWGK7HaWn4EqY5Ol8Yyc4KbgvR3+tVLBvsDdJtUmuiO1/NxqQ0pQQG23rn8ggpT15ujKVkdHmEsEU6Sx3oCjmR9Cdrbj3tmdmt6v0EqeURfC+c6wQlCCCLY60bICVi1WsRl8ZjN2O8IUrtznGyQJEeZv18vRz2xhzXIx3ZeZdVXMrZ3jJlhbdgg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(66946007)(5660300002)(36756003)(316002)(71200400001)(4326008)(76116006)(66446008)(6916009)(8936002)(2906002)(54906003)(91956017)(6486002)(2616005)(478600001)(8676002)(66556008)(53546011)(6512007)(33656002)(6506007)(66476007)(64756008)(26005)(86362001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: MbM/2ArwDuB3bhKtFc9XpudSaGac7GY+w7VgCyW2M8A1Fvd3MnQtDBc2RVSaZwKaTxi/CwczWn9zWULY/vp+Fm3e5aUljHt9HUQ/zoq8EsVEBXXE4REiQmCUTlSeEr1pBrbOjNJmXdXlym1RbzgedBEjvdfxg4/XmA/HfIBkiBEe7BUVJqwCf389YripO7sXyjWQiQbg12RwR9WTT3fCTDsp73tTHuQH2wdxn52+y7Pqcmoi+XGRuzIz5nLngvwT4gQyQuz7XHO4BhjNA8BO9uPStqynl7zzvvUSKHx6Gn6w0MvCMU0h0s0E8AJsFsSKxUgSEOb84cHhOjNZ9/JQeCOIY2GW1xWmHWJ4dtuuB50mzwu0ueyYhQwEsOwrPxOxT8LFuC4BGIfZqTsSKzsdXznbZw/1IkEYHlkvkkQP4mV5+RkSr8xPG3v76ng83BbLuMDEEYev7rPkW9ZorMZlLaXlrWq1DfZ9CEBUtRG37DMsAI1dKVuIRYUFULe87FC8
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF5D092CB1AF6B4C935BC35A460887BD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3915
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(54906003)(316002)(86362001)(2616005)(8676002)(336012)(8936002)(33656002)(6486002)(6512007)(26005)(70586007)(47076004)(36756003)(81166007)(478600001)(356005)(70206006)(82740400003)(6862004)(82310400002)(5660300002)(53546011)(186003)(6506007)(2906002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4358f830-5592-4d97-40f4-08d7fe44dfed
X-Forefront-PRVS: 04111BAC64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2DLj1awousOyirQNNtNgiNJ5yCAXtLczGBsa5rfl8VNyCBg9fqnUtov5gwwTffT1ChucqR13K9MFGAYKnmhD661tGLp3HXXwLvQwDbFpV8lbGIiiIRnQG2w2qsCNkwfQ0AzR4Y7k0uAg7mOZej0AdRWW2faxm/xyOJFE+y+IdR81fRUFdqgiYSdmgI4zjlvRjfvJzjXDF6B4gNBUiNqsJWRNA21PugA9jo706eGErjmkSobvsEDeCR6dyvexPf/uQO3p94jxCN3VtwvEFwPOxslLD4MjN4pNvL6CLwQQekHDD0+9cgHR8MTVk0eeeqARZpC8t4dck0qYkQ0q6NRrlOObiAZhMS1VGWxzX0Jsinh1VV1kmd4bpPWSvjbN0v8H2LNHSaFedRwU/SmaIb97+pAhuYn0ANxOV0eFHfNtN6vPQFj0SL4hQaggJbqOliOYJBpx9zP7KkWprU2dkAtGjM9k9Hk6j3cHTo+lvf9m+n0CNyvS8SX/W1XLowpCrprv0djS3MXiAOBt+ovQblB9Pg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 11:40:13.4966 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efec5907-dfc9-4ff0-3d51-08d7fe44e424
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2768
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMjIgTWF5IDIwMjAsIGF0IDEyOjE5LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIE1heSAyMiwgMjAyMCBhdCAxMDow
NTo1M0FNICswMTAwLCBXZWkgTGl1IHdyb3RlOg0KPj4gT24gRnJpLCBNYXkgMjIsIDIwMjAgYXQg
MDg6NDE6MTdBTSArMDAwMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+PiBIaSwNCj4+PiAN
Cj4+PiBBcyBhIGNvbnNlcXVlbmNlIG9mIHRoaXMgZml4LCB0aGUgZm9sbG93aW5nIGhhcyBiZWVu
IGNvbW1pdHRlZCAoSSBndWVzcyBhcyBhIGNvbnNlcXVlbmNlIG9mIHJlZ2VuZXJhdGluZyB0aGUg
Y29uZmlndXJlIHNjcmlwdHMpOg0KPj4+IGRpZmYgLS1naXQgYS90b29scy9jb25maWd1cmUgYi90
b29scy9jb25maWd1cmUNCj4+PiBpbmRleCAzNzU0MzBkZjNmLi4zNjU5NjM4OWI4IDEwMDc1NQ0K
Pj4+IC0tLSBhL3Rvb2xzL2NvbmZpZ3VyZQ0KPj4+ICsrKyBiL3Rvb2xzL2NvbmZpZ3VyZQ0KPj4+
IEBAIC00Njc4LDYgKzQ2NzgsMTAgQEAgZm9yIGxkZmxhZyBpbiAkQVBQRU5EX0xJQg0KPj4+IGRv
DQo+Pj4gICAgIEFQUEVORF9MREZMQUdTPSIkQVBQRU5EX0xERkxBR1MgLUwkbGRmbGFnIg0KPj4+
IGRvbmUNCj4+PiAraWYgICEgLXogJEVYVFJBX1BSRUZJWCA7IHRoZW4NCj4+PiArICAgIENQUEZM
QUdTPSIkQ1BQRkxBR1MgLUkkRVhUUkFfUFJFRklYL2luY2x1ZGUiDQo+Pj4gKyAgICBMREZMQUdT
PSIkTERGTEFHUyAtTCRFWFRSQV9QUkVGSVgvbGliIg0KPj4+ICtmaQ0KPj4+IENQUEZMQUdTPSIk
UFJFUEVORF9DUFBGTEFHUyAkQ1BQRkxBR1MgJEFQUEVORF9DUFBGTEFHUyINCj4+PiBMREZMQUdT
PSIkUFJFUEVORF9MREZMQUdTICRMREZMQUdTICRBUFBFTkRfTERGTEFHU+KAnQ0KPj4+IA0KPj4+
IFRoaXMgc2hvdWxkIGJlOg0KPj4+IGlmICBbICEgLXogJEVYVFJBX1BSRUZJWCBdOyB0aGVuDQo+
Pj4gDQo+Pj4gQXMgb24gb3RoZXIgY29uZmlndXJlIHNjcmlwdHMuDQo+Pj4gDQo+Pj4gRHVyaW5n
IGNvbmZpZ3VyZSBJIGhhdmUgbm90IHRoZSBmb2xsb3dpbmcgZXJyb3I6DQo+Pj4gLi9jb25maWd1
cmU6IGxpbmUgNDY4MTogLXo6IGNvbW1hbmQgbm90IGZvdW5kDQo+Pj4gDQo+Pj4gV2hpY2ggaXMg
aWdub3JlZCBidXQgaXMgYWRkaW5nIC1ML2xpYiBhbmQgLUkvaW5jbHVkZSB0byB0aGUgQ1BQRkxB
R1MgYW5kIExERkxBR1MNCj4+PiANCj4+PiBXaGF0IHNob3VsZCBiZSB0aGUgcHJvY2VkdXJlIHRv
IGFjdHVhbGx5IGZpeCB0aGF0IChhcyB0aGUgcHJvYmxlbSBpcyBjb21pbmcgZnJvbSB0aGUgY29u
ZmlndXJlIHNjcmlwdCByZWdlbmVyYXRpb24gSSBndWVzcykgPyANCj4+IA0KPj4gRG9lcyB0aGUg
Zm9sbG93aW5nIHBhdGNoIHdvcmsgZm9yIHlvdT8NCj4+IA0KPj4gZGlmZiAtLWdpdCBhL200L3Nl
dF9jZmxhZ3NfbGRmbGFncy5tNCBiL200L3NldF9jZmxhZ3NfbGRmbGFncy5tNA0KPj4gaW5kZXgg
MDhmNWM5ODNjYzYzLi5jZDM0YzEzOWJjOTQgMTAwNjQ0DQo+PiAtLS0gYS9tNC9zZXRfY2ZsYWdz
X2xkZmxhZ3MubTQNCj4+ICsrKyBiL200L3NldF9jZmxhZ3NfbGRmbGFncy5tNA0KPj4gQEAgLTE1
LDcgKzE1LDcgQEAgZm9yIGxkZmxhZyBpbiAkQVBQRU5EX0xJQg0KPj4gZG8NCj4+ICAgICBBUFBF
TkRfTERGTEFHUz0iJEFQUEVORF9MREZMQUdTIC1MJGxkZmxhZyINCj4+IGRvbmUNCj4+IC1pZiBb
ICEgLXogJEVYVFJBX1BSRUZJWCBdOyB0aGVuDQo+PiAraWYgdGVzdCAhIC16ICRFWFRSQV9QUkVG
SVggOyB0aGVuDQo+PiAgICAgQ1BQRkxBR1M9IiRDUFBGTEFHUyAtSSRFWFRSQV9QUkVGSVgvaW5j
bHVkZSINCj4+ICAgICBMREZMQUdTPSIkTERGTEFHUyAtTCRFWFRSQV9QUkVGSVgvbGliIg0KPj4g
ZmkNCj4gDQo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4NClJldmlld2VkLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFy
bS5jb20+DQoNCj4gDQo+IE15IGJhZCwgSSBhc3N1bWUgW10gaXMgZXhwYW5kZWQgYnkgbTQsIGFz
IHRoYXQgc2VlbXMgdG8gYmUgcGFydCBvZiB0aGUNCj4gbGFuZ3VhZ2U/DQo+IA0KPiBUaGFua3Ms
IFJvZ2VyLg0KDQo=

