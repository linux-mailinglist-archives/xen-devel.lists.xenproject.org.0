Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A1792102
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 12:12:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzeb4-0002g4-E4; Mon, 19 Aug 2019 10:09:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkZp=WP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hzeb2-0002fz-Fn
 for xen-devel@lists.xen.org; Mon, 19 Aug 2019 10:09:04 +0000
X-Inumbo-ID: 5e00a026-c269-11e9-8beb-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5e00a026-c269-11e9-8beb-12813bfff9fa;
 Mon, 19 Aug 2019 10:09:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C6B1344;
 Mon, 19 Aug 2019 03:09:01 -0700 (PDT)
Received: from [10.37.12.162] (unknown [10.37.12.162])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43DC83F706;
 Mon, 19 Aug 2019 03:09:00 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>
References: <1545399965-5174-1-git-send-email-andrew.cooper3@citrix.com>
 <ee8053c9-467f-f1a8-5d83-5c69a766d17d@arm.com>
 <09c39607-ed40-ab4f-7e0c-12f9207636b6@citrix.com>
 <670f2bd7-4c00-c7e8-66ae-464213037fd4@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <850a76e0-fe32-4fcd-5db6-54d5ac858d5b@arm.com>
Date: Mon, 19 Aug 2019 11:08:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <670f2bd7-4c00-c7e8-66ae-464213037fd4@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/pv: Clean up cr3 handling in
 arch_set_info_guest()
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gOC8xMy8xOSA3OjA0IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9u
IDI0LzAxLzIwMTkgMjI6MTAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDI0LzAxLzIwMTkg
MjE6NDIsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpIEFuZHJldywKPj4+Cj4+PiBPbiAxMi8y
MS8xOCAxOjQ2IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+IEFsbCBvZiB0aGlzIGNvZGUg
bGl2ZXMgaW5zaWRlIENPTkZJR19QViB3aGljaCBtZWFucyBnZm4gPT0gbWZuLCBhbmQgdGhlCj4+
Pj4gZmlsbF9yb19tcHQoKSBjYWxscyBjbGVhcmx5IHNob3cgdGhhdCB0aGUgdmFsdWUgaXMgdXNl
ZCB1bnRyYW5zbGF0ZWQuCj4+Pj4KPj4+PiBDaGFuZ2UgY3IzX2dmbiB0byBhIHN1aXRhYmx5IHR5
cGVkIGNyM19tZm4sIGFuZCByZXBsYWNlCj4+Pj4gZ2V0X3BhZ2VfZnJvbV9nZm4oKQo+Pj4+IHdp
dGggYSBzdHJhaWdodCBtZm5fdG9fcGFnZS9nZXRfcGFnZSBzZXF1ZW5jZSwgdG8gYXZvaWQgdGhl
Cj4+Pj4gaW1wbGljYXRpb24gdGhhdAo+Pj4+IHRyYW5zbGF0aW9uIGlzIGdvaW5nIG9uLgo+Pj4+
Cj4+Pj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pj4+IC0tLQo+Pj4+IENDOiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4+Pj4gQ0M6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+Cj4+Pj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+Pj4+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
Cj4+Pj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Pj4KPj4+PiBK
dWxpZW46IFRoaXMgc2hvdWxkIHNpbXBsaWZ5IHlvdXIgInhlbjogU3dpdGNoIHBhcmFtZXRlciBp
bgo+Pj4+IGdldF9wYWdlX2Zyb21fZ2ZuCj4+Pj4gdG8gdXNlIHR5cGVzYWZlIGdmbiIgcGF0Y2gu
wqAgSW4gcGFydGljdWxhciwgSSBkaWQgYSBkb3VibGV0YWtlIGF0Cj4+Pj4gZmlsbF9yb19tcHQo
X21mbihnZm5feChjcjNfZ2ZuKSkpOyB3aGVuIHJldmlld2luZyBpdC4KPj4+IEkgd2FzIGxvb2tp
bmcgYXQgdXBkYXRpbmcgbXkgcGF0Y2ggYW5kIHJlbWVtYmVyZWQgeW91IHN1Z2dlc3RlZCB0bwo+
Pj4gcmViYXNlIG9uIHRvcCBvZiB0aGlzLiBEbyB5b3UgaGF2ZSBhbnkgcGxhbiB0byByZXNlbmQg
dGhlIHBhdGNoPwo+PiBJJ2xsIHNlZSBpZiBJIGNhbiBmaW5kIHNvbWUgdGltZSB0b21vcnJvdy4K
PiAKPiBTbyBtYXliZSBJIHdhcyBhIGxpdHRsZSBvZmYgOynCoCBCZXR0ZXIgbGF0ZSB0aGFuIG5l
dmVyIEkgc3VwcG9zZS4KCkkgbmVhcmx5IGZvcmdvdCB0aGF0IHdvcmsgOikuIENhbiB5b3UgQ0Mg
bWUgb24gdGhlIHBhdGNoIHdoZW4geW91IHNlbmQgCml0PyBJIHdpbGwgcmViYXNlIG15IHdvcmsg
b24gdG9wIG9mIGl0LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
