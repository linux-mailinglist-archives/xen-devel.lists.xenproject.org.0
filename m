Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6CA1804ED
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 18:36:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBilD-0007Al-N4; Tue, 10 Mar 2020 17:33:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBilB-0007Af-Bn
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 17:33:41 +0000
X-Inumbo-ID: 47e99f5e-62f5-11ea-bec1-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47e99f5e-62f5-11ea-bec1-bc764e2007e4;
 Tue, 10 Mar 2020 17:33:40 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id n18so17310758edw.9
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 10:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=vBCp49EDTj1nOzOMoYpVdq96tLXJPeMCQJikMvLDOTg=;
 b=UV96MU7ilj61a67+bXD2mO43qL3GanwaNAIduQjurGiW+hiev6EJf5IXCKYrnleC4l
 NUWhaSuOM/muIJU8JSd6HLXvPcLR3UloBg8RQ9vifEClh/0XWPIoykDwICpf269wexVS
 fdF2DZ84L1hdYobDfAktEJOKvjz/NzUE8h5Gxmd1TVDrcZwM8sB34BVJ9BRQ/D0fMNGt
 pV0h5tWsuK/XYTbFfiIEXUKj4KDNzIeT+FnwdJGa6IZr9/Tlcb1lu0qGjKIG2G2sM1zB
 nPAzA1aqNOXM4/TmIqksWtsiJtvZiBO/ONnP/Alr3WI/lra0+gHNS294uWiS6q0lZYlA
 hoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=vBCp49EDTj1nOzOMoYpVdq96tLXJPeMCQJikMvLDOTg=;
 b=OL40vbAbeyfBTXWmwNuOkH5tkJBZjPynb5NE2DDj/C/YU55MLDrHFyaLPQBD5VYIq1
 TQJZdOhfhQQWBfBg2lp+o8hNSIfe8ZV/W/HHQZqSKnX3vyAo4MCznFoDbeAg5SerYgXt
 SqSq5hespBvXv2PnjQAE/8HQU0AGwTHBus4z41NFRAR8nK09HvUaQklEZIrDntxE/ixg
 MfR4Hz/rzNB4pedFOdlAA/UOE+kW0S8DwPPirwdKYXOhgwFhwKqBoz6xo9axfUuHw1RW
 e9ysTyVUzwu0ym30awCL6gw3UGduheNeCftD2H7HHKOcK0oIivLzqyQW/KO78Brtw/FZ
 OPpw==
X-Gm-Message-State: ANhLgQ2ttD/PrkrukXL/bxonDyRqoTVJm4LWVDIzmXNkN/TOLxcJ2HiB
 GtY8I2yudxChTWJ5wW+2vN4=
X-Google-Smtp-Source: ADFU+vsDWZYqAcI6z7p/nYm0c35aFlgaUl4M5hLONmnCU3EgKWkbbX7Zv/SKkQQUIPVnfISBsWIceA==
X-Received: by 2002:aa7:cd6b:: with SMTP id
 ca11mr23603460edb.152.1583861619729; 
 Tue, 10 Mar 2020 10:33:39 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v2sm3630753ejj.44.2020.03.10.10.33.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 10:33:39 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200309102304.1251-1-paul@xen.org>
 <20200309102304.1251-7-paul@xen.org>
 <54fbff7c-118f-bfa7-3d2c-c1d6a2305a1f@suse.com>
In-Reply-To: <54fbff7c-118f-bfa7-3d2c-c1d6a2305a1f@suse.com>
Date: Tue, 10 Mar 2020 17:33:37 -0000
Message-ID: <004201d5f702$0905fbc0$1b11f340$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH8MQiuRQX2aixYfaKKXR3nYohrUgI6fEqtAma3drqn0JbTUA==
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v5 6/6] domain: use PGC_extra domheap page
 for shared_info
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAwOSBNYXJjaCAyMDIwIDE1OjU2Cj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFBhdWwgRHVycmFudCA8cGR1
cnJhbnRAYW1hem9uLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQo+IDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFZvbG9keW15ciBCYWJjaHVr
Cj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAKPiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPjsgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBLb25yYWQgUnpl
c3p1dGVrIFdpbGsKPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFdlaSBMaXUgPHdsQHhlbi5v
cmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSA2LzZdIGRvbWFpbjogdXNlIFBHQ19leHRyYSBk
b21oZWFwIHBhZ2UgZm9yIHNoYXJlZF9pbmZvCj4gCj4gT24gMDkuMDMuMjAyMCAxMToyMywgcGF1
bEB4ZW4ub3JnIHdyb3RlOgo+ID4gRnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24u
Y29tPgo+ID4KPiA+IEN1cnJlbnRseSBzaGFyZWRfaW5mbyBpcyBhIHNoYXJlZCB4ZW5oZWFwIHBh
Z2UgYnV0IHNoYXJlZCB4ZW5oZWFwIHBhZ2VzCj4gPiBjb21wbGljYXRlIGZ1dHVyZSBwbGFucyBm
b3IgbGl2ZS11cGRhdGUgb2YgWGVuIHNvIGl0IGlzIGRlc2lyYWJsZSB0bywKPiA+IHdoZXJlIHBv
c3NpYmxlLCBub3QgdXNlIHRoZW0gWzFdLiBUaGlzIHBhdGNoIHRoZXJlZm9yZSBjb252ZXJ0cyBz
aGFyZWRfaW5mbwo+ID4gaW50byBhIFBHQ19leHRyYSBkb21oZWFwIHBhZ2UuIFRoaXMgZG9lcyBl
bnRhaWwgZnJlZWluZyBzaGFyZWRfaW5mbyBkdXJpbmcKPiA+IGRvbWFpbl9yZWxpbnF1aXNoX3Jl
c291cmNlcygpIHJhdGhlciB0aGFuIGRvbWFpbl9kZXN0cm95KCkgc28gY2FyZSBpcwo+ID4gbmVl
ZGVkIHRvIGF2b2lkIGRlLXJlZmVyZW5jaW5nIGEgTlVMTCBzaGFyZWRfaW5mbyBwb2ludGVyIGhl
bmNlIHNvbWUKPiA+IGV4dHJhIGNoZWNrcyBvZiAnaXNfZHlpbmcnIGFyZSBuZWVkZWQuCj4gPgo+
ID4gQWxzbywgYmVjYXVzZSBzaGFyZWRfaW5mbyB3aWxsIG5vIGxvbmdlciBiZSBhIHhlbmhlYXAg
cGFnZSB0aGlzIHBhdGNoIGFkZHMKPiA+IGFuIGV4dHJhIGR1bXAgZnVuY3Rpb24gdG8gbWFrZSBz
dXJlIHRoZSBzaGFyZWRfaW5mbyBNRk4gaXMgaW5jbHVkZWQgaW4gdGhlCj4gPiBvdXRwdXQgb2Yg
ZHVtcF9wYWdlZnJhbWVfaW5mbygpLgo+IAo+IEkndmUgdm9pY2VkIG15IG9iamVjdGlvbiB0byBz
dWNoIGEgbW9kZWwsIGFuZCBoZW5jZSBpdCdsbCB0YWtlCj4gYW5vdGhlciBSRVNUIG1haW50YWlu
ZXIgdG8gYXBwcm92ZSBvZiB0aGlzIGRlc3BpdGUgbXkgYXJndW1lbnRzCj4gYWdhaW5zdCBpdC4g
KEFuZCBvZiBjb3Vyc2UsIGp1c3QgdG8gcmUtcmVjb3JkIHRoaXMgaGVyZSwgdGhlCj4gQVBJQyBh
Y2Nlc3MgcGFnZSwgY29udmVydGVkIGJ5IGVhM2RhYWJmZjVmMiwgd2lsbCB3YW50IHRvIGdldCBh
Cj4gZHVtcGluZyBmdW5jdGlvbiBhZGRlZCB0aGVuLCB0b28uKQo+IAo+IEkgd29uZGVyIHdoZXRo
ZXIgYSBkb21haW4ncyAiZXh0cmEiIHBhZ2VzIGNvdWxkbid0IGJlIHB1dCBpbiBhCj4gc2VwYXJh
dGUsIHNpbmdseS1saW5rZWQgbGlzdCwgdXNpbmcgdGhlIHVuaW9uIHRoZSBuZXh0X3NoYWRvdwo+
IGZpZWxkIGlzIGluIGFzIHRoZSBsaW5raW5nIGZpZWxkLiBOb25lIG9mIHRoZSBvdGhlciB1bmlv
bgo+IG1lbWJlcnMgbG9vayB0byBiZSBhcHBsaWNhYmxlIHRvICJleHRyYSIgcGFnZXMuCj4gCj4g
PiArdm9pZCBkdW1wX3NoYXJlZF9pbmZvKHN0cnVjdCBkb21haW4gKmQpCj4gPiArewo+ID4gKyAg
ICBkb21haW5fbG9jayhkKTsKPiA+ICsKPiA+ICsgICAgaWYgKCBkLT5zaGFyZWRfaW5mby52aXJ0
ICkKPiA+ICsgICAgICAgIHByaW50aygiU2hhcmVkIEluZm86ICUiUFJJX21mbiJcbiIsIG1mbl94
KGQtPnNoYXJlZF9pbmZvLm1mbikpOwo+IAo+IGNvdW50X2luZm8gYW5kIHR5cGVfaW5mbyBzaG91
bGQgYmUgbG9nZ2VkIGltbywganVzdCBsaWtlCj4gZHVtcF9wYWdlZnJhbWVfaW5mbygpIGRvZXMu
IE9uIHRoZSB3aG9sZSBJIHRoaW5rIHRoZSBhY3R1YWwKPiBkdW1waW5nIG1pZ2h0IGJldHRlciBi
ZSB1bmlmb3JtLCBhbmQgdGhlc2UgZnVuY3Rpb25zIHdvdWxkCj4gdGhlbiBvbmx5IGV4aXN0IHRv
ICJrbm93IiB3aGljaCBwYWdlKHMpIHRvIGR1bXAuCj4gCgpJIHRoaW5rIHRoZSBleHRyYSBwYWdl
IGxpc3Qgc2hvdWxkIGNvdmVyIHRoZXNlIGlzc3Vlcy4KCj4gPiAtLS0gYS94ZW4vY29tbW9uL3Rp
bWUuYwo+ID4gKysrIGIveGVuL2NvbW1vbi90aW1lLmMKPiA+IEBAIC05OSw2ICs5OSwxOCBAQCB2
b2lkIHVwZGF0ZV9kb21haW5fd2FsbGNsb2NrX3RpbWUoc3RydWN0IGRvbWFpbiAqZCkKPiA+ICAg
ICAgdWludDMyX3QgKndjX3ZlcnNpb247Cj4gPiAgICAgIHVpbnQ2NF90IHNlYzsKPiA+Cj4gPiAr
ICAgIGlmICggZCAhPSBjdXJyZW50LT5kb21haW4gKQo+ID4gKyAgICB7Cj4gPiArICAgICAgICAv
Kgo+ID4gKyAgICAgICAgICogV2UgbmVlZCB0byBjaGVjayBpc19keWluZyBoZXJlIGFzLCBpZiBp
dCBpcyBzZXQsIHRoZQo+ID4gKyAgICAgICAgICogc2hhcmVkX2luZm8gbWF5IGhhdmUgYmVlbiBm
cmVlZC4gVG8gZG8gdGhpcyBzYWZlbHkgd2UgbmVlZAo+ID4gKyAgICAgICAgICogaG9sZCB0aGUg
ZG9tYWluIGxvY2suCj4gPiArICAgICAgICAgKi8KPiA+ICsgICAgICAgIGRvbWFpbl9sb2NrKGQp
Owo+ID4gKyAgICAgICAgaWYgKCBkLT5pc19keWluZyApCj4gPiArICAgICAgICAgICAgZ290byB1
bmxvY2s7Cj4gPiArICAgIH0KPiAKPiBUaGlzIHNob3VsZG4ndCBoYXBwZW4gdmVyeSBvZnRlbiwg
YnV0IGl0J3MgcHJldHR5IGhlYXZ5IGEgbG9jay4KPiBJdCdzIGEgZnVuZGFtZW50YWwgYXNwZWN0
IG9mIHhlbmhlYXAgcGFnZXMgdGhhdCB0aGVpciBkaXNwb3NhbAo+IGNhbiBiIGUgZGVsYXkgdW50
aWwgYWxtb3N0IHRoZSBsYXN0IG1vbWVudCBvZiBndWVzdCBjbGVhbnVwLiBJCj4gY29udGludWUg
dG8gdGhpbmsgaXQncyBub3QgcmVhbGx5IGEgZ29vZCBpZGVhbCB0byBoYXZlIHNwZWNpYWwKPiBw
dXJwb3NlIGFsbG9jYXRpb24gKGFuZCBtYXBwaW5nKSBhY2NvbXBhbmllZCBieSB0aGVzZSBwYWdl
cwo+IGdldHRpbmcgdGFrZW4gY2FyZSBvZiBieSB0aGUgZ2VuZXJpYyByZWxpbnF1aXNoLXJlc291
cmNlcyBsb2dpYwo+IGhlcmUgKGZyb20gYSBtb3JlIGdlbmVyYWwgcG92IHN1Y2ggaXMgb2YgY291
cnNlIG9mdGVuIG5pY2UgdG8KPiBoYXZlKS4gSW5zdGVhZCBvZiBmcmVlaW5nIHRoZXNlIHBhZ2Vz
IHRoZXJlLCBjb3VsZG4ndCB0aGV5IGp1c3QKPiBiZSB0YWtlbiBvZmYgZC0+cGFnZV9saXN0LCB3
aXRoIHRoZSB1bm1hcHBpbmcgYW5kIGZyZWVpbmcgbGVmdAo+IGFzIGl0IHdhcz8KCkkgZG9uJ3Qg
dGhpbmsgdGhpcyBjYW4gYmUgYWNoaWV2ZWQgd2l0aG91dCBiZWluZyBhYmxlIGRlLWFzc2lnbiBw
YWdlcyBhbmQgSSBkb24ndCByZWFsbHkgd2FudCB0byBoYXZlIHRvIGludmVudCBuZXcgbG9naWMg
dG8gZG8gdGhhdCAoYmFzaWNhbGx5IHJlLWltcGxlbWVudGluZyB3aGF0IGhhcHBlbnMgdG8geGVu
aGVhcCBwYWdlcykuIEkgcmVhbGx5IGRvbid0IHRoaW5rIGl0IGlzIHRoYXQgYmFkIHRvIGRlYWwg
d2l0aCBzaGFyZWQgaW5mbyBhbmQgZ3JhbnQgdGFibGUgcGFnZXMgYXMgZG9taGVhcCBwYWdlcy4g
WWVzLCB3ZSBoYXZlIHRvIGJlIGNhcmVmdWwsIGJ1dCBpbiB0aGlzIGNhc2UgdGhlIGxvY2sgaXMg
b25seSB0YWtlbiBpbiBhIHRvb2xzdGFjayB1cGRhdGUgb2YgdGhlIHdhbGxjbG9jayBhbmQsIGFw
YXJ0IGZyb20gc3RhcnQgb2YgZGF5IGFjY2VzcywgSSB0aGluayB0aGlzIGlzIGxpbWl0ZWQgdG8g
WEVOX0RPTUNUTF9zZXR0aW1lb2Zmc2V0IGFuZCBYRU5fRE9NQ1RMX3NldHZjcHVjb250ZXh0IG5l
aXRoZXIgb2Ygd2hpY2ggSSBiZWxpZXZlIGlzIHBhcnRpY3VsYXJseSBwZXJmb3JtYW5jZS1jcml0
aWNhbC4KCiAgUGF1bAoKPiAKPiBKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
