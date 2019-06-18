Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F414A58A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 17:35:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdG6B-00015r-Lh; Tue, 18 Jun 2019 15:32:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dFjn=UR=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hdG6B-00015m-13
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 15:32:39 +0000
X-Inumbo-ID: 4cc7b4ad-91de-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4cc7b4ad-91de-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 15:32:37 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h10so33976ljg.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2019 08:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ypb96tzDXXI5kpKR5+elKhOSpOsjNDUR18l1nAtsyk4=;
 b=cf/hnxrYIMayPfs54OeMnf6CSjcUmaWjuyJqE6SbJKcM7UXnuAeTU8QP2r6oey6w6t
 nIhNt1955Rxrr42675qT6pEX3zqS23EK9TwC7HbgXGa6sfgQ8z+XB511SQHmRn0PMUMD
 r/T3gTZXrVTjKy+fiRkCAxohNaarjy10lrnZDYhGItZP3M5MedH39RpQ85YLGRMiDg8e
 ir3a+Lbh/hZOWK2JL9mfAX+/nOQPYDa1YSQ9zzwpV/qzduAUnQNtVqnOHS2TJP4YIruF
 qgNfUm3Wh60ValD3pYNHIGmmCf8f/VIzTJ76aEgamB8YsjI3z+cY2DGhBG4ik7CFmRAA
 Oj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ypb96tzDXXI5kpKR5+elKhOSpOsjNDUR18l1nAtsyk4=;
 b=JYUm6rsR2sHJBYOE6e4NUP6vl9XGeJlY0kYE3aSRu+GCRKHqVWEnQ9tqR/CslW0rtZ
 +MtOPna4+W1bkAS9uWKh12EawNePVQgKUrhS0HX/ZPuzqGlPQfhHLtg94S7Ue67wjWIG
 gKPVWC6yPCPsGWZ94tZPMh+5yAdhgFxkTE07uypoTXACrPj/u6jrWzunk0jyugnCREAU
 izDPZTLWDpuUGDcnMdjYEN/70gGPqtg5wa6/Zjry4pj4r4R5FJRASy14QZuiyEjhiKA6
 Ll6N0OiGhNL2OzEZ2RXmlvUhEQz2DDOZNNN6YyiSDbIGvY52gOnP7edZvRM3mZGhp+qK
 9ixg==
X-Gm-Message-State: APjAAAUT3Gdte94BlrmnyU8UktM4rYPKaRBxrFyhR5vdlYQIzJ5aQtDS
 w8FIF57alFJ4Y+3WQ7dbqDo=
X-Google-Smtp-Source: APXvYqy6ayeyWGAnvu1X1kDmiJZGoFMNF5BKuU2k0sx31cTHCwqNel3t7QHWG0IZK2wEJC7xgCxG2g==
X-Received: by 2002:a2e:2b19:: with SMTP id q25mr44789237lje.127.1560871956258; 
 Tue, 18 Jun 2019 08:32:36 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 z30sm2496408lfj.63.2019.06.18.08.32.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 08:32:35 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <7de133a9-6aa7-1523-3f8f-b5506efef032@gmail.com>
 <5D02448E0200007800237D77@prv1-mh.provo.novell.com>
 <9390f580-d99b-0163-48c2-7c1bd2d0133d@arm.com>
 <5D0248770200007800237DAF@prv1-mh.provo.novell.com>
 <f5b28793-5cc4-0f83-d571-af87d75e38c0@arm.com>
 <5D0252300200007800237E93@prv1-mh.provo.novell.com>
 <f90caffd-32c1-54a4-a28a-8d5f3976f8f8@arm.com>
 <90a3c768-5274-dbb8-8eb2-2eda902c3e5b@gmail.com>
 <a439c5ec-cec5-51be-bf76-eebdf50cf1bb@arm.com>
 <5e13f916-4ea7-05a6-3156-df6dc8bbd1d8@gmail.com>
 <5D03C06F020000780023864D@prv1-mh.provo.novell.com>
 <46e206de-dd8e-6931-bda6-32af5c7ba964@gmail.com>
 <5D0733230200007800238AF2@prv1-mh.provo.novell.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <21179ac0-326d-a48a-7c33-69d6ffc43064@gmail.com>
Date: Tue, 18 Jun 2019 18:32:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5D0733230200007800238AF2@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSmFuLAoKT24gMTcuMDYuMTkgMDk6MjgsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBXZSBt
YXkgcmVxdWlyZSBleGlzdGluZyBydW5zdGF0ZSBhcmVhIHVucmVnaXN0ZXJpbmcgaWYgdGhlIHN5
c3RlbSBpcyBhd2FyZQo+PiBvZiBpdC4gQnV0IGl0IGlzIGZvciB0aGUgbmV3IGludGVyZmFjZS4K
Pj4gVGhlIG9sZCBvbmUgaGFzIG5vIGRvY3VtZW50YXRpb24gYWJvdXQgdGhlIHVucmVnaXN0ZXJp
bmcuIFRoZSBpbXBsaWNpdCB3YXkKPj4gaXMga25vd24gdG8gdXMsIGJ1dCBub3Qga25vd24gdG8g
dXNlcnMuCj4+IEhvdyB0byBzb2x2ZSB0aGUgY2xhc2g/Cj4gCj4gQW5kIG9uY2UgYWdhaW4gSSdt
IG5vdCBzdXJlIHdoYXQgdG8gYW5zd2VyLCBjb25zaWRlcmluZyB0aGF0IEkndmUKPiBhbHJlYWR5
IG91dGxpbmVkIGEgcG9zc2libGUgbW9kZWwgKHdpdGhvdXQgYW55IGV4cGxpY2l0IHVucmVnaXN0
cmF0aW9uKS4KCkp1c3QgdG8gYmUgc3VyZSwgInRoZSBtb2RlbCIgeW91IGFyZSB0YWxraW5nIGFi
b3V0IGlzIGZvbGxvd2luZzoKCj4gSSB0aG91Z2h0IGl0IGhhZCBiZWVuIGNsYXJpZmllZCBhbHJl
YWR5IHRoYXQgbm9ybWFsIGd1ZXN0cyBjYW4gdmVyeQo+IHdlbGwgdXNlIGJvdGggaW50ZXJmYWNl
cywganVzdCBub3QgYm90aCBhdCB0aGUgc2FtZSB0aW1lOiBCb290IGxvYWRlcgo+IGFuZCBPUyBj
b3VsZCBkaXNhZ3JlZSBpbiB0aGlzIHJlZ2FyZCwgYXMgdGhlIHByaW1lIGV4YW1wbGUuCgpJcyBp
dCBjb3JyZWN0PwoKQnV0IHdpdGggdGhlIGN1cnJlbnQgaW50ZXJmYWNlIChWQSkgdGhhdCBtb2Rl
bCBpcyBhbHJlYWR5IGJyb2tlbiB3aXRob3V0IHVucmVnaXN0cmF0aW9uLiBPbiBjaGFuZ2UgYmV0
d2VlbiBlbnRpdGllcyB3aXRoIGRpZmZlcmVudCBWQSBzcGFjZXMgdGhlIGh5cGVydmlzb3IgZGVm
aW5pdGVseSBoYXMgYSBjaGFuY2UgdG8gc3BvaWwgdGhlIG5ldyBWQSBzcGFjZSBhdCB0aGUgb2xk
IGFkZHJlc3MuCklNSE8gaXQgc2hvdWxkIGJlIGZpeGVkIChhdCBsZWFzdCBkb2N1bWVudGVkKSBm
b3IgdGhlIG9sZCBpbnRlcmZhY2UuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
