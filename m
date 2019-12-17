Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BED122A2C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 12:34:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihB4B-0003c7-LZ; Tue, 17 Dec 2019 11:31:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VK9c=2H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihB49-0003c2-Rj
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 11:31:01 +0000
X-Inumbo-ID: aedd1348-20c0-11ea-88e7-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aedd1348-20c0-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 11:30:53 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m24so2564578wmc.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 03:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gT3FNI/Tojyrgv89Urs99YGt0RSGfR7B0eoQwwX3mYI=;
 b=PWIWfK713AXLI/lPG24V973E95aLvfm7UruDt84uLrabr2dP525l0xSaUq/8fJfa9U
 9NzhPW91ozblU0WlbMGR9eOw0tx2lymXATRw/Wf37MTIuq4hQF5r6zAyd+dCXFE3gCor
 1lTSIRSQUGOgIATx2eTWNJrqMCugATxfU9SiWn8OstNkqwxD4HsBV1XBj3MJj/Zy4ePy
 kc7myCUO5WUFLc0dnDrEMMaFdh+9chL+2n+F4lw3LxU0D/YoV5my7dWWkHBPVy+D750C
 VDKTpJv/KoxIwzv9+S8Y2/XCHOkx4wyDIgxyMBdvnjBQKVqYuwnEylg44j35YJqwF6T9
 +hqg==
X-Gm-Message-State: APjAAAU85isyUN34pwFbB7vym6BmI9VMZSUNL3xbp3WSH7g5je3psj/4
 gmos8GCbBkSacio4vNFVyIw=
X-Google-Smtp-Source: APXvYqyHmVoDD44QPSowwWi7uxDMV/9+jwee1oyPmvSlLKhMPxqpoXBk5+UgQ8splj3+5smIkpLCVA==
X-Received: by 2002:a1c:ed0e:: with SMTP id l14mr4764649wmh.74.1576582252188; 
 Tue, 17 Dec 2019 03:30:52 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id a14sm26309780wrx.81.2019.12.17.03.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 03:30:51 -0800 (PST)
To: Roman Shaposhnik <roman@zededa.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <alpine.DEB.2.21.1912161814220.13474@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EG6=20dHde7AHby48Q8aWoRLAX+LFWTTTuKeHi8M+dg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
Date: Tue, 17 Dec 2019 11:30:50 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy_EG6=20dHde7AHby48Q8aWoRLAX+LFWTTTuKeHi8M+dg@mail.gmail.com>
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNy8xMi8yMDE5IDA0OjM5LCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+IE9uIE1v
biwgRGVjIDE2LCAyMDE5IGF0IDY6NTUgUE0gU3RlZmFubyBTdGFiZWxsaW5pCj4gPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiBPbiBNb24sIDE2IERlYyAyMDE5LCBSb21hbiBTaGFw
b3NobmlrIHdyb3RlOgo+PiBJZiBJIHN1bSBhbGwgdGhlIG1lbW9yeSBzaXplcyB0b2dldGhlciBJ
IGdldCAweDNkZGZkMDAwIHdoaWNoIGlzIDk5ME0uCj4+IElmIHNvLCBJIHdvbmRlciBob3cgeW91
IGNvdWxkIGJvb3Qgc3VjY2VzZnVsbHkgd2l0aCBkb20wX21lbT0xMDI0TSBldmVuCj4+IG9uIFhl
biA0LjEyLi4uIDotPwo+IAo+IFRoYXQgaXMgYSB2ZXJ5IGludGVyZXN0aW5nIG9ic2VydmF0aW9u
IGluZGVlZCEgSSBhY3R1YWxseSBkb24ndAo+IHJlbWVtYmVyIHdoZXJlIHRoYXQgZGV2aWNlIHRy
ZWUgY2FtZSBmcm9tLCBidXQgSSB0aGluayBpdCB3YXMgZnJvbSBvbmUKPiBvZiB0aGUgTGluYXJv
IHNpdGVzLgoKVGhpcyBpcyBtb3N0bHkgbGlrZWx5IGJlY2F1c2Ugb2Y6Cgpjb21taXQgNjM0MWE2
NzQ1NzNmMTgzNGYwODNmMGFiMGY1YjM2YjA3NWY5ZTAyZQpBdXRob3I6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+CkRhdGU6ICAgV2VkIEF1ZyAyMSAyMjo0MjozMSAyMDE5ICsw
MTAwCgogICAgIHhlbi9hcm06IGRvbWFpbl9idWlsZDogRG9uJ3QgY29udGludWUgaWYgdW5hYmxl
IHRvIGFsbG9jYXRlIGFsbCAKZG9tMCBiYW5rcwoKICAgICBYZW4gd2lsbCBvbmx5IHByaW50IGEg
d2FybmluZyBpZiB0aGVyZSBhcmUgbWVtb3J5IHVuYWxsb2NhdGVkIHdoZW4gCnVzaW5nCiAgICAg
MToxIG1hcHBpbmcgKG9ubHkgdXNlZCBieSBkb20wKS4gVGhpcyBhbHNvIGluY2x1ZGVzIHRoZSBj
YXNlIHdoZXJlIG5vCiAgICAgbWVtb3J5IGhhcyBiZWVuIGFsbG9jYXRlZC4KCiAgICAgSXQgd2ls
bCBicmluZyB0byBhbGwgc29ydCBvZiBpc3N1ZXMgdGhhdCBjYW4gYmUgaGFyZCB0byBkaWFnbm9z
dGljIGZvcgogICAgIHVzZXJzICh0aGUgd2FybmluZyBjYW4gYmUgZGlmZmljdWx0IHRvIHNwb3Qg
b3IgZGlzcmVnYXJkKS4KCiAgICAgSWYgdGhlIHVzZXJzIHJlcXVlc3QgMUdCIG9mIG1lbW9yeSwg
dGhlbiBtb3N0IGxpa2VseSB0aGV5IHdhbnQgdGhlIApleGFjdAogICAgIGFtb3VudCBhbmQgbm90
IDUxMk1CLiBTbyBwYW5pYyBpZiBhbGwgdGhlIG1lbW9yeSBoYXMgbm90IGJlZW4gCmFsbG9jYXRl
ZC4KCiAgICAgQWZ0ZXIgdGhpcyBjaGFuZ2UsIHRoZSBiZWhhdmlvciBpcyB0aGUgc2FtZSBhcyBm
b3Igbm9uLTE6MSBtZW1vcnkKICAgICBhbGxvY2F0aW9uICh1c2VkIGJ5IGRvbVUpLgoKICAgICBB
dCB0aGUgc2FtZSB0aW1lLCByZWZsb3cgdGhlIG1lc3NhZ2UgdG8gaGF2ZSB0aGUgZm9ybWF0IG9u
IGEgc2luZ2xlCiAgICAgbGluZS4KCiAgICAgU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KICAgICBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
