Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986FD151811
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 10:44:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyuit-0002ZI-Et; Tue, 04 Feb 2020 09:42:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fS9R=3Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyuis-0002ZC-HC
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 09:42:22 +0000
X-Inumbo-ID: a4135682-4732-11ea-8efd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4135682-4732-11ea-8efd-12813bfff9fa;
 Tue, 04 Feb 2020 09:42:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DC611AFFC;
 Tue,  4 Feb 2020 09:42:20 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200203173728.18135-1-roger.pau@citrix.com>
 <20200203173728.18135-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9947ed93-29a6-0422-9cdc-b37970273e19@suse.com>
Date: Tue, 4 Feb 2020 10:42:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203173728.18135-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] nvmx: always trap accesses to x2APIC
 MSRs
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxODozNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEBAIC01ODcsNiAr
NTg4LDE2IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9tc3JiaXRtYXAoc3RydWN0IHZjcHUgKnYsIHVp
bnQzMl90IHNoYWRvd19jdHJsKQo+ICAgICAgICAgICAgICAgIHYtPmFyY2guaHZtLnZteC5tc3Jf
Yml0bWFwLT53cml0ZV9oaWdoLAo+ICAgICAgICAgICAgICAgIHNpemVvZihtc3JfYml0bWFwLT53
cml0ZV9oaWdoKSAqIDgpOwo+ICAKPiArICAgIC8qCj4gKyAgICAgKiBOZXN0ZWQgVk1YIGRvZXNu
J3Qgc3VwcG9ydCBhbnkgeDJBUElDIGhhcmR3YXJlIHZpcnR1YWxpemF0aW9uLCBzbwo+ICsgICAg
ICogbWFrZSBzdXJlIGFsbCB0aGUgeDJBUElDIE1TUnMgYXJlIHRyYXBwZWQuCj4gKyAgICAgKi8K
PiArICAgIGZvciAoIG1zciA9IE1TUl9YMkFQSUNfRklSU1Q7IG1zciA8PSBNU1JfWDJBUElDX0ZJ
UlNUICsgMHhmZjsgbXNyKysgKQo+ICsgICAgewo+ICsgICAgICAgIF9fc2V0X2JpdChtc3IsIG1z
cl9iaXRtYXAtPnJlYWRfbG93KTsKPiArICAgICAgICBfX3NldF9iaXQobXNyLCBtc3JfYml0bWFw
LT53cml0ZV9sb3cpOwo+ICsgICAgfQoKUHVsbCBpbiBiaXRtYXBfc2V0KCkgKGFuZCB0aGVuIGFs
c28gYml0bWFwX2NsZWFyKCkpIGZyb20gTGludXgKZm9yIGRvaW5nIHRoaXMgbW9yZSBlZmZpY2ll
bnRseT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
