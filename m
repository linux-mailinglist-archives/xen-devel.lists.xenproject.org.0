Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3925DB0CE
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:11:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7OF-0000i4-AW; Thu, 17 Oct 2019 15:08:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hugR=YK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iL7OE-0000ht-GU
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:08:34 +0000
X-Inumbo-ID: fbf08064-f0ef-11e9-93d3-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbf08064-f0ef-11e9-93d3-12813bfff9fa;
 Thu, 17 Oct 2019 15:08:33 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D6D40821C1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 15:08:32 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id o128so3781056wmo.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 08:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dnAgdv88fqpkJJVSXS9vM0PplR+Kvi9HfVjwm6f845g=;
 b=cIuJ0jCVPdqD7t4lgqc+ZwkyA2Y52inpnkkeZZS6t3o6AUlfJ7CJXl0xu+MwI+c/Di
 8GAMO6c2DsV1jcXfFQdjlVZER7ZOMymEi9OrYo3yRfXcf/ZGVqF99Jq0WrWEVSQAJj8e
 6kS4OWfFub5ieKTLi9mXwJv1lHa3QM7Q9dFN/SePrCdfjHksLo9YnCsIsxG9D5HwkIp0
 mqIuHKYoLX7BkHc4AZALAcKJ/ySgvErNzJk7I5QzxJzUUEw56JR1pi0sf3A35OoGFdbR
 CGV/Wdhr3anpcJFYX70xsoW/JrockKnynsBHofomIXca0smOcCiuwK63QORNpeylsQsq
 GNmg==
X-Gm-Message-State: APjAAAUemN902cTmvmaujSaCICBuuf66xg4O5uQGO8LhBGoazyDK1B9s
 5aF0FHLzyTCgirxLXD3p5Sx6GYUfj6g5cAOr4BTIU15xqb1BGf/YecV+si7bR4h0YEV2vI6aJ52
 gpjkzDdtGqoK5BLIIIdCtcQzFoZw=
X-Received: by 2002:a5d:4286:: with SMTP id k6mr3362926wrq.192.1571324909954; 
 Thu, 17 Oct 2019 08:08:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxg9IEqKvkzKtsyM3a9kmP0NDMBLbPPViQWW70uNvm8bLhPKRJHIGoGgBAFy5C9Rn1A0gAHNw==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr3362889wrq.192.1571324909771; 
 Thu, 17 Oct 2019 08:08:29 -0700 (PDT)
Received: from [192.168.50.32] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id t6sm3551777wmf.8.2019.10.17.08.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2019 08:08:29 -0700 (PDT)
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-3-philmd@redhat.com>
 <CAL1e-=iC9hR-jqTSu9c6KtgiNWFwftnTMq9W87NWFPb37hjCoA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <46708b3d-fcef-f65c-d929-73d7c8e3f877@redhat.com>
Date: Thu, 17 Oct 2019 17:08:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAL1e-=iC9hR-jqTSu9c6KtgiNWFwftnTMq9W87NWFPb37hjCoA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 02/32] hw/i386/pc: Move kvm_i8259_init()
 declaration to sysemu/kvm.h
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMC8xNy8xOSA0OjU3IFBNLCBBbGVrc2FuZGFyIE1hcmtvdmljIHdyb3RlOgo+IAo+IAo+
IE9uIFR1ZXNkYXksIE9jdG9iZXIgMTUsIDIwMTksIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxw
aGlsbWRAcmVkaGF0LmNvbSAKPiA8bWFpbHRvOnBoaWxtZEByZWRoYXQuY29tPj4gd3JvdGU6Cj4g
Cj4gICAgIE1vdmUgdGhlIEtWTS1yZWxhdGVkIGNhbGwgdG8gInN5c2VtdS9rdm0uaCIuCgpNYXli
ZSBzL2NhbGwvZnVuY3Rpb24gZGVjbGFyYXRpb24vCgo+IAo+ICAgICBTaWduZWQtb2ZmLWJ5OiBQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20KPiAgICAgPG1haWx0bzpw
aGlsbWRAcmVkaGF0LmNvbT4+Cj4gICAgIC0tLQo+ICAgICAgwqBpbmNsdWRlL2h3L2kzODYvcGMu
aCB8IDEgLQo+ICAgICAgwqBpbmNsdWRlL3N5c2VtdS9rdm0uaCB8IDEgKwo+ICAgICAgwqAyIGZp
bGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gCj4gSXMgdGhl
cmUgYW55IG90aGVyIHNpbWlsYXIgY2FzZSBpbiBvdXIgY29kZSBiYXNlPwoKVGhlc2UgbG9vayBh
cHByb3ByaWF0ZToKCmluY2x1ZGUvaHcvcHBjL29wZW5waWNfa3ZtLmg6NTppbnQga3ZtX29wZW5w
aWNfY29ubmVjdF92Y3B1KERldmljZVN0YXRlIAoqZCwgQ1BVU3RhdGUgKmNzKTsKaW5jbHVkZS9o
dy90aW1lci9pODI1NC5oOjY3OnN0YXRpYyBpbmxpbmUgSVNBRGV2aWNlICprdm1fcGl0X2luaXQo
SVNBQnVzIAoqYnVzLCBpbnQgYmFzZSkKaHcvaW50Yy92Z2ljX2NvbW1vbi5oOjI1OiAqIGt2bV9h
cm1fZ2ljX3NldF9pcnEgLSBTZW5kIGFuIElSUSB0byB0aGUgCmluLWtlcm5lbCB2R0lDCmh3L2lu
dGMvdmdpY19jb21tb24uaDozMzp2b2lkIGt2bV9hcm1fZ2ljX3NldF9pcnEodWludDMyX3QgbnVt
X2lycSwgaW50IAppcnEsIGludCBsZXZlbCk7CgphbHRob3VnaCBrdm1fcGl0X2luaXQoKSBpcyBw
cm9iYWJseSBib3JkZXJsaW5lLgoKPiAKPiBBLgo+IAo+ICAgICBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9ody9pMzg2L3BjLmggYi9pbmNsdWRlL2h3L2kzODYvcGMuaAo+ICAgICBpbmRleCA2ZGY0ZjRi
NmZiLi4wOWU3NGU3NzY0IDEwMDY0NAo+ICAgICAtLS0gYS9pbmNsdWRlL2h3L2kzODYvcGMuaAo+
ICAgICArKysgYi9pbmNsdWRlL2h3L2kzODYvcGMuaAo+ICAgICBAQCAtMTU4LDcgKzE1OCw2IEBA
IHR5cGVkZWYgc3RydWN0IFBDTWFjaGluZUNsYXNzIHsKPiAKPiAgICAgIMKgZXh0ZXJuIERldmlj
ZVN0YXRlICppc2FfcGljOwo+ICAgICAgwqBxZW11X2lycSAqaTgyNTlfaW5pdChJU0FCdXMgKmJ1
cywgcWVtdV9pcnEgcGFyZW50X2lycSk7Cj4gICAgIC1xZW11X2lycSAqa3ZtX2k4MjU5X2luaXQo
SVNBQnVzICpidXMpOwo+ICAgICAgwqBpbnQgcGljX3JlYWRfaXJxKERldmljZVN0YXRlICpkKTsK
PiAgICAgIMKgaW50IHBpY19nZXRfb3V0cHV0KERldmljZVN0YXRlICpkKTsKPiAKPiAgICAgZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvc3lzZW11L2t2bS5oIGIvaW5jbHVkZS9zeXNlbXUva3ZtLmgKPiAg
ICAgaW5kZXggOWQxNDMyODJiYy4uZGE4YWE5ZjVhOCAxMDA2NDQKPiAgICAgLS0tIGEvaW5jbHVk
ZS9zeXNlbXUva3ZtLmgKPiAgICAgKysrIGIvaW5jbHVkZS9zeXNlbXUva3ZtLmgKPiAgICAgQEAg
LTUxMyw2ICs1MTMsNyBAQCB2b2lkIGt2bV9pcnFjaGlwX3NldF9xZW11aXJxX2dzaShLVk1TdGF0
ZSAqcywKPiAgICAgcWVtdV9pcnEgaXJxLCBpbnQgZ3NpKTsKPiAgICAgIMKgdm9pZCBrdm1fcGNf
Z3NpX2hhbmRsZXIodm9pZCAqb3BhcXVlLCBpbnQgbiwgaW50IGxldmVsKTsKPiAgICAgIMKgdm9p
ZCBrdm1fcGNfc2V0dXBfaXJxX3JvdXRpbmcoYm9vbCBwY2lfZW5hYmxlZCk7Cj4gICAgICDCoHZv
aWQga3ZtX2luaXRfaXJxX3JvdXRpbmcoS1ZNU3RhdGUgKnMpOwo+ICAgICArcWVtdV9pcnEgKmt2
bV9pODI1OV9pbml0KElTQUJ1cyAqYnVzKTsKPiAKPiAgICAgIMKgLyoqCj4gICAgICDCoCAqIGt2
bV9hcmNoX2lycWNoaXBfY3JlYXRlOgo+ICAgICAtLSAKPiAgICAgMi4yMS4wCj4gCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
