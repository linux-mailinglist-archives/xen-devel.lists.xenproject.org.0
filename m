Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3EB1BB8C4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 10:24:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTLXi-0003A8-JB; Tue, 28 Apr 2020 08:24:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lSul=6M=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jTLXg-0003A3-I1
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 08:24:36 +0000
X-Inumbo-ID: b14a0a6a-8929-11ea-ae69-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b14a0a6a-8929-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 08:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588062275;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=M/bJKdnKVYMF+ypyvWnnUGP820YYdLpMtI1STxc6/no=;
 b=WdBjpSShDVeQcMJ3eUn98qSnFFG1wWXCXO41gSotzVTvWMylSNizxZvZ
 PozuVXLtfLcnSjF/Zc5DonHsD0Ko2Dx6HgKNmAuQv5wbJadaSrxiSCtj9
 4A+Rr81ZEM/Xbkx6pjH4Pu25u36DG/ng/UwZGTGyndkruyiurmKvYDMWo Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yGgEGI5YSWmVwi5KodKROZDHhuw3qA4DxVdRilOziMe2IJnDel3Ds8Dl7zj3ibpYmq6CvYwVXN
 z6vZsx2aRFWt6Y/Rm3QAhA312eFNDufYI1MOMgw//z8jqG04AWl4Qa75M6d4zeVLMXYGkpAFOB
 Cb/pm9itu8rGRgb1ZDb4k7AGK2nXIa6670BrMD9QvW/ZMpb0vcjg3pcvP/zTU28hAiij+O/cPX
 QajZXfnBGqHBd60+r7ydHIMg7f+qo0LvQEflodm7DQO0UEuPP8elKG2P4py352K8yre0QfP1Un
 MhQ=
X-SBRS: 2.7
X-MesageID: 16668029
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,327,1583211600"; d="scan'208";a="16668029"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v7 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
Thread-Topic: [PATCH v7 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
Thread-Index: AQHWCQXiBGUb+wr760WOfoEenUG4zahnVWoAgAALjICAAAX/gIAAAzMAgASARQCAITZdgIAADK2AgAD5+wCAABHcgA==
Date: Tue, 28 Apr 2020 08:24:31 +0000
Message-ID: <064958B4-1FCC-4300-A98A-7A1D608376F8@citrix.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-9-jgross@suse.com>
 <19f84540-6b49-f99d-805a-e07f56330f31@suse.com>
 <b9ddd1fb-d868-bb69-3b6b-27531beda2fa@suse.com>
 <f7d1f3aa-3a7e-fcb2-3163-5e67756e8452@suse.com>
 <17d65095-a51e-2e00-38ee-7c1c83d2bb99@suse.com>
 <51e0f0d2-f9ce-83fd-79fa-ae4805356612@suse.com>
 <31c7f4fe-847c-96f5-e598-dba99b0bb61a@suse.com>
 <085E1F72-EC22-43D6-8F7E-EDC132CC787D@citrix.com>
 <fb0e92cc-102f-7f87-1ad6-f3ccce1eee60@suse.com>
In-Reply-To: <fb0e92cc-102f-7f87-1ad6-f3ccce1eee60@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB215CE703199D48A6D0C54C19446017@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDI4LCAyMDIwLCBhdCA4OjIwIEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjcuMDQuMjAyMCAxODoyNSwgR2VvcmdlIER1bmxh
cCB3cm90ZToNCj4+IElmIEphbiBpcyBPSyB3aXRoIGl0IHNpbXBseSBiZWluZyBvdXRzaWRlIENP
TkZJR19FWFBFUlQsIHRoZW4gZ3JlYXQuICBCdXQgaWYgaGUgaW5zaXN0cyBvbiBzb21lIGtpbmQg
b2YgdGVzdGluZyBmb3IgaXQgdG8gYmUgb3V0c2lkZSBvZiBDT05GSUdfRVhQRVJULCB0aGVuIGFn
YWluLCB0aGUgcGVvcGxlIHdobyB3YW50IGl0IHRvIGJlIHNlY3VyaXR5IHN1cHBvcnRlZCBzaG91
bGQgYmUgdGhlIG9uZXMgd2hvIGRvIHRoZSB3b3JrIHRvIG1ha2UgaXQgaGFwcGVuLg0KPiANCj4g
SSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgcGFydCwgSSdtIGFmcmFpZDogV2l0aG91dCBhIGNvbmZp
ZyBvcHRpb24sDQo+IHRoZSBjb2RlIGlzIGdvaW5nIHRvIGJlIHNlY3VyaXR5IHN1cHBvcnRlZCBh
cyBsb25nIGFzIGl0IGRvZXNuJ3QNCj4gZ2V0IG1hcmtlZCBvdGhlcndpc2UgKGV4cGVyaW1lbnRh
bCBvciB3aGF0IG5vdCkuIFdpdGggYW4gb3B0aW9uDQo+IGRlcGVuZGluZyBvbiBFWFBFUlQsIHdo
YXQgd291bGQgYmVjb21lIHNlY3VyaXR5IHVuc3VwcG9ydGVkIGlzIHRoZQ0KPiBub24tZGVmYXVs
dCAoaS5lLiBkaXNhYmxlZCkgc2V0dGluZy4gVGhlcmUncyBub3QgYSB3aG9sZSBsb3QgdG8NCj4g
dGVzdCB0aGVyZSwgaXQncyBtZXJlbHkgYSBmb3JtYWwgY29uc2VxdWVuY2Ugb2Ygb3VyIGdlbmVy
YWwgcnVsZXMuDQo+IChPZiBjb3Vyc2UsIG92ZXIgdGltZSBkZXBlbmRlbmNpZXMgb2Ygb3RoZXIg
Y29kZSBtYXkgZGV2ZWxvcCBvbg0KPiB0aGUgaW5mb3JtYXRpb24gYmVpbmcgYXZhaWxhYmxlIGUu
Zy4gdG8gRG9tMCB1c2VybGFuZC4gSnVzdCBsaWtlDQo+IHRoZXJlJ3MgTGludXggdXNlcmxhbmQg
Y29kZSBhc3N1bWluZyB0aGUga2VybmVsIGNvbmZpZyBpcw0KPiBhdmFpbGFibGUgaW4gY2VydGFp
biB3YXlzIFtJIGRvbid0IG5lY2Vzc2FyaWx5IG1lYW4gdGhlIGVxdWl2YWxlbnQNCj4gb2YgaHlw
ZnMgaGVyZV0sIHRvIHRoZW4gdXNlIGl0IGluIHdoYXQgSSdkIGNhbGwgYWJ1c2l2ZSB3YXlzIGlu
IGF0DQo+IGxlYXN0IHNvbWUgY2FzZXMuKQ0KDQpIZXJl4oCZcyBhbiBhcmd1bWVudCB5b3UgbWln
aHQgbWFrZToNCg0K4oCcQXMgYSBtZW1iZXIgb2YgdGhlIHNlY3VyaXR5IHRlYW0sIEkgZG9u4oCZ
dCB3YW50IHRvIGJlIG9uIHRoZSBob29rIGZvciBpc3N1aW5nIFhTQXMgZm9yIGNvZGUgd2hpY2gg
aXNu4oCZdCBhdCBsZWFzdCBzbW9rZS10ZXN0ZWQuICBUaGVyZWZvcmUsIEkgb3Bwb3NlIGFueSBw
YXRjaCBhZGRpbmcgQ09ORklHX0hZUEZTIG91dHNpZGUgb2YgQ09ORklHX0VYUEVSVCwgKnVubGVz
cyogdGhlcmUgaXMgYSBjb25jcmV0ZSBwbGFuIGZvciBnZXR0aW5nIHJlZ3VsYXIgdGVzdGluZyBm
b3IgQ09ORklHX0hZUEZTPW4u4oCdDQoNCknigJltIG5vdCBzYXlpbmcgdGhhdOKAmXMgYW4gYXJn
dW1lbnQgeW91ICpzaG91bGQqIG1ha2UuICBCdXQgcGVyc29uYWxseSBJIGRvbuKAmXQgaGF2ZSBh
IHN0cm9uZyBhcmd1bWVudCBhZ2FpbnN0IHN1Y2ggYW4gYXJndW1lbnQuIFNvLCBpdCBzZWVtcyB0
byBtZSwgaWYgeW91IGRpZCBtYWtlIGl0LCB5b3UgaGF2ZSBhIHJlYXNvbmFibGUgY2hhbmNlIG9m
IGNhcnJ5aW5nIHlvdXIgcG9pbnQuDQoNCk5vdyBjb25zaWRlciB0aGlzIGh5cG90aGV0aWNhbCB1
bml2ZXJzZSB3aGVyZSB5b3UgbWFkZSB0aGF0IGFyZ3VtZW50IGFuZCBub2JvZHkgb3Bwb3NlZCBp
dC4gIEluIG9yZGVyIHRvIGdldCBhIHBhcnRpY3VsYXIgZmVhdHVyZSAoQ09ORklHX0hZUEZTPW4g
c2VjdXJpdHkgc3VwcG9ydGVkKSwgdGhlcmUgaXMgZXh0cmEgd29yayB0aGF0IG5lZWRzIHRvIGJl
IGRvbmUgKGdldHRpbmcgQ09ORklHX0hZUEZTPW4gdGVzdGVkIHJlZ3VsYXJseSkuICBNeSBwb2lu
dCB3YXMsIHRoZSBleHBlY3RhdGlvbiBzaG91bGQgYmUgdGhhdCB0aGUgZXh0cmEgd29yayB3aWxs
IGJlIGRvbmUgYnkgdGhlIHBlb3BsZSB3aG8gd2FudCBvciBiZW5lZml0IGZyb20gdGhlIGZlYXR1
cmU7IHRoZSBzZXJpZXMgc2hvdWxkbuKAmXQgYmUgYmxvY2tlZCB1bnRpbCBKdWVyZ2VuIGltcGxl
bWVudHMgQ09ORklHX0hZUEZTPW4gdGVzdGluZyAoc2luY2UgaGUgZG9lc27igJl0IHBlcnNvbmFs
bHkgaGF2ZSBhIHN0YWtlIGluIHRoYXQgZmVhdHVyZSkuDQoNCk5vdyBvYnZpb3VzbHksIGRvaW5n
IHdvcmsgdG8gaGVscCBzb21lb25lIGVsc2Ugb3V0IGluIHRoZSBjb21tdW5pdHkgaXMgb2YgY291
cnNlIGEgZ29vZCB0aGluZyB0byBkbzsgaXQgYnVpbGRzIGdvb2R3aWxsLCB1c2VzIG91ciBhZ2dy
ZWdhdGUgcmVzb3VyY2VzIG1vcmUgZWZmaWNpZW50bHksIGFuZCBtYWtlcyBvdXIgY29tbXVuaXR5
IG1vcmUgZW5qb3lhYmxlIHRvIHdvcmsgd2l0aC4gIEJ1dCB0aGUgZ29vZHdpbGwgcHJpbWFyaWx5
IGNvbWVzIGZyb20gdGhlIGZhY3QgdGhhdCBpdCB3YXMgZG9uZSBhcyBhIHZvbHVudGFyeSBjaG9p
Y2UsIG5vdCBhcyBhIHJlcXVpcmVtZW50Lg0KDQpKdWVyZ2VuIHdhcyBiYWxraW5nIGF0IGhhdmlu
ZyB0byBkbyB3aGF0IGhlIHNhdyBhcyBleHRyYSB3b3JrIHRvIGltcGxlbWVudCBDT05GSUdfSFlQ
RlMuICBJIHdhbnRlZCB0byBtYWtlIGl0IGNsZWFyIHRoYXQgZXZlbiB0aG91Z2ggSSBzZWUgdmFs
dWUgaW4gaGF2aW5nIENPTkZJR19IWVBGUywgKmhlKiBkb2VzbuKAmXQgaGF2ZSB0byBkbyB0aGUg
d29yayBpZiBoZSBkb2VzbuKAmXQgd2FudCB0byAoYWx0aG91Z2ggaXQgd291bGQgY2VydGFpbmx5
IGJlIGFwcHJlY2lhdGVkIGlmIGhlIGRpZCkuICBBbmQgdGhpcyBwYXJhZ3JhcGggd2FzIGV4dGVu
ZGluZyB0aGUgc2FtZSBwcmluY2lwbGUgaW50byB0aGUgaHlwb3RoZXRpY2FsIHVuaXZlcnNlIHdo
ZXJlIHNvbWVvbmUgaW5zaXN0ZWQgdGhhdCBDT05GSUdfSFlQRlM9biBoYWQgdG8gYmUgdGVzdGVk
IGJlZm9yZSBiZWluZyBzZWN1cml0eSBzdXBwb3J0ZWQuDQoNCkhvcGUgdGhhdCBtYWtlcyBzZW5z
ZS4gOi0pDQoNCiAtR2Vvcmdl

