Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4814A13F7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 10:40:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Fvs-0002MI-RP; Thu, 29 Aug 2019 08:37:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bIzd=WZ=renesas.com=yoshihiro.shimoda.uh@srs-us1.protection.inumbo.net>)
 id 1i3Fvr-0002MA-GF
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 08:37:27 +0000
X-Inumbo-ID: 36c1c59a-ca38-11e9-ae62-12813bfff9fa
Received: from JPN01-OS2-obe.outbound.protection.outlook.com (unknown
 [40.107.141.110]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36c1c59a-ca38-11e9-ae62-12813bfff9fa;
 Thu, 29 Aug 2019 08:37:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b18ciz/bR8ImuDcRMLolJ3woHOAq3oTGwF6ClgCPy+rcp5bvnut/b3QpWBV6V7vk7teFMpXzG1UVp5W2FscNC5MookJ2D/nOwgbR+TKo4ri59AavTRNCeb1hATtZhYem6DydLldDYHSZGhtmmFI5xRkedHNiOxyRYCTNlM+DMAt0xGJ6UfBefOGaII9uFSvwBVfy/j4a1jk+Q5gX1VHKqRKIdmiRiNEe7Cgu/Mo1WAYWzh+fcka3yUn6FwzRD8zphQ8PNbTuSMmKzu7zmNGIzR8j7LDqGaC8CK200ib5dbZaPUIZ2hjVYpvHQcpB06MZ+DpZgAU/SQhL/ouKH9nE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Z0TfeUI/XyHXjrwxMyHYcgQKWONPK2TnYrqYrJO6qE=;
 b=TNxFKggeryHOdNqA8+rmcGRriS5BZMoB12womMi03sDXLjY70UT1nbXk7xghdouHKPgszQj8ccba9YYkpOR/zuLqNa6WNUlMRMzHVmXgpOsfYoVOFieVwDSVbVlhCpgB9sA3rQ9zQ7HYcsjDehSYFBbf2TMkI9EDJMm00z5YmHhe5HA6vsJt9eq8FtTcUV80nqxWd+B/vbuUdu45sqfR47O+SmX/YAL+mSSaskPvyTwg+xxEINWtP72Dr5eUZ19V7AYgZt5Nbcp8SYBpheuRxvP2Fh9e48SXnndhzuoeBS9mSh5kRn6wd9m/XF8wbYQ/ORSrdkhIwBqbbW3rniUefA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Z0TfeUI/XyHXjrwxMyHYcgQKWONPK2TnYrqYrJO6qE=;
 b=rTAdhbOCtdIMTd6MYsFnDflFJJEd/XNc0ew0phCZMyDWAwuTEiUJDELz41C1HrqwdDQ+zdYih4XICAA5pW+X+3bxuAmYnVEUXte+2M4Kav+wQRsaYnXBf+ZvrnuvnqRMNSllWupOhUEcSjGVysOMEpzXT2Pfpwm+GBgm1s6ojls=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2845.jpnprd01.prod.outlook.com (20.177.103.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 29 Aug 2019 08:37:17 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2220.013; Thu, 29 Aug 2019
 08:37:17 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V3 8/8] iommu/arm: Add Renesas IPMMU-VMSA support
Thread-Index: AQHVV4KHnFAZbwg7rk6F2A7t010DiKcR2U9w
Date: Thu, 29 Aug 2019 08:37:16 +0000
Message-ID: <TYAPR01MB4544A44A2BDFADD533AF6D1AD8A20@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-9-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1566324587-3442-9-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be6c7b4a-b1e5-4756-4dc7-08d72c5c1958
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TYAPR01MB2845; 
x-ms-traffictypediagnostic: TYAPR01MB2845:
x-microsoft-antispam-prvs: <TYAPR01MB2845E44A14C64D59B726EDEFD8A20@TYAPR01MB2845.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(199004)(189003)(53936002)(66476007)(66446008)(66556008)(64756008)(110136005)(54906003)(316002)(8676002)(81156014)(74316002)(305945005)(7736002)(81166006)(8936002)(11346002)(476003)(478600001)(446003)(486006)(71200400001)(71190400001)(33656002)(2501003)(6116002)(3846002)(256004)(66946007)(76116006)(4326008)(66066001)(25786009)(55016002)(2906002)(9686003)(14454004)(102836004)(6506007)(5660300002)(52536014)(186003)(6246003)(229853002)(26005)(7696005)(86362001)(14444005)(99286004)(76176011)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TYAPR01MB2845;
 H:TYAPR01MB4544.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KSWoEbI0mTWs6ow2hByrW5AAqNYqKN4RVbbD1S2att5I7QwYWEKXVVprmq7w0To15no3Ne2+rE5KKcyjynznUd867CfZ5A4PLvvFk+nrRb5oYx1FSBaXCcz9UdYkLGUxpy84ZuuE5mEwwCE+8C7o7U7JKtUGKO6jovqs4uDlHnlorn8qful3aQB3U/AsRMFwZDL0LA3dUMXKyU1CHHhpxMZhoBII+6hcNrmYuRUIytORvExQmI5RZ3f8UJxqjSjBjVBoK5L/WqXv4R8UZODNoizvWDAylfV/kyACKLWNL0SFSmVM9NgSwzHy9U59FUGMzr9HvaTnUWeJz4sNpBpqhJu/mXRpf9yjehy/WAjL0j0bqukj1JcHhV4mJwwy4RztJFf4oGBWxHp/r9J7qeylXAlzuMzaxuYbOPPE/7kaB1o=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be6c7b4a-b1e5-4756-4dc7-08d72c5c1958
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 08:37:16.8246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: beM//hH4fuydNO3hLrvwp/LH1L4SKsq4tB2BEAMOL7cbDxlZTEHIdQ8ehkBeviSFQD1cDQtf/guPxWgLIdrBwHF/+Fnbl3PNVKZRlWNFAYs/dADgWdFONKeJVAf4qOes
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2845
Subject: Re: [Xen-devel] [PATCH V3 8/8] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLXNhbiwKCj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28sIFNlbnQ6IFdl
ZG5lc2RheSwgQXVndXN0IDIxLCAyMDE5IDM6MTAgQU0KPiAKPiBGcm9tOiBPbGVrc2FuZHIgVHlz
aGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4gCj4gVGhlIElQTU1VLVZN
U0EgaXMgVk1TQS1jb21wYXRpYmxlIEkvTyBNZW1vcnkgTWFuYWdlbWVudCBVbml0IChJT01NVSkK
PiB3aGljaCBwcm92aWRlcyBhZGRyZXNzIHRyYW5zbGF0aW9uIGFuZCBhY2Nlc3MgcHJvdGVjdGlv
biBmdW5jdGlvbmFsaXRpZXMKPiB0byBwcm9jZXNzaW5nIHVuaXRzIGFuZCBpbnRlcmNvbm5lY3Qg
bmV0d29ya3MuCj4gCj4gUGxlYXNlIG5vdGUsIGN1cnJlbnQgZHJpdmVyIGlzIHN1cHBvc2VkIHRv
IHdvcmsgb25seSB3aXRoIG5ld2VzdAo+IEdlbjMgU29DcyByZXZpc2lvbnMgd2hpY2ggSVBNTVUg
aGFyZHdhcmUgc3VwcG9ydHMgc3RhZ2UgMiB0cmFuc2xhdGlvbgoKVGhpcyBpcyBzdGlsbCAiR2Vu
MyIsIHNvIHRoYXQgcGxlYXNlIHJlcGxhY2UgaXQgd2l0aCAiUi1DYXIgR2VuMyIuLi4KCj4gdGFi
bGUgZm9ybWF0IGFuZCBpcyBhYmxlIHRvIHVzZSBDUFUncyBQMk0gdGFibGUgYXMgaXMgaWYgb25l
IGlzCj4gMy1sZXZlbCBwYWdlIHRhYmxlICh1cCB0byA0MCBiaXQgSVBBKS4KPiAKPiBUaGUgbWFq
b3IgZGlmZmVyZW5jZXMgY29tcGFyZSB0byB0aGUgTGludXggZHJpdmVyIGFyZToKPiAKPiAxLiBT
dGFnZSAxL1N0YWdlIDIgdHJhbnNsYXRpb24uIExpbnV4IGRyaXZlciBzdXBwb3J0cyBTdGFnZSAx
Cj4gdHJhbnNsYXRpb24gb25seSAod2l0aCBTdGFnZSAxIHRyYW5zbGF0aW9uIHRhYmxlIGZvcm1h
dCkuIEl0IG1hbmFnZXMKPiBwYWdlIHRhYmxlIGJ5IGl0c2VsZi4gQnV0IFhlbiBkcml2ZXIgc3Vw
cG9ydHMgU3RhZ2UgMiB0cmFuc2xhdGlvbgo+ICh3aXRoIFN0YWdlIDIgdHJhbnNsYXRpb24gdGFi
bGUgZm9ybWF0KSB0byBiZSBhYmxlIHRvIHNoYXJlIHRoZSBQMk0KPiB3aXRoIHRoZSBDUFUuIFN0
YWdlIDEgdHJhbnNsYXRpb24gaXMgYWx3YXlzIGJ5cGFzc2VkIGluIFhlbiBkcml2ZXIuCj4gCj4g
U28sIFhlbiBkcml2ZXIgaXMgc3VwcG9zZWQgdG8gYmUgdXNlZCB3aXRoIG5ld2VzdCBSLUNhciBH
ZW4zIFNvQyByZXZpc2lvbnMKPiBvbmx5IChIMyBFUzMuMCwgTTMtVyssIGV0Yy4pIHdoaWNoIElQ
TU1VIEgvVyBzdXBwb3J0cyBzdGFnZSAyIHRyYW5zbGF0aW9uCj4gdGFibGUgZm9ybWF0Lgo+IAo+
IDIuIEFBcmNoNjQgc3VwcG9ydC4gTGludXggZHJpdmVyIHVzZXMgVk1TQXY4LTMyIG1vZGUsIHdo
aWxlIFhlbiBkcml2ZXIKPiBlbmFibGVzIEFybXY4IFZNU0F2OC02NCBtb2RlIHRvIGNvdmVyIHVw
IHRvIDQwIGJpdCBpbnB1dCBhZGRyZXNzLgo+IAo+IDMuIENvbnRleHQgYmFuayAoc2V0cyBvZiBw
YWdlIHRhYmxlKSB1c2FnZS4gSW4gWGVuLCBlYWNoIGNvbnRleHQgYmFuayBpcwo+IG1hcHBlZCB0
byBvbmUgWGVuIGRvbWFpbi4gU28sIGFsbCBkZXZpY2VzIGJlaW5nIHBhc3MgdGhyb3VnaGVkIHRv
IHRoZQo+IHNhbWUgWGVuIGRvbWFpbiBzaGFyZSB0aGUgc2FtZSBjb250ZXh0IGJhbmsuCj4gCj4g
NC4gSVBNTVUgZGV2aWNlIHRyYWNraW5nLiBJbiBYZW4sIGFsbCBJT01NVSBkZXZpY2VzIGFyZSBt
YW5hZ2VkCj4gYnkgc2luZ2xlIGRyaXZlciBpbnN0YW5jZS4gU28sIGRyaXZlciB1c2VzIGdsb2Jh
bCBsaXN0IHRvIGtlZXAgdHJhY2sKPiBvZiByZWdpc3RlcmVkIElQTU1VIGRldmljZXMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IEND
OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+CgpB
Ym91dCB0aGlzIGhhcmR3YXJlIGhhbmRsaW5nLCB0aGlzIHBhdGNoIHNlZW1zIGdvb2QgdG8gbWUu
IEJ1dCwgc2luY2UKSSdtIG5vdCBmYW1pbGlhciBhYm91dCBYZW4gcGFzc3Rocm91Z2ggZnJhbWV3
b3JrLCBJIHRoaW5rIEkgY2Fubm90CmFkZCBteSBSZXZpZXdlZC1ieSB0YWcgaW50byB0aGlzIHBh
dGNoLiBXaGF0IGRvIHlvdSB0aGluaz8KCkJlc3QgcmVnYXJkcywKWW9zaGloaXJvIFNoaW1vZGEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
