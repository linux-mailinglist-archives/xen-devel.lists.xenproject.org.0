Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7BF180005
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 15:21:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBfjD-0008Om-Dc; Tue, 10 Mar 2020 14:19:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1SqT=43=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jBfjC-0008Oh-ES
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 14:19:26 +0000
X-Inumbo-ID: 2579f5d8-62da-11ea-bec1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2579f5d8-62da-11ea-bec1-bc764e2007e4;
 Tue, 10 Mar 2020 14:19:26 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jBfjB-0000SL-9w; Tue, 10 Mar 2020 14:19:25 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jBfjB-0006Da-0n; Tue, 10 Mar 2020 14:19:25 +0000
Date: Tue, 10 Mar 2020 14:19:22 +0000
From: Wei Liu <wl@xen.org>
To: Jason Andryuk <jandryuk@gmail.com>
Message-ID: <20200310141922.nfp7sesjujma3ntb@debian>
References: <20200310132904.16992-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310132904.16992-1-jandryuk@gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] scripts: Use stat to check lock claim
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgMDk6Mjk6MDRBTSAtMDQwMCwgSmFzb24gQW5kcnl1ayB3
cm90ZToKPiBSZXBsYWNlIHRoZSBwZXJsIGxvY2tpbmcgY2hlY2sgd2l0aCBzdGF0KDEpLiAgU3Rh
dCBpcyBhYmxlIHRvIGZzdGF0Cj4gc3RkaW4gKGZpbGUgZGVzY3JpcHRvciAwKSB3aGVuIHBhc3Nl
ZCAnLScgYXMgYW4gYXJndW1lbnQuICBUaGlzIGlzIG5vdwo+IHVzZWQgdG8gY2hlY2sgJF9sb2Nr
ZmQuICBzdGF0KDEpIHN1cHBvcnQgZm9yICctJyB3YXMgaW50cm9kdWNlZCB0bwo+IGNvcmV1dGls
cyBpbiAyMDA5Lgo+IAo+IEFmdGVyIEEgcmVsZWFzZXMgaXRzIGxvY2ssIHNjcmlwdCBCIHdpbGwg
cmV0dXJuIGZyb20gZmxvY2sgYW5kIGV4ZWN1dGUKPiBzdGF0LiAgU2luY2UgdGhlIGxvY2tmaWxl
IGhhcyBiZWVuIHJlbW92ZWQgZnJvbSBBLCBzdGF0IHByaW50cyBhbiBlcnJvcgo+IHRvIHN0ZGVy
ciBhbmQgZXhpdHMgbm9uLXplcm8uICAnfHwgOicgaXMgbmVlZGVkIHRvIHNxdWFzaCB0aGUgbm9u
LXplcm8KPiBleGl0IHN0YXR1cyAtIG90aGVyd2lzZSB0aGUgc2NyaXB0IHRlcm1pbmF0ZXMgc2lu
Y2UgYHNldCAtZWAgaXMgZW5hYmxlZC4KPiBzdGRlcnIgbmVlZHMgdG8gYmUgcmVkaXJlY3RlZCB0
byAvZGV2L251bGwgb3RoZXJ3aXNlCj4gL3Zhci9sb2cveGVuL3hlbi1ob3RwbHVnLmxvZyB3aWxs
IGdldCBmaWxsZWQgd2l0aCAiTm8gc3VjaCBmaWxlIG9yCj4gZGlyZWN0b3J5IiBtZXNzYWdlcy4K
PiAKPiBUaGlzIGNoYW5nZSByZW1vdmVzIHRoZSBvbmx5IHJ1bnRpbWUgZGVwZW5kZW5jeSBvZiB0
aGUgeGVuIHRvb2xzdGFjayBvbgo+IHBlcmwuCj4gCj4gV2hpbGUgaGVyZSwgcmVwbGFjZSBzb21l
IHRhYnMgd2l0aCBzcGFjZXMgdG8gbWF0Y2ggdGhlIHJlc3Qgb2YgdGhlIGZpbGUuCj4gCj4gU3Vn
Z2VzdGVkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+CgpBY2tlZC1ieTogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
