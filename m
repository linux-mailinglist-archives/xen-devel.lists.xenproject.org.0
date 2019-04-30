Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C7FF28B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 11:11:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLOlB-0003Aj-62; Tue, 30 Apr 2019 09:09:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rCO=TA=citrix.com=prvs=016a9660e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hLOl9-0003Ae-C8
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 09:09:07 +0000
X-Inumbo-ID: 9a55e013-6b27-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9a55e013-6b27-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 09:09:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,413,1549929600"; d="scan'208";a="89454788"
Date: Tue, 30 Apr 2019 11:08:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190430090854.5vgvu4invvuzgci6@Air-de-Roger>
References: <1556601559-30921-1-git-send-email-chao.gao@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556601559-30921-1-git-send-email-chao.gao@intel.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/pt: skip setup of posted format IRTE
 when gvec is 0
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDE6MTk6MTlQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gV2hlbiB0ZXN0aW5nIHdpdGggYW4gVVAgZ3Vlc3Qgd2l0aCBhIHBhc3MtdGhydSBkZXZpY2Ug
d2l0aCB2dC1kIHBpCj4gZW5hYmxlZCBpbiBob3N0LCB3ZSBvYnNlcnZlZCB0aGF0IGd1ZXN0IGNv
dWxkbid0IHJlY2VpdmUgaW50ZXJydXB0cwo+IGZyb20gdGhhdCBwYXNzLXRocnUgZGV2aWNlLiBE
dW1waW5nIElSVEUsIHdlIGZvdW5kIHRoZSBjb3JyZXNwb25kaW5nCj4gSVJURSBpcyBzZXQgdG8g
cG9zdGVkIGZvcm1hdCB3aXRoICJ2ZWN0b3IiIGZpZWxkIGFzIDAuCj4gCj4gV2Ugd291bGQgZmFs
bCBpbnRvIHRoaXMgaXNzdWUgd2hlbiBndWVzdCB1c2VkIHRoZSBwaXJxIGZvcm1hdCBvZiBNU0kK
CkkgdGhpbmsgdGhlIGFib3ZlIHNlbnRlbmNlIGlzIGEgYml0IGNvbmZ1c2luZy4gSSB3b3VsZCBy
YXRoZXIgc2F5IHRoYXQKdGhlIGd1ZXN0IGlzIHJvdXRpbmcgaW50ZXJydXB0cyBmcm9tIHBhc3N0
aHJvdWdoIGRldmljZXMgb3ZlciBldmVudApjaGFubmVscyB1c2luZyBwaXJxcy4KCj4gKHNlZSB0
aGUgY29tbWVudCB4ZW5fbXNpX2NvbXBvc2VfbXNnKCkgaW4gbGludXgga2VybmVsKS4gQXMgJ2Rl
c3RfaWQnCj4gaXMgcmVwdXJwb3NlZCwgc2tpcCBtaWdyYXRpb24gd2hpY2ggaXMgYmFzZWQgb24g
J2Rlc3RfaWQnLgoKTGlrZSBKYW4sIEkgd29uZGVyIHdoeSB0aGUgZGV2aWNlIG1vZGVsIChJIGFz
c3VtZSBRRU1VKSBpc3N1ZXMgYQpYRU5fRE9NQ1RMX2JpbmRfcHRfaXJxIGh5cGVyY2FsbCB3aGVu
IHRoZSBndWVzdCBpcyBhdHRlbXB0aW5nIHRvIHJvdXRlCnRoaXMgaW50ZXJydXB0cyBvdmVyIGFu
IGV2ZW50IGNoYW5uZWwsIGF0dGVtcHRpbmcgdG8gYmluZCBpdCB0byBhCnZlY3RvciBzZWVtcyBs
aWtlIGEgYnVnIGluIHRoZSBkZXZpY2UgbW9kZWwuCgpJIHdvdWxkIGFsc28gY29uc2lkZXIgd2hl
dGhlciBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIG5vdCBleHBvc2UgdGhlClhFTkZFQVRfaHZtX3Bp
cnFzIGZlYXR1cmUgd2hlbiBkb2luZyBwYXNzdGhyb3VnaCBpZiBwb3N0ZWQgaW50ZXJydXB0cwph
cmUgc3VwcG9ydGVkLCBwZXJmb3JtYW5jZSB3aXNlIGl0J3MgYmV0dGVyIHRvIHVzZSBwb3N0ZWQg
aW50ZXJydXB0cwpyYXRoZXIgdGhhbiByb3V0aW5nIHRoZW0gb3ZlciBldmVudCBjaGFubmVscyAo
d2hpY2ggcmVxdWlyZXMgWGVuCmludGVyYWN0aW9uKS4KCk5vdGUgdGhhdCBJIHRoaW5rIHRoaXMg
d2hvbGUgWEVORkVBVF9odm1fcGlycXMgaXMgYSBiaWcgaGFjayB3aGljaAphYnVzZXMgYSBoYXJk
d2FyZSBpbnRlcmZhY2UsIGFuZCBJIHdvdWxkIGxpa2UgdG8gc2VlIGl0IHJlbW92ZWQuCgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
