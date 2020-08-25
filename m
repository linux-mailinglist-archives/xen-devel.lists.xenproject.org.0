Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C23082518CB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 14:45:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAYJt-0001uN-KY; Tue, 25 Aug 2020 12:44:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvT3=CD=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kAYJr-0001uI-Ub
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 12:44:55 +0000
X-Inumbo-ID: 2bbce17c-643c-4838-af8c-6f156365e53e
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.57]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bbce17c-643c-4838-af8c-6f156365e53e;
 Tue, 25 Aug 2020 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rl08GspzTLMXQ6+GkC2uVuvHjVf01lVB25zaWKRTpxw=;
 b=Z7G+t7HaqRkk7WIYOAJzg+xc8gb7vtwTAx0tcCQmMIf+bRogYN2TnZe9mRwf1gL0eb3QaULpQaD4m5qqpP/z/SYxEkMYlickS0FP4f4MoMj69JCSaUbJaa3/QAbfcgi0NA9Y2wG4/B/DbNMBw68lb6ZHntn354XQDrw5VQlpbr4=
Received: from AM6PR0202CA0062.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::39) by AM0PR08MB3731.eurprd08.prod.outlook.com
 (2603:10a6:208:fc::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 25 Aug
 2020 12:44:48 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::ab) by AM6PR0202CA0062.outlook.office365.com
 (2603:10a6:20b:3a::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Tue, 25 Aug 2020 12:44:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 12:44:47 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64");
 Tue, 25 Aug 2020 12:44:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 69142e1bea25b495
X-CR-MTA-TID: 64aa7808
Received: from 98b79313eec9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7EAD3363-4418-452B-A85A-2351F82B1F0C.1; 
 Tue, 25 Aug 2020 12:44:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 98b79313eec9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 12:44:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eug6N+/qM5mgbbOEY3XDMBpT82uuq+/HBxSwZ26IX4uwup9F8vzeb8AmeHJoCZYm6fwN0xcNJF2CXsXcNKRls1oZkd+YjodChzvojpoIpDd71bf2+N/m7e3qjDN/6wllEsZlDCvTcIDcLSg6nSgPA2K5fn6TSpUL4NoOqf1RMIMeevaPKiFKo/safoeQdmG1jmp3mrPJagJqJ0LC68S5OJZ6OQq1p3KBFMky8opvse5tEMtp/jQ1K58U/YopChDEXueZ8I1wRpUvo1eeTVpaPB/B8oDGhd7FcolSgs9/gRrRt0MGmfggHO33goLZc7Iz819gDZyihzOlNgEiuLNUyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rl08GspzTLMXQ6+GkC2uVuvHjVf01lVB25zaWKRTpxw=;
 b=Zl+/8dpk2OCPgVOMQJkclrDLGMV7myNmwnWe54oz27o/MDPKuHrBWt3OPmhVWA3yaALgibcjrOno4KFGIQaaJ7lIgOkdRga9QURtbptNE+0YqPxOxeOSjeZhnV9fUXuxcFNmQii7y0Oju5of5IYLWTfCjFCs4YtcWbaEb9pnc8KvF6XjFoHK6Y1+WKq+WtnWNJtd+MpIBSdFaUppD+rRulUolw25cD15w0iisLfOyf32qFwaI29Mpmdwr7geuBBZO/DmZa4sXbFKk4F88hQ+rVie5t+EM+1B44OaGHVabBSezAvT57bGC/s/r+YQusQUJZUaA87cJJ6mlqAAhXYbvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rl08GspzTLMXQ6+GkC2uVuvHjVf01lVB25zaWKRTpxw=;
 b=Z7G+t7HaqRkk7WIYOAJzg+xc8gb7vtwTAx0tcCQmMIf+bRogYN2TnZe9mRwf1gL0eb3QaULpQaD4m5qqpP/z/SYxEkMYlickS0FP4f4MoMj69JCSaUbJaa3/QAbfcgi0NA9Y2wG4/B/DbNMBw68lb6ZHntn354XQDrw5VQlpbr4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1798.eurprd08.prod.outlook.com (2603:10a6:4:3c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 12:44:40 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Tue, 25 Aug 2020
 12:44:40 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, nd <nd@arm.com>
Subject: Re: Kconfig vs tool chain capabilities
Thread-Topic: Kconfig vs tool chain capabilities
Thread-Index: AQHWeqm1rojPQ5A/KUSCBM6rLJEMwalIaPuAgAAF9YCAAAK5gIAAAUmAgAAFm4CAAAsfgIAAEPWAgAAH04CAAA2vAIAAAswAgAABqYCAABAugIAABNEAgAACE4A=
Date: Tue, 25 Aug 2020 12:44:40 +0000
Message-ID: <7FF0CA52-4921-425E-A442-56269924D64F@arm.com>
References: <6d5a2014-5184-04f0-62f9-60ddd7537886@suse.com>
 <fb43a537-7b0d-0622-6e52-39e1a9e87b91@suse.com>
 <4449ee1b-6d2c-70f2-d8e9-80397aeffa41@suse.com>
 <f37d135a-d66a-450c-0b97-98c86de6f489@suse.com>
 <b783915a-9d64-4c68-7b71-f3b042b1201e@suse.com>
 <61d2adc1-c28f-7ed6-237e-45444249173c@suse.com>
 <cf7e8e5f-de4b-3046-8ffc-7ae4502d06c9@suse.com>
 <d4326ef6-d1bc-abd0-b428-00eabb04f761@suse.com>
 <B6E80F54-20D1-4ABF-AA19-8B3D0566DA7B@arm.com>
 <7075bb73-4682-4d17-97ab-3b04e245795a@suse.com>
 <4B1178DC-47E6-46E8-A791-2E12F8CA5F5B@arm.com>
 <d555e945-1ac7-e43e-d2af-6177b7308cff@suse.com>
 <47834168-3648-4EC6-99AA-C97E6272A253@arm.com>
 <d7310b31-c1ab-327a-7c1f-28262d9c7615@suse.com>
In-Reply-To: <d7310b31-c1ab-327a-7c1f-28262d9c7615@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5d552a82-b9d6-40fa-d856-08d848f4a6ab
x-ms-traffictypediagnostic: DB6PR0801MB1798:|AM0PR08MB3731:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3731B22AA477D6823814C9939D570@AM0PR08MB3731.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 9Y4qi0wDYLQnFNK/0B/bN3vCmCTuY+FWeFZvKmdXHF0VWzeMNXYcFeiODu+Y+cqaSGzQRIsnFYY1sW28Z1feBzonPJbyOzmZ2rOXMO92hDhG3/Tru7BSolr2t85jH1mzJSep1+CnZu1SLqzA1uaSVcDY1iUhEPBW/KcmIDV3ah4iagEKsYZguyWYbWLunOew9Xtc03ILfICbP/kfBdXyyX+/mtCZMNN6LZdiA3Om/nyuf1GXEitNo/HCG6eQfP8kybGKbrFT10w2GP+W0000j9nh/noyYjLaUzFY9gBI20LgMdx7vBKsMRuo4tEBCGA4SvjvIa5p+b27J08xz765F7IZ8n+BypSCPwu6mMm11tf204zkmOn/8JTlYnKpaj9w
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(66476007)(316002)(66574015)(8676002)(64756008)(66556008)(8936002)(6506007)(54906003)(6486002)(53546011)(4326008)(66446008)(26005)(33656002)(5660300002)(71200400001)(76116006)(186003)(2906002)(36756003)(91956017)(478600001)(66946007)(2616005)(6916009)(86362001)(83380400001)(6512007)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ICcKqo1gpxDJ+BJg8U3S3ivDKwDLhjBoN2lDnnTpi77zbKbIeE2Bjw7wlQvlvaW0AA/fpXwwC33SMlw6gPa/eYwEJwpwmQtbm1zRVoDG8BogW8klqHcnSbwILDGELlZLfoczIwPW9QqDCRx8cCPeaz9JwJJe/43FhYI4YmGCb7JRtJitCqGpMf/3yw5c0C6B3049XFgUd3Mt3L7ENVYPOzzeuxLc6zqgcha4bTFyvE0LALuuN7G2Ra+6OHSEVzg436JvnQ+6UjkX3piNKe5INIowvCrZiTlbHJKxat2FzvTXXlCZ/H1fZeKDcHGouqnKkiJXqthgMIz1+MnFCt7EMx9oPIjvvDtNgJs0mHOCEkoC6h+3XaLWGRyg+FKux2soS4zmYJnsaA6Ag27a8yGeHb4ow7ZaPuI8ptxU36N17oa/p9/w9GUV4rJzaqWTn3aqZn3g8Zfg6mk2pUgtzrMVnoC/Ul5Bu54xI0TqVV03SvabV05uEjSUmLvfece7UeXDaGbAvmZ68NbnBvGcHWFjHxAsye/xocj8bsQVsSUlCgy/D74Uim5bKKvgUwwBnrribkoavM73bkQPpFxXGDQnAl3FNvrnqkR74nZlTvjkO5JM9EEajsnIeQe6F4a5yQCleA1zocphGIdZlwqg5vvdUA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <40281D8E96A224499312905FEFFE09D0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1798
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0de750a9-f91b-431c-47c8-08d848f4a254
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h8v99ZOR7xCwZ/pCCjG/IVadtSo8jiRYhC6edvNNbi3S+K+Oqw3EAn+dLuod0iqoZb4rHP2cYwuAb+Spo+OjeJOHSuiY5iHCcEOZOP7rkZZF2ttp0aIwTAS0WoaGJerZy2bvai6hGv0YxWhUEgfM09o4Isr+nXIHTFnXxnuchpst11h5Pod+iYjT3Jlw46KkvYTTmp9j9MFCMKfuBR2OvoTzN0rzTIcFIcVukOz5UJGeEGW8UvdkRPs7Bii+hRS14x/cEocIp98vk5CcvfFrH4m2jZpya0SVdeWW2lpYVJYq/25ORO7si4VylD7WUrDhytYOcUR+Iwf5hoe6yijtPPIp5N0x+EtnxWXMGNrzQQKuizC9V66jFOC2gLzMzHlGKoCdc+tj+xKXAT7W4EOZCcFLwfqZiFJBlzAuehsNuPc=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966005)(2616005)(4326008)(336012)(356005)(6506007)(6512007)(82310400002)(66574015)(8936002)(5660300002)(53546011)(83380400001)(186003)(36756003)(33656002)(6486002)(478600001)(81166007)(2906002)(316002)(26005)(86362001)(82740400003)(8676002)(6862004)(54906003)(47076004)(70206006)(70586007)(36906005)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:44:47.7725 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d552a82-b9d6-40fa-d856-08d848f4a6ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3731
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

DQoNCj4gT24gMjUgQXVnIDIwMjAsIGF0IDEzOjM3LCBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjUuMDguMjAgMTQ6MjAsIEJlcnRyYW5kIE1hcnF1aXMg
d3JvdGU6DQo+Pj4gT24gMjUgQXVnIDIwMjAsIGF0IDEyOjIyLCBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDI1LjA4LjIwIDEzOjE2LCBCZXJ0cmFu
ZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4gT24gMjUgQXVnIDIwMjAsIGF0IDEyOjA2LCBKw7xyZ2Vu
IEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBPbiAyNS4wOC4y
MCAxMjoxNywgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+Pj4gT24gMjUgQXVnIDIwMjAs
IGF0IDEwOjQ5LCBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4+
PiANCj4+Pj4+Pj4gT24gMjUuMDguMjAgMTA6NDgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+
Pj4gT24gMjUuMDguMjAyMCAxMDowOCwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+Pj4+Pj4+PiBP
biAyNS4wOC4yMCAwOTo0OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+Pj4+IE9uIDI1LjA4
LjIwMjAgMDk6NDMsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4+Pj4+Pj4+PiBPbiAyNS4wOC4y
MCAwOTozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+Pj4+Pj4gT24gMjUuMDguMjAyMCAw
OToxMiwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+Pj4+Pj4+Pj4+Pj4gSSB0aGluayBib3RoIHBy
b2JsZW1zIGNhbiBiZSBzb2x2ZWQgYXQgdGhlIHNhbWUgdGltZSB2aWEgdGhlIGZvbGxvd2luZw0K
Pj4+Pj4+Pj4+Pj4+PiBhcHByb2FjaDoNCj4+Pj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+Pj4+IC0g
Y29sbGVjdCB0aGUgZGF0YSB3aGljaCBpcyByZWZsZWN0ZWQgaW4gdG9kYXkncyBDT05GSUdfIHZh
cmlhYmxlcyBpbiBhDQo+Pj4+Pj4+Pj4+Pj4+ICAgICAgc2luZ2xlIHNjcmlwdCBhbmQgc3RvcmUg
aXQgaW4gYSBmaWxlLCBlLmcgaW4gYSBmb3JtYXQgbGlrZToNCj4+Pj4+Pj4+Pj4+Pj4gDQo+Pj4+
Pj4+Pj4+Pj4+ICAgICAgQ0NfSVNfR0NDIHkNCj4+Pj4+Pj4+Pj4+Pj4gICAgICBHQ0NfVkVSU0lP
TiA3MDUwMA0KPj4+Pj4+Pj4+Pj4+PiAgICAgIENMQU5HX1ZFUlNJT04gMA0KPj4+Pj4+Pj4+Pj4+
PiAgICAgIENDX0hBU19WSVNJQklMSVRZX0FUVFJJQlVURSB5DQo+Pj4+Pj4+Pj4+Pj4+IA0KPj4+
Pj4+Pj4+Pj4+PiAtIGNoZWNrIHRoZSB0b29sIGRhdGEgYXQgZWFjaCBidWlsZCB0byBtYXRjaCB0
aGUgY29udGVudHMgb2YgdGhhdCBmaWxlDQo+Pj4+Pj4+Pj4+Pj4+ICAgICAgYW5kIGVpdGhlciBm
YWlsIHRoZSBidWlsZCBvciB1cGRhdGUgdGhlIGZpbGUgYW5kIHJlcnVuIGtjb25maWcgaWYgdGhl
eQ0KPj4+Pj4+Pj4+Pj4+PiAgICAgIGRvbid0IG1hdGNoIChJIHRoaW5rIGZhaWxpbmcgdGhlIGJ1
aWxkIGFuZCByZXF1aXJpbmcgdG8gcnVuIGENCj4+Pj4+Pj4+Pj4+Pj4gICAgICAibWFrZSBjb25m
aWciIHdvdWxkIGJlIHRoZSBiZXR0ZXIgYXBwcm9hY2gpDQo+Pj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+
Pj4+Pj4+PiAtIGZpbGwgdGhlIENPTkZJR18gdmFyaWFibGUgY29udGVudHMgZnJvbSB0aGF0IGZp
bGUgaW4ga2NvbmZpZyBpbnN0ZWFkDQo+Pj4+Pj4+Pj4+Pj4+ICAgICAgb2YgaXNzdWluZyB0aGUg
c2luZ2xlIHNoZWxsIGNvbW1hbmRzDQo+Pj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+Pj4gV2hpbGUg
SSBhZ3JlZSB0aGlzIGlzIGEgcG9zc2libGUgbW9kZWwgdG8gdXNlIChidXQgc3RpbGwgbm90IHRo
ZQ0KPj4+Pj4+Pj4+Pj4+IG9uZSB3ZSd2ZSBpbmhlcml0ZWQgZnJvbSBMaW51eCksIEkgZmFpbCB0
byBzZWUgaG93IHRoaXMgYWRkcmVzc2VzDQo+Pj4+Pj4+Pj4+Pj4gbXkgImRldmVsb3BlcnMgc2hv
dWxkIGJlIGF3YXJlIG9mIHdoYXQgdGhleSBkbyAobm90KSBidWlsZCBhbmQNCj4+Pj4+Pj4+Pj4+
PiB0ZXN0IiBjb25jZXJuOiBUaGVyZSdkIHN0aWxsIGJlIGRlcGVuZGVuY2llcyBvZiBLY29uZmln
IG9wdGlvbnMNCj4+Pj4+Pj4+Pj4+PiBvbiB0aGUgdG9vbCBjaGFpbiBjYXBhYmlsaXRpZXMsIGFu
ZCB0aGVpciBwcm9tcHRzIHRoZXJlZm9yZSB3b3VsZA0KPj4+Pj4+Pj4+Pj4+IHN0aWxsIGJlIGlu
dmlzaWJsZSB3aXRob3V0IHRoZSB0b29sIGNoYWluIGhhdmluZyB0aGUgbmVlZGVkDQo+Pj4+Pj4+
Pj4+Pj4gY2FwYWJpbGl0aWVzLiBJT1cgSSBvbmx5IHNlZSB0aGlzIHRvIGFkZHJlc3MgMiksIGJ1
dCBub3QgMSkuDQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+IFNvcnJ5LCBJIGZhaWwgdG8gc2Vl
IGEgcHJvYmxlbSBoZXJlLg0KPj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+PiBXaGF0IHNlbnNlIGRv
ZXMgaXQgbWFrZSB0byBiZSBhYmxlIHRvIGNvbmZpZ3VyZSBhbiBvcHRpb24gd2hpY2ggdGhlDQo+
Pj4+Pj4+Pj4+PiB0b29scyBkb24ndCBzdXBwb3J0Pw0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4g
VGFrZSBDRVQgYXMgYW4gZXhhbXBsZSAoY2hvc2VuIGJlY2F1c2UgdGhhdCdzIHRoZSBvbmUgd2hp
Y2gNCj4+Pj4+Pj4+Pj4gYWxyZWFkeSB1c2VzIHRoZSBLY29uZmlnIGFwcHJvYWNoLCBkZXNwaXRl
IG15IGRpc2FncmVlbWVudCk6IEl0J3MNCj4+Pj4+Pj4+Pj4gcXVpdGUgcmVsZXZhbnQgdG8ga25v
dyB3aGV0aGVyIHlvdSdyZSB0ZXN0aW5nIFhlbiB3aXRoIGl0IGVuYWJsZWQsDQo+Pj4+Pj4+Pj4+
IG9yIHdpdGggaXQgZGlzYWJsZWQgKGFuZCBoZW5jZSB5b3UgcG90ZW50aWFsbHkgbWlzc2luZyBj
aGFuZ2VzIHlvdQ0KPj4+Pj4+Pj4+PiBuZWVkIHRvIG1ha2UgdG8gcmVsZXZhbnQgY29kZSBwb3J0
aW9ucykuDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gQ29ycmVjdCBtZSBpZiBJJ20gd3JvbmcsIGJ1
dCBhc3N1bWluZyBteSBzdWdnZXN0ZWQgY2hhbmdlcyBiZWluZyBtYWRlLA0KPj4+Pj4+Pj4+IHdv
dWxkbid0IGEgLmNvbmZpZyBmaWxlIHNldHVwIG9uY2Ugd2l0aCBDRVQgZW5hYmxlZCAoYW5kIEkg
YXNzdW1lIHlvdSdkDQo+Pj4+Pj4+Pj4gdHJ5IHRvIGVuYWJsZSBDRVQgb24gcHVycG9zZSB3aGVu
IHRyeWluZyB0byB0ZXN0IENFVCBhbmQgeW91J2QgcmVhbGl6ZQ0KPj4+Pj4+Pj4+IG5vdCBiZWlu
ZyBhYmxlIHRvIGRvIHNvIGluIGNhc2UgeW91ciB0b29scyBkb24ndCBzdXBwb3J0IENFVCkgZW5z
dXJlDQo+Pj4+Pj4+Pj4geW91J2QgbmV2ZXIgYmVlbiBoaXQgYnkgc3VycHJpc2Ugd2hlbiBzb21l
IHRvb2wgdXBkYXRlcyB3b3VsZCByZW1vdmUNCj4+Pj4+Pj4+PiBDRVQgc3VwcG9ydD8NCj4+Pj4+
Pj4+IFByb2JhYmx5LCBidXQgdGhhdCdzIG5vdCBteSBwb2ludC4gV2l0aCBhIENFVC1pbmNhcGFi
bGUgdG9vbCBjaGFpbg0KPj4+Pj4+Pj4geW91J3JlIG5vdCBwcm9tcHRlZCB3aGV0aGVyIHRvIGVu
YWJsZSBDRVQgaW4gdGhlIGZpcnN0IHBsYWNlLCB3aGVuDQo+Pj4+Pj4+PiBjcmVhdGluZyB0aGUg
aW5pdGlhbCAuY29uZmlnLiBJdCBpcyB0aGlzIHVuYXdhcmVuZXNzIG9mIGEgY3J1Y2lhbA0KPj4+
Pj4+Pj4gcGFydCBvZiBjb2RlIG5vdCBnZXR0aW5nIGJ1aWx0IGFuZCB0ZXN0ZWQgKGFuZCBsaWtl
bHkgdW5rbm93aW5nbHkpDQo+Pj4+Pj4+PiB0aGF0IEkgZGlzbGlrZS4gSW4gZmFjdCwgYWZ0ZXIg
QW5kcmV3J3MgcGF0Y2hlcyBoYWQgZ29uZSBpbiwgaXQNCj4+Pj4+Pj4+IGhhZCB0YWtlbiBtZSBh
IHdoaWxlIHRvIHJlYWxpemUgdGhhdCBpbiBjZXJ0YWluIG9mIG15IGJ1aWxkcyBJIGRvbid0DQo+
Pj4+Pj4+PiBoYXZlIENFVCBlbmFibGVkIChkZXNwaXRlIG1lIGhhdmluZyBkb25lIG5vdGhpbmcg
dG8gZGlzYWJsZSBpdCksIGFuZA0KPj4+Pj4+Pj4gaGVuY2UgdGhvc2UgYnVpbGRzIHdvcmtpbmcg
ZmluZSBhcmUgbWVhbmluZ2xlc3MgZm9yIGFueSBjaGFuZ2VzDQo+Pj4+Pj4+PiBhZmZlY3Rpbmcg
Q0VUIGNvZGUgaW4gYW55IHdheS4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFllcywgdGhpcyBpcyB0aGUg
cmVzdWx0IG9mIGxldHRpbmcgc29tZSBvcHRpb25zIGRlcGVuZCBvbiBvdGhlcnMuDQo+Pj4+Pj4+
IA0KPj4+Pj4+PiBUaGlzIGlzIHdoYXQgSSBtZWFudCByZWdhcmRpbmcgdGhlIGFyY2hpdGVjdHVy
ZTogdGhlcmUgYXJlIGUuZy4gbXVsdGlwbGUNCj4+Pj4+Pj4gc291cmNlIGZpbGVzIGluIGRyaXZl
cnMvY2hhci8gYmVpbmcgYnVpbHQgb25seSBmb3IgQVJNIG9yIFg4NiwgaW4gc3BpdGUNCj4+Pj4+
Pj4gb2YgYmVpbmcgbG9jYXRlZCBvdXRzaWRlIGFyY2gvLiBBbmQgeWV0IHlvdSBkb24ndCBzZWUg
dGhpcyBhcyBhIHByb2JsZW0sDQo+Pj4+Pj4+IGV2ZW4gaWYgeW91IGFyZSBub3QgYWJsZSB0byBz
ZWxlY3QgdGhvc2UgZHJpdmVycyB0byBiZSBidWlsdCB3aGVuIHVzaW5nDQo+Pj4+Pj4+ICJ0aGUg
b3RoZXIiIGFyY2guIFRoZXkgYXJlIHNpbGVudGx5IGRpc2FibGVkLiBKdXN0IGxpa2UgQ0VUIGlu
IGNhc2Ugb2YNCj4+Pj4+Pj4gYW4gaW5jYXBhYmxlIHRvb2wgY2hhaW4uDQo+Pj4+Pj4+IA0KPj4+
Pj4+PiBTbyBJTU8gZWl0aGVyIHdlIGJhbiAiZGVwZW5kcyBvbiIgZnJvbSBvdXIgS2NvbmZpZyBm
aWxlcyAobm8sIEkgZG9uJ3QNCj4+Pj4+Pj4gd2FudCB0byBkbyB0aGF0KSwgb3Igd2UgdXNlIGl0
IGFzIGRlc2lnbmVkIGFuZCBtYWtlIGl0IGFzIHVzZXIgZnJpZW5kbHkNCj4+Pj4+Pj4gYXMgcG9z
c2libGUuIEluIGNhc2Ugd2UgYXMgZGV2ZWxvcGVycyBoYXZlIGEgc3BlY2lhbCB0ZXN0IGNhc2Ug
dGhlbiB3ZQ0KPj4+Pj4+PiBuZWVkIHRvIGNoZWNrIHRoZSAuY29uZmlnIHdoZXRoZXIgdGhlIGRl
c2lyZWQgc2V0dGluZ3MgYXJlIHJlYWxseQ0KPj4+Pj4+PiBwcmVzZW50LiBIYXZpbmcgdGhvc2Ug
c2V0dGluZ3MgZGVwZW5kaW5nIG9uIHRvb2wgY2FwYWJpbGl0aWVzIGluIGENCj4+Pj4+Pj4gc3Bl
Y2lmaWMgZmlsZSB3aWxsIG1ha2UgdGhpcyBjaGVjayBtdWNoIGVhc2llci4NCj4+Pj4+Pj4gDQo+
Pj4+Pj4+IEFuZCBCVFcsIEkgY2FuJ3Qgc2VlIGhvdyBzZXR0aW5nIHRoZSB0b2xscycgY2FwYWJp
bGl0aWVzIGZyb20gZS5nLg0KPj4+Pj4+PiBhcmNoL3g4Ni9SdWxlcy5tayBpcyBiZXR0ZXIgaW4g
YW55IHdheSAoc2VlIGhvdyBDT05GSUdfSU5ESVJFQ1RfVEhVTksNCj4+Pj4+Pj4gZ290IGl0cyB2
YWx1ZSBpbiBvbGRlciBYZW4gdmVyc2lvbnMgbGlrZSA0LjEyKS4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+
IFdlIGNhbid0IGhhdmUgZXZlcnl0aGluZyBhbmQgSSBiZWxpZXZlIGF1dG9tYXRpY2FsbHkgZGlz
YWJsaW5nIGZlYXR1cmVzDQo+Pj4+Pj4+IHdoaWNoIGNhbid0IHdvcmsgd2l0aCB0aGUgY3VycmVu
dCB0b29scyBpcyBhIHNhbmUgZGVjaXNpb24uIERvaW5nIHRoaXMNCj4+Pj4+Pj4gdmlhIEtjb25m
aWcgaXMgdGhlIGJldHRlciBhcHByb2FjaCBjb21wYXJlZCB0byBNYWtlZmlsZSBzbmlwbGV0cyBJ
TU8uDQo+Pj4+Pj4gVGhhdCBzb3VuZHMgbGlrZSBhIG5pY2UgZmVhdHVyZSB0byBoYXZlIHNvbWUg
Y29tcGlsZXIgb3IgdG9vbHMgb3B0aW9ucyB0aGF0DQo+Pj4+Pj4gY2FuIGJlIHNlbGVjdGVkIG9y
IGFjdGl2YXRlZCBpbiBLY29uZmlnLiBUaGVyZSBhcmUgc29tZSBjb21waWxlciBvcHRpb25zDQo+
Pj4+Pj4gbWFuZGF0b3J5IHRvIGhhbmRsZSBzb21lIGVycmF0YXMgb3IgWFNBIHRoYXQgb25lIG1p
Z2h0IHdhbnQgdG8gZXhwbGljaXRlbHkNCj4+Pj4+PiBzZWxlY3QuDQo+Pj4+Pj4gSSBhbSBiaXQg
dW5zdXJlIGFib3V0IHRoZSBwYXJ0IHdoZXJlIHNvbWUga2NvbmZpZyBvcHRpb25zIHdvdWxkIG9u
bHkNCj4+Pj4+PiBiZSBhdmFpbGFibGUgb3Igbm90IGRlcGVuZGluZyBvbiBzb21lIHRlc3RzIHdp
dGggdGhlIGNvbXBpbGVyIGJlaW5nIGRvaW5nDQo+Pj4+Pj4gcHJpb3IgdG8gb3BlbmluZyB0aGUg
ZWRpdG9yLiBJIHdvdWxkIGd1ZXNzIHRoZSBtZW51Y29uZmlnIHByb2Nlc3Mgd291bGQNCj4+Pj4+
PiBoYXZlIHRvIGZpcnN0IHJ1biBzb21lIHRlc3RzIGFuZCB0aGVuIGdlbmVyYXRlZCBzb21lIEhB
U18gY29uZmlndXJhdGlvbg0KPj4+Pj4+IG9wdGlvbnMgZGVwZW5kaW5nIG9uIHRoZSByZXN1bHQg
b2YgdGhlIHRlc3RzLg0KPj4+Pj4+IERpZCBpIGdvdCB0aGUgaWRlYSByaWdodCBoZXJlID8NCj4+
Pj4+PiBJcyB0aGlzIHNvbWV0aGluZyBzb21lYm9keSB0cmllZCB0byBkbyA/DQo+Pj4+Pj4gQXMg
YSB1c2VyIEkgd291bGQgbW9yZSBleHBlY3QgdGhhdCB0aGUgYnVpbGQgcHJvY2VzcyB3b3VsZCB0
ZWxsIG1lIHRoYXQgbXkNCj4+Pj4+PiBjb25maWd1cmF0aW9uIGlzIGludmFsaWQgYmVjYXVzZSBp
IHNlbGVjdGVkIHNvbWV0aGluZyB0aGF0IGlzIG5vdCBzdXBwb3J0ZWQNCj4+Pj4+PiBieSBteSBj
b21waWxlci4gSSBtaWdodCBoYXZlIHRoZSBjaGFuY2UgdG8ganVzdCBmaXggbXkgYnVpbGQgdG8g
dXNlIHRoZSByaWdodA0KPj4+Pj4+IGNvbXBpbGVyIChsaWtlIGJ5IG1pc3Rha2UgdXNpbmcgeDg2
IHRvb2xjaGFpbiB0byBjb21waWxlIGZvciBhcm0pLg0KPj4+Pj4+IFdlIHNob3VsZCBhbHNvIGJl
IGNhcmVmdWwgbm90IHRvIHNpbGVudGx5IGlnbm9yZSBzb21lIGNvbmZpZ3VyYXRpb24gb3B0aW9u
IGlmDQo+Pj4+Pj4gb25lIGlzIGNoYW5naW5nIHRoZSBjb21waWxlciBhbmQgdGhlIG5ldyBvbmUg
ZG9lcyBub3Qgc3VwcG9ydCBhbiBvcHRpb24uDQo+Pj4+Pj4gQSB1c2VyIHdvdWxkIGhhdmUgaGlz
IGNvbmZpZ3VyYXRpb24gYW5kIGNvbXBpbGUgdXNpbmcgaXQgd2l0aG91dA0KPj4+Pj4+IHBhc3Np
bmcgdGhyb3VnaCB0aGUgZWRpdG9yIGludGVyZmFjZSBhbmQgbWlnaHQgbmVlZCB0byBiZSBhd2Fy
ZSB0aGF0IGEgcGFydA0KPj4+Pj4+IG9mIGhpcyBjb25maWd1cmF0aW9uIGlzIG5vdCB2YWxpZCBh
bnltb3JlIGJlY2F1c2UgdGhlIHRvb2xzIGhlIGlzIHVzaW5nIGNoYW5nZWQuDQo+Pj4+Pj4gVGhp
cyBpcyBzb21ldGhpbmcgdGhhdCBjb3VsZCBvY2N1ciBhIGxvdCB3aGVuIHVzaW5nIGEgZGlzdHJp
YnV0aW9uIHRvb2xjaGFpbi4NCj4+Pj4+PiBBbHNvIHRoZXJlIGFyZSBzb21lIGNvbXBpbGVyIG9w
dGlvbiBjaGFuZ2luZyBzbyBpIHdvdWxkIG1vcmUgdGhpbmsgdGhhdA0KPj4+Pj4+IHRoZXJlIHNo
b3VsZCBiZSBnZW5lcmljIGNvbmZpZ3VyYXRpb24gb3B0aW9ucyBzbyB0aGF0IGluIHRoZSBtYWtl
ZmlsZXMgd2UNCj4+Pj4+PiBjb3VsZCBoYXZlIHRoZSBvcHBvcnR1bml0eSB0byBhZGQgZGlmZmVy
ZW50IGNvbXBpbGVyIG9wdGlvbnMgZm9yIGRpZmZlcmVudA0KPj4+Pj4+IHRvb2xjaGFpbnMgZGVw
ZW5kaW5nIG9uIHRoZSB2ZXJzaW9uIG9yIHRoZSB0eXBlIG9mIHRoZSB0b29sY2hhaW4uDQo+Pj4+
Pj4gVG8gYmUgY2xlYXIgaSB3b3VsZCBzZWUgc29tZXRoaW5nIGxpa2U6DQo+Pj4+Pj4gaW4ga2Nv
bmZpZzoNCj4+Pj4+PiBDT01QSUxFUl9PUFRJT05fWFhYDQo+Pj4+Pj4gCWJvb2wg4oCcYWN0aXZh
dGUgWFhYIGNvbXBpbGVyIGZsYWcNCj4+Pj4+PiBpbiBNYWtlZmlsZToNCj4+Pj4+PiBpZmVxICgk
KENPTkZJR19DT01QSUxFUl9PUFRJT05fWFhYKSwgdHJ1ZSkNCj4+Pj4+PiB0ZXN0X2NvbXBpbGVy
X2N4eDoNCj4+Pj4+PiAJJChDQykgLXh4eCBkdW1teS5jIC1vIGR1bW15IHx8ICQoZXJyb3IgWW91
ciBjb21waWxlciBkb2VzIG5vdCBzdXBwb3J0IC14eHgpDQo+Pj4+Pj4gY2MtZmxhZ3MgKz0gLXh4
eA0KPj4+Pj4+IGVuZGlmDQo+Pj4+Pj4gVGhlIHN5bnRheCBpcyB3cm9uZyBoZXJlIGJ1dCB5b3Ug
Z2V0IHRoZSBpZGVhIDotKQ0KPj4+Pj4gDQo+Pj4+PiBBaCwgb2theSwgdGhpcyBpcyBhbm90aGVy
IGFwcHJvYWNoLCB3aGljaCBtaWdodCBiZSBldmVuIG1vcmUgZmxleGlibGUuDQo+Pj4+PiBJdCB3
b3VsZCBhbGxvdyB0byBjb250cm9sIGNvbXBpbGVyIGZsYWdzIGluc3RlYWQgb2YgbW9yZSBoaWdo
IGxldmVsDQo+Pj4+PiBmZWF0dXJlcy4NCj4+Pj4gV2UgbWlnaHQgaGF2ZSBib3RoLCB0aGlzIHdv
dWxkIGFsc28gYWxsb3cgdG8gaGF2ZSBtb3JlIGhpZ2ggbGV2ZWwgZmVhdHVyZXMgd2hpY2ggYXJl
DQo+Pj4+IGRvaW5nIGJvdGggYWRkaW5nIGNvbXBpbGVyIGZsYWdzIGFuZCBvdGhlciBzdHVmZiwN
Cj4+Pj4+IA0KPj4+Pj4gSW4gY2FzZSB3ZSB3YW50IHRvIGdvIHRoYXQgcm91dGUgd2Ugc2hvdWxk
IGRlZmF1bHQgQ09NUElMRVJfT1BUSU9OX1hYWA0KPj4+Pj4gdG8gdGhlIGN1cnJlbnQgdG9vbCBj
YXBhYmlsaXRpZXMgaW4gb3JkZXIgdG8gYXZvaWQgbG9uZ2VyIHRyeS1hbmQtZXJyb3INCj4+Pj4+
IGxvb3BzLg0KPj4+PiBJIGFtIG5vdCBxdWl0ZSBzdXJlIGhvdyB5b3Ugd2FudCB0byBhY2hpZXZl
IHRoaXMgY2xlYW5seS4NCj4+PiANCj4+PiBTb21ldGhpbmcgbGlrZSAocGlja2VkIGFuIGFjdHVh
bCBleGFtcGxlIGZyb20geDg2KToNCj4+PiANCj4+PiBjb25maWcgSEFTX0NPTVBJTEVSX09QVElP
Tl9JQlINCj4+PiAJYm9vbCAiU2VsZWN0IGNvbXBpbGVyIG9wdGlvbiAtbWluZGlyZWN0LWJyYW5j
aC1yZWdpc3RlciINCj4+PiAJZGVmYXVsdCAkKGNjLW9wdGlvbiwtbWluZGlyZWN0LWJyYW5jaC1y
ZWdpc3RlcikNCj4+PiAJICBibGFoIGJsYWggYmxhaA0KPj4+IA0KPj4gTmljZSA6LSkNCj4+IERl
ZmluaXRlbHkgaSB3b3VsZCBhZGQgYSDigJxkZWZhdWx0IHkgaWYgRVhQRVJU4oCdIG9yIHNvbWV0
aGluZyBlcXVpdmFsZW50Lg0KPiANCj4gVWgsIHJhdGhlciBub3QuIEkgYXMgYSBkZXZlbG9wZXIg
ZG9uJ3Qgd2FudCB0byBoYXZlIGNoYW5nZSB0aGUgY29uZmlnDQo+IG1hbnVhbGx5IGp1c3QgYmVj
YXVzZSBhIG5ldyBIQVNfQ09NUElMRVJfT1BUSU9OXyBoYXMgYmVlbiBhZGRlZCBteSB0b29scw0K
PiBkb24ndCB1bmRlcnN0YW5kICh5ZXQpLiBUaGUgZGVmYXVsdCBhY3Rpb24gc2hvdWxkIHJlcXVp
cmUgbm8gdXNlcg0KPiBpbnRlcnZlbnRpb24sIGV2ZW4gYXMgZXhwZXJ0Lg0KDQpJIGFncmVlIHdp
dGggdGhlIGFyZ3VtZW50Lg0KTWF5YmUgd2UgY291bGQgaGF2ZSBhbiBvdGhlciBvcHRpb24gbGlr
ZSBESVNBQkxFX0NPTVBJTEVSX0NIRUNLIGZvciB0aGlzLg0KDQpJIHdvdWxkIHJhdGhlciBoYXZl
IG15IHRlc3Qgc3lzdGVtIGZhaWwgd2l0aCBhIG1ha2UgZXJyb3IgYnkgc2V0dGluZyB0aGlzIHRo
ZW4gc2lsZW50bHkNCmRpc2NhcmQgdGhlIG9wdGlvbiBpZiBteSBjb21waWxlciBpcyBtb2RpZmll
ZC4NCg0KQmVydHJhbmQNCg0K

