Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA076E24A5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 22:36:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNNJk-0004X5-8c; Wed, 23 Oct 2019 20:33:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AxFJ=YQ=gmail.com=pryorm09@srs-us1.protection.inumbo.net>)
 id 1iNNJi-0004Wz-Vt
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 20:33:15 +0000
X-Inumbo-ID: 565df37a-f5d4-11e9-8aca-bc764e2007e4
Received: from mail-io1-xd34.google.com (unknown [2607:f8b0:4864:20::d34])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 565df37a-f5d4-11e9-8aca-bc764e2007e4;
 Wed, 23 Oct 2019 20:33:14 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id c6so26575885ioo.13
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2019 13:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kHEdjsSXFIABkPaKa1XHzWSQCQKax4QTYU9yXLfM6Ow=;
 b=Yir7+ypxKagm2PoK1IuY+MYuhSjsepSobKbgba6K4SLLvOBOCAOlDKRyo2TlhCjt4Z
 21LrsS9GwpavrwObGt0OMTpoQWj4rkJYyz++ywBHMXbdZvBGR7vQcdGMkbQ6Q9NzfNWX
 9ln6bcFSVlTiYIRoncc3KMTK/aIG1pueq1aAc5KI73f13+sf7XNVl/1k8ZrjO0R4Ty1k
 JJK7r31IBTN5r8yM9lLFD2KS1PPYGhBUEuMc2BxN/IVxHZQ/By23ArbrpW+7CDYzulhc
 ndTHA8preFLiyFsh+bEHqtP4KIr7s7wRPyLXOWJ+BpRPA9rMH2ikpetkR48gXkVtoHzN
 XUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kHEdjsSXFIABkPaKa1XHzWSQCQKax4QTYU9yXLfM6Ow=;
 b=VhLoB5iVbploLlqp24uGvHphN4b5YxJWzHv2rezxQaFDg3Ll1SEbrCZRlWjQAsu9KZ
 Z2uB/VwLr4o3JCNzVes15hnXjRnAsFT2sqbVO7qC6d0SUEYuCMGpYFX30bUrjfhTBPjS
 EXoU50CN89vz7Rp9f1bkxr84q7OqEvdCYj6YROWDTMjPsu/oDH2wkkg2xnaQ6TlkkXrp
 fbjIuibTdjt58dZLmQDaZ+8bnTNdn3HW24g4I52EFuKycpro5o5NtACX/uEn+YcafGdn
 K9/GhOHESKfBWo3Dw/rcQeS18rZh+4FG1SWBpsNw8d00ATTZG0lODs7ZJBPHRlSBxKJa
 1cQg==
X-Gm-Message-State: APjAAAWJlkzSipHM8CTduPouOyG68AdejxbbTAVeK01ym4jOhPCorNAE
 WYnEQQ7gfDQVhp/9rfhZsr8q5XdBqQ10+HQkISub3Q==
X-Google-Smtp-Source: APXvYqw9fPVvdd24aavDvWo41r+ToOzTy3FEKS2E7/1ey0NgokEnwi4HX4RRq72rOWHr7gC8Dx+Ue6qwU45tqpprZnY=
X-Received: by 2002:a02:3903:: with SMTP id l3mr11069713jaa.72.1571862793629; 
 Wed, 23 Oct 2019 13:33:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:b14d:0:0:0:0:0 with HTTP; Wed, 23 Oct 2019 13:33:12
 -0700 (PDT)
From: Pry Mar <pryorm09@gmail.com>
Date: Wed, 23 Oct 2019 13:33:12 -0700
Message-ID: <CAHnBbQ8Xt=f_P+sntM27m7+NXft-U=DYXFdTV9hOqJBTU+CXNw@mail.gmail.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: [Xen-devel] bug: unable to LZ4 decompress ub1910 installer kernel
 when launching domU
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8geGVuLWRldmVsLAoKaHR0cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0L3BsYWluLzExMDkzNzQK
CnNob3dzIG15IHRyYWNlcyBmcm9tIGEgaGVhbHRoeSBDZW50T1MgOCwgeGVuLTQuMTIuMSBkb20w
IHdoZW4gdHJ5aW5nCnRvIGxhdW5jaCBhIHB2IGluc3RhbGwgb2YgdGhlIG5ld2x5IHJlbGVhc2Vk
IHViMTkxMC4gVGhlIHNvdXJjZSBpcyBhCmJsb2NrLWF0dGFjaGVkIElTTyBhbmQgdGhlIGtlcm5l
bC9yYW1kaXNrIHdhcyBjb3BpZWQgb2ZmIGxvY2FsbHkuCgpJc28gaXMgbmFtZWQsIGVvYW4tbGl2
ZS1zZXJ2ZXItYW1kNjQuaXNvLgoKVGhlcmUgaXMgYWxzbyBhIGtlcm5lbCBwYWlyIGhlcmUKaHR0
cDovL2FyY2hpdmUudWJ1bnR1LmNvbS91YnVudHUvZGlzdHMvZW9hbi9tYWluL2luc3RhbGxlci1h
bWQ2NC9jdXJyZW50L2ltYWdlcy9uZXRib290L3hlbi8KCndoaWNoIGJlaGF2ZXMgdGhlIHNhbWUu
CgpUaGUgYExaNCBkZWNvbXByZXNzIGVycm9yYCBoYXBwZW5lZCB3aXRoIG90aGVyIGRvbTAsIGlu
Y2x1ZGluZwp4ZW4tNC4xM35yYzEgb24gQnVzdGVyLgoKdWIxOTEwIGRvbTAgdGVzdAotLS0tCk15
IGdvYWwgd2l0aCB0aGlzIGRvbVUgaW5zdGFsbCB3YXMgdG8gcHJlcGFyZSBhIGdvbGRlbiBpbWFn
ZSBmb3IgRW9hbgpkb20wLiBJIGhhZCB0cm91YmxlIHRlc3RpbmcgYSBmcmVzaCB1YjE5MTAgYnVp
bGQgb2YgeGVuLTQuMTIuMSBvbiBhCmdvb2QgYmFyZS1tZXRhbCBpbnN0YWxsLiBUaGUgb25seSBk
b3VidCBJIGhhZCB3YXMgdGhlCmBkby1yZWxlYXNlLXVwZ3JhZGUgLWRgIGZyb20gdWIxOTA0LgoK
TXkgbmV3IGh5cGVydmlzb3Igd291bGQgbm90IGV2ZW4gc3RhcnQgaW4gdWIxOTEwIGFuZCBJIGdv
dCBhbiBpbnN0YWxsIGJvb3QtbG9vcC4KCmNoZWVycywKUHJ5TWFyNTYKICMjeGVuLXBhY2thZ2lu
ZyBvbiBGcmVlbm9kZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
