Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CF4121A34
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 20:51:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igwLq-0001jS-7p; Mon, 16 Dec 2019 19:48:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rzkb=2G=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1igwLp-0001jN-E2
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 19:48:17 +0000
X-Inumbo-ID: 0089c102-203d-11ea-b6f1-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0089c102-203d-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 19:48:16 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b19so581831wmj.4
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 11:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version:in-reply-to
 :content-transfer-encoding;
 bh=gMs5W1B63XydDPv1tVZEyDdvd/VWBIUBICPv+r011Yo=;
 b=oDWKV1IoySg+nhCOWvkfbTQ21os1U6ZYFlQAmwQQNFdVsSggyfyO2YWarnIgoNfpQU
 ijwK7h5bZayF3Czku/FbgiXCXtAMATIl5HVTeElZ8R/2IJvklOOzxWaIMCxnKXdYUiVQ
 q8MVHSDvuv/EmNuoHQSyRedXPpbNyOHPVlmPtRGVwv/gxHCThFgej+lCuRzNIcPQgVIK
 zrHMCgRrwASTi6kg3j/lb/jZRldu409u152RyF3tvWFFSTBuqwUmUNDw0XoCtn7yCzh+
 liamY6Hppjo73pmXIfInCD0aogCKSmS/R7WfM8dKbMQunMXB3cSw4aJcTkr0BlLGNzKq
 L4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :in-reply-to:content-transfer-encoding;
 bh=gMs5W1B63XydDPv1tVZEyDdvd/VWBIUBICPv+r011Yo=;
 b=BUPONSGkX5tw4e8rsDaaEONeCOxNQZItCl9QXUEYFH51M6yniIpjuc1ZDuAxfTFli+
 kdDdOFlxuryPzyEHklhbHgehBQseQJ5Rwdi7wxaIBnTmEGS7scPBf9wnfPj90OafYjvQ
 dsp8zDSiJs/p8aeSL7WLpCh7b5gX2AmlLO6w9zFgtbAkcVH1HXhRZeSdBF3Mp8IwEsxc
 pNVHLfAg0xf4pRH8HQgOXJN9rf2asGS2vDIBe9GspvK2GsYrsap5RIB5QQ1SqEzfbSRm
 vJSNJD2tNAfmqDji9Xh8ifYJy0JfHaKr2wtXY7kgr1Fbbz+vTDbLkKy7oBH+yyDJRIK7
 Y9Ww==
X-Gm-Message-State: APjAAAWMBZgjrqtKCQMB5hpmBatrnoHPfhReMEEYl8V4RmrwL2+buUaL
 5GNCn8mA11Wcy5DT+w5RMyM=
X-Google-Smtp-Source: APXvYqwLhSBt4MHodunA12ZJ4ZkVWkxRKGvHezgwEV5gjv9/Oag3A1y057CeAUk+IRolbEUx7Az53A==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr766192wmg.92.1576525695695; 
 Mon, 16 Dec 2019 11:48:15 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:2450:10d2:194d:5015:4c4c:42e9:e517])
 by smtp.gmail.com with ESMTPSA id c4sm459672wml.7.2019.12.16.11.48.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Dec 2019 11:48:15 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: jgross@suse.com
Date: Mon, 16 Dec 2019 20:48:03 +0100
Message-Id: <20191216194803.6294-1-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
In-Reply-To: <2ad62cc8-ae78-6087-f277-923dc076383a@suse.com>
Subject: Re: [Xen-devel] [PATCH v10 2/4] xen/blkback: Squeeze page pools if
 a memory pressure is detected
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
Cc: axboe@kernel.dk, sj38.park@gmail.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gb24sIDE2IERlYyAyMDE5IDE3OjIzOjQ0ICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgoK
PiBPbiAxNi4xMi4xOSAxNzoxNSwgU2VvbmdKYWUgUGFyayB3cm90ZToKPiA+IE9uIE1vbiwgMTYg
RGVjIDIwMTkgMTU6Mzc6MjAgKzAxMDAgU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5jb20+
IHdyb3RlOgo+ID4gCj4gPj4gT24gTW9uLCAxNiBEZWMgMjAxOSAxMzo0NToyNSArMDEwMCBTZW9u
Z0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmNvbT4gd3JvdGU6Cj4gPj4KPiA+Pj4gRnJvbTogU2Vv
bmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPiA+Pj4KPiA+IFsuLi5dCj4gPj4+IC0tLSBh
L2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMKPiA+Pj4gKysrIGIvZHJpdmVycy9i
bG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwo+ID4+PiBAQCAtODI0LDYgKzgyNCwyNCBAQCBzdGF0
aWMgdm9pZCBmcm9udGVuZF9jaGFuZ2VkKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsCj4gPj4+
ICAgfQo+ID4+PiAgIAo+ID4+PiAgIAo+ID4+PiArLyogT25jZSBhIG1lbW9yeSBwcmVzc3VyZSBp
cyBkZXRlY3RlZCwgc3F1ZWV6ZSBmcmVlIHBhZ2UgcG9vbHMgZm9yIGEgd2hpbGUuICovCj4gPj4+
ICtzdGF0aWMgdW5zaWduZWQgaW50IGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zID0gMTA7Cj4g
Pj4+ICttb2R1bGVfcGFyYW1fbmFtZWQoYnVmZmVyX3NxdWVlemVfZHVyYXRpb25fbXMsCj4gPj4+
ICsJCWJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zLCBpbnQsIDA2NDQpOwo+ID4+PiArTU9EVUxF
X1BBUk1fREVTQyhidWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcywKPiA+Pj4gKyJEdXJhdGlvbiBp
biBtcyB0byBzcXVlZXplIHBhZ2VzIGJ1ZmZlciB3aGVuIGEgbWVtb3J5IHByZXNzdXJlIGlzIGRl
dGVjdGVkIik7Cj4gPj4+ICsKPiA+Pj4gKy8qCj4gPj4+ICsgKiBDYWxsYmFjayByZWNlaXZlZCB3
aGVuIHRoZSBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQuCj4gPj4+ICsgKi8KPiA+Pj4gK3N0
YXRpYyB2b2lkIHJlY2xhaW1fbWVtb3J5KHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpCj4gPj4+
ICt7Cj4gPj4+ICsJc3RydWN0IGJhY2tlbmRfaW5mbyAqYmUgPSBkZXZfZ2V0X2RydmRhdGEoJmRl
di0+ZGV2KTsKPiA+Pj4gKwo+ID4+PiArCWJlLT5ibGtpZi0+YnVmZmVyX3NxdWVlemVfZW5kID0g
amlmZmllcyArCj4gPj4+ICsJCW1zZWNzX3RvX2ppZmZpZXMoYnVmZmVyX3NxdWVlemVfZHVyYXRp
b25fbXMpOwo+ID4+Cj4gPj4gVGhpcyBjYWxsYmFjayBtaWdodCByYWNlIHdpdGggJ3hlbl9ibGti
a19wcm9iZSgpJy4gIFRoZSByYWNlIGNvdWxkIHJlc3VsdCBpbgo+ID4+IF9fTlVMTCBkZXJlZmVy
ZW5jaW5nX18sIGFzICd4ZW5fYmxrYmtfcHJvYmUoKScgc2V0cyAnLT5ibGtpZicgYWZ0ZXIgaXQg
bGlua3MKPiA+PiAnYmUnIHRvIHRoZSAnZGV2Jy4gIFBsZWFzZSBfZG9uJ3QgbWVyZ2VfIHRoaXMg
cGF0Y2ggbm93IQo+ID4+Cj4gPj4gSSB3aWxsIGRvIG1vcmUgdGVzdCBhbmQgc2hhcmUgcmVzdWx0
cy4gIE1lYW53aGlsZSwgaWYgeW91IGhhdmUgYW55IG9waW5pb24sCj4gPj4gcGxlYXNlIGxldCBt
ZSBrbm93LgoKSSByZWR1Y2VkIHN5c3RlbSBtZW1vcnkgYW5kIGF0dGFjaGVkIGJ1bmNoIG9mIGRl
dmljZXMgaW4gc2hvcnQgdGltZSBzbyB0aGF0Cm1lbW9yeSBwcmVzc3VyZSBvY2N1cnMgd2hpbGUg
ZGV2aWNlIGF0dGFjaG1lbnRzIGFyZSBvbmdvaW5nLiAgVW5kZXIgdGhpcwpjaXJjdW1zdGFuY2Us
IEkgd2FzIGFibGUgdG8gc2VlIHRoZSByYWNlLgoKPiA+IAo+ID4gTm90IG9ubHkgJy0+YmxraWYn
LCBidXQgJ2JlJyBpdHNlbGYgYWxzbyBjb3VsZSBiZSBhIE5VTEwuICBBcyBzaW1pbGFyCj4gPiBj
b25jdXJyZW5jeSBpc3N1ZXMgY291bGQgYmUgaW4gb3RoZXIgZHJpdmVycyBpbiB0aGVpciB3YXks
IEkgc3VnZ2VzdCB0byBjaGFuZ2UKPiA+IHRoZSByZWNsYWltIGNhbGxiYWNrICgnLT5yZWNsYWlt
X21lbW9yeScpIHRvIGJlIGNhbGxlZCBmb3IgZWFjaCBkcml2ZXIgaW5zdGVhZAo+ID4gb2YgZWFj
aCBkZXZpY2UuICBUaGVuLCBlYWNoIGRyaXZlciBjb3VsZCBiZSBhYmxlIHRvIGRlYWwgd2l0aCBp
dHMgY29uY3VycmVuY3kKPiA+IGlzc3VlcyBieSBpdHNlbGYuCj4gCj4gSG1tLCBJIGRvbid0IGxp
a2UgdGhhdC4gVGhpcyB3b3VsZCBuZWVkIHRvIGJlIGNoYW5nZWQgYmFjayBpbiBjYXNlIHdlCj4g
YWRkIHBlci1ndWVzdCBxdW90YS4KCkV4dGVuZGluZyB0aGlzIGNhbGxiYWNrIGluIHRoYXQgd2F5
IHdvdWxkIGJlIHN0aWxsIG5vdCB0b28gaGFyZC4gIFdlIGNvdWxkIHVzZQp0aGUgYXJndW1lbnQg
dG8gdGhlIGNhbGxiYWNrLiAgSSB3b3VsZCBrZWVwIHRoZSBhcmd1bWVudCBvZiB0aGUgY2FsbGJh
Y2sgdG8KJ3N0cnVjdCBkZXZpY2UgKicgYXMgaXMsIGFuZCB3aWxsIGFkZCBhIGNvbW1lbnQgc2F5
aW5nICdOVUxMJyB2YWx1ZSBvZiB0aGUKYXJndW1lbnQgbWVhbnMgZXZlcnkgZGV2aWNlcy4gIEFz
IGFuIGV4YW1wbGUsIHhlbmJ1cyB3b3VsZCBwYXNzIE5VTEwtZW5kaW5nCmFycmF5IG9mIHRoZSBk
ZXZpY2UgcG9pbnRlcnMgdGhhdCBuZWVkIHRvIGZyZWUgaXRzIHJlc291cmNlcy4KCkFmdGVyIHNl
ZWluZyB0aGlzIHJhY2UsIEkgYW0gbm93IGFsc28gdGhpbmtpbmcgaXQgY291bGQgYmUgYmV0dGVy
IHRvIGRlbGVnYXRlCmRldGFpbGVkIGNvbnRyb2wgb2YgZWFjaCBkZXZpY2UgdG8gaXRzIGRyaXZl
ciwgYXMgc29tZSBkcml2ZXJzIGhhdmUgc29tZQpjb21wbGljYXRlZCBhbmQgdW5pcXVlIHJlbGF0
aW9uIHdpdGggaXRzIGRldmljZXMuCgo+IAo+IFdvdWxkbid0IGEgZ2V0X2RldmljZSgpIGJlZm9y
ZSBjYWxsaW5nIHRoZSBjYWxsYmFjayBhbmQgYSBwdXRfZGV2aWNlKCkKPiBhZnRlcndhcmRzIGF2
b2lkIHRoYXQgcHJvYmxlbT8KCkkgZGlkbid0IHVzZWQgdGhlIHJlZmVyZW5jZSBjb3VudCBtYW5p
cHVsYXRpb24gb3BlcmF0aW9ucyBiZWNhdXNlIG90aGVyIHNpbWlsYXIKcGFydHMgYWxzbyBkaWRu
J3QuICBCdXQsIGlmIHRoZXJlIGlzIG5vIGltcGxpY2l0IHJlZmVyZW5jZSBjb3VudCBndWFyYW50
ZWUsIGl0CnNlZW1zIHRob3NlIG9wZXJhdGlvbnMgYXJlIGluZGVlZCBuZWNlc3NhcnkuCgpUaGF0
IHNhaWQsIGFzIGdldC9wdXQgb3BlcmF0aW9ucyBvbmx5IGFkanVzdCB0aGUgcmVmZXJlbmNlIGNv
dW50LCB0aG9zZSB3aWxsCm5vdCBtYWtlIHRoZSBjYWxsYmFjayB0byB3YWl0IHVudGlsIHRoZSBs
aW5raW5nIG9mIHRoZSAnYmFja2VuZCcgYW5kICdibGtpZicgdG8KdGhlIGRldmljZSAoeGVuX2Js
a2JrX3Byb2JlKCkpIGlzIGZpbmlzaGVkLiAgVGh1cywgdGhlIHJhY2UgY291bGQgc3RpbGwgaGFw
cGVuLgpPciwgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KCkkgYWxzbyBtb2RpZmllZCB0aGUgY29k
ZSB0byBkbyAnZ2V0X2RldmljZSgpJyBhbmQgJ3B1dF9kZXZpY2UoKScgYXMgeW91CnN1Z2dlc3Rl
ZCBhbmQgZGlkIHRlc3QsIGJ1dCB0aGUgcmFjZSB3YXMgc3RpbGwgcmVwcm9kdWNpYmxlLgoKClRo
YW5rcywKU2VvbmdKYWUgUGFyawoKPiAKPiAKPiBKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
