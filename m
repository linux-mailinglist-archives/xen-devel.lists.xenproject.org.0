Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA3173A61
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 15:53:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7gyz-0006Ei-0d; Fri, 28 Feb 2020 14:51:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sa46=4Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j7gyw-0006EY-P7
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 14:51:14 +0000
X-Inumbo-ID: c3e6b7a0-5a39-11ea-995f-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3e6b7a0-5a39-11ea-995f-12813bfff9fa;
 Fri, 28 Feb 2020 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582901473;
 h=from:subject:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wqtAdmwMctkMkB7/H7wDY+0+5q+93sYcUX8BcpfpxLk=;
 b=aEXLIadvcPmOixyJF6HvKIMtA1aHE+LsGzJC/w+v74JIp+gV3WErcULL
 Ho5y0XY90fAdY/1eDvaNy4VVD9vgWXVDr1lmJmtf4HpHHgvcUsmeLiIY1
 8ZYavpmDkDObzBVjiCdx+yDW6vNsXFyBgpQh8hglU4Qino+e/Oi29QFyw w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BR6QitDF0ID5VqiVaX3yCEUwVSm+BuLiEB8Lfp8UA4NqXlPZBDM0E7zCLhngPvc10/9F4wKGei
 V9k9yn1xuUOPO8CtiprAQk6JEOV0TxtDYYvQmjkfPMHJ2QXRJ2DK1PLfzTKR0oS/zd+CxDH+ZN
 qWmBm5YWhewE49rsNlpr6eUaxJmacLTzWhcw/4nLSk/s2wMXyXd23zSNSsjNnIc/zKgJJbdS4y
 QHqB8/mEvQZvfipwd54oJ5JBpLvPvsoEq2I4/nUe06V7Z/0NT3NSzKQghocTzN/D7zJnhQTwTc
 hfY=
X-SBRS: 2.7
X-MesageID: 13800121
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13800121"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-8-andrew.cooper3@citrix.com>
 <24148.2202.912512.939428@mariner.uk.xensource.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <cea79256-f260-1710-a783-dadec276e32a@citrix.com>
Date: Fri, 28 Feb 2020 14:51:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <24148.2202.912512.939428@mariner.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 07/17] libxc/restore: STATIC_DATA_END
 inference for v2 compatibility
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQvMDIvMjAyMCAxNzozMiwgSWFuIEphY2tzb24gd3JvdGU6Cj4gQW5kcmV3IENvb3BlciB3
cml0ZXMgKCJbUEFUQ0ggdjIgMDcvMTddIGxpYnhjL3Jlc3RvcmU6IFNUQVRJQ19EQVRBX0VORCBp
bmZlcmVuY2UgZm9yIHYyIGNvbXBhdGliaWxpdHkiKToKPj4gQSB2MyBzdHJlYW0gY2FuIGNvbXBh
dGlibHkgcmVhZCBhIHYyIHN0cmVhbSBieSBpbmZlcnJpbmcgdGhlIHBvc2l0aW9uIG9mIHRoZQo+
PiBTVEFUSUNfREFUQV9FTkQgcmVjb3JkLgo+Pgo+PiB2MiBjb21wYXRpYmlsaXR5IGlzIG9ubHkg
bmVlZGVkIGZvciB4ODYuICBObyBvdGhlciBhcmNoaXRlY3R1cmVzIGV4aXN0IHlldCwKPj4gYnV0
IHRoZXkgd2lsbCBoYXZlIGEgbWluaW11bSBvZiB2MyB3aGVuIGludHJvZHVjZWQuCj4+Cj4+IFRo
ZSB4ODYgSFZNIGNvbXBhdGliaWxpdHkgcG9pbnQgYmVpbmcgaW4gaGFuZGxlX3BhZ2VfZGF0YSgp
ICh3aGljaCBpcyBjb21tb24KPj4gY29kZSkgaXMgYSBiaXQgYXdrd2FyZC4gIEhvd2V2ZXIsIGFz
IHRoZSB0d28gY29tcGF0aWJpbGl0eSBwb2ludHMgYXJlIHN1YnRseQo+PiBkaWZmZXJlbnQsIGFu
ZCBpdCBpcyAoaW50ZW50aW9uYWxseSkgbm90IHBvc3NpYmxlIHRvIGNhbGwgaW50byBhcmNoIHNw
ZWNpZmljCj4+IGNvZGUgZnJvbSBjb21tb24gY29kZSAoZXhjZXB0IHZpYSB0aGUgb3BzIGhvb2tz
KSwgdXNlIHNvbWUgI2lmZGVmLWFyeSBhbmQKPj4gb3BlbmNvZGUgdGhlIGNoZWNrLCByYXRoZXIg
dGhhbiBtYWtlIGhhbmRsZV9wYWdlX2RhdGEoKSBhIHBlci1hcmNoIGhlbHBlci4KPiAuLi4KPj4g
KyNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0X18pCj4+ICsgICAgLyog
djIgY29tcGF0LiAgSW5mZXIgdGhlIHBvc2l0aW9uIG9mIFNUQVRJQ19EQVRBX0VORC4gKi8KPj4g
KyAgICBpZiAoIGN0eC0+cmVzdG9yZS5mb3JtYXRfdmVyc2lvbiA8IDMgJiYgIWN0eC0+cmVzdG9y
ZS5zZWVuX3N0YXRpY19kYXRhX2VuZCApCj4+ICsgICAgewo+PiArICAgICAgICByYyA9IGhhbmRs
ZV9zdGF0aWNfZGF0YV9lbmQoY3R4KTsKPj4gKyAgICAgICAgaWYgKCByYyApCj4gVGhlc2UgMTcg
bGluZXMgYXBwZWFycyB0d2ljZSwgaW4gYmFzaWNhbGx5IGlkZW50aWNhbCBmb3JtLiAgQ291bGQg
aXQKPiBiZSByZWZhY3RvcmVkID8KCk5vdCByZWFsbHksIG5vLgoKVGhlIGVycm9yIGhhbmRsaW5n
IChpLmUuIGhhbGYgb2YgdGhvc2UgMTcgbGluZXMpIGlzIGRpZmZlcmVudCwgbWFraW5nIGl0CnNv
bWV3aGF0IGF3a3dhcmQgdG8gZml0IGludG8gYSBzdGF0aWMgaW5saW5lLgoKTW9yZSBpbXBvcnRh
bnRseSBob3dldmVyLCBieSBkZXNpZ24sIGNvbW1vbiBjb2RlIGNhbid0IGNhbGwKYXJjaC1zcGVj
aWZpYyBjb2RlIHdpdGhvdXQgYSByZXN0b3JlX29wcyBob29rLsKgIERlZHVwaW5nIHRoZXNlIHdv
dWxkCnJlcXVpcmUgYnJlYWtpbmcgdGhlIHJlc3RyaWN0aW9uIHdoaWNoIGlzIGN1cnJlbnRseSBk
b2luZyBhIGRlY2VudCBqb2IKb2Yga2VlcGluZyB4ODYtaXNtcyBvdXQgb2YgY29tbW9uIGNvZGUu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
