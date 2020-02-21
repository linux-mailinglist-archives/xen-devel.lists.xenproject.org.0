Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9544316819C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:29:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5ADJ-0000m9-IC; Fri, 21 Feb 2020 15:27:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j5ADI-0000m4-8k
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 15:27:36 +0000
X-Inumbo-ID: af633d2e-54be-11ea-869d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af633d2e-54be-11ea-869d-12813bfff9fa;
 Fri, 21 Feb 2020 15:27:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 25772AD5C;
 Fri, 21 Feb 2020 15:27:34 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
 <e5be3888-6252-f03c-675d-8d7dfd9330b8@xen.org>
 <21c59ebb-e396-447f-5ac1-d7e2efd76bb5@suse.com>
 <430123f5-afa9-4364-b703-f26279a7c585@xen.org>
 <21dcd066-87b0-4498-ba18-bfec718c7f1d@suse.com>
 <5005d791-7d8f-ca03-4c16-7dc9d19bc8e6@xen.org>
 <92fa042e-a880-8b56-4255-c8d19654908b@suse.com>
 <6163a60b-5a7f-90c0-1ba3-e9a96f8e88f2@xen.org>
 <db345ddc-f60a-8567-dcce-4119ef6c1611@suse.com>
 <0b7ea2b3-bb41-c85b-c75d-0fc2ff833c76@suse.com>
 <2049bdec-56a7-16bc-295c-d8cc967f4295@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d04b995-023e-da98-e0b8-d8d729c435a5@suse.com>
Date: Fri, 21 Feb 2020 16:27:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2049bdec-56a7-16bc-295c-d8cc967f4295@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxNjoyMywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMS4wMi4yMCAx
NjoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjAyLjIwMjAgMTY6MTMsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAyMS4wMi4yMCAxNTo1MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+
Pj4+IFlvdSBhcmUgYXNzdW1pbmcgdGhhdCBhdG9taWNfdCB3aWxsIGFsd2F5cyBiZToKPj4+Pgo+
Pj4+IHN0cnVjdAo+Pj4+IHsKPj4+PiAgIMKgIGludCBjb3VudGVyOwo+Pj4+IH0KPj4+Pgo+Pj4+
IFdoYXQgaWYgd2UgZGVjaWRlIHRvIHR1cm4gaW50bwo+Pj4+Cj4+Pj4gc3RydWN0Cj4+Pj4gewo+
Pj4+ICAgwqAgYm9vbCBhOwo+Pj4+ICAgwqAgaW50IGNvdW50ZXI7Cj4+Pj4gfQo+Pj4KPj4+IEFz
IHNhaWQgYmVmb3JlOiB0aGVuIHF1ZXVlX3dyaXRlX2xvY2tfc2xvd3BhdGgoKSBpcyBhbHJlYWR5
IGJyb2tlbi4KPj4KPj4gV2h5PyBUaGUgYXRvbWljXyooKSB1c2VkIHdvdWxkIHN0aWxsIG9ubHkg
YWN0IG9uIHRoZSBjb3VudGVyIGZpZWxkCj4+IChmb3IgdGhlaXIgYWN0dWFsIG9wZXJhdGlvbiwg
aS5lLiB3aGF0IG1hdHRlcnMgdG8gY2FsbGVyczsgdGhlCj4+IG90aGVyIGZpZWxkKHMpIGNvdWxk
IGJlIHN0YXRpc3RpY3Mgb3Igd2hhdGV2ZXIpLgo+IAo+IE5vOgo+IAo+IHUzMiBjbnRzOwo+IC4u
Lgo+IGlmICggIShjbnRzICYgX1FXX1dNQVNLKSAmJgo+ICAgICAgIChhdG9taWNfY21weGNoZygm
bG9jay0+Y250cywgY250cywKPiAgICAgICAgICAgICAgICAgICAgICAgY250cyB8IF9RV19XQUlU
SU5HKSA9PSBjbnRzKSApCgpJIG11c3QgYmUgYmxpbmQgdGhlbi4gQXMgc2FpZCwgYXRvbWljX2Nt
cHhjaGcoKSB3b3VsZCBzdGlsbCAoZm9yIHRoZQpwdXJwb3NlIG9mIGNvbnN1bWluZyAiY250cyIp
IGFjdCBvbiBvbmx5IHRoZSAiY291bnRlciIgZmllbGQuIEl0IG1heQphZGRpdGlvbmFsbHkgZS5n
LiBpbmNyZW1lbnQgYSBzdGF0cyBjb3VudGVyLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
