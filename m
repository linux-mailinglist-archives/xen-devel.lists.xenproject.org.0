Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27520F8C6C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 11:04:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUSzJ-0008VY-UU; Tue, 12 Nov 2019 10:01:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ifzZ=ZE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iUSzI-0008VR-KH
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 10:01:28 +0000
X-Inumbo-ID: 64066a67-0533-11ea-a21a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64066a67-0533-11ea-a21a-12813bfff9fa;
 Tue, 12 Nov 2019 10:01:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AEB6AAC24;
 Tue, 12 Nov 2019 10:01:26 +0000 (UTC)
To: Wei Liu <wl@xen.org>, paul@xen.org
References: <1573206153-22090-1-git-send-email-paul@xen.org>
 <20191108103136.aqxuzk23p2uofxlx@debian>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d85fbe14-f0af-aa3e-3cc2-29d4500ac3a2@suse.com>
Date: Tue, 12 Nov 2019 11:01:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191108103136.aqxuzk23p2uofxlx@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] tools/hotpug: only attempt to call 'ip
 route' if there is valid command
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTEuMTkgMTE6MzEsIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBOb3YgMDgsIDIwMTkg
YXQgMDk6NDI6MzNBTSArMDAwMCwgcGF1bEB4ZW4ub3JnIHdyb3RlOgo+PiBGcm9tOiBQYXVsIER1
cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4+Cj4+IFRoZSB2aWYtcm91dGUgc2NyaXB0IHNo
b3VsZCBvbmx5IGNhbGwgJ2lwIHJvdXRlJyB3aGVuICdpcGNtZCcgaGFzIGJlZW4KPj4gc2V0LCBv
dGhlcndpc2UgaXQgd2lsbCBmYWlsIGR1ZSB0byBhbiBpbmNvcnJlY3QgY29tbWFuZCBzdHJpbmcu
Cj4+Cj4+IFRoaXMgcGF0Y2ggYWxzbyBhZGRzIHJvdXRlcyBmb3IgJ3RhcCcgKGkuZS4gZW11bGF0
ZWQpIGRldmljZXMgYXMgd2VsbCBhcwo+PiAndmlmJyAoaS5lLiBQVikgZGV2aWNlcy4gRW1waXJp
Y2FsbHkgb2ZmbGluZS9vbmxpbmUgY29tbWFuZHMgcmVsYXRlIHRvCj4+ICd2aWYnIGRldmljZXMs
IGFuZCBhZGQvcmVtb3ZlIGNvbW1hbmRzIHJlbGF0ZSB0byAndGFwJyBkZXZpY2VzLiBIb3dldmVy
LAo+PiB0aGlzIHBhdGNoIHRyZWF0cyB0aGVtIGVxdWFsbHkgYW5kIHVzZXMgJHt0eXBlX2lmfSB0
byBkaXN0aW5ndWlzaC4gQnkKPj4gYWRkaW5nIGNhc2VzIGZvciBhZGQvcmVtb3ZlIHRoZSBjb21t
YW5kIGxpc3QgYmVjb21lcyBleGhhdXN0aXZlIGFuZCBoZW5jZQo+PiAnaXBjbWQnIGlzIGd1YXJh
bnRlZWQgdG8gYmUgc2V0Lgo+Pgo+PiBSb3V0ZXMgZm9yICd0YXAnIGFuZCAndmlmJyBkZXZpY2Vz
IGFyZSBkaXN0aW5ndWlzaGVkIGJ5IGEgcm91dGUgbWV0cmljLgo+PiBFbXVsYXRlZCBkZXZpY2Vz
IGFyZSB1c2VkIGJ5IEhWTSBndWVzdHMgdW50aWwgdGhleSBhcmUgdW5wbHVnZ2VkLCBhdCB3aGlj
aAo+PiBwb2ludCB0aGUgUFYgZGV2aWNlIGJlY29tZXMgYWN0aXZlLiBUaHVzICd0YXAnIGRldmlj
ZXMgc2hvdWxkIGdldCBhIGhpZ2hlcgo+PiBwcmlvcml0eSAoaS5lLiBsb3dlciBudW1iZXJlZCkg
bWV0cmljIHRoYW4gJ3ZpZicgZGV2aWNlcy4KPj4KPj4gVGhlcmUgaXMgYWxzbyBvbmUgc21hbGwg
d2hpdGVzcGFjZSBmaXguCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJh
bnRAYW1hem9uLmNvbT4KPiAKPiBBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KClJlbGVh
c2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
