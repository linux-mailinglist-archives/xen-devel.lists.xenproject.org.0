Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92970159632
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 18:32:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1ZLX-0001V2-5o; Tue, 11 Feb 2020 17:29:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0zdE=37=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j1ZLW-0001Ux-FB
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 17:29:14 +0000
X-Inumbo-ID: 050edee0-4cf4-11ea-b5f5-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 050edee0-4cf4-11ea-b5f5-12813bfff9fa;
 Tue, 11 Feb 2020 17:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581442153;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=261e7jDGbtOJOQS/OByVWKrUo2tWD9jtZADE5iTqgs4=;
 b=ga4qIR4oYMaVpcqT9BVDk2CLiTKnlW0RjDHldo2jlOeSDsihvmJQiwlT
 X+ffTRqQVahM3vV7rsc48+SywmZ6K7+4hBWHKXs4RyCtd8DXGt/AmJwJi
 Ut4DLrD1CWbX3QnpxK8MUQjZ11AgEZuKE8l/7S0vk+Ikww16OHpOCQk/A w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nwHLqYWPUWOGnB1NPaDwIxxgCsW+jBPFhk0DFDrAagCWsiaaiwAHwzsE0Pe2QEDVNSUudIbIvq
 1cqojBDxevmnhMYC6fvI3Ibb3tVa0vvle67kNXUPRnesKCjdQu+AQMULzoGTvKSES8LvDLDGDf
 1KKPqsfUJgdnLJJkvbBctqHdNG1DDzWY4K8+KlwFFsycYbxoFdmAQzMdPwAewFS8Kw0uMacwzx
 OhLFW1WDJHEX/01HO3hWlYsi3MqEeDQhE4hKijs5W7mvawxoVAW211P03TPoNrLuP/4FOtZBCC
 n6A=
X-SBRS: 2.7
X-MesageID: 12718891
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12718891"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2b7826d9-8822-97c8-0637-03bcb98d6418@citrix.com>
 <20200211160149.GL4679@Air-de-Roger>
 <7edfe77a-183b-8927-ffe7-d0ba2bd939e2@citrix.com>
 <20200211164215.GN4679@Air-de-Roger>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <975f1878-aab4-caa1-6c2e-67cf3cf70ade@citrix.com>
Date: Tue, 11 Feb 2020 17:29:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200211164215.GN4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] PV Shim ballooning
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMDIvMjAyMCAxNjo0MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEZl
YiAxMSwgMjAyMCBhdCAwNDoyOTozNlBNICswMDAwLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4g
QWdyZWUuIEJ1dCBhcyBJIHNhaWQgSSdtIG5vdCBhd2FyZSBvZiBhbnkgZ3Vlc3QgdGhhdCB2aW9s
YXRlcyB0aGUKPj4gaW52YXJpYW50IG9mIGRlY3JlYXNlX3Jlc2VydmF0aW9uKCkgYmVpbmcgdGhl
IGxhc3QgY2FsbC4KPiAKPiBNYXliZSB3ZSBjb3VsZCBwaWdneWJhY2sgb24gd2hldGhlciBhIHBh
Z2UgaXMgcmVtb3ZlZCBmcm9tIHRoZSBkb21haW4KPiBkb21oZWFwIGFuZCB1c2UgdGhhdCBhcyBh
IHNpZ25hbCB0aGF0IHRoZSBwYWdlIHNob3VsZCBiZSBiYWxsb29uZWQKPiBvdXQ/Cj4gCj4gVGhl
cmUncyBhbHJlYWR5IGFuIGFyY2hfZnJlZV9oZWFwX3BhZ2UgdGhhdCdzIGNhbGxlZCB3aGVuIGEg
cGFnZSBpcwo+IHJlbW92ZWQgZnJvbSBhIGRvbWFpbiwgd2hpY2ggbWlnaHQgYmUgc3VpdGFibGUg
Zm9yIHRoaXMuIEl0IHdvdWxkCj4gaG93ZXZlciBpbXBseSBtYWtpbmcgYW4gaHlwZXJjYWxsIGZv
ciBldmVyeSBwYWdlIHRvIGJlIGJhbGxvb25lZCBvdXQuCgpJIHRlc3RlZCB0aGF0IC0gZG9lc24n
dCB3b3JrIC0gdG9vIG1hbnkgaHlwZXJjYWxscyBtYWtlIGJhbGxvb25pbmcgdGFrZQphZ2VzLiBU
aGlzIHNpbXBseSBjYW5ub3QgYmUgZG9uZSBvbiBwYWdlLWJ5LXBhZ2UgYmFzaXMuCgpJZ29yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
