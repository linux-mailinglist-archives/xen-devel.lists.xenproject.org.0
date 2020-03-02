Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C03175D09
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 15:29:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8m1l-00057y-MY; Mon, 02 Mar 2020 14:26:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xgCB=4T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j8m1j-00057t-Rb
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 14:26:35 +0000
X-Inumbo-ID: d1a85772-5c91-11ea-9f84-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1a85772-5c91-11ea-9f84-12813bfff9fa;
 Mon, 02 Mar 2020 14:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583159194;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=p6N1XWAdUC+dBMlVj+Lj2G9AMXC1CNBl1XshwHBnJdw=;
 b=RXdSsSHfCqnmP7alwm5S43uQBA6k/zh4gYHL2FBttG6rNlwflldAVaoh
 1PeA/zy1ZFYS8nuyyYrLEpNf5npys91XHlxE4wO+LoVh5B7ob7JMrjH5s
 pXE7R+TxcAbUYR/oPVHSjrrHsWVcJXuKICoUGZCY/vvvFzuzYW4hPqaB2 E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Z9yQ4qPCIF3Vif2Rwuc02FpY7aQlnNdDI7KBxWUohN9FKO/KHI7vqWTxismqEzJnhUdReKqsaQ
 dN89hVe7Ae9Z/dfXzYjcTghhaIPnakvg7jtcRbqP1d4hHkI/3AeJeAT/g6b63xO+xL3xQzLW/B
 lg4G4efmfctwcRLoY4meL1gvWSXl7El5rmD1acGGwwwvB+IbOQu9w5qNIyP8dJZA4YG5I2KGpO
 u/iGBJjYzVO2pwiHCr+C3+LxVuZyx7wEk1pnuJ5t0Q0NfD7dJbRwZjycOxD/o4mJLDC1l2P5gP
 T7g=
X-SBRS: 2.7
X-MesageID: 13700095
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,507,1574139600"; d="scan'208";a="13700095"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <9687cc05-d3f5-c139-bbc4-a3eb05afdbea@suse.com>
 <adaffda1-006b-4e84-62e0-a679adece844@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <dc057115-4ad9-acca-4085-38b8a4a47fac@citrix.com>
Date: Mon, 2 Mar 2020 14:26:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <adaffda1-006b-4e84-62e0-a679adece844@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/mce: fix logic and comments around
 MSR_PPIN_CTL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMDMvMjAyMCAxNDowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRnJvbTogVG9ueSBMdWNr
IDx0b255Lmx1Y2tAaW50ZWwuY29tPgo+Cj4gVGhlcmUgYXJlIHR3byBpbXBsZW1lbnRlZCBiaXRz
IGluIHRoZSBQUElOX0NUTCBNU1I6Cj4KPiBCaXQwOiBMb2NrT3V0IChSL1dPKQo+ICAgICAgIFNl
dCAxIHRvIHByZXZlbnQgZnVydGhlciB3cml0ZXMgdG8gTVNSX1BQSU5fQ1RMLgo+Cj4gQml0IDE6
IEVuYWJsZV9QUElOIChSL1cpCj4gICAgICAgIElmIDEsIGVuYWJsZXMgTVNSX1BQSU4gdG8gYmUg
YWNjZXNzaWJsZSB1c2luZyBSRE1TUi4KPiAgICAgICAgSWYgMCwgYW4gYXR0ZW1wdCB0byByZWFk
IE1TUl9QUElOIHdpbGwgY2F1c2UgI0dQLgo+Cj4gU28gdGhlcmUgYXJlIGZvdXIgZGVmaW5lZCB2
YWx1ZXM6Cj4gCTA6IFBQSU4gaXMgZGlzYWJsZWQsIFBQSU5fQ1RMIG1heSBiZSB1cGRhdGVkCj4g
CTE6IFBQSU4gaXMgZGlzYWJsZWQuIFBQSU5fQ1RMIGlzIGxvY2tlZCBhZ2FpbnN0IHVwZGF0ZXMK
PiAJMjogUFBJTiBpcyBlbmFibGVkLiBQUElOX0NUTCBtYXkgYmUgdXBkYXRlZAo+IAkzOiBQUElO
IGlzIGVuYWJsZWQuIFBQSU5fQ1RMIGlzIGxvY2tlZCBhZ2FpbnN0IHVwZGF0ZXMKPgo+IENvZGUg
d291bGQgb25seSBlbmFibGUgdGhlIFg4Nl9GRUFUVVJFX0lOVEVMX1BQSU4gZmVhdHVyZSBmb3Ig
Y2FzZSAiMiIuCj4gV2hlbiBpdCBzaG91bGQgaGF2ZSBkb25lIHNvIGZvciBib3RoIGNhc2UgIjIi
IGFuZCBjYXNlICIzIi4KPgo+IEZpeCB0aGUgZmluYWwgdGVzdCB0byBqdXN0IGNoZWNrIGZvciB0
aGUgZW5hYmxlIGJpdC4KPiBBbHNvIGZpeCBzb21lIG9mIHRoZSBvdGhlciBjb21tZW50cyBpbiB0
aGlzIGZ1bmN0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogVG9ueSBMdWNrIDx0b255Lmx1Y2tAaW50
ZWwuY29tPgo+IFtMaW51eCBjb21taXQgPz8/XQo+Cj4gT25lIG9mIHRoZSBhZGp1c3RlZCBjb21t
ZW50cyBkb2Vzbid0IGV4aXN0IGluIG91ciBjb2RlLCBhbmQgSSBkaXNhZ3JlZQo+IHdpdGggdGhl
IGFkanVzdG1lbnQgdG8gdGhlIG90aGVyIG9uZSBhbmQgaXRzIGFzc29jaWF0ZSBjb2RlIGNoYW5n
ZTogSQo+IGRvbid0IHRoaW5rIHRoZXJlJ3MgYSBwb2ludCB0cnlpbmcgdG8gZW5hYmxlIFBQSU4g
aWYgdGhlIGxvY2tlZCBiaXQgaXMKPiBzZXQuIEhlbmNlIGl0J3MganVzdCB0aGUgbWFpbiBjb2Rl
IGNoYW5nZSB0aGF0IGdldHMgcHVsbGVkIGluLCBwbHVzIGl0Cj4gZ2V0cyBjbG9uZWQgdG8gdGhl
IEFNRCBzaWRlLgo+Cj4gUmVxdWVzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCkkgYWdyZWUuwqAgSWYgaXQgaXMgbG9ja2VkLCB0aGVyZSBpcyBubyBwb2ludCB0cnlp
bmcgdG8gY2hhbmdlIGl0LgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
