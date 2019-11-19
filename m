Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B94102CFD
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 20:48:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX9Rz-0004HK-RC; Tue, 19 Nov 2019 19:46:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y//c=ZL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iX9Ry-0004HF-LM
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 19:46:10 +0000
X-Inumbo-ID: 39b255af-0b05-11ea-a302-12813bfff9fa
Received: from mail-lf1-f67.google.com (unknown [209.85.167.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39b255af-0b05-11ea-a302-12813bfff9fa;
 Tue, 19 Nov 2019 19:46:06 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id n186so5673283lfd.11
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2019 11:46:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ofy4A7aaB5rnXLcfHhUQAZIsZb+X5j5cOcMrPec9pA0=;
 b=Ls/9ra5DCZa+NacJ3kBwKHbXL7ETrG4Rm/IgKSBbQ4+WaePd6azk5xCf15AuGwFlwD
 ORaEehMRbjw+JRYseNHHqbJ8q55DCj7Y1QUUV0PbhFQ4GUna4MspQ1J2MzCfd4ZoRWHo
 GXUahZ+7y9wCNCII1Px6dFEMZKQPga83K4LQQFN+ZS0DsCwHtwUyAk+fUnRH/dIs+7VI
 jwLKPGlotss5nyqHc4sjmXXB5oUTPg8YP7pUBdQFI/WwuXTBxWFwfUhvsKfnqGMMe4FP
 S/lJKimn+nuqtrgeQTSFUDW3gVW7aXlf+WcbGruzNHpRROfwMlBljrJCaV5mOcrYv6ho
 LKYQ==
X-Gm-Message-State: APjAAAXzFzf1yhCd8uAX4b7UKk5dqNrpkHHTgTdtvYUC20nqCZoM1Qx5
 AOE31eSkQ5T/K5rpHAGdonn6NqKi38M=
X-Google-Smtp-Source: APXvYqwIFAFZlN6nzuLgPT/EfLycN1TJ1QGf5sxKxo9ket6GxI1qo/hQYVMUfhN2y1BZX2aBeBzS3g==
X-Received: by 2002:a19:5f44:: with SMTP id a4mr5163743lfj.45.1574192765516;
 Tue, 19 Nov 2019 11:46:05 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171])
 by smtp.gmail.com with ESMTPSA id z3sm12078650lji.36.2019.11.19.11.46.04
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 11:46:05 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id m4so19804113ljj.8
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2019 11:46:04 -0800 (PST)
X-Received: by 2002:a2e:91c7:: with SMTP id u7mr4956935ljg.249.1574192764688; 
 Tue, 19 Nov 2019 11:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20191029175720.7354-1-ian.jackson@eu.citrix.com>
 <bbcb318a-0774-ba98-6f83-49f0ee1c6598@citrix.com>
 <23992.34990.952195.433864@mariner.uk.xensource.com>
 <24010.40492.241066.724248@mariner.uk.xensource.com>
 <24020.7348.510330.847360@mariner.uk.xensource.com>
In-Reply-To: <24020.7348.510330.847360@mariner.uk.xensource.com>
From: Wei Liu <wl@xen.org>
Date: Tue, 19 Nov 2019 19:46:00 +0000
X-Gmail-Original-Message-ID: <CAK9nU=rVuH1-c5jN7drb57-ekfAP2ajiZgR6K_6-He2ZbsgPqg@mail.gmail.com>
Message-ID: <CAK9nU=rVuH1-c5jN7drb57-ekfAP2ajiZgR6K_6-He2ZbsgPqg@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] tools/configure: Honour
 XEN_COMPILE_ARCH and _TARGET_ for shim
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Olaf Hering <olaf@aepfle.de>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxOSBOb3YgMjAxOSBhdCAxNjo0NywgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNp
dHJpeC5jb20+IHdyb3RlOgpbLi4uXQo+Cj4gPiA+RnJvbSAxYThkZTM2Njk5YjkwNDJjMzA3OTdl
MDVmN2E1ZjQzMTNkN2Y3YWQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gRnJvbTogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gPiBEYXRlOiBUdWUsIDI5IE9j
dCAyMDE5IDE3OjQ1OjMwICswMDAwCj4gPiBTdWJqZWN0OiBbUEFUQ0hdIHRvb2xzL2NvbmZpZ3Vy
ZTogSG9ub3VyIFhFTl9DT01QSUxFX0FSQ0ggYW5kIF9UQVJHRVRfIGZvcgo+ID4gIHNoaW0KPiA+
IE1JTUUtVmVyc2lvbjogMS4wCj4gPiBDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9
VVRGLTgKPiA+IENvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiA+Cj4gPiBUaGUgcHZz
aGltIGNhbiBvbmx5IGJlIGJ1aWx0IDY0LWJpdCBiZWNhdXNlIHRoZSBoeXBlcnZpc29yIGlzIG9u
bHkKPiA+IDY0LWJpdCBub3dhZGF5cy4gIFRoZSBoeXBlcnZpc29yIGJ1aWxkIHN1cHBvcnRzIFhF
Tl9DT01QSUxFX0FSQ0ggYW5kCj4gPiBYRU5fVEFSR0VUX0FSQ0ggd2hpY2ggb3ZlcnJpZGUgdGhl
IGluZm9ybWF0aW9uIGZyb20gdW5hbWUuICBUaGUgcHZzaGltCj4gPiBidWlsZCBydW5zIG91dCBv
ZiB0aGUgdG9vbHMvIGRpcmVjdG9yeSBidXQgY2FsbHMgdGhlIGh5cGVydmlzb3IgYnVpbGQKPiA+
IHN5c3RlbS4KPiA+Cj4gPiBJZiBvbmUgcnVucyBpbiBhIExpbnV4IDMyLWJpdCB1c2VybGFuZCB3
aXRoIGEgNjQtYml0IGtlcm5lbCwgb25lIHVzZWQKPiA+IHRvIGJlIGFibGUgdG8gc2V0IFhFTl9D
T01QSUxFX0FSQ0guICBCdXQgbm93YWRheXMgdGhpcyBkb2VzIG5vdCB3b3JrLgo+ID4gY29uZmln
dXJlIHNlZXMgdGhlIHRhcmdldCBjcHUgYXMgNjQtYml0IGFuZCB0cmllcyB0byBidWlsZCBwdnNo
aW0uCj4gPiBUaGUgYnVpbGQgcHJpbnRzCj4gPiAgIGVjaG8gIioqKiBYZW4geDg2LzMyIHRhcmdl
dCBubyBsb25nZXIgc3VwcG9ydGVkISIKPiA+IGFuZCBkb2Vzbid0IGJ1aWxkIGFueXRoaW5nLiAg
VGhlbiB0aGUgc3Vic2VxdWVudCBNYWtlZmlsZXMgdHJ5IHRvCj4gPiBpbnN0YWxsIHRoZSBub24t
YnVpbHQgcGllY2VzLgo+ID4KPiA+IEZpeCB0aGlzIGFub21hbHkgYnkgY2F1c2luZyBjb25maWd1
cmUgdG8gaG9ub3VyIHRoZSBYZW4gaHlwZXJ2aXNvciB3YXkKPiA+IG9mIHNldHRpbmcgdGhlIHRh
cmdldCBhcmNoaXRlY3R1cmUuCj4gPgo+ID4gSW4gcHJpbmNpcGxlIHRoaXMgdXNlciBiZWhhdmlv
dXIgaXMgbm90IGhhbmRsZWQgcXVpdGUgcmlnaHQsIGJlY2F1c2UKPiA+IGNvbmZpZ3VyZSB3aWxs
IHN0aWxsIHNlZSA2NC1iaXQgYW5kIHNvIGFsbCB0aGUgYXV0b2NvbmYtYmFzZWQKPiA+IGFyY2hp
dGVjdHVyZSB0ZXN0aW5nIHdpbGwgc2VlIDY0LWJpdCByYXRoZXIgdGhhbiAzMi1iaXQgeDg2LiAg
QnV0IHRoZQo+ID4gdG9vbHMgYXJlIGluIGZhY3QgZ2VuZXJhbGx5IHF1aXRlIHBvcnRhYmxlOiB0
aGlzIHBhcnRpY3VsYXIgbG9jYXRpb24KPiA+IGluIGNvbmZpZ3VyZXsuYWMsfSBpcyB0aGUgb25s
eSBwbGFjZSBpbiB0b29scy8gd2hlcmUgNjQtYml0IHg4NiBpcwo+ID4gdHJlYXRlZCBkaWZmZXJl
bnRseSBmcm9tIDMyLWJpdCB4ODYsIHNvIHRoZSBmaXggaXMgc3VmZmljaWVudCBhbmQKPiA+IGNv
cnJlY3QgZm9yIHRoaXMgdXNlIGNhc2UuCj4gPgo+ID4gSXQgcmVtYWlucyB0aGUgY2FzZSB0aGF0
IFhFTl9DT01QSUxFX0FSQ0ggb3IgWEVOX1RBUkdFVF9BUkNIIHRvIGEKPiA+IG5vbi14ODYgYXJj
aGl0ZWN0dXJlLCB3aGVuIGNvbmZpZ3VyZSB0aGlua3MgdGhpbmdzIGFyZSB4ODYsIG9yIHZpY2UK
PiA+IHZlcnNhLCB3aWxsIG5vdCB3b3JrIHJpZ2h0Lgo+ID4KPiA+IChUaGlzIGlzIGEgYnVnZml4
IHRvIDg4NDUxNTVjODMxYwo+ID4gICBwdnNoaW06IG1ha2UgUFYgc2hpbSBidWlsZCBzZWxlY3Rh
YmxlIGZyb20gY29uZmlndXJlCj4gPiB3aGljaCBpbmFkdmVydGFudGx5IGRlbGV0ZWQgdGhlIGxv
Z2ljIHRvIG9ubHkgYnVpbGQgdGhlIHNoaW0gZm9yCj4gPiBYRU5fVEFSR0VUX0FSQ0ggIT0geDg2
XzMyLikKPiA+Cj4gPiBJIGhhdmUgcmVydW4gYXV0b2dlbi5zaCwgc28gdGhpcyBwYXRjaCBjb250
YWlucyB0aGUgZml4IHRvIGNvbmZpZ3VyZQo+ID4gYXMgd2VsbCBhcyB0aGUgc291cmNlIGZpeCB0
byBjb25maWd1cmUuYWMuCj4gPgo+ID4gRml4ZXM6IDg4NDUxNTVjODMxYzU5ZTg2N2VlM2RkMzFl
ZTYzZTBjYzZjN2RjZjIKPiA+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgo+ID4gQ0M6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KPiA+
IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFJlbGVhc2Ut
YWNrZWQtYnk6IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
