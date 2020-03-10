Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 442E617F556
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 11:48:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBcOm-0004WY-5X; Tue, 10 Mar 2020 10:46:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBcOk-0004WR-LL
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 10:46:06 +0000
X-Inumbo-ID: 57debcd4-62bc-11ea-a50b-bc764e2007e4
Received: from mail-ed1-x52d.google.com (unknown [2a00:1450:4864:20::52d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57debcd4-62bc-11ea-a50b-bc764e2007e4;
 Tue, 10 Mar 2020 10:46:06 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id b23so7658724edx.4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 03:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=nxrvglk5MBrPTeXqeR5TzhJ1LUM/Vx3rF7FFpOC0/II=;
 b=UOyHF5iO5HSo8yo0bQuWXDvM+BUByqsGtGZaeUJHICXVowSnPc1nZ3PL54cppEBslb
 fCC3BC9DqHVgoUSHHujSHRep+th+8T840+5ESYQcMt9muLQ+mf4XGpvzb2ykvkS6RXA3
 O9oyckQZEFDjLIXFtI0j6FBXnRSOuoo/Y4sj9ZWusRx0OpREtfu35mu0kms8YGb4hMYD
 yvlztdAfaZtz4VAEQqa9+LwOfPi5fk3eAThO+48p+SsAZvQWiVSEZRKxcQCSUegib0Dz
 ysl0FmRw+0jLjQEabs7oWUONG0yCz5jQI1hqvvwkizIbWouhm9Mz9TsS5+hWI12xLrsr
 T15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=nxrvglk5MBrPTeXqeR5TzhJ1LUM/Vx3rF7FFpOC0/II=;
 b=fsFSOR0fmT8r8tE0qDCtFdGySw3BoLryi8dsyHzWXkQOfsAXOsPWkwT8wrt2Lvg7xr
 JC7WVykjI+lc6vXGDlcK7kO7k06lcq4CbrQ4j/kn375QveaOPOBcHEB3vVGDwrXwdfM6
 TEqAgf1CXCoYyUUrCGTD/fUmbm5cr8ml5yi+OeUVJ2G27RDhwtUc3U6aWAoBDLp9AtJM
 qDDawHaZ486H+Zi/W7ST5BKaHAytUwgTbkorqh0xsbpztYlwycS9npV+LmTnE3K2unHp
 2BngVNtlongSsflQ+60Y13Jkr+lUbJzce7SxK7h44/xVjncSSp3NbL+jJDGY5nNHw+FF
 wvcw==
X-Gm-Message-State: ANhLgQ2pf0prtX/03ByVCpdQ2ybyu9BsFMK7wonv5cy7NKuZsMrJNMoY
 B7zhoNdp3vtfiOHkTPlVkPc=
X-Google-Smtp-Source: ADFU+vuUVjUpYyVLbJFfIl8fGXNIGr33EepmH7FWWaDvE53UtqU+yG7cR0NfluFKZNC3E+sSr3oQaA==
X-Received: by 2002:a17:906:4488:: with SMTP id
 y8mr18409175ejo.296.1583837165255; 
 Tue, 10 Mar 2020 03:46:05 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id c24sm2627313edu.13.2020.03.10.03.46.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 03:46:04 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <a8fc7299-4632-b32a-939d-b2e8354cf296@suse.com>
 <a76bbb5c-0257-dbe8-ea95-31e5a9ca760b@suse.com>
In-Reply-To: <a76bbb5c-0257-dbe8-ea95-31e5a9ca760b@suse.com>
Date: Tue, 10 Mar 2020 10:46:03 -0000
Message-ID: <000801d5f6c9$1912a790$4b37f6b0$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIwGZkq90C1TSWQGzHpu7p2ZALtpgHwXAaxp33br8A=
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v2 3/5] IOMMU: iommu_igfx is x86-only
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
aEBzdXNlLmNvbT4KPiBTZW50OiAwOSBNYXJjaCAyMDIwIDEwOjQ0Cj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbiBH
cmFsbAo+IDxqdWxpZW5AeGVuLm9yZz47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBLb25yYWQgV2ls
ayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXAKPiA8R2VvcmdlLkR1bmxh
cEBldS5jaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT47IElhbiBKYWNrc29uCj4gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQg
PHBhdWxAeGVuLm9yZz4KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMy81XSBJT01NVTogaW9tbXVfaWdm
eCBpcyB4ODYtb25seQo+IAo+IEluIGZhY3QgaXQncyBWVC1kIHNwZWNpZmljLCBidXQgd2UgZG9u
J3QgaGF2ZSBhIHdheSB5ZXQgdG8gYnVpbGQgY29kZQo+IGZvciBqdXN0IG9uZSB2ZW5kb3IuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3
ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgoKPiAKPiAtLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9t
bXUuYwo+IEBAIC0zMiw3ICszMiw2IEBAIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2VuYWJs
ZWQ7Cj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGZvcmNlX2lvbW11Owo+ICBib29sX3QgX19yZWFk
X21vc3RseSBpb21tdV92ZXJib3NlOwo+ICBib29sIF9fcmVhZF9tb3N0bHkgaW9tbXVfcXVhcmFu
dGluZSA9IHRydWU7Cj4gLWJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2lnZnggPSAxOwo+ICBi
b29sX3QgX19yZWFkX21vc3RseSBpb21tdV9zbm9vcCA9IDE7Cj4gIGJvb2xfdCBfX3JlYWRfbW9z
dGx5IGlvbW11X3FpbnZhbCA9IDE7Cj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2NyYXNo
X2Rpc2FibGU7Cj4gQEAgLTczLDggKzcyLDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX2lv
bW11X3BhcmFtKGNvbnMKPiAgICAgICAgICAgICAgZm9yY2VfaW9tbXUgPSB2YWw7Cj4gICAgICAg
ICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJxdWFyYW50aW5lIiwgcywgc3MpKSA+
PSAwICkKPiAgICAgICAgICAgICAgaW9tbXVfcXVhcmFudGluZSA9IHZhbDsKPiArI2lmZGVmIENP
TkZJR19YODYKPiAgICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oImlnZngi
LCBzLCBzcykpID49IDAgKQo+ICAgICAgICAgICAgICBpb21tdV9pZ2Z4ID0gdmFsOwo+ICsjZW5k
aWYKPiAgICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oInZlcmJvc2UiLCBz
LCBzcykpID49IDAgKQo+ICAgICAgICAgICAgICBpb21tdV92ZXJib3NlID0gdmFsOwo+ICAgICAg
ICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigic25vb3AiLCBzLCBzcykpID49IDAg
KQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPiBAQCAtNTAsNiArNTAsOCBAQCBzdHJ1
Y3QgbWFwcGVkX3JtcnIgewo+ICAvKiBQb3NzaWJsZSB1bmZpbHRlcmVkIExBUElDL01TSSBtZXNz
YWdlcyBmcm9tIHVudHJ1c3RlZCBzb3VyY2VzPyAqLwo+ICBib29sIF9fcmVhZF9tb3N0bHkgdW50
cnVzdGVkX21zaTsKPiAKPiArYm9vbCBfX3JlYWRfbW9zdGx5IGlvbW11X2lnZnggPSB0cnVlOwo+
ICsKPiAgaW50IG5yX2lvbW11czsKPiAKPiAgc3RhdGljIHN0cnVjdCB0YXNrbGV0IHZ0ZF9mYXVs
dF90YXNrbGV0Owo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCj4gKysrIGIveGVuL2lu
Y2x1ZGUveGVuL2lvbW11LmgKPiBAQCAtNTMsNyArNTMsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2xf
dCBkZm5fZXEoZGZuX3QgeCwgZGZuCj4gIH0KPiAKPiAgZXh0ZXJuIGJvb2xfdCBpb21tdV9lbmFi
bGUsIGlvbW11X2VuYWJsZWQ7Cj4gLWV4dGVybiBib29sIGZvcmNlX2lvbW11LCBpb21tdV9xdWFy
YW50aW5lLCBpb21tdV92ZXJib3NlLCBpb21tdV9pZ2Z4Owo+ICtleHRlcm4gYm9vbCBmb3JjZV9p
b21tdSwgaW9tbXVfcXVhcmFudGluZSwgaW9tbXVfdmVyYm9zZTsKPiAgZXh0ZXJuIGJvb2xfdCBp
b21tdV9zbm9vcCwgaW9tbXVfcWludmFsOwo+IAo+ICAjaWZkZWYgQ09ORklHX1g4Ngo+IEBAIC03
MCw2ICs3MCw3IEBAIGV4dGVybiBlbnVtIF9fcGFja2VkIGlvbW11X2ludHJlbWFwIHsKPiAgICAg
aW9tbXVfaW50cmVtYXBfcmVzdHJpY3RlZCwKPiAgICAgaW9tbXVfaW50cmVtYXBfZnVsbCwKPiAg
fSBpb21tdV9pbnRyZW1hcDsKPiArZXh0ZXJuIGJvb2wgaW9tbXVfaWdmeDsKPiAgI2Vsc2UKPiAg
IyBkZWZpbmUgaW9tbXVfaW50cmVtYXAgZmFsc2UKPiAgI2VuZGlmCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
