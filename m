Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F5317F56C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 11:53:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBcST-0004sq-0B; Tue, 10 Mar 2020 10:49:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBcSS-0004sk-0u
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 10:49:56 +0000
X-Inumbo-ID: e08dfa7c-62bc-11ea-8eb3-bc764e2007e4
Received: from mail-ed1-x532.google.com (unknown [2a00:1450:4864:20::532])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e08dfa7c-62bc-11ea-8eb3-bc764e2007e4;
 Tue, 10 Mar 2020 10:49:55 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id z65so9774340ede.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=i2gT0Pu+Uy3iB0wRIFKWDL9V8vTm5qvAkUkRuN6PqZ4=;
 b=FsY/nquuuwXglA5+vUqq+xhesMDcbDgkIbWRQG/Oc7pCXrgr5dgczgq9szV4Kc/Q8s
 CiyShCF0me8CbAtzfgGq7VkwuwhGTKvUg6RzhwGGMjnYYVCoq2vgVI5JezTlcn8lNkIt
 bnhH+w1+ErASErciFHcjm9cBgfIXief7GMa/S0t7Iz6JMW7H4NsPyixhS2ihyizG+ypO
 lwUkak0nTR5/KFTWNrdUC2KB3nOBKzg3oJOv2ymHYLSo90835Ww1cFYyAYxnL8Iv7jWn
 StapwssgqVkwEyZwg4ZyZEP4BQ0BLWMlYrSOdvH7LS5+lwjaB3PjWdEutYMWRMYbXw2Q
 jllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=i2gT0Pu+Uy3iB0wRIFKWDL9V8vTm5qvAkUkRuN6PqZ4=;
 b=nQ5fAK/vlF2KAx/loJP5q9muFpuh6ViJyCRC59hiHStBwxkc5SJ3H8vkrWHFPCF8bb
 kSRzG3KUHWuQ3R7NhjQ536o9WyR9b/nTR08XpSrfUjcN7nvUIZ94Y2OB8JXi2MbyRkLY
 hKvfUFLrsJC7YhFd/jg50/WTFXUPN5SVeoL6Rg1a2XaYOLIQKZh78dXZM0KVcvCxnyJw
 uM+eNHVIR/xGTrO8iZQkykZIsjueVpj0JWrUDLt9KKerLfLg15zl6qbEjuLUkGQaEDTy
 VNZp6eseOuUCgOKT+9Lw0q15gIy1e/ZpZ/A/u0ZE2q7sFhDqIZRUs0u1CXhJimr2SnzS
 85CA==
X-Gm-Message-State: ANhLgQ1rG9WSaTeh+kCOjnFKs3TpK3rSaEraGIAsr8BtW2E2X6GRzjl0
 9D6elSL5ytd9FZHo50Jpx/hoPtyNfG0=
X-Google-Smtp-Source: ADFU+vur5o74C80WnYRs6xFuj/FoRFO8alHcvY5WLYPMXrTfjqme29zSgjLvZ/a2Rfc0f45+koohmg==
X-Received: by 2002:a17:906:c7c5:: with SMTP id
 dc5mr12723467ejb.300.1583837394484; 
 Tue, 10 Mar 2020 03:49:54 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id c24sm2629021edu.13.2020.03.10.03.49.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 03:49:53 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <a8fc7299-4632-b32a-939d-b2e8354cf296@suse.com>
 <cde0e89a-ea2d-22f9-7145-72ed40777d21@suse.com>
In-Reply-To: <cde0e89a-ea2d-22f9-7145-72ed40777d21@suse.com>
Date: Tue, 10 Mar 2020 10:49:52 -0000
Message-ID: <000a01d5f6c9$a1b63530$e5229f90$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIwGZkq90C1TSWQGzHpu7p2ZALtpgJ6GJBMp3mOrEA=
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v2 5/5] IOMMU: iommu_snoop is x86-only
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
Reply-To: paul@xen.org
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Konrad Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAwOSBNYXJjaCAyMDIwIDEwOjQ1Cj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbiBH
cmFsbAo+IDxqdWxpZW5AeGVuLm9yZz47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBLb25yYWQgV2ls
ayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXAKPiA8R2VvcmdlLkR1bmxh
cEBldS5jaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT47IElhbiBKYWNrc29uCj4gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQg
PHBhdWxAeGVuLm9yZz4KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgNS81XSBJT01NVTogaW9tbXVfc25v
b3AgaXMgeDg2LW9ubHkKPiAKPiBJbiBmYWN0IGl0J3MgVlQtZCBzcGVjaWZpYywgYnV0IHdlIGRv
bid0IGhhdmUgYSB3YXkgeWV0IHRvIGJ1aWxkIGNvZGUKPiBmb3IganVzdCBvbmUgdmVuZG9yLiBQ
cm92aWRlIGEgI2RlZmluZSBmb3IgdGhlIG9wcG9zaXRlIGNhc2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bEB4ZW4ub3JnPgoKPiAtLS0KPiB2MjogVGhlIG9wdGlvbiBpc24ndCBIVk0tc3Bl
Y2lmaWMsIGFmdGVyIGFsbC4KPiAKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21t
dS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+IEBAIC0zMiw3ICsz
Miw2IEBAIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2VuYWJsZWQ7Cj4gIGJvb2xfdCBfX3Jl
YWRfbW9zdGx5IGZvcmNlX2lvbW11Owo+ICBib29sX3QgX19yZWFkX21vc3RseSBpb21tdV92ZXJi
b3NlOwo+ICBib29sIF9fcmVhZF9tb3N0bHkgaW9tbXVfcXVhcmFudGluZSA9IHRydWU7Cj4gLWJv
b2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X3Nub29wID0gMTsKPiAgYm9vbF90IF9fcmVhZF9tb3N0
bHkgaW9tbXVfY3Jhc2hfZGlzYWJsZTsKPiAKPiAgc3RhdGljIGJvb2wgX19od2RvbV9pbml0ZGF0
YSBpb21tdV9od2RvbV9ub25lOwo+IEBAIC03OSw4ICs3OCwxMCBAQCBzdGF0aWMgaW50IF9faW5p
dCBwYXJzZV9pb21tdV9wYXJhbShjb25zCj4gICNlbmRpZgo+ICAgICAgICAgIGVsc2UgaWYgKCAo
dmFsID0gcGFyc2VfYm9vbGVhbigidmVyYm9zZSIsIHMsIHNzKSkgPj0gMCApCj4gICAgICAgICAg
ICAgIGlvbW11X3ZlcmJvc2UgPSB2YWw7Cj4gKyNpZm5kZWYgaW9tbXVfc25vb3AKPiAgICAgICAg
ICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oInNub29wIiwgcywgc3MpKSA+PSAwICkK
PiAgICAgICAgICAgICAgaW9tbXVfc25vb3AgPSB2YWw7Cj4gKyNlbmRpZgo+ICAjaWZuZGVmIGlv
bW11X2ludHJlbWFwCj4gICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJp
bnRyZW1hcCIsIHMsIHNzKSkgPj0gMCApCj4gICAgICAgICAgICAgIGlvbW11X2ludHJlbWFwID0g
dmFsID8gaW9tbXVfaW50cmVtYXBfZnVsbCA6IGlvbW11X2ludHJlbWFwX29mZjsKPiBAQCAtNDg4
LDcgKzQ4OSw5IEBAIGludCBfX2luaXQgaW9tbXVfc2V0dXAodm9pZCkKPiAgICAgIHByaW50aygi
SS9PIHZpcnR1YWxpc2F0aW9uICVzYWJsZWRcbiIsIGlvbW11X2VuYWJsZWQgPyAiZW4iIDogImRp
cyIpOwo+ICAgICAgaWYgKCAhaW9tbXVfZW5hYmxlZCApCj4gICAgICB7Cj4gLSAgICAgICAgaW9t
bXVfc25vb3AgPSAwOwo+ICsjaWZuZGVmIGlvbW11X3Nub29wCj4gKyAgICAgICAgaW9tbXVfc25v
b3AgPSBmYWxzZTsKPiArI2VuZGlmCj4gICAgICAgICAgaW9tbXVfaHdkb21fcGFzc3Rocm91Z2gg
PSBmYWxzZTsKPiAgICAgICAgICBpb21tdV9od2RvbV9zdHJpY3QgPSBmYWxzZTsKPiAgICAgIH0K
PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+ICsrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gQEAgLTUyLDYgKzUyLDkgQEAgYm9vbCBf
X3JlYWRfbW9zdGx5IHVudHJ1c3RlZF9tc2k7Cj4gCj4gIGJvb2wgX19yZWFkX21vc3RseSBpb21t
dV9pZ2Z4ID0gdHJ1ZTsKPiAgYm9vbCBfX3JlYWRfbW9zdGx5IGlvbW11X3FpbnZhbCA9IHRydWU7
Cj4gKyNpZm5kZWYgaW9tbXVfc25vb3AKPiArYm9vbCBfX3JlYWRfbW9zdGx5IGlvbW11X3Nub29w
ID0gdHJ1ZTsKPiArI2VuZGlmCj4gCj4gIGludCBucl9pb21tdXM7Cj4gCj4gQEAgLTIyODgsOCAr
MjI5MSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCB2dGRfc2V0dXAodm9pZCkKPiAgICAgICAgICAg
ICAgICAgY2FwX3Nwc18ybWIoaW9tbXUtPmNhcCkgPyAiLCAyTUIiIDogIiIsCj4gICAgICAgICAg
ICAgICAgIGNhcF9zcHNfMWdiKGlvbW11LT5jYXApID8gIiwgMUdCIiA6ICIiKTsKPiAKPiArI2lm
bmRlZiBpb21tdV9zbm9vcAo+ICAgICAgICAgIGlmICggaW9tbXVfc25vb3AgJiYgIWVjYXBfc25w
X2N0bChpb21tdS0+ZWNhcCkgKQo+IC0gICAgICAgICAgICBpb21tdV9zbm9vcCA9IDA7Cj4gKyAg
ICAgICAgICAgIGlvbW11X3Nub29wID0gZmFsc2U7Cj4gKyNlbmRpZgo+IAo+ICAgICAgICAgIGlm
ICggaW9tbXVfaHdkb21fcGFzc3Rocm91Z2ggJiYgIWVjYXBfcGFzc190aHJ1KGlvbW11LT5lY2Fw
KSApCj4gICAgICAgICAgICAgIGlvbW11X2h3ZG9tX3Bhc3N0aHJvdWdoID0gZmFsc2U7Cj4gQEAg
LTIzMzEsNyArMjMzNiw5IEBAIHN0YXRpYyBpbnQgX19pbml0IHZ0ZF9zZXR1cCh2b2lkKQo+ICAg
ICAgfQo+IAo+ICAjZGVmaW5lIFAocCxzKSBwcmludGsoIkludGVsIFZULWQgJXMgJXNlbmFibGVk
LlxuIiwgcywgKHApPyAiIiA6ICJub3QgIikKPiArI2lmbmRlZiBpb21tdV9zbm9vcAo+ICAgICAg
UChpb21tdV9zbm9vcCwgIlNub29wIENvbnRyb2wiKTsKPiArI2VuZGlmCj4gICAgICBQKGlvbW11
X2h3ZG9tX3Bhc3N0aHJvdWdoLCAiRG9tMCBETUEgUGFzc3Rocm91Z2giKTsKPiAgICAgIFAoaW9t
bXVfcWludmFsLCAiUXVldWVkIEludmFsaWRhdGlvbiIpOwo+ICAgICAgUChpb21tdV9pbnRyZW1h
cCwgIkludGVycnVwdCBSZW1hcHBpbmciKTsKPiBAQCAtMjM1MSw3ICsyMzU4LDkgQEAgc3RhdGlj
IGludCBfX2luaXQgdnRkX3NldHVwKHZvaWQpCj4gCj4gICBlcnJvcjoKPiAgICAgIGlvbW11X2Vu
YWJsZWQgPSAwOwo+IC0gICAgaW9tbXVfc25vb3AgPSAwOwo+ICsjaWZuZGVmIGlvbW11X3Nub29w
Cj4gKyAgICBpb21tdV9zbm9vcCA9IGZhbHNlOwo+ICsjZW5kaWYKPiAgICAgIGlvbW11X2h3ZG9t
X3Bhc3N0aHJvdWdoID0gZmFsc2U7Cj4gICAgICBpb21tdV9xaW52YWwgPSAwOwo+ICAgICAgaW9t
bXVfaW50cmVtYXAgPSBpb21tdV9pbnRyZW1hcF9vZmY7Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVu
L2lvbW11LmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaAo+IEBAIC01NCw3ICs1NCw2
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbF90IGRmbl9lcShkZm5fdCB4LCBkZm4KPiAKPiAgZXh0ZXJu
IGJvb2xfdCBpb21tdV9lbmFibGUsIGlvbW11X2VuYWJsZWQ7Cj4gIGV4dGVybiBib29sIGZvcmNl
X2lvbW11LCBpb21tdV9xdWFyYW50aW5lLCBpb21tdV92ZXJib3NlOwo+IC1leHRlcm4gYm9vbF90
IGlvbW11X3Nub29wOwo+IAo+ICAjaWZkZWYgQ09ORklHX1g4Ngo+ICBleHRlcm4gZW51bSBfX3Bh
Y2tlZCBpb21tdV9pbnRyZW1hcCB7Cj4gQEAgLTcwLDkgKzY5LDEwIEBAIGV4dGVybiBlbnVtIF9f
cGFja2VkIGlvbW11X2ludHJlbWFwIHsKPiAgICAgaW9tbXVfaW50cmVtYXBfcmVzdHJpY3RlZCwK
PiAgICAgaW9tbXVfaW50cmVtYXBfZnVsbCwKPiAgfSBpb21tdV9pbnRyZW1hcDsKPiAtZXh0ZXJu
IGJvb2wgaW9tbXVfaWdmeCwgaW9tbXVfcWludmFsOwo+ICtleHRlcm4gYm9vbCBpb21tdV9pZ2Z4
LCBpb21tdV9xaW52YWwsIGlvbW11X3Nub29wOwo+ICAjZWxzZQo+ICAjIGRlZmluZSBpb21tdV9p
bnRyZW1hcCBmYWxzZQo+ICsjIGRlZmluZSBpb21tdV9zbm9vcCBmYWxzZQo+ICAjZW5kaWYKPiAK
PiAgI2lmIGRlZmluZWQoQ09ORklHX1g4NikgJiYgZGVmaW5lZChDT05GSUdfSFZNKQoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
