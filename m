Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B388A9DE0D
	for <lists+xen-devel@lfdr.de>; Sun, 27 Apr 2025 02:36:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969484.1358550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8q0Q-0005G7-KT; Sun, 27 Apr 2025 00:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969484.1358550; Sun, 27 Apr 2025 00:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8q0Q-0005Dd-HJ; Sun, 27 Apr 2025 00:36:26 +0000
Received: by outflank-mailman (input) for mailman id 969484;
 Sun, 27 Apr 2025 00:36:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ek1t=XN=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u8q0O-0005DX-TJ
 for xen-devel@lists.xenproject.org; Sun, 27 Apr 2025 00:36:24 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3d53639-22ff-11f0-9eb3-5ba50f476ded;
 Sun, 27 Apr 2025 02:36:22 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53R0ZnmQ1060846
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sat, 26 Apr 2025 17:35:50 -0700
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
X-Inumbo-ID: a3d53639-22ff-11f0-9eb3-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53R0ZnmQ1060846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745714151;
	bh=3yZe2hwmc24kUcFIPymx5Z3oUOBzO0LqbFNLOvIXzcQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=S7FC1CdY6cRjbRwEytSeLDATwwZ9wHLvvhEP/3tnIoYX9BGQlEKGe613A1caGwRvt
	 6+HINA28B/YnRsab8Kf9inZDgIcZsXoao8j51TzojBKYRN7mLl5wRdGKqPLyDEpFnx
	 FB3y7GhVgFQZ/v7aD3HZ70bYoTPHrnLY0cK95Skkow1po1sywILbWT6PEUXCTM9atw
	 hhn06XFBM20uWiXGIX3F2q/m6JTPfZKf+JMN+X1YNnLjBDruDRXX8S21MNOzGCXPtX
	 e1ZVOmQ6k86hzTupEuOQmIoAuvbONE1l89BnoJVjEuCWIukSo3rEGrqRj5zekdX0W/
	 U7oCxHWmg2VRw==
Date: Sat, 26 Apr 2025 17:35:49 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>
CC: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
User-Agent: K-9 Mail for Android
In-Reply-To: <aA0sNu0gcjlvhlDT@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com> <E130C6F4-5602-44E6-ABB0-B87B389C0026@zytor.com> <aA0sNu0gcjlvhlDT@gmail.com>
Message-ID: <74EAE03C-2316-4590-B0A8-83DB46B786DE@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 26, 2025 11:55:50 AM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>* H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>
>> Dropping CMOV would mean dropping P5 support=2E
>
>Yeah, I think we should make the cutoff at the 686 level=2E Is there any=
=20
>strong reason not to do that? Stable kernels will still exist for a=20
>very long time for ancient boards=2E
>
>	Ingo

I don't think some of the embedded 586-level ISA CPUs are ancient=2E

