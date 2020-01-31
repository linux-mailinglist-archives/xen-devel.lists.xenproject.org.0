Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4348414E756
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 04:05:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixMZe-0001SM-83; Fri, 31 Jan 2020 03:02:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HO0L=3U=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1ixMZb-0001SH-Rf
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 03:02:23 +0000
X-Inumbo-ID: 19f645c2-43d6-11ea-8b67-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19f645c2-43d6-11ea-8b67-12813bfff9fa;
 Fri, 31 Jan 2020 03:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580439743;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5h/WH7p7SDL/qqPnjEhzXEkztLzxkEjb8YQUa+MdhCE=;
 b=F19ZLa74zSuVENJTMx9fBX4aCjCteeyolLeHs4r8fbPB/BEk7HRfygLc
 PP+z/HoCwE+pIYzwpEVNt/wrBG/C3hlmHPCbBubI9KAL/6dCDG3HbcqHU
 HxjVjTntq+zOYRL7bzio8Mqdi/4kv4+Jr8Rd6QUIfhSsli+8FMZnfKh+Y k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WiW1svYsFMtyHRTDezcaoctod0Jz+GdUNf6OUw3QesbDdTmUvrxzzwKF6NxGPytXTVzPojIHqi
 gGfV1pkpbxUag2sI9G+DhAxERXv0nOh9tqTEEE/uM827SCdZo++Vr727TPSGwtY45AXHouJCg1
 RDRGSrtxX7/shUr0mX9yr8mMhzaSdsbgtyVjMHfnTzzj2+Ua5rJ0FzoXInOTWxB4wVtdXs3Na+
 u+44+ao5C3xQCIUR9UC+Yoe7BgA9iYUMKCid8kj2DGYsw616gp8doaxEEHA+r2fecWDA62uOhQ
 o04=
X-SBRS: 2.7
X-MesageID: 11893447
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,384,1574139600"; d="scan'208";a="11893447"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
References: <9a84d6bd-2aa0-e97f-a517-3c51aabdfe27@citrix.com>
Message-ID: <b898ca9e-d1dd-5091-d182-a3b0c5a7f88e@citrix.com>
Date: Fri, 31 Jan 2020 03:02:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9a84d6bd-2aa0-e97f-a517-3c51aabdfe27@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen clocksource and PV shim
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDEvMjAyMCAyMzoxNCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gSSB3YXMgZGVidWdn
aW5nIGNvbnN0YW50IGZyZWV6ZXMgb2YgUFYgc2hpbSBvbiBBTUQgaGFyZHdhcmUKPiBhZnRlciBn
b2luZyBvdXQgb2YgYSBsb25nIHN1c3BlbmQuIEFzIGl0IHR1cm5lZCBvdXQgdGhlIHJvb3QgY2F1
c2UKPiBvZiB0aGlzIGlzIHBsYXRmb3JtIHRpbWUganVtcGluZyBmb3J3YXJkIHRvIHRoZSBhbW91
bnQgb2YgdGltZQo+IHNwZW50IGluIHN1c3BlbmRlZCBzdGF0ZS4gT24gSW50ZWwgdGhpcyBpc3N1
ZSBpcyBwYXBlcmVkIG92ZXIKPiBieSBDT05TVEFOVF9UU0MgYmVpbmcgc2V0IHdoaWNoIGF2b2lk
cyBDUFUgdGltZSBzeW5jIHdpdGgKPiBwbGF0Zm9ybSB0aW1lLgo+IAo+IFVwb24gZnVydGhlciBl
eGFtaW5hdGlvbiBpdCBhcHBlYXJzIHRoYXQganVtcGluZyBpcyBiYWtlZAo+IGludG8gdGhlIGlt
cGxlbWVudGF0aW9uIG9mIEwwIFhlbiBhbmQgdGhlcmUgaXMgbm8gc2VlbWluZ2x5Cj4gc3RyYWln
aHQgZm9yd2FyZCB3YXkgdG8gZXh0cmFjdCBzdGFibGUgY29udGludW91cyByYXRlIG91dAo+IG9m
IHdoYXQgd2UgaGF2ZS4KPiAKPiBJIGV4cGVjdCB0aGlzIGlzIGEga25vd24gaXNzdWUgd2l0aCBY
ZW4gUFYgY2xvY2sgYXMgSSBmb3VuZAo+IHRoaXMgYWxtb3N0IGltbWVkaWF0ZWx5OiBodHRwczov
L3dpa2kuZGViaWFuLm9yZy9YZW4vQ2xvY2tzb3VyY2UKPiBDdXJyZW50bHkgSSBkb24ndCB1bmRl
cnN0YW5kIGhvdyBpbiB0aGF0IGNhc2UgWGVuIGNsb2NrIHNvdXJjZQo+IGNvdWxkIGJlIHN1aXRh
YmxlIGFzIGEgcGxhdGZvcm0gdGltZXIgZm9yIG5lc3RlZCBYZW4uCj4gCj4gSXMgbXkgdW5kZXJz
dGFuZGluZyBvZiB0aGUgc2l0dWF0aW9uIGNvcnJlY3Q/IENvdWxkIGl0IGJlCj4gZml4ZWQgaW4g
TDAgWGVuIG9yIGl0J3MgYWxyZWFkeSBiYWNrZWQgaW50byB0aGUgQUJJPyBTaG91bGQKPiB3ZSBr
ZWVwIFhlbiBwbGF0Zm9ybSB0aW1lciBpbiB0aGUgc291cmNlIGNvZGUgdGhlbj8gRG9lcyB1c2lu
Zwo+IGFsdGVybmF0aXZlIGNsb2NrIHNvdXJjZSBmb3IgUFYgc2hpbSBtYWtlIHNlbnNlPwoKLi4u
IE9rLCBJIHNlZW0gdG8gZ2V0IGxvc3QgaW4gdGhlIHdlZWRzIG9mIHRpbWVrZWVwaW5nIGNvZGUg
LQpwbGF0Zm9ybSB0aW1lciBpbmZyYXN0cnVjdHVyZSBpcyBhbHJlYWR5IHByZXBhcmVkIGZvciB0
aGlzIHNvcnQKb2Ygc2NlbmFyaW8gd2hpbGUgZXhpdGluZyBTMy4gSSBqdXN0IG5lZWQgdG8gY2Fs
bCByZXN1bWVfcGxhdGZvcm1fdGltZXIoKQpmcm9tIGh5cGVydmlzb3JfcmVzdW1lKCkgb3Igc29t
ZXRoaW5nIHNpbWlsYXIuIFBhdGNoIHdpbGwgZm9sbG93LgoKQWx0aG91Z2ggSSdtIHN0aWxsIHB1
enpsZWQgd2h5IFhlbiBQViBjbG9jayBwcm92aWRlcyBzdWNoIGFuCnVuaW50dWl0aXZlIGRhdGEg
dG8gdGhlIGd1ZXN0LgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
