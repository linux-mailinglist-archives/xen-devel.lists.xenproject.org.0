Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D00012CB4B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 00:01:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilhWT-00045I-G1; Sun, 29 Dec 2019 22:58:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F+c7=2T=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ilhWR-000457-Qm
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 22:58:55 +0000
X-Inumbo-ID: c98a9044-2a8e-11ea-9fd1-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c98a9044-2a8e-11ea-9fd1-12813bfff9fa;
 Sun, 29 Dec 2019 22:58:54 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z3so31301166wru.3
 for <xen-devel@lists.xenproject.org>; Sun, 29 Dec 2019 14:58:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=czV6lnY6spCYi4Qr8UEJqKqIrNz90w4ORGcCgv5kfwA=;
 b=UjMvICRKZBWN/hRo1bppHfOAuPo3SO+v7s+8uQPq06NdA8wGj/l3iIStZ01BvHN//j
 zMdlLU9LyT6ijs33PtDgASECWsLIzIuNW4V7+ifUSKJ/iZfBq8XvOMBXnFyfqdsVPovK
 ohbnjIigS05s7O/ISvNuEgpS394Siq0/QsrYwNuASTZ1dfNG8DFG8pwP/YwCWDhVlL6J
 7IgFQExApH82fou+EWv+5PTicjIxIACjB80EBMa6W/s3y+FcsIfodnriEBFJOssPsppz
 KUk5B3ZtDLqZy4R/6EJkVvrKQeLUNaX3jfQtfULU19SQf5osMaBxSTWiH/6MtAV0EWzi
 mwww==
X-Gm-Message-State: APjAAAX0UMhZVeDtDSGqREyfGMrxiTxGcDK98yz1BTc/phnFthu9YuoV
 1MzOIdOi+gDGk/5Rfl57x0c=
X-Google-Smtp-Source: APXvYqzepe9STCUOyhmljRrB7Ayh2ZI6bQcIEx9BTbZ8DnrpPw4Q/9SAps5LopJC007s2sQH9TAvYw==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr2109106wrv.250.1577660334032; 
 Sun, 29 Dec 2019 14:58:54 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id c5sm18961127wmb.9.2019.12.29.14.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 14:58:53 -0800 (PST)
Date: Sun, 29 Dec 2019 22:58:52 +0000
From: Wei Liu <wl@xen.org>
To: Michael Kelley <mikelley@microsoft.com>
Message-ID: <20191229225852.a4fg4xz54efgbcbp@debian>
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-9-liuwe@microsoft.com>
 <CY4PR21MB062915A4247CE89C7947DD68D7240@CY4PR21MB0629.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR21MB062915A4247CE89C7947DD68D7240@CY4PR21MB0629.namprd21.prod.outlook.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 8/8] x86/hyperv: setup VP assist page
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBEZWMgMjksIDIwMTkgYXQgMDc6NTk6NDhQTSArMDAwMCwgTWljaGFlbCBLZWxsZXkg
d3JvdGU6Cj4gRnJvbTogV2VpIExpdSA8d2VpLmxpdS54ZW5AZ21haWwuY29tPiBPbiBCZWhhbGYg
T2YgV2VpIExpdSAgU2VudDogU3VuZGF5LCBEZWNlbWJlciAyOSwgMjAxOSAxMDozNCBBTQo+ID4g
Cj4gPiBWUCBhc3Npc3QgcGFnZSBpcyByYXRoZXIgaW1wb3J0YW50IGFzIHdlIG5lZWQgdG8gdG9n
Z2xlIHNvbWUgYml0cyBpbgo+ID4gdGhhdCBwYWdlIHN1Y2ggdGhhdCBMMSBndWVzdCBjYW4gbWFr
ZSBoeXBlcmNhbGxzIGRpcmVjdGx5IHRvIEwwIEh5cGVyLVYuCj4gPiAKPiA+IFByZWVtcHRpdmVs
eSBzcGxpdCBvdXQgc2V0X3ZwX2Fzc2lzdCBwYWdlIHdoaWNoIHdpbGwgYmUgdXNlZCBpbiB0aGUg
cmVzdW1lCj4gPiBwYXRoLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBt
aWNyb3NvZnQuY29tPgo+ID4gLS0tCj4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBl
cnYuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIHhlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggfCAgMSArCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBp
bnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L2h5cGVydi5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ID4gaW5k
ZXggZGEzYThjZDg1ZC4uYTg4YjlhZTZkOSAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYv
aHlwZXJ2LmMKPiA+IEBAIC0zMCw2ICszMCw3IEBAIHZvaWQgKmh2X2h5cGVyY2FsbDsKPiA+ICBz
dGF0aWMgc3RydWN0IHBhZ2VfaW5mbyAqaHZfaHlwZXJjYWxsX3BhZ2U7Cj4gPiAgREVGSU5FX1BF
Ul9DUFVfUkVBRF9NT1NUTFkoc3RydWN0IGh5cGVydl9wY3B1X3BhZ2UsIGh2X3BjcHVfaW5wdXRf
YXJnKTsKPiA+ICBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh1bnNpZ25lZCBpbnQsIGh2X3Zw
X2luZGV4KTsKPiA+ICtERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWShzdHJ1Y3QgaHlwZXJ2X3Bj
cHVfcGFnZSwgaHZfdnBfYXNzaXN0KTsKPiA+IAo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlw
ZXJ2aXNvcl9vcHMgb3BzOwo+ID4gIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyAqX19pbml0
IGh5cGVydl9wcm9iZSh2b2lkKQo+ID4gQEAgLTEyNSwxNyArMTI2LDUxIEBAIHN0YXRpYyB2b2lk
IHNldHVwX3ZwX2luZGV4KHZvaWQpCj4gPiAgICAgIHRoaXNfY3B1KGh2X3ZwX2luZGV4KSA9IHZw
X2luZGV4X21zcjsKPiA+ICB9Cj4gPiAKPiA+ICtzdGF0aWMgdm9pZCBzZXRfdnBfYXNzaXN0KHZv
aWQpCj4gPiArewo+ID4gKyAgICB1aW50NjRfdCB2YWwgPSBwYWRkcl90b19wZm4odGhpc19jcHUo
aHZfdnBfYXNzaXN0KS5tYWRkcik7Cj4gPiArCj4gPiArICAgIHZhbCA9ICh2YWwgPDwgSFZfWDY0
X01TUl9WUF9BU1NJU1RfUEFHRV9BRERSRVNTX1NISUZUKSB8IAo+IAo+IEknZCByZWNvbW1lbmQg
dXNpbmcgSFZfSFlQX1BBR0VfU0hJRlQgaW5zdGVhZCBvZgo+IEhWX1g2NF9NU1JfVlBfQVNTSVNU
X1BBR0VfQUREUkVTU19TSElGVC4gIE9uIHRoZSBMaW51eCBzaWRlLAo+IEknbSBwbGFubmluZyB0
byByZW1vdmUgdGhhdCAjZGVmaW5lIGFuZCB0aGUgc2ltaWxhcgo+ICpfUEFHRV9BRERSRVNTX01B
U0sgaW4gZmF2b3Igb2YgdGhlIG5ld2VyIEhWX0hZUF9QQUdFXyogdmFsdWVzLgo+IFRoZXJlJ3Mg
bm90aGluZyBzcGVjaWFsIGFib3V0IHRoZSBWUCBhc3Npc3QgcGFnZSwgc28gdXNpbmcgdGhlIGdl
bmVyaWMKPiAjZGVmaW5lcyBiYXNlZCBvbiB0aGUgSHlwZXItViBwYWdlIHNpemUgaXMgcmVhc29u
YWJsZS4KCkFjay4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
