Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7099CEFAE4
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 11:23:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRvvh-0005dy-3J; Tue, 05 Nov 2019 10:19:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qeQ=Y5=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iRvvf-0005dt-4J
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 10:19:15 +0000
X-Inumbo-ID: b6c1f3f2-ffb5-11e9-a195-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b6c1f3f2-ffb5-11e9-a195-12813bfff9fa;
 Tue, 05 Nov 2019 10:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572949153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zpJOg9tRFGLs7o7eYo++6NFqtTaXes69ojKC+HhCSpc=;
 b=hrrgGHlAzYGNFIJo7bxvwJJ8vTsWuRiQJ9NHG3v7Xituo+YXpRvlFSMAgw7qmq5x2jc9+z
 j7ilIF+abF7BhnvKUElrFD+0EbS0ZfCc2fJg89LTA9cWN0vWknBI7WhbBLN0Xwnm9/qzZM
 +sS4FS+B9pAvdcUtEzSZ7aMY1xuLOB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-_Ng1Kzh9PfuCsQVariDZFQ-1; Tue, 05 Nov 2019 05:19:11 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87B62FF;
 Tue,  5 Nov 2019 10:19:05 +0000 (UTC)
Received: from [10.36.117.253] (ovpn-117-253.ams2.redhat.com [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB3B1608AC;
 Tue,  5 Nov 2019 10:18:50 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-10-david@redhat.com>
 <4b88ebd7-255d-4f02-a347-5a6c0f4f4ac4@oracle.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <eba1a63f-c786-edc0-dc6d-2791eb034f33@redhat.com>
Date: Tue, 5 Nov 2019 11:18:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <4b88ebd7-255d-4f02-a347-5a6c0f4f4ac4@oracle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: _Ng1Kzh9PfuCsQVariDZFQ-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH v1 09/10] mm/memory_hotplug: Don't mark
 pages PG_reserved when initializing the memmap
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Sasha Levin <sashal@kernel.org>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Mel Gorman <mgorman@techsingularity.net>, Cornelia Huck <cohuck@redhat.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTEuMTkgMjM6NDQsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAxMC8yNC8xOSA4
OjA5IEFNLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
eGVuL2JhbGxvb24uYyBiL2RyaXZlcnMveGVuL2JhbGxvb24uYwo+PiBpbmRleCA0ZjJlNzhhNWU0
ZGIuLmFmNjlmMDU3OTEzYSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy94ZW4vYmFsbG9vbi5jCj4+
ICsrKyBiL2RyaXZlcnMveGVuL2JhbGxvb24uYwo+PiBAQCAtMzc0LDYgKzM3NCwxMyBAQCBzdGF0
aWMgdm9pZCB4ZW5fb25saW5lX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIGludCBv
cmRlcikKPj4gICAJbXV0ZXhfbG9jaygmYmFsbG9vbl9tdXRleCk7Cj4+ICAgCWZvciAoaSA9IDA7
IGkgPCBzaXplOyBpKyspIHsKPj4gICAJCXAgPSBwZm5fdG9fcGFnZShzdGFydF9wZm4gKyBpKTsK
Pj4gKwkJLyoKPj4gKwkJICogVE9ETzogVGhlIGNvcmUgdXNlZCB0byBtYXJrIHRoZSBwYWdlcyBy
ZXNlcnZlZC4gTW9zdCBwcm9iYWJseQo+PiArCQkgKiB3ZSBjYW4gc3RvcCBkb2luZyB0aGF0IG5v
dy4gSG93ZXZlciwgZXNwZWNpYWxseQo+PiArCQkgKiBhbGxvY194ZW5iYWxsb29uZWRfcGFnZXMo
KSBsZWZ0IFBHX3Jlc2VydmVkIHNldAo+PiArCQkgKiBvbiBwYWdlcyB0aGF0IGNhbiBnZXQgbWFw
cGVkIHRvIHVzZXIgc3BhY2UuCj4+ICsJCSAqLwo+PiArCQlfX1NldFBhZ2VSZXNlcnZlZChwKTsK
PiAKPiBJIHN1c3BlY3QgdGhpcyBpcyBub3QgbmVlZGVkLiBQYWdlcyBjYW4gZ2V0IGludG8gYmFs
bG9vbiBlaXRoZXIgZnJvbQo+IGhlcmUgb3IgZnJvbSBub24taG90cGx1ZyBwYXRoIChlLmcuIGRl
Y3JlYXNlX3Jlc2VydmF0aW9uKCkpIGFuZCBzbyB3aGVuCj4gd2UgZ2V0IGEgcGFnZSBmcm9tIHRo
ZSBiYWxsb29uIHdlIHdvdWxkIGdldCBhIHJhbmRvbSBwYWdlIHRoYXQgbWF5IG9yCj4gbWF5IG5v
dCBoYXZlIFJlc2VydmVkIGJpdCBzZXQuCgpZZWFoLCBJIGFsc28gdGhpbmsgaXQgaXMgZmluZS4g
SWYgeW91IGFncmVlLCBJJ2xsIGRyb3AgdGhpcyBodW5rIGFuZCBhZGQgCmRldGFpbHMgdG8gdGhl
IHBhdGNoIGRlc2NyaXB0aW9uLgoKCi0tIAoKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
