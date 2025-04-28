Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D9A9F291
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 15:42:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970741.1359347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Ok6-0006fx-1k; Mon, 28 Apr 2025 13:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970741.1359347; Mon, 28 Apr 2025 13:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Ok5-0006dQ-VD; Mon, 28 Apr 2025 13:41:53 +0000
Received: by outflank-mailman (input) for mailman id 970741;
 Mon, 28 Apr 2025 13:41:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0nMS=XO=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u9Ok3-0006dI-JV
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 13:41:51 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 880d9c5a-2436-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 15:41:49 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53SDfBUB3511020
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 28 Apr 2025 06:41:12 -0700
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
X-Inumbo-ID: 880d9c5a-2436-11f0-9eb4-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53SDfBUB3511020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745847673;
	bh=3fiGytVgsyIVAVWo//vH0oNLU1kTYSiRQ5TfaW8qnQE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=d5coOTOb40CjM5j3IjHJXijGHQ0hfWuJeFrZwI3hcyWuQbSQVQp6mGhhACmu/uRXU
	 lKV3NMeTU/CvOXmxYu+o1kPJ9lt+/eXDXE0O5pntTxNltYkJGcgYRuPeTicyR8y+hE
	 wwbc35YWb4az+82gOXbk+SyxUgH/gJfOJ4flelYDLMyTJ11X+e6T6zI8xyMldqJM0V
	 AV3rS5lFI23vazOqZKGjj9M9lkYUYAhFx/II5GFWBnA+g0RxDgaowN95jjrnva39go
	 mPWCSIlCKCOb3MkX1vYlQD0mzhkQ8aMeJKvG1Owl2cbvpHXfWRttAx0rKwRb/rP/ZN
	 zd8yxPBa8VWmQ==
Date: Mon, 28 Apr 2025 06:41:09 -0700
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
In-Reply-To: <aA8q4Ot-1zTzv_Kt@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com> <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com> <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <aA8q4Ot-1zTzv_Kt@gmail.com>
Message-ID: <8E8C8B78-2D92-4D34-BA89-909F7F2FEA55@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 28, 2025 12:14:40 AM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>* Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>> And once we remove 486, I think we can do the optimization below to=20
>> just assume the output doesn't get clobbered by BS*L in the=20
>> zero-case, right?
>>=20
>> In the text size space it's a substantial optimization on x86-32=20
>> defconfig:
>>=20
>>         text	   data	       bss	     dec	    hex	filename
>>   16,577,728    7598826    1744896      25921450        18b87aa vmlinux=
=2Evanilla      # CMOV+BS*L
>>   16,577,908	7598838	   1744896	25921642	18b886a	vmlinux=2Elinus_patch =
 # if()+BS*L
>>   16,573,568	7602922	   1744896	25921386	18b876a	vmlinux=2Enoclobber   =
 # BS*L
>
>And BTW, *that* is a price that all of non-486 x86-32 was paying for=20
>486 support=2E=2E=2E
>
>And, just out of intellectual curiosity, I also tried to measure the=20
>code generation price of the +1 standards-quirk in the fls()/ffs()=20
>interface as well:
>
>         text	   data	       bss	     dec	    hex	filename
>   16,577,728   7598826    1744896      25921450        18b87aa vmlinux=
=2Evanilla      # CMOV+BS*L
>   16,577,908	7598838	   1744896	25921642	18b886a	vmlinux=2Elinus_patch  =
# if()+BS*L
>   16,573,568	7602922	   1744896	25921386	18b876a	vmlinux=2Enoclobber    =
# BS*L
>   =2E=2E=2E=2E=2E=2E=2E=2E=2E=2E
>   16,573,552	7602922	   1744896	25921370	18b875a	vmlinux=2Ebroken       =
# BROKEN: 0 baseline instead of 1
>
>=2E=2E=2E and unless I messed up the patch, it seems to have a surprising=
ly=20
>low impact - maybe because the compiler can amortize its cost by=20
>adjusting all dependent code mostly at build time, so the +1 doesn't=20
>end up being generated most of the time?
>
>Thanks,
>
>	Ingo
>
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D>
>
>This broken patch is broken: it intentionally breaks the ffs()/fls()=20
>interface in an attempt to measure the code generation effects of=20
>interface details=2E
>
>NOT-Signed-off-by: <anyone@anywhere=2Eanytime>
>---
> arch/x86/include/asm/bitops=2Eh | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/arch/x86/include/asm/bitops=2Eh b/arch/x86/include/asm/bitop=
s=2Eh
>index e3e94a806656=2E=2E21707696bafe 100644
>--- a/arch/x86/include/asm/bitops=2Eh
>+++ b/arch/x86/include/asm/bitops=2Eh
>@@ -318,7 +318,7 @@ static __always_inline int variable_ffs(int x)
> 	    : "=3Dr" (r)
> 	    : ASM_INPUT_RM (x), "0" (-1));
>=20
>-	return r + 1;
>+	return r;
> }
>=20
> /**
>@@ -362,7 +362,7 @@ static __always_inline int fls(unsigned int x)
> 	    : "=3Dr" (r)
> 	    : ASM_INPUT_RM (x), "0" (-1));
>=20
>-	return r + 1;
>+	return r;
> }
>=20
> /**

My recollection was that you can't assume that even for 586; that it is on=
ly safe for 686, but it has been a long time=2E=2E=2E

