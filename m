Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30E5223C97
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 15:28:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwQPZ-0000un-Uf; Fri, 17 Jul 2020 13:28:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XmQz=A4=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1jwQPY-0000ui-9s
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 13:28:24 +0000
X-Inumbo-ID: 62943b7e-c831-11ea-8496-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.80]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62943b7e-c831-11ea-8496-bc764e2007e4;
 Fri, 17 Jul 2020 13:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8/Kziu+oSoJnQr/G2G+fkiXFcIjx2GdzkhMcZYaIqs=;
 b=cxLbzFY0EkhLT7gvHkTqbRXAZIb4gPWjqZdK3XUOy2VrUUibttjiOktq6rCZ9MEDHS03UzZPsI/yL+FXKZ3dgYF2lNXlT3rNLfwysW0muc5S9GcicAkdA1yhc2B2lgV6Ep3H0zjuYWs3DKq2IJkKcqKt2u4I6gncX6a0u3p4PYc=
Received: from AM6P195CA0088.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::29)
 by DB8PR08MB5274.eurprd08.prod.outlook.com (2603:10a6:10:e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 13:28:20 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::51) by AM6P195CA0088.outlook.office365.com
 (2603:10a6:209:86::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Fri, 17 Jul 2020 13:28:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 13:28:20 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62");
 Fri, 17 Jul 2020 13:28:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7dc5ccf220848c6
X-CR-MTA-TID: 64aa7808
Received: from c4f37c6d5811.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 21CD6BA2-EAE3-4384-894A-27A5E8BF1E6E.1; 
 Fri, 17 Jul 2020 13:28:14 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c4f37c6d5811.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jul 2020 13:28:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mK1YdXahLQaL2y2K4hoSgh7DUnpNFpXuIxrcan0w77sNgh6H8+bi2fmvLiU7NwlipErv+Qxx5dyw08mnBb+/EgtVtxF3kRA3VoDaVIV0Qldl4vwKiJRgPm9gfUWdPo8eE7hri/27Q95u5VVpCdRWqavUGCGHVZVbSnfuLCGsXRWRQzNprQ4lzaoA4lMEnKIS+IOEpTwSFgfL/L5PiQFCwyT8ejvLxlzn8bkzDOenAYCzP3Go8D+RZThs1uKzaxwPmZXDXOuToPyrTssRdITSfjKEU9HzQLrlhFnGiNKyflBde9Ia83InrgOFNHzlEgJRZ3fCzNFCNkarx+hp0oPXxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8/Kziu+oSoJnQr/G2G+fkiXFcIjx2GdzkhMcZYaIqs=;
 b=FjhiU1yfYFtPONEoqBtpnn6OB/5rZW8Z+Lc7TtUUkwCPN7Rut6X83+r6zuwKgn8dcTwRIw1UPb2mu+TR1uc4LKZ3ZbiQZIjCjokxoRjdXnUUS5Rv9T6Dy7G3/0qpxDu+/NnM1tAx0JZHZnYHZvrDlZEPqZlyAvRsI80lQn1isEC5VKN9ZTsgE5lEWazcIvtmg3SreUSh0URpp/oJuZ1zLrBg1Hqn1cMOnighqxXbHMqVbxYvZQurKSfV0oSMb+ufa0F1hzdxpM9pZdKVxRc857J2jO5QZQ1brNlOYnILh3KoUW5GLbH2eAsc/kGMLsYb0n7wG4kauWRa5Nvog5vPLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8/Kziu+oSoJnQr/G2G+fkiXFcIjx2GdzkhMcZYaIqs=;
 b=cxLbzFY0EkhLT7gvHkTqbRXAZIb4gPWjqZdK3XUOy2VrUUibttjiOktq6rCZ9MEDHS03UzZPsI/yL+FXKZ3dgYF2lNXlT3rNLfwysW0muc5S9GcicAkdA1yhc2B2lgV6Ep3H0zjuYWs3DKq2IJkKcqKt2u4I6gncX6a0u3p4PYc=
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com (20.177.115.19) by
 AM6PR08MB4184.eurprd08.prod.outlook.com (20.178.87.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21; Fri, 17 Jul 2020 13:28:12 +0000
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5]) by AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5%6]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 13:28:12 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAACLICAAOrEgIAACn+AgABOT4A=
Date: Fri, 17 Jul 2020 13:28:12 +0000
Message-ID: <B16BB290-7BE6-49C0-8705-9F21257E6B6B@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
 <6b4cadff-ffdc-848a-2b57-be55f61f5bc7@gmail.com>
In-Reply-To: <6b4cadff-ffdc-848a-2b57-be55f61f5bc7@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6176bc5f-d96a-4f3c-b9b0-08d82a5545c0
x-ms-traffictypediagnostic: AM6PR08MB4184:|DB8PR08MB5274:
X-Microsoft-Antispam-PRVS: <DB8PR08MB527495827EF940C4C2590866FC7C0@DB8PR08MB5274.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: EG+8KJTlgaCTRA3L+cNOQRN8cdNQzaNoLQzeTwbHgzPzC1VeiebLMkg74ve/e8nJ+wHs33agu1VlOSiFNn0p09D3VNgLJLvkn2vNuAamTpj8I0I5hCyLifs7w43H+zcP4XkrvxT/xNVoL4kG778GcRoX1CgmjGIaAlq3cpxmw/H6+ILzfAguB8+agN5CLXFdjdtmke0rSpCMchSr+ybT/+lKDpNx94qWMmQrQM9X0dLf0kDuhAukRRJg3W0BuMIyo6wq7W1KNIJMKMk5NfGaZ/tnZLVnPzj4sJcm4ROgTAWVnZRec+s4spvx8O8U3d+HIlyPUxiBX7zmBTHvKAVJrg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(55236004)(478600001)(4326008)(91956017)(76116006)(6512007)(33656002)(2616005)(83380400001)(5660300002)(86362001)(53546011)(54906003)(8936002)(71200400001)(316002)(186003)(8676002)(26005)(6506007)(6916009)(6486002)(36756003)(2906002)(66476007)(66556008)(64756008)(66446008)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: htMK4h8kSJm0CHs88H5ca3qMezyB2yodza0OMlNN25rs/iFobPNnrB3agBvvtmd3rZu807QYqeF15SOqu19Vtu1sMGW6IqcUgSEVJP72a+bFx4MvHrEQncVxowDthyEIAiBVGdFSHUEwNMNJnKzqyiq3apLQFAO8dpKqO+x6xKxLWktBwDaGDC23hTZuK3QL68jJljjk+pYyWpNe9YE6wASr0LtzFAEOCYkatzq0v7xFVGXiKR6kodTSGiOYFa00L9XljTwDzcjaWLd3R68xU3bQCDMlJodDaXuurgMAp2NsggHDWdSCl0sASsdsx2WN1Zf6FBelm8BpKAGQihwmvzRQYoNs18VgxcRvWjEqK7Bkbi13OzpNRPe8xpmMk02pNegzqqUFxulPrT9qW7Aqin9fWW/Nst1ImHQ9LZ64fN0qub4ogAWdEnVd1la0MrtNPYkmYjTnPAlUQcfeyyxkFcxivnKhI8y/ddjsIi4Z0zA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9B61D33F4C87C42B491F13830EF1290@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4184
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(107886003)(6512007)(82740400003)(336012)(86362001)(36906005)(70586007)(316002)(2616005)(6486002)(82310400002)(53546011)(6506007)(478600001)(81166007)(6862004)(5660300002)(186003)(47076004)(8676002)(4326008)(36756003)(8936002)(26005)(54906003)(70206006)(83380400001)(33656002)(356005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c814cce5-73b6-41e3-a4e2-08d82a554109
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LFHwlzMKy3hFmgI+BpTazTBdlksqF+A0nthx02+8GrcwrvSJMjFsqysCNK04ScXb/oiz2MXomCQY0/CWkEHY8mcXOCE/2cPwe8DVb/HQPf0yUCUo/KxpBzwzI7z7WL4ecsJbY2zoeZgkWLxH5o1rR4kMb/kIk31pYBp1nhVkUiGMH+t1mnQKCoWcEvlikpDoN5yiJJZItzp2AR42qBVPcgb5OD7DCTvLk25O+ubyCVQxspAz38cbfqI0RRkXWPSBnt/Rbn3PiDg2oLKr9obk2c9BDY/rVYgx1coFMoZ7Hj3Ef9gTCtl+LjIaWvFDMDr+jbP2QANq8OG82Z0ex0/VN+F/13pHFZ+0MDT3/BOxqTI/ELlFoBuOVzYvt2fI/x4/q4V7P85S/HUTwP1rNTlgCg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 13:28:20.3146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6176bc5f-d96a-4f3c-b9b0-08d82a5545c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5274
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTcgSnVsIDIwMjAsIGF0IDk6NDcgYW0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IDxhbmRyMjAwMEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IE9uIDcvMTcvMjAgMTE6MTAg
QU0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMTYuMDcuMjAyMCAxOToxMCwgUmFodWwgU2lu
Z2ggd3JvdGU6DQo+Pj4gIyBEaXNjb3ZlcmluZyBQQ0kgZGV2aWNlczoNCj4+PiANCj4+PiBQQ0kt
UENJZSBlbnVtZXJhdGlvbiBpcyBhIHByb2Nlc3Mgb2YgZGV0ZWN0aW5nIGRldmljZXMgY29ubmVj
dGVkIHRvIGl0cyBob3N0LiBJdCBpcyB0aGUgcmVzcG9uc2liaWxpdHkgb2YgdGhlIGhhcmR3YXJl
IGRvbWFpbiBvciBib290IGZpcm13YXJlIHRvIGRvIHRoZSBQQ0kgZW51bWVyYXRpb24gYW5kIGNv
bmZpZ3VyZSB0aGUgQkFSLCBQQ0kgY2FwYWJpbGl0aWVzLCBhbmQgTVNJL01TSS1YIGNvbmZpZ3Vy
YXRpb24uDQo+Pj4gDQo+Pj4gUENJLVBDSWUgZW51bWVyYXRpb24gaW4gWEVOIGlzIG5vdCBmZWFz
aWJsZSBmb3IgdGhlIGNvbmZpZ3VyYXRpb24gcGFydCBhcyBpdCB3b3VsZCByZXF1aXJlIGEgbG90
IG9mIGNvZGUgaW5zaWRlIFhlbiB3aGljaCB3b3VsZCByZXF1aXJlIGEgbG90IG9mIG1haW50ZW5h
bmNlLiBBZGRlZCB0byB0aGlzIG1hbnkgcGxhdGZvcm1zIHJlcXVpcmUgc29tZSBxdWlya3MgaW4g
dGhhdCBwYXJ0IG9mIHRoZSBQQ0kgY29kZSB3aGljaCB3b3VsZCBncmVhdGx5IGltcHJvdmUgWGVu
IGNvbXBsZXhpdHkuIE9uY2UgaGFyZHdhcmUgZG9tYWluIGVudW1lcmF0ZXMgdGhlIGRldmljZSB0
aGVuIGl0IHdpbGwgY29tbXVuaWNhdGUgdG8gWEVOIHZpYSB0aGUgYmVsb3cgaHlwZXJjYWxsLg0K
Pj4+IA0KPj4+ICNkZWZpbmUgUEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRkICAgICAgICAyNQ0KPj4+
IHN0cnVjdCBwaHlzZGV2X3BjaV9kZXZpY2VfYWRkIHsNCj4+PiAgICAgdWludDE2X3Qgc2VnOw0K
Pj4+ICAgICB1aW50OF90IGJ1czsNCj4+PiAgICAgdWludDhfdCBkZXZmbjsNCj4+PiAgICAgdWlu
dDMyX3QgZmxhZ3M7DQo+Pj4gICAgIHN0cnVjdCB7DQo+Pj4gICAgIAl1aW50OF90IGJ1czsNCj4+
PiAgICAgCXVpbnQ4X3QgZGV2Zm47DQo+Pj4gICAgIH0gcGh5c2ZuOw0KPj4+ICAgICAvKg0KPj4+
ICAgICAqIE9wdGlvbmFsIHBhcmFtZXRlcnMgYXJyYXkuDQo+Pj4gICAgICogRmlyc3QgZWxlbWVu
dCAoWzBdKSBpcyBQWE0gZG9tYWluIGFzc29jaWF0ZWQgd2l0aCB0aGUgZGV2aWNlIChpZiAqIFhF
Tl9QQ0lfREVWX1BYTSBpcyBzZXQpDQo+Pj4gICAgICovDQo+Pj4gICAgIHVpbnQzMl90IG9wdGFy
cltYRU5fRkxFWF9BUlJBWV9ESU1dOw0KPj4+ICAgICB9Ow0KPj4+IA0KPj4+IEFzIHRoZSBoeXBl
cmNhbGwgYXJndW1lbnQgaGFzIHRoZSBQQ0kgc2VnbWVudCBudW1iZXIsIFhFTiB3aWxsIGFjY2Vz
cyB0aGUgUENJIGNvbmZpZyBzcGFjZSBiYXNlZCBvbiB0aGlzIHNlZ21lbnQgbnVtYmVyIGFuZCBm
aW5kIHRoZSBob3N0LWJyaWRnZSBjb3JyZXNwb25kaW5nIHRvIHRoaXMgc2VnbWVudCBudW1iZXIu
IEF0IHRoaXMgc3RhZ2UgaG9zdCBicmlkZ2UgaXMgZnVsbHkgaW5pdGlhbGl6ZWQgc28gdGhlcmUg
d2lsbCBiZSBubyBpc3N1ZSB0byBhY2Nlc3MgdGhlIGNvbmZpZyBzcGFjZS4NCj4+PiANCj4+PiBY
RU4gd2lsbCBhZGQgdGhlIFBDSSBkZXZpY2VzIGluIHRoZSBsaW5rZWQgbGlzdCBtYWludGFpbiBp
biBYRU4gdXNpbmcgdGhlIGZ1bmN0aW9uIHBjaV9hZGRfZGV2aWNlKCkuIFhFTiB3aWxsIGJlIGF3
YXJlIG9mIGFsbCB0aGUgUENJIGRldmljZXMgb24gdGhlIHN5c3RlbSBhbmQgYWxsIHRoZSBkZXZp
Y2Ugd2lsbCBiZSBhZGRlZCB0byB0aGUgaGFyZHdhcmUgZG9tYWluLg0KPj4gSGF2ZSB5b3UgaGFk
IGFueSB0aG91Z2h0cyBhYm91dCBEb20wIHJlLWFycmFuZ2luZyB0aGUgYnVzIG51bWJlcmluZz8N
Cj4+IFRoaXMgaXMsIGFmYWljdCwgYSBzdGlsbCBvcGVuIGlzc3VlIG9uIHg4NiBhcyB3ZWxsLg0K
PiANCj4gVGhpcyBjYW4gZ2V0IGV2ZW4gdHJpY2tpZXIgYXMgd2UgbWF5IGhhdmUgUENJIGVudW1l
cmF0ZWQgYXQgYm9vdCB0aW1lDQo+IA0KPiBieSB0aGUgZmlybXdhcmUgYW5kIHRoZW4gRG9tMCBt
YXkgcGVyZm9ybSB0aGUgZW51bWVyYXRpb24gZGlmZmVyZW50bHkuDQo+IA0KPiBTbywgWGVuIG5l
ZWRzIHRvIGJlIGF3YXJlIG9mIHdoYXQgaXMgZ29pbmcgdG8gYmUgdXNlZCBhcyB0aGUgc291cmNl
IG9mIHRoZQ0KPiANCj4gZW51bWVyYXRpb24gZGF0YSBhbmQgYmUgcmVhZHkgdG8gcmUtYnVpbGQg
aXRzIGludGVybmFsIHN0cnVjdHVyZXMgaW4gb3JkZXINCj4gDQo+IHRvIGJlIGFsaWduZWQgd2l0
aCB0aGF0IGVudGl0eTogZS5nLiBjb21wYXJlIERvbTAgYW5kIERvbTBsZXNzIHVzZS1jYXNlcw0K
PiANCg0KVGhlIGlkZWEgaXMgdGhhdCBhcyBzb29uIGFzIFhlbiBoYXMgZG9uZSBoaXMgZW51bWVy
YXRpb24gKGl0IGJlaW5nIG9uIGJvb3Qgb3IgYWZ0ZXIgRG9tMCBzaWduYWwpLCBubyBkb21haW4g
d2lsbCBiZSBhYmxlIHRvIG1vZGlmeSB0aGUgcGh5c2ljYWwgUENJIGJ1cyBhbnltb3JlLiANCi0g
UmFodWwNCj4+IA0KPj4+IExpbWl0YXRpb25zOg0KPj4+ICogV2hlbiBQQ0kgZGV2aWNlcyBhcmUg
YWRkZWQgdG8gWEVOLCBNU0kgY2FwYWJpbGl0eSBpcyBub3QgaW5pdGlhbGl6ZWQgaW5zaWRlIFhF
TiBhbmQgbm90IHN1cHBvcnRlZCBhcyBvZiBub3cuDQo+PiBJIHRoaW5rIHRoaXMgaXMgYSBwcmV0
dHkgc2V2ZXJlIGxpbWl0YXRpb24sIGFzIG1vZGVybiBkZXZpY2VzIHRlbmQgdG8NCj4+IG5vdCBz
dXBwb3J0IHBpbiBiYXNlZCBpbnRlcnJ1cHRzIGFueW1vcmUuDQo+PiANCj4+PiAjIEVtdWxhdGVk
IFBDSSBkZXZpY2UgdHJlZSBub2RlIGluIGxpYnhsOg0KPj4+IA0KPj4+IExpYnhsIGlzIGNyZWF0
aW5nIGEgdmlydHVhbCBQQ0kgZGV2aWNlIHRyZWUgbm9kZSBpbiB0aGUgZGV2aWNlIHRyZWUgdG8g
ZW5hYmxlIHRoZSBndWVzdCBPUyB0byBkaXNjb3ZlciB0aGUgdmlydHVhbCBQQ0kgZHVyaW5nIGd1
ZXN0IGJvb3QuIFdlIGludHJvZHVjZWQgdGhlIG5ldyBjb25maWcgb3B0aW9uIFt2cGNpPSJwY2lf
ZWNhbSJdIGZvciBndWVzdHMuIFdoZW4gdGhpcyBjb25maWcgb3B0aW9uIGlzIGVuYWJsZWQgaW4g
YSBndWVzdCBjb25maWd1cmF0aW9uLCBhIFBDSSBkZXZpY2UgdHJlZSBub2RlIHdpbGwgYmUgY3Jl
YXRlZCBpbiB0aGUgZ3Vlc3QgZGV2aWNlIHRyZWUuDQo+PiBJIHN1cHBvcnQgU3RlZmFubydzIHN1
Z2dlc3Rpb24gZm9yIHRoaXMgdG8gYmUgYW4gb3B0aW9uYWwgdGhpbmcsIGkuZS4NCj4+IHRoZXJl
IHRvIGJlIG5vIG5lZWQgZm9yIGl0IHdoZW4gdGhlcmUgYXJlIFBDSSBkZXZpY2VzIGFzc2lnbmVk
IHRvIHRoZQ0KPj4gZ3Vlc3QgYW55d2F5LiBJIGFsc28gd29uZGVyIGFib3V0IHRoZSBwY2lfIHBy
ZWZpeCBoZXJlIC0gaXNuJ3QNCj4+IHZwY2k9ImVjYW0iIGFzIHVuYW1iaWd1b3VzPw0KPj4gDQo+
Pj4gQSBuZXcgYXJlYSBoYXMgYmVlbiByZXNlcnZlZCBpbiB0aGUgYXJtIGd1ZXN0IHBoeXNpY2Fs
IG1hcCBhdCB3aGljaCB0aGUgVlBDSSBidXMgaXMgZGVjbGFyZWQgaW4gdGhlIGRldmljZSB0cmVl
IChyZWcgYW5kIHJhbmdlcyBwYXJhbWV0ZXJzIG9mIHRoZSBub2RlKS4gQSB0cmFwIGhhbmRsZXIg
Zm9yIHRoZSBQQ0kgRUNBTSBhY2Nlc3MgZnJvbSBndWVzdCBoYXMgYmVlbiByZWdpc3RlcmVkIGF0
IHRoZSBkZWZpbmVkIGFkZHJlc3MgYW5kIHJlZGlyZWN0cyByZXF1ZXN0cyB0byB0aGUgVlBDSSBk
cml2ZXIgaW4gWGVuLg0KPj4+IA0KPj4+IExpbWl0YXRpb246DQo+Pj4gKiBPbmx5IG9uZSBQQ0kg
ZGV2aWNlIHRyZWUgbm9kZSBpcyBzdXBwb3J0ZWQgYXMgb2Ygbm93Lg0KPj4+IA0KPj4+IEJBUiB2
YWx1ZSBhbmQgSU9NRU0gbWFwcGluZzoNCj4+PiANCj4+PiBMaW51eCBndWVzdCB3aWxsIGRvIHRo
ZSBQQ0kgZW51bWVyYXRpb24gYmFzZWQgb24gdGhlIGFyZWEgcmVzZXJ2ZWQgZm9yIEVDQU0gYW5k
IElPTUVNIHJhbmdlcyBpbiB0aGUgVlBDSSBkZXZpY2UgdHJlZSBub2RlLiBPbmNlIFBDSQlkZXZp
Y2UgaXMgYXNzaWduZWQgdG8gdGhlIGd1ZXN0LCBYRU4gd2lsbCBtYXAgdGhlIGd1ZXN0IFBDSSBJ
T01FTSByZWdpb24gdG8gdGhlIHJlYWwgcGh5c2ljYWwgSU9NRU0gcmVnaW9uIG9ubHkgZm9yIHRo
ZSBhc3NpZ25lZCBkZXZpY2VzLg0KPj4+IA0KPj4+IEFzIG9mIG5vdyB3ZSBoYXZlIG5vdCBtb2Rp
ZmllZCB0aGUgZXhpc3RpbmcgVlBDSSBjb2RlIHRvIG1hcCB0aGUgZ3Vlc3QgUENJIElPTUVNIHJl
Z2lvbiB0byB0aGUgcmVhbCBwaHlzaWNhbCBJT01FTSByZWdpb24uIFdlIHVzZWQgdGhlIGV4aXN0
aW5nIGd1ZXN0IOKAnGlvbWVt4oCdIGNvbmZpZyBvcHRpb24gdG8gbWFwIHRoZSByZWdpb24uDQo+
Pj4gRm9yIGV4YW1wbGU6DQo+Pj4gCUd1ZXN0IHJlc2VydmVkIElPTUVNIHJlZ2lvbjogIDB4MDQw
MjAwMDANCj4+PiAgICAgCVJlYWwgcGh5c2ljYWwgSU9NRU0gcmVnaW9uOjB4NTAwMDAwMDANCj4+
PiAgICAgCUlPTUVNIHNpemU6MTI4TUINCj4+PiAgICAgCWlvbWVtIGNvbmZpZyB3aWxsIGJlOiAg
IGlvbWVtID0gWyIweDUwMDAwLDB4ODAwMEAweDQwMjAiXQ0KPj4gVGhpcyBzdXJlbHkgaXMgcGxh
bm5lZCB0byBnbyBhd2F5IGJlZm9yZSB0aGUgY29kZSBoaXRzIHVwc3RyZWFtPyBUaGUNCj4+IHJh
bmdlcyByZWFsbHkgc2hvdWxkIGJlIHJlYWQgb3V0IG9mIHRoZSBCQVJzLCBhcyBJIHNlZSB0aGUN
Cj4+ICJsaW1pdGF0aW9ucyIgc2VjdGlvbiBmdXJ0aGVyIGRvd24gc3VnZ2VzdHMsIGJ1dCBpdCdz
IG5vdCBjbGVhcg0KPj4gd2hldGhlciAibGltaXRhdGlvbnMiIGFyZSBpdGVtcyB0aGF0IHlvdSBw
bGFuIHRvIHRha2UgY2FyZSBvZiBiZWZvcmUNCj4+IHN1Ym1pdHRpbmcgeW91ciBjb2RlIGZvciBy
ZXZpZXcuDQo+PiANCj4+IEphbg0KDQo=

