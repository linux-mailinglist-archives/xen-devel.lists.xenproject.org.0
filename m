Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AA625186D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 14:20:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXvy-0008Kh-UN; Tue, 25 Aug 2020 12:20:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvT3=CD=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kAXvx-0008Kc-Dj
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 12:20:13 +0000
X-Inumbo-ID: 847a34a4-74d6-4e60-ba08-f58d6ec4de13
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.45]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 847a34a4-74d6-4e60-ba08-f58d6ec4de13;
 Tue, 25 Aug 2020 12:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPULe1krg7Ac9nEd1bywHxf7PAPpoIJ3Mzxy/UH7vKw=;
 b=SQ8/Zs6Wa5843wTl5VVdx6Xllalv4rM60fCun8QKXgeie33GkcaRzRn7+hPUFDfLZnWL0UgNFvNLaTn+J4atl0gGA6aj0F52rQXpjWiOrBN21QyUkDhJKvAqqZjyHlPjlCRIHDuoxSyuHcTrG9MOMvG2jGsUIKx3l9VkdUxL7ug=
Received: from AM6PR10CA0041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::18)
 by AM6PR08MB3669.eurprd08.prod.outlook.com (2603:10a6:20b:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 12:20:08 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::e6) by AM6PR10CA0041.outlook.office365.com
 (2603:10a6:209:80::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Tue, 25 Aug 2020 12:20:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 12:20:07 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Tue, 25 Aug 2020 12:20:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 77dee1b82ad772b1
X-CR-MTA-TID: 64aa7808
Received: from 7cc4e0b26bd5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 925DC2CC-DECA-4F8F-8F2D-113C197120B0.1; 
 Tue, 25 Aug 2020 12:20:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7cc4e0b26bd5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 12:20:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Put3rlQSO3tnc4m3UtXLgset7+QaWC/120jHwduNpYX+ihgE+YV2g3VtyJY8xfAKPHTOhMN7hZm9YKdPvMEJZ/u8a83A8Ccu7YXurBNunM8gRzfEDTHcb3u30xdM2BKr+2288RsOFWJwkyBRBsJk4g429yOT7AgUGZgBMsD8Wnv13l7Z5KMUb/UpY3rlx5Dgt1nnYPnQ0gqm8ehwYUapUAYOijzFnMq456UxZvByx36XZsV/QTuuF236ufey+VTfRoJ9W3hDStKZneJ98A/BmBrTNMuVDc8Pzw0mRny9p84ScAGcbbJ20Q6ml0TU7h53XortMUHaMNDgzQ9LKOUy/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPULe1krg7Ac9nEd1bywHxf7PAPpoIJ3Mzxy/UH7vKw=;
 b=ZBM4VnPNP/zDrQA2OdKLo/tGcIxZBqHlfekcLvzF5WJdwpB1WMo2mU6e9uTduD4z8Jb/1JLid8hN1JW5W0J2Q+2YgbbrSJBXiuZxPoidriY2oRHmbQ2YOD4so1KEci4fzd0H1kHU58utBlgNK41aRL5S1dmljjfIJbjkCDEAH8FTBvaebScOLiyXaPyomX62qSeythqhF8eb9ue6vrJFtYNZyi5EV2h+BSFsFh1f7jbj3viwUtB/R47umDHPS1Ztvj1Mn37kBt6t9HB0xT4x6WPvVUe2Cq0qNTrHy+62EACdbIbm5vAI9mK0tGsJ8A6eEdjwDbA6Au6IthUU9q8TSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPULe1krg7Ac9nEd1bywHxf7PAPpoIJ3Mzxy/UH7vKw=;
 b=SQ8/Zs6Wa5843wTl5VVdx6Xllalv4rM60fCun8QKXgeie33GkcaRzRn7+hPUFDfLZnWL0UgNFvNLaTn+J4atl0gGA6aj0F52rQXpjWiOrBN21QyUkDhJKvAqqZjyHlPjlCRIHDuoxSyuHcTrG9MOMvG2jGsUIKx3l9VkdUxL7ug=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5322.eurprd08.prod.outlook.com (2603:10a6:10:114::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Tue, 25 Aug
 2020 12:20:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Tue, 25 Aug 2020
 12:20:00 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, nd <nd@arm.com>
Subject: Re: Kconfig vs tool chain capabilities
Thread-Topic: Kconfig vs tool chain capabilities
Thread-Index: AQHWeqm1rojPQ5A/KUSCBM6rLJEMwalIaPuAgAAF9YCAAAK5gIAAAUmAgAAFm4CAAAsfgIAAEPWAgAAH04CAAA2vAIAAAswAgAABqYCAABAugA==
Date: Tue, 25 Aug 2020 12:20:00 +0000
Message-ID: <47834168-3648-4EC6-99AA-C97E6272A253@arm.com>
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
In-Reply-To: <d555e945-1ac7-e43e-d2af-6177b7308cff@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3a4bdbdf-2e56-40f5-ae50-08d848f13472
x-ms-traffictypediagnostic: DB8PR08MB5322:|AM6PR08MB3669:
X-Microsoft-Antispam-PRVS: <AM6PR08MB366924DFA6F091DF65A2B57A9D570@AM6PR08MB3669.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: SkpSAXDAfbE/HYLlixwE9Qh+27AjQHZCPWdXbkqZdfipk8veUr2+q6Bxddt2MmnOt9+LL9vze0GFe1va5JchG+yWVmFHPtBf1h/86/m3oEAKZGPm8W6kiQ5KNGelQtFDHAD08ujG91wJgDRkT9z2iNZYQyMQixg/M5GoLp+FAKPwk5iJz3ADb3wDEN8jQIi9pDOg9VHXtdYkHSG2bE2Ne6gEUMZwowyI/vxZPzreW4m5qO4ghYuQd2U8EmSSySnKT/NvSSn90HgWPXiYmWyKuIRGNd1zDa78fKQmnl4SJsXs9wsV8pNtDry4ecuYTerNfRBsF24Rc43T0RnWLK71khyXk4AS7oxo8cbHQM5YFL0AtNMGwM5TEQmfvXxl9ZNd
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(83380400001)(66556008)(66946007)(66446008)(66476007)(71200400001)(64756008)(66574015)(76116006)(91956017)(26005)(316002)(186003)(6506007)(53546011)(86362001)(54906003)(2906002)(8676002)(6916009)(36756003)(8936002)(4326008)(6486002)(2616005)(5660300002)(33656002)(478600001)(6512007)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: wGScW9RiwkmGmiy+H6e7ieeMXH7qXiXNCcaGUYfDa6lrBf0kT1qQwMUv5Y3GN8WmiPEgJlO5gkz3WT9382mqpU6kMU5fBaUnOv1xr0S0gVu3tDtA5Y38Skw9YumY7MCQhDaM3ngNGUCH6E6DRcoszNO74R4rYlwSUNsZfYemuRsHc+IQ+BAJNDDtOjHYwPsWa8VVxK64Vfoo2qxmytudbQ4C/mQopDuE9A/Blw+ASFMxDM0eBT136+aGgfKaP3rdLUIuZEl4yttJyr4NHJrMSy13/w1X99NIo9papwHqXkBdkpt6He+4etzvtiR8VVBXrsPKK88nox1QmcbLqdjoXaScmzIFLR7X2lp9U7zx0W/hDn5LlBt3uSVAXI7k/NcgDYRJOOOE8rnOOE88bXwyUrtIN2Uae9m3vhgbDkEA8ZCmjKjcdHDKJGvcZ6RBu2F44/gN26EjLqgfqXfbiI43VrkTGaNqtzVTcAP5XGKORL0DATy2UTtfPdg/q3PgRf/btlrZSGFAf/iuUAfRyQYiNNM/uIUga5BiLTPYUTMA8IKuWFp8Jj0Mr4kQny9q2Qkz1HMXiZGVOJL+ksC6kypnFFRWG0nrG3nVOzJWCO39RKRTPNhmh03DpMcis82dAMsZVG86I08R/H+DrWM66JZD2A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F4E378186843F41A6AD0E77DB19196C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5322
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 63840d3a-3e3d-4947-f6a7-08d848f13020
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /0g9em7r5efZxRmk+0pBL0bTnxz9Zq5jRlcJgMJ6YVWoSfZ9sI7EvnidDOWDIOF0la2eQc05t0nzK8RKQF2ZqPFFrO5FKhxCiEex/VzKPuIvsxP7dGd8aMvC2jXpjCVT/onzlliJ/1NfsbXlmHOd/FwcJfSuqez2ZyMD2xa1SQc4Cu99DDF9b2UIpAugIRbdSfEdb2DWrYLzCNx2TzU9VEfaVBsXwJSxICeTW6+R2NNh10vsjwz1vvUU7C7XaCsDqQu33YYQJfSl00KxmyjfAZfSanaIMmhhLnKMBR5UKAMKqtXjTsWQRhNdfGGyvXzLgUAatuJL5uUUb6+aSzq3WZWzNzIYctyUzB4aOWm4Mj5jLM8tdSiM56aR0t4ZEfxm16KCq4jPjNbAR0PQg5PqFjHTsHhUDAiJnJ/AWAztsaI=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966005)(83380400001)(478600001)(6506007)(8936002)(86362001)(33656002)(53546011)(336012)(70206006)(8676002)(26005)(82310400002)(47076004)(6862004)(81166007)(186003)(82740400003)(356005)(70586007)(2906002)(6512007)(4326008)(5660300002)(2616005)(316002)(6486002)(36756003)(54906003)(66574015)(36906005)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:20:07.6384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4bdbdf-2e56-40f5-ae50-08d848f13472
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3669
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

DQoNCj4gT24gMjUgQXVnIDIwMjAsIGF0IDEyOjIyLCBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjUuMDguMjAgMTM6MTYsIEJlcnRyYW5kIE1hcnF1aXMg
d3JvdGU6DQo+Pj4gT24gMjUgQXVnIDIwMjAsIGF0IDEyOjA2LCBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDI1LjA4LjIwIDEyOjE3LCBCZXJ0cmFu
ZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4gT24gMjUgQXVnIDIwMjAsIGF0IDEwOjQ5LCBKw7xyZ2Vu
IEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBPbiAyNS4wOC4y
MCAxMDo0OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gT24gMjUuMDguMjAyMCAxMDowOCwg
SsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+Pj4+Pj4gT24gMjUuMDguMjAgMDk6NDgsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMjUuMDguMjAyMCAwOTo0MywgSsO8cmdlbiBHcm/DnyB3
cm90ZToNCj4+Pj4+Pj4+PiBPbiAyNS4wOC4yMCAwOTozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+
Pj4+Pj4+Pj4+IE9uIDI1LjA4LjIwMjAgMDk6MTIsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4+
Pj4+Pj4+PiBJIHRoaW5rIGJvdGggcHJvYmxlbXMgY2FuIGJlIHNvbHZlZCBhdCB0aGUgc2FtZSB0
aW1lIHZpYSB0aGUgZm9sbG93aW5nDQo+Pj4+Pj4+Pj4+PiBhcHByb2FjaDoNCj4+Pj4+Pj4+Pj4+
IA0KPj4+Pj4+Pj4+Pj4gLSBjb2xsZWN0IHRoZSBkYXRhIHdoaWNoIGlzIHJlZmxlY3RlZCBpbiB0
b2RheSdzIENPTkZJR18gdmFyaWFibGVzIGluIGENCj4+Pj4+Pj4+Pj4+ICAgICAgc2luZ2xlIHNj
cmlwdCBhbmQgc3RvcmUgaXQgaW4gYSBmaWxlLCBlLmcgaW4gYSBmb3JtYXQgbGlrZToNCj4+Pj4+
Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4gICAgICBDQ19JU19HQ0MgeQ0KPj4+Pj4+Pj4+Pj4gICAgICBH
Q0NfVkVSU0lPTiA3MDUwMA0KPj4+Pj4+Pj4+Pj4gICAgICBDTEFOR19WRVJTSU9OIDANCj4+Pj4+
Pj4+Pj4+ICAgICAgQ0NfSEFTX1ZJU0lCSUxJVFlfQVRUUklCVVRFIHkNCj4+Pj4+Pj4+Pj4+IA0K
Pj4+Pj4+Pj4+Pj4gLSBjaGVjayB0aGUgdG9vbCBkYXRhIGF0IGVhY2ggYnVpbGQgdG8gbWF0Y2gg
dGhlIGNvbnRlbnRzIG9mIHRoYXQgZmlsZQ0KPj4+Pj4+Pj4+Pj4gICAgICBhbmQgZWl0aGVyIGZh
aWwgdGhlIGJ1aWxkIG9yIHVwZGF0ZSB0aGUgZmlsZSBhbmQgcmVydW4ga2NvbmZpZyBpZiB0aGV5
DQo+Pj4+Pj4+Pj4+PiAgICAgIGRvbid0IG1hdGNoIChJIHRoaW5rIGZhaWxpbmcgdGhlIGJ1aWxk
IGFuZCByZXF1aXJpbmcgdG8gcnVuIGENCj4+Pj4+Pj4+Pj4+ICAgICAgIm1ha2UgY29uZmlnIiB3
b3VsZCBiZSB0aGUgYmV0dGVyIGFwcHJvYWNoKQ0KPj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+PiAt
IGZpbGwgdGhlIENPTkZJR18gdmFyaWFibGUgY29udGVudHMgZnJvbSB0aGF0IGZpbGUgaW4ga2Nv
bmZpZyBpbnN0ZWFkDQo+Pj4+Pj4+Pj4+PiAgICAgIG9mIGlzc3VpbmcgdGhlIHNpbmdsZSBzaGVs
bCBjb21tYW5kcw0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4gV2hpbGUgSSBhZ3JlZSB0aGlzIGlz
IGEgcG9zc2libGUgbW9kZWwgdG8gdXNlIChidXQgc3RpbGwgbm90IHRoZQ0KPj4+Pj4+Pj4+PiBv
bmUgd2UndmUgaW5oZXJpdGVkIGZyb20gTGludXgpLCBJIGZhaWwgdG8gc2VlIGhvdyB0aGlzIGFk
ZHJlc3Nlcw0KPj4+Pj4+Pj4+PiBteSAiZGV2ZWxvcGVycyBzaG91bGQgYmUgYXdhcmUgb2Ygd2hh
dCB0aGV5IGRvIChub3QpIGJ1aWxkIGFuZA0KPj4+Pj4+Pj4+PiB0ZXN0IiBjb25jZXJuOiBUaGVy
ZSdkIHN0aWxsIGJlIGRlcGVuZGVuY2llcyBvZiBLY29uZmlnIG9wdGlvbnMNCj4+Pj4+Pj4+Pj4g
b24gdGhlIHRvb2wgY2hhaW4gY2FwYWJpbGl0aWVzLCBhbmQgdGhlaXIgcHJvbXB0cyB0aGVyZWZv
cmUgd291bGQNCj4+Pj4+Pj4+Pj4gc3RpbGwgYmUgaW52aXNpYmxlIHdpdGhvdXQgdGhlIHRvb2wg
Y2hhaW4gaGF2aW5nIHRoZSBuZWVkZWQNCj4+Pj4+Pj4+Pj4gY2FwYWJpbGl0aWVzLiBJT1cgSSBv
bmx5IHNlZSB0aGlzIHRvIGFkZHJlc3MgMiksIGJ1dCBub3QgMSkuDQo+Pj4+Pj4+Pj4gDQo+Pj4+
Pj4+Pj4gU29ycnksIEkgZmFpbCB0byBzZWUgYSBwcm9ibGVtIGhlcmUuDQo+Pj4+Pj4+Pj4gDQo+
Pj4+Pj4+Pj4gV2hhdCBzZW5zZSBkb2VzIGl0IG1ha2UgdG8gYmUgYWJsZSB0byBjb25maWd1cmUg
YW4gb3B0aW9uIHdoaWNoIHRoZQ0KPj4+Pj4+Pj4+IHRvb2xzIGRvbid0IHN1cHBvcnQ/DQo+Pj4+
Pj4+PiANCj4+Pj4+Pj4+IFRha2UgQ0VUIGFzIGFuIGV4YW1wbGUgKGNob3NlbiBiZWNhdXNlIHRo
YXQncyB0aGUgb25lIHdoaWNoDQo+Pj4+Pj4+PiBhbHJlYWR5IHVzZXMgdGhlIEtjb25maWcgYXBw
cm9hY2gsIGRlc3BpdGUgbXkgZGlzYWdyZWVtZW50KTogSXQncw0KPj4+Pj4+Pj4gcXVpdGUgcmVs
ZXZhbnQgdG8ga25vdyB3aGV0aGVyIHlvdSdyZSB0ZXN0aW5nIFhlbiB3aXRoIGl0IGVuYWJsZWQs
DQo+Pj4+Pj4+PiBvciB3aXRoIGl0IGRpc2FibGVkIChhbmQgaGVuY2UgeW91IHBvdGVudGlhbGx5
IG1pc3NpbmcgY2hhbmdlcyB5b3UNCj4+Pj4+Pj4+IG5lZWQgdG8gbWFrZSB0byByZWxldmFudCBj
b2RlIHBvcnRpb25zKS4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IENvcnJlY3QgbWUgaWYgSSdtIHdyb25n
LCBidXQgYXNzdW1pbmcgbXkgc3VnZ2VzdGVkIGNoYW5nZXMgYmVpbmcgbWFkZSwNCj4+Pj4+Pj4g
d291bGRuJ3QgYSAuY29uZmlnIGZpbGUgc2V0dXAgb25jZSB3aXRoIENFVCBlbmFibGVkIChhbmQg
SSBhc3N1bWUgeW91J2QNCj4+Pj4+Pj4gdHJ5IHRvIGVuYWJsZSBDRVQgb24gcHVycG9zZSB3aGVu
IHRyeWluZyB0byB0ZXN0IENFVCBhbmQgeW91J2QgcmVhbGl6ZQ0KPj4+Pj4+PiBub3QgYmVpbmcg
YWJsZSB0byBkbyBzbyBpbiBjYXNlIHlvdXIgdG9vbHMgZG9uJ3Qgc3VwcG9ydCBDRVQpIGVuc3Vy
ZQ0KPj4+Pj4+PiB5b3UnZCBuZXZlciBiZWVuIGhpdCBieSBzdXJwcmlzZSB3aGVuIHNvbWUgdG9v
bCB1cGRhdGVzIHdvdWxkIHJlbW92ZQ0KPj4+Pj4+PiBDRVQgc3VwcG9ydD8NCj4+Pj4+PiBQcm9i
YWJseSwgYnV0IHRoYXQncyBub3QgbXkgcG9pbnQuIFdpdGggYSBDRVQtaW5jYXBhYmxlIHRvb2wg
Y2hhaW4NCj4+Pj4+PiB5b3UncmUgbm90IHByb21wdGVkIHdoZXRoZXIgdG8gZW5hYmxlIENFVCBp
biB0aGUgZmlyc3QgcGxhY2UsIHdoZW4NCj4+Pj4+PiBjcmVhdGluZyB0aGUgaW5pdGlhbCAuY29u
ZmlnLiBJdCBpcyB0aGlzIHVuYXdhcmVuZXNzIG9mIGEgY3J1Y2lhbA0KPj4+Pj4+IHBhcnQgb2Yg
Y29kZSBub3QgZ2V0dGluZyBidWlsdCBhbmQgdGVzdGVkIChhbmQgbGlrZWx5IHVua25vd2luZ2x5
KQ0KPj4+Pj4+IHRoYXQgSSBkaXNsaWtlLiBJbiBmYWN0LCBhZnRlciBBbmRyZXcncyBwYXRjaGVz
IGhhZCBnb25lIGluLCBpdA0KPj4+Pj4+IGhhZCB0YWtlbiBtZSBhIHdoaWxlIHRvIHJlYWxpemUg
dGhhdCBpbiBjZXJ0YWluIG9mIG15IGJ1aWxkcyBJIGRvbid0DQo+Pj4+Pj4gaGF2ZSBDRVQgZW5h
YmxlZCAoZGVzcGl0ZSBtZSBoYXZpbmcgZG9uZSBub3RoaW5nIHRvIGRpc2FibGUgaXQpLCBhbmQN
Cj4+Pj4+PiBoZW5jZSB0aG9zZSBidWlsZHMgd29ya2luZyBmaW5lIGFyZSBtZWFuaW5nbGVzcyBm
b3IgYW55IGNoYW5nZXMNCj4+Pj4+PiBhZmZlY3RpbmcgQ0VUIGNvZGUgaW4gYW55IHdheS4NCj4+
Pj4+IA0KPj4+Pj4gWWVzLCB0aGlzIGlzIHRoZSByZXN1bHQgb2YgbGV0dGluZyBzb21lIG9wdGlv
bnMgZGVwZW5kIG9uIG90aGVycy4NCj4+Pj4+IA0KPj4+Pj4gVGhpcyBpcyB3aGF0IEkgbWVhbnQg
cmVnYXJkaW5nIHRoZSBhcmNoaXRlY3R1cmU6IHRoZXJlIGFyZSBlLmcuIG11bHRpcGxlDQo+Pj4+
PiBzb3VyY2UgZmlsZXMgaW4gZHJpdmVycy9jaGFyLyBiZWluZyBidWlsdCBvbmx5IGZvciBBUk0g
b3IgWDg2LCBpbiBzcGl0ZQ0KPj4+Pj4gb2YgYmVpbmcgbG9jYXRlZCBvdXRzaWRlIGFyY2gvLiBB
bmQgeWV0IHlvdSBkb24ndCBzZWUgdGhpcyBhcyBhIHByb2JsZW0sDQo+Pj4+PiBldmVuIGlmIHlv
dSBhcmUgbm90IGFibGUgdG8gc2VsZWN0IHRob3NlIGRyaXZlcnMgdG8gYmUgYnVpbHQgd2hlbiB1
c2luZw0KPj4+Pj4gInRoZSBvdGhlciIgYXJjaC4gVGhleSBhcmUgc2lsZW50bHkgZGlzYWJsZWQu
IEp1c3QgbGlrZSBDRVQgaW4gY2FzZSBvZg0KPj4+Pj4gYW4gaW5jYXBhYmxlIHRvb2wgY2hhaW4u
DQo+Pj4+PiANCj4+Pj4+IFNvIElNTyBlaXRoZXIgd2UgYmFuICJkZXBlbmRzIG9uIiBmcm9tIG91
ciBLY29uZmlnIGZpbGVzIChubywgSSBkb24ndA0KPj4+Pj4gd2FudCB0byBkbyB0aGF0KSwgb3Ig
d2UgdXNlIGl0IGFzIGRlc2lnbmVkIGFuZCBtYWtlIGl0IGFzIHVzZXIgZnJpZW5kbHkNCj4+Pj4+
IGFzIHBvc3NpYmxlLiBJbiBjYXNlIHdlIGFzIGRldmVsb3BlcnMgaGF2ZSBhIHNwZWNpYWwgdGVz
dCBjYXNlIHRoZW4gd2UNCj4+Pj4+IG5lZWQgdG8gY2hlY2sgdGhlIC5jb25maWcgd2hldGhlciB0
aGUgZGVzaXJlZCBzZXR0aW5ncyBhcmUgcmVhbGx5DQo+Pj4+PiBwcmVzZW50LiBIYXZpbmcgdGhv
c2Ugc2V0dGluZ3MgZGVwZW5kaW5nIG9uIHRvb2wgY2FwYWJpbGl0aWVzIGluIGENCj4+Pj4+IHNw
ZWNpZmljIGZpbGUgd2lsbCBtYWtlIHRoaXMgY2hlY2sgbXVjaCBlYXNpZXIuDQo+Pj4+PiANCj4+
Pj4+IEFuZCBCVFcsIEkgY2FuJ3Qgc2VlIGhvdyBzZXR0aW5nIHRoZSB0b2xscycgY2FwYWJpbGl0
aWVzIGZyb20gZS5nLg0KPj4+Pj4gYXJjaC94ODYvUnVsZXMubWsgaXMgYmV0dGVyIGluIGFueSB3
YXkgKHNlZSBob3cgQ09ORklHX0lORElSRUNUX1RIVU5LDQo+Pj4+PiBnb3QgaXRzIHZhbHVlIGlu
IG9sZGVyIFhlbiB2ZXJzaW9ucyBsaWtlIDQuMTIpLg0KPj4+Pj4gDQo+Pj4+PiBXZSBjYW4ndCBo
YXZlIGV2ZXJ5dGhpbmcgYW5kIEkgYmVsaWV2ZSBhdXRvbWF0aWNhbGx5IGRpc2FibGluZyBmZWF0
dXJlcw0KPj4+Pj4gd2hpY2ggY2FuJ3Qgd29yayB3aXRoIHRoZSBjdXJyZW50IHRvb2xzIGlzIGEg
c2FuZSBkZWNpc2lvbi4gRG9pbmcgdGhpcw0KPj4+Pj4gdmlhIEtjb25maWcgaXMgdGhlIGJldHRl
ciBhcHByb2FjaCBjb21wYXJlZCB0byBNYWtlZmlsZSBzbmlwbGV0cyBJTU8uDQo+Pj4+IFRoYXQg
c291bmRzIGxpa2UgYSBuaWNlIGZlYXR1cmUgdG8gaGF2ZSBzb21lIGNvbXBpbGVyIG9yIHRvb2xz
IG9wdGlvbnMgdGhhdA0KPj4+PiBjYW4gYmUgc2VsZWN0ZWQgb3IgYWN0aXZhdGVkIGluIEtjb25m
aWcuIFRoZXJlIGFyZSBzb21lIGNvbXBpbGVyIG9wdGlvbnMNCj4+Pj4gbWFuZGF0b3J5IHRvIGhh
bmRsZSBzb21lIGVycmF0YXMgb3IgWFNBIHRoYXQgb25lIG1pZ2h0IHdhbnQgdG8gZXhwbGljaXRl
bHkNCj4+Pj4gc2VsZWN0Lg0KPj4+PiBJIGFtIGJpdCB1bnN1cmUgYWJvdXQgdGhlIHBhcnQgd2hl
cmUgc29tZSBrY29uZmlnIG9wdGlvbnMgd291bGQgb25seQ0KPj4+PiBiZSBhdmFpbGFibGUgb3Ig
bm90IGRlcGVuZGluZyBvbiBzb21lIHRlc3RzIHdpdGggdGhlIGNvbXBpbGVyIGJlaW5nIGRvaW5n
DQo+Pj4+IHByaW9yIHRvIG9wZW5pbmcgdGhlIGVkaXRvci4gSSB3b3VsZCBndWVzcyB0aGUgbWVu
dWNvbmZpZyBwcm9jZXNzIHdvdWxkDQo+Pj4+IGhhdmUgdG8gZmlyc3QgcnVuIHNvbWUgdGVzdHMg
YW5kIHRoZW4gZ2VuZXJhdGVkIHNvbWUgSEFTXyBjb25maWd1cmF0aW9uDQo+Pj4+IG9wdGlvbnMg
ZGVwZW5kaW5nIG9uIHRoZSByZXN1bHQgb2YgdGhlIHRlc3RzLg0KPj4+PiBEaWQgaSBnb3QgdGhl
IGlkZWEgcmlnaHQgaGVyZSA/DQo+Pj4+IElzIHRoaXMgc29tZXRoaW5nIHNvbWVib2R5IHRyaWVk
IHRvIGRvID8NCj4+Pj4gQXMgYSB1c2VyIEkgd291bGQgbW9yZSBleHBlY3QgdGhhdCB0aGUgYnVp
bGQgcHJvY2VzcyB3b3VsZCB0ZWxsIG1lIHRoYXQgbXkNCj4+Pj4gY29uZmlndXJhdGlvbiBpcyBp
bnZhbGlkIGJlY2F1c2UgaSBzZWxlY3RlZCBzb21ldGhpbmcgdGhhdCBpcyBub3Qgc3VwcG9ydGVk
DQo+Pj4+IGJ5IG15IGNvbXBpbGVyLiBJIG1pZ2h0IGhhdmUgdGhlIGNoYW5jZSB0byBqdXN0IGZp
eCBteSBidWlsZCB0byB1c2UgdGhlIHJpZ2h0DQo+Pj4+IGNvbXBpbGVyIChsaWtlIGJ5IG1pc3Rh
a2UgdXNpbmcgeDg2IHRvb2xjaGFpbiB0byBjb21waWxlIGZvciBhcm0pLg0KPj4+PiBXZSBzaG91
bGQgYWxzbyBiZSBjYXJlZnVsIG5vdCB0byBzaWxlbnRseSBpZ25vcmUgc29tZSBjb25maWd1cmF0
aW9uIG9wdGlvbiBpZg0KPj4+PiBvbmUgaXMgY2hhbmdpbmcgdGhlIGNvbXBpbGVyIGFuZCB0aGUg
bmV3IG9uZSBkb2VzIG5vdCBzdXBwb3J0IGFuIG9wdGlvbi4NCj4+Pj4gQSB1c2VyIHdvdWxkIGhh
dmUgaGlzIGNvbmZpZ3VyYXRpb24gYW5kIGNvbXBpbGUgdXNpbmcgaXQgd2l0aG91dA0KPj4+PiBw
YXNzaW5nIHRocm91Z2ggdGhlIGVkaXRvciBpbnRlcmZhY2UgYW5kIG1pZ2h0IG5lZWQgdG8gYmUg
YXdhcmUgdGhhdCBhIHBhcnQNCj4+Pj4gb2YgaGlzIGNvbmZpZ3VyYXRpb24gaXMgbm90IHZhbGlk
IGFueW1vcmUgYmVjYXVzZSB0aGUgdG9vbHMgaGUgaXMgdXNpbmcgY2hhbmdlZC4NCj4+Pj4gVGhp
cyBpcyBzb21ldGhpbmcgdGhhdCBjb3VsZCBvY2N1ciBhIGxvdCB3aGVuIHVzaW5nIGEgZGlzdHJp
YnV0aW9uIHRvb2xjaGFpbi4NCj4+Pj4gQWxzbyB0aGVyZSBhcmUgc29tZSBjb21waWxlciBvcHRp
b24gY2hhbmdpbmcgc28gaSB3b3VsZCBtb3JlIHRoaW5rIHRoYXQNCj4+Pj4gdGhlcmUgc2hvdWxk
IGJlIGdlbmVyaWMgY29uZmlndXJhdGlvbiBvcHRpb25zIHNvIHRoYXQgaW4gdGhlIG1ha2VmaWxl
cyB3ZQ0KPj4+PiBjb3VsZCBoYXZlIHRoZSBvcHBvcnR1bml0eSB0byBhZGQgZGlmZmVyZW50IGNv
bXBpbGVyIG9wdGlvbnMgZm9yIGRpZmZlcmVudA0KPj4+PiB0b29sY2hhaW5zIGRlcGVuZGluZyBv
biB0aGUgdmVyc2lvbiBvciB0aGUgdHlwZSBvZiB0aGUgdG9vbGNoYWluLg0KPj4+PiBUbyBiZSBj
bGVhciBpIHdvdWxkIHNlZSBzb21ldGhpbmcgbGlrZToNCj4+Pj4gaW4ga2NvbmZpZzoNCj4+Pj4g
Q09NUElMRVJfT1BUSU9OX1hYWA0KPj4+PiAJYm9vbCDigJxhY3RpdmF0ZSBYWFggY29tcGlsZXIg
ZmxhZw0KPj4+PiBpbiBNYWtlZmlsZToNCj4+Pj4gaWZlcSAoJChDT05GSUdfQ09NUElMRVJfT1BU
SU9OX1hYWCksIHRydWUpDQo+Pj4+IHRlc3RfY29tcGlsZXJfY3h4Og0KPj4+PiAJJChDQykgLXh4
eCBkdW1teS5jIC1vIGR1bW15IHx8ICQoZXJyb3IgWW91ciBjb21waWxlciBkb2VzIG5vdCBzdXBw
b3J0IC14eHgpDQo+Pj4+IGNjLWZsYWdzICs9IC14eHgNCj4+Pj4gZW5kaWYNCj4+Pj4gVGhlIHN5
bnRheCBpcyB3cm9uZyBoZXJlIGJ1dCB5b3UgZ2V0IHRoZSBpZGVhIDotKQ0KPj4+IA0KPj4+IEFo
LCBva2F5LCB0aGlzIGlzIGFub3RoZXIgYXBwcm9hY2gsIHdoaWNoIG1pZ2h0IGJlIGV2ZW4gbW9y
ZSBmbGV4aWJsZS4NCj4+PiBJdCB3b3VsZCBhbGxvdyB0byBjb250cm9sIGNvbXBpbGVyIGZsYWdz
IGluc3RlYWQgb2YgbW9yZSBoaWdoIGxldmVsDQo+Pj4gZmVhdHVyZXMuDQo+PiBXZSBtaWdodCBo
YXZlIGJvdGgsIHRoaXMgd291bGQgYWxzbyBhbGxvdyB0byBoYXZlIG1vcmUgaGlnaCBsZXZlbCBm
ZWF0dXJlcyB3aGljaCBhcmUNCj4+IGRvaW5nIGJvdGggYWRkaW5nIGNvbXBpbGVyIGZsYWdzIGFu
ZCBvdGhlciBzdHVmZiwNCj4+PiANCj4+PiBJbiBjYXNlIHdlIHdhbnQgdG8gZ28gdGhhdCByb3V0
ZSB3ZSBzaG91bGQgZGVmYXVsdCBDT01QSUxFUl9PUFRJT05fWFhYDQo+Pj4gdG8gdGhlIGN1cnJl
bnQgdG9vbCBjYXBhYmlsaXRpZXMgaW4gb3JkZXIgdG8gYXZvaWQgbG9uZ2VyIHRyeS1hbmQtZXJy
b3INCj4+PiBsb29wcy4NCj4+IEkgYW0gbm90IHF1aXRlIHN1cmUgaG93IHlvdSB3YW50IHRvIGFj
aGlldmUgdGhpcyBjbGVhbmx5Lg0KPiANCj4gU29tZXRoaW5nIGxpa2UgKHBpY2tlZCBhbiBhY3R1
YWwgZXhhbXBsZSBmcm9tIHg4Nik6DQo+IA0KPiBjb25maWcgSEFTX0NPTVBJTEVSX09QVElPTl9J
QlINCj4gCWJvb2wgIlNlbGVjdCBjb21waWxlciBvcHRpb24gLW1pbmRpcmVjdC1icmFuY2gtcmVn
aXN0ZXIiDQo+IAlkZWZhdWx0ICQoY2Mtb3B0aW9uLC1taW5kaXJlY3QtYnJhbmNoLXJlZ2lzdGVy
KQ0KPiAJICBibGFoIGJsYWggYmxhaA0KPiANCg0KTmljZSA6LSkNCkRlZmluaXRlbHkgaSB3b3Vs
ZCBhZGQgYSDigJxkZWZhdWx0IHkgaWYgRVhQRVJU4oCdIG9yIHNvbWV0aGluZyBlcXVpdmFsZW50
Lg0KDQpCZXJ0cmFuZA0KDQo=

