Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07AD165D76
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 13:23:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4kpf-000584-Mq; Thu, 20 Feb 2020 12:21:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K2d/=4I=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1j4kpe-00057y-2M
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 12:21:30 +0000
X-Inumbo-ID: 8518c702-53db-11ea-8516-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8518c702-53db-11ea-8516-12813bfff9fa;
 Thu, 20 Feb 2020 12:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582201289;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+Vfr3NKPjo1FVUs7Fd5GlcvJOdJ7UeY6QWcBkBbwt1A=;
 b=VIahFUS83tBnG38JIqGCaZE1onO4t56h0Jb0s9dK2NUNFmbiB1BTIhoN
 ktUa7nWWG9BUEE3sZ5DX+fs6j2CLCkAPNXwKQDN8AOcCXBDccLSsZzo5D
 mCx54hskw47yrchbIG6HmFscMbZyhRWyw8exGL2ALSo3+fXYwCzAW/121 M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BVCvHDFfoY7eIiAL3/JAYU7FiS2JddBeiErLzPFk0aZmTEyOci5sQQGpw0AOD4n2G+DpfyMr/V
 0AoFJeyXY/S7KNQI1jjF8XgiLVUpQ508yANM2gSoSr0hbYC/iRc/DXhd+LA9ljWo6fc+bGOxQW
 vZOGBFDXJef799fpj92Aqa7ZA35raL7RrwUv0TcvKbAYHtzSEmjblDpFHQLRF43jf0yPKKRme/
 mms36k2tM1w9eV/zJZRMEg8nHE+JfgPQmfzr42k9X95cg3lLSMXUe/lDcrUsB1pRi0/g/bEF0b
 FdU=
X-SBRS: 2.7
X-MesageID: 12731900
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,464,1574139600"; d="scan'208";a="12731900"
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200219091811.9689-1-aisaila@bitdefender.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 zK3laGuMZxe0OM5xTu2j2zA=
Message-ID: <d1c77b95-8607-fede-d4dc-ab99db74a014@citrix.com>
Date: Thu, 20 Feb 2020 12:21:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200219091811.9689-1-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi8xOS8yMCA5OjE4IEFNLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPiBBdCB0
aGlzIG1vbWVudCBhIGd1ZXN0IGNhbiBjYWxsIHZtZnVuYyB0byBjaGFuZ2UgdGhlIGFsdHAybSB2
aWV3LiBUaGlzCj4gc2hvdWxkIGJlIGxpbWl0ZWQgaW4gb3JkZXIgdG8gYXZvaWQgYW55IHVud2Fu
dGVkIHZpZXcgc3dpdGNoLgo+IAo+IFRoZSBuZXcgeGNfYWx0cDJtX3NldF92aXNpYmlsaXR5KCkg
c29sdmVzIHRoaXMgYnkgbWFraW5nIHZpZXdzIGludmlzaWJsZQo+IHRvIHZtZnVuYy4KPiBUaGlz
IGlzIGRvbmUgYnkgaGF2aW5nIGEgc2VwYXJhdGUgYXJjaC5hbHRwMm1fd29ya2luZ19lcHRwIHRo
YXQgaXMKPiBwb3B1bGF0ZWQgYW5kIG1hZGUgaW52YWxpZCBpbiB0aGUgc2FtZSBwbGFjZXMgYXMg
YWx0cDJtX2VwdHAuIFRoaXMgaXMKPiB3cml0dGVuIHRvIEVQVFBfTElTVF9BRERSLgo+IFRoZSB2
aWV3cyBhcmUgbWFkZSBpbi92aXNpYmxlIGJ5IG1hcmtpbmcgdGhlbSB3aXRoIElOVkFMSURfTUZO
IG9yCj4gY29weWluZyB0aGVtIGJhY2sgZnJvbSBhbHRwMm1fZXB0cC4KPiBUbyBoYXZlIGNvbnNp
c3RlbmN5IHRoZSB2aXNpYmlsaXR5IGFsc28gYXBwbGllcyB0bwo+IHAybV9zd2l0Y2hfZG9tYWlu
X2FsdHAybV9ieV9pZCgpLgoKClNvIGl0IGxvb2tzIGxpa2UgYnkgZGVmYXVsdCB0aGUgdmlld3Mg
YXJlIHZpc2libGUsIHVudGlsIHRoZXkncmUgbWFkZQpub24tdmlzaWJsZT8KCkFsc28sIGRvZXMg
dGhlIGxhc3QgbGluZSBtZWFuIHRoYXQgdGhlIHRvb2xzdGFjayBjYW4ndCBjaGFuZ2UgdG8gYQoi
bm9uLXZpc2libGUiIGFsdHAybSBlaXRoZXI/CgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
