Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F36B0D17FF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 21:09:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIHHN-00006F-Ii; Wed, 09 Oct 2019 19:05:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cyQj=YC=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iIHHM-000068-QB
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 19:05:44 +0000
X-Inumbo-ID: cad993de-eac7-11e9-96dc-bc764e2007e4
Received: from mail-lj1-f196.google.com (unknown [209.85.208.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cad993de-eac7-11e9-96dc-bc764e2007e4;
 Wed, 09 Oct 2019 19:05:44 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 7so3609163ljw.7
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2019 12:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CAjbvaXbqXaYbbU3ArD6ZiyqSCQ2ud+kZzuQUjo2LVw=;
 b=bwqb4Y6R9dI/TRwP4puSYTJH8DVqtdqs50igNJ+cs4Ce8Sh/xXWMoWj887tBzML+Ul
 x/GxAFAxBA+KFXqzmbNZBmEoGy2bT7W5ulc7WA6+nuwGY7U6sIyJriDJv5xT7Rgg6ApE
 wJdpasqZAyy1X5ovm5K93QIW6UEDycNe3CTjS+fBXOfIgLUKJC1QA7ZOAL22aGSi1M5f
 vZRrXENXCLdqfU2fhucxO5hczozTOehPoUOZJ1BNxjuX4/r4NjqmXf0KWWW1w5FgOrlG
 n4CIXuWzI4bG8LAcxIpJAESyuA+G7PQciAGOQnaBBeLDESXfDKjgBf+5wTjIMqEMMw5z
 cPqQ==
X-Gm-Message-State: APjAAAVWeifejjc2DsWgOsZoiVFBJU7gYY4DTjLCh8oZ2m36EtpQxKca
 V5wmo0cCe4wFSJOxNRtYvoo20ko2Ums=
X-Google-Smtp-Source: APXvYqzlEDZ4ltYbTtNuoQCmOwKsHEUs0Th4VNevMkB5rKbdoOkacsHXsJLgmmoi7GENWvTcHDh1dw==
X-Received: by 2002:a2e:8684:: with SMTP id l4mr3516569lji.87.1570647942849;
 Wed, 09 Oct 2019 12:05:42 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id j127sm832549lfd.63.2019.10.09.12.05.42
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2019 12:05:42 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id q64so3587241ljb.12
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2019 12:05:42 -0700 (PDT)
X-Received: by 2002:a2e:9890:: with SMTP id b16mr3351010ljj.181.1570647942140; 
 Wed, 09 Oct 2019 12:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191009182114.9376-1-andrew.cooper3@citrix.com>
In-Reply-To: <20191009182114.9376-1-andrew.cooper3@citrix.com>
From: Wei Liu <wl@xen.org>
Date: Wed, 9 Oct 2019 20:05:25 +0100
X-Gmail-Original-Message-ID: <CAK9nU=qhfcup=dTcjCvi4nuxZG205J5o0yckJRLzucsLwwvBdQ@mail.gmail.com>
Message-ID: <CAK9nU=qhfcup=dTcjCvi4nuxZG205J5o0yckJRLzucsLwwvBdQ@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/hvm: Fix the use of "hap=0" following
 c/s c0902a9a143a
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA5IE9jdCAyMDE5IGF0IDE5OjIxLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPiB3cm90ZToKPgo+IGMvcyBjMDkwMmE5YTE0M2EgcmVmYWN0b3JlZCBodm1f
ZW5hYmxlKCkgYSBsaXR0bGUsIGJ1dCBkcm9wcGVkIHRoZSBsb2dpYyB3aGljaAo+IGNsZWFyZWQg
aGFwX3N1cHBvcnRlZCBpbiB0aGUgY2FzZSB0aGF0IHRoZSB1c2VyIGhhZCBhc2tlZCBmb3IgaXQg
b2ZmLgo+Cj4gVGhpcyByZXN1bHRzIGluIFhlbiBib290aW5nIHVwLCBjbGFpbWluZzoKPgo+ICAg
KFhFTikgSFZNOiBIYXJkd2FyZSBBc3Npc3RlZCBQYWdpbmcgKEhBUCkgZGV0ZWN0ZWQgYnV0IGRp
c2FibGVkCj4KPiBidXQgd2l0aCBIQVAgYWR2ZXJ0aXNlZCB2aWEgc3lzY3RsLCBhbmQgWEVOX0RP
TUNUTF9DREZfaGFwIGJlaW5nIGFjY2VwdGVkIGluCj4gZG9tYWluX2NyZWF0ZSgpLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJl
dmlld2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
