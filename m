Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 718B912CAB2
	for <lists+xen-devel@lfdr.de>; Sun, 29 Dec 2019 20:57:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilee3-0006rV-H2; Sun, 29 Dec 2019 19:54:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DfPw=2T=microsoft.com=mikelley@srs-us1.protection.inumbo.net>)
 id 1ilee1-0006rQ-NT
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 19:54:33 +0000
X-Inumbo-ID: 07cd9fbe-2a75-11ea-9fb6-12813bfff9fa
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.243.94]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07cd9fbe-2a75-11ea-9fb6-12813bfff9fa;
 Sun, 29 Dec 2019 19:54:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eU3aBIBQkcGjvRLO4FcKP5f5myoMlm7dS9awwIVOuXrY6wBQ0kAh4vXY/oJ/gekBusxLMvy5KhnB1Bj+MFx9t3ReINnksa6/zUWrNZVQ+0JyOyRGW5Zj+cA3d1dDtrCO2i7Vti1PkMZW/bsZDVLF10I0I2JX9bfT03nVic+YdIDxs3e1sGJ+y3AIwkt3ZBxmLpABo3z7mvd55lzLMpK9yZ/itceBrSsjnDPUW7388f3Gy9XGnQiGxyiDrmaBjYgwpCbwF+99QiFMoBHJ9+0k3iMbQVI4Z+K/feTexrtuiaLOH0+b+X28NJJdiAP1IDt4kD5YD6ca3pxfzw1VH9DvCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jE/WCB/5ba5ntTSW2G/bljC8UanMLzyvqc5H3GC/e8M=;
 b=RvYlWMHFn56SBCiWgmslq8U33uLNEAB0lLBfMT7P1+zeAtK1UTXN0CGAqduUUiF6rG4mNZ6ncmH+St7PgdLlyGOq9z3OSGne6M/XtADeYadm4lxfFgsxpBgFca6yIMugcWV7i8y+BDWk0ySk0P7tNxqztNOJtBGINuW1taJFg87A8GN62Ea+kwYoqQ1einvyhxmj3kC+eN+b6S78h4mtpeMyMKSnYj5XB83eRmFEnoQOPc+4LPlnvfXJXZrDbo5XkGoxb4aP618TPqCTaf9X4Qh+DWOY4iy2Yiadn5HV+tUhQJ5ubTCjp5y9m/m/8Lu2Sry8AYkKBgPnAnZ2YKgrDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jE/WCB/5ba5ntTSW2G/bljC8UanMLzyvqc5H3GC/e8M=;
 b=BhqECDgFZXBzC7X0igk59+gjqsFtjWYpIGTuqJG9sRwvWE0niL9Q8+SPyUfCvEeZpt7v/kYe9krLRcaHj1Nlg9SLP9yW4uEh8CXhLDLDd/k3dDCwi38A88OCYCJzA1K5/x/dFWPuXtgxmvdBnwrsVDMz7V6IUo/cWzxGL2t8kZ8=
Received: from CY4PR21MB0629.namprd21.prod.outlook.com (10.175.115.19) by
 CY4PR21MB0742.namprd21.prod.outlook.com (10.173.189.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.6; Sun, 29 Dec 2019 19:54:30 +0000
Received: from CY4PR21MB0629.namprd21.prod.outlook.com
 ([fe80::654d:8bdd:471:e0ac]) by CY4PR21MB0629.namprd21.prod.outlook.com
 ([fe80::654d:8bdd:471:e0ac%9]) with mapi id 15.20.2602.009; Sun, 29 Dec 2019
 19:54:30 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 4/8] x86/hyperv: setup hypercall page
Thread-Index: AQHVvnaJNVGyhEF7Vkuv2bDhxlZ7UafRhTGA
Date: Sun, 29 Dec 2019 19:54:30 +0000
Message-ID: <CY4PR21MB062925DC63C164F52805EFCFD7240@CY4PR21MB0629.namprd21.prod.outlook.com>
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-5-liuwe@microsoft.com>
In-Reply-To: <20191229183341.14877-5-liuwe@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-29T19:54:28.5145316Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=ece3ddca-bcb2-44f4-a594-673ddb3ebbf5;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c13f68bc-8ab8-4fcd-42e6-08d78c98eb39
x-ms-traffictypediagnostic: CY4PR21MB0742:|CY4PR21MB0742:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR21MB074280335920F41D220121E2D7240@CY4PR21MB0742.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0266491E90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(346002)(39860400002)(366004)(136003)(189003)(199004)(55016002)(81156014)(33656002)(110136005)(316002)(54906003)(86362001)(8990500004)(8676002)(81166006)(8936002)(9686003)(4326008)(5660300002)(7696005)(52536014)(71200400001)(10290500003)(66476007)(26005)(66946007)(6506007)(2906002)(186003)(66556008)(76116006)(478600001)(64756008)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR21MB0742;
 H:CY4PR21MB0629.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n/OCPhExHGj8p7VLp6kOQOjZr4DFwwI214CWAuYtA2ww9P+94lITqLVkqjFJUdZbeCh3X6BV4xybOaK+miDoo/u34OZvkT6MzvyKIuaPfPlH8AiZNO2OSPKQwYhKYpY9ZSuylG3A52XPm7zVBrfnO7Q811U630rhPjIHaYEDDVtWt8tO+I40eb7jKqErFySFoP8s43kZX/IjgEmlvRHo/LQ62y2c/KVHLDvbDRa/d55UN+Tl6EozNjyqHudGzGoDZXyFRWSmVduslhypCSUFfbrMsRGG7Hjatsa1pT2PXjWigRaxnFjm2x9RXRt+QUukon5oQaSvHJLNqEPq/h041hQvD/xJgsxobCcV6QS9yB0a3kGGST/PwdA5BjwIWOSWVE1D+mNb0SaDMJvK4GyT2UpPqFVXaK9BPoxPQSY3jeSLZyOMz3+UDaxuTJf2HMTc
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c13f68bc-8ab8-4fcd-42e6-08d78c98eb39
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2019 19:54:30.4581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8eN0WxkKdKIy1/6+VWZGMo0n7LLkFCZkYGKvx+u8aLzC2s4f64XBinKhdVr2xU+yYDW6HKSWr7CxKAluZDYWz7H94yz0kvU8U/VzLCHNx70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR21MB0742
Subject: Re: [Xen-devel] [PATCH 4/8] x86/hyperv: setup hypercall page
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdS54ZW5AZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgV2VpIExp
dSAgU2VudDogU3VuZGF5LCBEZWNlbWJlciAyOSwgMjAxOSAxMDozNCBBTQo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gaW5kZXggYzZhMjZjNTQ1My4uNDM4OTEw
YzhjYiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4g
KysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+IEBAIC0xOSwxNiArMTks
MTcgQEAKPiAgICogQ29weXJpZ2h0IChjKSAyMDE5IE1pY3Jvc29mdC4KPiAgICovCj4gICNpbmNs
dWRlIDx4ZW4vaW5pdC5oPgo+ICsjaW5jbHVkZSA8eGVuL2RvbWFpbl9wYWdlLmg+Cj4gCj4gICNp
bmNsdWRlIDxhc20vZ3Vlc3QuaD4KPiAgI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYtdGxmcy5o
Pgo+IAo+ICBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gX19yZWFkX21vc3RseSBtc19oeXBlcnY7Cj4g
Cj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzID0gewo+IC0gICAgLm5h
bWUgPSAiSHlwZXItViIsCj4gLX07Cj4gK3ZvaWQgKmh2X2h5cGVyY2FsbDsKPiArc3RhdGljIHN0
cnVjdCBwYWdlX2luZm8gKmh2X2h5cGVyY2FsbF9wYWdlOwo+IAo+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IGh5cGVydmlzb3Jfb3BzIG9wczsKPiAgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpf
X2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCj4gIHsKPiAgICAgIHVpbnQzMl90IGVheCwgZWJ4LCBl
Y3gsIGVkeDsKPiBAQCAtNzEsNiArNzIsNDAgQEAgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3Bz
ICpfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCj4gICAgICByZXR1cm4gJm9wczsKPiAgfQo+IAo+
ICtzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkKPiArewo+ICsg
ICAgdW5pb24gaHZfeDY0X21zcl9oeXBlcmNhbGxfY29udGVudHMgaHlwZXJjYWxsX21zcjsKPiAr
Cj4gKyAgICAvKiBVbmZvcnR1bmF0ZWx5IHRoZXJlIGlzbid0IGEgcmVhbGx5IGdvb2Qgd2F5IHRv
IHVud2luZCBYZW4gdG8KPiArICAgICAqIG5vdCB1c2UgSHlwZXItViBob29rcywgc28gcGFuaWMg
aWYgYW55dGhpbmcgZ29lcyB3cm9uZy4KPiArICAgICAqCj4gKyAgICAgKiBJbiBwcmFjdGljZSBp
ZiBwYWdlIGFsbG9jYXRpb24gZmFpbHMgdGhpcyBlYXJseSBvbiBpdCBpcwo+ICsgICAgICogdW5s
aWtlbHkgd2UgY2FuIGdldCBhIHdvcmtpbmcgc3lzdGVtIGxhdGVyLgo+ICsgICAgICovCj4gKyAg
ICBodl9oeXBlcmNhbGxfcGFnZSA9IGFsbG9jX2RvbWhlYXBfcGFnZShOVUxMLCAwKTsKPiArICAg
IGlmICggIWh2X2h5cGVyY2FsbF9wYWdlICkKPiArICAgICAgICBwYW5pYygiRmFpbGVkIHRvIGFs
bG9jYXRlIEh5cGVyLVYgaHlwZXJjYWxsIHBhZ2VcbiIpOwo+ICsKPiArICAgIGh2X2h5cGVyY2Fs
bCA9IF9fbWFwX2RvbWFpbl9wYWdlX2dsb2JhbChodl9oeXBlcmNhbGxfcGFnZSk7Cj4gKyAgICBp
ZiAoICFodl9oeXBlcmNhbGwgKQo+ICsgICAgICAgIHBhbmljKCJGYWlsZWQgdG8gbWFwIEh5cGVy
LVYgaHlwZXJjYWxsIHBhZ2VcbiIpOwo+ICsKPiArICAgIHJkbXNybChIVl9YNjRfTVNSX0hZUEVS
Q0FMTCwgaHlwZXJjYWxsX21zci5hc191aW50NjQpOwo+ICsgICAgaHlwZXJjYWxsX21zci5lbmFi
bGUgPSAxOwo+ICsgICAgaHlwZXJjYWxsX21zci5ndWVzdF9waHlzaWNhbF9hZGRyZXNzID0gcGFn
ZV90b19tYWRkcihodl9oeXBlcmNhbGxfcGFnZSk7CgpUaGUgImd1ZXN0X3BoeXNpY2FsX2FkZHJl
c3MiIGZpZWxkIGlzIGFjdHVhbGx5IHRoZSBndWVzdCBwaHlzaWNhbCBwYWdlIG51bWJlci4KU28g
dGhlIHBoeXNpY2FsIGFkZHJlc3MgbmVlZHMgdG8gYmUgcmlnaHQgc2hpZnRlZCAxMiBiaXRzIGJl
Zm9yZSBiZWluZyBzdG9yZWQKaGVyZS4gIEknZCByZWNvbW1lbmQgdXNpbmcgSFZfSFlQX1BBR0Vf
U0hJRlQgZnJvbSBoeXBlcnYtdGxmcy5oIGFzCnRoZSBzaGlmdCB2YWx1ZTsgaXQgd2FzIGludHJv
ZHVjZWQgdG8gZGVhbCB3aXRoIHRoZSBwb3NzaWJpbGl0eSB0aGF0IHRoZSBwYWdlCnNpemUgdXNl
ZCBhbmQgZXhwZWN0ZWQgYnkgdGhlIEh5cGVyLVYgaW50ZXJmYWNlIGlzIGRpZmZlcmVudCBmcm9t
IHRoZSBwYWdlCnNpemUgdXNlZCBieSB0aGUgZ3Vlc3QgVk0gKHdoaWNoIGNhbiBoYXBwZW4gb24g
QVJNNjQsIHRob3VnaCBub3Qgb24geDg2KS4KCk1pY2hhZWwKCj4gKyAgICB3cm1zcmwoSFZfWDY0
X01TUl9IWVBFUkNBTEwsIGh5cGVyY2FsbF9tc3IuYXNfdWludDY0KTsKPiArfQo+ICsKPiArc3Rh
dGljIHZvaWQgX19pbml0IHNldHVwKHZvaWQpCj4gK3sKPiArICAgIHNldHVwX2h5cGVyY2FsbF9w
YWdlKCk7Cj4gK30KPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3Bz
ID0gewo+ICsgICAgLm5hbWUgPSAiSHlwZXItViIsCj4gKyAgICAuc2V0dXAgPSBzZXR1cCwKPiAr
fTsKPiArCj4gIC8qCj4gICAqIExvY2FsIHZhcmlhYmxlczoKPiAgICogbW9kZTogQwo+IC0tCj4g
Mi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
