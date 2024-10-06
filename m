Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0097D9920CD
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 21:40:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811299.1223861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxX6V-00059c-AR; Sun, 06 Oct 2024 19:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811299.1223861; Sun, 06 Oct 2024 19:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxX6V-00056Q-6X; Sun, 06 Oct 2024 19:39:43 +0000
Received: by outflank-mailman (input) for mailman id 811299;
 Sun, 06 Oct 2024 19:39:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=50Zd=RC=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1sxX6T-00056K-Tz
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 19:39:42 +0000
Received: from mail.zytor.com (torg.zytor.com [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8b56075-841a-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 21:39:38 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 496JcqMQ1925401
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sun, 6 Oct 2024 12:38:53 -0700
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
X-Inumbo-ID: b8b56075-841a-11ef-a0bb-8be0dac302b0
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 496JcqMQ1925401
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024091601; t=1728243536;
	bh=9wpGerdLjrs32NAAxWuQr0Zn5/RQ55cLXb4OynSTbGk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Lc9PbUpMwsnXTOWaJN9CXcxjSSWv5nTCaZBiscG/TQ3eHw4J2mI5nopG2gSeaI79L
	 vKMiLkZHfC5ubwiFJzuDuyB+F5uMgvtF2z0wUtlZmg4On1bnmVK4vei8WgNxba4q9u
	 muWB/vSp7UxaBGIboP+agmWEZxkTp81yyJwnS6yc0YXqeqxb0x7Ta7UpicAdHSSWND
	 7UPqiYheLQ57e2ykSnaWM8GW2tnbAX4B6xnsny8QXDU+qdSEJsjRLl9oDtWqQ/ecCq
	 0sAHRDWAdgyw5syyYB6N3mg/bKR+nVFfm3xWMRSeaGRrxOVCrWF7OfUMb2ogPNfF4Q
	 GIubVa2r9kh9w==
Date: Sun, 06 Oct 2024 12:38:52 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Uros Bizjak <ubizjak@gmail.com>, David Laight <David.Laight@aculab.com>
CC: Ard Biesheuvel <ardb@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ard Biesheuvel <ardb+git@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>, Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Keith Packard <keithp@keithp.com>,
        Justin Stitt <justinstitt@google.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kan Liang <kan.liang@linux.intel.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFULd4awNUm8MpZQ6XhPTRs6+2ZLtfnr=6vkK5DrY9L2rGR-5w@mail.gmail.com>
References: <20240925150059.3955569-30-ardb+git@google.com> <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com> <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com> <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com> <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com> <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com> <CAFULd4Yj9LfTnWFu=c1M7Eh44+XFk0ibwL57r5H7wZjvKZ8yaA@mail.gmail.com> <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com> <CAFULd4b==a7H0zdGVfABntL0efrS-F3eeHGu-63oyz1eh1DwXQ@mail.gmail.com> <bfa1a86c3e4348159049e8277e9859dd@AcuMS.aculab.com> <CAFULd4awNUm8MpZQ6XhPTRs6+2ZLtfnr=6vkK5DrY9L2rGR-5w@mail.gmail.com>
Message-ID: <2E1160A8-3A0C-45BD-B729-D20EAE97A075@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 6, 2024 12:17:40 PM PDT, Uros Bizjak <ubizjak@gmail=2Ecom> wrote=
:
>On Sun, Oct 6, 2024 at 8:01=E2=80=AFPM David Laight <David=2ELaight@acula=
b=2Ecom> wrote:
>>
>> =2E=2E=2E
>> > Due to the non-negligible impact of PIE, perhaps some kind of
>> > CONFIG_PIE config definition should be introduced, so the assembly
>> > code would be able to choose optimal asm sequence when PIE and non-PI=
E
>> > is requested?
>>
>> I wouldn't have thought that performance mattered in the asm code
>> that runs during startup?
>
>No, not the code that runs only once, where performance impact can be tol=
erated=2E
>
>This one:
>
>https://lore=2Ekernel=2Eorg/lkml/20240925150059=2E3955569-44-ardb+git@goo=
gle=2Ecom/
>
>Uros=2E
>

Yeah, running the kernel proper as PIE seems like a lose all around=2E The=
 decompressor, ELF stub, etc, are of course a different matter entirely (an=
d at least the latter can't rely on the small or kernel memory models anywa=
y=2E)

