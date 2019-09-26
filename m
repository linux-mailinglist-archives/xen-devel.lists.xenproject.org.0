Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52DBBF530
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:42:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUvr-0001Gz-95; Thu, 26 Sep 2019 14:39:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDUvp-0001Gu-3z
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:39:45 +0000
X-Inumbo-ID: 7ad728a8-e06b-11e9-97fb-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by localhost (Halon) with ESMTPS
 id 7ad728a8-e06b-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 14:39:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r5so2763484wrm.12
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 07:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XGb/Vs1qpsWW7Uy3zQ1PoiFXbtuIIWbRE1BEKYGM778=;
 b=kYu6qYo5lfs/PYKu1pqfzR6lVFyXDXaSXIFZJ8irvs4bDQjtW+pFkVECiDpBdVXYCA
 XwUwqIzJoLMd47VDBLpBPRDeSdPq1ebLpZZips32n+lNGf0jkAVtVLT9HG9Fcfda9qqA
 LmBQUCJekG7/FO+bYnlxG1QmscntljWpHdKiMaIVzBAcshWUgQ3c9MczD7l2JgQI6s2k
 bX36l+qjVitpuWWBrRM2VT/xHJTw3pebEb9vrX/XVv4RtrBaASWdE1LJZQes7qHD8bxL
 xusbsJ4CAXjnu9Y77ZHn+IeaJ0/fnGZWpyRXF5guD6NYa6y89QX2zABk0RQUclpWlN2P
 taYQ==
X-Gm-Message-State: APjAAAWommZdynjKVeUp2cLu9RutzxcJLWyCqte0Gl4Lhd2GkSCKDzDc
 Rj1lDX5tXPffcXgozkULEXs=
X-Google-Smtp-Source: APXvYqzeD9c3l/Y5uoo9f9i5X5Wt5OY6esRxmgWV1OM+naZJzMExmgfa9pSEJUvPYtQ1FmG08u3JaA==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr3145359wrs.151.1569508783561; 
 Thu, 26 Sep 2019 07:39:43 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id x2sm4106544wrn.81.2019.09.26.07.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 07:39:42 -0700 (PDT)
Date: Thu, 26 Sep 2019 15:39:41 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926143941.ikfpeydqbbvfegyt@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <5e135be6b8754ddfa24560eec8c5d1254dba34ae.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e135be6b8754ddfa24560eec8c5d1254dba34ae.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 75/84] x86/mm: handle PSE early
 termination cases in virt_to_mfn_walk().
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6MzhBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCj4g
U2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KPiAtLS0KPiAg
eGVuL2FyY2gveDg2L21tLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKPiBp
bmRleCBhYjc2MGVjYzFmLi4zOWJhOWY5YmY0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPiBAQCAtNTA1OCw4ICs1MDU4LDQwIEBAIGwx
X3BnZW50cnlfdCAqdmlydF90b194ZW5fbDFlKHVuc2lnbmVkIGxvbmcgdikKPiAgCj4gIHVuc2ln
bmVkIGxvbmcgdmlydF90b19tZm5fd2Fsayh2b2lkICp2YSkKPiAgewo+IC0gICAgbDFfcGdlbnRy
eV90ICpwbDFlID0gdmlydF90b194ZW5fbDFlKCh1bnNpZ25lZCBsb25nKSh2YSkpOwo+IC0gICAg
dW5zaWduZWQgbG9uZyByZXQgPSBsMWVfZ2V0X3BmbigqcGwxZSk7Cj4gKyAgICB1bnNpZ25lZCBs
b25nIHJldDsKPiArICAgIGwzX3BnZW50cnlfdCAqcGwzZTsKPiArICAgIGwyX3BnZW50cnlfdCAq
cGwyZTsKPiArICAgIGwxX3BnZW50cnlfdCAqcGwxZTsKPiArCj4gKyAgICAvKgo+ICsgICAgICog
RklYTUU6IFRoaXMgaXMgcmF0aGVyIHVub3B0aW1pc2VkLCBiZWNhdXNlIGUuZy4gdmlydF90b194
ZW5fbDJlCj4gKyAgICAgKiByZWNvbXB1dGVzIHZpcnRfdG9feGVuX2wzZSBhZ2Fpbi4gQ2xlYXJs
eSBvbmUgY2FuIGtlZXAgdGhlIHJlc3VsdCBhbmQKPiArICAgICAqIGNhcnJ5IG9uLgo+ICsgICAg
ICovCj4gKwo+ICsgICAgcGwzZSA9IHZpcnRfdG9feGVuX2wzZSgodW5zaWduZWQgbG9uZykodmEp
KTsKPiArICAgIEJVR19PTighKGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFJFU0VOVCkp
Owo+ICsgICAgaWYgKCBsM2VfZ2V0X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BTRSApCj4gKyAgICB7
Cj4gKyAgICAgICAgcmV0ID0gbDNlX2dldF9wZm4oKnBsM2UpOwo+ICsgICAgICAgIHJldCB8PSAo
KCh1bnNpZ25lZCBsb25nKXZhICYgKCgxVUwgPDwgTDNfUEFHRVRBQkxFX1NISUZUKS0xKSkgPj4g
UEFHRV9TSElGVCk7Cj4gKyAgICAgICAgdW5tYXBfeGVuX3BhZ2V0YWJsZShwbDNlKTsKPiArICAg
ICAgICByZXR1cm4gcmV0Owo+ICsgICAgfQo+ICsKPiArICAgIHBsMmUgPSB2aXJ0X3RvX3hlbl9s
MmUoKHVuc2lnbmVkIGxvbmcpKHZhKSk7Cj4gKyAgICBCVUdfT04oIShsMmVfZ2V0X2ZsYWdzKCpw
bDJlKSAmIF9QQUdFX1BSRVNFTlQpKTsKPiArICAgIGlmICggbDJlX2dldF9mbGFncygqcGwyZSkg
JiBfUEFHRV9QU0UgKQo+ICsgICAgewo+ICsgICAgICAgIHJldCA9IGwyZV9nZXRfcGZuKCpwbDJl
KTsKPiArICAgICAgICByZXQgfD0gKCgodW5zaWduZWQgbG9uZyl2YSAmICgoMVVMIDw8IEwyX1BB
R0VUQUJMRV9TSElGVCktMSkpID4+IFBBR0VfU0hJRlQpOwo+ICsgICAgICAgIHVubWFwX3hlbl9w
YWdldGFibGUocGwyZSk7Cj4gKyAgICAgICAgcmV0dXJuIHJldDsKPiArICAgIH0KPiArCj4gKyAg
ICBwbDFlID0gdmlydF90b194ZW5fbDFlKCh1bnNpZ25lZCBsb25nKSh2YSkpOwo+ICsgICAgQlVH
X09OKCEobDFlX2dldF9mbGFncygqcGwxZSkgJiBfUEFHRV9QUkVTRU5UKSk7Cj4gKyAgICByZXQg
PSBsMWVfZ2V0X3BmbigqcGwxZSk7CgpEb24ndCB5b3UgZW5kIHVwIGxlYWtpbmcgcGwzZSBhbmQg
cGwyZSBpbiB0aGUgIVBTRSBjYXNlPwoKQWxzbywgaWYgeW91IG9ubHkgd2FudCB0byB3YWxrIHBh
Z2UgdGFibGUgdGhhdCBpcyBhbHJlYWR5IHBvcHVsYXRlZCwKdGhlcmUgbWF5IGJlIGEgYmV0dGVy
IHdheSB0byBkbyBpdCB0aGFuIGNhbGxpbmcgdmlydF90b194ZW5fbFhlLgoKV2VpLgoKPiAgICAg
IHVubWFwX3hlbl9wYWdldGFibGUocGwxZSk7Cj4gICAgICByZXR1cm4gcmV0Owo+ICB9Cj4gLS0g
Cj4gMi4xNy4xCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
