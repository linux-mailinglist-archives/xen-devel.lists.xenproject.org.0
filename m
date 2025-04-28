Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A50A9FC57
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 23:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971214.1359683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9WCS-0002r0-0N; Mon, 28 Apr 2025 21:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971214.1359683; Mon, 28 Apr 2025 21:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9WCR-0002oZ-TQ; Mon, 28 Apr 2025 21:39:39 +0000
Received: by outflank-mailman (input) for mailman id 971214;
 Mon, 28 Apr 2025 21:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0nMS=XO=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u9WCQ-0002oR-1Y
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 21:39:38 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4620e172-2479-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 23:39:35 +0200 (CEST)
Received: from [IPv6:::1] ([172.59.161.110]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53SLcqMl4064505
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 28 Apr 2025 14:38:53 -0700
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
X-Inumbo-ID: 4620e172-2479-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53SLcqMl4064505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745876335;
	bh=sQ20RzlhTI2OdKKrz143XBlONGa/0jFWo7zJXCXWAL0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Y6dnSHnXkUStIgQVLFjFl/WxtubC4hEnVTp85eiu8hU/NXH7XMpJhcipi75ddaUXx
	 /NgJZdBwG4YGgALW2ZBuc2ItVhSmmt6hLAaLrXrgK/va0SIroYA/dZXlbfOC88E16n
	 ZH57S0ih6uCYhIIjqdhcg+zm2QALg0xS6Kn/ggUeXIpGMR1N1n6nxRZAXeLwRcS2PU
	 +3eg0CL929Iy9x67h00wm229TzSUPUuBOjliEmd4xzgnb3s0obM8+coBaCMVyUcIqF
	 bFChKrimnVYWirmjS9R+wtq1Tvf6r8kViKzsT3/5clVBlgSfFshY1zVI64ghckqW/p
	 qvLCC7ylrKxUw==
Date: Mon, 28 Apr 2025 14:38:46 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>
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
In-Reply-To: <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com> <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com> <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
Message-ID: <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 28, 2025 9:14:45 AM PDT, Linus Torvalds <torvalds@linux-foundation=
=2Eorg> wrote:
>On Mon, 28 Apr 2025 at 00:05, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>>
>> And once we remove 486, I think we can do the optimization below to
>> just assume the output doesn't get clobbered by BS*L in the zero-case,
>> right?
>
>We probably can't, because who knows what "Pentium" CPU's are out there=
=2E
>
>Or even if Pentium really does get it right=2E I doubt we have any
>developers with an original Pentium around=2E
>
>So just leave the "we don't know what the CPU result is for zero"
>unless we get some kind of official confirmation=2E
>
>          Linus

If anyone knows for sure, it is probably Christian Ludloff=2E However, the=
re was a *huge* tightening of the formal ISA when the i686 was introduced (=
family=3D6) and I really believe this was part of it=2E

I also really don't trust that family=3D5 really means conforms to undocum=
ented P5 behavior, e=2Eg=2E for Quark=2E

