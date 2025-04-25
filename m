Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C387A9D2C9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 22:16:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968560.1358100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8PSp-00035p-IT; Fri, 25 Apr 2025 20:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968560.1358100; Fri, 25 Apr 2025 20:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8PSp-00033b-FO; Fri, 25 Apr 2025 20:15:59 +0000
Received: by outflank-mailman (input) for mailman id 968560;
 Fri, 25 Apr 2025 20:15:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tq29=XL=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u8PSn-00033V-Nu
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 20:15:57 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1762ef40-2212-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 22:15:55 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53PKFQDg3256787
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 25 Apr 2025 13:15:27 -0700
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
X-Inumbo-ID: 1762ef40-2212-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53PKFQDg3256787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745612128;
	bh=QJR+ymoSxhx0ygaS36CxYeriy9wPOBKoGiphuOc/xYA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=WlPgzDVgOvh/0/DFcOe5XvMF8cvfSpicLG3EPZT8AMttk1GaTl6jNj6ES6WfPTR68
	 /wWU89V8Qwj+O9E78AFFFUU6eJy1kkRMV6xfexWC7bAX3Bc0V7jqD9eNN0QRkhkkI5
	 EziKxByPLhsc++tIDRVYnZbSrWAnma9tJh9y/9AJvo/5s1sbgoJQmb9k55q41YazSd
	 hKfRYhop6s0UAF/DuvR4d/qrnx8GfOMSyYS2pYZjkvcz8Lok4x3GyYIB5frgJytZw+
	 2PFF5/JtlfLV8fXzKXntPUxJIcmIaKtaARWNiHF7P3QM2WfemqbJojqVOZWOt4eQs2
	 5y20v1j/VdOXQ==
Date: Fri, 25 Apr 2025 13:15:24 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
CC: Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
User-Agent: K-9 Mail for Android
In-Reply-To: <09e26f91-9a62-45c8-b94e-eddb307251f4@app.fastmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <7CEE8E85-D7B1-4066-AD4D-747CA4340F65@zytor.com> <09e26f91-9a62-45c8-b94e-eddb307251f4@app.fastmail.com>
Message-ID: <49675319-D30C-417C-9BE6-20D2AB8E259A@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 25, 2025 9:13:31 AM PDT, Arnd Bergmann <arnd@arndb=2Ede> wrote:
>On Fri, Apr 25, 2025, at 17:34, H=2E Peter Anvin wrote:
>> On April 25, 2025 7:15:15 AM PDT, Arnd Bergmann <arnd@kernel=2Eorg> wro=
te:
>>
>> I really don't like testing an unrelated feature (CMOV for PAE);=20
>
>How about a new symbol with the opposite polarity, e=2Eg=2E CONFIG_CPU_58=
6?
>In that case, X86_HAVE_PAE and X86_CMOV could both depend on that
>not being set=2E
>
>I only picked the X86_CMOV symbol because it already exists in =2Econfig
>files, but that is not the important bit here=2E
>
>> furthermore, at least some old hypervisors were known to have
>> broken PAE=2E
>
>I'm not following=2E What does that have to do with my patch?
>
>     Arnd

This seems overly complex to me=2E

