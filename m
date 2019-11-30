Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 322A510DD7D
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2019 12:55:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ib1FO-0003fi-5X; Sat, 30 Nov 2019 11:49:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rqrT=ZW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ib1FM-0003fR-OM
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2019 11:49:08 +0000
X-Inumbo-ID: 6a6acd74-1367-11ea-a3f1-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a6acd74-1367-11ea-a3f1-12813bfff9fa;
 Sat, 30 Nov 2019 11:49:08 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so11812543wma.1
 for <xen-devel@lists.xenproject.org>; Sat, 30 Nov 2019 03:49:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+hQKCXVIEjTEiuzjPtBVn9I9853ZK8yU7+JEbXu9YwE=;
 b=DTwy8KaCZ+5c3Yh4Xi+fkRup602MGlOBIwEtJc1rcGGFLQYJT+nqg2TnGooKy3NSaa
 A4G98UbftzQdVRi+Qo6oKyrveLCMj/yuRfkWeyFYlQvz4vplABWPvv64Fz+VBdnt58sT
 nL5do3hwJtxP6L0G8zYouuPdl8XKGd7VSH0NgpQiMAYhrPdrRvUwhKPk7/zwgQ4WyGex
 /LsScmDjKdnxq0N1+24GIzNiwAakqt62X6YezDwCHLZ9QM/JxMbXL5EnP38hAL3e5gt5
 hGaPYnER3qWibzQr03oR0C0tKWa5YIMyCI4633PNOZlsorfyOH899BlWm29KcaPA9NRX
 gH9w==
X-Gm-Message-State: APjAAAW6q5P0y9WRdyAHKzbgIvx3umrqc+AaMbVxS39NyZ3HZhiO61IV
 DGmuk7qA8YKOm5uE+/u3gq0=
X-Google-Smtp-Source: APXvYqydDrGPehJnsqa6Ma3OJ9/8Lk1A9AH48lcfA4ztrujzyCKQtPj0X2jAOBk+cDus64HenD8dXQ==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr18790022wmi.66.1575114547279; 
 Sat, 30 Nov 2019 03:49:07 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id 189sm16732057wmc.7.2019.11.30.03.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 03:49:06 -0800 (PST)
Date: Sat, 30 Nov 2019 11:49:04 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191130114904.uh5gonv3v72acsl5@debian>
References: <20191121185049.16666-1-liuwe@microsoft.com>
 <20191121185049.16666-7-liuwe@microsoft.com>
 <adb846a4-1adc-b02d-6924-0ffb23da2832@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adb846a4-1adc-b02d-6924-0ffb23da2832@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 6/8] x86: switch xen guest implementation
 to use hypervisor framework
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDI6NTA6MThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMTEuMjAxOSAxOTo1MCwgV2VpIExpdSB3cm90ZToKPiA+ICt2b2lkIF9faW5p
dCBoeXBlcnZpc29yX3NldHVwKHZvaWQpCj4gPiArewo+ID4gKyAgICBpZiAoIGhvcHMgJiYgaG9w
cy0+c2V0dXAgKQo+ID4gKyAgICAgICAgaG9wcy0+c2V0dXAoKTsKPiA+ICt9Cj4gPiArCj4gPiAr
dm9pZCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpCj4gPiArewo+ID4gKyAgICBpZiAoIGhvcHMg
JiYgaG9wcy0+YXBfc2V0dXAgKQo+ID4gKyAgICAgICAgaG9wcy0+YXBfc2V0dXAoKTsKPiA+ICt9
Cj4gPiArCj4gPiArdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKQo+ID4gK3sKPiA+ICsgICAg
aWYgKCBob3BzICYmIGhvcHMtPnJlc3VtZSApCj4gPiArICAgICAgICBob3BzLT5yZXN1bWUoKTsK
PiA+ICt9Cj4gCj4gSSBhc3N1bWUgdGhlc2UgZG9uJ3QgZ2V0IGV4ZWN1dGVkIGZyZXF1ZW50bHkg
ZW5vdWdoIGZvcgo+IGFsdGVybmF0aXZlcyBpbmRpcmVjdCBjYWxsIHBhdGNoaW5nIHRvIG1hdHRl
cj8gRG93biB0aGUgcm9hZCwgaWYKPiBhbnkgbW9yZSBmcmVxdWVudGx5IGV4ZWN1dGVkIGhvb2tz
IHNob3VsZCBhcHBlYXIsIHdlIHdpbGwgd2FudAo+IHRvIHN3aXRjaCB0byB0aGF0IG1vZGVsIHRo
b3VnaC4gVGhpcyBoYXMgdGhlIGFkZGVkIGJlbmVmaXQgb2YKPiB0aGVyZSB0aGVuIGJlaW5nIG9u
bHkgb25lIHJ1bnRpbWUgaW5zdGFuY2Ugb2Ygc3RydWN0Cj4gaHlwZXJ2aXNvcl9vcHM7IGFsbCBw
ZXItaHlwZXJ2aXNvciBvbmVzIHdvdWxkIGJlY29tZQo+IF9faW5pdGNvbnN0cmVsLgo+IAoKQWxs
IHRoZSByb3V0aW5lcyBsaXN0ZWQgaGVyZSBhcmUgcnVuIHZlcnkgaW5mcmVxdWVudGx5LgoKSSBh
Z3JlZSB0aGF0IHdoZW4gbW9yZSBmcmVxdWVudGx5IGV4ZWN1dGVkIGhvb2tzIGFwcGVhciB3ZSB3
aWxsIHdhbnQgdG8KbG9vayBpbnRvIGFsdGVybmF0aXZlcy4KCj4gPiBAQCAtMzI2LDYgKzMxMCwz
MSBAQCB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpCj4gPiAgICAgICAgICBwdl9jb25zb2xl
X2luaXQoKTsKPiA+ICB9Cj4gPiAgCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29y
X29wcyB4Z19vcHMgPSB7Cj4gCj4gV2l0aCB0aGlzIG5ldyB4Z18gcHJlZml4LCAuLi4KPiAKPiA+
ICsgICAgLm5hbWUgPSAiWGVuIiwKPiA+ICsgICAgLnNldHVwID0geGVuX3NldHVwLAo+ID4gKyAg
ICAuYXBfc2V0dXAgPSB4ZW5fYXBfc2V0dXAsCj4gPiArICAgIC5yZXN1bWUgPSB4ZW5fcmVzdW1l
LAo+IAo+IC4uLiBJJ2QgbGlrZSB0byBzdWdnZXN0IHRvIHVzZSBpdCBmb3IgdGhlc2Ugb25lcyB0
b28gKGlmIHRoZXkKPiBuZWVkIHRvIGhhdmUgYSBwcmVmaXggaW4gdGhlIGZpcnN0IHBsYWNlLCB3
aGljaCBJIGRvdWJ0LCBidXQKPiB3aGljaCBJIGtub3cgb3RoZXJzIHZpZXcgZGlmZmVyZW50bHkp
Lgo+IAoKU2luY2UgdGhleSBhcmUgb25seSB2aXNpYmxlIHRvIHRoaXMgZmlsZSBJIHRoaW5rIG5v
dCBoYXZpbmcgYSBwcmVmaXgKc2hvdWxkIGJlIGZpbmUuIAoKPiA+ICtjb25zdCBzdHJ1Y3QgaHlw
ZXJ2aXNvcl9vcHMgKiBfX2luaXQgeGVuX3Byb2JlKHZvaWQpCj4gCj4gRm9yIHRoaXMgb25lIHRo
ZSBjYWxsIGlzIGEgbGl0dGxlIG1vcmUgZGlmZmljdWx0LCBidXQgZm9yCj4gY29uc2lzdGVuY3kg
SSB0aGluayB4Z18gd291bGQgYmUgc2xpZ2h0bHkgYmV0dGVyIGhlcmUgYXMgd2VsbC4KCk5vIHBy
b2JsZW0uIENoYW5nZWQgaXQgdG8geGdfcHJvYmUuCgo+IAo+IE5pdDogU3RyaWN0bHkgc3BlYWtp
bmcgdGhlcmUncyBhIHN0cmF5IGJsYW5rIGFmdGVyICouIFdlCj4gbm9ybWFsbHkgaGF2ZSBvbmVz
IG9ubHkgYWhlYWQgb2YgKiwgYnV0IG5vdCBhZnRlci4KCkZpeGVkLgoKV2VpLgoKPiAKPiBKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
