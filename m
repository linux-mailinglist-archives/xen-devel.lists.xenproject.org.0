Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1637817E41E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 16:57:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBKhm-00084s-Dm; Mon, 09 Mar 2020 15:52:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1ca=42=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jBKhl-00084n-N3
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 15:52:33 +0000
X-Inumbo-ID: fd001d56-621d-11ea-b383-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd001d56-621d-11ea-b383-bc764e2007e4;
 Mon, 09 Mar 2020 15:52:33 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id m13so12583108edb.6
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2020 08:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IuNVLXJHUZZPJw0eRYwDxNmWUahKICZjam4wyVJvpAQ=;
 b=jkbPDLHaKbKxeETQkbWC0ybqa08bV3bG3EYd/EI/kqS3j850GSVIV5Xi149jtZ/ufd
 pvCxCskvuip56bqLar2YYgEmAt6yxsJCGHIwmBFiKbDZfUiacscFWBK55Gl7/hY7s7u9
 UWi0/aWkGWKsVYLu3oJh3DBQ2NI0qjdjImIw6S1djHqEUqkkqz31Zb+Lu+w2f1ehUOrm
 /cP/RFjl7sv8dmDySoAwRkcrKwS2KrkoV2d6wBdPWL7i31lR+6yRXyFAV5M6UIwSq57b
 HPSzxXmtjcTH9fWFSMN6rN2CmFRl3xJDXTdxtcRsGH30hXUd7RyA77TR81TbTZMIZu94
 f4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IuNVLXJHUZZPJw0eRYwDxNmWUahKICZjam4wyVJvpAQ=;
 b=KqXpgrAsGjcs3DbjGOTTD1YXPIuYDeJq/gfC6XdEhwJnwLdyrN9szv0DWnpfr6LAOt
 u+GxDluRlYqutU307jagYD6wR8HBVZ0xLBvNHiisuJUdq0QdjovdpzzY8yS33k0ldDrf
 FgnwaxnUXPTYZmp3Iwr9mlw9fcNexnO0DtyIQF796nhezbpF+/oUBDQgBH1WcFadxh8J
 bewKnjjaSXZv7FtG9P452TAFrk38mTkjjWJXr5ikR2f02gWp00Ap88jcbKc3D0VTCJon
 F3opYS3PotKcQ0KDn6dZUWySIYnyUzSjspBKWsXrZaJ/gYUCJGWN/wy14pupeAJztxCY
 IFZQ==
X-Gm-Message-State: ANhLgQ0XvSryQZd2SavAo7asRnQrp/b3JJJxatcWjNAtNOHZikG2bejj
 5JtgyQZAHEuF+OHh65XtI0kZdj/rJyE=
X-Google-Smtp-Source: ADFU+vtcv1JACMTFuKaIA42p/zIk+B/+ONgfsSn/6aMRf/Ut8wNQpKQnDAqoTQjSQav5kMPQ23G/rQ==
X-Received: by 2002:a17:906:ecee:: with SMTP id
 qt14mr2923869ejb.297.1583769151886; 
 Mon, 09 Mar 2020 08:52:31 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48])
 by smtp.gmail.com with ESMTPSA id 91sm1548140edq.78.2020.03.09.08.52.30
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2020 08:52:31 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id v4so11864652wrs.8
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2020 08:52:30 -0700 (PDT)
X-Received: by 2002:a05:6000:120e:: with SMTP id
 e14mr888964wrx.182.1583769150389; 
 Mon, 09 Mar 2020 08:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <a404fafe-0057-0ea7-93c3-754f96da8743@suse.com>
In-Reply-To: <a404fafe-0057-0ea7-93c3-754f96da8743@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 9 Mar 2020 09:51:54 -0600
X-Gmail-Original-Message-ID: <CABfawhnqPqa7BjnNTqv+x7CJrpN9VSrQMycfkPQYgHVLy9u-gA@mail.gmail.com>
Message-ID: <CABfawhnqPqa7BjnNTqv+x7CJrpN9VSrQMycfkPQYgHVLy9u-gA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] memaccess: reduce include dependencies
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

T24gTW9uLCBNYXIgOSwgMjAyMCBhdCA1OjQ5IEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBUaGUgY29tbW9uIGhlYWRlciBkb2Vzbid0IGl0c2VsZiBuZWVkIHRv
IGluY2x1ZGUgcHVibGljL3ZtX2V2ZW50Lmggbm9yCj4gcHVibGljL21lbW9yeS5oLiBEcm9wIHRo
ZWlyIGluY2x1c2lvbi4gVGhpcyByZXF1aXJlcyB1c2luZyB0aGUgbm9uLQo+IHR5cGVkZWYgbmFt
ZXMgaW4gdHdvIHByb3RvdHlwZXMgYW5kIGFuIGlubGluZSBmdW5jdGlvbjsgYnkgbm90IGNoYW5n
aW5nCj4gdGhlIGNhbGxlcnMgYW5kIGZ1bmN0aW9uIGRlZmluaXRpb25zIGF0IHRoZSBzYW1lIHRp
bWUgaXQnbGwgcmVtYWluCj4gY2VydGFpbiB0aGF0IHRoZSBidWlsZCB3b3VsZCBmYWlsIGlmIHRo
ZSB0eXBlZGVmIGl0c2VsZiB3YXMgY2hhbmdlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbWVt
X2FjY2Vzcy5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tZW1fYWNjZXNzLmgKPiBAQCAt
MTcsOSArMTcsMTEgQEAKPiAgI2lmbmRlZiBfQVNNX0FSTV9NRU1fQUNDRVNTX0gKPiAgI2RlZmlu
ZSBfQVNNX0FSTV9NRU1fQUNDRVNTX0gKPgo+ICtzdHJ1Y3Qgdm1fZXZlbnRfc3Q7Cj4gKwo+ICBz
dGF0aWMgaW5saW5lCj4gIGJvb2wgcDJtX21lbV9hY2Nlc3NfZW11bGF0ZV9jaGVjayhzdHJ1Y3Qg
dmNwdSAqdiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHZtX2V2
ZW50X3Jlc3BvbnNlX3QgKnJzcCkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IHN0cnVjdCB2bV9ldmVudF9zdCAqcnNwKQo+ICB7Cj4gICAgICAvKiBOb3Qgc3VwcG9y
dGVkIG9uIEFSTS4gKi8KPiAgICAgIHJldHVybiBmYWxzZTsKPiAtLS0gYS94ZW4vaW5jbHVkZS9h
c20teDg2L21lbV9hY2Nlc3MuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX2FjY2Vz
cy5oCj4gQEAgLTI2LDYgKzI2LDggQEAKPiAgI2lmbmRlZiBfX0FTTV9YODZfTUVNX0FDQ0VTU19I
X18KPiAgI2RlZmluZSBfX0FTTV9YODZfTUVNX0FDQ0VTU19IX18KPgo+ICtzdHJ1Y3Qgdm1fZXZl
bnRfc3Q7CgpXb3VsZG4ndCBpdCBtYWtlIG1vcmUgc2Vuc2UgdG8gZGVmaW5lIHRoaXMgaW4geGVu
L21lbV9hY2Nlc3MuaCBpbnN0ZWFkCm9mIGhhdmluZyB0byBkbyBpdCBpbiBib3RoIGFzbSB2ZXJz
aW9ucz8gTm90aGluZyBkaXJlY3RseSBpbmNsdWRlcwphc20vbWVtX2FjY2Vzcy5oLCBhbGwgdXNl
cnMgaW5jbHVkZSB4ZW4vbWVtX2FjY2Vzcy5oCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
