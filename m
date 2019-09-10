Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE273AF25B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 22:40:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7msq-0004Ht-IN; Tue, 10 Sep 2019 20:37:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I4Uw=XF=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i7mso-0004Ho-Qc
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 20:37:02 +0000
X-Inumbo-ID: bdd45f94-d40a-11e9-ac21-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdd45f94-d40a-11e9-ac21-12813bfff9fa;
 Tue, 10 Sep 2019 20:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568147822;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=PQX2XV0vVmXhFIlKkjJKf1ji0vclOmRYdx+xosldAik=;
 b=OmWwFMcJRffOs7x6PgZIi7HA+X/HEr71iHlB58m4kNVK5RPtHb/IHrRp
 ttCeyMpnH5SgIcQViN+jfGmAWCvTlSRdmxIxSzrphZqyAuWTb/ESY5tnn
 5sUX4OjZL6P5DYwkoaoR9zvaSjGwSpe5JqOPnZPEYRdVdaZDF8zP0H5ZL 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6Al88nOj1y14/m72nAPf2nC7ggByJ2zYOOvHJNU1oXsjAIBEiR/C874dTwKtkLpjZpv6rXgHoc
 ZJv97sDCDMsd3wl8d8fOQyB+45HsExWuOF/bAdF0ALhdHkwCvc5BRttBJ4e4fLlf+W7s5lyysC
 U//fmTRFSSWr+1wW3hTwV+lANEQeXGewhsOHK0ggRqsRfUPGkdVg7g5MIekcziJnEDXqAsmvdU
 yIE7w5F2BItYpD8bGXoFdznrXrZ7zPegfobWq0SDLsUCsGpG4MUfNSEtUJqfS5mL6Zc7GWG9vH
 43M=
X-SBRS: 2.7
X-MesageID: 5399823
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,490,1559534400"; 
   d="scan'208";a="5399823"
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
 <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
 <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
 <adefac87-c2b3-b67f-fb4d-d763ce920bef@citrix.com>
 <1695c88d-e5ad-1854-cdef-3cd95c812574@oracle.com>
 <4d3bf854-51de-99e4-9a40-a64c581bdd10@citrix.com>
 <bc3da154-d451-02cf-6154-5e0dc721a6e6@oracle.com>
 <c45b8786-5735-a95d-bc40-61372c326037@citrix.com>
 <43e492ff-f967-7218-65c4-d16581fabea3@oracle.com>
 <416ff4b7-3186-f61a-75fa-bcfc968f8117@citrix.com>
 <df64cd80-d92e-27ad-b1bc-e58184379e50@oracle.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <d281baaf-a6d7-306e-63aa-b84552ac3ea5@citrix.com>
Date: Tue, 10 Sep 2019 21:36:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <df64cd80-d92e-27ad-b1bc-e58184379e50@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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
Cc: jgross@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDkvMjAxOSAxODo0OCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDkvMTAvMTkg
NTo0NiBBTSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDEwLzA5LzIwMTkgMDI6NDcsIEJv
cmlzIE9zdHJvdnNreSB3cm90ZToKPj4+IE9uIDkvOS8xOSA1OjQ4IFBNLCBJZ29yIERydXpoaW5p
biB3cm90ZToKPj4+PiBPbiAwOS8wOS8yMDE5IDIwOjE5LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6
Cj4+Pj4KPj4+Pj4gVGhlIG90aGVyIHF1ZXN0aW9uIEkgaGF2ZSBpcyB3aHkgeW91IHRoaW5rIGl0
J3Mgd29ydGgga2VlcGluZwo+Pj4+PiB4ZW5fbWNmZ19sYXRlKCkgYXMgYSBsYXRlIGluaXRjYWxs
LiBIb3cgY291bGQgTUNGRyBpbmZvIGJlIHVwZGF0ZWQKPj4+Pj4gYmV0d2VlbiBhY3BpX2luaXQo
KSBhbmQgbGF0ZV9pbml0Y2FsbHMgYmVpbmcgcnVuPyBJJ2QgdGhpbmsgaXQgY2FuIG9ubHkKPj4+
Pj4gaGFwcGVuIHdoZW4gYSBuZXcgZGV2aWNlIGlzIGhvdHBsdWdnZWQuCj4+Pj4+Cj4+Pj4gSXQg
d2FzIGEgcHJlY2F1dGlvbiBhZ2FpbnN0IHNldHVwX21jZmdfbWFwKCkgY2FsbHMgdGhhdCBtaWdo
dCBhZGQgbmV3Cj4+Pj4gYXJlYXMgdGhhdCBhcmUgbm90IGluIE1DRkcgdGFibGUgYnV0IGZvciBz
b21lIHJlYXNvbiBoYXZlIF9DQkEgbWV0aG9kLgo+Pj4+IEl0J3Mgb2J2aW91c2x5IGEgImZpcm13
YXJlIGlzIGJyb2tlbiIgc2NlbmFyaW8gc28gSSBkb24ndCBoYXZlIHN0cm9uZwo+Pj4+IGZlZWxp
bmdzIHRvIGtlZXAgaXQgaGVyZS4gV2lsbCBwcmVmZXIgdG8gcmVtb3ZlIGluIHYyIGlmIHlvdSB3
YW50Lgo+Pj4gSXNuJ3Qgc2V0dXBfbWNmZ19tYXAoKSBjYWxsZWQgYmVmb3JlIHRoZSBmaXJzdCB4
ZW5fYWRkX2RldmljZSgpIHdoaWNoIGlzIHdoZXJlIHlvdSBhcmUgY2FsbGluZyB4ZW5fbWNmZ19s
YXRlKCk/Cj4+Pgo+PiBzZXR1cF9tY2ZnX21hcCgpIGNhbGxzIGFyZSBkb25lIGluIG9yZGVyIG9m
IHJvb3QgYnVzIGRpc2NvdmVyeSB3aGljaAo+PiBoYXBwZW5zICphZnRlciogdGhlIHByZXZpb3Vz
IHJvb3QgYnVzIGhhcyBiZWVuIGVudW1lcmF0ZWQuIFNvIHRoZSBvcmRlcgo+PiBpczogY2FsbCBz
ZXR1cF9tY2ZnX21hcCgpIGZvciByb290IGJ1cyAwLCBmaW5kIHRoYXQKPj4gcGNpX21tY2ZnX2xh
dGVfaW5pdCgpIGhhcyBmaW5pc2hlZCBNQ0ZHIGFyZWEgcmVnaXN0cmF0aW9uLCBwZXJmb3JtIFBD
SQo+PiBlbnVtZXJhdGlvbiBvZiBidXMgMCwgY2FsbCB4ZW5fYWRkX2RldmljZSgpIGZvciBldmVy
eSBkZXZpY2UgdGhlcmUsIGNhbGwKPj4gc2V0dXBfbWNmZ19tYXAoKSBmb3Igcm9vdCBidXMgWCwg
ZXRjLgo+IAo+IEFoLCB5ZXMuIE11bHRpcGxlIGJ1c3Nlcy4KPiAKPiBJZiB0aGF0J3MgdGhlIGNh
c2UgdGhlbiB3aHkgZG9uJ3Qgd2UgbmVlZCB0byBjYWxsIHhlbl9tY2ZnX2xhdGUoKSBmb3IKPiB0
aGUgZmlyc3QgZGV2aWNlIG9uIGVhY2ggYnVzPwo+IAoKSWRlYWxseSwgeWVzIC0gd2UnZCBsaWtl
IHRvIGNhbGwgaXQgZm9yIGV2ZXJ5IGJ1cyBkaXNjb3ZlcmVkLiBCdXQgYm9vdAp0aW1lIGJ1c2Vz
IGFyZSBhbHJlYWR5IGluIE1DRkcgKG90aGVyd2lzZSBzeXN0ZW0gYm9vdCBtaWdodCBub3Qgc2lt
cGx5CndvcmsgYXMgSmFuIHBvaW50ZWQgb3V0KSBzbyBpdCdzIG5vdCBzdHJpY3RseSByZXF1aXJl
ZC4gVGhlIG9ubHkgY2FzZSBpcwphIHBvdGVudGlhbCBQQ0kgYnVzIGhvdC1wbHVnIGJ1dCBJJ20g
bm90IHN1cmUgaXQgYWN0dWFsbHkgd29ya3MgaW4KcHJhY3RpY2UgYW5kIHdlIGNlcnRhaW5seSBk
aWRuJ3Qgc3VwcG9ydCBpdCBiZWZvcmUuIEl0IG1pZ2h0IGJlIHNvbHZlZAp0aGVvcmV0aWNhbGx5
IGJ5IHN1YnNjcmliaW5nIHRvIGFjcGlfYnVzX3R5cGUgdGhhdCBpcyBhdmFpbGFibGUgYWZ0ZXIK
YWNwaV9pbml0KCkuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
