Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0A5E0DA8
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 23:06:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iN1I5-0007Ap-9K; Tue, 22 Oct 2019 21:02:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I1Ch=YP=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iN1I3-0007Ai-Mk
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 21:02:03 +0000
X-Inumbo-ID: 305f6a5c-f50f-11e9-8aca-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 305f6a5c-f50f-11e9-8aca-bc764e2007e4;
 Tue, 22 Oct 2019 21:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571778119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lDluS1kFGuVOpDajeFMqVqWUjgUNxTiQB+IGh/4U/Fc=;
 b=YHbp1u4ysqfD0tjck2+6YiEtSZ2R5k9wyS+/FWZf3hG6HFgb66fFDdhxfeye5SkumvxejE
 HQzcwyhCtyxr9Qm91UMgpA81LT2fxMMLIUHpQ/zgmvWClCt8WYqP5GaEMBGnLa/z6v/MDD
 1OdoypBGVIqbFRPIdlLDx9pWieHkhLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-nU6b3-OQN5ap8UXZu4oVWg-1; Tue, 22 Oct 2019 17:01:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AB3E1005500;
 Tue, 22 Oct 2019 21:01:50 +0000 (UTC)
Received: from [10.36.116.48] (ovpn-116-48.ams2.redhat.com [10.36.116.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB2D860872;
 Tue, 22 Oct 2019 21:01:24 +0000 (UTC)
To: Matt Sickler <Matt.Sickler@daktronics.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191022171239.21487-1-david@redhat.com>
 <20191022171239.21487-8-david@redhat.com>
 <SN6PR02MB4016D75C028B7A1BEA005697EE680@SN6PR02MB4016.namprd02.prod.outlook.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <20b91026-a685-8c49-4abe-a9d0339113cb@redhat.com>
Date: Tue, 22 Oct 2019 23:01:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB4016D75C028B7A1BEA005697EE680@SN6PR02MB4016.namprd02.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: nU6b3-OQN5ap8UXZu4oVWg-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH RFC v1 07/12] staging: kpc2000: Prepare
 transfer_complete_cb() for PG_reserved changes
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 Ben Chan <benchan@chromium.org>, Kees Cook <keescook@chromium.org>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, "x86@kernel.org" <x86@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 =?UTF-8?Q?Simon_Sandstr=c3=b6m?= <simon@nikanor.nu>,
 Dan Williams <dan.j.williams@intel.com>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Todd Poynor <toddpoynor@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Allison Randal <allison@lohutok.net>, Jim Mattson <jmattson@google.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vandana BN <bnvandana@gmail.com>,
 Jeremy Sowden <jeremy@azazel.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTAuMTkgMTk6NTUsIE1hdHQgU2lja2xlciB3cm90ZToKPj4gUmlnaHQgbm93LCBaT05F
X0RFVklDRSBtZW1vcnkgaXMgYWx3YXlzIHNldCBQR19yZXNlcnZlZC4gV2Ugd2FudCB0byBjaGFu
Z2UgdGhhdC4KPj4KPj4gVGhlIHBhZ2VzIGFyZSBvYnRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXNf
ZmFzdCgpLiBJIGFzc3VtZSwgdGhlc2UgY291bGQgYmUgWk9ORV9ERVZJQ0UgcGFnZXMuIExldCdz
IGp1c3QgZXhjbHVkZSB0aGVtIGFzIHdlbGwgZXhwbGljaXRseS4KPiAKPiBJJ20gbm90IHN1cmUg
d2hhdCBaT05FX0RFVklDRSBwYWdlcyBhcmUsIGJ1dCB0aGVzZSBwYWdlcyBhcmUgbm9ybWFsIHN5
c3RlbSBSQU0sIHR5cGljYWxseSBIdWdlUGFnZXMgKGJ1dCBub3QgYWx3YXlzKS4KClpPTkVfREVW
SUNFLCBhLmsuYS4gZGV2bWVtLCBhcmUgcGFnZXMgdGhhdCBieXBhc3MgdGhlIHBhZ2VjYWNoZSAo
ZS5nLiwgCkRBWCkgY29tcGxldGVseSBhbmQgd2lsbCB0aGVyZWZvcmUgbmV2ZXIgZ2V0IHN3YXBw
ZWQuIFRoZXNlIHBhZ2VzIGFyZSAKbm90IG1hbmFnZWQgYnkgYW55IHBhZ2UgYWxsb2NhdG9yIChl
c3BlY2lhbGx5IG5vdCB0aGUgYnVkZHkpLCB0aGV5IGFyZSAKcmF0aGVyICJkaXJlY3RseSBtYXBw
ZWQgZGV2aWNlIG1lbW9yeSIuCgpFLmcuLCBhIE5WRElNTS4gSXQgaXMgbWFwcGVkIGludG8gdGhl
IHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2Ugc2ltaWxhciB0byAKb3JkaW5hcnkgUkFNIChhIERJTU0p
LiBBbnkgd3JpdGUgdG8gc3VjaCBhIFBGTiB3aWxsIGRpcmVjdGx5IGVuZCB1cCBvbiAKdGhlIHRh
cmdldCBkZXZpY2UuIEluIGNvbnRyYXN0IHRvIGEgRElNTSwgdGhlIG1lbW9yeSBpcyBwZXJzaXN0
ZW50IAphY2Nyb3NzIHJlYm9vdHMuCgpOb3csIGlmIHlvdSBtbWFwIHN1Y2ggYW4gTlZESU1NIGlu
dG8gYSB1c2VyIHNwYWNlIHByb2Nlc3MsIHlvdSB3aWxsIGVuZCAKdXAgd2l0aCBaT05FX0RFVklD
RSBwYWdlcyBhcyBwYXJ0IG9mIHRoZSB1c2VyIHNwYWNlIG1hcHBpbmcgKFZNQSkuIApnZXRfdXNl
cl9wYWdlc19mYXN0KCkgb24gdGhpcyBtZW1vcnkgd2lsbCByZXN1bHQgaW4gInN0cnVjdCBwYWdl
cyIgdGhhdCAKYmVsb25nIHRvIFpPTkVfREVWSUNFLiBUaGlzIGlzIHdoZXJlIHRoaXMgcGF0Y2gg
Y29tZXMgaW50byBwbGF5LgoKVGhpcyBwYXRjaCBtYWtlcyBzdXJlIHRoYXQgdGhlcmUgaXMgYWJz
b2x1dGVseSBubyBjaGFuZ2Ugb25jZSB3ZSBzdG9wIApzZXR0aW5nIHRoZXNlIFpPTkVfREVWSUNF
IHBhZ2VzIFBHX3Jlc2VydmVkLiBFLmcuLCBBRkFJSywgc2V0dGluZyBhIApaT05FX0RFVklDRSBw
YWdlIGRpcnR5IGRvZXMgbm90IG1ha2UgdG9vIG11Y2ggc2Vuc2UgKG5ldmVyIHN3YXBwZWQpLgoK
WWVzLCBpdCBtaWdodCBub3QgYmUgYSBsaWtlbHkgc2V0dXAsIGhvd2V2ZXIsIGl0IGlzIHBvc3Np
YmxlLiBJbiB0aGlzIApzZXJpZXMgSSBjb2xsZWN0IGFsbCBwbGFjZXMgdGhhdCAqY291bGQqIGJl
IGFmZmVjdGVkLiBJZiB0aGF0IGNoYW5nZSBpcyAKcmVhbGx5IG5lZWRlZCBoYXMgdG8gYmUgZGVj
aWRlZC4gSSBjYW4gc2VlIHRoYXQgdGhlIHR3byBzdGFnaW5nIGRyaXZlcnMgCkkgaGF2ZSBwYXRj
aGVzIGZvciBtaWdodCBiZSBhYmxlIHRvIGp1c3QgbGl2ZSB3aXRoIHRoZSBjaGFuZ2UgLSBidXQg
dGhlbiAKd2UgdGFsa2VkIGFib3V0IGl0IGFuZCBhcmUgYXdhcmUgb2YgdGhlIGNoYW5nZS4KClRo
YW5rcyEKCi0tIAoKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
