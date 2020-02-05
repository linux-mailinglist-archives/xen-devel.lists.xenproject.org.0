Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B0B1527B5
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 09:54:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izGQK-00043z-9z; Wed, 05 Feb 2020 08:52:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izGQJ-00043t-1D
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 08:52:39 +0000
X-Inumbo-ID: dc3f4f6c-47f4-11ea-90a3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc3f4f6c-47f4-11ea-90a3-12813bfff9fa;
 Wed, 05 Feb 2020 08:52:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3E7CBADAB;
 Wed,  5 Feb 2020 08:52:37 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200204173455.22020-1-roger.pau@citrix.com>
 <20200204173455.22020-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c290883-e107-a0dd-75c2-e4a35948a636@suse.com>
Date: Wed, 5 Feb 2020 09:52:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204173455.22020-4-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/3] nvmx: always trap accesses to x2APIC
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

T24gMDQuMDIuMjAyMCAxODozNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3Z2bXguYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXgu
Ywo+IEBAIC01OTYsNiArNTk2LDEzIEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9tc3JiaXRtYXAoc3Ry
dWN0IHZjcHUgKnYsIHVpbnQzMl90IHNoYWRvd19jdHJsKQo+ICAgICAgICAgICAgICAgIHYtPmFy
Y2guaHZtLnZteC5tc3JfYml0bWFwLT53cml0ZV9oaWdoLAo+ICAgICAgICAgICAgICAgIHNpemVv
Zihtc3JfYml0bWFwLT53cml0ZV9oaWdoKSAqIDgpOwo+ICAKPiArICAgIC8qCj4gKyAgICAgKiBO
ZXN0ZWQgVk1YIGRvZXNuJ3Qgc3VwcG9ydCBhbnkgeDJBUElDIGhhcmR3YXJlIHZpcnR1YWxpemF0
aW9uLCBzbwo+ICsgICAgICogbWFrZSBzdXJlIGFsbCB0aGUgeDJBUElDIE1TUnMgYXJlIHRyYXBw
ZWQuCj4gKyAgICAgKi8KPiArICAgIGJpdG1hcF9zZXQobXNyX2JpdG1hcC0+cmVhZF9sb3csIE1T
Ul9YMkFQSUNfRklSU1QsIDB4ZmYpOwo+ICsgICAgYml0bWFwX3NldChtc3JfYml0bWFwLT53cml0
ZV9sb3csIE1TUl9YMkFQSUNfRklSU1QsIDB4ZmYpOwoKSWYgeW91IGRlY2lkZSB0byBhZGRyZXNz
IHRoZSBBcm0gaXNzdWUgd2l0aCB0aGVzZSBmdW5jdGlvbnMsCmFuZCBoZW5jZSBkb24ndCBnbyBi
YWNrIHRvIHRoZSB2MyB2YXJpYW50LCB0aGVuIHRoZSBsYXN0CmFyZ3VtZW50cyBoZXJlIG5lZWQg
dG8gYmUgMHgxMDAgYWZhaWN0LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
