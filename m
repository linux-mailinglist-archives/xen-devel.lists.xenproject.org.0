Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EE21736D9
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:11:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7eT3-0007Lm-4I; Fri, 28 Feb 2020 12:10:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7eT1-0007FM-86
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:10:07 +0000
X-Inumbo-ID: 41cf2970-5a23-11ea-b0f0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41cf2970-5a23-11ea-b0f0-bc764e2007e4;
 Fri, 28 Feb 2020 12:10:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 091CFB28A;
 Fri, 28 Feb 2020 12:10:06 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200228120753.38036-1-roger.pau@citrix.com>
 <20200228120753.38036-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b683f84-ab8a-9968-4e83-385489d5649f@suse.com>
Date: Fri, 28 Feb 2020 13:10:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228120753.38036-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 1/2] x86/smp: use a dedicated CPU mask in
 send_IPI_mask
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
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxMzowNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFNvbWUgY2FsbGVy
cyBvZiBzZW5kX0lQSV9tYXNrIHBhc3MgdGhlIHNjcmF0Y2ggY3B1bWFzayBhcyB0aGUgbWFzawo+
IHBhcmFtZXRlciBvZiBzZW5kX0lQSV9tYXNrLCBzbyB0aGUgc2NyYXRjaCBjcHVtYXNrIGNhbm5v
dCBiZSB1c2VkIGJ5Cj4gdGhlIGZ1bmN0aW9uLiBUaGUgZm9sbG93aW5nIHRyYWNlIGhhcyBiZWVu
IG9idGFpbmVkIHdpdGggYSBkZWJ1ZyBwYXRjaAo+IGFuZCBzaG93cyBvbmUgb2YgdGhvc2UgY2Fs
bGVyczoKPiAKPiAoWEVOKSBzY3JhdGNoIENQVSBtYXNrIGFscmVhZHkgaW4gdXNlIGJ5IGFyY2gv
eDg2L21tLmMjX2dldF9wYWdlX3R5cGUrMHgxZjkvMHgxYWJmCj4gKFhFTikgWGVuIEJVRyBhdCBz
bXAuYzo0NQo+IFsuLi5dCj4gKFhFTikgWGVuIGNhbGwgdHJhY2U6Cj4gKFhFTikgICAgWzxmZmZm
ODJkMDgwMmFiYjUzPl0gUiBzY3JhdGNoX2NwdW1hc2srMHhkMy8weGY5Cj4gKFhFTikgICAgWzxm
ZmZmODJkMDgwMmFiYzIxPl0gRiBzZW5kX0lQSV9tYXNrKzB4NzIvMHgxY2EKPiAoWEVOKSAgICBb
PGZmZmY4MmQwODAyYWMxM2U+XSBGIGZsdXNoX2FyZWFfbWFzaysweDEwYy8weDE2Ywo+IChYRU4p
ICAgIFs8ZmZmZjgyZDA4MDI5NmM1Nj5dIEYgYXJjaC94ODYvbW0uYyNfZ2V0X3BhZ2VfdHlwZSsw
eDNmZi8weDFhYmYKPiAoWEVOKSAgICBbPGZmZmY4MmQwODAyOTgzMjQ+XSBGIGdldF9wYWdlX3R5
cGUrMHhlLzB4MmMKPiAoWEVOKSAgICBbPGZmZmY4MmQwODAzODYyNGY+XSBGIHB2X3NldF9nZHQr
MHhhMS8weDJhYQo+IChYRU4pICAgIFs8ZmZmZjgyZDA4MDI3ZGZkNj5dIEYgYXJjaF9zZXRfaW5m
b19ndWVzdCsweDExOTYvMHgxNmJhCj4gKFhFTikgICAgWzxmZmZmODJkMDgwMjA3YTU1Pl0gRiBk
ZWZhdWx0X2luaXRpYWxpc2VfdmNwdSsweGM3LzB4ZDQKPiAoWEVOKSAgICBbPGZmZmY4MmQwODAy
N2U1NWI+XSBGIGFyY2hfaW5pdGlhbGlzZV92Y3B1KzB4NjEvMHhjZAo+IChYRU4pICAgIFs8ZmZm
ZjgyZDA4MDIwN2U3OD5dIEYgZG9fdmNwdV9vcCsweDIxOS8weDY5MAo+IChYRU4pICAgIFs8ZmZm
ZjgyZDA4MDM4YmUxNj5dIEYgcHZfaHlwZXJjYWxsKzB4MmY2LzB4NTkzCj4gKFhFTikgICAgWzxm
ZmZmODJkMDgwMzk2NDMyPl0gRiBsc3Rhcl9lbnRlcisweDExMi8weDEyMAo+IAo+IF9nZXRfcGFn
ZV90eXBlIHdpbGwgdXNlIHRoZSBzY3JhdGNoIGNwdW1hc2sgdG8gY2FsbCBmbHVzaF90bGJfbWFz
aywKPiB3aGljaCBpbiB0dXJuIGNhbGxzIHNlbmRfSVBJX21hc2suCj4gCj4gRml4IHRoaXMgYnkg
dXNpbmcgYSBkZWRpY2F0ZWQgcGVyIENQVSBjcHVtYXNrIGluIHNlbmRfSVBJX21hc2suCj4gCj4g
Rml4ZXM6IDU1MDBkMjY1YTJhOCAoJ3g4Ni9zbXA6IHVzZSBBUElDIEFMTEJVVCBkZXN0aW5hdGlv
biBzaG9ydGhhbmQgd2hlbiBwb3NzaWJsZScpCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
