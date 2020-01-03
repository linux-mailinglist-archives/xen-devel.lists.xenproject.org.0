Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A82B512F6FF
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 12:11:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inKoZ-0001TG-PA; Fri, 03 Jan 2020 11:08:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=swuY=2Y=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1inKoY-0001TB-Hs
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 11:08:22 +0000
X-Inumbo-ID: 5a67ec78-2e19-11ea-88e7-bc764e2007e4
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a67ec78-2e19-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 11:08:21 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id a6so18216995plm.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 03:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RjWshgFpDWeH4uPvLjvHAZCaWHlJnMvPDCkd3Nam5oY=;
 b=IDEuHHt83a0gw4ybWdenLsuOcbAbioQuay6pB3pH2FGz8crNabc6lm7NFiX6ksgdaL
 Um1ULzICuyodYIanrAZCg9LTS4cl74M9fFsbqoMCDbCGRve/zl+OBXe52Iz0mjDbw0kD
 UlPBefZKkQ7WmFAZgVGbfOlEWE7Mi5mPtaWFx5DdXpvk5jfT96GMbr2s3UPxDP1bdpeq
 kUhE5EBHPg3+rHaWLANyww0VQC5wMjmxKCcnfxGtpKBpU/chDQLjPHinT7zm5FE1fCDl
 68rfZiyS3f26WFknhXXRcxPv3XA2SRPooNuD3tFUIP/P/Ki9NkzRztl6SMojMMMow5LQ
 CzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RjWshgFpDWeH4uPvLjvHAZCaWHlJnMvPDCkd3Nam5oY=;
 b=K2r/0YME9dnSYhJ/Xhc4LiqfnWlhTKBiBtugUQ2Tun2jAUhEFGZ1xk0IfjS79ty1Ol
 EtCn0gS8St7vZRyUO4c9MB++6S8It19cVi7xwW+m+li7kJJGNQrjh9yPbzA2i/7pGptB
 oZPHZRqOigK2CE2ivQyVOh97N4L+u6rTxriBSyVZHgIos84OzYAJkdGuhVLvHTXpJpg+
 ZypKPY0soMmriYdp4Ac8Cq7jDGWJAP0uXLKkJtPhroMYnKkSgnrVp9y2PikGLQjiwEHI
 LC9EPHHa2x9rd99OhCpczdGyvHAYweAPzdQT8qlYYnlwraOYKkgSy/WT/zVr4xShN57a
 7m0g==
X-Gm-Message-State: APjAAAWipQ/2TBSu7YAbRCixKKv27ZsOow0598LiFIpm7fzARcsMTWpW
 Ul99YN1/HHKrUwCqExMW/4QcFLcBfD0GH4vD3yU=
X-Google-Smtp-Source: APXvYqxDcbSSePbuGs2Usb988dpIhaaVBpYqddCYY5FqzR3FCjMv+4EJWmARsJagJjEggh5OSfjwzCkayvIabAb9uBU=
X-Received: by 2002:a17:902:be0c:: with SMTP id
 r12mr73894243pls.148.1578049700962; 
 Fri, 03 Jan 2020 03:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-7-liuwe@microsoft.com>
In-Reply-To: <20191229183341.14877-7-liuwe@microsoft.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Fri, 3 Jan 2020 11:08:10 +0000
Message-ID: <CACCGGhCBhNcb=gGABLGC7VKx9bs4Yz7rKFfpL6w93btLfEamMA@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH 6/8] x86/hyperv: provide percpu hypercall
 input page
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCAyOSBEZWMgMjAxOSBhdCAxODozNSwgV2VpIExpdSA8d2xAeGVuLm9yZz4gd3JvdGU6
Cj4KPiBIeXBlci1WJ3MgaW5wdXQgLyBvdXRwdXQgYXJndW1lbnQgbXVzdCBiZSA4IGJ5dGVzIGFs
aWduZWQgYW4gbm90IGNyb3NzCj4gcGFnZSBib3VuZGFyeS4gVGhlIGVhc2llc3Qgd2F5IHRvIHNh
dGlzZnkgdGhvc2UgcmVxdWlyZW1lbnRzIGlzIHRvIHVzZQo+IHBlcmNwdSBwYWdlLgo+Cj4gRm9y
IHRoZSBmb3Jlc2VlYWJsZSBmdXR1cmUgd2Ugb25seSBuZWVkIHRvIHByb3ZpZGUgaW5wdXQgZm9y
IFRMQgo+IGFuZCBBUElDIGh5cGVyY2FsbHMsIHNvIHNraXAgc2V0dGluZyB1cCBhbiBvdXRwdXQg
cGFnZS4KPgo+IFRoZSBwYWdlIHRyYWNraW5nIHN0cnVjdHVyZSBpcyBub3QgYm91bmQgdG8gaHlw
ZXJjYWxsIGJlY2F1c2UgaXQgaXMgYQo+IGNvbW1vbiBwYXR0ZXJuIGZvciBYZW4gdG8gd3JpdGUg
Z3Vlc3QgcGh5c2ljYWwgYWRkcmVzcyB0byBIeXBlci1WIHdoaWxlCj4gYXQgdGhlIHNhbWUgdGlt
ZSBhY2Nlc3NpbmcgdGhlIHBhZ2UgdmlhIGEgcG9pbnRlci4KPgo+IFdlIHdpbGwgYWxzbyBuZWVk
IHRvIHByb3ZpZGUgYW4gYXBfc2V0dXAgaG9vayBmb3Igc2Vjb25kYXJ5IGNwdXMgdG8KPiBzZXR1
cCBpdHMgb3duIGlucHV0IHBhZ2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBt
aWNyb3NvZnQuY29tPgoKUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgoK
PiAtLS0KPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyB8IDI2ICsrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2Lmgg
fCAgOCArKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIGIveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+IGluZGV4IDQzODkxMGM4Y2IuLjY3NjY3OTM2ZTkg
MTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiBAQCAtMjgsNiArMjgsNyBAQCBz
dHJ1Y3QgbXNfaHlwZXJ2X2luZm8gX19yZWFkX21vc3RseSBtc19oeXBlcnY7Cj4KPiAgdm9pZCAq
aHZfaHlwZXJjYWxsOwo+ICBzdGF0aWMgc3RydWN0IHBhZ2VfaW5mbyAqaHZfaHlwZXJjYWxsX3Bh
Z2U7Cj4gK0RFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHN0cnVjdCBoeXBlcnZfcGNwdV9wYWdl
LCBodl9wY3B1X2lucHV0X2FyZyk7Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29y
X29wcyBvcHM7Cj4gIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyAqX19pbml0IGh5cGVydl9w
cm9iZSh2b2lkKQo+IEBAIC05NiwxNCArOTcsMzkgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVw
X2h5cGVyY2FsbF9wYWdlKHZvaWQpCj4gICAgICB3cm1zcmwoSFZfWDY0X01TUl9IWVBFUkNBTEws
IGh5cGVyY2FsbF9tc3IuYXNfdWludDY0KTsKPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIHNldHVwX2h5
cGVyY2FsbF9wY3B1X2FyZyh2b2lkKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZzsK
PiArICAgIHZvaWQgKm1hcHBpbmc7Cj4gKyAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3Byb2Nl
c3Nvcl9pZCgpOwo+ICsKPiArICAgIHBnID0gYWxsb2NfZG9taGVhcF9wYWdlKE5VTEwsIDApOwo+
ICsgICAgaWYgKCAhcGcgKQo+ICsgICAgICAgIHBhbmljKCJGYWlsZWQgdG8gc2V0dXAgaHlwZXJj
YWxsIGlucHV0IHBhZ2UgZm9yICV1XG4iLCBjcHUpOwo+ICsKPiArICAgIG1hcHBpbmcgPSBfX21h
cF9kb21haW5fcGFnZV9nbG9iYWwocGcpOwo+ICsgICAgaWYgKCAhbWFwcGluZyApCj4gKyAgICAg
ICAgcGFuaWMoIkZhaWxlZCB0byBtYXAgaHlwZXJjYWxsIGlucHV0IHBhZ2UgZm9yICV1XG4iLCBj
cHUpOwo+ICsKPiArICAgIHRoaXNfY3B1KGh2X3BjcHVfaW5wdXRfYXJnKS5tYWRkciA9IHBhZ2Vf
dG9fbWFkZHIocGcpOwo+ICsgICAgdGhpc19jcHUoaHZfcGNwdV9pbnB1dF9hcmcpLm1hcHBpbmcg
PSBtYXBwaW5nOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXAodm9pZCkKPiAg
ewo+ICAgICAgc2V0dXBfaHlwZXJjYWxsX3BhZ2UoKTsKPiArICAgIHNldHVwX2h5cGVyY2FsbF9w
Y3B1X2FyZygpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBhcF9zZXR1cCh2b2lkKQo+ICt7Cj4g
KyAgICBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKTsKPiAgfQo+Cj4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzID0gewo+ICAgICAgLm5hbWUgPSAiSHlwZXItViIsCj4g
ICAgICAuc2V0dXAgPSBzZXR1cCwKPiArICAgIC5hcF9zZXR1cCA9IGFwX3NldHVwLAo+ICB9Owo+
Cj4gIC8qCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2Lmgg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCj4gaW5kZXggYzdhN2YzMmJkNS4u
ODNmMjk3NDY4ZiAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
di5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAo+IEBAIC01MSw2
ICs1MSw4IEBAIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgaHZfc2NhbGVfdHNjKHVpbnQ2NF90IHRz
YywgdWludDY0X3Qgc2NhbGUsCj4KPiAgI2lmZGVmIENPTkZJR19IWVBFUlZfR1VFU1QKPgo+ICsj
aW5jbHVkZSA8eGVuL3BlcmNwdS5oPgo+ICsKPiAgI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnZp
c29yLmg+Cj4KPiAgc3RydWN0IG1zX2h5cGVydl9pbmZvIHsKPiBAQCAtNjMsNiArNjUsMTIgQEAg
c3RydWN0IG1zX2h5cGVydl9pbmZvIHsKPiAgfTsKPiAgZXh0ZXJuIHN0cnVjdCBtc19oeXBlcnZf
aW5mbyBtc19oeXBlcnY7Cj4KPiArc3RydWN0IGh5cGVydl9wY3B1X3BhZ2Ugewo+ICsgICAgcGFk
ZHJfdCBtYWRkcjsKPiArICAgIHZvaWQgKm1hcHBpbmc7Cj4gK307Cj4gK0RFQ0xBUkVfUEVSX0NQ
VShzdHJ1Y3QgaHlwZXJ2X3BjcHVfcGFnZSwgaHZfcGNwdV9pbnB1dF9hcmcpOwo+ICsKPiAgY29u
c3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpoeXBlcnZfcHJvYmUodm9pZCk7Cj4KPiAgI2Vsc2UK
PiAtLQo+IDIuMjAuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
