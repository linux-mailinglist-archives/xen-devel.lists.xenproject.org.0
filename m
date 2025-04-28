Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FACBA9F5B3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 18:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970930.1359466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9RH6-0001pE-U7; Mon, 28 Apr 2025 16:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970930.1359466; Mon, 28 Apr 2025 16:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9RH6-0001mf-RH; Mon, 28 Apr 2025 16:24:08 +0000
Received: by outflank-mailman (input) for mailman id 970930;
 Mon, 28 Apr 2025 16:24:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pDhf=XO=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1u9RH5-0001mZ-Vq
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 16:24:08 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33dd549d-244d-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 18:24:05 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-acbb48bad09so927657666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 09:24:05 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e41c736sm660697366b.12.2025.04.28.09.24.02
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 09:24:02 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ac289147833so887616666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 09:24:02 -0700 (PDT)
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
X-Inumbo-ID: 33dd549d-244d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745857444; x=1746462244; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+Gzk3UbpCetRBDPUBxjg4HZ9NaakRevcBnLrmR9rpY=;
        b=CNyo7fhR6uVknFgAYDQAYuqPTMO4u7X63RzVihsnLZvvjxadSyzy5VENsO2ocWqs4f
         KsxAWa/+u025pnDGaR/QaqKyMEN7Q9QI6eVY5NhC7C6k40FCr5rgSEUmH/+O2FafrDxS
         K++0QHDCxbuYKQp75+WEzPnQPbcL9SXQAQ9p8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857444; x=1746462244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+Gzk3UbpCetRBDPUBxjg4HZ9NaakRevcBnLrmR9rpY=;
        b=G/VC/Xxis20IqyZYYI8GmaJFjzutBaXD1Q6xnfyadLMD+YuI+7y9CaOWgU/ViK3P43
         ynNQ2QNHXkTFzuxHbq3E+EOTXSgIf13RRQxe1w07IsO3gE38JW1ptO17VX/sFIrDatDO
         me05pGewV73mNZC6Hlolkj60OmAcdOP5kKOSI76C5S/MStzX4en19/faPUAjIYC32TaC
         XyZ1tAT2NSZV4TUpvnvh/7r8X/w4JnM2Kj4pJHPMpxUnwbyNWYky+UPVWcEK1OeSf3m3
         E24O45LDN7JOWaWBUVNQZ/GGh4YVgZSe9hWpsNa4PVYUcLijApeu5FOY+8MVaaJz0DBC
         oihw==
X-Forwarded-Encrypted: i=1; AJvYcCWkfHcUTYiJythuqUW2srftAgMOHrSo7FlYSiftiOMQWBR/gEUGQLe1uKlE0wzdMRGNFLQp1g3UMX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7Z8XeQzWmEIStPlxpZ0PgA3aYSfr/mJHtn1I3lc5tLnUDWjy7
	gJeU8l+i9VmSYNgnQNOvTxkB5JmnwcJEqBP6Jx4Zo7QHtgFmRwg+JwUZASNi5g/GNKTJ6Ms7igO
	D2BCHLQ==
X-Gm-Gg: ASbGncsFhazc5vyPB4sMSXluN9tUktEJn4VOyqJaxVMnk5hCStwsdvQdjDCZCmqohN9
	nCKxF7+m0uQOe2CVx8s+ff6Ql6X6tYzba269i/YlFB0QvrHxWRoL5Lm8lC8k/hgDq2usuVdTbbD
	PDootzN/7AVSXgj9He7R8FiBipqWorBNVzlpLeSDg4GSEwP4OyQpds1L73JmlqLt//3vSTFSrPM
	HVsNtDGC/Sr4Yh8yE07nJ+AgsK5Cf/8CNtonmKw7fncW0PTbsDzUIUWEGOemDOOM4GzhtT9hgvn
	/QF1SsFSDaeusYNzvmR0cM7Iw3FdJWbNEou0LkDg0mjbWtNVMu9VbrAN7MiSzv/Ta1bbJyB1cLb
	IC79hua70MJ7fuwc=
X-Google-Smtp-Source: AGHT+IEV8JaDwL18uIZZH0aUn4tNrbTxjwIXewo/wmOFPKX3/Ih3zvsh98+4Q49ZNoNuAF+GX/QyIA==
X-Received: by 2002:a17:907:97c7:b0:ace:4ed4:d428 with SMTP id a640c23a62f3a-ace84b3b270mr967276066b.57.1745857444280;
        Mon, 28 Apr 2025 09:24:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlSja1020Hgkg3cgrzTp5ACVmZzT0Z28fJhffGc3ZTR4Z8oj/3J1IAIe31IWvcm1lLBfSGNocyi64=@lists.xenproject.org
X-Received: by 2002:a17:907:608c:b0:ac3:3f11:b49d with SMTP id
 a640c23a62f3a-ace84618fafmr831890066b.0.1745857442337; Mon, 28 Apr 2025
 09:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <aA8q4Ot-1zTzv_Kt@gmail.com>
In-Reply-To: <aA8q4Ot-1zTzv_Kt@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Apr 2025 09:23:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh5DUS+nhfTxPEEbaB9dsFib39gWatrX4NoFq_MpdOzGw@mail.gmail.com>
X-Gm-Features: ATxdqUEOHobK07xK1eZcXrNUILKYEsYxFZLSsdb8bVPG3MlGNjXDMTRVJr7bMKY
Message-ID: <CAHk-=wh5DUS+nhfTxPEEbaB9dsFib39gWatrX4NoFq_MpdOzGw@mail.gmail.com>
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: Ingo Molnar <mingo@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Arnd Bergmann <arnd@arndb.de>, 
	Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 00:14, Ingo Molnar <mingo@kernel.org> wrote:
>
> And, just out of intellectual curiosity, I also tried to measure the
> code generation price of the +1 standards-quirk in the fls()/ffs()
> interface as well:
>
> ... and unless I messed up the patch, it seems to have a surprisingly
> low impact - maybe because the compiler can amortize its cost by
> adjusting all dependent code mostly at build time, so the +1 doesn't
> end up being generated most of the time?

No, I think one issue is that most users actually end up subtracting
one from the return value of 'ffs()', because the "bit #0 returns 1"
semantics of the standard ffs() function really is insane.

It's not just that it doesn't match sane hardware, it's also that it
doesn't match sane *users*. If bit #0 is set, people want '0', so they
typically subtract 1.

So when you stop adding one, you aren't actually removing code -
you're often adding it.

Just see how many hits you get from

    git grep '\<ffs(.*).*-.*1'

which is obviously not a very precise pattern, but just look at the
output and see just *how* common that "subtract one" thing is.

I really don't understand how anybody *ever* thought that the whole
"return one bigger" was a good idea for ffs().

Sure, I understand that zero is special and needs a special return
value, but returning a negative value would have been pretty simple
(or just do what our bitops finding functions do, which is to return
past the end, which is often convenient but does tend to make the
error condition check a bit more complex).

Anyway, the fact that so many users subtract one means that your "look
at the size of the binary" model doesn't work. You're counting both
the wins (when that addition doesn't happen) and the losses (when the
"subtract one in the user" happens).

So the "+1" doesn't cause much code generation - as long as it's done
by the compiler that can also undo it - but it's just a horrid user
interface.

But maybe people really were poisoned by the Pascal mindset. Or maybe
it was invented by some ancient Roman who hadn't heard of the concept
of zero. Who knows?

               Linus

