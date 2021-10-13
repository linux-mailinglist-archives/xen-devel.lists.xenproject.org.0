Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E2842B9A6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 09:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208008.364019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maZ3d-000100-Uj; Wed, 13 Oct 2021 07:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208008.364019; Wed, 13 Oct 2021 07:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maZ3d-0000xt-R8; Wed, 13 Oct 2021 07:52:13 +0000
Received: by outflank-mailman (input) for mailman id 208008;
 Wed, 13 Oct 2021 07:52:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K3Kx=PB=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1maZ3c-0000xn-Ff
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 07:52:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 406b65bb-7cd3-454b-b717-7c0da660af3a;
 Wed, 13 Oct 2021 07:52:09 +0000 (UTC)
Received: from DB6PR0501CA0035.eurprd05.prod.outlook.com (2603:10a6:4:67::21)
 by VI1PR0802MB2560.eurprd08.prod.outlook.com (2603:10a6:800:ad::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 07:52:07 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::d8) by DB6PR0501CA0035.outlook.office365.com
 (2603:10a6:4:67::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Wed, 13 Oct 2021 07:52:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 07:52:07 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Wed, 13 Oct 2021 07:52:07 +0000
Received: from 4b8d9bb8ea07.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B4069505-B476-4454-8746-7670F46B33CE.1; 
 Wed, 13 Oct 2021 07:52:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4b8d9bb8ea07.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Oct 2021 07:52:01 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4510.eurprd08.prod.outlook.com (2603:10a6:803:fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 07:51:57 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::41d6:b115:3b22:2cd]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::41d6:b115:3b22:2cd%2]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 07:51:57 +0000
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
X-Inumbo-ID: 406b65bb-7cd3-454b-b717-7c0da660af3a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AaT4SztkR+AXQ/RcQng7S1Fo4t3+Vlyd953aPRlwGs=;
 b=JerfVfzSUtK4/rZH88MYVxFAUSkpMto2oVdRegFZIn7qJnkKSJpWNI5W5GmUnzR35cnECqDSj6HTDpDoDgf+MEShDZ21KMR9bNooIJjtL4W2VW9zOPSKeuaHVkPqZG//mNR4xMobCSHjjbfQNfNEJcpM+FURW8BRWrtVd3uQahI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGUE5Wok7ij5/MHy7bd9ApXkuDLHSDtvEsb/i/y7YWX35X8GvLoic8IhVVscUn+5Zb7TNFmIM7i8pljBwvxoerOHPhg5lNgg4Dbv9JbDtGz/LGyy8WZXkeskvR+zC+/WQqtXpEQw0ktVGEgxPs71IAJ5R7gHDUxFwUvTF2JewGOfhWN5Dy0+uGjRSQ+pJIrTBp5ZQzkVDxcHc6Q05tBliL8iQKnv1GBIouGxQhJ/gpKvEaTRZh4Ucj3+AZwGs6sJIr9lE/tSX14rvjADe0SJEC/qI7PeU5I3ghJtssR5j9hoatOzhp/eesQ7ewiNP+dfW7abnwyBK6Cu2BQaW4EftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AaT4SztkR+AXQ/RcQng7S1Fo4t3+Vlyd953aPRlwGs=;
 b=FcIMkGZszsadmHAUdFCiYNCIMvznxMrGWB6zqdzOwC6q5sOTCSy+f+EZteq2NfeaSK1Z4eLC6PG1BRFrKGgTQn+PPb0vtCLTZSN1hoCQdwcMojFsj91FeVdRSz6PLXmVqT9k2ZVv8AdTbQoVYPMrDHRUEwWHjXK+le5qOcVUbtV7z0Acy9meN5i9UdDdFfdPzkdGhTajHSctM07Vdn+q02dBK5KF9YkRgjLJnl9q20wTj/8IUTmNmFN8N/KA647u5a/z/gwc1L7aRjG//DIY444+SlNOPoFG34Ym/74Aa0I/bch64sbkLDWBSD6K79dYJf25BMtEx5xms1g4PMMVsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AaT4SztkR+AXQ/RcQng7S1Fo4t3+Vlyd953aPRlwGs=;
 b=JerfVfzSUtK4/rZH88MYVxFAUSkpMto2oVdRegFZIn7qJnkKSJpWNI5W5GmUnzR35cnECqDSj6HTDpDoDgf+MEShDZ21KMR9bNooIJjtL4W2VW9zOPSKeuaHVkPqZG//mNR4xMobCSHjjbfQNfNEJcpM+FURW8BRWrtVd3uQahI=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH 10/11] xen/arm: device assignment on 1:1 direct-map domain
Thread-Topic: [PATCH 10/11] xen/arm: device assignment on 1:1 direct-map
 domain
Thread-Index: AQHXsCjEx0HGlBpA+Em1L92CXDXaB6uxe3AAgBj87fCAA0mcAIAC50BAgAAD9KA=
Date: Wed, 13 Oct 2021 07:51:57 +0000
Message-ID:
 <VE1PR08MB5215D0769F05388F43B0F761F7B79@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-11-penny.zheng@arm.com>
 <c6730ec5-53c7-9bf2-4620-eefbc7c7c4a3@xen.org>
 <VE1PR08MB5215A1D5695F388F17C367D4F7B39@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <9237c85c-87d0-14ac-07ce-244958add7d3@xen.org>
 <VE1PR08MB5215AAFF71A1A6CDE19A50EFF7B79@VE1PR08MB5215.eurprd08.prod.outlook.com>
In-Reply-To:
 <VE1PR08MB5215AAFF71A1A6CDE19A50EFF7B79@VE1PR08MB5215.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 317600F42BF9764F8DC3F30C0EFB7584.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cd15b561-045e-4b69-76eb-08d98e1e5ac1
x-ms-traffictypediagnostic: VI1PR08MB4510:|VI1PR0802MB2560:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB25600C6D64785C8E9C59A8E7F7B79@VI1PR0802MB2560.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3LsV7q80esrXy+rmCs+b8E7eleXfVrLAC+PR75WqedxDdWij1djeyhHjwQGxvsIJnExxQYRLoyIK1h+zSAlXRU890BeRQN9RFuOdhFbc1EWUY5b7KQL4Wi4fy5gI9a29W3bpFwJSxCCspz7pluf3SO9jVd8CdO8tPG/bU41m3qr7r/PcJ4Vs0qBIv9umviLwZ7g/fkrQePWzcGHbCIRWNttVWB7AVJlcxFB17RnTDpR/b/BcZtIQxNoZeCi++YEoMRFUE6HMKQ7arrDfoJQ4KL9KuRBAFU9dOCyqc/obPSPQS2uv/JJ6ImItR/6KiNuf3LaommiZElum9OF0eFdDot1SmMOvX0T64zy+kyKyLRXRnmXC3NBTGu22DqZuE+UKDYkFwj93jCdl08PqzWfzvTa6VBN3bTWbbJd4p7cdZQepKlQEYVqa4I0YBaaa6/6KEuLtnqHMqw6fesOt84tBOrfg0ouxXC3m0vKq24y+CH9BaVJG8YcKQEDYLp/DndM/tgLwjaJQOlUo20jhX7mGnCx7a2i1c7URPKwHWvjSUDbuhpM2BXLiEEVJgfdZ4YYcVgWzsf2wxvBF5CAgKWVBpSBfpCAlD+S9zi1PAht9T1tT5f0CCPyJxGWZtwE2kOME8rjYRypGesxannBTkSQc5Vu/fBePoTdTunltjpRQOvpINe1CxZU2P8j0IV7RBoKC0OcWevM8X9S3ScoLwT04fg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(2940100002)(8936002)(2906002)(66946007)(8676002)(7696005)(4326008)(122000001)(64756008)(66476007)(66556008)(86362001)(38100700002)(76116006)(110136005)(54906003)(52536014)(38070700005)(55016002)(71200400001)(83380400001)(316002)(9686003)(186003)(26005)(508600001)(6506007)(53546011)(66446008)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4510
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f1d69d2-1dba-4da5-d1e7-08d98e1e5527
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pMZ+jlySo9Ntx05zTR/TTsDE1wyz7KPFK++7ai0nUKAPrNe1ZM8z/b7J7CE6vBcRVyAjNRqN+mP/4TgmhWigLjTQNUbvBf8MhhSuPnSL4lMxg9mh0AFi5tFuWT8Tt6n8uyhBIP1crF4VGEOqI7LwOIlTFfJz3GuOsts645TOr5nx42u6LZrA0378kICl6BCBi6Cksu7L5CVkuTBvqNO5QbaWzq22Y38TprVu4O2uWN+4/N9H0Ys//6hr7QInDO0HHn9fF762sNOqY0RRmR9B7DsIlSzxn9a3k1LaG4Fb3UMKBkqpqGiFY4/DDDs6pssZ70a3f80CrHq9YN4dFHTpVf6QJxy8CvgnIeozoS2PtVZL6mHi9/mGYIQg5HmbJT3CTvqkOHAEEoFYLK/Dp3kIzy9jPxP/oXEAQqDOjCgPQQp1Kjrhn2reEgla6KlL40JKSeXwilgsDaqzg1RmPRCBU7COMPNMTtVd2aVqhrnRwgLrmr1xQdO4aAv7tJ+Vvm1g9H68097NFNFmbXjaACByvIhRLp/mKwfxOLph+RuZIcn5tXw+7rH+DLc4TOZI8rrAR8FVePBYSW9CvFGpQt4xSWHdpzjprYPkc4Z5hMBkJVMatUOtrXiI6p+4v8UxUEPaOMgKsBkTnhn5KmUEeXi8s+3Dz4qRWnjv7Sdn7qg+hj1QkI50F8udte2NqfNhI40e
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8676002)(110136005)(55016002)(356005)(82310400003)(53546011)(508600001)(52536014)(316002)(2940100002)(47076005)(54906003)(186003)(6506007)(4326008)(5660300002)(70586007)(26005)(336012)(70206006)(86362001)(8936002)(81166007)(9686003)(36860700001)(33656002)(83380400001)(7696005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 07:52:07.2347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd15b561-045e-4b69-76eb-08d98e1e5ac1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2560

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBlbm55IFpoZW5nDQo+IFNl
bnQ6IFdlZG5lc2RheSwgT2N0b2JlciAxMywgMjAyMSAzOjQ0IFBNDQo+IFRvOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBz
c3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5N
YXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gU3ViamVj
dDogUkU6IFtQQVRDSCAxMC8xMV0geGVuL2FybTogZGV2aWNlIGFzc2lnbm1lbnQgb24gMToxIGRp
cmVjdC1tYXANCj4gZG9tYWluDQo+IA0KPiBIaSBKdWxpZW4NCj4gDQo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0K
PiA+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxMSwgMjAyMSA3OjE0IFBNDQo+ID4gVG86IFBlbm55
IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnOw0KPiA+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gPiBDYzogQmVydHJhbmQgTWFycXVp
cyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4gPiA8V2VpLkNoZW5AYXJt
LmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDEwLzExXSB4ZW4vYXJtOiBkZXZpY2UgYXNz
aWdubWVudCBvbiAxOjENCj4gPiBkaXJlY3QtbWFwIGRvbWFpbg0KPiA+DQo+ID4NCj4gPg0KPiA+
IE9uIDA5LzEwLzIwMjEgMTA6NDAsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+ID4gSGkgSnVsaWVu
DQo+ID4NCj4gPiBIaSBQZW5ueSwNCj4gPg0KPiA+ID4NCj4gPiA+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+
ID4gPj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAyMywgMjAyMSA3OjI3IFBNDQo+ID4gPj4g
VG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsNCj4gPiA+PiB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gPiA+PiBDYzog
QmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4g
PiA+PiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDEwLzEx
XSB4ZW4vYXJtOiBkZXZpY2UgYXNzaWdubWVudCBvbiAxOjENCj4gPiA+PiBkaXJlY3QtbWFwIGRv
bWFpbg0KPiA+ID4+DQo+ID4gPj4gSGksDQo+ID4gPj4NCj4gPiA+PiBPbiAyMy8wOS8yMDIxIDA4
OjExLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiA+Pj4gVXNlciBjb3VsZCBkbyBkZXZpY2UgcGFz
c3Rocm91Z2gsIHdpdGgNCj4gPiA+Pj4gInhlbixmb3JjZS1hc3NpZ24td2l0aG91dC1pb21tdSIg
aW4gdGhlIGRldmljZSB0cmVlIHNuaXBwZXQsIG9uDQo+ID4gPj4+IHRydXN0ZWQgZ3Vlc3QgdGhy
b3VnaCAxOjEgZGlyZWN0LW1hcCwgaWYgSU9NTVUgYWJzZW50IG9yIGRpc2FibGVkDQo+ID4gPj4+
IG9uDQo+ID4gPj4gaGFyZHdhcmUuDQo+ID4gPj4NCj4gPiA+PiBBdCB0aGUgbW9tZW50LCBpdCB3
b3VsZCBiZSBwb3NzaWJsZSB0byBwYXNzdGhyb3VnaCBhIG5vbi1ETUENCj4gPiA+PiBjYXBhYmxl
IGRldmljZSB3aXRoIGRpcmVjdC1tYXBwaW5nLiBBZnRlciB0aGlzIHBhdGNoLCB0aGlzIGlzIGdv
aW5nIHRvIGJlDQo+IGZvcmJpZGRlbi4NCj4gPiA+Pg0KPiA+ID4+Pg0KPiA+ID4+PiBJbiBvcmRl
ciB0byBhY2hpZXZlIHRoYXQsIHRoaXMgcGF0Y2ggYWRkcyAxOjEgZGlyZWN0LW1hcCBjaGVjayBh
bmQNCj4gPiA+Pj4gZGlzYWJsZXMgaW9tbXUtcmVsYXRlZCBhY3Rpb24uDQo+ID4gPj4+DQo+ID4g
Pj4+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+
ID4+PiAtLS0NCj4gPiA+Pj4gICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMTIgKysr
KysrKystLS0tDQo+ID4gPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+ID4gPj4+DQo+ID4gPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMNCj4gPiA+Pj4gYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgaW5k
ZXggYzkyZTUxMGFlNy4uOWE5ZDI1MjJiNyAxMDA2NDQNCj4gPiA+Pj4gLS0tIGEveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jDQo+ID4gPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYw0KPiA+ID4+PiBAQCAtMjA3MCwxNCArMjA3MCwxOCBAQCBzdGF0aWMgaW50IF9faW5pdA0K
PiA+ID4+IGhhbmRsZV9wYXNzdGhyb3VnaF9wcm9wKHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8s
DQo+ID4gPj4+ICAgICAgICBpZiAoIHJlcyA8IDAgKQ0KPiA+ID4+PiAgICAgICAgICAgIHJldHVy
biByZXM7DQo+ID4gPj4+DQo+ID4gPj4+ICsgICAgLyoNCj4gPiA+Pj4gKyAgICAgKiBJZiB4ZW5f
Zm9yY2UsIHdlIGFsbG93IGFzc2lnbm1lbnQgb2YgZGV2aWNlcyB3aXRob3V0IElPTU1VDQo+ID4g
Pj4gcHJvdGVjdGlvbi4NCj4gPiA+Pj4gKyAgICAgKiBBbmQgaWYgSU9NTVUgaXMgZGlzYWJsZWQg
b3IgYWJzZW50LCAxOjEgZGlyZWN0LW1hcCBpcw0KPiA+ID4+PiArIG5lY2Vzc2FyeSA+ICsNCj4g
PiA+PiAqLw0KPiA+ID4+PiArICAgIGlmICggeGVuX2ZvcmNlICYmIGlzX2RvbWFpbl9kaXJlY3Rf
bWFwcGVkKGtpbmZvLT5kKSAmJg0KPiA+ID4+PiArICAgICAgICAgIWR0X2RldmljZV9pc19wcm90
ZWN0ZWQobm9kZSkgKQ0KPiA+ID4+DQo+ID4gPj4gZHRfZGV2aWNlX2lzX3Byb3RlY3RlZCgpIHdp
bGwgYmUgYWx3YXlzIGZhbHNlIHVubGVzcyB0aGUgZGV2aWNlIGlzDQo+ID4gPj4gcHJvdGVjdGVk
IGJlaGluZyBhbiBTTU1VIHVzaW5nIHRoZSBsZWdhY3kgYmluZGluZy4gU28gSSBkb24ndCB0aGlu
aw0KPiA+ID4+IHRoaXMgaXMgY29ycmVjdCB0byBtb3ZlIHRoaXMgY2hlY2sgYWhlYWQuIEluIGZh
Y3QuLg0KPiA+ID4+DQo+ID4gPj4+ICsgICAgICAgIHJldHVybiAwOw0KPiA+ID4+PiArDQo+ID4g
Pj4+ICAgICAgICByZXMgPSBpb21tdV9hZGRfZHRfZGV2aWNlKG5vZGUpOw0KPiA+ID4+DQo+ID4g
Pj4gLi4uIHRoZSBjYWxsIHNob3VsZCBhbHJlYWR5IGJlIGEgTk9QIHdoZW4gdGhlIElPTU1VIGlz
IGRpc2FibGVkIG9yDQo+ID4gPj4gdGhlIGRldmljZSBpcyBub3QgYmVoaW5kIGFuIElPTU1VLiBT
byBjYW4geW91IGV4cGxhaW4gd2hhdCB5b3UgYXJlDQo+ID4gPj4gdHJ5aW5nIHRvIHByZXZlbnQg
aGVyZT8NCj4gPiA+Pg0KPiA+ID4NCj4gPiA+IElmIHRoZSBJT01NVSBpcyBkaXNhYmxlZCwgaW9t
bXVfYWRkX2R0X2RldmljZSB3aWxsIHJldHVybiAxIGFzIGVycm5vLg0KPiA+ID4gU28gd2UgY291
bGQgbm90IG1ha2UgaXQgdG8gdGhlIHhlbl9mb3JjZSBjaGVjay4uLg0KPiA+DQo+ID4gSSBkaXNh
Z3JlZS4gVGhlIGNoZWNrIGlzOg0KPiA+DQo+ID4gaWYgKCByZXMgPCAwICkNCj4gPiAgICByZXR1
cm4gcmVzOw0KPiA+DQo+ID4gR2l2ZW4gdGhhdCByZXMgaXMgMSwgd2Ugd291bGRuJ3QgcmV0dXJu
IGFuZCBtb3ZlIHRvIGNoZWNrIHdoZXRoZXIgdGhlDQo+ID4gYXNzaWdubWVudCBjYW4gYmUgZG9u
ZS4NCj4gPg0KPiA+ID4NCj4gPiA+IFNvIEkgdHJpZWQgdG8gbW92ZSBhbGwgSU9NTVUgYWN0aW9u
IGJlaGluZCB4ZW5fZm9yY2UgY2hlY2suDQo+ID4gPg0KPiA+ID4gTm93LCBkZXZpY2UgYXNzaWdu
bWVudCB3aXRob3V0IElPTU1VIHByb3RlY3Rpb24gaXMgb25seSBhcHBsaWNhYmxlDQo+ID4gPiBv
biBkaXJlY3QtbWFwIGRvbWFpbnMsDQo+ID4NCj4gPiBJdCBpcyBmaW5lIHRvIGFzc2lnbiBhIG5v
bi1ETUEgY2FwYWJsZSBkZXZpY2Ugd2l0aG91dCBkaXJlY3QtbWFwcGluZy4NCj4gPiBTbyB3aHkg
ZG8geW91IHdhbnQgdG8gYWRkIHRoaXMgcmVzdHJpY3Rpb24/DQo+ID4NCj4gDQo+IFdoZW4gY29u
c3RydWN0aW5nIGRpcmVjdC1tYXAtdjIsIGZvdW5kIHRoYXQsIGluDQo+IHhlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYw0KPiANCj4gaWYgKCBkdF9maW5kX2NvbXBhdGlibGVfbm9kZShub2RlLCBO
VUxMLCAibXVsdGlib290LGRldmljZS10cmVlIikgKQ0KPiAgICAgZF9jZmcuZmxhZ3MgfD0gWEVO
X0RPTUNUTF9DREZfaW9tbXU7DQo+IA0KPiBBbmQgdGhpcyBmbGFnIFhFTl9ET01DVExfQ0RGX2lv
bW11IGRldGVybWluZXMgd2hldGhlciBpb21tdSBpcw0KPiBlbmFibGVkLg0KPiANCj4gSW4gLi94
ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPiANCj4gc3RhdGljIGFsd2F5c19pbmxpbmUgYm9vbCBp
c19pb21tdV9lbmFibGVkKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpIHsNCj4gICAgIHJldHVybiBl
dmFsdWF0ZV9ub3NwZWMoZC0+b3B0aW9ucyAmIFhFTl9ET01DVExfQ0RGX2lvbW11KTsgfQ0KPiAN
Cj4gVGhhdCBpcywgZXZlbiBpZiB3ZSBhc3NpZ24gYSBub24tRE1BIGNhcGFibGUgZGV2aWNlLCB3
ZSByZXF1ZXN0IHRoZSBwbGF0Zm9ybQ0KPiB0byBiZSBpb21tdSBlbmFibGVkLg0KPg0KDQpJIGlu
dGVuZCB0byBjaGFuZ2UgaXQgdG8NCg0KICAgICAgICBpZiAoIGR0X2ZpbmRfY29tcGF0aWJsZV9u
b2RlKG5vZGUsIE5VTEwsICJtdWx0aWJvb3QsZGV2aWNlLXRyZWUiKSApDQogICAgICAgIHsNCiAg
ICAgICAgICAgIGlmICggaW9tbXVfZW5hYmxlZCApDQogICAgICAgICAgICAgICAgZF9jZmcuZmxh
Z3MgfD0gWEVOX0RPTUNUTF9DREZfaW9tbXU7DQogICAgICAgICAgICBlbHNlIGlmICggZF9jZmcu
ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9kaXJlY3RtYXAgKQ0KICAgICAgICAgICAgICAgIHdhcm5p
bmdfYWRkKCJQbGVhc2UgYmUgc3VyZSBvZiBoYXZpbmcgdHJ1c3RlZCBndWVzdHMsIHdoZW4gZG9p
bmcgZGV2aWNlIGFzc2lnbm1lbnQgd2l0aG91dCBJT01NVSBwcm90ZWN0aW9uXG4iKTsNCiAgICAg
ICAgfQ0KDQo+ID4gQ2hlZXJzLA0KPiA+DQo+ID4gLS0NCj4gPiBKdWxpZW4gR3JhbGwNCg==

