Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A41D175B9C
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 14:29:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8l4u-0007n2-Qy; Mon, 02 Mar 2020 13:25:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=McR1=4T=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j8l4t-0007mx-Nh
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 13:25:47 +0000
X-Inumbo-ID: 533065a4-5c89-11ea-9f7a-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 533065a4-5c89-11ea-9f7a-12813bfff9fa;
 Mon, 02 Mar 2020 13:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583155547;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=sOAzJ3sZNaL5ABEJ/ACvyXwiOpfdKLmIg5dT/4MwD2w=;
 b=ExjB/ZfzMVo7V4rC7g0YNLH4ZbVZDLIbuTxY5Q8pYvrj25xuw2eRXMW5
 pVi0+Xvog3dT6i9vTtzFFgxJDD569RP8Hjp0Dk256++Iw6vkO8gRN7J2u
 U3B+Sl30kw70PQKkVyDTAJ89UqMxlJGi54sDElvgUmufBfM/hxceXgbxo 8=;
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
IronPort-SDR: PuwN0lLyy4FWI2tIj5lUMJcGCXatF7IDu0jrXl9MpUBoY2C+kdoT1McqegGLu9RNXhO6ytZ32o
 4jI6gEZvxjHqKgiX5zL/uUEjNqlNjDU/VWkXhD7X70ILuO60v5Z/rkT60h3eT7OuFd7QnADezp
 e1KdK7iOf6ZSys5tZ3S7ONrbnIGSyolR+8BrHaqWs+u+Xot6R+6Hc8XqoezHDsNvFXTDiAkoDY
 ZCt43RYk2iCNEQJ3rZD1XAjRCbbCTL4Pr7qjfsa6J7uapvdI+k4iAIjHMvBlqDvX86YwiPeAwK
 sI8=
X-SBRS: 2.7
X-MesageID: 13272094
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,507,1574139600"; d="scan'208";a="13272094"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20200218122114.17596-1-jgross@suse.com>
 <709bf8df-1635-cb71-11ea-f8d1b629a071@citrix.com>
 <1fe4ab0e-0b36-af09-557a-e7783315ea4f@suse.com>
 <cc39b5ca-03a1-cfde-5d81-29ca27c2b5a2@citrix.com>
 <397d7d26-8ed8-82f0-6aa0-37c0a8537fdd@suse.com>
 <fc17fb5e-0351-8a87-6f77-61bf29b4c877@citrix.com>
 <1e245b89-d3cc-d8c7-c783-1fcc04eab411@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <c29bb636-a7d8-3bf0-ae59-f10a274a9238@citrix.com>
Date: Mon, 2 Mar 2020 13:25:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1e245b89-d3cc-d8c7-c783-1fcc04eab411@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/4] xen/rcu: let rcu work better with
 core scheduling
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDIvMjAyMCAwNzoxMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiAKPiBJIHRoaW5rIHlv
dSBhcmUganVzdCBuYXJyb3dpbmcgdGhlIHdpbmRvdyBvZiB0aGUgcmFjZToKPiAKPiBJdCBpcyBz
dGlsbCBwb3NzaWJsZSB0byBoYXZlIHR3byBjcHVzIGVudGVyaW5nIHJjdV9iYXJyaWVyKCkgYW5k
IHRvCj4gbWFrZSBpdCBpbnRvIHRoZSBpZiAoICFpbml0aWFsICkgY2xhdXNlLgo+IAo+IEluc3Rl
YWQgb2YgaW50cm9kdWNpbmcgYW5vdGhlciBhdG9taWMgSSBiZWxpZXZlIHRoZSBmb2xsb3dpbmcg
cGF0Y2gKPiBpbnN0ZWFkIG9mIHlvdXJzIHNob3VsZCBkbyBpdDoKPiAKPiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9yY3VwZGF0ZS5jIGIveGVuL2NvbW1vbi9yY3VwZGF0ZS5jCj4gaW5kZXggZTZh
ZGQwYjEyMC4uMGQ1NDY5YTMyNiAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL3JjdXBkYXRlLmMK
PiArKysgYi94ZW4vY29tbW9uL3JjdXBkYXRlLmMKPiBAQCAtMTgwLDIzICsxODAsMTcgQEAgc3Rh
dGljIHZvaWQgcmN1X2JhcnJpZXJfYWN0aW9uKHZvaWQpCj4gCj4gwqB2b2lkIHJjdV9iYXJyaWVy
KHZvaWQpCj4gwqB7Cj4gLcKgwqDCoCBpbnQgaW5pdGlhbCA9IGF0b21pY19yZWFkKCZjcHVfY291
bnQpOwo+IC0KPiDCoMKgwqDCoCB3aGlsZSAoICFnZXRfY3B1X21hcHMoKSApCj4gwqDCoMKgwqAg
ewo+IMKgwqDCoMKgwqDCoMKgwqAgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCk7Cj4gLcKgwqDC
oMKgwqDCoMKgIGlmICggaW5pdGlhbCAmJiAhYXRvbWljX3JlYWQoJmNwdV9jb3VudCkgKQo+ICvC
oMKgwqDCoMKgwqDCoCBpZiAoICFhdG9taWNfcmVhZCgmY3B1X2NvdW50KSApCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPiAKPiDCoMKgwqDCoMKgwqDCoMKgIGNwdV9yZWxheCgp
Owo+IC3CoMKgwqDCoMKgwqDCoCBpbml0aWFsID0gYXRvbWljX3JlYWQoJmNwdV9jb3VudCk7Cj4g
wqDCoMKgwqAgfQo+IAo+IC3CoMKgwqAgaWYgKCAhaW5pdGlhbCApCj4gLcKgwqDCoCB7Cj4gLcKg
wqDCoMKgwqDCoMKgIGF0b21pY19zZXQoJmNwdV9jb3VudCwgbnVtX29ubGluZV9jcHVzKCkpOwo+
ICvCoMKgwqAgaWYgKCBhdG9taWNfY21weGNoZygmY3B1X2NvdW50LCAwLCBudW1fb25saW5lX2Nw
dXMoKSkgPT0gMCApCj4gwqDCoMKgwqDCoMKgwqDCoCBjcHVtYXNrX3JhaXNlX3NvZnRpcnEoJmNw
dV9vbmxpbmVfbWFwLCBSQ1VfU09GVElSUSk7Cj4gLcKgwqDCoCB9Cj4gCj4gwqDCoMKgwqAgd2hp
bGUgKCBhdG9taWNfcmVhZCgmY3B1X2NvdW50KSApCj4gwqDCoMKgwqAgewo+IAo+IENvdWxkIHlv
dSBnaXZlIHRoYXQgYSB0cnksIHBsZWFzZT8KCldpdGggdGhpcyBwYXRjaCBJIGNhbm5vdCBkaXNh
YmxlIFNNVCBhdCBhbGwuCgpUaGUgcHJvYmxlbSB0aGF0IG15IGRpZmYgc29sdmVkIHdhcyBhIHJh
Y2UgYmV0d2VlbiAyIGNvbnNlY3V0aXZlCnJjdV9iYXJyaWVyIG9wZXJhdGlvbnMgb24gQ1BVMCAo
dGhlIHBhdHRlcm4gc3BlY2lmaWMgdG8gU01ULW9uL29mZgpvcGVyYXRpb24pIHdoZXJlIHNvbWUg
Q1BVcyBkaWRuJ3QgZXhpdCB0aGUgY3B1X2NvdW50IGNoZWNraW5nIGxvb3AKY29tcGxldGVseSBi
dXQgY3B1X2NvdW50IGlzIGFscmVhZHkgcmVpbml0aWFsaXplZCBvbiBDUFUwIC0gdGhpcwpyZXN1
bHRzIGluIHNvbWUgQ1BVcyBiZWluZyBzdHVjayBpbiB0aGUgbG9vcC4KCklnb3IKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
