Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C59B1465C0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 11:28:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuZhO-0004IX-3u; Thu, 23 Jan 2020 10:26:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuZhL-0004IS-O7
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 10:26:51 +0000
X-Inumbo-ID: d94bc436-3dca-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d94bc436-3dca-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 10:26:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 031C5B208;
 Thu, 23 Jan 2020 10:26:42 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <cover.1579727989.git.elnikety@amazon.com>
 <f997f1b3a7d515392c15f518ce886710068bb4ef.1579727989.git.elnikety@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a5fb1af-6405-9052-6f6b-0cc650f1e424@suse.com>
Date: Thu, 23 Jan 2020 11:26:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f997f1b3a7d515392c15f518ce886710068bb4ef.1579727989.git.elnikety@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 2/4] x86/microcode: Improve parsing for
 ucode=
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAyMzozMCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gRGVjb3VwbGUgdGhl
IG1pY3JvY29kZSBpbmRleGluZyBtZWNoYW5pc20gd2hlbiB1c2luZyBHUlVCIHRvIHRoYXQKPiB3
aGVuIHVzaW5nIEVGSS4gVGhpcyBhbGxvd3MgdXMgdG8gYXZvaWQgdGhlICJ1bnNwZWNpZmllZCBl
ZmZlY3QiIG9mCj4gdXNpbmcgYDxpbnRlZ2VyPmAgd2hlbiBib290aW5nIHZpYSBFRkkuCgpQZXJz
b25hbGx5IEknZCBwcmVmZXIgdXMgdG8gY29udGludWUgY2FsbCB0aGlzIHVuc3BlY2lmaWVkLiBJ
dApzaW1wbHkgc2hvdWxkbid0IGJlIHVzZWQuIFBlb3BsZSBzaG91bGRuJ3QgcmVseSBvbiBpdCBn
ZXR0aW5nCmlnbm9yZWQuIChJaXJjLCBkZXNwaXRlIHRoaXMgYmVpbmcgdjEsIHlvdSBoYWQgcHJl
dmlvdXNseQpzdWJtaXR0ZWQgYSBwYXRjaCB0byB0aGlzIGVmZmVjdCwgd2l0aCBtZSByZXBsYXlp
bmcgYWJvdXQgdGhlCnNhbWUuKQoKPiBXaXRoIHRoYXQsIFhlbiBjYW4gZXhwbGljaXRseSBpZ25v
cmUgdGhhdCBvcHRpb24gd2hlbiB1c2luZyBFRkkuCgpEb24ndCB3ZSBkbyBzbyBhbHJlYWR5LCBi
eSB3YXkgb2YgdGhlICJpZiAoICF1Y29kZV9tb2RfZm9yY2VkICkiCnlvdSBkZWxldGU/Cgo+IC0t
LSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+ICsrKyBiL2RvY3MvbWlzYy94
ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+IEBAIC0yMTQ3LDkgKzIxNDcsOSBAQCBmb3IgdXBkYXRp
bmcgQ1BVIG1pY3Jjb2RlLiBXaGVuIG5lZ2F0aXZlLCBjb3VudGluZyBzdGFydHMgYXQgdGhlIGVu
ZCBvZgo+ICB0aGUgbW9kdWxlcyBpbiB0aGUgR3JVQiBlbnRyeSAoc28gd2l0aCB0aGUgYmxvYiBj
b21tb25seSBiZWluZyBsYXN0LAo+ICBvbmUgY291bGQgc3BlY2lmeSBgdWNvZGU9LTFgKS4gTm90
ZSB0aGF0IHRoZSB2YWx1ZSBvZiB6ZXJvIGlzIG5vdCB2YWxpZAo+ICBoZXJlIChlbnRyeSB6ZXJv
LCBpLmUuIHRoZSBmaXJzdCBtb2R1bGUsIGlzIGFsd2F5cyB0aGUgRG9tMCBrZXJuZWwKPiAtaW1h
Z2UpLiBOb3RlIGZ1cnRoZXIgdGhhdCB1c2Ugb2YgdGhpcyBvcHRpb24gaGFzIGFuIHVuc3BlY2lm
aWVkIGVmZmVjdAo+IC13aGVuIHVzZWQgd2l0aCB4ZW4uZWZpICh0aGVyZSB0aGUgY29uY2VwdCBv
ZiBtb2R1bGVzIGRvZXNuJ3QgZXhpc3QsIGFuZAo+IC10aGUgYmxvYiBnZXRzIHNwZWNpZmllZCB2
aWEgdGhlIGB1Y29kZT08ZmlsZW5hbWU+YCBjb25maWcgZmlsZS9zZWN0aW9uCj4gK2ltYWdlKS4g
VGhpcyBvcHRpb24gc2hvdWxkIGJlIHVzZWQgb25seSB3aXRoIGxlZ2FjeSBib290LCBhcyBpdCBp
cyBleHBsaWNpdGx5Cj4gK2lnbm9yZWQgaW4gRUZJIGJvb3QuIFdoZW4gYm9vdGluZyB2aWEgRUZJ
LCB0aGUgbWljcm9jb2RlIHVwZGF0ZSBibG9iIGZvcgo+ICtlYXJseSBsb2FkaW5nIGNhbiBiZSBz
cGVjaWZpZWQgdmlhIHRoZSBgdWNvZGU9PGZpbGVuYW1lPmAgY29uZmlnIGZpbGUvc2VjdGlvbgo+
ICBlbnRyeTsgc2VlIFtFRkkgY29uZmlndXJhdGlvbiBmaWxlIGRlc2NyaXB0aW9uXShlZmkuaHRt
bCkpLgoKSnVzdCBsaWtlIGluIHBhdGNoIDEsIHBsZWFzZSBkaXN0aW5ndWlzaCAiRUZJIGJvb3Qi
IGluIGdlbmVyYWwgZnJvbQoidXNlIG9mIHhlbi5lZmkiIChyZWxldmFudCBoZXJlIG9mIGNvdXJz
ZSBvbmx5IGlmIGluZGVlZCB3ZSB3ZW50CndpdGggdGhpcyBwYXRjaCkuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
