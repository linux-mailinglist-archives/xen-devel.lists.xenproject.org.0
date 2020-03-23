Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46C918F13A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 09:51:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGIm1-0007oh-AJ; Mon, 23 Mar 2020 08:49:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Oxe4=5I=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jGIlz-0007oc-Ji
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 08:49:27 +0000
X-Inumbo-ID: 33725b5e-6ce3-11ea-bec1-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33725b5e-6ce3-11ea-bec1-bc764e2007e4;
 Mon, 23 Mar 2020 08:49:26 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id u59so15249778edc.12
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2020 01:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=/t1LWpeW9ly6wesIA8hfmMzNcujbEOt/MEL8hPKxchw=;
 b=eM+c8YrqYlIGOCgWCGnDiSIZJXHhECYqLijFNCKVe9WQRfIxd9RXoFLQICMZnOTwaE
 wAUaQ/OM0h/hU1tXUZwfXLFlZfxS3fOzyoZqaND5aRYYZszrlwd5bN8qwgpnLRlUKGyd
 oQMJmdZGuWo35uAkuTzos4LG1t8Zn5D/Xei4RXK97zmhDORVTP30JimUWqc34x1fcsdP
 OCp1JngfOBBL0FzoX/KDkP266jkuzn+cPdfxLL/OI3KS8dVi9KOjlu9/2I50/hIxg7RW
 rn3DPhq737yTlimjm0JpzT+URk0PDkX6fW5GtnwnylZAuZ3uM+0Nw3K0OnBDIiE4Cn6L
 PtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=/t1LWpeW9ly6wesIA8hfmMzNcujbEOt/MEL8hPKxchw=;
 b=t2412D/Hu4SjHYHF/+JeF+43zDkme9/Q2tM74pfgAJlH3QiJmzJZ6tvX1q7U9LT/I6
 A8WPAKHLpBeEvpfZs+Mh/ufV2ycaPHscLPdBvhrhidGT6SHM+dI1bsqg241ZF9Oy9r6b
 X/4juUXFcGUFKmfIz/9FJLdB1QIvmHwOcXfeavhl/E77WdwfiUiQBHm9qy/b2AB/RhUF
 YN1wW8XW4LT5YOgqW1V5kv1LjkeHk34OLd8AhR9gv86kUJcsl/YIV7ol0KCmB9wQs+S9
 WUAz8n3EZ6mDTwu9S5j9a3hJ6gesdOFkvr7tALnzVMaPswVz9aEQ/E8xKCsGtsDtw4tW
 c/7Q==
X-Gm-Message-State: ANhLgQ0UYch3a+FzQ7eUY52J+ueJJKtL8FZpc3G8BSsQQrFKIQpaBq+l
 UdYWqjBlJDK1rXPeS6EXQgE=
X-Google-Smtp-Source: ADFU+vvIj3J5dB+NRPTIuYjGHa712pOG/KLTglM0qWjU4F9AKtBa/E2o1l7a/mbc20gQFACjE9HZlA==
X-Received: by 2002:a05:6402:1002:: with SMTP id
 c2mr20874742edu.185.1584953366125; 
 Mon, 23 Mar 2020 01:49:26 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id d20sm941821edn.12.2020.03.23.01.49.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Mar 2020 01:49:25 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'David Woodhouse'" <dwmw2@infradead.org>, <xen-devel@lists.xenproject.org>
References: <759b48cc361af1136e3cf1658f3dcb1d2937db9c.camel@infradead.org>	
 <20200319212150.2651419-1-dwmw2@infradead.org>	
 <20200319212150.2651419-2-dwmw2@infradead.org>	
 <004701d5febc$3632bfe0$a2983fa0$@xen.org>
 <45c147a12565cb1b0ca34217a8d66289a91ec35c.camel@infradead.org>
In-Reply-To: <45c147a12565cb1b0ca34217a8d66289a91ec35c.camel@infradead.org>
Date: Mon, 23 Mar 2020 08:49:23 -0000
Message-ID: <002c01d600ef$f4832ef0$dd898cd0$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGJbqioGx3P4niv5vow+yMv52QyWAKu4aI2AYweJd0B5YOAbwFmCqo/qLLNH0A=
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce
 PGC_state_uninitialised
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, hongyxia@amazon.com,
 'Jan Beulich' <jbeulich@suse.com>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwo+ID4gPiBpbmRleCA2MjUwN2NhNjUxLi41ZjA1
ODFjMDcyIDEwMDY0NAo+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+ID4gPiArKysgYi94
ZW4vYXJjaC94ODYvbW0uYwo+ID4gPiBAQCAtNDkxLDcgKzQ5MSw4IEBAIHZvaWQgc2hhcmVfeGVu
X3BhZ2Vfd2l0aF9ndWVzdChzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLCBzdHJ1Y3QgZG9tYWluICpk
LAo+ID4gPgo+ID4gPiAgICAgIHBhZ2Vfc2V0X293bmVyKHBhZ2UsIGQpOwo+ID4gPiAgICAgIHNt
cF93bWIoKTsgLyogaW5zdGFsbCB2YWxpZCBkb21haW4gcHRyIGJlZm9yZSB1cGRhdGluZyByZWZj
bnQuICovCj4gPiA+IC0gICAgQVNTRVJUKChwYWdlLT5jb3VudF9pbmZvICYgflBHQ194ZW5faGVh
cCkgPT0gMCk7Cj4gPiA+ICsgICAgQVNTRVJUKChwYWdlLT5jb3VudF9pbmZvICYgflBHQ194ZW5f
aGVhcCkgPT0gUEdDX3N0YXRlX2ludXNlIHx8Cj4gPiA+ICsgICAgICAgICAgIChwYWdlLT5jb3Vu
dF9pbmZvICYgflBHQ194ZW5faGVhcCkgPT0gUEdDX3N0YXRlX3VuaW5pdGlhbGlzZWQpOwo+ID4K
PiA+IENvdWxkIHRoZSBwYWdlIHN0YXRlIHBlcmhhcHMgYmUgYnVtcGVkIHRvIGludXNlIGluIHRo
aXMgY2FzZT8gSXQKPiA+IHNlZW1zIG9kZCB0byBsZWF2ZSBzdGF0ZSB1bmluaXRpYWxpemVkIHll
dCBzdWNjZWVkIGluIHNoYXJpbmcgd2l0aCBhCj4gPiBndWVzdC4KPiAKPiBObywgdGhhdCBkb2Vz
bid0IHJlYWxseSB3b3JrLgo+IAo+IFlvdSBjYW4ndCBqdXN0ICpkZWNsYXJlKiB0aGF0IHRoZSBw
YWdlIHdhcyBwcm9wZXJseSBpbml0aWFsaXNlZCwKPiBiZWNhdXNlIGl0IGlzbid0IHRydWUuIFRo
ZXJlJ3MgYSBwYXRob2xvZ2ljYWwgY2FzZSB3aGVyZSB0aGUgem9uZQo+IGhhc24ndCBiZWVuIGlu
aXRpYWxpc2VkIGF0IGFsbCwgYmVjYXVzZSAqYWxsKiB0aGUgcGFnZXMgaW4gdGhhdCB6b25lCj4g
Z290IGhhbmRlZCBvdXQgYnkgdGhlIGJvb3QgYWxsb2NhdG9yIG9yIHVzZWQgZm9yIGluaXRyZCBl
dGMuCj4gCj4gVGhlIGZpcnN0IHBhZ2VzICdmcmVlZCcgaW4gdGhhdCB6b25lIGVuZCB1cCBiZWlu
ZyB1c2VkIChpbgo+IGluaXRfaGVhcF9wYWdlcykgdG8gY3JlYXRlIHRoZSB6b25lIHN0cnVjdHVy
ZXMuCj4gCj4gTGlrZXdpc2UsIGl0IGNvdWxkIGluY2x1ZGUgYSBwYWdlIHdoaWNoIGluaXRfaGVh
cF9wYWdlcygpIGRvZXNuJ3QKPiBhY3R1YWxseSAqcHV0KiBpbnRvIHRoZSBidWRkeSBhbGxvY2F0
b3IsIHRvIHdvcmsgYXJvdW5kIHRoZSBjcm9zcy16b25lCj4gbWVyZ2UgcHJvYmxlbS4gSXQncyBm
aW5lIHRvIHVzZSB0aGF0IHBhZ2UgYW5kIHNoYXJlIGl0IHdpdGggYSBndWVzdCwKPiBidXQgaXQg
Y2FuJ3QgZXZlciBiZSBmcmVlZCBpbnRvIHRoZSBidWRkeSBhbGxvY2F0b3IuCj4gCgpPaywgc28g
ZGVmZXJyaW5nIHRoZSBjYWxsIHRvIGZyZWVfaGVhcF9wYWdlcygpIChhbmQgY29uc2VxdWVudGx5
IGluaXRfaGVhcF9wYWdlcygpKSBpcyBzYWZlIHRvIGRlZmVyIHVudGlsIHRoZSBndWVzdCBpcyB0
b3JuIGRvd24/IChPciBpcyB0aGlzIG9ubHkgc2FmZSBpZiB0aGUgcGFnZSBpcyBiZWluZyBhc3Np
Z25lZCB0byB0aGUgaW5pdGlhbCBkb21haW4/KQoKICBQYXVsCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
