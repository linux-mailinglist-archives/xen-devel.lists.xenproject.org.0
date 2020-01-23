Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268AE1466E9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 12:38:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuamn-0002Ay-6x; Thu, 23 Jan 2020 11:36:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuaml-0002Ao-Bt
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 11:36:31 +0000
X-Inumbo-ID: 93ec2b1a-3dd4-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93ec2b1a-3dd4-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 11:36:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6C37AC9D;
 Thu, 23 Jan 2020 11:36:20 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <4d9bf13e-8f1b-4c9c-a4c4-5680a85dfbf0@suse.com>
Date: Thu, 23 Jan 2020 12:36:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3] dom0-build: fix build with clang5
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCBub24tZW1wdHkgQ09ORklHX0RPTTBfTUVNIGNsYW5nNSBwcm9kdWNlcwoKZG9tMF9idWls
ZC5jOjM0NDoyNDogZXJyb3I6IHVzZSBvZiBsb2dpY2FsICcmJicgd2l0aCBjb25zdGFudCBvcGVy
YW5kIFstV2Vycm9yLC1XY29uc3RhbnQtbG9naWNhbC1vcGVyYW5kXQogICAgaWYgKCAhZG9tMF9t
ZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSApCiAgICAgICAgICAgICAgICAgICAgICAgXiAg
fn5+fn5+fn5+fn5+fn5+fn5+CmRvbTBfYnVpbGQuYzozNDQ6MjQ6IG5vdGU6IHVzZSAnJicgZm9y
IGEgYml0d2lzZSBvcGVyYXRpb24KICAgIGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9N
MF9NRU1bMF0gKQogICAgICAgICAgICAgICAgICAgICAgIF5+CiAgICAgICAgICAgICAgICAgICAg
ICAgJgpkb20wX2J1aWxkLmM6MzQ0OjI0OiBub3RlOiByZW1vdmUgY29uc3RhbnQgdG8gc2lsZW5j
ZSB0aGlzIHdhcm5pbmcKICAgIGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9NMF9NRU1b
MF0gKQogICAgICAgICAgICAgICAgICAgICAgfl5+fn5+fn5+fn5+fn5+fn5+fn5+fgoxIGVycm9y
IGdlbmVyYXRlZC4KCk9idmlvdXNseSBuZWl0aGVyIG9mIHRoZSB0d28gc3VnZ2VzdGlvbnMgYXJl
IGFuIG9wdGlvbiBoZXJlLiBPZGRseQplbm91Z2ggc3dhcHBpbmcgdGhlIG9wZXJhbmRzIG9mIHRo
ZSAmJiBoZWxwcywgd2hpbGUgZS5nLiBjYXN0aW5nIG9yCnBhcmVudGhlc2l6aW5nIGRvZXNuJ3Qu
IEFub3RoZXIgd29ya2FibGUgdmFyaWFudCBsb29rcyB0byBiZSB0aGUgdXNlIG9mCiEhIG9uIHRo
ZSBjb25zdGFudC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkFja2VkLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCnYzOiBBZGQgY29tbWVudHMu
CnYyOiBBbHNvIGFkanVzdCB0aGUgQXJtIGluY2FybmF0aW9uIG9mIHRoZSBzYW1lIGNvbnN0cnVj
dC4KLS0tCkknbSBvcGVuIHRvIGdvaW5nIHRoZSAhISBvciB5ZXQgc29tZSBkaWZmZXJlbnQgcm91
dGUgKGJ1dCBub3QgcmVhbGx5IHRoZQpzdWdnZXN0ZWQgc3RybGVuKCkgb25lKS4gTm8gbWF0dGVy
IHdoaWNoIG9uZSB3ZSBjaG9vc2UsIEknbSBhZnJhaWQgaXQgaXMKZ29pbmcgdG8gcmVtYWluIGd1
ZXNzd29yayB3aGF0IG5ld2VyIChhbmQgZnV0dXJlKSB2ZXJzaW9ucyBvZiBjbGFuZyB3aWxsCmNo
b2tlIG9uLgoKLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYwpAQCAtMjUxMyw3ICsyNTEzLDggQEAgaW50IF9faW5pdCBjb25z
dHJ1Y3RfZG9tMChzdHJ1Y3QgZG9tYWluCiAKICAgICBwcmludGsoIioqKiBMT0FESU5HIERPTUFJ
TiAwICoqKlxuIik7CiAKLSAgICBpZiAoICFkb20wX21lbV9zZXQgJiYgQ09ORklHX0RPTTBfTUVN
WzBdICkKKyAgICAvKiBUaGUgb3JkZXJpbmcgb2Ygb3BlcmFuZHMgaXMgdG8gd29yayBhcm91bmQg
YSBjbGFuZzUgaXNzdWUuICovCisgICAgaWYgKCBDT05GSUdfRE9NMF9NRU1bMF0gJiYgIWRvbTBf
bWVtX3NldCApCiAgICAgICAgIHBhcnNlX2RvbTBfbWVtKENPTkZJR19ET00wX01FTSk7CiAKICAg
ICBpZiAoIGRvbTBfbWVtIDw9IDAgKQotLS0gYS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKQEAgLTMxNyw3ICszMTcsOCBAQCB1bnNpZ25l
ZCBsb25nIF9faW5pdCBkb20wX2NvbXB1dGVfbnJfcGFnCiAgICAgdW5zaWduZWQgbG9uZyBhdmFp
bCA9IDAsIG5yX3BhZ2VzLCBtaW5fcGFnZXMsIG1heF9wYWdlczsKICAgICBib29sIG5lZWRfcGFn
aW5nOwogCi0gICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSApCisg
ICAgLyogVGhlIG9yZGVyaW5nIG9mIG9wZXJhbmRzIGlzIHRvIHdvcmsgYXJvdW5kIGEgY2xhbmc1
IGlzc3VlLiAqLworICAgIGlmICggQ09ORklHX0RPTTBfTUVNWzBdICYmICFkb20wX21lbV9zZXQg
KQogICAgICAgICBwYXJzZV9kb20wX21lbShDT05GSUdfRE9NMF9NRU0pOwogCiAgICAgZm9yX2Vh
Y2hfbm9kZV9tYXNrICggbm9kZSwgZG9tMF9ub2RlcyApCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
