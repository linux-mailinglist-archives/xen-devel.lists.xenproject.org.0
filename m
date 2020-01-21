Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD48F14461F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 21:55:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu0VE-0004p5-Ji; Tue, 21 Jan 2020 20:52:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l6hc=3K=amazon.com=prvs=282d95d55=elnikety@srs-us1.protection.inumbo.net>)
 id 1iu0VC-0004ow-BM
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 20:51:58 +0000
X-Inumbo-ID: db79c3de-3c8f-11ea-bb6f-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db79c3de-3c8f-11ea-bb6f-12813bfff9fa;
 Tue, 21 Jan 2020 20:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579639915; x=1611175915;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=IGuulhGD2ltsoKJY6LFzOHEH3nY3czi8yD5QFIGelvc=;
 b=bXt+AMVWw/3ii0ztYCvxkI90Lpn4R/rpKCHgkwthsi1VEVMcSZ2qtD1/
 U2tFnbR1kiG/ZWVI4MQvboXAPw3JClzVSsxwB/fpRGjKWICiEkbTguECl
 VHF5Pxs/2YGd2FfIlN+d8zONgMtUnL1T4rRjKkOopuLW1rkB7Yvdp/Y21 E=;
IronPort-SDR: 2TOuh7KyD47PjSb7NUDWa+bKpO2gF4y9YbewNuzfwhhC8cJCwV7rfzT6I4gJwnz/vaACuhhr8z
 1HFs0ix1Hw0w==
X-IronPort-AV: E=Sophos;i="5.70,347,1574121600"; d="scan'208";a="14097446"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 21 Jan 2020 20:51:53 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 7C70DA2961; Tue, 21 Jan 2020 20:51:52 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 21 Jan 2020 20:51:52 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.161.78) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 21 Jan 2020 20:51:45 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <068a32f917937baca179d7ff4c483ec1584defb4.1576630344.git.elnikety@amazon.com>
 <bde6c6be-3d32-fa8b-6ccf-6d48e6104663@suse.com>
 <ed080480-f5ab-59df-2c92-39d9e3b6c5ca@amazon.com>
 <07a1fdbb-22f4-3663-22fc-058558b264eb@suse.com>
 <b3de514c-dc21-7a34-b35f-a520dec843b0@amazon.com>
 <c26e9510-9a32-dfde-e786-f005ef66e019@suse.com>
 <d93d5931-6b59-649b-c989-9263c3c9a913@amazon.com>
 <f3f0f684-2520-e7de-870a-7d7be40f66b2@suse.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <75c6a71c-f1d2-0c10-663a-153b329cf2c9@amazon.com>
Date: Tue, 21 Jan 2020 21:51:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f3f0f684-2520-e7de-870a-7d7be40f66b2@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.161.78]
X-ClientProxiedBy: EX13D27UWB004.ant.amazon.com (10.43.161.101) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/microcode: Improve documentation
 and parsing for ucode=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAgMTA6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIxLjAxLjIwMjAgMDA6
NTAsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+PiBPbiAyMC4wMS4yMCAwOTo0MiwgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+PiBPbiAxNy4wMS4yMDIwIDIwOjA2LCBFc2xhbSBFbG5pa2V0eSB3cm90ZToK
Pj4+PiBPbiAyMC4xMi4xOSAxMDo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE5LjEy
LjIwMTkgMjI6MDgsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+Pj4+Pj4gT24gMTguMTIuMTkgMTI6
NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDE4LjEyLjIwMTkgMDI6MzIsIEVzbGFt
IEVsbmlrZXR5IHdyb3RlOgo+Pj4+Pj4+PiBEZWNvdXBsZSB0aGUgbWljcm9jb2RlIHJlZmVyZW5j
aW5nIG1lY2hhbmlzbSB3aGVuIHVzaW5nIEdSVUIgdG8gdGhhdAo+Pj4+Pj4+PiB3aGVuIHVzaW5n
IEVGSS4gVGhpcyBhbGxvd3MgdXMgdG8gYXZvaWQgdGhlICJ1bnNwZWNpZmllZCBlZmZlY3QiIG9m
Cj4+Pj4+Pj4+IHVzaW5nIGA8aW50ZWdlcj4gfCBzY2FuYCBhbG9uZyB4ZW4uZWZpLgo+Pj4+Pj4+
Cj4+Pj4+Pj4gSSBndWVzcyAidW5zcGVjaWZpZWQgZWZmZWN0IiBpbiB0aGUgZG9jIHdhcyBwcmV0
dHkgcG9pbnRsZXNzIC0gc3VjaAo+Pj4+Pj4+IG9wdGlvbnMgaGF2ZSBiZWVuIGlnbm9yZWQgYmVm
b3JlOyBpbiBmYWN0IC4uLgo+Pj4+Pj4+Cj4+Pj4+Pj4+IFdpdGggdGhhdCwgWGVuIGNhbiBleHBs
aWNpdGx5Cj4+Pj4+Pj4+IGlnbm9yZSB0aG9zZSBuYW1lZCBvcHRpb25zIHdoZW4gdXNpbmcgRUZJ
Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gLi4uIEkgZG9uJ3Qgc2VlIHRoaW5ncyBiZWNvbWluZyBhbnkgbW9y
ZSBleHBsaWNpdCAobm90IGV2ZW4gcGFyc2luZwo+Pj4+Pj4+IHRoZSBvcHRpb25zIHdhcyBxdWl0
ZSBleHBsaWNpdCB0byBtZSkuCj4+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBJIGFncmVlIHRoYXQgdGhv
c2Ugb3B0aW9ucyBoYXZlIGJlZW4gaWdub3JlZCBzbyBmYXIgaW4gdGhlIGNhc2Ugb2YgRUZJLgo+
Pj4+Pj4gVGhlIGRvY3VtZW50YXRpb24gY29udHJhZGljdHMgdGhhdCBob3dldmVyLiBUaGUgZG9j
dW1lbnRhdGlvbjoKPj4+Pj4+ICogc2F5cyA8aW50ZWdlcj4gaGFzIHVuc3BlY2lmaWVkIGVmZmVj
dC4KPj4+Pj4+ICogZG9lcyBub3QgbWVudGlvbiBhbnl0aGluZyBhYm91dCBzY2FuIGJlaW5nIGln
bm9yZWQuCj4+Pj4+Pgo+Pj4+Pj4gV2l0aCB0aGlzIHBhdGNoLCBpdCBpcyBleHBsaWNpdCBpbiBj
b2RlIGFuZCBpbiBkb2N1bWVudGF0aW9uIHRoYXQgYm90aAo+Pj4+Pj4gb3B0aW9ucyBhcmUgaWdu
b3JlZCBpbiBjYXNlIG9mIEVGSS4KPj4+Pj4KPj4+Pj4gQnV0IGlzbid0IGl0IHJhdGhlciB0aGF0
IHVjb2RlPXNjYW4gY291bGQgKGFuZCBoZW5jZSBwZXJoYXBzIHNob3VsZCkKPj4+Pj4gYWxzbyBo
YXZlIGl0cyB2YWx1ZSBvbiBFRkk/Cj4+Pj4+Cj4+Pj4KPj4+PiBJIGRvIG5vdCBzZWUgInVjb2Rl
PXNjYW4iIGFwcGxpY2FibGUgaW4gYW55d2F5IGluIHRoZSBjYXNlIG9mIEVGSS4gSW4KPj4+PiBF
RkksIHRoZXJlIGFyZSBub3QgIm1vZHVsZXMiIHRvIHNjYW4gdGhyb3VnaCwgYnV0IHJhdGhlciB0
aGUgZWZpIGNvbmZpZwo+Pj4+IHBvaW50cyBleGFjdGx5IHRvIHRoZSBtaWNyb2NvZGUgYmxvYi4K
Pj4+Cj4+PiBXaGF0IHdvdWxkIGJlIHdyb25nIHdpdGggdGhlIEVGSSBjb2RlIHRvIGFsc28gaW5z
cGVjdCB3aGF0ZXZlciBoYXMgYmVlbgo+Pj4gc3BlY2lmaWVkIHdpdGggcmFtZGlzaz0gaWYgdGhl
cmUgd2FzIG5vIHVjb2RlPSA/Cj4+Cj4+IEkgc2VlLCBpbnRlcmVzdGluZy4gVGhpcyBzb3VuZHMg
bGlrZSBhIGxlZ2l0aW1hdGUgdXNlIGNhc2UgaW5kZWVkLiBJCj4+IHdvbmRlciwgd291bGQgSSBi
ZSBicmVha2luZyBhbnl0aGluZyBpZiBJIHNpbXBseSBhbGxvdyB0aGUgZXhpc3RpbmcgY29kZQo+
PiB0aGF0IGl0ZXJhdGVzIG92ZXIgbW9kdWxlcyB0byBraWNrIGluIHdoZW4gdWNvZGU9c2NhbiBp
cnJlc3BlY3RpdmUgb2YKPj4gRUZJIG9yIGxlZ2FjeSBib290Pwo+IAo+IEkgZG9uJ3QgdGhpbmsg
c28sIG5vLCBidXQgaXQgd291bGQgbmVlZCBkb3VibGUgY2hlY2tpbmcgKGFuZAo+IG1lbnRpb25p
bmcgaW4gdGhlIGRlc2NyaXB0aW9uIGFuZC9vciBkb2N1bWVudGF0aW9uKS4KPiAKPj4gQWxzbywg
aXQgc2VlbXMgdG8gbWUgdGhhdCB0aGUgdWNvZGU9IHNwZWNpZmllZCBieQo+PiBlZmkuY2ZnIHdv
dWxkIHRha2UgcHJlY2VkZW5jZSBvdmVyIHRoZSB1Y29kZT1zY2FuLiBEbyBub3QgeW91IHRoaW5r
Pwo+IAo+IEkgZ3Vlc3Mgd2UgbmVlZCB0byBzZXR0bGUgb24gd2hhdCB3ZSB3YW50IHRvIHRha2Ug
cHJlY2VkZW5jZSBhbmQKPiB0aGVuIG1ha2Ugc3VyZSBjb2RlIGFsc28gYmVoYXZlcyB0aGlzIHdh
eS4gQnV0IHllcywgSSB0aGluayB1Y29kZT0KPiBmcm9tIHRoZSAuY2ZnIHNob3VsZCBzdXBlcnNl
ZGUgdWNvZGU9c2NhbiBvbiB0aGUgY29tbWFuZCBsaW5lLiBBCj4gcG9zc2libHkgdXNlZnVsIGFk
anVzdG1lbnQgdG8gdGhpcyBtaWdodCBiZSB0byBkaXN0aW5ndWlzaCB3aGV0aGVyCj4gdGhlIHVj
b2RlPXNjYW4gd2FzIGluIGEgc3BlY2lmaWMgLmNmZyBzZWN0aW9uIHdoaWxlIHRoZSB1Y29kZT0g
d2FzCj4gaW4gW2dsb2JhbF0gKGkuZS4gc29ydCBvZiBhIGRlZmF1bHQpLCBpbiB3aGljaCBjYXNl
IG1heWJlIHRoZQo+IHVjb2RlPXNjYW4gc2hvdWxkIHdpbi4gVGhvdWdodHM/Cj4gCj4gSmFuCj4g
CgpJIHRoaW5rIGFueSB1Y29kZT0gaW4gdGhlIEVGSSAuY2ZnIG91Z2h0IHRvIHN1cGVyc2VkZSB0
aGUgdWNvZGU9c2Nhbi4gClRoZSBzZW1hbnRpY3MgYXJlIHNpbXBsZXIgaW4gdGhpcyBjYXNlLCBy
YXRoZXIgdGhhbiBoYXZpbmcgdG8gd29ycnkgCmFib3V0IHdoZXJlIGV4YWN0bHkgdGhlIHVjb2Rl
PSB3YXMgc3BlY2lmaWVkIGluIHRoZSBFRkkgLmNmZy4gV2l0aCB0aGF0LCAKYW4gYWRtaW5pc3Ry
YXRvciB3b3VsZCBkZWZhdWx0IHRvIHVzaW5nIHVjb2RlPXNjYW4gb24gdGhlIGNvbW1hbmRsaW5l
IHRvIApsb2FkIHRoZSByYW1kaXNrIG1pY3JvY29kZSwgYW5kIGEgdWNvZGU9IGluIC5jZmcgd291
bGQgYmUgYW4gZXhwbGljaXQgCnNpZ25hbCB0byB1c2UgZGlmZmVyZW50IG1pY3JvY29kZS4KCkVz
bGFtCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
