Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A93E760E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 17:27:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP7mO-0006Yv-Fa; Mon, 28 Oct 2019 16:22:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7rwY=YV=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iP7mN-0006Yq-TL
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 16:22:03 +0000
X-Inumbo-ID: 13166678-f99f-11e9-bbab-bc764e2007e4
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13166678-f99f-11e9-bbab-bc764e2007e4;
 Mon, 28 Oct 2019 16:22:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w18so10580368wrt.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 09:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eFFcrYHxBO0ICoxsQd2zAAL9h2BLTgdgcXvqAZzBud4=;
 b=rs1dfOQtcid8+viq0x5geKOrM0FJQtXcsYk0IfsiWpG2Mnay/KoZ5YmCCSmaOWuqUl
 mvi3xpkAAvvnzmxdOLklTdmmRMEmdkNRItLCOqSVy4B3tCD7XDK7KRdtFUpMIcJjvWji
 vtjH37jN6MiVxhjbI5StdszvPjQUweOZojrNlnBVXxafbrE9drEbni2k7tl5D9i+3Gvb
 gdRpKpABcJ/SLHjqpc5rO5OGHzTvtAjxit3TNhK/HAr339uOtIjkcBPGOu9dHWnEAUh/
 Hqoxjg/Ynqy3WIC3QRR1IrWbmm99inTIaDLoBqbqD/L/osZgaHlB/KqG91RGTsvVRAwX
 +eEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eFFcrYHxBO0ICoxsQd2zAAL9h2BLTgdgcXvqAZzBud4=;
 b=szlx1d3w5I/sXq2r+JDopBiuAre9gNZGddI6W6N4YT7NJoG1tfNcVZLgraF+VnT1iH
 uieKN2JaAYBnLno8f6RnOKiGEghuOQtTjuMZfxdkiOKlBQzxSwTaPZ9nD6obgPmvIIom
 GUUkHdRsf4XYvzH46njh5Z/B2NZkaFRZKzm1rtXxbl/AJ4CKdhRY+xzvyrxH+qheo/GX
 2C7060qyokImpzEXxFrIvCFp3PoEIBelVujjth3cREhxkzsoYINbUqywiBkvzHwBX+FJ
 nCl7HQra1/UdfBbUF43VeSi8ahNf0u1chOnwpjPobnjWplnH/dK/ybWji3I79xn647ev
 AocQ==
X-Gm-Message-State: APjAAAWJC0R1RiGB3m3iE38rMwg01suQ1KCwnoZjzzDSVK+B3cod5O7B
 /0a5bu5Q4Q207BKd7bh6MDU=
X-Google-Smtp-Source: APXvYqw29XmpC8sqb0JY6LdkJ5f2dDZgaflAgP3pjJQ4cDGLIUc1/f1pdQbalmL+I3fmqPxAnW+PqQ==
X-Received: by 2002:a5d:640e:: with SMTP id z14mr15552221wru.311.1572279722304; 
 Mon, 28 Oct 2019 09:22:02 -0700 (PDT)
Received: from ?IPv6:::1? ([206.189.23.0])
 by smtp.gmail.com with ESMTPSA id z10sm11599071wrw.12.2019.10.28.09.22.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Oct 2019 09:22:01 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f0a30c7-911e-90ab-0875-83f3d4c454b5@suse.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Message-ID: <a2ed0638-846a-fd4a-9093-0f5026eac881@gmail.com>
Date: Mon, 28 Oct 2019 16:22:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4f0a30c7-911e-90ab-0875-83f3d4c454b5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] getting 4.11.3 ready
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNS8xMC8yMDE5IDExOjMxLCBKYW4gQmV1bGljaCB3cm90ZToKPiBBbGwsCj4gCj4g
dGhlIDQuMTEuMyBzdGFibGUgcmVsZWFzZSBpcyBkdWUuIEkgaW50ZW5kIHRvIHdhaXQgZm9yIHRo
ZSBYU0EgZml4ZXMKPiBnb2luZyBwdWJsaWMgb24gdGhlIDMxc3QsIGJ1dCBub3QgKG11Y2gpIGxv
bmdlci4gUGxlYXNlIHBvaW50IG91dAo+IGJhY2twb3J0aW5nIGNhbmRpZGF0ZXMgdGhhdCB5b3Ug
ZmluZCBtaXNzaW5nIGZyb20gdGhlIHJlc3BlY3RpdmUKPiBzdGFibGUgdHJlZXMuIEkgaGF2ZSB0
aHJlZSBvbmVzIHF1ZXVlZCB3aGljaCBoYXZlbid0IHBhc3NlZCB0aGUgcHVzaAo+IGdhdGUgdG8g
dGhlIG1hc3RlciBicmFuY2ggeWV0Ogo+IAo+IDkyNTdjMjE4ZTUJeDg2L3Z2bXg6IEZpeCB0aGUg
dXNlIG9mIFJEVFNDUCB3aGVuIGl0IGlzIGludGVyY2VwdGVkIGF0IEwwCj4gN2VlZTljMTZkNgl4
ODYvdHNjOiB1cGRhdGUgdmNwdSB0aW1lIGluZm8gb24gZ3Vlc3QgVFNDIGFkanVzdG1lbnRzCj4g
OTYzMzkyOTgyNAl4ODY6IGZpeCBvZmYtYnktb25lIGluIGlzX3hlbl9maXhlZF9tZm4oKQoKV2Ug
ZG9uJ3Qgc2VlbSB0byBoYXZlIGJhY2twb3J0ZWQgcGF0Y2hlcyBmb3IgcXVpdGUgYSB3aGlsZSBv
biBBcm0uIFNvbWUgb2YgbXkgCnBhdGNoZXMgaGF2ZSBiZWVuIG1hcmtlZCBhcyB0byBiZSBiYWNr
cG9ydGVkIGZyb20gdGhlIGJlZ2lubmluZyBbMV0uIEkgYW0gCnNwZWNpZmljYWxseSB0aGlua2lu
ZyB0bzoKCQplMDQ4MThiNDZkIHhlbi9hcm06IHRyYXBzOiBBdm9pZCB1c2luZyBCVUdfT04oKSB0
byBjaGVjayBndWVzdCBzdGF0ZSBpbiBhZHZhbmNlX3BjKCkKCkBTdGVmYW5vOiBBcmUgeW91IHN0
aWxsIHRha2luZyBjYXJlIG9mIGJhY2twb3J0IGZvciBBcm0/CgpDaGVlcnMsCgpbMV0gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA1L21z
ZzAxMzA5Lmh0bWwKCgo+IAo+IEphbgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
