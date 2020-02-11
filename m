Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC2C158CCC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 11:36:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1SsD-0005X0-Kr; Tue, 11 Feb 2020 10:34:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3UK8=37=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j1SsC-0005Wu-HB
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 10:34:32 +0000
X-Inumbo-ID: 1497d2d4-4cba-11ea-b559-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1497d2d4-4cba-11ea-b559-12813bfff9fa;
 Tue, 11 Feb 2020 10:34:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j1Ss7-00033A-84; Tue, 11 Feb 2020 10:34:27 +0000
Received: from [62.60.63.48] (helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j1Ss6-0003Fz-V6; Tue, 11 Feb 2020 10:34:27 +0000
Date: Tue, 11 Feb 2020 10:34:24 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200211103424.vtokisnsg4hq6pzw@debian>
References: <20200210172829.43604-1-roger.pau@citrix.com>
 <20200210172829.43604-8-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210172829.43604-8-roger.pau@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTAsIDIwMjAgYXQgMDY6Mjg6MjlQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgpbLi4uXQo+ICAKPiAgc3RydWN0IGh5cGVydmlzb3Jfb3BzIHsKPiBAQCAtMzIsNiAr
MzQsOCBAQCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgewo+ICAgICAgdm9pZCAoKnJlc3VtZSkodm9p
ZCk7Cj4gICAgICAvKiBGaXggdXAgZTgyMCBtYXAgKi8KPiAgICAgIHZvaWQgKCplODIwX2ZpeHVw
KShzdHJ1Y3QgZTgyMG1hcCAqZTgyMCk7Cj4gKyAgICAvKiBMMCBhc3Npc3RlZCBUTEIgZmx1c2gg
Ki8KPiArICAgIGludCAoKmZsdXNoX3RsYikoY29uc3QgY3B1bWFza190ICptYXNrLCBjb25zdCB2
b2lkICp2YSwgdW5zaWduZWQgaW50IG9yZGVyKTsKPiAgfTsKPiAgCj4gICNpZmRlZiBDT05GSUdf
R1VFU1QKPiBAQCAtNDEsNiArNDUsMTQgQEAgdm9pZCBoeXBlcnZpc29yX3NldHVwKHZvaWQpOwo+
ICBpbnQgaHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKTsKPiAgdm9pZCBoeXBlcnZpc29yX3Jlc3Vt
ZSh2b2lkKTsKPiAgdm9pZCBoeXBlcnZpc29yX2U4MjBfZml4dXAoc3RydWN0IGU4MjBtYXAgKmU4
MjApOwo+ICsvKgo+ICsgKiBMMCBhc3Npc3RlZCBUTEIgZmx1c2guCj4gKyAqIG1hc2s6IGNwdW1h
c2sgb2YgdGhlIGRpcnR5IHZDUFVzIHRoYXQgc2hvdWxkIGJlIGZsdXNoZWQuCj4gKyAqIHZhOiBs
aW5lYXIgYWRkcmVzcyB0byBmbHVzaCwgb3IgTlVMTCBmb3IgZ2xvYmFsIGZsdXNoZXMuCgpJIHdh
cyBpbiB0aGUgbWlkZGxlIG9mIHdyaXRpbmcgbXkgcGF0Y2ggYW5kIG5vdGljZWQgdGhpcy4KCkkg
dGhpbmsgTlVMTCBtZWFucyAiZmx1c2hpbmcgdGhlIGVudGlyZSBhZGRyZXNzIHNwYWNlIiBoZXJl
PwoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
