Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68BD13D6FC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 10:38:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is1XZ-0006VU-2k; Thu, 16 Jan 2020 09:34:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=342x=3F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1is1XX-0006Uk-69
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 09:34:11 +0000
X-Inumbo-ID: 56d2245a-3843-11ea-86d2-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56d2245a-3843-11ea-86d2-12813bfff9fa;
 Thu, 16 Jan 2020 09:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579167246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rBjAWUYtmHV/LUuzrSwdr6650H1AhwRsE7bysI6moSk=;
 b=JF6sLxjWUDRaaDOqxgXyZV7MdPJbEwYB5kPX8SiyGBYy7tmYXgvM8mIv
 bqLgW0NjKNFRADRgSp6ZeSD4P7wwht0+JZ7TOyxHS918kSa9zrSlKDqXD
 zrICFUpOrNt47PiM9Q48TtASm8DIkC4+CweGudS0zETMkjWmTcm9lOKcZ k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ojnljDsyzIvCLN/UbGV2SFrQSzdOv5nJ2+iJKFAkE2Rw3f0izC/r52g/GTfAFpkilmz4J0FqI8
 KQkK+9pIE5sDKF6vYqSUPZ4XZL74C/wfE9U2HWUzINq3s8UunUTWvibqD1GA4xWekg4+OiIa0a
 KAm4AYihEul2Ou5aG7vOYEyBWjb9YBFGPU7Jpac/HTKhdptRfwB7F8zxCd7Il7BDSrMauEVw+5
 hvVOzUbENR+22nfNAgMSXVXKgMgDOpbqajwZWG+BlMIwyMIM2Mv+to45ML0hIZaPELx2TwEyE8
 OV8=
X-SBRS: 2.7
X-MesageID: 11425477
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,325,1574139600"; d="scan'208";a="11425477"
Date: Thu, 16 Jan 2020 10:33:54 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200116093354.GP11756@Air-de-Roger>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
 <f9b7c06e-54df-bfb2-44d5-b3ef38f2a725@suse.com>
 <20200115115338.GL11756@Air-de-Roger>
 <c13cbf1e-2e1d-dc17-ec90-a1098a11ec58@suse.com>
 <20200115134408.GN11756@Air-de-Roger>
 <e7f91928-6013-75fc-d7ec-0a70654f4b64@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7f91928-6013-75fc-d7ec-0a70654f4b64@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, andrew.cooper3@citrix.com,
 wl@xen.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMTUsIDIwMjAgYXQgMDU6MjE6MTZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTUuMDEuMjAyMCAxNDo0NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFdlZCwgSmFuIDE1LCAyMDIwIGF0IDAxOjQ5OjIyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IFdoYXQgSSdtIHRoZW4gd29ycmllZCBhYm91dCBpcyB0b28KPiA+PiBsaXR0bGUgcHJv
Z3Jlc3Mgb2JzZXJ2YWJsZSBieSBndWVzdHMuIFRoZSBQViB0aW1lIHByb3RvY29sCj4gPj4gb3Vn
aHQgdG8gYmUgZmluZSBpbiB0aGlzIHJlZ2FyZCAoYW5kIGNvbnN1bWVycyBvZiByYXcgVFNDIHZh
bHVlcwo+ID4+IGFyZSBvbiB0aGVpciBvd24gYW55d2F5KSwgYnV0IHdvdWxkbid0IHlvdSBuZWVk
IHRvIHVwZGF0ZSBUU0MKPiA+PiBvZmZzZXRzIG9mIEhWTSBndWVzdHMgaW4gb3JkZXIgdG8gY29t
cGVuc2F0ZSBmb3IgdGhlIGVsYXBzZWQKPiA+PiB0aW1lPwo+ID4gCj4gPiBUaGF0IHdpbGwgYmUg
ZG9uZSB3aGVuIHRoZSBIVk0gdkNQVSBnZXRzIHNjaGVkdWxlZCBpbiBhcyBwYXJ0IG9mIHRoZQo+
ID4gdXBkYXRlX3ZjcHVfc3lzdGVtX3RpbWUgY2FsbCBBRkFJQ1QuIGNzdGF0ZV9yZXN0b3JlX3Rz
YyB3aWxsIGFsd2F5cyBiZQo+ID4gY2FsbGVkIHdpdGggdGhlIGlkbGUgdkNQVSBjb250ZXh0LCBh
bmQgaGVuY2UgdGhlcmUncyBhbHdheXMgZ29pbmcgdG8KPiA+IGJlIGEgdkNQVSBzd2l0Y2ggYmVm
b3JlIHNjaGVkdWxpbmcgYW55dGhpbmcgZWxzZS4KPiAKPiBXaGljaCBzdGVwIHdvdWxkIHRoaXMg
YmU/IEFsbCBJIHNlZSBpcyBhIGNhbGwgdG8gaHZtX3NjYWxlX3RzYygpLgo+IEluIHRpbWUuYyBv
bmx5IHRzY19zZXRfaW5mbygpIGNhbGxzIGh2bV9zZXRfdHNjX29mZnNldCgpLgoKTXkgYmFkLCBJ
J3ZlIG1pc3Rha2VuIHRoZSBzY2FsaW5nIHdpdGggdGhlIG9mZnNldC4KCkFjY291bnRpbmcgZm9y
IHRoZSBvZmZzZXQgaW4gdXBkYXRlX3ZjcHVfc3lzdGVtX3RpbWUgc2VlbXMgcXVpdGUKbW9yZSBj
b21wbGljYXRlZCB0aGF0IGp1c3QgdXBkYXRpbmcgdGhlIFRTQyBoZXJlLCBzbzoKClJldmlld2Vk
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkkgYWxzbyB3b25k
ZXIgd2hldGhlciBpdCB3b3VsZCBiZSBpbnRlcmVzdGluZyB0byBhZGQgYXQgbGVhc3QgYW4KYXNz
ZXJ0IHRvIGdldF9zX3RpbWVfZml4ZWQgaW4gb3JkZXIgdG8gYXNzdXJlIHRoYXQgdGhlIFRTQyBz
dGFtcCBpcwphbHdheXMgYmVoaW5kIHRoZSBjdXJyZW50IFRTQyB2YWx1ZSwgdGhpcyB3b3VsZCBo
YXZlIGxpa2VseSBoZWxwZWQKY2F0Y2ggdGhpcyBpc3N1ZSBlYXJsaWVyLgoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
