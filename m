Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDCB184726
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 13:46:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCjeo-0007ej-Re; Fri, 13 Mar 2020 12:43:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R6XP=46=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jCjen-0007ee-56
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 12:43:17 +0000
X-Inumbo-ID: 3508f0b3-6528-11ea-b2e6-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3508f0b3-6528-11ea-b2e6-12813bfff9fa;
 Fri, 13 Mar 2020 12:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584103396;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ngwuCnlDfHMwZsTLL4jLLbo6wnMPWPi1R40/YqC9O3M=;
 b=ho15f3p0aIB7+NwBZKf9MQl2ykoGS7QVK+0QH9NKgD6hTRyluCjwA0Hj
 kE3U4tiuZ8mKH3Z/wERbYn6AZwJSVdvryh13zTyJDwPwJTVI18x9lOw6T
 evbsfc3KyA4Q7pkOTIowRrH0arxScZ45anPl03p7XJD/WOHpbakVHUMiD E=;
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
IronPort-SDR: SKGr3YpzN31gyM5awchwdvyqzyBQeY8tQaxZLmcxgiQ1IAXLnXBPuDyCXOASUpycKt6CQngoiV
 teb6iuEEjhiuQYB0W4uEFpBi9O5PY64mnUDmqQw9pBXUmLYb9a2oyifZ5apz90hMbLOcosNeF7
 LOWP59gX28wz4JQZYeeQ5w4M9S/on3gy9kduNsnpub3ZSdEyhxcPd6QeEISvpMMnT6qXFLvHLR
 rNINYIDR7SxCKtvkZ9I2Zqk9/hoMbAZqqKPAz7GqkHzWsvBHI3TZZVNK/g3rlCEgZ76qlEPXyz
 oj8=
X-SBRS: 2.7
X-MesageID: 13888774
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,548,1574139600"; d="scan'208";a="13888774"
To: Jan Beulich <jbeulich@suse.com>
References: <1583863578-18063-1-git-send-email-igor.druzhinin@citrix.com>
 <681ec79d-a0ce-0066-7100-0867e2f06214@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <8d2b77a5-d15f-c213-b3d0-14d38636f4c0@citrix.com>
Date: Fri, 13 Mar 2020 12:42:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <681ec79d-a0ce-0066-7100-0867e2f06214@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] x86/cpu: Sync any remaining RCU
 callbacks before CPU up/down
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
Cc: jgross@suse.com, sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMDMvMjAyMCAxMToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTAuMDMuMjAyMCAx
OTowNiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IER1cmluZyBDUFUgZG93biBvcGVyYXRpb24g
UkNVIGNhbGxiYWNrcyBhcmUgc2NoZWR1bGVkIHRvIGZpbmlzaAo+PiBvZmYgc29tZSBhY3Rpb25z
IGxhdGVyIGFzIHNvb24gYXMgQ1BVIGlzIGZ1bGx5IGRlYWQgKHRoZSBzYW1lIGFwcGxpZXMKPj4g
dG8gQ1BVIHVwIG9wZXJhdGlvbiBpbiBjYXNlIGVycm9yIHBhdGggaXMgdGFrZW4pLiBJZiBpbiB0
aGUgc2FtZSBncmFjZQo+PiBwZXJpb2QgYW5vdGhlciBDUFUgdXAgb3BlcmF0aW9uIGlzIHBlcmZv
cm1lZCBvbiB0aGUgc2FtZSBDUFUsIFJDVSBjYWxsYmFjawo+PiB3aWxsIGJlIGNhbGxlZCBsYXRl
ciBvbiBhIENQVSBpbiBhIHBvdGVudGlhbGx5IHdyb25nIChhbHJlYWR5IHVwIGFnYWluCj4+IGlu
c3RlYWQgb2Ygc3RpbGwgYmVpbmcgZG93bikgc3RhdGUgbGVhZGluZyB0byBldmVudHVhbCBzdGF0
ZSBpbmNvbnNpc3RlbmN5Cj4+IGFuZC9vciBjcmFzaC4KPj4KPj4gSW4gb3JkZXIgdG8gYXZvaWQg
aXQgLSBmbHVzaCBSQ1UgY2FsbGJhY2tzIGV4cGxpY2l0bHkgYmVmb3JlIHN0YXJ0aW5nIHRoZQo+
PiBuZXh0IENQVSB1cC9kb3duIG9wZXJhdGlvbi4KPj4KPj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4g
PGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4+IC0tLQo+PiBUaGlzIGdvdCBkaXNjb3ZlcmVk
IHRyeWluZyB0byByZXN1bWUgUFYgc2hpbSB3aXRoIG11bHRpcGxlIHZDUFVzIG9uIEFNRAo+PiBt
YWNoaW5lICh3aGVyZSBwYXJrX29mZmxpbmVfY3B1cyA9PSAwKS4gUkNVIGNhbGxiYWNrIHJlc3Bv
bnNpYmxlIGZvcgo+PiBmcmVlaW5nIHBlcmNwdSBhcmVhIG9uIENQVSBvZmZsaW5lIGdvdCBmaW5h
bGx5IGNhbGxlZCBhZnRlciBDUFUgd2VudAo+PiBvbmxpbmUgYWdhaW4gYXMgdGhlIGd1ZXN0IHBl
cmZvcm1lZCByZWd1bGFyIHZDUFUgb2ZmbGluZS9vbmxpbmUgb3BlcmF0aW9ucwo+PiBvbiByZXN1
bWUuCj4+Cj4+IE5vdGU6IHRoaXMgcGF0Y2ggcmVxdWlyZXMgUkNVIHNlcmllcyB2NCBmcm9tIEp1
ZXJnZW4gdG8gYmUgYXBwbGllZCAtCj4+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJj
aGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMC0wMy9tc2cwMDY2OC5odG1sCj4gCj4gSSB3YXMgYWJv
dXQgdG8gYXBwbHkgdGhlIHBhdGNoIHllc3RlcmRheSAoSSB0aGluaykgd2hlbiBJIHN0dW1ibGVk
Cj4gYWNyb3NzIHRoaXMgbm90ZS4gSXMgdGhpcyBhY3R1YWxseSBzdGlsbCB0cnVlPyBJZiBzbywg
d291bGQgeW91Cj4gbWluZCBoZWxwaW5nIG1lIHNlZSB0aGUgZGVwZW5kZW5jeT8KClllcywgdGhh
dCdzIHRoZSBjYXNlIG90aGVyd2lzZSB5b3UncmUgcmlza2luZyB0byBjcmFzaCBuZWFyIDEwMCUg
b2YKaW5zdGFsbGF0aW9ucyBhcyByY3VfYmFycmlyZXIgd2l0aG91dCBKdWVyZ2VuJ3MgZml4ZXMg
aXMgc2ltcGx5IGJyb2tlbi4KCklnb3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
