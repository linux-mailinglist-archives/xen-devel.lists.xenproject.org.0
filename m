Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 520A8C3884
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:05:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJfP-00058D-J9; Tue, 01 Oct 2019 15:02:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFJae-0004Ok-GM
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 14:57:24 +0000
X-Inumbo-ID: c4100ac8-e45b-11e9-b588-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id c4100ac8-e45b-11e9-b588-bc764e2007e4;
 Tue, 01 Oct 2019 14:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569941839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5GIZbrW/7UHOKzPnQwF1sYeQLthDe/gD90GMyjCPdmA=;
 b=IRbJkyg/wlMNUY0iKIqJ867fsKhgZTF2xjOEgbscc4lbwSxrtFpq4EhB
 SQHjzlesjrBxL3WjkVMVRNcFYFO/OJw393zAwwjW3IaT+ZO0ff0lGe4MO
 ONKEQNUqXfpR6qWKvwl3gN5zbZW3CbjmTawsASyLMh/PoOYpMCb1MJiaQ s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OSGpm651Otu5wXR8ZPAaipv5MhhxGpJLMigU5Nx5Nj3fEtvpwyTRB1owgELfZmY1OoEphXfA2+
 aKCWd96+NkMSNWz3eEp9xCeyd5nAWZ3gJ5gsIc8KVJ+uiHGNmYbgMo6png1zmCxcWCOzAwSNyv
 tbdBX2SMAtxaxKaxyBOR5Oz5RSN6uM/XZZOF+FNZXyRXQO1AMPOSj9eF1j+pbqx4FrbStzjLWA
 qktBUsSqSZ3rrCugf4a3fHdZQjwHI3nL5xLRajBb9J1tfa9+7fLxihd3ehe+CvWPkxZO4CNstu
 Dbw=
X-SBRS: 2.7
X-MesageID: 6557830
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6557830"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 1 Oct 2019 15:57:14 +0100
Message-ID: <20191001145714.556-3-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20191001145714.556-1-paul.durrant@citrix.com>
References: <20191001145714.556-1-paul.durrant@citrix.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 01 Oct 2019 15:02:16 +0000
Subject: [Xen-devel] [PATCH-for-4.13 v2 2/2] libxl: choose an appropriate
 default for passthrough...
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uaWYgdGhlcmUgaXMgbm8gSU9NTVUgb3IgaXQgaXMgZ2xvYmFsbHkgZGlzYWJsZWQuCgpXaXRo
b3V0IHRoaXMgcGF0Y2gsIHRoZSBmb2xsb3dpbmcgYXNzZXJ0aW9uIG1heSBiZSBoaXQ6Cgp4bDog
bGlieGxfY3JlYXRlLmM6NTg5OiBsaWJ4bF9fZG9tYWluX21ha2U6IEFzc2VydGlvbiBgaW5mby0+
cGFzc3Rocm91Z2ggIT0gTElCWExfUEFTU1RIUk9VR0hfVU5LTk9XTicgZmFpbGVkLgoKVGhpcyBp
cyBiZWNhdXNlIGxpYnhsX19kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdCgpIGN1cnJlbnRs
eSBvbmx5IHNldHMKYW4gYXBwcm9wcmlhdGUgdmFsdWUgZm9yICdwYXNzdGhyb3VnaCcgaW4gdGhl
IGNhc2UgdGhhdCAnY2FwX2h2bV9kaXJlY3RpbycKaXMgdHJ1ZSwgd2hpY2ggaXMgbm90IHRoZSBj
YXNlIHVubGVzcyBhbiBJT01NVSBpcyBwcmVzZW50IGFuZCBlbmFibGVkIGluCnRoZSBzeXN0ZW0u
IFRoaXMgaXMgbm9ybWFsbHkgbWFza2VkIGJ5IHhsIGNob29zaW5nIGEgZGVmYXVsdCB2YWx1ZSwg
YnV0CnRoYXQgd2lsbCBub3QgaGFwcGVuIGlmIHhsIGlzIG5vdCB1c2VkIChlLmcuIHdoZW4gdXNp
bmcgbGlidmlydCkgb3Igd2hlbgphIHN0dWIgZG9tYWluIGlzIGJlaW5nIGNyZWF0ZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KQ2M6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpD
YzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKdjI6CiAtIHJlLWJhc2UKLS0tCiB0
b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGli
eGxfY3JlYXRlLmMgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwppbmRleCA1ZjI5NzJiYzAz
Li42MmUxM2YzZTdjIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYworKysg
Yi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwpAQCAtNjgsNyArNjgsMTEgQEAgaW50IGxpYnhs
X19kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAogICAgICAgICBj
X2luZm8tPnBhc3N0aHJvdWdoID0gKChjX2luZm8tPnR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVf
UFYpIHx8CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIWluZm8uY2FwX2lvbW11X2hh
cF9wdF9zaGFyZSkgPwogICAgICAgICAgICAgTElCWExfUEFTU1RIUk9VR0hfU1lOQ19QVCA6IExJ
QlhMX1BBU1NUSFJPVUdIX1NIQVJFX1BUOwotICAgIH0KKyAgICB9IGVsc2UgaWYgKCFpbmZvLmNh
cF9odm1fZGlyZWN0aW8pCisgICAgICAgIGNfaW5mby0+cGFzc3Rocm91Z2ggPSBMSUJYTF9QQVNT
VEhST1VHSF9ESVNBQkxFRDsKKworICAgIC8qIEFuIGV4cGxpY2l0IHNldHRpbmcgc2hvdWxkIG5v
dyBoYXZlIGJlZW4gY2hvc2VuICovCisgICAgYXNzZXJ0KGNfaW5mby0+cGFzc3Rocm91Z2ggIT0g
TElCWExfUEFTU1RIUk9VR0hfVU5LTk9XTik7CiAKICAgICByZXR1cm4gMDsKIH0KLS0gCjIuMjAu
MS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
