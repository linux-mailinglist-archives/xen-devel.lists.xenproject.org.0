Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 348AD3C8D7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 12:25:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hadvJ-0003ts-O9; Tue, 11 Jun 2019 10:22:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XVUa=UK=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hadvI-0003tn-Vq
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 10:22:37 +0000
X-Inumbo-ID: d3f15bc7-8c32-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d3f15bc7-8c32-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 10:22:35 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z15so6171818lfh.13
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 03:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M01by3wrLNdSFE1R049JEC426PQ3KQxH2AaBMJvP9mU=;
 b=Q29QDdXJTRnShcoKL3Wv2OIeYE2wZ+mtAcaVLAcsGI0OVqHMly2sIoJ1sh2KsUXu5I
 r3P1EFomzFIC1PVR/yfKEZEazzUH9fUKGcGrGfqk17LYVf1rgTIsj8kSw6DwiwpNzB8F
 Q+VQkypzSO22G7jn9s0QrGtYGTpRxlNrzZaeRUfs8sv+UP/yOq/UfNfrnCJ1iGPKMjow
 Y4EyWAN+X72vmyjtShYvK50emSYCVWbGUU6ibRiA3aBXCQc+UM1lKA7ysnGPFw5mnjW4
 +639fnUqXU12J0IkipSTXzGXDhB2C4HxIABdZUSdXAiy7A78DkxShp0/WmZdltqYH6av
 ZapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M01by3wrLNdSFE1R049JEC426PQ3KQxH2AaBMJvP9mU=;
 b=XF3CIfM/LyWCIPJIEFExA4u9kf5YZa598a3ckhQSi7gDY0KlqI3hqMSHzdP122gf75
 uHI+4DHbNZbZ4kpwY2HK2PNIB9RGGbfFWeLD+jBnXpwEIKTRwcdDvqJWlLXfdW55SNNX
 NygAW1NkTySxiBxAYBvsaK0mlJ7VHdrNZMBePsIErjyjJ/+pyozMQ0I6pOqJefO3aEv/
 Qxfb94pWlJEHfZvjEj75XFiczvVtPcoWDUPsk7jYsvIiCLn02usU4isWWWobkWB8QL+l
 bci0CChA+PiW1PavGDjIP1VKnSBFJEx0P11wsBv6L8I1oJQz4bIaP/Zm1gYbxLbXCRdL
 sm9Q==
X-Gm-Message-State: APjAAAVlA2Pvt7seRB2pfyyKTVDr66YkQ9Yz3lXKwBYoJXurk8U379mK
 sFoQGSRXc8CC9ftr4soybwg=
X-Google-Smtp-Source: APXvYqwAd6nHK5D2U1+pA79fPNOcgN/WT96JKpGvbb1NOclDS1wWwl2Q7wx8tTykNS5xvBye47pT1A==
X-Received: by 2002:ac2:4156:: with SMTP id c22mr36540207lfi.12.1560248553692; 
 Tue, 11 Jun 2019 03:22:33 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 y127sm2429130lff.34.2019.06.11.03.22.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:22:33 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <92d534ef-082e-58d7-a4ff-c74cf7c23195@gmail.com>
Date: Tue, 11 Jun 2019 13:22:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSmFuLAoKT24gMTEuMDYuMTkgMTI6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gRXhj
ZXB0IHdoZW4gdGhlcmUncyBubyBuZWVkIGZvciBLUFRJIGluIHRoZSBndWVzdCBpbiB0aGUgZmly
c3QgcGxhY2UsCj4+PiBhcyBpcyB0aGUgY2FzZSBmb3IgeDg2LTY0IFBWIGd1ZXN0cy4gSSB0aGlu
ayB0aGlzIGlzIHdvcnRod2hpbGUgY2xhcmlmeWluZy4KPj4KPj4gSSBhbSBub3Qgc3VyZSB3aGF0
IGlzIHlvdXIgcG9pbnQgaGVyZS4gQXQgbGVhc3Qgb24gQXJtLCB1c2luZyB2aXJ0dWFsIGFkZHJl
c3MgaXMKPj4gbm90IHNhZmUgYXQgYWxsICh3aGV0aGVyIEtQVEkgaXMgdXNlZCBvciBub3QpLiBB
IGd1ZXN0IGNhbiBnZW51aW5lbHkgZGVjaWRlcyB0bwo+PiBzaGF0dGVyIHRoZSBtYXBwaW5nIHdo
ZXJlIHRoZSB2aXJ0dWFsIGFkZHJlc3MgaXMuIE9uIEFybSwgdGhpcyByZXF1aXJlIHRvIHVzZQo+
PiB0aGUgYnJlYWstYmVmb3JlLW1ha2Ugc2VxdWVuY2UuIEl0IG1lYW5zIHRoZSB0cmFuc2xhdGlv
biBWQSAtPiBQQSBtYXkgZmFpbCBpcwo+PiB5b3UgaGFwcGVuIHRvIGRvIGl0IHdoaWxlIHRoZSBn
dWVzdCBpcyB1c2luZyB0aGUgc2VxdWVuY2UuCj4+Cj4+IFNvbWUgb2YgdGhlIGludGVybWl0dGVu
dCBpc3N1ZXMgSSBoYXZlIHNlZW4gb24gdGhlIEFybmRhbGUgaW4gdGhlIHBhc3QgWzFdIG1pZ2h0
Cj4+IGJlIHJlbGF0ZWQgdG8gdXNpbmcgdmlydHVhbCBhZGRyZXNzLiBJIGFtIG5vdCAxMDAlIHN1
cmUgYmVjYXVzZSBldmVuIGlmIHRoZQo+PiBkZWJ1ZywgdGhlIGVycm9yIGRvZXMgbm90IG1ha2Ug
c2Vuc2UuIEJ1dCB0aGlzIGlzIHRoZSBtb3N0IHBsYXVzaWJsZSByZWFzb24gZm9yCj4+IHRoZSBm
YWlsdXJlLgo+IAo+IEFsbCBmaW5lLCBidXQgQXJtLXNwZWNpZmljLiBUaGUgcG9pbnQgb2YgbXkg
Y29tbWVudCB3YXMgdG8gYXNrIHRvIGNhbGwKPiBvdXQgdGhhdCB0aGVyZSBpcyBvbmUgZW52aXJv
bm1lbnQgKHg4Ni02NCBQVikgd2hlcmUgdGhpcyBLUFRJCj4gZGlzY3Vzc2lvbiBpcyBlbnRpcmVs
eSBpbmFwcGxpY2FibGUuCgpJIGFkbWl0IHRoYXQgeDg2IHNwZWNpZmljcyBhcmUgcXVpdGUgdW5j
bGVhciB0byBtZSBzbyBjbGFyaWZpY2F0aW9ucyBhbmQgY29ycmVjdGlvbnMgaW4gdGhhdCBkb21h
aW4gYXJlIGRlc2lyYWJsZS4KCj4gCj4+Pj4gQEAgLTM1LDggKzM3LDE2IEBAIGFyY2hfY29tcGF0
X3ZjcHVfb3AoCj4+Pj4gICAgICAgICAgICAgICAgICFjb21wYXRfaGFuZGxlX29rYXkoYXJlYS5h
ZGRyLmgsIDEpICkKPj4+PiAgICAgICAgICAgICAgICBicmVhazsKPj4+PiAgICAKPj4+PiArICAg
ICAgICB3aGlsZSggeGNoZygmdi0+cnVuc3RhdGVfaW5fdXNlLCAxKSA9PSAwKTsKPj4+Cj4+PiBB
dCB0aGUgdmVyeSBsZWFzdCBzdWNoIGxvb3BzIHdhbnQgYSBjcHVfcmVsYXgoKSBpbiB0aGVpciBi
b2RpZXMuCj4+PiBCdXQgdGhpcyBiZWluZyBvbiBhIGh5cGVyY2FsbCBwYXRoIC0gYXJlIHRoZXJl
IHRoZW9yZXRpY2FsIGd1YXJhbnRlZXMKPj4+IHRoYXQgYSBndWVzdCBjYW4ndCBhYnVzZSB0aGlz
IHRvIGxvY2sgdXAgYSBDUFU/Cj4+IEhtbW0sIEkgc3VnZ2VzdGVkIHRoaXMgYnV0IGl0IGxvb2tz
IGxpa2UgYSBndWVzdCBtYXkgY2FsbCB0aGUgaHlwZXJjYWxsIG11bHRpcGxlCj4+IHRpbWUgZnJv
bSBkaWZmZXJlbnQgdkNQVS4gU28gdGhpcyBjb3VsZCBiZSBhIHdheSB0byBkZWxheSB3b3JrIG9u
IHRoZSBDUFUuCgpKdWxpZW4sIEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgaG93IHdvcmsgb24g
KHA/KUNQVSBjb3VsZCBiZSBkZWxheWVkLiBXZSBhcmUgaGVyZSB3aXRoIGludGVycnVwdHMgZW5h
YmxlZCwgc28gaGVyZSBndWVzdCB3b3VsZCBqdXN0IHNwZW5kIGhpcyBvd24gdmNwdSB0aW1lIGJ1
ZGdldC4gT24gdGhlIHJ1bnN0YXRlIHVwZGF0ZSB0aGVyZSBpcyBhIGtpbmQtb2YgdHJ5bG9jaywg
c28gd2Ugd291bGQgbm90IGhhbmcgdGhlcmUgZWl0aGVyLiBTbyB3aGF0IHRoZSBwcm9ibGVtPwoK
Pj4gSSB3YW50ZWQgdG8gbWFrZSB0aGUgY29udGV4dCBzd2l0Y2ggbW9zdGx5IGxvY2tsZXNzIGFu
ZCB0aGVyZWZvcmUgYXZvaWRpbmcgdG8KPj4gaW50cm9kdWNlIGEgc3BpbmxvY2suPgo+IFdlbGws
IGNvbnN0cnVjdHMgbGlrZSB0aGUgYWJvdmUgYXJlIHRyeWluZyB0byBtaW1pYyBhIHNwaW5sb2Nr
Cj4gd2l0aG91dCBhY3R1YWxseSB1c2luZyBhIHNwaW5sb2NrLiBUaGVyZSBhcmUgZXh0cmVtZWx5
IHJhcmUKPiBzaXR1YXRpb24gaW4gd2hpY2ggdGhpcyBtYXkgaW5kZWVkIGJlIHdhcnJhbnRlZCwg
YnV0IGhlcmUgaXQKPiBmYWxscyBpbiB0aGUgY29tbW9uICJtYWtlcyB0aGluZ3Mgd29yc2Ugb3Zl
cmFsbCIgYnVja2V0LCBJCj4gdGhpbmsuIFRvIG5vdCB1bmR1bHkgcGVuYWxpemUgdGhlIGFjdHVh
bCB1cGRhdGUgcGF0aHMsIEkgdGhpbmsKPiB1c2luZyBhIHIvdyBsb2NrIHdvdWxkIGJlIGFwcHJv
cHJpYXRlIGhlcmUuCgpGaXJzdGx5IEkgZGlkIG5vdCB0aGluayByL3cgbG9jayBzcGVjaWZpY3Mg
YXJlIG5lZWRlZCBoZXJlLiBXZSBoYXZlIG9ubHkgb25lIHJlYWRlciBwYXRoIC0gcnVuc3RhdGUg
dXBkYXRlIG9uIHZjcHUgc2NoZWR1bGluZy4gQW5kIHRoaXMgcGF0aCBjYW4gaGF2ZSBvbmx5IG9u
ZSBpbnN0YW5jZSBhdCB0aGUgdGltZS4KQnV0IGl0IHNlZW1zIHRvIGJlIG1vcmUgZWZmaWNpZW50
IHRoYW4gdGhlIHNwaW5sb2NrIGZvciB0aGUgY2FzZSB3ZSBhcmUgbm90IGxvY2tpbmcuCgotLSAK
U2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
