Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1956FABF1A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 20:05:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6IXh-00041j-PM; Fri, 06 Sep 2019 18:01:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NXbo=XB=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1i6IXg-00041e-KZ
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 18:01:04 +0000
X-Inumbo-ID: 4accbccc-d0d0-11e9-978d-bc764e2007e4
Received: from mail-oi1-x231.google.com (unknown [2607:f8b0:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4accbccc-d0d0-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 18:01:04 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id b80so5655633oii.7
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2019 11:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OdMjfs+OjS+Qi1PtKlYHG2xGAOI9WLFgxhx6HsMfsTE=;
 b=hZIDhJip+rHAolLBsD9G4exFr2dd0vLGbyfpQWmPseu2Qn1AvLgIadrnllTD5i6NNV
 PD6nDMIB2pxgwZyYON3FtW4fA3kg2zIFMRnon3hd3GglVSQWDpchwfY8KkeF/DEiUKy+
 KBofQbSBBauXS/dlxofT0mpAmH5VZYde2Yxx06S4hKVyH28r2EbIyd/EUUSVGBwLGfQm
 M/HCpKvi8HRhNkZrCav1B+yn89sFUu6tA0o586QQTHqCOxhcV+5YxQn0PexYy6rDU+ni
 KjQhgGqrpTpd4GJn5ivwLWgLf+eqP8KgRGqueA+1OzkYd1ukGikn4Ydnp06h8WUe4w4L
 C3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OdMjfs+OjS+Qi1PtKlYHG2xGAOI9WLFgxhx6HsMfsTE=;
 b=AAh6lu4Qkc0wtSd+PRmPIpDeEZUnsLKNnNsk1k9JWeHzzZKdCLX5gCYY5SIB3Ctc3x
 6K5FjdUOSDA6SLox2pSQEpTbfQw32NXJmOCaA6F7jz4AEu+XUuTucjPd5mUUkn7LQV+0
 ENgz0F+u3BLCLdrkbRzEg+QrcmpwCbUWI2kJUbHCAyB9NwC07RM6SEQRw2vu3SBybVZJ
 9+Px7F+OI5UGIes1zQ1fhXFBxmgah39TkzDXpa8HHKdcF8C7SIC9tf8QnfCaiLT5Yw96
 /yhgteCxlO+E/pc2K7S5+LmBCU/s5gaDu23mtJcHO4wHv7AYhvvWrXBym9NwikqAaL1b
 bKZA==
X-Gm-Message-State: APjAAAV49agKF1UIMrGG8km8W9Fo8O8ZJ0h8ghTl3HhNRftKBNB9U+SZ
 ompXQAnAVM2O0xv04cA3N5F1p5u+SRwwx8Trf2U=
X-Google-Smtp-Source: APXvYqzsI2LHmxImD7I4MMILZZAp9ldXcbN3i1NG7nptCfR7x5m2/BKKZduX+1JOThV4HLAHx9+2DlqMURqQSLR5RwM=
X-Received: by 2002:aca:bb42:: with SMTP id l63mr8375633oif.85.1567792863455; 
 Fri, 06 Sep 2019 11:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <CADAP9AWJ46Oh=b-1K1hTNnkD=0DTYtYGX4L7VQp51QBaQCeYNw@mail.gmail.com>
 <2e2293bc-4187-3fe8-52d6-96f709ae4c3c@suse.com>
 <CADAP9AVJqfBGNBQVE-4ztA7Tjdwf0Y9GC-P=jwkx8sTM98BzVw@mail.gmail.com>
In-Reply-To: <CADAP9AVJqfBGNBQVE-4ztA7Tjdwf0Y9GC-P=jwkx8sTM98BzVw@mail.gmail.com>
From: Daniel Smith <dpsmith.dev@gmail.com>
Date: Fri, 6 Sep 2019 14:01:37 -0400
Message-ID: <CADAP9AUFVXMBLVkROPTWE_ox5CnvDRC6rdv2Mam=wDn7+TedcA@mail.gmail.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] Running xenstored in Linux stubdom
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxOjI2IFBNIERhbmllbCBTbWl0aCA8ZHBzbWl0aC5kZXZA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgU2VwIDQsIDIwMTkgYXQgMTI6MTIgUE0gSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUgc3R1YmRvbSBn
ZXRzIGFuIGV2ZW50IGNoYW5uZWwgdG8gdXNlIGZvciBkb20wIHhlbmJzdG9yZSBjb25uZWN0aW9u
Cj4gPiB2aWEgY29tbWFuZGxpbmUgcGFyYW1ldGVyICgiLS1ldmVudCA8ZXZlbnQtbnI+IikuIFRo
aXMgbmVlZHMgdG8gYmUgdXNlZAo+ID4gaW4gdGhlIHN0dWJkb20gZm9yIHNldHRpbmcgdXAgdGhl
IGNvbW11bmljYXRpb24gcGF0aC4KPiA+Cj4gPgo+ID4gSnVlcmdlbgo+Cj4gSGkgSnVlcmdlbiwK
Pgo+IFRoYW5rcyBmb3IgdGhlIHF1aWNrIHJlc3BvbnNlISB0cmFjaW5nIHRocm91Z2ggeGVuc3Rv
cmVkLCBsb29rcyBsaWtlCj4gdGhhdCBmbGFnIHNldHMgdGhlIHZhcmlhYmxlIGRvbTBfZXZlbnQg
d2hpY2ggaXMgb25seSB1c2VkIGluIHRoZQo+IHhlbnN0b3JlZF9taW5pb3MuYyBhcyB0aGUgcmV0
dXJuIHZhbHVlIHRvIHRoZSB4ZW5idXNfZXZ0Y2huKCkgY2FsbC4gSQo+IGNvdWxkIG5haXZlbHkg
c2hvcnQgY2lyY3VpdCB4ZW5idXNfZXZ0Y2huKCkgdW5kZXIgeGVuc3RvcmVkX3Bvc2l4LmMgdG8K
PiByZXR1cm4gaW1tZWRpYXRlbHkgaWYgZG9tMF9ldmVudCBoYXMgYmVlbiBzZXQuIElmIHRoYXQg
d29ya3MsIEkgd291bGQKPiBiZSBnbGFkIHRvIHN1Ym1pdCBpdCBiYWNrIHVwc3RyZWFtIGlmIHRo
ZXJlIGlzIGludGVyZXN0IGluCj4gaW5jb3Jwb3JhdGluZyBpdC4KCkhpIGFnYWluLAoKSSBtYWRl
IHRoZSBjaGFuZ2UgdG8gc2hvcnQgY2lyY3VpdCB0aGUgeGVuYnVzX2V2dGNobiBhbmQgZGlkIHRl
c3RpbmcKYXMgYSBndWVzdCBkb21haW4gYXBwcm9hY2ggdG8gY29uZmlybSB0aGF0IGkgd2FzIHBh
cnNpbmcgdGhlCnBhcmFtZXRlcnMgY29ycmVjdGx5IGluIGluaXRyYW1mcyBzY3JpcHQgdGhhdCBp
bml0LXhlbnN0b3JlLWhlbHBlcgpwYXNzZWQuIEkgYW0gc3RpbGwgaXQgaGFuZ2luZyBhZnRlciB0
aGUgYXR0ZW1wdCB0byB3cml0ZQovdG9vbC94ZW5zdG9yZWQvZG9taWQuIEF0IHRoaXMgcG9pbnQg
SSB3YXMgd29uZGVyaW5nIGlmIHRoZXJlIG1pZ2h0IGJlCmEgd2F5IHRvIGdldCBjb25zb2xlIG91
dHB1dCBmcm9tIHRoZSBkb21haW4gdG8gdHJ5IGFuZCB0cm91Ymxlc2hvb3QgaWYKeGVuc3RvcmVk
IGlzIGdldHRpbmcgc3RhcnRlZCB3aGVuIGFjdHVhbGx5IHJ1bm5pbmcgYXMgdGhlIGFjdHVhbApz
dHViZG9tIGluc3RlYWQgb2YgYXMgYSBndWVzdD8KClRoYW5rcyBpbiBBZHZhbmNlIQpEYW5pZWwg
UC4gU21pdGgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
