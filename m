Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0801594FE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 17:33:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1YPu-00042E-Eu; Tue, 11 Feb 2020 16:29:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0zdE=37=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j1YPs-000425-TS
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 16:29:40 +0000
X-Inumbo-ID: b31d77e8-4ceb-11ea-8876-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b31d77e8-4ceb-11ea-8876-bc764e2007e4;
 Tue, 11 Feb 2020 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581438580;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=lWAikwa3+/Lx4ZxkGd6gCm4mObYcqZ1MdwUgq3F4T8A=;
 b=Sz+RHXxvKmXgNMhcxRmesSZMXz7VgrQZZ+e84j6TW7i6Ug/bxAi0l6hR
 sLrejb9M3vG/qfkxnLIRynEd0RAluZNjOcQGvUDfYstXdP/CkKTvRhwc9
 N9/Hc9nOvWTqby+5mD6LWbHu9cAtTgOcB57D1+lPPsLl8VdChObzxgYv1 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lyvxseGii38APC9H12FT1YryUEftEcxNB3Wx6Ki1j1A/7rXubx9c4urLWXpIFVlXluN160CVXf
 CvxELIzR5P785UxRDl618qOBtTZvRpQu3RZBvuEpX7fa8nIzr31BfpNY4FKRL86WvwdVApEfn4
 V5hP7C0H/oRNw/CJoQ7tpC268lJK0mLwDDGM/sbXTAGh+3BOoBumnsDXCBNddSd4jf2b2qPTuE
 aaCMAMwoDKUa4BbDe3Y8AvW9Gjd7t4+5qbPGLxsuAPbeMgmfpROGw7gM35H3GL38mOOpZtcGys
 ivg=
X-SBRS: 2.7
X-MesageID: 12285651
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12285651"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
References: <2b7826d9-8822-97c8-0637-03bcb98d6418@citrix.com>
 <20200211160149.GL4679@Air-de-Roger>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <7edfe77a-183b-8927-ffe7-d0ba2bd939e2@citrix.com>
Date: Tue, 11 Feb 2020 16:29:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200211160149.GL4679@Air-de-Roger>
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
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMDIvMjAyMCAxNjowMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEZl
YiAxMSwgMjAyMCBhdCAwMTozOTo0MlBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBT
aGltIGNhbid0IGRlY3JlYXNlIHJlc2VydmF0aW9uIChIVk0gd2l0aCBMMCBYZW4pIG9uIGFueSBm
cmFtZSB3aG8ncwo+PiByZWZlcmVuY2UgY291bnQgZGlkbid0IGRyb3AgdG8gMCBmcm9tIHRoZSBQ
ViBndWVzdHMnIGNhbGwsIGFuZCB0aGVyZSBpcwo+PiBub3RoaW5nIHByZXNlbnRseSB0byBjaGVj
ayB0aGlzIGNvbmRpdGlvbi4KPiAKPiBCdXQgc2hpbSB3aWxsIG9ubHkgYmFsbG9vbiBvdXQgZnJl
ZSBkb21oZWFwIHBhZ2VzIChhcyBpdCBnZXRzIHRoZW0KPiBmcm9tIGFsbG9jX2RvbWhlYXBfcGFn
ZXMpLCBhbmQgdGhvc2Ugc2hvdWxkbid0IGhhdmUgYW55IHJlZmVyZW5jZSBieQo+IHRoZSBndWVz
dD8KCkNvcnJlY3QsIGhvd2V2ZXIgYWxsIHRoZSBndWVzdHMgdGhhdCB3ZSB0ZXN0IGluIFhlblJU
IGJlaGF2ZSBwcm9wZXJseS4KSSdtIG5vdCBhd2FyZSBvZiBhbnkgZ3Vlc3QgdGhhdCBrZWVwcyBy
ZWZlcmVuY2VzIGFmdGVyIGNhbGxpbmcKZGVjcmVhc2VfcmVzZXJ2YXRpb24oKS4KCj4+IFNob3J0
IG9mIGEgUEdDIGJpdCBhbmQgZXh0cmEgc2hpbSBsb2dpYyBpbiBmcmVlX2RvbWhlYXBfcGFnZSgp
LCBJIGNhbid0Cj4+IHNlZSBhbnkgd2F5IHRvIHJlY29uY2lsZSB0aGUgYmVoYXZpb3VyLCBleGNl
cHQgdG8gY2hhbmdlIHRoZSBzZW1hbnRpY3MKPj4gb2YgZGVjcmVhc2UgcmVzZXJ2YXRpb24gZm9y
IFBWIGd1ZXN0cy7CoCBJbiBwcmFjdGljZSwgdGhpcyB3b3VsZCBiZSBmYXIKPj4gbW9yZSBzZW5z
aWJsZSBiZWhhdmlvdXIsIGJ1dCB3ZSBoYXZlIG5vIGlkZWEgaWYgZXhpc3RpbmcgUFYgZ3Vlc3Rz
IHdvdWxkCj4+IG1hbmFnZS4KPiAKPiBIbSwgSSBndWVzcyB3ZSBjb3VsZCBhZGQgc29tZSBob29r
IHRvIGZyZWVfZG9taGVhcF9wYWdlIGluIG9yZGVyIHRvCj4gcmVtb3ZlIHRoZW0gZnJvbSB0aGUg
cGh5c21hcCBvbmNlIHRoZSBndWVzdCBmcmVlcyB0aGVtPwo+Cj4gSG93IGRvZXMgWGVuIGtub3cg
d2hpY2ggcGFnZXMgZnJlZWQgYnkgYSBQViBndWVzdCBzaG91bGQgYmUgYmFsbG9vbmVkCj4gb3V0
PwoKSXQgZG9lc24ndCBjdXJyZW50bHkuCgo+IElzIHRoYXQgZG9uZSBzb2xlbHkgYmFzZWQgb24g
dGhlIGZhY3QgdGhhdCB0aG9zZSBwYWdlcyBkb24ndCBoYXZlIGFueQo+IHJlZmVyZW5jZT8KClll
cy4KCj4gVGhhdCBkb2Vzbid0IHNlZW0gbGlrZSBhIHZpYWJsZSBvcHRpb24gdW5sZXNzIHdlIGFk
ZCBhIG5ldyBiaXQgdG8gdGhlCj4gcGFnZSBzdHJ1Y3QgaW4gb3JkZXIgdG8gc2lnbmFsIHRoYXQg
dGhvc2UgcGFnZXMgc2hvdWxkIGJlIGJhbGxvb25lZAo+IG91dCBvbmNlIGZyZWVkLCBhcyB5b3Ug
c3VnZ2VzdC4KCkFncmVlLiBCdXQgYXMgSSBzYWlkIEknbSBub3QgYXdhcmUgb2YgYW55IGd1ZXN0
IHRoYXQgdmlvbGF0ZXMgdGhlCmludmFyaWFudCBvZiBkZWNyZWFzZV9yZXNlcnZhdGlvbigpIGJl
aW5nIHRoZSBsYXN0IGNhbGwuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
