Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D67B10D5A0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:22:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iafEh-0004lL-5P; Fri, 29 Nov 2019 12:18:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iafEf-0004lA-UI
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:18:57 +0000
X-Inumbo-ID: 6a558fd8-12a2-11ea-a3e5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a558fd8-12a2-11ea-a3e5-12813bfff9fa;
 Fri, 29 Nov 2019 12:18:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 53359ACC0;
 Fri, 29 Nov 2019 12:18:56 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <78b1df38-864c-768e-b306-2db75f3b76e0@citrix.com>
 <e765c741-cba4-42bf-b61a-20a206cd628d@suse.com>
 <24033.2185.509756.178278@mariner.uk.xensource.com>
 <47257a2e-5454-6115-93c9-e1b9ed3a4131@suse.com>
 <d8e8729a-3a20-f65d-0c1b-9f5522f4a450@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f998ce81-8b77-a2c6-ab90-cedff89799da@suse.com>
Date: Fri, 29 Nov 2019 13:19:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d8e8729a-3a20-f65d-0c1b-9f5522f4a450@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 GeorgeDunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxMzoxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOS8xMS8yMDE5
IDEyOjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjkuMTEuMjAxOSAxMzowMSwgSWFuIEph
Y2tzb24gd3JvdGU6Cj4+PiBKYW4gQmV1bGljaCB3cml0ZXMgKCJSZTogW1BBVENIXSBjb25zb2xl
OiBhdm9pZCBidWZmZXIgb3ZlcmZsb3cgaW4gZ3Vlc3RfY29uc29sZV93cml0ZSgpIik6Cj4+Pj4g
T24gMjkuMTEuMjAxOSAxMToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4gSXMgc2l6ZW9m
KGFycmF5WzBdKSBhbHdheXMgMCwgb3IgaXMgdGhpcyBqdXN0IGEgR0NDLWlzbSA/wqAgR29kYm9s
dAo+Pj4+PiBzdWdnZXN0cyBpcyAwIG9uIGFsbCBjb21waWxlciB3ZSBzdXBwb3J0Lgo+Pj4+Pgo+
Pj4+PiBFaXRoZXIgd2F5LCBpc24ndCB0aGUgbW9yZSBjb21tb24gaWRpb20gKyAwdWwgP8KgIFBl
cnNvbmFsbHksIEkgZmVlbCB0aGF0Cj4+Pj4+IGlzIGNsZWFyZXIgdG8gZm9sbG93Lgo+Pj4+IEkg
ZGVjaWRlZCBhZ2FpbnN0ICsgMHVsIG9yIGFsaWtlIGJlY2F1c2UgaW4gcHJpbmNpcGxlIHNpemVf
dAo+Pj4+IGFuZCB1bnNpZ25lZCBsb25nIGFyZSBkaWZmZXJlbnQgdHlwZXMuIEluIHBhcnRpY3Vs
YXIgMzItYml0Cj4+Pj4geDg2IGdjYyB1c2VzIHVuc2lnbmVkIGludCBmb3Igc2l6ZV90LCBhbmQg
aGVuY2UgbWluKCkncwo+Pj4+IHR5cGUgc2FmZXR5IGNoZWNrIHdvdWxkIGNhdXNlIHRoZSBidWls
ZCB0byBmYWlsIHRoZXJlLiBUaGUKPj4+PiBzYW1lIHJpc2sgb2J2aW91c2x5IGV4aXN0cyBmb3Ig
YW55IDMyLWJpdCBhcmNoIChlLmcuIEFybTMyLAo+Pj4+IGJ1dCBJIGhhdmVuJ3QgY2hlY2tlZCB3
aGF0IHR5cGUgaXQgYWN0dWFsbHkgdXNlcykuCj4+PiBJIGRvbid0IGtub3cgd2hhdCBpIHdyb25n
IHdpdGgKPj4+ICAgIChzaXplX3QpMAo+Pj4gd2hpY2ggaXMgc2hvcnRlciwgZXZlbiAhCj4+IFRy
dWUuIFlldCBpdCBjb250YWlucyBhIGNhc3QsIG5vIG1hdHRlciBob3cgcmlzay1mcmVlIGl0IG1h
eSBiZQo+PiBpbiB0aGlzIGNhc2UuIFdpdGggYSBjYXN0LCBJIGNvdWxkIGFzIHdlbGwgaGF2ZSB3
cml0dGVuICh5ZXQKPj4gc2hvcnRlcikgKHNpemVfdCljb3VudC4KPiAKPiBHaXZlbiB0aGF0IG1p
bigpIGhhcyBhIHZlcnkgc3RyaWN0IHR5cGVjaGVjaywgSSB0aGluayB3ZSBzaG91bGQgcGVybWl0
Cj4gYW55IHVzZSBvZiBhbiBleHBsaWNpdCBjYXN0IGluIGEgc2luZ2xlIG9wZXJhbmQsIGJlY2F1
c2UgaXQgKmlzKiBzYWZlcgo+IHRoYW4gc3dpdGNoaW5nIHRvIHRoZSBtaW5fdCgpIHJvdXRlIHRv
IG1ha2UgdGhpbmdzIGNvbXBpbGUuCgpXZWxsLCBJIGNhbiBzd2l0Y2ggdG8gKHNpemVfdCljb3Vu
dCBpZiB0aGlzIGlzIGxpa2VkIGJldHRlcgpvdmVyYWxsLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
