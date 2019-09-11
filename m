Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969E7B04C1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 22:10:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i88s0-00037x-0L; Wed, 11 Sep 2019 20:05:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L0xq=XG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i88ry-00036p-5L
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 20:05:38 +0000
X-Inumbo-ID: 7928fc90-d4cf-11e9-83dd-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7928fc90-d4cf-11e9-83dd-12813bfff9fa;
 Wed, 11 Sep 2019 20:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568232317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KfxSG6tk+37JqGd8jvH6e0+GTDL4sE5/HpeLBPpTwb0=;
 b=WuX1rwTzssXv9O2v7azQkJwJ9JE4rhx6HOVUd5UHe43TngzPgo1y5tjv
 px7tCMSz+fN/iDhjhLUnZLvtcc1hTZZTlI5xo4oURyDN4ZQHJ5VhzTWkD
 m4p7YGcRfzyLKPWKKXeGLyvZQLk6h+nZbzUUEHCyIT9riBkjSXSG8SD5m 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SjzUhlq534F1vTly/5WySxx/tew3DnAeD2PyBNLhkCbwEx//twfzXMGUUPk98kZhseDlKIDE7y
 Bc1eh3OdmpWVDDTAXnzCdj4a6uwqk6aEhuioPKHVu1P1AfYyh+Itn9PE0qNcR557RvWvBx8q++
 lhcQhK9XvyDdYBxrk3cRKQ4JGEabBjKDwb59LfCWI9zPRP5uyhzHyyBQmqBQq0hPnnYnCxz6EC
 hI0PG0/C667zF+TM501gak+LO1Bgch6q/x83YhzINafz3XGCEmkrmJeQHdT9rBHhlYIg3FKK0W
 bfo=
X-SBRS: 2.7
X-MesageID: 5506249
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,494,1559534400"; 
   d="scan'208";a="5506249"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 11 Sep 2019 21:05:04 +0100
Message-ID: <20190911200504.5693-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190911200504.5693-1-andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 8/8] x86/cpuid: Enable CPUID Faulting for the
 control domain
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

VGhlIGRvbWFpbiBidWlsZGVyIG5vIGxvbmdlciB1c2VzIENQVUlEIGluc3RydWN0aW9ucyBmb3Ig
cG9saWN5IGRlY2lzaW9ucy4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29t
PgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMgfCAxOSArKy0tLS0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jIGIveGVuL2FyY2gv
eDg2L2NwdS9jb21tb24uYwppbmRleCA4ZGU0YTQ0YzFhLi4yZTg4MzgzNWI4IDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9u
LmMKQEAgLTE2OCwyMyArMTY4LDggQEAgdm9pZCBjdHh0X3N3aXRjaF9sZXZlbGxpbmcoY29uc3Qg
c3RydWN0IHZjcHUgKm5leHQpCiAJCSAqLwogCQlpZiAobmV4dGQgJiYgaXNfaWRsZV9kb21haW4o
bmV4dGQpKQogCQkJcmV0dXJuOwotCQkvKgotCQkgKiBXZSAqc2hvdWxkKiBiZSBlbmFibGluZyBm
YXVsdGluZyBmb3IgdGhlIGNvbnRyb2wgZG9tYWluLgotCQkgKgotCQkgKiBVbmZvcnR1bmF0ZWx5
LCB0aGUgZG9tYWluIGJ1aWxkZXIgKGhhdmluZyBvbmx5IGV2ZXIgYmVlbiBhCi0JCSAqIFBWIGd1
ZXN0KSBleHBlY3RzIHRvIGJlIGFibGUgdG8gc2VlIGhvc3QgY3B1aWQgc3RhdGUgaW4gYQotCQkg
KiBuYXRpdmUgQ1BVSUQgaW5zdHJ1Y3Rpb24sIHRvIGNvcnJlY3RseSBidWlsZCBhIENQVUlEIHBv
bGljeQotCQkgKiBmb3IgSFZNIGd1ZXN0cyAobm90YWJseSB0aGUgeHN0YXRlIGxlYXZlcykuCi0J
CSAqCi0JCSAqIFRoaXMgbG9naWMgaXMgZnVuZGltZW50YWxseSBicm9rZW4gZm9yIEhWTSB0b29s
c3RhY2sKLQkJICogZG9tYWlucywgYW5kIGZhdWx0aW5nIGNhdXNlcyBQViBndWVzdHMgdG8gYmVo
YXZlIGxpa2UgSFZNCi0JCSAqIGd1ZXN0cyBmcm9tIHRoZWlyIHBvaW50IG9mIHZpZXcuCi0JCSAq
Ci0JCSAqIEZ1dHVyZSBkZXZlbG9wbWVudCBwbGFucyB3aWxsIG1vdmUgcmVzcG9uc2liaWxpdHkg
Zm9yCi0JCSAqIGdlbmVyYXRpbmcgdGhlIG1heGltdW0gZnVsbCBjcHVpZCBwb2xpY3kgaW50byBY
ZW4sIGF0IHdoaWNoCi0JCSAqIHRoaXMgcHJvYmxlbSB3aWxsIGRpc2FwcGVhci4KLQkJICovCi0J
CXNldF9jcHVpZF9mYXVsdGluZyhuZXh0ZCAmJiAhaXNfY29udHJvbF9kb21haW4obmV4dGQpICYm
CisKKwkJc2V0X2NwdWlkX2ZhdWx0aW5nKG5leHRkICYmCiAJCQkJICAgKGlzX3B2X2RvbWFpbihu
ZXh0ZCkgfHwKIAkJCQkgICAgbmV4dC0+YXJjaC5tc3JzLT4KIAkJCQkgICAgbWlzY19mZWF0dXJl
c19lbmFibGVzLmNwdWlkX2ZhdWx0aW5nKSk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
