Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9154EE9FC7
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 16:53:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPqDS-0007TF-Us; Wed, 30 Oct 2019 15:48:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iUym=YX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPqDR-0007TA-Rt
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 15:48:57 +0000
X-Inumbo-ID: c7c630f6-fb2c-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7c630f6-fb2c-11e9-beca-bc764e2007e4;
 Wed, 30 Oct 2019 15:48:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 449FBB33E;
 Wed, 30 Oct 2019 15:48:55 +0000 (UTC)
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <03d0387a-fe11-866e-81dc-f4055374b0cd@eikelenboom.it>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <55c0bc58-32bb-79da-b75f-a20946dac94f@suse.com>
Date: Wed, 30 Oct 2019 16:48:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <03d0387a-fe11-866e-81dc-f4055374b0cd@eikelenboom.it>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMjAxOSAxMTozMiwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IFdoaWxlIHRl
c3RpbmcgdGhlIGxhdGVzdCB4ZW4tdW5zdGFibGUgYW5kIHN0YXJ0aW5nIGFuIEhWTSBndWVzdCB3
aXRoIHBjaS1wYXNzdHJvdWdoIG9uIG15IEFNRCBtYWNoaW5lLAo+IG15IGV5ZSBjYXRjaGVkIHRo
ZSBmb2xsb3dpbmcgbWVzc2FnZXMgaW4geGwgZG1lc2cgSSBoYXZlbid0IHNlZW4gYmVmb3JlOgo+
IAo+IChYRU4pIFsyMDE5LTEwLTI4IDEwOjIzOjE2LjM3Ml0gQU1ELVZpOiB1cGRhdGVfcGFnaW5n
X21vZGUgVHJ5IHRvIGFjY2VzcyBwZGV2X2xpc3Qgd2l0aG91dCBhcXVpcmluZyBwY2lkZXZzX2xv
Y2suCgpVbmZvcnR1bmF0ZWx5IHRoaXMgc2l0cyBvbiB0aGUgbWFwL3VubWFwIHBhdGgsIGFuZCBo
ZW5jZSB0aGUKdmlvbGF0b3IgaXMgZmFyIHVwIG9uZSBvZiB0aGUgbWFueSBjYWxsIGNoYWlucy4g
VGhlcmVmb3JlIEknZApsaWtlIHRvIGFzayB0aGF0IHlvdSByZWJ1aWxkIGFuZCByZXRyeSB3aXRo
IHRoZSBkZWJ1Z2dpbmcKcGF0Y2ggYmVsb3cuIEluIGNhc2UgeW91IG9ic2VydmUgbXVsdGlwbGUg
ZGlmZmVyZW50IGNhbGwKdHJlZXMsIHBvc3QgdGhlbSBhbGwgcGxlYXNlLgoKSmFuCgotLS0gdW5z
dGFibGUub3JpZy94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfbWFwLmMKKysrIHVu
c3RhYmxlL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYwpAQCAtMzMxLDkg
KzMzMSwxMiBAQCBzdGF0aWMgaW50IHVwZGF0ZV9wYWdpbmdfbW9kZShzdHJ1Y3QgZG9tCiAgICAg
ICAgIGhkLT5hcmNoLnBhZ2luZ19tb2RlID0gbGV2ZWw7CiAgICAgICAgIGhkLT5hcmNoLnJvb3Rf
dGFibGUgPSBuZXdfcm9vdDsKIAotICAgICAgICBpZiAoICFwY2lkZXZzX2xvY2tlZCgpICkKKyAg
ICAgICAgaWYgKCBpb21tdV9kZWJ1ZyAmJiAhcGNpZGV2c19sb2NrZWQoKSApCisgICAgICAgIHsK
ICAgICAgICAgICAgIEFNRF9JT01NVV9ERUJVRygiJXMgVHJ5IHRvIGFjY2VzcyBwZGV2X2xpc3Qg
IgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ3aXRob3V0IGFxdWlyaW5nIHBjaWRldnNf
bG9jay5cbiIsIF9fZnVuY19fKTsKKyAgICAgICAgICAgIGR1bXBfZXhlY3V0aW9uX3N0YXRlKCk7
CisgICAgICAgIH0KIAogICAgICAgICAvKiBVcGRhdGUgZGV2aWNlIHRhYmxlIGVudHJpZXMgdXNp
bmcgbmV3IHJvb3QgdGFibGUgYW5kIHBhZ2luZyBtb2RlICovCiAgICAgICAgIGZvcl9lYWNoX3Bk
ZXYoIGQsIHBkZXYgKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
