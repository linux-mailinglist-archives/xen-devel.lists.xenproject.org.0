Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B78E175986
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 12:29:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8jCt-00066E-OF; Mon, 02 Mar 2020 11:25:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wc/r=4T=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j8jCr-000669-Ui
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 11:25:53 +0000
X-Inumbo-ID: 934e9e6f-5c78-11ea-9f4b-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 934e9e6f-5c78-11ea-9f4b-12813bfff9fa;
 Mon, 02 Mar 2020 11:25:53 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p3so12860694edx.7
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2020 03:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BQjMX/WxPwUxOROwpZKSR4glJUR1lw+Y6C4H37/SxHc=;
 b=OJeCSWbKDEPV4FmGZKWUWJUfXQduVufieBpr8gzvG1I1pQ073QmDvBMJ0VDoettlM2
 8vKn48AXBJnhRPrc7QcbAPkET+a1Jh+nzJ/+hU6wKw+v/muaQSZ2G26qeWKogVguZKTJ
 s50KvVm88trOZdGxLokC0y0oJyA4zeE5aj4zjfvrSZOtn5+Q5Ww3WkHfcwL7LEhsC0lc
 xX4fTjtYrzYQ2PlpFdVfGox33shdb8DwhanuWvs8bs6RpFu2SwJ0O2TyKXttIuBJ19wE
 /G0JqitTe8oMJWD2rdhBzKXUcXe6H9sYDdwSyEUfsirwehUT1MLuGT3IKXtgwYQnft6o
 KUyA==
X-Gm-Message-State: APjAAAXGywcTHOG5VAEthgN/PghErkbqLu9ImOhR8ZZWw9UpHYV2tpWC
 o0zBtAwnlrGHxzNnSwCUqKA=
X-Google-Smtp-Source: APXvYqyIA5YOBcVSbOtB6o2HaP4fcD9ZJiSkoyfh8fs9acSRsEyqOK7ifEvIVFUhaXblgGl8LyxGDw==
X-Received: by 2002:a17:906:bb0c:: with SMTP id
 jz12mr14798267ejb.298.1583148352184; 
 Mon, 02 Mar 2020 03:25:52 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id n10sm787998ejk.67.2020.03.02.03.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 03:25:51 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
 <00a4c7ca-36a4-c108-719c-01a6e16df9b2@suse.com>
 <d851c095-84a1-9edb-5905-64860fb1b7a7@citrix.com>
 <cf139d45-13ba-668e-f2e9-b88180429db7@suse.com>
 <d817ac30-c57d-5db0-e48e-b4a6308e7733@xen.org>
 <30456058-9e9a-c718-4890-a9224ffa95c4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bad020fb-f487-51ef-bb6a-a007688953ca@xen.org>
Date: Mon, 2 Mar 2020 11:25:50 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <30456058-9e9a-c718-4890-a9224ffa95c4@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/5] IOMMU: iommu_intremap is x86-only
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDIvMDMvMjAyMCAxMDo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDIu
MDMuMjAyMCAxMTo0NCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pgo+Pgo+PiBPbiAwMi8wMy8yMDIw
IDEwOjA3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDI4LjAyLjIwMjAgMjE6MTYsIEFuZHJl
dyBDb29wZXIgd3JvdGU6Cj4+Pj4gT24gMjgvMDIvMjAyMCAxMjoyNiwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4+IFByb3ZpZGUgYSAjZGVmaW5lIGZvciBvdGhlciBjYXNlczsgaXQgZGlkbid0IHNl
ZW0gd29ydGh3aGlsZSB0byBtZSB0bwo+Pj4+PiBpbnRyb2R1Y2UgYW4gSU9NTVVfSU5UUkVNQVAg
S2NvbmZpZyBvcHRpb24gYXQgdGhpcyBwb2ludC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+Pgo+Pj4+PiAtLS0gYS9kb2NzL21p
c2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPj4+Pj4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21t
YW5kLWxpbmUucGFuZG9jCj4+Pj4+IEBAIC0xMjk5LDYgKzEyOTksOCBAQCBib29sZWFuIChlLmcu
IGBpb21tdT1ub2ApIGNhbiBvdmVycmlkZSB0Cj4+Pj4+ICAgICAgICBnZW5lcmF0aW9uIG9mIElP
TU1VcyBvbmx5IHN1cHBvcnRlZCBETUEgcmVtYXBwaW5nLCBhbmQgSW50ZXJydXB0IFJlbWFwcGlu
Zwo+Pj4+PiAgICAgICAgYXBwZWFyZWQgaW4gdGhlIHNlY29uZCBnZW5lcmF0aW9uLgo+Pj4+PiAg
ICAKPj4+Pj4gKyAgICBUaGlzIG9wdGlvbiBpcyBub3QgdmFsaWQgb24gQXJtLgo+Pj4+Cj4+Pj4g
VGhlIGxvbmdldml0eSBvZiB0aGlzIGNvbW1lbnQgd291bGQgYmUgZ3JlYXRlciBpZiBpdCB3ZXJl
IHBocmFzZWQgYXMgImlzCj4+Pj4gb25seSB2YWxpZCBvbiB4ODYiLCBlc3BlY2lhbGx5IGdpdmVu
IHRoZSBSRkMgUklTQ1Ygc2VyaWVzIG9uIGxpc3QuCj4+Pgo+Pj4gSG93IGRvIHdlIGtub3cgaG93
IGludHJlbWFwIGlzIGdvaW5nIHRvIHdvcmsgb24gZnV0dXJlIHBvcnRzPwo+Pgo+PiBXZSBkb24n
dCAga25vdy4gQnV0LCBmb3IgYSByZXZpZXdlciwgaXQgaXMgZ29pbmcgdG8gYmUgbXVjaCBlYXNp
ZXIgdG8KPj4gbm90aWNlIGEgY29tbWFuZCBsaW5lIG9wdGlvbiBpcyBnb2luZyB0byBiZSB1c2Vk
IGFzIHRoZSBwYXRjaCB3b3VsZAo+PiBtb2RpZnkgYSBjYWxsZXIuCj4gCj4gSSdtIHN0cnVnZ2xp
bmcgd2l0aCB1bmRlcnN0YW5kaW5nIHRoaXMgKG5vdCBzZWVpbmcgdGhlIGNvbm5lY3Rpb24KPiBi
ZXR3ZWVuICJjb21tYW5kIGxpbmUgb3B0aW9uIiBhbmQgImNhbGxlciIpLCBidXQgLi4uCgoiY2Fs
bGVyIiBtaWdodCBoYXZlIGJlZW4gdGhlIHdyb25nIHdvcmQgaGVyZS4gTGV0IG1lIGV4cGFuZCBp
dC4gVGhlIApwYXRjaCB5b3Ugc2VudCBjb250YWlucyBhbiAjaWZkZWYgQ09ORklHX1g4NiBwcm90
ZWN0aW5nIHRoZSBkZWNsYXJhdGlvbiAKb2YgaW9tbXVfaW50cmVtYXA6CgorI2lmZGVmIENPTkZJ
R19YODYKICBleHRlcm4gZW51bSBfX3BhY2tlZCBpb21tdV9pbnRyZW1hcCB7CiAgICAgLyoKICAg
ICAgKiBJbiBvcmRlciB0byBhbGxvdyB0cmFkaXRpb25hbCBib29sZWFuIHVzZXMgb2YgdGhlIGlv
bW11X2ludHJlbWFwCiAgICAgICogdmFyaWFibGUsIHRoZSAib2ZmIiB2YWx1ZSBoYXMgdG8gY29t
ZSBmaXJzdCAoeWllbGRpbmcgYSB2YWx1ZSBvZiAKemVybykuCiAgICAgICovCiAgICAgaW9tbXVf
aW50cmVtYXBfb2ZmLAotI2lmZGVmIENPTkZJR19YODYKICAgICBpb21tdV9pbnRyZW1hcF9yZXN0
cmljdGVkLAotI2VuZGlmCiAgICAgaW9tbXVfaW50cmVtYXBfZnVsbCwKICB9IGlvbW11X2ludHJl
bWFwOworI2Vsc2UKKyMgZGVmaW5lIGlvbW11X2ludHJlbWFwIGZhbHNlCisjZW5kaWYKClNvbWVv
bmUgd2FudGVkIHRvIHVzZSBpb21tdV9pbnRyZW1hcCAoYW5kIGJ5IGV4dGVudCB0aGUgY29tbWFu
ZCBsaW5lIApvcHRpb24pIGluIGEgbmV3IGFyY2ggd291bGQgaGF2ZSB0byBtb2RpZnkgdGhlIGRl
Y2xhcmF0aW9uIGZvciBpdCB0byAKd29yay4gQSBjb21taXQgbWVzc2FnZSB3b3VsZCBhbHNvIGxp
a2VseSB0byBjb250YWluICJJbXBsZW1lbnQgdGhlIApjb21tYW5kIGxpbmUgb3B0aW9uIC4uLiIu
IFNvIGEgcmV2aWV3ZXIgY2FuIHNwb3QgdGhlIGNoYW5nZSBhbmQgYXNrIHRvIAp1cGRhdGUgdGhl
IGRvY3VtZW50YXRpb24gaWYgdGhpcyB3YXNuJ3QgeWV0IGRvbmUuCgpBdCB0aGUgaW52ZXJzZSwg
aWYgdGhlIG5ldyBhcmNoIGlzIG5vdCB1c2luZyBpb21tdV9pbnRyZW1hcCB0aGVuIHRoZXJlIAp3
aWxsIGJlIG5vIG1vZGlmaWNhdGlvbiBpbiB0aGUgY29kZS4gVGhlcmVmb3JlLCBpdCBtYXkgYmUg
bW9yZSBkaWZmaWN1bHQgCmZvciBhIHJldmlld2VyIHRvIG5vdGljZSB0aGF0IHRoZSBkb2N1bWVu
dGF0aW9uIG5lZWRzIHRvIGJlIHVwZGF0ZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
