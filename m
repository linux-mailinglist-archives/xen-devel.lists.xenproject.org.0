Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0483D12CAB4
	for <lists+xen-devel@lfdr.de>; Sun, 29 Dec 2019 21:01:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilejC-00073U-8k; Sun, 29 Dec 2019 19:59:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DfPw=2T=microsoft.com=mikelley@srs-us1.protection.inumbo.net>)
 id 1ilejA-00073P-CK
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 19:59:52 +0000
X-Inumbo-ID: c5cb53d0-2a75-11ea-88e7-bc764e2007e4
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7eae::709])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5cb53d0-2a75-11ea-88e7-bc764e2007e4;
 Sun, 29 Dec 2019 19:59:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MY9V4EXmM4YI3fOrfktXHx50m474ust6lU71nIVAM6EBdBVnmUGSRv0+dlUvUoBjXTxwkyW6p4B2DWWsNN4kWLB4nw4AqjvcWP3NTI0Wg5402PK9pdB0X22/NjOSSz9OiQFvidZgNviSrzYMEPLjLAJSQcOfFnXsgssD71oY2THRQuaVIjXhC4QnquKHV1K54MlREYq8sLYABSnVyy74vIeOcVvxC/HfVrkMzjdwDgxHX6qQQDBDGwmrqwCMXQEhHAMS2EJBjzBMQ6PUTgNPErofsbzLeycQbOUp+nOUi9bPBxEKKMTUj/tBxpG6gbSIB7+t8bzUKi9iMmjFD1MRTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2l7Tf0BFa7dg9xBnDzjxQ+nm/GcI4ng2IwwUko0PfMY=;
 b=a1OI8OJM7LkEN8pG73G5BH3/OaZufCTPcWU5RfoYGKmRIccVqfECP1MSc4x6LqjduqE+c7j56KgoEMModRr5xEzxVbJjXR0W3b3OloY6gUfLDkFT4dBwp/+9oeUSSKlY8gLQEWmx6Wm/Hv0NXjttgFvTwoytWeCSXS2ybOCUxz/nsg4xEgmw3CJcA2GsdLje+1peThTszBaNDBE5CJ4XGqO9Ec0Fkki5baE9bfGU04y6uIglcgWe3ywZq2meLMmU+rZYu3GUKDwOAs8gqn3U26FepWeNx1gQT/Sm/ZYI4Rn7We8OWO0OVZbvDccg6Mcekh0FzHaqUgsgclqasI8j/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2l7Tf0BFa7dg9xBnDzjxQ+nm/GcI4ng2IwwUko0PfMY=;
 b=KhoKWcYpVPKt4rPSUYcEIIDWgM7myv37YTs4oVCQDvNPtLtyM3KyZQLJ1Kt0Er+hjxJlFG/w0Ub3+3f8FtXp1U3awjASBQdn4UelYNZQSPvD+2NmZIP/59AuVOmbiMRHM6mGhixyL2vyYl4zScBOwarfOSCC3RfwkzyqqrX4Z2U=
Received: from CY4PR21MB0629.namprd21.prod.outlook.com (10.175.115.19) by
 CY4PR21MB0471.namprd21.prod.outlook.com (10.172.121.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.7; Sun, 29 Dec 2019 19:59:48 +0000
Received: from CY4PR21MB0629.namprd21.prod.outlook.com
 ([fe80::654d:8bdd:471:e0ac]) by CY4PR21MB0629.namprd21.prod.outlook.com
 ([fe80::654d:8bdd:471:e0ac%9]) with mapi id 15.20.2602.009; Sun, 29 Dec 2019
 19:59:48 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 8/8] x86/hyperv: setup VP assist page
Thread-Index: AQHVvnaL1q8QIGGzKUezNGpYS7GdM6fRhquQ
Date: Sun, 29 Dec 2019 19:59:48 +0000
Message-ID: <CY4PR21MB062915A4247CE89C7947DD68D7240@CY4PR21MB0629.namprd21.prod.outlook.com>
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-9-liuwe@microsoft.com>
In-Reply-To: <20191229183341.14877-9-liuwe@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-29T19:59:46.3677382Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=2cb998df-6eac-446a-a63e-56c7f952be0d;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5c4b3ba4-f662-4182-0b87-08d78c99a8a8
x-ms-traffictypediagnostic: CY4PR21MB0471:|CY4PR21MB0471:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR21MB0471E2B75D2324D9E58277A2D7240@CY4PR21MB0471.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0266491E90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(396003)(136003)(366004)(346002)(199004)(189003)(4326008)(2906002)(52536014)(5660300002)(71200400001)(6506007)(55016002)(33656002)(7696005)(10290500003)(81166006)(81156014)(8676002)(478600001)(8936002)(64756008)(66556008)(66476007)(8990500004)(66446008)(76116006)(66946007)(316002)(26005)(54906003)(86362001)(9686003)(186003)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR21MB0471;
 H:CY4PR21MB0629.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ynbiKMCJ4C8PWekYlmBSVHypUjM5WdW7AnSDOhwlAuh3wJ/lqPPznAk2dgDOmm6hrYLm6sZBjXlEuEeOTu8mkUHBTo16pGyZm3yNAsNUMnoKEJAvpGuveo9ppNwIytB5p/aiKBqvxKOk+8bhV6CzjFvS1tRDAOf4Q4tq38kFK2FKY4cHimorzM1Et3qgy65DLfsDttpVAfOVGQcRbj2lTsVuT0rvtT48+Ev77rSOCxqX0bFbPr1LVrS+OFel6dl0OCBudTdQonL9KqaTwNMCIxaHB5OTjB1Dll20aM0lY62AI7FJXZs+sdCa8mYn5SDo2CTqOtX0f2CiaFT6BHMcd7Ah1G2EHy8VU4k9HvDPr2ysuK7BRTU9mZK8lW/3XR4bpTa401HO9zU2M9rU21tKEK8qLTRPQMEXxwXWLp0df3HT483IHckqwmH2TLI30cEo
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4b3ba4-f662-4182-0b87-08d78c99a8a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2019 19:59:48.2505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6I84wFDFyfkad84JXJhRnHH3m0l9k+3XtfeL0nG2sJyXWiX8qLaIlADNU5/tgHLspzPWOB2Bho4KV+lB+pjIOHlootJziUwKXq1noWVPWDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR21MB0471
Subject: Re: [Xen-devel] [PATCH 8/8] x86/hyperv: setup VP assist page
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
dSAgU2VudDogU3VuZGF5LCBEZWNlbWJlciAyOSwgMjAxOSAxMDozNCBBTQo+IAo+IFZQIGFzc2lz
dCBwYWdlIGlzIHJhdGhlciBpbXBvcnRhbnQgYXMgd2UgbmVlZCB0byB0b2dnbGUgc29tZSBiaXRz
IGluCj4gdGhhdCBwYWdlIHN1Y2ggdGhhdCBMMSBndWVzdCBjYW4gbWFrZSBoeXBlcmNhbGxzIGRp
cmVjdGx5IHRvIEwwIEh5cGVyLVYuCj4gCj4gUHJlZW1wdGl2ZWx5IHNwbGl0IG91dCBzZXRfdnBf
YXNzaXN0IHBhZ2Ugd2hpY2ggd2lsbCBiZSB1c2VkIGluIHRoZSByZXN1bWUKPiBwYXRoLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gLS0tCj4gIHhl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgfCAzNSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaCB8ICAxICsK
PiAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L2h5cGVydi5jCj4gaW5kZXggZGEzYThjZDg1ZC4uYTg4YjlhZTZkOSAxMDA2NDQKPiAtLS0g
YS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gKysrIGIveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+IEBAIC0zMCw2ICszMCw3IEBAIHZvaWQgKmh2X2h5cGVy
Y2FsbDsKPiAgc3RhdGljIHN0cnVjdCBwYWdlX2luZm8gKmh2X2h5cGVyY2FsbF9wYWdlOwo+ICBE
RUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWShzdHJ1Y3QgaHlwZXJ2X3BjcHVfcGFnZSwgaHZfcGNw
dV9pbnB1dF9hcmcpOwo+ICBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh1bnNpZ25lZCBpbnQs
IGh2X3ZwX2luZGV4KTsKPiArREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkoc3RydWN0IGh5cGVy
dl9wY3B1X3BhZ2UsIGh2X3ZwX2Fzc2lzdCk7Cj4gCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlw
ZXJ2aXNvcl9vcHMgb3BzOwo+ICBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKl9faW5pdCBo
eXBlcnZfcHJvYmUodm9pZCkKPiBAQCAtMTI1LDE3ICsxMjYsNTEgQEAgc3RhdGljIHZvaWQgc2V0
dXBfdnBfaW5kZXgodm9pZCkKPiAgICAgIHRoaXNfY3B1KGh2X3ZwX2luZGV4KSA9IHZwX2luZGV4
X21zcjsKPiAgfQo+IAo+ICtzdGF0aWMgdm9pZCBzZXRfdnBfYXNzaXN0KHZvaWQpCj4gK3sKPiAr
ICAgIHVpbnQ2NF90IHZhbCA9IHBhZGRyX3RvX3Bmbih0aGlzX2NwdShodl92cF9hc3Npc3QpLm1h
ZGRyKTsKPiArCj4gKyAgICB2YWwgPSAodmFsIDw8IEhWX1g2NF9NU1JfVlBfQVNTSVNUX1BBR0Vf
QUREUkVTU19TSElGVCkgfCAKCkknZCByZWNvbW1lbmQgdXNpbmcgSFZfSFlQX1BBR0VfU0hJRlQg
aW5zdGVhZCBvZgpIVl9YNjRfTVNSX1ZQX0FTU0lTVF9QQUdFX0FERFJFU1NfU0hJRlQuICBPbiB0
aGUgTGludXggc2lkZSwKSSdtIHBsYW5uaW5nIHRvIHJlbW92ZSB0aGF0ICNkZWZpbmUgYW5kIHRo
ZSBzaW1pbGFyCipfUEFHRV9BRERSRVNTX01BU0sgaW4gZmF2b3Igb2YgdGhlIG5ld2VyIEhWX0hZ
UF9QQUdFXyogdmFsdWVzLgpUaGVyZSdzIG5vdGhpbmcgc3BlY2lhbCBhYm91dCB0aGUgVlAgYXNz
aXN0IHBhZ2UsIHNvIHVzaW5nIHRoZSBnZW5lcmljCiNkZWZpbmVzIGJhc2VkIG9uIHRoZSBIeXBl
ci1WIHBhZ2Ugc2l6ZSBpcyByZWFzb25hYmxlLgoKTWljaGFlbAoKPiArICAgICAgICBIVl9YNjRf
TVNSX1ZQX0FTU0lTVF9QQUdFX0VOQUJMRTsKPiArCj4gKyAgICB3cm1zcmwoSFZfWDY0X01TUl9W
UF9BU1NJU1RfUEFHRSwgdmFsKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgc2V0dXBfdnBfYXNz
aXN0KHZvaWQpCj4gK3sKPiArICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnOwo+ICsgICAgdm9pZCAq
bWFwcGluZzsKPiArICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4g
Kwo+ICsgICAgcGcgPSBhbGxvY19kb21oZWFwX3BhZ2UoTlVMTCwgMCk7Cj4gKyAgICBpZiAoICFw
ZyApCj4gKyAgICAgICAgcGFuaWMoIkZhaWxlZCB0byBhbGxvY2F0ZSB2cF9hc3Npc3QgcGFnZSBm
b3IgJXVcbiIsIGNwdSk7Cj4gKwo+ICsgICAgbWFwcGluZyA9IF9fbWFwX2RvbWFpbl9wYWdlX2ds
b2JhbChwZyk7Cj4gKyAgICBpZiAoICFtYXBwaW5nICkKPiArICAgICAgICBwYW5pYygiRmFpbGVk
IHRvIG1hcCB2cF9hc3Npc3QgcGFnZSBmb3IgJXVcbiIsIGNwdSk7Cj4gKwo+ICsgICAgY2xlYXJf
cGFnZShtYXBwaW5nKTsKPiArCj4gKyAgICB0aGlzX2NwdShodl92cF9hc3Npc3QpLm1hZGRyID0g
cGFnZV90b19tYWRkcihwZyk7Cj4gKyAgICB0aGlzX2NwdShodl92cF9hc3Npc3QpLm1hcHBpbmcg
PSBtYXBwaW5nOwo+ICsKPiArICAgIHNldF92cF9hc3Npc3QoKTsKPiArfQo+ICsKPiAgc3RhdGlj
IHZvaWQgX19pbml0IHNldHVwKHZvaWQpCj4gIHsKPiAgICAgIHNldHVwX2h5cGVyY2FsbF9wYWdl
KCk7Cj4gICAgICBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKTsKPiAgICAgIHNldHVwX3ZwX2lu
ZGV4KCk7Cj4gKyAgICBzZXR1cF92cF9hc3Npc3QoKTsKPiAgfQo+IAo+ICBzdGF0aWMgdm9pZCBh
cF9zZXR1cCh2b2lkKQo+ICB7Cj4gICAgICBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKTsKPiAg
ICAgIHNldHVwX3ZwX2luZGV4KCk7Cj4gKyAgICBzZXR1cF92cF9hc3Npc3QoKTsKPiAgfQo+IAo+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9wcyA9IHsKPiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaCBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QvaHlwZXJ2LmgKPiBpbmRleCA0YjYzNTgyOWYzLi45MTdmNGUwMmMyIDEwMDY0NAo+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKPiArKysgYi94ZW4vaW5j
bHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCj4gQEAgLTcxLDYgKzcxLDcgQEAgc3RydWN0IGh5
cGVydl9wY3B1X3BhZ2Ugewo+ICB9Owo+ICBERUNMQVJFX1BFUl9DUFUoc3RydWN0IGh5cGVydl9w
Y3B1X3BhZ2UsIGh2X3BjcHVfaW5wdXRfYXJnKTsKPiAgREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVk
IGludCwgaHZfdnBfaW5kZXgpOwo+ICtERUNMQVJFX1BFUl9DUFUoc3RydWN0IGh5cGVydl9wY3B1
X3BhZ2UsIGh2X3ZwX2Fzc2lzdCk7Cj4gCj4gIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyAq
aHlwZXJ2X3Byb2JlKHZvaWQpOwo+IAo+IC0tCj4gMi4yMC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
