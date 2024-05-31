Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 267AA8D5CC5
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 10:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733454.1139721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxik-0006Kl-DD; Fri, 31 May 2024 08:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733454.1139721; Fri, 31 May 2024 08:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxik-0006Hf-AW; Fri, 31 May 2024 08:34:42 +0000
Received: by outflank-mailman (input) for mailman id 733454;
 Fri, 31 May 2024 08:34:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tcd8=NC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCxij-0005kb-BP
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 08:34:41 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e852ede-1f28-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 10:34:39 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-794ba2d4579so120960885a.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 01:34:39 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ae4b406549sm4912126d6.100.2024.05.31.01.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 01:34:38 -0700 (PDT)
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
X-Inumbo-ID: 9e852ede-1f28-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717144478; x=1717749278; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LKiAmvQOzZQsFP46IA5w5fikv5CZ3YmraqhDhLdCOpA=;
        b=FC3Wntfx+3ZSZZnGC1zJ5r+nmwU7bIU7SSHe9uO/hta05OORiUWMDmyu/wwMfBtmKA
         p6mDKAwOQzp32ETPF+lGqzSR/NeMLSMzvIdw9sjgUnoUcIuuug5xo4paBpe53rTRRm58
         8aNnvoGYUWprYL8h70W2X8ZuPzEH60iBLIe8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717144478; x=1717749278;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKiAmvQOzZQsFP46IA5w5fikv5CZ3YmraqhDhLdCOpA=;
        b=cidwgu9T4kaUX+8VNuIQvDPXfX3bBMtw+HN6AsEvvmXbOyAfX3C2AoYFl1rql0b/jB
         S5O5InDaksyL7Z0og4xk+6UD8NaChOwECP+I9Noau7eOfTyqv2Oasz8LeulpMAA9b62D
         SiZhlviLa7O+sov6bC9l4LSn8PfQCfl2ij1hkbFlPyJcHVRbk618xea6097MIeC65KZA
         jo5EXAuxJolA3TmN1cGn+ZSdbFvLqE5DzjsgF2pkNWzs9tc7BeGAeZ3ZwKKW2Lc5PqZU
         jS0fqMdyVQieIMxmI+nViiyCFRbYJkZ1Ordc6s0gnVP9xm4Q0oJO11t7bMRNNIzLE1GV
         auWA==
X-Gm-Message-State: AOJu0Yx450AbUqnHxCcGTG9Ce1ShtBfLb4jfrXtU+AXDczSVyo/mZn+i
	slUqQF5A1bjfpOXvUpL+ePASLoirj1yDPXhetbcgVyXO7fg7hOsEL+g6YIVgFao=
X-Google-Smtp-Source: AGHT+IEp9JXxcYkL+cimxVDP84hYyA+XZHmhbqDGZmF0iKYR+DvfQkRt3PirLZbxciH03wf6Kw2wTA==
X-Received: by 2002:a05:6214:449b:b0:6ae:4dea:6c69 with SMTP id 6a1803df08f44-6aecd6ffdbbmr13062246d6.63.1717144478524;
        Fri, 31 May 2024 01:34:38 -0700 (PDT)
Message-ID: <2917e122-51d8-4caf-ba70-52da70d1342a@citrix.com>
Date: Fri, 31 May 2024 09:34:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] xen/bitops: Implement ffs() in common logic
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-7-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2405301809170.2557291@ubuntu-linux-20-04-desktop>
 <7b974b36b89c216379b86170af9de451@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7b974b36b89c216379b86170af9de451@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/05/2024 7:56 am, Nicola Vetrini wrote:
> On 2024-05-31 03:14, Stefano Stabellini wrote:
>> On Fri, 24 May 2024, Andrew Cooper wrote:
>>> Perform constant-folding unconditionally, rather than having it
>>> implemented
>>> inconsistency between architectures.
>>>
>>> Confirm the expected behaviour with compile time and boot time tests.
>>>
>>> For non-constant inputs, use arch_ffs() if provided but fall back to
>>> generic_ffsl() if not.  In particular, RISC-V doesn't have a builtin
>>> that
>>> works in all configurations.
>>>
>>> For x86, rename ffs() to arch_ffs() and adjust the prototype.
>>>
>>> For PPC, __builtin_ctz() is 1/3 of the size of size of the transform to
>>> generic_fls().  Drop the definition entirely.  ARM too benefits in
>>> the general
>>> case by using __builtin_ctz(), but less dramatically because it using
>>> optimised asm().
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> This patch made me realize that we should add __builtin_ctz,
>> __builtin_constant_p and always_inline to
>> docs/misra/C-language-toolchain.rst as they don't seem to be currently
>> documented and they are not part of the C standard
>>
>> Patch welcome :-)
>>
>
> I can send a patch for the builtins.

That's very kind of you.

In total by the end of this series, we've got __builtin_constant_p() 
(definitely used elsewhere already), and __builtin_{ffs,ctz,clz}{,l}() 
(3x primitives, 2x input types).

If we're going for a list of the primitive operations, lets add
__builtin_popcnt{,l}() too right away, because if it weren't for 4.19
code freeze, I'd have cleaned up the hweight() helpers too.

~Andrew

