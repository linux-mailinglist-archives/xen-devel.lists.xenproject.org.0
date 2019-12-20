Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 944F112826B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 19:48:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiNIW-0007UA-E2; Fri, 20 Dec 2019 18:46:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ryrQ=2K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iiNIV-0007U4-G4
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 18:46:47 +0000
X-Inumbo-ID: 1289a920-2359-11ea-93d6-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1289a920-2359-11ea-93d6-12813bfff9fa;
 Fri, 20 Dec 2019 18:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576867606;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=25Ou6hyMlhau2+AcyRIeuP8PXOUZl0on0NXtb6AZm64=;
 b=H6b0GgA/76Fj0FM+XqPl4fX0uxfLOGm2+0zHExLpq6HY/7Ra9PYWbWwb
 kbFM2MPLvNC1Yrrl29AU69nlbqWMmxrJG19RJe82Imrfzx0wlVYB+W1Cs
 m9tih5g4xSLIctaTZqzp6DABlMe/ip62NEO/4ds/Lvtdq6dZcm6fUI+f/ M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LUy6aOAnLuvgyY+hTqTmOdoXVEHNX8HAhUUvJdg40Q0AXPZLx0l+3GPLOtuctM+TDLTOpBGAo9
 ShdYfagGwh8OZ8mQnimxhTluKAPBdb+/qBmMvDy//a8HgGimUmulPFDdTbgF8QcmSkF47u3p1a
 GKGLQyM+FfQAYab+2zy8RegtCUGjqDLYK3NzJLMvrpKxGsbIi58vTTtKRsLLF0e32RJWn3/NG1
 jGNwDeLs/BrVyHouioiSIkj28QWuxJgrVoZYnYOL5RzAOo4on0Z9vBGti+iRE9UDkY3ZyaF4AV
 V7Q=
X-SBRS: 2.7
X-MesageID: 10158346
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,336,1571716800"; d="scan'208";a="10158346"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24061.5904.132386.21801@mariner.uk.xensource.com>
Date: Fri, 20 Dec 2019 18:46:40 +0000
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <7db92c7c-6c49-8bb1-c5e8-bc0b496c3621@citrix.com>
References: <20191220172310.27231-1-andrew.cooper3@citrix.com>
 <24061.4463.693713.311441@mariner.uk.xensource.com>
 <7db92c7c-6c49-8bb1-c5e8-bc0b496c3621@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] libxc/restore: Don't duplicate state in
 process_vcpu_basic()
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

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1BBVENIXSBsaWJ4Yy9yZXN0b3JlOiBEb24ndCBk
dXBsaWNhdGUgc3RhdGUgaW4gcHJvY2Vzc192Y3B1X2Jhc2ljKCkiKToKPiBPbiAyMC8xMi8yMDE5
IDE4OjIyLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IEl0IGlzIG5vdCBvYnZpb3VzIHRvIG1lIHRo
YXQgbm90aGluZyB1c2VzIHRoZSBtb2RpZmllZCBmaWVsZHMgYWZ0ZXIKPiA+IHByb2Nlc3NfdmNw
dV9iYXNpYyBoYXMgZWRpdGVkIHRoaW5ncy4gIFRoZSBjdHggb2Ygd2hpY2ggdGhlIHZjcHUgaXMK
PiA+IHBhcnQgaXMgcGFzc2VkIHRvIHByb2Nlc3NfdmNwdV88dmFyaW91cz4gYnkgdXBkYXRlX3Zj
cHVfY29udGV4dC4KLi4uCj4gWWVzLsKgIEl0IHdhcyBhIGNvbnNlcXVlbmNlIG9mIGFkZGluZyBS
ZW11cyBzdXBwb3J0ICh3aGljaCBoYXBwZW5lZCBvbgo+IHhlbi1kZXZlbCwgcG9zdCBhY3R1YWxs
eS1nZXR0aW5nLW1pZ3JhdGlvbi12Mi13b3JraW5nKS4KPiAKPiBPcmlnaW5hbGx5LCB0aGlzIHdh
cyBjb3BpZWQgb3V0IG9mIHRoZSBpbmNvbWluZyB4Y19zcl9yZWNvcmQqIHBvaW50ZXIKPiB3aGlj
aCB3YXMgY29uc3QuwqAgQWRkaW5nIFJlbXVzIHN1cHBvcnQgcmVxdWlyZWQgYnVmZmVyaW5nIHRo
ZXNlIHJlY29yZHMKPiBvbiBlYWNoIGNoZWNrcG9pbnQsIHdoaWNoIGlzIHdoeSB0aGV5IGFyZSBz
dGFzaGVkIHNpZGV3YXlzIG5vdy4KPiAKPiBCeSB0aGUgdGltZSB3ZSBnZXQgcHJvY2Vzc192Y3B1
X2Jhc2ljKCksIHdlIGFyZSBjb21taXR0ZWQgdG8gY29tcGxldGluZwo+IHN0YXRlIHJlc3RvcmF0
aW9uIGFuZCB1bnBhdXNpbmcgdGhlIGd1ZXN0Lgo+IAo+IEluIHBhcnRpY3VsYXIsIGl0IGlzIG5v
dCBwb3NzaWJsZSB0byBwcm9jZXNzIGFueSBmdXJ0aGVyIG1lbW9yeSBwYWdlcwo+IGJlY2F1c2Ug
dGhlIGh5cGVyY2FsbCB1c2VkIGhlcmUgY2hhbmdlcyB0eXBlcmVmcyBvbiBwYWdldGFibGVzLCB3
aGljaAo+IG1ha2VzIHRoZW0gaW1tdXRhYmxlIGZyb20gdGhlIHRvb2xzdGFja3MgcG9pbnQgb2Yg
dmlldyAodGVjaG5pY2FsbHkgbm90LAo+IGJ1dCB3ZSBjYW4ndCBtYXAgdGhlbSBhbmQgbWVtY3B5
IHRoZW0gYW55IG1vcmUpLgoKVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uICBDYW4geW91IGFk
ZCB0aGF0IHRvIHRoZSBjb21taXQgbWVzc2FnZQpwbGVhc2UgPyAgVGhhdCB3YXkgaWYgdGhpcyB0
dXJucyBvdXQgdG8gYmUgd3JvbmcsIG9yIHNvbWVvbmUgd2FudHMgdG8KcmV2ZXJ0IGl0IGFnYWlu
LCB3ZSdsbCBoYXZlIHNvbWUgcmVjb3JkIG9mIHdoeSB0aGlzIHdhcyB0aG91Z2h0IHRvIGJlCk9L
LgoKV2l0aCB0aGF0IGRvbmUsCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+CgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
