Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C058F251916
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 14:55:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAYTU-00036B-GR; Tue, 25 Aug 2020 12:54:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvT3=CD=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kAYTS-000366-W4
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 12:54:51 +0000
X-Inumbo-ID: 2678b74b-1160-40fb-a888-237026d6d453
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::616])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2678b74b-1160-40fb-a888-237026d6d453;
 Tue, 25 Aug 2020 12:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQIjPXfWBRb41V2uHelNvtbYN6EiTYZAZVp7sgKhrhA=;
 b=paWB/hs1FE8YrtLRQ+g0zcuRHW/vBeXJZRfeyoEg+ecNYfphPcHiO/3LiZn2+8c9Z+qRh/grx9O6kY5MSa3nc5M32ZTxjiekb9mAflQbTQG4tkpf5JROeo8EDeTR/kbqfpRXtxia4P7o1L/W4zdhewVy/JVLTNKuHk+UQEllTEY=
Received: from AM5PR1001CA0028.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::41)
 by DB8PR08MB5322.eurprd08.prod.outlook.com (2603:10a6:10:114::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Tue, 25 Aug
 2020 12:54:48 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::bc) by AM5PR1001CA0028.outlook.office365.com
 (2603:10a6:206:2::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Tue, 25 Aug 2020 12:54:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 12:54:46 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64");
 Tue, 25 Aug 2020 12:54:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 39036c0eaecb4608
X-CR-MTA-TID: 64aa7808
Received: from 5b844cd99fc4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E14686BC-BF8B-400B-B82B-246D44B1464F.1; 
 Tue, 25 Aug 2020 12:54:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5b844cd99fc4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 12:54:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdS6wsYqmdufpWeEybO6WI8h7stPYhK8R1RXg9xzoE4ga152HSKjRNxIS/8Ozu52dyQJqbwfVsjjP+iakoGnCWAVWaaWlWjfvDiMZoWRXemailTO96rA8PoUCO7wde1xan/Sw8ODoZolbrXiHNz3Sab/0LDlhs8G46orxA40vu/2xYNrGFNSXoEz6kR9TD5Udf51X+gXvCTO98zxSV0uBXmhJTGKLbrQ+tp5xerZqarh8/nJtUEP+skLbdPSjKtz1AvVdw/pu0WoUNyuNrlq2vk0u1oZeE9Xxr0Xvx7E1VnqJyfGaS0+ZYf9M/7+TWq4GZxds6CDkqDbJBA8R/wObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQIjPXfWBRb41V2uHelNvtbYN6EiTYZAZVp7sgKhrhA=;
 b=k/ZjNtReb2zBoc+mvmjBYijNzBXWu8KZrcpdvJq5/vdqQCiM3MKQu3zf1cYnEk8C21oEOVQMS/JcYVs0XPq+kJ/2RUFG+hJ08SlNvF7GqKjIFkZvGp3o+NcrHhkQxMjmboVe9T4bY/McPJorrGpTwHFx8Wkwps5R3sV8h1PM/wwdwenARifOTk6a7gXlMC86qlbFpqWKpPEfnXemndVNmrPxEJC8ZJA5gGZ7S+BLw4LCT8SJApFy9YESjljxXGPFT1JfJwfokPLckRs8zLElAU3TVTLXZyO3kzyROpbnXOlMdc9Hk76SR77zfzo+zCKQj4ej8Cx8eUhvHV2LjoR/IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQIjPXfWBRb41V2uHelNvtbYN6EiTYZAZVp7sgKhrhA=;
 b=paWB/hs1FE8YrtLRQ+g0zcuRHW/vBeXJZRfeyoEg+ecNYfphPcHiO/3LiZn2+8c9Z+qRh/grx9O6kY5MSa3nc5M32ZTxjiekb9mAflQbTQG4tkpf5JROeo8EDeTR/kbqfpRXtxia4P7o1L/W4zdhewVy/JVLTNKuHk+UQEllTEY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5324.eurprd08.prod.outlook.com (2603:10a6:10:11e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 25 Aug
 2020 12:54:39 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Tue, 25 Aug 2020
 12:54:39 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, nd <nd@arm.com>
Subject: Re: Kconfig vs tool chain capabilities
Thread-Topic: Kconfig vs tool chain capabilities
Thread-Index: AQHWeqm1rojPQ5A/KUSCBM6rLJEMwalIaPuAgAAF9YCAAAK5gIAAAUmAgAAFm4CAAAsfgIAAEPWAgAAH04CAAA2vAIAAAswAgAABqYCAABAugIAABNEAgAACE4CAAAHrgIAAAN8A
Date: Tue, 25 Aug 2020 12:54:39 +0000
Message-ID: <C36B7F34-98A1-4127-8A28-056DE1DE7A88@arm.com>
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
 <7FF0CA52-4921-425E-A442-56269924D64F@arm.com>
 <7c378950-7ed5-6b0d-6bac-be3823f383e9@suse.com>
In-Reply-To: <7c378950-7ed5-6b0d-6bac-be3823f383e9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d4c23ca6-0723-4654-6023-08d848f60c4e
x-ms-traffictypediagnostic: DB8PR08MB5324:|DB8PR08MB5322:
X-Microsoft-Antispam-PRVS: <DB8PR08MB5322C25BEFA9C9FA753A5F8A9D570@DB8PR08MB5322.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wB2oir62bQztqW46StRz55lFwjJ0xFsI6Im1SaCZJ7L1XPOUCC1IUYjEFPh2QHNCVSwaC7VqJktxyV7I50ke3ZqY7X2toeE1aMQpiySGGQ382vCCxqVYy7rwPeTeH2wUEt6gGNwAjKU5VmDQQA7/qu10DbmQOiWMi0yCVyqLRgeNEXJ+4eMrDnQV6r0bH+E34Eqt5bJ7K/A6xuwi/sCX3sUK0i+v+ObQUfR3sLredZA5yr8zJan3n/k/T2+h/jvnhGlg3QkBiNgtj+ugXi+gxQAYTzlNOTgVrOGoLDcmN1Quj43ulsfZkZUC9mamwTOIglHzFFET3T/nU2B152SbOH6CLyLH2+HdoE/xVbPeJLuNRSYg1HhwBKAkkle4TAM9
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(91956017)(76116006)(66946007)(8676002)(6916009)(66556008)(478600001)(71200400001)(66476007)(86362001)(64756008)(66574015)(66446008)(2906002)(36756003)(83380400001)(53546011)(26005)(6486002)(33656002)(186003)(6512007)(54906003)(6506007)(4326008)(5660300002)(2616005)(8936002)(316002)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: W3P+rDtBAh6Du4kbuBwNGyxgrGYuwNNv3357udiA6CtdbSEUpwcoePYShXV+PJ82vxF+MZEZsFtJh+Z2GmUGSZzhF2UNSBdCD4tnPcE7obtt+LEVtrCfzEHwbZBkrRXoa7T8Yxh2PjyMUTsDwoCdQ9u8Gp0IIFYH0SREDLvMXqQje9QEHl+tosNINs9qTLHnRKVNnwMdhxR7c0bxRpRZPeYFRmbexKyhRDGzQpBO3JSIXqkTU5WLVYWpQZCBG1qpkyEearM4ZdtJNs8ev9RLeFBzFV6ITf8/cqzKoL6b9gZSkMvwRPgco/xGtaqD1Gl1RdONKcu1Y9lURiN6qrUNrHIPOcPeq1azvvboKMIRKLE8mCeIrMBIAen9q1aWLh73AAF0FmY7ufxYVCuTAz1RFsNiDPDixqmclWgHMfoqHfP28skQ4APzWAIUhFdOyI3if3REW5P76tr/jdFE8Pvds9efk7PecvkOIn6wA6BbJmH2wFBgryJbVdOSHUn7bwbfxY8MwNkCkU0JWQZTvRjopSsfG6OK/YfEIGjYM6CAi4LNGrsUoJj3Zh/PLAAPdNi7lT32bSlvVALNCAe3XKSfmQWsrZEbYGCCQ6TS/J7OKNl5U4FRqjSt/+J1HXklZrDqCGsyLncPjc6sm2s1QdTQ9w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3803B3E4CDA001459D8AF00D3EFCBB9B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5324
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1d607b5b-678c-47a8-ab12-08d848f60728
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tY1qterQilQ8vW/JkNa15H6mmvwEy1mGDVBVeE52phPZtel0KtzFTLrcDGZDzJCiFzSq+y8DwDFH/eScQPe2BJVUeI8otXrpt4rNKF46GPbFWlpc7tMtaT6XsUp7NEYoMNpfpkAq5pEyDf90uPBWty8xVyvYbDD9jcYOnW87dUbgq6K1dS3c2uLMQfC9qauT3uKR/NuB/I77yUhfVF66mRfhC0q4Y36o97WSfhS5ra0ioaZ4DKm8IOKfo1GeNq06k64DF4AMI6TDjgxcvwT0jlbQ0jBItQw322AesO+mBPAELsTyS8QtW94f+4i0GP9ptFBBzv64HqN8b5mLTcfsgi1VCdc1Euw/Akx60giEkL92qKSYCXwXj1Y4FBGBj6y6ysp08NvHGbfWkFIQ0vBZiswhqlJZux7dTv+SCg5jK3c=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966005)(83380400001)(70206006)(356005)(70586007)(66574015)(82740400003)(81166007)(86362001)(336012)(47076004)(316002)(186003)(6506007)(26005)(82310400002)(54906003)(36906005)(53546011)(6862004)(2906002)(8676002)(36756003)(8936002)(4326008)(6486002)(2616005)(5660300002)(33656002)(478600001)(6512007)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:54:46.2740 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c23ca6-0723-4654-6023-08d848f60c4e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5322
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

DQoNCj4gT24gMjUgQXVnIDIwMjAsIGF0IDEzOjUxLCBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjUuMDguMjAgMTQ6NDQsIEJlcnRyYW5kIE1hcnF1aXMg
d3JvdGU6DQo+Pj4gT24gMjUgQXVnIDIwMjAsIGF0IDEzOjM3LCBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDI1LjA4LjIwIDE0OjIwLCBCZXJ0cmFu
ZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4gT24gMjUgQXVnIDIwMjAsIGF0IDEyOjIyLCBKw7xyZ2Vu
IEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBPbiAyNS4wOC4y
MCAxMzoxNiwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+Pj4gT24gMjUgQXVnIDIwMjAs
IGF0IDEyOjA2LCBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4+
PiANCj4+Pj4+Pj4gT24gMjUuMDguMjAgMTI6MTcsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+
Pj4+Pj4+Pj4gT24gMjUgQXVnIDIwMjAsIGF0IDEwOjQ5LCBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NA
c3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IE9uIDI1LjA4LjIwIDEwOjQ4
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4+Pj4gT24gMjUuMDguMjAyMCAxMDowOCwgSsO8
cmdlbiBHcm/DnyB3cm90ZToNCj4+Pj4+Pj4+Pj4+IE9uIDI1LjA4LjIwIDA5OjQ4LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+Pj4+Pj4+PiBPbiAyNS4wOC4yMDIwIDA5OjQzLCBKw7xyZ2VuIEdy
b8OfIHdyb3RlOg0KPj4+Pj4+Pj4+Pj4+PiBPbiAyNS4wOC4yMCAwOTozNCwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+Pj4+Pj4+Pj4+PiBPbiAyNS4wOC4yMDIwIDA5OjEyLCBKw7xyZ2VuIEdyb8Of
IHdyb3RlOg0KPj4+Pj4+Pj4+Pj4+Pj4+IEkgdGhpbmsgYm90aCBwcm9ibGVtcyBjYW4gYmUgc29s
dmVkIGF0IHRoZSBzYW1lIHRpbWUgdmlhIHRoZSBmb2xsb3dpbmcNCj4+Pj4+Pj4+Pj4+Pj4+PiBh
cHByb2FjaDoNCj4+Pj4+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+Pj4+PiAtIGNvbGxlY3QgdGhl
IGRhdGEgd2hpY2ggaXMgcmVmbGVjdGVkIGluIHRvZGF5J3MgQ09ORklHXyB2YXJpYWJsZXMgaW4g
YQ0KPj4+Pj4+Pj4+Pj4+Pj4+ICAgICAgc2luZ2xlIHNjcmlwdCBhbmQgc3RvcmUgaXQgaW4gYSBm
aWxlLCBlLmcgaW4gYSBmb3JtYXQgbGlrZToNCj4+Pj4+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+
Pj4+PiAgICAgIENDX0lTX0dDQyB5DQo+Pj4+Pj4+Pj4+Pj4+Pj4gICAgICBHQ0NfVkVSU0lPTiA3
MDUwMA0KPj4+Pj4+Pj4+Pj4+Pj4+ICAgICAgQ0xBTkdfVkVSU0lPTiAwDQo+Pj4+Pj4+Pj4+Pj4+
Pj4gICAgICBDQ19IQVNfVklTSUJJTElUWV9BVFRSSUJVVEUgeQ0KPj4+Pj4+Pj4+Pj4+Pj4+IA0K
Pj4+Pj4+Pj4+Pj4+Pj4+IC0gY2hlY2sgdGhlIHRvb2wgZGF0YSBhdCBlYWNoIGJ1aWxkIHRvIG1h
dGNoIHRoZSBjb250ZW50cyBvZiB0aGF0IGZpbGUNCj4+Pj4+Pj4+Pj4+Pj4+PiAgICAgIGFuZCBl
aXRoZXIgZmFpbCB0aGUgYnVpbGQgb3IgdXBkYXRlIHRoZSBmaWxlIGFuZCByZXJ1biBrY29uZmln
IGlmIHRoZXkNCj4+Pj4+Pj4+Pj4+Pj4+PiAgICAgIGRvbid0IG1hdGNoIChJIHRoaW5rIGZhaWxp
bmcgdGhlIGJ1aWxkIGFuZCByZXF1aXJpbmcgdG8gcnVuIGENCj4+Pj4+Pj4+Pj4+Pj4+PiAgICAg
ICJtYWtlIGNvbmZpZyIgd291bGQgYmUgdGhlIGJldHRlciBhcHByb2FjaCkNCj4+Pj4+Pj4+Pj4+
Pj4+PiANCj4+Pj4+Pj4+Pj4+Pj4+PiAtIGZpbGwgdGhlIENPTkZJR18gdmFyaWFibGUgY29udGVu
dHMgZnJvbSB0aGF0IGZpbGUgaW4ga2NvbmZpZyBpbnN0ZWFkDQo+Pj4+Pj4+Pj4+Pj4+Pj4gICAg
ICBvZiBpc3N1aW5nIHRoZSBzaW5nbGUgc2hlbGwgY29tbWFuZHMNCj4+Pj4+Pj4+Pj4+Pj4+IA0K
Pj4+Pj4+Pj4+Pj4+Pj4gV2hpbGUgSSBhZ3JlZSB0aGlzIGlzIGEgcG9zc2libGUgbW9kZWwgdG8g
dXNlIChidXQgc3RpbGwgbm90IHRoZQ0KPj4+Pj4+Pj4+Pj4+Pj4gb25lIHdlJ3ZlIGluaGVyaXRl
ZCBmcm9tIExpbnV4KSwgSSBmYWlsIHRvIHNlZSBob3cgdGhpcyBhZGRyZXNzZXMNCj4+Pj4+Pj4+
Pj4+Pj4+IG15ICJkZXZlbG9wZXJzIHNob3VsZCBiZSBhd2FyZSBvZiB3aGF0IHRoZXkgZG8gKG5v
dCkgYnVpbGQgYW5kDQo+Pj4+Pj4+Pj4+Pj4+PiB0ZXN0IiBjb25jZXJuOiBUaGVyZSdkIHN0aWxs
IGJlIGRlcGVuZGVuY2llcyBvZiBLY29uZmlnIG9wdGlvbnMNCj4+Pj4+Pj4+Pj4+Pj4+IG9uIHRo
ZSB0b29sIGNoYWluIGNhcGFiaWxpdGllcywgYW5kIHRoZWlyIHByb21wdHMgdGhlcmVmb3JlIHdv
dWxkDQo+Pj4+Pj4+Pj4+Pj4+PiBzdGlsbCBiZSBpbnZpc2libGUgd2l0aG91dCB0aGUgdG9vbCBj
aGFpbiBoYXZpbmcgdGhlIG5lZWRlZA0KPj4+Pj4+Pj4+Pj4+Pj4gY2FwYWJpbGl0aWVzLiBJT1cg
SSBvbmx5IHNlZSB0aGlzIHRvIGFkZHJlc3MgMiksIGJ1dCBub3QgMSkuDQo+Pj4+Pj4+Pj4+Pj4+
IA0KPj4+Pj4+Pj4+Pj4+PiBTb3JyeSwgSSBmYWlsIHRvIHNlZSBhIHByb2JsZW0gaGVyZS4NCj4+
Pj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+Pj4+IFdoYXQgc2Vuc2UgZG9lcyBpdCBtYWtlIHRvIGJl
IGFibGUgdG8gY29uZmlndXJlIGFuIG9wdGlvbiB3aGljaCB0aGUNCj4+Pj4+Pj4+Pj4+Pj4gdG9v
bHMgZG9uJ3Qgc3VwcG9ydD8NCj4+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+PiBUYWtlIENFVCBh
cyBhbiBleGFtcGxlIChjaG9zZW4gYmVjYXVzZSB0aGF0J3MgdGhlIG9uZSB3aGljaA0KPj4+Pj4+
Pj4+Pj4+IGFscmVhZHkgdXNlcyB0aGUgS2NvbmZpZyBhcHByb2FjaCwgZGVzcGl0ZSBteSBkaXNh
Z3JlZW1lbnQpOiBJdCdzDQo+Pj4+Pj4+Pj4+Pj4gcXVpdGUgcmVsZXZhbnQgdG8ga25vdyB3aGV0
aGVyIHlvdSdyZSB0ZXN0aW5nIFhlbiB3aXRoIGl0IGVuYWJsZWQsDQo+Pj4+Pj4+Pj4+Pj4gb3Ig
d2l0aCBpdCBkaXNhYmxlZCAoYW5kIGhlbmNlIHlvdSBwb3RlbnRpYWxseSBtaXNzaW5nIGNoYW5n
ZXMgeW91DQo+Pj4+Pj4+Pj4+Pj4gbmVlZCB0byBtYWtlIHRvIHJlbGV2YW50IGNvZGUgcG9ydGlv
bnMpLg0KPj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+PiBDb3JyZWN0IG1lIGlmIEknbSB3cm9uZywg
YnV0IGFzc3VtaW5nIG15IHN1Z2dlc3RlZCBjaGFuZ2VzIGJlaW5nIG1hZGUsDQo+Pj4+Pj4+Pj4+
PiB3b3VsZG4ndCBhIC5jb25maWcgZmlsZSBzZXR1cCBvbmNlIHdpdGggQ0VUIGVuYWJsZWQgKGFu
ZCBJIGFzc3VtZSB5b3UnZA0KPj4+Pj4+Pj4+Pj4gdHJ5IHRvIGVuYWJsZSBDRVQgb24gcHVycG9z
ZSB3aGVuIHRyeWluZyB0byB0ZXN0IENFVCBhbmQgeW91J2QgcmVhbGl6ZQ0KPj4+Pj4+Pj4+Pj4g
bm90IGJlaW5nIGFibGUgdG8gZG8gc28gaW4gY2FzZSB5b3VyIHRvb2xzIGRvbid0IHN1cHBvcnQg
Q0VUKSBlbnN1cmUNCj4+Pj4+Pj4+Pj4+IHlvdSdkIG5ldmVyIGJlZW4gaGl0IGJ5IHN1cnByaXNl
IHdoZW4gc29tZSB0b29sIHVwZGF0ZXMgd291bGQgcmVtb3ZlDQo+Pj4+Pj4+Pj4+PiBDRVQgc3Vw
cG9ydD8NCj4+Pj4+Pj4+Pj4gUHJvYmFibHksIGJ1dCB0aGF0J3Mgbm90IG15IHBvaW50LiBXaXRo
IGEgQ0VULWluY2FwYWJsZSB0b29sIGNoYWluDQo+Pj4+Pj4+Pj4+IHlvdSdyZSBub3QgcHJvbXB0
ZWQgd2hldGhlciB0byBlbmFibGUgQ0VUIGluIHRoZSBmaXJzdCBwbGFjZSwgd2hlbg0KPj4+Pj4+
Pj4+PiBjcmVhdGluZyB0aGUgaW5pdGlhbCAuY29uZmlnLiBJdCBpcyB0aGlzIHVuYXdhcmVuZXNz
IG9mIGEgY3J1Y2lhbA0KPj4+Pj4+Pj4+PiBwYXJ0IG9mIGNvZGUgbm90IGdldHRpbmcgYnVpbHQg
YW5kIHRlc3RlZCAoYW5kIGxpa2VseSB1bmtub3dpbmdseSkNCj4+Pj4+Pj4+Pj4gdGhhdCBJIGRp
c2xpa2UuIEluIGZhY3QsIGFmdGVyIEFuZHJldydzIHBhdGNoZXMgaGFkIGdvbmUgaW4sIGl0DQo+
Pj4+Pj4+Pj4+IGhhZCB0YWtlbiBtZSBhIHdoaWxlIHRvIHJlYWxpemUgdGhhdCBpbiBjZXJ0YWlu
IG9mIG15IGJ1aWxkcyBJIGRvbid0DQo+Pj4+Pj4+Pj4+IGhhdmUgQ0VUIGVuYWJsZWQgKGRlc3Bp
dGUgbWUgaGF2aW5nIGRvbmUgbm90aGluZyB0byBkaXNhYmxlIGl0KSwgYW5kDQo+Pj4+Pj4+Pj4+
IGhlbmNlIHRob3NlIGJ1aWxkcyB3b3JraW5nIGZpbmUgYXJlIG1lYW5pbmdsZXNzIGZvciBhbnkg
Y2hhbmdlcw0KPj4+Pj4+Pj4+PiBhZmZlY3RpbmcgQ0VUIGNvZGUgaW4gYW55IHdheS4NCj4+Pj4+
Pj4+PiANCj4+Pj4+Pj4+PiBZZXMsIHRoaXMgaXMgdGhlIHJlc3VsdCBvZiBsZXR0aW5nIHNvbWUg
b3B0aW9ucyBkZXBlbmQgb24gb3RoZXJzLg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IFRoaXMgaXMg
d2hhdCBJIG1lYW50IHJlZ2FyZGluZyB0aGUgYXJjaGl0ZWN0dXJlOiB0aGVyZSBhcmUgZS5nLiBt
dWx0aXBsZQ0KPj4+Pj4+Pj4+IHNvdXJjZSBmaWxlcyBpbiBkcml2ZXJzL2NoYXIvIGJlaW5nIGJ1
aWx0IG9ubHkgZm9yIEFSTSBvciBYODYsIGluIHNwaXRlDQo+Pj4+Pj4+Pj4gb2YgYmVpbmcgbG9j
YXRlZCBvdXRzaWRlIGFyY2gvLiBBbmQgeWV0IHlvdSBkb24ndCBzZWUgdGhpcyBhcyBhIHByb2Js
ZW0sDQo+Pj4+Pj4+Pj4gZXZlbiBpZiB5b3UgYXJlIG5vdCBhYmxlIHRvIHNlbGVjdCB0aG9zZSBk
cml2ZXJzIHRvIGJlIGJ1aWx0IHdoZW4gdXNpbmcNCj4+Pj4+Pj4+PiAidGhlIG90aGVyIiBhcmNo
LiBUaGV5IGFyZSBzaWxlbnRseSBkaXNhYmxlZC4gSnVzdCBsaWtlIENFVCBpbiBjYXNlIG9mDQo+
Pj4+Pj4+Pj4gYW4gaW5jYXBhYmxlIHRvb2wgY2hhaW4uDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4g
U28gSU1PIGVpdGhlciB3ZSBiYW4gImRlcGVuZHMgb24iIGZyb20gb3VyIEtjb25maWcgZmlsZXMg
KG5vLCBJIGRvbid0DQo+Pj4+Pj4+Pj4gd2FudCB0byBkbyB0aGF0KSwgb3Igd2UgdXNlIGl0IGFz
IGRlc2lnbmVkIGFuZCBtYWtlIGl0IGFzIHVzZXIgZnJpZW5kbHkNCj4+Pj4+Pj4+PiBhcyBwb3Nz
aWJsZS4gSW4gY2FzZSB3ZSBhcyBkZXZlbG9wZXJzIGhhdmUgYSBzcGVjaWFsIHRlc3QgY2FzZSB0
aGVuIHdlDQo+Pj4+Pj4+Pj4gbmVlZCB0byBjaGVjayB0aGUgLmNvbmZpZyB3aGV0aGVyIHRoZSBk
ZXNpcmVkIHNldHRpbmdzIGFyZSByZWFsbHkNCj4+Pj4+Pj4+PiBwcmVzZW50LiBIYXZpbmcgdGhv
c2Ugc2V0dGluZ3MgZGVwZW5kaW5nIG9uIHRvb2wgY2FwYWJpbGl0aWVzIGluIGENCj4+Pj4+Pj4+
PiBzcGVjaWZpYyBmaWxlIHdpbGwgbWFrZSB0aGlzIGNoZWNrIG11Y2ggZWFzaWVyLg0KPj4+Pj4+
Pj4+IA0KPj4+Pj4+Pj4+IEFuZCBCVFcsIEkgY2FuJ3Qgc2VlIGhvdyBzZXR0aW5nIHRoZSB0b2xs
cycgY2FwYWJpbGl0aWVzIGZyb20gZS5nLg0KPj4+Pj4+Pj4+IGFyY2gveDg2L1J1bGVzLm1rIGlz
IGJldHRlciBpbiBhbnkgd2F5IChzZWUgaG93IENPTkZJR19JTkRJUkVDVF9USFVOSw0KPj4+Pj4+
Pj4+IGdvdCBpdHMgdmFsdWUgaW4gb2xkZXIgWGVuIHZlcnNpb25zIGxpa2UgNC4xMikuDQo+Pj4+
Pj4+Pj4gDQo+Pj4+Pj4+Pj4gV2UgY2FuJ3QgaGF2ZSBldmVyeXRoaW5nIGFuZCBJIGJlbGlldmUg
YXV0b21hdGljYWxseSBkaXNhYmxpbmcgZmVhdHVyZXMNCj4+Pj4+Pj4+PiB3aGljaCBjYW4ndCB3
b3JrIHdpdGggdGhlIGN1cnJlbnQgdG9vbHMgaXMgYSBzYW5lIGRlY2lzaW9uLiBEb2luZyB0aGlz
DQo+Pj4+Pj4+Pj4gdmlhIEtjb25maWcgaXMgdGhlIGJldHRlciBhcHByb2FjaCBjb21wYXJlZCB0
byBNYWtlZmlsZSBzbmlwbGV0cyBJTU8uDQo+Pj4+Pj4+PiBUaGF0IHNvdW5kcyBsaWtlIGEgbmlj
ZSBmZWF0dXJlIHRvIGhhdmUgc29tZSBjb21waWxlciBvciB0b29scyBvcHRpb25zIHRoYXQNCj4+
Pj4+Pj4+IGNhbiBiZSBzZWxlY3RlZCBvciBhY3RpdmF0ZWQgaW4gS2NvbmZpZy4gVGhlcmUgYXJl
IHNvbWUgY29tcGlsZXIgb3B0aW9ucw0KPj4+Pj4+Pj4gbWFuZGF0b3J5IHRvIGhhbmRsZSBzb21l
IGVycmF0YXMgb3IgWFNBIHRoYXQgb25lIG1pZ2h0IHdhbnQgdG8gZXhwbGljaXRlbHkNCj4+Pj4+
Pj4+IHNlbGVjdC4NCj4+Pj4+Pj4+IEkgYW0gYml0IHVuc3VyZSBhYm91dCB0aGUgcGFydCB3aGVy
ZSBzb21lIGtjb25maWcgb3B0aW9ucyB3b3VsZCBvbmx5DQo+Pj4+Pj4+PiBiZSBhdmFpbGFibGUg
b3Igbm90IGRlcGVuZGluZyBvbiBzb21lIHRlc3RzIHdpdGggdGhlIGNvbXBpbGVyIGJlaW5nIGRv
aW5nDQo+Pj4+Pj4+PiBwcmlvciB0byBvcGVuaW5nIHRoZSBlZGl0b3IuIEkgd291bGQgZ3Vlc3Mg
dGhlIG1lbnVjb25maWcgcHJvY2VzcyB3b3VsZA0KPj4+Pj4+Pj4gaGF2ZSB0byBmaXJzdCBydW4g
c29tZSB0ZXN0cyBhbmQgdGhlbiBnZW5lcmF0ZWQgc29tZSBIQVNfIGNvbmZpZ3VyYXRpb24NCj4+
Pj4+Pj4+IG9wdGlvbnMgZGVwZW5kaW5nIG9uIHRoZSByZXN1bHQgb2YgdGhlIHRlc3RzLg0KPj4+
Pj4+Pj4gRGlkIGkgZ290IHRoZSBpZGVhIHJpZ2h0IGhlcmUgPw0KPj4+Pj4+Pj4gSXMgdGhpcyBz
b21ldGhpbmcgc29tZWJvZHkgdHJpZWQgdG8gZG8gPw0KPj4+Pj4+Pj4gQXMgYSB1c2VyIEkgd291
bGQgbW9yZSBleHBlY3QgdGhhdCB0aGUgYnVpbGQgcHJvY2VzcyB3b3VsZCB0ZWxsIG1lIHRoYXQg
bXkNCj4+Pj4+Pj4+IGNvbmZpZ3VyYXRpb24gaXMgaW52YWxpZCBiZWNhdXNlIGkgc2VsZWN0ZWQg
c29tZXRoaW5nIHRoYXQgaXMgbm90IHN1cHBvcnRlZA0KPj4+Pj4+Pj4gYnkgbXkgY29tcGlsZXIu
IEkgbWlnaHQgaGF2ZSB0aGUgY2hhbmNlIHRvIGp1c3QgZml4IG15IGJ1aWxkIHRvIHVzZSB0aGUg
cmlnaHQNCj4+Pj4+Pj4+IGNvbXBpbGVyIChsaWtlIGJ5IG1pc3Rha2UgdXNpbmcgeDg2IHRvb2xj
aGFpbiB0byBjb21waWxlIGZvciBhcm0pLg0KPj4+Pj4+Pj4gV2Ugc2hvdWxkIGFsc28gYmUgY2Fy
ZWZ1bCBub3QgdG8gc2lsZW50bHkgaWdub3JlIHNvbWUgY29uZmlndXJhdGlvbiBvcHRpb24gaWYN
Cj4+Pj4+Pj4+IG9uZSBpcyBjaGFuZ2luZyB0aGUgY29tcGlsZXIgYW5kIHRoZSBuZXcgb25lIGRv
ZXMgbm90IHN1cHBvcnQgYW4gb3B0aW9uLg0KPj4+Pj4+Pj4gQSB1c2VyIHdvdWxkIGhhdmUgaGlz
IGNvbmZpZ3VyYXRpb24gYW5kIGNvbXBpbGUgdXNpbmcgaXQgd2l0aG91dA0KPj4+Pj4+Pj4gcGFz
c2luZyB0aHJvdWdoIHRoZSBlZGl0b3IgaW50ZXJmYWNlIGFuZCBtaWdodCBuZWVkIHRvIGJlIGF3
YXJlIHRoYXQgYSBwYXJ0DQo+Pj4+Pj4+PiBvZiBoaXMgY29uZmlndXJhdGlvbiBpcyBub3QgdmFs
aWQgYW55bW9yZSBiZWNhdXNlIHRoZSB0b29scyBoZSBpcyB1c2luZyBjaGFuZ2VkLg0KPj4+Pj4+
Pj4gVGhpcyBpcyBzb21ldGhpbmcgdGhhdCBjb3VsZCBvY2N1ciBhIGxvdCB3aGVuIHVzaW5nIGEg
ZGlzdHJpYnV0aW9uIHRvb2xjaGFpbi4NCj4+Pj4+Pj4+IEFsc28gdGhlcmUgYXJlIHNvbWUgY29t
cGlsZXIgb3B0aW9uIGNoYW5naW5nIHNvIGkgd291bGQgbW9yZSB0aGluayB0aGF0DQo+Pj4+Pj4+
PiB0aGVyZSBzaG91bGQgYmUgZ2VuZXJpYyBjb25maWd1cmF0aW9uIG9wdGlvbnMgc28gdGhhdCBp
biB0aGUgbWFrZWZpbGVzIHdlDQo+Pj4+Pj4+PiBjb3VsZCBoYXZlIHRoZSBvcHBvcnR1bml0eSB0
byBhZGQgZGlmZmVyZW50IGNvbXBpbGVyIG9wdGlvbnMgZm9yIGRpZmZlcmVudA0KPj4+Pj4+Pj4g
dG9vbGNoYWlucyBkZXBlbmRpbmcgb24gdGhlIHZlcnNpb24gb3IgdGhlIHR5cGUgb2YgdGhlIHRv
b2xjaGFpbi4NCj4+Pj4+Pj4+IFRvIGJlIGNsZWFyIGkgd291bGQgc2VlIHNvbWV0aGluZyBsaWtl
Og0KPj4+Pj4+Pj4gaW4ga2NvbmZpZzoNCj4+Pj4+Pj4+IENPTVBJTEVSX09QVElPTl9YWFgNCj4+
Pj4+Pj4+IAlib29sIOKAnGFjdGl2YXRlIFhYWCBjb21waWxlciBmbGFnDQo+Pj4+Pj4+PiBpbiBN
YWtlZmlsZToNCj4+Pj4+Pj4+IGlmZXEgKCQoQ09ORklHX0NPTVBJTEVSX09QVElPTl9YWFgpLCB0
cnVlKQ0KPj4+Pj4+Pj4gdGVzdF9jb21waWxlcl9jeHg6DQo+Pj4+Pj4+PiAJJChDQykgLXh4eCBk
dW1teS5jIC1vIGR1bW15IHx8ICQoZXJyb3IgWW91ciBjb21waWxlciBkb2VzIG5vdCBzdXBwb3J0
IC14eHgpDQo+Pj4+Pj4+PiBjYy1mbGFncyArPSAteHh4DQo+Pj4+Pj4+PiBlbmRpZg0KPj4+Pj4+
Pj4gVGhlIHN5bnRheCBpcyB3cm9uZyBoZXJlIGJ1dCB5b3UgZ2V0IHRoZSBpZGVhIDotKQ0KPj4+
Pj4+PiANCj4+Pj4+Pj4gQWgsIG9rYXksIHRoaXMgaXMgYW5vdGhlciBhcHByb2FjaCwgd2hpY2gg
bWlnaHQgYmUgZXZlbiBtb3JlIGZsZXhpYmxlLg0KPj4+Pj4+PiBJdCB3b3VsZCBhbGxvdyB0byBj
b250cm9sIGNvbXBpbGVyIGZsYWdzIGluc3RlYWQgb2YgbW9yZSBoaWdoIGxldmVsDQo+Pj4+Pj4+
IGZlYXR1cmVzLg0KPj4+Pj4+IFdlIG1pZ2h0IGhhdmUgYm90aCwgdGhpcyB3b3VsZCBhbHNvIGFs
bG93IHRvIGhhdmUgbW9yZSBoaWdoIGxldmVsIGZlYXR1cmVzIHdoaWNoIGFyZQ0KPj4+Pj4+IGRv
aW5nIGJvdGggYWRkaW5nIGNvbXBpbGVyIGZsYWdzIGFuZCBvdGhlciBzdHVmZiwNCj4+Pj4+Pj4g
DQo+Pj4+Pj4+IEluIGNhc2Ugd2Ugd2FudCB0byBnbyB0aGF0IHJvdXRlIHdlIHNob3VsZCBkZWZh
dWx0IENPTVBJTEVSX09QVElPTl9YWFgNCj4+Pj4+Pj4gdG8gdGhlIGN1cnJlbnQgdG9vbCBjYXBh
YmlsaXRpZXMgaW4gb3JkZXIgdG8gYXZvaWQgbG9uZ2VyIHRyeS1hbmQtZXJyb3INCj4+Pj4+Pj4g
bG9vcHMuDQo+Pj4+Pj4gSSBhbSBub3QgcXVpdGUgc3VyZSBob3cgeW91IHdhbnQgdG8gYWNoaWV2
ZSB0aGlzIGNsZWFubHkuDQo+Pj4+PiANCj4+Pj4+IFNvbWV0aGluZyBsaWtlIChwaWNrZWQgYW4g
YWN0dWFsIGV4YW1wbGUgZnJvbSB4ODYpOg0KPj4+Pj4gDQo+Pj4+PiBjb25maWcgSEFTX0NPTVBJ
TEVSX09QVElPTl9JQlINCj4+Pj4+IAlib29sICJTZWxlY3QgY29tcGlsZXIgb3B0aW9uIC1taW5k
aXJlY3QtYnJhbmNoLXJlZ2lzdGVyIg0KPj4+Pj4gCWRlZmF1bHQgJChjYy1vcHRpb24sLW1pbmRp
cmVjdC1icmFuY2gtcmVnaXN0ZXIpDQo+Pj4+PiAJICBibGFoIGJsYWggYmxhaA0KPj4+Pj4gDQo+
Pj4+IE5pY2UgOi0pDQo+Pj4+IERlZmluaXRlbHkgaSB3b3VsZCBhZGQgYSDigJxkZWZhdWx0IHkg
aWYgRVhQRVJU4oCdIG9yIHNvbWV0aGluZyBlcXVpdmFsZW50Lg0KPj4+IA0KPj4+IFVoLCByYXRo
ZXIgbm90LiBJIGFzIGEgZGV2ZWxvcGVyIGRvbid0IHdhbnQgdG8gaGF2ZSBjaGFuZ2UgdGhlIGNv
bmZpZw0KPj4+IG1hbnVhbGx5IGp1c3QgYmVjYXVzZSBhIG5ldyBIQVNfQ09NUElMRVJfT1BUSU9O
XyBoYXMgYmVlbiBhZGRlZCBteSB0b29scw0KPj4+IGRvbid0IHVuZGVyc3RhbmQgKHlldCkuIFRo
ZSBkZWZhdWx0IGFjdGlvbiBzaG91bGQgcmVxdWlyZSBubyB1c2VyDQo+Pj4gaW50ZXJ2ZW50aW9u
LCBldmVuIGFzIGV4cGVydC4NCj4+IEkgYWdyZWUgd2l0aCB0aGUgYXJndW1lbnQuDQo+PiBNYXli
ZSB3ZSBjb3VsZCBoYXZlIGFuIG90aGVyIG9wdGlvbiBsaWtlIERJU0FCTEVfQ09NUElMRVJfQ0hF
Q0sgZm9yIHRoaXMuDQo+PiBJIHdvdWxkIHJhdGhlciBoYXZlIG15IHRlc3Qgc3lzdGVtIGZhaWwg
d2l0aCBhIG1ha2UgZXJyb3IgYnkgc2V0dGluZyB0aGlzIHRoZW4gc2lsZW50bHkNCj4+IGRpc2Nh
cmQgdGhlIG9wdGlvbiBpZiBteSBjb21waWxlciBpcyBtb2RpZmllZC4NCj4gDQo+IEJ1dCB0aGlz
IHdvdWxkIGV4YWN0bHkgYmUgdGhlIGJlaGF2aW9yLg0KPiANCj4gQSBuZXcgSEFTX0NPTVBJTEVS
X09QVElPTl8gYWRkZWQgd291bGQgZGVmYXVsdCB0byB5b3VyIHRvb2wgY2FwYWJpbGl0aWVzDQo+
IGFuZCB5b3UgY291bGQgY2hhbmdlIGl0IG1hbnVhbGx5IGFmdGVyd2FyZHMuIElmIHlvdSBjaGFu
Z2UgaXQgdG8gInkiIGluDQo+IHNwaXRlIG9mIHlvdXIgdG9vbHMgbm90IHN1cHBvcnRpbmcgaXQg
dGhlIGJ1aWxkIHdvdWxkIGZhaWwuIEFuZCBpZiBpdA0KPiB3b3VsZCBiZSAieSIgcGVyIGRlZmF1
bHQgaW5pdGlhbGx5IHRoZSAuY29uZmlnIGZpbGUgd291bGQgYmUgY3JlYXRlZA0KPiB3aXRoIHRo
ZSBvcHRpb24gZW5hYmxlZCwgc28gYSB0b29sIGNoYW5nZSByZW1vdmluZyBzdXBwb3J0IG9mIHRo
ZSBvcHRpb24NCj4gd291bGQgcmVzdWx0IGluIGEgZmFpbGVkIGJ1aWxkLCB0b28uDQo+IA0KDQpN
YWtlIHNlbnNlLCBpdCBzZWVtcyBpIGRpZCBub3QgdGhpbmsgdGhhdCB0aHJvdWdoIDotKQ0KU28g
dGhhdCB3b3JrcyBmb3IgbWUuDQoNCkJlcnRyYW5kDQoNCg==

