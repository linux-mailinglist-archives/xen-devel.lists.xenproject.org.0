Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5E7629A5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 21:31:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkZIT-0000RZ-LC; Mon, 08 Jul 2019 19:27:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arZn=VF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkZIS-0000RU-Pi
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 19:27:32 +0000
X-Inumbo-ID: 6d507ebc-a1b6-11e9-90d7-8f3662ea7ab5
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6d507ebc-a1b6-11e9-90d7-8f3662ea7ab5;
 Mon, 08 Jul 2019 19:27:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C5702B;
 Mon,  8 Jul 2019 12:27:30 -0700 (PDT)
Received: from [10.119.48.199] (unknown [10.119.48.199])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63EEC3F246;
 Mon,  8 Jul 2019 12:27:29 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1561109798-8744-5-git-send-email-andrew.cooper3@citrix.com>
 <20190704191449.22486-1-andrew.cooper3@citrix.com>
 <96aff7db-67f7-546a-da63-a915cdadd7b9@arm.com>
 <fba23c81-2ab9-28b8-86f2-89b3220345a9@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <14762cea-1b87-4dea-69cc-6e4cf001c73b@arm.com>
Date: Mon, 8 Jul 2019 20:27:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <fba23c81-2ab9-28b8-86f2-89b3220345a9@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/5] xen/gnttab: Refactor
 gnttab_clear_flag() to be gnttab_clear_flags()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzgvMTkgNzoxMSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNy8wNy8y
MDE5IDE5OjQyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIEFuZHJldywKPj4KPj4gT24gNy80
LzE5IDg6MTQgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBUbyBhbGxvdyBmb3IgZnVydGhl
ciBpbXByb3ZlbWVudHMsIGl0IGlzIHVzZWZ1bCB0byBiZSBhYmxlIHRvIGNsZWFyCj4+PiBtb3Jl
IHRoYW4KPj4+IGEgc2luZ2xlIGZsYWcgYXQgb25jZS7CoCBSZXdvcmsgZ250dGFiX2NsZWFyX2Zs
YWcoKSBpbnRvCj4+PiBnbnR0YWJfY2xlYXJfZmxhZ3MoKQo+Pj4gd2hpY2ggdGFrZXMgYSBiaXRt
YXNrIHJhdGhlciB0aGFuIGEgYml0IG51bWJlci4KPj4+Cj4+PiBObyBwcmFjdGljYWwgY2hhbmdl
IHlldC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgo+Pj4gLS0tCj4+PiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPgo+Pj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4+PiBDQzogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+PiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPgo+Pj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4+PiBDQzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29t
Pgo+Pj4KPj4+IHYyOgo+Pj4gIMKgICogVXNlIHVuc2lnbmVkIGludCBmb3IgdGhlIG1hc2sgcGFy
YW1ldGVyCj4+Cj4+IEkgZG9uJ3Qgc2VlbSB0byBmaW5kIHRoZSByZXF1ZXN0IG9uIHRoZSBNTC4g
VGVjaG5pY2FsbHkgdGhlIG1hc2sgY2FuCj4+IG9ubHkgYmUgMTYtYml0LiBNYXkgSSBhc2sgdGhl
IHJlYXNvbiBvZiB0aGlzIGNoYW5nZT8KPiAKPiBJdCBpcyBvbiB0aGUgbWFpbGluZyBsaXN0LCBi
dXQgYW4gb3JwaGFuZWQgZW1haWwgZHVlIHRvIEphbidzIGVtYWlsIGNoYW5nZXMuCgpJcyBpdCB0
aGUgc2FtZSBwcm9ibGVtIGFzIEkgaGF2ZSBzZWVuIHRoZSBwYXN0IDYgbW9udGhzIGJldHdlZW4g
SnVlcmdlbiAKYW5kIEphbidzIGUtbWFpbD8KCj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
eGVuLWRldmVsLzE1NjExMDk3OTgtODc0NC01LWdpdC1zZW5kLWVtYWlsLWFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20vVC8jdAoKVG8gYmUgaG9uZXN0LCBJIHRoaW5rIGl0IGlzIHdyb25nIHRvIHRy
eSB0byBtaWNyby1vcHRpbWl6ZSBhIGNvbW1vbiAKcHJvdG90eXBlIGZvciB0aGUgYmVuZWZpdCBv
ZiBvbmUgYXJjaGl0ZWN0dXJlIGFuZCBvbmUgY29tcGlsZXIgdmVyc2lvbiAKKG9yIGV2ZW4gbm9u
ZSBwZXIgdGhlIGUtbWFpbCkuCgpPbmUgY291bGQgYWxzbyBhcmd1ZSB0aGF0IHRoaXMgbWF5IGJl
IG5vdCBiZW5lZmljaWFsIGZvciB0aGUgbm9uLXg4NiAKYXJjaGl0ZWN0dXJlIGRlcGVuZGluZyBv
biBob3cgdGhlIGNvbXBpbGVyIGRlY2lkZSB0byBkbyB0aGUgY2FzdCBmcm9tIAozMi1iaXQgdG8g
MTYtYml0Li4uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
