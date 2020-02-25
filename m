Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D63816C298
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 14:42:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6aRE-00017U-S1; Tue, 25 Feb 2020 13:39:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xmvt=4N=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j6aRD-00017F-0o
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 13:39:51 +0000
X-Inumbo-ID: 4b8a50e4-57d4-11ea-a490-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b8a50e4-57d4-11ea-a490-bc764e2007e4;
 Tue, 25 Feb 2020 13:39:50 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id r18so16295731edl.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 05:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KZIKD1iLOYNfQDWPbWVC2kHd7or0pVMa96r1r6Z6JJI=;
 b=viBnFk/A1m2cmIlXgTx2l2z7uALo+DAPDTiyMKA1q6e8mTxKIlOqsGhzzeQY8MPRzM
 vzUNigarJPlZT9UgwkVXJeUZr3sCNO+jqHdorhvaoMUlNpClGwv7CFAjlb1zPZa7ywFa
 SjZ6ssDJKfp6eFNP9Yg82FVA+rdqirpdgW2WBCElwdgssrx5MqJjzF/aC4eeOsrVCaRz
 cVMRglxNmXkuodifnyZtYuJoKZfACXsApy15JM70mYLbJP2Qsd2GiETBmLm32fvESRvD
 MU6HWYjoJqzPQNSY2hxZjzEf+l9dNjvOeG1sufoJBl2HhuTE9gucSeqVFbepO1sK4W4Q
 dVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KZIKD1iLOYNfQDWPbWVC2kHd7or0pVMa96r1r6Z6JJI=;
 b=IChIBnoIn7vZTLonOr00BG3TV9uI3EfUMXO6BNdDPojjFPhpArZ7j1rIRIplSzDTH8
 t/M7lf9258rP0wOeqY5vIiGfz5SeD4fpcpRfN5euvXKXYQf+g8zukqoL8HeLUeT0ghej
 i2M31aRE8u5CQitQWIFNtf1/THh7XRmjxKwLt0ECZ4Q28SqR/JiTgQSfUJhyyiVBv7Rc
 wj6LCGxEzrgBimFhrrJrPQD0HDS+suY62mSzgeCxRZ/qy+P/wpGyYmTatzDOZEpNpzOd
 f2hA3A6yJmc8NqpPuRguz5Wd+0HyIRs3LDtzb7UTqoG2SEBkq0KmxaBR2hLrnUC6HgQ8
 o4FQ==
X-Gm-Message-State: APjAAAXJdThY8kQXc2QE2jsRtKFArCkOFpGCglhv7sUuoICmbRouDOW+
 Yp3vuOiqrsfkvs8Un5wFwenvOKwjbYA=
X-Google-Smtp-Source: APXvYqyfIn8+bzVcWFJuKWHzqqSSBRRDAuz00HURUwELxUvrxLZnfVJSZGEhR2FA8ip8WGGP4isG+g==
X-Received: by 2002:a50:d78e:: with SMTP id w14mr13562209edi.20.1582637989493; 
 Tue, 25 Feb 2020 05:39:49 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50])
 by smtp.gmail.com with ESMTPSA id i11sm948435ejv.64.2020.02.25.05.39.48
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 05:39:48 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id t3so14761573wru.7
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 05:39:48 -0800 (PST)
X-Received: by 2002:a5d:5381:: with SMTP id d1mr72204068wrv.259.1582637987932; 
 Tue, 25 Feb 2020 05:39:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <dff6668838b61fb7fe508588bef91d650cddfeb5.1582310142.git.tamas.lengyel@intel.com>
 <20200224123922.GO4679@Air-de-Roger>
 <c31a7453-7f1b-22d4-f448-0bd486deed86@suse.com>
In-Reply-To: <c31a7453-7f1b-22d4-f448-0bd486deed86@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 25 Feb 2020 06:39:11 -0700
X-Gmail-Original-Message-ID: <CABfawh=Bb_uz0Oh=FDFTtSUfhjTfRW+Hcwu7U9Y=b5gHWzK1FQ@mail.gmail.com>
Message-ID: <CABfawh=Bb_uz0Oh=FDFTtSUfhjTfRW+Hcwu7U9Y=b5gHWzK1FQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v9 3/5] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgNjoyOCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjQuMDIuMjAyMCAxMzozOSwgUm9nZXIgUGF1IE1vbm7DqSB3
cm90ZToKPiA+IE9uIEZyaSwgRmViIDIxLCAyMDIwIGF0IDEwOjQ5OjIxQU0gLTA4MDAsIFRhbWFz
IEsgTGVuZ3llbCB3cm90ZToKPiA+PiArc3RhdGljIGludCBtZW1fc2hhcmluZ19mb3JrKHN0cnVj
dCBkb21haW4gKmQsIHN0cnVjdCBkb21haW4gKmNkKQo+ID4+ICt7Cj4gPj4gKyAgICBpbnQgcmMg
PSAtRUlOVkFMOwo+ID4+ICsKPiA+PiArICAgIGlmICggIWNkLT5jb250cm9sbGVyX3BhdXNlX2Nv
dW50ICkKPiA+PiArICAgICAgICByZXR1cm4gcmM7Cj4gPgo+ID4gLUVCVVNZIG1pZ2h0IGJlIGJl
dHRlciBoZXJlLgo+ID4KPiA+PiArCj4gPj4gKyAgICAvKgo+ID4+ICsgICAgICogV2Ugb25seSB3
YW50IHRvIGdldCBhbmQgcGF1c2UgdGhlIHBhcmVudCBvbmNlLCBub3QgZWFjaCB0aW1lIHRoaXMK
PiA+PiArICAgICAqIG9wZXJhdGlvbiBpcyByZXN0YXJ0ZWQgZHVlIHRvIHByZWVtcHRpb24uCj4g
Pj4gKyAgICAgKi8KPiA+PiArICAgIGlmICggIWNkLT5wYXJlbnRfcGF1c2VkICkKPiA+PiArICAg
IHsKPiA+PiArICAgICAgICBBU1NFUlQoZ2V0X2RvbWFpbihkKSk7Cj4gPgo+ID4gV2UgYXJlIHRy
eWluZyB0byBhdm9pZCBzdWNoIGNvbnN0cnVjdHMsIGluc3RlYWQgSSBzdWdnZXN0Ogo+ID4KPiA+
IGlmICggIWdldF9kb21haW4ocGFyZW50KSApCj4gPiB7Cj4gPiAgICAgQVNTRVJUX1VOUkVBQ0hB
QkxFKCk7Cj4gPiAgICAgcmV0dXJuIC1FQlVTWTsKPiA+IH0KPgo+IEJ1dCBpc24ndCB0aGUgQVNT
RVJUKCkgaGVyZSB3cm9uZyBhbnl3YXk/IEkuZS4gd2hhdCBpcyBpdCB0aGF0Cj4gZ3VhcmFudGVl
cyB0aGF0IGQgaGFzbid0IGdvbmUgYXdheT8gSWYgaXQncyB0aGUgY2FsbGVyIG9mIHRoaXMKPiBm
dW5jdGlvbiwgdGhlbiB3b3VsZG4ndCBpdCBiZSBnZXRfa25vd25hbGl2ZV9kb21haW4oKSB0aGF0
Cj4gd2FudHMgdXNpbmcgaGVyZT8KCkR1cmluZyB0aGUgZm9yayBoeXBlcmNhbGwgdGhlIHBhcmVu
dCdzIHBhdXNlIGNvdW50IGlzIGluY3JlbWVudGVkIHZpYQpkb21haW5fcGF1c2UuIEl0IGNhbid0
IGdvIGF3YXkgdW50aWwgdGhlIHJlZmVyZW5jZSBjb3VudCBnb2VzIGRvd24gdG8KemVybywgd2hp
Y2ggb25seSBoYXBwZW5zIHdoZW4gaXQncyBmb3JrcyBhcmUgYWxsIGdvbmUuCgpUYW1hcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
