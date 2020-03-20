Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94B718C802
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 08:12:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFBlP-0002xj-EP; Fri, 20 Mar 2020 07:08:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFBlN-0002xe-Vh
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 07:08:14 +0000
X-Inumbo-ID: 8fdadab8-6a79-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fdadab8-6a79-11ea-bec1-bc764e2007e4;
 Fri, 20 Mar 2020 07:08:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D8F48ACF2;
 Fri, 20 Mar 2020 07:08:11 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a699b57-a233-c9a3-2b2d-3f42941c13bf@suse.com>
Date: Fri, 20 Mar 2020 08:08:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86emul: suppress "not built" warning for test
 harness for run targets
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHJ1biogdGFyZ2V0cyBjYW4gYmUgdXNlZCB0byB0ZXN0IHdoYXRldmVyIHRoZSB0b29sIGNo
YWluIGlzIGNhcGFibGUKb2YgYnVpbGRpbmcsIGFzIGxvbmcgYXMgYXQgbGVhc3QgdGhlIG1haW4g
aGFybmVzcyBzb3VyY2UgZmlsZSBidWlsZHMuCkRvbid0IGlzc3VlIHRoZSB3YXJuaW5nIGluIHRo
aXMgY2FzZS4gV2hpbGUgbG9va2luZyBpbnRvIHRoaXMgSSBhbHNvCm5vdGljZWQgdGhlIHdvcmRp
bmcgb2YgdGhlIHJlc3BlY3RpdmUgY29tbWVudCBpc24ndCBxdWl0ZSByaWdodCwgd2hpY2gKdGhl
cmVmb3JlIGdldHMgYWx0ZXJlZCBhdCB0aGUgc2FtZSB0aW1lLgoKU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEvdG9vbHMvdGVzdHMveDg2X2VtdWxh
dG9yL01ha2VmaWxlCisrKyBiL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZQpAQCAt
OTcsNyArOTcsNyBAQCBhdng1MTJkcS1vcG1hc2stdmVjcyA6PSAxIDIKIGF2eDUxMmJ3LW9wbWFz
ay12ZWNzIDo9IDQgOAogCiAjIFN1cHByZXNzIGJ1aWxkaW5nIGJ5IGRlZmF1bHQgb2YgdGhlIGhh
cm5lc3MgaWYgdGhlIGNvbXBpbGVyIGNhbid0IGRlYWwKLSMgd2l0aCBhbnkgb2YgdGhlIGV4dGVu
c2lvbnMgdXNlZC4gIERvbid0IGFsdGVyIHRoZSAicnVuIiB0YXJnZXQgZGVwZW5kZW5jaWVzCisj
IHdpdGggc29tZSBvZiB0aGUgZXh0ZW5zaW9ucyB1c2VkLiAgRG9uJ3QgYWx0ZXIgdGhlICJydW4i
IHRhcmdldCBkZXBlbmRlbmNpZXMKICMgdGhvdWdoLCBhcyB0aGlzIHRhcmdldCBuZWVkcyB0byBi
ZSBzcGVjaWZpZWQgbWFudWFsbHksIGFuZCB0aGluZ3MgbWF5IHdvcmsKICMgcGFydGlhbGx5IGV2
ZW4gd2l0aCBvbGRlciBjb21waWxlcnMuCiBUQVJHRVQteSA6PSAkKFRBUkdFVCkKQEAgLTExMiw3
ICsxMTIsNyBAQCAkKGZvcmVhY2ggZmxhdm9yLCQoU0lNRCkgJChGTUEpLCQoZXZhbCAkCiAjIG9u
bHkgYWZ0ZXIgQVZYNTEyRiBhbmQgc29tZSBvZiBpdHMgZXh0ZW5zaW9ucy4KIFRBUkdFVC0kKHNo
ZWxsIGVjaG8gJ2FzbSgie2V2ZXh9IHZ6ZXJvYWxsIik7JyB8ICQoQ0MpIC14IGMgLWMgLW8gL2Rl
di9udWxsIC0gfHwgZWNobyB5KSA6PQogCi1pZmVxICgkKFRBUkdFVC15KSwpCitpZmVxICgkKFRB
UkdFVC15KSQoZmlsdGVyIHJ1biUsJChNQUtFQ01ER09BTFMpKSwpCiAkKHdhcm5pbmcgVGVzdCBo
YXJuZXNzIG5vdCBidWlsdCwgdXNlIG5ld2VyIGNvbXBpbGVyIHRoYW4gIiQoQ0MpIiAodmVyc2lv
biAkKHNoZWxsICQoQ0MpIC1kdW1wdmVyc2lvbikpIGFuZCBhbiAie2V2ZXh9IiBjYXBhYmxlIGFz
c2VtYmxlcikKIGVuZGlmCiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
