Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412746B0A0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 22:49:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnULK-0004oo-Cx; Tue, 16 Jul 2019 20:46:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0oM/=VN=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hnULJ-0004oj-Bf
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 20:46:33 +0000
X-Inumbo-ID: ca4962c8-a80a-11e9-8399-03457945607c
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca4962c8-a80a-11e9-8399-03457945607c;
 Tue, 16 Jul 2019 20:46:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563309991; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=malM9japLnyH/68JRH3cuTlQB9Qwk0bJLoVgVuuLRJA=;
 b=oSX3NAFf8jKm7H4KSBnEueGbg5mE5x4atZALq7Dx7b5DScokaLsVG1tYV95BvSlD9Sntq9ao
 gm/A89c29+ICcmfh7cdhT6tOLcT6AaGluDVQK8QdNCFD9ivKweqJE6C7CfOC1wJXummXJdB3
 Xc22PcC05/rxaA7pzN52dAWxpeM=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mxa.mailgun.org with ESMTP id 5d2e37a5.7f04d249c230-smtp-out-n03;
 Tue, 16 Jul 2019 20:46:29 -0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id n9so22385977wrr.4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2019 13:46:29 -0700 (PDT)
X-Gm-Message-State: APjAAAWqZnfqOaK+fu/dnpsqU23MmMDOiOvQdzNr9IhEjrBlM3NZKFJW
 Iq4Wj1W3e+cClO8/kDFc/IKtFs7FUyfqmZtot4g=
X-Google-Smtp-Source: APXvYqwB4MLuzTYxLlXwtAlIeQ7hBtxYNRXOtrtO6CmwsukhrfyLtB4XbtH6AEEacgg5SPGkwtUa/stZAmV7ZIj+UCQ=
X-Received: by 2002:a5d:5012:: with SMTP id e18mr9206454wrt.166.1563309988310; 
 Tue, 16 Jul 2019 13:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <cover.1563293545.git.ppircalabu@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 16 Jul 2019 14:45:51 -0600
X-Gmail-Original-Message-ID: <CABfawhmXfCRfM_YpDVRJLVpNDKLct+NJvraeHS2V_298SqSusw@mail.gmail.com>
Message-ID: <CABfawhmXfCRfM_YpDVRJLVpNDKLct+NJvraeHS2V_298SqSusw@mail.gmail.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH v2 00/10] Per vcpu vm_event channels
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTE6MDYgQU0gUGV0cmUgUGlyY2FsYWJ1CjxwcGlyY2Fs
YWJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoc2V0IGFkZHMgYSBuZXcg
bWVjaGFuaXNtIG9mIHNlbmRpbmcgc3luY2hyb25vdXMgdm1fZXZlbnQKPiByZXF1ZXN0cyBhbmQg
aGFuZGxpbmcgdm1fZXZlbnQgcmVzcG9uc2VzIHdpdGhvdXQgdXNpbmcgYSByaW5nLgo+IEFzIGVh
Y2ggc3luY2hyb25vdXMgcmVxdWVzdCBwYXVzZXMgdGhlIHZjcHUgdW50aWwgdGhlIGNvcnJlc3Bv
bmRpbmcKPiByZXNwb25zZSBpcyBoYW5kbGVkLCBpdCBjYW4gYmUgc3RvcmVkIGluIGEgc2xvdHRl
ZCBtZW1vcnkgYnVmZmVyCj4gKG9uZSBwZXIgdmNwdSkgc2hhcmVkIGJldHdlZW4gdGhlIGh5cGVy
dmlzb3IgYW5kIHRoZSBjb250cm9sbGluZyBkb21haW4uCj4KPiBUaGUgbWFpbiBhZHZhbnRhZ2Vz
IG9mIHRoaXMgYXBwcm9hY2ggYXJlOgo+ICogdGhlIGFiaWxpdHkgdG8gZHluYW1pY2FseSBhbGxv
Y2F0ZSB0aGUgbmVjZXNzYXJ5IG1lbW9yeSB1c2VkIHRvIGhvbGQKPiB0aGUgcmVxdWVzdHMvcmVz
cG9uc2VzICh0aGUgc2l6ZSBvZiB2bV9ldmVudF9yZXF1ZXN0X3Qvdm1fZXZlbnRfcmVzcG9uc2Vf
dAo+IGNhbiBncm93IHVucmVzdHJpY3RlZCBieSB0aGUgcmluZydzIG9uZSBwYWdlIGxpbWl0YXRp
b24pCj4gKiB0aGUgcmluZydzIHdhaXRxdWV1ZSBsb2dpYyBpcyB1bm5lY2Vzc2FyeSBpbiB0aGlz
IGNhc2UgYmVjYXVzZSB0aGUKPiB2Y3B1IHNlbmRpbmcgdGhlIHJlcXVlc3QgaXMgYmxvY2tlZCB1
bnRpbCBhIHJlc3BvbnNlIGlzIHJlY2VpdmVkLgoKQ291bGQgeW91IHBsZWFzZSBwdXNoIGEgZ2l0
IGJyYW5jaCBmb3IgdGhpcyBzb21ld2hlcmU/CgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
