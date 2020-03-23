Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D15F818F3E0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 12:46:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGLV7-0007jl-8p; Mon, 23 Mar 2020 11:44:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Oxe4=5I=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jGLV5-0007jg-3b
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 11:44:11 +0000
X-Inumbo-ID: 9bff3a6c-6cfb-11ea-a6c1-bc764e2007e4
Received: from mail-ed1-x52d.google.com (unknown [2a00:1450:4864:20::52d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bff3a6c-6cfb-11ea-a6c1-bc764e2007e4;
 Mon, 23 Mar 2020 11:44:10 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w26so9466408edu.7
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2020 04:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=dR7nKr6tcfKbOT1v0oah0kXoQpSwBD9v6wUT2A7EqoE=;
 b=An0gYgPNRja0lWCpvITrK9gz+j9tV9yq2YHgAeKn3ntxf59+1Z4m73re00ai5fdv8i
 I0HvOBdIiK4LwOZ59Mxq9VDHei8lQe+ASEciQqcc2pY0NgNg35HzRwLSIzmrvPPhMgmw
 QzUlEZkklWYl1XKoC9c4qYRLa5fxJkbHnAg0dw35Gt/cFK6ML9pHnFJx0p6M6EJAzRze
 JL+1Lut3umeP6mNqSH8s2kyn0+hbK7EPCC/OUNkYAOLBdkBp5EncMw2mQfkRJUPvizUA
 Qo/1cUNzpwwiSwXnFMoFGMyprHcq8iaMRdkmyB7Q/L7cA0Uf7/ZuuTYgl30YEgdPO3xd
 JVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=dR7nKr6tcfKbOT1v0oah0kXoQpSwBD9v6wUT2A7EqoE=;
 b=jCOVCfjkyVqJxrxtdBtLJiBkZPXp3RhAcenWMqs5KV6jDx5hftuhmI4BWgtgiI0sWh
 n2N1EJp1K2xlHi361se6VCGEb9Hqx2jVHBM4X0c7CasQpIanU7048OAJbew7pFuSXeBP
 GJJaIH7cNwpVDJgn1CPG3eYN5qBzE9rQm1t52WlrO7DeuAwkgsViUgE+KjqjWOVOEvc3
 KZiFqb3v3MH4Sj12t+rcrN3bnYqpMFQJ+XHatkWZotmK56Je4Y/IcE/SUXCxLJdJPPiE
 ncat2h8JTHzDze/OIqWCcuyef79BR34MfTV69dPOU8gmMXW7NMhJdiP5avdTcCJwMr/G
 OVCA==
X-Gm-Message-State: ANhLgQ19TjcYZOGPziInwvAOGT0AmOCCk7PnaFESI2oQYx2lNrB4em9U
 nY8B5mHhwNNfiRijqYYTel0=
X-Google-Smtp-Source: ADFU+vvdvOeDMM0gvCAiZ7aviTQaQ0RZk7f45WTc8qZUxpXW+yuq6qnFQP1euHCtowSQh5K03sI7QA==
X-Received: by 2002:a05:6402:174f:: with SMTP id
 v15mr2017844edx.263.1584963849510; 
 Mon, 23 Mar 2020 04:44:09 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id d4sm1082366edt.28.2020.03.23.04.44.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Mar 2020 04:44:09 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200318111144.12894-1-paul@xen.org>
 <20200318111144.12894-2-paul@xen.org>
 <c63bdb0d-9c5e-9a96-258a-25a3c41cb52f@xen.org>
In-Reply-To: <c63bdb0d-9c5e-9a96-258a-25a3c41cb52f@xen.org>
Date: Mon, 23 Mar 2020 11:44:07 -0000
Message-ID: <004d01d60108$5d3db6a0$17b923e0$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQC4fw12P/uBGX56H9T++QlB5ROlFwHhkcO4Ah0ai6CqcR0EkA==
Subject: Re: [Xen-devel] [PATCH v7 1/2] docs/designs: Add a design document
 for non-cooperative live migration
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+Cj4gU2VudDogMjMgTWFyY2ggMjAyMCAxMDo0Nwo+IFRvOiBQYXVsIER1cnJhbnQg
PHBhdWxAeGVuLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBQYXVs
IER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcAo+IDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJp
eC5jb20+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IEphbiBCZXVs
aWNoCj4gPGpiZXVsaWNoQHN1c2UuY29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQu
d2lsa0BvcmFjbGUuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pCj4gPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjcgMS8y
XSBkb2NzL2Rlc2lnbnM6IEFkZCBhIGRlc2lnbiBkb2N1bWVudCBmb3Igbm9uLWNvb3BlcmF0aXZl
IGxpdmUgbWlncmF0aW9uCj4gCj4gSGksCj4gCj4gT24gMTgvMDMvMjAyMCAxMToxMSwgUGF1bCBE
dXJyYW50IHdyb3RlOgo+ID4gRnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29t
Pgo+ID4KPiA+IEl0IGhhcyBiZWNvbWUgYXBwYXJlbnQgdG8gc29tZSBsYXJnZSBjbG91ZCBwcm92
aWRlcnMgdGhhdCB0aGUgY3VycmVudAo+ID4gbW9kZWwgb2YgY29vcGVyYXRpdmUgbWlncmF0aW9u
IG9mIGd1ZXN0cyB1bmRlciBYZW4gaXMgbm90IHVzYWJsZSBhcyBpdAo+ID4gcmVsaWVzIG9uIHNv
ZnR3YXJlIHJ1bm5pbmcgaW5zaWRlIHRoZSBndWVzdCwgd2hpY2ggaXMgbGlrZWx5IGJleW9uZCB0
aGUKPiA+IHByb3ZpZGVyJ3MgY29udHJvbC4KPiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIHBy
b3Bvc2FsIGZvciBub24tY29vcGVyYXRpdmUgbGl2ZSBtaWdyYXRpb24sCj4gPiBkZXNpZ25lZCBu
b3QgdG8gcmVseSBvbiBhbnkgZ3Vlc3Qtc2lkZSBzb2Z0d2FyZS4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KPiA+IC0tLQo+ID4gQ2M6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPiBDYzogR2VvcmdlIER1bmxhcCA8
R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+ID4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgo+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KPiA+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+ID4gQ2M6IEtvbnJhZCBS
emVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiA+IENjOiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gPiBDYzogV2VpIExpdSA8d2xAeGVu
Lm9yZz4KPiAKPiBNeSBjb21tZW50cyBvbiB2NiBbMV0gZG9uJ3Qgc2VlbSB0byBiZSBhZGRyZXNz
ZWQgb3IgZXhwbGFpbmVkIHdoeSB0aGV5Cj4gd2VyZSBub3QgYWRkcmVzc2VkLiBDYW4geW91IGhh
dmUgYSBsb29rPwo+IAo+IENoZWVycywKPiAKPiBbMV0gPDE3ZWI4YjVlLTE0MTktM2E3Yi1mNzk2
LWQwMTRmOTM3ZWRkYUB4ZW4ub3JnPgoKV2VpcmQuIEkgdGhvdWdodCBJJ2QgZml4ZWQgdGhvc2Uu
IEkgdGhpbmsgSSBtdXN0IGhhdmUgbG9zdCBzb21lIGNoYW5nZXMgYWxvbmcgdGhlIHdheS4gSSds
bCBmaXggYW5kIHJlc2VuZC4KCiAgUGF1bAoKPiAKPiAtLQo+IEp1bGllbiBHcmFsbAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
