Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DC015196B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 12:14:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyw6w-0002Ao-Bo; Tue, 04 Feb 2020 11:11:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cOUj=3Y=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iyw6u-0002Aj-Di
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 11:11:16 +0000
X-Inumbo-ID: 0f55d58a-473f-11ea-ad98-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f55d58a-473f-11ea-ad98-bc764e2007e4;
 Tue, 04 Feb 2020 11:11:15 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b17so3117602wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 03:11:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T/q0+QSJFUwgLz/21TApucwJkg6qrnuvy//rRK49Vmo=;
 b=U2in4fsCgTSKdPdzAPB3liLyOGfe/UHkvifv3nd3sPAuwyxFodgeXo6Grk+Ggk5Lt3
 NeloNqZ57tyVvbsz/JILBOm8VJD7ZFYwX+DH5QwZXNj6pIqv5F+HiRL9I3SL6zDpaYrB
 IjuW5VjSY+UxZImFTL+reTaWnvsEUR4aR+fLZ8WvuxyZVs957z06BLXmP+1femqfFh0g
 bPcWVtFbGTPY2xUBVAT/2fNZlBNPMwnluGGIVPiIOv080TwII9vmhox9qXmK8527MUoD
 u4uVsGNXK6zvNWGlKoh+a/VuR8x8tyH9LAuqQmYuvPZymjGqV8wBtwdsXbaInSSpUPgM
 OwcA==
X-Gm-Message-State: APjAAAVrX5LNMmcpEVPTF77loRLBdp9GSLgqmvZnPZI0d3b9wv7PDdns
 BeMCAAE1Qj4Ncye19nfMnEE=
X-Google-Smtp-Source: APXvYqwPIH3SQQCxJGcwySsjiR4WPDyoIwMJUICdg3/lN9UO/+yJ401M+GuDcbL45SKPmGGtlp95/Q==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr5022557wmi.45.1580814675019;
 Tue, 04 Feb 2020 03:11:15 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id 11sm3778180wmb.14.2020.02.04.03.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 03:11:14 -0800 (PST)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200204093411.15887-1-julien@xen.org>
 <20200204093411.15887-3-julien@xen.org> <20200204105156.GH4679@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <58bc6c70-89f5-cdcf-552c-1ea5a3fa5508@xen.org>
Date: Tue, 4 Feb 2020 11:11:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204105156.GH4679@Air-de-Roger>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNC8wMi8yMDIwIDEwOjUxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFR1ZSwg
RmViIDA0LCAyMDIwIGF0IDA5OjM0OjExQU0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4g
RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KPj4KPj4gVW5saWtlIHNoYWRv
d19lbmFibGUoKSwgaGFwX2VuYWJsZSgpIGNhbiBvbmx5IGJlIGNhbGxlZCBvbmNlIGR1cmluZwo+
PiBkb21haW4gY3JlYXRpb24gYW5kIHdpdGggdGhlIG1vZGUgZXF1YWwgdG8gbW9kZSBlcXVhbCB0
bwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIGVxdWFscyB0bwoKV2ls
bCBmaXggaXQuCgo+PiBQR19leHRlcm5hbCB8IFBHX3RyYW5zbGF0ZSB8IFBHX3JlZmNvdW50cy4K
Pj4KPj4gSWYgaXQgd2VyZSBjYWxsZWQgdHdpY2UsIHRoZW4gd2UgbWlnaHQgaGF2ZSBzb21ldGhp
bmcgaW50ZXJlc3RpbmcKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4gYSBwcm9ibGVtCj4+IHByb2JsZW0gYXMgdGhlIHAybSB0YWJsZXMgd291bGQgYmUg
cmUtYWxsb2NhdGVkIChhbmQgdGhlcmVmb3JlIGFsbCB0aGUKPj4gbWFwcGluZ3Mgd291bGQgYmUg
bG9zdCkuCj4+Cj4+IEFkZCBjb2RlIHRvIHNhbml0eSBjaGVjayB0aGUgbW9kZSBhbmQgdGhhdCB0
aGUgZnVuY3Rpb24gaXMgb25seSBjYWxsZWQKPj4gb25jZS4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkg
dG8gYW4gaWYgY2hlY2tpbmcgdGhhdCBQR190cmFuc2xhdGUgaXMgc2V0Lgo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF4gYWRkIGFuIGlmCgpXaWxsIGZpeCBpdC4KCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4+Cj4+IC0tLQo+
Pgo+PiBJdCBpcyBub3QgZW50aXJlbHkgY2xlYXIgd2hlbiBQR190cmFuc2xhdGUgd2FzIGVuZm9y
Y2VkLgo+PiAtLS0KPj4gICB4ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jIHwgMTggKysrKysrKysr
KystLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jIGIveGVu
L2FyY2gveDg2L21tL2hhcC9oYXAuYwo+PiBpbmRleCAzMTM2MmEzMWI2Li5iNzM0ZTJlNmQzIDEw
MDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jCj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9oYXAvaGFwLmMKPj4gQEAgLTQ0NSw2ICs0NDUsMTMgQEAgaW50IGhhcF9lbmFibGUo
c3RydWN0IGRvbWFpbiAqZCwgdTMyIG1vZGUpCj4+ICAgICAgIHVuc2lnbmVkIGludCBpOwo+PiAg
ICAgICBpbnQgcnYgPSAwOwo+PiAgIAo+PiArICAgIGlmICggbW9kZSAhPSAoUEdfZXh0ZXJuYWwg
fCBQR190cmFuc2xhdGUgfCBQR19yZWZjb3VudHMpICkKPj4gKyAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Cj4+ICsKPj4gKyAgICAvKiBUaGUgZnVuY3Rpb24gY2FuIG9ubHkgYmUgY2FsbGVkIG9uY2Ug
Ki8KPj4gKyAgICBpZiAoIGQtPmFyY2gucGFnaW5nLm1vZGUgIT0gMCApCj4+ICsgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+IAo+IElmIHlvdSB3YW50IHRvIHJldHVybiBFSU5WQUwgZm9yIGJvdGgg
dGhleSBjYW4gYmUgbWVyZ2VkIGludG8gYSBzaW5nbGUKPiBpZi4gQWxzbyBub3RlIHRoYXQgdGhp
cyB3b3VsZCB1c3VhbGx5IGJlIHdyaXR0ZW4gYXMKPiBpZiAoIGQtPmFyY2gucGFnaW5nLm1vZGUg
KSB0byBrZWVwIGl0IHNob3J0ZXIuCgpUbyBiZSBob25lc3QsIHRoaXMgaXMgYSBtYXR0ZXIgb2Yg
dGFzdGUuIFRoZXJlIGlzIGFsc28gYW4gYXJndW1lbnQgdGhhdCAKZm9yIE1JU1JBLCB5b3VyIHN1
Z2dlc3Rpb24gaXMgbm90IGNvbXBsaWFudCAoc2VlIFJ1bGUgMTQuNCkuCgo+IAo+IEFsYmVpdCBJ
IHRoaW5rIHlvdSBtaWdodCB3YW50IHRvIHJldHVybiBFRVhJU1QgaW5zdGVhZCBvZiBFSU5WQUwg
aWYKPiBtb2RlIGlzIGFscmVhZHkgc2V0LgoKSSBhbSBoYXBweSB3aXRoIHRoYXQuCgo+IAo+PiAr
Cj4+ICAgICAgIGRvbWFpbl9wYXVzZShkKTsKPj4gICAKPj4gICAgICAgb2xkX3BhZ2VzID0gZC0+
YXJjaC5wYWdpbmcuaGFwLnRvdGFsX3BhZ2VzOwo+PiBAQCAtNDY1LDEzICs0NzIsMTAgQEAgaW50
IGhhcF9lbmFibGUoc3RydWN0IGRvbWFpbiAqZCwgdTMyIG1vZGUpCj4+ICAgICAgIGQtPmFyY2gu
cGFnaW5nLmFsbG9jX3BhZ2UgPSBoYXBfYWxsb2NfcDJtX3BhZ2U7Cj4+ICAgICAgIGQtPmFyY2gu
cGFnaW5nLmZyZWVfcGFnZSA9IGhhcF9mcmVlX3AybV9wYWdlOwo+PiAgIAo+PiAtICAgIC8qIGFs
bG9jYXRlIFAybSB0YWJsZSAqLwo+PiAtICAgIGlmICggbW9kZSAmIFBHX3RyYW5zbGF0ZSApCj4+
IC0gICAgewo+PiAtICAgICAgICBydiA9IHAybV9hbGxvY190YWJsZShwMm1fZ2V0X2hvc3RwMm0o
ZCkpOwo+PiAtICAgICAgICBpZiAoIHJ2ICE9IDAgKQo+PiAtICAgICAgICAgICAgZ290byBvdXQ7
Cj4+IC0gICAgfQo+PiArICAgIC8qIGFsbG9jYXRlIFAyTSB0YWJsZSAqLwo+PiArICAgIHJ2ID0g
cDJtX2FsbG9jX3RhYmxlKHAybV9nZXRfaG9zdHAybShkKSk7Cj4+ICsgICAgaWYgKCBydiAhPSAw
ICkKPiAKPiBJIHdvdWxkIGFsc28gYXZvaWQgY29tcGFyaW5nIGFnYWluc3QgMCBoZXJlLgoKU2Vl
IGFib3ZlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
