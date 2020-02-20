Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6492F166164
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 16:50:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4o2e-00037b-H9; Thu, 20 Feb 2020 15:47:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4o2d-00037T-EC
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 15:47:07 +0000
X-Inumbo-ID: 3ef8c0c0-53f8-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ef8c0c0-53f8-11ea-b0fd-bc764e2007e4;
 Thu, 20 Feb 2020 15:47:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 49B6EAC23;
 Thu, 20 Feb 2020 15:47:05 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1576877960-12767-1-git-send-email-igor.druzhinin@citrix.com>
 <98c80514-a3cc-9e4f-d84c-3a12b08feaf2@suse.com>
 <6d3b8fed-538f-9c9b-d33e-3ccb94935bf0@citrix.com>
 <86036433-0dd9-773c-3855-fb4b4697fc08@suse.com>
 <eb6156eb-6a6d-28f5-c8ec-081f81444b99@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <177eafce-7f19-0792-eac2-62ac7b13feb0@suse.com>
Date: Thu, 20 Feb 2020 16:47:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <eb6156eb-6a6d-28f5-c8ec-081f81444b99@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/vpt: update last_guest_time with
 cmpxchg and drop pl_time_lock
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAyMCAxNjozNywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMjAvMDIvMjAy
MCAwODoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE5LjAyLjIwMjAgMTk6NTIsIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gT24gMTkvMDIvMjAyMCAwNzo0OCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMjAuMTIuMjAxOSAyMjozOSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+Pj4+
IEBAIC0zOCwyNCArMzcsMjIgQEAgdm9pZCBodm1faW5pdF9ndWVzdF90aW1lKHN0cnVjdCBkb21h
aW4gKmQpCj4+Pj4+ICB1aW50NjRfdCBodm1fZ2V0X2d1ZXN0X3RpbWVfZml4ZWQoY29uc3Qgc3Ry
dWN0IHZjcHUgKnYsIHVpbnQ2NF90IGF0X3RzYykKPj4+Pj4gIHsKPj4+Pj4gICAgICBzdHJ1Y3Qg
cGxfdGltZSAqcGwgPSB2LT5kb21haW4tPmFyY2guaHZtLnBsX3RpbWU7Cj4+Pj4+IC0gICAgdTY0
IG5vdzsKPj4+Pj4gKyAgICBzX3RpbWVfdCBvbGQsIG5ldywgbm93ID0gZ2V0X3NfdGltZV9maXhl
ZChhdF90c2MpICsgcGwtPnN0aW1lX29mZnNldDsKPj4+Pj4gIAo+Pj4+PiAgICAgIC8qIENhbGxl
ZCBmcm9tIGRldmljZSBtb2RlbHMgc2hhcmVkIHdpdGggUFYgZ3Vlc3RzLiBCZSBjYXJlZnVsLiAq
Lwo+Pj4+PiAgICAgIEFTU0VSVChpc19odm1fdmNwdSh2KSk7Cj4+Pj4+ICAKPj4+Pj4gLSAgICBz
cGluX2xvY2soJnBsLT5wbF90aW1lX2xvY2spOwo+Pj4+PiAtICAgIG5vdyA9IGdldF9zX3RpbWVf
Zml4ZWQoYXRfdHNjKSArIHBsLT5zdGltZV9vZmZzZXQ7Cj4+Pj4+IC0KPj4+Pj4gICAgICBpZiAo
ICFhdF90c2MgKQo+Pj4+PiAgICAgIHsKPj4+Pj4gLSAgICAgICAgaWYgKCAoaW50NjRfdCkobm93
IC0gcGwtPmxhc3RfZ3Vlc3RfdGltZSkgPiAwICkKPj4+Pj4gLSAgICAgICAgICAgIHBsLT5sYXN0
X2d1ZXN0X3RpbWUgPSBub3c7Cj4+Pj4+IC0gICAgICAgIGVsc2UKPj4+Pj4gLSAgICAgICAgICAg
IG5vdyA9ICsrcGwtPmxhc3RfZ3Vlc3RfdGltZTsKPj4+Pj4gKyAgICAgICAgZG8gewo+Pj4+PiAr
ICAgICAgICAgICAgb2xkID0gcGwtPmxhc3RfZ3Vlc3RfdGltZTsKPj4+Pj4gKyAgICAgICAgICAg
IG5ldyA9IG5vdyA+IHBsLT5sYXN0X2d1ZXN0X3RpbWUgPyBub3cgOiBvbGQgKyAxOwo+Pj4+PiAr
ICAgICAgICB9IHdoaWxlICggY21weGNoZygmcGwtPmxhc3RfZ3Vlc3RfdGltZSwgb2xkLCBuZXcp
ICE9IG9sZCApOwo+Pj4+Cj4+Pj4gSSB3b25kZXIgd2hldGhlciB5b3Ugd291bGRuJ3QgYmV0dGVy
IHJlLWludm9rZSBnZXRfc190aW1lKCkgaW4KPj4+PiBjYXNlIHlvdSBuZWVkIHRvIHJldHJ5IGhl
cmUuIFNlZSBob3cgdGhlIGZ1bmN0aW9uIHByZXZpb3VzbHkKPj4+PiB3YXMgY2FsbGVkIG9ubHkg
YWZ0ZXIgdGhlIGxvY2sgd2FzIGFscmVhZHkgYWNxdWlyZWQuCj4+Pgo+Pj4gSWYgdGhlcmUgaXMg
YSBjb25jdXJyZW50IHdyaXRlciwgd291bGRuJ3QgaXQganVzdCB1cGRhdGUgcGwtPmxhc3RfZ3Vl
c3RfdGltZQo+Pj4gd2l0aCB0aGUgbmV3IGdldF9zX3RpbWUoKSBhbmQgdGhlbiB3ZSBzdWJzZXF1
ZW50bHkgd291bGQganVzdCB1c2UgdGhlIG5ldwo+Pj4gdGltZSBvbiByZXRyeT8KPj4KPj4gWWVz
LCBpdCB3b3VsZCwgYnV0IHRoZSBsYXRlbmN5IHVudGlsIHRoZSByZXRyeSBhY3R1YWxseSBvY2N1
cnMKPj4gaXMgdW5rbm93biAoaW4gcGFydGljdWxhciBpZiBYZW4gaXRzZWxmIHJ1bnMgdmlydHVh
bGl6ZWQpLiBJLmUuCj4+IGluIHRoZSBhdF90c2MgPT0gMCBjYXNlIEkgdGhpbmsgdGhlIHZhbHVl
IHdvdWxkIGJldHRlciBiZQo+PiByZS1jYWxjdWxhdGVkIG9uIGV2ZXJ5IGl0ZXJhdGlvbi4KPiAK
PiBXaHkgZG9lcyBpdCBuZWVkIHRvIGJlIHJlY2FsY3VsYXRlZCBpZiBhIGNvbmN1cnJlbnQgd3Jp
dGVyIGRpZCB0aGlzCj4gZm9yIHVzIGFscmVhZHkgYW55d2F5IGFuZCAoZ2V0X3NfdGltZV9maXhl
ZChhdF90c2MpICsgcGwtPnN0aW1lX29mZnNldCkKPiB2YWx1ZSBpcyBjb21tb24gZm9yIGFsbCBv
ZiB2Q1BVcz8gWWVzLCBpdCBtaWdodCByZWR1Y2Ugaml0dGVyIHNsaWdodGx5Cj4gYnV0IG92ZXJh
bGwgbGF0ZW5jeSBjb3VsZCBjb21lIGZyb20gYW55IHBvaW50IChlc3BlY2lhbGx5IGluIGNhc2Ug
b2YKPiByaW5uaW5nIHZpcnR1YWxpemVkKSBhbmQgaXQncyBpbXBvcnRhbnQganVzdCB0byBwcmVz
ZXJ2ZSBpbnZhcmlhbnQgdGhhdAo+IHRoZSB2YWx1ZSBpcyBtb25vdG9uaWMgYWNyb3NzIHZDUFVz
LgoKSSdtIGFmcmFpZCBJIGRvbid0IGZvbGxvdzogSWYgd2UgcmVseSBvbiByZW1vdGUgQ1BVcyB1
cGRhdGluZwpwbC0+bGFzdF9ndWVzdF90aW1lLCB0aGVuIHdoYXQgd2UnZCByZXR1cm4gaXMgd2hh
dGV2ZXIgd2FzIHB1dAp0aGVyZSBwbHVzIG9uZS4gV2hlcmVhcyB0aGUgY29ycmVjdCB2YWx1ZSBt
aWdodCBiZSBkb3plbnMgb2YKY2xvY2tzIGZ1cnRoZXIgYWhlYWQuCgo+PiBBbnRoZXIgdGhpbmcg
SSBub3RpY2Ugb25seSBub3cgYXJlIHRoZSBtdWx0aXBsZSByZWFkcyBvZgo+PiBwbC0+bGFzdF9n
dWVzdF90aW1lLiBXb3VsZG4ndCB5b3UgYmV0dGVyIGRvCj4+Cj4+ICAgICAgICAgZG8gewo+PiAg
ICAgICAgICAgICBvbGQgPSBBQ0NFU1NfT05DRShwbC0+bGFzdF9ndWVzdF90aW1lKTsKPj4gICAg
ICAgICAgICAgbmV3ID0gbm93ID4gb2xkID8gbm93IDogb2xkICsgMTsKPj4gICAgICAgICB9IHdo
aWxlICggY21weGNoZygmcGwtPmxhc3RfZ3Vlc3RfdGltZSwgb2xkLCBuZXcpICE9IG9sZCApOwo+
Pgo+PiA/Cj4gCj4gRmFpciBlbm91Z2gsIGFsdGhvdWdoIGV2ZW4gcmVhZGluZyBpdCBtdWx0aXBs
ZSB0aW1lcyB3b3VsZG4ndCBjYXVzZQo+IGFueSBoYXJtIGFzIGFueSBpbmNvbnNpc3RlbmN5IHdv
dWxkIGJlIHJlc29sdmVkIGJ5IGNtcHhjaGcgb3AuCgpBZmFpY3MgIm5ldyIsIGlmIGNhbGN1bGF0
ZWQgZnJvbSBhIHZhbHVlIGxhdGNoZWQgX2VhcmxpZXJfCnRoYW4gIm9sZCIsIGNvdWxkIGNhdXNl
IHRpbWUgdG8gYWN0dWFsbHkgbW92ZSBiYWNrd2FyZHMuIFJlYWRzCmNhbiBiZSByZS1vcmRlcmVk
LCBhZnRlciBhbGwuCgo+IEknZAo+IHByZWZlciB0byBtYWtlIGl0IGluIGEgc2VwYXJhdGUgY29t
bWl0IHRvIHVuaWZ5IGl0IHdpdGggcHZfc29mdF9yZHRzYygpLgoKSSdkIGJlIGZpbmUgaWYgeW91
IGNoYW5nZWQgcHZfc29mdF9yZHRzYygpIGZpcnN0LCBhbmQgdGhlbgptYWRlIHRoZSBjb2RlIGhl
cmUgbWF0Y2guIEJ1dCBJIGRvbid0IHRoaW5rIHRoZSBjb2RlIHNob3VsZCBiZQppbnRyb2R1Y2Vk
IGluIG90aGVyIHRoYW4gaXRzIChmb3IgdGhlIHRpbWUgYmVpbmcpIGZpbmFsIHNoYXBlLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
