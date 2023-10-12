Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791FC7C788E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 23:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616059.957766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr38J-0007HZ-Le; Thu, 12 Oct 2023 21:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616059.957766; Thu, 12 Oct 2023 21:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr38J-0007Fm-Im; Thu, 12 Oct 2023 21:22:15 +0000
Received: by outflank-mailman (input) for mailman id 616059;
 Thu, 12 Oct 2023 21:22:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WWXW=F2=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1qr38I-0007Fg-Nu
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 21:22:14 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67fbce48-6945-11ee-9b0e-b553b5be7939;
 Thu, 12 Oct 2023 23:22:12 +0200 (CEST)
Received: from [IPV6:2601:646:9a00:1821:7c45:267e:5aad:82e7]
 ([IPv6:2601:646:9a00:1821:7c45:267e:5aad:82e7])
 (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 39CLLiXS1851702
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 12 Oct 2023 14:21:45 -0700
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
X-Inumbo-ID: 67fbce48-6945-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 39CLLiXS1851702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023091101; t=1697145706;
	bh=DkV9ockDXHygDK8vfHAm86izvNjg/lx4TtVVSQpgW6s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i5vz1mkPWunh4gIMlTKwj14PtENV6wuJHkZSEnXbtAYpjeKZpNxplcosRKlCGMD/1
	 aleLTy5iWUddNvYM0c5UcTyMpiYwRTiTFgNJiEfryIo+vbgKyFl+Pm3PimAGjd8gI0
	 WDdQnAqdwzTB+nSTfm0xZzhKuH3nUD3LE9EhXr7rl+vfKOxjzaLZ7x4ZXaBWJaQoZb
	 ovA92Vc2b7iGm9RUoj43nkptJGKn087njRBmArQKptXO3OP/SIJLVe31PWuHzYv0oe
	 e05dyw10uZbbV4/ttog0qetMzMM2jyfr+LYOa/YtbpVoXtGt+e3t7kykvwtiOj2hnz
	 dtKLDMSJQiIww==
Message-ID: <5694b2bd-de40-45c0-8b38-ac01bc11798a@zytor.com>
Date: Thu, 12 Oct 2023 14:21:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Introduce %rip-relative addressing to PER_CPU_VAR
 macro
Content-Language: en-US
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Dave Hansen <dave.hansen@intel.com>, x86@kernel.org,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky
 <boris.ostrovsky@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
References: <20231012201743.292149-1-ubizjak@gmail.com>
 <3af8dcec-66ec-4bd4-b7bf-4bc6f5f3c70f@intel.com>
 <CAFULd4byzHyoz4xM1gL_T1wFkNE-ab8K4upXfPirxM9PdX5JWg@mail.gmail.com>
 <5722e74b-6fc6-4d6e-be25-069ea6385990@zytor.com>
 <CAFULd4afhj-kJwneh7wz0sExWqOmPicG4fcfF++_fUMHpoNbXA@mail.gmail.com>
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <CAFULd4afhj-kJwneh7wz0sExWqOmPicG4fcfF++_fUMHpoNbXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/23 14:17, Uros Bizjak wrote:
>>
>> Are you PIC-adjusting the percpu variables as well?
> 
> After this patch (and after fixing percpu_stable_op to use "a" operand
> modifier on GCC), the only *one* remaining absolute reference to
> percpu variable remain in xen-head.S, where:
> 
>      movq    $INIT_PER_CPU_VAR(fixed_percpu_data),%rax
> 
> should be changed to use leaq.
> 
> All others should then be (%rip)-relative.
> 

I mean, the symbols themselves are relative, not absolute?

	-hpa


