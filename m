Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA861A7AA0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 07:12:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5NX6-0005Jv-VN; Wed, 04 Sep 2019 05:08:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5NX5-0005Jq-I2
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 05:08:39 +0000
X-Inumbo-ID: 0d0a6c36-ced2-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d0a6c36-ced2-11e9-b76c-bc764e2007e4;
 Wed, 04 Sep 2019 05:08:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4264BAD43;
 Wed,  4 Sep 2019 05:08:36 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-6-jgross@suse.com>
 <87905a2d-acd5-90b7-1c40-bf81f5ac005b@suse.com>
 <75a52d2d-a482-c62d-8d30-b02aba00d349@suse.com>
 <2a7b100c-2403-6bf2-7a73-3f2b0a2461a4@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <399094e6-46f7-ccae-74d4-52aeedf75fa5@suse.com>
Date: Wed, 4 Sep 2019 07:08:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2a7b100c-2403-6bf2-7a73-3f2b0a2461a4@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 5/5] xen: modify several static locks to
 unique names
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMTkgMTc6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAzLjA5LjIwMTkgMTc6
MDMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDAzLjA5LjE5IDE2OjUzLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDI5LjA4LjIwMTkgMTI6MTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gSW4gb3JkZXIgdG8gaGF2ZSB1bmlxdWUgbmFtZXMgd2hlbiBkb2luZyBsb2NrIHByb2ZpbGlu
ZyBzZXZlcmFsIGxvY2FsCj4+Pj4gbG9ja3MgImxvY2siIG5lZWQgdG8gYmUgcmVuYW1lZC4KPj4+
Cj4+PiBCdXQgdGhlc2UgYXJlIGFsbCBuYW1lZCBzaW1wbHkgImxvY2siIGZvciBhIGdvb2QgcmVh
c29uLCBpbmNsdWRpbmcKPj4+IGJlY2F1c2UgdGhleSdyZSBhbGwgZnVuY3Rpb24gc2NvcGUgc3lt
Ym9scyAoYW5kIHR5cGljYWxseSB0aGUKPj4+IGZ1bmN0aW9ucyBhcmUgYWxsIHN1ZmZpY2llbnRs
eSBzaG9ydCkuIFRoZSBpc3N1ZSBzdGVtcyBmcm9tIHRoZQo+Pj4gZHVhbCB1c2Ugb2YgIm5hbWUi
IGluCj4+Pgo+Pj4gI2RlZmluZSBfTE9DS19QUk9GSUxFKG5hbWUpIHsgMCwgI25hbWUsICZuYW1l
LCAwLCAwLCAwLCAwLCAwIH0KPj4+Cj4+PiBzbyBJJ2QgcmF0aGVyIHN1Z2dlc3QgbWFraW5nIHRo
aXMgYSBkZXJpdmF0aW9uIG9mIGEgbmV3Cj4+Pgo+Pj4gI2RlZmluZSBfTE9DS19QUk9GSUxFX05B
TUUobG9jaywgbmFtZSkgeyAwLCAjbmFtZSwgJmxvY2ssIDAsIDAsIDAsIDAsIDAgfQo+Pj4KPj4+
IGlmIHRoZXJlJ3Mgbm8gb3RoZXIgKHRyYW5zcGFyZW50KSB3YXkgb2YgZGlzYW1iaWd1YXRpbmcg
dGhlIG5hbWVzLgo+Pgo+PiBUaGlzIHdpbGwgcmVxdWlyZSB0byB1c2UgYSBkaWZmZXJlbnQgREVG
SU5FX1NQSU5MT0NLKCkgdmFyaWFudCwgc28gZS5nLgo+PiBERUZJTkVfU1BJTkxPQ0tfTE9DQUwo
KSwgd2hpY2ggd2lsbCB0aGVuIGluY2x1ZGUgdGhlIG5lZWRlZCAic3RhdGljIiBhbmQKPj4gYWRk
ICJAPGZ1bmM+IiB0byB0aGUgbG9jayBwcm9maWxpbmcgbmFtZS4gSXMgdGhpcyBva2F5Pwo+IAo+
IFRvIGJlIGZyYW5rIC0gbm90IHJlYWxseS4gSSBkaXNsaWtlIGJvdGgsIGFuZCB3b3VsZCBoZW5j
ZSBwcmVmZXIgdG8KPiBzdGljayB0byB3aGF0IHRoZXJlIGlzIGN1cnJlbnRseSwgdW50aWwgc29t
ZW9uZSBpbnZlbnRzIGEgdHJhbnNwYXJlbnQKPiB3YXkgdG8gZGlzYW1iaWd1YXRlIHRoZXNlLiBJ
J20gc29ycnkgZm9yIGJlaW5nIHVuaGVscGZ1bCBoZXJlLgoKTlAgd2l0aCBtZS4gSXQgd2FzIEFu
ZHJldyB3aG8gYXNrZWQgZm9yIGEgd2F5IHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbgptdWx0aXBs
ZSBsb2Nrcy4gSSdtIG5vdCBkZXBlbmRpbmcgaW4gYW55IHdheSBvbiB0aGlzIHBhdGNoLgoKCkp1
ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
