Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2755D10D59E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:21:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iafDi-0004bF-MW; Fri, 29 Nov 2019 12:17:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UeaM=ZV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iafDh-0004ax-7A
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:17:57 +0000
X-Inumbo-ID: 4631d044-12a2-11ea-a3e4-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4631d044-12a2-11ea-a3e4-12813bfff9fa;
 Fri, 29 Nov 2019 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575029877;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=oCBESEWHLcYH5GYaRybrvw40QZ6J4VTzR0d/VM90EhQ=;
 b=XMLzZPQZX5X7urWmDEXc8F+oC/3Nr06pjGE51djvWhnttOuZc5w2QAmQ
 dF11XMHoOaafIchhOVORrLCyvPJh7riacsHSonE2cngzXuh3DXoHNKFyj
 LlRjArDTPSnN+SGxNNnfFraEQTlWnF003JvVoErHK7m7zZ2IxbCZz3wcw A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: c2L4+iyI3f9VCFe8JuQHOqb0d7nGWhVu+QU3PM7f4aGno75HSdsbhDiv5hQ0zFaA/c5hwt+mCg
 j7mgw35TD5Uye4g6nPduatNaM76tjzEUHE/NaQP5Z4klC06fYl1xT0Qd0iSVT36h/w7B7Y0Jcj
 /ceiU70Eh82b7WgrnngKSFEIApwYZvH9zpu8mt4mtNzw9/Jth7E16u3xDD+p3JSAJpTxaYsISs
 KzYlmMWoPTXFvIpgpYc5iJCAXnMnku8FDE5oB1XtVcE1/tvxVz8/Qpif+OzopTAfVO2lFGDCEe
 SoA=
X-SBRS: 2.7
X-MesageID: 9110268
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9110268"
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <24033.2082.127306.518557@mariner.uk.xensource.com>
 <3d3e940b-5e09-285c-cd8e-c0847b7e205f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <50398bda-db76-fbe2-7666-2e3ac516b4e4@citrix.com>
Date: Fri, 29 Nov 2019 12:17:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3d3e940b-5e09-285c-cd8e-c0847b7e205f@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad
 Wilk <konrad.wilk@oracle.com>, Ilja Van Sprundel <ivansprundel@ioactive.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMTEvMjAxOSAxMjoxNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMTEuMjAxOSAx
Mjo1OSwgSWFuIEphY2tzb24gd3JvdGU6Cj4+IEphbiBCZXVsaWNoIHdyaXRlcyAoIltQQVRDSF0g
Y29uc29sZTogYXZvaWQgYnVmZmVyIG92ZXJmbG93IGluIGd1ZXN0X2NvbnNvbGVfd3JpdGUoKSIp
Ogo+Pj4gVGhlIHN3aXRjaCBvZiBndWVzdF9jb25zb2xlX3dyaXRlKCkncyBzZWNvbmQgcGFyYW1l
dGVyIGZyb20gcGxhaW4gdG8KPj4+IHVuc2lnbmVkIGludCBoYXMgY2F1c2VkIHRoZSBmdW5jdGlv
bidzIG1haW4gbG9vcCBoZWFkZXIgdG8gbm8gbG9uZ2VyCj4+PiBndWFyZCB0aGUgbWluX3QoKSB1
c2Ugd2l0aGluIHRoZSBmdW5jdGlvbiBhZ2FpbnN0IGVmZmVjdGl2ZWx5IG5lZ2F0aXZlCj4+PiB2
YWx1ZXMsIGR1ZSB0byB0aGUgY2FzdHMgaGlkZGVuIGluc2lkZSB0aGUgbWFjcm8uIFJlcGxhY2Ug
YnkgYSBwbGFpbgo+Pj4gbWluKCksIGNvbnZlcnRpbmcgb25lIG9mIHRoZSBhcmd1bWVudHMgc3Vp
dGFibHkgd2l0aG91dCBpbnZvbHZpbmcgYW55Cj4+PiBjYXN0Lgo+Pj4KPj4+IEZpeGVzOiBlYTYw
MWVjOTk5NWIgKCJ4ZW4vY29uc29sZTogUmV3b3JrIEhZUEVSQ0FMTF9jb25zb2xlX2lvIGludGVy
ZmFjZSIpCj4+PiBSZXBvcnRlZC1ieTogSWxqYSBWYW4gU3BydW5kZWwgPGl2YW5zcHJ1bmRlbEBp
b2FjdGl2ZS5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4+IGVhNjAxZWM5OTk1YiBpbmNsdWRlZCB0aGlzIGh1bms6Cj4+Cj4+ICAgICAgICBj
YXNlIENPTlNPTEVJT19yZWFkOgo+PiAgICsgICAgICAgIC8qCj4+ICAgKyAgICAgICAgICogVGhl
IHJldHVybiB2YWx1ZSBpcyBlaXRoZXIgdGhlIG51bWJlciBvZiBjaGFyYWN0ZXJzIHJlYWQgb3IK
Pj4gICArICAgICAgICAgKiBhIG5lZ2F0aXZlIHZhbHVlIGluIGNhc2Ugb2YgZXJyb3IuIFNvIHdl
IG5lZWQgdG8gcHJldmVudAo+PiAgICsgICAgICAgICAqIG92ZXJsYXAgYmV0d2VlbiB0aGUgdHdv
IHNldHMuCj4+ICAgKyAgICAgICAgICovCj4+ICAgKyAgICAgICAgcmMgPSAtRTJCSUc7Cj4+ICAg
KyAgICAgICAgaWYgKCBjb3VudCA+IElOVF9NQVggKQo+PiAgICsgICAgICAgICAgICBicmVhazsK
Pj4KPj4gTWF5YmUgaXQgd291bGQgYmUgZ29vZCB0byBtb3ZlIHRoYXQgb3V0c2lkZSB0aGUgc3dp
dGNoIHNvIHRoYXQgaXQKPj4gYWZmZWN0cyBDT05TT0xFSU9fd3JpdGUgdG9vID8KPiBBbmQgYW55
IGZ1dHVyZSBzdWJvcHM/IEFuZCBsaW1pdCBvdXRwdXQgbW9yZSB0aGFuIG5lY2Vzc2FyeSAobm90
Cj4gdGhhdCBJIHRoaW5rIGFueW9uZSB3aWxsIHdhbnQgdG8gcHVzaCBtb3JlIHRoYW4gMkcgYXQg
YSB0aW1lCj4gdGhyb3VnaCB0aGlzIGludGVyZmFjZSwgYnV0IGFueXdheSk/CgpMaW51eCBpcyBz
ZXJpb3VzbHkgY29uc2lkZXJpbmcgaW5pdHJkcyA+IDRHIG5vdyBmb3IgdmFyaW91cyB1c2VjYXNl
cy4KCjJHIHJlYWxseSBpc24ndCBlbm91Z2ggZm9yIGV2ZXJ5b25lLCBhbmQgd2Ugc2hvdWxkbid0
IGhhcmRjb2RlIGJsaW5kCnByZXN1bXB0aW9ucyBsaWtlIHRoaXMuCgp+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
