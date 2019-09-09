Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D04AD5D0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 11:35:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7G3N-0006W8-Gi; Mon, 09 Sep 2019 09:33:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7G3M-0006Vy-FM
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 09:33:44 +0000
X-Inumbo-ID: e96cb970-d2e4-11e9-ac09-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e96cb970-d2e4-11e9-ac09-12813bfff9fa;
 Mon, 09 Sep 2019 09:33:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D39BDB65E;
 Mon,  9 Sep 2019 09:33:41 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  9 Sep 2019 11:33:36 +0200
Message-Id: <20190909093339.7134-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190909093339.7134-1-jgross@suse.com>
References: <20190909093339.7134-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v3 1/4] xen/sched: populate cpupool0 only after
 all cpus are up
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
Cc: Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2ltcGxpZnkgY3B1cG9vbCBpbml0aWFsaXphdGlvbiBieSBwb3B1bGF0aW5nIGNwdXBvb2wwIHdp
dGggY3B1cyBvbmx5CmFmdGVyIGFsbCBjcHVzIGFyZSB1cC4gVGhpcyBhdm9pZHMgaGF2aW5nIHRv
IGNhbGwgdGhlIGNwdSBub3RpZmllcgpkaXJlY3RseSBmb3IgY3B1IDAuCgpXaXRoIHRoYXQgaW4g
cGxhY2UgdGhlcmUgaXMgbm8gbmVlZCB0byBjcmVhdGUgY3B1cG9vbDAgZWFybGllciwgc28KZG8g
dGhhdCBqdXN0IGJlZm9yZSBhc3NpZ25pbmcgdGhlIGNwdXMuIEluaXRpYWxpemUgZnJlZSBjcHVz
IHdpdGggYWxsCm9ubGluZSBjcHVzIGF0IHRoYXQgdGltZSBpbiBvcmRlciB0byBiZSBhYmxlIHRv
IGFkZCB0aGUgY3B1IG5vdGlmaWVyCmxhdGUsIHRvby4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClYxOiBuZXcgcGF0Y2gKLS0tCiB4ZW4vY29tbW9u
L2NwdXBvb2wuYyB8IDE4ICsrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9jcHVw
b29sLmMgYi94ZW4vY29tbW9uL2NwdXBvb2wuYwppbmRleCBmOTBlNDk2ZWRhLi5jYWVhNWJkOGIz
IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2NwdXBvb2wuYworKysgYi94ZW4vY29tbW9uL2NwdXBv
b2wuYwpAQCAtNzYyLDE4ICs3NjIsMjggQEAgc3RhdGljIHN0cnVjdCBub3RpZmllcl9ibG9jayBj
cHVfbmZiID0gewogICAgIC5ub3RpZmllcl9jYWxsID0gY3B1X2NhbGxiYWNrCiB9OwogCi1zdGF0
aWMgaW50IF9faW5pdCBjcHVwb29sX3ByZXNtcF9pbml0KHZvaWQpCitzdGF0aWMgaW50IF9faW5p
dCBjcHVwb29sX2luaXQodm9pZCkKIHsKKyAgICB1bnNpZ25lZCBpbnQgY3B1OwogICAgIGludCBl
cnI7Ci0gICAgdm9pZCAqY3B1ID0gKHZvaWQgKikobG9uZylzbXBfcHJvY2Vzc29yX2lkKCk7CisK
ICAgICBjcHVwb29sMCA9IGNwdXBvb2xfY3JlYXRlKDAsIDAsICZlcnIpOwogICAgIEJVR19PTihj
cHVwb29sMCA9PSBOVUxMKTsKICAgICBjcHVwb29sX3B1dChjcHVwb29sMCk7Ci0gICAgY3B1X2Nh
bGxiYWNrKCZjcHVfbmZiLCBDUFVfT05MSU5FLCBjcHUpOwogICAgIHJlZ2lzdGVyX2NwdV9ub3Rp
ZmllcigmY3B1X25mYik7CisKKyAgICBzcGluX2xvY2soJmNwdXBvb2xfbG9jayk7CisKKyAgICBj
cHVtYXNrX2NvcHkoJmNwdXBvb2xfZnJlZV9jcHVzLCAmY3B1X29ubGluZV9tYXApOworCisgICAg
Zm9yX2VhY2hfY3B1ICggY3B1LCAmY3B1cG9vbF9mcmVlX2NwdXMgKQorICAgICAgICBjcHVwb29s
X2Fzc2lnbl9jcHVfbG9ja2VkKGNwdXBvb2wwLCBjcHUpOworCisgICAgc3Bpbl91bmxvY2soJmNw
dXBvb2xfbG9jayk7CisKICAgICByZXR1cm4gMDsKIH0KLXByZXNtcF9pbml0Y2FsbChjcHVwb29s
X3ByZXNtcF9pbml0KTsKK19faW5pdGNhbGwoY3B1cG9vbF9pbml0KTsKIAogLyoKICAqIExvY2Fs
IHZhcmlhYmxlczoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
