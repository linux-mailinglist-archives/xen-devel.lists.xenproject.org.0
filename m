Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EA0A9DDED
	for <lists+xen-devel@lfdr.de>; Sun, 27 Apr 2025 01:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969454.1358529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8pGR-0005B6-4m; Sat, 26 Apr 2025 23:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969454.1358529; Sat, 26 Apr 2025 23:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8pGQ-00058E-VB; Sat, 26 Apr 2025 23:48:54 +0000
Received: by outflank-mailman (input) for mailman id 969454;
 Sat, 26 Apr 2025 23:48:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dw20=XM=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u8pGP-000588-4T
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 23:48:53 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff253844-22f8-11f0-9ffb-bf95429c2676;
 Sun, 27 Apr 2025 01:48:49 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53QNluFV1005984
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sat, 26 Apr 2025 16:47:56 -0700
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
X-Inumbo-ID: ff253844-22f8-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53QNluFV1005984
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745711278;
	bh=Efb+Y8rvKueZmGY8ER6BRva8Iw8OWCsIsGFLE56vRl8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=P/Rt4kQ555chle4fd6u83fkO61mpaRrGHqm3uByh8N3lSMxZL/q460tfYdHlheP8D
	 zCd6F1t4iXrNqELKFnHXUCOQ/j/okZUtsZ+m1VvTuNl8RP6BakxW6AJMqLmqeP+PRX
	 WRWME5XpaX3pon4G6Gjgr5VwgN7q2kEhYXEJ2mkNQ1/tWXM2to1QTJ2dHmoSCFu9Fw
	 RYM+J+2G/74cxHOb37CJsFnYnT1MbeYVASdC4yzDxcjJq+7SlbM4Yh0gbwhPVVEfbi
	 IlCTiTr2iuwOGGe4BxrpiBB9hrwS4hIC/GM1d4ghRCf0ORnOHD5F39l8rB4RtlZmJx
	 Zd0khTJhmaBpw==
Date: Sat, 26 Apr 2025 16:47:55 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>
CC: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
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
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
Message-ID: <9D1971C6-8C13-4526-8D2B-37A1D3B0B066@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 26, 2025 12:55:13 PM PDT, Linus Torvalds <torvalds@linux-foundatio=
n=2Eorg> wrote:
>On Sat, 26 Apr 2025 at 12:24, Linus Torvalds
><torvalds@linux-foundation=2Eorg> wrote:
>>
>> (And yes, one use in a x86 header file that is pretty questionable
>> too: I think the reason for the cmov is actually i486-only behavior
>> and we could probably unify the 32-bit and 64-bit implementation)
>
>Actually, what we *should* do is to remove that manual use of 'cmov'
>entirely - even if we decide that yes, that undefined zero case is
>actually real=2E
>
>We should probably change it to use CC_SET(), and the compiler will do
>a much better job - and probably never use cmov anyway=2E
>
>And yes, that will generate worse code if you have an old compiler
>that doesn't do ASM_FLAG_OUTPUTS, but hey, that's true in general=2E If
>you want good code, you need a good compiler=2E
>
>And clang needs to learn the CC_SET() pattern anyway=2E
>
>So I think that manual cmov pattern for x86-32 should be replaced with
>
>        bool zero;
>
>        asm("bsfl %[in],%[out]"
>            CC_SET(z)
>            : CC_OUT(z) (zero),
>              [out]"=3Dr" (r)
>            : [in] "rm" (x));
>
>        return zero ? 0 : r+1;
>
>instead (that's ffs(), and fls() would need the same thing except with
>bsrl insteadm, of course)=2E
>
>I bet that would actually improve code generation=2E
>
>And I also bet it doesn't actually matter, of course=2E
>
>           Linus

The undefined zero case applies to family < 6 as far as I know=2E=2E=2E th=
e same platforms which don't have cmov=2E=2E=2E

