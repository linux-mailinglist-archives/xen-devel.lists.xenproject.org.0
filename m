Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82798D132
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 12:46:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxqlP-0008KQ-Mx; Wed, 14 Aug 2019 10:44:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=99LO=WK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxqlO-0008KK-05
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 10:44:18 +0000
X-Inumbo-ID: 743368de-be80-11e9-99b1-d371aab09a90
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 743368de-be80-11e9-99b1-d371aab09a90;
 Wed, 14 Aug 2019 10:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565779453;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SC80ZRXSvWOjaGJrsmfJ2nUUaQrtVj8HF8eElY/TYYY=;
 b=GezYEXoD8VSdfWCDcYTAN4Lzw7n8Cjz020mA6JD/ULPGclO37SIodxYF
 I6qxmMI02i865r65oXK1iCbj3T6nbU0fZA7NnaSFLKZxI1QSlVgDdkIJo
 cqR96EaiYpfj2YYLmhJfRc7Hve4LSbxxc9biL+iQswl1AQz225fm1CMr/ k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 96IZGFmz6Nhzs/83vkRDTDAWQzE25HQpNRTq4GOe6y2TNw0LCV84h1hqHwfEMIjixof0Y7Re2J
 GOg9V8o4bD9vk0lP//0anSq2Kv8i+gxA6WnZiRS+4wElBwIFyhZhvPyEtNEpA2ZCZH8bW5WV5c
 XRU4wZvuYLv1bq8GIfxH5/cELESWIL5CfGPjjUZk9U3w2e4w1oKt+igEs1OzLy5UqwE/Ad8A/+
 FOVU/sLADOdLZ/SAGju5NfStdkCzsq3p4av0UxNrREhPqOHSyWt8JEcfsw0QUbiVCy0DLEWlw3
 UaU=
X-SBRS: 2.7
X-MesageID: 4428476
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,384,1559534400"; 
   d="scan'208";a="4428476"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 14 Aug 2019 11:44:04 +0100
Message-ID: <20190814104404.17739-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Annotate pagetables with STT_OBJECT
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50cm9kdWNlIGEgbmV3IEVORERBVEEoKSBoZWxwZXIgd2hpY2ggc2V0cyB0eXBlIGFuZCBzaXpl
IHRvZ2V0aGVyLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2Jvb3QveDg2XzY0LlMgICB8IDE4ICsrKysrKysrKy0t
LS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9jb25maWcuaCB8ICA1ICsrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2Jvb3QveDg2XzY0LlMgYi94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUwpp
bmRleCA1YWIyNGQ3M2ZjLi44YTRjYzdlNzQ3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9v
dC94ODZfNjQuUworKysgYi94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUwpAQCAtNjUsNyArNjUs
NyBAQCBsMV9pZGVudG1hcDoKICAgICAgICAgLmVuZGlmCiAgICAgICAgIHBmbiA9IHBmbiArIDEK
ICAgICAgICAgLmVuZHIKLSAgICAgICAgLnNpemUgbDFfaWRlbnRtYXAsIC4gLSBsMV9pZGVudG1h
cAorRU5EREFUQShsMV9pZGVudG1hcCkKIAogLyoKICAqIF9fcGFnZV90YWJsZXNfc3RhcnQgZG9l
cyBub3QgY292ZXIgbDFfaWRlbnRtYXAgYmVjYXVzZSBpdCAobDFfaWRlbnRtYXApCkBAIC04Niw3
ICs4Niw3IEBAIEdMT0JBTChsMl9pZGVudG1hcCkKICAgICAgICAgaWR4ID0gaWR4ICsgMQogICAg
ICAgICAuZW5kcgogICAgICAgICAuZmlsbCA0ICogTDJfUEFHRVRBQkxFX0VOVFJJRVMgLSA4LCA4
LCAwCi0gICAgICAgIC5zaXplIGwyX2lkZW50bWFwLCAuIC0gbDJfaWRlbnRtYXAKK0VORERBVEEo
bDJfaWRlbnRtYXApCiAKIC8qCiAgKiBMMiBtYXBwaW5nIHRoZSAxR0IgWGVuIHRleHQvZGF0YS9i
c3MgcmVnaW9uLiAgQXQgYm9vdCBpdCBtYXBzIDE2TUIgZnJvbQpAQCAtMTAxLDcgKzEwMSw3IEBA
IEdMT0JBTChsMl94ZW5tYXApCiAgICAgICAgIGlkeCA9IGlkeCArIDEKICAgICAgICAgLmVuZHIK
ICAgICAgICAgLmZpbGwgTDJfUEFHRVRBQkxFX0VOVFJJRVMgLSA4LCA4LCAwCi0gICAgICAgIC5z
aXplIGwyX3hlbm1hcCwgLiAtIGwyX3hlbm1hcAorRU5EREFUQShsMl94ZW5tYXApCiAKIC8qIEwy
IG1hcHBpbmcgdGhlIGZpeG1hcC4gIFVzZXMgMXggNGsgcGFnZS4gKi8KIGwyX2ZpeG1hcDoKQEAg
LTExNCw3ICsxMTQsNyBAQCBsMl9maXhtYXA6CiAgICAgICAgIC5lbmRpZgogICAgICAgICBpZHgg
PSBpZHggKyAxCiAgICAgICAgIC5lbmRyCi0gICAgICAgIC5zaXplIGwyX2ZpeG1hcCwgLiAtIGwy
X2ZpeG1hcAorRU5EREFUQShsMl9maXhtYXApCiAKIC8qIElkZW50aXR5IG1hcCwgY292ZXJpbmcg
dGhlIDQgbDJfaWRlbnRtYXAgdGFibGVzLiAgVXNlcyAxeCA0ayBwYWdlLiAqLwogbDNfaWRlbnRt
YXA6CkBAIC0xMjQsNyArMTI0LDcgQEAgbDNfaWRlbnRtYXA6CiAgICAgICAgIGlkeCA9IGlkeCAr
IDEKICAgICAgICAgLmVuZHIKICAgICAgICAgLmZpbGwgTDNfUEFHRVRBQkxFX0VOVFJJRVMgLSA0
LCA4LCAwCi0gICAgICAgIC5zaXplIGwzX2lkZW50bWFwLCAuIC0gbDNfaWRlbnRtYXAKK0VORERB
VEEobDNfaWRlbnRtYXApCiAKIC8qIEwzIG1hcHBpbmcgdGhlIGZpeG1hcC4gIFVzZXMgMXggNGsg
cGFnZS4gKi8KIGwzX3hlbm1hcDoKQEAgLTEzOSw3ICsxMzksNyBAQCBsM194ZW5tYXA6CiAgICAg
ICAgIC5lbmRpZgogICAgICAgICBpZHggPSBpZHggKyAxCiAgICAgICAgIC5lbmRyCi0gICAgICAg
IC5zaXplIGwzX3hlbm1hcCwgLiAtIGwzX3hlbm1hcAorRU5EREFUQShsM194ZW5tYXApCiAKIC8q
IFRvcC1sZXZlbCBtYXN0ZXIgKGFuZCBpZGxlLWRvbWFpbikgcGFnZSBkaXJlY3RvcnkuICovCiBH
TE9CQUwoaWRsZV9wZ190YWJsZSkKQEAgLTE1NSw3ICsxNTUsNyBAQCBHTE9CQUwoaWRsZV9wZ190
YWJsZSkKICAgICAgICAgLmVuZGlmCiAgICAgICAgIGlkeCA9IGlkeCArIDEKICAgICAgICAgLmVu
ZHIKLSAgICAgICAgLnNpemUgaWRsZV9wZ190YWJsZSwgLiAtIGlkbGVfcGdfdGFibGUKK0VORERB
VEEoaWRsZV9wZ190YWJsZSkKIAogR0xPQkFMKF9fcGFnZV90YWJsZXNfZW5kKQogCkBAIC0xNjUs
OCArMTY1LDggQEAgR0xPQkFMKF9fcGFnZV90YWJsZXNfZW5kKQogCiBHTE9CQUwobDJfYm9vdG1h
cCkKICAgICAgICAgLmZpbGwgNCAqIEwyX1BBR0VUQUJMRV9FTlRSSUVTLCA4LCAwCi0gICAgICAg
IC5zaXplIGwyX2Jvb3RtYXAsIC4gLSBsMl9ib290bWFwCitFTkREQVRBKGwyX2Jvb3RtYXApCiAK
IEdMT0JBTChsM19ib290bWFwKQogICAgICAgICAuZmlsbCBMM19QQUdFVEFCTEVfRU5UUklFUywg
OCwgMAotICAgICAgICAuc2l6ZSBsM19ib290bWFwLCAuIC0gbDNfYm9vdG1hcAorRU5EREFUQShs
M19ib290bWFwKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9jb25maWcuaCBiL3hl
bi9pbmNsdWRlL2FzbS14ODYvY29uZmlnLmgKaW5kZXggMjJkYzc5NWVlYS4uMzU3MDU0NDFmZiAx
MDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9jb25maWcuaAorKysgYi94ZW4vaW5jbHVk
ZS9hc20teDg2L2NvbmZpZy5oCkBAIC01Niw2ICs1NiwxMSBAQAogI2RlZmluZSBHTE9CQUwobmFt
ZSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAuZ2xvYmwgbmFtZTsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAogICBuYW1lOgorCisjZGVmaW5lIEVORERBVEEobmFt
ZSkgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgLnR5cGUgbmFtZSwgU1RUX09CSkVD
VDsgICAgICAgICAgICAgICAgICAgICBcCisgICAgLnNpemUgbmFtZSwgLiAtIG5hbWUKKwogI2Vu
ZGlmCiAKICNkZWZpbmUgTlJfaHlwZXJjYWxscyA2NAotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
