Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3899E10D7B3
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:12:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahuE-0007kI-Kk; Fri, 29 Nov 2019 15:10:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UeaM=ZV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iahuC-0007gw-PA
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:10:00 +0000
X-Inumbo-ID: 4fb32380-12ba-11ea-9db0-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fb32380-12ba-11ea-9db0-bc764e2007e4;
 Fri, 29 Nov 2019 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575040200;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=DaycKm/LpFN80ZMKrBVbdlKWv8+WyUR116gism8Plrc=;
 b=bretAAc4yeunmbiBhxyMdXtxXiEp1/2jSBdiOQxvArhqspvh84gsTVGe
 CIqIfZTbZsc51QUsbZ31rb5K/YidpJgzBHy5gErqyvcVVzOSWqAK1QKMs
 hxfJ7XkhQBIhpdNcGSigiuHlkZzmjPFGZqMnlA06OLm9qknPWEWmHRk/N w=;
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
IronPort-SDR: 71h5pEqfTCR8dWxE+4xORG+x0kfkUdLgEXlbcI2+7/823J6hAcpKl1Fw0FbpM57MBZK+yPCYfe
 +gtwcw1IH3ScW4vp4hK5uAwEShjuK6X4UqcL/F2RNjG4HfM4giLxcY8GfU6M7yfc7nRD7msekC
 amLf0dR/N/w12VJUi+hd9hDNC2zNNkLQ464UblQ6ZNOV3AngElYA95ivhb1/K7QvCkZ4KH9Dvt
 tDtfFs/Tv/i/U2nQ56YUn1RxmtlsQi23Xv35u88TcE0HdpUfyWpJspag6R1PSqsxvTj36z9DSd
 Y+w=
X-SBRS: 2.7
X-MesageID: 9345885
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9345885"
To: Julien Grall <julien@xen.org>, Pavel Tatashin <pasha.tatashin@soleen.com>, 
 <jmorris@namei.org>, <sashal@kernel.org>, <linux-kernel@vger.kernel.org>, 
 <catalin.marinas@arm.com>, <will@kernel.org>, <steve.capper@arm.com>,
 <linux-arm-kernel@lists.infradead.org>, <marc.zyngier@arm.com>,
 <james.morse@arm.com>, <vladimir.murzin@arm.com>, <mark.rutland@arm.com>,
 <tglx@linutronix.de>, <gregkh@linuxfoundation.org>, <allison@lohutok.net>,
 <info@metux.net>, <alexios.zavras@intel.com>, <sstabellini@kernel.org>,
 <boris.ostrovsky@oracle.com>, <jgross@suse.com>, <stefan@agner.ch>,
 <yamada.masahiro@socionext.com>, <xen-devel@lists.xenproject.org>,
 <linux@armlinux.org.uk>
References: <20191127184453.229321-1-pasha.tatashin@soleen.com>
 <20191127184453.229321-2-pasha.tatashin@soleen.com>
 <957930d0-8317-9086-c7a1-8de857f358c2@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e785a585-8b71-8a49-285e-2bcb1437500b@citrix.com>
Date: Fri, 29 Nov 2019 15:09:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <957930d0-8317-9086-c7a1-8de857f358c2@xen.org>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/3] arm/arm64/xen: use C inlines for
 privcmd_call
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMTEvMjAxOSAxNTowNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+Cj4gT24gMjcv
MTEvMjAxOSAxODo0NCwgUGF2ZWwgVGF0YXNoaW4gd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaAo+PiBiL2FyY2gvYXJtNjQvaW5jbHVk
ZS9hc20veGVuL2h5cGVyY2FsbC5oCj4+IGluZGV4IDM1MjJjYmFlZDMxNi4uMWE3NGZiMjg2MDdm
IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaAo+
PiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaAo+PiBAQCAtMSAr
MSwyOSBAQAo+PiArI2lmbmRlZiBfQVNNX0FSTTY0X1hFTl9IWVBFUkNBTExfSAo+PiArI2RlZmlu
ZSBfQVNNX0FSTTY0X1hFTl9IWVBFUkNBTExfSAo+PiDCoCAjaW5jbHVkZSA8eGVuL2FybS9oeXBl
cmNhbGwuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4+ICsKPj4gK3N0YXRpYyBp
bmxpbmUgbG9uZyBwcml2Y21kX2NhbGwodW5zaWduZWQgaW50IGNhbGwsIHVuc2lnbmVkIGxvbmcg
YTEsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBhMiwg
dW5zaWduZWQgbG9uZyBhMywKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNp
Z25lZCBsb25nIGE0LCB1bnNpZ25lZCBsb25nIGE1KQo+Cj4gSSByZWFsaXplIHRoYXQgcHJpdmNt
ZF9jYWxsIGlzIHRoZSBvbmx5IGh5cGVyY2FsbCB1c2luZyBTb2Z0d2FyZSBQQU4KPiBhdCB0aGUg
bW9tZW50LiBIb3dldmVyLCBkbV9vcCBuZWVkcyB0aGUgc2FtZSBhcyBoeXBlcmNhbGwgd2lsbCBi
ZQo+IGlzc3VlZCBmcm9tIHVzZXJzcGFjZSBhcyB3ZWxsLgoKQW5kIGRtX29wKCkgd29uJ3QgYmUg
dGhlIG9ubHkgZXhhbXBsZSBhcyB3ZSBjb250aW51ZSBpbiBjbGVhbmluZyB1cCB0aGUKZ2FwaW5n
IGhvbGUgdGhhdCBpcyBwcml2Y21kLgoKPiBTbyBJIHdhcyB3b25kZXJpbmcgd2hldGhlciB3ZSBz
aG91bGQgY3JlYXRlIGEgZ2VuZXJpYyBmdW5jdGlvbiAoZS5nLgo+IGRvX3hlbl9oeXBlcmNhbGwo
KSBvciBkb194ZW5fdXNlcl9oeXBlcmNhbGwoKSkgdG8gY292ZXIgdGhlIHR3bwo+IGh5cGVyY2Fs
bHM/CgpQcm9iYWJseSBhIGdvb2QgaWRlYS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
