Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 259A6161226
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:35:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3faC-0007Bh-Jm; Mon, 17 Feb 2020 12:33:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ywWV=4F=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j3faA-0007Bc-Ss
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:33:02 +0000
X-Inumbo-ID: a24c8784-5181-11ea-bfdb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a24c8784-5181-11ea-bfdb-12813bfff9fa;
 Mon, 17 Feb 2020 12:33:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1A8C7ABEA;
 Mon, 17 Feb 2020 12:33:00 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200217072006.20211-1-jgross@suse.com>
 <20200217072006.20211-3-jgross@suse.com>
 <0e8018be-7551-9bdf-fc6a-fb388579ff18@xen.org>
 <4f29d05c-db7d-c1da-2fd9-8eed7dcdc587@suse.com>
 <20200217121704.GJ4679@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ac1cc737-3fd2-a184-1df1-ce7279b23067@suse.com>
Date: Mon, 17 Feb 2020 13:32:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200217121704.GJ4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/rcu: don't use stop_machine_run()
 for rcu_barrier()
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
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDIuMjAgMTM6MTcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gTW9uLCBGZWIg
MTcsIDIwMjAgYXQgMDE6MTE6NTlQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24g
MTcuMDIuMjAgMTI6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpIEp1ZXJnZW4sCj4+Pgo+
Pj4gT24gMTcvMDIvMjAyMCAwNzoyMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+PiArdm9pZCBy
Y3VfYmFycmllcih2b2lkKQo+Pj4+ICDCoCB7Cj4+Pj4gLcKgwqDCoCBhdG9taWNfdCBjcHVfY291
bnQgPSBBVE9NSUNfSU5JVCgwKTsKPj4+PiAtwqDCoMKgIHJldHVybiBzdG9wX21hY2hpbmVfcnVu
KHJjdV9iYXJyaWVyX2FjdGlvbiwgJmNwdV9jb3VudCwgTlJfQ1BVUyk7Cj4+Pj4gK8KgwqDCoCBp
ZiAoICFhdG9taWNfY21weGNoZygmY3B1X2NvdW50LCAwLCBudW1fb25saW5lX2NwdXMoKSkgKQo+
Pj4KPj4+IFdoYXQgZG9lcyBwcmV2ZW50IHRoZSBjcHVfb25saW5lX21hcCB0byBjaGFuZ2UgdW5k
ZXIgeW91ciBmZWV0Pwo+Pj4gU2hvdWxkbid0IHlvdSBncmFiIHRoZSBsb2NrIHZpYSBnZXRfY3B1
X21hcHMoKT8KPj4KPj4gT2gsIGluZGVlZC4KPj4KPj4gVGhpcyBpbiB0dXJuIHdpbGwgcmVxdWly
ZSBhIG1vZGlmaWNhdGlvbiBvZiB0aGUgbG9naWMgdG8gZGV0ZWN0IHBhcmFsbGVsCj4+IGNhbGxz
IG9uIG11bHRpcGxlIGNwdXMuCj4gCj4gSWYgeW91IHBpY2sgbXkgcGF0Y2ggdG8gdHVybiB0aGF0
IGludG8gYSBydyBsb2NrIHlvdSBzaG91bGRuJ3Qgd29ycnkKPiBhYm91dCBwYXJhbGxlbCBjYWxs
cyBJIHRoaW5rLCBidXQgdGhlIGxvY2sgYWNxdWlzaXRpb24gY2FuIHN0aWxsIGZhaWwKPiBpZiB0
aGVyZSdzIGEgQ1BVIHBsdWcvdW5wbHVnIGdvaW5nIG9uOgo+IAo+IGh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMC0wMi9tc2cwMDk0MC5odG1s
CgpUaGFua3MsIGJ1dCBsZXR0aW5nIHJjdV9iYXJyaWVyKCkgZmFpbCBpcyBhIG5vIGdvLCBzbyBJ
IHN0aWxsIG5lZWQgdG8KaGFuZGxlIHRoYXQgY2FzZSAoSSBtZWFuIHRoZSBjYXNlIGZhaWxpbmcg
dG8gZ2V0IHRoZSBsb2NrKS4gQW5kIGhhbmRsaW5nCm9mIHBhcmFsbGVsIGNhbGxzIGlzIG5vdCBu
ZWVkZWQgdG8gYmUgZnVuY3Rpb25hbCBjb3JyZWN0LCBidXQgdG8gYXZvaWQKbm90IG5lY2Vzc2Fy
eSBjcHUgc3luY2hyb25pemF0aW9uIChlYWNoIHBhcmFsbGVsIGNhbGwgZGV0ZWN0ZWQgY2FuIGp1
c3QKd2FpdCB1bnRpbCB0aGUgbWFzdGVyIGhhcyBmaW5pc2hlZCBhbmQgdGhlbiByZXR1cm4pLgoK
QlRXIC0gVGhlIHJlY3Vyc2l2ZSBzcGlubG9jayB0b2RheSB3b3VsZCBhbGxvdyBmb3IgZS5nLiBy
Y3VfYmFycmllcigpIHRvCmJlIGNhbGxlZCBpbnNpZGUgYSBDUFUgcGx1Zy91bnBsdWcgc2VjdGlv
bi4gWW91ciByd2xvY2sgaXMgcmVtb3ZpbmcgdGhhdApwb3NzaWJpbGl0eS4gQW55IGNoYW5jZSB0
aGF0IGNvdWxkIGJlIGhhbmRsZWQ/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
