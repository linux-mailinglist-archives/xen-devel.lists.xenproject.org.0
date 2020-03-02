Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EF3175FB3
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 17:32:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8nvn-0007G3-Ka; Mon, 02 Mar 2020 16:28:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwXz=4T=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j8nvl-0007Fy-UL
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 16:28:33 +0000
X-Inumbo-ID: db48fbe0-5ca2-11ea-9faf-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db48fbe0-5ca2-11ea-9faf-12813bfff9fa;
 Mon, 02 Mar 2020 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583166512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XudM42i2nAvBYEKJ8nmOV91bohRKm8oMEg6A2iJbPFE=;
 b=dPlZGaG68xVntMB2E52tU1SQ71gDxqXuLZIANGA5+QI6+Gnz138LdOUe
 Lv2zjXpV7EfPo7BK4Xf9ZW8jEXWqcO7cp5EIqVQt3qnZVA4AsmQEIIaXx
 EshxLFMAmh5hR+bJmE30kuMFisDa6EECJLFY88+WMwIAaS31hFhVHt4sL k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: l3fwMNoF/7xlpZPIbru7JEgeZxGFcnP0blGU/kAg5aSdbScEXZRLLl8WjGPTn0BZ184v7Vfb1S
 PYK54PAfPZlv1tpVS+MCPAU7IVgfmHpiFHEZ09dLwFG74D8iH4Az8apJp8VsaVqGUa5CseBJg+
 x/EKlZ5rRUStif0RkQnlEnZrGVjfOXcKb9c2lQehydvAXkDyvRkltVP78mCk0OiBLUhtfwLlXs
 HlqDzYuD8dLvEvu/dPAgpbXOrggYxGbFu9hJmEcozb0s3n8gJfCfBRDnSG1P9ePJ+/dg6od6gi
 e4I=
X-SBRS: 2.7
X-MesageID: 13709556
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,507,1574139600"; d="scan'208";a="13709556"
Date: Mon, 2 Mar 2020 16:28:29 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: =?utf-8?B?UGF3ZcWC?= Marczewski <pawel@invisiblethingslab.com>
Message-ID: <20200302162829.GA1229@perard.uk.xensource.com>
References: <f9aa5afab28d3a8c9e581845030a0c971fa537a0.1583156916.git.pawel@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9aa5afab28d3a8c9e581845030a0c971fa537a0.1583156916.git.pawel@invisiblethingslab.com>
Subject: Re: [Xen-devel] [XEN PATCH v3] libxl: wait for console path before
 firing console_available
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMDI6NTQ6MDhQTSArMDEwMCwgUGF3ZcWCIE1hcmN6ZXdz
a2kgd3JvdGU6Cj4gQEAgLTExOTAsNiArMTE5MCwzMyBAQCBzdGF0aWMgdm9pZCBkb21jcmVhdGVf
Y29uc29sZV9hdmFpbGFibGUobGlieGxfX2VnYyAqZWdjLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZGNzLT5hb3BfY29uc29sZV9ob3cuZm9yX2V2ZW50KSk7Cj4g
IH0KPiAgCj4gK3N0YXRpYyB2b2lkIGNvbnNvbGVfeHN3YWl0X2NhbGxiYWNrKGxpYnhsX19lZ2Mg
KmVnYywgbGlieGxfX3hzd2FpdF9zdGF0ZSAqeHN3YSwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaW50IHJjLCBjb25zdCBjaGFyICpwKQoKVGhhdCBmdW5jdGlvbiBuZWVk
cyB0byBnbyBhZnRlciBkb21jcmVhdGVfYXR0YWNoX2RldmljZXMoKSAoYW5kIGJlZm9yZQpkb21j
cmVhdGVfY29tcGxldGUpIGluIHRoZSBzb3VyY2UgZmlsZS4gVGhlIGFyZ3VtZW50IGZvciB0aGF0
IGlzIGluIHRoZQpDT0RJTkdfU1RZTEUsIGluICJBU1lOQ0hST05PVVMvTE9ORy1SVU5OSU5HIE9Q
RVJBVElPTlMiIHNlY3Rpb24uCgo+ICt7Cj4gKyAgICBFR0NfR0M7Cj4gKyAgICBsaWJ4bF9fZG9t
YWluX2NyZWF0ZV9zdGF0ZSAqZGNzID0gQ09OVEFJTkVSX09GKHhzd2EsICpkY3MsIGNvbnNvbGVf
eHN3YWl0KTsKPiArICAgIGNoYXIgKmRvbXBhdGggPSBsaWJ4bF9feHNfZ2V0X2RvbXBhdGgoZ2Ms
IGRjcy0+Z3Vlc3RfZG9taWQpOwoKWW91IHByb2JhYmx5IHNob3VsZCBjaGVjayB0aGF0IGRvbXBh
dGggaXNuJ3QgTlVMTC4KbGlieGxfX3hzX2dldF9kb21wYXRoKCkgbWlnaHQgcmV0dXJuIGl0LgoK
PiArICAgIGNoYXIgKnR0eV9wYXRoID0gR0NTUFJJTlRGKCIlcy9jb25zb2xlL3R0eSIsIGRvbXBh
dGgpOwo+ICsgICAgY2hhciAqdHR5Owo+ICsKPiArICAgIGlmIChyYykgewo+ICsgICAgICAgIGlm
IChyYyA9PSBFUlJPUl9USU1FRE9VVCkKPiArICAgICAgICAgICAgTE9HKEVSUk9SLCAiJXM6IHRp
bWVkIG91dCIsIHhzd2EtPndoYXQpOwo+ICsgICAgICAgIGxpYnhsX194c3dhaXRfc3RvcChnYywg
eHN3YSk7Cj4gKyAgICAgICAgZG9tY3JlYXRlX2NvbXBsZXRlKGVnYywgZGNzLCByYyk7Cj4gKyAg
ICAgICAgcmV0dXJuOwo+ICsgICAgfQo+ICsKPiArICAgIHR0eSA9IGxpYnhsX194c19yZWFkKGdj
LCBYQlRfTlVMTCwgdHR5X3BhdGgpOwoKYHR0eV9wYXRoJyBzZWVtcyB0byBiZSB0aGUgc2FtZSB2
YWx1ZSBhcyBgY29uc29sZV94c3dhaXQucGF0aCcKKHhzd2EtPnBhdGggaGVyZSkgc2V0IGluIGRv
bWNyZWF0ZV9hdHRhY2hfZGV2aWNlcygpLiBJZiB0aGF0J3MgdGhlIGNhc2UsCnRoZXJlJ3Mgbm8g
bmVlZCB0byByZWFkIGl0IGFnYWluLCBgcCcgc2hvdWxkIGhhdmUgdGhlIHZhbHVlLgoKPiArCj4g
KyAgICBpZiAodHR5ICYmIHR0eVswXSAhPSAnXDAnKSB7Cj4gKyAgICAgICAgbGlieGxfX3hzd2Fp
dF9zdG9wKGdjLCB4c3dhKTsKPiArCj4gKyAgICAgICAgZG9tY3JlYXRlX2NvbnNvbGVfYXZhaWxh
YmxlKGVnYywgZGNzKTsKPiArICAgICAgICBkb21jcmVhdGVfY29tcGxldGUoZWdjLCBkY3MsIDAp
Owo+ICsgICAgfQoKQ291bGQgd2UgaGF2ZSBhIHNpbmdsZSBleGl0IHBhdGggb3V0IG9mIHRoaXMg
ZnVuY3Rpb24/CkkgdGhpbmsgdGhhdCB3b3VsZCBiZToKb3V0OgogICAgbGlieGxfX3hzd2FpdF9z
dG9wKCkKICAgIGRvbWNyZWF0ZV9jb21wbGV0ZShlZ2MsIGRjcywgcmMpOwoKcmMgbWlnaHQgYmUg
MCBvbiBzdWNjZXNzLgoKPiBAQCAtMTcyOCw5ICsxNzU1LDE4IEBAIHN0YXRpYyB2b2lkIGRvbWNy
ZWF0ZV9hdHRhY2hfZGV2aWNlcyhsaWJ4bF9fZWdjICplZ2MsCj4gICAgICAgICAgcmV0dXJuOwo+
ICAgICAgfQo+ICAKPiAtICAgIGRvbWNyZWF0ZV9jb25zb2xlX2F2YWlsYWJsZShlZ2MsIGRjcyk7
Cj4gLQo+IC0gICAgZG9tY3JlYXRlX2NvbXBsZXRlKGVnYywgZGNzLCAwKTsKPiArICAgIGRjcy0+
Y29uc29sZV94c3dhaXQuYW8gPSBhbzsKPiArICAgIGRjcy0+Y29uc29sZV94c3dhaXQud2hhdCA9
IEdDU1BSSU5URigiZG9tYWluICVkIGNvbnNvbGUgdHR5IiwgZG9taWQpOwo+ICsgICAgZGNzLT5j
b25zb2xlX3hzd2FpdC5wYXRoID0gR0NTUFJJTlRGKCIlcy9jb25zb2xlL3R0eSIsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX3hzX2dldF9kb21wYXRo
KGdjLCBkb21pZCkpOwoKU2hvdWxkbid0IHlvdSBjaGVjayB0aGF0IGxpYnhsX194c19nZXRfZG9t
cGF0aCgpIGFjdHVhbGx5IHJldHVybnMKc29tZXRoaW5nPyBUaGUgZnVuY3Rpb24gbWlnaHQgcmV0
dXJuIE5VTEwuCgpPciBldmVuIGJldHRlciwgaXQgc2VlbXMgdGhhdCB0aGVyZSdzIGEgZnVuY3Rp
b24gdGhhdCBnZW5lcmF0ZSB0aGF0IHBhdGgKZm9yIHlvdSwgY291bGQgeW91IGhhdmUgYSBsb29r
IGF0IGxpYnhsX19jb25zb2xlX3R0eV9wYXRoKCkgPyBJdCdzCnByb2JhYmx5IHdoYXQgd2UgbmVl
ZC4KCj4gQEAgLTE4NjEsNiArMTg5Nyw3IEBAIHN0YXRpYyBpbnQgZG9fZG9tYWluX2NyZWF0ZShs
aWJ4bF9jdHggKmN0eCwgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcsCj4gIAo+ICAgICAg
bGlieGxfX2FvX3Byb2dyZXNzX2dldGhvdygmY2Rjcy0+ZGNzLmFvcF9jb25zb2xlX2hvdywgYW9w
X2NvbnNvbGVfaG93KTsKPiAgICAgIGNkY3MtPmRvbWlkX291dCA9IGRvbWlkOwo+ICsgICAgbGli
eGxfX3hzd2FpdF9pbml0KCZjZGNzLT5kY3MuY29uc29sZV94c3dhaXQpOwoKSSB0aGluayB0aGlz
IGluaXRpYWxpc2F0aW9uIG5lZWRzIHRvIGdvIGluIGluaXRpYXRlX2RvbWFpbl9jcmVhdGUoKSwK
YmVjYXVzZSBjb25zb2xlX3hzd2FpdCBpcyBwcml2YXRlIHRvIGRvbWFpbl9jcmVhdGUgYW5kIHRo
YXQgc2VlbXMgdG8gYmUKdGhlIGZpcnN0IGZ1bmN0aW9uIHRoYXQgdXNlcyB0aGUgcHJpdmF0ZSBw
YXJ0cy4KCkFsc28sIGNvdWxkIHlvdSBjYWxsIGxpYnhsX194c3dhaXRfc3RvcCgpIGluIGRvbWNy
ZWF0ZV9jb21wbGV0ZSgpPwoKQWxzbywgbWF5YmUgdGhlIGNvbW1pdCBtZXNzYWdlIHNob3VsZCBt
ZW50aW9uIHRoYXQgaWYgdGhlIHBhdGggZG9lc24ndApiZWNvbWUgYXZhaWxhYmxlLCBkb21haW4g
Y3JlYXRpb24gZmFpbD8KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
