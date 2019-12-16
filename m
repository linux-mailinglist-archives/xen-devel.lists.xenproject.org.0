Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD451209FA
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 16:44:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igsVF-00057r-Ay; Mon, 16 Dec 2019 15:41:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DHV3=2G=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1igsVD-00057m-QH
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 15:41:43 +0000
X-Inumbo-ID: 8a652588-201a-11ea-b6f1-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8a652588-201a-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576510894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cu162pOTWU5yRvxVUJyOyppXqvklmFV84tiKSaDKRvg=;
 b=aY5986CqFe8rVaHQxT85AbjqS5rU8RixRoauc/D5ooV1EAdrlKmrfxcD1DdTUS55DoDSSl
 u42rPkC09UbGQipKpbKIEP5VeqZ5NBEZS0ndDw4lcD++EIwaM55eMELKZW2WEp8Fmr8Q2Z
 dMddsfv+7k9EWmspyGW1KGfzV85pqck=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-kNI3mzbjPtCOF654PIr9zQ-1; Mon, 16 Dec 2019 10:41:31 -0500
Received: by mail-wm1-f71.google.com with SMTP id o24so1182119wmh.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 07:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oeIc59QSTUoM+WKt9UthuhNY2ejH+cHhDJxHGyG7QBo=;
 b=LpwuedAmBsWpPijdN5IBBNAW2N8wYinTHkpknseVmfFVhpKI0fCveOIx6Z2aH5L5Zq
 C/lABPGG7cE2na81Ugn/0wTVha/3Xq6k5do+j2MLOPHU/HoF0Rq+M9QJoglgQaGT7SzT
 n/fIrjNYQMHDCXPJOrYfmZCN8Q5ueAwfiR7LUUyWRxg8RVnC/Zbt1z6Ncv4Srlzj4F5r
 NXi0D/x2Jx3AwjQROwjL79f42UFWiKp7pJa5lkAYncKMrbgN2DYMuuFmWozGXoLRvoDg
 jbs8LGz86bHdJKAe49IbAJrKRpwllgg1iD5/ddCtoOK1vZBcBNX1BiexbztKOcSIRSlB
 pYdA==
X-Gm-Message-State: APjAAAV3I8ZvOVbRn7aBZEKgCSVU4srfbs56AmaIA0ferlVmQq3Tanm0
 XeyNP3545Px67jLdWz0LUKgfprdhz6A0gyEiyarA+92S9W/kqaw8+zE4XtgblDT0Jne31ubO+hw
 nKrA2oB2tkcEJDN2ek8QrcEjyrAY=
X-Received: by 2002:adf:ea42:: with SMTP id j2mr31125217wrn.270.1576510890028; 
 Mon, 16 Dec 2019 07:41:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqypDXszAwMOZCzf4Ez0io31KjZBaZhfECz0yOnY8MQ2T2JBsgh1CjxeGSVWMrX9dHTIjFOC2w==
X-Received: by 2002:adf:ea42:: with SMTP id j2mr31125154wrn.270.1576510889523; 
 Mon, 16 Dec 2019 07:41:29 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:cde8:2463:95a9:1d81?
 ([2001:b07:6468:f312:cde8:2463:95a9:1d81])
 by smtp.gmail.com with ESMTPSA id d10sm21967922wrw.64.2019.12.16.07.41.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 07:41:28 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20191213161753.8051-1-philmd@redhat.com>
 <20191213161753.8051-13-philmd@redhat.com>
 <d9792ff4-bada-fbb9-301d-aeb19826235c@redhat.com>
 <20191215045812-mutt-send-email-mst@kernel.org>
 <0d15c735-73b4-7875-ec0f-8c181508f0d4@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <90d54a3b-ae96-43ac-0f8e-268c1257f7d0@redhat.com>
Date: Mon, 16 Dec 2019 16:41:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <0d15c735-73b4-7875-ec0f-8c181508f0d4@redhat.com>
Content-Language: en-US
X-MC-Unique: kNI3mzbjPtCOF654PIr9zQ-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH 12/12] hw/i386/pc: Move PC-machine specific
 declarations to 'pc_internal.h'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMTIvMTkgMTY6MzcsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IE9uIDEy
LzE1LzE5IDEwOjU4IEFNLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+IE9uIEZyaSwgRGVj
IDEzLCAyMDE5IGF0IDA1OjQ3OjI4UE0gKzAxMDAsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdy
b3RlOgo+Pj4gT24gMTIvMTMvMTkgNToxNyBQTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3Jv
dGU6Cj4+Pj4gSGlzdG9yaWNhbGx5LCBRRU1VIHN0YXJ0ZWQgd2l0aCBvbmx5IG9uZSBYODYgbWFj
aGluZTogdGhlIFBDLgo+Pj4+IFRoZSAnaHcvaTM4Ni9wYy5oJyBoZWFkZXIgd2FzIHVzZWQgdG8g
c3RvcmUgYWxsIFg4NiBhbmQgUEMKPj4+PiBkZWNsYXJhdGlvbnMuIFNpbmNlIHdlIGhhdmUgbm93
IG11bHRpcGxlIG1hY2hpbmVzIGJhc2VkIG9uIHRoZQo+Pj4+IFg4NiBhcmNoaXRlY3R1cmUsIG1v
dmUgdGhlIFBDLXNwZWNpZmljIGRlY2xhcmF0aW9ucyBpbiBhIG5ldwo+Pj4+IGhlYWRlci4KPj4+
PiBXZSB1c2UgJ2ludGVybmFsJyBpbiB0aGUgbmFtZSB0byBleHBsaWNpdCB0aGlzIGhlYWRlciBp
cyByZXN0cmljdGVkCj4+Pj4gdG8gdGhlIFg4NiBhcmNoaXRlY3R1cmUuIE90aGVyIGFyY2hpdGVj
dHVyZSBjYW4gbm90IGFjY2VzcyBpdC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPj4+PiAtLS0KPj4+PiBNYXliZSBu
YW1lIGl0ICdwY19tYWNoaW5lLmgnPwo+Pj4KPj4+IEkgZm9yZ290IHRvIGRlc2NyaWJlIGhlcmUg
KGFuZCBpbiB0aGUgY292ZXIpLCB3aGF0J3MgZm9sbG93IGFmdGVyIHRoaXMKPj4+IHBhdGNoLgo+
Pj4KPj4+IFBhdGNoICMxMyBtb3ZlcyBQQ01hY2hpbmVDbGFzcyB0bwo+Pj4KPj4+IElmIHlvdSBp
Z25vcmUgUENNYWNoaW5lU3RhdGUsICJody9pMzg2L3BjLmgiIG5vdyBvbmx5IGNvbnRhaW5zIDc2
Cj4+PiBsaW5lcywgYW5kCj4+PiBpdCBpcyBlYXNpZXIgdG8gc2VlIHdoYXQgaXMgUEMgbWFjaGlu
ZSBzcGVjaWZpYywgd2hhdCBpcyBYODYKPj4+IHNwZWNpZmljLCBhbmQKPj4+IHdoYXQgaXMgZGV2
aWNlIGdlbmVyaWMgKG5vdCBYODYgcmVsYXRlZCBhdCBhbGwpOgo+Pj4KPj4+IC0gR1NJIGlzIGNv
bW1vbiB0byBYODYgKFBhb2xvIHNlbnQgWzNdLCBbNl0pCj4+PiAtIElPQVBJQyBpcyBjb21tb24g
dG8gWDg2Cj4+PiAtIGk4MjU5IGlzIG11bHRpYXJjaCAoUGFvbG8gWzJdKQo+Pj4gLSBQQ0lfSE9T
VCBkZWZpbml0aW9ucyBhbmQgcGNfcGNpX2hvbGU2NF9zdGFydCgpIGFyZSBYODYKPj4+IC0gcGNf
bWFjaGluZV9pc19zbW1fZW5hYmxlZCgpIGlzIFg4NiAoUGFvbG8gc2VudCBbNV0pCj4+PiAtIGhw
ZXQKPj4+IC0gdHNjIChQYW9sbyBzZW50IFszXSkKPj4+IC0gMyBtb3JlIGZ1bmN0aW9ucwo+Pj4K
Pj4+IFNvIHdlIGNhbiBtb3ZlIGhhbGYgb2YgdGhpcyBmaWxlIHRvICJwY19pbnRlcm5hbC5oIiBh
bmQgdGhlIG90aGVyIHRvCj4+Pgo+Pj4gT25lIHByb2JsZW0gaXMgdGhlIFEzNSBNQ0ggbm9ydGgg
YnJpZGdlIHdoaWNoIGRpcmVjdGx5IHNldHMgdGhlIFBDSQo+Pj4gUENNYWNoaW5lU3RhdGUtPmJ1
cyBpbiBxMzVfaG9zdF9yZWFsaXplKCkuIFRoaXMgc2VlbXMgYSBRT00gdmlvbGF0aW9uCj4+PiBh
bmQgaXMKPj4+IHByb2JhYmx5IGVhc2lseSBmaXhhYmxlLgo+Pj4KPj4+IE1heWJlIEkgY2FuIGFw
cGx5IFBhb2xvJ3MgcGF0Y2hlcyBpbnN0ZWFkIG9mIHRoaXMgIzEyLCBtb3ZlIFg4Ni1nZW5lcmlj
Cj4+PiBkZWNsYXJhdGlvbnMgdG8gImh3L2kzODYveDg2LmgiLCBhbmQgZGlyZWN0bHkgZ2l0LW1v
dmUgd2hhdCdzIGxlZnQgb2YKPj4+ICJody9pMzg2L3BjLmgiIHRvICJwY19pbnRlcm5hbC5oIi4K
Pj4KPj4gWWVhIHRoYXQgc291bmRzIGEgYml0IGJldHRlci4KPiAKPiBPSywgSSdsbCB3YWl0IGZv
ciBQYW9sbydzIG5leHQgcHVsbCBnZXQgaW4sIHRoZW4gY29udGludWUgYmFzZWQgb24gdGhhdCwK
PiBpbmNsdWRpbmcgUGFvbG8ncyAieDg2OiBhbGxvdyBidWlsZGluZyB3aXRob3V0IFBDIG1hY2hp
bmUgdHlwZXMiIHNlcmllcy4KPiAKPiAoVGhhbmtzIFBhb2xvIGZvciBwaWNraW5nIG1vc3Qgb2Yg
dGhpcyBzZXJpZXMhKQoKRldJVyBJIGRvbid0IHRoaW5rIGt2bV9pODI1OV9pbml0IHNob3VsZCBi
ZSBpbiBzeXNlbXUva3ZtLmgsIHNpbmNlIGl0J3MKeDg2LXNwZWNpZmljIGFuZCB0aGF0IHdvdWxk
IGJlIHNvbWV0aGluZyBsaWtlIHRoZSBzYW1lIG1pc3Rha2UgYWxyZWFkeQpkb25lIHdpdGggaHcv
aTM4Ni9wYy5oLgoKUGFvbG8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
