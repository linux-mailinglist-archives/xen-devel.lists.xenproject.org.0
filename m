Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CB7B3BA3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 15:44:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9rG2-0002lk-UN; Mon, 16 Sep 2019 13:41:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bDyh=XL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1i9rG0-0002lb-Fb
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 13:41:32 +0000
X-Inumbo-ID: b039c172-d887-11e9-95e6-12813bfff9fa
Received: from mail-lj1-f196.google.com (unknown [209.85.208.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b039c172-d887-11e9-95e6-12813bfff9fa;
 Mon, 16 Sep 2019 13:41:30 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id y23so33778379lje.9
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 06:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eiaZQJWI0KB6RqKsXE/cOx+e4aLmKQW3sXKLEvsub+E=;
 b=SdMvPybbWp3nyNYqq6vTa05b5lMeJRcVXYFZ75k8nRcp0ocERSyO5sEKbePmhSJxer
 f3xzZ/7G4eae2o01aNyGrN/xeh3zzqhBuZZREpmi8I49sIu+g9dDtj/cOW9sOqw61DFi
 Yk444NaXU88jW5XNTSVQbaGgSBtMIDkMbTosfm5ckk5IqtNFZYg8VbUD8V1mcddr3qhT
 2rIECCxZ5qeO3ijHNFuZ4h6FGnA1G8MxWkxxIzxPr8d4nvG8ruiK/inMUCae8WED6X6V
 Lu/5hkRmVDsdywBJVU5uRfpMspx4vvldHKEcda/WOMfCP2z8jgVslLPCj4U/ohmibAOT
 QNxQ==
X-Gm-Message-State: APjAAAU2NpFnFW8y8UjB/aludNJC/5g5BqWruXqvjqupJ9QRhgLJYUym
 XvAjRQ+UNtgneMOV1klpDrJHfAY+vqc=
X-Google-Smtp-Source: APXvYqzU2V4SJTodYyYhTRSO32yD6V1OUEGXrWF84KzIp6xjzsGqp4InpFVD9+6HPJ/mURYCzspaiw==
X-Received: by 2002:a2e:1409:: with SMTP id u9mr36777158ljd.162.1568641289465; 
 Mon, 16 Sep 2019 06:41:29 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171])
 by smtp.gmail.com with ESMTPSA id t22sm4514297lfg.91.2019.09.16.06.41.29
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2019 06:41:29 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id f5so1798629ljg.8
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 06:41:29 -0700 (PDT)
X-Received: by 2002:a2e:91d0:: with SMTP id u16mr3270739ljg.164.1568641288921; 
 Mon, 16 Sep 2019 06:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190913192759.10795-1-andrew.cooper3@citrix.com>
 <20190913192759.10795-9-andrew.cooper3@citrix.com>
 <a48bd401-32e1-0b7e-4c0b-3509630652ce@suse.com>
In-Reply-To: <a48bd401-32e1-0b7e-4c0b-3509630652ce@suse.com>
From: Wei Liu <wl@xen.org>
Date: Mon, 16 Sep 2019 14:41:13 +0100
X-Gmail-Original-Message-ID: <CAK9nU=r=pH+x6HLaKkJo1RLrES0WGyVabic_O6Kvu0LTo9riGg@mail.gmail.com>
Message-ID: <CAK9nU=r=pH+x6HLaKkJo1RLrES0WGyVabic_O6Kvu0LTo9riGg@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v2 08/10] tools/libxc: Rework
 xc_cpuid_apply_policy() to use {get, set}_cpu_policy()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxNiBTZXAgMjAxOSBhdCAxMjoxNywgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToKPgo+IE9uIDEzLjA5LjIwMTkgMjE6MjcsIEFuZHJldyBDb29wZXIgd3JvdGU6
Cj4gPiAtc3RhdGljIHZvaWQgaW50ZWxfeGNfY3B1aWRfcG9saWN5KGNvbnN0IHN0cnVjdCBjcHVp
ZF9kb21haW5faW5mbyAqaW5mbywKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3QgdW5zaWduZWQgaW50ICppbnB1dCwgdW5zaWduZWQgaW50ICpyZWdzKQo+ID4gLXsK
PiA+IC0gICAgc3dpdGNoICggaW5wdXRbMF0gKQo+ID4gLSAgICB7Cj4gPiAtICAgIGNhc2UgMHgw
MDAwMDAwNDoKPiA+IC0gICAgICAgIC8qCj4gPiAtICAgICAgICAgKiBFQVhbMzE6MjZdIGlzIE1h
eGltdW0gQ29yZXMgUGVyIFBhY2thZ2UgKG1pbnVzIG9uZSkuCj4gPiAtICAgICAgICAgKiBVcGRh
dGUgdG8gcmVmbGVjdCB2TEFQSUNfSUQgPSB2Q1BVX0lEICogMi4KPiA+IC0gICAgICAgICAqLwo+
ID4gLSAgICAgICAgcmVnc1swXSA9ICgoKHJlZ3NbMF0gJiAweDdjMDAwMDAwdSkgPDwgMSkgfCAw
eDA0MDAwMDAwdSB8Cj4gPiAtICAgICAgICAgICAgICAgICAgIChyZWdzWzBdICYgMHgzZmZ1KSk7
Cj4gPiAtICAgICAgICByZWdzWzNdICY9IDB4M2ZmdTsKPgo+IEkgdGhpbmsgeW91IHdhbnQgdG8g
bWVudGlvbiB0aGF0IHRoZSByZW1vdmFsIG9mIHRoaXMgbWFza2luZyBpcwo+IGludGVudGlvbmFs
LCBmb3IgaXQgbG9va2luZyBib2d1cy4gV2l0aCBhbiBhcHByb3ByaWF0ZSBhZGRpdGlvbiB0bwo+
IHRoZSBkZXNjcmlwdGlvbgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKPiBKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
