Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C896B182C52
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 10:24:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCK2N-0002wD-Qf; Thu, 12 Mar 2020 09:21:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCK2L-0002w8-Ft
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 09:21:53 +0000
X-Inumbo-ID: e8940810-6442-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8940810-6442-11ea-b34e-bc764e2007e4;
 Thu, 12 Mar 2020 09:21:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3E35DAC26;
 Thu, 12 Mar 2020 09:21:51 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200311183455.23729-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2ad6f0e6-60ed-572f-18f5-1c701d3c9495@suse.com>
Date: Thu, 12 Mar 2020 10:21:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311183455.23729-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: Fix deadlock with MSR bitmap
 merging
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDMuMjAyMCAxOTozNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBjL3MgYzQ3OTg0YWFi
ZWFkICJudm14OiBpbXBsZW1lbnQgc3VwcG9ydCBmb3IgTVNSIGJpdG1hcHMiIGludHJvZHVjZWQg
YSB1c2Ugb2YKPiBtYXBfZG9tYWluX3BhZ2UoKSB3aGljaCBtYXkgZ2V0IHVzZWQgaW4gdGhlIG1p
ZGRsZSBvZiBjb250ZXh0IHN3aXRjaC4KPiAKPiBUaGlzIGlzIG5vdCBzYWZlLCBhbmQgY2F1c2Vz
IFhlbiB0byBkZWFkbG9jayBvbiB0aGUgbWFwY2FjaGUgbG9jazoKPiAKPiAgIChYRU4pIFhlbiBj
YWxsIHRyYWNlOgo+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjJkNmFlPl0gUiBfc3Bpbl9sb2Nr
KzB4MzQvMHg1ZQo+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMzIxOWQ3Pl0gRiBtYXBfZG9tYWlu
X3BhZ2UrMHgyNTAvMHg1MjcKPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDM1NjMzMj5dIEYgZG9f
cGFnZV9mYXVsdCsweDQyMC8weDc4MAo+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMzhkYTNkPl0g
RiB4ODZfNjQvZW50cnkuUyNoYW5kbGVfZXhjZXB0aW9uX3NhdmVkKzB4NjgvMHg5NAo+ICAgKFhF
TikgICAgWzxmZmZmODJkMDgwMzE3MjlmPl0gRiBfX2ZpbmRfbmV4dF96ZXJvX2JpdCsweDI4LzB4
NjkKPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDMyMWE0ZD5dIEYgbWFwX2RvbWFpbl9wYWdlKzB4
MmM2LzB4NTI3Cj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyOWVlYjI+XSBGIG52bXhfdXBkYXRl
X2V4ZWNfY29udHJvbCsweDFkNy8weDMyMwo+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjk5ZjVh
Pl0gRiB2bXhfdXBkYXRlX2NwdV9leGVjX2NvbnRyb2wrMHgyMy8weDQwCj4gICAoWEVOKSAgICBb
PGZmZmY4MmQwODAyOWEzZjc+XSBGIGFyY2gveDg2L2h2bS92bXgvdm14LmMjdm14X2N0eHRfc3dp
dGNoX2Zyb20rMHhiNy8weDEyMQo+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMzFkNzk2Pl0gRiBh
cmNoL3g4Ni9kb21haW4uYyNfX2NvbnRleHRfc3dpdGNoKzB4MTI0LzB4NGE5Cj4gICAoWEVOKSAg
ICBbPGZmZmY4MmQwODAzMjA5MjU+XSBGIGNvbnRleHRfc3dpdGNoKzB4MTU0LzB4NjJjCj4gICAo
WEVOKSAgICBbPGZmZmY4MmQwODAyNTJmM2U+XSBGIGNvbW1vbi9zY2hlZC9jb3JlLmMjc2NoZWRf
Y29udGV4dF9zd2l0Y2grMHgxNmEvMHgxNzUKPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDI1Mzg3
Nz5dIEYgY29tbW9uL3NjaGVkL2NvcmUuYyNzY2hlZHVsZSsweDJhZC8weDJiYwo+ICAgKFhFTikg
ICAgWzxmZmZmODJkMDgwMjJjYzk3Pl0gRiBjb21tb24vc29mdGlycS5jI19fZG9fc29mdGlycSsw
eGI3LzB4YzgKPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDIyY2QzOD5dIEYgZG9fc29mdGlycSsw
eDE4LzB4MWEKPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDJhMmZiYj5dIEYgdm14X2FzbV9kb192
bWVudHJ5KzB4MmIvMHgzMAo+IAo+IENvbnZlcnQgdGhlIGRvbWhlYXAgcGFnZSBpbnRvIGJlaW5n
IGEgeGVuaGVhcCBwYWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKPiBJIHN1c3BlY3QgdGhpcyBpcyB0aGUgbm90LXF1aXRlLWNvbnNpc3RlbnQt
ZW5vdWdoLXRvLWJpc2VjdCBpc3N1ZSB3aGljaAo+IE9TU1Rlc3QgaXMgaGl0dGluZyBhbmQgaW50
ZXJmZXJpbmcgd2l0aCBwdXNoZXMgdG8gbWFzdGVyLgoKSGF2aW5nIGxvb2tlZCBhdCBhIG51bWJl
ciBvZiAoYWxiZWl0IG5vdCBhbGwpIGZhaWx1cmVzLCBJIGRvbid0CnRoaW5rIEkndmUgc2VlbiBh
bnkgc2lnbiBvZiBhIGNyYXNoIGxpa2UgdGhlIG9uZSBhYm92ZS4gRG8geW91CnRoaW5rIHRoZXJl
IGFyZSBtb3JlIHN1YnRsZSBtYW5pZmVzdGF0aW9ucyBvZiB0aGUgaXNzdWU/IEFsc28KaXQgaXMg
bXkgdW5kZXJzdGFuZGluZyB0aGF0IHRoaXMgaXNzdWUgc2hvdWxkbid0IGdldCBpbiB0aGUKd2F5
IG9mIGFueSBub24tbmVzdGVkIHRlc3RzIChvZiB3aGljaCB3ZSd2ZSBoYWQgdmFyeWluZyBzZXRz
IG9mCmZhaWx1cmVzKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
