Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B92914EC4E
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 13:11:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixV5b-0004S5-Ug; Fri, 31 Jan 2020 12:07:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GVgc=3U=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ixV5a-0004S0-9y
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 12:07:58 +0000
X-Inumbo-ID: 516e657e-4422-11ea-8bb9-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 516e657e-4422-11ea-8bb9-12813bfff9fa;
 Fri, 31 Jan 2020 12:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580472477;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xKvpTw15OJNWuxxFHzXD9Ez9rf0VmqHw/VGzZ6UxG1Q=;
 b=azoZpQSpMHiUhPyQntYgogcsBwmNfr+fn7KenyBRVJifKOv0EAeM7kBz
 AnMAAP8vsB5vtv/CEiW7Eyf+GK2laf8DaoJ2ANcWckGVTWkvFlP0GBLRz
 4kDCvtcteT/KYK2E6nbimWiWRXOIXAl/4AT6Xlrv5dITleVFo7S7uNuHh Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: spSiTMATy/Omc2uII9G036aZuKUQ6a7GssLR5U0SdDMrOsdzih63dmjKs89t73ajKIUPbxZWWU
 5+riItLUz3K0lgogHW4/YU4EnDoBL4ZFrn/nRanqJvO5yXWBxUThh5EDWHzclsuQi4fS7rRVyg
 o7OMpk8bme2Ftqe/xqY4tP2lvUFbFMlgGKPnSVgGKJvcGWWpldwdjrWcofPgoQlJvrgZE9R6VA
 BxsfWj8e6xWfAguK40J4YnxdWIBSv3+7c34zz6SU/Iy1DX7+pUo0T6AfVVe7pFv40fjhZePjhT
 Ku8=
X-SBRS: 2.7
X-MesageID: 12105941
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,385,1574139600"; d="scan'208";a="12105941"
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-2-pdurrant@amazon.com>
 <20200122145248.GB57924@desktop-tdan49n.eng.citrite.net>
 <61e9f341fc1b48beaa6266bb90ff2701@EX13D32EUC003.ant.amazon.com>
 <20200131110603.GS4679@Air-de-Roger>
 <53287f7ea7984575b91ab388cfe0bee8@EX13D32EUC003.ant.amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <338fb252-42b9-5491-786b-d8b19fe7829b@citrix.com>
Date: Fri, 31 Jan 2020 12:07:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <53287f7ea7984575b91ab388cfe0bee8@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 1/7] libxl: add definition of
 INVALID_DOMID to the API
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMDEvMjAyMCAxMToxMCwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4+IFNlbnQ6IDMxIEphbnVhcnkgMjAyMCAxMTowNgo+PiBUbzogRHVycmFudCwgUGF1
bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+PiBDYzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+OyB4ZW4tCj4+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IFdlaQo+PiBMaXUgPHdsQHhl
bi5vcmc+Cj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjQgMS83XSBsaWJ4bDog
YWRkIGRlZmluaXRpb24gb2YKPj4gSU5WQUxJRF9ET01JRCB0byB0aGUgQVBJCj4+Cj4+IE9uIEZy
aSwgSmFuIDMxLCAyMDIwIGF0IDEwOjMxOjQ5QU0gKzAwMDAsIER1cnJhbnQsIFBhdWwgd3JvdGU6
Cj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9tOiBYZW4tZGV2ZWwgPHhl
bi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YKPj4+PiBS
b2dlciBQYXUgTW9ubsOpCj4+Pj4gU2VudDogMjIgSmFudWFyeSAyMDIwIDE0OjUzCj4+Pj4gVG86
IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4KPj4+PiBDYzogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyB4ZW4tCj4+Pj4gZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsK
Pj4gV2VpCj4+Pj4gTGl1IDx3bEB4ZW4ub3JnPgo+Pj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVs
XSBbUEFUQ0ggdjQgMS83XSBsaWJ4bDogYWRkIGRlZmluaXRpb24gb2YKPj4+PiBJTlZBTElEX0RP
TUlEIHRvIHRoZSBBUEkKPj4+Pgo+Pj4+IE9uIFdlZCwgSmFuIDIyLCAyMDIwIGF0IDAyOjQ0OjQw
UE0gKzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+Pj4gQ3VycmVudGx5IGJvdGggeGwgYW5k
IGxpYnhsIGhhdmUgaW50ZXJuYWwgZGVmaW5pdGlvbnMgb2YKPj4gSU5WQUxJRF9ET01JRAo+Pj4+
PiB3aGljaCBoYXBwZW4gdG8gYmUgaWRlbnRpY2FsLiBIb3dldmVyLCBmb3IgdGhlIHB1cnBvc2Vz
IG9mCj4+IGRlc2NyaWJpbmcKPj4+PiB0aGUKPj4+Pj4gYmVoYXZpb3VyIG9mIGxpYnhsX2RvbWFp
bl9jcmVhdGVfbmV3L3Jlc3RvcmUoKSBpdCBpcyB1c2VmdWwgdG8gaGF2ZQo+PiBhCj4+Pj4+IHNw
ZWNpZmllZCBpbnZhbGlkIHZhbHVlIGZvciBhIGRvbWFpbiBpZC4KPj4+Pj4KPj4+Pj4gVGhpcyBw
YXRjaCB0aGVyZWZvcmUgbW92ZXMgdGhlIGxpYnhsIGRlZmluaXRpb24gZnJvbQo+PiBsaWJ4bF9p
bnRlcm5hbC5oIHRvCj4+Pj4+IGxpYnhsLmggYW5kIHJlbW92ZXMgdGhlIGludGVybmFsIGRlZmlu
aXRpb24gZnJvbSB4bF91dGlscy5oLiBUaGUKPj4+PiBoYXJkY29kZWQKPj4+Pj4gJy0xJyBwYXNz
ZWQgYmFjayB2aWEgZG9tY3JlYXRlX2NvbXBsZXRlKCkgaXMgdGhlbiB1cGRhdGVkIHRvCj4+Pj4g
SU5WQUxJRF9ET01JRAo+Pj4+PiBhbmQgY29tbWVudCBhYm92ZSBsaWJ4bF9kb21haW5fY3JlYXRl
X25ldy9yZXN0b3JlKCkgaXMgYWNjb3JkaW5nbHkKPj4+Pj4gbW9kaWZpZWQuCj4+Pj4gVXJnLCBp
dCdzIGtpbmQgb2YgdWdseSB0byBhZGQgYW5vdGhlciBkZWZpbml0aW9uIG9mIGludmFsaWQgZG9t
aWQgd2hlbgo+Pj4+IHRoZXJlJ3MgYWxyZWFkeSBET01JRF9JTlZBTElEIGluIHRoZSBwdWJsaWMg
aGVhZGVycy4gSSBndWVzcyB0aGVyZSdzIGEKPj4+PiByZWFzb24gSSdtIG1pc3NpbmcgZm9yIG5v
dCB1c2luZyBET01JRF9JTlZBTElEIGluc3RlYWQgb2YgaW50cm9kdWNpbmcKPj4+PiBhIG5ldyB2
YWx1ZT8KPj4+Pgo+Pj4gVEJIIEkgZG9uJ3Qga25vdy4gQXMgZmFyIGFzIHhsL2xpYnhsIGdvZXMs
IGRvbWlkcyBhcmUgdWludDMyX3RzIHNvIG1heWJlCj4+IERPTUlEX0lOVkFMSUQgd2FzIGZvciBz
b21lIHJlYXNvbiBub3QgY29uc2lkZXJlZCBhcHByb3ByaWF0ZT8KClJlYWQgdGhlIGNvbW1pdCBt
ZXNzYWdlIHdoZXJlIEkgZGlkIHRoZSBibGFua2V0IGNoYW5nZSB0byB1c2UgdWludDMyX3QuCgpj
L3MgNWI0MmM4MmY1NQoKRG9lcyB0aGlzIHJlYWxseSBuZWVkIHRvIGVudGVyIHRoZSBBUEk/Cgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
