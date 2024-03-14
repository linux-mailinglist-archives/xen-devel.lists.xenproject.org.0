Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973C287C303
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 19:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693447.1081527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkq6v-0007Km-Ve; Thu, 14 Mar 2024 18:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693447.1081527; Thu, 14 Mar 2024 18:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkq6v-0007JF-T3; Thu, 14 Mar 2024 18:47:25 +0000
Received: by outflank-mailman (input) for mailman id 693447;
 Thu, 14 Mar 2024 18:47:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rR1U=KU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkq6v-0007J9-0B
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 18:47:25 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4adbbe54-e233-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 19:47:22 +0100 (CET)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-430acf667afso1014611cf.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 11:47:22 -0700 (PDT)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l1-20020ac84cc1000000b0042f04e421d2sm1067472qtv.24.2024.03.14.11.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 11:47:21 -0700 (PDT)
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
X-Inumbo-ID: 4adbbe54-e233-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710442042; x=1711046842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=edk6fdaxLwF/Pq30+zYWxTrKfjAUS/7mmdROmeeEAcE=;
        b=R+Q38khTa71kq+DYN9A8oEo+0RPDH5C3dCmmfTo5upXnF3iHtqLjSInLpO3kgtCT12
         YEcYDqNfIHP91T9+re43JmyC3ozE+A65aa1yhLOU4pQuQy+FQVh6lSCVTyoGK2m5H86z
         mCf3b6685ixqONnX4KXx/XFy7BNpohfO72+VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710442042; x=1711046842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=edk6fdaxLwF/Pq30+zYWxTrKfjAUS/7mmdROmeeEAcE=;
        b=K/bhUb1NVnbUfuj6+An9Vkmnh+7RxhOiMwyhoY0XNXXzixgF6CG/j9BdJwmSQ5lo3V
         xeDgAMQ1Lu+BBvXhLaazR+jlfKSI1obfKeJYoqS4ibtYONp6bE18/DnBUx9dUD3Ory+c
         qOF5/y1Me814lKHDZcPfj/am0vu/DHNSElUYNorBXfKQgmPeQ47rOq4smt5i206DhHTs
         gTpvQd+Qe/H2QMCXJyR6eSG48szOP7zgaa+87Khuc+3648faQd9jBa59/Prnt8yCHxos
         +heA6Sgtth+qd2RMmrz+NqxdHSlQwygmnR+YzU+09Nx60bGkhOFTFyAIgBONM2gyzhir
         zPwg==
X-Forwarded-Encrypted: i=1; AJvYcCV2PwYU4tzQWBKl4sSqguwjj0T4ZbwVjtufB0BSOpQNdoR4xujNCQhbV9cqCw8mnrmAsNdTeJ0Z6eO02+lQCzJJ6kBRN6Kuh5FLFMq5Ijc=
X-Gm-Message-State: AOJu0Yxjn0icpAsdue3CnLkpKIUsfT6zYVqnjs97b9RaT8I/c3QMEWEQ
	Ns60ktUKVinTaD53T8RPTYS2KPi+Jz1lh0vH9+0kCYKfWoLlrsaZwQ5ghAx3xxY=
X-Google-Smtp-Source: AGHT+IFEAur5dlDVikexYq4s8x/G5TPcC91b0437JkcY65Hhw+TbZGEu4+aWv+UI7GGv7JFFrzCB9w==
X-Received: by 2002:a05:622a:5cf:b0:42e:f660:8067 with SMTP id d15-20020a05622a05cf00b0042ef6608067mr2758444qtb.36.1710442041721;
        Thu, 14 Mar 2024 11:47:21 -0700 (PDT)
Message-ID: <1356dd16-03e1-4c01-9aac-597a127dea85@citrix.com>
Date: Thu, 14 Mar 2024 18:47:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] xen: Swap find_first_set_bit() for ffsl() - 1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-7-andrew.cooper3@citrix.com>
 <ba0552cc-10eb-460d-89a1-ffc43fe75542@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ba0552cc-10eb-460d-89a1-ffc43fe75542@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/03/2024 2:30 pm, Jan Beulich wrote:
> On 13.03.2024 18:27, Andrew Cooper wrote:
>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -641,7 +641,7 @@ struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
>>      if ( contig_mask )
>>      {
>>          /* See pt-contig-markers.h for a description of the marker scheme. */
>> -        unsigned int i, shift = find_first_set_bit(contig_mask);
>> +        unsigned int i, shift = ffsl(contig_mask) - 1;
> The need for subtracting 1 is why personally I dislike ffs() / ffsl() (and
> why I think find_first_set_bit() and __ffs() (but no __ffsl()) were
> introduced).

It's sad that there are competing APIs with different bit-labelling, but
the optimiser does cancel the -1 with arch_ffs() (for at least x86 and
ARM that I studied in detail).

I firmly believe that fewer APIs which are fully well defined (and can
optimise based on the compiler's idea of safety) is still better than a
maze of APIs with different behaviours.

> But what I first of all would like to have clarification on is what your
> (perhaps just abstract at this point) plans are wrt ffz() / ffzl().
> Potential side-by-side uses would be odd now, and would continue to be odd
> if the difference in bit labeling was retained. Since we're switching to
> a consolidated set of basic helpers, such an anomaly would better not
> survive imo.

I honestly hadn't got that far yet.  I was mainly trying to dis-entangle
the existing mess so RISC-V wasn't making it yet-worse.

But yes - it warrants thinking about.


I was intending to do the fls() next then popcnt().   The latter has
quite a lot of cleanup wanting to come with it, and is more
architecturally invasive, and I know I've got a years-old outstanding
piece of work to try and do popcnt more nicely on x86.

I have wanted ffz() in the past.  I think I just went with explicit ~
because I didn't want to continue this debate at the time.

However, I (very much more) do not want a situation where ffs() and
ffz() have different bit-labellings.


There are no builtins, and having now studied the architectures we care
about... https://godbolt.org/z/KasP41n1e ...not even x86 has a "count
leading/trailing zeros" instruction.

So using ffs(~val) really will get you the best code generation
available, and seeing as it halves the number of bitops to maintain, I
think this is the best tradeoff overall.

I intend to put ffz() and __ffs() into linux-compat.h and leave them
there to discourage their use generally.

~Andrew

