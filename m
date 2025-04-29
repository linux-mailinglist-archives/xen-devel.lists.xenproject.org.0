Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C8FAA002F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 05:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971385.1359821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9bQY-0005HU-Dm; Tue, 29 Apr 2025 03:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971385.1359821; Tue, 29 Apr 2025 03:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9bQY-0005FM-AD; Tue, 29 Apr 2025 03:14:34 +0000
Received: by outflank-mailman (input) for mailman id 971385;
 Tue, 29 Apr 2025 03:14:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k9ft=XP=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u9bQW-0005FE-6U
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 03:14:32 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f640f41-24a8-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 05:14:29 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53T3DrjB119020
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 28 Apr 2025 20:13:53 -0700
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
X-Inumbo-ID: 0f640f41-24a8-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53T3DrjB119020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745896436;
	bh=peb82vM6bSNuZo6/KMKmNAvnzerA3MQBiRKI7q+5xfw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=a++ELqym3lrpZPy7ffY5Gnnq0aNebWAwsQMnZAleLodLhRw9gdz5sbqMpSGZxWLZS
	 /9za6Nyp1KexgNB7nXFXpN81dXKkHrxa1ti2HZylvJxMQTBsneVlMxj6hdeA6HgciA
	 tOwW0eu+NpafDEOYGpD/0HvlLtjP9WIrk2gAy8t6jg6hlHtJQF/hd8pd5fCPqLolIX
	 hx2rCTFcGPCM3TtOmG7U2KmdSt2WHoJeIWlDrJpdGMnuXqQiEcGsr4bievYSlRz9wq
	 vj77sXGyLSXoYKTA2EWk6M4qRon8YrQ8jrBfjBbkBVizg6LoYfoLnMe5Em6X49Kisx
	 gYDsmYl7YHsaA==
Date: Mon, 28 Apr 2025 20:13:52 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
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
In-Reply-To: <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com> <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com> <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com> <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com> <67be5eee-b67b-409a-8309-829f891b9944@citrix.com> <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com> <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
Message-ID: <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 28, 2025 7:25:17 PM PDT, Andrew Cooper <andrew=2Ecooper3@citrix=2E=
com> wrote:
>On 29/04/2025 3:00 am, H=2E Peter Anvin wrote:
>> On April 28, 2025 5:12:13 PM PDT, Andrew Cooper <andrew=2Ecooper3@citri=
x=2Ecom> wrote:
>>> On 28/04/2025 10:38 pm, H=2E Peter Anvin wrote:
>>>> On April 28, 2025 9:14:45 AM PDT, Linus Torvalds <torvalds@linux-foun=
dation=2Eorg> wrote:
>>>>> On Mon, 28 Apr 2025 at 00:05, Ingo Molnar <mingo@kernel=2Eorg> wrote=
:
>>>>>> And once we remove 486, I think we can do the optimization below to
>>>>>> just assume the output doesn't get clobbered by BS*L in the zero-ca=
se,
>>>>>> right?
>>>>> We probably can't, because who knows what "Pentium" CPU's are out th=
ere=2E
>>>>>
>>>>> Or even if Pentium really does get it right=2E I doubt we have any
>>>>> developers with an original Pentium around=2E
>>>>>
>>>>> So just leave the "we don't know what the CPU result is for zero"
>>>>> unless we get some kind of official confirmation=2E
>>>>>
>>>>>          Linus
>>>> If anyone knows for sure, it is probably Christian Ludloff=2E However=
, there was a *huge* tightening of the formal ISA when the i686 was introdu=
ced (family=3D6) and I really believe this was part of it=2E
>>>>
>>>> I also really don't trust that family=3D5 really means conforms to un=
documented P5 behavior, e=2Eg=2E for Quark=2E
>>> https://www=2Esandpile=2Eorg/x86/flags=2Ehtm
>>>
>>> That's a lot of "can't even characterise the result" in the P5=2E
>>>
>>> Looking at P4 column, that is clearly what the latest SDM has
>>> retroactively declared to be architectural=2E
>>>
>>> ~Andrew
>> Yes, but it wasn't about flags here=2E=20
>>
>> Now, question: can we just use __builtin_*() for these? I think gcc sho=
uld always generate inline code for these on x86=2E
>
>Yes it does generate inline code=2E=C2=A0 https://godbolt=2Eorg/z/M45oo5r=
qT
>
>GCC does it branchlessly, but cannot optimise based on context=2E
>
>Clang can optimise based on context, except the 0 case it seems=2E
>
>Moving to -march=3Di686 causes both GCC and Clang to switch to CMOV and
>create branchless code, but is still GCC still can't optimise out the
>CMOV based on context=2E
>
>~Andrew

Maybe a gcc bug report would be better than trying to hack around this in =
the kernel?

