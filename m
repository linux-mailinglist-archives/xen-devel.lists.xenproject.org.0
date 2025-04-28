Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4128FA9F561
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 18:15:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970912.1359457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9R8Q-0008PD-4D; Mon, 28 Apr 2025 16:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970912.1359457; Mon, 28 Apr 2025 16:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9R8Q-0008N0-1W; Mon, 28 Apr 2025 16:15:10 +0000
Received: by outflank-mailman (input) for mailman id 970912;
 Mon, 28 Apr 2025 16:15:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pDhf=XO=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1u9R8O-0008Mu-OH
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 16:15:08 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0f13d50-244b-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 18:15:03 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5f62d3ed994so9098684a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 09:15:03 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7035464e6sm6023046a12.64.2025.04.28.09.15.02
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 09:15:02 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5e6c18e2c7dso9568041a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 09:15:02 -0700 (PDT)
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
X-Inumbo-ID: f0f13d50-244b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745856903; x=1746461703; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AF1KZ463/zoTgYMZNz+2yImgi273kMcd/qUiFYdEgdw=;
        b=bg9gmzjLIjMX7NwabE3tnttbelxiNv4XIvlxQiiOfKdgilC+HP43Y4tdUWHyanFx0C
         +5u933jVvS/WTx/fxO/jFcQWt0X7p3RcwWQi8xA0UnWiBXesPS6fRKfeBXTVqvXNq/DX
         h5gaADbadpTFO86V2xC+MY/6YOs4G+koCZrQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856903; x=1746461703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AF1KZ463/zoTgYMZNz+2yImgi273kMcd/qUiFYdEgdw=;
        b=WFkvpzUmVcZbxUYPfJmORocgp5wsIhOCr4NwWyF8IC8mLp4UsWz+wzGHOsWRil73In
         lRrw48H5iEmCt8AoQS3UvtqbGcsRLHKOQ9OqqQz6TUQt4ovfLJKB3bvm1ZG+mQu+pQqd
         TqhCGuI4asEdyQN5pT0H7kZlZ44f6ODhFXV3GH66CR0BSS27cQyNXmuD5vjsXlq6P1H8
         lvnVGkwbOP3ClMy2qimuSpOpGdZ3ljj6k8D+pI7pkohR9efUj6KYbcW/JeUcoaprH9nj
         9NrvXt2dbeO6rBnz1rbEz8YhjrKeaY9U7FQBroM36vL8KVNhzUUiavJkpb8eiZzPTcB2
         2zxw==
X-Forwarded-Encrypted: i=1; AJvYcCW102zFnrgaSoZ1/UuGG+/VgVzmCiYx/jvUmNFZMM4rbRxUFbitZy+rtfzIiN72c8kckSoGhiIb2IE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBTVM2+ggwPws7HM+/WqY74Qepp5yi3qwzfIYy/TsXXDmkWvrw
	s5yKcZB8XaZDY298dcgjA7X+EyoV92gUlmWdKF/bs8E7T/rfjukCqscbO4sQwh/BG3J2epyQ0jx
	/eWQ=
X-Gm-Gg: ASbGncvRBdRCRG/DA+q76VnV9rN4xxqVwCne6h8S47PoDWPiU+C67lpOiMLxlks8E7y
	1jLQtIcY5mZbv7mSlgcCsebRiQ/JuVKdNkBqfRetPg41GKHRIVNwgqwRuZ3DeHAmPIzS37BZU3w
	8mQU42oFMPnqWVyLXze8idz7qsto1Md6pn0EL5z2PEae1V7VEvegkMUPtACC1+iPWFhukgUKVaz
	1X6AzuGDF3s6a1J7WEQB08iMTMv3v7OCIUH0QJ6EmNZmozWP3g/PeoCMHMy/nYeOAwjnQ6q7Iqb
	XjUVYv3q9ieLI4hPo2EaaVSx6ANcF/oU8vVKY2swiaT6Bv5R/EkcpKW6BvyuNzkKjSga8fX8DH7
	qCuXQWy0uRe0zAp8=
X-Google-Smtp-Source: AGHT+IEBTP6c/98Gzm4U+uAdj8cxwwHiIRmmwVnXITAlgjdP6lDB1lTzseXsK8xpEJ40zKDWIZ26Qg==
X-Received: by 2002:a05:6402:35cc:b0:5e7:b081:7870 with SMTP id 4fb4d7f45d1cf-5f72278deb5mr10140883a12.9.1745856902710;
        Mon, 28 Apr 2025 09:15:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+87oI8xdG/LxhZA9u5eRmJZli1PjV7gyNYQptYldde6y7BeDbNSFlsIONHr63njLG5IoZhLEHaK8=@lists.xenproject.org
X-Received: by 2002:a17:906:9fd1:b0:ace:3a3d:7e35 with SMTP id
 a640c23a62f3a-ace713deef8mr1136725066b.53.1745856902085; Mon, 28 Apr 2025
 09:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com>
In-Reply-To: <aA8oqKUaFU-0wb-D@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Apr 2025 09:14:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
X-Gm-Features: ATxdqUGS9kvWc-L4SzJnxgACgdDJk4h_LSvRVKtfYkcRU-1jXGpVN9caYxF5bEk
Message-ID: <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
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

On Mon, 28 Apr 2025 at 00:05, Ingo Molnar <mingo@kernel.org> wrote:
>
> And once we remove 486, I think we can do the optimization below to
> just assume the output doesn't get clobbered by BS*L in the zero-case,
> right?

We probably can't, because who knows what "Pentium" CPU's are out there.

Or even if Pentium really does get it right. I doubt we have any
developers with an original Pentium around.

So just leave the "we don't know what the CPU result is for zero"
unless we get some kind of official confirmation.

          Linus

