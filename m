Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C8BBC434
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 10:43:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCgMX-0007td-NN; Tue, 24 Sep 2019 08:39:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCgMW-0007tY-42
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 08:39:56 +0000
X-Inumbo-ID: e131824a-dea6-11e9-96b2-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e131824a-dea6-11e9-96b2-bc764e2007e4;
 Tue, 24 Sep 2019 08:39:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CE68CAED5;
 Tue, 24 Sep 2019 08:39:52 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190924074202.4064-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <79c54053-c17b-597a-34bd-3a0e5ac349bb@suse.com>
Date: Tue, 24 Sep 2019 10:39:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190924074202.4064-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: don't let XEN_RUNSTATE_UPDATE
 leak into vcpu_runstate_get()
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAwOTo0MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiB2Y3B1X3J1bnN0YXRl
X2dldCgpIHNob3VsZCBuZXZlciByZXR1cm4gYSBzdGF0ZSBlbnRyeSB0aW1lIHdpdGgKPiBYRU5f
UlVOU1RBVEVfVVBEQVRFIHNldC4gVG8gYXZvaWQgdGhpcyBsZXQgdXBkYXRlX3J1bnN0YXRlX2Fy
ZWEoKQo+IG9wZXJhdGUgb24gYSBsb2NhbCBydW5zdGF0ZSBjb3B5Lgo+IAo+IFRoaXMgcHJvYmxl
bSB3YXMgaW50cm9kdWNlZCB3aXRoIGNvbW1pdCAyNTI5Yzg1MGVhNDhmMDM2ICgiYWRkIHVwZGF0
ZQo+IGluZGljYXRvciB0byB2Y3B1X3J1bnN0YXRlX2luZm8iKS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpQZXJoYXBzIHRoaXMgYWxzbyB3YW50
cyBhIFJlcG9ydGVkLWJ5IHRhZz8KCkluIHByaW5jaXBsZSB0aGUgY2hhbmdlIGlzIGZpbmUsIGJ1
dCBJIHdvbmRlciB3aGV0aGVyIHlvdSdyZSAoYSkKZ29pbmcgYSBsaXR0bGUgdG9vIGZhciBhbmQg
dGh1cyB5b3UgYXJlIChiKSBtaXNzaW5nIHNvbWUgY2xlYW51cApwb3RlbnRpYWw6Cgo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+IEBA
IC0xNjAwLDIxICsxNjAwLDI0IEBAIGJvb2wgdXBkYXRlX3J1bnN0YXRlX2FyZWEoc3RydWN0IHZj
cHUgKnYpCj4gICAgICBib29sIHJjOwo+ICAgICAgc3RydWN0IGd1ZXN0X21lbW9yeV9wb2xpY3kg
cG9saWN5ID0geyAubmVzdGVkX2d1ZXN0X21vZGUgPSBmYWxzZSB9Owo+ICAgICAgdm9pZCBfX3Vz
ZXIgKmd1ZXN0X2hhbmRsZSA9IE5VTEw7Cj4gKyAgICBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZv
IHJ1bnN0YXRlOwoKSSBkb24ndCB0aGluayB0aGUgZnVsbCBzdHJ1Y3R1cmUgbmVlZHMgY29weWlu
Zy4gWW91IGFscmVhZHkgdXNlIC4uLgoKPiAgICAgIGlmICggZ3Vlc3RfaGFuZGxlX2lzX251bGwo
cnVuc3RhdGVfZ3Vlc3QodikpICkKPiAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiAgCj4gICAgICB1
cGRhdGVfZ3Vlc3RfbWVtb3J5X3BvbGljeSh2LCAmcG9saWN5KTsKPiAgCj4gKyAgICBtZW1jcHko
JnJ1bnN0YXRlLCAmdi0+cnVuc3RhdGUsIHNpemVvZihydW5zdGF0ZSkpOwo+ICsKPiAgICAgIGlm
ICggVk1fQVNTSVNUKHYtPmRvbWFpbiwgcnVuc3RhdGVfdXBkYXRlX2ZsYWcpICkKPiAgICAgIHsK
PiAgICAgICAgICBndWVzdF9oYW5kbGUgPSBoYXNfMzJiaXRfc2hpbmZvKHYtPmRvbWFpbikKPiAg
ICAgICAgICAgICAgPyAmdi0+cnVuc3RhdGVfZ3Vlc3QuY29tcGF0LnAtPnN0YXRlX2VudHJ5X3Rp
bWUgKyAxCj4gICAgICAgICAgICAgIDogJnYtPnJ1bnN0YXRlX2d1ZXN0Lm5hdGl2ZS5wLT5zdGF0
ZV9lbnRyeV90aW1lICsgMTsKPiAgICAgICAgICBndWVzdF9oYW5kbGUtLTsKCi4uLiB0cmlja2Vy
eSB0byBnZXQgYXQganVzdCB0aGUgc3RhdGVfZW50cnlfdGltZSBmaWVsZC4gSSB0aGluawp5b3Ug
d291bGQgZ2V0IGF3YXkgd2l0aCBtYWtpbmcgYSBsb2NhbCBjb3B5IG9mIGp1c3QgdGhhdCBvbmUs
CnRodXMgLi4uCgo+IC0gICAgICAgIHYtPnJ1bnN0YXRlLnN0YXRlX2VudHJ5X3RpbWUgfD0gWEVO
X1JVTlNUQVRFX1VQREFURTsKPiArICAgICAgICBydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lIHw9
IFhFTl9SVU5TVEFURV9VUERBVEU7Cj4gICAgICAgICAgX19yYXdfY29weV90b19ndWVzdChndWVz
dF9oYW5kbGUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCAqKSgmdi0+cnVu
c3RhdGUuc3RhdGVfZW50cnlfdGltZSArIDEpIC0gMSwgMSk7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAodm9pZCAqKSgmcnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSArIDEpIC0gMSwg
MSk7CgouLi4gcmVkdWNpbmcgdGhlIGNvbXBsZXhpdHkgb2YgdGhpcyBhdCBsZWFzdCBhIGxpdHRs
ZSwgd2hpbGUgLi4uCgo+IEBAIC0xNjIyLDIwICsxNjI1LDIwIEBAIGJvb2wgdXBkYXRlX3J1bnN0
YXRlX2FyZWEoc3RydWN0IHZjcHUgKnYpCj4gICAgICB7Cj4gICAgICAgICAgc3RydWN0IGNvbXBh
dF92Y3B1X3J1bnN0YXRlX2luZm8gaW5mbzsKPiAgCj4gLSAgICAgICAgWExBVF92Y3B1X3J1bnN0
YXRlX2luZm8oJmluZm8sICZ2LT5ydW5zdGF0ZSk7Cj4gKyAgICAgICAgWExBVF92Y3B1X3J1bnN0
YXRlX2luZm8oJmluZm8sICZydW5zdGF0ZSk7Cj4gICAgICAgICAgX19jb3B5X3RvX2d1ZXN0KHYt
PnJ1bnN0YXRlX2d1ZXN0LmNvbXBhdCwgJmluZm8sIDEpOwo+ICAgICAgICAgIHJjID0gdHJ1ZTsK
PiAgICAgIH0KPiAgICAgIGVsc2UKPiAtICAgICAgICByYyA9IF9fY29weV90b19ndWVzdChydW5z
dGF0ZV9ndWVzdCh2KSwgJnYtPnJ1bnN0YXRlLCAxKSAhPQo+IC0gICAgICAgICAgICAgc2l6ZW9m
KHYtPnJ1bnN0YXRlKTsKPiArICAgICAgICByYyA9IF9fY29weV90b19ndWVzdChydW5zdGF0ZV9n
dWVzdCh2KSwgJnJ1bnN0YXRlLCAxKSAhPQo+ICsgICAgICAgICAgICAgc2l6ZW9mKHJ1bnN0YXRl
KTsKCi4uLiB0YWtpbmcgdGhlIG9wcG9ydHVuaXR5IHRvIG1ha2UgdGhpcyB1c2UgX19jb3B5X3Rv
X2d1ZXN0X2ZpZWxkKCkKKHN0b3Jpbmcgc3RhdGVfZW50cnlfdGltZSBsYXN0KSwgaW4gdHVybiBh
bGxvd2luZyAuLi4KCj4gICAgICBpZiAoIGd1ZXN0X2hhbmRsZSApCj4gICAgICB7Cj4gLSAgICAg
ICAgdi0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSAmPSB+WEVOX1JVTlNUQVRFX1VQREFURTsK
PiArICAgICAgICBydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lICY9IH5YRU5fUlVOU1RBVEVfVVBE
QVRFOwo+ICAgICAgICAgIHNtcF93bWIoKTsKPiAgICAgICAgICBfX3Jhd19jb3B5X3RvX2d1ZXN0
KGd1ZXN0X2hhbmRsZSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2b2lkICopKCZ2
LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lICsgMSkgLSAxLCAxKTsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICh2b2lkICopKCZydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lICsgMSkg
LSAxLCAxKTsKPiAgICAgIH0KCi4uLiB0byBkcm9wIHRoaXMgYWx0b2dldGhlci4KClRob3VnaHRz
PwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
