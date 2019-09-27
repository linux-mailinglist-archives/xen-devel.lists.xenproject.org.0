Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E84C01AF
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 11:03:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDm7Y-0005Oc-66; Fri, 27 Sep 2019 09:01:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDm7W-0005Nu-Vd
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 09:00:59 +0000
X-Inumbo-ID: 4e3d9b85-e105-11e9-9670-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4e3d9b85-e105-11e9-9670-12813bfff9fa;
 Fri, 27 Sep 2019 09:00:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2CC5AAFF1;
 Fri, 27 Sep 2019 09:00:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 11:00:48 +0200
Message-Id: <20190927090048.28872-7-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190927090048.28872-1-jgross@suse.com>
References: <20190927090048.28872-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v1 6/6] xen: add runtime parameter reading
 support to hypfs
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIHN1cHBvcnQgdG8gcmVhZCB2YWx1ZXMgb2YgaHlwZXJ2aXNvciBydW50aW1lIHBhcmFtZXRl
cnMgdmlhIHRoZQpoeXBlcnZpc29yIGZpbGUgc3lzdGVtIGZvciBhbGwgdW5zaWduZWQgaW50ZWdl
ciB0eXBlIHJ1bnRpbWUgcGFyYW1ldGVycy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KLS0tCiBkb2NzL21pc2MvaHlwZnMtcGF0aHMucGFuZG9jIHwgIDYg
KysrKysrCiB4ZW4vY29tbW9uL2tlcm5lbC5jICAgICAgICAgIHwgMjcgKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kb2NzL21pc2MvaHlwZnMtcGF0aHMucGFuZG9jIGIvZG9jcy9taXNjL2h5cGZzLXBhdGhz
LnBhbmRvYwppbmRleCA1NmViZGNkOGJlLi5kNzEwYjgzMTg1IDEwMDY0NAotLS0gYS9kb2NzL21p
c2MvaHlwZnMtcGF0aHMucGFuZG9jCisrKyBiL2RvY3MvbWlzYy9oeXBmcy1wYXRocy5wYW5kb2MK
QEAgLTYyLDMgKzYyLDkgQEAgaHlwZXJ2aXNvci4KICMjIyMgL2J1aWxkaW5mby9jb25maWcgPSBT
VFJJTkcKIAogVGhlIGNvbnRlbnRzIG9mIHRoZSBgeGVuLy5jb25maWdgIGZpbGUgYXQgdGhlIHRp
bWUgb2YgdGhlIGh5cGVydmlzb3IgYnVpbGQuCisKKyMjIyMgL3BhcmFtcy8KKworQSBkaXJlY3Rv
cnkgb2YgcnVudGltZSBwYXJhbWV0ZXJzICh0aG9zZSBjYW4gYmUgc2V0IHZpYSB4bCBzZXQtcGFy
YW1ldGVycykuCitUaGUgZGVzY3JpcHRpb24gb2YgdGhlIGRpZmZlcmVudCBwYXJhbWV0ZXJzIGNh
biBiZSBmb3VuZCBpbgorYGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvY2AuCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL2tlcm5lbC5jIGIveGVuL2NvbW1vbi9rZXJuZWwuYwppbmRleCA3
NjA5MTdkYWI1Li4wOTc4N2I1YTM0IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2tlcm5lbC5jCisr
KyBiL3hlbi9jb21tb24va2VybmVsLmMKQEAgLTcsNiArNyw3IEBACiAjaW5jbHVkZSA8eGVuL2lu
aXQuaD4KICNpbmNsdWRlIDx4ZW4vbGliLmg+CiAjaW5jbHVkZSA8eGVuL2Vycm5vLmg+CisjaW5j
bHVkZSA8eGVuL2h5cGZzLmg+CiAjaW5jbHVkZSA8eGVuL3ZlcnNpb24uaD4KICNpbmNsdWRlIDx4
ZW4vc2NoZWQuaD4KICNpbmNsdWRlIDx4ZW4vcGFnaW5nLmg+CkBAIC0zMjAsNiArMzIxLDMyIEBA
IGludCBjbWRsaW5lX3N0cmNtcChjb25zdCBjaGFyICpmcmFnLCBjb25zdCBjaGFyICpuYW1lKQog
ICAgIH0KIH0KIAorc3RhdGljIHN0cnVjdCBoeXBmc19kaXIgaHlwZnNfcGFyYW1zID0geworICAg
IC5saXN0ID0gTElTVF9IRUFEX0lOSVQoaHlwZnNfcGFyYW1zLmxpc3QpLAorfTsKKworc3RhdGlj
IGludCBfX2luaXQgcnVudGltZV9wYXJhbV9oeXBmc19hZGQodm9pZCkKK3sKKyAgICBjb25zdCBz
dHJ1Y3Qga2VybmVsX3BhcmFtICpwYXJhbTsKKyAgICBpbnQgcmV0OworCisgICAgcmV0ID0gaHlw
ZnNfbmV3X2RpcigmaHlwZnNfcm9vdCwgInBhcmFtcyIsICZoeXBmc19wYXJhbXMpOworICAgIEJV
R19PTihyZXQpOworCisgICAgZm9yICggcGFyYW0gPSBfX3BhcmFtX3N0YXJ0OyBwYXJhbSA8IF9f
cGFyYW1fZW5kOyBwYXJhbSsrICkKKyAgICB7CisgICAgICAgIGlmICggcGFyYW0tPnR5cGUgPT0g
T1BUX1VJTlQgJiYgcGFyYW0tPmxlbiA9PSBzaXplb2YodW5zaWduZWQgaW50KSApCisgICAgICAg
IHsKKyAgICAgICAgICAgIHJldCA9IGh5cGZzX25ld19lbnRyeV91aW50KCZoeXBmc19wYXJhbXMs
IHBhcmFtLT5uYW1lLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVu
c2lnbmVkIGludCAqKShwYXJhbS0+cGFyLnZhcikpOworICAgICAgICAgICAgQlVHX09OKHJldCk7
CisgICAgICAgIH0KKyAgICB9CisKKyAgICByZXR1cm4gMDsKK30KK19faW5pdGNhbGwocnVudGlt
ZV9wYXJhbV9oeXBmc19hZGQpOworCiB1bnNpZ25lZCBpbnQgdGFpbnRlZDsKIAogLyoqCi0tIAoy
LjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
