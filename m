Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB17C6CF24
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:50:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6lt-0002Sq-2R; Thu, 18 Jul 2019 13:48:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ho6ls-0002Sl-BM
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:48:32 +0000
X-Inumbo-ID: ba4051b4-a962-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ba4051b4-a962-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 13:48:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563457710; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=ybZKSanckwR3dKCIxu78LpIrr48amgwP3lMFl+nsoFA=;
 b=LLy8rgE4gGJTdKeUtR6GMHNuhqk5JpEuzie0VJeYlc58v63HZ3hEENrvtwS/0p/UodUH6iDQ
 fkfEvkc9MkyQGTmd6V8EfRRwC5QLeSVLWNu+9YO0djROI1yS4HH/dTXnyWCsCnfnoluCuMhR
 RJ59+izJ4ZYrOl6dcivD8Hx89VQ=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mxa.mailgun.org with ESMTP id 5d3078ae.7f71f2385cb0-smtp-out-n03;
 Thu, 18 Jul 2019 13:48:30 -0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id n4so28827559wrs.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 06:48:29 -0700 (PDT)
X-Gm-Message-State: APjAAAWB4Ga2e5vtOuXSUw97jieO30Jow//BuswsyN3Jy5MEcmrltgdP
 HHHUbxEFvygjscM3rhK37zqv/9ltBDROiBe0180=
X-Google-Smtp-Source: APXvYqzhFfUmzyEd///BkM4A3A4xzIUXqLjTx//goVxFwTuOx6UMHgxM77k5fE1pULehpHWZMFkEKBi52lepWauJ3dA=
X-Received: by 2002:adf:ef8d:: with SMTP id d13mr48385225wro.60.1563457708633; 
 Thu, 18 Jul 2019 06:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-2-tamas@tklengyel.com>
 <66bbd9f7-12f9-b654-555d-a02d5f4f0dba@suse.com>
 <CABfawhkJR8sz8cVCfcuxQ-4+xoQOSTs-XQuow-qzPyd4xZwq0g@mail.gmail.com>
 <b6cdc457-01e8-03cf-5408-11337e5a10d9@suse.com>
 <CABfawhkAcoHm_+5ob6nge4xELUvpb4kZXoC+n_7sF-PNK+untQ@mail.gmail.com>
 <6e2986dd-5416-4ef3-c00b-eca4db578e7c@suse.com>
In-Reply-To: <6e2986dd-5416-4ef3-c00b-eca4db578e7c@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 07:47:52 -0600
X-Gmail-Original-Message-ID: <CABfawh=6vwfcRqHMrbgojduvvAk5jMJ_u=vOt=r-3sCiYGapoA@mail.gmail.com>
Message-ID: <CABfawh=6vwfcRqHMrbgojduvvAk5jMJ_u=vOt=r-3sCiYGapoA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v6 1/5] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNzozMyBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTguMDcuMjAxOSAxNToxMywgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNzoxMiBBTSBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMTguMDcuMjAxOSAxNDo1NSwgVGFt
YXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCA0OjQ3IEFN
IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4+PiBPbiAxNy4wNy4y
MDE5IDIxOjMzLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPj4+Pj4gQEAgLTkwMCw2ICs4OTUs
NyBAQCBzdGF0aWMgaW50IHNoYXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2Zu
LCBzaHJfaGFuZGxlX3Qgc2gsCj4gPj4+Pj4gICAgICAgICBwMm1fdHlwZV90IHNtZm5fdHlwZSwg
Y21mbl90eXBlOwo+ID4+Pj4+ICAgICAgICAgc3RydWN0IHR3b19nZm5zIHRnOwo+ID4+Pj4+ICAg
ICAgICAgc3RydWN0IHJtYXBfaXRlcmF0b3Igcmk7Cj4gPj4+Pj4gKyAgICB1bnNpZ25lZCBsb25n
IHB1dF9jb3VudCA9IDA7Cj4gPj4+Pj4KPiA+Pj4+PiAgICAgICAgIGdldF90d29fZ2ZucyhzZCwg
c2dmbiwgJnNtZm5fdHlwZSwgTlVMTCwgJnNtZm4sCj4gPj4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgY2QsIGNnZm4sICZjbWZuX3R5cGUsIE5VTEwsICZjbWZuLCAwLCAmdGcpOwo+ID4+Pj4+IEBA
IC05NjQsMTUgKzk2MCw2IEBAIHN0YXRpYyBpbnQgc2hhcmVfcGFnZXMoc3RydWN0IGRvbWFpbiAq
c2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKPiA+Pj4+PiAgICAgICAgICAgICBnb3Rv
IGVycl9vdXQ7Cj4gPj4+Pj4gICAgICAgICB9Cj4gPj4+Pj4KPiA+Pj4+PiAtICAgIC8qIEFjcXVp
cmUgYW4gZXh0cmEgcmVmZXJlbmNlLCBmb3IgdGhlIGZyZWVpbmcgYmVsb3cgdG8gYmUgc2FmZS4g
Ki8KPiA+Pj4+PiAtICAgIGlmICggIWdldF9wYWdlKGNwYWdlLCBkb21fY293KSApCj4gPj4+Pj4g
LSAgICB7Cj4gPj4+Pj4gLSAgICAgICAgcmV0ID0gLUVPVkVSRkxPVzsKPiA+Pj4+PiAtICAgICAg
ICBtZW1fc2hhcmluZ19wYWdlX3VubG9jayhzZWNvbmRwZyk7Cj4gPj4+Pj4gLSAgICAgICAgbWVt
X3NoYXJpbmdfcGFnZV91bmxvY2soZmlyc3RwZyk7Cj4gPj4+Pj4gLSAgICAgICAgZ290byBlcnJf
b3V0Owo+ID4+Pj4+IC0gICAgfQo+ID4+Pj4+IC0KPiA+Pj4+PiAgICAgICAgIC8qIE1lcmdlIHRo
ZSBsaXN0cyB0b2dldGhlciAqLwo+ID4+Pj4+ICAgICAgICAgcm1hcF9zZWVkX2l0ZXJhdG9yKGNw
YWdlLCAmcmkpOwo+ID4+Pj4+ICAgICAgICAgd2hpbGUgKCAoZ2ZuID0gcm1hcF9pdGVyYXRlKGNw
YWdlLCAmcmkpKSAhPSBOVUxMKQo+ID4+Pj4+IEBAIC05ODQsMTMgKzk3MSwxNCBAQCBzdGF0aWMg
aW50IHNoYXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBzaHJfaGFuZGxl
X3Qgc2gsCj4gPj4+Pj4gICAgICAgICAgICAgICogRG9uJ3QgY2hhbmdlIHRoZSB0eXBlIG9mIHJt
YXAgZm9yIHRoZSBjbGllbnQgcGFnZS4gKi8KPiA+Pj4+PiAgICAgICAgICAgICBybWFwX2RlbChn
Zm4sIGNwYWdlLCAwKTsKPiA+Pj4+PiAgICAgICAgICAgICBybWFwX2FkZChnZm4sIHNwYWdlKTsK
PiA+Pj4+PiAtICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShjcGFnZSk7Cj4gPj4+Pj4gKyAgICAg
ICAgcHV0X2NvdW50Kys7Cj4gPj4+Pj4gICAgICAgICAgICAgZCA9IGdldF9kb21haW5fYnlfaWQo
Z2ZuLT5kb21haW4pOwo+ID4+Pj4+ICAgICAgICAgICAgIEJVR19PTighZCk7Cj4gPj4+Pj4gICAg
ICAgICAgICAgQlVHX09OKHNldF9zaGFyZWRfcDJtX2VudHJ5KGQsIGdmbi0+Z2ZuLCBzbWZuKSk7
Cj4gPj4+Pj4gICAgICAgICAgICAgcHV0X2RvbWFpbihkKTsKPiA+Pj4+PiAgICAgICAgIH0KPiA+
Pj4+PiAgICAgICAgIEFTU0VSVChsaXN0X2VtcHR5KCZjcGFnZS0+c2hhcmluZy0+Z2ZucykpOwo+
ID4+Pj4+ICsgICAgQlVHX09OKCFwdXRfY291bnQpOwo+ID4+Pj4+Cj4gPj4+Pj4gICAgICAgICAv
KiBDbGVhciB0aGUgcmVzdCBvZiB0aGUgc2hhcmVkIHN0YXRlICovCj4gPj4+Pj4gICAgICAgICBw
YWdlX3NoYXJpbmdfZGlzcG9zZShjcGFnZSk7Cj4gPj4+Pj4gQEAgLTEwMDEsNyArOTg5LDkgQEAg
c3RhdGljIGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hy
X2hhbmRsZV90IHNoLAo+ID4+Pj4+Cj4gPj4+Pj4gICAgICAgICAvKiBGcmVlIHRoZSBjbGllbnQg
cGFnZSAqLwo+ID4+Pj4+ICAgICAgICAgcHV0X3BhZ2VfYWxsb2NfcmVmKGNwYWdlKTsKPiA+Pj4+
PiAtICAgIHB1dF9wYWdlKGNwYWdlKTsKPiA+Pj4+PiArCj4gPj4+Pj4gKyAgICB3aGlsZSAoIHB1
dF9jb3VudC0tICkKPiA+Pj4+PiArICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShjcGFnZSk7Cj4g
Pj4+Pj4KPiA+Pj4+PiAgICAgICAgIC8qIFdlIG1hbmFnZWQgdG8gZnJlZSBhIGRvbWFpbiBwYWdl
LiAqLwo+ID4+Pj4+ICAgICAgICAgYXRvbWljX2RlYygmbnJfc2hhcmVkX21mbnMpOwo+ID4+Pj4+
IEBAIC0xMTY1LDE5ICsxMTU1LDEzIEBAIGludCBfX21lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShz
dHJ1Y3QgZG9tYWluICpkLAo+ID4+Pj4+ICAgICAgICAgewo+ID4+Pj4+ICAgICAgICAgICAgIGlm
ICggIWxhc3RfZ2ZuICkKPiA+Pj4+PiAgICAgICAgICAgICAgICAgbWVtX3NoYXJpbmdfZ2ZuX2Rl
c3Ryb3kocGFnZSwgZCwgZ2ZuX2luZm8pOwo+ID4+Pj4+IC0gICAgICAgIHB1dF9wYWdlX2FuZF90
eXBlKHBhZ2UpOwo+ID4+Pj4+ICsKPiA+Pj4+PiAgICAgICAgICAgICBtZW1fc2hhcmluZ19wYWdl
X3VubG9jayhwYWdlKTsKPiA+Pj4+PiArCj4gPj4+Pj4gICAgICAgICAgICAgaWYgKCBsYXN0X2dm
biApCj4gPj4+Pj4gLSAgICAgICAgewo+ID4+Pj4+IC0gICAgICAgICAgICBpZiAoICFnZXRfcGFn
ZShwYWdlLCBkb21fY293KSApCj4gPj4+Pj4gLSAgICAgICAgICAgIHsKPiA+Pj4+PiAtICAgICAg
ICAgICAgICAgIHB1dF9nZm4oZCwgZ2ZuKTsKPiA+Pj4+PiAtICAgICAgICAgICAgICAgIGRvbWFp
bl9jcmFzaChkKTsKPiA+Pj4+PiAtICAgICAgICAgICAgICAgIHJldHVybiAtRU9WRVJGTE9XOwo+
ID4+Pj4+IC0gICAgICAgICAgICB9Cj4gPj4+Pj4gICAgICAgICAgICAgICAgIHB1dF9wYWdlX2Fs
bG9jX3JlZihwYWdlKTsKPiA+Pj4+PiAtICAgICAgICAgICAgcHV0X3BhZ2UocGFnZSk7Cj4gPj4+
Pj4gLSAgICAgICAgfQo+ID4+Pj4+ICsKPiA+Pj4+PiArICAgICAgICBwdXRfcGFnZV9hbmRfdHlw
ZShwYWdlKTsKPiA+Pj4+PiAgICAgICAgICAgICBwdXRfZ2ZuKGQsIGdmbik7Cj4gPj4+Pj4KPiA+
Pj4+PiAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Pj4+Cj4gPj4+PiAuLi4gdGhpcyAobWFpbiwg
YXMgSSBndWVzcyBieSB0aGUgdGl0bGUpIHBhcnQgb2YgdGhlIGNoYW5nZT8gSSB0aGluawo+ID4+
Pj4geW91IHdhbnQgdG8gZXhwbGFpbiB3aGF0IHdhcyB3cm9uZyBoZXJlIGFuZC9vciB3aHkgdGhl
IG5ldyBhcnJhbmdlbWVudAo+ID4+Pj4gaXMgYmV0dGVyLiAoSSdtIHNvcnJ5LCBJIGd1ZXNzIGl0
IHdhcyB0aGlzIHdheSBvbiBwcmlvciB2ZXJzaW9ucwo+ID4+Pj4gYWxyZWFkeSwgYnV0IGFwcGFy
ZW50bHkgSSBkaWRuJ3Qgbm90aWNlLikKPiA+Pj4KPiA+Pj4gSXQncyB3aGF0IHRoZSBwYXRjaCBt
ZXNzYWdlIHNheXMgLSBjYWxsaW5nIHB1dF9wYWdlX2FuZF90eXBlIGJlZm9yZQo+ID4+PiBtZW1f
c2hhcmluZ19wYWdlX3VubG9jayBjYW4gY2F1c2UgYSBkZWFkbG9jay4gU2luY2Ugbm93IHdlIGFy
ZSBub3cKPiA+Pj4gaG9sZGluZyBhIHJlZmVyZW5jZSB0byB0aGUgcGFnZSB0aWxsIHRoZSBlbmQg
dGhlcmUgaXMgbm8gbmVlZCBmb3IgdGhlCj4gPj4+IGV4dHJhIGdldF9wYWdlL3B1dF9wYWdlIGxv
Z2ljIHdoZW4gd2UgYXJlIGRlYWxpbmcgd2l0aCB0aGUgbGFzdF9nZm4uCj4gPj4KPiA+PiBUaGUg
dGl0bGUgc2F5cyAicmVvcmRlciIgd2l0aG91dCBhbnkgIndoeSIuCj4gPgo+ID4gWWVzLCBJIGNh
bid0IHJlYXNvbmFibHkgZml0ICJDYWxsaW5nIF9wdXRfcGFnZV90eXBlIHdoaWxlIGFsc28gaG9s
ZGluZwo+ID4gdGhlIHBhZ2VfbG9jayBmb3IgdGhhdCBwYWdlIGNhbiBjYXVzZSBhIGRlYWRsb2Nr
LiIgaW50byB0aGUgdGl0bGUuIFNvCj4gPiBpdCdzIHNwZWxsZWQgb3V0IGluIHRoZSBwYXRjaCBt
ZXNzYWdlLgo+Cj4gT2YgY291cnNlIG5vdC4gQW5kIEkgcmVhbGl6ZSBfcGFydF8gb2YgdGhlIGNo
YW5nZXMgaXMgaW5kZWVkIHdoYXQgdGhlCj4gdGl0bGUgc2F5cyAoYWx0aG91Z2ggZm9yIHNoYXJl
X3BhZ2VzKCkgdGhhdCdzIG5vdCBvYnZpb3VzIGZyb20gdGhlCj4gcGF0Y2ggYWxvbmUpLiBCdXQg
eW91IGRvIG1vcmU6IFlvdSBhbHNvIGF2b2lkIGFjcXVpcmluZyBhbiBleHRyYQo+IHJlZmVyZW5j
ZSBpbiBzaGFyZV9wYWdlcygpLgoKSSBmZWVsIGxpa2Ugd2UgYXJlIGdvaW5nIGluIGNpcmNsZXMg
YW5kIGhhdmluZyB0aGUgc2FtZSBjb252ZXJzYXRpb25zCm92ZXIgYW5kIG92ZXIgd2l0aG91dCBy
ZWFsbHkgbWFraW5nIGFueSBoZWFkd2F5LiBZb3UgaW50cm9kdWNlZApncmFiYmluZyB0aGUgYnJv
a2VuIGV4dHJhIHJlZmVyZW5jZSBpbiAwNTAyZTBhZGFlMi4gSXQgaXMgYW5kIHdhcwphY3R1YWxs
eSB1bm5lZWRlZCB0byBzdGFydCB3aXRoIGlmIHRoZSBwcm9wZXIgc29sdXRpb24gd2FzIHB1dCBp
bgpwbGFjZSwgd2hpY2ggaXMgd2hhdCB0aGlzIHBhdGNoIGRvZXMsIHJlb3JkZXJpbmcgdGhpbmdz
LgoKPiBBbmQgc2luY2UgeW91IG1hZGUgbWUgbG9vayBhdCB0aGUgY29kZSBhZ2FpbjogSWYgcHV0
X3BhZ2UoKSBpcyB1bnNhZmUKPiB3aXRoIGEgbG9jayBoZWxkLCBob3cgY29tZSB0aGUgZ2V0X3Bh
Z2VfYW5kX3R5cGUoKSBpbiBzaGFyZV9wYWdlcygpCj4gaXMgc2FmZSB3aXRoIHR3byBzdWNoIGxv
Y2tzIGhlbGQ/IElmIGl0IHJlYWxseSBpcywgaXQgc3VyZWx5IHdvdWxkIGJlCj4gd29ydGh3aGls
ZSB0byBzdGF0ZSBpbiB0aGUgZGVzY3JpcHRpb24uIFRoZXJlJ3MgYW5vdGhlciBzdWNoIGluc3Rh
bmNlCj4gaW4gbWVtX3NoYXJpbmdfYWRkX3RvX3BoeXNtYXAoKSAocGx1cyBhIGdldF9wYWdlKCkp
LCBhbmQgYWxzbyBvbmUKPiB3aGVyZSBwdXRfcGFnZV9hbmRfdHlwZSgpIGdldHMgY2FsbGVkIHdp
dGggc3VjaCBhIGxvY2sgaGVsZCAoYWZhaWNzKS4KPgoKSXQncyBwb3NzaWJsZSB0aGVyZSBhcmUg
b3RoZXIgaW5zdGFuY2VzIHdoZXJlIHRoaXMgbWF5IHN0aWxsIGJlCmJyb2tlbi4gUmlnaHQgbm93
IEkgb25seSBoYXZlIGJhbmR3aWR0aCB0byB0ZXN0IGFuZCBmaXggdGhlIHBhdGhzIEkKdXNlLiBJ
ZiB0aGF0J3MgdW5hY2NlcHRhYmxlIEknbSBoYXBweSB0byBjb250aW51ZSBkZXZlbG9wbWVudCBp
biBteQpwcml2YXRlIGZvcmsgYW5kIGxlYXZlIHRoaW5ncyBhcy1pcyB1cHN0cmVhbS4KClRhbWFz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
