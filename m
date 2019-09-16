Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B3B3759
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 11:43:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9nUQ-0004Wn-V8; Mon, 16 Sep 2019 09:40:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bDyh=XL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1i9nUO-0004WW-PR
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 09:40:08 +0000
X-Inumbo-ID: f769a1a6-d865-11e9-95d9-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f769a1a6-d865-11e9-95d9-12813bfff9fa;
 Mon, 16 Sep 2019 09:40:07 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a11so28339574wrx.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 02:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lKdqGBxAFFzyWrqplpuRA1Wm8GkVy37lnrttqD/HSoY=;
 b=LBUdypYYxuICLR1M25Xb68NAmZQFJwG9SUKs6vAOn70WDtqNto5E19Vi0mKIgBSofi
 fOwGDbOAypQBJD71j3DfXBabyvVis6sfdzEa0kIGRjszvMtzCkpa3jl83T3bqP+phG8Y
 8lb/Nr6BGbealS4N/nXxIyFA5U8mNoHWKgoKzsqLLICydq7FYhQvBUw2wFRpPe+mnRN7
 Po2cLtUwstlc+Omoaw7uhnJ4+zNXsNLShzJ9fV/7kak963P0BKRCfne48BKeSKwY1Q/j
 yjHj1ZP61iRk8trhSzIIknjgOdXWd1i+tTb6A4j32Eb3KpIy7kVSNuwISnW3aUJH/uCk
 eJhQ==
X-Gm-Message-State: APjAAAUtsw3l4jF1oRt/ikKJYCSKxoQp4Z6DO4XFqYtcxIMc9QW8QkOm
 f1GUUezAYHcBy3GeH9xtcW4=
X-Google-Smtp-Source: APXvYqwWp2cjLVtRN6dS1lmnm/SB97OfTLpPq0ZTqHqyR/YPexXR7PDehbSqCjTVoW15F0Vfwy3hGA==
X-Received: by 2002:adf:a350:: with SMTP id d16mr47328342wrb.326.1568626806224; 
 Mon, 16 Sep 2019 02:40:06 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id c6sm10445096wrm.71.2019.09.16.02.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 02:40:05 -0700 (PDT)
Date: Mon, 16 Sep 2019 09:40:03 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190916094003.zbeewyh3wjjytmpa@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190913094741.31451-1-paul.durrant@citrix.com>
 <20190913094741.31451-4-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913094741.31451-4-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v10 3/6] sysctl / libxl: report whether
 IOMMU/HAP page table sharing is supported
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTA6NDc6MzhBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggZGVmaW5lcyBhIG5ldyBiaXQgcmVwb3J0ZWQgaW4gdGhlIGh3X2Nh
cCBmaWVsZCBvZiBzdHJ1Y3QKPiB4ZW5fc3lzY3RsX3BoeXNpbmZvIHRvIGluZGljYXRlIHdoZXRo
ZXIgdGhlIHBsYXRmb3JtIHN1cHBvcnRzIHNoYXJpbmcgb2YKPiBIQVAgcGFnZSB0YWJsZXMgKGku
ZS4gdGhlIFAyTSkgd2l0aCB0aGUgSU9NTVUuIFRoaXMgaW5mb3JtcyB0aGUgdG9vbHN0YWNrCj4g
d2hldGhlciB0aGUgZG9tYWluIG5lZWRzIGV4dHJhIG1lbW9yeSB0byBzdG9yZSBkaXNjcmV0ZSBJ
T01NVSBwYWdlIHRhYmxlcwo+IG9yIG5vdC4KPiAKPiBOT1RFOiBUaGlzIHBhdGNoIG1ha2VzIHN1
cmUgaW9tbXVfaGFwX3B0X3NoYXJlZCBpcyBjbGVhciBpZiBIQVAgaXMgbm90Cj4gICAgICAgc3Vw
cG9ydGVkIG9yIHRoZSBJT01NVSBpcyBkaXNhYmxlZCwgYW5kIGRlZmluZXMgaXQgdG8gZmFsc2Ug
aWYKPiAgICAgICAhQ09ORklHX0hWTS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQg
PHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IEFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxj
aHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2M6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENjOiBB
bnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiBDYzogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBDYzogR2VvcmdlIER1bmxhcCA8R2Vv
cmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gQ2M6IEtv
bnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiBDYzogU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiBUaW0gRGVlZ2FuIDx0
aW1AeGVuLm9yZz4KPiBDYzogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRy
aXguY29tPgo+IENjOiBEYXZpZCBTY290dCA8ZGF2ZUByZWNvaWwub3JnPgo+IENjOiAiUm9nZXIg
UGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENjOiBTdXJhdmVlIFN1dGhpa3Vs
cGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgo+IENjOiBLZXZpbiBUaWFuIDxr
ZXZpbi50aWFuQGludGVsLmNvbT4KPiAKPiB2MTA6Cj4gIC0gU2V0IGZsYWcgaW4gY29tbW9uIGNv
ZGUgKHdoaWNoIG1lYW5zIGNsZWFyaW5nIGlvbW11X2hhcF9wdF9zaGFyZSBpZgo+ICAgIEhBUCBj
YW5ub3QgYmUgZW5hYmxlZCBvciBpcyBjb25maWd1cmVkIG91dCkuCj4gCj4gdjk6Cj4gIC0gTmV3
IGluIHY5Cj4gLS0tCj4gIHRvb2xzL2xpYnhsL2xpYnhsLmMgICAgICAgICAgICAgICAgICAgICAg
fCAgMiArKwo+ICB0b29scy9saWJ4bC9saWJ4bC5oICAgICAgICAgICAgICAgICAgICAgIHwgIDcg
KysrKysrKwo+ICB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgICAgICAgICAgICAgIHwgIDEg
KwoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
