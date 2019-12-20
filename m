Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D842B127F86
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 16:41:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiKMA-0005P9-UI; Fri, 20 Dec 2019 15:38:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiKM9-0005P3-Ju
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 15:38:21 +0000
X-Inumbo-ID: c00e62fe-233e-11ea-9384-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c00e62fe-233e-11ea-9384-12813bfff9fa;
 Fri, 20 Dec 2019 15:38:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 28394AC50;
 Fri, 20 Dec 2019 15:38:20 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1576771399-14654-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <215e0d84-be80-e7bf-9681-0d4b73a544e2@suse.com>
Date: Fri, 20 Dec 2019 16:38:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1576771399-14654-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/time: update vtsc_last with cmpxchg
 and drop vtsc_lock
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTIuMjAxOSAxNzowMywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gTm93IHRoYXQgdnRz
Y19sYXN0IGlzIHRoZSBvbmx5IGVudGl0eSBwcm90ZWN0ZWQgYnkgdnRzY19sb2NrIHdlIGNhbgo+
IHNpbXBseSB1cGRhdGUgaXQgdXNpbmcgYSBzaW5nbGUgYXRvbWljIG9wZXJhdGlvbiBhbmQgZHJv
cCB0aGUgc3BpbmxvY2sKPiBlbnRpcmVseS4gVGhpcyBpcyBleHRyZW1lbHkgaW1wb3J0YW50IGZv
ciB0aGUgY2FzZSBvZiBydW5uaW5nIG5lc3RlZAo+IChlLmcuIHNoaW0gaW5zdGFuY2Ugd2l0aCBs
b3RzIG9mIHZDUFVzIGFzc2lnbmVkKSBzaW5jZSBpZiBwcmVlbXB0aW9uCj4gaGFwcGVucyBzb21l
d2hlcmUgaW5zaWRlIHRoZSBjcml0aWNhbCBzZWN0aW9uIHRoYXQgd291bGQgaW1tZWRpYXRlbHkK
PiBtZWFuIHRoYXQgb3RoZXIgdkNQVSBzdG9wIHByb2dyZXNzaW5nIChhbmQgcHJvYmFibHkgYmVp
bmcgcHJlZW1wdGVkCj4gYXMgd2VsbCkgd2FpdGluZyBmb3IgdGhlIHNwaW5sb2NrIHRvIGJlIGZy
ZWVkLgo+IAo+IFRoaXMgZml4ZXMgY29uc3RhbnQgc2hpbSBndWVzdCBib290IGxvY2t1cHMgd2l0
aCB+MzIgdkNQVXMgaWYgdGhlcmUgaXMKPiB2Q1BVIG92ZXJjb21taXQgcHJlc2VudCAod2hpY2gg
aW5jcmVhc2VzIHRoZSBsaWtlbGlob29kIG9mIHByZWVtcHRpb24pLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgoKUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
