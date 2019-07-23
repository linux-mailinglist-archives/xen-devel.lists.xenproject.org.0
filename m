Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F0571DDA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 19:37:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpyeX-0000Sq-2H; Tue, 23 Jul 2019 17:32:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OdSp=VU=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hpyeV-0000Sk-SU
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 17:32:40 +0000
X-Inumbo-ID: dd75a327-ad6f-11e9-8980-bc764e045a96
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dd75a327-ad6f-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 17:32:38 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m14so6049682qka.10
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2019 10:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/pswzf/K/WaA2xrwJsXKyukHc8E/4s3vV8XG1Ps84GM=;
 b=bvbdAVYhPxsFqI7WEogjveKRoBPy/94KGEAv/41u2lzEeflY+DzbHoA07HoScoDNL5
 HqCG43A7N2wywLwZf0cXyxcX5h9sYkF3xBKfqvflpALmzdPsimRN9lcxLMS9157byMUu
 +aTUesluGUxGmJS/wxpPa9FlOwZJEPXVCutPxvPSt0TP7h9MQiwfgik7c4aFapvB37mr
 ZNibCcc7U8BzV4U+9gpr4z7UMO6zu/HB+lmYTE7kzcWC2CaeO6UTEKPzQ2PexZNV5mH7
 i/SSidpvLy7oBlBAJ5/TlDumkuXgWA78jNNtKwuP7ReVhYMi3q1BsUsFAFd5ED/GxNzS
 1d8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/pswzf/K/WaA2xrwJsXKyukHc8E/4s3vV8XG1Ps84GM=;
 b=cR8Do9Y9qUlqJ42400aJo3FBlv8Ukb5Tu41TXafBRZW8lFShAEJBRCe6MxLlbqyDlB
 0x6tZUTrCD+h59ztI6e3XKo1kT7258Wu2/Af6YPu6dpUnf6chVd3VBW7cYFbgNp1PbR3
 h4o2cRm5ldx/Fdz3aqTNfLDMJ6pSz8V6FtOTmnPYxL+1rzIbtmMZr+CaH7UfgE5mXhCN
 0hWP8tIf2drKa/7035yMrKC2eTaSvo0zCZ7VDVUf7EIIGE8P4PyRPr+EZfnV78igSho5
 HdKCLXCcaY1f6MGBhWqf2Hc/vvJIMu71fr9nUdmcve8DrhluRU2MMgIFDDGjE5QBNymL
 Bi0A==
X-Gm-Message-State: APjAAAXY/oTVTpjVMSyoHMjsWPa1OypsO8Kjnr6QVC0diTmdNLD2dN40
 wx6pzAmG3nw+Tt7emCoU7QSNElpk/EX7wdt4lNkFWg==
X-Google-Smtp-Source: APXvYqye5izzyES1XEMU84yYyQozCHFBuUNeTQWWUUwJ92/VkZTGYnK045fyoOXQcsR0I0rKIuw44tpteWdwj9Vc4GI=
X-Received: by 2002:ae9:f017:: with SMTP id l23mr51256566qkg.457.1563903157555; 
 Tue, 23 Jul 2019 10:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <CAMmSBy8CcG08-+-F6fvwmH1oEKpsV8OGEco94g04dZcyyFWKbw@mail.gmail.com>
 <b2e4ed0b178e41ebbc8f1db622ecae95@AMSPEX02CL03.citrite.net>
 <20190722114859.dtm4w5ff75uedu24@Air-de-Roger>
 <9238bf1a297c42f38dccc1cfb50bd144@AMSPEX02CL03.citrite.net>
 <20190722134813.c7fedaqtrbo6ojvo@Air-de-Roger>
 <81a7cdc728294e5ca05fd056a87cb21b@AMSPEX02CL03.citrite.net>
 <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
 <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
 <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
In-Reply-To: <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 23 Jul 2019 10:32:26 -0700
Message-ID: <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="0000000000002b8d4f058e5c94a5"
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000002b8d4f058e5c94a5
Content-Type: text/plain; charset="UTF-8"

Hi Roger!

I applied your patch, removed no-igfx and I still see the original
problem. Please let me know what other logs/debugs would you need at
this point.

Btw, just to make it clear what patch got applied I'm attaching it to
this email.

Oh, and it seems that that https://downloads.xenproject.org/ SSL
certificate expired yesterday -- perhaps somebody can take a look at
that.

Thanks,
Roman.

On Mon, Jul 22, 2019 at 4:47 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 23/07/2019 00:36, Roman Shaposhnik wrote:
> > Hi Everyone!
> >
> > Thanks a million for an extremely quick turnaround. I am in my lab
> > again next to the box in question.
> >
> > Should I go ahead and test the latest patch or wait for the official
> > one to be submitted?
> >
> > Thanks,
> > Roman.
>
> Use this patch to test with.  Roger forgot to CC you on the official
> one, but the code changes are identical.
>
> ~Andrew

--0000000000002b8d4f058e5c94a5
Content-Type: application/octet-stream; name="01-iommu-mappings.patch"
Content-Disposition: attachment; filename="01-iommu-mappings.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jyg3jmmq0>
X-Attachment-Id: f_jyg3jmmq0

ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0u
YwppbmRleCBmZWY5N2M4MmY2Li44OGEyNDMwYzhjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
bW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC04MzYsNyArODM2LDcgQEAg
Z3Vlc3RfcGh5c21hcF9hZGRfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIG1mbl90
IAptZm4sCiAgICAgICAgICAqLwogICAgICAgICBmb3IgKCBpID0gMDsgaSA8ICgxVUwgPDwgcGFn
ZV9vcmRlcik7ICsraSwgKytwYWdlICkKICAgICAgICAgewotICAgICAgICAgICAgaWYgKCAhbmVl
ZF9pb21tdV9wdF9zeW5jKGQpICkKKyAgICAgICAgICAgIGlmICggIWhhc19pb21tdV9wdChkKSAp
CiAgICAgICAgICAgICAgICAgLyogbm90aGluZyAqLzsKICAgICAgICAgICAgIGVsc2UgaWYgKCBn
ZXRfcGFnZV9hbmRfdHlwZShwYWdlLCBkLCBQR1Rfd3JpdGFibGVfcGFnZSkgKQogICAgICAgICAg
ICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UpOwpAQCAtMTM0MSw3ICsxMzQxLDcgQEAgaW50
IHNldF9pZGVudGl0eV9wMm1fZW50cnkoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgCmxvbmcg
Z2ZuX2wsCiAKICAgICBpZiAoICFwYWdpbmdfbW9kZV90cmFuc2xhdGUocDJtLT5kb21haW4pICkK
ICAgICB7Ci0gICAgICAgIGlmICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSApCisgICAgICAgIGlm
ICggIWhhc19pb21tdV9wdChkKSApCiAgICAgICAgICAgICByZXR1cm4gMDsKICAgICAgICAgcmV0
dXJuIGlvbW11X2xlZ2FjeV9tYXAoZCwgX2RmbihnZm5fbCksIF9tZm4oZ2ZuX2wpLCBQQUdFX09S
REVSXzRLLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVUZfcmVhZGFibGUg
fCBJT01NVUZfd3JpdGFibGUpOwpAQCAtMTQzMiw3ICsxNDMyLDcgQEAgaW50IGNsZWFyX2lkZW50
aXR5X3AybV9lbnRyeShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCAKbG9uZyBnZm5fbCkKIAog
ICAgIGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSApCiAgICAgewotICAgICAgICBpZiAo
ICFuZWVkX2lvbW11X3B0X3N5bmMoZCkgKQorICAgICAgICBpZiAoICFoYXNfaW9tbXVfcHQoZCkg
KQogICAgICAgICAgICAgcmV0dXJuIDA7CiAgICAgICAgIHJldHVybiBpb21tdV9sZWdhY3lfdW5t
YXAoZCwgX2RmbihnZm5fbCksIFBBR0VfT1JERVJfNEspOwogICAgIH0KLS0gCjIuMjAuMSAoQXBw
bGUgR2l0LTExNykK
--0000000000002b8d4f058e5c94a5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--0000000000002b8d4f058e5c94a5--

