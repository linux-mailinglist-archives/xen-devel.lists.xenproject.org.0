Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC9B315104
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 14:57:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83257.154473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9TVr-0006J7-Tb; Tue, 09 Feb 2021 13:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83257.154473; Tue, 09 Feb 2021 13:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9TVr-0006Ik-QN; Tue, 09 Feb 2021 13:57:07 +0000
Received: by outflank-mailman (input) for mailman id 83257;
 Tue, 09 Feb 2021 13:57:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+9J=HL=amazon.de=prvs=667ab14d4=nmanthey@srs-us1.protection.inumbo.net>)
 id 1l9TVq-0006Ie-FN
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 13:57:06 +0000
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3b0abca-a8ce-48c2-abbf-8aaf1fd1378c;
 Tue, 09 Feb 2021 13:57:05 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 09 Feb 2021 13:56:59 +0000
Received: from EX13D02EUB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id A479FA07E2; Tue,  9 Feb 2021 13:56:57 +0000 (UTC)
Received: from u6fc700a6f3c650.ant.amazon.com (10.43.162.124) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 9 Feb 2021 13:56:54 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e3b0abca-a8ce-48c2-abbf-8aaf1fd1378c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1612879026; x=1644415026;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=D+ryArfULe2L2OH/7HvVZ7NS1e4ozA2vHMXkeJQjCA4=;
  b=aQ/VLF/ZYzfd6FVCD3qxOHS8cZfr+yHEm+pKjfXEIZZYHwlI2bDDOdhe
   vB9lhhtqEEEc5oAadxIYxtgkC5isW+UHuBCjb5THVcw0MC6WJHvDpwPna
   0yN3rYpQRkO7WQQDnFHxVEtUmM4Fc95Nf6EpGX7lq8TrCbJH+NUv1xUCF
   Q=;
X-IronPort-AV: E=Sophos;i="5.81,165,1610409600"; 
   d="scan'208";a="80832677"
Subject: Re: [PATCH HVM v2 1/1] hvm: refactor set param
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	<xen-devel@lists.xenproject.org>
References: <20210205203905.8824-1-nmanthey@amazon.de>
 <edf1cd78-2192-2679-9a34-804c5d7b75c5@suse.com>
 <ba146cd6-fd5a-78d8-40bc-59885d265f5f@amazon.de>
 <b8529792-3d99-2e0d-7ebe-31c2c406145f@suse.com>
 <9f753ee9-73c5-aa2c-3c68-eed7e0c2608b@amazon.de>
 <a52cb2ac-fa85-73cd-0c53-3ee002d6b3ea@suse.com>
From: Norbert Manthey <nmanthey@amazon.de>
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <adee7548-0a60-d7d1-731f-474a585edf6c@amazon.de>
Date: Tue, 9 Feb 2021 14:56:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a52cb2ac-fa85-73cd-0c53-3ee002d6b3ea@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
X-Originating-IP: [10.43.162.124]
X-ClientProxiedBy: EX13D02UWB001.ant.amazon.com (10.43.161.240) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Content-Transfer-Encoding: base64

T24gMi85LzIxIDI6NDUgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjAyLjIwMjEgMTQ6
NDEsIE5vcmJlcnQgTWFudGhleSB3cm90ZToKPj4gT24gMi85LzIxIDEwOjQwIEFNLCBKYW4gQmV1
bGljaCB3cm90ZToKPj4+IE9uIDA4LjAyLjIwMjEgMjA6NDcsIE5vcmJlcnQgTWFudGhleSB3cm90
ZToKPj4+PiBPbiAyLzgvMjEgMzoyMSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA1
LjAyLjIwMjEgMjE6MzksIE5vcmJlcnQgTWFudGhleSB3cm90ZToKPj4+Pj4+IEBAIC00MTA4LDYg
KzQxMDgsMTMgQEAgc3RhdGljIGludCBodm1fYWxsb3dfc2V0X3BhcmFtKHN0cnVjdCBkb21haW4g
KmQsCj4+Pj4+PiAgICAgIGlmICggcmMgKQo+Pj4+Pj4gICAgICAgICAgcmV0dXJuIHJjOwo+Pj4+
Pj4KPj4+Pj4+ICsgICAgaWYgKCBpbmRleCA+PSBIVk1fTlJfUEFSQU1TICkKPj4+Pj4+ICsgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgICAvKiBNYWtlIHN1cmUgd2Ug
ZXZhbHVhdGUgcGVybWlzc2lvbnMgYmVmb3JlIGxvYWRpbmcgZGF0YSBvZiBkb21haW5zLiAqLwo+
Pj4+Pj4gKyAgICBibG9ja19zcGVjdWxhdGlvbigpOwo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgICB2YWx1
ZSA9IGQtPmFyY2guaHZtLnBhcmFtc1tpbmRleF07Cj4+Pj4+PiAgICAgIHN3aXRjaCAoIGluZGV4
ICkKPj4+Pj4+ICAgICAgewo+Pj4+Pj4gICAgICAvKiBUaGUgZm9sbG93aW5nIHBhcmFtZXRlcnMg
c2hvdWxkIG9ubHkgYmUgY2hhbmdlZCBvbmNlLiAqLwo+Pj4+PiBJIGRvbid0IHNlZSB0aGUgbmVl
ZCBmb3IgdGhlIGhlYXZpZXIgYmxvY2tfc3BlY3VsYXRpb24oKSBoZXJlOwo+Pj4+PiBhZmFpY3Qg
YXJyYXlfYWNjZXNzX25vc3BlYygpIHNob3VsZCBkbyBmaW5lLiBUaGUgc3dpdGNoKCkgaW4KPj4+
Pj4gY29udGV4dCBhYm92ZSBhcyB3ZWxsIGFzIHRoZSBzd2l0Y2goKSBmdXJ0aGVyIGRvd24gaW4g
dGhlCj4+Pj4+IGZ1bmN0aW9uIGRvbid0IGhhdmUgYW55IHNwZWN1bGF0aW9uIHN1c2NlcHRpYmxl
IGNvZGUuCj4+Pj4gVGhlIHJlYXNvbiB0byBibG9jayBzcGVjdWxhdGlvbiBpbnN0ZWFkIG9mIGp1
c3QgdXNpbmcgdGhlIGhhcmRlbmVkIGluZGV4Cj4+Pj4gYWNjZXNzIGlzIHRvIG5vdCBhbGxvdyB0
byBzcGVjdWxhdGl2ZWx5IGxvYWQgZGF0YSBmcm9tIGFub3RoZXIgZG9tYWluLgo+Pj4gT2theSwg
bG9va3MgbGlrZSBJIGdvdCBtaXNsZWFkIGJ5IHRoZSBhZGRlZCBib3VuZHMgY2hlY2suIFdoeQo+
Pj4gZG8geW91IGFkZCB0aGF0LCB3aGVuIHRoZSBzb2xlIGNhbGxlciBhbHJlYWR5IGhhcyBvbmU/
IEl0J2xsCj4+PiBzdWZmaWNlIHNpbmNlIHlvdSBtb3ZlIHRoZSBhcnJheSBhY2Nlc3MgcGFzdCB0
aGUgYmFycmllciwKPj4+IHdvbid0IGl0Pwo+PiBJIGNhbiBkcm9wIHRoYXQgYm91bmQgY2hlY2sg
YWdhaW4uIFRoaXMgd2FzIGFkZGVkIHRvIG1ha2Ugc3VyZSBvdGhlcgo+PiBjYWxsZXJzIHdvdWxk
IGJlIHNhdmUgYXMgd2VsbC4gVGhpbmtpbmcgYWJvdXQgdGhpcyBhIGxpdHRsZSBtb3JlLCB0aGUK
Pj4gY2hlY2sgY291bGQgYWN0dWFsbHkgYmUgbW92ZWQgaW50byB0aGUgaHZtX2FsbG93X3NldF9w
YXJhbSBmdW5jdGlvbiwKPj4gYWJvdmUgdGhlIGZpcnN0IGluZGV4IGFjY2VzcyBpbiB0aGF0IGZ1
bmN0aW9uLiBBcmUgdGhlcmUgZ29vZCByZWFzb25zIHRvCj4+IG5vdCBtb3ZlIHRoZSBpbmRleCBj
aGVjayBpbnRvIHRoZSBhbGxvdyBmdW5jdGlvbj8KPiBJIGd1ZXNzIEknbSBjb25mdXNlZDogV2Un
cmUgdGFsa2luZyBhYm91dCBkcm9wcGluZyB0aGUgY2hlY2sKPiB5b3UgYWRkIHRvIGh2bV9hbGxv
d19zZXRfcGFyYW0oKSBhbmQgeW91IHN1Z2dlc3QgdG8gIm1vdmUiIGl0Cj4gcmlnaHQgdGhlcmU/
CgpZZXMuIEkgY2FuIGVpdGhlciBqdXN0IG5vIGludHJvZHVjZSB0aGF0IGNoZWNrIGluIHRoYXQg
ZnVuY3Rpb24gKHdoaWNoCmlzIHdoYXQgeW91IHN1Z2dlc3RlZCkuIEFzIGFuIGFsdGVybmF0aXZl
LCB0byBoYXZlIGFsbCBjaGVja3MgaW4gb25lCmZ1bmN0aW9uLCBJIHByb3Bvc2VkIHRvIGluc3Rl
YWQgbW92ZSBpdCBpbnRvIGh2bV9hbGxvd19zZXRfcGFyYW0uIElmIHlvdQpkbyBub3QgbGlrZSB0
aGlzIHByb3Bvc2FsLCBJJ2xsIGZvbGxvdyB5b3VyIHN1Z2dlc3Rpb24gYW5kIHdpbGwgc2ltcGx5
Cm5vdCBpbnRyb2R1Y2UgdGhlIGFkZGl0aW9uYWwgYm91bmQgY2hlY2sgYXMgcGFydCBvZiB0aGlz
IHBhdGNoLgoKQmVzdCwKTm9yYmVydAoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJt
YW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzog
Q2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWluZ2V0cmFnZW4gYW0gQW10c2dl
cmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3Qt
SUQ6IERFIDI4OSAyMzcgODc5CgoK


