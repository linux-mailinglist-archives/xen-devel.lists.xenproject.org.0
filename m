Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0E6419229
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 12:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196663.349595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnlI-0006Ik-KX; Mon, 27 Sep 2021 10:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196663.349595; Mon, 27 Sep 2021 10:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnlI-0006FH-Gb; Mon, 27 Sep 2021 10:21:28 +0000
Received: by outflank-mailman (input) for mailman id 196663;
 Mon, 27 Sep 2021 10:21:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xxNw=OR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mUnlH-0006FB-CQ
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 10:21:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::625])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae0fcefb-10de-47c9-9714-88976eb94604;
 Mon, 27 Sep 2021 10:21:23 +0000 (UTC)
Received: from AM7PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:20b:100::33)
 by HE1PR08MB2940.eurprd08.prod.outlook.com (2603:10a6:7:30::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 10:21:20 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::28) by AM7PR02CA0023.outlook.office365.com
 (2603:10a6:20b:100::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 10:21:20 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 10:21:20 +0000
Received: ("Tessian outbound 3c48586a377f:v103");
 Mon, 27 Sep 2021 10:21:18 +0000
Received: from 6fdb01dcc6bb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7D02ABD9-6273-4F1A-B77D-D7DB6BCFAA19.1; 
 Mon, 27 Sep 2021 10:21:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6fdb01dcc6bb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Sep 2021 10:21:06 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 10:21:05 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 10:21:05 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ae0fcefb-10de-47c9-9714-88976eb94604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8GDnxrpLGbzERDVYWOOOIaiHQFHMWwNJxjNOwQVUjY=;
 b=UbZpt9LkqnzqrFKv/UWMry3Etm+c+qSoaIqY3jYiGUWFyLHA/kDqlHaoBXpOQW7v/UsJA1oq71D68LgcguQRaRLAu92kDISXHF+Cvqe37JwfJj4UVJ68hVhaVmdYWV0vw/JTqyQf6Cy85W5+WbCBNCXJ44E+mJE0gQOuaQrVY60=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAaedwvqqP72fZcuk7YCUvOWaBAPA7o72yBO5PR3Jkz59wnO1XSQrKFK0rT/+CKmU1BSNWNaD9zksiWgjF6OWKjQJw2AlvEEuceXi9vSGAX5UzdEaaBHQ4ETzFVI3jV1ABFEJv1WUbpJUVjSwrJrB2L4Sgi/8K20VeZQAaRlQSHBEMp7xKk8LNwQ6avYe2DImFE9OY52X8857OrgwNTeSGw67S49XBSZi6cNkSyhfjc4QXYTez4QoEZIkXwTWMWSB5qsy2wQWA+TpbSMsirqDnsTWF3MhcDMj1Q5w55Od7fQPFhkdExFijOZoSzeoTg81X9RWLzMPUGDUBR0fji8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=g8GDnxrpLGbzERDVYWOOOIaiHQFHMWwNJxjNOwQVUjY=;
 b=OoKEJWaFAo/29r3pVU6w+kVrUXPNOTPa/frA8BDvw8lnFhcF8/zFGL+dCBpDWMEnm/rCAqU++czb2N6EcV6eLXg+V75/ASzsePdQCZusdiYkfFKIsuA/cRyBQoGklx57PSk+m6guXSezfAB59VGY0F/LDietSH5UAu4CrxTmRObMMzEjy7Ci4pvxXHkY9PATGPV7NpAnNxLrPVwEnoqKrPF3VTCql94FoaMTDaBXZFdb/EdzICPnhZWG/fyWpBbgjUtXoM8hjWHRB/eUU9shZpTW7TcK5wI+x565Okt3fQhy4gz0Az7dM5rTbK7gHL6APiVjEM+DlehTnaGr9OHrQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8GDnxrpLGbzERDVYWOOOIaiHQFHMWwNJxjNOwQVUjY=;
 b=UbZpt9LkqnzqrFKv/UWMry3Etm+c+qSoaIqY3jYiGUWFyLHA/kDqlHaoBXpOQW7v/UsJA1oq71D68LgcguQRaRLAu92kDISXHF+Cvqe37JwfJj4UVJ68hVhaVmdYWV0vw/JTqyQf6Cy85W5+WbCBNCXJ44E+mJE0gQOuaQrVY60=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien.grall.oss@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
Thread-Topic: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
Thread-Index:
 AQHXsHMrRDdmLUiNMk+huFUWk4EjYquyZ70AgAPY1CCAAP08AIAADO8QgAANUgCAABvh0IAAAsXQgAANBICAACxScA==
Date: Mon, 27 Sep 2021 10:21:05 +0000
Message-ID:
 <DB9PR08MB6857316DC540769819C8155E9EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-23-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231828310.17979@sstabellini-ThinkPad-T480s>
 <DB9PR08MB685744A06D7C014DAE9BE73F9EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109262021200.5022@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857AD295D692F962AD76C219EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109262123140.5022@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857603316C2C808BAD8CD709EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <DB9PR08MB685744B09307DFCA38C0635C9EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <CAJ=z9a1D2ROHRyvRM7=kgnU_J2RkuHC_htYEWtqznUxtq=vZHA@mail.gmail.com>
In-Reply-To:
 <CAJ=z9a1D2ROHRyvRM7=kgnU_J2RkuHC_htYEWtqznUxtq=vZHA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9581C7C154771C41BF2D6C031E00F1CA.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7fdcd977-bb10-4352-8f39-08d981a08c93
x-ms-traffictypediagnostic: DB7PR08MB3531:|HE1PR08MB2940:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB294009A63C4488459BAD8E409EA79@HE1PR08MB2940.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0D/mmbzKTzjRUCeMlpC2o2SWRd7CshQKzzEJ1WDCRpXDJMher1A9dnF0wx3rlX/2Dqjl+EcCEYJslHF05RZ1rRX/hwdwLPLvvOsO4QGVec0zKNoGFsNnnQr1iPHT2njJgf7F32S620HXprtNEy8XtamdToRNvfAODybNh+1xia1y94T1Yo9lXxIk2ZITvSPjxPsoT+arMcQp8JIRdV1s0Nd5oQpmTaobdK016bgdOsYlDDNyyOMzxMON6OCgB3rLDkyqRIUhVDS6R4pHWyUyxcBormzNOaj11EP3iW6YpXINH0LRK7tcuMt3S8eAtccIA2NxHkS23siIAEtkP15LYm4KAeTyBvT8Xas3pSRbJMakY1+EPwTCnfTlz5RMtLT9mCi8sdQHjsaY8/hcJKMn+foY+rooOmzfysrAjT+mzTNR5Qc8pl+K/RUK6zxVWL9RbK1IV8CBvByp6/58AdVz13fuIiEi9XodBS/FeYblTOJOLXI9UQsig2N7l7hhIk/mqhCLB2KAW1Z2a+BU20ftO4yD+xPGnzKN+KQKtu5h7dQv481FF0+8j8XL7g46bxM1T/csoPEhGegNl1zGnYvI+L5gmp7w4MNFphzPM0GOL1yg4JUqxf0b3/Ku8sSEc1z/Nh9jAV3OX1HiqIX5NPWXneVxxkUuMz1goG+9cR84SrtXo8GB1OJLEF1gcgediTe+8eZrKsx6V2V1ltk4yDRf2Yg2pyE01qbQwCLBZNux04ewgACCMR+WvmMi06+fBJi5TWc2SAY/NBp/PFibVuQKdkzxqav1GHe6ULu7ePVbRTk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(38070700005)(9686003)(7696005)(8676002)(55016002)(6506007)(8936002)(53546011)(186003)(76116006)(4326008)(83380400001)(6916009)(52536014)(66476007)(2906002)(71200400001)(54906003)(66556008)(66446008)(64756008)(26005)(966005)(86362001)(38100700002)(316002)(33656002)(508600001)(122000001)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3531
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	49086bbf-7ff7-44d8-6ee3-08d981a083b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g4QiCbFnRE3kCvLtYwBCwc+snL4t1OveOyAsY6WVTHtAIKOeB4ByF50B4Cw2/BTBkCtYKEkqcP1cv/ypzEvWGqVc3C8DKL/+xzNBthtkiNgxfM7IVdtHRWGMi7I0D3s4HyHRekgw/xlo8zTlHM2Tda24/9gRXBrwid05xlVVHHbsDMFBxBNE/ZccSUevh8xMzNfhipDXFhzVUvwGml1CTjMIGm+uFYLDaG9t5xViqGwDknsN+Tz5IFwsvfd15FQ16JCLQ2VT5JqrKQrDeJv/652iTHGyYS+L9GGWfIxSjQ1evLgAeMd1K7MHhsezTMN+Bhf43ue3V7lK638sdayWlY0FMC2Yg7ks/1E62dtaPIZCL3YuA0DEmE2PGl+f74FSxfwnEz0IdjlSWUK2UGAdjCnS649oAxIOycM9nAgjB4aykFG4WA/uVoa+3gg0FPyup0IsLMKhIJpj+OTchHyAPSZj1sJefFs8HBKoIhun+Va6qvGaDzc4K9ZbMZLVhIfrWUp+mdVZ6MyRK/VJDGJuS+6ntZ6vy+GkqQcV4+7HrIjmJTKmF11tt3QkARGG8xqpz2Yreg+b0bMwsEcxBZCr1VXLue0d4orxq+JkBJSbyK/tNZGWyndExu/M7Y5eOH28M9yTKnS9NwJgRN4LWmjAS2Xq6VHtCvwvBY88QnPXKIYk88vfxJdLICXosxjJJ/WHxK4QzzPxeDBghSrlYe84g8XYa+0r01A3LeZcbBBYaNhZaHSYwvuqH+MNGKE0KoghanwevGldUBn+mGrHzt9ZlRZol/n0TXTxiv9rE6MhAE8=
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(4326008)(336012)(8936002)(186003)(83380400001)(26005)(5660300002)(7696005)(2906002)(86362001)(53546011)(70586007)(9686003)(52536014)(6862004)(47076005)(70206006)(6506007)(8676002)(356005)(30864003)(107886003)(54906003)(508600001)(55016002)(33656002)(82310400003)(966005)(316002)(36860700001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 10:21:20.1817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fdcd977-bb10-4352-8f39-08d981a08c93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2940

SGkgSnVsaWVuLA0KDQpGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbC5vc3NAZ21haWwu
Y29tPiANClNlbnQ6IDIwMjHlubQ55pyIMjfml6UgMTU6MzYNClRvOiBXZWkgQ2hlbiA8V2VpLkNo
ZW5AYXJtLmNvbT4NCkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyB4ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IEJlcnRyYW5k
IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NClN1YmplY3Q6IFJlOiBbUEFU
Q0ggMjIvMzddIHhlbi9hcm06IHVzZSBOUl9NRU1fQkFOS1MgdG8gb3ZlcnJpZGUgZGVmYXVsdCBO
Ul9OT0RFX01FTUJMS1MNCg0KDQpPbiBNb24sIDI3IFNlcCAyMDIxLCAwODo1MyBXZWkgQ2hlbiwg
PG1haWx0bzpXZWkuQ2hlbkBhcm0uY29tPiB3cm90ZToNCkhpIEp1bGllbiwNCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPG1haWx0bzp4ZW4tZGV2ZWwt
Ym91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFdlaQ0KPiBDaGVuDQo+
IFNlbnQ6IDIwMjHlubQ55pyIMjfml6UgMTQ6NDYNCj4gVG86IFN0ZWZhbm8gU3RhYmVsbGluaSA8
bWFpbHRvOnNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENjOiBtYWlsdG86eGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyBtYWlsdG86anVsaWVuQHhlbi5vcmc7IEJlcnRyYW5kIE1hcnF1
aXMNCj4gPG1haWx0bzpCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBtYWlsdG86amJldWxpY2hA
c3VzZS5jb207IG1haWx0bzpyb2dlci5wYXVAY2l0cml4LmNvbTsNCj4gbWFpbHRvOmFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20NCj4gU3ViamVjdDogUkU6IFtQQVRDSCAyMi8zN10geGVuL2FybTog
dXNlIE5SX01FTV9CQU5LUyB0byBvdmVycmlkZSBkZWZhdWx0DQo+IE5SX05PREVfTUVNQkxLUw0K
PiANCj4gSGkgU3RlZmFubywgSnVsaWVuLA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+IEZyb206IFN0ZWZhbm8gU3RhYmVsbGluaSA8bWFpbHRvOnNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+DQo+ID4gU2VudDogMjAyMeW5tDnmnIgyN+aXpSAxMzowMA0KPiA+IFRvOiBXZWkg
Q2hlbiA8bWFpbHRvOldlaS5DaGVuQGFybS5jb20+DQo+ID4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8bWFpbHRvOnNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tDQo+ID4gbWFpbHRvOmRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOyBtYWlsdG86anVsaWVuQHhlbi5vcmc7IEJlcnRyYW5kIE1h
cnF1aXMNCj4gPiA8bWFpbHRvOkJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IG1haWx0bzpqYmV1
bGljaEBzdXNlLmNvbTsgbWFpbHRvOnJvZ2VyLnBhdUBjaXRyaXguY29tOw0KPiA+IG1haWx0bzph
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tDQo+ID4gU3ViamVjdDogUkU6IFtQQVRDSCAyMi8zN10g
eGVuL2FybTogdXNlIE5SX01FTV9CQU5LUyB0byBvdmVycmlkZSBkZWZhdWx0DQo+ID4gTlJfTk9E
RV9NRU1CTEtTDQo+ID4NCj4gPiAreDg2IG1haW50YWluZXJzDQo+ID4NCj4gPiBPbiBNb24sIDI3
IFNlcCAyMDIxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+ID4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxtYWlsdG86c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4NCj4gPiA+ID4gU2VudDogMjAyMeW5tDnmnIgyN+aXpSAxMToyNg0KPiA+
ID4gPiBUbzogV2VpIENoZW4gPG1haWx0bzpXZWkuQ2hlbkBhcm0uY29tPg0KPiA+ID4gPiBDYzog
U3RlZmFubyBTdGFiZWxsaW5pIDxtYWlsdG86c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi0N
Cj4gPiA+ID4gbWFpbHRvOmRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBtYWlsdG86anVsaWVu
QHhlbi5vcmc7IEJlcnRyYW5kIE1hcnF1aXMNCj4gPiA+ID4gPG1haWx0bzpCZXJ0cmFuZC5NYXJx
dWlzQGFybS5jb20+DQo+ID4gPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMjIvMzddIHhlbi9hcm06
IHVzZSBOUl9NRU1fQkFOS1MgdG8gb3ZlcnJpZGUNCj4gPiBkZWZhdWx0DQo+ID4gPiA+IE5SX05P
REVfTUVNQkxLUw0KPiA+ID4gPg0KPiA+ID4gPiBPbiBTdW4sIDI2IFNlcCAyMDIxLCBXZWkgQ2hl
biB3cm90ZToNCj4gPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+
ID4gPiBGcm9tOiBTdGVmYW5vIFN0YWJlbGxpbmkgPG1haWx0bzpzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPg0KPiA+ID4gPiA+ID4gU2VudDogMjAyMeW5tDnmnIgyNOaXpSA5OjM1DQo+ID4gPiA+ID4g
PiBUbzogV2VpIENoZW4gPG1haWx0bzpXZWkuQ2hlbkBhcm0uY29tPg0KPiA+ID4gPiA+ID4gQ2M6
IG1haWx0bzp4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IG1haWx0bzpzc3RhYmVsbGlu
aUBrZXJuZWwub3JnOw0KPiA+ID4gPiBtYWlsdG86anVsaWVuQHhlbi5vcmc7DQo+ID4gPiA+ID4g
PiBCZXJ0cmFuZCBNYXJxdWlzIDxtYWlsdG86QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiA+
ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAyMi8zN10geGVuL2FybTogdXNlIE5SX01FTV9C
QU5LUyB0byBvdmVycmlkZQ0KPiA+ID4gPiBkZWZhdWx0DQo+ID4gPiA+ID4gPiBOUl9OT0RFX01F
TUJMS1MNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBPbiBUaHUsIDIzIFNlcCAyMDIxLCBXZWkg
Q2hlbiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gQXMgYSBtZW1vcnkgcmFuZ2UgZGVzY3JpYmVkIGlu
IGRldmljZSB0cmVlIGNhbm5vdCBiZSBzcGxpdA0KPiA+IGFjcm9zcw0KPiA+ID4gPiA+ID4gPiBt
dWx0aXBsZSBub2Rlcy4gU28gd2UgZGVmaW5lIE5SX05PREVfTUVNQkxLUyBhcyBOUl9NRU1fQkFO
S1MNCj4gaW4NCj4gPiA+ID4gPiA+ID4gYXJjaCBoZWFkZXIuDQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gVGhpcyBzdGF0ZW1lbnQgaXMgdHJ1ZSBidXQgd2hhdCBpcyB0aGUgZ29hbCBvZiB0aGlz
IHBhdGNoPyBJcyBpdA0KPiA+IHRvDQo+ID4gPiA+ID4gPiByZWR1Y2UgY29kZSBzaXplIGFuZCBt
ZW1vcnkgY29uc3VtcHRpb24/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gTm8s
IHdoZW4gSnVsaWVuIGFuZCBJIGRpc2N1c3NlZCB0aGlzIGluIGxhc3QgdmVyc2lvblsxXSwgd2Ug
aGFkbid0DQo+ID4gPiA+IHRob3VnaHQNCj4gPiA+ID4gPiBzbyBkZWVwbHkuIFdlIGp1c3QgdGhv
dWdodCBhIG1lbW9yeSByYW5nZSBkZXNjcmliZWQgaW4gRFQgY2Fubm90DQo+IGJlDQo+ID4gPiA+
IHNwbGl0DQo+ID4gPiA+ID4gYWNyb3NzIG11bHRpcGxlIG5vZGVzLiBTbyBOUl9NRU1fQkFOS1Mg
c2hvdWxkIGJlIGVxdWFsIHRvDQo+ID4gTlJfTUVNX0JBTktTLg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8y
MDIxLQ0KPiA+ID4gPiAwOC9tc2cwMDk3NC5odG1sDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEkg
YW0gYXNraW5nIGJlY2F1c2UgTlJfTUVNX0JBTktTIGlzIDEyOCBhbmQNCj4gPiA+ID4gPiA+IE5S
X05PREVfTUVNQkxLUz0yKk1BWF9OVU1OT0RFUyB3aGljaCBpcyA2NCBieSBkZWZhdWx0IHNvIGFn
YWluDQo+ID4gPiA+ID4gPiBOUl9OT0RFX01FTUJMS1MgaXMgMTI4IGJlZm9yZSB0aGlzIHBhdGNo
Lg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEluIG90aGVyIHdvcmRzLCB0aGlzIHBhdGNoIGFs
b25lIGRvZXNuJ3QgbWFrZSBhbnkgZGlmZmVyZW5jZTsgYXQNCj4gPiBsZWFzdA0KPiA+ID4gPiA+
ID4gZG9lc24ndCBtYWtlIGFueSBkaWZmZXJlbmNlIHVubGVzcyBDT05GSUdfTlJfTlVNQV9OT0RF
UyBpcw0KPiA+IGluY3JlYXNlZC4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBTbywgaXMgdGhl
IGdvYWwgdG8gcmVkdWNlIG1lbW9yeSB1c2FnZSB3aGVuIENPTkZJR19OUl9OVU1BX05PREVTDQo+
ID4gaXMNCj4gPiA+ID4gPiA+IGhpZ2hlciB0aGFuIDY0Pw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IEkgYWxzbyB0aG91Z2h0IGFib3V0IHRoaXMgcHJvYmxlbSB3aGVuIEkgd2Fz
IHdyaXRpbmcgdGhpcyBwYXRjaC4NCj4gPiA+ID4gPiBDT05GSUdfTlJfTlVNQV9OT0RFUyBpcyBp
bmNyZWFzaW5nLCBidXQgTlJfTUVNX0JBTktTIGlzIGEgZml4ZWQNCj4gPiA+ID4gPiB2YWx1ZSwg
dGhlbiBOUl9NRU1fQkFOS1MgY2FuIGJlIHNtYWxsZXIgdGhhbiBDT05GSUdfTlJfTlVNQV9OT0RF
Uw0KPiA+ID4gPiA+IGF0IG9uZSBwb2ludC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEJ1dCBJIGFn
cmVlIHdpdGggSnVsaWVuJ3Mgc3VnZ2VzdGlvbiwgTlJfTUVNX0JBTktTIGFuZA0KPiA+IE5SX05P
REVfTUVNQkxLUw0KPiA+ID4gPiA+IG11c3QgYmUgYXdhcmUgb2YgZWFjaCBvdGhlci4gSSBoYWQg
dGhvdWdodCB0byBhZGQgc29tZSBBU1NFUlQNCj4gY2hlY2ssDQo+ID4gPiA+ID4gYnV0IEkgZG9u
J3Qga25vdyBob3cgdG8gZG8gaXQgYmV0dGVyLiBTbyBJIHBvc3QgdGhpcyBwYXRjaCBmb3INCj4g
bW9yZQ0KPiA+ID4gPiA+IHN1Z2dlc3Rpb24uDQo+ID4gPiA+DQo+ID4gPiA+IE9LLiBJbiB0aGF0
IGNhc2UgSSdkIHNheSB0byBnZXQgcmlkIG9mIHRoZSBwcmV2aW91cyBkZWZpbml0aW9uIG9mDQo+
ID4gPiA+IE5SX05PREVfTUVNQkxLUyBhcyBpdCBpcyBwcm9iYWJseSBub3QgbmVjZXNzYXJ5LCBz
ZWUgYmVsb3cuDQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gPiBBbmQga2VlcCBkZWZhdWx0IE5SX05PREVfTUVNQkxLUyBpbiBjb21tb24gaGVhZGVy
DQo+ID4gPiA+ID4gPiA+IGZvciB0aG9zZSBhcmNoaXRlY3R1cmVzIE5VTUEgaXMgZGlzYWJsZWQu
DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhpcyBsYXN0IHNlbnRlbmNlIGlzIG5vdCBhY2N1
cmF0ZTogb24geDg2IE5VTUEgaXMgZW5hYmxlZCBhbmQNCj4gPiA+ID4gPiA+IE5SX05PREVfTUVN
QkxLUyBpcyBzdGlsbCBkZWZpbmVkIGluIHhlbi9pbmNsdWRlL3hlbi9udW1hLmgNCj4gKHRoZXJl
DQo+ID4gaXMNCj4gPiA+ID4gbm8NCj4gPiA+ID4gPiA+IHg4NiBkZWZpbml0aW9uIG9mIGl0KQ0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFllcy4NCj4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPG1haWx0bzp3ZWku
Y2hlbkBhcm0uY29tPg0KPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID7CoCB4ZW4vaW5j
bHVkZS9hc20tYXJtL251bWEuaCB8IDggKysrKysrKy0NCj4gPiA+ID4gPiA+ID7CoCB4ZW4vaW5j
bHVkZS94ZW4vbnVtYS5owqAgwqAgwqB8IDIgKysNCj4gPiA+ID4gPiA+ID7CoCAyIGZpbGVzIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmggYi94ZW4v
aW5jbHVkZS9hc20tDQo+ID4gYXJtL251bWEuaA0KPiA+ID4gPiA+ID4gPiBpbmRleCA4ZjFjNjdl
M2ViLi4yMTU2OWU2MzRiIDEwMDY0NA0KPiA+ID4gPiA+ID4gPiAtLS0gYS94ZW4vaW5jbHVkZS9h
c20tYXJtL251bWEuaA0KPiA+ID4gPiA+ID4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL251
bWEuaA0KPiA+ID4gPiA+ID4gPiBAQCAtMyw5ICszLDE1IEBADQo+ID4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiA+wqAgI2luY2x1ZGUgPHhlbi9tbS5oPg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiArI2luY2x1ZGUgPGFzbS9zZXR1cC5oPg0KPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4g
PiA+wqAgdHlwZWRlZiB1OCBub2RlaWRfdDsNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
LSNpZm5kZWYgQ09ORklHX05VTUENCj4gPiA+ID4gPiA+ID4gKyNpZmRlZiBDT05GSUdfTlVNQQ0K
PiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ICsjZGVmaW5lIE5SX05PREVfTUVNQkxLUyBO
Ul9NRU1fQkFOS1MNCj4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiArI2Vsc2UNCj4gPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID7CoCAvKiBGYWtlIG9uZSBub2RlIGZvciBub3cuIFNlZSBh
bHNvIG5vZGVfb25saW5lX21hcC4gKi8NCj4gPiA+ID4gPiA+ID7CoCAjZGVmaW5lIGNwdV90b19u
b2RlKGNwdSkgMA0KPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL251
bWEuaCBiL3hlbi9pbmNsdWRlL3hlbi9udW1hLmgNCj4gPiA+ID4gPiA+ID4gaW5kZXggMTk3OGUy
YmUxYi4uMTczMWUxY2M2YiAxMDA2NDQNCj4gPiA+ID4gPiA+ID4gLS0tIGEveGVuL2luY2x1ZGUv
eGVuL251bWEuaA0KPiA+ID4gPiA+ID4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbnVtYS5oDQo+
ID4gPiA+ID4gPiA+IEBAIC0xMiw3ICsxMiw5IEBADQo+ID4gPiA+ID4gPiA+wqAgI2RlZmluZSBN
QVhfTlVNTk9ERVPCoCDCoCAxDQo+ID4gPiA+ID4gPiA+wqAgI2VuZGlmDQo+ID4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiA+ICsjaWZuZGVmIE5SX05PREVfTUVNQkxLUw0KPiA+ID4gPiA+ID4gPsKg
ICNkZWZpbmUgTlJfTk9ERV9NRU1CTEtTIChNQVhfTlVNTk9ERVMqMikNCj4gPiA+ID4gPiA+ID4g
KyNlbmRpZg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIG9uZSB3ZSBjYW4gcmVtb3ZlIGl0IGNvbXBs
ZXRlbHkgcmlnaHQ/DQo+ID4gPg0KPiA+ID4gSG93IGFib3V0IGRlZmluZSBOUl9NRU1fQkFOS1Mg
dG86DQo+ID4gPiAjaWZkZWYgQ09ORklHX05SX05VTUFfTk9ERVMNCj4gPiA+ICNkZWZpbmUgTlJf
TUVNX0JBTktTIChDT05GSUdfTlJfTlVNQV9OT0RFUyAqIDIpDQo+ID4gPiAjZWxzZQ0KPiA+ID4g
I2RlZmluZSBOUl9NRU1fQkFOS1MgMTI4DQo+ID4gPiAjZW5kaWYNCj4gPiA+IGZvciBib3RoIHg4
NiBhbmQgQXJtLiBGb3IgdGhvc2UgYXJjaGl0ZWN0dXJlcyBkbyBub3Qgc3VwcG9ydCBvciBlbmFi
bGUNCj4gPiA+IE5VTUEsIHRoZXkgY2FuIHN0aWxsIHVzZSAiTlJfTUVNX0JBTktTIDEyOCIuIEFu
ZCByZXBsYWNlIGFsbA0KPiA+IE5SX05PREVfTUVNQkxLUw0KPiA+ID4gaW4gTlVNQSBjb2RlIHRv
IE5SX01FTV9CQU5LUyB0byByZW1vdmUgTlJfTk9ERV9NRU1CTEtTIGNvbXBsZXRlbHkuDQo+ID4g
PiBJbiB0aGlzIGNhc2UsIE5SX01FTV9CQU5LUyBjYW4gYmUgYXdhcmUgb2YgdGhlIGNoYW5nZXMg
b2YNCj4gPiBDT05GSUdfTlJfTlVNQV9OT0RFUy4NCj4gPg0KPiA+IHg4NiBkb2Vzbid0IGhhdmUg
TlJfTUVNX0JBTktTIGFzIGZhciBhcyBJIGNhbiB0ZWxsLiBJIGd1ZXNzIHlvdSBhbHNvDQo+ID4g
bWVhbnQgdG8gcmVuYW1lIE5SX05PREVfTUVNQkxLUyB0byBOUl9NRU1fQkFOS1M/DQo+ID4NCj4g
DQo+IFllcy4NCj4gDQo+ID4gQnV0IE5SX01FTV9CQU5LUyBpcyBub3QgZGlyZWN0bHkgcmVsYXRl
ZCB0byBDT05GSUdfTlJfTlVNQV9OT0RFUyBiZWNhdXNlDQo+ID4gdGhlcmUgY2FuIGJlIG1hbnkg
bWVtb3J5IGJhbmtzIGZvciBlYWNoIG51bWEgbm9kZSwgY2VydGFpbmx5IG1vcmUgdGhhbg0KPiA+
IDIuIFRoZSBleGlzdGluZyBkZWZpbml0aW9uIG9uIHg4NjoNCj4gPg0KPiA+ICNkZWZpbmUgTlJf
Tk9ERV9NRU1CTEtTIChNQVhfTlVNTk9ERVMqMikNCj4gPg0KPiA+IERvZXNuJ3QgbWFrZSBhIGxv
dCBvZiBzZW5zZSB0byBtZS4gV2FzIGl0IGp1c3QgYW4gYXJiaXRyYXJ5IGxpbWl0IGZvcg0KPiA+
IHRoZSBsYWNrIG9mIGEgYmV0dGVyIHdheSB0byBzZXQgYSBtYXhpbXVtPw0KPiA+DQo+IA0KPiBB
dCB0aGF0IHRpbWUsIHRoaXMgd2FzIHByb2JhYmx5IHRoZSBtb3N0IGNvc3QtZWZmZWN0aXZlIGFw
cHJvYWNoLg0KPiBFbm91Z2ggYW5kIGVhc3kuIEJ1dCwgaWYgbW9yZSBub2RlcyBuZWVkIHRvIGJl
IHN1cHBvcnRlZCBpbiB0aGUNCj4gZnV0dXJlLCBpdCBtYXkgYnJpbmcgbW9yZSBtZW1vcnkgYmxv
Y2tzLiBBbmQgdGhpcyBtYXhpbXVtIHZhbHVlDQo+IG1pZ2h0IG5vdCBhcHBseS4gVGhlIG1heGlt
dW0gbWF5IG5lZWQgdG8gc3VwcG9ydCBkeW5hbWljIGV4dGVuc2lvbi4NCj4gDQo+ID4NCj4gPiBP
biB0aGUgb3RoZXIgaGFuZCwgTlJfTUVNX0JBTktTIGFuZCBOUl9OT0RFX01FTUJMS1Mgc2VlbSB0
byBiZSByZWxhdGVkLg0KPiA+IEluIGZhY3QsIHdoYXQncyB0aGUgZGlmZmVyZW5jZT8NCj4gPg0K
PiA+IE5SX01FTV9CQU5LUyBpcyB0aGUgbWF4IG51bWJlciBvZiBtZW1vcnkgYmFua3MgKHdpdGgg
b3Igd2l0aG91dA0KPiA+IG51bWEtbm9kZS1pZCkuDQo+ID4NCj4gPiBOUl9OT0RFX01FTUJMS1Mg
aXMgdGhlIG1heCBudW1iZXIgb2YgbWVtb3J5IGJhbmtzIHdpdGggTlVNQSBzdXBwb3J0DQo+ID4g
KHdpdGggbnVtYS1ub2RlLWlkKT8NCj4gPg0KPiA+IFRoZXkgYXJlIGJhc2ljYWxseSB0aGUgc2Ft
ZSB0aGluZy4gT24gQVJNIEkgd291bGQganVzdCBkbzoNCj4gPg0KPiANCj4gUHJvYmFibHkgbm90
LCBOUl9NRU1fQkFOS1Mgd2lsbCBjb3VudCB0aG9zZSBtZW1vcnkgcmFuZ2VzIHdpdGhvdXQNCj4g
bnVtYS1ub2RlLWlkIGluIGJvb3QgbWVtb3J5IHBhcnNpbmcgc3RhZ2UgKHByb2Nlc3NfbWVtb3J5
X25vZGUgb3INCj4gRUZJIHBhcnNlcikuIEJ1dCBOUl9OT0RFX01FTUJMS1Mgd2lsbCBvbmx5IGNv
dW50IHRob3NlIG1lbW9yeSByYW5nZXMNCj4gd2l0aCBudW1hLW5vZGUtaWQuDQo+IA0KPiA+ICNk
ZWZpbmUgTlJfTk9ERV9NRU1CTEtTIE1BWChOUl9NRU1fQkFOS1MsIChDT05GSUdfTlJfTlVNQV9O
T0RFUyAqIDIpKQ0KPiA+DQo+ID4NCg0KPiBRdW90ZSBKdWxpZW4ncyBjb21tZW50IGZyb20gSFRN
TCBlbWFpbCB0byBoZXJlOg0KPiAiIEFzIHlvdSB3cm90ZSBhYm92ZSwgdGhlIHNlY29uZCBwYXJ0
IG9mIHRoZSBNQVggaXMgdG90YWxseSBhcmJpdHJhcnkuDQo+IEluIGZhY3QsIGl0IGlzIHZlcnkg
bGlrZWx5IHRoYW4gaWYgeW91IGhhdmUgbW9yZSB0aGFuIDY0IG5vZGVzLCB5b3UgbWF5DQo+IG5l
ZWQgYSBsb3QgbW9yZSB0aGFuIDIgcmVnaW9ucyBwZXIgbm9kZS4NCj4gDQo+IFNvLCBmb3IgQXJt
LCBJIHdvdWxkIGp1c3QgZGVmaW5lIE5SX05PREVfTUVNQkxLUyBhcyBhbiBhbGlhcyB0byBOUl9N
RU1fQkFOS1MNCj4gc28gaXQgY2FuIGJlIHVzZWQgYnkgY29tbW9uIGNvZGUuDQo+ICINCj4gDQo+
ID4gQnV0IGhlcmUgY29tZXMgdGhlIHByb2JsZW06DQo+ID4gSG93IGNhbiB3ZSBzZXQgdGhlIE5S
X01FTV9CQU5LUyBtYXhpbXVtIHZhbHVlLCAxMjggc2VlbXMgYW4gYXJiaXRyYXJ5IHRvbz8NCj4g
DQo+IFRoaXMgaXMgYmFzZWQgb24gaGFyZHdhcmUgd2UgY3VycmVudGx5IHN1cHBvcnQgKHRoZSBs
YXN0IHRpbWUgd2UgYnVtcGVkIHRoZSB2YWx1ZSB3YXMsIElJUkMsIGZvciBUaHVuZGVyLVgpLiBJ
biB0aGUgY2FzZSBvZiBib290aW5nIFVFRkksIHdlIGNhbiBnZXQgYSBsb3Qgb2Ygc21hbGwgcmFu
Z2VzIGFzIHdlIGRpc2NvdmVyIHRoZSBSQU0gdXNpbmcgdGhlIFVFRkkgbWVtb3J5IG1hcC4NCj4g
DQoNClRoYW5rcyBmb3IgdGhlIGJhY2tncm91bmQuDQoNCj4gDQo+ID4gSWYgI2RlZmluZSBOUl9N
RU1fQkFOS1MgKENPTkZJR19OUl9OVU1BX05PREVTICogTik/IEFuZCB3aGF0IE4gc2hvdWxkIGJl
Lg0KPiANCj4gTiB3b3VsZCBoYXZlIHRvIGJlIHRoZSBtYXhpbXVtIG51bWJlciBvZiByYW5nZXMg
eW91IGNhbiBmaW5kIGluIGEgTlVNQSBub2RlLg0KPiANCj4gV2Ugd291bGQgYWxzbyBuZWVkIHRv
IG1ha2Ugc3VyZSB0aGlzIGRvZXNuJ3QgYnJlYWsgZXhpc3RpbmcgcGxhdGZvcm1zLiBTbyBOIHdv
dWxkIGhhdmUgdG8gYmUgcXVpdGUgbGFyZ2Ugb3Igd2UgbmVlZCBhIE1BWCBhcyBTdGVmYW5vIHN1
Z2dlc3RlZC4NCj4gDQo+IEJ1dCBJIHdvdWxkIHByZWZlciB0byBrZWVwIHRoZSBleGlzdGluZyAx
MjggYW5kIGFsbG93IHRvIGNvbmZpZ3VyZSBpdCBhdCBidWlsZCB0aW1lIChub3QgbmVjZXNzYXJp
bHkgaW4gdGhpcyBzZXJpZXMpLiBUaGlzIGF2b2lkIHRvIGhhdmUgZGlmZmVyZW50IHdheSB0byBk
ZWZpbmUgdGhlIHZhbHVlIGJhc2VkIE5VTUEgdnMgbm9uLU5VTUEuDQoNCkluIHRoaXMgY2FzZSwg
Y2FuIHdlIHVzZSBTdGVmYW5vJ3MNCiIjZGVmaW5lIE5SX05PREVfTUVNQkxLUyBNQVgoTlJfTUVN
X0JBTktTLCAoQ09ORklHX05SX05VTUFfTk9ERVMgKiAyKSkiDQppbiBuZXh0IHZlcnNpb24uIElm
IHllcywgc2hvdWxkIHdlIGNoYW5nZSB4ODYgcGFydD8gQmVjYXVzZSBOUl9NRU1fQkFOS1MNCmhh
cyBub3QgYmVlbiBkZWZpbmVkIGluIHg4Ni4NCg0KPiA+IEFuZCBtYXliZSB0aGUgZGVmaW5pdGlv
biBjb3VsZCBiZSBjb21tb24gd2l0aCB4ODYgaWYgd2UgZGVmaW5lDQo+ID4gTlJfTUVNX0JBTktT
IHRvIDEyOCBvbiB4ODYgdG9vLg0KPiANCj4gSnVsaWVuIGhhZCBjb21tZW50IGhlcmUsIEkgd2ls
bCBjb250aW51ZSBpbiB0aGF0IGVtYWlsLg0K

