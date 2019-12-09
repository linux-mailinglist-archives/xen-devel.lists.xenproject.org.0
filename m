Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 562D3116C11
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 12:14:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieGxl-0005hK-WB; Mon, 09 Dec 2019 11:12:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iyN9=Z7=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1ieGxk-0005hB-H2
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 11:12:24 +0000
X-Inumbo-ID: c4b24911-1a74-11ea-87be-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c4b24911-1a74-11ea-87be-12813bfff9fa;
 Mon, 09 Dec 2019 11:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575889940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9pQqMcPghEuLFfV5NKXopVjLWDB5vqNv90PorO/Wpg4=;
 b=T0CGXUH8XLNByciSWmWWQEPzYvapBYQFylLGuU9Di0R5OrBJdfgx9el+dYCgBOYG17cje2
 txNxOI6wV8mIW/6JKEmuiq+34R1s9W0sbK5m3AfZhNfQ4sT2kzF8nQELzog5FJnQ40ygKa
 aSFQIhqYXvgQEPa4f10JqucwoIzg+S0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-Q-de9aZ7MHCq85i4N4sEjQ-1; Mon, 09 Dec 2019 06:12:19 -0500
Received: by mail-wr1-f70.google.com with SMTP id z15so7410496wrw.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2019 03:12:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q2AkEEairzhIRLX8Oc4uPMdpQ5LKLsnerB8OJhz403k=;
 b=HdsoVu1JU3t4mmpdJs1RBFW2ObbIrdLEnIPSZSRfTILqoiw9GEl6aaXMTfZ5o6VAkE
 Ul6ZkUtU4VVHxCD1GxQj88Vdd9ui+ynUFmYYby81EpkfLOiOgyNGYAoD70VriiiR9Wy3
 xWdNe/gOnfaTKkhi2Ab/3SG20B5yB32gyYILbAANn8a1YzghEI/g5KUexg0UsRyTXC0L
 qTcHuzFX6MxQLB9rvkAB+8J0tFD2I677qEvKnqM7fNWzGL3ElQWPj7ZoOuBQ/ot3Se9z
 ZN8YMX0G8SsFJKB4DoWZnZ9gwmha/xUg7E+ioxqTMy/Y/kmH06ZUPQzpe3kMb/b3tP18
 TMHA==
X-Gm-Message-State: APjAAAVNbhZgcsjk8/lYBOgTbuGCc0MomewFrPCXEEGk+QaJ3sjfsTyS
 xxY/YuicXLN7bSaxb+0cJ6YL4fcfI7PBQDGAMkgc6++fDYgpcX9tJadXy1dru6I9Xq05cHp86UC
 oFHvsBZSWQPh2wj/ZLD/8IKB1GtU=
X-Received: by 2002:a7b:cf2d:: with SMTP id m13mr24277630wmg.163.1575889937863; 
 Mon, 09 Dec 2019 03:12:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqx38FtLGCz+MeszshBT05od+gqa5subISC/n3ShalHtJG341TPVUT92Qf1WZH4KDdzW1DEvxg==
X-Received: by 2002:a7b:cf2d:: with SMTP id m13mr24277605wmg.163.1575889937628; 
 Mon, 09 Dec 2019 03:12:17 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id f9sm4530796wmb.4.2019.12.09.03.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 03:12:16 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Durrant, Paul" <pdurrant@amazon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20191209095002.32194-1-philmd@redhat.com>
 <20191209095002.32194-7-philmd@redhat.com>
 <3f1702b0765841b19328366af11fd3ed@EX13D32EUC003.ant.amazon.com>
 <083d0d7f-766d-9e72-5395-b4e82858ef4d@redhat.com>
 <4e9dee3e-05b5-640d-33df-4341c2e01b8b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9dea9aca-5445-9c53-e1c4-c5f73c2af243@redhat.com>
Date: Mon, 9 Dec 2019 12:12:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <4e9dee3e-05b5-640d-33df-4341c2e01b8b@redhat.com>
Content-Language: en-US
X-MC-Unique: Q-de9aZ7MHCq85i4N4sEjQ-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH-for-5.0 v3 6/6] hw/pci-host: Add Kconfig
 entry to select the IGD Passthrough Host Bridge
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMTIvMTkgMTE6NTYsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IAo+IEkg
dGhpbmsgc28sIGJ1dCB3aXRoIFBDX0k0NDBGWCAtPiBQQ0lfSTQ0MEZYIDspCj4gCj4gSXQgd291
bGQgYmUgY2xlYW5lciB0byBwYXNzIHRoZSBDT05GSUdfWEVOX1BDSV9QQVNTVEhST1VHSCB2YXJp
YWJsZSB0bwo+IEtjb25maWcgYW5kIHVzZSBpdCAodXNlICdkZXBlbmRzIG9uIFhFTl9QQ0lfUEFT
U1RIUk9VR0gnKS4KPiAKPiBUaGlzIGNhbiBiZSBhbm90aGVyIHN0ZXAsIHNvIGlmIHRoaXMgc2Vy
aWVzIGxvb2tzIE9LIHRvIHlvdSBzbyBmYXIsIGRvCj4geW91IG1pbmQgZml4aW5nIHRoaXMgYW5k
IHRoZSBjb21tZW50IGluIHRoZSBwcmV2aW91cyBwYXRjaCBub3RpY2VkIGJ5Cj4gVGhvbWFzOgo+
IAo+IC0gRXh0cmFjdCBpdCBpbnRvIGEgbmV3IGZpbGUsICdody9wY2ktaG9zdC9pZ2RfcHQuYycu
Cj4gKyBFeHRyYWN0IGl0IGludG8gYSBuZXcgZmlsZSwgJ2h3L3BjaS1ob3N0L3hlbl9pZ2RfcHQu
YycuCgpTdXJlLgoKUGFvbG8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
