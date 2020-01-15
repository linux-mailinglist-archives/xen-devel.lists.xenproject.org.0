Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5078C13C1A3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 13:50:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iri5D-00008U-KX; Wed, 15 Jan 2020 12:47:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OV/N=3E=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iri5B-00008K-BE
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 12:47:37 +0000
X-Inumbo-ID: 2fef8778-3795-11ea-ac27-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fef8778-3795-11ea-ac27-bc764e2007e4;
 Wed, 15 Jan 2020 12:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579092449;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=b1Rw5W+jtssCD2h9WoGREQzuS8xK+3tC/oou/pyyI1I=;
 b=JzZ5gquZDKYThZARCs5eEaRxB2TmpZMeyl5FGagtm3SFuHPv1lTCqUFA
 d1VKXOpCEbAa0YcGxvqOetoUFfCSV883B/6JIIDFHqUird2n45opXcY8w
 +/GytigC7eveHrvmp5lQvNTD/bd8jiQMYcuPhxZybaFTvlZ9axe/bvwMN Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C/NDqzYyRi6gvkWR6U0/We0ewPr2qKvsPB4QxYAn4lPtg53GU9pD5xEJAvxXvhXq7bh9hlDypv
 egqL5Rh3A3P3Dd90Pt4eE1SxQLlMw717FabgEkPB68nO/haMxmrQOv9S9Grv/q6TgOwD44rCin
 5UfTI9cY9deU6DNmYDhonrVzukjTK2ROKHhUZqlNsVzW1aZJrut+g3NEakqlrvpv5qIyiMURwS
 Ochsc3+TGOvY1tKRD0p8tfq33Ki5PQjIb9ywnLWJ6DX0gvuv9MQ3GHv6Qta8krUkHV4UDzELN8
 vAE=
X-SBRS: 2.7
X-MesageID: 10936225
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="10936225"
To: Jan Beulich <jbeulich@suse.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <7938484e-14a0-8edf-635b-15b05af6dace@suse.com>
 <6f6064f9-5400-3d85-75c5-b63ca460383d@citrix.com>
 <7951674e-1b8a-03b0-00b9-e7d7fe7eb10c@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <b8b5f2f3-74ab-d874-5f11-de4d5a9ec941@citrix.com>
Date: Wed, 15 Jan 2020 12:47:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7951674e-1b8a-03b0-00b9-e7d7fe7eb10c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDEvMjAyMCAxMjozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTUuMDEuMjAyMCAx
MzoyOCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDE1LzAxLzIwMjAgMTE6MzIsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4gT24gMTQuMDEuMjAyMCAyMDozNiwgSWdvciBEcnV6aGluaW4gd3Jv
dGU6Cj4+Pj4gSWYgSVRTQyBpcyBub3QgYXZhaWxhYmxlIG9uIENQVSAoZS5nIGlmIHJ1bm5pbmcg
bmVzdGVkIGFzIFBWIHNoaW0pCj4+Pj4gdGhlbiBYODZfRkVBVFVSRV9OT05TVE9QX1RTQyBpcyBu
b3QgYWR2ZXJ0aXNlZCBpbiBjZXJ0YWluIGNhc2VzLCBpLmUuCj4+Pj4gYWxsIEFNRCBhbmQgc29t
ZSBvbGQgSW50ZWwgcHJvY2Vzc29ycy4gSW4gd2hpY2ggY2FzZSBUU0Mgd291bGQgbmVlZCB0bwo+
Pj4+IGJlIHJlc3RvcmVkIG9uIENQVSBmcm9tIHBsYXRmb3JtIHRpbWUgYnkgWGVuIHVwb24gZXhp
dGluZyBkZWVwIEMtc3RhdGVzLgo+Pj4KPj4+IEhvdyBkb2VzIHdha2luZyBmcm9tIGRlZXAgQyBz
dGF0ZXMgY29ycmVzcG9uZCB0byB0aGUgUFYgc2hpbT8gSSBub3RpY2UKPj4+IHRoYXQgY3N0YXRl
X3Jlc3RvcmVfdHNjKCkgZ2V0cyBjYWxsZWQgaXJyZXNwZWN0aXZlIG9mIHRoZSBDIHN0YXRlIGJl
aW5nCj4+PiBleGl0ZWQsIHNvIEkgd29uZGVyIHdoZXRoZXIgdGhlcmUncyByb29tIGZvciBpbXBy
b3ZlbWVudCB0aGVyZQo+Pj4gaW5kZXBlbmRlbnQgb2YgdGhlIGlzc3VlIGF0IGhhbmQuIEFzIGZh
ciBhcyB0aGlzIGNoYW5nZSBpcyBjb25jZXJuZWQsCj4+PiBJIHRoaW5rIHlvdSB3YW50IHRvIGRy
b3AgdGhlIG5vdGlvbiBvZiAiZGVlcCIgZnJvbSB0aGUgZGVzY3JpcHRpb24uCj4+Cj4+IEknbSBu
b3QgZmFtaWxpYXIgd2l0aCB3aGF0IHRvIGNhbGwgImRlZXAgQy1zdGF0ZSIgc28gZm9yIG1lIGl0
IHdhcyBhbnl0aGluZwo+PiBoaWdoZXIgdGhhbiBDMS4gSWYgeW91IHByZWZlciAiZGVlcCIgdG8g
YmUgZHJvcHBlZCAtIHNvIGJlIGl0Lgo+IAo+ICJIaWdoZXIgdGhhbiBDMSIgbWF5IGJlIGZpbmUg
KGFsYmVpdCBJIHZhZ3VlbHkgcmVjYWxsIFRTQyBpc3N1ZXMKPiBzdGFydGluZyB3aXRoIEMzIG9u
bHkpLCBidXQgYXQgbGVhc3QgbXdhaXRfaWRsZSgpIGNhbGxzIHRoZQo+IGZ1bmN0aW9uIGV2ZW4g
Zm9yIEMxLiBBcyB0byB0aGUgUFYgc2hpbSAtIGRvZXMgaXQga25vdyBhYm91dCBhbnkKPiBDLXN0
YXRlcyBhdCBhbGwgKGJleW9uZCBITFQtaW52b2tlZCBDMSk/CgpZZXMsIFBWLXNoaW0ga25vd3Mg
YWJvdXQgQyBzdGF0ZXMgYXMgaXQgbG9va3MgdGhleSBhcmUgdGllZCB0bwpwcm9jZXNzb3IgSUQg
aW4gc29tZSBjYXNlcy4gRm9yIEFNRCBzcGVjaWZpY2FsbHkgQzIgaXMgSExULgoKSWdvcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
