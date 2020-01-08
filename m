Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0019134607
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:23:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipD96-0003mh-Vk; Wed, 08 Jan 2020 15:21:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cZrZ=25=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1ipD95-0003mH-8Q
 for xen-devel@lists.xen.org; Wed, 08 Jan 2020 15:21:19 +0000
X-Inumbo-ID: 8227be68-322a-11ea-b82c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8227be68-322a-11ea-b82c-12813bfff9fa;
 Wed, 08 Jan 2020 15:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578496874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=u+HZe/IB7NWuju/ekZtvFNhhexGEz06n0VVXB1U9a4M=;
 b=C6H2lFMhAltHiGO5Ns6L0Jfb+OUEYk3l3AbmMs0UQd3YFzpyAISs2sak
 UpRGCvDqwzXaldjchpA8o0UCVaiMt+aqXYQehge+cnBtSxMgr7F/Kuvw7
 LGl+ufZZmx80O0hDny9keWaNgo1Wa6njgtj3VlxqTcX/kXh/OutfiMs5Y s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NbrdZNDy/8773XZvZO8zNVSrjuBIlAMLf4M6CL+ejqbSJOqIN86OXwZR2Ps3f9MnAat1eXt5rL
 I5/hb4LebArVQjJXBOXfAtGECD78VXz6jBVCYi8lUug0bg+ZZEhfDnvYsb8fP9uyUSmZDg0AFT
 jKOSB2BDBcfGoWQV7vQbwBSL5PachzEw22NTcMg9xW7eIs2jH1J+/mNaxrn7xe2G3nVPLqdX7z
 xjzRnNNqF5pxf+YhbmBJeCEuBX4Hv89CfiDNTkbDZc3hXN5yEmJGTM/EOf8PjvYbiT2GYU9wZ6
 6Qo=
X-SBRS: 2.7
X-MesageID: 11004135
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="11004135"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 8 Jan 2020 15:20:57 +0000
Message-ID: <20200108152100.7630-2-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108152100.7630-1-sergey.dyasli@citrix.com>
References: <20200108152100.7630-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1 1/4] kasan: introduce set_pmd_early_shadow()
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano
 Stabellini <sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgaW5jb3JyZWN0IHRvIGNhbGwgcG1kX3BvcHVsYXRlX2tlcm5lbCgpIG11bHRpcGxlIHRp
bWVzIGZvciB0aGUKc2FtZSBwYWdlIHRhYmxlLiBYZW4gbm90aWNlcyBpdCBkdXJpbmcga2FzYW5f
cG9wdWxhdGVfZWFybHlfc2hhZG93KCk6CgogICAgKFhFTikgbW0uYzozMjIyOmQxNTV2MCBtZm4g
MzcwNGIgYWxyZWFkeSBwaW5uZWQKClRoaXMgaGFwcGVucyBmb3Iga2FzYW5fZWFybHlfc2hhZG93
X3B0ZSB3aGVuIFVTRV9TUExJVF9QVEVfUFRMT0NLUyBpcwplbmFibGVkLiBGaXggdGhpcyBieSBp
bnRyb2R1Y2luZyBzZXRfcG1kX2Vhcmx5X3NoYWRvdygpIHdoaWNoIGNhbGxzCnBtZF9wb3B1bGF0
ZV9rZXJuZWwoKSBvbmx5IG9uY2UgYW5kIHVzZXMgc2V0X3BtZCgpIGFmdGVyd2FyZHMuCgpTaWdu
ZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Ci0tLQpS
RkMgLS0+IHYxOgotIE5ldyBwYXRjaAotLS0KIG1tL2thc2FuL2luaXQuYyB8IDI1ICsrKysrKysr
KysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL2thc2FuL2luaXQuYyBiL21tL2thc2FuL2luaXQu
YwppbmRleCBjZTQ1YzQ5MWViY2QuLmE0MDc3MzIwNzc3ZiAxMDA2NDQKLS0tIGEvbW0va2FzYW4v
aW5pdC5jCisrKyBiL21tL2thc2FuL2luaXQuYwpAQCAtODEsNiArODEsMTkgQEAgc3RhdGljIGlu
bGluZSBib29sIGthc2FuX2Vhcmx5X3NoYWRvd19wYWdlX2VudHJ5KHB0ZV90IHB0ZSkKIAlyZXR1
cm4gcHRlX3BhZ2UocHRlKSA9PSB2aXJ0X3RvX3BhZ2UobG1fYWxpYXMoa2FzYW5fZWFybHlfc2hh
ZG93X3BhZ2UpKTsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkIHNldF9wbWRfZWFybHlfc2hhZG93
KHBtZF90ICpwbWQpCit7CisJc3RhdGljIGJvb2wgcG1kX3BvcHVsYXRlZCA9IGZhbHNlOworCXB0
ZV90ICplYXJseV9zaGFkb3cgPSBsbV9hbGlhcyhrYXNhbl9lYXJseV9zaGFkb3dfcHRlKTsKKwor
CWlmIChsaWtlbHkocG1kX3BvcHVsYXRlZCkpIHsKKwkJc2V0X3BtZChwbWQsIF9fcG1kKF9fcGEo
ZWFybHlfc2hhZG93KSB8IF9QQUdFX1RBQkxFKSk7CisJfSBlbHNlIHsKKwkJcG1kX3BvcHVsYXRl
X2tlcm5lbCgmaW5pdF9tbSwgcG1kLCBlYXJseV9zaGFkb3cpOworCQlwbWRfcG9wdWxhdGVkID0g
dHJ1ZTsKKwl9Cit9CisKIHN0YXRpYyBfX2luaXQgdm9pZCAqZWFybHlfYWxsb2Moc2l6ZV90IHNp
emUsIGludCBub2RlKQogewogCXZvaWQgKnB0ciA9IG1lbWJsb2NrX2FsbG9jX3RyeV9uaWQoc2l6
ZSwgc2l6ZSwgX19wYShNQVhfRE1BX0FERFJFU1MpLApAQCAtMTIwLDggKzEzMyw3IEBAIHN0YXRp
YyBpbnQgX19yZWYgemVyb19wbWRfcG9wdWxhdGUocHVkX3QgKnB1ZCwgdW5zaWduZWQgbG9uZyBh
ZGRyLAogCQluZXh0ID0gcG1kX2FkZHJfZW5kKGFkZHIsIGVuZCk7CiAKIAkJaWYgKElTX0FMSUdO
RUQoYWRkciwgUE1EX1NJWkUpICYmIGVuZCAtIGFkZHIgPj0gUE1EX1NJWkUpIHsKLQkJCXBtZF9w
b3B1bGF0ZV9rZXJuZWwoJmluaXRfbW0sIHBtZCwKLQkJCQkJbG1fYWxpYXMoa2FzYW5fZWFybHlf
c2hhZG93X3B0ZSkpOworCQkJc2V0X3BtZF9lYXJseV9zaGFkb3cocG1kKTsKIAkJCWNvbnRpbnVl
OwogCQl9CiAKQEAgLTE1Nyw4ICsxNjksNyBAQCBzdGF0aWMgaW50IF9fcmVmIHplcm9fcHVkX3Bv
cHVsYXRlKHA0ZF90ICpwNGQsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAkJCXB1ZF9wb3B1bGF0ZSgm
aW5pdF9tbSwgcHVkLAogCQkJCQlsbV9hbGlhcyhrYXNhbl9lYXJseV9zaGFkb3dfcG1kKSk7CiAJ
CQlwbWQgPSBwbWRfb2Zmc2V0KHB1ZCwgYWRkcik7Ci0JCQlwbWRfcG9wdWxhdGVfa2VybmVsKCZp
bml0X21tLCBwbWQsCi0JCQkJCWxtX2FsaWFzKGthc2FuX2Vhcmx5X3NoYWRvd19wdGUpKTsKKwkJ
CXNldF9wbWRfZWFybHlfc2hhZG93KHBtZCk7CiAJCQljb250aW51ZTsKIAkJfQogCkBAIC0xOTgs
OCArMjA5LDcgQEAgc3RhdGljIGludCBfX3JlZiB6ZXJvX3A0ZF9wb3B1bGF0ZShwZ2RfdCAqcGdk
LCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJCQlwdWRfcG9wdWxhdGUoJmluaXRfbW0sIHB1ZCwKIAkJ
CQkJbG1fYWxpYXMoa2FzYW5fZWFybHlfc2hhZG93X3BtZCkpOwogCQkJcG1kID0gcG1kX29mZnNl
dChwdWQsIGFkZHIpOwotCQkJcG1kX3BvcHVsYXRlX2tlcm5lbCgmaW5pdF9tbSwgcG1kLAotCQkJ
CQlsbV9hbGlhcyhrYXNhbl9lYXJseV9zaGFkb3dfcHRlKSk7CisJCQlzZXRfcG1kX2Vhcmx5X3No
YWRvdyhwbWQpOwogCQkJY29udGludWU7CiAJCX0KIApAQCAtMjcxLDggKzI4MSw3IEBAIGludCBf
X3JlZiBrYXNhbl9wb3B1bGF0ZV9lYXJseV9zaGFkb3coY29uc3Qgdm9pZCAqc2hhZG93X3N0YXJ0
LAogCQkJcHVkX3BvcHVsYXRlKCZpbml0X21tLCBwdWQsCiAJCQkJCWxtX2FsaWFzKGthc2FuX2Vh
cmx5X3NoYWRvd19wbWQpKTsKIAkJCXBtZCA9IHBtZF9vZmZzZXQocHVkLCBhZGRyKTsKLQkJCXBt
ZF9wb3B1bGF0ZV9rZXJuZWwoJmluaXRfbW0sIHBtZCwKLQkJCQkJbG1fYWxpYXMoa2FzYW5fZWFy
bHlfc2hhZG93X3B0ZSkpOworCQkJc2V0X3BtZF9lYXJseV9zaGFkb3cocG1kKTsKIAkJCWNvbnRp
bnVlOwogCQl9CiAKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
