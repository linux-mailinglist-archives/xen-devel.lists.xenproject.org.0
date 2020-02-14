Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05F315EDEB
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 18:37:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2erB-0002Mw-FF; Fri, 14 Feb 2020 17:34:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mp4I=4C=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j2erA-0002Mq-7w
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 17:34:24 +0000
X-Inumbo-ID: 3cf0349a-4f50-11ea-bad6-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cf0349a-4f50-11ea-bad6-12813bfff9fa;
 Fri, 14 Feb 2020 17:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581701663;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=D+PVQwAHQ97IAg8gCYlRJRU7FD2+/H/Dj4JAJA4Y5Ew=;
 b=IBQ2nQNlMTDI5fu6ATOAI6srjBb3OKUfwpi4tD3Woh/Dt11K/lEKYQGe
 T9i4UST7cd6Qk43AOvtzh9E4kKUgAm0S25Kz+11j7RnJ+K7IukYib8feo
 DGt0UhaSZPSyUpGfYCiYlpSl1uyPepRvGQsJhYFEAt1EI4J0AOoasMhAW 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: el30GpjSg7pCBWbmP0tVSve/I7oxdV52GAXE1Vlm9TvSFuPn0f83D2J2+JKIJ8NQLR9xQdjY0V
 4iKqvn8qoNMTGcaEF7wi8fsY1WcGnh1+/woBTfI0x84CdM9uFoDT8O/W9hBE2ZTA2z/E/7+kqp
 0GdvXceXulsH1pKtG+FnfwP7J1Zs8Abt9YHxcDepn8iFlglcUVVy6LWh6MB0bNe+unCmcd0ATv
 Je3hrlCHOKz8WZrcAU9IMOCRzBEMl5KmcmC746td1a0p6n6phk0E03BA1kRdwN2G1CbsnZpoBw
 VhY=
X-SBRS: 2.7
X-MesageID: 12472934
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,441,1574139600"; d="scan'208";a="12472934"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20200211093527.6811-1-jgross@suse.com>
 <40df666d-246a-656a-94e5-00a85b9280fc@citrix.com>
 <f7397b04-80f2-1e2a-0899-427570f8f878@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <74d0b36a-4d80-39e1-aaf2-cf5209781e1e@citrix.com>
Date: Fri, 14 Feb 2020 17:34:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f7397b04-80f2-1e2a-0899-427570f8f878@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: make sure stop_machine_run() is always
 called in a tasklet
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQvMDIvMjAyMCAxNjozOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxNC4wMi4yMCAx
NTowNiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDExLzAyLzIwMjAgMDk6MzUsIEp1ZXJn
ZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBXaXRoIGNvcmUgc2NoZWR1bGluZyBhY3RpdmUgaXQgaXMgbWFu
ZGF0b3J5IGZvciBzdG9wX21hY2hpbmVfcnVuKCkgdG8KPj4+IGJlIGNhbGxlZCBpbiBhIHRhc2ts
ZXQgb25seSwgYXMgb3RoZXJ3aXNlIGEgc2NoZWR1bGluZyBkZWFkbG9jayB3b3VsZAo+Pj4gb2Nj
dXI6IHN0b3BfbWFjaGluZV9ydW4oKSBkb2VzIGEgY3B1IHJlbmRlenZvdXMgYnkgYWN0aXZhdGlu
ZyBhIHRhc2tsZXQKPj4+IG9uIGFsbCBvdGhlciBjcHVzLiBJbiBjYXNlIHN0b3BfbWFjaGluZV9y
dW4oKSB3YXMgbm90IGNhbGxlZCBpbiBhbiBpZGxlCj4+PiB2Y3B1IGl0IHdvdWxkIGJsb2NrIHNj
aGVkdWxpbmcgdGhlIGlkbGUgdmNwdSBvbiBpdHMgc2libGluZ3Mgd2l0aCBjb3JlCj4+PiBzY2hl
ZHVsaW5nIGJlaW5nIGFjdGl2ZSwgcmVzdWx0aW5nIGluIGEgaGFuZy4KPj4KPj4gSSBzdXBwb3Nl
IHJjdV9iYXJyaWVyKCkgaXMgZmluZSBkdWUgdG8gcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCkg
YmVpbmcKPj4gY2FsbGVkIGluc2lkZT8gSSdtIGEgbGl0dGxlIGNvbmNlcm5lZCBieSBpbXBvc2lu
ZyBpc192Y3B1X2lkbGUoKSByZXN0cmljdGlvbgo+PiBpbiB0aGF0IGNhc2UgYXMgcmN1X2JhcnJp
ZXIoKSBjb3VsZCBiZSB0ZWNobmljYWxseSBjYWxsZWQgZnJvbSBhIG5vbi10YXNrbGV0Cj4+IGNv
bnRleHQuCj4gCj4gTm8sIHN0b3BfbWFjaGluZV9ydW4oKSB3aXRoIGNvcmUgc2NoZWR1bGluZyBh
Y3RpdmUgY2FuIG9ubHkgd29yayB3aGVuCj4gY2FsbGVkIGluIGFuIGlkbGUgdmNwdS4KPiAKPiBP
VE9IIGl0IHdvdWxkIGJlIGZhaXJseSBlYXN5IHRvIGFkZCBhbm90aGVyIHNvZnRpcnEgZm9yIGEg
c2ltaWxhcgo+IHB1cnBvc2UgYW5kIGhhdmUgYSBzeW5jX21hY2hpbmVfcnVuKCkgdXNpbmcgdGhh
dCBpbnN0ZWFkIG9mIHRhc2tsZXRzLgo+IFRoaXMgY291bGQgYmUgdXNlZCBmb3IgdWNvZGUgbG9h
ZGluZywgdG9vLgo+IAo+IHN0b3BfbWFjaGluZV9ydW4oKSBhbmQgc3luY19tYWNoaW5lX3J1bigp
IGNvdWxkIHVzZSBhIGNvbW1vbiBtYWluCj4gZnVuY3Rpb24uIFRoZSBwYXRjaCBzaG91bGQgYmUg
cmF0aGVyIHNpbXBsZS4KPiAKPiBUaG91Z2h0cz8KCkkgaGF2ZSBhIHBhdGNoIG9uIHRoZSBsaXN0
ICh3aGljaCBJIHdhcyBwbGFubmluZyB0byBzZW5kIGEgdjIgZm9yKSB0aGF0CmZpeGVzIGFub3Ro
ZXIgaXNzdWUgd2l0aCByY3VfYmFycmllcigpOgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjAtMDEvbXNnMDIyNzMuaHRtbAoKQXMgSSB1bmRl
cnN0YW5kIGl0IG5vdyB0aGF0IHdvdWxkbid0IHdvcmsgd2l0aCBjb3JlLXNjaGVkdWxpbmcuIERv
IHlvdSB0aGluawppdCdzIHBvc3NpYmxlIHRvIHN5bmNocm9ub3VzbHkgd2FpdCBmb3IgdGFza2xl
dHMgdG8gZmluaXNoIGluIG5vbi10YXNrbGV0CmNvbnRleHQgKGJlY2F1c2UgdGhhdCdzIHdoYXQg
dGhlIHB1cnBvc2Ugb2YgcmN1X2JhcnJpZXIoKSBpcyk/CgpJZ29yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
