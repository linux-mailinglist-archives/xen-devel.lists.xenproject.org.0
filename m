Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A560CCC3F78
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 16:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188043.1509301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVX3E-0000Xb-0j; Tue, 16 Dec 2025 15:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188043.1509301; Tue, 16 Dec 2025 15:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVX3D-0000VD-Sn; Tue, 16 Dec 2025 15:33:23 +0000
Received: by outflank-mailman (input) for mailman id 1188043;
 Tue, 16 Dec 2025 15:33:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TkDs=6W=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1vVX3B-0000UO-Mc
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 15:33:21 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b50a8e1-da94-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 16:33:19 +0100 (CET)
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net
 [76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5BGFWClL2179001
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 16 Dec 2025 07:32:13 -0800
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
X-Inumbo-ID: 8b50a8e1-da94-11f0-9cce-f158ae23cfc8
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5BGFWClL2179001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025112201; t=1765899134;
	bh=YwoMyqqb7FoPpi5NJyyaera2Ovv71yIWvzL6plb5cBY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=iPE0VLcTgNWTSt5Tet9JM219GeC7iYNuOcfvkIUd5nEKG/cdvOJwPNBuC1E+DFzIi
	 SHqu/oogV01S+Vdi/eeDP9MVA/VMd+IORcg8rzelWylaDU7RwlyiRxoXkzNUdlA+49
	 9a2JqdulmrlQrzXpJXZcHiVRWtWWYGm4vTlgsvktLtFFJNi1LESdKBVzyuTMqbcRTd
	 bM2x846MlS7boYnZ7dfj6rnowELPFA5PBJghox2dJ8Bq8DfbpSSEai1LJie29QbzBq
	 ekqe/HtqGC1nCUgMXLOxWd2SgknFZP/ynGzpZ0XgkulTqNVUOmsDcdrJ8/SaabjQy9
	 7VLOQi94US1rA==
Date: Tue, 16 Dec 2025 07:32:09 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
        Ingo Molnar <mingo@kernel.org>
CC: linux-kernel@vger.kernel.org, x86@kernel.org,
        virtualization@lists.linux.dev, kvm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-block@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ajay Kaher <ajay.kaher@broadcom.com>,
        Alexey Makhalov <alexey.makhalov@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, Denis Efremov <efremov@linux.com>,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 0/5] x86: Cleanups around slow_down_io()
User-Agent: K-9 Mail for Android
In-Reply-To: <b969cff5-be11-4fd3-8356-95185ea5de4c@suse.com>
References: <20251126162018.5676-1-jgross@suse.com> <aT5vtaefuHwLVsqy@gmail.com> <bff8626d-161e-4470-9cbd-7bbda6852ec3@suse.com> <aUFjRDqbfWMsXvvS@gmail.com> <b969cff5-be11-4fd3-8356-95185ea5de4c@suse.com>
Message-ID: <14EF14B1-8889-4037-8E7B-C8446299B1E9@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On December 16, 2025 5:55:54 AM PST, "J=C3=BCrgen Gro=C3=9F" <jgross@suse=
=2Ecom> wrote:
>On 16=2E12=2E25 14:48, Ingo Molnar wrote:
>>=20
>> * J=C3=BCrgen Gro=C3=9F <jgross@suse=2Ecom> wrote:
>>=20
>>>> CPUs anymore=2E Should it cause any regressions, it's easy to bisect =
to=2E
>>>> There's been enough changes around all these facilities that the
>>>> original timings are probably way off already, so we've just been
>>>> cargo-cult porting these to newer kernels essentially=2E
>>>=20
>>> Fine with me=2E
>>>=20
>>> Which path to removal of io_delay would you (and others) prefer?
>>>=20
>>> 1=2E Ripping it out immediately=2E
>>=20
>> I'd just rip it out immediately, and see who complains=2E :-)
>
>I figured this might be a little bit too evil=2E :-)
>
>I've just sent V2 defaulting to have no delay, so anyone hit by that
>can still fix it by applying the "io_delay" boot parameter=2E
>
>I'll do the ripping out for kernel 6=2E21 (or whatever it will be called)=
=2E
>
>
>Juergen

Ok, I'm going to veto ripping it out from the real-mode init code, because=
 I actually know why it is there :) =2E=2E=2E and that code is pre-UEFI leg=
acy these days anyway=2E

Other places=2E=2E=2E I don't care :)

