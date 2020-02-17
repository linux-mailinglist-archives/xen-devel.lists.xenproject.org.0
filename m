Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B357161107
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 12:20:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3ePK-0006bf-Ec; Mon, 17 Feb 2020 11:17:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ATlc=4F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j3ePJ-0006ba-6d
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 11:17:45 +0000
X-Inumbo-ID: 1e455010-5177-11ea-bfcd-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e455010-5177-11ea-bfcd-12813bfff9fa;
 Mon, 17 Feb 2020 11:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581938264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FV/TMnSmgfHBpkUWVZPWz/LX4LCctWW2dzYLExVsyoA=;
 b=G1d0ZHd5Xb3gtAfnAS64u2eQvu2IYG/Mdb4CKlSHseXMWpTyWSMaVkWq
 tZJpgpUrfLbJ4lZ84knhPnZ+UYaUCMmqmJZwFhBQnRU2ovJxOgxTotm7p
 jfKEgkRWP/mOoMG2vQrrTR8LrTvKSKT59bhMJn6loz044mN1pimGfO9lx E=;
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
IronPort-SDR: tk+nmZ7os2LlsQjuzO89MDdHmiIW7ZQlBjdEcm+Bw0mE8gQlOCOqepx0bEINP/NGjEjB4zgfky
 /6Ijz71ypmzgTWztm6r6ecC/shWpt7dC5g0VPMyyhuvDD1Neo9QLIGnkR7A0/c86FZXnzjJu5E
 9gNrGFVr32EdrQbpZqTSMrjwbjkClC+QCRLPQGAlI5IHK25fiyefsDzOqVufyQndpbQpNf2YA6
 WHFYtcQZ5zL9vrufJr2DJ5xXcicsoqQtsGbuALQQ+l7+0+kAa1LbegTT//JMrpeQvW7OJLo7o7
 1e0=
X-SBRS: 2.7
X-MesageID: 12922760
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="12922760"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 17 Feb 2020 11:17:38 +0000
Message-ID: <20200217111740.7298-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200217111740.7298-1-andrew.cooper3@citrix.com>
References: <20200217111740.7298-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] x86/nmi: Corrections and improvements to
 do_nmi_stats()
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

VGhlIGhhcmR3YXJlIGRvbWFpbiBkb2Vzbid0IG5lY2Vzc2FyaWx5IGhhdmUgdGhlIGRvbWlkIDAu
ICBSZW5kZXIgdiBpbnN0ZWFkLAphZGp1c3RpbmcgdGhlIHN0cmluZ3MgdG8gYXZvaWQgcHJpbnRp
bmcgdHJhaWxpbmcgd2hpdGVzcGFjZS4KClJlbmFtZSBpIHRvIGNwdSwgYW5kIHVzZSBzZXBhcmF0
ZSBib29sZWFucyBmb3IgcGVuZGluZy9tYXNrZWQuICBEcm9wIHRoZQp1bm5lY2Vzc2FyeSBkb21h
aW4gbG9jYWwgdmFyaWFibGUuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNv
bT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbm1pLmMgfCAyNiArKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ubWkuYyBiL3hlbi9hcmNoL3g4Ni9u
bWkuYwppbmRleCBhNWM2YmRkMGNlLi42Mzg2NzdhNWZlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvbm1pLmMKKysrIGIveGVuL2FyY2gveDg2L25taS5jCkBAIC01ODcsMjUgKzU4NywyNSBAQCBz
dGF0aWMgdm9pZCBkb19ubWlfdHJpZ2dlcih1bnNpZ25lZCBjaGFyIGtleSkKIAogc3RhdGljIHZv
aWQgZG9fbm1pX3N0YXRzKHVuc2lnbmVkIGNoYXIga2V5KQogewotICAgIGludCBpOwotICAgIHN0
cnVjdCBkb21haW4gKmQ7Ci0gICAgc3RydWN0IHZjcHUgKnY7CisgICAgY29uc3Qgc3RydWN0IHZj
cHUgKnY7CisgICAgdW5zaWduZWQgaW50IGNwdTsKKyAgICBib29sIHBlbmQsIG1hc2s7CiAKICAg
ICBwcmludGsoIkNQVVx0Tk1JXG4iKTsKLSAgICBmb3JfZWFjaF9vbmxpbmVfY3B1ICggaSApCi0g
ICAgICAgIHByaW50aygiJTNkXHQlM2RcbiIsIGksIG5taV9jb3VudChpKSk7CisgICAgZm9yX2Vh
Y2hfb25saW5lX2NwdSAoIGNwdSApCisgICAgICAgIHByaW50aygiJTNkXHQlM2RcbiIsIGNwdSwg
bm1pX2NvdW50KGNwdSkpOwogCi0gICAgaWYgKCAoKGQgPSBoYXJkd2FyZV9kb21haW4pID09IE5V
TEwpIHx8IChkLT52Y3B1ID09IE5VTEwpIHx8Ci0gICAgICAgICAoKHYgPSBkLT52Y3B1WzBdKSA9
PSBOVUxMKSApCisgICAgaWYgKCAhaGFyZHdhcmVfZG9tYWluIHx8ICFoYXJkd2FyZV9kb21haW4t
PnZjcHUgfHwKKyAgICAgICAgICEodiA9IGhhcmR3YXJlX2RvbWFpbi0+dmNwdVswXSkgKQogICAg
ICAgICByZXR1cm47CiAKLSAgICBpID0gdi0+YXN5bmNfZXhjZXB0aW9uX21hc2sgJiAoMSA8PCBW
Q1BVX1RSQVBfTk1JKTsKLSAgICBpZiAoIHYtPm5taV9wZW5kaW5nIHx8IGkgKQotICAgICAgICBw
cmludGsoImRvbTAgdnB1MDogTk1JICVzJXNcbiIsCi0gICAgICAgICAgICAgICB2LT5ubWlfcGVu
ZGluZyA/ICJwZW5kaW5nICIgOiAiIiwKLSAgICAgICAgICAgICAgIGkgPyAibWFza2VkICIgOiAi
Iik7CisgICAgcGVuZCA9IHYtPm5taV9wZW5kaW5nOworICAgIG1hc2sgPSB2LT5hc3luY19leGNl
cHRpb25fbWFzayAmICgxIDw8IFZDUFVfVFJBUF9OTUkpOworICAgIGlmICggcGVuZCB8fCBtYXNr
ICkKKyAgICAgICAgcHJpbnRrKCIlcHY6IE5NSSVzJXNcbiIsCisgICAgICAgICAgICAgICB2LCBw
ZW5kID8gIiBwZW5kaW5nIiA6ICIiLCBtYXNrID8gIiBtYXNrZWQiIDogIiIpOwogICAgIGVsc2UK
LSAgICAgICAgcHJpbnRrKCJkb20wIHZjcHUwOiBOTUkgbmVpdGhlciBwZW5kaW5nIG5vciBtYXNr
ZWRcbiIpOworICAgICAgICBwcmludGsoIiVwdjogTk1JIG5laXRoZXIgcGVuZGluZyBub3IgbWFz
a2VkXG4iLCB2KTsKIH0KIAogc3RhdGljIF9faW5pdCBpbnQgcmVnaXN0ZXJfbm1pX3RyaWdnZXIo
dm9pZCkKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
