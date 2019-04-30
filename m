Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B60FA98
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 15:38:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLSuZ-0002Zz-4Y; Tue, 30 Apr 2019 13:35:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s5V/=TA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hLSuW-0002Zp-V4
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 13:35:05 +0000
X-Inumbo-ID: c216bf6d-6b4c-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c216bf6d-6b4c-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 13:35:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB7B080D;
 Tue, 30 Apr 2019 06:35:02 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C440D3F5AF;
 Tue, 30 Apr 2019 06:35:01 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <3ce4998b*a8a8*37bd*bb26*9550571709b6@suse.com>
 <5CC82306020000780022A4E3@prv1*mh.provo.novell.com>
 <ae94fdca-bd2a-2086-450e-c485ca4e59f0@arm.com>
 <5CC82593020000780022A50D@suse.com>
 <dd2eb4c4-4144-17ae-f7a6-a4287aeac461@suse.com>
 <5CC8360E020000780022A70A@prv1-mh.provo.novell.com>
 <c82f388c-49f3-d40d-7e68-bb913cc40d06@arm.com>
 <5CC84EA5020000780022A7C0@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0d999744-93b6-aee6-ff04-785dddcadbee@arm.com>
Date: Tue, 30 Apr 2019 14:35:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC84EA5020000780022A7C0@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] vcpu_block() and do_poll() question
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzMC8wNC8yMDE5IDE0OjMzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAzMC4wNC4x
OSBhdCAxNToxNiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMzAvMDQvMjAx
OSAxMjo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAzMC4wNC4xOSBhdCAxMjo0NCwg
PGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+Pj4gQW4gYWx0ZXJuYXRpdmUgd291bGQgYmUgbWVt
b3J5IGJhcnJpZXJzIGJldHdlZW4gdGhlIHdyaXRlcyBvbiBBUk0sCj4+Pj4gcmlnaHQ/IE9yIGEg
c3Ryb25nIG9yZGVyZWQgc2V0X2JpdCgpIHZhcmlhbnQgKHdlIGhhZCB0aGF0IGRpc2N1c3Npb24K
Pj4+PiByZWNlbnRseSByZWxhdGVkIHRvIGEgYmFycmllciBpbiBBUk0tc3BlY2lmaWMgX19jcHVf
ZGlzYWJsZSgpKS4KPj4KPj4gSSBhbSBub3QgZW50aXJlbHkgYSBiaWcgZmFuIG9mIGEgc3Ryb25n
LW9yZGVyIHZhcmlhbnQuIEl0IHdpbGwgcG90ZW50aWFsbHkgYWRkCj4+IG1vcmUgbWVtb3J5IGJh
cnJpZXJzIHRoYW4gbmVjZXNzYXJ5IGluIHRoaXMgY29udGV4dC4KPj4KPj4+Cj4+PiBZZXMuCj4+
Cj4+IFdoYXQgd291bGQgYmUgdGhlIGFkdmFudGFnZSBvZiAyLTMgbWVtb3J5IGJhcnJpZXJzIG92
ZXIgYSBtZW1vcnkgYmFycmllciArCj4+IGNoZWNrPwo+IAo+IER1bm5vIC0gSSd2ZSBtZXJlbHkg
Y29uZmlybWVkIHRoYXQgdGhpcyBsb29rcyB0byBiZSBhbiBhbHRlcm5hdGl2ZQo+IGNvcnJlY3Qg
c29sdXRpb24uCj4gCj4+Pj4gVGhlbiB3ZSBjb3VsZCBkcm9wIHRoaXMgI2lmbmRlZiBzZWN0aW9u
Lgo+Pj4KPj4+IE5vdCBzdXJlIGFib3V0IHRoaXMgLSBJJ20gYWN0dWFsbHkgdW5jb252aW5jZWQg
dGhlIGxhdHRlciBwYXJ0IG9mCj4+PiB3aGF0J3MgaW5zaWRlIHRoZSAjaWZkZWYgaXNuJ3QgYWN0
dWFsbHkgbmVlZGVkIG9uIHg4NiBhcyB3ZWxsLiBKdXN0Cj4+PiBjb25zaWRlciB0aGUgY2FzZSBv
ZiB2Y3B1X3VuYmxvY2soKSBtYWtpbmcgaXQgdG8gdGhlIHZjcHVfd2FrZSgpCj4+PiBpbnZvY2F0
aW9uIG9uIGFub3RoZXIgQ1BVIHdoaWxlIHdlJ3JlIGJldHdlZW4gYW55IHR3byBvZiB0aGUKPj4+
IHRocmVlIHdyaXRlcyBoZXJlLiAoSSBrbm93IEkndmUgYmVlbiBmZWVsaW5nIHVuZWFzeSBhYm91
dCB0aGlzCj4+PiBiZWZvcmUsIGJ1dCBJIGd1ZXNzIEkgbXVzdCBoYXZlIGNvbWUgdG8gdGhlIGNv
bmNsdXNpb24gdGhhdCBpdCdzCj4+PiBfcHJvYmFibHlfIG9rYXkuKQo+PiBUaGF0J3Mgbm90IGdv
aW5nIHRvIGJlIGNvdmVyZWQgYnkgdGhlIGNoZWNrIG9uIG5vbi14ODYgcGxhdGZvcm0uIEluZGVl
ZCwKPj4gdmNwdV93YWtlKCkgaXMgbm90IHVwZGF0aW5nIGFueSBvZiB0aGUgZmllbGRzLiBTbywg
ZnJvbSBteSB1bmRlcnN0YW5kaW5nLCB0aGUKPj4gd2FrZS11cCByZXF1ZXN0IHdpbGwganVzdCBi
ZSBpZ25vcmVkLgo+IAo+IFBlcmhhcHMgYSBtaXN1bmRlcnN0YW5kaW5nIChvciBJJ20gY29uZnVz
ZWQgbm93KTogSSBtZW50aW9uZWQKPiB2Y3B1X3dha2UoKSBvbmx5IHRvIGRlbGltaXQgaG93IG11
Y2ggb2YgdmNwdV91bmJsb2NrKCkgbmVlZHMKPiBjb21wbGV0aW5nIGZvciB0aGUgcG9zc2libGUg
cHJvYmxlbSB0byBzdXJmYWNlIHRoYXQgSSdtIHN1c3BlY3RpbmcuCgpJIGFtIG5vdCBzdXJlIHdo
YXQgcHJvYmxlbSB5b3UgcmVmZXIuIElzIGl0IHRoZSB3YWtlLXVwIHJlcXVlc3Qgd2lsbCBnZXQg
aWdub3JlZD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
