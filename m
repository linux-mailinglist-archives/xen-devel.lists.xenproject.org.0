Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA149035E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 15:45:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hycVV-0003Jr-HZ; Fri, 16 Aug 2019 13:43:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k3c/=WM=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hycVT-0003Jm-TG
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 13:43:03 +0000
X-Inumbo-ID: c4ac5e40-c02b-11e9-a661-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4ac5e40-c02b-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 13:43:03 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o4so4091317wmh.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2019 06:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=CJAZZSYcInP/tC4wRdyc8rrzpiKo67Sv8KZZrPMRAOY=;
 b=kpVWFKc4Q4MB/WUlnMc5B5C5zE5sti0ebnk7uy97LSvUkEwHpdAURcKHXpZBs0V8bM
 42BAnatn4yjdTQVwHk+L9+2kDHGT4FS4aNLS+lJaTq2+01eyt/lzOoRuHK9l8wrSepT+
 eX1Tx1zstWGLh3aVCoEiIxdKymaea/HeE9O0zKi0arZVKhuuHujsVG6OCNdDXTFZ4DOE
 4l0450FQEc5MC8/743g2F+VxHUSIzav0EXcV1e1OeuiMKkGo5Pxvo6CGlmKvKSk2xsxF
 cMIaJZW+g5P/WM/pIkrUA4K242seJtoTL3y+m1DXgaFB2o/+C9R9ab3v+aWSXh+zB39p
 EveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=CJAZZSYcInP/tC4wRdyc8rrzpiKo67Sv8KZZrPMRAOY=;
 b=eYCt+dmaywcSU8CwQjadaK2D1Ui3VSvfZcUoUA7cD+RWlSRBZJO3N5NpEFeOOras1w
 PU1Pp98CaEl3EjBp8aZABEGo918kqLREnwZ3xpZSXBHiUMKRdQ86AKlZS5u3lFltP3BP
 j/xUyOd/nqnJt/l1ANfkHyHp52l8q8Z9EdHb/HU7DFjQW5T+jzQKh9S1gxChgl+7NfHJ
 npvyuZ7PPaOK3WgBas495DEpt3ORF79PkPr8wFCVuVKewN3stIbYfouBJSLQQoNYOMYf
 K8iGQcC56/TKekmnwfF3CzUfBBS5A+hYdcDpM6FsaHB9rnahbeazjefDosExKyh0PBz8
 AVuw==
X-Gm-Message-State: APjAAAWpAcs2YqDMqGHYIxFdeOV68O/Ze0a4tFumvrPNcsvK9QtDaf2H
 seTzs78MyNIV3fcmgzPr0Qk=
X-Google-Smtp-Source: APXvYqz67F577lK+5lOiuNYCe6QAgDJ+KapNiZuBeVvd0p55Hd3UQ05h0lAaAT8Uog9wqV9NL0XRew==
X-Received: by 2002:a1c:a7c9:: with SMTP id q192mr7281973wme.144.1565962981781; 
 Fri, 16 Aug 2019 06:43:01 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:95b5:2b76:628e:9d6e?
 ([2a02:c7f:ac18:da00:95b5:2b76:628e:9d6e])
 by smtp.gmail.com with ESMTPSA id t19sm4581175wmi.29.2019.08.16.06.43.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 06:43:00 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
In-Reply-To: <2b87bf90-2e11-298f-201d-a185bd92e74a@arm.com>
Date: Fri, 16 Aug 2019 14:43:00 +0100
Message-Id: <E8C5FE89-7C12-4073-9537-9D6773D7646B@xenproject.org>
References: <20190815172256.34363-1-lars.kurth@citrix.com>
 <348ae310-a048-0e96-dc12-981f96450a5f@arm.com>
 <E16EC776-8DAC-439A-9FF9-E5DF1F18206B@citrix.com>
 <2b87bf90-2e11-298f-201d-a185bd92e74a@arm.com>
To: Julien Grall <julien.grall@arm.com>
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [Xen-devel] [PATCH v2] Allow get_maintainer.pl /
 add_maintainers.pl scripts to be called outside of xen.git
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE2IEF1ZyAyMDE5LCBhdCAxNDoyOCwgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4gd3JvdGU6Cj4gCj4gCj4gCj4gT24gMTYvMDgvMjAxOSAxMzoxNywgTGFycyBLdXJ0
aCB3cm90ZToKPj4g77u/T24gMTYvMDgvMjAxOSwgMTE6MDEsICJKdWxpZW4gR3JhbGwiIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+ICAgICAgRnJvbSBteSB1bmRlcnN0YW5kaW5nLCBh
bnkgdXNlIG9uIG1pbmktb3MuZ2l0ICYgY28gd2lsbCBiZSBsZWdpdGltYXRlLiBIb3dldmVyLAo+
PiAgICAgd2Ugc3RpbGwgcHJpbnQgdGhlIFdBUk5JTkcgaW4gdGhvc2UgY2FzZXMuCj4+ICAgICAg
ICAgIFVzdWFsbHkgV0FSTklORyBtZWFucyBzb21ldGhpbmcgbmVlZHMgYXR0ZW50aW9uLiBBcyBt
b3N0IG9mIHRoZSB1c2VycyB3aWxsCj4+ICAgICBsaWtlbHkgY29weS9wYXN0ZSBmcm9tIHRoZSB3
aWtpLCB3ZSBhcmUgZ29pbmcgdG8gaGF2ZSByZXBvcnQgYXNraW5nIHdoeSB0aGUKPj4gICAgIFdB
Uk5JTkcgaXMgdGhlcmUuCj4+ICAgICAgICAgIEkgdGhpbmsgaXQgd291bGQgbWFrZSBzZW5zZSB0
byB0cnkgdG8gZG93bmdyYWRlIHRoZSBtZXNzYWdlIGEgYml0IHdoZW4gcG9zc2libGUuCj4+ICAg
ICBGb3IgaW5zdGFuY2UsIHdlIGNvdWxkIGNoZWNrIGlmIHRoZSBzZWN0aW9uICJUSEUgUkVTVCIg
aXMgcHJlc2VudCBpbiB0aGUgZmlsZQo+PiAgICAgTUFJTlRBSU5FUlMuIElmIG5vdCwgdGhpcyBp
cyBsaWtlbHkgbm90IGEgZmlsZSB3ZSBhcmUgYWJsZSB0byBzdXBwb3J0Lgo+PiAgICAgSSB0aG91
Z2h0IGFib3V0IHRoaXMgYW5kIGl0IGlzIG5vdCBhcyBlYXN5IGFzIGl0IHNlZW1zLCBiZWNhdXNl
IHRoZSBzY3JpcHQgb25seSBwYXJzZXMKPj4gTTogLi4uICZjIGxpbmVzCj4gCj4gVGhlIHNjcmlw
dCBpcyBhYmxlIHRvIHBhcnNlIHRoZSBzZWN0aW9uIG5hbWUuIFNlZSBnZXRfbWFpbnRhaW5lcl9y
b2xlKCkuCj4gCj4gQWx0aG91Z2gsIEkgYW0gbm90IHN1cmUgaG93IGVhcmx5IHRoZSBmdW5jdGlv
biBjYW4gZ2V0IGNhbGxlZC4KPiAKPiBCdXQuLi4KClRoYXQgbWF5IG1ha2UgaXQgZmVhc2libGUg
dG8gZ28gZG93biB0aGF0IHJvdXRlLgpJbmNpZGVudGlhbGx5IGJvdGggTGludXggYXMgd2VsbCBh
cyBRRU1VIE1BSU5UQUlORVJzIGZpbGVzIHVzZSB0aGUgc2FtZSBzeW50YXgKYXMgdXMgKHdpdGgg
YSBmZXcgZXh0cmEgdGFncyB3aGljaCB3ZSBkb24ndCBoYXZlKQoKTm90IHN1cmUgd2hldGhlciB0
aGlzIHdvdWxkIGJlIGEgcHJvYmxlbQoKPj4gTWF5YmUgdGhlIGJlc3Qgd2F5IHRvIGFkZHJlc3Mg
dGhpcyB3b3VsZCBiZSB0byBpbmNsdWRlIHNvbWUgaWRlbnRpZmllciBpbnRvIHRoZQo+PiBNQUlO
VEFJTkVSUyBmaWxlIChhZnRlciB0aGUgaGVhZGVyIHdpdGggYWxsIHRoZSBkZWZpbml0aW9ucyku
Cj4+IEZPUk1BVDogeGVuLXByb2plY3QtbWFpbnRhaW5lcnMgPHZlcnNpb24+Cj4+IChub3RlIHRo
YXQgdGhpcyBpcyBub3QgY3VycmVudGx5IHBpY2tlZCB1cCBieSB0aGUgdG9vbCkKPj4gT3IKPj4g
VjogeGVuLXByb2plY3QtbWFpbnRhaW5lcnMgPHZlcnNpb24+Cj4+IChub3RlIHRoYXQgdGhpcyB3
b3VsZCBiZSBwaWNrZWQgdXAgYnkgdGhlIHRvb2wpCj4gCj4gQW55IG9mIHRoZXNlIHNvbHV0aW9u
cyBhcmUgYWxzbyBhIHBvdGVudGlhbCBhbHRlcm5hdGl2ZS4KCkkgd2lsbCBzZWUgd2hhdCBvdGhl
cnMgdGhpbmsgYW5kIHRha2UgaXQgZnJvbSB0aGVyZQoKTGFycwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
