Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26FD18BB1A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 16:28:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEx4A-0003NY-GL; Thu, 19 Mar 2020 15:26:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kuhB=5E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jEx49-0003NK-1T
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 15:26:37 +0000
X-Inumbo-ID: 03106b1c-69f6-11ea-bec1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03106b1c-69f6-11ea-bec1-bc764e2007e4;
 Thu, 19 Mar 2020 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584631592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5tS2vBkJkuSxuO4vTRChjIHi4mAWIH1qpcU8kqQhNBc=;
 b=V63/hn15kc1AQbITAtNWudX87OsF4p1FtrTOVQKuI6sJ7TLQvJAL5uJ5
 8vWvJiZYYINbwB/6UTvW1VGujsKl02i2HyQWGBqK6EVdqNAz4YszjL6RS
 Jr4yMGzk9JcEABQUMS5S4ZO5V5Xs5iOlpfrvhBXghivk6qebyYwoUn9+u s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XQeZWB2RRICaDFyFcxUfUPBLGj64th5TB8ARXqbUWRhnZbxQputlZOOwFkRF/obw3ti/GkhF3E
 r1q6SrS2moQRlb97wH17i+KcrsOrNuIyPHhQyiBO8xVClzIbUtzOg3f+qI0FHlNx34wJjVDvJl
 7PhrU+1EP70wxYn6IKyDzm+3zvDPfwOOeYqDkOb2IgB6T89p4R/OpWzzqGvLfl2vsYVaGeTyaw
 JZdk0Eqe4EShwzqH/gxMBTjk+YZDocpvi00mlfx22BsTX4S/131gRIPFkpcPNATeXdESNYMxjZ
 wRo=
X-SBRS: 2.7
X-MesageID: 14622629
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,572,1574139600"; d="scan'208";a="14622629"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 19 Mar 2020 15:26:17 +0000
Message-ID: <20200319152622.31758-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200319152622.31758-1-andrew.cooper3@citrix.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/6] x86/ucode: Remove declarations for
 non-external functions
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

TmVpdGhlciBtaWNyb2NvZGVfZnJlZV9wYXRjaCgpIG5vciBlYXJseV9taWNyb2NvZGVfdXBkYXRl
X2NwdSgpIGhhdmUgZXh0ZXJuYWwKY2FsbGVycy4gIE1ha2UgdGhlbSBzdGF0aWMuCgplYXJseV9t
aWNyb2NvZGVfdXBkYXRlX2NwdSgpJ3Mgc29sZSBjYWxsZXIgaXMgZm9sbG93aW5nIGEgdXNlIG9m
Cm1pY3JvY29kZV9vcHMsIG1ha2luZyB0aGUgZXJyb3IgcGF0aCBkZWFkLiAgRHJvcCBpdCBhcyB3
ZWxsLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMgICAgICAgIHwgNyArKy0tLS0t
CiB4ZW4vaW5jbHVkZS9hc20teDg2L21pY3JvY29kZS5oIHwgMiAtLQogeGVuL2luY2x1ZGUvYXNt
LXg4Ni9wcm9jZXNzb3IuaCB8IDEgLQogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jIGIv
eGVuL2FyY2gveDg2L21pY3JvY29kZS5jCmluZGV4IDY5MDdiMzEyY2YuLjI3YTg4YzY4MjYgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYworKysgYi94ZW4vYXJjaC94ODYvbWlj
cm9jb2RlLmMKQEAgLTI1MCw3ICsyNTAsNyBAQCBzdGF0aWMgc3RydWN0IG1pY3JvY29kZV9wYXRj
aCAqcGFyc2VfYmxvYihjb25zdCBjaGFyICpidWYsIHNpemVfdCBsZW4pCiAgICAgcmV0dXJuIE5V
TEw7CiB9CiAKLXZvaWQgbWljcm9jb2RlX2ZyZWVfcGF0Y2goc3RydWN0IG1pY3JvY29kZV9wYXRj
aCAqbWljcm9jb2RlX3BhdGNoKQorc3RhdGljIHZvaWQgbWljcm9jb2RlX2ZyZWVfcGF0Y2goc3Ry
dWN0IG1pY3JvY29kZV9wYXRjaCAqbWljcm9jb2RlX3BhdGNoKQogewogICAgIG1pY3JvY29kZV9v
cHMtPmZyZWVfcGF0Y2gobWljcm9jb2RlX3BhdGNoLT5tYyk7CiAgICAgeGZyZWUobWljcm9jb2Rl
X3BhdGNoKTsKQEAgLTc2MywxNiArNzYzLDEzIEBAIGludCBtaWNyb2NvZGVfdXBkYXRlX29uZShi
b29sIHN0YXJ0X3VwZGF0ZSkKIH0KIAogLyogQlNQIGNhbGxzIHRoaXMgZnVuY3Rpb24gdG8gcGFy
c2UgdWNvZGUgYmxvYiBhbmQgdGhlbiBhcHBseSBhbiB1cGRhdGUuICovCi1pbnQgX19pbml0IGVh
cmx5X21pY3JvY29kZV91cGRhdGVfY3B1KHZvaWQpCitzdGF0aWMgaW50IF9faW5pdCBlYXJseV9t
aWNyb2NvZGVfdXBkYXRlX2NwdSh2b2lkKQogewogICAgIGludCByYyA9IDA7CiAgICAgY29uc3Qg
dm9pZCAqZGF0YSA9IE5VTEw7CiAgICAgc2l6ZV90IGxlbjsKICAgICBzdHJ1Y3QgbWljcm9jb2Rl
X3BhdGNoICpwYXRjaDsKIAotICAgIGlmICggIW1pY3JvY29kZV9vcHMgKQotICAgICAgICByZXR1
cm4gLUVOT1NZUzsKLQogICAgIGlmICggdWNvZGVfYmxvYi5zaXplICkKICAgICB7CiAgICAgICAg
IGxlbiA9IHVjb2RlX2Jsb2Iuc2l6ZTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
bWljcm9jb2RlLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21pY3JvY29kZS5oCmluZGV4IDdkNWEx
ZjhlOGEuLjFhMmJiYWNjNmMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWljcm9j
b2RlLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9taWNyb2NvZGUuaApAQCAtNDEsNiArNDEs
NCBAQCBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSB7CiBERUNMQVJFX1BFUl9DUFUoc3RydWN0IGNwdV9z
aWduYXR1cmUsIGNwdV9zaWcpOwogZXh0ZXJuIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfb3BzICpt
aWNyb2NvZGVfb3BzOwogCi12b2lkIG1pY3JvY29kZV9mcmVlX3BhdGNoKHN0cnVjdCBtaWNyb2Nv
ZGVfcGF0Y2ggKnBhdGNoKTsKLQogI2VuZGlmIC8qIEFTTV9YODZfX01JQ1JPQ09ERV9IICovCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9wcm9jZXNzb3IuaAppbmRleCBiMmIxOWEwMmNkLi44OTVjNzAzMmI5IDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oCisrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvcHJvY2Vzc29yLmgKQEAgLTU4MSw3ICs1ODEsNiBAQCBpbnQgZ3Vlc3Rfd3Jtc3JfeGVu
KHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBpZHgsIHVpbnQ2NF90IHZhbCk7CiAKIHZvaWQgbWlj
cm9jb2RlX3NldF9tb2R1bGUodW5zaWduZWQgaW50KTsKIGludCBtaWNyb2NvZGVfdXBkYXRlKFhF
Tl9HVUVTVF9IQU5ETEVfUEFSQU0oY29uc3Rfdm9pZCksIHVuc2lnbmVkIGxvbmcgbGVuKTsKLWlu
dCBlYXJseV9taWNyb2NvZGVfdXBkYXRlX2NwdSh2b2lkKTsKIGludCBlYXJseV9taWNyb2NvZGVf
aW5pdCh2b2lkKTsKIGludCBtaWNyb2NvZGVfdXBkYXRlX29uZShib29sIHN0YXJ0X3VwZGF0ZSk7
CiBpbnQgbWljcm9jb2RlX2luaXRfaW50ZWwodm9pZCk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
