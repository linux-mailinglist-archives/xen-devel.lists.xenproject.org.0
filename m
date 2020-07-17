Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A961223F6F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 17:24:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwSDa-0004bB-Fh; Fri, 17 Jul 2020 15:24:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdYj=A4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jwSDZ-0004b5-2L
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 15:24:09 +0000
X-Inumbo-ID: 8d84c9b1-c841-11ea-9628-12813bfff9fa
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.51]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d84c9b1-c841-11ea-9628-12813bfff9fa;
 Fri, 17 Jul 2020 15:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQXfMS2KW1AADi+PJHjBZrW/DpIYPlu2qSbWsw15YUc=;
 b=ZD1sbznfnZw6H8At2GYHK/O9GS8gQznPT7pCg/ZMeyGGGpScf9qf2DX36lED41SO1a/MOUqL+WHs0AWtkoRWsCF4No0toyHYosn6Bu/L2iuWvofRa48CETlgRv+CGhHDADjG0aX+lKYDsFbX+ksPyimzOL0QWHVTuzP7sqRrk5E=
Received: from AM6P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::25)
 by AM6PR08MB5096.eurprd08.prod.outlook.com (2603:10a6:20b:ee::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Fri, 17 Jul
 2020 15:24:06 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::38) by AM6P192CA0012.outlook.office365.com
 (2603:10a6:209:83::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Fri, 17 Jul 2020 15:24:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 15:24:05 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62");
 Fri, 17 Jul 2020 15:24:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 052dad7aa9d28e7a
X-CR-MTA-TID: 64aa7808
Received: from c2e377230dd1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 690F5022-0D11-44D5-87D4-A278D6501B51.1; 
 Fri, 17 Jul 2020 15:23:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c2e377230dd1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jul 2020 15:23:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERgZECdtXeE/ev1npsA0KXvLGHkT2vVVEOJefmth1OJdjNbAuujXCGkXAJBh/DAR64wab5jpo2UuRzgj3gRRcEr8cZhV1ZBZRC7T8owzppJ43HhLzx2RMv0Wa8ydlhN9+OcL4hvdZSMTV0fFy/CDHicBBhdjV1CY17x2klhf85cPn/X+UPMMZyZ96CNyp4i2nmJXtv+vYBRnbF5vqqu+6W01azkfRWibHaIu6fYPWUmfwuuHThItVswrKAUaXblEBTHIXhcT3NTqkiy0GGvd0s4BsksA7H2lxqLAcaS9MNwc7T+3tFjh/rdkyeFn7DhzXpyIjvVrpqDpW46BwkGMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQXfMS2KW1AADi+PJHjBZrW/DpIYPlu2qSbWsw15YUc=;
 b=avt25V3DMCtlznBUv3mEyYiAHOLLGo7fAjMT0MfLWoV/Cs20j+cLj+RgThsLHt+iDArgH+I6ZR9VOyGxViITrMsvrrp0qIgK0ikC3ccnQI4+OZtdQtgqQxSVLD6xms3ynY2AhyyhVC4+bC8JN0AUm1aNe+VxlDx8th+UhEF9NhX+tAZ56D2cJpbnqAeYNBPgT7HW7EaF+ev3ejL5wlkRMbMuDHKpN7qk8Et+gj4emT92naZ4LWhXoixyycdInw2hutUFj0sK2pcut2IlgJ4dupOPyQLkqZhoR26rqh+2n2pwoPj2oNtJ4IW0REuDTDEv+TF4+/5Whbwt3i3PaAjvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQXfMS2KW1AADi+PJHjBZrW/DpIYPlu2qSbWsw15YUc=;
 b=ZD1sbznfnZw6H8At2GYHK/O9GS8gQznPT7pCg/ZMeyGGGpScf9qf2DX36lED41SO1a/MOUqL+WHs0AWtkoRWsCF4No0toyHYosn6Bu/L2iuWvofRa48CETlgRv+CGhHDADjG0aX+lKYDsFbX+ksPyimzOL0QWHVTuzP7sqRrk5E=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4252.eurprd08.prod.outlook.com (2603:10a6:10:c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Fri, 17 Jul
 2020 15:23:58 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.028; Fri, 17 Jul 2020
 15:23:57 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAACLICAAOrEgIAAVPWAgAABeYCAAAssAIAAAcuAgAAIDQCAAAHigIAAAiYAgAAEaYCAAAVDgA==
Date: Fri, 17 Jul 2020 15:23:57 +0000
Message-ID: <FBE040A9-D088-43D6-8929-FFEDE9DDDE34@arm.com>
References: <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
 <28899FEF-9DA7-4513-8283-1AC5EFFC6E92@arm.com>
 <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
 <F09F9354-EC9B-4D76-809B-A25AF4F7D863@arm.com>
 <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
 <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
 <20200717144139.GU7191@Air-de-Roger>
 <90AE8DAB-2223-46DC-A263-D78365E5435E@arm.com>
 <20200717150507.GW7191@Air-de-Roger>
In-Reply-To: <20200717150507.GW7191@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [91.160.77.188]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07502eee-cd8e-4c1c-5ae8-08d82a657181
x-ms-traffictypediagnostic: DBBPR08MB4252:|AM6PR08MB5096:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50966C65CCCA836BCE7C7DB79D7C0@AM6PR08MB5096.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 7D56bkVGwbp/gVbS47FZu0owaOGKIK/a/MZvNK9w7X698cPtF/OeqMQ8OTuq/TwMWTwV0vvwtrghGaOYMrhOee6hoOOuTswlFeN+QfxEIzV6bw1iNrWRUBYiTsPQW1DiN2hUaet/O2aNTpqdkeR3ZNx5aeyhFNa6yH6uWPtU0A5byX1Rhukuiaj1VNMViVGSbuk6THjTUx1fa0VS/mQ5s9T2Ap++n/a8zwjyfFbl9azWHkKb02ibPkBqPeuZZgLibfLPCScGdV5O/e5WNLqEIGYQxwfU3cyZKiMo9p3fE9X/RkU+Y8tJRQYx359g/8jrvmTdL1qGylo0PWVTe4MO9w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(71200400001)(5660300002)(86362001)(6512007)(8676002)(36756003)(6486002)(76116006)(2906002)(4326008)(66446008)(64756008)(66556008)(66476007)(91956017)(478600001)(6916009)(186003)(26005)(53546011)(6506007)(33656002)(8936002)(66946007)(316002)(54906003)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: mmLppnV5t43n6CKx2u/JF+H4qCnzD/VKXT87IoZ+6JeWiZg863r7eqBdzZk19bNq7RO52eyW/gaAdBR6fwOeA20Lnrb7vUgRKgUgTKHup5OKnlyP+FdrKu4314vfsVpWcNgw8Bt8+AWJOvYRSffB8T2fEeLobw9vGMfnXCqQNCQXhZZgUewYcIqjh50Y9DMRgGMQ6E7Ali7nEOnXKrZhLTY+R1OiBFwbYiz94bj6Zs8S2MQcAzbpnVJ4ucscaST1n0ZFKE9Hs2vEhttNiIJDx9dlOaUrmAkIO+/j+IHsXpR2AhDgrbw9dEYHb/sprarPZkvrfkZ4syhft9nBoHqz9b+iBIS6thelC8fbwHgNAej1EIXrOsRtC0+Zum0tGwtxesa8Ukk2HnZJEeUjpnaIjlfnpyW5nANgUzOirf1cLa25PRGjt/NhJseMyOQHTcYdpl2/TmO70TCnDCepTM4wwdT3ks2G/pQPde9WtKi5VMHo20QYMAFZ4IxJ7DfMH0Yq
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF45369944101648BFB587DE01F25047@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4252
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966005)(82740400003)(4326008)(47076004)(316002)(6512007)(36906005)(36756003)(82310400002)(81166007)(356005)(54906003)(86362001)(70586007)(70206006)(8936002)(8676002)(107886003)(6862004)(186003)(2616005)(6486002)(53546011)(6506007)(5660300002)(478600001)(26005)(336012)(2906002)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d7db6088-ab93-4653-7b51-08d82a656ce1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cbU2yaLOG0+MGfIq0yx4TIGgVUuzHQIuq4k5YhiTiLK0dMSvCKuy34u0caWQEtP09tuNaMp8sdaSHiYV+vJKr+Yo2soHfdBNj7VMOHl92ILaKgWLpzF9avYb1OjffRuIgA99ALv+Vxfxkz1K2LTTAR3+dMNF3HB+cHOrJwQALQamyDgN1evInhLeMvg1haxaN/udvX0pD/fpoxIOYbGFwh09E7jSC5hDfJxqLezhkhPJSIU1vbtphb/gz+bLxayrwQ+wgXcAFIUzsIq7r3j5m3yKFgxodj+qeAqqT/8x13VNKBQDlEJcUmV9WEcDFxe5mTHRC+4b0sjHvU3hINHD5A+0UWR9zTx4istu9k8TT8z57bzzMIRByAHhTrG/S2ao3trU75Nt9qM2biL4/3UH7A==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 15:24:05.5832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07502eee-cd8e-4c1c-5ae8-08d82a657181
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5096
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
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTcgSnVsIDIwMjAsIGF0IDE3OjA1LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEp1bCAxNywgMjAyMCBhdCAwMjo0
OToyMFBNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiAx
NyBKdWwgMjAyMCwgYXQgMTY6NDEsIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiBGcmksIEp1bCAxNywgMjAyMCBhdCAwMjozNDo1NVBN
ICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiANCj4+Pj4gDQo+Pj4+PiBPbiAx
NyBKdWwgMjAyMCwgYXQgMTY6MDYsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6DQo+Pj4+PiANCj4+Pj4+IE9uIDE3LjA3LjIwMjAgMTU6NTksIEJlcnRyYW5kIE1hcnF1aXMg
d3JvdGU6DQo+Pj4+Pj4gDQo+Pj4+Pj4gDQo+Pj4+Pj4+IE9uIDE3IEp1bCAyMDIwLCBhdCAxNTox
OSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+Pj4gDQo+Pj4+
Pj4+IE9uIDE3LjA3LjIwMjAgMTU6MTQsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+Pj4+
Pj4gT24gMTcgSnVsIDIwMjAsIGF0IDEwOjEwLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOg0KPj4+Pj4+Pj4+IE9uIDE2LjA3LjIwMjAgMTk6MTAsIFJhaHVsIFNpbmdoIHdy
b3RlOg0KPj4+Pj4+Pj4+PiAjIEVtdWxhdGVkIFBDSSBkZXZpY2UgdHJlZSBub2RlIGluIGxpYnhs
Og0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4gTGlieGwgaXMgY3JlYXRpbmcgYSB2aXJ0dWFsIFBD
SSBkZXZpY2UgdHJlZSBub2RlIGluIHRoZSBkZXZpY2UgdHJlZSB0byBlbmFibGUgdGhlIGd1ZXN0
IE9TIHRvIGRpc2NvdmVyIHRoZSB2aXJ0dWFsIFBDSSBkdXJpbmcgZ3Vlc3QgYm9vdC4gV2UgaW50
cm9kdWNlZCB0aGUgbmV3IGNvbmZpZyBvcHRpb24gW3ZwY2k9InBjaV9lY2FtIl0gZm9yIGd1ZXN0
cy4gV2hlbiB0aGlzIGNvbmZpZyBvcHRpb24gaXMgZW5hYmxlZCBpbiBhIGd1ZXN0IGNvbmZpZ3Vy
YXRpb24sIGEgUENJIGRldmljZSB0cmVlIG5vZGUgd2lsbCBiZSBjcmVhdGVkIGluIHRoZSBndWVz
dCBkZXZpY2UgdHJlZS4NCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBJIHN1cHBvcnQgU3RlZmFubydz
IHN1Z2dlc3Rpb24gZm9yIHRoaXMgdG8gYmUgYW4gb3B0aW9uYWwgdGhpbmcsIGkuZS4NCj4+Pj4+
Pj4+PiB0aGVyZSB0byBiZSBubyBuZWVkIGZvciBpdCB3aGVuIHRoZXJlIGFyZSBQQ0kgZGV2aWNl
cyBhc3NpZ25lZCB0byB0aGUNCj4+Pj4+Pj4+PiBndWVzdCBhbnl3YXkuIEkgYWxzbyB3b25kZXIg
YWJvdXQgdGhlIHBjaV8gcHJlZml4IGhlcmUgLSBpc24ndA0KPj4+Pj4+Pj4+IHZwY2k9ImVjYW0i
IGFzIHVuYW1iaWd1b3VzPw0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBUaGlzIGNvdWxkIGJlIGEgcHJv
YmxlbSBhcyB3ZSBuZWVkIHRvIGtub3cgdGhhdCB0aGlzIGlzIHJlcXVpcmVkIGZvciBhIGd1ZXN0
IHVwZnJvbnQgc28gdGhhdCBQQ0kgZGV2aWNlcyBjYW4gYmUgYXNzaWduZWQgYWZ0ZXIgdXNpbmcg
eGwuIA0KPj4+Pj4+PiANCj4+Pj4+Pj4gSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQ6IFdo
ZW4gdGhlcmUgYXJlIG5vIFBDSSBkZXZpY2UgdGhhdCBnZXQNCj4+Pj4+Pj4gaGFuZGVkIHRvIGEg
Z3Vlc3Qgd2hlbiBpdCBnZXRzIGNyZWF0ZWQsIGJ1dCBpdCBpcyBzdXBwb3NlZCB0byBiZSBhYmxl
DQo+Pj4+Pj4+IHRvIGhhdmUgc29tZSBhc3NpZ25lZCB3aGlsZSBhbHJlYWR5IHJ1bm5pbmcsIHRo
ZW4gd2UgYWdyZWUgdGhlIG9wdGlvbg0KPj4+Pj4+PiBpcyBuZWVkZWQgKGFmYWljdCkuIFdoZW4g
UENJIGRldmljZXMgZ2V0IGhhbmRlZCB0byB0aGUgZ3Vlc3Qgd2hpbGUgaXQNCj4+Pj4+Pj4gZ2V0
cyBjb25zdHJ1Y3RlZCwgd2hlcmUncyB0aGUgcHJvYmxlbSB0byBpbmZlciB0aGlzIG9wdGlvbiBm
cm9tIHRoZQ0KPj4+Pj4+PiBwcmVzZW5jZSBvZiBQQ0kgZGV2aWNlcyBpbiB0aGUgZ3Vlc3QgY29u
ZmlndXJhdGlvbj8NCj4+Pj4+PiANCj4+Pj4+PiBJZiB0aGUgdXNlciB3YW50cyB0byB1c2UgeGwg
cGNpLWF0dGFjaCB0byBhdHRhY2ggaW4gcnVudGltZSBhIGRldmljZSB0byBhIGd1ZXN0LCB0aGlz
IGd1ZXN0IG11c3QgaGF2ZSBhIFZQQ0kgYnVzIChldmVuIHdpdGggbm8gZGV2aWNlcykuDQo+Pj4+
Pj4gSWYgd2UgZG8gbm90IGhhdmUgdGhlIHZwY2kgcGFyYW1ldGVyIGluIHRoZSBjb25maWd1cmF0
aW9uIHRoaXMgdXNlIGNhc2Ugd2lsbCBub3Qgd29yayBhbnltb3JlLg0KPj4+Pj4gDQo+Pj4+PiBU
aGF0J3Mgd2hhdCBldmVyeW9uZSBsb29rcyB0byBhZ3JlZSB3aXRoLiBZZXQgd2h5IGlzIHRoZSBw
YXJhbWV0ZXIgbmVlZGVkDQo+Pj4+PiB3aGVuIHRoZXJlIF9hcmVfIFBDSSBkZXZpY2VzIGFueXdh
eT8gVGhhdCdzIHRoZSAib3B0aW9uYWwiIHRoYXQgU3RlZmFubw0KPj4+Pj4gd2FzIHN1Z2dlc3Rp
bmcsIGFpdWkuDQo+Pj4+IA0KPj4+PiBJIGFncmVlIGluIHRoaXMgY2FzZSB0aGUgcGFyYW1ldGVy
IGNvdWxkIGJlIG9wdGlvbmFsIGFuZCBvbmx5IHJlcXVpcmVkIGlmIG5vdCBQQ0kgZGV2aWNlIGlz
IGFzc2lnbmVkIGRpcmVjdGx5IGluIHRoZSBndWVzdCBjb25maWd1cmF0aW9uLg0KPj4+IA0KPj4+
IFdoZXJlIHdpbGwgdGhlIEVDQU0gcmVnaW9uKHMpIGFwcGVhciBvbiB0aGUgZ3Vlc3QgcGh5c21h
cD8NCj4+PiANCj4+PiBBcmUgeW91IGdvaW5nIHRvIHJlLXVzZSB0aGUgc2FtZSBsb2NhdGlvbnMg
YXMgb24gdGhlIHBoeXNpY2FsDQo+Pj4gaGFyZHdhcmUsIG9yIHdpbGwgdGhleSBhcHBlYXIgc29t
ZXdoZXJlIGVsc2U/DQo+PiANCj4+IFdlIHdpbGwgYWRkIHNvbWUgbmV3IGRlZmluaXRpb25zIGZv
ciB0aGUgRUNBTSByZWdpb25zIGluIHRoZSBndWVzdCBwaHlzbWFwIGRlY2xhcmVkIGluIHhlbiAo
aW5jbHVkZS9hc20tYXJtL2NvbmZpZy5oKQ0KPiANCj4gSSB0aGluayBJJ20gY29uZnVzZWQsIGJ1
dCB0aGF0IGZpbGUgZG9lc24ndCBjb250YWluIGFueXRoaW5nIHJlbGF0ZWQNCj4gdG8gdGhlIGd1
ZXN0IHBoeXNtYXAsIHRoYXQncyB0aGUgWGVuIHZpcnR1YWwgbWVtb3J5IGxheW91dCBvbiBBcm0N
Cj4gQUZBSUNUPw0KPiANCj4gRG9lcyB0aGlzIHNvbWVob3cgcmVsYXRlIHRvIHRoZSBwaHlzaWNh
bCBtZW1vcnkgbWFwIGV4cG9zZWQgdG8gZ3Vlc3RzDQo+IG9uIEFybT8NCg0KWWVzIGl0IGRvZXMu
DQpXZSB3aWxsIGFkZCBuZXcgZGVmaW5pdGlvbnMgdGhlcmUgcmVsYXRlZCB0byBWUENJIHRvIHJl
c2VydmUgc29tZSBhcmVhcyBmb3IgdGhlIFZQQ0kgRUNBTSBhbmQgdGhlIElPTUVNIGFyZWFzLg0K
DQpCZXJ0cmFuZA0KDQo+IA0KPiBSb2dlci4NCg0K

