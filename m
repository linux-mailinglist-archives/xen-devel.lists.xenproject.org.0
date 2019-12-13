Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9BC11EAEF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 20:07:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifqFG-000096-V4; Fri, 13 Dec 2019 19:04:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B4Jk=2D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifqFF-00008b-Cm
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 19:04:57 +0000
X-Inumbo-ID: 6b450204-1ddb-11ea-8fd3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b450204-1ddb-11ea-8fd3-12813bfff9fa;
 Fri, 13 Dec 2019 19:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576263883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EJgMFJt/RS3x/ZD3KvpyYE+R3JWErTfXnkRvySsPS6s=;
 b=FWUCyF3UrO1BHozHiin4pKOTHM3IUl1cyE84AUWDPxOneP9552hxA9Sr
 iYe2c/h3JlFJs/XLYmj5TGTU4xwMs6k6J7d4bqKDezc/pGkg6N7fVezK9
 e8Tk2bEkck7e0AD7ElnPwZFgzXHAiQXbJuFmK+/BWqs4keCETqt68qHAS E=;
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
IronPort-SDR: 8k5xsDKfWOc+feNupSDJ+qIb8M+r/lkd0jA/ySDSYCOJ6QVzpLj3xxEtPY240VYnrZ4ptNONtx
 sACk54q3vFGUnViGGUUoNoBVyEN4ZtwMO/NeBpNwXUmHCCItWBctBxV01miwhMTLJmRIGiyYDJ
 eqbacnD2FB2qEHxfez9yQl8aQ4Nmr/SdJf/fUfAJ1jLFn13otiapH3uFLrYXYbaRC4VuZ/XZnQ
 3WvQFsmSm5DeCOlF/3C/rlmZyJpIDX0hYIS4VCWJFAsalfgOo+E0VSG1CyINqd3CwgZPF27wVW
 BMo=
X-SBRS: 2.7
X-MesageID: 9794915
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; 
   d="scan'208";a="9794915"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 19:04:33 +0000
Message-ID: <20191213190436.24475-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191213190436.24475-1-andrew.cooper3@citrix.com>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/6] x86/suspend: Don't save unnecessary GPRs
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

T25seSB0aGUgY2FsbGVlLXByZXNlcnZlZCByZWdpc3RlcnMgbmVlZCBzYXZpbmcvcmVzdG9yaW5n
LiAgU3BpbGwgdGhlbSB0byB0aGUKc3RhY2sgbGlrZSByZWd1bGFyIGZ1bmN0aW9ucyBkby4gICVy
c3AgaXMgbm93IHRoZSBvbmx5IEdQUiB3aGljaCBnZXRzIHN0YXNoZWQKaW4gLmRhdGEKClNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpD
QzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9h
cmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMgfCA1OSArKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDQ3IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMg
Yi94ZW4vYXJjaC94ODYvYWNwaS93YWtldXBfcHJvdC5TCmluZGV4IDM1ZmQ3YTVlOWYuLjJmNmM4
ZTE4ZWYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMKKysrIGIv
eGVuL2FyY2gveDg2L2FjcGkvd2FrZXVwX3Byb3QuUwpAQCAtMTEsMjQgKzExLDE0IEBACiAjZGVm
aW5lIFJFRih4KSAgICAgICAgICB4KCVyaXApCiAKIEVOVFJZKGRvX3N1c3BlbmRfbG93bGV2ZWwp
CisgICAgICAgIHB1c2ggICAgJXJicAorICAgICAgICBwdXNoICAgICVyYngKKyAgICAgICAgcHVz
aCAgICAlcjEyCisgICAgICAgIHB1c2ggICAgJXIxMworICAgICAgICBwdXNoICAgICVyMTQKKyAg
ICAgICAgcHVzaCAgICAlcjE1CiAKICAgICAgICAgU0FWRV9HUkVHKHNwKQotICAgICAgICBTQVZF
X0dSRUcoYXgpCi0gICAgICAgIFNBVkVfR1JFRyhieCkKLSAgICAgICAgU0FWRV9HUkVHKGN4KQot
ICAgICAgICBTQVZFX0dSRUcoZHgpCi0gICAgICAgIFNBVkVfR1JFRyhicCkKLSAgICAgICAgU0FW
RV9HUkVHKHNpKQotICAgICAgICBTQVZFX0dSRUcoZGkpCi0KLSAgICAgICAgU0FWRV9HUkVHKDgp
ICAgICAjIHNhdmUgcjguLi5yMTUKLSAgICAgICAgU0FWRV9HUkVHKDkpCi0gICAgICAgIFNBVkVf
R1JFRygxMCkKLSAgICAgICAgU0FWRV9HUkVHKDExKQotICAgICAgICBTQVZFX0dSRUcoMTIpCi0g
ICAgICAgIFNBVkVfR1JFRygxMykKLSAgICAgICAgU0FWRV9HUkVHKDE0KQotICAgICAgICBTQVZF
X0dSRUcoMTUpCiAKICAgICAgICAgbW92ICAgICAlY3IwLCBHUkVHKGF4KQogICAgICAgICBtb3Yg
ICAgIEdSRUcoYXgpLCBSRUYoc2F2ZWRfY3IwKQpAQCAtNzUsMjIgKzY1LDEzIEBAIEVOVFJZKHMz
X3Jlc3VtZSkKIAogICAgICAgICBjYWxsIHJlc3RvcmVfcmVzdF9wcm9jZXNzb3Jfc3RhdGUKIAot
ICAgICAgICBMT0FEX0dSRUcoYnApCi0gICAgICAgIExPQURfR1JFRyhheCkKLSAgICAgICAgTE9B
RF9HUkVHKGJ4KQotICAgICAgICBMT0FEX0dSRUcoY3gpCi0gICAgICAgIExPQURfR1JFRyhkeCkK
LSAgICAgICAgTE9BRF9HUkVHKHNpKQotICAgICAgICBMT0FEX0dSRUcoZGkpCi0gICAgICAgIExP
QURfR1JFRyg4KSAgICAgIyBzYXZlIHI4Li4ucjE1Ci0gICAgICAgIExPQURfR1JFRyg5KQotICAg
ICAgICBMT0FEX0dSRUcoMTApCi0gICAgICAgIExPQURfR1JFRygxMSkKLSAgICAgICAgTE9BRF9H
UkVHKDEyKQotICAgICAgICBMT0FEX0dSRUcoMTMpCi0gICAgICAgIExPQURfR1JFRygxNCkKLSAg
ICAgICAgTE9BRF9HUkVHKDE1KQogLkxzdXNwZW5kX2VycjoKKyAgICAgICAgcG9wICAgICAlcjE1
CisgICAgICAgIHBvcCAgICAgJXIxNAorICAgICAgICBwb3AgICAgICVyMTMKKyAgICAgICAgcG9w
ICAgICAlcjEyCisgICAgICAgIHBvcCAgICAgJXJieAorICAgICAgICBwb3AgICAgICVyYnAKICAg
ICAgICAgcmV0CiAKIC5kYXRhCkBAIC0xMDEsMjEgKzgyLDUgQEAgR0xPQkFMKHNhdmVkX21hZ2lj
KQogCiAgICAgICAgIC5hbGlnbiA4CiBERUNMQVJFX0dSRUcoc3ApCi1ERUNMQVJFX0dSRUcoYnAp
Ci1ERUNMQVJFX0dSRUcoYXgpCi1ERUNMQVJFX0dSRUcoYngpCi1ERUNMQVJFX0dSRUcoY3gpCi1E
RUNMQVJFX0dSRUcoZHgpCi1ERUNMQVJFX0dSRUcoc2kpCi1ERUNMQVJFX0dSRUcoZGkpCi0KLURF
Q0xBUkVfR1JFRyg4KQotREVDTEFSRV9HUkVHKDkpCi1ERUNMQVJFX0dSRUcoMTApCi1ERUNMQVJF
X0dSRUcoMTEpCi1ERUNMQVJFX0dSRUcoMTIpCi1ERUNMQVJFX0dSRUcoMTMpCi1ERUNMQVJFX0dS
RUcoMTQpCi1ERUNMQVJFX0dSRUcoMTUpCiAKIHNhdmVkX2NyMDogICAgICAucXVhZCAgIDAKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
