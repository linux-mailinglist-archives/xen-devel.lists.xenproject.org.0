Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A55518D821
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 20:10:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFN0C-0000Sa-BJ; Fri, 20 Mar 2020 19:08:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sjin=5F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jFN0B-0000SQ-C1
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 19:08:15 +0000
X-Inumbo-ID: 232a7238-6ade-11ea-b34e-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 232a7238-6ade-11ea-b34e-bc764e2007e4;
 Fri, 20 Mar 2020 19:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584731290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5szMN6eLyIRQyrcbotjLy/JLjgHXMPVpj2Am1OM3ueQ=;
 b=G0/Xb/edTW1VzD7JcT9Q0wqWxHTfUdxIqVe0jbr6da0eI5mid4fCG5yf
 SQziSovKeJmM4Sgkuj1drLEsTe9/NO3VWHLxCpPtfxJU9jIQWtjW9IqVa
 OMjWXG5gMMU3Yh3Sey/R5qT97fz3JMBH40NtR5feQzmrI7lOE5AG29uH2 I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /CGnllzdDdPIXxzmv+3CDFRPOiZ7Z0mjRf4Q4+o06QkU13pPCiupy/9W5skuIZpcqloihrvxia
 k1VEBHeMByJ5JqKvCSy6xPvO9FEtMm2t+17aK+6rDlG7MYckBoxbXENS38QYtYflRKx3MBhyM+
 PhT86OALuJ7cHzgkTHVvzeMw4h3eKjy6sqw1lvedQoRg4eMuGLMpVGXrCo0odR8ZJBZx+b0HIK
 CVs4WXcgUSamH4Wu2TbsBvaC2zxULUEoVDDvmzk12WpoYP+LYOe5pvLaDHyBjRTa13ZJfF7ECb
 jNg=
X-SBRS: 2.7
X-MesageID: 14352788
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,285,1580792400"; d="scan'208";a="14352788"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 20 Mar 2020 20:07:36 +0100
Message-ID: <20200320190737.42110-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200320190737.42110-1-roger.pau@citrix.com>
References: <20200320190737.42110-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/3] x86/nvmx: clarify and fix usage of
 nvmx_update_apicv
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGN1cnJlbnQgdXNhZ2Ugb2YgbnZteF91cGRhdGVfYXBpY3YgaXMgbm90IGNsZWFyOiBpdCBp
cyBkZWVwbHkKaW50ZXJ0d2luZWQgd2l0aCB0aGUgQWNrIGludGVycnVwdCBvbiBleGl0IFZNRVhJ
VCBjb250cm9sLgoKVGhlIGNvZGUgaW4gbnZteF91cGRhdGVfYXBpY3Ygc2hvdWxkIHVwZGF0ZSB0
aGUgU1ZJIChpbiBzZXJ2aWNlIGludGVycnVwdCkKZmllbGQgb2YgdGhlIGd1ZXN0IGludGVycnVw
dCBzdGF0dXMgb25seSB3aGVuIHRoZSBBY2sgaW50ZXJydXB0IG9uCmV4aXQgaXMgc2V0LCBhcyBp
dCBpcyB1c2VkIHRvIHJlY29yZCB0aGF0IHRoZSBpbnRlcnJ1cHQgYmVpbmcKc2VydmljZWQgaXMg
c2lnbmFsZWQgaW4gYSB2bWNzIGZpZWxkLCBhbmQgaGVuY2UgaGFzbid0IGJlZW4gaW5qZWN0ZWQK
YXMgb24gbmF0aXZlLiBJdCdzIGltcG9ydGFudCB0byByZWNvcmQgdGhlIGN1cnJlbnQgaW4gc2Vy
dmljZQppbnRlcnJ1cHQgb24gdGhlIGd1ZXN0IGludGVycnVwdCBzdGF0dXMgZmllbGQsIG9yIGVs
c2UgZnVydGhlcgppbnRlcnJ1cHRzIHdvbid0IHJlc3BlY3QgdGhlIHByaW9yaXR5IG9mIHRoZSBp
biBzZXJ2aWNlIG9uZS4KCldoaWxlIGNsYXJpZnlpbmcgdGhlIHVzYWdlIG1ha2Ugc3VyZSB0aGF0
IHRoZSBTVkkgaXMgb25seSB1cGRhdGVkIHdoZW4KQWNrIG9uIGV4aXQgaXMgc2V0IGFuZCB0aGUg
bmVzdGVkIHZtY3MgaW50ZXJydXB0IGluZm8gZmllbGQgaXMgdmFsaWQuIE9yCmVsc2UgYSBndWVz
dCBub3QgdXNpbmcgdGhlIEFjayBvbiBleGl0IGZlYXR1cmUgd291bGQgbG9vc2UgaW50ZXJydXB0
cyBhcwp0aGV5IHdvdWxkIGJlIHNpZ25hbGVkIGFzIGJlaW5nIGluIHNlcnZpY2Ugb24gdGhlIGd1
ZXN0IGludGVycnVwdApzdGF0dXMgZmllbGQgYnV0IHdvbid0IGFjdHVhbGx5IGJlIHJlY29yZGVk
IG9uIHRoZSBpbnRlcnJ1cHQgaW5mbyB2bWNzCmZpZWxkLCBuZWl0aGVyIGluamVjdGVkIGluIGFu
eSBvdGhlciB3YXkuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgfCAxMSArKysrKysr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZt
L3ZteC92dm14LmMKaW5kZXggMWI4NDYxYmEzMC4uMTgwZDAxZTM4NSAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L2h2bS92bXgvdnZteC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXgu
YwpAQCAtMTM4Myw3ICsxMzgzLDcgQEAgc3RhdGljIHZvaWQgbnZteF91cGRhdGVfYXBpY3Yoc3Ry
dWN0IHZjcHUgKnYpCiB7CiAgICAgc3RydWN0IG5lc3RlZHZteCAqbnZteCA9ICZ2Y3B1XzJfbnZt
eCh2KTsKICAgICB1bnNpZ25lZCBsb25nIHJlYXNvbiA9IGdldF92dm1jcyh2LCBWTV9FWElUX1JF
QVNPTik7Ci0gICAgdWludDMyX3QgaW50cl9pbmZvID0gbnZteC0+aW50ci5pbnRyX2luZm87Cisg
ICAgdW5zaWduZWQgbG9uZyBpbnRyX2luZm8gPSBnZXRfdnZtY3ModiwgVk1fRVhJVF9JTlRSX0lO
Rk8pOwogCiAgICAgaWYgKCByZWFzb24gPT0gRVhJVF9SRUFTT05fRVhURVJOQUxfSU5URVJSVVBU
ICYmCiAgICAgICAgICBudm14LT5pbnRyLnNvdXJjZSA9PSBodm1faW50c3JjX2xhcGljICYmCkBA
IC0xMzk5LDYgKzEzOTksMTUgQEAgc3RhdGljIHZvaWQgbnZteF91cGRhdGVfYXBpY3Yoc3RydWN0
IHZjcHUgKnYpCiAgICAgICAgIHBwciA9IHZsYXBpY19zZXRfcHByKHZsYXBpYyk7CiAgICAgICAg
IFdBUk5fT04oKHBwciAmIDB4ZjApICE9ICh2ZWN0b3IgJiAweGYwKSk7CiAKKyAgICAgICAgLyoK
KyAgICAgICAgICogU1ZJIG11c3QgYmUgdXBkYXRlZCB3aGVuIHRoZSBpbnRlcnJ1cHQgaGFzIGJl
ZW4gc2lnbmFsZWQgdXNpbmcgdGhlCisgICAgICAgICAqIEFjayBvbiBleGl0IGZlYXR1cmUsIG9y
IGVsc2UgdGhlIGN1cnJlbnRseSBpbi1zZXJ2aWNlIGludGVycnVwdAorICAgICAgICAgKiB3b24n
dCBiZSByZXNwZWN0ZWQuCisgICAgICAgICAqCisgICAgICAgICAqIE5vdGUgdGhhdCB0aGlzIGlz
IHNwZWNpZmljIHRvIHRoZSBmYWN0IHRoYXQgd2hlbiBkb2luZyBhIFZNRVhJVCBhbgorICAgICAg
ICAgKiBpbnRlcnJ1cHQgbWlnaHQgZ2V0IGRlbGl2ZXJlZCB1c2luZyB0aGUgaW50ZXJydXB0IGlu
Zm8gdm1jcyBmaWVsZAorICAgICAgICAgKiBpbnN0ZWFkIG9mIGJlaW5nIGluamVjdGVkIG5vcm1h
bGx5LgorICAgICAgICAgKi8KICAgICAgICAgc3RhdHVzID0gdmVjdG9yIDw8IFZNWF9HVUVTVF9J
TlRSX1NUQVRVU19TVklfT0ZGU0VUOwogICAgICAgICBydmkgPSB2bGFwaWNfaGFzX3BlbmRpbmdf
aXJxKHYpOwogICAgICAgICBpZiAoIHJ2aSAhPSAtMSApCi0tIAoyLjI1LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
