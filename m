Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D336F3214F
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2019 02:44:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXEYe-0001b6-9v; Sun, 02 Jun 2019 00:41:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uFtn=UB=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hXEYc-0001b1-IR
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2019 00:41:06 +0000
X-Inumbo-ID: 18b42722-84cf-11e9-b967-2fc0c4f6f2ea
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18b42722-84cf-11e9-b967-2fc0c4f6f2ea;
 Sun, 02 Jun 2019 00:41:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1559436062; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=3UgPycFWYDTiQsp47soWBXpYFdIzPbAzmTAfC8mAoEc=;
 b=lc/r4xcyl++VZfR1iXmJhzkHD85o4q2GlOEqmzLF5e4E4mclgT2EZT1u+5Uzd1GQuqwDXfS4
 eq3IjjltGws9GhuzwZxSsPiXKb7LslQbwet7EjzuPdn9SKIhwZ3rMmkuF+7fwMyHO6HKWzKS
 b1QaXG72NGhiLBn70xGs8I4pUzI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mxa.mailgun.org with ESMTP id 5cf31b1d.7f161a0385f0-smtp-out-n03;
 Sun, 02 Jun 2019 00:41:01 -0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id a25so10840453lfg.2
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jun 2019 17:41:00 -0700 (PDT)
X-Gm-Message-State: APjAAAUjGceUeI4sWfdcwGZ+jBicMs0G/UHcgYOW51BhwM9UtpLqD2ba
 z1hZ7i4Zob0JMC4mK9Zu94zgjPYPc0pAno242zk=
X-Google-Smtp-Source: APXvYqz7YZPYNQIK5+71cEFAcW3oF/STDk0DtzR7zQ00Pk7aeKM8heSFHc2bL4VTfB3qA9Jp03NDwxUGjYQ4o7/8Azw=
X-Received: by 2002:a19:9e53:: with SMTP id h80mr9652942lfe.77.1559436058965; 
 Sat, 01 Jun 2019 17:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
In-Reply-To: <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Sat, 1 Jun 2019 18:40:23 -0600
X-Gmail-Original-Message-ID: <CABfawhmsNx6L74jJEuPnfcXPXv3w2_q_nXHrcqVbd6TdDjs6pA@mail.gmail.com>
Message-ID: <CABfawhmsNx6L74jJEuPnfcXPXv3w2_q_nXHrcqVbd6TdDjs6pA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH 2/2] dom_cow is needed for mem-sharing only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMzozNSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gQSBjb3VwbGUgb2YgYWRqdXN0bWVudHMgYXJlIG5lZWRlZCB0byBj
b2RlIGNoZWNraW5nIGZvciBkb21fY293LCBidXQKPiBzaW5jZSB0aGVyZSBhcmUgcHJldHR5IGZl
dyBpdCBpcyBwcm9iYWJseSBiZXR0ZXIgdG8gYWRqdXN0IHRob3NlIHRoYW4KPiB0byBzZXQgdXAg
YW5kIGtlZXAgYXJvdW5kIGEgbmV2ZXIgdXNlZCBkb21haW4uCj4KPiBUYWtlIHRoZSBvcHBvcnR1
bml0eSBhbmQgdGlnaHRlbiBhIEJVR19PTigpIGluIGVtdWwtcHJpdi1vcC5jOnJlYWRfY3IoKS4K
PiAoQXJndWFibHkgdGhpcyBwZXJoYXBzIHNob3VsZG4ndCBiZSBhIEJVR19PTigpIGluIHRoZSBm
aXJzdCBwbGFjZS4pCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gLS0tCj4gV2hpbGUgZm9yIG5vdyB0aGlzIGF2b2lkcyBjcmVhdGluZyB0aGUgZG9t
YWluIG9uIEFybSBvbmx5LCBUYW1hcydlcwo+IHBhdGNoIHN3aXRjaGluZyB0byBDT05GSUdfTUVN
X1NIQVJJTkcgd2lsbCBtYWtlIHg4NiBsZXZlcmFnZSB0aGlzIHRvby4KCkhpIEphbiwKcGVyaGFw
cyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2ZSB0aGlzIHBhdGNoIGJlIGFwcGxpZWQgYWZ0ZXIg
bXkKcGF0Y2g/IFlvdSBhbHJlYWR5IGFja2VkIHRoYXQgb25lIGFuZCBpdCBjb3VsZCBiZSBhcHBs
aWVkIHNlcGFyYXRlbHkKZnJvbSB0aGUgc2VyaWVzIHRoYXQgSSd2ZSBzZW50IGl0IGFzIHBhcnQg
b2YuCgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
