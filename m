Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B5010E7C3
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 10:39:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibi7r-0002Pu-Gj; Mon, 02 Dec 2019 09:36:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OaOo=ZY=atos.net=marc.doz.external@srs-us1.protection.inumbo.net>)
 id 1ibi7o-0002Pp-U9
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 09:36:13 +0000
X-Inumbo-ID: 2c703b5e-14e7-11ea-a55d-bc764e2007e4
Received: from smtppost.atos.net (unknown [193.56.114.177])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c703b5e-14e7-11ea-a55d-bc764e2007e4;
 Mon, 02 Dec 2019 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atos.net; i=@atos.net; q=dns/txt; s=mail;
 t=1575279371; x=1606815371;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hN8IV2kJidLPdk3SCAmKVDCyAcdl8Evg7HMa5AsIw24=;
 b=Ej96G44zE3oWtnvYoZFqkkkcePed814kwJ90O4QhKYAU/yZ225VDItx9
 6aTCJNuLx2ipcG1yj9XtUYO66D2Pq1PL0JJsbe3PsIrTZ8uLJLx8btmo7
 r51JR+3ZovimHhFCnxHpvkZhSUL9ppaNjbkp8wqAXGLDcCvSBUpm5gtpU I=;
IronPort-SDR: Lx+76fgQ0Vwy2JMdGnxZcWPbuJzd6NRmGA4vgICIyM247h/QYJ11saTBEKk1jJgxQ/4QWGrYYK
 uJsNrYwMBFmqN1HgATJ5lCsh6wORnRmdQ/r26BpVlVn0kTT3EVlRmtXm1cUcbBPeBD6pf0ayHg
 VO1aAAdurG2Br2U7ym9drbjnBLADFT2Syr2fJwL3waQevkcKpf/L/8rxDE3hQURXfhheQfqfwF
 PrYSbOc/AK0tXkYPvmaFAXCY/p9Xwi05zXft8mApe5bgrmRptaj/iP1fMSOU5FlfF6N1pxH9v0
 hRnGJr6WlRr2T6l5xIvrEjoi
X-IronPort-AV: E=Sophos;i="5.69,268,1571695200"; d="scan'208";a="11628621"
X-MGA-submission: =?us-ascii?q?MDHjy4FThkjECZzvjX4jT4wa1urbR4G4RRI7l9?=
 =?us-ascii?q?X0DEQjzaUXL6cciErUq8+dbJtcGdMNcinPMnZxkBnC/raohnFHeQamDh?=
 =?us-ascii?q?tG3G8dDeX9tjAned66o1AGJ0BYZqFyOja7pzRdMWBSlH3ji4psN7wYAd?=
 =?us-ascii?q?cv?=
Received: from unknown (HELO DEERLM99ETTMSX.ww931.my-it-solutions.net)
 ([10.86.142.105])
 by smtppost.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
 02 Dec 2019 10:36:09 +0100
Received: from DEERLM99ETUMSX.ww931.my-it-solutions.net (10.86.142.96) by
 DEERLM99ETTMSX.ww931.my-it-solutions.net (10.86.142.105) with Microsoft SMTP
 Server (TLS) id 14.3.468.0; Mon, 2 Dec 2019 10:36:08 +0100
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (10.86.142.137)
 by hybridsmtp.it-solutions.atos.net (10.86.142.96) with Microsoft SMTP Server
 (TLS) id 14.3.468.0; Mon, 2 Dec 2019 10:36:08 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijCGADiJ2XgUYZucvta9yfoDykHmc1RxE7FYHh0X/fhQNpMdUljA50rZaQgVsLFMOPr6C45sRKXE/klSKrSTd3oeh+QM6Vi0wHNkOjxiVlcCJzn5J20UiRWyGpeFRz4YbxwiOs2Asm1pEYR57Jaul+H8G88aE3Y0fUDYt++3u5Z/aTsnm1XvPWUi+57bkaujxkqcLlAy+g3BXN7FQhM4YdodQGSHeb7zqt6OaVtiS/sj3iLOSrBwtyDYDCPyLhexKPpb0klrhGOVjAA6kUA9rtpwT9OqEb0Y27GKz5I4csVgFEdCmtBKrUsJUr1coG79PESBW+JOB/rLzTlPsMUKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN8IV2kJidLPdk3SCAmKVDCyAcdl8Evg7HMa5AsIw24=;
 b=PWS80RbRkN54R6kOszJYuaJfnWXfKbIKLOhYtevERaK45Kmu49YLn/xhdzpgEO/bi8ugScGf89a/wV+OaUK32X0KJvK8JPu7oUCFptacMmZwGAc7lqapwIEZemrUGgofJcOkeV4xLGMsrmXjy5/QQkRjfbRHP7iF6/I+tnwlZoxdzLhgmZ73SaZPtmgD04Xfu7Lzdv/wH6V/i5KyjlpdRAUmXzkvXzsHtP7B7wd8svmGkdq1g9TrIFQeb783h/5FjViA0dn7CfqoQKvI1ZzpaMfV1zM5ytQvrrNc8UhBViZH+ZeFFylwiAMRras6VCmUQwCLKRkhbN1vIrdDjwr0Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atos.net; dmarc=pass action=none header.from=atos.net;
 dkim=pass header.d=atos.net; arc=none
Received: from AM0PR02MB4385.eurprd02.prod.outlook.com (20.178.19.77) by
 AM0PR02MB3699.eurprd02.prod.outlook.com (52.134.87.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Mon, 2 Dec 2019 09:36:07 +0000
Received: from AM0PR02MB4385.eurprd02.prod.outlook.com
 ([fe80::ad0d:e99a:ae83:2f3]) by AM0PR02MB4385.eurprd02.prod.outlook.com
 ([fe80::ad0d:e99a:ae83:2f3%4]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 09:36:07 +0000
From: "DOZ, MARC (ext)" <marc.doz.external@atos.net>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] bug suspcion and proposed modification when
 xen-pciback failed to map an irq (-19) to a domU
Thread-Index: AdWmkKtK1mIfCnPYTFqu2ZiOwgqUvwAEPQGAAAOYXhAAAllXgACOV9Eg
Date: Mon, 2 Dec 2019 09:36:07 +0000
Message-ID: <AM0PR02MB43853A51BB40E3A5604A8C27D3430@AM0PR02MB4385.eurprd02.prod.outlook.com>
References: <AM0PR02MB4385A7921A8F857539C71241D3460@AM0PR02MB4385.eurprd02.prod.outlook.com>
 <8e1dd854-b5d0-b433-50f1-0bfb1ec6b31a@suse.com>
 <AM0PR02MB43853D082C1BC7416DED0064D3460@AM0PR02MB4385.eurprd02.prod.outlook.com>
 <3bf372da-4a89-090a-5573-2d12c654ac52@suse.com>
In-Reply-To: <3bf372da-4a89-090a-5573-2d12c654ac52@suse.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marc.doz.external@atos.net; 
x-originating-ip: [217.115.65.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e387e3f-8184-4a1a-ffea-08d7770b0ed9
x-ms-traffictypediagnostic: AM0PR02MB3699:
x-microsoft-antispam-prvs: <AM0PR02MB369911CADB11404CE765C707D3430@AM0PR02MB3699.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(396003)(366004)(39860400002)(376002)(13464003)(189003)(199004)(478600001)(66446008)(8936002)(66556008)(6916009)(66946007)(2501003)(25786009)(66066001)(71200400001)(64756008)(86362001)(33656002)(14444005)(3846002)(316002)(256004)(2906002)(229853002)(81156014)(966005)(5660300002)(6436002)(9686003)(14454004)(8676002)(45080400002)(71190400001)(74316002)(99286004)(5640700003)(2351001)(6306002)(55016002)(6506007)(102836004)(6246003)(53546011)(6116002)(7736002)(305945005)(26005)(52536014)(76176011)(55236004)(7696005)(81166006)(76116006)(446003)(11346002)(186003)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB3699;
 H:AM0PR02MB4385.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: atos.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uwNyTw3t2tdKJRaaSaW0KlVQUM0cVD7APMvyE8DxsPevBKUc5DSeAsU8WadjqJ1EWlocSduHP3ENyTB3GZTNK7WRJemDy47NYkcWvNR6Jv86Vz9nL+oHqIXRkVQF2vtPSPBDqY9kBLeuVC/jbqWz/dRrw/MwhC03MtuHKVsy76FcZ7o+XX6RMcXZ7enjTuE9zS3ZKtifRXdBMBSByF2Qj9dU3kHjhl3B8B5m5EzCf4lkyQNcZGO5GE6Y58ltgvMAPJGxioPXS1TXD7px5Rr0QwtV8AtgZChWUtkTk2P5s6Ryg40m9BOroEe3Txe9P/NM//2rP4D5boyN9Ac/sqavfvAwG3na8zEKX+F0GiiTtjr9ezRoUj8Xuc7dKe5XIJGbQYSHVrSw/qDFTufJ+XfNxkUF6HPqFacGCh/v9fnMruPzayxAF58z8S/OseHuM578
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e387e3f-8184-4a1a-ffea-08d7770b0ed9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 09:36:07.2998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zUqNLiUEgC348m93Zx9eeJnN7IiG5ZK4IP64yT8mM8EbSFupZwMFZF9VaJ7glcaCEuqpzk4s8LVLq+1k0yt47w8OIRyJ7kQRXs4VCCgQYbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3699
X-OriginatorOrg: atos.net
Subject: Re: [Xen-devel] bug suspcion and proposed modification when
 xen-pciback failed to map an irq (-19) to a domU
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2ssDQoNCkkgaGF2ZSBhIHRydXN0ZWQgc29mdHdhcmUgdG8gbG9jYWx5IGNvbmZpZ3VyZSB0aGUg
ZXRoZXJuZXQgZGV2aWNlIGFzc2lnbm1lbnQuIEkgd2lsbCBwcm9iYWJseSBhZGQgYSAicHJlLWNv
b2tlZCB3YXkiIHRvIHNoYXJlIHRoZSBjb25maWd1cmF0aW9uIHRvIHRoZSBoeXBlcnZpc29yIGFu
ZCBhbGxvdyB0aGUgTVNJIGNvbmZpZ3VyYXRpb24gZnJvbSBhIGRldmljZSBvbmx5IHdpdGggb25s
eSBvbmUgZ3JhbnRlZCBkb21haW4uDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRoZSBoZWxw
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IA0KU2VudDogRnJpZGF5LCBOb3ZlbWJlciAyOSwgMjAxOSAyOjMyIFBNDQpU
bzogRE9aLCBNQVJDIChleHQpIDxtYXJjLmRvei5leHRlcm5hbEBhdG9zLm5ldD4NCkNjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBidWcg
c3VzcGNpb24gYW5kIHByb3Bvc2VkIG1vZGlmaWNhdGlvbiB3aGVuIHhlbi1wY2liYWNrIGZhaWxl
ZCB0byBtYXAgYW4gaXJxICgtMTkpIHRvIGEgZG9tVQ0KDQpPbiAyOS4xMS4yMDE5IDEzOjM0LCAg
RE9aLCBNQVJDIChleHQpICB3cm90ZToNCj4gDQo+PiBFeGNlcHQgdGhhdCB0aGlzIGlzIG5vdCBh
ICJmaXgiLCBidXQgdGhlIGludHJvZHVjdGlvbiBvZiBhIHNlY3VyaXR5IHZ1bG5lcmFiaWxpdHkg
KHBlcm1pdHRpbmcgaW50ZXJydXB0IHNldHVwIG9uIHVuLW93bmVkIGRldmljZXMpLiBTZWUgWFNB
LTIzNywgd2hpY2ggYWN0dWFsbHkgY2hhbmdlZCBpdCBpbiB0aGUgb3Bwb3NpdGUgZGlyZWN0aW9u
IG9mIHdoYXQgeW91J3JlIHByb3Bvc2luZy4NCj4gDQo+IE9rLCBJIGZvdW5kIGl0IDoNCj4gaHR0
cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNB
JTJGJTJGeGVuYg0KPiBpdHMueGVuLm9yZyUyRnhzYSUyRnhzYTIzNy00LjUlMkYwMDAxLXg4Ni1k
b250LWFsbG93LU1TSS1wSVJRLW1hcHBpbmctDQo+IG9uLXVub3duZWQtZGV2aWNlLnBhdGNoJmFt
cDtkYXRhPTAyJTdDMDElN0NtYXJjLmRvei5leHRlcm5hbCU0MGF0b3MubmUNCj4gdCU3Q2RkYzE4
MTg5Yjc4ZDQ3ZTAxNjVkMDhkNzc0ZDA5YTRhJTdDMzM0NDBmYzZiN2M3NDEyY2JiNzMwZTcwYjAx
OThkNQ0KPiBhJTdDMCU3QzAlN0M2MzcxMDYzMTE1OTQ1ODU4MTcmYW1wO3NkYXRhPTFFYVluN1BF
Nm4ySlp4bGRFY2lCbGE3UUJXQlJXDQo+IGpaVXVndEVnbUNudVo0JTNEJmFtcDtyZXNlcnZlZD0w
DQo+IA0KPiAiTVNJIHNldHVwIHNob3VsZCBiZSBwZXJtaXR0ZWQgb25seSBmb3IgZXhpc3Rpbmcg
ZGV2aWNlcyBvd25lZCBieSB0aGUgcmVzcGVjdGl2ZSBndWVzdCIgDQo+IA0KPiBCdXQgaG93IHRv
IGNoYW5nZSB0aGUgb3duZXIgb2YgbXkgZGV2aWNlIG9yIHVwZGF0ZSB0aGUgcGRldi0+ZG9tYWlu
LT5kb21haW5faWQgPw0KDQpXaXRoIHRoZSBjb2RlIGFzIGlzIGFuZCB3aXRob3V0IGFuIElPTU1V
IHRoZXJlJ3Mgbm8gcHJlLWNvb2tlZCB3YXkgdG8sIEknbSBhZnJhaWQuIFlvdSBjb3VsZCB0cnkg
Z3JhbnRpbmcgdGhlIGd1ZXN0IGFjY2VzcyB0byBNTUlPIGFuZCBJUlEgIm1hbnVhbGx5IiAodGhl
cmUgYXJlIGd1ZXN0IGNvbmZpZyBmaWxlIG9wdGlvbnMgZm9yIHRoaXMpLCBidXQgSSB0YWtlIGl0
IHlvdSdsbCBiZSBpbiB0cm91YmxlIGlmIChhcyBpaXJjIHlvdSd2ZQ0Kc2FpZCkgdGhlIGRldmlj
ZSAvIGRyaXZlciB3YW50IHRvIHVzZSBNU0kuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
