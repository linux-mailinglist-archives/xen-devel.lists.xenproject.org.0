Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B457A812F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 13:38:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Ta4-00074u-DL; Wed, 04 Sep 2019 11:36:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IHZE=W7=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i5Ta2-00074k-KP
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 11:36:06 +0000
X-Inumbo-ID: 2e163a6e-cf08-11e9-abb0-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e163a6e-cf08-11e9-abb0-12813bfff9fa;
 Wed, 04 Sep 2019 11:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567596966;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Py2ZD8CCSw/9B0rd6D03QDD9TGSgz5D84ZWXYCCdtq8=;
 b=Oz6pR+Emg3EsFg99W3LFwqVA0e51+RpEYNjPwLFI//lb9xLs6noTzvxx
 /aOIg6aFc4R3Un4IevHNcue8acxPzZpkU9HwjAnLRyEielz5Vd2/CEqTk
 lhlHMYiNpfWfjztAvEcam6RwM0+sWh28Xr3gIpO9RFVrZMkkWH1h7Wl7U M=;
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
IronPort-SDR: 2PTu1kolVbKh7SpgBh5Drp1q5mHyou+YZiM+VEqUUyr78eZkRLs3AGIVi00rAA/BJKspJQfYBF
 3GaJIe+PrYIECgWU8inhCmA2FqHQuR6bT2blqwD12xI7+Ex/yHfCghPkbiJdJQeGlW+lAF3+Tf
 P+TXL70gVl1Pfc+zaH3Qsns+LKZK5zKh3s4xAKoEOPAbSRWWHjSUkkTHA5TdlBVQPu8S+0+5gz
 K/l+8Z/vM4LGBuHVLdB2pl6V9xUjd+9AlnGcbL5Ldl/wr520/JWn1LfIvVmKmsZHASjVFg7yDg
 Fjc=
X-SBRS: 2.7
X-MesageID: 5111376
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,465,1559534400"; 
   d="scan'208";a="5111376"
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <52fe7f67-ffd0-2d22-90fb-f3462ea059cd@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <d5dd94c2-070e-b3ff-57cf-92893b3cca7b@citrix.com>
Date: Wed, 4 Sep 2019 12:36:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <52fe7f67-ffd0-2d22-90fb-f3462ea059cd@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDkvMjAxOSAxMDowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQuMDkuMjAxOSAw
MjoyMCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IElmIE1DRkcgYXJlYSBpcyBub3QgcmVzZXJ2
ZWQgaW4gRTgyMCwgWGVuIGJ5IGRlZmF1bHQgd2lsbCBkZWZlciBpdHMgdXNhZ2UKPj4gdW50aWwg
RG9tMCByZWdpc3RlcnMgaXQgZXhwbGljaXRseSBhZnRlciBBQ1BJIHBhcnNlciByZWNvZ25pemVz
IGl0IGFzCj4+IGEgcmVzZXJ2ZWQgcmVzb3VyY2UgaW4gRFNEVC4gSGF2aW5nIGl0IHJlc2VydmVk
IGluIEU4MjAgaXMgbm90Cj4+IG1hbmRhdG9yeSBhY2NvcmRpbmcgdG8gIlBDSSBGaXJtd2FyZSBT
cGVjaWZpY2F0aW9uLCByZXYgMy4yIiAocGFyLiA0LjEuMikKPj4gYW5kIGZpcm13YXJlIGlzIGZy
ZWUgdG8ga2VlcCBhIGhvbGUgRTgyMCBpbiB0aGF0IHBsYWNlLiBYZW4gZG9lc24ndCBrbm93Cj4+
IHdoYXQgZXhhY3RseSBpcyBpbnNpZGUgdGhpcyBob2xlIHNpbmNlIGl0IGxhY2tzIGZ1bGwgQUNQ
SSB2aWV3IG9mIHRoZQo+PiBwbGF0Zm9ybSB0aGVyZWZvcmUgaXQncyBwb3RlbnRpYWxseSBoYXJt
ZnVsIHRvIGFjY2VzcyBNQ0ZHIHJlZ2lvbgo+PiB3aXRob3V0IGFkZGl0aW9uYWwgY2hlY2tzIGFz
IHNvbWUgbWFjaGluZXMgYXJlIGtub3duIHRvIHByb3ZpZGUKPj4gaW5jb25zaXN0ZW50IGluZm9y
bWF0aW9uIG9uIHRoZSBzaXplIG9mIHRoZSByZWdpb24uCj4gCj4gSXJyZXNwZWN0aXZlIG9mIHRo
aXMgYmVpbmcgYSBnb29kIGNoYW5nZSwgSSd2ZSBoYWQgYW5vdGhlciB0aG91Z2h0Cj4gd2hpbGUg
cmVhZGluZyB0aGlzIHBhcmFncmFwaCwgZm9yIGEgaHlwZXJ2aXNvciBzaWRlIGNvbnRyb2w6IExp
bnV4Cj4gaGFzIGEgIm1lbW9wdD0iIGNvbW1hbmQgbGluZSBvcHRpb24gYWxsb3dpbmcgZmluZSBn
cmFpbmVkIGNvbnRyb2wKPiBvdmVyIHRoZSBFODIwIG1hcC4gV2UgY291bGQgaGF2ZSBzb21ldGhp
bmcgc2ltaWxhciB0byBhbGxvdwo+IGluc2VydGluZyBhbiBFODIwX1JFU0VSVkVEIHJlZ2lvbiBp
bnRvIGEgaG9sZSAoaXQgd291bGQgYmUgdGhlCj4gcmVzcG9uc2liaWxpdHkgb2YgdGhlIGFkbWlu
IHRvIGd1YXJhbnRlZSBubyBvdGhlciBjb25mbGljdHMsIGkuZS4KPiBpdCBzaG91bGQgZ2VuZXJh
bGx5IGJlIHVzZWQgb25seSBpZiBlLmcuIHRoZSBNQ0ZHIGlzIGluZGVlZCBrbm93bgo+IHRvIGxp
dmUgYXQgdGhlIHNwZWNpZmllZCBwbGFjZSwgYW5kIGJlaW5nIHByb3Blcmx5IHJlcHJlc2VudGVk
IGluCj4gdGhlIEFDUEkgdGFibGVzKS4gVGhvdWdodHM/CgpXaGF0IG90aGVyIHVzZSBjYXNlcyBj
YW4geW91IHRoaW5rIG9mIGluIGNhc2Ugd2UnZCBoYXZlIHRoaXMgb3B0aW9uPwpGcm9tIHRoZSB0
b3Agb2YgbXkgaGVhZCwgaXQgbWlnaHQgYmUgcHJvdmlkaW5nIGEgbWVtbWFwIGZvciBhIHNlY29u
ZCBYZW4KYWZ0ZXIgZG9pbmcga2V4ZWMgZnJvbSBYZW4gdG8gWGVuLgoKV2hhdCBiZW5lZml0cyBk
byB5b3UgdGhpbmsgaXQgbWlnaHQgaGF2ZSBvdmVyIGp1c3QgYWNjZXB0aW5nIGEgaG9sZQp1c2lu
ZyAibWNmZz1yZWxheGVkIiBvcHRpb24gZnJvbSBhZG1pbiBwZXJzcGVjdGl2ZT8KCklnb3IKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
