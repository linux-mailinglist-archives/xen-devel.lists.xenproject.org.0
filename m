Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F77112FD6F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 21:10:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inTEi-0002QJ-FY; Fri, 03 Jan 2020 20:07:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Lau=2Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1inTEh-0002QC-1i
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 20:07:55 +0000
X-Inumbo-ID: b4f1efcc-2e64-11ea-88e7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4f1efcc-2e64-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 20:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578082066;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yqt6N7b0D2X8YE+6hlfLQhsDXx0pGbB1jO3HS0icmSI=;
 b=OIC1KN26yGkd74MTRfs+GJGaRCVSw2RQ1xexo1+bd83gyFCk/A0wGze3
 b2z+SILGg4k+ZZRrv0pEnmytOJou6jMT0X3cemBwBkwsi6S1Ns4Z/UMSG
 lXV8p7KqUiM/R42E7FH5adI9/4ueyX5/OpiVBMSfn5h/66Hf4VnenV4zU 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HjNmba9fZvMdCOvM/JjLZA5jopsshqCeJVoldCGyKxphKHsc0vCrVVLq1WlWu/efEaJ6OXayzx
 Hkrzv+edxjX1nErZdx8WCsedZrlS94zqP1CZyJimOheLKbJ3QCcixpMb8YOFQjPaj00RdRhdrj
 BUB++NmP4CsLFkhjuMa2EyxUsX3L1fzlzQFQrYjJ5hjUfW/JdML8AEvD9lZMjIGuPd3m1aUvVG
 hrQgODL0SEo526cgjA6Y4mfNObR3HFU/Mo/Lgj106/WiBBlez3C/6Gpst7qyOa+o+c7HekpQ2Y
 CKo=
X-SBRS: 2.7
X-MesageID: 10588783
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,391,1571716800"; d="scan'208";a="10588783"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 3 Jan 2020 20:07:42 +0000
Message-ID: <20200103200742.23917-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/shim: Short circuit control/hardware checks
 in PV_SHIM_EXCLUSIVE builds
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
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG5ldCBkaWZmc3RhdCBpczoKICBhZGQvcmVtb3ZlOiAwLzEzIGdyb3cvc2hyaW5rOiAyNS8x
MjkgdXAvZG93bjogNjI5Ny8tMjA0NjkgKC0xNDE3MikKCldpdGggdGhlIGZvbGxvd2luZyBvYmpl
Y3RzL2Z1bmN0aW9ucyByZW1vdmVkIGVudGlyZWx5OgogIGlvbW11X2h3ZG9tX25vbmUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMSAgICAgICAtICAgICAgLTEKICBod2RvbV9tYXhfb3Jk
ZXIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDQgICAgICAgLSAgICAgIC00CiAgZXh0
cmFfaHdkb21faXJxcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA0ICAgICAgIC0gICAg
ICAtNAogIGN0bGRvbV9tYXhfb3JkZXIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNCAg
ICAgICAtICAgICAgLTQKICBhY3BpX2MxZV9xdWlyayAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgNDMgICAgICAgLSAgICAgLTQzCiAgaHZtX3BpcnFfZW9pICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDYyICAgICAgIC0gICAgIC02MgogIG1heF9vcmRlciAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA5NCAgICAgICAtICAgICAtOTQKICBjb25yaW5nX3B1
dHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxMDQgICAgICAgLSAgICAtMTA0CiAg
cHJvcGFnYXRlX25vZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMTE5ICAgICAgIC0g
ICAgLTExOQogIG1taW9fcm9fZW11bGF0ZV9vcHMgICAgICAgICAgICAgICAgICAgICAgICAgIDIy
NCAgICAgICAtICAgIC0yMjQKICBtbWNmZ19pbnRlcmNlcHRfb3BzICAgICAgICAgICAgICAgICAg
ICAgICAgICAyMjQgICAgICAgLSAgICAtMjI0CiAgcGNpX2NmZ19vayAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMjk1ICAgICAgIC0gICAgLTI5NQogIHAybV9sb2NrICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDU0NiAgICAgICAtICAgIC01NDYKCkFuZCB0aGUg
Zm9sbG93aW5nIHJlZHVjZWQgdG8gc3R1YnM6CiAgYXJjaF9pb21tdV9od2RvbV9pbml0ICAgICAg
ICAgICAgICAgICAgICAgICAgODUyICAgICAgIDIgICAgLTg1MAogIHAybV9hZGRfZm9yZWlnbiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDg4MCAgICAgIDE2ICAgIC04NjQKClNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzog
SmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4K
Q0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzogU2VyZ2V5IER5
YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgotLS0KIHhlbi9pbmNsdWRlL3hlbi9zY2hl
ZC5oIHwgMTYgKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgg
Yi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAppbmRleCBhMmFjY2Q5MGY2Li5jYzk0MmEzNjIxIDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4v
c2NoZWQuaApAQCAtOTYzLDEwICs5NjMsMjIgQEAgdm9pZCB3YXRjaGRvZ19kb21haW5fZGVzdHJv
eShzdHJ1Y3QgZG9tYWluICpkKTsKICAqICAgICh0aGF0IGlzLCB0aGlzIHdvdWxkIG5vdCBiZSBz
dWl0YWJsZSBmb3IgYSBkcml2ZXIgZG9tYWluKQogICogIC0gVGhlcmUgaXMgbmV2ZXIgYSByZWFz
b24gdG8gZGVueSB0aGUgaGFyZHdhcmUgZG9tYWluIGFjY2VzcyB0byB0aGlzCiAgKi8KLSNkZWZp
bmUgaXNfaGFyZHdhcmVfZG9tYWluKF9kKSBldmFsdWF0ZV9ub3NwZWMoKF9kKSA9PSBoYXJkd2Fy
ZV9kb21haW4pCitzdGF0aWMgYWx3YXlzX2lubGluZSBib29sIGlzX2hhcmR3YXJlX2RvbWFpbihj
b25zdCBzdHJ1Y3QgZG9tYWluICpkKQoreworICAgIGlmICggSVNfRU5BQkxFRChDT05GSUdfUFZf
U0hJTV9FWENMVVNJVkUpICkKKyAgICAgICAgcmV0dXJuIGZhbHNlOworCisgICAgcmV0dXJuIGV2
YWx1YXRlX25vc3BlYyhkID09IGhhcmR3YXJlX2RvbWFpbik7Cit9CiAKIC8qIFRoaXMgY2hlY2sg
aXMgZm9yIGZ1bmN0aW9uYWxpdHkgc3BlY2lmaWMgdG8gYSBjb250cm9sIGRvbWFpbiAqLwotI2Rl
ZmluZSBpc19jb250cm9sX2RvbWFpbihfZCkgZXZhbHVhdGVfbm9zcGVjKChfZCktPmlzX3ByaXZp
bGVnZWQpCitzdGF0aWMgYWx3YXlzX2lubGluZSBib29sIGlzX2NvbnRyb2xfZG9tYWluKGNvbnN0
IHN0cnVjdCBkb21haW4gKmQpCit7CisgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19QVl9TSElN
X0VYQ0xVU0lWRSkgKQorICAgICAgICByZXR1cm4gZmFsc2U7CisKKyAgICByZXR1cm4gZXZhbHVh
dGVfbm9zcGVjKGQtPmlzX3ByaXZpbGVnZWQpOworfQogCiAjZGVmaW5lIFZNX0FTU0lTVChkLCB0
KSAodGVzdF9iaXQoVk1BU1NUX1RZUEVfICMjIHQsICYoZCktPnZtX2Fzc2lzdCkpCiAKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
