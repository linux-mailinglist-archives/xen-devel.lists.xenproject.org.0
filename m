Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CBD124869
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 14:31:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihZMp-0004zb-IA; Wed, 18 Dec 2019 13:27:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihZMn-0004zW-SN
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 13:27:53 +0000
X-Inumbo-ID: 3163e380-219a-11ea-9078-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3163e380-219a-11ea-9078-12813bfff9fa;
 Wed, 18 Dec 2019 13:27:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3E923AC2F;
 Wed, 18 Dec 2019 13:27:52 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-8-liuwe@microsoft.com>
 <b2edd1f1-7b9e-d03f-2a84-70c65756654c@suse.com>
 <20191218123856.mskxir5onsmvql27@debian>
 <9305cf4e-e105-e560-a493-bc499c516182@suse.com>
 <80f76570-93af-f526-2f12-1f85242a5339@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c6d40f9d-6ff0-1207-446e-b573118c1a8c@suse.com>
Date: Wed, 18 Dec 2019 14:28:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <80f76570-93af-f526-2f12-1f85242a5339@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next 7/7] x86: implement Hyper-V clock
 source
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAxMzo1NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOC8xMi8yMDE5
IDEyOjUxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gKyAgICAgICAgc2NhbGUgPSB0c2NfcGFn
ZS0+dHNjX3NjYWxlOwo+Pj4+PiArICAgICAgICBvZmZzZXQgPSB0c2NfcGFnZS0+dHNjX29mZnNl
dDsKPj4+Pj4gKwo+Pj4+PiArICAgICAgICBzbXBfcm1iKCk7Cj4+Pj4+ICsKPj4+Pj4gKyAgICB9
IHdoaWxlICh0c2NfcGFnZS0+dHNjX3NlcXVlbmNlICE9IHNlcSk7Cj4+Pj4+ICsKPj4+Pj4gKyAg
ICAvKiB4ODYgaGFzIEFSQ0hfU1VQUE9SVFNfSU5UMTI4ICovCj4+Pj4+ICsgICAgcmV0ID0gKHVp
bnQ2NF90KSgoKF9fdWludDEyOF90KXRzYyAqIHNjYWxlKSA+PiA2NCkgKyBvZmZzZXQ7Cj4+Pj4g
VGhlIGZpbmFsIGNhc3QgaXNuJ3QgcmVhbGx5IG5lZWRlZCwgaXMgaXQ/IEFzIHRvIHRoZSBtdWx0
aXBsaWNhdGlvbgo+Pj4+IC0gYXJlIHlvdSBzdXJlIGFsbCBjb21waWxlcnMgaW4gYWxsIGNhc2Vz
IHdpbGwgYXZvaWQgZmFsbGluZyBiYWNrCj4+Pj4gdG8gYSBsaWJyYXJ5IGNhbGwgaGVyZT8gSW4g
b3RoZXIgc2ltaWxhciBwbGFjZXMgSSB0aGluayB3ZSB1c2UKPj4+PiBpbmxpbmUgYXNzZW1ibHkg
aW5zdGVhZC4KPj4+IFdoYXQgbGlicmFyeSBjYWxsPyBBIGZ1bmN0aW9uIGluIGxpYmdjYyAob3Ig
Y2xhbmcncyBlcXVpdmFsZW5jZSk/Cj4+PiBJU1RSIGxpYmdjYyBpcyBhbHdheXMgbGlua2VkLCBi
dXQgSSBjb3VsZCBiZSB3cm9uZyBoZXJlLgo+PiBObywgdGhlIGh5cGVydmlzb3IgKGF0IGxlYXN0
IHRoZSB4ODYgb25lKSBkb2Vzbid0IGxpbmsgbGliZ2NjIGFmYWlrLgo+IAo+IHg4NiBjYW4gbXVs
dGlwbHkgdWludDEyOF90IGJ5IHVpbnQ2NF90IHdpdGhvdXQgYSBsaWJyYXJ5IGNhbGwuwqAgSWYg
dGhpcwo+IGNvbXBpbGVzLCB0aGVuIGl0IHNob3VsZCBiZSBmaW5lLgoKSG1tLCBhIHF1aWNrIHRl
c3QgcHJvdmVzIHdoYXQgeW91IHNheSwgYnV0IEknbSB1bmNlcnRhaW4gcmVseWluZwpvbiBpdCBp
cyBhIGdvb2QgaWRlYS4gRXNwZWNpYWxseSB3aXRoIC1PcyB0aGUgY29tcGlsZXIgX3Nob3VsZF8K
cmVhbGx5IGVtaXQgYSBsaWJyYXJ5IGNhbGwuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
