Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7717B473C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 08:16:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA6kc-0000it-EX; Tue, 17 Sep 2019 06:14:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W81B=XM=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1iA6kb-0000il-Qw
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 06:14:09 +0000
X-Inumbo-ID: 5c04acb2-d912-11e9-b299-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c04acb2-d912-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 06:14:09 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A118B206C2;
 Tue, 17 Sep 2019 06:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568700848;
 bh=sE3YRRODfOBV2JbJVxF12dvUKJrD1eRcmK4W8+NtWs0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PiljeJClnrFwTFVeSrlY/eFqTrasaUfOpTJM3Un7Z8k0+/0fBioj6SEPpWBLJuP/p
 0HjLXHipxGvcx7Eo5gzjhpBbuCYOEuj71yWix3N2qWvtK63wJw/8vTB9P3Ev1LtT5l
 7I5S2tyM+uguK9IugUHKcKw7SS/l6VD/P0GMnsCY=
Date: Tue, 17 Sep 2019 15:14:03 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Message-Id: <20190917151403.60023814bda80304777a35e5@kernel.org>
In-Reply-To: <156777561745.25081.1205321122446165328.stgit@devnote2>
References: <156777561745.25081.1205321122446165328.stgit@devnote2>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [Xen-devel] [PATCH -tip v4 0/4] x86: kprobes: Prohibit kprobes
 on Xen/KVM emulate prefixes
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGV0ZXIsCgpDb3VsZCB5b3UgcmV2aWV3IHRoaXMgdmVyc2lvbj8KClRoYW5rIHlvdSwKCk9u
IEZyaSwgIDYgU2VwIDIwMTkgMjI6MTM6MzcgKzA5MDAKTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFt
YXRAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IEhpLAo+IAo+IEhlcmUgaXMgdGhlIDR0aCB2ZXJzaW9u
IG9mIHBhdGNoZXMgdG8gaGFuZGxlIFhlbi9LVk0gZW11bGF0ZQo+IHByZWZpeCBieSB4ODYgaW5z
dHJ1Y3Rpb24gZGVjb2Rlci4KPiAKPiBUaGVzZSBwYXRjaGVzIGFsbG93IHg4NiBpbnN0cnVjdGlv
biBkZWNvZGVyIHRvIGRlY29kZQo+IFhlbiBhbmQgS1ZNIGVtdWxhdGUgcHJlZml4IGNvcnJlY3Rs
eSwgYW5kIHByb2hpYml0IGtwcm9iZXMgdG8KPiBwcm9iZSBvbiBpdC4KPiBQcmV2aW91cyB2ZXJz
aW9uIGlzIGhlcmU7Cj4gCj4gIGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvMTU2NzczNDMzODIx
LjMxNDQxLjI5MDU5NTEyNDY2NjQxNDg0ODcuc3RnaXRAZGV2bm90ZTIKPiAKPiBJbiB0aGlzIHZl
cnNpb24sIEkgYWRkZWQgMiBwYXRjaGVzLCBbMS80XSBmaXhlcyBfX0FTTV9GT1JNKCkgdG8KPiBh
Y2NlcHQgbWFjcm9zIHVzaW5nIF9fc3RyaW5naWZ5KCksIFsyLzRdIGludHJvZHVjZXMgbmV3Cj4g
YXNtL2VtdWxhdGVfcHJlZml4LmggdG8gaW5pdGlhbGl6ZSBYZW4gYW5kIEtWTSBlbXVsYXRlIHBy
ZWZpeAo+IGF0IG9uZSBwbGFjZS4gWzMvNF0gaXMgdXBkYXRlZCB0byB1c2UgbmV3IGVtdWxhdGVf
cHJlZml4LmggYW5kCj4gZml4IHRvIGFkZCBlbXVsYXRlX3ByZWZpeC5oIHRvIHN5bmMgY2hlY2sg
bGlzdC4KPiAKPiBUaGlzIHNlcmllcyBjYW4gYmUgYXBwbGllZCBvbiAtdGlwIG1hc3RlciBicmFu
Y2ggd2hpY2gKPiBoYXMgbWVyZ2VkIEpvc2gncyBvYmp0b29sL3BlcmYgc2hhcmluZyBjb21tb24g
eDg2IGluc24KPiBkZWNvZGVyIHNlcmllcy4KPiAKPiBUaGFuayB5b3UsCj4gCj4gLS0tCj4gCj4g
TWFzYW1pIEhpcmFtYXRzdSAoNCk6Cj4gICAgICAgeDg2L2FzbTogQWxsb3cgdG8gcGFzcyBtYWNy
b3MgdG8gX19BU01fRk9STSgpCj4gICAgICAgeDg2OiB4ZW46IGt2bTogR2F0aGVyIHRoZSBkZWZp
bml0aW9uIG9mIGVtdWxhdGUgcHJlZml4ZXMKPiAgICAgICB4ODY6IHhlbjogaW5zbjogRGVjb2Rl
IFhlbiBhbmQgS1ZNIGVtdWxhdGUtcHJlZml4IHNpZ25hdHVyZQo+ICAgICAgIHg4Njoga3Byb2Jl
czogUHJvaGliaXQgcHJvYmluZyBvbiBpbnN0cnVjdGlvbiB3aGljaCBoYXMgZW11bGF0ZSBwcmVm
aXgKPiAKPiAKPiAgYXJjaC94ODYvaW5jbHVkZS9hc20vYXNtLmggICAgICAgICAgICAgICAgICB8
ICAgIDggKysrKy0tCj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL2VtdWxhdGVfcHJlZml4LmggICAg
ICAgfCAgIDE0ICsrKysrKysrKysrCj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL2luc24uaCAgICAg
ICAgICAgICAgICAgfCAgICA2ICsrKysrCj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9pbnRl
cmZhY2UuaCAgICAgICAgfCAgIDExICsrKy0tLS0tLQo+ICBhcmNoL3g4Ni9rZXJuZWwva3Byb2Jl
cy9jb3JlLmMgICAgICAgICAgICAgIHwgICAgNCArKysKPiAgYXJjaC94ODYva3ZtL3g4Ni5jICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDQgKystCj4gIGFyY2gveDg2L2xpYi9pbnNuLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ICB0b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9lbXVsYXRlX3ByZWZpeC5oIHwgICAxNCAr
KysrKysrKysrKwo+ICB0b29scy9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pbnNuLmggICAgICAgICAg
IHwgICAgNiArKysrKwo+ICB0b29scy9hcmNoL3g4Ni9saWIvaW5zbi5jICAgICAgICAgICAgICAg
ICAgIHwgICAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgdG9vbHMvb2JqdG9vbC9z
eW5jLWNoZWNrLnNoICAgICAgICAgICAgICAgICB8ICAgIDMgKysKPiAgdG9vbHMvcGVyZi9jaGVj
ay1oZWFkZXJzLnNoICAgICAgICAgICAgICAgICB8ICAgIDMgKysKPiAgMTIgZmlsZXMgY2hhbmdl
ZCwgMTI4IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC94ODYvaW5jbHVkZS9hc20vZW11bGF0ZV9wcmVmaXguaAo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgdG9vbHMvYXJjaC94ODYvaW5jbHVkZS9hc20vZW11bGF0ZV9wcmVmaXguaAo+IAo+IC0t
Cj4gTWFzYW1pIEhpcmFtYXRzdSAoTGluYXJvKSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KCgotLSAK
TWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
