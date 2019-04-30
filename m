Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C516FE2B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 18:51:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLVw3-0003TZ-Qp; Tue, 30 Apr 2019 16:48:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Cw4C=TA=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hLVw2-0003TM-7k
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 16:48:50 +0000
X-Inumbo-ID: d3c608ae-6b67-11e9-a9f1-67cadb54e1de
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3c608ae-6b67-11e9-a9f1-67cadb54e1de;
 Tue, 30 Apr 2019 16:48:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AE7DF309266D;
 Tue, 30 Apr 2019 16:48:48 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-42.rdu2.redhat.com
 [10.10.121.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B356D183A9;
 Tue, 30 Apr 2019 16:48:45 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <1556223838-5176-1-git-send-email-igor.druzhinin@citrix.com>
 <1556223838-5176-4-git-send-email-igor.druzhinin@citrix.com>
 <b999513b-b843-e440-d1f2-c49589506a65@redhat.com>
 <20190430163551.GA1264@perard.uk.xensource.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <c397c8a4-4a97-7e57-8233-6bb5632e40d8@redhat.com>
Date: Tue, 30 Apr 2019 18:48:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190430163551.GA1264@perard.uk.xensource.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 30 Apr 2019 16:48:48 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v3 3/3] OvmfPkg/XenSupport:
 turn off address decoding before BAR sizing
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, julien.grall@arm.com,
 ard.biesheuvel@linaro.org, xen-devel@lists.xenproject.org,
 jordan.l.justen@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMzAvMTkgMTg6MzUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIEZyaSwgQXByIDI2
LCAyMDE5IGF0IDA4OjE1OjA3UE0gKzAyMDAsIExhc3psbyBFcnNlayB3cm90ZToKPj4gT24gMDQv
MjUvMTkgMjI6MjMsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+Pj4gT24gWGVuLCBodm1sb2FkZXIg
ZmlybXdhcmUgbGVhdmVzIGFkZHJlc3MgZGVjb2RpbmcgZW5hYmxlZCBmb3IKPj4+IGVudW1lcmF0
ZWQgUENJIGRldmljZSBiZWZvcmUganVtcGluZyBpbnRvIE9WTUYuIE9WTUYgc2VlbXMgdG8KPj4+
IGV4cGVjdCBpdCB0byBiZSBkaXNhYmxlZCBhbmQgdHJpZXMgdG8gc2l6ZSBQQ0kgQkFScyBpbiBz
ZXZlcmFsIHBsYWNlcwo+Pj4gd2l0aG91dCBkaXNhYmxpbmcgaXQgd2hpY2ggY2F1c2VzIEJBUjY0
LCBmb3IgZXhhbXBsZSwgYmVpbmcKPj4+IGluY29ycmVjdGx5IHBsYWNlZCBieSBRRU1VLgo+Pj4K
Pj4+IEZpeCBpdCBieSBkaXNhYmxpbmcgUENJIGFkZHJlc3MgZGVjb2RpbmcgZXhwbGljaXRseSBi
ZWZvcmUgdGhlCj4+PiBmaXJzdCBhdHRlbXB0IHRvIHNpemUgQkFScyBvbiBYZW4uCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+
Cj4+PiAtLS0KPj4+IENoYW5nZXMgaW4gdjM6Cj4+PiAtIGRyb3BwZWQgdW51c2VkIGFyZ3VtZW50
cyBhbmQgcmVuYW1lIFBjYXRQY2lSb290QnJpZGdlRGVjb2RpbmcgZnVuY3Rpb24KPj4+IC0gbWFr
ZSBtYXNrIGFwcGxpY2F0aW9uIG1vcmUgY2xlYXIgYXMgc3VnZ2VzdGVkCj4+PiAtLS0KPj4+ICBP
dm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMgfCAyMSArKysrKysr
KysrKysrKysrKysrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBw
b3J0LmMgYi9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMKPj4+
IGluZGV4IDc2ZmNhNTMuLmI0MWJkNmIgMTAwNjQ0Cj4+PiAtLS0gYS9Pdm1mUGtnL0xpYnJhcnkv
UGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMKPj4+ICsrKyBiL092bWZQa2cvTGlicmFyeS9Q
Y2lIb3N0QnJpZGdlTGliL1hlblN1cHBvcnQuYwo+Pj4gQEAgLTQ5LDYgKzQ5LDIyIEBAIFBjYXRQ
Y2lSb290QnJpZGdlQmFyRXhpc3RlZCAoCj4+PiAgICBFbmFibGVJbnRlcnJ1cHRzICgpOwo+Pj4g
IH0KPj4+ICAKPj4+ICsjZGVmaW5lIFBDSV9DT01NQU5EX0RFQ09ERSAoKFVJTlQxNikoRUZJX1BD
SV9DT01NQU5EX0lPX1NQQUNFIHwgXAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBFRklfUENJX0NPTU1BTkRfTUVNT1JZX1NQQUNFKSkKPj4+ICtTVEFUSUMKPj4+ICtW
T0lECj4+PiArUGNhdFBjaVJvb3RCcmlkZ2VEZWNvZGluZ0Rpc2FibGUgKAo+Pj4gKyAgSU4gIFVJ
TlROICAgICAgICAgICAgICAgICAgICAgICAgICBBZGRyZXNzCj4+PiArICApCj4+PiArewo+Pj4g
KyAgVUlOVDE2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWYWx1ZTsKPj4+ICsKPj4+ICsg
IFZhbHVlID0gUGNpUmVhZDE2IChBZGRyZXNzKTsKPj4+ICsgIGlmIChWYWx1ZSAmIFBDSV9DT01N
QU5EX0RFQ09ERSkgewo+Pj4gKyAgICBQY2lXcml0ZTE2IChBZGRyZXNzLCBWYWx1ZSAmIH4oVUlO
VDMyKVBDSV9DT01NQU5EX0RFQ09ERSk7Cj4+PiArICB9Cj4+PiArfQo+Pj4gKwo+Pj4gIFNUQVRJ
Qwo+Pj4gIFZPSUQKPj4+ICBQY2F0UGNpUm9vdEJyaWRnZVBhcnNlQmFycyAoCj4+PiBAQCAtNzUs
NiArOTEsMTEgQEAgUGNhdFBjaVJvb3RCcmlkZ2VQYXJzZUJhcnMgKAo+Pj4gICAgVUlOVDY0ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIExpbWl0Owo+Pj4gICAgUENJX1JPT1RfQlJJREdFX0FQ
RVJUVVJFICAgICAgICAgICpNZW1BcGVydHVyZTsKPj4+ICAKPj4+ICsgIC8vIERpc2FibGUgYWRk
cmVzcyBkZWNvZGluZyBmb3IgZXZlcnkgZGV2aWNlIGJlZm9yZSBPVk1GIHN0YXJ0cyBzaXppbmcg
aXQKPj4+ICsgIFBjYXRQY2lSb290QnJpZGdlRGVjb2RpbmdEaXNhYmxlICgKPj4+ICsgICAgUENJ
X0xJQl9BRERSRVNTIChCdXMsIERldmljZSwgRnVuY3Rpb24sIFBDSV9DT01NQU5EX09GRlNFVCkK
Pj4+ICsgICk7Cj4+PiArCj4+PiAgICBmb3IgKE9mZnNldCA9IEJhck9mZnNldEJhc2U7IE9mZnNl
dCA8IEJhck9mZnNldEVuZDsgT2Zmc2V0ICs9IHNpemVvZiAoVUlOVDMyKSkgewo+Pj4gICAgICBQ
Y2F0UGNpUm9vdEJyaWRnZUJhckV4aXN0ZWQgKAo+Pj4gICAgICAgIFBDSV9MSUJfQUREUkVTUyAo
QnVzLCBEZXZpY2UsIEZ1bmN0aW9uLCBPZmZzZXQpLAo+Pj4KPj4KPj4gQWNrZWQtYnk6IExhc3ps
byBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Cj4+Cj4+IFNvbWVvbmUgZnJvbSB0aGUgWGVuIGNv
bW11bml0eSBwbGVhc2UgQUNLIHRoaXMgdG9vLCBhbmQgdGhlbiB3ZSBjYW4gcHVzaAo+PiB0aGUg
c2VyaWVzLgo+IAo+IEFja2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT4KClNlcmllcyBwdXNoZWQgYXMgY29tbWl0IHJhbmdlIDlmYjJjZTJmNDY1ZC4uMGM0
MGM5YzkyNWNhLgoKVGhhbmtzCkxhc3psbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
