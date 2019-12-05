Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59808113D9C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 10:13:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icnAT-00079Q-HW; Thu, 05 Dec 2019 09:11:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icnAR-00079E-V1
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 09:11:23 +0000
X-Inumbo-ID: 350964f2-173f-11ea-a0d2-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 350964f2-173f-11ea-a0d2-bc764e2007e4;
 Thu, 05 Dec 2019 09:11:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4FB52AFF6;
 Thu,  5 Dec 2019 09:11:22 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191204094335.24603-1-andrew.cooper3@citrix.com>
 <20191204094335.24603-4-andrew.cooper3@citrix.com>
 <1db6336f-1493-b032-7dc2-4f70a7315eae@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4d4ed99d-e25d-1b82-4fe1-528ae27ee2fb@suse.com>
Date: Thu, 5 Dec 2019 10:11:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1db6336f-1493-b032-7dc2-4f70a7315eae@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] x86/svm: Clean up intinfo_t variables
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAyMDozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNC8xMi8yMDE5
IDA5OjQzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBAQCAtNDIwLDEwICs0MjAsMTAgQEAgc3Ry
dWN0IHZtY2Jfc3RydWN0IHsKPj4gICAgICB1NjQgZXhpdGNvZGU7ICAgICAgICAgICAgICAgLyog
b2Zmc2V0IDB4NzAgKi8KPj4gICAgICB1NjQgZXhpdGluZm8xOyAgICAgICAgICAgICAgLyogb2Zm
c2V0IDB4NzggKi8KPj4gICAgICB1NjQgZXhpdGluZm8yOyAgICAgICAgICAgICAgLyogb2Zmc2V0
IDB4ODAgKi8KPj4gLSAgICBldmVudGlual90ICBleGl0aW50aW5mbzsgICAgLyogb2Zmc2V0IDB4
ODggKi8KPj4gKyAgICBpbnRpbmZvX3QgZXhpdGludGluZm87ICAgICAgLyogb2Zmc2V0IDB4ODgg
Ki8KPj4gICAgICB1NjQgX25wX2VuYWJsZTsgICAgICAgICAgICAgLyogb2Zmc2V0IDB4OTAgLSBj
bGVhbmJpdCA0ICovCj4+ICAgICAgdTY0IHJlczA4WzJdOwo+PiAtICAgIGV2ZW50aW5qX3QgIGV2
ZW50aW5qOyAgICAgICAvKiBvZmZzZXQgMHhBOCAqLwo+PiArICAgIGludGluZm9fdCBldmVudGlu
ajsgICAgICAgICAvKiBvZmZzZXQgMHhBOCAqLwo+PiAgICAgIHU2NCBfaF9jcjM7ICAgICAgICAg
ICAgICAgICAvKiBvZmZzZXQgMHhCMCAtIGNsZWFuYml0IDQgKi8KPj4gICAgICB2aXJ0X2V4dF90
IHZpcnRfZXh0OyAgICAgICAgLyogb2Zmc2V0IDB4QjggKi8KPj4gICAgICB2bWNiY2xlYW5iaXRz
X3QgY2xlYW5iaXRzOyAgLyogb2Zmc2V0IDB4QzAgKi8KPiAKPiBPbiBzZWNvbmQgdGhvdWdodHMs
IEknbSBjb25zaWRlcmluZyB1c2luZyB0aGlzIG9wcG9ydHVuaXR5IHRvIHN3aXRjaCB0bwo+IGV4
aXRfaW50X2luZm8gYW5kIGV2ZW50X2luai4KPiAKPiBUaGVyZSBhcmUgYSBsb3Qgb2YgZXhpdC1w
cmVmaXhlZCBuYW1lcyB3aGljaCBhcmUgZWFzeSB0byBjb25mdXNlIGF0IGEKPiBnbGFuY2UuCgpG
aW5lIHdpdGggbWUsIG15IFItYiBzdGFuZHMgd2l0aCB0aGlzIGV4dHJhIHB1cmVseSBtZWNoYW5p
Y2FsCmFkanVzdG1lbnQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
