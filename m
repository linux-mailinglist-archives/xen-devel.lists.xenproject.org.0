Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F4915FD4B
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2020 08:10:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2rWt-0005X7-OF; Sat, 15 Feb 2020 07:06:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZybC=4D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j2rWr-0005X2-EF
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2020 07:06:17 +0000
X-Inumbo-ID: a8607b2e-4fc1-11ea-aa99-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8607b2e-4fc1-11ea-aa99-bc764e2007e4;
 Sat, 15 Feb 2020 07:06:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D4ACAC79;
 Sat, 15 Feb 2020 07:06:15 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <20200211093527.6811-1-jgross@suse.com>
 <40df666d-246a-656a-94e5-00a85b9280fc@citrix.com>
 <f7397b04-80f2-1e2a-0899-427570f8f878@suse.com>
 <74d0b36a-4d80-39e1-aaf2-cf5209781e1e@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bd4b8fcc-6c70-4894-b356-3e97dae61470@suse.com>
Date: Sat, 15 Feb 2020 08:06:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <74d0b36a-4d80-39e1-aaf2-cf5209781e1e@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: make sure stop_machine_run() is always
 called in a tasklet
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDIuMjAgMTg6MzQsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IE9uIDE0LzAyLzIwMjAg
MTY6MzksIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDE0LjAyLjIwIDE1OjA2LCBJZ29yIERy
dXpoaW5pbiB3cm90ZToKPj4+IE9uIDExLzAyLzIwMjAgMDk6MzUsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6Cj4+Pj4gV2l0aCBjb3JlIHNjaGVkdWxpbmcgYWN0aXZlIGl0IGlzIG1hbmRhdG9yeSBmb3Ig
c3RvcF9tYWNoaW5lX3J1bigpIHRvCj4+Pj4gYmUgY2FsbGVkIGluIGEgdGFza2xldCBvbmx5LCBh
cyBvdGhlcndpc2UgYSBzY2hlZHVsaW5nIGRlYWRsb2NrIHdvdWxkCj4+Pj4gb2NjdXI6IHN0b3Bf
bWFjaGluZV9ydW4oKSBkb2VzIGEgY3B1IHJlbmRlenZvdXMgYnkgYWN0aXZhdGluZyBhIHRhc2ts
ZXQKPj4+PiBvbiBhbGwgb3RoZXIgY3B1cy4gSW4gY2FzZSBzdG9wX21hY2hpbmVfcnVuKCkgd2Fz
IG5vdCBjYWxsZWQgaW4gYW4gaWRsZQo+Pj4+IHZjcHUgaXQgd291bGQgYmxvY2sgc2NoZWR1bGlu
ZyB0aGUgaWRsZSB2Y3B1IG9uIGl0cyBzaWJsaW5ncyB3aXRoIGNvcmUKPj4+PiBzY2hlZHVsaW5n
IGJlaW5nIGFjdGl2ZSwgcmVzdWx0aW5nIGluIGEgaGFuZy4KPj4+Cj4+PiBJIHN1cHBvc2UgcmN1
X2JhcnJpZXIoKSBpcyBmaW5lIGR1ZSB0byBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKSBiZWlu
Zwo+Pj4gY2FsbGVkIGluc2lkZT8gSSdtIGEgbGl0dGxlIGNvbmNlcm5lZCBieSBpbXBvc2luZyBp
c192Y3B1X2lkbGUoKSByZXN0cmljdGlvbgo+Pj4gaW4gdGhhdCBjYXNlIGFzIHJjdV9iYXJyaWVy
KCkgY291bGQgYmUgdGVjaG5pY2FsbHkgY2FsbGVkIGZyb20gYSBub24tdGFza2xldAo+Pj4gY29u
dGV4dC4KPj4KPj4gTm8sIHN0b3BfbWFjaGluZV9ydW4oKSB3aXRoIGNvcmUgc2NoZWR1bGluZyBh
Y3RpdmUgY2FuIG9ubHkgd29yayB3aGVuCj4+IGNhbGxlZCBpbiBhbiBpZGxlIHZjcHUuCj4+Cj4+
IE9UT0ggaXQgd291bGQgYmUgZmFpcmx5IGVhc3kgdG8gYWRkIGFub3RoZXIgc29mdGlycSBmb3Ig
YSBzaW1pbGFyCj4+IHB1cnBvc2UgYW5kIGhhdmUgYSBzeW5jX21hY2hpbmVfcnVuKCkgdXNpbmcg
dGhhdCBpbnN0ZWFkIG9mIHRhc2tsZXRzLgo+PiBUaGlzIGNvdWxkIGJlIHVzZWQgZm9yIHVjb2Rl
IGxvYWRpbmcsIHRvby4KPj4KPj4gc3RvcF9tYWNoaW5lX3J1bigpIGFuZCBzeW5jX21hY2hpbmVf
cnVuKCkgY291bGQgdXNlIGEgY29tbW9uIG1haW4KPj4gZnVuY3Rpb24uIFRoZSBwYXRjaCBzaG91
bGQgYmUgcmF0aGVyIHNpbXBsZS4KPj4KPj4gVGhvdWdodHM/Cj4gCj4gSSBoYXZlIGEgcGF0Y2gg
b24gdGhlIGxpc3QgKHdoaWNoIEkgd2FzIHBsYW5uaW5nIHRvIHNlbmQgYSB2MiBmb3IpIHRoYXQK
PiBmaXhlcyBhbm90aGVyIGlzc3VlIHdpdGggcmN1X2JhcnJpZXIoKToKPiBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjAtMDEvbXNnMDIyNzMu
aHRtbAo+IAo+IEFzIEkgdW5kZXJzdGFuZCBpdCBub3cgdGhhdCB3b3VsZG4ndCB3b3JrIHdpdGgg
Y29yZS1zY2hlZHVsaW5nLiBEbyB5b3UgdGhpbmsKPiBpdCdzIHBvc3NpYmxlIHRvIHN5bmNocm9u
b3VzbHkgd2FpdCBmb3IgdGFza2xldHMgdG8gZmluaXNoIGluIG5vbi10YXNrbGV0Cj4gY29udGV4
dCAoYmVjYXVzZSB0aGF0J3Mgd2hhdCB0aGUgcHVycG9zZSBvZiByY3VfYmFycmllcigpIGlzKT8K
Ck5vLCB3b24ndCB3b3JrLCB1bmxlc3Mgd2UgYWRkIHByZWVtcHRpb24gKGJhc2ljYWxseSB3b3Vs
ZCBuZWVkIHBlci12Y3B1CnN0YWNrcyBpbnN0ZWFkIG9mIHBlci1wY3B1IG9uZXMpLgoKV2hhdCBt
aWdodCB3b3JrIElNTyB3b3VsZCBiZSB0byBkbyByY3VfcHJvY2Vzc19jYWxsYmFja3MoKSBubyBs
b25nZXIKZHVyaW5nIGlkbGUsIGJ1dCB0byBoYXZlIGEgc3BlY2lmaWMgc29mdGlycSBmb3IgdGhh
dCBwdXJwb3NlLiBUaGlzIHdvdWxkCnJlbW92ZSB0aGUgbmVlZCB0byBpbnZvbHZlIHNjaGVkdWxp
bmcgZm9yIHJjdV9iYXJyaWVyKCkuIEEgYnJpZWYgY2hlY2sKb2YgcHJvY2Vzc19wZW5kaW5nX3Nv
ZnRpcnFzKCkgY2FsbGVycyBzZWVtcyB0byBhbGxvdyB0aGF0LCBidXQgSSdkIGxpa2UKdG8gaGF2
ZSBhIHNlY29uZCBvcGluaW9uIGZyb20gc29tZW9uZSBoYXZpbmcgbW9yZSByY3Uga25vd2xlZGdl
IHRoYW4gbWUuClNpbmdsZSBwcm9ibGVtYXRpYyB1c2VycyBvZiBwcm9jZXNzX3BlbmRpbmdfc29m
dGlycXMoKSBjb3VsZCBzdGlsbCBiZQpzd2l0Y2hlZCB0byBhIHZhcmlhbnQgbm90IGFsbG93aW5n
IHRoZSBuZXcgcmN1IHNvZnRpcnEuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
