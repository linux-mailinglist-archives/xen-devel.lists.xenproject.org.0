Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFD914CCDD
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 16:00:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwomX-0000Rb-8X; Wed, 29 Jan 2020 14:57:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WAbB=3S=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iwomV-0000RW-GF
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:57:27 +0000
X-Inumbo-ID: a9d0e57e-42a7-11ea-8396-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9d0e57e-42a7-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 14:57:26 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t14so38978wmi.5
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 06:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PvNTlgtUS5Ihvb+Kw5lycIIaRqgnYGDhGbfClwq75Cg=;
 b=Yxw+RvS0CoHruaHxAVAKZLz5lC8ypdIMML+Bp4bZpalDxgsDa8Z8eWLehB6aAb+Ohe
 a0hsphLKhGFqShWsCJSBMw2vJ9mZbjc+ZMh4kwXT8Er6Z1KdD3kH75Gam/ic3ih0nrvF
 fIFfeqQsBF3TDzC3AybSAfR3RM4isfcxkvTEw79ShzAOLXfxFmk9pd8SfFI4ImlGJiJN
 rOPe7GCJT2DzIqZPBob4wwzzNZxf9LT1ECTm88acMOYaRAq5pD08mUQmHLFZgL/0yEaC
 74E5MUDSzY3ghgwu00V75nhkZgqjgTV8uDhrkPVXICz+Z225mKAcOg8/BC4rL964yL29
 Grmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PvNTlgtUS5Ihvb+Kw5lycIIaRqgnYGDhGbfClwq75Cg=;
 b=PDmOfusQil9PJBa9IR0WZ6vOrgofYIALKRcgoluvNuN5b//2OWVfK1JiyUQxqVXJlV
 L8dJfhAqBRikcFQNorver52x1CNFwxN0HrwtRujIwyna2SOkTwu7akgLOGaY9ekfEYjV
 4PjneKYmbmecBxSwBH0TP6gP2BOywcvs8toLgzQsCN33Au+yUYlpJxhGsRZwqpAmDVVM
 KKbwQRcJqn8vH7YD1dZJLqjj/ejhoKmbN8t3c9CG8TYQ6Db1WUlwV+hAON30O3AlV/Oj
 IWePjzdcO8cR35/n5SPRn3kngjZWNeZaESJ1GAGyOEt7BsKmQwPkFMKaEVbWcGF05ssF
 wu6Q==
X-Gm-Message-State: APjAAAX0rxeLPQnVKP6/b5IqzFUBJ69rn4aTkGE6aHoC5aNNEktt4qJb
 cgCdWRJpe0mTMI8/V7KRQlxhF35+RJNSNuM5v3w=
X-Google-Smtp-Source: APXvYqykN15Rdheudcz//8bVg2cuEQFPMQb7CSlfwds1s8zGUTLjcS77wqSCuBdKZla5p9WclLsyimrx+WRs45BRrrs=
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr12560210wmg.154.1580309846011; 
 Wed, 29 Jan 2020 06:57:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <ae2142231342bfc6fb9731303130a2c0fa381576.1580148227.git.tamas.lengyel@intel.com>
 <88661ce4-ef90-c525-586a-4668d4b0001e@suse.com>
 <CABfawhnZTSzh5X0Zctiikw7xhMEDdSGTnW2-eBVC_FsGN9-Ksg@mail.gmail.com>
 <1835b6f4-7361-8979-5a0e-27df5148873a@suse.com>
 <CABfawhkBh-EFjq_HDMaTbtHo=toDcM-C6NwEgCN4i7hZWNNeCA@mail.gmail.com>
 <8143473f-c87d-a0d1-e211-c94b1dc7f5c8@suse.com>
In-Reply-To: <8143473f-c87d-a0d1-e211-c94b1dc7f5c8@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 29 Jan 2020 07:56:49 -0700
Message-ID: <CABfawh==quyX5uG1Rh5V8rbDO_SnNr-mA-=DSFn8ejvaXe_ZgA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v6 5/9] x86/mem_sharing: use default_access
 in add_to_physmap
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgNzo0NCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjkuMDEuMjAyMCAxNTowNSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gV2VkLCBKYW4gMjksIDIwMjAgYXQgNjoyNyBBTSBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMjguMDEuMjAyMCAxODowMiwgVGFt
YXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiBPbiBUdWUsIEphbiAyOCwgMjAyMCBhdCA5OjU2IEFN
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gT24g
MjcuMDEuMjAyMCAxOTowNiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+Pj4+IFdoZW4gcGx1
Z2dpbmcgYSBob2xlIGluIHRoZSB0YXJnZXQgcGh5c21hcCBkb24ndCB1c2UgdGhlIGFjY2VzcyBw
ZXJtaXNzaW9uCj4gPj4+Pj4gcmV0dXJuZWQgYnkgX19nZXRfZ2ZuX3R5cGVfYWNjZXNzIGFzIGl0
IGNhbiBiZSBub24tc2Vuc2ljYWwsIGxlYWRpbmcgdG8KPiA+Pj4+PiBzcHVyaW91cyB2bV9ldmVu
dHMgYmVpbmcgc2VudCBvdXQgZm9yIGFjY2VzcyB2aW9sYXRpb25zIGF0IHVuZXhwZWN0ZWQKPiA+
Pj4+PiBsb2NhdGlvbnMuIE1ha2UgdXNlIG9mIHAybS0+ZGVmYXVsdF9hY2Nlc3MgaW5zdGVhZC4K
PiA+Pj4+Cj4gPj4+PiBBcyBiZWZvcmUsIHRvIG1lICJjYW4gYmUgbm9uLXNlbnNpY2FsIiBpcyBp
bnN1ZmZpY2llbnQgYXMgYSByZWFzb24KPiA+Pj4+IGhlcmUuIElmIGl0IGNhbiBhbHNvIGJlIGEg
Imdvb2QiIHZhbHVlLCBpdCBzdGlsbCByZW1haW5zIHVuY2xlYXIKPiA+Pj4+IHdoeSBpbiB0aGF0
IGNhc2UgcDJtLT5kZWZhdWx0X2FjY2VzcyBpcyBuZXZlcnRoZWxlc3MgdGhlIHJpZ2h0Cj4gPj4+
PiB2YWx1ZSB0byB1c2UuCj4gPj4+Cj4gPj4+IEkgaGF2ZSBhbHJlYWR5IGV4cGxhaW5lZCBpbiB0
aGUgcHJldmlvdXMgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggd2h5IEkKPiA+Pj4gc2FpZCAiY2FuIGJl
Ii4gRm9yZ290IHRvIGNoYW5nZSB0aGUgY29tbWl0IG1lc3NhZ2UgZnJvbSAiY2FuIGJlIiB0bwo+
ID4+PiAiaXMiLgo+ID4+Cj4gPj4gQ2hhbmdpbmcganVzdCB0aGUgY29tbWl0IG1lc3NhZ2Ugd291
bGQgYmUgZWFzeSB3aGlsZSBjb21taXR0aW5nLgo+ID4+IEJ1dCBldmVuIHdpdGggdGhlIGNoYW5n
ZSBJIHdvdWxkIGFzayB3aHkgdGhpcyBpcy4gTG9va2luZyBhdAo+ID4+IGVwdF9nZXRfZW50cnko
KSAoYW5kIGFzc3VtaW5nIHAybV9wdF9nZXRfZW50cnkoKSB3aWxsIHdvcmsKPiA+PiBzaW1pbGFy
bHksIG1pbnVzIHRoZSBwMm1fYWNjZXNzX3Qgd2hpY2ggY2FuJ3QgY29tZSBvdXQgb2YgdGhlCj4g
Pj4gUFRFIGp1c3QgeWV0KSwgSSBzZWUKPiA+Pgo+ID4+ICAgICBpZiAoIGlzX2VwdGVfdmFsaWQo
ZXB0X2VudHJ5KSApCj4gPj4gICAgIHsKPiA+PiAgICAgICAgICp0ID0gcDJtX3JlY2FsY190eXBl
KHJlY2FsYyB8fCBlcHRfZW50cnktPnJlY2FsYywKPiA+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGVwdF9lbnRyeS0+c2FfcDJtdCwgcDJtLCBnZm4pOwo+ID4+ICAgICAgICAgKmEgPSBl
cHRfZW50cnktPmFjY2VzczsKPiA+Pgo+ID4+IG5lYXIgaXRzIGVuZC4gV2hpY2ggbWVhbnMgZXZl
biBhIGhvbGUgY2FuIGhhdmUgaXRzIGFjY2VzcyBmaWVsZAo+ID4+IHNldC4gU28gaXQncyBzdGls
bCBub3QgY2xlYXIgdG8gbWUgZnJvbSB0aGUgZGVzY3JpcHRpb24gd2h5Cj4gPj4gcDJtLT5kZWZh
dWx0X2FjY2VzcyBpcyB1bmlmb3JtbHkgdGhlIHZhbHVlIHRvIHVzZS4gV291bGRuJ3QgeW91Cj4g
Pj4gcmF0aGVyIHdhbnQgdG8gb3ZlcnJpZGUgdGhlIG9yaWdpbmFsIHZhbHVlIG9ubHkgaWYgaXQn
cwo+ID4+IHAybV9hY2Nlc3NfbiB0b2dldGhlciB3aXRoIHAybV9pbnZhbGlkIG9yIHAybV9tbWlv
X2RtIChidXQgbm90Cj4gPj4gcGFnZWQtb3V0IHBhZ2VzKT8KPiA+Cj4gPiBBdCB0aGlzIHBvaW50
IEkgd291bGQganVzdCByYXRoZXIgc3RhdGUgdGhhdCBhZGRfdG9fcGh5c21hcCBvbmx5IHdvcmtz
Cj4gPiBvbiBhY3R1YWwgaG9sZXMsIG5vdCB3aXRoIHBhZ2VkLW91dCBwYWdlcy4gSW4gZmFjdCwg
SSB3b3VsZCBsaWtlIHRvCj4gPiBzZWUgbWVtX3BhZ2luZyBiZWluZyBkcm9wcGVkIGZyb20gdGhl
IGNvZGViYXNlIGVudGlyZWx5IHNpbmNlIGl0J3MKPiA+IGJlZW4gYWJhbmRvbmVkIGZvciB5ZWFy
cyBhbmQgbm9vbmUgZXhwcmVzc2luZyBhbnkgaW50ZXJlc3QgaW4ga2VlcGluZwo+ID4gaXQuIElu
IHRoZSBpbnRlcmltIEkgd291bGQgcmF0aGVyIG5vdCBzcGVuZCB1bm5lY2Vzc2FyeSBjeWNsZXMg
b24KPiA+IHNwZWN1bGF0aW5nIGFib3V0IHBvdGVudGlhbCBjb3JuZXItY2FzZXMgb2YgbWVtX3Bh
Z2luZyB3aGVuIG5vb25lCj4gPiBhY3R1YWxseSB1c2VzIGl0Lgo+ID4KPiA+PiBPZiBjb3Vyc2Ug
dGhlbiB0aGUgcXVlc3Rpb24gaXMgd2hldGhlciB0aGVyZQo+ID4+IHdvdWxkbid0IGJlIGFuIGFt
YmlndWl0eSB3aXRoIHAybV9hY2Nlc3NfbiBoYXZpbmcgZ290IHNldAo+ID4+IGV4cGxpY2l0bHkg
b24gdGhlIHBhZ2UuIEJ1dCBtYXliZSB0aGlzIGlzIGltcG9zc2libGUgZm9yCj4gPj4gcDJtX2lu
dmFsaWQgLyBwMm1fbW1pb19kbT8KPiA+Cj4gPiBBcyBmYXIgYXMgbWVtX2FjY2VzcyBwZXJtaXNz
aW9ucyBnbywgSSBkb24ndCBrbm93IG9mIGFueSB1c2VjYXNlIHRoYXQKPiA+IHdvdWxkIHNldCBt
ZW1fYWNjZXNzIHBlcm1pc3Npb24gb24gYSBob2xlIGV2ZW4gaWYgYnkgbG9va3Mgb2YgaXQgaXQg
aXMKPiA+IHRlY2huaWNhbGx5IHBvc3NpYmxlLiBBdCB0aGlzIHBvaW50IEkgd291bGQgcmF0aGVy
IGp1c3QgcHV0IHRoaXMKPiA+IGNvcm5lci1jYXNlJ3MgZGVzY3JpcHRpb24gaW4gYSBjb21tZW50
Lgo+Cj4gSSB0aGluayBJIHdvdWxkIGFjayBhIHJldmlzZWQgcGF0Y2ggaGF2aW5nIHRoaXMgcHJv
cGVybHkgZXhwbGFpbmVkLgoKVGhhdCdzIGZpbmUsIEknbGwgYWRkIHNvbWUgY29tbWVudHMgdG8g
dGhpcyBlZmZlY3QgYW5kIHJld29yZCB0aGUKY29tbWl0IG1lc3NhZ2UuCgpUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
