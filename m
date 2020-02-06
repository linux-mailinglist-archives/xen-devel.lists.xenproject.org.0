Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CE61541A7
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 11:16:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ize98-0002ER-SD; Thu, 06 Feb 2020 10:12:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RI0J=32=amazon.co.uk=prvs=29855b991=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ize97-0002EK-LS
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 10:12:29 +0000
X-Inumbo-ID: 2dcaea7f-48c9-11ea-af25-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2dcaea7f-48c9-11ea-af25-12813bfff9fa;
 Thu, 06 Feb 2020 10:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580983949; x=1612519949;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FZ6ogyIlkJbl9wI36wEJCaa3Njnnaqu2JztfYqp3bNY=;
 b=OqLIQJJRfv+Zl29hiZGCmMCHTRv7hy+trqqGLitke72CyxQYszyVSoVA
 ZNAL/IxPZKgLyZ9wKUe2H3SUt0MoTyevIO/3sSsdlQ3OrrXZQcDEAXGQf
 jYko0G86GYKFwwHnElYoa+pYIlIzb7fgonSS14yO2ZQ8himcFCPICqzcz E=;
IronPort-SDR: XJ3tZJtjRwFKOkvcQ6W9GKrbXBOPHC3PFVIUQCx1hM8ni7f8oxEKLe7FVjPCmPvQkySpz3v6Hd
 Co+TzfMqADsA==
X-IronPort-AV: E=Sophos;i="5.70,409,1574121600"; d="scan'208";a="16489302"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 06 Feb 2020 10:12:21 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id 981791A0C4D; Thu,  6 Feb 2020 10:12:19 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 6 Feb 2020 10:12:19 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 6 Feb 2020 10:12:18 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 6 Feb 2020 10:12:18 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 3/4] mm: make pages allocated with MEMF_no_refcount
 safe to assign
Thread-Index: AQHV2oCv/pyB6wKMJkGvE6zaQ66hWKgN9JcAgAAAxBA=
Date: Thu, 6 Feb 2020 10:12:18 +0000
Message-ID: <dea18d7c61b240edb9e9dfdf1eacf90d@EX13D32EUC003.ant.amazon.com>
References: <20200203105654.22998-1-pdurrant@amazon.com>
 <20200203105654.22998-4-pdurrant@amazon.com>
 <eb444c22-de88-e0e9-1a99-3cbd412851a0@xen.org>
In-Reply-To: <eb444c22-de88-e0e9-1a99-3cbd412851a0@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.213]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v9 3/4] mm: make pages allocated with
 MEMF_no_refcount safe to assign
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiAwNiBGZWJydWFyeSAyMDIwIDEwOjA0DQo+IFRvOiBEdXJyYW50
LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29w
ZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2Uu
RHVubGFwQGV1LmNpdHJpeC5jb20+Ow0KPiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbT47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFdlaQ0KPiBM
aXUgPHdsQHhlbi5vcmc+OyBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBh
bS5jb20+OyBSb2dlcg0KPiBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2OSAzLzRdIG1tOiBtYWtlIHBhZ2VzIGFsbG9jYXRlZCB3aXRoIE1F
TUZfbm9fcmVmY291bnQNCj4gc2FmZSB0byBhc3NpZ24NCj4gDQo+IEhpLA0KPiANCj4gSSBhbSBz
b3JyeSB0byBqdW1wIHRoYXQgbGF0ZSBpbiB0aGUgY29udmVyc2F0aW9uLg0KPiANCj4gT24gMDMv
MDIvMjAyMCAxMDo1NiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+DQo+ID4gLSAgICAgICAgaWYg
KCB1bmxpa2VseShkb21haW5fYWRqdXN0X3RvdF9wYWdlcyhkLCAxIDw8IG9yZGVyKSA9PSAoMSA8
PA0KPiBvcmRlcikpICkNCj4gPiArICAgIGlmICggIShtZW1mbGFncyAmIE1FTUZfbm9fcmVmY291
bnQpICYmDQo+ID4gKyAgICAgICAgIHVubGlrZWx5KGRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKGQs
IDEgPDwgb3JkZXIpID09ICgxIDw8DQo+IG9yZGVyKSkgKQ0KPiA+ICAgICAgICAgICAgICAgZ2V0
X2tub3duYWxpdmVfZG9tYWluKGQpOw0KPiA+IC0gICAgfQ0KPiA+DQo+ID4gICAgICAgZm9yICgg
aSA9IDA7IGkgPCAoMSA8PCBvcmRlcik7IGkrKyApDQo+ID4gICAgICAgew0KPiA+ICAgICAgICAg
ICBBU1NFUlQocGFnZV9nZXRfb3duZXIoJnBnW2ldKSA9PSBOVUxMKTsNCj4gPiAtICAgICAgICBB
U1NFUlQoIXBnW2ldLmNvdW50X2luZm8pOw0KPiA+ICAgICAgICAgICBwYWdlX3NldF9vd25lcigm
cGdbaV0sIGQpOw0KPiA+ICAgICAgICAgICBzbXBfd21iKCk7IC8qIERvbWFpbiBwb2ludGVyIG11
c3QgYmUgdmlzaWJsZSBiZWZvcmUgdXBkYXRpbmcNCj4gcmVmY250LiAqLw0KPiA+IC0gICAgICAg
IHBnW2ldLmNvdW50X2luZm8gPSBQR0NfYWxsb2NhdGVkIHwgMTsNCj4gPiArICAgICAgICBwZ1tp
XS5jb3VudF9pbmZvID0NCj4gPiArICAgICAgICAgICAgKHBnW2ldLmNvdW50X2luZm8gJiBQR0Nf
ZXh0cmEpIHwgUEdDX2FsbG9jYXRlZCB8IDE7DQo+IA0KPiBUaGlzIGlzIHRlY2huaWNhbGx5IGlu
Y29ycmVjdCBiZWNhdXNlIHdlIGJsaW5kbHkgYXNzdW1lIHRoZSBzdGF0ZSBvZiB0aGUNCj4gcGFn
ZSBpcyBpbnVzZSAod2hpY2ggaXMgdGhhbmtmdWxseSBlcXVhbCB0byAwKS4NCg0KQXNzdW1pbmcg
dGhlIHBhZ2UgaXMgaW51c2Ugc2VlbXMgcmVhc29uYWJsZSBhdCB0aGlzIHBvaW50Lg0KDQo+IA0K
PiBTZWUgdGhlIGRpc2N1c3Npb24gWzFdLiBUaGlzIGlzIGFscmVhZHkgYW4gZXhpc3RpbmcgYnVn
IGluIHRoZSBjb2RlIGJhc2UNCj4gYW5kIEkgd2lsbCBiZSB0YWtpbmcgY2FyZSBvZiBpdC4NCg0K
RmFpciBlbm91Z2g7IGl0J3MgYSB2ZXJ5IGxvbmcgc3RhbmRpbmcgYnVnLg0KDQo+IEhvd2V2ZXIu
Li4NCj4gDQo+ID4gICAgICAgICAgIHBhZ2VfbGlzdF9hZGRfdGFpbCgmcGdbaV0sICZkLT5wYWdl
X2xpc3QpOw0KPiA+ICAgICAgIH0NCj4gPg0KPiA+IEBAIC0yMzE1LDExICsyMzM4LDYgQEAgc3Ry
dWN0IHBhZ2VfaW5mbyAqYWxsb2NfZG9taGVhcF9wYWdlcygNCj4gPg0KPiA+ICAgICAgIGlmICgg
bWVtZmxhZ3MgJiBNRU1GX25vX293bmVyICkNCj4gPiAgICAgICAgICAgbWVtZmxhZ3MgfD0gTUVN
Rl9ub19yZWZjb3VudDsNCj4gPiAtICAgIGVsc2UgaWYgKCAobWVtZmxhZ3MgJiBNRU1GX25vX3Jl
ZmNvdW50KSAmJiBkICkNCj4gPiAtICAgIHsNCj4gPiAtICAgICAgICBBU1NFUlQoIShtZW1mbGFn
cyAmIE1FTUZfbm9fcmVmY291bnQpKTsNCj4gPiAtICAgICAgICByZXR1cm4gTlVMTDsNCj4gPiAt
ICAgIH0NCj4gPg0KPiA+ICAgICAgIGlmICggIWRtYV9iaXRzaXplICkNCj4gPiAgICAgICAgICAg
bWVtZmxhZ3MgJj0gfk1FTUZfbm9fZG1hOw0KPiA+IEBAIC0yMzMyLDExICsyMzUwLDIzIEBAIHN0
cnVjdCBwYWdlX2luZm8gKmFsbG9jX2RvbWhlYXBfcGFnZXMoDQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbWVtZmxhZ3MsIGQpKSA9PSBOVUxMKSkgKQ0KPiA+ICAgICAg
ICAgICAgcmV0dXJuIE5VTEw7DQo+ID4NCj4gPiAtICAgIGlmICggZCAmJiAhKG1lbWZsYWdzICYg
TUVNRl9ub19vd25lcikgJiYNCj4gPiAtICAgICAgICAgYXNzaWduX3BhZ2VzKGQsIHBnLCBvcmRl
ciwgbWVtZmxhZ3MpICkNCj4gPiArICAgIGlmICggZCAmJiAhKG1lbWZsYWdzICYgTUVNRl9ub19v
d25lcikgKQ0KPiA+ICAgICAgIHsNCj4gPiAtICAgICAgICBmcmVlX2hlYXBfcGFnZXMocGcsIG9y
ZGVyLCBtZW1mbGFncyAmIE1FTUZfbm9fc2NydWIpOw0KPiA+IC0gICAgICAgIHJldHVybiBOVUxM
Ow0KPiA+ICsgICAgICAgIGlmICggbWVtZmxhZ3MgJiBNRU1GX25vX3JlZmNvdW50ICkNCj4gPiAr
ICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaTsNCj4gPiArDQo+ID4g
KyAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgKDF1bCA8PCBvcmRlcik7IGkrKyApDQo+ID4g
KyAgICAgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgICAgIEFTU0VSVCghcGdbaV0uY291bnRf
aW5mbyk7DQo+ID4gKyAgICAgICAgICAgICAgICBwZ1tpXS5jb3VudF9pbmZvID0gUEdDX2V4dHJh
Ow0KPiANCj4gLi4uIHRoaXMgaXMgcHVyc3VpbmcgdGhlIHdyb25nbmVzcyBvZiB0aGUgY29kZSBh
Ym92ZSBhbmQgbm90IHNhZmUNCj4gYWdhaW5zdCBvZmZsaW5pbmcuDQo+IA0KPiBXZSBjb3VsZCBh
cmd1ZSB0aGlzIGlzIGFuIGFscmVhZHkgZXhpc3RpbmcgYnVnLCBob3dldmVyIEkgYW0gYSBiaXQN
Cj4gdW5lYXNlIHRvIGFkZCBtb3JlIGFidXNlIGluIHRoZSBjb2RlLiBKYW4sIHdoYXQgZG8geW91
IHRoaW5rPw0KPiANCg0KSSdkIGNvbnNpZGVyIGEgc3RyYWlnaHRmb3J3YXJkIHBhdGNoLWNsYXNo
LiBJZiB0aGlzIHBhdGNoIGdvZXMgaW4gYWZ0ZXIgeW91cnMgdGhlbiBpdCBuZWVkcyB0byBiZSBt
b2RpZmllZCBhY2NvcmRpbmdseSwgb3IgdmljZSB2ZXJzYS4NCg0KICBQYXVsDQoNCj4gPiArICAg
ICAgICAgICAgfQ0KPiA+ICsgICAgICAgIH0NCj4gPiArICAgICAgICBpZiAoIGFzc2lnbl9wYWdl
cyhkLCBwZywgb3JkZXIsIG1lbWZsYWdzKSApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAg
ICAgICBmcmVlX2hlYXBfcGFnZXMocGcsIG9yZGVyLCBtZW1mbGFncyAmIE1FTUZfbm9fc2NydWIp
Ow0KPiA+ICsgICAgICAgICAgICByZXR1cm4gTlVMTDsNCj4gPiArICAgICAgICB9DQo+ID4gICAg
ICAgfQ0KPiANCj4gQ2hlZXJzLA0KPiANCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hl
bi1kZXZlbC8yMDIwMDIwNDEzMzM1Ny4zMjEwMS0xLQ0KPiBqdWxpZW5AeGVuLm9yZy8NCj4gDQo+
IC0tDQo+IEp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
