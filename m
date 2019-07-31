Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5D87BE92
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 12:44:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsm0e-0006JG-7z; Wed, 31 Jul 2019 10:39:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/NdB=V4=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hsm0d-0006JB-29
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 10:39:03 +0000
X-Inumbo-ID: 67c80cc8-b37f-11e9-bc7d-7f44245b7b3e
Received: from mail-lf1-f66.google.com (unknown [209.85.167.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67c80cc8-b37f-11e9-bc7d-7f44245b7b3e;
 Wed, 31 Jul 2019 10:39:00 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id h28so47057869lfj.5
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 03:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LBKyHXnwFLnWlM2LBbgcfaAdgUtB43HPSVYi9rmR5CU=;
 b=sfWmtZc2Sm0+q/a9B2lbOlPNNlVxdafyspdVAreO+VtTopVIN5hcFQ+5177t7gNOTN
 7/iT12rOPKq3wQhUQyFID4u9SZU9sYEwHjsOtJkwNSG0b8uBvzI1VmbNW310d785OkfB
 AVyb6mqZtIRmLcUHvffPOUs70Qf/vunfJ0gY6f9hmr8iaUJsqILPRYr2m0edNDjsSDn4
 /piGvi9CKw4WFxSkiznFHEu3+o8raH6kh/WXs5lWMW9sFuprxhPTv9S6PFCl6BbDUxjV
 0Yhkj/UjnqPRfMsXcH7nupe/MCYTXD4pA3H/mhSuLvalSgCMycGu5Xj3V1ajq4R+x9Oe
 cgzA==
X-Gm-Message-State: APjAAAVcgU4Y964APxdioQZsBPJtxQECmg74iykJWLqFirqNKaZiOImE
 ITGj9LMzweYcOQ95S4fZXBFvUrLrqxM=
X-Google-Smtp-Source: APXvYqz1lxy2U4VAyMkGwSeNgWyETJ5QpizurvqrDF+HtTfaM6hRxuCF+1ptdZRYmz6ydT4vwmtU9Q==
X-Received: by 2002:ac2:4d1c:: with SMTP id r28mr55716040lfi.159.1564569538916; 
 Wed, 31 Jul 2019 03:38:58 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id v7sm14092908ljj.3.2019.07.31.03.38.58
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 03:38:58 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id z28so10855157ljn.4
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 03:38:58 -0700 (PDT)
X-Received: by 2002:a2e:86c1:: with SMTP id n1mr299547ljj.162.1564569538280;
 Wed, 31 Jul 2019 03:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190730170754.31389-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190730170754.31389-1-andrew.cooper3@citrix.com>
From: Wei Liu <wl@xen.org>
Date: Wed, 31 Jul 2019 11:38:43 +0100
X-Gmail-Original-Message-ID: <CAK9nU=rhKXaQo8BDHZb2JU3p_WcmU-_fWo=5iW3PB0ze649o0A@mail.gmail.com>
Message-ID: <CAK9nU=rhKXaQo8BDHZb2JU3p_WcmU-_fWo=5iW3PB0ze649o0A@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/boot: Fix build dependenices for reloc.c
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAzMCBKdWwgMjAxOSBhdCAxODowOCwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBjL3MgMjAxZjg1MmVhZiBhZGRlZCBzdGFydF9pbmZv
LmggYW5kIGtjb25maWcuaCB0byByZWxvYy5jLCBidXQgb25seSB1cGRhdGVkCj4gc3RhcnRfaW5m
by5oIGluIFJFTE9DX0RFUFMuCj4KPiBUaGlzIGNhdXNlcyByZWxvYy5jIHRvIG5vdCBiZSByZWdl
bmVyYXRlZCB3aGVuIEtjb25maWcgY2hhbmdlcy4gIEl0IGlzIG1vc3QKPiBub3RpY2VhYmxlIHdo
ZW4gZW5hYmxpbmcgQ09ORklHX1BWSCBhbmQgZmluZGluZyB0aGUgcmVzdWx0aW5nIGJpbmFyeSBj
cmFzaAo+IGVhcmx5IHdpdGg6Cj4KPiAgIChkOSkgKFhFTikKPiAgIChkOSkgKFhFTikgKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ICAgKGQ5KSAoWEVOKSBQYW5pYyBv
biBDUFUgMDoKPiAgIChkOSkgKFhFTikgTWFnaWMgdmFsdWUgaXMgd3Jvbmc6IGMyYzJjMmMyCj4g
ICAoZDkpIChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiAg
IChkOSkgKFhFTikKPiAgIChkOSkgKFhFTikgUmVib290IGluIGZpdmUgc2Vjb25kcy4uLgo+ICAg
KFhFTikgZDl2MCBUcmlwbGUgZmF1bHQgLSBpbnZva2luZyBIVk0gc2h1dGRvd24gYWN0aW9uIDEK
PgoKTmljZS4gSSBzYXcgdGhpcyBiZWZvcmUgYnV0IG5ldmVyIGdvdCBhcm91bmQgZml4aW5nIGl0
LiBUaGFua3MgZm9yCnRyYWNraW5nIGl0IGRvd24uIDotKQoKV2VpLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
