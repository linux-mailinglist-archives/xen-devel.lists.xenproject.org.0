Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BC017F29F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 10:02:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBaiX-0002V7-OY; Tue, 10 Mar 2020 08:58:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBaiW-0002V2-6r
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 08:58:24 +0000
X-Inumbo-ID: 4b9b3204-62ad-11ea-8490-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b9b3204-62ad-11ea-8490-bc764e2007e4;
 Tue, 10 Mar 2020 08:58:23 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c21so15359698edt.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 01:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=HswDqblE6OLlPPMA5xHzxLQ8+LThZxWuetv+pc6KSrQ=;
 b=bc4R8/HD8MNNSqYwQ9N74wXUdtQzuI4fKHqRfoj9x6rs/J+Dizygb4zVyf2ALpwlH+
 de4mJjfmWsxqAS7lf2WCTRNL3Xn9huBfQMg2ypBwBsNjTFqz9ANPcN/3yude1w7UcEV+
 X/XsDWqM/3h2cvG/K1bf5a8+N5wwNJqGuQCxTB5pW4h/QM//w4rnidFSTUG02VpqBfsd
 q39zWhxW0RibjkexspbiwanDhOLYiloArCiDhkCGGPux+vgs0c68sBAwLcZClWj1I0qX
 mw6Ys2wp/Ht6n+edJQZLuaEwxC7ifGFhrb49o+14Mw2ITvwDV0Ul0KnefOV7e74xclkV
 uOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=HswDqblE6OLlPPMA5xHzxLQ8+LThZxWuetv+pc6KSrQ=;
 b=f5YrwQvaoPfy7/F5+3wicJ3KY1/6O2gcmasUl8gXfwX4I5QNTRM+Wz2g64OoZxYM5y
 v4Re1ioyKI1utwkfOXHpySyy+H3Uzj/kkGkCNK96OR91yCFY2x+kJngzYElcOpN0OSQl
 QQwu3KUenpk8ibMW9aufR97eN6M953gt7zy3yqO9dpkV+2S+RmYBVmWIinzOETXdG2Id
 UI18FHWZai4R+9ZcuDc2Ei5qq/Hu0LDRoP2lOFM1TbiGzHwrgoXpPhITDFIu/aJ7QbWB
 pthYUG+rGVsJyeAZdpJR9RBQ2DM+9e2i37k+Gzu6ii9EhMWHylPoTOq14feKVZEbmzY6
 ZJOw==
X-Gm-Message-State: ANhLgQ2ZA4T0A8Yrs8cnTqJAxy6Csc9OJ3YPY8TfKpAGmrSZCN68inSM
 5mTzAzuhArRC0DVTCcFAftY=
X-Google-Smtp-Source: ADFU+vtGPckEKQtQYCzHa7NNwXszIpIQWAyrk0VKv8vf+Ix3SAgFGvZ1aLiGuQATbszJ/5jBXRJT8g==
X-Received: by 2002:a17:906:76d9:: with SMTP id
 q25mr18185669ejn.130.1583830702015; 
 Tue, 10 Mar 2020 01:58:22 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id bs4sm3431593ejb.39.2020.03.10.01.58.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 01:58:21 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
In-Reply-To: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
Date: Tue, 10 Mar 2020 08:58:20 -0000
Message-ID: <000601d5f6ba$0c874800$2595d800$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJZoBACz6CdVNlWCO6Kdq3kziJjnKc6LTQQ
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v3] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Kevin Tian' <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAwOSBNYXJjaCAyMDIwIDExOjA5Cj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+OyBLZXZpbiBUaWFuCj4gPGtl
dmluLnRpYW5AaW50ZWwuY29tPgo+IFN1YmplY3Q6IFtQQVRDSCB2M10gSU9NTVU6IG1ha2UgRE1B
IGNvbnRhaW5tZW50IG9mIHF1YXJhbnRpbmVkIGRldmljZXMgb3B0aW9uYWwKPiAKPiBDb250YWlu
aW5nIHN0aWxsIGluIGZsaWdodCBETUEgd2FzIGludHJvZHVjZWQgdG8gd29yayBhcm91bmQgY2Vy
dGFpbgo+IGRldmljZXMgLyBzeXN0ZW1zIGhhbmdpbmcgaGFyZCB1cG9uIGhpdHRpbmcgYSAibm90
LXByZXNlbnQiIElPTU1VIGZhdWx0Lgo+IFBhc3NpbmcgdGhyb3VnaCAoc3VjaCkgZGV2aWNlcyAo
b24gc3VjaCBzeXN0ZW1zKSBpcyBpbmhlcmVudGx5IGluc2VjdXJlCj4gKGFzIGd1ZXN0cyBjb3Vs
ZCBlYXNpbHkgYXJyYW5nZSBmb3IgSU9NTVUgZmF1bHRzIG9mIGFueSBraW5kIHRvIG9jY3VyKS4K
PiBEZWZhdWx0aW5nIHRvIGEgbW9kZSB3aGVyZSBhZG1pbnMgbWF5IG5vdCBldmVuIGJlY29tZSBh
d2FyZSBvZiBpc3N1ZXMKPiB3aXRoIGRldmljZXMgY2FuIGJlIGNvbnNpZGVyZWQgdW5kZXNpcmFi
bGUuIFRoZXJlZm9yZSBjb252ZXJ0IHRoaXMgbW9kZQo+IG9mIG9wZXJhdGlvbiB0byBhbiBvcHRp
b25hbCBvbmUsIG5vdCBvbmUgZW5hYmxlZCBieSBkZWZhdWx0Lgo+IAo+IFRoaXMgaW52b2x2ZXMg
cmVzdXJyZWN0aW5nIGNvZGUgY29tbWl0IGVhMzg4Njc4MzFkYSAoIng4NiAvIGlvbW11OiBzZXQK
PiB1cCBhIHNjcmF0Y2ggcGFnZSBpbiB0aGUgcXVhcmFudGluZSBkb21haW4iKSBkaWQgcmVtb3Zl
LCBpbiBhIHNsaWdodGx5Cj4gZXh0ZW5kZWQgYW5kIGFic3RyYWN0ZWQgZmFzaGlvbi4gSGVyZSwg
aW5zdGVhZCBvZiByZWludHJvZHVjaW5nIGEgcHJldHR5Cj4gcG9pbnRsZXNzIHVzZSBvZiAiZ290
byIgaW4gZG9tYWluX2NvbnRleHRfdW5tYXAoKSwgYW5kIGluc3RlYWQgb2YgbWFraW5nCj4gdGhl
IGZ1bmN0aW9uIChhdCBsZWFzdCB0ZW1wb3JhcmlseSkgaW5jb25zaXN0ZW50LCB0YWtlIHRoZSBv
cHBvcnR1bml0eQo+IGFuZCByZXBsYWNlIHRoZSBvdGhlciBzaW1pbGFybHkgcG9pbnRsZXNzICJn
b3RvIiBhcyB3ZWxsLgo+IAo+IEluIG9yZGVyIHRvIGtleSB0aGUgcmUtaW5zdGF0ZWQgYnlwYXNz
ZXMgb2ZmIG9mIHRoZXJlIChub3QpIGJlaW5nIGEgcm9vdAo+IHBhZ2UgdGFibGUgdGhpcyBmdXJ0
aGVyIHJlcXVpcmVzIG1vdmluZyB0aGUgYWxsb2NhdGVfZG9tYWluX3Jlc291cmNlcygpCj4gaW52
b2NhdGlvbiBmcm9tIHJlYXNzaWduX2RldmljZSgpIHRvIGFtZF9pb21tdV9zZXR1cF9kb21haW5f
ZGV2aWNlKCkgKG9yCj4gZWxzZSByZWFzc2lnbl9kZXZpY2UoKSB3b3VsZCBhbGxvY2F0ZSBhIHJv
b3QgcGFnZSB0YWJsZSBhbnl3YXkpOyB0aGlzIGlzCj4gYmVuaWduIHRvIHRoZSBzZWNvbmQgY2Fs
bGVyIG9mIHRoZSBsYXR0ZXIgZnVuY3Rpb24uCj4gCj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5k
IGFsc28gbGltaXQgdGhlIGNvbnRyb2wgdG8gYnVpbGRzIHN1cHBvcnRpbmcKPiBQQ0kuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IEkn
bSBoYXBweSB0byB0YWtlIGJldHRlciBzdWdnZXN0aW9ucyB0byByZXBsYWNlIHRoZSAiZnVsbCIg
Y29tbWFuZCBsaW5lCj4gb3B0aW9uIGFuZCBLY29uZmlnIHByb21wdCB0b2tlbnMuIEkgZG9uJ3Qg
dGhpbmsgdGhvdWdoIHRoYXQgImZhdWx0IiBhbmQKPiAid3JpdGUtZmF1bHQiIGFyZSByZWFsbHkg
c3VpdGFibGUgdGhlcmUuCj4gLS0tCj4gVGhpcyBwYXRjaCBjb250ZXh0dWFsbHkgZGVwZW5kcyBv
biAiW1BBVENIIHYyIDAvNV0gSU9NTVU6IHJlc3RyaWN0Cj4gdmlzaWJpbGl0eS9zY29wZSBpZiBj
ZXJ0YWluIHZhcmlhYmxlcyIuCj4gLS0tCj4gdjM6IElPTU1VX3F1YXJhbnRpbmVfYmFzaWMgLT4g
SU9NTVVfcXVhcmFudGluZV9mYXVsdCwKPiAgICAgSU9NTVVfcXVhcmFudGluZV9mdWxsIC0+IElP
TU1VX3F1YXJhbnRpbmVfd3JpdGVfZmF1bHQuIEtjb25maWcKPiAgICAgb3B0aW9uIChjaG9pY2Up
IHRvIHNlbGVjdCBkZWZhdWx0LiBMaW1pdCB0byBIQVNfUENJLgo+IHYyOiBEb24ndCB1c2UgdHJ1
ZS9mYWxzZS4gSW50cm9kdWNlIFFVQVJBTlRJTkVfU0tJUCgpIChhbGJlaXQgSSdtIG5vdAo+ICAg
ICByZWFsbHkgY29udmluY2VkIHRoaXMgaXMgYW4gaW1wcm92ZW1lbnQpLiBBZGQgY29tbWVudC4K
PiAKPiAtLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPiArKysgYi9kb2Nz
L21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPiBAQCAtMTIzOCw3ICsxMjM4LDcgQEAgZGV0
ZWN0aW9uIG9mIHN5c3RlbXMga25vd24gdG8gbWlzYmVoYXZlCj4gID4gRGVmYXVsdDogYG5ld2Ag
dW5sZXNzIGRpcmVjdGVkLUVPSSBpcyBzdXBwb3J0ZWQKPiAKPiAgIyMjIGlvbW11Cj4gLSAgICA9
IExpc3Qgb2YgWyA8Ym9vbD4sIHZlcmJvc2UsIGRlYnVnLCBmb3JjZSwgcmVxdWlyZWQsIHF1YXJh
bnRpbmUsCj4gKyAgICA9IExpc3Qgb2YgWyA8Ym9vbD4sIHZlcmJvc2UsIGRlYnVnLCBmb3JjZSwg
cmVxdWlyZWQsIHF1YXJhbnRpbmVbPWZ1bGxdLAo+ICAgICAgICAgICAgICAgICAgc2hhcmVwdCwg
aW50cmVtYXAsIGludHBvc3QsIGNyYXNoLWRpc2FibGUsCj4gICAgICAgICAgICAgICAgICBzbm9v
cCwgcWludmFsLCBpZ2Z4LCBhbWQtaW9tbXUtcGVyZGV2LWludHJlbWFwLAo+ICAgICAgICAgICAg
ICAgICAgZG9tMC17cGFzc3Rocm91Z2gsc3RyaWN0fSBdCj4gQEAgLTEyNzYsMTEgKzEyNzYsMTUg
QEAgYm9vbGVhbiAoZS5nLiBgaW9tbXU9bm9gKSBjYW4gb3ZlcnJpZGUgdAo+ICAgICAgd2lsbCBw
cmV2ZW50IFhlbiBmcm9tIGJvb3RpbmcgaWYgSU9NTVVzIGFyZW4ndCBkaXNjb3ZlcmVkIGFuZCBl
bmFibGVkCj4gICAgICBzdWNjZXNzZnVsbHkuCj4gCj4gLSogICBUaGUgYHF1YXJhbnRpbmVgIGJv
b2xlYW4gY2FuIGJlIHVzZWQgdG8gY29udHJvbCBYZW4ncyBiZWhhdmlvciB3aGVuCj4gLSAgICBk
ZS1hc3NpZ25pbmcgZGV2aWNlcyBmcm9tIGd1ZXN0cy4gIElmIGVuYWJsZWQgKHRoZSBkZWZhdWx0
KSwgWGVuIGFsd2F5cwo+IC0gICAgcXVhcmFudGluZXMgc3VjaCBkZXZpY2VzOyB0aGV5IG11c3Qg
YmUgZXhwbGljaXRseSBhc3NpZ25lZCBiYWNrIHRvIERvbTAKPiAtICAgIGJlZm9yZSB0aGV5IGNh
biBiZSB1c2VkIHRoZXJlIGFnYWluLiAgSWYgZGlzYWJsZWQsIFhlbiB3aWxsIG9ubHkKPiAtICAg
IHF1YXJhbnRpbmUgZGV2aWNlcyB0aGUgdG9vbHN0YWNrIGhhc3MgYXJyYW5nZWQgZm9yIGdldHRp
bmcgcXVhcmFudGluZWQuCj4gKyogICBUaGUgYHF1YXJhbnRpbmVgIG9wdGlvbiBjYW4gYmUgdXNl
ZCB0byBjb250cm9sIFhlbidzIGJlaGF2aW9yIHdoZW4KPiArICAgIGRlLWFzc2lnbmluZyBkZXZp
Y2VzIGZyb20gZ3Vlc3RzLiAgSWYgc2V0IHRvIHRydWUgKHRoZSBkZWZhdWx0KSwgWGVuCj4gKyAg
ICBhbHdheXMgcXVhcmFudGluZXMgc3VjaCBkZXZpY2VzOyB0aGV5IG11c3QgYmUgZXhwbGljaXRs
eSBhc3NpZ25lZCBiYWNrCj4gKyAgICB0byBEb20wIGJlZm9yZSB0aGV5IGNhbiBiZSB1c2VkIHRo
ZXJlIGFnYWluLiAgSWYgc2V0IHRvICJmdWxsIiwgc3RpbGwKPiArICAgIGFjdGl2ZSBETUEgd2ls
bCBhZGRpdGlvbmFsbHkgYmUgZGlyZWN0ZWQgdG8gYSAic2luayIgcGFnZS4KCkkgcmVhbGlzZSB0
aGlzIGlzIG9ubHkgaW4gdGhlIGRpZmYgY29udGV4dCwgYnV0IEknbSBub3Qgc3VyZSB3aGF0IHRo
ZSBmb2xsb3dpbmcgc2VudGVuY2UgYWN0dWFsbHkgbWVhbnM6Cgo+ICBJZiBzZXQgdG8KPiArICAg
IGZhbHNlLCBYZW4gd2lsbCBvbmx5IHF1YXJhbnRpbmUgZGV2aWNlcyB0aGUgdG9vbHN0YWNrIGhh
cyBhcnJhbmdlZCBmb3IKPiArICAgIGdldHRpbmcgcXVhcmFudGluZWQuCj4gKwoKU291bmRzIHRh
dXRvbG9naWNhbCB0byBtZS4KCj4gKyAgICBUaGlzIG9wdGlvbiBpcyBvbmx5IHZhbGlkIG9uIGJ1
aWxkcyBzdXBwb3J0aW5nIFBDSS4KPiAKPiAgKiAgIFRoZSBgc2hhcmVwdGAgYm9vbGVhbiBjb250
cm9scyB3aGV0aGVyIHRoZSBJT01NVSBwYWdldGFibGVzIGFyZSBzaGFyZWQKPiAgICAgIHdpdGgg
dGhlIENQVS1zaWRlIEhBUCBwYWdldGFibGVzLCBvciBhbGxvY2F0ZWQgc2VwYXJhdGVseS4gIFNo
YXJpbmcKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9LY29uZmlnCj4gKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvS2NvbmZpZwo+IEBAIC0yOCwzICsyOCwzMSBAQCBlbmRpZgo+
IAo+ICBjb25maWcgSU9NTVVfRk9SQ0VfUFRfU0hBUkUKPiAgCWJvb2wKPiArCj4gK2Nob2ljZQo+
ICsJcHJvbXB0ICJJT01NVSBkZXZpY2UgcXVhcmFudGluaW5nIGRlZmF1bHQgYmVoYXZpb3IiCj4g
KwlkZXBlbmRzIG9uIEhBU19QQ0kKPiArCWRlZmF1bHQgSU9NTVVfUVVBUkFOVElORV9CQVNJQwo+
ICsJLS0taGVscC0tLQo+ICsJICBXaGVuIGEgUENJIGRldmljZSBpcyBhc3NpZ25lZCB0byBhbiB1
bnRydXN0ZWQgZG9tYWluLCBpdCBpcyBwb3NzaWJsZQo+ICsJICBmb3IgdGhhdCBkb21haW4gdG8g
cHJvZ3JhbSB0aGUgZGV2aWNlIHRvIERNQSB0byBhbiBhcmJpdHJhcnkgYWRkcmVzcy4KPiArCSAg
VGhlIElPTU1VIGlzIHVzZWQgdG8gcHJvdGVjdCB0aGUgaG9zdCBmcm9tIG1hbGljaW91cyBETUEg
YnkgbWFraW5nCj4gKwkgIHN1cmUgdGhhdCB0aGUgZGV2aWNlIGFkZHJlc3NlcyBjYW4gb25seSB0
YXJnZXQgbWVtb3J5IGFzc2lnbmVkIHRvIHRoZQo+ICsJICBndWVzdC4gIEhvd2V2ZXIsIHdoZW4g
dGhlIGd1ZXN0IGRvbWFpbiBpcyB0b3JuIGRvd24sIGFzc2lnbmluZyB0aGUKPiArCSAgZGV2aWNl
IGJhY2sgdG8gdGhlIGhhcmR3YXJlIGRvbWFpbiB3b3VsZCBhbGxvdyBhbnkgaW4tZmxpZ2h0IERN
QSB0bwo+ICsJICBwb3RlbnRpYWxseSB0YXJnZXQgY3JpdGljYWwgaG9zdCBkYXRhLiAgVG8gYXZv
aWQgdGhpcywgcXVhcmFudGluaW5nCj4gKwkgIHNob2xkIGJlIGVuYWJsZWQuCgpJTU8gdGhlIGFi
b3ZlIHRleHQgaXMgYSBnb29kIHN1bW1hcnkgYW5kIGl0IHdvdWxkIGJlIHVzZWZ1bCBpdCB3ZXJl
IGR1cGxpY2F0ZWQgaW4gdGhlIGNvbW1hbmQgbGluZSBkb2N1bWVudGF0aW9uLgoKPiAgUXVhcmFu
dGluaW5nIGNhbiBiZSBkb25lIGluIHR3byB3YXlzOiBJbiBpdHMgYmFzaWMKPiArCSAgZm9ybSwg
YWxsIGluLWZsaWdodCBETUEgd2lsbCBzaW1wbHkgYmUgZm9yY2VkIHRvIGVuY291bnRlciBJT01N
VQo+ICsJICBmYXVsdHMuICBTaW5jZSB0aGVyZSBhcmUgc3lzdGVtcyB3aGVyZSBkb2luZyBzbyBj
YW4gY2F1c2UgaG9zdAo+ICsJICBsb2NrdXAsIGFuIGFsdGVybmF0aXZlIGZvcm0gaXMgYXZhaWxh
YmxlIHdoZXJlIHdyaXRlcyB0byBtZW1vcnkgd2lsbAo+ICsJICBiZSBtYWRlIGZhdWx0LCBidXQg
cmVhZHMgd2lsbCBiZSBkaXJlY3RlZCB0byBhIGR1bW15IHBhZ2UuICBUaGUKPiArCSAgaW1wbGlj
YXRpb24gaGVyZSBpcyB0aGF0IHN1Y2ggcmVhZHMgd2lsbCBnbyB1bm5vdGljZWQsIGkuZS4gYW4g
YWRtaW4KPiArCSAgbWF5IG5vdCBiZWNvbWUgYXdhcmUgb2YgdGhlIHVuZGVybHlpbmcgcHJvYmxl
bS4KPiArCj4gKwljb25maWcgSU9NTVVfUVVBUkFOVElORV9OT05FCj4gKwkJYm9vbCAibm9uZSIK
PiArCWNvbmZpZyBJT01NVV9RVUFSQU5USU5FX0JBU0lDCj4gKwkJYm9vbCAiYmFzaWMiCj4gKwlj
b25maWcgSU9NTVVfUVVBUkFOVElORV9GVUxMCj4gKwkJYm9vbCAiZnVsbCIKCidzY3JhdGNoX3Bh
Z2UnIHBlcmhhcHM/IFNlZW1zIGEgYml0IG1vcmUgc2VsZi1leHBsYW5hdG9yeS4KCj4gK2VuZGNo
b2ljZQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMK
PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCj4gQEAg
LTI1LDYgKzI1LDkgQEAKPiAgI2luY2x1ZGUgImlvbW11LmgiCj4gICNpbmNsdWRlICIuLi9hdHMu
aCIKPiAKPiArLyogZG9tX2lvIGlzIHVzZWQgYXMgYSBzZW50aW5lbCBmb3IgcXVhcmFudGluZWQg
ZGV2aWNlcyAqLwo+ICsjZGVmaW5lIFFVQVJBTlRJTkVfU0tJUChkKSAoKGQpID09IGRvbV9pbyAm
JiAhZG9tX2lvbW11KGQpLT5hcmNoLnJvb3RfdGFibGUpCj4gKwo+ICBzdGF0aWMgYm9vbF90IF9f
cmVhZF9tb3N0bHkgaW5pdF9kb25lOwo+IAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGlvbW11X2lu
aXRfb3BzIF9pb21tdV9pbml0X29wczsKPiBAQCAtODIsMTggKzg1LDM1IEBAIGludCBnZXRfZG1h
X3JlcXVlc3Rvcl9pZCh1aW50MTZfdCBzZWcsIHUKPiAgICAgIHJldHVybiByZXFfaWQ7Cj4gIH0K
PiAKPiAtc3RhdGljIHZvaWQgYW1kX2lvbW11X3NldHVwX2RvbWFpbl9kZXZpY2UoCj4gK3N0YXRp
YyBpbnQgX19tdXN0X2NoZWNrIGFsbG9jYXRlX2RvbWFpbl9yZXNvdXJjZXMoc3RydWN0IGRvbWFp
bl9pb21tdSAqaGQpCj4gK3sKPiArICAgIGludCByYzsKPiArCj4gKyAgICBzcGluX2xvY2soJmhk
LT5hcmNoLm1hcHBpbmdfbG9jayk7Cj4gKyAgICByYyA9IGFtZF9pb21tdV9hbGxvY19yb290KGhk
KTsKPiArICAgIHNwaW5fdW5sb2NrKCZoZC0+YXJjaC5tYXBwaW5nX2xvY2spOwo+ICsKPiArICAg
IHJldHVybiByYzsKPiArfQo+ICsKPiArc3RhdGljIGludCBfX211c3RfY2hlY2sgYW1kX2lvbW11
X3NldHVwX2RvbWFpbl9kZXZpY2UoCj4gICAgICBzdHJ1Y3QgZG9tYWluICpkb21haW4sIHN0cnVj
dCBhbWRfaW9tbXUgKmlvbW11LAo+ICAgICAgdWludDhfdCBkZXZmbiwgc3RydWN0IHBjaV9kZXYg
KnBkZXYpCj4gIHsKPiAgICAgIHN0cnVjdCBhbWRfaW9tbXVfZHRlICp0YWJsZSwgKmR0ZTsKPiAg
ICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gLSAgICBpbnQgcmVxX2lkLCB2YWxpZCA9IDE7Cj4g
KyAgICBpbnQgcmVxX2lkLCB2YWxpZCA9IDEsIHJjOwo+ICAgICAgdTggYnVzID0gcGRldi0+YnVz
Owo+IC0gICAgY29uc3Qgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZG9tYWlu
KTsKPiArICAgIHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11KGRvbWFpbik7Cj4g
Kwo+ICsgICAgaWYgKCBRVUFSQU5USU5FX1NLSVAoZG9tYWluKSApCj4gKyAgICAgICAgcmV0dXJu
IDA7Cj4gKwo+ICsgICAgQlVHX09OKCFoZC0+YXJjaC5wYWdpbmdfbW9kZSB8fCAhaW9tbXUtPmRl
dl90YWJsZS5idWZmZXIpOwo+IAo+IC0gICAgQlVHX09OKCAhaGQtPmFyY2gucm9vdF90YWJsZSB8
fCAhaGQtPmFyY2gucGFnaW5nX21vZGUgfHwKPiAtICAgICAgICAgICAgIWlvbW11LT5kZXZfdGFi
bGUuYnVmZmVyICk7Cj4gKyAgICByYyA9IGFsbG9jYXRlX2RvbWFpbl9yZXNvdXJjZXMoaGQpOwo+
ICsgICAgaWYgKCByYyApCj4gKyAgICAgICAgcmV0dXJuIHJjOwo+IAo+ICAgICAgaWYgKCBpb21t
dV9od2RvbV9wYXNzdGhyb3VnaCAmJiBpc19oYXJkd2FyZV9kb21haW4oZG9tYWluKSApCj4gICAg
ICAgICAgdmFsaWQgPSAwOwo+IEBAIC0xNDgsNiArMTY4LDggQEAgc3RhdGljIHZvaWQgYW1kX2lv
bW11X3NldHVwX2RvbWFpbl9kZXZpYwo+IAo+ICAgICAgICAgIGFtZF9pb21tdV9mbHVzaF9pb3Rs
YihkZXZmbiwgcGRldiwgSU5WX0lPTU1VX0FMTF9QQUdFU19BRERSRVNTLCAwKTsKPiAgICAgIH0K
PiArCj4gKyAgICByZXR1cm4gMDsKPiAgfQo+IAo+ICBpbnQgX19pbml0IGFjcGlfaXZyc19pbml0
KHZvaWQpCj4gQEAgLTIxNywxNyArMjM5LDYgQEAgaW50IGFtZF9pb21tdV9hbGxvY19yb290KHN0
cnVjdCBkb21haW5faQo+ICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAKPiAtc3RhdGljIGludCBfX211
c3RfY2hlY2sgYWxsb2NhdGVfZG9tYWluX3Jlc291cmNlcyhzdHJ1Y3QgZG9tYWluX2lvbW11ICpo
ZCkKPiAtewo+IC0gICAgaW50IHJjOwo+IC0KPiAtICAgIHNwaW5fbG9jaygmaGQtPmFyY2gubWFw
cGluZ19sb2NrKTsKPiAtICAgIHJjID0gYW1kX2lvbW11X2FsbG9jX3Jvb3QoaGQpOwo+IC0gICAg
c3Bpbl91bmxvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7Cj4gLQo+IC0gICAgcmV0dXJuIHJj
Owo+IC19Cj4gLQo+ICBpbnQgYW1kX2lvbW11X2dldF9wYWdpbmdfbW9kZSh1bnNpZ25lZCBsb25n
IGVudHJpZXMpCj4gIHsKPiAgICAgIGludCBsZXZlbCA9IDE7Cj4gQEAgLTI5MSw2ICszMDIsOSBA
QCBzdGF0aWMgdm9pZCBhbWRfaW9tbXVfZGlzYWJsZV9kb21haW5fZGV2Cj4gICAgICBpbnQgcmVx
X2lkOwo+ICAgICAgdTggYnVzID0gcGRldi0+YnVzOwo+IAo+ICsgICAgaWYgKCBRVUFSQU5USU5F
X1NLSVAoZG9tYWluKSApCj4gKyAgICAgICAgcmV0dXJuOwo+ICsKPiAgICAgIEJVR19PTiAoIGlv
bW11LT5kZXZfdGFibGUuYnVmZmVyID09IE5VTEwgKTsKPiAgICAgIHJlcV9pZCA9IGdldF9kbWFf
cmVxdWVzdG9yX2lkKGlvbW11LT5zZWcsIFBDSV9CREYyKGJ1cywgZGV2Zm4pKTsKPiAgICAgIHRh
YmxlID0gaW9tbXUtPmRldl90YWJsZS5idWZmZXI7Cj4gQEAgLTMzNyw3ICszNTEsNiBAQCBzdGF0
aWMgaW50IHJlYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluCj4gIHsKPiAgICAgIHN0cnVjdCBh
bWRfaW9tbXUgKmlvbW11Owo+ICAgICAgaW50IGJkZiwgcmM7Cj4gLSAgICBzdHJ1Y3QgZG9tYWlu
X2lvbW11ICp0ID0gZG9tX2lvbW11KHRhcmdldCk7Cj4gCj4gICAgICBiZGYgPSBQQ0lfQkRGMihw
ZGV2LT5idXMsIHBkZXYtPmRldmZuKTsKPiAgICAgIGlvbW11ID0gZmluZF9pb21tdV9mb3JfZGV2
aWNlKHBkZXYtPnNlZywgYmRmKTsKPiBAQCAtMzU4LDExICszNzEsMTAgQEAgc3RhdGljIGludCBy
ZWFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbgo+ICAgICAgICAgIHBkZXYtPmRvbWFpbiA9IHRh
cmdldDsKPiAgICAgIH0KPiAKPiAtICAgIHJjID0gYWxsb2NhdGVfZG9tYWluX3Jlc291cmNlcyh0
KTsKPiArICAgIHJjID0gYW1kX2lvbW11X3NldHVwX2RvbWFpbl9kZXZpY2UodGFyZ2V0LCBpb21t
dSwgZGV2Zm4sIHBkZXYpOwo+ICAgICAgaWYgKCByYyApCj4gICAgICAgICAgcmV0dXJuIHJjOwo+
IAo+IC0gICAgYW1kX2lvbW11X3NldHVwX2RvbWFpbl9kZXZpY2UodGFyZ2V0LCBpb21tdSwgZGV2
Zm4sIHBkZXYpOwo+ICAgICAgQU1EX0lPTU1VX0RFQlVHKCJSZS1hc3NpZ24gJTA0eDolMDJ4OiUw
MnguJXUgZnJvbSBkb20lZCB0byBkb20lZFxuIiwKPiAgICAgICAgICAgICAgICAgICAgICBwZGV2
LT5zZWcsIHBkZXYtPmJ1cywgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZmbiksCj4gICAg
ICAgICAgICAgICAgICAgICAgc291cmNlLT5kb21haW5faWQsIHRhcmdldC0+ZG9tYWluX2lkKTsK
PiBAQCAtNTE5LDggKzUzMSw3IEBAIHN0YXRpYyBpbnQgYW1kX2lvbW11X2FkZF9kZXZpY2UodTgg
ZGV2Zm4KPiAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpb21tdS0+bG9jaywgZmxh
Z3MpOwo+ICAgICAgfQo+IAo+IC0gICAgYW1kX2lvbW11X3NldHVwX2RvbWFpbl9kZXZpY2UocGRl
di0+ZG9tYWluLCBpb21tdSwgZGV2Zm4sIHBkZXYpOwo+IC0gICAgcmV0dXJuIDA7Cj4gKyAgICBy
ZXR1cm4gYW1kX2lvbW11X3NldHVwX2RvbWFpbl9kZXZpY2UocGRldi0+ZG9tYWluLCBpb21tdSwg
ZGV2Zm4sIHBkZXYpOwo+ICB9Cj4gCj4gIHN0YXRpYyBpbnQgYW1kX2lvbW11X3JlbW92ZV9kZXZp
Y2UodTggZGV2Zm4sIHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2lvbW11LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5j
Cj4gQEAgLTMxLDkgKzMxLDI0IEBAIGJvb2xfdCBfX2luaXRkYXRhIGlvbW11X2VuYWJsZSA9IDE7
Cj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2VuYWJsZWQ7Cj4gIGJvb2xfdCBfX3JlYWRf
bW9zdGx5IGZvcmNlX2lvbW11Owo+ICBib29sX3QgX19yZWFkX21vc3RseSBpb21tdV92ZXJib3Nl
Owo+IC1ib29sIF9fcmVhZF9tb3N0bHkgaW9tbXVfcXVhcmFudGluZSA9IHRydWU7Cj4gIGJvb2xf
dCBfX3JlYWRfbW9zdGx5IGlvbW11X2NyYXNoX2Rpc2FibGU7Cj4gCj4gKyNkZWZpbmUgSU9NTVVf
cXVhcmFudGluZV9ub25lICAgICAgICAwIC8qIGFrYSBmYWxzZSAqLwo+ICsjZGVmaW5lIElPTU1V
X3F1YXJhbnRpbmVfZmF1bHQgICAgICAgMSAvKiBha2EgdHJ1ZSAqLwo+ICsjZGVmaW5lIElPTU1V
X3F1YXJhbnRpbmVfd3JpdGVfZmF1bHQgMgoKZW51bSBmb3IgdGhlIGFib3ZlIHBlcmhhcHM/Cgog
IFBhdWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
