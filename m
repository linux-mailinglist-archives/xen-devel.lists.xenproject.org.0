Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDC813B170
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 18:55:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irQLk-0004A1-3z; Tue, 14 Jan 2020 17:51:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cZ5I=3D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1irQLi-00049w-8R
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 17:51:30 +0000
X-Inumbo-ID: 7b8c454e-36f6-11ea-8419-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b8c454e-36f6-11ea-8419-12813bfff9fa;
 Tue, 14 Jan 2020 17:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579024285;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=2atrM/mt4ITehEkodAEfjORl3EA7k1dJM4J48SXGFp8=;
 b=ZpTMLpKbUteDXYIF53m8ONjK5OhMYXL5mP+CueRlyNhpJEvZ3m34d4uz
 0Q8LJtYVI6LYZ2B5U6gWeyo3hnFmp5qOjof+obok3P0RRISEKGnqgLykg
 fYibwaHN4QQs5VgULxBqLC44H5LKBRhjX9nfEkOQwhxuRy6ymFi2/abhz 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Uv5B0LGZ5pNn4DDZacqeqS3HxkIEy4KnhDBWEPzEqJsqoyeAO+Ku3IxDPW1oc/I9Y0Sz9fHn3h
 LXuZtkE/IQuqGyvf6cW3kBMkpZrQIqEdB8gCWB94VIwhD8IDP/4mUptDcwW6GKgKUwNBrQHuhJ
 gpVSYajscuY4H7sKL9CsqG3UtPmSUf96FFaI4SH58EQemWGwmCm6xNdC3ndN6atwENdB5lG9sV
 2zFhAe2UEWOYS8qJyHWuDEs5qVrJAm13248Q5AZtPkaZtqVKt/RPcSVMJF4+7KgRAKtbE9GHfX
 bqM=
X-SBRS: 2.7
X-MesageID: 11493536
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,319,1574139600"; d="scan'208";a="11493536"
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200103130616.13724-1-andrew.cooper3@citrix.com>
 <20200103130616.13724-6-andrew.cooper3@citrix.com>
 <24093.64337.28541.363727@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <bab3479b-4a58-0b9c-ad88-1973adae2e62@citrix.com>
Date: Tue, 14 Jan 2020 17:51:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <24093.64337.28541.363727@mariner.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 19/20] tools/libxl: Re-position CPUID
 handling during domain construction
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQvMDEvMjAyMCAxNzozMywgSWFuIEphY2tzb24gd3JvdGU6Cj4gQW5kcmV3IENvb3BlciB3
cml0ZXMgKCJbUEFUQ0ggMTkvMjBdIHRvb2xzL2xpYnhsOiBSZS1wb3NpdGlvbiBDUFVJRCBoYW5k
bGluZyBkdXJpbmcgZG9tYWluIGNvbnN0cnVjdGlvbiIpOgo+PiBDUFVJRCBoYW5kbGluZyBuZWVk
cyB0byBiZSBlYXJsaWVyIGluIGNvbnN0cnVjdGlvbi4gIE1vdmUgaXQgZnJvbSBpdHMgY3VycmVu
dAo+PiBwb3NpdGlvbiBpbiBsaWJ4bF9fYnVpbGRfcG9zdCgpIHRvIGxpYnhsX19idWlsZF9wcmUo
KSBmb3IgZnJlc2ggYnVpbGRzLCBhbmQKPj4gbGlieGxfX3NybV9jYWxsb3V0X2NhbGxiYWNrX3N0
YXRpY19kYXRhX2RvbmUoKSBmb3IgdGhlIG1pZ3JhdGlvbi9yZXN1bWUgY2FzZS4KPj4KPj4gSW4g
dGhlIG1pZ3JhdGlvbiBjYXNlLCB0YWtlIGFjY291bnQgb2YgWEdSX1NERF9NSVNTSU5HX0NQVUlE
Lgo+IElzIGl0IHBvc3NpYmxlIHRvIHNwbGl0IG91dCB0aGUgY2hhbmdlIHRvIHRoZSBzZXF1ZW5j
aW5nLCBmcm9tIHRoZSBuZXcKPiBmdW5jdGlvbmFsaXR5ID8KCk5vdCBlYXNpbHksIG5vLgoKV2hp
bGUgbGlieGMgaXMgZGlzY2FyZGluZyB0aGUgQ1BVSUQgcmVjb3JkLCBsaWJ4bCBuZWVkcyB0byBt
YWtlIHRoZQpjYWxscyB1bmNvbmRpdGlvbmFsbHkgZm9yIFZNcyB0byBmdW5jdGlvbi4KCklmIHlv
dSByZWNhbGwsIGFuIGVhcmx5IHBhdGNoIGluIHRoZSBzZXJpZXMgbGVhdmVzIGEgdG9kbyBpbiBs
aWJ4Ywood2hpY2ggaXMgdGhlcmUgZm9yIHRoaXMgdmVyeSBiaXNlY3Rpb24gcmVhc29uKSwgd2hp
Y2ggcGFzc2VzClhHUl9TRERfTUlTU0lOR19DUFVJRCBiYWNrIHVuY29uZGl0aW9uYWxseSAobWFr
aW5nIHRoaXMgcGF0Y2ggYWxvbmUKZWZmZWN0aXZlbHkgbm8gbmV0IGNoYW5nZSkuCgpBIHN1YnNl
cXVlbmNlIHBhdGNoIG1ha2VzIHRoZSBwYXNzaW5nIG9mIFhHUl9TRERfTUlTU0lOR19DUFVJRApj
b25kaXRpb25hbCBvbiB0aGUgY29udGVudCBpbiB0aGUgc3RyZWFtLCBub3cgdGhhdCB3ZSBhcmUg
bm8gbG9uZ2VyCmRpc2NhcmRpbmcgdGhlIENQVUlEIHJlY29yZHMgZm91bmQuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
