Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A471E1B41D
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 12:32:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ8D3-0003kc-8a; Mon, 13 May 2019 10:29:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aHtp=TN=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hQ8D1-0003js-IX
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 10:29:27 +0000
X-Inumbo-ID: fa91ed4c-7569-11e9-8980-bc764e045a96
Received: from mail-it1-x12e.google.com (unknown [2607:f8b0:4864:20::12e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fa91ed4c-7569-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 10:29:25 +0000 (UTC)
Received: by mail-it1-x12e.google.com with SMTP id u186so19462260ith.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2019 03:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AqrTNwYOEollCx3yBSnzivy28K7vu4EUF2aaiFXtH/M=;
 b=usoB+oe0AcUdxRmMT1/ZjdGeTRbvY1sOAJ953rgdEEV5gn2cwwNWooLllWX4Oi6ujp
 VnpmV7i5o1KiCfEuUXU4uRUfCHWbG5q9kb02co1b4qWuHzX7kmsE61nGvfi26HG0hQA5
 Ftr4JXVaeTaEEJRrGsWQiz7WazBd3/MBWVxK3GiO7bL9tYwk3wK3KqiAuN83+SZKpHS9
 BbUvyZR1MJXgm06cX9alvveM1SI2iPUfX3x+yKOAgpib78au2iF086x8l8ypqSCSNMjx
 zyvZQO10QHIbRO7FXfEJXWjr2LKSeylWRXP8KdC5OE2E0LtN2IIzfdVSUnwm7iznrwb9
 XKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AqrTNwYOEollCx3yBSnzivy28K7vu4EUF2aaiFXtH/M=;
 b=ri4jl2sWdZ1b/UXW1LNcCZn7sb2cx0we+ysiUP8SteA5j1bSME0hjGng/Fc6yFj47f
 In2ixPgkJ1VP+kjnX405AR2SRMWnsuGxn1QO8uExBN0ddGRClfST5Ua4DhZS/RsF7xah
 wa5hmrGt7NAeySYuUMm23VSlPatLy+wceE/2mK77wAMHw+kxAuk+eGF4gzxuavoLfWmn
 D0jT571ubuxOUj4zMcTGRdeesFvCqSRaNT6+rNkO4LZMzKGjCetVqnxIkoQAwQsyOMUI
 0GliJ7cFDXGnHl5AAt+W7iccefxYOcK5reyco5n0Mfg/jzYw15mtKkJI+0TY0Y1ldBg3
 IpFw==
X-Gm-Message-State: APjAAAXoILOC/e1QahAj/6azjgqHDJlQuBQoDWJDpM/gA5qTVXA54B0F
 ZxBDOu2Rkl3LfLMuI5VdaP1fqQh8M1RhL41e0hU=
X-Google-Smtp-Source: APXvYqw3E2dmo0U2hWqJAZq+fyVnboUDHt31fNINba+onocxnZDBRcjGreP12VBFJXOQMWiuDNjqOi1pKrlslvPu9UY=
X-Received: by 2002:a24:3943:: with SMTP id l64mr17368188ita.92.1557743364442; 
 Mon, 13 May 2019 03:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
 <CAOcoXZY6jpPKcWTXPqz0sr=Amw7J0KSaBRWiRnQRgTC2XR=hjQ@mail.gmail.com>
 <f95ad35b-42f6-4df2-cade-7a8115f9e49a@arm.com>
 <CAOcoXZaMLfHSyLSE04xRFZZY0hLkFcJ5cBqHTdmwDoqwcreD1w@mail.gmail.com>
 <ff543e3c-0619-5aa6-b36a-e1a8b8cce886@arm.com>
 <20190503110819.GA5900@zion.uk.xensource.com>
 <63ea8905-87ca-a419-95bf-ae497bf1ff85@arm.com>
 <20190503134133.GC5900@zion.uk.xensource.com>
 <b0947b60-d89a-54a5-a11b-708b64ff8053@arm.com>
 <20190503141952.GD5900@zion.uk.xensource.com>
 <CAOcoXZZau01-5Tmab9eCcYKJavzrT_9KdNa_dR+QN5zKmmXMoA@mail.gmail.com>
 <4fb5058d-9810-7a1b-91f4-db31bad82a85@arm.com>
In-Reply-To: <4fb5058d-9810-7a1b-91f4-db31bad82a85@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Mon, 13 May 2019 13:29:12 +0300
Message-ID: <CAOcoXZbDdX3rXL+nzEwUCT47UUbCDqJPZ7SP-dYn9SYdkm=isg@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] Xen GCC coverage ARM64 testing - Unexpected Trap:
 Data Abort
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
 Wei Liu <wei.liu2@citrix.com>, Andrii_Anisov@epam.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IGFhcmNoNjQtcG9reS1saW51eC1nY2MgICAtREJVSUxEX0lEIC1mbm8tc3RyaWN0LWFsaWFz
aW5nIC1zdGQ9Z251OTkKPiA+IC1XYWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdkZWNsYXJhdGlv
bi1hZnRlci1zdGF0ZW1lbnQKPiA+IC1Xbm8tdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgLVduby11
bnVzZWQtbG9jYWwtdHlwZWRlZnMgICAtTzIKPiA+IC1mb21pdC1mcmFtZS1wb2ludGVyCj4gPiAt
RF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX189X19YRU5fTEFURVNUX0lOVEVSRkFDRV9WRVJTSU9O
X18gLU1NRCAtTUYKPiA+IC5oYW5kbGVyZWcuby5kIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFS
R0VGSUxFNjRfU09VUkNFICAgLVdlcnJvcgo+ID4gLVdtaXNzaW5nLXByb3RvdHlwZXMgLUkuL2lu
Y2x1ZGUKPiA+IC1JL2hvbWUvYy93L3JjYXJfaDNfdWJ1bnR1MTYwNF95b2N0by9idWlsZC90bXAv
d29yay9hYXJjaDY0LXBva3ktbGludXgveGVuLzQuMTIuMC4wK2dpdEFVVE9JTkMrZmQyYTM0Yzk2
NS1yMC9naXQvdG9vbHMvbGlicy90b29sY29yZS8uLi8uLi8uLi90b29scy9pbmNsdWRlCj4gPiAg
IC1jIC1vIGhhbmRsZXJlZy5vIGhhbmRsZXJlZy5jCj4KPiAuLi4gdGhpcyBsb29rcyBsaWtlIGEg
dG9vbCBidWlsZGluZyBlcnJvciB3aGVuIEkgb25seSB0b3VjaCB0aGUKPiBoeXBlcnZpc29yIHBh
cnQuIEFyZSB5b3UgY2VydGFpbiB0aGlzIGlzIG15IHBhdGNoIGFuZCBub3QgYW5vdGhlciBlcnJv
cgo+IGluIFhlbiA0LjEyIChvciBhbnkgcGF0Y2ggeW91IGhhdmUgb24gdG9wKT8KCkp1bGllbiwg
eW91IGFyZSByaWdodCwgaXQgd2FzIGxvY2FsIGVudmlyb25tZW50IGJ1aWxkIGlzc3VlIChzb3Jy
eSBmb3IgdGhhdCkuClhlbiBHQ0MgY292ZXJhZ2UgZmVhdHVyZSB3b3JrcyB3ZWxsIHdpdGggQWFy
Y2g2NCB3aXRoIHRoaXMgcGF0Y2guCkNoZWNrZWQgYm90aCBjb21tYW5kcywgeGVuY292IHJlYWQg
YW5kIHhlbmNvdiByZXNldCAtIGJvdGggd29yayB3ZWxsCihubyBjcmFzaGVzIGFueW1vcmUpLgoK
UGxlYXNlIGFsc28gbm90ZSB0aGF0IHVzZSBjYXNlIG1lbnRpb25lZCBpbiBYZW4gZG9jdW1lbnRh
dGlvbgooeGVuY292X3NwbGl0KSBpcyBhbHNvIG9rIHdpdGggZ2VuZXJhdGVkIGNvdmVyYWdlLmRh
dCBpbnB1dDoKeGVuLmdpdC94ZW4kIHNzaCByb290QGhvc3QgeGVuY292IHJlYWQgPiBjb3ZlcmFn
ZS5kYXQKeGVuLmdpdC94ZW4kIC4uL3Rvb2xzL3hlbmNvdl9zcGxpdCBjb3ZlcmFnZS5kYXQgLS1v
dXRwdXQtZGlyPS8KeGVuLmdpdC94ZW4kIGdlbmluZm8gLiAtbyBjb3YuaW5mbwp4ZW4uZ2l0L3hl
biQgZ2VuaHRtbCBjb3YuaW5mbyAtbyBjb3YvCnhlbi5naXQveGVuJCAkQlJPV1NFUiBjb3YvaW5k
ZXguaHRtbAoKLS0tLS0tLS0KTWlub3Igb2JzZXJ2YXRpb24gYWJvdXQgY292ZXJhZ2UgYnVpbGQg
cHJvY2VkdXJlLiBEb2N1bWVudGF0aW9uIHN0YXRlczoKIlRvIGJ1aWxkIHdpdGggY292ZXJhZ2Ug
c3VwcG9ydCwgZW5hYmxlIENPTkZJR19DT1ZFUkFHRSBpbiBLY29uZmlnLiIKSG93ZXZlciwgdG8g
YnVpbGQgaXQgcHJvcGVybHksIGl0IG5lZWRzIHRvIGVuYWJsZSBjb3ZlcmFnZSBmZWF0dXJlIGlu
CnR3byBwbGFjZXMgLSBtYWluIHhlbiBtYWtlIGNvbW1hbmQgbGluZSBhbmQgaHlwZXJ2aXNvciAu
Y29uZmlnIGZpbGUuCklzIGl0IGV4cGVjdGVkIHdheSB0byBidWlsZCB4ZW4gd2l0aCBjb3ZlcmFn
ZSBmZWF0dXJlPyBJZiB5ZXMsCnByb2JhYmx5IHdlIHNob3VsZCBpbXByb3ZlIChvciBhdCBsZWFz
dCBkb2N1bWVudCkgaXQgc29tZSBkYXkuLi4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
