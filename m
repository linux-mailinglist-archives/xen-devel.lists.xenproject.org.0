Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECD31797FD
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 19:35:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Yo5-00047A-8z; Wed, 04 Mar 2020 18:31:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/75R=4V=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j9Yo4-000475-CO
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 18:31:44 +0000
X-Inumbo-ID: 655c73f8-5e46-11ea-a467-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 655c73f8-5e46-11ea-a467-12813bfff9fa;
 Wed, 04 Mar 2020 18:31:43 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id t7so3500322edr.4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 10:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DbCahvnBUcciZKwr4hN2Bxez9s1pO0xv4NuMtDX+rtY=;
 b=AQ9tQswolDp3twMnP2KqBA6cEbo9lMS8wtMMzEyPE9MCWdRaPWZqI1B9gNFSKzA+XR
 koLFZ9DMwlzndwxwaWpcUtrIDXKcgmDALPmvA1ty3Mk705IIi2Nx/Hbjv8V4bJNtqNz4
 i5wLU9gWe4TfNE5c4Ztd7J+Nf+WHqlYTS3mxh/LuUOrjg3KU16M+RUalQSi2eB5wph6D
 87WyqE+ARh4/TNAQBcQXhr906xBovAeOycllT1Um394c0Nlo/M0uRMmQpUcM/IqkPEaJ
 nUIJWo0FL19E0yow6dOHIXQKjlCDr8TWsLppcTqvvwNL8B+qy3nJw3pPlHpwNMgL1+88
 e68w==
X-Gm-Message-State: ANhLgQ29T18fRltr2xIr/Bx3FhMrJccsKbvdPyq10/d0v3NQEbv7F9kn
 XgwLBPF6iL26jAeQJWM8TZA=
X-Google-Smtp-Source: ADFU+vvIANbdSKV0Na5qvqBbAj8rzt5yyOVXT0B8vHQmUuX87JphOUmLi7P8W8SRLm4wgrxI5+T8eg==
X-Received: by 2002:a05:6402:b85:: with SMTP id
 cf5mr3958452edb.27.1583346702553; 
 Wed, 04 Mar 2020 10:31:42 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id z99sm496397ede.91.2020.03.04.10.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 10:31:42 -0800 (PST)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20200213105325.3022-1-pdurrant@amazon.com>
 <20200213105325.3022-3-pdurrant@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6c12ea7c-c4da-70cb-34bc-82a10106fa8c@xen.org>
Date: Wed, 4 Mar 2020 18:31:40 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200213105325.3022-3-pdurrant@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v5 2/2] docs/designs: Add a design document
 for migration of xenstore data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDEzLzAyLzIwMjAgMTA6NTMsIFBhdWwgRHVycmFudCB3cm90ZToKPiBUaGlz
IHBhdGNoIGRldGFpbHMgcHJvcG9zZXMgZXh0cmEgbWlncmF0aW9uIGRhdGEgYW5kIHhlbnN0b3Jl
IHByb3RvY29sCj4gZXh0ZW5zaW9ucyB0byBzdXBwb3J0IG5vbi1jb29wZXJhdGl2ZSBsaXZlIG1p
Z3JhdGlvbiBvZiBndWVzdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVy
cmFudEBhbWF6b24uY29tPgo+IC0tLQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgo+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJp
eC5jb20+Cj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENj
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+Cj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pgo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IAo+IHY1Ogo+ICAgLSBBZGQgUVVJRVNDRQo+
ICAgLSBNYWtlIHNlbWFudGljcyBvZiA8aW5kZXg+IGluIEdFVF9ET01BSU5fV0FUQ0hFUyBtb3Jl
IGNsZWFyCj4gCj4gdjQ6Cj4gICAtIERyb3AgdGhlIHJlc3RyaWN0aW9ucyBvbiBzcGVjaWFsIHBh
dGhzCj4gCj4gdjM6Cj4gICAtIE5ldyBpbiB2Mwo+IC0tLQo+ICAgZG9jcy9kZXNpZ25zL3hlbnN0
b3JlLW1pZ3JhdGlvbi5tZCB8IDEzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEzNiBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZG9jcy9kZXNpZ25zL3hlbnN0b3JlLW1pZ3JhdGlvbi5tZAo+IAo+IGRpZmYgLS1naXQgYS9kb2Nz
L2Rlc2lnbnMveGVuc3RvcmUtbWlncmF0aW9uLm1kIGIvZG9jcy9kZXNpZ25zL3hlbnN0b3JlLW1p
Z3JhdGlvbi5tZAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNWNm
ZTJkOWE3ZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kb2NzL2Rlc2lnbnMveGVuc3RvcmUtbWln
cmF0aW9uLm1kCj4gQEAgLTAsMCArMSwxMzYgQEAKPiArIyBYZW5zdG9yZSBNaWdyYXRpb24KPiAr
Cj4gKyMjIEJhY2tncm91bmQKPiArCj4gK1RoZSBkZXNpZ24gZm9yICpOb24tQ29vcGVyYXRpdmUg
TWlncmF0aW9uIG9mIEd1ZXN0cypbMV0gZXhwbGFpbnMgdGhhdCBleHRyYQo+ICtzYXZlIHJlY29y
ZHMgYXJlIHJlcXVpcmVkIGluIHRoZSBtaWdyYXRpb25zIHN0cmVhbSB0byBhbGxvdyBhIGd1ZXN0
IHJ1bm5pbmcKPiArUFYgZHJpdmVycyB0byBiZSBtaWdyYXRlZCB3aXRob3V0IGl0cyBjby1vcGVy
YXRpb24uIE1vcmVvdmVyIHRoZSBzYXZlCj4gK3JlY29yZHMgbXVzdCBpbmNsdWRlIGRldGFpbHMg
b2YgcmVnaXN0ZXJlZCB4ZW5zdG9yZSB3YXRjaGVzIGFzIHdlbGwgYXMKPiArY29udGVudDsgaW5m
b3JtYXRpb24gdGhhdCBjYW5ub3QgY3VycmVudGx5IGJlIHJlY292ZXJlZCBmcm9tIGB4ZW5zdG9y
ZWRgLAo+ICthbmQgaGVuY2Ugc29tZSBleHRlbnNpb24gdG8gdGhlIHhlbnN0b3JlIHByb3RvY29s
WzJdIHdpbGwgYWxzbyBiZSByZXF1aXJlZC4KPiArCj4gK1RoZSAqbGlieGVubGlnaHQgRG9tYWlu
IEltYWdlIEZvcm1hdCogc3BlY2lmaWNhdGlvblszXSBhbHJlYWR5IGRlZmluZXMgYQo+ICtyZWNv
cmQgdHlwZSBgRU1VTEFUT1JfWEVOU1RPUkVfREFUQWAgYnV0IHRoaXMgaXMgbm90IHN1aXRhYmxl
IGZvcgo+ICt0cmFuc2ZlcnJpbmcgeGVuc3RvcmUgZGF0YSBwZXJ0YWluaW5nIHRvIHRoZSBkb21h
aW4gZGlyZWN0bHkgYXMgaXQgaXMKPiArc3BlY2lmaWVkIHN1Y2ggdGhhdCBrZXlzIGFyZSByZWxh
dGl2ZSB0byB0aGUgcGF0aAo+ICtgL2xvY2FsL2RvbWFpbi8kZG1fZG9taWQvZGV2aWNlLW1vZGVs
LyRkb21pZGAuIFRodXMgaXQgaXMgbmVjZXNzYXJ5IHRvCj4gK2RlZmluZSBhdCBsZWFzdCBvbmUg
bmV3IHNhdmUgcmVjb3JkIHR5cGUuCj4gKwo+ICsjIyBQcm9wb3NhbAo+ICsKPiArIyMjIE5ldyBT
YXZlIFJlY29yZAo+ICsKPiArQSBuZXcgbWFuZGF0b3J5IHJlY29yZCB0eXBlIHNob3VsZCBiZSBk
ZWZpbmVkIHdpdGhpbiB0aGUgbGlieGVubGlnaHQgRG9tYWluCj4gK0ltYWdlIEZvcm1hdDoKPiAr
Cj4gK2AweDAwMDAwMDA3OiBET01BSU5fWEVOU1RPUkVfREFUQWAKPiArCj4gK1RoZSBmb3JtYXQg
b2YgZWFjaCBvZiB0aGVzZSBuZXcgcmVjb3JkcyBzaG91bGQgYmUgYXMgZm9sbG93czoKPiArCj4g
Kwo+ICtgYGAKPiArMCAgICAgMSAgICAgMiAgICAgMyAgICAgNCAgICAgNSAgICAgNiAgICAgNyBv
Y3RldAo+ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LSsKPiArfCB0eXBlICAgICAgICAgICAgICAgICAgIHwgcmVjb3JkIHNwZWNpZmljIGRhdGEgICB8
Cj4gKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rICAgICAgICAgICAgICAgICAgICAgICAgfAo+
ICsuLi4KPiArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0rCj4gK2BgYAo+ICsKPiArCj4gK3wgRmllbGQgfCBEZXNjcmlwdGlvbiB8Cj4gK3wtLS18LS0t
fAoKRGlkIHlvdSBpbmRlbmQgdG8gYWRkIG1vcmUgLSBzbyB8IGlzIG9uIHRoZSBzYW1lIGNvbHVt
biBhcyB0aGUgb250ZXIgbGluZXM/Cgo+ICt8IGB0eXBlYCB8IDB4MDAwMDAwMDA6IGludmFsaWQg
fAo+ICt8ICAgICAgICB8IDB4MDAwMDAwMDE6IG5vZGUgZGF0YSB8Cj4gK3wgICAgICAgIHwgMHgw
MDAwMDAwMjogd2F0Y2ggZGF0YSB8CgpTaG91bGQgbm90IHRoZSBsYXN0IHwgYmUgc29tZSBvZiB0
aGUgY29sdW1ucyBvbiBhbGwgdGhlIGxpbmVzPwoKPiArfCAgICAgICAgfCAweDAwMDAwMDAzIC0g
MHhGRkZGRkZGRjogcmVzZXJ2ZWQgZm9yIGZ1dHVyZSB1c2UgfAoKTG9va2luZyBhdCB0aGUgc3Bl
YywgdGhlIGNvbW1hbmQgVFJBTlNBQ1RJT05fRU5EICptdXN0KiBiZSB1c2VkIHdpdGggYW4gCmV4
aXN0aW5nIHRyYW5zYWN0aW9uLiBBcyBhIGd1ZXN0IHdvdWxkIGJlIG1pZ3JhdGUgdG8gYSBuZXcg
ZG9tYWluLCB0aGUgCnRyYW5zYWN0aW9uIElEIHdvdWxkIG5vdyBiZSBpbnZhbGlkLgoKSSB1bmRl
cnN0YW5kIHRoYXQgeGVuc3RvcmVkIGlzIGFibGUgdG8gY29wZSB3aXRoIGl0LCBidXQgc3VjaCBi
ZWhhdmlvciAKaXMgbm90IGRlc2NyaWJlZCBpbiB0aGUgc3BlYy4gU28gSSBhbSBub3Qgc3VyZSB3
ZSBjYW4gZXhwZWN0IGEgZ3Vlc3QgdG8gCmNvcGUgd2l0aCBhbiBlcnJvciB2YWx1ZSBvdGhlciB0
aGFuIHRoZSBvbmVzIGRlc2NyaWJlZCBmb3IgdGhlIGNvbW1hbmQuCgo+ICsKPiArCj4gK3doZXJl
IGRhdGEgaXMgYWx3YXlzIGluIHRoZSBmb3JtIG9mIGEgTlVMIHNlcGFyYXRlZCBhbmQgdGVybWlu
YXRlZCB0dXBsZQo+ICthcyBmb2xsb3dzCj4gKwo+ICsKPiArKipub2RlIGRhdGEqKgo+ICsKPiAr
Cj4gK2A8cGF0aD58PHZhbHVlPnw8cGVybS1hcy1zdHJpbmc+fGAKCkkgZG9uJ3QgdGhpbmsgdGhp
cyB3b3VsZCB3b3JrLiBGcm9tIHRoZSBzcGVjLCA8dmFsdWU+IGlzIGEgYmluYXJ5IGRhdGEgCmFu
ZCB0aGVyZWZvcmUgaXQgY2FuIGNvbnRhaW4gemVybyBvciBudWwuIFNvIHlvdSB3b3VsZCBub3Qg
YmUgYWJsZSB0byAKZmluZCBvdXQgd2hlcmUgdGhlIDxwZXJtLWFzLXN0cmluZz4gc3RhcnRzLgoK
UmVnYXJkaW5nIHRoZSA8cGVybS1hcy1zdHJpbmc+LCBpdCBpcyBvbmx5IGRlc2NyaWJpbmcgdGhl
IHBlcm1pc3Npb24gZm9yIApvbmUgZG9tYWluLiBJZiBtdWx0aXBsZSBkb21haW5zIGNhbiBhY2Nl
c3MgdGhlIG5vZGUsIHRoZW4geW91IHdvdWxkIGhhdmUgCm11bHRpcGxlIDxwZXJtLWFzLXN0cmlu
Zz4uIERvIHdlIHdhbnQgdG8gdHJhbnNmZXIgYWxsIHRoZSBwZXJtaXNzaW9ucywgCmlmIG5vdCBo
b3cgZG8gd2UgZGVmaW5lIHdoaWNoIHBlcm1pc3Npb25zIHNob3VsZCBiZSB0cmFuc2ZlcnJlZD8K
Cj4gKwo+ICsKPiArYDxwYXRoPmAgaXMgY29uc2lkZXJlZCByZWxhdGl2ZSB0byB0aGUgZG9tYWlu
IHBhdGggYC9sb2NhbC9kb21haW4vJGRvbWlkYAo+ICthbmQgaGVuY2UgbXVzdCBub3QgYmVnaW4g
d2l0aCBgL2AuCj4gK2A8cGF0aD5gIGFuZCBgPHZhbHVlPmAgc2hvdWxkIGJlIHN1aXRhYmxlIHRv
IGZvcm11bGF0ZSBhIGBXUklURWAgb3BlcmF0aW9uCj4gK3RvIHRoZSByZWNlaXZpbmcgeGVuc3Rv
cmUgYW5kIGA8cGVybS1hcy1zdHJpbmc+YCBzaG91bGQgYmUgc2ltaWxhcmx5IHN1aXRhYmxlCj4g
K3RvIGZvcm11bGF0ZSBhIHN1YnNlcXVlbnQgYFNFVF9QRVJNU2Agb3BlcmF0aW9uLgo+ICsKPiAr
Kip3YXRjaCBkYXRhKioKPiArCj4gKwo+ICtgPHBhdGg+fDx0b2tlbj58YAo+ICsKPiArYDxwYXRo
PmAgYWdhaW4gaXMgY29uc2lkZXJlZCByZWxhdGl2ZSBhbmQsIHRvZ2V0aGVyIHdpdGggYDx0b2tl
bj5gLCBzaG91bGQKPiArYmUgc3VpdGFibGUgdG8gZm9ybXVsYXRlIGFuIGBBRERfRE9NQUlOX1dB
VENIRVNgIG9wZXJhdGlvbiAoc2VlIGJlbG93KS4KCkFGQUlDVCwgYSBndWVzdCBpcyBhbGxvd2Vk
IHRvIHdhdGNoIC8uIFNvIGlzIGl0IGEgc2Vuc2libGUgdGhpbmcgdG8gb25seSAKdHJhbnNmZXIg
cmVsYXRpdmUgd2F0Y2g/CgpBbHNvLCBob3cgYWJvdXQgc3BlY2lhbCB3YXRjaCAoaS5lIEAuLi4p
PwoKPiArCj4gKwo+ICsjIyMgUHJvdG9jb2wgRXh0ZW5zaW9uCj4gKwo+ICtCZWZvcmUgeGVuc3Rv
cmUgc3RhdGUgaXMgbWlncmF0ZWQgaXQgaXMgbmVjZXNzYXJ5IHRvIHdhaXQgZm9yIGFueSBwZW5k
aW5nCj4gK3JlYWRzLCB3cml0ZXMsIHdhdGNoIHJlZ2lzdHJhdGlvbnMgZXRjLiB0byBjb21wbGV0
ZSwgYW5kIGFsc28gdG8gbWFrZSBzdXJlCj4gK3RoYXQgeGVuc3RvcmVkIGRvZXMgbm90IHN0YXJ0
IHByb2Nlc3NpbmcgYW55IG5ldyByZXF1ZXN0cyAoc28gdGhhdCBuZXcKPiArcmVxdWVzdHMgcmVt
YWluIHBlbmRpbmcgb24gdGhlIHNoYXJlZCByaW5nIGZvciBzdWJzZXF1ZW50IHByb2Nlc3Npbmcg
b24gdGhlCj4gK25ldyBob3N0KS4gSGVuY2UgdGhlIGZvbGxvd2luZyBvcGVyYXRpb24gaXMgbmVl
ZGVkOgo+ICsKPiArYGBgCj4gK1FVSUVTQ0UgICAgICAgICAgICAgICAgIDxkb21pZD58Cj4gKwo+
ICtDb21wbGV0ZSBwcm9jZXNzaW5nIG9mIGFueSByZXF1ZXN0IGlzc3VlZCBieSB0aGUgc3BlY2lm
aWVkIGRvbWFpbiwgYW5kCj4gK2RvIG5vdCBwcm9jZXNzIGFueSBmdXJ0aGVyIHJlcXVlc3RzIGZy
b20gdGhlIHNoYXJlZCByaW5nLgo+ICtgYGAKPiArCj4gK1RoZSBgV0FUQ0hgIG9wZXJhdGlvbiBk
b2VzIG5vdCBhbGxvdyBzcGVjaWZpY2F0aW9uIG9mIGEgYDxkb21pZD5gOyBpdCBpcwo+ICthc3N1
bWVkIHRoYXQgdGhlIHdhdGNoIHBlcnRhaW5zIHRvIHRoZSBkb21haW4gdGhhdCBvd25zIHRoZSBz
aGFyZWQgcmluZwo+ICtvdmVyIHdoaWNoIHRoZSBvcGVyYXRpb24gaXMgcGFzc2VkLiBIZW5jZSwg
Zm9yIHRoZSB0b29sLXN0YWNrIHRvIGJlIGFibGUKPiArdG8gcmVnaXN0ZXIgYSB3YXRjaCBvbiBi
ZWhhbGYgb2YgYSBkb21haW4gYSBuZXcgb3BlcmF0aW9uIGlzIG5lZWRlZDoKPiArCj4gK2BgYAo+
ICtBRERfRE9NQUlOX1dBVENIRVMgICAgICA8ZG9taWQ+fDx3YXRjaD58Kwo+ICsKPiArQWRkcyB3
YXRjaGVzIG9uIGJlaGFsZiBvZiB0aGUgc3BlY2lmaWVkIGRvbWFpbi4KPiArCj4gKzx3YXRjaD4g
aXMgYSBOVUwgc2VwYXJhdGVkIHR1cGxlIG9mIDxwYXRoPnw8dG9rZW4+LiBUaGUgc2VtYW50aWNz
IG9mIHRoaXMKPiArb3BlcmF0aW9uIGFyZSBpZGVudGljYWwgdG8gdGhlIGRvbWFpbiBpc3N1aW5n
IFdBVENIIDxwYXRoPnw8dG9rZW4+fCBmb3IKPiArZWFjaCA8d2F0Y2g+Lgo+ICtgYGAKPiArCj4g
K1RoZSB3YXRjaCBpbmZvcm1hdGlvbiBmb3IgYSBkb21haW4gYWxzbyBuZWVkcyB0byBiZSBleHRy
YWN0ZWQgZnJvbSB0aGUKPiArc2VuZGluZyB4ZW5zdG9yZWQgc28gdGhlIGZvbGxvd2luZyBvcGVy
YXRpb24gaXMgYWxzbyBuZWVkZWQ6Cj4gKwo+ICtgYGAKPiArR0VUX0RPTUFJTl9XQVRDSEVTICAg
ICAgPGRvbWlkPnw8aW5kZXg+ICAgPGdlbmNudD58PHdhdGNoPnwqCj4gKwo+ICtHZXRzIHRoZSBs
aXN0IG9mIHdhdGNoZXMgdGhhdCBhcmUgY3VycmVudGx5IHJlZ2lzdGVyZWQgZm9yIHRoZSBkb21h
aW4uCj4gKwo+ICs8d2F0Y2g+IGlzIGEgTlVMIHNlcGFyYXRlZCB0dXBsZSBvZiA8cGF0aD58PHRv
a2VuPi4gVGhlIHN1Yi1saXN0IHJldHVybmVkCj4gK3dpbGwgc3RhcnQgYXQgPGluZGV4PiBpdGVt
cyBpbnRvIHRoZSB0aGUgb3ZlcmFsbCBsaXN0IG9mIHdhdGNoZXMgYW5kIG1heQo+ICtiZSB0cnVu
Y2F0ZWQgKGF0IGEgPHdhdGNoPiBib3VuZGFyeSkgc3VjaCB0aGF0IHRoZSByZXR1cm5lZCBkYXRh
IGZpdHMKPiArd2l0aGluIFhFTlNUT1JFX1BBWUxPQURfTUFYLgo+ICsKPiArSWYgPGluZGV4PiBp
cyBiZXlvbmQgdGhlIGVuZCBvZiB0aGUgb3ZlcmFsbCBsaXN0IHRoZW4gdGhlIHJldHVybmVkIHN1
Yi0KPiArbGlzdCB3aWxsIGJlIGVtcHR5LiBJZiB0aGUgdmFsdWUgb2YgPGdlbmNudD4gY2hhbmdl
cyB0aGVuIGl0IGluZGljYXRlcwo+ICt0aGF0IHRoZSBvdmVyYWxsIHdhdGNoIGxpc3QgaGFzIGNo
YW5nZWQgYW5kIHRodXMgaXQgbWF5IGJlIG5lY2Vzc2FyeQo+ICt0byByZS1pc3N1ZSB0aGUgb3Bl
cmF0aW9uIGZvciBwcmV2aW91cyB2YWx1ZXMgb2YgPGluZGV4Pi4KPiArYGBgCj4gKwo+ICtJdCBt
YXkgYWxzbyBiZSBkZXNpcmFibGUgdG8gc3RhdGUgaW4gdGhlIHByb3RvY29sIHNwZWNpZmljYXRp
b24gdGhhdAo+ICt0aGUgYElOVFJPRFVDRWAgb3BlcmF0aW9uIHNob3VsZCBub3QgY2xlYXIgdGhl
IGA8bWZuPmAgc3BlY2lmaWVkIHN1Y2ggdGhhdAoKTm90IGRpcmVjdGx5IHJlbGF0ZWQgdG8gdGhp
cyBwYXRjaCwgdGhlICc8bWZuPicgaXMgc2xpZ2h0bHkgY29uZnVzaW5nIApiZWNhdXNlLCBBRkFJ
Q1QsIHRoaXMgd2lsbCBhY3R1YWxseSBob2xkIGFuIEdGTi4gVG8gYXZvaWQgc3ByZWFkaW5nIG1v
cmUgCm1pc3VzZSwgaXQgd291bGQgbWFrZSBzZW5zZSB0byB1cGRhdGUgdGhlIHhlbnN0b3JlIGFj
Y29yZGluZ2x5IGFuZCB1c2UgCnRoZSBuZXcgdGVybSBoZXJlLgoKPiArYSBgUkVMRUFTRWAgb3Bl
cmF0aW9uIGZvbGxvd2VkIGJ5IGFuIGBJTlRST0RVQ0VgIG9wZXJhdGlvbiBmb3JtIGFuCj4gK2lk
ZW1wb3RlbnQgcGFpci4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgKkMgeGVudG9yZWQq
IGRvZXMgdGhpcwo+ICsoaW4gdGhlIGBkb21haW5fY29ubl9yZXNldCgpYCBmdW5jdGlvbikgYnV0
IHRoaXMgY291bGQgYmUgZHJvcHBlZCBhcyB0aGlzCj4gK2JlaGF2aW91ciBpcyBub3QgY3VycmVu
dGx5IHNwZWNpZmllZCBhbmQgdGhlIHBhZ2Ugd2lsbCBhbHdheXMgYmUgemVyb2VkCj4gK2ZvciBh
IG5ld2x5IGNyZWF0ZWQgZG9tYWluLgo+ICsKPiArCj4gKyogKiAqCj4gKwo+ICtbMV0gU2VlIGh0
dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPWRvY3MvZGVz
aWducy9ub24tY29vcGVyYXRpdmUtbWlncmF0aW9uLm1kCj4gK1syXSBTZWUgaHR0cHM6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9ZG9jcy9taXNjL3hlbnN0b3Jl
LnR4dAo+ICtbM10gU2VlIGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0
O2E9YmxvYjtmPWRvY3Mvc3BlY3MvbGlieGwtbWlncmF0aW9uLXN0cmVhbS5wYW5kb2MKPiAKCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
