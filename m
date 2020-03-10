Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78CC1801E5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 16:33:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBgqC-0000c7-2u; Tue, 10 Mar 2020 15:30:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sS+4=43=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jBgqA-0000bx-IK
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:30:42 +0000
X-Inumbo-ID: 19f9b31a-62e4-11ea-b34e-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19f9b31a-62e4-11ea-b34e-bc764e2007e4;
 Tue, 10 Mar 2020 15:30:42 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id z65so10907392ede.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UkFF93vi6fOPy28Q+Vl84pi5VHUCmr1K/qXi7c3h0L4=;
 b=wDTwi97seqGmJS96FQslhQsaknrGXehCYQR87Fb6yenExtXcPp9JIkIMGnhklFsKZG
 AEpNsZiGKS4NJEXiXGiu9pEKkEJkAWbb4mUwWMPVXiZfhndBAIMuxN6o4e82g8q9R1qz
 6qdvJw4YUBpnHr0iYqP9o4T8vvigD9NKJx+FjpCZblt7cZyph6TSL4H8OW5mIGW29B1j
 +88av4cihFtjX3ckiKIwC79yvDlFxLohh8gG8OQXOigbMeLd8Ubn5Yo3U/PyTe2OlvI3
 ChmXsJCNh/iZAY92tbDU1CLQQDgQhKrWPhn24ZdfS52Wc/rAU1eIgBOn7d+XRHDc4eiS
 8VMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UkFF93vi6fOPy28Q+Vl84pi5VHUCmr1K/qXi7c3h0L4=;
 b=WLegtINyU2inr9edutGKv5/NKmqoIMngdYR6YaWwtEA0Wi/oPk21NSYnZu83ZOMsfw
 Zw6G8uMcwpICsfaHrgLAjM0t5KCtBLMFbiioG6QfQ5jExxm38Ab/QrBUPvouwRj9cKeT
 s2F8fhixv5LUIJfLu6U0Lt6UJNi4tQW0gZlA0aG8GGvjO4GnezUAvKIW4G601MsWdNSt
 GIL3m5qYFTa7uZD9tXXVJSSUnF0GcP6X7wSNUFboCMUbUuCXUEHrinqXT6SSUQU/9rKV
 qECQehEIeKuInb/GBV7OyGysueeFRAzwxFDgBh3sv+WS5FmL10AFsQRR2m1da1nAKDbn
 cPOQ==
X-Gm-Message-State: ANhLgQ3rbHVkDVwjBt1CNOW5nur5P79DHN2/HnO3HIRdNDv5cX+MeicL
 9nSlJgo6DReUbh/ZNiO5xGTLXLGS4oE=
X-Google-Smtp-Source: ADFU+vvcgZsH/1AhDf/MW866BOsp1j/uM2tBpEk3bKhIhGaIKlKQZDNtUPAVo4iQVa8Chouk1yxvEg==
X-Received: by 2002:a17:906:7e4c:: with SMTP id
 z12mr19704107ejr.196.1583854240862; 
 Tue, 10 Mar 2020 08:30:40 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id lc15sm1835428ejb.58.2020.03.10.08.30.39
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 08:30:40 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id l18so6358257wru.11
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 08:30:39 -0700 (PDT)
X-Received: by 2002:a5d:4206:: with SMTP id n6mr723892wrq.390.1583854238856;
 Tue, 10 Mar 2020 08:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <f41f32ae-597e-cb1f-8acc-685cee4263ac@suse.com>
In-Reply-To: <f41f32ae-597e-cb1f-8acc-685cee4263ac@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 10 Mar 2020 09:30:02 -0600
X-Gmail-Original-Message-ID: <CABfawhkAGjUCXaYpNEDSVTj0KRsMC+b=1riZe7j2OBtRznwhKg@mail.gmail.com>
Message-ID: <CABfawhkAGjUCXaYpNEDSVTj0KRsMC+b=1riZe7j2OBtRznwhKg@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v2] memaccess: reduce include dependencies
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
Cc: Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgODo0MiBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gVGhlIGNvbW1vbiBoZWFkZXIgZG9lc24ndCBpdHNlbGYgbmVlZCB0
byBpbmNsdWRlIHB1YmxpYy92bV9ldmVudC5oIG5vcgo+IHB1YmxpYy9tZW1vcnkuaC4gRHJvcCB0
aGVpciBpbmNsdXNpb24uIFRoaXMgcmVxdWlyZXMgdXNpbmcgdGhlIG5vbi0KPiB0eXBlZGVmIG5h
bWVzIGluIHR3byBwcm90b3R5cGVzIGFuZCBhbiBpbmxpbmUgZnVuY3Rpb247IGJ5IG5vdCBjaGFu
Z2luZwo+IHRoZSBjYWxsZXJzIGFuZCBmdW5jdGlvbiBkZWZpbml0aW9ucyBhdCB0aGUgc2FtZSB0
aW1lIGl0J2xsIHJlbWFpbgo+IGNlcnRhaW4gdGhhdCB0aGUgYnVpbGQgd291bGQgZmFpbCBpZiB0
aGUgdHlwZWRlZiBpdHNlbGYgd2FzIGNoYW5nZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpUaGFua3MhCkFja2VkLWJ5OiBUYW1hcyBLIExlbmd5
ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
