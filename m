Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0209FE51E6
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 19:05:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO2yR-0008To-ES; Fri, 25 Oct 2019 17:02:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uj8v=YS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iO2yQ-0008Tj-Co
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 17:02:02 +0000
X-Inumbo-ID: 29554fe2-f749-11e9-beca-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29554fe2-f749-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572022921;
 h=subject:to:references:from:cc:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=sPJc5qSYwT++6UF4fecUklEC/cuBE2rm+bJMMhWlmkQ=;
 b=IkqWn6V91CRXwExyts3G9YuI4zuge9/mQSM3HBsC7mnoYfJJnd3fUBes
 YfojzsUZUT37RIeR9t2h6lN2AxZ44UjGAmfzg1rbOym7QjfnfeFsMkyAn
 U6CIWDTPOO/rCUvlUsUw7jAvjZ6dC8HvoB6penrxpr7yoXNyoc+KSpUCC A=;
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
IronPort-SDR: aQ4Mm14T3S42vfmhDT2ASaypfmA19lQCMcIlpRGXiQIXXWqbRPauxdcEZgUPliYIaQBAANWAUr
 Y6xCTx7onqlPOtmMGGICK667wcG6M0aiD4JKxF8zgAXWEnGwgSgUOjVXEDU25sHkWAWPlkwuww
 /RC3W5Cg2Zj0JhrV/biIBfOvxMfF0XGEwxpbgwTD2tKCBnXLc29JDUtZQvMu0LDDAfS/eLi4YF
 mHhFLe1HIA+rAodwbI5CAtWlME1TYjUvYX4haTTz9G4xXAuh6IRQwa+q4TGz8IgXK9ps4djq2l
 +uc=
X-SBRS: 2.7
X-MesageID: 7756258
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,229,1569297600"; 
   d="scan'208";a="7756258"
To: Steven Haigh <netwiz@crc.id.au>, xen-devel
 <xen-devel@lists.xenproject.org>, Juergen Gross <JGross@suse.com>, "Jan
 Beulich" <JBeulich@suse.com>
References: <1571918276.2606.0@crc.id.au>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f5bb6057-7d01-92ad-9ab5-45f4b5bf57a5@citrix.com>
Date: Fri, 25 Oct 2019 18:01:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571918276.2606.0@crc.id.au>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Debugging Windows HVM crashes on Ryzen 3xxx series
 CPUs.
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQvMTAvMjAxOSAxMjo1NywgU3RldmVuIEhhaWdoIHdyb3RlOgo+IEhpIGFsbCwKPgo+IEkn
dmUgbWFuYWdlZCB0byBnZXQgdGhlIGdpdCBtYXN0ZXIgdmVyc2lvbiBvZiBYZW4gb24gdGhpcyBh
ZmZlY3RlZAo+IHN5c3RlbSBhbmQgdHJpZXMgdG8gYm9vdCBhIFdpbmRvd3MgU2VydmVyIDIwMTYg
c3lzdGVtLiBJdCBjcmFzaGVzIGFzCj4gcGVyIG5vcm1hbC4KPgo+IEkgbWFuYWdlZCB0byBnZXQg
dGhlc2UgbG9ncywgYnV0IEknbSBub3QgcXVpdGUgc3VyZSB3aGF0IGVsc2UgdG8gZG8gdG8KPiBk
ZWJ1ZyB0aGlzIGlzc3VlIGZ1cnRoZXIuCgpBZnRlciBhIGNvbGxhYm9yYXRpdmUgZGVidWdnaW5n
IHNlc3Npb24gb24gSVJDLCB3ZSd2ZSBpZGVudGlmaWVkIHRoZQpwcm9ibGVtLsKgIEhlcmUgaXMg
YSBzdW1tYXJ5LgoKaHR0cHM6Ly93d3cucmVkZGl0LmNvbS9yL0FtZC9jb21tZW50cy9ja3I1ZjQv
YW1kX3J5emVuXzMwMDBfc2VyaWVzX2xpbnV4X3N1cHBvcnRfYW5kLwppcyBjb25jZXJuaW5nIEtW
TSwgYnV0IGl0IGlkZW50aWZpZWQgdGhhdCB0aGUgVE9QT0VYVCBmZWF0dXJlIHdhcwppbXBvcnRh
bnQgdG8gZ2V0dGluZyB3aW5kb3dzIHRvIGJvb3QuCgpYZW4gZG9lc24ndCBjdXJyZW50bHkgb2Zm
ZXIgVE9QT0VYVCB0byBndWVzdHMgYXQgYWxsLsKgIEZpeGluZyB0aGlzIGlzIG9uCnRoZSBUT0RP
IGxpc3QgYWxvbmcgd2l0aCB0aGUgcmVzdCBvZiB0aGUgdG9wb2xvZ3kgcmVwcmVzZW50YXRpb24g
c3dhbXAuCgpPbiBhIGh1bmNoLCBJIG9mZmVyZWQgdXAgYSBYZW5TZXJ2ZXIgcGF0Y2ggd2hpY2gg
d2UgYXJlIHN0aWxsIHVzaW5nLCBpbgpsaWV1IG9mIGZpeGluZyB0b3BvbG9neSBwcm9wZXJseS7C
oCBJdCBpcyBsb2dpY2FsbHkgYSByZXZlcnQgb2YKY2EyZWVlOTJkZjQ0IGFzIHRoYXQgY2hhbmdl
IHdhc24ndCBtaWdyYXRpb24gc2FmZS4KCldpdGggdGhpcyBwYXRjaCBpbiBwbGFjZSwgd2luZG93
cyB3b3JrcyBmaW5lLsKgIEhvd2V2ZXIsIEkgZG9uJ3QgdGhpbmsKdGhlIHBhdGNoIGlzIGFwcHJv
cHJpYXRlIHRvIHRha2UgaW50byA0LjEzLgoKRnVydGhlcm1vcmUsIHRoZXJlIGlzIG5vIGNoYW5j
ZSBvZiBnZXR0aW5nIHRoZSB0b3BvbG9neSB3b3JrIHNvcnRlZCBpbgp0aGUgcmVtYWluaW5nIDQu
MTMgdGltZWZyYW1lLgoKSSdtIGF0IGEgbG9zcyBmb3IgaWRlYXMsIG90aGVyIHRoYW4gcmVsZWFz
ZSBub3RlIGl0IGFzIGJyb2tlbiBhbmQgbWFrZQpmaXhpbmcgaXQgYSBibG9ja2VyIGZvciA0LjE0
LgoKVGhvdWdodHM/Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
