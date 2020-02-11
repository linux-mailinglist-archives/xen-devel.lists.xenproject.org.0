Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FD91591A0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 15:11:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1WDe-0008Fq-OU; Tue, 11 Feb 2020 14:08:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3UK8=37=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j1WDd-0008Ff-J8
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 14:08:53 +0000
X-Inumbo-ID: 087748a5-4cd8-11ea-b5a4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 087748a5-4cd8-11ea-b5a4-12813bfff9fa;
 Tue, 11 Feb 2020 14:08:53 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j1WDc-0007P9-Ax; Tue, 11 Feb 2020 14:08:52 +0000
Received: from [109.144.23.216] (helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j1WDa-0001GD-Qi; Tue, 11 Feb 2020 14:08:52 +0000
Date: Tue, 11 Feb 2020 14:08:39 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200211140839.efpbzoxykysp5dlr@debian>
References: <20200210172829.43604-1-roger.pau@citrix.com>
 <20200210172829.43604-8-roger.pau@citrix.com>
 <20200211103424.vtokisnsg4hq6pzw@debian>
 <20200211140621.GK4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211140621.GK4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 7/7] x86/tlb: use Xen L0 assisted TLB
 flush when available
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMDM6MDY6MjFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIEZlYiAxMSwgMjAyMCBhdCAxMDozNDoyNEFNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gTW9uLCBGZWIgMTAsIDIwMjAgYXQgMDY6Mjg6MjlQTSArMDEwMCwg
Um9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gWy4uLl0KPiA+ID4gIAo+ID4gPiAgc3RydWN0IGh5
cGVydmlzb3Jfb3BzIHsKPiA+ID4gQEAgLTMyLDYgKzM0LDggQEAgc3RydWN0IGh5cGVydmlzb3Jf
b3BzIHsKPiA+ID4gICAgICB2b2lkICgqcmVzdW1lKSh2b2lkKTsKPiA+ID4gICAgICAvKiBGaXgg
dXAgZTgyMCBtYXAgKi8KPiA+ID4gICAgICB2b2lkICgqZTgyMF9maXh1cCkoc3RydWN0IGU4MjBt
YXAgKmU4MjApOwo+ID4gPiArICAgIC8qIEwwIGFzc2lzdGVkIFRMQiBmbHVzaCAqLwo+ID4gPiAr
ICAgIGludCAoKmZsdXNoX3RsYikoY29uc3QgY3B1bWFza190ICptYXNrLCBjb25zdCB2b2lkICp2
YSwgdW5zaWduZWQgaW50IG9yZGVyKTsKPiA+ID4gIH07Cj4gPiA+ICAKPiA+ID4gICNpZmRlZiBD
T05GSUdfR1VFU1QKPiA+ID4gQEAgLTQxLDYgKzQ1LDE0IEBAIHZvaWQgaHlwZXJ2aXNvcl9zZXR1
cCh2b2lkKTsKPiA+ID4gIGludCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpOwo+ID4gPiAgdm9p
ZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKTsKPiA+ID4gIHZvaWQgaHlwZXJ2aXNvcl9lODIwX2Zp
eHVwKHN0cnVjdCBlODIwbWFwICplODIwKTsKPiA+ID4gKy8qCj4gPiA+ICsgKiBMMCBhc3Npc3Rl
ZCBUTEIgZmx1c2guCj4gPiA+ICsgKiBtYXNrOiBjcHVtYXNrIG9mIHRoZSBkaXJ0eSB2Q1BVcyB0
aGF0IHNob3VsZCBiZSBmbHVzaGVkLgo+ID4gPiArICogdmE6IGxpbmVhciBhZGRyZXNzIHRvIGZs
dXNoLCBvciBOVUxMIGZvciBnbG9iYWwgZmx1c2hlcy4KPiA+IAo+ID4gSSB3YXMgaW4gdGhlIG1p
ZGRsZSBvZiB3cml0aW5nIG15IHBhdGNoIGFuZCBub3RpY2VkIHRoaXMuCj4gPiAKPiA+IEkgdGhp
bmsgTlVMTCBtZWFucyAiZmx1c2hpbmcgdGhlIGVudGlyZSBhZGRyZXNzIHNwYWNlIiBoZXJlPwo+
IAo+IFllcywgdGhhdCdzIHJpZ2h0LiBJIGRpZG4ndCBhZGQgYSB3YXkgdG8gZGlmZmVyZW50aWF0
ZSBiZXR3ZWVuIGdsb2JhbAo+IChpZTogUEdFIG1hcHBpbmdzIGluY2x1ZGVkKSBmbHVzaGVzIGFu
ZCBub24tZ2xvYmFsIGZsdXNoZXMsIHNvIGFsbAo+IGNhbGxzIGFyZSBhc3N1bWVkIHRvIGltcGx5
IGZsdXNoZXMgb2YgZ2xvYmFsIG1hcHBpbmdzLgo+IAo+IEl0IG1pZ2h0IGJlIGJldHRlciBpZiB5
b3UgYWRhcHQgaXQgeW91cnNlbGYgdG8gd2hhdGV2ZXIgaXMgbW9yZSBzdWl0ZWQKPiBmb3IgSHlw
ZXJWIHdoaWNoIGhhcyBtb3JlIHNlbGVjdGl2ZSBmbHVzaGVzIGF2YWlsYWJsZS4gWGVuIG9ubHkg
aGFzIGFuCj4gaHlwZXJjYWxsIHRvIHJlcXVlc3QgYSBnbG9iYWwgZmx1c2ggb24gYWxsIHZDUFVz
LgoKT0suIFRoYW5rcyBmb3IgY29uZmlybWluZy4KCkkgd2lsbCBjaGFuZ2UgdGhpcyBjb21tZW50
IGluIG15IHBhdGNoLgoKV2VpLgoKPiAKPiBUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
