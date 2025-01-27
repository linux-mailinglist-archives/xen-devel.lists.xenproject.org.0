Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEA6A1DB7D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 18:42:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878168.1288346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcT6s-00016Z-Db; Mon, 27 Jan 2025 17:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878168.1288346; Mon, 27 Jan 2025 17:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcT6s-00014r-AA; Mon, 27 Jan 2025 17:41:18 +0000
Received: by outflank-mailman (input) for mailman id 878168;
 Mon, 27 Jan 2025 17:41:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qVGR=UT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tcT6q-00010f-9X
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 17:41:16 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2e2afdf-dcd5-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 18:41:06 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54024aa9febso5023380e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 09:41:06 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c83684basm1340780e87.109.2025.01.27.09.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 09:41:05 -0800 (PST)
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
X-Inumbo-ID: e2e2afdf-dcd5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737999666; x=1738604466; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgGt0UWgv/Np04JsWjifwQUIQ9PfPuCBVZ7oSviphrw=;
        b=b9cx0n76VFihzdQeon3OavbZ/KiYSqghvshIzJqYhL4IsLm2xcyj10nvBhc7hunIWd
         MUbevs93YZvCxCJkSk82zkoMMv8X1l6cu52XBFdp9MuVqi8GVaGi/S3QA+9r8Yq8/z4A
         fC9t2/l/eaPIx6nzT+fygQwNO5GWytR9jm9GBW943a7JxJcnaWKtUbJbg7jX71GYTi8Q
         v1UiV8Fc6whyFtTlzLyYZxSM2WPjIWQX9/LEGrK7o+ufyZenw7XhdQv3XIURtewh8/Ql
         7HTXY/C0yJpqnu4c945RFtH8KB5T0/bPfur/hs36rWaSYxBZDJYLbasFT2gRs5yl+pwA
         kuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737999666; x=1738604466;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zgGt0UWgv/Np04JsWjifwQUIQ9PfPuCBVZ7oSviphrw=;
        b=Z2IZf7FWS7EGH8WMXcCz9Ww4hjzyJQVrd6KjhEiHik4j+tKKi7/WNv9n3mkvla0AZj
         LOXo2DgXxZnffhX/rZPefnNF17S2wSwtUYJ/0oMa4futKkxAes1utVh68kBrpVxWj/c4
         G1SaY/UxoSBuYeEqdef2Wyvm+Y4ubdi37BWlnNevGCuX+bnSyJRKFrX7O5mj3eHXzljs
         0MS0K2yClPFcv6E62nBH35/XqmHVDnxrlV47GRIghGPxESRNKRKPeSIMvLeyeHbBY1na
         kEsu+wW9NJKko7VUtpE7WMm+5+ANxOcskqfH/UJFcFbiVKtIDpeIHmhj0qlphbdJeKgJ
         0Oww==
X-Forwarded-Encrypted: i=1; AJvYcCVdefueCi8IFdH5BNRKVQYhhXOfRY9vdi8T38A56yvAv2qZ8uI4wyA/PutnTB8+jJxsF+rIYZgIp5Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxDD7dEBU7TvVwKZJYKRh43HempunCL7+7uT6WYR9qfXnCATop
	P5si/ERBmbG6kIxBJ1e3xXMVvSOE2/H+HvoGptDEV/GKe319W0Zm
X-Gm-Gg: ASbGncv6xTMH57II+iT7BWW5GuL7JjRI+WU0VORwruzBj4LIlwTmq9pscNKNqnKVCbL
	2Gvqq5Ag0ROvEhSqnv1qsb1BzpwcXfLCnECqylQNOWD/rxYlIsDygAuvIAqYb3SagueVewirZ/T
	aKhbr7CmYOf5CSuBvpPJ1YN2FbvKDQdeeAO148jCsvqRohzSST9Eps60bOqCwPxCiSAOoIrdTuW
	LTfYdS8QscTsFyeQYkpw6+Rd33ngS27By7Y4iFVT+L8PkTkSImbHYw6V1YgZcSlI+ucnpqAL/SZ
	kF7lcDO3bq0qsk3/sw==
X-Google-Smtp-Source: AGHT+IF0YCjbqvn/5iYJcQNS/PYdLHDRoSCxQuoIvLYVpZYcJCymOz2g7JCsqJHPMsqUvwte4/Nf4w==
X-Received: by 2002:ac2:4acb:0:b0:540:1a0c:9ba6 with SMTP id 2adb3069b0e04-5439c282d2bmr12671485e87.34.1737999665681;
        Mon, 27 Jan 2025 09:41:05 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------NR3E6JH0lAFy9RT57IGkjVGJ"
Message-ID: <67446e8f-71d4-480e-8566-1a464b6f6639@gmail.com>
Date: Mon, 27 Jan 2025 18:41:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: implement software page table walking
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737391102.git.oleksii.kurochko@gmail.com>
 <00dfc71569bc9971b53e29b36a80e9e020ac61ac.1737391102.git.oleksii.kurochko@gmail.com>
 <21bfd2f5-74b8-409e-956c-dd736a3c0be2@suse.com>
 <e2290a2a-a3c0-4cfe-b9e9-8cfec0b194a8@gmail.com>
 <a304e4f0-709f-4fcd-9847-01fe6ab4b98c@suse.com>
 <d9ca4252-1bf0-4257-ad6b-e91240cc5de3@gmail.com>
Content-Language: en-US
In-Reply-To: <d9ca4252-1bf0-4257-ad6b-e91240cc5de3@gmail.com>

This is a multi-part message in MIME format.
--------------NR3E6JH0lAFy9RT57IGkjVGJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/27/25 6:22 PM, Oleksii Kurochko wrote:
>
>
> On 1/27/25 1:57 PM, Jan Beulich wrote:
>> On 27.01.2025 13:29, Oleksii Kurochko wrote:
>>> On 1/27/25 11:06 AM, Jan Beulich wrote:
>>>> On 20.01.2025 17:54, Oleksii Kurochko wrote:
>>>>> RISC-V doesn't have hardware feature to ask MMU to translate
>>>>> virtual address to physical address ( like Arm has, for example ),
>>>>> so software page table walking in implemented.
>>>>>
>>>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>>> ---
>>>>>    xen/arch/riscv/include/asm/mm.h |  2 ++
>>>>>    xen/arch/riscv/pt.c             | 56 +++++++++++++++++++++++++++++++++
>>>>>    2 files changed, 58 insertions(+)
>>>>>
>>>>> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
>>>>> index 292aa48fc1..d46018c132 100644
>>>>> --- a/xen/arch/riscv/include/asm/mm.h
>>>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>>>> @@ -15,6 +15,8 @@
>>>>>    
>>>>>    extern vaddr_t directmap_virt_start;
>>>>>    
>>>>> +paddr_t pt_walk(vaddr_t va);
>>>> In the longer run, is returning just the PA really going to be sufficient?
>>>> If not, perhaps say a word on the limitation in the description.
>>> In the long run, this function's prototype looks like|paddr_t pt_walk(vaddr_t root, vaddr_t va, bool is_xen)| [1]. However, I'm not sure if it will stay that way,
>>> as I think|is_xen| could be skipped, since using|map_table()| should be sufficient (as it now considers|system_state|) and I'm not really sure if I need root argument
>>> as initial goal was to use this function for debug only purposes and I've never used it for guest page table (stage-1) walking.
>>> Anyway, yes, it is still returning a physical address, and that seems enough to me.
>>>
>>> Could you share your thoughts on what I should take into account for returning value, probably, I am missing something really useful?
>> Often you care about the permissions as well. Sometimes it may even be relevant
>> to know the (super-)page size of the mapping.
> Perhaps it would be better to change the prototype to:
>    bool pt_walk(vaddr_t va, mfn_t *ret_pa);
> or even
>    void pt_walk(vaddr_t va, mfn_t *ret_pa);
>    In this case,|ret_pa = INVALID_MFN| could serve as a signal that|pt_walk()| failed.
> If there's a need to return permissions or (super-)page size in the future, another argument could be added.
> What do you think? Would this approach be better?

We have to return mfn_t or paddr_t as pt_walk() is used invmap_to_mfn().

~ Oleksii

>
> I am also considering returning a structure containing the|mfn| (or|paddr_t|) and adding other properties (such as permissions or
> page size) as needed in the future. Both solutions seem more or less equivalent.
>
> ~ Oleksii
--------------NR3E6JH0lAFy9RT57IGkjVGJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/27/25 6:22 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d9ca4252-1bf0-4257-ad6b-e91240cc5de3@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 1/27/25 1:57 PM, Jan Beulich
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:a304e4f0-709f-4fcd-9847-01fe6ab4b98c@suse.com">
        <pre class="moz-quote-pre" wrap=""><pre wrap=""
        class="moz-quote-pre">On 27.01.2025 13:29, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
        class="moz-quote-pre">On 1/27/25 11:06 AM, Jan Beulich wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
        class="moz-quote-pre">On 20.01.2025 17:54, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
        class="moz-quote-pre">RISC-V doesn't have hardware feature to ask MMU to translate
virtual address to physical address ( like Arm has, for example ),
so software page table walking in implemented.

Signed-off-by: Oleksii Kurochko<a class="moz-txt-link-rfc2396E"
        href="mailto:oleksii.kurochko@gmail.com" moz-do-not-send="true">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
  xen/arch/riscv/include/asm/mm.h |  2 ++
  xen/arch/riscv/pt.c             | 56 +++++++++++++++++++++++++++++++++
  2 files changed, 58 insertions(+)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 292aa48fc1..d46018c132 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -15,6 +15,8 @@
  
  extern vaddr_t directmap_virt_start;
  
+paddr_t pt_walk(vaddr_t va);
</pre></blockquote><pre wrap="" class="moz-quote-pre">In the longer run, is returning just the PA really going to be sufficient?
If not, perhaps say a word on the limitation in the description.
</pre></blockquote><pre wrap="" class="moz-quote-pre">In the long run, this function's prototype looks like|paddr_t pt_walk(vaddr_t root, vaddr_t va, bool is_xen)| [1]. However, I'm not sure if it will stay that way,
as I think|is_xen| could be skipped, since using|map_table()| should be sufficient (as it now considers|system_state|) and I'm not really sure if I need root argument
as initial goal was to use this function for debug only purposes and I've never used it for guest page table (stage-1) walking.
Anyway, yes, it is still returning a physical address, and that seems enough to me.

Could you share your thoughts on what I should take into account for returning value, probably, I am missing something really useful?
</pre></blockquote><pre wrap="" class="moz-quote-pre">Often you care about the permissions as well. Sometimes it may even be relevant
to know the (super-)page size of the mapping.</pre></pre>
      </blockquote>
      <div
class="group/conversation-turn relative flex w-full min-w-0 flex-col agent-turn">
        <div class="flex-col gap-1 md:gap-3">
          <div class="flex max-w-full flex-col flex-grow">
            <div data-message-author-role="assistant"
              data-message-id="452652fc-e319-4d3f-8fe8-e9df6f7b8a45"
              dir="auto"
class="min-h-8 text-message flex w-full flex-col items-end gap-2 whitespace-normal break-words text-start [.text-message+&amp;]:mt-5"
              data-message-model-slug="gpt-4o">
              <div
class="flex w-full flex-col gap-1 empty:hidden first:pt-[3px]">
                <div
class="markdown prose w-full break-words dark:prose-invert light">
                  <pre>Perhaps it would be better to change the prototype to:
  bool pt_walk(vaddr_t va, mfn_t *ret_pa);
or even
  void pt_walk(vaddr_t va, mfn_t *ret_pa);
  In this case, <code>ret_pa = INVALID_MFN</code> could serve as a signal that <code>pt_walk()</code> failed.
If there's a need to return permissions or (super-)page size in the future, another argument could be added.</pre>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <pre>What do you think? Would this approach be better?</pre>
    </blockquote>
    <pre>We have to return mfn_t or paddr_t as pt_walk() is used in <span
    style="white-space: pre-wrap">vmap_to_mfn().</span></pre>
    <pre><span style="white-space: pre-wrap">
</span></pre>
    <pre><span style="white-space: pre-wrap">~ Oleksii
</span></pre>
    <blockquote type="cite"
      cite="mid:d9ca4252-1bf0-4257-ad6b-e91240cc5de3@gmail.com">
      <pre>

I am also considering returning a structure containing the <code>mfn</code> (or <code>paddr_t</code>) and adding other properties (such as permissions or
page size) as needed in the future. Both solutions seem more or less equivalent.

~ Oleksii
</pre>
    </blockquote>
  </body>
</html>

--------------NR3E6JH0lAFy9RT57IGkjVGJ--

