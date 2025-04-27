Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953B0A9E47E
	for <lists+xen-devel@lfdr.de>; Sun, 27 Apr 2025 21:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969930.1358780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u97mT-0007yn-A7; Sun, 27 Apr 2025 19:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969930.1358780; Sun, 27 Apr 2025 19:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u97mT-0007wc-6w; Sun, 27 Apr 2025 19:35:13 +0000
Received: by outflank-mailman (input) for mailman id 969930;
 Sun, 27 Apr 2025 19:35:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yb2U=XN=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1u97mR-0007wW-Be
 for xen-devel@lists.xenproject.org; Sun, 27 Apr 2025 19:35:11 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b999a301-239e-11f0-9eb4-5ba50f476ded;
 Sun, 27 Apr 2025 21:35:07 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e5c7d6b96fso7773683a12.3
 for <xen-devel@lists.xenproject.org>; Sun, 27 Apr 2025 12:35:07 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7011fc469sm4529449a12.7.2025.04.27.12.35.03
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Apr 2025 12:35:03 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ac2ab99e16eso870838366b.0
 for <xen-devel@lists.xenproject.org>; Sun, 27 Apr 2025 12:35:03 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b999a301-239e-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745782507; x=1746387307; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5rN1yxa+VmayTbEeOUM6CUkhiAacZjPAguEXDsRJf1s=;
        b=dlg5nB/XfgzVooDLOKfNEEQBwm68blxl2y06bWoXmKvuPBcwpk7daSIzzh6UeK2lUR
         WBQP2I7V681mnjtzeBlOlg7bIyurwWr5G/SZzg//TwQHlHzskiYjR7lQnY+p1wDkiY57
         CBwcdnxkbXcJVaWQLQGCINh2hSCiM3B+aqBXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745782507; x=1746387307;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rN1yxa+VmayTbEeOUM6CUkhiAacZjPAguEXDsRJf1s=;
        b=p8BX6oME7hWDD3H8nyHHdXOPOP/cLeaxpIA92cZB8CgaXTMjmeZfkS2eS9IYQg7XBR
         JGkKm70+Z4vnVnefEeR4zeAy2/eMI35VgZd5LiHuMXakEOB9hLVI43L/f1NaFk6e2vck
         NnENgggVcBwz+YCFSQZZGHcbfWfKNbP2OLkkLc4C/FJrkKHCARAXmJh8Z1SrZKOWqAoL
         pvom8KswtbzUKbm8bQgpC8LkbfLxPRGZ3ypVT8zNOZzZjaQ2obp0MYBCu0LeUl9qQHtn
         8BLZlK1w2GmZdxmG/6t5sNQmuMxe+TM3AXVUekCljFLN9N9bZ1lEx6S2Sw8IPKiw4xlJ
         wNtg==
X-Forwarded-Encrypted: i=1; AJvYcCWhf6uH24/6t8+PgTY30TR9um5sXfSqh12PPmow/kuHipVjOGzlYdbXxu7eV4fqkVvuxFvPy0AbBSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1nLCpHnmpJCpM7/Mgy1lR5sWFsfOqyPKBWju4GtOWmHT1vjih
	ZqBwGV0nBPYJmq7Rz6CdnegGLZrOXDcle7Fzy9AfLSYIhDcX9zpY5m+4nDGDiEI4KvuXgFHFpoI
	xlc1lSA==
X-Gm-Gg: ASbGnctq/Ix0IBzK+2t+TzAWxj5XTD7L8CC5STSeJ+vJaFMLy2/wx9xZ9aXy/NQ4xC5
	a+rXX77hduH2sJzqYancuhY3/FHHCdi2hnpS6WFJBP3Ec2aB2FEhkROz+xLXyVD1hGgW0BJfePh
	UWeNm147oP4f8QAqh/ioto+PdhCZ/R7JyzzL0lQy1E9tp6ZGKdmU4uuwV9HkyOkTGhnG3gFsFDf
	fh9lBSTHKKJJAitaj0gHpurg1YTkzF5tu0umpY5VFC4qQYtP/SvscvMuCWIngtOFkU6/smebbz8
	Q4Y46gK1N1+kLWl4/ZsCXPq2LLXj209F+Y9YuB3MyuaMbnkndQfX+A6ow+7ln+VQORq/aSy2hW4
	rLeEhQmgx0QzaQyY=
X-Google-Smtp-Source: AGHT+IFSMVc2z4iqSY0FBMF1TcF2YZ3vDGsx2bbXrjPQ60FK/WDDeStPAfqIIaoxgQzHNOzpFw8c8Q==
X-Received: by 2002:a05:6402:5004:b0:5f4:d5c7:d6f7 with SMTP id 4fb4d7f45d1cf-5f72267b590mr6855576a12.8.1745782506795;
        Sun, 27 Apr 2025 12:35:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrB26mJZMk52JtQqhbupcvPiWU8PvSQkQ4mWzFHitsxO0/sohFBSC8K86ZS7QBbI7dfvzaZHyxE4s=@lists.xenproject.org
X-Received: by 2002:a17:907:7255:b0:ace:3be2:bde6 with SMTP id
 a640c23a62f3a-ace713ab817mr839196166b.56.1745782502956; Sun, 27 Apr 2025
 12:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com> <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
In-Reply-To: <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Apr 2025 12:34:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
X-Gm-Features: ATxdqUG0Iakpe0wsIdSBOIf6OimwvL9XYTZUODPdBy5LQnvL_Hn8VAMvhzggDyc
Message-ID: <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="000000000000f1ea350633c7a98d"

--000000000000f1ea350633c7a98d
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Apr 2025 at 12:17, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> ffs/fls are commonly found inside loops where x is the loop condition
> too.  Therefore, using statically_true() to provide a form without the
> zero compatibility turns out to be a win.

We already have the version without the zero capability - it's just
called "__ffs()" and "__fls()", and performance-critical code uses
those.

So fls/ffs are the "standard" library functions that have to handle
zero, and add that stupid "+1" because that interface was designed by
some Pascal person who doesn't understand that we start counting from
0.

Standards bodies: "companies aren't sending their best people".

But it's silly that we then spend effort on magic cmov in inline asm
on those things when it's literally the "don't use this version unless
you don't actually care about performance" case.

I don't think it would be wrong to just make the x86-32 code just do
the check against zero ahead of time - in C.

And yes, that will generate some extra code - you'll test for zero
before, and then the caller might also test for a zero result that
then results in another test for zero that can't actually happen (but
the compiler doesn't know that). But I suspect that on the whole, it
is likely to generate better code anyway just because the compiler
sees that first test and can DTRT.

UNTESTED patch applied in case somebody wants to play with this. It
removes 10 lines of silly code, and along with them that 'cmov' use.

Anybody?

              Linus

--000000000000f1ea350633c7a98d
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_ma01tdqy0>
X-Attachment-Id: f_ma01tdqy0

IGFyY2gveDg2L2luY2x1ZGUvYXNtL2JpdG9wcy5oIHwgMjIgKysrKysrLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vYml0b3BzLmggYi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9iaXRvcHMuaAppbmRleCAxMDA0MTNhZmY2NDAuLjYwNjFjODdmMTRhYyAxMDA2NDQKLS0t
IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vYml0b3BzLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9h
c20vYml0b3BzLmgKQEAgLTMyMSwxNSArMzIxLDEwIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUg
aW50IHZhcmlhYmxlX2ZmcyhpbnQgeCkKIAlhc20oImJzZmwgJTEsJTAiCiAJICAgIDogIj1yIiAo
cikKIAkgICAgOiBBU01fSU5QVVRfUk0gKHgpLCAiMCIgKC0xKSk7Ci0jZWxpZiBkZWZpbmVkKENP
TkZJR19YODZfQ01PVikKLQlhc20oImJzZmwgJTEsJTBcblx0IgotCSAgICAiY21vdnpsICUyLCUw
IgotCSAgICA6ICI9JnIiIChyKSA6ICJybSIgKHgpLCAiciIgKC0xKSk7CiAjZWxzZQotCWFzbSgi
YnNmbCAlMSwlMFxuXHQiCi0JICAgICJqbnogMWZcblx0IgotCSAgICAibW92bCAkLTEsJTBcbiIK
LQkgICAgIjE6IiA6ICI9ciIgKHIpIDogInJtIiAoeCkpOworCWlmICgheCkKKwkJcmV0dXJuIDA7
CisJYXNtKCJic2ZsICUxLCUwIiA6ICI9ciIgKHIpIDogInJtIiAoeCkpOwogI2VuZGlmCiAJcmV0
dXJuIHIgKyAxOwogfQpAQCAtMzc4LDE1ICszNzMsMTAgQEAgc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSBpbnQgZmxzKHVuc2lnbmVkIGludCB4KQogCWFzbSgiYnNybCAlMSwlMCIKIAkgICAgOiAiPXIi
IChyKQogCSAgICA6IEFTTV9JTlBVVF9STSAoeCksICIwIiAoLTEpKTsKLSNlbGlmIGRlZmluZWQo
Q09ORklHX1g4Nl9DTU9WKQotCWFzbSgiYnNybCAlMSwlMFxuXHQiCi0JICAgICJjbW92emwgJTIs
JTAiCi0JICAgIDogIj0mciIgKHIpIDogInJtIiAoeCksICJybSIgKC0xKSk7CiAjZWxzZQotCWFz
bSgiYnNybCAlMSwlMFxuXHQiCi0JICAgICJqbnogMWZcblx0IgotCSAgICAibW92bCAkLTEsJTBc
biIKLQkgICAgIjE6IiA6ICI9ciIgKHIpIDogInJtIiAoeCkpOworCWlmICgheCkKKwkJcmV0dXJu
IDA7CisJYXNtKCJic3JsICUxLCUwIiA6ICI9ciIgKHIpIDogInJtIiAoeCkpOwogI2VuZGlmCiAJ
cmV0dXJuIHIgKyAxOwogfQo=
--000000000000f1ea350633c7a98d--

