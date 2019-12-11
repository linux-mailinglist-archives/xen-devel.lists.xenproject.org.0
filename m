Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFDC11B93B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 17:53:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if5BP-00014C-Ec; Wed, 11 Dec 2019 16:49:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SWtT=2B=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1if5BO-000147-6E
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 16:49:50 +0000
X-Inumbo-ID: 3df3ec58-1c36-11ea-8b9f-12813bfff9fa
Received: from mail-wr1-f45.google.com (unknown [209.85.221.45])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3df3ec58-1c36-11ea-8b9f-12813bfff9fa;
 Wed, 11 Dec 2019 16:49:48 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id t2so24828213wrr.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2019 08:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Qm69jrH3hGLjanPHzx3Y++S5Ycf9c5Mo30xe4RO36I=;
 b=s/rpOkSaqRyMKefXeEyRzLNqioeuNJsDWXAbtZyELJtw4jhrYY0EiyS5a+vlXnJ7gr
 s387KkSLUipqWJeGydJbTJwJDJo2R4VAoQpNJJo1Wt8Fhy7V812cgUSKTv2kVhu6EVx+
 TRKfH9lwaRGPD1offiLGuMQ5iUy1mbEKsdqD2yysWjmGTGuwMjsgwSQRSUzO/J0Ba/fM
 sb/nSSCV7MgbxsUhuJyfI8FaxhgqUP8DtFtPmeH/Pjm/4uA/ui/mOB+V8NrtQCFpkhD+
 zcDpFAiGBA+1N74/ihIcMruz6/FcBuSSpa3D6LbqcNEUpn7v37NYELzaZQPc7e2/FhOu
 lyNw==
X-Gm-Message-State: APjAAAWla1as78lT7ZZYXQEl52V8JkDz5oAJfHsiALPCxIzTancI+TiN
 rNtO0MG/5+9VcyoUYeBqkqokflmUD+0=
X-Google-Smtp-Source: APXvYqzp4mXMq5DgcARLe5VmuSQhjyCqBbbaN1SQoRgmSszZZPBXHKHru6itjsQgXZyrVTjpzb8T0Q==
X-Received: by 2002:adf:9144:: with SMTP id j62mr786946wrj.168.1576082987465; 
 Wed, 11 Dec 2019 08:49:47 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id x7sm2826227wrq.41.2019.12.11.08.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 08:49:46 -0800 (PST)
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "wl@xen.org" <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7a5c3e88-4ec4-422e-f52b-1e8c319e2a00@xen.org>
 <568cef76-8abe-c7da-e2a9-d71b4530db12@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d440f0f0-f159-8446-fc14-9ae18657d2f9@xen.org>
Date: Wed, 11 Dec 2019 16:49:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <568cef76-8abe-c7da-e2a9-d71b4530db12@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] XSA-255 and Arm
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC8xMi8yMDE5IDEwOjQyLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDEyLzkv
MTkgMToxMyBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBhbGwsCj4+Cj4+IEkgd2FzIGxv
b2tpbmcgYXQgdGhlIEdyYW50IFRhYmxlIGNvZGUgb3ZlciB0aGUgd2Vlay1lbmQgYW5kIG5vdGlj
ZWQKPj4gdGhhcnQgWFNBLTI1NSBbMV0gaW50cm9kdWNlZCBzb21lIHVuaW50ZW5kZWQgY29uc2Vx
dWVuY2VzIG9uIEFybS4KPj4KPj4gU2luY2UgdGhlIFhTQSwgZ250dGFiX21hcF9mcmFtZSgpIHdp
bGwgcmVtb3ZlIHRoZSBwcmV2aW91cyBtYXBwaW5nIChpZgo+PiBhbnkpIGJlY2F1c2UgbWFwcGlu
ZyB0byB0aGUgbmV3IEdGTi4KPj4KPj4gQXMgb24gQXJtIHdlIGRvbid0IGhhdmUgYW4gTTJQLCB0
aGUgR0ZOIGlzIHN0b3JlZCBwZXIgZnJhbWUgaW4gdGhlCj4+IGdyYW50LXRhYmxlIGNvZGUuIFRo
aXMgd2lsbCBuZXZlciBnZXQgY2xlYXJlZCBkdXJpbmcgdW5tYXBwaW5nIChlLmcuCj4+IFhFTk1F
TV9yZW1vdmVfZnJvbV9waHlzbWFwKSBhbmQgdGhlcmVmb3JlIHdlIG1heSBlbmQgdXAgdG8gcmVt
b3ZlIGEKPj4gbWFwcGluZyBmcm9tIHNvbWVvbmUgZGlmZmVyZW50IChBcm0gZG9lcyBub3QgY2hl
Y2sgdGhlIE1GTiBpcyB0aGUKPj4gY29ycmVjdCBvbmUgYmVmb3JlIHJlbW92aW5nIG1hcHBpbmcp
Lgo+IAo+IFNvcnJ5IEp1bGllbiwgIEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgdGhlIEFSTSBn
cmFudCBtYXBwaW5nIGNvZGUgdG8KPiBrbm93IHdoYXQgdGhpcyBpcyBhYm91dC4gIENhbiB5b3Ug
cG9pbnQgbWUgdG8gdGhlIHJlbGV2YW50IGZpbGVzIC8KPiBmdW5jdGlvbnMgLyBzdHJ1Y3R1cmVz
LCBhbmQgbWF5YmUgc2tldGNoIG91dCBhIHByb2JsZW1hdGljIGJlaGF2aW9yPwpJZiB5b3UgbG9v
ayBhdCB0aGUgaW1wbGVtZW50YXRpb24gb2YgZ250dGFiX21hcF9mcmFtZSgpIAooY29tbW9uL2dy
YW50X3RhYmxlLmMpLCBpdCB3aWxsIHVzZSBnbnR0YWJfZ2V0X2ZyYW1lX2dmbiguLi4pIHRvIGtu
b3cgCndoZXRoZXIgdGhlIGdyYW50LXRhYmxlIGZyYW1lIHdhcyBhbHJlYWR5IG1hcHBlZCBpbiB0
aGUgR3Vlc3QgUDJNLgoKSWYgaXQgaXMgYWxyZWFkeSBtYXBwZWQsIHRoZW4gd2Ugd2lsbCB0cnkg
dG8gcmVtb3ZlIHRoZSBjdXJyZW50IG1hcHBpbmcgCmJlZm9yZSBkb2luZyB0aGUgbmV3IG9uZS4K
Ck9uIEFybSwgZ250dGFiX2dldF9mcmFtZV9nZm4oKSBhcmUgdXNpbmcgYW4gaW50ZXJuYWwgYXJy
YXkgYmVjYXVzZSB0byB3ZSAKZG9uJ3QgaGF2ZSBhbiBpbnRlcm5hbCBhcnJheSBiZWNhdXNlIHdl
IGRvbid0IGhhdmUgYW4gTTJQLiBUaGVyZSBpcyBhIApzaXN0ZXIgZnVuY3Rpb24gdG8gc2V0IHRo
ZSBmcmFtZSAoc2VlIGdudHRhYl9zZXRfZnJhbWVfZ2ZuKCkpLiBIb3dldmVyLCAKdGhpcyBpcyBv
bmx5IGNhbGxlZCB3aGVuIG1hcHBpbmcgdGhlIGZyYW1lIGFuZCBub3Qgd2hlbiB0aGUgdW5tYXAg
aXMgCmRvbmUgWEVOTUVNX3JlbW92ZV9mcm9tX3BoeXNtYXAuCgogRnJvbSBteSB1bmRlcnN0YW5k
aW5nLCB0aGUgY3VycmVudCBjb2RlIChpLmUgcmVtb3ZlIHRoZSBvbGQgbWFwcGluZykgaXMgCnRy
eWluZyB0byB3b3JrYXJvdW5kIHRoZSBmYWN0IHdlIGRvbid0IHRha2UgcmVmZXJlbmNlIHdoZW4g
ZG9pbmcgYSAKbWFwcGluZyBpbiB0aGUgcGFnZS10YWJsZXMuCgpBdCB0aGUgZGVmYXVsdCBvZiBu
b3QgaGFuZGxpbmcgcmVmZXJlbmNlIGZvciBhbGwgdGhlIG1hcHBpbmdzLCB3ZSBjb3VsZCAKaGFu
ZGxlIGdyYW50IGZyYW1lIGluIGEgc2ltaWxhciB3YXkgdG8gZm9yZWlnbiBtYXBwaW5nLiBUaGlz
IHdvdWxkIApyZW1vdmUgdGhlIHJlc3RyaWN0aW9uIG9uIHRoZSBudW1iZXIgb2YgbWFwcGluZ3Mg
YW5kIHdlIGNvdWxkIHVwZGF0ZSB0aGUgCmludGVybmFsIGFycmF5IGF0IHRoZSBzYW1lIHRpbWUu
CgpUaGUgb25seSBjb25jZXJuIHdpdGggdGhpcyBhcHByYW9jaCBpcyB3ZSB3b3VsZCBoYXZlIHRv
IHdhbGsgdGhyb3VnaCB0aGUgCmFycmF5IHRvIGZpbmQgdGhlIEdGTi4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
