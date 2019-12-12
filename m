Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E96B711D945
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 23:22:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifWmZ-00046h-8B; Thu, 12 Dec 2019 22:18:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0+ak=2C=amazon.com=prvs=242c78905=elnikety@srs-us1.protection.inumbo.net>)
 id 1ifWmY-00046c-5a
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 22:18:02 +0000
X-Inumbo-ID: 4255b0d6-1d2d-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4255b0d6-1d2d-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 22:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576189082; x=1607725082;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=GcqI4fRL/aJDsyAABVvuFV8ZwAyt1olh/8wO5UrfH2k=;
 b=VI8vGmxo6rhylIefGx8GQhEqUk4r8k6LLY4NL7FsoY6UtjGtuhh428qb
 BFs2iTaYnuFdfHJbmvecVY3YFbXMR3U1cg+rHxrCXg8lT3m3NYUAPCspd
 0AkDgtX/WgMPnLdH4QRe/wwPCCarZ7Uv+PqlplCwLukKNKHvw6qSDGh69 8=;
IronPort-SDR: D56Z4fKmWHG/k6Y9KOI1eT2Ex7l3EvDmhUu44ynDfqxDWq9ONFrTYeL9FpZI69zDT60mSqitTG
 rtawF7juVpLA==
X-IronPort-AV: E=Sophos;i="5.69,307,1571702400"; d="scan'208";a="13240175"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 12 Dec 2019 22:17:22 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7D8F7A2B40; Thu, 12 Dec 2019 22:17:18 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 12 Dec 2019 22:17:17 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.160.109) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 12 Dec 2019 22:17:11 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <20191209084119.87563-1-elnikety@amazon.com>
 <09e75904-8faa-fbae-39ea-d9bd026ea4fa@suse.com>
 <1a17bb6d-6f32-280e-0d00-6d06f3520052@amazon.com>
 <0fe3d33f-b83c-4640-c999-fa773c0264a6@suse.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <22a03442-bdf7-8a20-ee21-d668cf2fa878@amazon.com>
Date: Thu, 12 Dec 2019 23:17:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <0fe3d33f-b83c-4640-c999-fa773c0264a6@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.109]
X-ClientProxiedBy: EX13D16UWC001.ant.amazon.com (10.43.162.117) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86/microcode: Support builtin CPU microcode
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMTkgMTA6NTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjEyLjIwMTkgMDA6
MTgsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+PiBPbiAxMC4xMi4xOSAxMDozNywgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+PiBPbiAwOS4xMi4yMDE5IDA5OjQxLCBFc2xhbSBFbG5pa2V0eSB3cm90ZToK
Pj4+PiAtLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPj4+PiArKysgYi9k
b2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPj4+PiBAQCAtMjExMyw3ICsyMTEzLDcg
QEAgbG9naWMgYXBwbGllczoKPj4+PiAgICAgICBhY3RpdmUgYnkgZGVmYXVsdC4KPj4+PiAgICAK
Pj4+PiAgICAjIyMgdWNvZGUgKHg4NikKPj4+PiAtPiBgPSBMaXN0IG9mIFsgPGludGVnZXI+IHwg
c2Nhbj08Ym9vbD4sIG5taT08Ym9vbD4gXWAKPj4+PiArPiBgPSBMaXN0IG9mIFsgPGludGVnZXI+
IHwgc2Nhbj08Ym9vbD4gfCBidWlsdGluPTxib29sPiwgbm1pPTxib29sPiBdYAo+Pj4KPj4+IERl
c3BpdGUgbXkgb3RoZXIgcXVlc3Rpb24gcmVnYXJkaW5nIHRoZSB1c2VmdWxuZXNzIG9mIHRoaXMg
YXMgYQo+Pj4gd2hvbGUgYSBmZXcgY29tbWVudHMuCj4+Pgo+Pj4gRG8gInNjYW4iIGFuZCAiYnVp
bHRpbiIgcmVhbGx5IG5lZWQgdG8gZXhjbHVkZSBlYWNoIG90aGVyPyBJLmUuCj4+PiBkb24ndCB5
b3UgbWVhbiAsIGluc3RlYWQgb2YgfCA/Cj4+IFRoZSB1c2VmdWwgY2FzZSBoZXJlIHdvdWxkIGJl
IHNwZWNpZnlpbmcgdWNvZGU9c2NhbixidWlsdGluIHdoaWNoIHdvdWxkCj4+IHRyYW5zbGF0ZSB0
byBmYWxsYmFjayBvbnRvIHRoZSBidWlsdGluIG1pY3JvY29kZSBpZiBhIHNjYW4gZmFpbHMuIElu
Cj4+IGZhY3QsIHRoaXMgaXMgYWxyZWFkeSB0aGUgY2FzZSBnaXZlbiB0aGUgaW1wbGVtZW50YXRp
b24gaW4gdjEuIEl0IHdpbGwKPj4gYmUgYmV0dGVyIHRvIGNsYXJpZnkgdGhpcyBzZW1hbnRpYyBi
eSBhbGxvd2luZyBzY2FuLGJ1aWx0aW4uCj4+Cj4+IE9uIHRoYXQgbm90ZSwgSSByZWFsbHkgc2Vl
IHRoZSAiPGludGVnZXI+IiBhbmQgInNjYW49PGJvb2w+IiB0byBiZQo+PiBlcXVhbC4gRm9sbG93
aW5nIHRoZSBsb2dpYyBlYXJsaWVyIHdlIHNob3VsZCBwcm9iYWJseSBhbHNvIGFsbG93Cj4+IHVj
b2RlPTxpbnRlZ2VyPixidWlsdGluLiBUaGlzIHRyYW5zbGF0ZXMgdG8gZmFsbGJhY2sgdG8gYnVp
bHRpbiBpZiB0aGVyZQo+PiBhcmUgbm8gbW9kdWxlcyBhdCBpbmRleCA8aW50ZWdlcj4uCj4gCj4g
QWxtb3N0IC0gaWYgdGhlIGJ1aWx0aW4gb25lIGlzIG5ld2VyIHRoYW4gdGhlIHNlcGFyYXRlIGJs
b2IsIHRoZW4KPiBlaXRoZXIgb2YgdGhlIGNtZGxpbmUgb3B0aW9ucyB5b3UgbmFtZSBzaG91bGQg
c3RpbGwgY2F1c2UgdGhlCj4gYnVpbHRpbiBvbmUgdG8gYmUgbG9hZGVkLiBJT1cgeW91IHdhbnQg
dG8gaG9ub3IgYm90aCBvcHRpb25zLCBub3QKPiBwcmVmZXIgdGhlIGVhcmxpZXIgb3ZlciBhIGxh
dGVyIG9uZS4KPiAKCk9uIHRoZSAibmV3ZXN0IG9mIGV2ZXJ5dGhpbmciOiBUaGF0J3Mgbm90IHdo
YXQgSSBpbnRlbmQgdG8gcHJvcG9zZS4gVGhlIAptaWNyb2NvZGUgcHJvdmlkZWQgdmlhIGEgc2Nh
biAob3IgPGludGVnZXI+IGZvciB0aGF0IG1hdHRlcikgd2lsbCBhbHdheXMgCm92ZXJyaWRlIHRo
ZSBidWlsdGluIG1pY3JvY29kZS4gVGhlIGNvbW1vbiBjYXNlIHdvdWxkIGJlIHRoYXQgdGhlIApt
aWNyb2NvZGUgcHJvdmlkZWQgdmlhIGEgc2NhbiAob3IgPGludGVnZXI+KSBpcyBuZXdlciB0aGFu
IHRoZSBidWlsdGluLiAKWWV0LCBhbiBhZG1pbmlzdHJhdG9yIHdpbGwgaGF2ZSB0aGUgb3B0aW9u
LCBpZiBuZWVkZWQsIHRvIHVzZSBhbiBvbGRlciAKbWljcm9jb2RlIHZpYSBhIHNjYW4gKG9yIDxp
bnRlZ2VyPikgdG8gb3ZlcnJpZGUgYSBuZXdlciBidWlsdGluIG1pY3JvY29kZS4KCgotLSBFc2xh
bQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
