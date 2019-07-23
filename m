Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39397717DE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 14:14:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hptdA-0007Vb-9h; Tue, 23 Jul 2019 12:10:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bPW/=VU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hptd7-0007VW-SA
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 12:10:53 +0000
X-Inumbo-ID: e998f58e-ad42-11e9-a406-ef567e8855c3
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e998f58e-ad42-11e9-a406-ef567e8855c3;
 Tue, 23 Jul 2019 12:10:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 60E3CABD4;
 Tue, 23 Jul 2019 12:10:50 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-2-jgross@suse.com>
 <6f10f947-3375-4a2b-d977-05c587798121@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <65111614-c233-cbcb-b7b2-ca3b2b2aae9d@suse.com>
Date: Tue, 23 Jul 2019 14:10:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <6f10f947-3375-4a2b-d977-05c587798121@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 1/2] xen/sched: fix locking in
 restore_vcpu_affinity()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMTkgMTQ6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIzLjA3LjIwMTkgMTE6
MjAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTcwOCw2ICs3MDgsOCBAQCB2b2lk
IHJlc3RvcmVfdmNwdV9hZmZpbml0eShzdHJ1Y3QgZG9tYWluICpkKQo+PiAgICAgICAgICAgICAq
IHNldCB2LT5wcm9jZXNzb3Igb2YgZWFjaCBvZiB0aGVpciB2Q1BVcyB0byBzb21ldGhpbmcgdGhh
dCB3aWxsCj4+ICAgICAgICAgICAgICogbWFrZSBzZW5zZSBmb3IgdGhlIHNjaGVkdWxlciBvZiB0
aGUgY3B1cG9vbCBpbiB3aGljaCB0aGV5IGFyZSBpbi4KPj4gICAgICAgICAgICAgKi8KPj4gKyAg
ICAgICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEodik7Cj4+ICsKPj4gICAgICAgICAg
ICBjcHVtYXNrX2FuZChjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSksIHYtPmNwdV9oYXJkX2FmZmlu
aXR5LAo+PiAgICAgICAgICAgICAgICAgICAgICAgIGNwdXBvb2xfZG9tYWluX2NwdW1hc2soZCkp
Owo+PiAgICAgICAgICAgIGlmICggY3B1bWFza19lbXB0eShjcHVtYXNrX3NjcmF0Y2hfY3B1KGNw
dSkpICkKPj4gQEAgLTczMSw2ICs3MzMsOSBAQCB2b2lkIHJlc3RvcmVfdmNwdV9hZmZpbml0eShz
dHJ1Y3QgZG9tYWluICpkKQo+PiAgICAKPj4gICAgICAgICAgICB2LT5wcm9jZXNzb3IgPSBjcHVt
YXNrX2FueShjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSkpOwo+PiAgICAKPj4gKyAgICAgICAgc3Bp
bl91bmxvY2tfaXJxKGxvY2spOwo+PiArCj4+ICsJLyogdi0+cHJvY2Vzc29yIG1pZ2h0IGhhdmUg
Y2hhbmdlZCwgc28gcmVhY3F1aXJlIHRoZSBsb2NrLiAqLwo+IAo+IFdob2V2ZXIgY29tbWl0cyB0
aGlzIChwZXJoYXBzIG1lLCBsYXRlciB0b2RheSkgd2lsbCB3YW50IHRvIHJlcGxhY2UKPiB0aGUg
aGFyZCB0YWIgaGVyZS4KCk9oLCBJJ20gc29ycnkgZm9yIHRoYXQhCgpXZSByZWFsbHkgd2FudCBj
aGVja3BhdGNoIGluIFhlbiEKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
