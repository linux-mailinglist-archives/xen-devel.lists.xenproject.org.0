Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6B6140F9B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 18:04:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isV0u-000243-5y; Fri, 17 Jan 2020 17:02:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1eFk=3G=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1isV0s-00023y-IQ
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 17:02:26 +0000
X-Inumbo-ID: 1dbcaf6a-394b-11ea-b833-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1dbcaf6a-394b-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 17:02:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579280538; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=bqnAGnVP/2dIFN1rceF75UfrzqZsD5pOuv06XyoKeLg=;
 b=Ctob9WzbUdg7YRyYjiqEeQd04MhuxqzcIXusrfMttcDwL8BPHLRY8XLCj3X72ObxAc1tZEt4
 DGg5dg/SfbYXQGBz+MNPjn79BhhsTHLRHEAe1apuFYqf/XV4+VfHKBCE6U1MKKqfgWrC6N3p
 woOcZnTkREXBYbBedkySoRdzqHI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mxa.mailgun.org with ESMTP id 5e21e896.7fe33d78c430-smtp-out-n03;
 Fri, 17 Jan 2020 17:02:14 -0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id w5so9897535wmi.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2020 09:02:14 -0800 (PST)
X-Gm-Message-State: APjAAAUwvh072AvWS9np4FMEI283J+FprHwEreoAwwe0LoADqZkBFtT3
 kZK+hEKvHu1riEa6yjrrzCOeAPvSvaiWjO5TP6w=
X-Google-Smtp-Source: APXvYqwl1ddHbGi6LtYbRyNihKKlOFzMkyBXdEXJEAjlCkiQ7pog+a7KKBp4zNO7ggpySj7DIyXoS9TZs/0eNjDgP38=
X-Received: by 2002:a7b:c216:: with SMTP id x22mr5799092wmi.51.1579280532998; 
 Fri, 17 Jan 2020 09:02:12 -0800 (PST)
MIME-Version: 1.0
References: <20200117133059.14602-1-aisaila@bitdefender.com>
 <20200117133059.14602-4-aisaila@bitdefender.com>
In-Reply-To: <20200117133059.14602-4-aisaila@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 17 Jan 2020 10:01:36 -0700
X-Gmail-Original-Message-ID: <CABfawhmGt-=XeWoUk54v2DTRNQu++WSvFii6EkKO79zqxdsJCw@mail.gmail.com>
Message-ID: <CABfawhmGt-=XeWoUk54v2DTRNQu++WSvFii6EkKO79zqxdsJCw@mail.gmail.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH V8 4/4] x86/mm: Make use of the default
 access param from xc_altp2m_create_view
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTcsIDIwMjAgYXQgNjozMSBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQo8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gQXQgdGhpcyBtb21lbnQgdGhlIGRl
ZmF1bHRfYWNjZXNzIHBhcmFtIGZyb20geGNfYWx0cDJtX2NyZWF0ZV92aWV3IGlzCj4gbm90IHVz
ZWQuCj4KPiBUaGlzIHBhdGNoIGFzc2lnbnMgZGVmYXVsdF9hY2Nlc3MgdG8gcDJtLT5kZWZhdWx0
X2FjY2VzcyBhdCB0aGUgdGltZSBvZgo+IGluaXRpYWxpemluZyBhIG5ldyBhbHRwMm0gdmlldy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIu
Y29tPgo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpGb3IgdGhl
IG1lbV9hY2Nlc3MgYml0czoKQWNrZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
