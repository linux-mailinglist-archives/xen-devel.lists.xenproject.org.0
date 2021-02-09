Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A004F315092
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 14:42:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83250.154438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9THN-00051i-4b; Tue, 09 Feb 2021 13:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83250.154438; Tue, 09 Feb 2021 13:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9THN-00051J-17; Tue, 09 Feb 2021 13:42:09 +0000
Received: by outflank-mailman (input) for mailman id 83250;
 Tue, 09 Feb 2021 13:42:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+9J=HL=amazon.de=prvs=667ab14d4=nmanthey@srs-us1.protection.inumbo.net>)
 id 1l9THL-00051E-Dx
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 13:42:07 +0000
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea08302a-9a50-40ea-8eb0-23c555be7103;
 Tue, 09 Feb 2021 13:42:06 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 09 Feb 2021 13:41:59 +0000
Received: from EX13D02EUB001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9E774C0154; Tue,  9 Feb 2021 13:41:57 +0000 (UTC)
Received: from u6fc700a6f3c650.ant.amazon.com (10.43.160.207) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 9 Feb 2021 13:41:53 +0000
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
X-Inumbo-ID: ea08302a-9a50-40ea-8eb0-23c555be7103
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1612878126; x=1644414126;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=4nK5w3MJVVynroNoPKfhgIY8pLUf9kXkXRYfO4rxfqE=;
  b=qsyFpRfDlvFa4GMiErJecFm2tsIBcwXC4GURqKJzOJfIEzbvChcsTb8e
   0uSwPwWZ7rW1B3z+tREUAvijEZC5fFTZNMzrp7dkQGWqknmU5Ac09ir6v
   9jBgdowTFSlcZwo8cLQ+vVPAxsYk992IThigkf/aPBGdHGoK8WoH4ZWqO
   c=;
X-IronPort-AV: E=Sophos;i="5.81,165,1610409600"; 
   d="scan'208";a="83572981"
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
From: Norbert Manthey <nmanthey@amazon.de>
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <9f753ee9-73c5-aa2c-3c68-eed7e0c2608b@amazon.de>
Date: Tue, 9 Feb 2021 14:41:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b8529792-3d99-2e0d-7ebe-31c2c406145f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
X-Originating-IP: [10.43.160.207]
X-ClientProxiedBy: EX13D16UWC001.ant.amazon.com (10.43.162.117) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Content-Transfer-Encoding: base64

T24gMi85LzIxIDEwOjQwIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBDQVVUSU9OOiBUaGlzIGVt
YWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhl
IHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLgo+Cj4KPgo+IE9uIDA4LjAyLjIw
MjEgMjA6NDcsIE5vcmJlcnQgTWFudGhleSB3cm90ZToKPj4gT24gMi84LzIxIDM6MjEgUE0sIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMDUuMDIuMjAyMSAyMTozOSwgTm9yYmVydCBNYW50aGV5
IHdyb3RlOgo+Pj4+IEBAIC00MTA4LDYgKzQxMDgsMTMgQEAgc3RhdGljIGludCBodm1fYWxsb3df
c2V0X3BhcmFtKHN0cnVjdCBkb21haW4gKmQsCj4+Pj4gICAgICBpZiAoIHJjICkKPj4+PiAgICAg
ICAgICByZXR1cm4gcmM7Cj4+Pj4KPj4+PiArICAgIGlmICggaW5kZXggPj0gSFZNX05SX1BBUkFN
UyApCj4+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4gKwo+Pj4+ICsgICAgLyogTWFr
ZSBzdXJlIHdlIGV2YWx1YXRlIHBlcm1pc3Npb25zIGJlZm9yZSBsb2FkaW5nIGRhdGEgb2YgZG9t
YWlucy4gKi8KPj4+PiArICAgIGJsb2NrX3NwZWN1bGF0aW9uKCk7Cj4+Pj4gKwo+Pj4+ICsgICAg
dmFsdWUgPSBkLT5hcmNoLmh2bS5wYXJhbXNbaW5kZXhdOwo+Pj4+ICAgICAgc3dpdGNoICggaW5k
ZXggKQo+Pj4+ICAgICAgewo+Pj4+ICAgICAgLyogVGhlIGZvbGxvd2luZyBwYXJhbWV0ZXJzIHNo
b3VsZCBvbmx5IGJlIGNoYW5nZWQgb25jZS4gKi8KPj4+IEkgZG9uJ3Qgc2VlIHRoZSBuZWVkIGZv
ciB0aGUgaGVhdmllciBibG9ja19zcGVjdWxhdGlvbigpIGhlcmU7Cj4+PiBhZmFpY3QgYXJyYXlf
YWNjZXNzX25vc3BlYygpIHNob3VsZCBkbyBmaW5lLiBUaGUgc3dpdGNoKCkgaW4KPj4+IGNvbnRl
eHQgYWJvdmUgYXMgd2VsbCBhcyB0aGUgc3dpdGNoKCkgZnVydGhlciBkb3duIGluIHRoZQo+Pj4g
ZnVuY3Rpb24gZG9uJ3QgaGF2ZSBhbnkgc3BlY3VsYXRpb24gc3VzY2VwdGlibGUgY29kZS4KPj4g
VGhlIHJlYXNvbiB0byBibG9jayBzcGVjdWxhdGlvbiBpbnN0ZWFkIG9mIGp1c3QgdXNpbmcgdGhl
IGhhcmRlbmVkIGluZGV4Cj4+IGFjY2VzcyBpcyB0byBub3QgYWxsb3cgdG8gc3BlY3VsYXRpdmVs
eSBsb2FkIGRhdGEgZnJvbSBhbm90aGVyIGRvbWFpbi4KPiBPa2F5LCBsb29rcyBsaWtlIEkgZ290
IG1pc2xlYWQgYnkgdGhlIGFkZGVkIGJvdW5kcyBjaGVjay4gV2h5Cj4gZG8geW91IGFkZCB0aGF0
LCB3aGVuIHRoZSBzb2xlIGNhbGxlciBhbHJlYWR5IGhhcyBvbmU/IEl0J2xsCj4gc3VmZmljZSBz
aW5jZSB5b3UgbW92ZSB0aGUgYXJyYXkgYWNjZXNzIHBhc3QgdGhlIGJhcnJpZXIsCj4gd29uJ3Qg
aXQ/CkkgY2FuIGRyb3AgdGhhdCBib3VuZCBjaGVjayBhZ2Fpbi4gVGhpcyB3YXMgYWRkZWQgdG8g
bWFrZSBzdXJlIG90aGVyCmNhbGxlcnMgd291bGQgYmUgc2F2ZSBhcyB3ZWxsLiBUaGlua2luZyBh
Ym91dCB0aGlzIGEgbGl0dGxlIG1vcmUsIHRoZQpjaGVjayBjb3VsZCBhY3R1YWxseSBiZSBtb3Zl
ZCBpbnRvIHRoZSBodm1fYWxsb3dfc2V0X3BhcmFtIGZ1bmN0aW9uLAphYm92ZSB0aGUgZmlyc3Qg
aW5kZXggYWNjZXNzIGluIHRoYXQgZnVuY3Rpb24uIEFyZSB0aGVyZSBnb29kIHJlYXNvbnMgdG8K
bm90IG1vdmUgdGhlIGluZGV4IGNoZWNrIGludG8gdGhlIGFsbG93IGZ1bmN0aW9uPwo+Cj4+Pj4g
QEAgLTQxNDEsNiArNDE0OCw5IEBAIHN0YXRpYyBpbnQgaHZtX3NldF9wYXJhbShzdHJ1Y3QgZG9t
YWluICpkLCB1aW50MzJfdCBpbmRleCwgdWludDY0X3QgdmFsdWUpCj4+Pj4gICAgICBpZiAoIHJj
ICkKPj4+PiAgICAgICAgICByZXR1cm4gcmM7Cj4+Pj4KPj4+PiArICAgIC8qIE1ha2Ugc3VyZSB3
ZSBldmFsdWF0ZSBwZXJtaXNzaW9ucyBiZWZvcmUgbG9hZGluZyBkYXRhIG9mIGRvbWFpbnMuICov
Cj4+Pj4gKyAgICBibG9ja19zcGVjdWxhdGlvbigpOwo+Pj4+ICsKPj4+PiAgICAgIHN3aXRjaCAo
IGluZGV4ICkKPj4+PiAgICAgIHsKPj4+PiAgICAgIGNhc2UgSFZNX1BBUkFNX0NBTExCQUNLX0lS
UToKPj4+IExpa2UgeW91IGRvIGZvciB0aGUgImdldCIgcGF0aCBJIHRoaW5rIHRoaXMgc2ltaWxh
cmx5IHJlbmRlcnMKPj4+IHBvaW50bGVzcyB0aGUgdXNlIGluIGh2bW9wX3NldF9wYXJhbSgpIChh
bmQgLSBzZWUgYmVsb3cgLSB0aGUKPj4+IHNhbWUgY29uc2lkZXJhdGlvbiB3cnQgaXNfaHZtX2Rv
bWFpbigpIGFwcGxpZXMpLgo+PiBDYW4geW91IHBsZWFzZSBiZSBtb3JlIHNwZWNpZmljIHdoeSB0
aGlzIGlzIHBvaW50bGVzcz8gSSB1bmRlcnN0YW5kIHRoYXQKPj4gdGhlIGlzX2h2bV9kb21haW4g
Y2hlY2sgY29tZXMgd2l0aCBhIGJhcnJpZXIgdGhhdCBjYW4gYmUgdXNlZCB0byBub3QgYWRkCj4+
IGFub3RoZXIgYmFycmllci4gSG93ZXZlciwgSSBkaWQgbm90IGZpbmQgc3VjaCBhIGJhcnJpZXIg
aGVyZSwgd2hpY2gKPj4gY29tZXMgYmV0d2VlbiB0aGUgJ2lmIChyYyknIGp1c3QgYWJvdmUsIGFu
ZCB0aGUgcG90ZW50aWFsIG5leHQgYWNjZXNzCj4+IGJhc2VkIG9uIHRoZSB2YWx1ZSBvZiAnaW5k
ZXgnLiBBdCBsZWFzdCB0aGUgYWNjZXNzIGJlaGluZCB0aGUgc3dpdGNoCj4+IHN0YXRlbWVudCBj
YW5ub3QgYmUgb3B0aW1pemVkIGFuZCByZXBsYWNlZCB3aXRoIGEgY29uc3RhbnQgdmFsdWUgZWFz
aWx5Lgo+IEknbSBzdXNwZWN0aW5nIGEgbWlzdW5kZXJzdGFuZGluZyAodGhlIG1vcmUgdGhhdCBm
dXJ0aGVyIGRvd24KPiB5b3UgZGlkIGFncmVlIHRvIHdoYXQgSSd2ZSBzYWlkIGZvciBodm1vcF9n
ZXRfcGFyYW0oKSk6IEknbQo+IG5vdCBzYXlpbmcgeW91ciBhZGRpdGlvbiBpcyBwb2ludGxlc3Mu
IEluc3RlYWQgSSdtIHNheWluZyB0aGF0Cj4geW91ciBhZGRpdGlvbiBzaG91bGQgYmUgYWNjb21w
YW5pZWQgYnkgcmVtb3ZhbCBvZiB0aGUgYmFycmllcgo+IGZyb20gaHZtb3Bfc2V0X3BhcmFtKCks
IHBhcmFsbGVsaW5nIHdoYXQgeW91IGRvIHRvCj4gaHZtb3BfZ2V0X3BhcmFtKCkuIEFuZCBhZGRp
dGlvbmFsbHkgSSdtIHNheWluZyB0aGF0IGp1c3QgbGlrZQo+IGluIGh2bW9wX2dldF9wYXJhbSgp
IHRoZSBiYXJyaWVyIHRoZXJlIHdhcyBhbHJlYWR5IHByZXZpb3VzbHkKPiByZWR1bmRhbnQgd2l0
aCB0aGF0IGluc2lkZSBpc19odm1fZG9tYWluKCkuCgpJIG5vdyB1bmRlcnN0YW5kLCB0aGFuayB5
b3UuIEkgYWdyZWUsIHRoZSBhbHJlYWR5IGV4aXN0aW5nIGJhcnJpZXIgaW4KdGhlIGh2bW9wX3Nl
dF9wYXJhbSBmdW5jdGlvbiBjYW4gYmUgZHJvcHBlZCBhcyB3ZWxsLiBJIHdpbGwgdXBkYXRlIHRo
ZQpkaWZmIGFjY29yZGluZ2x5LCBhZnRlciB3ZSBjb25jbHVkZWQgd2hlcmUgdG8gcHV0IHRoZSBp
bmRleCBjaGVjay4KCkJlc3QsCk5vcmJlcnQKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIg
R2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1
bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFt
dHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4K
VXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCg==


