Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FBDAA3B11
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 00:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973152.1361353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9tAh-00035E-Md; Tue, 29 Apr 2025 22:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973152.1361353; Tue, 29 Apr 2025 22:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9tAh-000336-J9; Tue, 29 Apr 2025 22:11:23 +0000
Received: by outflank-mailman (input) for mailman id 973152;
 Tue, 29 Apr 2025 22:11:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k9ft=XP=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u9tAf-000330-HG
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 22:11:21 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7ec6c96-2546-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 00:11:07 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53TMAU8h607259
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 29 Apr 2025 15:10:31 -0700
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
X-Inumbo-ID: d7ec6c96-2546-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53TMAU8h607259
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745964632;
	bh=79WW/6GCYUlxzkcwU8Me7t87railGlC3HuM0E/D7/IM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Xjw5H3EmU1OOsdeN6B7NCthuT7/JRKqee6lbs8tDXyZO9l1JGIjb2HPeYmZP9ormv
	 mll2/szrCJYckCbt9XRseZYa4/tRSJJLNfKDlY7G248v0b6xAeRgcbWu7x1u1qAteG
	 bxEGtWLwMllizT6/3fDQYYIZiPEm452XikBN7hJMlMJYeOcecQaTlPZ2VeypVhxIac
	 WUkrsKg9fV/v2LN+znAZmv4KAid1hh8rTgEV5ndZRjFduvDIghwiij3Ol+QFIA8Kv0
	 KrYnaw9cAROWzzu1/J7HOn+wIDic3+LnQSPTjjWNp2ynXfiTMJ1/29ADy0dVKp/Til
	 Yvf0M+in91uVA==
Date: Tue, 29 Apr 2025 15:10:29 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
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
In-Reply-To: <CAHk-=wiMN7eMYE=SiA07f2aFFeuEV0YJ-ewoW4rJ3yQfbviuJA@mail.gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com> <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com> <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com> <67be5eee-b67b-409a-8309-829f891b9944@citrix.com> <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com> <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com> <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com> <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com> <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com> <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com> <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com> <72078B8D-F03E-4783-8AC2-A36464A4B6A1@zytor.com> <CAHk-=wi=nuDW6yCXSA-dEztZhXNuzLOaH--s_V7GOAE7n6RsRw@mail.gmail.com> <565ac06a-005f-4b77-930e-d63285c025b9@citrix.com> <CAHk-=wiMN7eMYE=SiA07f2aFFeuEV0YJ-ewoW4rJ3yQfbviuJA@mail.gmail.com>
Message-ID: <D843E4F2-0983-4D67-B346-A77134608196@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 29, 2025 3:04:30 PM PDT, Linus Torvalds <torvalds@linux-foundation=
=2Eorg> wrote:
>On Tue, 29 Apr 2025 at 14:59, Andrew Cooper <andrew=2Ecooper3@citrix=2Eco=
m> wrote:
>>
>> do_variable_ffs() doesn't quite work=2E
>>
>> REP BSF is LZCNT, and unconditionally writes it's output operand, and
>> defeats the attempt to preload with -1=2E
>>
>> Drop the REP prefix, and it should work as intended=2E
>
>Bah=2E That's what I get for just doing it blindly without actually
>looking at the kernel source=2E I just copied the __ffs() thing - and
>there the 'rep' is not for the zero case - which we don't care about -
>but because lzcnt performs better on newer CPUs=2E
>
>So you're obviously right=2E
>
>            Linus

Yeah, the encoding of lzcnt was a real mistake, because the outputs are di=
fferent (so you still need instruction-specific postprocessing=2E)

