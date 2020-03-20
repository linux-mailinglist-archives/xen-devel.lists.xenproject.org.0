Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA1C18DA19
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 22:27:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFP8c-0003tJ-NJ; Fri, 20 Mar 2020 21:25:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EUly=5F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jFP8b-0003t6-2f
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 21:25:05 +0000
X-Inumbo-ID: 434b48b8-6af1-11ea-a6c1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 434b48b8-6af1-11ea-a6c1-bc764e2007e4;
 Fri, 20 Mar 2020 21:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584739504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s0Zn8myHzjApfW+BC4Q0BA7rfRL+0OX3tz6cOs5uv+8=;
 b=fPlCFntXIqtYAZ/iIoew6FT38+PJceG/MiYzvkDz86cwZ/4yXZoPeOVD
 9VVc92SzLFYhrNjdWxzBdBZ9WYXoQO+pBqtsN4GfJ8sFZMG9JBIk/n7jN
 wExoqDGb85eyVcyYdN8ez2hdAhVvKFhffUDtoWLYyxwFJsyYY20dLsWLY g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JRHYcfyRl5KSUmPI3Ohe9Nq4kMcJOVMvaXu89Mq1qCEr/S+FFeoMI/DgBjxkOsSh+9jR+PVWAy
 oQ97mB4qZMzUL0EmNQRcDu3f86J94/T6RK8T4t18UXougtk3pv/8dzF7Y9EIf11PY0CZBujTqT
 rjpWYTWt41826lNJqe5TPFGuj3CyLP1PEAdpECTwwWV60TkjPLdg1CJHs7tTuWMbXSU6Mkw+HP
 qNJn10qMf/aAtFcy5r2DlFMBycKafvNkTw55hYwjfA2GV+En+W5mNAO+IR9cA9x0DccZxDxVSc
 ryk=
X-SBRS: 2.7
X-MesageID: 14795899
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,286,1580792400"; d="scan'208";a="14795899"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 20 Mar 2020 21:24:52 +0000
Message-ID: <20200320212453.21685-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200320212453.21685-1-andrew.cooper3@citrix.com>
References: <20200320212453.21685-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/4] xen: Introduce a xmemdup_bytes() helper
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

VXNlIGl0IHRvIHNpbXBsaWZ5IHRoZSB4ODYgbWljcm9jb2RlIGxvZ2ljLCB0YWtpbmcgdGhlIG9w
cG9ydHVuaXR5IHRvIGRyb3AgdGhlCi1FTk9NRU0gcHJpbnRrcy4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9jcHUv
bWljcm9jb2RlL2FtZC5jICAgfCAgOSArKy0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9jcHUvbWljcm9j
b2RlL2ludGVsLmMgfCAgNyArKy0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oICAgICAg
ICAgIHwgMTEgKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUv
YW1kLmMgYi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9hbWQuYwppbmRleCAwOTk4YTM2YjVj
Li4xMmEzYjZiMzJjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9hbWQu
YworKysgYi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9hbWQuYwpAQCAtMjk5LDExICsyOTks
MTAgQEAgc3RhdGljIGludCBnZXRfdWNvZGVfZnJvbV9idWZmZXJfYW1kKAogICAgICAgICByZXR1
cm4gLUVJTlZBTDsKICAgICB9CiAKLSAgICBtY19hbWQtPm1wYiA9IHhtYWxsb2NfYnl0ZXMobXBi
dWYtPmxlbik7CisgICAgbWNfYW1kLT5tcGIgPSB4bWVtZHVwX2J5dGVzKG1wYnVmLT5kYXRhLCBt
cGJ1Zi0+bGVuKTsKICAgICBpZiAoICFtY19hbWQtPm1wYiApCiAgICAgICAgIHJldHVybiAtRU5P
TUVNOwogICAgIG1jX2FtZC0+bXBiX3NpemUgPSBtcGJ1Zi0+bGVuOwotICAgIG1lbWNweShtY19h
bWQtPm1wYiwgbXBidWYtPmRhdGEsIG1wYnVmLT5sZW4pOwogCiAgICAgcHJfZGVidWcoIm1pY3Jv
Y29kZTogQ1BVJWQgc2l6ZSAlenUsIGJsb2NrIHNpemUgJXUgb2Zmc2V0ICV6dSBlcXVpdklEICUj
eCByZXYgJSN4XG4iLAogICAgICAgICAgICAgIHNtcF9wcm9jZXNzb3JfaWQoKSwgYnVmc2l6ZSwg
bXBidWYtPmxlbiwgKm9mZnNldCwKQEAgLTMzNiwxNCArMzM1LDEwIEBAIHN0YXRpYyBpbnQgaW5z
dGFsbF9lcXVpdl9jcHVfdGFibGUoCiAgICAgICAgIHJldHVybiAtRUlOVkFMOwogICAgIH0KIAot
ICAgIG1jX2FtZC0+ZXF1aXZfY3B1X3RhYmxlID0geG1hbGxvY19ieXRlcyhtcGJ1Zi0+bGVuKTsK
KyAgICBtY19hbWQtPmVxdWl2X2NwdV90YWJsZSA9IHhtZW1kdXBfYnl0ZXMobXBidWYtPmRhdGEs
IG1wYnVmLT5sZW4pOwogICAgIGlmICggIW1jX2FtZC0+ZXF1aXZfY3B1X3RhYmxlICkKLSAgICB7
Ci0gICAgICAgIHByaW50ayhLRVJOX0VSUiAibWljcm9jb2RlOiBDYW5ub3QgYWxsb2NhdGUgbWVt
b3J5IGZvciBlcXVpdmFsZW50IGNwdSB0YWJsZVxuIik7CiAgICAgICAgIHJldHVybiAtRU5PTUVN
OwotICAgIH0KIAotICAgIG1lbWNweShtY19hbWQtPmVxdWl2X2NwdV90YWJsZSwgbXBidWYtPmRh
dGEsIG1wYnVmLT5sZW4pOwogICAgIG1jX2FtZC0+ZXF1aXZfY3B1X3RhYmxlX3NpemUgPSBtcGJ1
Zi0+bGVuOwogCiAgICAgcmV0dXJuIDA7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L21p
Y3JvY29kZS9pbnRlbC5jIGIveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvaW50ZWwuYwppbmRl
eCA2YWM1Zjk4Njk0Li5mMjY1MTFkYTk4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L21p
Y3JvY29kZS9pbnRlbC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMK
QEAgLTMzOSwxMyArMzM5LDEwIEBAIHN0YXRpYyBsb25nIGdldF9uZXh0X3Vjb2RlX2Zyb21fYnVm
ZmVyKHN0cnVjdCBtaWNyb2NvZGVfaW50ZWwgKiptYywKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
CiAgICAgfQogCi0gICAgKm1jID0geG1hbGxvY19ieXRlcyh0b3RhbF9zaXplKTsKKyAgICAqbWMg
PSB4bWVtZHVwX2J5dGVzKG1jX2hlYWRlciwgdG90YWxfc2l6ZSk7CiAgICAgaWYgKCAqbWMgPT0g
TlVMTCApCi0gICAgewotICAgICAgICBwcmludGsoS0VSTl9FUlIgIm1pY3JvY29kZTogZXJyb3Ih
IENhbiBub3QgYWxsb2NhdGUgbWVtb3J5XG4iKTsKICAgICAgICAgcmV0dXJuIC1FTk9NRU07Ci0g
ICAgfQotICAgIG1lbWNweSgqbWMsIChjb25zdCB2b2lkICopKGJ1ZiArIG9mZnNldCksIHRvdGFs
X3NpemUpOworCiAgICAgcmV0dXJuIG9mZnNldCArIHRvdGFsX3NpemU7CiB9CiAKZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL3hlbi94bWFsbG9jLmggYi94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5o
CmluZGV4IGY1MTVjZWVlMmEuLjE2OTc5YTExN2MgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hl
bi94bWFsbG9jLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaApAQCAtNTEsNiArNTEs
MTcgQEAKICNkZWZpbmUgeG1hbGxvY19ieXRlcyhfYnl0ZXMpIF94bWFsbG9jKF9ieXRlcywgU01Q
X0NBQ0hFX0JZVEVTKQogI2RlZmluZSB4emFsbG9jX2J5dGVzKF9ieXRlcykgX3h6YWxsb2MoX2J5
dGVzLCBTTVBfQ0FDSEVfQllURVMpCiAKKy8qIEFsbG9jYXRlIHVudHlwZWQgc3RvcmFnZSBhbmQg
Y29weWluZyBhbiBleGlzdGluZyBpbnN0YW5jZS4gKi8KKyNkZWZpbmUgeG1lbWR1cF9ieXRlcyhf
c3JjLCBfbnIpICAgICAgICAgICAgICAgIFwKKyAgICAoeyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAgdW5zaWduZWQgbG9uZyBucl8gPSAoX25yKTsg
ICAgICAgICAgICAgIFwKKyAgICAgICAgdm9pZCAqZHN0XyA9IHhtYWxsb2NfYnl0ZXMobnJfKTsg
ICAgICAgIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKKyAgICAgICAgaWYgKCBkc3RfICkgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAg
ICAgICAgICAgIG1lbWNweShkc3RfLCBfc3JjLCBucl8pOyAgICAgICAgICAgIFwKKyAgICAgICAg
ZHN0XzsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICB9KQorCiAvKiBG
cmVlIGFueSBvZiB0aGUgYWJvdmUuICovCiBleHRlcm4gdm9pZCB4ZnJlZSh2b2lkICopOwogCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
