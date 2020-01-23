Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35283146D39
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:46:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iueeJ-0001lZ-QD; Thu, 23 Jan 2020 15:44:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AKOf=3M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iueeI-0001lT-Hz
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 15:44:02 +0000
X-Inumbo-ID: 282e941c-3df7-11ea-9fd7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 282e941c-3df7-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579794234;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9vcRiUSZ7BOdMotB5iA2IXP2L+HrTl9C+Oa5htaHj2E=;
 b=YiyCFiXdtDSIE5zwm9zuy8ZOHFdx9N+70qTWuivoiFsS+TbfIM9Xb/Fx
 28DPqoNPKEjWWDyqvXqwciPURB88MU76kaA+4lVz5u+CdsOmUUEFpnC6X
 GyC/ZwMGclCpgKKyUzIZ+4H2JiEEjMd96gEMnbWZnh49Ue03lwc7IqLJ8 0=;
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
IronPort-SDR: BIztIxzVN8GVMxAgJR1dVsXVBbbsikitfb5RGm9yhgUS+FR0sRHgD2sGTcv4t9eKYoRO5iCqLU
 Do0ODvL2Jb0fpPl8OP/QXvwCHhNpK6ZZdRMjXQ+Yh3Su3QKxn37+flFJe+sja0OHCVq04eNgPn
 fFs8q5UFdeZ8WkjVs2SjTgstaznglwS8FXD4Sym8t4DvCYP10tYXlQruAdA/NpdflxMcufBij/
 7T2SLLm3DlY35XF1zmM1SYoYAeD6hDQ/mjiImXIn/eprujLyOiCqHeVLL2r3Iw84x9QuliKDS9
 9BU=
X-SBRS: 2.7
X-MesageID: 11326417
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11326417"
Date: Thu, 23 Jan 2020 16:43:41 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200123154341.GD57924@desktop-tdan49n.eng.citrite.net>
References: <20200117150948.45014-1-roger.pau@citrix.com>
 <27d19d98-2209-8add-c66c-e06e51834172@suse.com>
 <20200117160822.GT11756@Air-de-Roger>
 <e65506b5-4795-201a-fb5c-a14acb0181ad@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e65506b5-4795-201a-fb5c-a14acb0181ad@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/apic: fix disabling LVT0 in
 disconnect_bsp_APIC
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTcsIDIwMjAgYXQgMDU6MjU6MTJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTcuMDEuMjAyMCAxNzowOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgSmFuIDE3LCAyMDIwIGF0IDA0OjU2OjAwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDE3LjAxLjIwMjAgMTY6MDksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
VGhlIEludGVsIFNETSBzdGF0ZXM6Cj4gPj4+Cj4gPj4+ICJXaGVuIGFuIGlsbGVnYWwgdmVjdG9y
IHZhbHVlICgwIHRvIDE1KSBpcyB3cml0dGVuIHRvIGEgTFZUIGVudHJ5IGFuZAo+ID4+PiB0aGUg
ZGVsaXZlcnkgbW9kZSBpcyBGaXhlZCAoYml0cyA4LTExIGVxdWFsIDApLCB0aGUgQVBJQyBtYXkg
c2lnbmFsIGFuCj4gPj4+IGlsbGVnYWwgdmVjdG9yIGVycm9yLCB3aXRob3V0IHJlZ2FyZCB0byB3
aGV0aGVyIHRoZSBtYXNrIGJpdCBpcyBzZXQgb3IKPiA+Pj4gd2hldGhlciBhbiBpbnRlcnJ1cHQg
aXMgYWN0dWFsbHkgc2VlbiBvbiB0aGUgaW5wdXQuIgo+ID4+Pgo+ID4+PiBBbmQgdGhhdCdzIGV4
YWN0bHkgd2hhdCdzIGN1cnJlbnRseSBkb25lIGluIGRpc2Nvbm5lY3RfYnNwX0FQSUMgd2hlbgo+
ID4+PiB2aXJ0X3dpcmVfc2V0dXAgaXMgdHJ1ZSBhbmQgTFZUIExJTlQwIGlzIGJlaW5nIG1hc2tl
ZC4gQnkgd3JpdGluZyBvbmx5Cj4gPj4+IEFQSUNfTFZUX01BU0tFRCBYZW4gaXMgYWN0dWFsbHkg
c2V0dGluZyB0aGUgdmVjdG9yIHRvIDAgYW5kIHRoZQo+ID4+PiBkZWxpdmVyeSBtb2RlIHRvIEZp
eGVkICgwKSwgYW5kIGhlbmNlIGl0IHRyaWdnZXJzIGFuIEFQSUMgZXJyb3IgZXZlbgo+ID4+PiB3
aGVuIHRoZSBMVlQgZW50cnkgaXMgbWFza2VkLgo+ID4+Cj4gPj4gQnV0IHRoZXJlIGFyZSBtYW55
IG1vcmUgaW5zdGFuY2VzIHdoZXJlIHdlIChoYXZlIGEgcmlzayB0bykgZG8gc28sCj4gPj4gbW9z
dCBub3RhYmx5IGluIGNsZWFyX2xvY2FsX0FQSUMoKS4gVGhlIHR3byBzdGVwIGxvZ2ljIHRoZXJl
IGlzCj4gPj4gYW55d2F5IHNvbWV3aGF0IGluIGNvbmZsaWN0IHdpdGggdGhlIGNpdGF0aW9uIGFi
b3ZlLgo+ID4gCj4gPiBjbGVhcl9sb2NhbF9BUElDIG1hc2tzIHRoZSBlcnJvciB2ZWN0b3IgYmVm
b3JlIGRvaW5nIGFueSB3cml0ZSwgYW5kCj4gPiBjbGVhcnMgRVNSIGFmdGVyd2FyZHMsIHRoZXJl
J3MgYSBjb21tZW50IGF0IHRoZSB0b3A6Cj4gPiAKPiA+ICJNYXNraW5nIGFuIExWVCBlbnRyeSBv
biBhIFA2IGNhbiB0cmlnZ2VyIGEgbG9jYWwgQVBJQyBlcnJvcgo+ID4gaWYgdGhlIHZlY3RvciBp
cyB6ZXJvLiBNYXNrIExWVEVSUiBmaXJzdCB0byBwcmV2ZW50IHRoaXMuIgo+ID4gCj4gPiBXZSBj
b3VsZCBkbyB0aGUgc2FtZSAoaWU6IG1hc2sgTFZURVJSIGZpcnN0IGFuZCBjbGVhciBFU1IgYWZ0
ZXJ3YXJkcykKPiA+IGlmIHRoYXQgc2VlbXMgcHJlZmVyYWJsZS4gVGhlcmUncyBhIG1heGx2dCBj
aGVjayBpbiBjbGVhcl9sb2NhbF9BUElDLAo+ID4gYnV0IHRoZSBzZG0gZG9lc24ndCBzcGVjaWZ5
IGFueXdheSB0byBjaGVjayBpZiB0aGUgbGFwaWMgd2lsbCBhY2NlcHQgYQo+ID4gbWFza2VkIHZl
Y3RvciAwIHdyaXRlIG9yIG5vdCwgc28gbm90IHN1cmUgd2hldGhlciB3ZSBzaG91bGQgcmVwbGlj
YXRlCj4gPiB0aGF0IGNoZWNrIG9yIGp1c3QgZG8gaXQgdW5jb25kaXRpb25hbGx5IG9uIGJvdGgg
ZGlzY29ubmVjdF9ic3BfQVBJQwo+ID4gYW5kIGNsZWFyX2xvY2FsX0FQSUMuCj4gCj4gSSB0aGlu
ayBkb2luZyBpdCB0aGUgbW9zdCBjYXJlZnVsIHdheSBpcyBnb2luZyB0byBiZSBiZXN0LiBJIGZp
bmQgaXQKPiBzdXJwcmlzaW5nIGFueXdheSB0aGF0IGRpc2Nvbm5lY3RfYnNwX0FQSUMoKSBkb2Vz
bid0IHdyaXRlIExWVEVSUgo+IChvciBvdGhlciBMVlRzIGV4Y2VwdCBmb3IgTFZUMSkgYXQgYWxs
LiBUaGUgZnVuY3Rpb24gbG9va3MgdG8gaGF2ZSBhCj4gZ29hbCBvZiBwdXR0aW5nIHRoZSBBUElD
IGJhY2sgaW50byB0aGUgc3RhdGUgdGhhdCB3ZSBmb3VuZCBpdCB3aGVuCj4gYm9vdGluZy4KCk1h
eWJlIGl0IHdvdWxkIGJlIGJldHRlciB0byBqdXN0IGNhbGwgY2xlYXJfbG9jYWxfQVBJQyBiZWZv
cmUgdHJ5aW5nCnRvIGNvbmZpZ3VyZSBMVlR7MC8xfSwgd2hpY2ggd2lsbCBsZWF2ZSBMVlQwIGlu
IGEgcmVzZXQgc3RhdGUgYW5kIHRodXMKbm8gd3JpdGUgd291bGQgYmUgcmVxdWlyZWQgaW4gdGhl
ICF2aXJ0X3dpcmVfc2V0dXAgY2FzZT8KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
