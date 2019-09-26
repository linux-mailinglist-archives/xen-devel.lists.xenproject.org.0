Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21691BF4BC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:10:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDURW-0005Ly-PF; Thu, 26 Sep 2019 14:08:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDURV-0005Lt-SV
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:08:25 +0000
X-Inumbo-ID: 1a827999-e067-11e9-9655-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by localhost (Halon) with ESMTPS
 id 1a827999-e067-11e9-9655-12813bfff9fa;
 Thu, 26 Sep 2019 14:08:25 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y135so6711684wmc.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 07:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HDI5kwSHP0pcCX+Tz3tq0P8fWfhxXDSjKIltFZDPFH0=;
 b=BIF2ksn3shHZUWgyeQecocDOqAlbS/obvcJNuDiBRZkPPtPSwhWRbQR3Q6739witma
 xcoN04g2ZiTuXcfcJGBZ5HHg5cjTLPvjD8+dQV/af3RjMMEaQa74aBwtVHSyVF0ssxWZ
 m71/dbRkLUrY/mT54wy5DPpzk67RaJj9CTuwuq/Y3D8qz55u/ovqhmR/8AUeSfBaK3D8
 MDAUA9vuJLqwYQtSv14xJYI4p9EyPZyNAvwUDAofcIukCHQphs8034OGJrCxqHxiwXXi
 ZsDWcOFSNJIrPmiJcBO01lilshvAbzSvhxG/ClG505qzY6FyHWLlQ78cQQHFEQIvKihr
 j2+g==
X-Gm-Message-State: APjAAAWEF+IpffCvxOVq5ES8kQbYDqSeJhlvz/k+D+ub/89QwLx/dHoc
 Ht8hHSyyPSgs5JOhvKJzjVI=
X-Google-Smtp-Source: APXvYqykZmT4doQCDkH2Rhb0/wRwR2AYHSCaaRIX/g0wmDyEzPNFwDlTktj0CddZoT7OMXNc9CxFZw==
X-Received: by 2002:a7b:ce0a:: with SMTP id m10mr3369332wmc.167.1569506904351; 
 Thu, 26 Sep 2019 07:08:24 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id q15sm6120860wrg.65.2019.09.26.07.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 07:08:23 -0700 (PDT)
Date: Thu, 26 Sep 2019 15:08:22 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926140822.tddjfxyr3hpvcyn6@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <0aa271bfe3670f7058128c728d392faa69418a49.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0aa271bfe3670f7058128c728d392faa69418a49.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 65/84] x86: fix some wrong assumptions
 on direct map. Increase PMAP slots to 8.
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
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6MjhBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCj4g
U2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KPiAtLS0KPiAg
eGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMgfCA4IC0tLS0tLS0tCj4gIHhlbi9hcmNoL3g4Ni94
ODZfNjQvbW0uYyAgIHwgMyArKy0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9wbWFwLmggfCA0ICsr
LS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWluX3BhZ2UuYyBiL3hlbi9hcmNoL3g4
Ni9kb21haW5fcGFnZS5jCj4gaW5kZXggNGEzOTk1Y2NlZi4uZjRmNTNhMmEzMyAxMDA2NDQKPiAt
LS0gYS94ZW4vYXJjaC94ODYvZG9tYWluX3BhZ2UuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21h
aW5fcGFnZS5jCj4gQEAgLTMyOCwxMSArMzI4LDYgQEAgdm9pZCAqbWFwX2RvbWFpbl9wYWdlX2ds
b2JhbChtZm5fdCBtZm4pCj4gICAgICAgICAgICAgICBzeXN0ZW1fc3RhdGUgPCBTWVNfU1RBVEVf
YWN0aXZlKSB8fAo+ICAgICAgICAgICAgICBsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKSk7Cj4gIAo+
IC0jaWZkZWYgTkRFQlVHCj4gLSAgICBpZiAoIG1mbl94KG1mbikgPD0gUEZOX0RPV04oX19wYShI
WVBFUlZJU09SX1ZJUlRfRU5EIC0gMSkpICkKPiAtICAgICAgICByZXR1cm4gbWZuX3RvX3ZpcnQo
bWZuX3gobWZuKSk7Cj4gLSNlbmRpZgo+IC0KCkkgd291bGRuJ3QgY2FsbCB0aGlzIGEgd3Jvbmcg
YXNzdW1wdGlvbi4KClRoaXMgcGF0aCBpcyBhIGZhc3QgcGF0aC4gVGhlIHByb2JsZW0gaXMgaXQg
aXMgbm90IGxvbmdlciBhcHBsaWNhYmxlIGluCnRoZSBuZXcgd29ybGQuCgpJIHdvdWxkIGNoYW5n
ZSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gc29tZXRoaW5nIGxpa2U6CgogICBEcm9wIGZhc3QgcGF0
aHMgaW4gbWFwX2RvbWFpbl9wYWdlX2dsb2JhbCBBUEkgcGFpciwgYmVjYXVzZSBYZW4gd2lsbAog
ICBubyBsb25nZXIgaGF2ZSBhIGRpcmVjdCBtYXAuCgo+ICAgICAgcmV0dXJuIHZtYXAoJm1mbiwg
MSk7Cj4gIH0KPiAgCj4gQEAgLTM0MCw5ICszMzUsNiBAQCB2b2lkIHVubWFwX2RvbWFpbl9wYWdl
X2dsb2JhbChjb25zdCB2b2lkICpwdHIpCj4gIHsKPiAgICAgIHVuc2lnbmVkIGxvbmcgdmEgPSAo
dW5zaWduZWQgbG9uZylwdHI7Cj4gIAo+IC0gICAgaWYgKCB2YSA+PSBESVJFQ1RNQVBfVklSVF9T
VEFSVCApCj4gLSAgICAgICAgcmV0dXJuOwo+IC0KPiAgICAgIEFTU0VSVCh2YSA+PSBWTUFQX1ZJ
UlRfU1RBUlQgJiYgdmEgPCBWTUFQX1ZJUlRfRU5EKTsKPiAgCj4gICAgICB2dW5tYXAocHRyKTsK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIGIveGVuL2FyY2gveDg2L3g4
Nl82NC9tbS5jCj4gaW5kZXggMzdlOGQ1OWU1ZC4uNDBmMjlmOGRkYyAxMDA2NDQKPiAtLS0gYS94
ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKPiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMK
PiBAQCAtNzEyLDcgKzcxMiw4IEBAIHZvaWQgX19pbml0IHBhZ2luZ19pbml0KHZvaWQpCj4gICAg
ICBpZiAoIG1mbl9lcShsMl9yb19tcHRfbWZuLCBJTlZBTElEX01GTikgKQo+ICAgICAgICAgIGdv
dG8gbm9tZW07Cj4gICAgICBsMl9yb19tcHQgPSBtYXBfeGVuX3BhZ2V0YWJsZShsMl9yb19tcHRf
bWZuKTsKPiAtICAgIGNvbXBhdF9pZGxlX3BnX3RhYmxlX2wyID0gbDJfcm9fbXB0Owo+ICsgICAg
LyogY29tcGF0X2lkbGVfcGdfdGFibGVfbDIgaXMgdXNlZCBnbG9iYWxseS4gKi8KPiArICAgIGNv
bXBhdF9pZGxlX3BnX3RhYmxlX2wyID0gbWFwX2RvbWFpbl9wYWdlX2dsb2JhbChsMl9yb19tcHRf
bWZuKTsKCkFnYWluLCBpZiB0aGlzIGlzIGEgYnVnIGluIGEgcHJldmlvdXMgcGF0Y2gsIGl0IHNo
b3VsZCBiZSBmaXhlZCB0aGVyZS4KCj4gICAgICBjbGVhcl9wYWdlKGwyX3JvX21wdCk7Cj4gICAg
ICBsM2Vfd3JpdGUoJmwzX3JvX21wdFtsM190YWJsZV9vZmZzZXQoSElST19DT01QQVRfTVBUX1ZJ
UlRfU1RBUlQpXSwKPiAgICAgICAgICAgICAgICBsM2VfZnJvbV9tZm4obDJfcm9fbXB0X21mbiwg
X19QQUdFX0hZUEVSVklTT1JfUk8pKTsKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9wbWFwLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3BtYXAuaAo+IGluZGV4IGZlYWIxZTkxNzAu
LjM0ZDRmMmJiMzggMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wbWFwLmgKPiAr
KysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3BtYXAuaAo+IEBAIC0xLDggKzEsOCBAQAo+ICAjaWZu
ZGVmIF9fWDg2X1BNQVBfSF9fCj4gICNkZWZpbmUgX19YODZfUE1BUF9IX18KPiAgCj4gLS8qIExh
cmdlIGVub3VnaCBmb3IgbWFwcGluZyA1IGxldmVscyBvZiBwYWdlIHRhYmxlcyAqLwo+IC0jZGVm
aW5lIE5VTV9GSVhfUE1BUCA1Cj4gKy8qIExhcmdlIGVub3VnaCBmb3IgbWFwcGluZyA1IGxldmVs
cyBvZiBwYWdlIHRhYmxlcyB3aXRoIHNvbWUgaGVhZHJvb20gKi8KPiArI2RlZmluZSBOVU1fRklY
X1BNQVAgOAo+ICAKClRoaXMgbG9va3MgcmF0aGVyIGFyYml0cmFyeSB0byBtZS4gQ2FuIHlvdSBz
cGVjaWZ5IHdoeSBleHRyYSBzbG90cyBhcmUKbmVlZGVkPyBUaGUgb3JpZ2luYWwganVzdGlmaWNh
dGlvbiBmb3IgNSBpcyBmb3IgcGFnZSB0YWJsZXMuIE5vdwpvYnZpb3VzbHkgaXQgaXMgdXNlZCBm
b3IgbW9yZSB0aGFuIGp1c3QgbWFwcGluZyBwYWdlIHRhYmxlcy4gIEknbQp3b3JyaWVkIHRoYXQg
ZXZlbiA4IG1heSBub3QgYmUgZW5vdWdoLiAKCkFsc28sIHRoaXMgY2hhbmdlIHNob3VsZCBlaXRo
ZXIgYmUgaW4gYSBzZXBhcmF0ZSBwYXRjaCBvciBmb2xkZWQgaW50bwpQTUFQIHBhdGNoIGl0c2Vs
Zi4KCldlaS4KCj4gIHZvaWQgcG1hcF9sb2NrKHZvaWQpOwo+ICB2b2lkIHBtYXBfdW5sb2NrKHZv
aWQpOwo+IC0tIAo+IDIuMTcuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
