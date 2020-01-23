Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6539146857
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 13:47:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iubqa-0001H5-KR; Thu, 23 Jan 2020 12:44:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iubqY-0001Gv-GK
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 12:44:30 +0000
X-Inumbo-ID: 178cd1c9-3dde-11ea-be15-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 178cd1c9-3dde-11ea-be15-12813bfff9fa;
 Thu, 23 Jan 2020 12:44:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8FC84ADB3;
 Thu, 23 Jan 2020 12:44:27 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200123122141.1419-1-pdurrant@amazon.com>
 <20200123122141.1419-2-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7143d805-b9ae-1bd2-f357-84a3529464cc@suse.com>
Date: Thu, 23 Jan 2020 13:44:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200123122141.1419-2-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/3] x86 / vmx: make apic_access_mfn
 type-safe
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDEuMjAyMCAxMzoyMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFVzZSBtZm5fdCByYXRo
ZXIgdGhhbiB1bnNpZ25lZCBsb25nIGFuZCBjaGFuZ2UgcHJldmlvdXMgdGVzdHMgYWdhaW5zdCAw
IHRvCj4gdGVzdHMgYWdhaW5zdCBJTlZBTElEX01GTiAoYWxzbyBpbnRyb2R1Y2luZyBpbml0aWFs
aXphdGlvbiB0byB0aGF0IHZhbHVlKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQg
PHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5A
aW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpObywgdGhpcyBpc24ndCB3aGF0IHRoZSBSLWIgd2FzIGdpdmVuIGZvci4KCj4gdjI6Cj4gIC0g
U2V0IGFwaWNfYWNjZXNzX21mbiB0byBJTlZBTElEX01GTiBpbiB2bXhfZnJlZV92bGFwaWNfbWFw
cGluZygpIHRvIG1ha2UKPiAgICB0aGUgZnVuY3Rpb24gaWRlbXBvdGVudAoKQW5kcmV3IGhhZCBz
dWdnZXN0ZWQgdG8gdXNlIDAgaW5zdGVhZCBvZiBJTlZBTElEX01GTi4gSSBkb24ndCBzZWUKaG93
IHlvdSBhY2hpZXZlZCBpZGVtcG90ZW5jeSB3aXRoIHRoaXMgYWRqdXN0bWVudC4gQWl1aQp2bXhf
ZnJlZV92bGFwaWNfbWFwcGluZygpIGlzIHN1cHBvc2VkIHRvIGFsc28gcnVuIGNvcnJlY3RseSBp
Zgp2bXhfYWxsb2NfdmxhcGljX21hcHBpbmcoKSB3YXMgbmV2ZXIgY2FsbGVkLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
