Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16263128199
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 18:45:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiMJB-0001LM-MC; Fri, 20 Dec 2019 17:43:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YXk5=2K=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iiMJA-0001LH-SR
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 17:43:24 +0000
X-Inumbo-ID: 33980e9e-2350-11ea-a914-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33980e9e-2350-11ea-a914-bc764e2007e4;
 Fri, 20 Dec 2019 17:43:16 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y11so10215329wrt.6
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 09:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IoiCkvIdBdufa2NbdYe/mvatdZbiUKlN/YZ/ZX402gA=;
 b=DhxAmqqinvbYfg3fI01hlCi2/w5Mmf3iiJ6OVYOQBQRdZpmkXgFVOUDJ7o4jssjweT
 2gUtw7di81/ae9ZpGQmTrZOe+XZ9rhEtILr4ByAokvhxAvrdRHpGxKeQj7naeOmJFG2z
 CdLfzWHGuo9/KA5Cbq0PWAycGJYAVYj3eVbINMvhvjcRgmpf9UjpGXlnldfaNV/Amraz
 FuZbYA7Y/ha6KQa+Qcmdzl9QPQqMUbTl6kI19fgUa/2o4lUfEcwunuTzuc4BXE6rF95e
 QSvqe/4ZkwjQmJuTXRM+RpBbx63TS23IXyUXWkbuNAJaqPhlBsm9NppbHycAwH1lKHY3
 xNhA==
X-Gm-Message-State: APjAAAWJPjCAmL0oPvFuYpIbf1Qyi55DqtYfmFtRzz9QsdrUnAf4mGQp
 114Qg9IsZ10TWgpMlzgD/zY=
X-Google-Smtp-Source: APXvYqxBO/Txqobux/kHZJCvfvI10nZh7XLOrr1/oYaej2bKCaNp3/Uuf39BiiNhgiy9EUNnemVrPA==
X-Received: by 2002:adf:f504:: with SMTP id q4mr15082351wro.299.1576863795461; 
 Fri, 20 Dec 2019 09:43:15 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id o15sm10801055wra.83.2019.12.20.09.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 09:43:15 -0800 (PST)
Date: Fri, 20 Dec 2019 17:43:13 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191220174313.dbfdkngqfb2hpozq@debian>
References: <20191218144233.15372-1-liuwe@microsoft.com>
 <20191218144233.15372-7-liuwe@microsoft.com>
 <6cb667f8-0ace-75f5-e0b0-c35f8900952d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6cb667f8-0ace-75f5-e0b0-c35f8900952d@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 6/6] x86: implement Hyper-V clock source
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjAsIDIwMTkgYXQgMDU6MDU6MjRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTguMTIuMjAxOSAxNTo0MiwgV2VpIExpdSB3cm90ZToKPiA+IC0tLSBhL3hlbi9h
cmNoL3g4Ni90aW1lLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni90aW1lLmMKPiA+IEBAIC0zMSw2
ICszMSw3IEBACj4gPiAgI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KPiA+ICAjaW5jbHVkZSA8
YXNtL2ZpeG1hcC5oPgo+ID4gICNpbmNsdWRlIDxhc20vZ3Vlc3QuaD4KPiA+ICsjaW5jbHVkZSA8
YXNtL2d1ZXN0L2h5cGVydi10bGZzLmg+Cj4gCj4gQ2FuIHRoaXMgcGxlYXNlIG1vdmUgLi4uCj4g
Cj4gPiBAQCAtNjQ0LDYgKzY0NSwxMDMgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV90aW1lc291
cmNlIF9faW5pdGRhdGEgcGx0X3hlbl90aW1lciA9Cj4gPiAgfTsKPiA+ICAjZW5kaWYKPiA+ICAK
PiA+ICsjaWZkZWYgQ09ORklHX0hZUEVSVl9HVUVTVAo+IAo+IC4uLiBoZXJlLCB0byBhdm9pZCB0
aGUgZGVwZW5kZW5jeSBvbiB0aGUgaGVhZGVyIHdoZW4gdGhlIG9wdGlvbiBpcwo+IG9mZj8KPiAK
PiA+ICsvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqCj4gPiArICogSFlQRVItViBSRUZFUkVOQ0UgVFNDCj4gPiArICovCj4gPiArCj4g
PiArc3RhdGljIHN0cnVjdCBtc19oeXBlcnZfdHNjX3BhZ2UgKmh5cGVydl90c2M7Cj4gPiArc3Rh
dGljIHN0cnVjdCBwYWdlX2luZm8gKmh5cGVydl90c2NfcGFnZTsKPiA+ICsKPiA+ICtzdGF0aWMg
aW50NjRfdCBfX2luaXQgaW5pdF9oeXBlcnZfdGltZXIoc3RydWN0IHBsYXRmb3JtX3RpbWVzb3Vy
Y2UgKnB0cykKPiA+ICt7Cj4gPiArICAgIHBhZGRyX3QgbWFkZHI7Cj4gPiArICAgIHVpbnQ2NF90
IHRzY19tc3IsIGZyZXE7Cj4gPiArCj4gPiArICAgIGlmICggIShtc19oeXBlcnYuZmVhdHVyZXMg
JiBIVl9NU1JfUkVGRVJFTkNFX1RTQ19BVkFJTEFCTEUpICkKPiA+ICsgICAgICAgIHJldHVybiAw
Owo+ID4gKwo+ID4gKyAgICBoeXBlcnZfdHNjX3BhZ2UgPSBhbGxvY19kb21oZWFwX3BhZ2UoTlVM
TCwgMCk7Cj4gPiArICAgIGlmICggIWh5cGVydl90c2NfcGFnZSApCj4gPiArICAgICAgICByZXR1
cm4gMDsKPiA+ICsKPiA+ICsgICAgaHlwZXJ2X3RzYyA9IF9fbWFwX2RvbWFpbl9wYWdlX2dsb2Jh
bChoeXBlcnZfdHNjX3BhZ2UpOwo+ID4gKyAgICBpZiAoICFoeXBlcnZfdHNjICkKPiA+ICsgICAg
ewo+ID4gKyAgICAgICAgZnJlZV9kb21oZWFwX3BhZ2UoaHlwZXJ2X3RzY19wYWdlKTsKPiA+ICsg
ICAgICAgIGh5cGVydl90c2NfcGFnZSA9IE5VTEw7Cj4gPiArICAgICAgICByZXR1cm4gMDsKPiA+
ICsgICAgfQo+ID4gKwo+ID4gKyAgICBtYWRkciA9IHBhZ2VfdG9fbWFkZHIoaHlwZXJ2X3RzY19w
YWdlKTsKPiA+ICsKPiA+ICsgICAgLyoKPiA+ICsgICAgICogUGVyIEh5cGVyLVYgVExGUzoKPiA+
ICsgICAgICogICAxLiBSZWFkIGV4aXN0aW5nIE1TUiB2YWx1ZQo+ID4gKyAgICAgKiAgIDIuIFBy
ZXNlcnZlIGJpdHMgWzExOjFdCj4gPiArICAgICAqICAgMy4gU2V0IGJpdHMgWzYzOjEyXSB0byBi
ZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIG9mIHRzYyBwYWdlCj4gPiArICAgICAqICAgNC4gU2V0
IGVuYWJsZWQgYml0ICgwKQo+ID4gKyAgICAgKiAgIDUuIFdyaXRlIGJhY2sgbmV3IE1TUiB2YWx1
ZQo+ID4gKyAgICAgKi8KPiA+ICsgICAgcmRtc3JsKEhWX1g2NF9NU1JfUkVGRVJFTkNFX1RTQywg
dHNjX21zcik7Cj4gPiArICAgIHRzY19tc3IgJj0gMHhmZmVVTEw7Cj4gCj4gVGhlcmUncyBubyBy
ZWFsIG5lZWQgZm9yIHRoZSBVTEwgc3VmZml4Lgo+IAo+ID4gKyAgICB0c2NfbXNyIHw9ICBtYWRk
ciB8IDEgLyogZW5hYmxlZCAqLzsKPiAKPiBTdHJheSBkb3VibGUgYmxhbmsgYWZ0ZXIgfD0gPwo+
IAo+ID4gKyAgICB3cm1zcmwoSFZfWDY0X01TUl9SRUZFUkVOQ0VfVFNDLCB0c2NfbXNyKTsKPiA+
ICsKPiA+ICsgICAgLyogR2V0IFRTQyBmcmVxdWVuY3kgZnJvbSBIeXBlci1WICovCj4gPiArICAg
IHJkbXNybChIVl9YNjRfTVNSX1RTQ19GUkVRVUVOQ1ksIGZyZXEpOwo+ID4gKyAgICBwdHMtPmZy
ZXF1ZW5jeSA9IGZyZXE7Cj4gPiArCj4gPiArICAgIHJldHVybiBmcmVxOwo+ID4gK30KPiA+ICsK
PiA+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IHJlYWRfaHlwZXJ2X3RpbWVyKHZvaWQpCj4gPiAr
ewo+ID4gKyAgICB1aW50NjRfdCBzY2FsZSwgb2Zmc2V0LCByZXQsIHRzYzsKPiA+ICsgICAgdWlu
dDMyX3Qgc2VxOwo+ID4gKyAgICBjb25zdCBzdHJ1Y3QgbXNfaHlwZXJ2X3RzY19wYWdlICp0c2Nf
cGFnZSA9IGh5cGVydl90c2M7Cj4gPiArCj4gPiArICAgIGRvIHsKPiA+ICsgICAgICAgIHNlcSA9
IHRzY19wYWdlLT50c2Nfc2VxdWVuY2U7Cj4gPiArCj4gPiArICAgICAgICAvKiBTZXEgMCBpcyBz
cGVjaWFsLiBJdCBtZWFucyB0aGUgVFNDIGVubGlnaHRlbm1lbnQgaXMgbm90Cj4gPiArICAgICAg
ICAgKiBhdmFpbGFibGUgYXQgdGhlIG1vbWVudC4gVGhlIHJlZmVyZW5jZSB0aW1lIGNhbiBvbmx5
IGJlCj4gPiArICAgICAgICAgKiBvYnRhaW5lZCBmcm9tIHRoZSBSZWZlcmVuY2UgQ291bnRlciBN
U1IuCj4gPiArICAgICAgICAgKi8KPiA+ICsgICAgICAgIGlmICggc2VxID09IDAgKQo+ID4gKyAg
ICAgICAgewo+ID4gKyAgICAgICAgICAgIHJkbXNybChIVl9YNjRfTVNSX1RJTUVfUkVGX0NPVU5U
LCByZXQpOwo+ID4gKyAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArICAgICAgICB9Cj4gPiAr
Cj4gPiArICAgICAgICAvKiByZHRzY19vcmRlcmVkIGFscmVhZHkgY29udGFpbnMgYSBsb2FkIGZl
bmNlICovCj4gPiArICAgICAgICB0c2MgPSByZHRzY19vcmRlcmVkKCk7Cj4gPiArICAgICAgICBz
Y2FsZSA9IHRzY19wYWdlLT50c2Nfc2NhbGU7Cj4gPiArICAgICAgICBvZmZzZXQgPSB0c2NfcGFn
ZS0+dHNjX29mZnNldDsKPiA+ICsKPiA+ICsgICAgICAgIHNtcF9ybWIoKTsKPiA+ICsKPiA+ICsg
ICAgfSB3aGlsZSAodHNjX3BhZ2UtPnRzY19zZXF1ZW5jZSAhPSBzZXEpOwo+ID4gKwo+ID4gKyAg
ICAvKiByZXQgPSAoKHRzYyAqIHNjYWxlKSA+PiA2NCkgKyBvZmZzZXQ7ICovCj4gPiArICAgIGFz
bSAoICJtdWwgJVtzY2FsZV07IGFkZCAlW29mZnNldF0sICVbcmV0XSIKPiA+ICsgICAgICAgICAg
OiAiK2EiICh0c2MpLCBbcmV0XSAiPWQiIChyZXQpCj4gCj4gVGhpcyBuZWVkcyB0byBiZSAiPSZk
Iiwgb3IgZWxzZSAlcmR4IG1heSBiZSB1c2VkIHRvIGFkZHJlc3MKPiAlW29mZnNldF0gKHdoZW4g
aW4gbWVtb3J5KS4KPiAKPiBXaXRoIHRoZXNlIHRha2VuIGNhcmUgb2YKPiBSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAoKVGhhbmtzLiBJIGhhdmUgYWRkcmVz
c2VkIHlvdXJzLCBBbmRyZXcncyBhbmQgUGF1bCdzIGNvbW1lbnQgKGNoZWNraW5nCkhWX1g2NF9B
Q0NFU1NfRlJFUVVFTkNZX01TUlMpIGFuZCB3aWxsIHB1c2ggcGF0Y2hlcyB0aGF0IGFyZSBuZWVk
ZWQgZm9yCnRoaXMgY2xvY2sgc291cmNlIHRvIHdvcmsgKHBhdGNoIDEsIDUgYW5kIDYpLgoKUGF0
Y2hlcyBmb3IgY2xlYW5pbmcgdXAgdmlyaWRpYW4gY29kZSAoMi00KSB3aWxsIGJlIHBvc3RlZCBz
ZXBhcmF0ZWx5CndpdGggUGF1bCdzIGNvbW1lbnRzIGFkZHJlc3NlZC4KCldlaS4KCj4gSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
