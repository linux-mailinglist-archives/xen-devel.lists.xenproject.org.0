Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71810C7FC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 12:34:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaI1U-0006GJ-51; Thu, 28 Nov 2019 11:31:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaI1S-0006GE-Ic
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 11:31:46 +0000
X-Inumbo-ID: 7fa5124e-11d2-11ea-a3d2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fa5124e-11d2-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 11:30:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 52644B0BA;
 Thu, 28 Nov 2019 11:25:36 +0000 (UTC)
To: Yi Sun <yi.y.sun@linux.intel.com>
References: <1574936284-5139-1-git-send-email-yi.y.sun@linux.intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fdb27512-4ebc-8f80-7ef2-36d83c369326@suse.com>
Date: Thu, 28 Nov 2019 12:25:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1574936284-5139-1-git-send-email-yi.y.sun@linux.intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] psr: fix bug which may cause crash
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

T24gMjguMTEuMjAxOSAxMToxOCwgWWkgU3VuIHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9w
c3IuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9wc3IuYwo+IEBAIC0xMjcxLDcgKzEyNzEsOCBAQCBz
dGF0aWMgdm9pZCBkb193cml0ZV9wc3JfbXNycyh2b2lkICpkYXRhKQo+ICAKPiAgICAgICAgICBm
b3IgKCBqID0gMDsgaiA8IGNvc19udW07IGorKywgaW5kZXgrKyApCj4gICAgICAgICAgewo+IC0g
ICAgICAgICAgICBpZiAoIGZlYXQtPmNvc19yZWdfdmFsW2NvcyAqIGNvc19udW0gKyBqXSAhPSBp
bmZvLT52YWxbaW5kZXhdICkKPiArICAgICAgICAgICAgaWYgKCBjb3MgPD0gZmVhdC0+Y29zX21h
eCAmJgo+ICsgICAgICAgICAgICAgICAgIGZlYXQtPmNvc19yZWdfdmFsW2NvcyAqIGNvc19udW0g
KyBqXSAhPSBpbmZvLT52YWxbaW5kZXhdICkKClRoZSBkZXNjcmlwdGlvbiBpcyBpbmRlZWQgbXVj
aCBiZXR0ZXIgbm93LCB0aGFua3MuIEhvd2V2ZXIsCmFzIGluZGljYXRlZCBpbiByZXBseSB0byB2
MSwgdGhpcyBleHRyYSAoYW5kIGF0IHRoZSBmaXJzdCBnbGFuY2UKdW5tb3RpdmF0ZWQpIGJvdW5k
cyBjaGVjayB3YW50cyB0byBiZSBhY2NvbXBhbmllZCBieSBhIGJyaWVmIGJ1dApwcmVjaXNlIGNv
bW1lbnQuIEZ1cnRoZXJtb3JlIHdpdGggdGhlIGxvb3AgYm91bmRlZCBieSBhIGxvY2FsCnZhcmlh
YmxlLCB3aHkgbm90CgogICAgICAgIGNvc19udW0gPSBtaW4ocHJvcHMtPmNvc19udW0sIGZlYXQt
PmNvc19tYXggKyAxKTsKCmEgZmV3IGxpbmVzIHVwIGZyb20gaGVyZSAoYWdhaW4gc3VpdGFibGUg
Y29tbWVudGVkKT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
