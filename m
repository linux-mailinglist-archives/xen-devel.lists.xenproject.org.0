Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A53E12FAFD
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:58:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inQEQ-0002Td-Q2; Fri, 03 Jan 2020 16:55:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inQEP-0002TY-Ov
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:55:25 +0000
X-Inumbo-ID: d11e7938-2e49-11ea-88e7-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d11e7938-2e49-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 16:55:16 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so9178189wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 08:55:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oeH/TyWnMzoOiaASb1ZbRt447SMpgOPuiV7GixyqVdk=;
 b=O5afS8fAZslb7UQSzuyIoZCPMy6vPTfr4bYEc/hNoNWP250TLTBmqUmtTy2iO/xVJp
 vzLgiJLcMDQOEpUTcemBYus9XKihs5al4xQm+vlW+yp2jCR7vZQoeHD/g0T92RWfPSQK
 KBLxABAwZm/Sdrbr6dmorbl2AaM4poZbVcFgF80AqfdMcSyNeS3l5LwMZvTSyB9cbljv
 YT+gEt+lQnwD1GSllLyok7W76P+Lb9xxmLuDr61gsda9hIv2QNhcBUWn4zI9w5pSN/Kv
 EalG58E/x0A5THnsRxRTLI1mSnkgegFKd6yfrZWjF7vlzWE8gfuxWDvySWSp1ETSHH7i
 ZLpA==
X-Gm-Message-State: APjAAAUadJY8kT8OapR+ZpumVRguImySdLf1GeotU68HChzbH+7qPq9r
 cS6oVgb/6FAg/GqHA64Q30s=
X-Google-Smtp-Source: APXvYqzeFrq5Ee3c/lB4u2Mn4lSXRqhuDYQVw3hG1CYzMsFRxtDLw9e1pNaGH1qMgpOvzPNPd7eOeQ==
X-Received: by 2002:a1c:9e4c:: with SMTP id h73mr20234407wme.177.1578070516140; 
 Fri, 03 Jan 2020 08:55:16 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id t81sm12958719wmg.6.2020.01.03.08.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 08:55:15 -0800 (PST)
Date: Fri, 3 Jan 2020 16:55:13 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200103165513.wlgihc4kfqducwtm@debian>
References: <20200103160825.19377-1-liuwe@microsoft.com>
 <20200103160825.19377-7-liuwe@microsoft.com>
 <ec797a21-8b06-6eb1-84a8-7e059c430e7a@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec797a21-8b06-6eb1-84a8-7e059c430e7a@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 6/8] x86/hyperv: provide percpu hypercall
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDQ6MzA6NDlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwMy8wMS8yMDIwIDE2OjA4LCBXZWkgTGl1IHdyb3RlOgo+ID4gQEAgLTgzLDE0
ICs4NCwzOSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkK
PiA+ICAgICAgd3Jtc3JsKEhWX1g2NF9NU1JfSFlQRVJDQUxMLCBoeXBlcmNhbGxfbXNyLmFzX3Vp
bnQ2NCk7Cj4gPiAgfQo+ID4gIAo+ID4gK3N0YXRpYyB2b2lkIHNldHVwX2h5cGVyY2FsbF9wY3B1
X2FyZyh2b2lkKQo+ID4gK3sKPiA+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7Cj4gPiArICAg
IHZvaWQgKm1hcHBpbmc7Cj4gPiArICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29y
X2lkKCk7Cj4gPiArCj4gPiArICAgIHBnID0gYWxsb2NfZG9taGVhcF9wYWdlKE5VTEwsIDApOwo+
ID4gKyAgICBpZiAoICFwZyApCj4gPiArICAgICAgICBwYW5pYygiRmFpbGVkIHRvIHNldHVwIGh5
cGVyY2FsbCBpbnB1dCBwYWdlIGZvciAldVxuIiwgY3B1KTsKPiA+ICsKPiA+ICsgICAgbWFwcGlu
ZyA9IF9fbWFwX2RvbWFpbl9wYWdlX2dsb2JhbChwZyk7Cj4gPiArICAgIGlmICggIW1hcHBpbmcg
KQo+ID4gKyAgICAgICAgcGFuaWMoIkZhaWxlZCB0byBtYXAgaHlwZXJjYWxsIGlucHV0IHBhZ2Ug
Zm9yICV1XG4iLCBjcHUpOwo+IAo+IFNvcnJ5IEkgZGlkbid0IHNwb3QgdGhpcyBiZWZvcmUsIGJ1
dCBhbiBhbHdheXMtbWFwcGVkIGRvbWhlYXAgcGFnZSBpcwo+IGp1c3QgYWxsb2NfeGVuaGVhcF9w
YWdlKCkgKGdpdmUgb3IgdGFrZSBOVU1BIHBvc2l0aW9uaW5nIGFib3ZlIHRoZSA1VAo+IGJvdW5k
YXJ5LCB3aGljaCBpc24ndCB1c2VkIGhlcmUpLgoKSSBoYWQgdGhlICh3cm9uZykgaW1wcmVzc2lv
biB0aGF0IHVzaW5nIGRvbWhlYXAgd2FzIHByZWZlcnJlZC4KCkknbSBmaW5lIHdpdGggc3dpdGNo
aW5nIHRvIHhlbmhlYXAsIG9mIGNvdXJzZS4KCldlaS4KCgoKPiAKPiB+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
