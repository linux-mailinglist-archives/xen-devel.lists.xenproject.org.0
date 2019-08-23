Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92439AAA2
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 10:49:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i15Df-0003XC-MG; Fri, 23 Aug 2019 08:46:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LSoN=WT=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1i15Dd-0003X7-KI
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 08:46:49 +0000
X-Inumbo-ID: 8b3af14c-c582-11e9-8980-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b3af14c-c582-11e9-8980-bc764e2007e4;
 Fri, 23 Aug 2019 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566550010;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aeXRfF/wzHhO8MGHlu+O7Tvxi6uhYrRN+ZrittE5YeY=;
 b=IaHhht+pek/nzSZfk/2CX2E7GxLwdPTwOUQ5dMj+BC5h4JQ7mjh4RZXt
 aK3NHEVIuP0LxCNu8LofqdH843Mw6mes0S9BIb2YyLTM36ovbC9X8pa94
 yaexOJfQEd2K+glq0A4pbC1koTkJthpnYnZXe2ypKUImYt9D3nQqwIeBW o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jUKdfalZbvDl79Q6EE9xavpSM3hwfNTPCVe7T3J7a989zHf4v/y5NuwbtvP3TYHFDph1pgF++5
 qZ2h14kgEClEYy7zaMiri/d8w1fRcpKo4Pc29NJFgQ4MirlYU1N+bTxLfZtY3/4vaylfLOgyen
 s/38RicPo4b+GFWijSXl8r0KM67w+Mo7xr4MvLTMFjzJg9Z4ioYUXHeEbZoGY8zzv3S3Qp5hhq
 UhIGCBy2wH1eZV+jgXGNeJ7reQWo1vU3B8QXE3grnwF3NSZLL7UO8c/TspirHJFoMNCW6mMcMo
 BC0=
X-SBRS: 2.7
X-MesageID: 4637666
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,420,1559534400"; 
   d="scan'208";a="4637666"
To: Chao Gao <chao.gao@intel.com>, <xen-devel@lists.xenproject.org>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-16-git-send-email-chao.gao@intel.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <3b455c41-b5a3-2533-99a8-2200def4b19f@citrix.com>
Date: Fri, 23 Aug 2019 09:46:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566177928-19114-16-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 15/15] microcode: block #NMI handling
 when loading an ucode
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
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDgvMjAxOSAwMjoyNSwgQ2hhbyBHYW8gd3JvdGU6Cj4gcmVnaXN0ZXIgYW4gbm1pIGNh
bGxiYWNrLiBBbmQgdGhpcyBjYWxsYmFjayBkb2VzIGJ1c3ktbG9vcCBvbiB0aHJlYWRzCj4gd2hp
Y2ggYXJlIHdhaXRpbmcgZm9yIGxvYWRpbmcgY29tcGxldGlvbi4gQ29udHJvbCB0aHJlYWRzIHNl
bmQgTk1JIHRvCj4gc2xhdmUgdGhyZWFkcyB0byBwcmV2ZW50IE5NSSBhY2NlcHRhbmNlIGR1cmlu
ZyB1Y29kZSBsb2FkaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0Bp
bnRlbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2OToKPiAgLSBjb250cm9sIHRocmVhZHMgc2Vu
ZCBOTUkgdG8gYWxsIG90aGVyIHRocmVhZHMuIFNsYXZlIHRocmVhZHMgd2lsbAo+ICBzdGF5IGlu
IHRoZSBOTUkgaGFuZGxpbmcgdG8gcHJldmVudCBOTUkgYWNjZXB0YW5jZSBkdXJpbmcgdWNvZGUK
PiAgbG9hZGluZy4gTm90ZSB0aGF0IHNlbGYtbm1pIGlzIGludmFsaWQgYWNjb3JkaW5nIHRvIFNE
TS4KClRvIG1lIHRoaXMgbG9va3MgbGlrZSBhIGhhbGYtbWVhc3VyZTogd2h5IGtlZXAgb25seSBz
bGF2ZSB0aHJlYWRzIGluCnRoZSBOTUkgaGFuZGxlciwgd2hlbiBtYXN0ZXIgdGhyZWFkcyBjYW4g
dXBkYXRlIHRoZSBtaWNyb2NvZGUgZnJvbQppbnNpZGUgdGhlIE5NSSBoYW5kbGVyIGFzIHdlbGw/
CgpZb3UgbWVudGlvbiB0aGF0IHNlbGYtbm1pIGlzIGludmFsaWQsIGJ1dCBYZW4gaGFzIHNlbGZf
bm1pKCkgd2hpY2ggaXMKdXNlZCBmb3IgYXBwbHlfYWx0ZXJuYXRpdmVzKCkgZHVyaW5nIGJvb3Qs
IHNvIGNhbiBiZSB0cnVzdGVkIHRvIHdvcmsuCgpJIGV4cGVyaW1lbnRlZCBhIGJpdCB3aXRoIHRo
ZSBmb2xsb3dpbmcgYXBwcm9hY2g6IGFmdGVyIGxvYWRpbmdfc3RhdGUKYmVjb21lcyBMT0FESU5H
X0NBTExJTiwgZWFjaCBjcHUgaXNzdWVzIGEgc2VsZl9ubWkoKSBhbmQgcmVuZGV6dm91cwp2aWEg
Y3B1X2NhbGxpbl9tYXAgaW50byBMT0FESU5HX0VOVEVSIHRvIGRvIGEgdWNvZGUgdXBkYXRlIGRp
cmVjdGx5IGluCnRoZSBOTUkgaGFuZGxlci4gQW5kIGl0IHNlZW1zIHRvIHdvcmsuCgpTZXBhcmF0
ZSBxdWVzdGlvbiBpcyBhYm91dCB0aGUgc2FmZXR5IG9mIHRoaXMgYXBwcm9hY2g6IGNhbiB3ZSBi
ZSBzdXJlCnRoYXQgYSB1Y29kZSB1cGRhdGUgd291bGQgbm90IHJlc2V0IHRoZSBzdGF0dXMgb2Yg
dGhlIE5NSSBsYXRjaD8gSS5lLgpjYW4gaXQgY2F1c2UgYW5vdGhlciBOTUkgdG8gYmUgZGVsaXZl
cmVkIHdoaWxlIFhlbiBhbHJlYWR5IGhhbmRsZXMgb25lPwoKPiAgLSBzL3JlcF9ub3AvY3B1X3Jl
bGF4Cj4gIC0gcmVtb3ZlIGRlYnVnIG1lc3NhZ2UgaW4gbWljcm9jb2RlX25taV9jYWxsYmFjaygp
LiBQcmludGluZyBkZWJ1Zwo+ICBtZXNzYWdlIHdvdWxkIHRha2UgbG9uZyB0aW1lcyBhbmQgY29u
dHJvbCB0aHJlYWQgbWF5IHRpbWVvdXQuCj4gIC0gcmViYXNlIGFuZCBmaXggY29uZmxpY3RzCgpU
aGFua3MsClNlcmdleQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
