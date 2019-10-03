Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B779ECA04E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 16:28:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG23M-0007J8-Ob; Thu, 03 Oct 2019 14:26:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hAba=X4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iG23L-0007J3-4D
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 14:25:59 +0000
X-Inumbo-ID: b704f19c-e5e9-11e9-9bee-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b704f19c-e5e9-11e9-9bee-bc764e2007e4;
 Thu, 03 Oct 2019 14:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570112757;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=awPnh9Uqk+60nTpp7Xb+4vIJ6IYShBEhQ5MIOa6nqmU=;
 b=dwb/0o24B+vVxUtBet3Ejz3NqrvBBzC1M4meNfRY3MgLtcdRGzqg0Wzh
 HlOdCsC1rABxtgVULDfyxizmfDSHqbbIDX4PaOLQ6pBGk5OaEWos3171n
 y2P4gnoTG17J4E9okEYSzcjUoL2rOox7VyBPhEm/XyopQv38oyqusP+b2 0=;
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
IronPort-SDR: 6P8mQPUeGd3NXml685AXPr5gDH1Nl4xdUmjTBNZN3eBr2/I1zDbUdarv1m7XYyS1Ose3fO6gWz
 rq3v87n4RPYx7P4Hz9lkksUGwwza5BHH+2Ap/oXhYMUD4ioBzO70H0i1Hye8XJeMis5JTktwfU
 R7hm5d2jj+sDOaF8ASzj3GXJFwnOylFj3NtUv7Mbfu/s7p6pmkubpPncAXdt5c4UXmpprFzclH
 RHVaIMfCPAEaqvA0se9ISFsNvsmhHC17hP6Lgz/ncUTEJrTDQ2Lw/oAHjzHqFqRqbbRGtBOyxX
 OEI=
X-SBRS: 2.7
X-MesageID: 6718917
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,252,1566878400"; 
   d="scan'208";a="6718917"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 3 Oct 2019 15:25:44 +0100
Message-ID: <20191003142544.16323-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] x86/spec-ctrl: Annotate remaining
 model names
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG5hbWVzIGluIHJldHBvbGluZV9zYWZlKCkgYXJlIGNvcGllZCBmcm9tIHNob3VsZF91c2Vf
ZWFnZXJfZnB1KCkuICBUaGUKbmFtZXMgaW4gbWRzX2NhbGN1bGF0aW9ucygpIGNvbWUgcGFydGx5
IGZyb20gTGludXgncyBpbnRlbC1mYW1pbHkuaCwgYW5kCnBhcnRseSBmcm9tIGNvbnZlcnNhdGlv
bnMgd2l0aCBJbnRlbC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpD
QzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgpDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKT25seSBjb21t
ZW50IGNoYW5nZXMuICAwIHJpc2sgZm9yIDQuMTMKLS0tCiB4ZW4vYXJjaC94ODYvc3BlY19jdHJs
LmMgfCAyMiArKysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NwZWNf
Y3RybC5jIGIveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jCmluZGV4IDQ3NjFiZTgxYmQuLjczMWQ1
YTc2N2IgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zcGVjX2N0cmwuYworKysgYi94ZW4vYXJj
aC94ODYvc3BlY19jdHJsLmMKQEAgLTUwNSwxMyArNTA1LDEzIEBAIHN0YXRpYyBib29sIF9faW5p
dCByZXRwb2xpbmVfc2FmZSh1aW50NjRfdCBjYXBzKQogICAgICAgICAvKgogICAgICAgICAgKiBT
a3lsYWtlLCBLYWJ5bGFrZSBhbmQgQ2Fubm9ubGFrZSBwcm9jZXNzb3JzIGFyZSBub3QgcmV0cG9s
aW5lLXNhZmUuCiAgICAgICAgICAqLwotICAgIGNhc2UgMHg0ZToKLSAgICBjYXNlIDB4NTU6Ci0g
ICAgY2FzZSAweDVlOgotICAgIGNhc2UgMHg2NjoKLSAgICBjYXNlIDB4Njc6Ci0gICAgY2FzZSAw
eDhlOgotICAgIGNhc2UgMHg5ZToKKyAgICBjYXNlIDB4NGU6IC8qIFNreWxha2UgTSAqLworICAg
IGNhc2UgMHg1NTogLyogU2t5bGFrZSBYICovCisgICAgY2FzZSAweDVlOiAvKiBTa3lsYWtlIEQg
Ki8KKyAgICBjYXNlIDB4NjY6IC8qIENhbm5vbmxha2UgKi8KKyAgICBjYXNlIDB4Njc6IC8qIENh
bm5vbmxha2U/ICovCisgICAgY2FzZSAweDhlOiAvKiBLYWJ5bGFrZSBNICovCisgICAgY2FzZSAw
eDllOiAvKiBLYWJ5bGFrZSBEICovCiAgICAgICAgIHJldHVybiBmYWxzZTsKIAogICAgICAgICAv
KgpAQCAtODQyLDEwICs4NDIsMTAgQEAgc3RhdGljIF9faW5pdCB2b2lkIG1kc19jYWxjdWxhdGlv
bnModWludDY0X3QgY2FwcykKICAgICBjYXNlIDB4NGM6IC8qIENoZXJyeXRyYWlsIC8gQnJhc3N3
ZWxsICovCiAgICAgY2FzZSAweDRkOiAvKiBBdmF0b24gLyBSYW5nZWx5IChTaWx2ZXJtb250KSAq
LwogICAgIGNhc2UgMHg1YTogLyogTW9vcmVmaWVsZCAqLwotICAgIGNhc2UgMHg1ZDoKLSAgICBj
YXNlIDB4NjU6Ci0gICAgY2FzZSAweDZlOgotICAgIGNhc2UgMHg3NToKKyAgICBjYXNlIDB4NWQ6
IC8qIFNvRklBIDNHIEdyYW5pdGUvRVMyLjEgKi8KKyAgICBjYXNlIDB4NjU6IC8qIFNvRklBIExU
RSBBT1NQICovCisgICAgY2FzZSAweDZlOiAvKiBDb3VnYXIgTW91bnRhaW4gKi8KKyAgICBjYXNl
IDB4NzU6IC8qIExpZ2h0bmluZyBNb3VudGFpbiAqLwogICAgICAgICAvKgogICAgICAgICAgKiBL
bmlnaHRzIHByb2Nlc3NvcnMgKHdoaWNoIGFyZSBiYXNlZCBvbiB0aGUgU2lsdmVybW9udC9BaXJt
b250CiAgICAgICAgICAqIG1pY3JvYXJjaGl0ZWN0dXJlKSBhcmUgc2ltaWxhcmx5IG9ubHkgYWZm
ZWN0ZWQgYnkgdGhlIFN0b3JlIEJ1ZmZlcgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
