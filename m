Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3DEEAD44
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 11:18:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQ7UC-0004r8-JO; Thu, 31 Oct 2019 10:15:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I6hz=YY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iQ7UB-0004r3-5D
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 10:15:23 +0000
X-Inumbo-ID: 580eb45e-fbc7-11e9-953f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 580eb45e-fbc7-11e9-953f-12813bfff9fa;
 Thu, 31 Oct 2019 10:15:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D754DB31F;
 Thu, 31 Oct 2019 10:15:19 +0000 (UTC)
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <03d0387a-fe11-866e-81dc-f4055374b0cd@eikelenboom.it>
 <55c0bc58-32bb-79da-b75f-a20946dac94f@suse.com>
 <55f3c0e3-7da7-f1ad-37cd-e5febdda4b09@eikelenboom.it>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a8ea591-1ad9-514d-00ca-bd153f540d28@suse.com>
Date: Thu, 31 Oct 2019 11:15:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <55f3c0e3-7da7-f1ad-37cd-e5febdda4b09@eikelenboom.it>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable: AMD-Vi: update_paging_mode Try to
 access pdev_list without aquiring pcidevs_lock.
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMTAuMjAxOSAyMzoyMSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IENhbGwgdHJh
Y2Ugc2VlbXMgdG8gYmUgdGhlIHNhbWUgaW4gYWxsIGNhc2VzLgo+IAo+IC0tCj4gU2FuZGVyCj4g
Cj4gCj4gKFhFTikgWzIwMTktMTAtMzAgMjI6MDc6MDUuNzQ4XSBBTUQtVmk6IHVwZGF0ZV9wYWdp
bmdfbW9kZSBUcnkgdG8gYWNjZXNzIHBkZXZfbGlzdCB3aXRob3V0IGFxdWlyaW5nIHBjaWRldnNf
bG9jay4KPiAoWEVOKSBbMjAxOS0xMC0zMCAyMjowNzowNS43NDhdIC0tLS1bIFhlbi00LjEzLjAt
cmMgIHg4Nl82NCAgZGVidWc9eSAgIE5vdCB0YWludGVkIF0tLS0tCj4gKFhFTikgWzIwMTktMTAt
MzAgMjI6MDc6MDUuNzQ4XSBDUFU6ICAgIDEKPiAoWEVOKSBbMjAxOS0xMC0zMCAyMjowNzowNS43
NDhdIFJJUDogICAgZTAwODpbPGZmZmY4MmQwODAyNjU3NDg+XSBpb21tdV9tYXAuYyN1cGRhdGVf
cGFnaW5nX21vZGUrMHgxZjIvMHgzZWIKPiAoWEVOKSBbMjAxOS0xMC0zMCAyMjowNzowNS43NDhd
IFJGTEFHUzogMDAwMDAwMDAwMDAxMDI4NiAgIENPTlRFWFQ6IGh5cGVydmlzb3IgKGQwdjIpCgpJ
IGRpZG4ndCBwYXkgYXR0ZW50aW9uIHRvIHRoaXMgd2hlbiB3cml0aW5nIG15IGVhcmxpZXIgcmVw
bHk6IFRoZQpsaWtlbHkgY3VscHJpdCBsb29rcyB0byBiZSBmODlmNTU1ODI3ICgicmVtb3ZlIGxh
dGUgKG9uLWRlbWFuZCkKY29uc3RydWN0aW9uIG9mIElPTU1VIHBhZ2UgdGFibGVzIikuIFByaW9y
IHRvIHRoaXMgSSBhc3N1bWUgSU9NTVUKcGFnZSB0YWJsZXMgZ290IGNvbnN0cnVjdGVkIG9ubHkg
YWZ0ZXIgLi4uCgo+IChYRU4pIFsyMDE5LTEwLTMwIDIyOjA3OjA1Ljc0OF0gWGVuIGNhbGwgdHJh
Y2U6Cj4gKFhFTikgWzIwMTktMTAtMzAgMjI6MDc6MDUuNzQ4XSAgICBbPGZmZmY4MmQwODAyNjU3
NDg+XSBSIGlvbW11X21hcC5jI3VwZGF0ZV9wYWdpbmdfbW9kZSsweDFmMi8weDNlYgo+IChYRU4p
IFsyMDE5LTEwLTMwIDIyOjA3OjA1Ljc0OF0gICAgWzxmZmZmODJkMDgwMjY1ZGVkPl0gRiBhbWRf
aW9tbXVfbWFwX3BhZ2UrMHg3Mi8weDFjMgo+IChYRU4pIFsyMDE5LTEwLTMwIDIyOjA3OjA1Ljc0
OF0gICAgWzxmZmZmODJkMDgwMjU4M2I2Pl0gRiBpb21tdV9tYXArMHg5OC8weDE3ZQo+IChYRU4p
IFsyMDE5LTEwLTMwIDIyOjA3OjA1Ljc0OF0gICAgWzxmZmZmODJkMDgwMjU4NmZiPl0gRiBpb21t
dV9sZWdhY3lfbWFwKzB4MjgvMHg3Mwo+IChYRU4pIFsyMDE5LTEwLTMwIDIyOjA3OjA1Ljc0OF0g
ICAgWzxmZmZmODJkMDgwMzRhNGE2Pl0gRiBwMm0tcHQuYyNwMm1fcHRfc2V0X2VudHJ5KzB4NGQz
LzB4ODQ0Cj4gKFhFTikgWzIwMTktMTAtMzAgMjI6MDc6MDUuNzQ4XSAgICBbPGZmZmY4MmQwODAz
NDJlMTM+XSBGIHAybV9zZXRfZW50cnkrMHg5MS8weDEyOAo+IChYRU4pIFsyMDE5LTEwLTMwIDIy
OjA3OjA1Ljc0OF0gICAgWzxmZmZmODJkMDgwMzQzYzUyPl0gRiBndWVzdF9waHlzbWFwX2FkZF9l
bnRyeSsweDM5Zi8weDVhMwo+IChYRU4pIFsyMDE5LTEwLTMwIDIyOjA3OjA1Ljc0OF0gICAgWzxm
ZmZmODJkMDgwMzQzZjg1Pl0gRiBndWVzdF9waHlzbWFwX2FkZF9wYWdlKzB4MTJmLzB4MTM4Cj4g
KFhFTikgWzIwMTktMTAtMzAgMjI6MDc6MDUuNzQ4XSAgICBbPGZmZmY4MmQwODAyMjAxZWU+XSBG
IG1lbW9yeS5jI3BvcHVsYXRlX3BoeXNtYXArMHgyZTMvMHg1MDUKCi4uLiBEb20wIGhhZCBwb3B1
bGF0ZWQgdGhlIG5ldyBndWVzdCdzIHBoeXNtYXAuCgpBbnl3YXksIGFzIG9kZCBhcyBpdCBtYXkg
c2VlbSBJIGd1ZXNzIHRoZXJlJ3MgbGl0dGxlIGNob2ljZQpiZXNpZGVzIG1ha2luZyBwb3B1bGF0
ZV9waHlzbWFwKCkgKGFuZCBsaWtlbHkgYSBmZXcgb3RoZXJzKQphY3F1aXJlIHRoZSBsb2NrLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
