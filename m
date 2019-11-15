Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98DEFE13A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:29:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdUe-0004nR-Q6; Fri, 15 Nov 2019 15:26:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVdUc-0004nK-M6
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:26:38 +0000
X-Inumbo-ID: 50781568-07bc-11ea-9631-bc764e2007e4
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50781568-07bc-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 15:26:38 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id r7so11123532ljg.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 07:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bLnmcgemtvB0spRJ8z6beejE0bq8xBh+yR0sxMtclpc=;
 b=ovVBevfNriEdqZ0EzHFvdWvmT8kI32yg8W9cBJpQNWL30tOTF6h4rCrHeE76axLo2y
 dEceYML6G4RaXEIBzL3UdfhxWBivZZDfHhnPXnssQcvTl2AsH+NgT906Xm23vNN8ajE4
 Wjz8dBfFBcrPUNbE8JWCW9ixUAWAfFJln0+GdWYOZUsNW6llZ4zhVXJJO1FGSuT/Ottc
 6F3UPLkABfGCHk3W/oSN9acSgQ8y4gdPnMG3y91zbbsFXtjtY3Agh02R05wFCnaB2QSe
 47TQIgTjv87Qz8t7mLIXqlblBJDGSL9T2dSt3IiHe4uEri9wjzRg8GjnYceQjs3QUZsg
 dH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bLnmcgemtvB0spRJ8z6beejE0bq8xBh+yR0sxMtclpc=;
 b=hHVV5A8TWMlyHby4AJU4DilOyjnQef+nWbxIwTx3JYkaYNL8yH9ctwo6chjEEipABB
 Oi/eqW2qWuATpBw914doeNmmsZ5WIqeKSI9pp2Fu3j2phiQJ0ko9wBnxjBB6IGzo5ey1
 b0AnkdvphIKy2tu6edX1K+iFcEgHSpp7xFaDdPEmHQjL4fqjNsyA1+91uyTLsGzT6TCk
 ibmmA5PHW6nWd//s2LlEB5C7tZEXd6eqP2/Mlzk3N4YERF1+clzTKUMAyI/Tfr+IvC/U
 4kkkZcUa/bJwNXzTxCW4YxwoEtoZW5SlKt9PACU6PtMzBB5SFIqtUfLvYGfAdaORGvE2
 2/LQ==
X-Gm-Message-State: APjAAAXi7NvbsJ8iX8e7Lth6I5LQ/vwKnYLTUnLIvm2mmAWWaKKmOjUc
 pETn3f2AnNCr64h/Uts+llcvq3Aj4btKXCRjcSRIMA==
X-Google-Smtp-Source: APXvYqwRnSWksddqZD6957YdImiL2iGtYasfG16nHCkKh1Bq22VvIZi8V+eIe6k9/q6oefPtre+OqdpYfdsg5DMvTpw=
X-Received: by 2002:a05:651c:95:: with SMTP id
 21mr11795095ljq.40.1573831596904; 
 Fri, 15 Nov 2019 07:26:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <5773984ae9308500183adde21cf25837bba39f7f.1570456846.git.rosbrookn@ainfosec.com>
 <ce6a58af-d269-5b70-b1bc-df5a7620c4b5@citrix.com>
 <CAEBZRSeDo2RO-VptW8hYOzh93M04pxxVL16dqoAcrLGm0MbFuA@mail.gmail.com>
 <9576102c-c20f-7d65-5b93-bd2632fde462@citrix.com>
In-Reply-To: <9576102c-c20f-7d65-5b93-bd2632fde462@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 15 Nov 2019 10:26:25 -0500
Message-ID: <CAEBZRSe_jGO3Gi1DPb9-mGoLKODTP4i02EPogSN5xD-sgvcUig@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 11/24] golang/xenlight: define
 CpuidPolicyList builtin type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBJZiB3ZSBkbyBoYXZlIHRvIGtlZXAgdGhlIEMgcG9pbnRlciBhcm91bmQgZm9yIHNvbWUgcmVh
c29uLCBJIHRoaW5rCj4gdXNpbmcgU2V0RmluYWxpemVyIGlzIGEgbmVjZXNzYXJ5IGJhY2tzdG9w
IHRvIGtlZXAgdGhlIGxpYnJhcnkgZnJvbQo+IGxlYWtpbmcuICBJdCdzIGFsbCB3ZWxsIGFuZCBn
b29kIHRvIHNheSwgIk1ha2Ugc3VyZSB5b3UgY2FsbCBEaXNwb3NlKCkiLAo+IGJ1dCBJIHRoaW5r
IGZvciBhIEdDJ2QgbGFuZ3VhZ2UgdGhhdCdzIGp1c3QgZ29pbmcgdG8gYmUgdG9vIGVhc3kgdG8K
PiBmb3JnZXQ7IGFuZCBpdCB3aWxsIGJlIGEgaHVnZSBwYWluIGZvciBsb25nLXJ1bm5pbmcgcHJv
Y2Vzc2VzLgoKSSB1bmRlcnN0YW5kIHlvdXIgbW90aXZhdGlvbiBmb3Igd2FudGluZyB0byBtYWtl
IHRoaXMgZm9vbC1wcm9vZiwgYnV0CnRoZXJlIGFyZSBwbGVudHkgb2YgY29tbW9uIGV4YW1wbGVz
IGluIEdvIHdoZXJlIGl0J3Mgd2VsbC11bmRlcnN0b29kCnRoYXQgaWYgSSBjYWxsIGBOZXdGb29g
IHRoZW4gSSBuZWVkIHRvIGBmb28uQ2xvc2UoKWAgKGRlZmVyJ2Qgb3IKb3RoZXJ3aXNlKS4gSSBk
b24ndCB0aGluayB0aGF0IGFsb25lIGlzIGEgZ29vZCBlbm91Z2ggYXJndW1lbnQgZm9yCnR1cm5p
bmcgdG8gU2V0RmluYWxpemVyLiBCdXQsIEknbSBjZXJ0YWlubHkgbm90IGFkdm9jYXRpbmcgZm9y
IHRoZQpEaXNwb3NlIG9wdGlvbiBlaXRoZXIgLSBhcyBJIHNhaWQgSSB0aGluayB0aGF0IHdvdWxk
IGJlIHVuZm9ydHVuYXRlCmZyb20gYW4gQVBJIHBlcnNwZWN0aXZlLgoKPiBJZiB3ZSBkaWRuJ3Qg
aGF2ZSB0aGlzIHR5cGUgYXMgYSB0eXBlLCB3ZSdkIGhhdmUgdG8gYXZvaWQgc29tZWhvdwo+IGV4
cG9zaW5nIHRoZSB1c2VyIHRvIHRoZSBmdW5jdGlvbnMgd2hpY2ggdGFrZSBhbmQgdXNlIGl0LiAg
VGhlIG1haW4KPiBwbGFjZSBpdCdzIHVzZWQgQVRNIGlzIGluIERvbWFpbkJ1aWxkSW5mby4gIFdl
IGNvdWxkIGV4cGxvcmUgd2hldGhlciBpdAo+IHdvdWxkIGJlIHByYWN0aWNhbCB0byAiaW1wbGVt
ZW50IiBDcHVpZFBvbGljeUxpc3QgYXMgYSBzdHJpbmcsIGFuZCB0aGVuCj4gaGF2ZSB0b0MoKSBj
YWxsIGxpYnhsX2NwdWlkX3BhcnNlX2NvbmZpZygpLiAgT2J2aW91c2x5IHRoYXQgbWVhbnMKPiBm
cm9tQygpIHdvdWxkIGZhaWw7IGJ1dCBJJ20gbm90IHN1cmUgRG9tYWluQnVpbGRJbmZvIGlzIHJl
YWxseSBhCj4gc3RydWN0dXJlIHBhc3NlZCAib3V0IiBvZiBsaWJ4bCBhbnl3YXkuCgpJdCdzIHNv
dW5kaW5nIG1vcmUgYW5kIG1vcmUgbGlrZSB3ZSBuZWVkIGEgd2F5IHRvIGdpdmUgdHlwZXMgYW4K
ImV4cG9ydGVkL3VuZXhwb3J0ZWQiIGF0dHJpYnV0ZSBpbiB0aGUgSURMLgoKV2h5IGV4YWN0bHkg
d291bGQgZnJvbUMgYmUgZG9vbWVkIHRvIGZhaWw/IEp1c3QgYmVjYXVzZSB0aGVyZSBpcyBubwpg
bGlieGxfY3B1aWRfdG9fc3RyaW5nYCBvciBvdGhlcndpc2U/IEluIGFueSBjYXNlLCBJIHRoaW5r
IGRlZmluaW5nIGl0CmFzIGEgc3RyaW5nIG1heSBiZSBhIGdvb2QgaW50ZXJtZWRpYXRlIG9wdGlv
biBmb3Igbm93IChldmVuIGlmIGl0Cm1lYW5zIGZyb21DIGhhcyB0byBiZSBhIG5vLW9wKS4gVGhh
dCB3YXkgd2UgY2FuIGVuc3VyZSBjYWxscyB0bwpgbGlieGxfY3B1aWRfZGlwb3NlYCBhcyB1c3Vh
bC4KCi1OUgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
