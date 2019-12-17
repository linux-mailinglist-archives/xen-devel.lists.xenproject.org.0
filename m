Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBB4123034
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 16:25:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihEfY-0001Eq-5C; Tue, 17 Dec 2019 15:21:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TTnd=2H=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ihEfW-0001Ef-Mo
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 15:21:50 +0000
X-Inumbo-ID: ec6d0e28-20e0-11ea-a1e1-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec6d0e28-20e0-11ea-a1e1-bc764e2007e4;
 Tue, 17 Dec 2019 15:21:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576596102; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=bC7yKgVCuczBgfvEjLfnlWucZ3TGxdoyu8WrFWs6rRY=;
 b=s++ym0NtCQMBfndceqg6XhhX7bSPN8EJvLYb71GskVs+jqpdjhkBneS6UB0u4TJYOwsO/xyt
 g8qDvTWfd5EienaU+JsFBjr0oo3hYz/ZJOzXV3UjqYCPXHvVRArWfNuLKZ3usgifRYocdW0g
 eCECtNcPJa9QEWLYDbW/YIsEjJk=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mxa.mailgun.org with ESMTP id 5df8f281.7f0f66a53070-smtp-out-n01;
 Tue, 17 Dec 2019 15:21:37 -0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id z7so11692981wrl.13
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 07:21:37 -0800 (PST)
X-Gm-Message-State: APjAAAU4vwWzA6mhnz2TPcRIRhKo52XxdnwZSpPDOWS5LgObCJeVW6Sj
 S7ZlJwzjP6RJiMLmwWv1LdWs1GEYCDctkmU4waE=
X-Google-Smtp-Source: APXvYqxaiuTPzs8w7gV4ZK4QY3T9AdYKtRND9KYoW0V4UcnJkMeWW3Ca5jqrHW2MSrHFjl8tKDOQIJyKmyvhZL2iIgE=
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr36970438wrn.140.1576596095923; 
 Tue, 17 Dec 2019 07:21:35 -0800 (PST)
MIME-Version: 1.0
References: <20191217151144.9781-1-aisaila@bitdefender.com>
In-Reply-To: <20191217151144.9781-1-aisaila@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 17 Dec 2019 08:21:00 -0700
X-Gmail-Original-Message-ID: <CABfawhkJzAMr5KpYVyt7SRp8sfZy35_EcSFsvJhev9Py5aSrqA@mail.gmail.com>
Message-ID: <CABfawhkJzAMr5KpYVyt7SRp8sfZy35_EcSFsvJhev9Py5aSrqA@mail.gmail.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH V4 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgODoxMiBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQo8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBhaW1zIHRvIHNh
bml0aXplIGluZGV4ZXMsIHBvdGVudGlhbGx5IGd1ZXN0IHByb3ZpZGVkCj4gdmFsdWVzLCBmb3Ig
YWx0cDJtX2VwdHBbXSBhbmQgYWx0cDJtX3AybVtdIGFycmF5cy4KPgo+IFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgoKTEdUTSwgdGhhbmtz
IQoKQWNrZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
