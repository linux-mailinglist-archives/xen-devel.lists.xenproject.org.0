Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859707C7864
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 23:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616049.957745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr2vn-0003BZ-Aj; Thu, 12 Oct 2023 21:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616049.957745; Thu, 12 Oct 2023 21:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr2vn-00039V-81; Thu, 12 Oct 2023 21:09:19 +0000
Received: by outflank-mailman (input) for mailman id 616049;
 Thu, 12 Oct 2023 21:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WWXW=F2=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1qr2vl-00039P-9B
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 21:09:17 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9806107b-6943-11ee-9b0e-b553b5be7939;
 Thu, 12 Oct 2023 23:09:14 +0200 (CEST)
Received: from [IPV6:2601:646:9a00:1821:7c45:267e:5aad:82e7]
 ([IPv6:2601:646:9a00:1821:7c45:267e:5aad:82e7])
 (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 39CL85OK1848892
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 12 Oct 2023 14:08:37 -0700
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
X-Inumbo-ID: 9806107b-6943-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 39CL85OK1848892
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023091101; t=1697144918;
	bh=5f4ZuSY/L+s9vY5S3iUWDxa4pn0Fv0h26nvn9vsXOh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CLH/fKVyVCKi3f7nz9Xt95SNxAMKfTC56revfWZPlk7FnV0QxckBQRjosSB01pRaj
	 vE0dTFncCytc2nDfXo3vhd12zuqb2J0YJ26/GCMIQQgLPYGgJ3vLO2ZKWd1O3K5wh7
	 NfzItHdBcD2s3YsmvY2z9W4WUXKJ3ShcL5o/Lipp4LKC7rAE0IMd8gHr5buq5rbbJ9
	 0BaHVfK1kpPsc9wq4tnTIVrIr+5BMMm17KiWAC/heWLcGyIX7PoJHUEDamDjOMLX7N
	 LPHgK8ga6ttRod6tstkkY8BKRuHPXkkxJWeUMz4qEGkXbiGKJecOpU1OdE55BGgaLU
	 AtBVNLtLfbSAQ==
Message-ID: <5722e74b-6fc6-4d6e-be25-069ea6385990@zytor.com>
Date: Thu, 12 Oct 2023 14:08:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Introduce %rip-relative addressing to PER_CPU_VAR
 macro
Content-Language: en-US
To: Uros Bizjak <ubizjak@gmail.com>, Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
References: <20231012201743.292149-1-ubizjak@gmail.com>
 <3af8dcec-66ec-4bd4-b7bf-4bc6f5f3c70f@intel.com>
 <CAFULd4byzHyoz4xM1gL_T1wFkNE-ab8K4upXfPirxM9PdX5JWg@mail.gmail.com>
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <CAFULd4byzHyoz4xM1gL_T1wFkNE-ab8K4upXfPirxM9PdX5JWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/12/23 13:59, Uros Bizjak wrote:
> On Thu, Oct 12, 2023 at 10:53 PM Dave Hansen <dave.hansen@intel.com> wrote:
>>
>> On 10/12/23 13:12, Uros Bizjak wrote:
>>> The last patch introduces (%rip) suffix and uses it for x86_64 target,
>>> resulting in a small code size decrease: text data bss dec hex filename
>>> 25510677 4386685 808388 30705750 1d48856 vmlinux-new.o 25510629 4386685
>>> 808388 30705702 1d48826 vmlinux-old.o
>>
>> I feel like I'm missing some of the motivation here.
>>
>> 50 bytes is great and all, but it isn't without the cost of changing
>> some rules and introducing potential PER_CPU_ARG() vs. PER_CPU_VAR()
>> confusion.
>>
>> Are there some other side benefits?  What else does this enable?
> 
> These changes are necessary to build the kernel as Position
> Independent Executable (PIE) on x86_64 [1]. And since I was working in
> percpu area I thought that it was worth implementing them.
> 
> [1] https://lore.kernel.org/lkml/cover.1682673542.git.houwenlong.hwl@antgroup.com/
> 

Are you PIC-adjusting the percpu variables as well?

	-hpa

