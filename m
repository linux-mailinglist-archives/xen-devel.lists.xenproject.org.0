Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69735124947
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 15:17:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iha5w-0001KX-0M; Wed, 18 Dec 2019 14:14:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5UKC=2I=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iha5v-0001KS-BA
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 14:14:31 +0000
X-Inumbo-ID: afca89bc-21a0-11ea-88e7-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id afca89bc-21a0-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 14:14:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576678463; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=xH5zgfvx4S1ugPmGm/SgceC3mkoCqxltQ/R+Doqyrms=;
 b=IlHJGRuJFYbAALFOummsmy28uIQmRjmMlGXzKMc2vLBZNltmwP4RdbCXsCUY0hb5QAgiEnIB
 CQmVeXBomB7+0FvCWtMlzJJjf6YnlVJ7yALS3Dmlmiwh8OldPsNqjAzeLXQSMjdKvC8RgiG/
 4LK4rimx7n/v8RCUVY4mupnv8W8=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mxa.mailgun.org with ESMTP id 5dfa343a.7fd7e5cbedf0-smtp-out-n02;
 Wed, 18 Dec 2019 14:14:18 -0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id a5so2005539wmb.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 06:14:18 -0800 (PST)
X-Gm-Message-State: APjAAAVh8gqN3DNhfhKUZZXbC1tqP6qfK+KJUTJw9r5FgZ4IvRA33EJJ
 OoPCloNYbNjvwu/Qm6NutTMyj4XCI+rkPMjku0Y=
X-Google-Smtp-Source: APXvYqxxQBqX5xGN7CIMcVqOCZonpV2Wu5Ev5icTxi1Gnf3aGEcgxWFiJSuRjXU7Z2SEHkuXBkOkmol8e/yPS2Py1Mg=
X-Received: by 2002:a1c:7918:: with SMTP id l24mr3734018wme.125.1576678457348; 
 Wed, 18 Dec 2019 06:14:17 -0800 (PST)
MIME-Version: 1.0
References: <e6853b44-681a-7423-ede0-43b551b554af@list.ru>
In-Reply-To: <e6853b44-681a-7423-ede0-43b551b554af@list.ru>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 18 Dec 2019 07:13:41 -0700
X-Gmail-Original-Message-ID: <CABfawhn8LB8kOaxys5aqC1iOBeKQdtw3+0Q0ES_5EVs_mMpMVA@mail.gmail.com>
Message-ID: <CABfawhn8LB8kOaxys5aqC1iOBeKQdtw3+0Q0ES_5EVs_mMpMVA@mail.gmail.com>
To: Sergey Kovalev <valor@list.ru>
Subject: Re: [Xen-devel] [XEN PATCH v3] x86/vm_event: add short-circuit for
 breakpoints (aka, , "fast single step")
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmggYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvdm1fZXZlbnQuaAo+IGluZGV4IGFhNTRjODYzMjUuLmNiNTc3YTdiYTkgMTAwNjQ0
Cj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKPiArKysgYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvdm1fZXZlbnQuaAo+IEBAIC0xMTAsNiArMTEwLDExIEBACj4gICAqIGludGVycnVw
dCBwZW5kaW5nIGFmdGVyIHJlc3VtaW5nIHRoZSBWQ1BVLgo+ICAgKi8KPiAgI2RlZmluZSBWTV9F
VkVOVF9GTEFHX0dFVF9ORVhUX0lOVEVSUlVQVCAoMSA8PCAxMCkKPiArLyoKPiArICogRXhlY3V0
ZSBmYXN0IHNpbmdsZXN0ZXBwaW5nIG9uIHZtX2V2ZW50IHJlc3BvbnNlLgo+ICsgKiBSZXF1aXJl
cyB0aGUgdkNQVSB0byBiZSBwYXVzZWQgYWxyZWFkeSAoc3luY2hyb25vdXMgZXZlbnRzIG9ubHkp
Lgo+ICsgKi8KPiArI2RlZmluZSBWTV9FVkVOVF9GTEFHX0ZBU1RfU0lOR0xFU1RFUCAgKDEgPDwg
MTEpCgpKdXN0IGFub3RoZXIgbWlub3Igc3R5bGUgbml0cGljazogYWxpZ25tZW50IG9mICgxIDw8
IDExKSBpcyBvZmYKY29tcGFyZWQgdG8gYWxsIG9mIHRoZSBwcmV2aW91cyBkZWNsYXJhdGlvbiBh
Ym92ZS4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
