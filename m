Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58AA10D3C9
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 11:19:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iadK9-0008Oo-7Q; Fri, 29 Nov 2019 10:16:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iadK8-0008Oj-LA
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 10:16:28 +0000
X-Inumbo-ID: 4e19f39c-1291-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e19f39c-1291-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 10:16:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 87F12B27B;
 Fri, 29 Nov 2019 10:16:27 +0000 (UTC)
To: Yi Sun <yi.y.sun@linux.intel.com>
References: <1575021698-10589-1-git-send-email-yi.y.sun@linux.intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0702da5a-367c-1273-5622-38980f8c7b98@suse.com>
Date: Fri, 29 Nov 2019 11:16:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1575021698-10589-1-git-send-email-yi.y.sun@linux.intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] psr: fix bug which may cause crash
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
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxMTowMSwgWWkgU3VuIHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9w
c3IuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9wc3IuYwo+IEBAIC0xMjcxLDcgKzEyNzEsMTMgQEAg
c3RhdGljIHZvaWQgZG9fd3JpdGVfcHNyX21zcnModm9pZCAqZGF0YSkKPiAgCj4gICAgICAgICAg
Zm9yICggaiA9IDA7IGogPCBjb3NfbnVtOyBqKyssIGluZGV4KysgKQo+ICAgICAgICAgIHsKPiAt
ICAgICAgICAgICAgaWYgKCBmZWF0LT5jb3NfcmVnX3ZhbFtjb3MgKiBjb3NfbnVtICsgal0gIT0g
aW5mby0+dmFsW2luZGV4XSApCj4gKyAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAqIE11
bHRpcGxlIFJEVCBmZWF0dXJlcyBtYXkgY28tZXhpc3QgYW5kIHRoZWlyIENPU19NQVggbWF5IGJl
Cj4gKyAgICAgICAgICAgICAqIGRpZmZlcmVudC4gU28gd2Ugc2hvdWxkIHByZXZlbnQgb25lIGZl
YXR1cmUgdG8gd3JpdGUgQ09TCj4gKyAgICAgICAgICAgICAqIHJlZ2lzdGVyIHdoaWNoIGV4Y2Vl
ZHMgaXRzIENPU19NQVguIE90aGVyd2lzZSwgcGFuaWMgbWF5IGhhcHBlbi4KCkkgZG9uJ3QgdGhp
bmsgdGhlIGxhc3Qgc2VudGVuY2UgYWRkcyBtdWNoIHZhbHVlLiBFYXJseSBvbiBJCnNhaWQgImJy
aWVmIiBmb3IgYSByZWFzb24uCgo+ICsgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgaWYg
KCBjb3MgPD0gZmVhdC0+Y29zX21heCAmJgo+ICsgICAgICAgICAgICAgICAgIGZlYXQtPmNvc19y
ZWdfdmFsW2NvcyAqIGNvc19udW0gKyBqXSAhPSBpbmZvLT52YWxbaW5kZXhdICkKCkFzIGluZGlj
YXRlZCBpbiByZXBseSB0byB2MiwgdGhlIGFkZGVkIGNvbmRpdGlvbiBpcyBsb29wCmludmFyaWFu
dCBhbmQgaGVuY2Ugc2hvdWxkIGxlYWQgdG8gdGhlIGxvb3Agbm90IGdldHRpbmcKZW50ZXJlZCBp
biB0aGUgZmlyc3QgcGxhY2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
