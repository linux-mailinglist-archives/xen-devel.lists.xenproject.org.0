Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D4EF321B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 16:09:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSjN3-0005Fd-Ro; Thu, 07 Nov 2019 15:06:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/O7A=Y7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iSjN1-0005FC-KE
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 15:06:47 +0000
X-Inumbo-ID: 326b155f-0170-11ea-a1c9-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 326b155f-0170-11ea-a1c9-12813bfff9fa;
 Thu, 07 Nov 2019 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573139199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F1lO8xZRYmoHRnNmnpchpguUzut3IRCkGGFXjG55/BE=;
 b=drIao0xYHDfeu8ZIYVfwmd/LMtQaH0PzUqmCgTGdXUuacDdvCNwddKnF
 ebJCv+10SpuHxWWbgdyMp1cOf+yMMbQBesTBhNSKtQ98+JpPQFQIxc1C6
 8MW0IMIwa+CI6R29ipdPisCyeOO7xhFQOlpee1ZJaqjg0HI93e1sP4mI9 M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pXBYzvLxZRm6Xiq9shbr9C+4HNeavatDdYGCZcrPnlJsJu7s5muv1J/mpxqEGWhW586gY1bw/+
 yPCGWBsaIschoETG90Tcb/8D68Q+DElprNPbj5XdODlyXk2E7KqK5Cc6i482FrCiUs+XUGePaV
 BOFxQAJR0pi9yzT/gZQEq59Rkcr2GZ78CQ6i/RUyj6qRVIuAiQJAB3rPYK8PdB7QYEz4HofjHl
 NaoLV80ZGq6ueNBfkw8z78py2JL2Y6UY9r6DqCyzlL85HD1BinFc0aphYCockl1xricTWTMrEQ
 dEI=
X-SBRS: 2.7
X-MesageID: 8511638
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,278,1569297600"; 
   d="scan'208";a="8511638"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 7 Nov 2019 16:06:09 +0100
Message-ID: <20191107150609.93004-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107150609.93004-1-roger.pau@citrix.com>
References: <20191107150609.93004-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 2/2] x86/ioapic: don't use raw entry
 reads/writes in clear_IO_APIC_pin
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
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Y2xlYXJfSU9fQVBJQ19waW4gY2FuIGJlIGNhbGxlZCBhZnRlciB0aGUgaW9tbXUgaGFzIGJlZW4g
ZW5hYmxlZCwgYW5kCnVzaW5nIHJhdyBlbnRyeSByZWFkcyBhbmQgd3JpdGVzIHdpbGwgcmVzdWx0
IGluIGEgbWlzY29uZmlndXJhdGlvbiBvZgp0aGUgZW50cmllcyBhbHJlYWR5IHNldHVwIHRvIHVz
ZSB0aGUgaW50ZXJydXB0IHJlbWFwcGluZyB0YWJsZS4gVGhpcwpmaXhlcyB0aGUgZm9sbG93aW5n
IHBhbmljIHNlZW4gb24gQU1EIFJvbWUgYm94ZXM6CgooWEVOKSBbICAgMTAuMDgyMTU0XSBFTkFC
TElORyBJTy1BUElDIElSUXMKKFhFTikgWyAgIDEwLjA4Nzc4OV0gIC0+IFVzaW5nIG5ldyBBQ0sg
bWV0aG9kCihYRU4pIFsgICAxMC4wOTM3MzhdIEFzc2VydGlvbiAnZ2V0X3J0ZV9pbmRleChydGUp
ID09IG9mZnNldCcgZmFpbGVkIGF0IGlvbW11X2ludHIuYzozMjgKClNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaW9fYXBpYy5jIHwgOCArKysr
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaW9fYXBpYy5jIGIveGVuL2FyY2gveDg2L2lvX2FwaWMu
YwppbmRleCBiOWM2NmFjZGIzLi4xM2I0MWI0NmEzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
aW9fYXBpYy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMKQEAgLTUxNCwxMyArNTE0LDEz
IEBAIHN0YXRpYyB2b2lkIGNsZWFyX0lPX0FQSUNfcGluKHVuc2lnbmVkIGludCBhcGljLCB1bnNp
Z25lZCBpbnQgcGluKQogICAgICAgICBlbnRyeS5tYXNrID0gMTsKICAgICAgICAgX19pb2FwaWNf
d3JpdGVfZW50cnkoYXBpYywgcGluLCBmYWxzZSwgZW50cnkpOwogICAgIH0KLSAgICBlbnRyeSA9
IF9faW9hcGljX3JlYWRfZW50cnkoYXBpYywgcGluLCB0cnVlKTsKKyAgICBlbnRyeSA9IF9faW9h
cGljX3JlYWRfZW50cnkoYXBpYywgcGluLCBmYWxzZSk7CiAKICAgICBpZiAoZW50cnkuaXJyKSB7
CiAgICAgICAgIC8qIE1ha2Ugc3VyZSB0aGUgdHJpZ2dlciBtb2RlIGlzIHNldCB0byBsZXZlbC4g
Ki8KICAgICAgICAgaWYgKCFlbnRyeS50cmlnZ2VyKSB7CiAgICAgICAgICAgICBlbnRyeS50cmln
Z2VyID0gMTsKLSAgICAgICAgICAgIF9faW9hcGljX3dyaXRlX2VudHJ5KGFwaWMsIHBpbiwgdHJ1
ZSwgZW50cnkpOworICAgICAgICAgICAgX19pb2FwaWNfd3JpdGVfZW50cnkoYXBpYywgcGluLCBm
YWxzZSwgZW50cnkpOwogICAgICAgICB9CiAgICAgICAgIF9faW9fYXBpY19lb2koYXBpYywgZW50
cnkudmVjdG9yLCBwaW4pOwogICAgIH0KQEAgLTUzMCw5ICs1MzAsOSBAQCBzdGF0aWMgdm9pZCBj
bGVhcl9JT19BUElDX3Bpbih1bnNpZ25lZCBpbnQgYXBpYywgdW5zaWduZWQgaW50IHBpbikKICAg
ICAgKi8KICAgICBtZW1zZXQoJmVudHJ5LCAwLCBzaXplb2YoZW50cnkpKTsKICAgICBlbnRyeS5t
YXNrID0gMTsKLSAgICBfX2lvYXBpY193cml0ZV9lbnRyeShhcGljLCBwaW4sIHRydWUsIGVudHJ5
KTsKKyAgICBfX2lvYXBpY193cml0ZV9lbnRyeShhcGljLCBwaW4sIGZhbHNlLCBlbnRyeSk7CiAK
LSAgICBlbnRyeSA9IF9faW9hcGljX3JlYWRfZW50cnkoYXBpYywgcGluLCB0cnVlKTsKKyAgICBl
bnRyeSA9IF9faW9hcGljX3JlYWRfZW50cnkoYXBpYywgcGluLCBmYWxzZSk7CiAgICAgaWYgKGVu
dHJ5LmlycikKICAgICAgICAgcHJpbnRrKEtFUk5fRVJSICJJTy1BUElDJTAyeC0ldTogVW5hYmxl
IHRvIHJlc2V0IElSUlxuIiwKICAgICAgICAgICAgICAgIElPX0FQSUNfSUQoYXBpYyksIHBpbik7
Ci0tIAoyLjIzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
