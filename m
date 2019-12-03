Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD45B110088
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 15:44:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic9My-0000iB-2G; Tue, 03 Dec 2019 14:41:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8e7=ZZ=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1ic9Mx-0000i5-4i
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 14:41:39 +0000
X-Inumbo-ID: 02a7f6be-15db-11ea-81e0-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02a7f6be-15db-11ea-81e0-12813bfff9fa;
 Tue, 03 Dec 2019 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575384097;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=E1yWwfSaNm5BHV62jbq2m/T1RBk6hNtodWc0Jm5tNdI=;
 b=f/R+yxJUKvYQNy+Srsuo5ZgHZqdn63UCfYzD7WEbZKzPXnfRrXCxnsqt
 KB/I4xnkorKSbMysuTXF1yzYmCZI0TBU7LrEV634QaInDW1gmcwnrpIa7
 P+0ermrYIzCuUg5tIjR/OLypqXsYeuVbN2g5GPN0sPOt99pImKsX+S33x s=;
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
IronPort-SDR: SCxO8Q330MfPikWxx+27Iqs79tWTt6B9Zg0fACyuoBP6uqOSIM1Z3hx6yLvGOkDbfSt7+9TxmY
 U+qQOCwypyVGWiujpNGdxuc35WFE4EK6PRSYkfgwFF7Ya6QTCW2xGqanPm7XlYOCycekAPucLw
 13Ctq5QeM68OjBhN2rzWLB5t9ANRxKUMx9X8LHIPdtTs7gYR1Ze2n4HIR5zRPhu5PTETXqtQuT
 GIVaoDU3SiizYWPlzDVJ6TCO+I1e+R8QgKhLrMPyt013l1GzREfW/A9WKDKRVQpOZqFtDCIFZO
 p1g=
X-SBRS: 2.7
X-MesageID: 9534025
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,273,1571716800"; 
   d="scan'208";a="9534025"
To: Jan Beulich <jbeulich@suse.com>
References: <1575057677-13839-1-git-send-email-igor.druzhinin@citrix.com>
 <47063d30-dd6a-2528-21f3-0bc7e7951b34@suse.com>
 <3e83ed09-823a-5533-b04d-ca09d7b5016f@citrix.com>
 <21107177-aee4-e3ff-f4c2-8f2f23c70755@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <e286db34-0d24-b62b-2294-1d8a76373318@citrix.com>
Date: Tue, 3 Dec 2019 14:41:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <21107177-aee4-e3ff-f4c2-8f2f23c70755@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/AMD: unbreak CPU hotplug on
 AMD systems without RstrFpErrPtrs
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
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org, wl@xen.org,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMTIvMjAxOSAxNDoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDMuMTIuMjAxOSAx
NToyMSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDAzLzEyLzIwMTkgMTA6MDgsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4gT24gMjkuMTEuMjAxOSAyMTowMSwgSWdvciBEcnV6aGluaW4gd3Jv
dGU6Cj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwo+Pj4+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9jcHUvY29tbW9uLmMKPj4+PiBAQCAtNTQsNyArNTQsNyBAQCBzdGF0aWMgdW5zaWdu
ZWQgaW50IGZvcmNlZF9jYXBzW05DQVBJTlRTXTsKPj4+PiAgCj4+Pj4gIERFRklORV9QRVJfQ1BV
KGJvb2wsIGZ1bGxfZ2R0X2xvYWRlZCk7Cj4+Pj4gIAo+Pj4+IC12b2lkIF9faW5pdCBzZXR1cF9j
bGVhcl9jcHVfY2FwKHVuc2lnbmVkIGludCBjYXApCj4+Pj4gK3ZvaWQgc2V0dXBfY2xlYXJfY3B1
X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+Pj4+ICB7Cj4+Pj4gIAljb25zdCB1aW50MzJfdCAqZGZz
Owo+Pj4+ICAJdW5zaWduZWQgaW50IGk7Cj4+Pj4gQEAgLTgzLDcgKzgzLDcgQEAgdm9pZCBfX2lu
aXQgc2V0dXBfY2xlYXJfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+Pj4+ICAJfQo+Pj4+ICB9
Cj4+Pj4gIAo+Pj4+IC12b2lkIF9faW5pdCBzZXR1cF9mb3JjZV9jcHVfY2FwKHVuc2lnbmVkIGlu
dCBjYXApCj4+Pj4gK3ZvaWQgc2V0dXBfZm9yY2VfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+
Pj4+ICB7Cj4+Pj4gIAlpZiAoX190ZXN0X2FuZF9zZXRfYml0KGNhcCwgZm9yY2VkX2NhcHMpKQo+
Pj4+ICAJCXJldHVybjsKPj4+Cj4+PiBUaGUgdHdvIGZ1bmN0aW9ucyBhcmUgZGVsaWJlcmF0ZWx5
IF9faW5pdCwgYXMgYW55IGNhbGwgdG8gdGhlbQo+Pj4gcG9zdC1pbml0IGlzIG5vdCBnb2luZyB0
byB0YWtlIHN5c3RlbS13aWRlIGVmZmVjdC4gVGhlc2UgZnVuY3Rpb25zCj4+PiBzaG91bGQgcmVh
bGx5IGJlIF9faW5pdF9wcmVzbXAsIGlmIHdlIGhhZCBzb21ldGhpbmcgbGlrZSB0aGlzLiBObwo+
Pj4gdXNlIG9mIHRoZW0gb24gYW4gQVAgYm9vdCBwYXRoIGlzIGdvaW5nIHRvIGFmZmVjdCB0aGUg
QlNQLCBhbmQKPj4+IGhlbmNlIHdpbGwgbGVhdmUgdGhlIHN5c3RlbSBpbiBhbiBpbmNvbnNpc3Rl
bnQgc3RhdGUuCj4+Cj4+IE9uIHNlY29uZCB0aG91Z2h0LCBsb29raW5nIGF0IGhvdyBtYW55IHBs
YWNlcyBhY3R1YWxseSBjYWxsIAo+PiBzZXR1cF97Zm9yY2UsY2xlYXJ9X2NwdV9jYXAoKSBvbiBB
UCBpbml0IHBhdGggaXQgc3RpbGwgbWFrZXMgc2Vuc2UKPj4gdG8ga2VlcCB0aGUgdjEgYXBwcm9h
Y2ggYXMgb3RoZXJ3aXNlIHdlIHdpbGwgaGF2ZSB0byBtYW51YWxseSB3b3JrYXJvdW5kCj4+IGV2
ZXJ5IHNpbmdsZSBwbGFjZSB3aGVyZSBpdCBoYXBwZW5zLgo+IAo+IFdoaWxlIG5vdCBhbGwgb2Yg
dGhlIG90aGVyIHVzZXMgb2YgdGhlIGZ1bmN0aW9ucyBoYXBwZW4gZnJvbSBfX2luaXQKPiBmdW5j
dGlvbnMsIGFsbCBvZiB0aGVtIGFyZSB1bnJlYWNoYWJsZSBvbiBBUHMgYWZhaWN0IC0gSSd2ZSBq
dXN0Cj4gZ29uZSB0aHJvdWdoIGFsbCBpbnN0YW5jZXMuCgpJIHNlZSAyIHBsYWNlcyB3aGVyZSBp
dCBsb29rcyBzdXNwaWNpb3VzOgpwc3JfY3B1X2luaXQoKSwgbXdhaXRfaWRsZV9jcHVfaW5pdCgp
CgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
