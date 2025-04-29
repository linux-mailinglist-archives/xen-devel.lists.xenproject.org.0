Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB2A9FFCA
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 04:29:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971374.1359810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9ai2-0006k4-81; Tue, 29 Apr 2025 02:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971374.1359810; Tue, 29 Apr 2025 02:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9ai2-0006gy-5P; Tue, 29 Apr 2025 02:28:34 +0000
Received: by outflank-mailman (input) for mailman id 971374;
 Tue, 29 Apr 2025 02:28:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc0E=XP=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1u9ai0-0006gs-NZ
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 02:28:32 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3de6a93-24a1-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 04:28:30 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac289147833so976873066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 19:28:30 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecf9a17sm715045766b.99.2025.04.28.19.28.29
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 19:28:29 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5eb92df4fcbso10538749a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 19:28:29 -0700 (PDT)
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
X-Inumbo-ID: a3de6a93-24a1-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745893710; x=1746498510; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OnBKvw2kgpkCx0VRoBE8FRrW9svaRVFdZx7JKWWKbs4=;
        b=HjbktJYKai1Tl0y592BbG2PdQHyv9L7Uj0rmL2SkZvadCCza3iJrlzuHnpKn28og8F
         axBkcrc5PbOBMCFiQiS3ehyBhVmJrDuR47CjrFOMeuiE1IE3wdu37vYkqn+X93f0PjFS
         81XlQv5gTtjNgk6UvuEVGM4yCZ5YUKaPcgkRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745893710; x=1746498510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnBKvw2kgpkCx0VRoBE8FRrW9svaRVFdZx7JKWWKbs4=;
        b=A20YbWevHW+gfHzoBVuFBqkWQNqrqcvA58xqgk61N0ZGhDhHIMgYN24v5p533GGhWe
         zA3MVzJB36bsIgdWMenOa5AUpKdRB4F8uPAXWSSO3K0WvmR5RdH1Yn0I4TdnQnNR2xYy
         RUsZgrmO4NdlGPTBNx5MNtof0ynHixZhg6/ziDwK2gDOO5L9t0ldCunXG+EeLo7LRhv/
         sMnQUkBIKHWkrNStPZqSAgCZT0vBOCVjTlcC40CIrJaLrLSEKelimnNStcCKi+Ug9YGh
         c7TVpFqI9ji8RVm7KMDRKYgHGOuP8SpMfuO8VCMicXwuQiAeO0Psc5jcxLHnr4qHSFVs
         4wCg==
X-Forwarded-Encrypted: i=1; AJvYcCXNrcdRo/k+JFmGVF8wr6o5G2SWmXdIGRoRePYfX46OnIryWjZGQk6VF7kSRJxDS/ignMIF3/feAdA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZqt7Uf8kPAEPgnWFezfYExmeeddJymmEhp/HphFwV+Je1FdYL
	aHlHRJEBMUVNAiXHz+P68TeG5SeEc93qoAGGmD7E9n0OEJGlO2aTPSpvMkUESdDVMIIIOs8cYEy
	+su4b/g==
X-Gm-Gg: ASbGnct7W3QJZn5xfqgvxA1uAFhkrEk3Q4maBKn1pqaA7fTTkEkn3pR6rmL/cu+ayKc
	yjGAlE+X878h8jJ9yVOw0bwj+4jaYgKZBJUJEwSEgc2QUxHjvYzvCSdRajSLjHDlQ3k6ERHQhEy
	mNRpNMyqmXp6JH0WcMNxfyN5tH9KMeKRz0GpH1/1WLOhvn0lb84d6YbsmX09YbdnTwYzoRureZz
	4sxiu/mMYXax6cqk/rNzCPXOFRuxn/d5my3rORVWwtMW8OjKkOPW1teyRTKUU4Ahrj2ZmOrKoRM
	35/UFnqkRLL/lzGpImjh5JLvml/epqGhF2/SNkPhFFi9KdB0vUodf+oeujRF4WhY+Zbuzjc+9ny
	7zrzZ6gJgozxGNIc=
X-Google-Smtp-Source: AGHT+IFNTbJ88Vebt7uPcpDrx7uH1q4vhWtFyl9Fuj0b2JIGWmWfDNTwWMmM+SJiALLpD59ClMjuYQ==
X-Received: by 2002:a17:907:724f:b0:acb:893:8c40 with SMTP id a640c23a62f3a-ace84901512mr1102831066b.19.1745893709993;
        Mon, 28 Apr 2025 19:28:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFdOdrq4KSHscEvuZt4Vts+OFT82AlUpaUWapB23xk+2AYQAozmjeF0Oj4kN60Iq0zTMRD8P+SPR4=@lists.xenproject.org
X-Received: by 2002:a17:907:94d3:b0:ac3:446d:141 with SMTP id
 a640c23a62f3a-ace84aacbabmr901645166b.47.1745893395747; Mon, 28 Apr 2025
 19:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
 <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com> <67be5eee-b67b-409a-8309-829f891b9944@citrix.com>
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com>
In-Reply-To: <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Apr 2025 19:22:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg34q=Mp7abB1zgL1GnXJ9Z_dOoZiBxqyXRtHipCpuyiQ@mail.gmail.com>
X-Gm-Features: ATxdqUG_ghGMO55z_hupmo__0S_CBd8urm2dTp6Qs-e2EcpEWp5VhXjCeavjAEY
Message-ID: <CAHk-=wg34q=Mp7abB1zgL1GnXJ9Z_dOoZiBxqyXRtHipCpuyiQ@mail.gmail.com>
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ingo Molnar <mingo@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 19:00, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Now, question: can we just use __builtin_*() for these? I think gcc should always generate inline code for these on x86.

Yeah, I think we can just use __builtin_ffs() directly and get rid of
all the games.

Not all gcc builtins are great: I did a bugzilla about gcc ctzl some time ago:

    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106471

but for ffs() that does sound like it's the simplest thing to do.

               Linus

