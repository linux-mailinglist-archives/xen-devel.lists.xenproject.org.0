Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC988AA0EE3
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 16:33:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972736.1361043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9m1F-0002Kx-Td; Tue, 29 Apr 2025 14:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972736.1361043; Tue, 29 Apr 2025 14:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9m1F-0002Hp-QR; Tue, 29 Apr 2025 14:33:09 +0000
Received: by outflank-mailman (input) for mailman id 972736;
 Tue, 29 Apr 2025 14:33:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k9ft=XP=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u9m1E-0002Hj-2r
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 14:33:08 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc383d31-2506-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 16:33:05 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53TEWCFi442559
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 29 Apr 2025 07:32:13 -0700
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
X-Inumbo-ID: dc383d31-2506-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53TEWCFi442559
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745937135;
	bh=LNjYixlftM0TocmwTWxp55iaVDYvdvPlmjeF4Wk1QKQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Jdj/Z600Zm+gH8++WJ3coUVX3bxm/9kz6VzSlcTsunLE2QdkL7cc+My/6OWOPvfBO
	 3ktp4xGOb8Bi6yvo/Hv2ijFkM36AaqGcUPxWLErP4AyLU7V+MIoqT9uXMvBs/R+KOc
	 Por8iQOetV42XpxMSzzjgtqyWZEX/qdTBR73GcL2v6YWZVDTG08lWKAhAQnRcUZeq9
	 KueXqPQFQcIZca9owJdh852QSvT/UyXI+1TueFr/tWQpGYwgPkpz0VS1kXYHRBTgjr
	 n5BNPcFGo8ojEJ4rqOyIxRCjUisbmkmZyRSIXeBA12UP6KFGaD71bFXBQGqGNZTqiz
	 RBOkL2e7VGWbA==
Date: Tue, 29 Apr 2025 07:32:10 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Arnd Bergmann <arnd@arndb.de>,
        Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_bitops/32=3A_Convert_variable?=
 =?US-ASCII?Q?=5Fffs=28=29_and_fls=28=29_zero-case_handling_to_C?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aBClAy837xcLnVpp@gmail.com>
References: <aAyiganPp_UsNlnZ@gmail.com> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com> <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com> <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <aA8q4Ot-1zTzv_Kt@gmail.com> <CAHk-=wh5DUS+nhfTxPEEbaB9dsFib39gWatrX4NoFq_MpdOzGw@mail.gmail.com> <aBClAy837xcLnVpp@gmail.com>
Message-ID: <3A122140-5646-46D7-91A0-0A3E5B21C951@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 29, 2025 3:08:03 AM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>* Linus Torvalds <torvalds@linux-foundation=2Eorg> wrote:
>
>> On Mon, 28 Apr 2025 at 00:14, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>> >
>> > And, just out of intellectual curiosity, I also tried to measure the
>> > code generation price of the +1 standards-quirk in the fls()/ffs()
>> > interface as well:
>> >
>> > =2E=2E=2E and unless I messed up the patch, it seems to have a surpri=
singly
>> > low impact - maybe because the compiler can amortize its cost by
>> > adjusting all dependent code mostly at build time, so the +1 doesn't
>> > end up being generated most of the time?
>>=20
>> No, I think one issue is that most users actually end up subtracting
>> one from the return value of 'ffs()', because the "bit #0 returns 1"
>> semantics of the standard ffs() function really is insane=2E
>>=20
>> It's not just that it doesn't match sane hardware, it's also that it
>> doesn't match sane *users*=2E If bit #0 is set, people want '0', so the=
y
>> typically subtract 1=2E
>>=20
>> So when you stop adding one, you aren't actually removing code -
>> you're often adding it=2E
>>=20
>> Just see how many hits you get from
>>=20
>>     git grep '\<ffs(=2E*)=2E*-=2E*1'
>>=20
>> which is obviously not a very precise pattern, but just look at the
>> output and see just *how* common that "subtract one" thing is=2E
>>=20
>> I really don't understand how anybody *ever* thought that the whole
>> "return one bigger" was a good idea for ffs()=2E
>
>Yeah=2E No argument from me that it's a badly thought out interface - I=
=20
>was just surprised that it doesn't seem to impact performance as badly=20
>as I expected=2E I have to add that a lot of work went into absorbing the=
=20
>negative effects of the ffs()/fls() interfaces:
>
>  starship:~/tip> git grep -Ee '__ffs\(|__fls\(' | wc -l
>  1055
>
>So it impacts code quality negatively, which is arguably the worse side=
=20
>effect=2E
>
>> But maybe people really were poisoned by the Pascal mindset=2E Or maybe=
=20
>> it was invented by some ancient Roman who hadn't heard of the concept=
=20
>> of zero=2E Who knows?
>
>Hey, ancient Romans didn't even have the concept of *whitespaces* and=20
>punctuation to begin with:
>
>    https://historyofinformation=2Ecom/images/Vergilius_Augusteus,_Georgi=
ca_121=2Ejpg
>
>Lazy stonemasons the lot of them=2E
>
>Romans were the worst ever coders too I suspect=2E What have the Romans=
=20
>ever done for us??
>
>	Ingo

Well, they did build the roads=2E=2E=2E =F0=9F=A4=A3

Roman numerals obviously were not a positional system, but at least in acc=
ounting they used N for zero (nulla=2E)

ROMANI=E2=80=A2ITE=E2=80=A2DOMVM

