Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAEBE00FB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 11:45:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMqgX-0001V8-QQ; Tue, 22 Oct 2019 09:42:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TUKA=YP=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1iMqgW-0001V3-Gm
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 09:42:36 +0000
X-Inumbo-ID: 46f8c8ee-f4b0-11e9-a531-bc764e2007e4
Received: from mail-oi1-x242.google.com (unknown [2607:f8b0:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46f8c8ee-f4b0-11e9-a531-bc764e2007e4;
 Tue, 22 Oct 2019 09:42:35 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id g81so13596972oib.8
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2019 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AWDQsNcnEDFIcVKDwUT9YNcZRuv6IBRMy3EtcZqV0EQ=;
 b=h70lvQ7TyNXB21tFyDZroFl6Fq6Hl1eqNQUbH6dMlA8JfQraDnKMKVOU81jNG6sq1/
 q/Qi75OkmSa2ECksv0gtVj7U6c+BjzX8dX5GO3TtqfGkCCk6BajmsZYTEJtGdWWG2Lvf
 cga7Hgbjp2G9B+qBMDFaveNAPG+svmofglchsyQ6uJAAxotK0jg3GJ34ZYR/wJy90WBu
 TzJonBMAlbADkLRX115CP+hkrZfVBMrkepq437Ur60o4dzwJGSa3gJdqeqOaCzi/39IK
 qY3iz1AorWY+U9/8HXABi0B87e71aPhR/caHA69dWYE1uejRDlUsYqVJ8LhEaMfmjiRX
 HC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AWDQsNcnEDFIcVKDwUT9YNcZRuv6IBRMy3EtcZqV0EQ=;
 b=iInQM/jrrVhuHuW5JvGM0vwADtnTyHOBuH+AYTvkV+AstcOjQQj9zn2mik3w+Rzm/g
 cxUIVzyKx5N5HShYNKUa2Rvr34MfyS8cSBUTlYu0JSrJvGZbwUeHbFxfCmEfAqSDA19V
 QCuKlIoI5wxAba9JDF10l3sZlqZgbKtP+Qer8oD1MFPXVdSFVleVaNIPjeILHXnGgtAa
 nC75/NKCjsBCgzHIa1Lu8atUSNJ6dWUVpwHJQA10LG/ahviVNTBB73/Akifb0qtNs3rh
 dR0ebiXKEYBB+pRpKMNHRFBdXh/6MDb/TPLOxckaYqynR/rJKvl6mhQ1fYvZY9nfscd2
 t9Jg==
X-Gm-Message-State: APjAAAXHt97o4S3h0SiZDqK2OIvWSUqeb8p5JRp/lZU/9Io+qpMzxhej
 LyMLOrVUMCr7EyRAriV1agioARn1Q9sj0SkJXR4Sow==
X-Google-Smtp-Source: APXvYqy1pKOdTvHcFP0XzOJuYsvQj/PHqE3DixwCFjquN5kcVT5U1DWjRFzC5idMPh4Y1iB7MBwDm6ikZe/nY8+oUcE=
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr2183082oic.98.1571737355053; 
 Tue, 22 Oct 2019 02:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-4-philmd@redhat.com>
 <b1255a22fe4409244f7a68887137fbe43b71a08d.camel@gmail.com>
In-Reply-To: <b1255a22fe4409244f7a68887137fbe43b71a08d.camel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Oct 2019 10:42:24 +0100
Message-ID: <CAFEAcA-FesfcimTutrYwZFdB93mEE42ha7X93jDqAW7CFUd+0w@mail.gmail.com>
To: Esteban Bosse <estebanbosse@gmail.com>
Subject: Re: [Xen-devel] [PATCH v2 03/20] piix4: Add a i8259 Interrupt
 Controller as specified in datasheet
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paul Durrant <paul@xen.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMiBPY3QgMjAxOSBhdCAwOTo1MiwgRXN0ZWJhbiBCb3NzZSA8ZXN0ZWJhbmJvc3Nl
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBFbCB2aWUsIDE4LTEwLTIwMTkgYSBsYXMgMTU6NDcgKzAy
MDAsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIGVzY3JpYmnDszoKPiA+ICtzdGF0aWMgdm9pZCBw
aWl4NF9yZXF1ZXN0X2k4MjU5X2lycSh2b2lkICpvcGFxdWUsIGludCBpcnEsIGludAo+ID4gbGV2
ZWwpCj4gPiArewo+ID4gKyAgICBQSUlYNFN0YXRlICpzID0gb3BhcXVlOwo+ID4gKyAgICBxZW11
X3NldF9pcnEocy0+Y3B1X2ludHIsIGxldmVsKTsKPiA+ICt9Cj4gSSB3b3VsZCBsaWtlIHRvIHVu
ZGVyc3RhbmQgd2h5IGluIGBQSUlYNFN0YXRlICpzID0gb3BhcXVlO2AgaXRzIG5vdAo+IG5lY2Vz
c2FyeSBhIGNhc3Qgb3IgYSBvYmplY3QgbWFjcm8gbWFnaWMuCj4gU29tZXRoaW5nIGxpa2U6Cj4g
UElJWDRTdGF0ZSAqcyA9IChQSUlYNFN0YXRlKilvcGFxdWU7Cj4gUElJWDRTdGF0ZSAqcyA9IFBJ
SVg0U1RBVEUob3BhcXVlKTsKClRoZSBzaW1wbGUgYW5zd2VyIHRvICJ3aHkgZG9uJ3Qgd2UgbmVl
ZCBhIGNhc3QiIGlzCiJiZWNhdXNlIHRoZSB0eXBlIG9mICdvcGFxdWUnIGlzICd2b2lkIConLCBh
bmQgaW4gQyB0aGVyZSBpcwpubyBuZWVkIHRvIGV4cGxpY2l0bHkgY2FzdCBhICd2b2lkIConIGFz
IGl0IHdpbGwgYmUgaW1wbGljaXRseQpjb252ZXJ0ZWQgdG8gdGhlIHBvaW50ZXIgdHlwZSBvZiB0
aGUgZGVzdGluYXRpb24iLiAoVGhpcyBpcwpkaWZmZXJlbnQgZnJvbSBDKyssIHdoaWNoIGRvZXMg
cmVxdWlyZSBhbiBleHBsaWNpdCBjYXN0IGZvciB2b2lkKi4pCgpGb3IgUU9NIHR5cGVzLCBRRU1V
IGNvbnZlbnRpb25hbGx5IHVzZXMgdGhlIFFPTSBjYXN0aW5nCm1hY3JvIHRvIGNvbnZlcnQgYSBw
b2ludGVyLXRvLWluc3RhbmNlIHRvCnBvaW50ZXItdG8taW5zdGFuY2Utb2YtcGFyZW50LWNsYXNz
IGFuZCB2aWNlIHZlcnNhLgpJbiBzb21lIHBsYWNlcywgbGlrZSB0aGlzIG9uZSwgd2hhdCB3ZSBo
YXZlIGlzIGp1c3QgYQp2b2lkKiByZXByZXNlbnRpbmcgb3BhcXVlIGRhdGEgaGF2aW5nIGJlZW4g
cGFzc2VkIGFyb3VuZC4KWW91IGNvdWxkIHVzZSB0aGUgUU9NIGNhc3QgbWFjcm8gaGVyZSwgd2hp
Y2ggd291bGQgYWRkCmEgYml0IG9mIGV4dHJhIHR5cGUtc2FmZXR5LCBidXQgdGhlIHByb2plY3Qg
ZG9lc24ndCBoYXZlCmEgc3Ryb25nIGNvbnZlbnRpb24gaGVyZSBvbiB3aGV0aGVyIHRvIGRvIHNv
IG9yIG5vdCwgc28KeW91J2xsIG9mdGVuIHNlZSB0aGUganVzdC1hc3NpZ25tZW50IGNvZGUuCgp0
aGFua3MKLS0gUE1NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
