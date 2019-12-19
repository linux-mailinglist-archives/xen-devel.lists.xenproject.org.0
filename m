Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4771D125C57
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 09:01:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihqhZ-0002nZ-LB; Thu, 19 Dec 2019 07:58:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yrdy=2J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihqhY-0002nU-8m
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 07:58:28 +0000
X-Inumbo-ID: 564e30a6-2235-11ea-9160-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 564e30a6-2235-11ea-9160-12813bfff9fa;
 Thu, 19 Dec 2019 07:58:26 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id cy15so3916024edb.4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 23:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wPu8VGKukCbop5V5XPJeJv+YemimNVdjTnKkVzLLNZk=;
 b=Y3srEPgShD9scYqv36GAGq1jwCtfdiMkMsfu6m3PuxW6vb89/iyxABB+/IpeM9IFd+
 NlhuT8K6Ay3A6jIxGLEAbuZs+L5OcvDkMP4In+Hdz3qSJZ2OaqV3/w1I6kEf3yReVyav
 LIduaX3eEeOtMyW/TvZLC2c73Fae46pDVepJh0NIh7xiOXPgdgO1yEfM3pcOLhL95Rmd
 7bgGTZE9RPlNea77tfKx8j7amasZ+zE5Hc94fCHXPlPFBiPWAwdL2R/Cfi0TDbT48wEy
 57Xza90WxuByrKlgwCaSjtF7e2QdPBBN6bB/llr8/Z5Nwmuac+cqk8YmHlfg6/d0F0vx
 /dDw==
X-Gm-Message-State: APjAAAU/Ko1FusjtIRpfBAsH6Czt+o7TRpPNZhJ/gikEHaj8u1g1/mgW
 +lquN53VdESsYP1Vzz90FDI=
X-Google-Smtp-Source: APXvYqyqGHb7wM3+fyqh7bYSNm4LeXS65MAk10vE+xKEuxECkOZTzFqzXU4dstRrEJMkz4ipQ3UvRw==
X-Received: by 2002:a17:906:2651:: with SMTP id
 i17mr7876952ejc.246.1576742306098; 
 Wed, 18 Dec 2019 23:58:26 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id s12sm297378eja.79.2019.12.18.23.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 23:58:25 -0800 (PST)
To: Roman Shaposhnik <roman@zededa.com>
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <alpine.DEB.2.21.1912161814220.13474@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EG6=20dHde7AHby48Q8aWoRLAX+LFWTTTuKeHi8M+dg@mail.gmail.com>
 <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
 <alpine.DEB.2.21.1912171029300.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EVnfw0yMpevhJ-PqXoKo1GgvojH1SXDMdm4FKGNDQPA@mail.gmail.com>
 <alpine.DEB.2.21.1912171058200.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy-bdEumC=6s6CVFweJWc50nh2-nkEmQ2jtkXjZzziD2_A@mail.gmail.com>
 <alpine.DEB.2.21.1912171737160.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy8nMc1xj4Lh4emdkxpnwBrYBWh9wOx_muHAuO2rs1HmmQ@mail.gmail.com>
 <CAMmSBy9Djc6CxLnq8br8Ha1HrsHUf8ry5c0U0spbT9YRR+0fZg@mail.gmail.com>
 <d77e7ec8-3b28-ee60-a180-794deb227099@xen.org>
 <CAMmSBy8LT4yZGoGKWTOtEeV4e=9+BQaAx+zFp1oUf6fi1PzY2A@mail.gmail.com>
 <87e4706e-5b7a-1025-5825-376ed801a6e4@xen.org>
 <CAMmSBy_26UqPHeuRC9Jw0g=1oe3jzrsxKsQXs4xB+y3xPLmm-w@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <86f35bc9-4059-b56f-d77d-c3aa44a75c75@xen.org>
Date: Thu, 19 Dec 2019 07:58:24 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy_26UqPHeuRC9Jw0g=1oe3jzrsxKsQXs4xB+y3xPLmm-w@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUm9tYW4sCgpPbiAxOS8xMi8yMDE5IDAwOjI4LCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+
IE9uIFdlZCwgRGVjIDE4LCAyMDE5IGF0IDI6MTcgUE0gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4gd3JvdGU6Cj4+Cj4+IEhpIFJvbWFuLAo+Pgo+PiBPbiAxOC8xMi8yMDE5IDE3OjAzLCBS
b21hbiBTaGFwb3NobmlrIHdyb3RlOgo+Pj4gT24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgMzo1MCBB
TSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToKPj4+IFNvIC0tIG5vdGhpbmcg
Ym9vdHMgZGlyZWN0bHkgYnkgVUVGSSAtLSBldmVyeXRoaW5nIGdvZXMgdGhyb3VnaCBHUlVCLgo+
Pj4KPj4+IEhvd2V2ZXIsIG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBHUlVCIHdpbGwgZGV0ZWN0
IGRldmljZXRyZWUKPj4+IGluZm9ybWF0aW9uIHByb3ZpZGVkIGJ5IFVFRkkgKGV2ZW4gdGhvdWdo
IGRldmljZXRyZWUgY29tbWFuZCBpcwo+Pj4gc3VwcG9zZWQgdG8gY29tcGxldGVseSByZXBsYWNl
IHRoYXQpLiBIZW5jZSBpdCBpcyBwb3NzaWJsZSB0aGF0IExpbnV4Cj4+PiByZWxpZXMgb24gc29t
ZSByZXNpZHVhbHMgbGVmdCBpbiBtZW1vcnkgYnkgR1JVQiB0aGF0IFhlbiBkb2Vzbid0IHBheQo+
Pj4gYXR0ZW50aW9uIHRvIChidXQgdGhpcyBpcyBhIHByZXR0eSB3aWxkIHNwZWN1bGF0aW9uIG9u
bHkpLgo+Pgo+PiBXaGlsZSBpdCBnb2VzIHRocm91Z2ggR1JVQiwgaXQgaXMgYSBib290bG9hZGVy
IGFuZCB3aWxsIGp1c3QgYWN0IGFzIGEKPj4gcHJveHkgZm9yIEVGSS4gU28gRUZJIGFwcGxpY2F0
aW9uIHN1Y2ggYXMgWGVuL0xpbnV4IGNhbiBzdGlsbCBiZSBsb2FkZWQKPj4gYW5kIHRha2UgYWR2
YW50YWdlIG9mIHJ1bnRpbWUgc2VydmllcyBpZiBwcmVzZW50L2ltcGxlbWVudGVkLgo+IAo+IEFo
YSEgU28gdGhlbiBpdCBkZXBlbmRzIG9uIFhlbiBhY3R1YWxseSB1c2luZyB0aG9zZSBFRkkgc2Vy
dmljZXMuIFdoaWNoCj4gbGVhZHMgdG8gbXkgZmlyc3QgcXVlc3Rpb246Cj4gICAgIDEuIHdvdWxk
IGl0IGJlIHBvc3NpYmxlIHRvIHN0YXkgY29tcGxldGVseSB3aXRoIGp1c3QgZGV2aWNldHJlZXMg
aW5mb3JtYXRpb24KPiAgICAgICAgIGJ5IHBhc3NpbmcgZWZpPW5vLXJzIHRvIFhlbj8KVGhpcyB3
aWxsIG9ubHkgZGlzYWJsZWQgdGhlIHJ1bnRpbWUgc2VydmljZXMgKG5vdGUgdGhhdCB0aGV5IGFy
ZSBub3QgCnN1cHBvcnRlZCBvbiBYZW4gb24gQXJtIHRvZGF5KS4gV2hhdCBJIGRlc2NyaWJlZCBh
Ym92ZSBpcyBwYXJ0IG9mIHRoZSAKYm9vdCBzZXJ2aWNlcyBhbmQgY2FuJ3QgYmUgZGlzYWJsZWQu
CgpBbHNvLCBJIGFtIG5vdCBlbnRpcmVseSBzdXJlIEdSVUIvRUZJIHdpbGwgdXBkYXRlIHlvdSBk
ZXZpY2UtdHJlZSB0byAKcG9pbnQgb3V0IHRoZSBtZW1vcnkgdGhhdCB3YXMgY2FydmVkIG91dCBm
b3IgdGhpbmdzIGxpa2UgQVRGLgoKTG9va2luZyBhdCB0aGUgRFRTIG1lbW9yeSBub2RlIHlvdSBw
cm92aWRlZCBpbiBhbm90aGVyIGUtbWFpbCwgaXQgc2VlbXMgCnRoZSBtZW1vcnkgbWFwIGlzIHNs
aWdodGx5IGRpZmZlcmVudC4KCj4gCj4+IEluIGZhY3QgbW9zdCBvZiBwZW9wbGUgb24gQXJtIGFy
ZSB1c2luZyBHUlVCIHJhdGhlciB0aGFuIEVGSSBkaXJlY3RseSBhcwo+PiB0aGlzIGlzIG1vcmUg
ZnJpZW5kbHkgdG8gdXNlLgo+Pgo+PiBSZWdhcmRpbmcgdGhlIGRldmljZXRyZWUsIFhlbiBhbmQg
TGludXggd2lsbCBjb21wbGV0ZWx5IGlnbm9yZSB0aGUKPj4gbWVtb3J5IG5vZGVzIGluIFhlbiBp
ZiB1c2luZyBFRkkuIFRoaXMgYmVjYXVzZSB0aGUgRUZJIG1lbW9yeSBtYXAgd2lsbAo+PiBnaXZl
IHlvdSBhbiBvdmVydmlldyBvZiB0aGUgcGxhdGZvcm0gd2l0aCB0aGUgRUZJIHJlZ2lvbnMgaW5j
bHVkZWQuCj4gCj4gQWhhISBTbyBpbiB0aGF0IHNlbnNlIGl0IGlzIGEgYnVnIGluIFhlbiBhZnRl
ciBhbGwsIHJpZ2h0PyAodGhhdCdzIHdoYXQgeW91J3JlCj4gcmVmZXJyaW5nIHRvIHdoZW4geW91
IHNheSB5b3Ugbm93IHVuZGVyc3RhbmQgd2hhdCBuZWVkcyB0byBnZXQgZml4ZWQpLgoKWWVzLiBU
aGUgRUZJIG1lbW9yeSBtYXAgaXMgYSBsaXN0IG9mIGV4aXN0aW5nIG1lbW9yeSB3aXRoIGEgdHlw
ZSAKYXNzb2NpYXRlZCB0byBpdCAoQ29udmVudGlvbmFsLCBCb290U2VydmljZUNvZGVzLCBNZW1v
cnlNYXBwZWRJTy4uLikuCgpUaGUgT1MvSHlwZXJ2aXNvciB3aWxsIGhhdmUgdG8gZ28gdGhyb3Vn
aCB0aGVtIGFuZCBjaGVjayB3aGljaCByZWdpb25zIAphcmUgdXN1YWJsZS4gQ29tcGFyZSB0byBM
aW51eCwgWGVuIGhhcyBsaW1pdGVkIGl0c2VsZiB0byBvbmx5IGEgZmV3IHR5cGVzLgoKSG93ZXZl
ciwgSSB0aGluayB3ZSBjYW4gYmUgb24gYSBwYXIgd2l0aCBMaW51eCBoZXJlLgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
