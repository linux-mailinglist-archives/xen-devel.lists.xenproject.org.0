Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C98C15D4E1
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 10:41:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2XPZ-0008R1-E5; Fri, 14 Feb 2020 09:37:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QOel=4C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j2XPX-0008Qw-Hz
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 09:37:23 +0000
X-Inumbo-ID: 997b6a92-4f0d-11ea-b9eb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 997b6a92-4f0d-11ea-b9eb-12813bfff9fa;
 Fri, 14 Feb 2020 09:37:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E0067AFAE;
 Fri, 14 Feb 2020 09:37:20 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200213125449.14226-1-jgross@suse.com>
 <1f5db5a6-e5c3-4d63-fdb4-e027d38bea18@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <479abfd7-8fc2-526d-ed72-033aadc96f7c@suse.com>
Date: Fri, 14 Feb 2020 10:37:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1f5db5a6-e5c3-4d63-fdb4-e027d38bea18@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/8] xen: don't let keyhandlers block
 indefinitely on locks
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDIuMjAyMCAxOTozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMy8wMi8yMDIw
IDEyOjU0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBLZXloYW5kbGVycyBkdW1waW5nIGh5cGVy
dmlzb3IgaW5mb3JtYXRpb24gdG8gdGhlIGNvbnNvbGUgb2Z0ZW4gbmVlZAo+PiB0byB0YWtlIGxv
Y2tzIHdoaWxlIGFjY2Vzc2luZyBkYXRhLiBJbiBvcmRlciB0byBub3QgYmxvY2sgaW4gY2FzZSBv
Zgo+PiBzeXN0ZW0gaW5jb25zaXN0ZW5jaWVzIGl0IGlzIGNvbnZlbmllbnQgdG8gdXNlIHRyeWxv
Y2sgdmFyaWFudHMgd2hlbgo+PiBvYnRhaW5pbmcgdGhlIGxvY2tzLiBPbiB0aGUgb3RoZXIgaGFu
ZCBhIGJ1c3kgc3lzdGVtIG1pZ2h0IGVhc2lseQo+PiBlbmNvdW50ZXIgaGVsZCBsb2Nrcywgc28g
dGhpcyBwYXRjaCBzZXJpZXMgaXMgYWRkaW5nIHNwZWNpYWwgdHJ5bG9jawo+PiB2YXJpYW50cyB3
aXRoIGEgdGltZW91dCB1c2VkIGJ5IGtleWhhbmRsZXJzLgo+IAo+IFRoaXMgaXMgYSBiYWNrd2Fy
ZHMgc3RlcC4KPiAKPiBLZXloYW5kbGVycyBhcmUgZm9yIGRlYnVnZ2luZyBwdXJwb3Nlcy7CoCBX
aGVuIGRlYnVnZ2luZyBpdCBpcyBmYXIgbW9yZSAKPiBpbXBvcnRhbnQgdG8gZ2V0IHRoZSByZXF1
ZXN0ZWQgZGF0YSwgdGhhbiBhbG1vc3QgYW55dGhpbmcgZWxzZS4KPiAKPiBUaGUgc3lzdGVtIHdp
bGwgY29wZSB3aXRoIGEgbXVsdGktc2Vjb25kIG91dGFnZSBvY2N1cnJpbmcgYXBwcm94aW1hdGVs
eSAKPiBuZXZlci7CoCBBIHBlcnNvbiBkZWJ1Z2dpbmcgd2hvIGNhbid0IGdldCB0aGUgZGF0YSBo
YXMgbm8gY2hhbmNlIG9mIAo+IGZpeGluZyB3aGF0ZXZlciBwcm9ibGVtIHRoZXkgYXJlIGxvb2tp
bmcgZm9yLgo+IAo+IFRoaXMgc2VyaWVzIHNlZW1zIHRvIGJlIGJyZWFraW5nIHRoZSBvbmUgY3Jp
dGljYWwgdXNlY2FzZSBmb3IgCj4ga2V5aGFuZGxlcnMsIHRvIGZpeCB3aGF0IC0gbm90IGxldCBk
ZWJ1Z2dpbmcgZ2V0IGluIHRoZSB3YXkgb2YgdGhlIAo+IHNtb290aCBydW5uaW5nIG9mIHRoZSBz
eXN0ZW0/wqAgQSBzeXN0ZW0gaW4gbmVlZCBvZiBkZWJ1Z2dpbmcgaW4gdGhlIAo+IGZpcnN0IHBs
YWNlIGhhcyBiaWdnZXIgcHJvYmxlbXMgdGhhbiBuZWVkaW5nIHRvIHJ1biBzbW9vdGhseS4KCkkg
Y2VydGFpbmx5IGFjY2VwdCB3aGF0IHlvdSBzYXkgZnVydGhlciB1cCwgYnV0IEkgZG9uJ3QgdGhp
bmsgdGhpcwpsYXN0IHN0YXRlbWVudCBpcyB1bml2ZXJzYWxseSB0cnVlLiBUaGVyZSBtYXkgYmUg
YSBzaW5nbGUgZ3Vlc3QgaW4KdHJvdWJsZSwgd2hpY2ggLSB0byBmaW5kIG91dCBhYm91dCBpdHMg
c3RhdGUgLSBzb21lIGRlYnVnZ2luZyBrZXlzCm1heSB3YW50IGlzc3VpbmcuIERpc3R1cmJpbmcg
dGhlIGhvc3QgYW5kIGFsbCBvdGhlciBndWVzdHMgZm9yIHRoaXMKaXMgbm90IGEgZ29vZCBpZGVh
IGltby4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
