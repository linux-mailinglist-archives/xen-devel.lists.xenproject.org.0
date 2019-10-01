Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3214C3787
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 16:35:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJCO-0001eE-4m; Tue, 01 Oct 2019 14:32:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=78uS=X2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFJCM-0001e0-9W
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 14:32:18 +0000
X-Inumbo-ID: 4070fb46-e458-11e9-9701-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 4070fb46-e458-11e9-9701-12813bfff9fa;
 Tue, 01 Oct 2019 14:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569940332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z+QHYW8IPEEIm03k86KOSgwcQwB2XLe9JqCbyycENoo=;
 b=P30iHMObp7468Oiv1oFqpnwJBRBhGE+ao8Z+2QY383eFRqGMB20109t9
 NeSLXTcx9UZf7zDhfZLak4i9AJOriLjD0pHO2EHRbVNPSX+qvgjWQNsIS
 e+s3di7gvmFenXGJyeUExymMkIB0k/GZJtNGQBGFJdmP0j27oGoZIu8wy M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Gli+TqwGxC/GYrRPCgNGxhfqKTVCvoT7k0/Pen5Lh1UUFrS/risYlnTDJoPX7tmq4BFJt6QAUq
 hr8IeK+EwJ5qCMZGkhzuvogSdKxNltfBgFQJbRQVQkCA766CjHBWRZCmdJRiuZBSe6AfOtTlwS
 9LCuGogQ6Z4iEuV3MrV7hNBz3Ztq0UqvIBJaWhn3/O5UREMFPdLpidSh8Q3JUzbtdpPPHZSW3L
 ObnBhwNAeg4yVcwGOra0eedqQhDS8yTGB0dkK/VHSc0mu5I5mYmcVE/RLoCdPJ8rssr+7USspn
 Wvg=
X-SBRS: 2.7
X-MesageID: 6317000
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6317000"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 1 Oct 2019 15:32:06 +0100
Message-ID: <20191001143207.15844-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191001143207.15844-1-andrew.cooper3@citrix.com>
References: <20191001143207.15844-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_HARDEN_ARRAY
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

VGhlcmUgYXJlIGxlZ2l0aW1hdGUgY2lyY3Vtc3RhbmNlIHdoZXJlIGFycmF5IGhhcmRlbmluZyBp
cyBub3Qgd2FudGVkIG9yCm5lZWRlZC4gIEFsbG93IGl0IHRvIGJlIHR1cm5lZCBvZmYuCgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpSZWxl
YXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQpDQzogSmFu
IEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgoKdjI6CiAqIFJlbmFtZSB0byBDT05GSUdfU1BFQ1VMQVRJVkVf
SEFSREVOX0FSUkFZCiAqIFNpbXBsaWZ5IHRoZSBzdHViIGFycmF5X2luZGV4X25vc3BlYygpCi0t
LQogeGVuL2NvbW1vbi9LY29uZmlnICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysr
CiB4ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmggfCAgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAy
OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9LY29uZmlnIGIveGVuL2Nv
bW1vbi9LY29uZmlnCmluZGV4IDE2ODI5ZjYyNzQuLjkxMTMzMzM1N2EgMTAwNjQ0Ci0tLSBhL3hl
bi9jb21tb24vS2NvbmZpZworKysgYi94ZW4vY29tbW9uL0tjb25maWcKQEAgLTc3LDYgKzc3LDMw
IEBAIGNvbmZpZyBIQVNfQ0hFQ0tQT0xJQ1kKIAlzdHJpbmcKIAlvcHRpb24gZW52PSJYRU5fSEFT
X0NIRUNLUE9MSUNZIgogCittZW51ICJTcGVjdWxhdGl2ZSBoYXJkZW5pbmciCisKK2NvbmZpZyBT
UEVDVUxBVElWRV9IQVJERU5fQVJSQVkKKwlib29sICJTcGVjdWxhdGl2ZSBBcnJheSBIYXJkZW5p
bmciCisJZGVmYXVsdCB5CisJLS0taGVscC0tLQorCSAgQ29udGVtcG9yYXJ5IHByb2Nlc3NvcnMg
bWF5IHVzZSBzcGVjdWxhdGl2ZSBleGVjdXRpb24gYXMgYQorCSAgcGVyZm9ybWFuY2Ugb3B0aW1p
c2F0aW9uLCBidXQgdGhpcyBjYW4gcG90ZW50aWFsbHkgYmUgYWJ1c2VkIGJ5IGFuCisJICBhdHRh
Y2tlciB0byBsZWFrIGRhdGEgdmlhIHNwZWN1bGF0aXZlIHNpZGVjaGFubmVscy4KKworCSAgT25l
IHNvdXJjZSBvZiBkYXRhIGxlYWthZ2UgaXMgdmlhIHNwZWN1bGF0aXZlIG91dC1vZi1ib3VuZHMg
YXJyYXkKKwkgIGFjY2Vzc2VzLgorCisJICBXaGVuIGVuYWJsZWQsIHNwZWNpZmljIGFycmF5IGFj
Y2Vzc2VzIHdoaWNoIGhhdmUgYmVlbiBkZWVtZWQgbGlhYmxlCisJICB0byBiZSBzcGVjdWxhdGl2
ZWx5IGFidXNlZCB3aWxsIGJlIGhhcmRlbmVkIHRvIGF2b2lkIG91dC1vZi1ib3VuZHMKKwkgIGFj
Y2Vzc2VzLgorCisJICBUaGlzIGlzIGEgYmVzdC1lZmZvcnQgbWl0aWdhdGlvbi4gIFRoZXJlIGFy
ZSBubyBndWFyYW50ZWVzIHRoYXQgYWxsCisJICBhcmVhcyBvZiBjb2RlIG9wZW4gdG8gYWJ1c2Ug
aGF2ZSBiZWVuIGhhcmRlbmVkLgorCisJICBJZiB1bnN1cmUsIHNheSBZLgorCitlbmRtZW51CisK
IGNvbmZpZyBLRVhFQwogCWJvb2wgImtleGVjIHN1cHBvcnQiCiAJZGVmYXVsdCB5CmRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmggYi94ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmgK
aW5kZXggMmFjOGZlY2NjMi4uNzYyNTViYzQ2ZSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVu
L25vc3BlYy5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9ub3NwZWMuaApAQCAtMzMsNiArMzMsNyBA
QCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgYXJyYXlfaW5kZXhfbWFza19ub3NwZWModW5z
aWduZWQgbG9uZyBpbmRleCwKIH0KICNlbmRpZgogCisjaWZkZWYgQ09ORklHX1NQRUNVTEFUSVZF
X0hBUkRFTl9BUlJBWQogLyoKICAqIGFycmF5X2luZGV4X25vc3BlYyAtIHNhbml0aXplIGFuIGFy
cmF5IGluZGV4IGFmdGVyIGEgYm91bmRzIGNoZWNrCiAgKgpAQCAtNTgsNiArNTksMTAgQEAgc3Rh
dGljIGlubGluZSB1bnNpZ25lZCBsb25nIGFycmF5X2luZGV4X21hc2tfbm9zcGVjKHVuc2lnbmVk
IGxvbmcgaW5kZXgsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgKHR5cGVvZihfaSkpIChfaSAmIF9t
YXNrKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiB9KQorI2Vs
c2UKKy8qIE5vIGluZGV4IGhhcmRlbmluZy4gKi8KKyNkZWZpbmUgYXJyYXlfaW5kZXhfbm9zcGVj
KGluZGV4LCBzaXplKSAoKHZvaWQpKHNpemUpLCAoaW5kZXgpKQorI2VuZGlmIC8qIENPTkZJR19T
UEVDVUxBVElWRV9IQVJERU5fQVJSQVkgKi8KIAogLyoKICAqIGFycmF5X2FjY2Vzc19ub3NwZWMg
LSBhbGxvdyBub3NwZWMgYWNjZXNzIGZvciBzdGF0aWMgc2l6ZSBhcnJheXMKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
