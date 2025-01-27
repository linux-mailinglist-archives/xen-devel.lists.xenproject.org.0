Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ACDA1DB3E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 18:22:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878158.1288336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSow-000658-V1; Mon, 27 Jan 2025 17:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878158.1288336; Mon, 27 Jan 2025 17:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSow-00062T-Rz; Mon, 27 Jan 2025 17:22:46 +0000
Received: by outflank-mailman (input) for mailman id 878158;
 Mon, 27 Jan 2025 17:22:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qVGR=UT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tcSov-00062N-G1
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 17:22:45 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51557f66-dcd3-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 18:22:43 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso4724951e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 09:22:43 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c837a299sm1385888e87.207.2025.01.27.09.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 09:22:42 -0800 (PST)
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
X-Inumbo-ID: 51557f66-dcd3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737998563; x=1738603363; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiTH7uX9ZoGcNwWgDFE/IqiZgDgoPqLiw4UAFsSFF58=;
        b=Zluwq6/gC/N2P+E+kLVETSYRiX98QM/a/eczGQ77mHC+N5s2oHKujg4dXxhjGVhFHe
         SwBPiRESQO5zyVCdSh6UA7ngLd/8u2YC8DS+XS+VYeNb5+a5RAvgPM632EC1G58D/x4T
         EDfIu8E1cd+VEJnmhRg5UCS3kLoG1mjrS3XM5UNI+CYsv+YBuBz2YC9KLg2XWpIf6DID
         O8yxj63FKypW+XKrAOxzmV0MTG3LDASmmPDi5dOOpVlACAiTYBqrdmuebX5JlG+Bq8rE
         F+E6Bf6Zz115Q7RxI0idyy8iSGXzQAecJLeV4MWOvJWnm8UKumaKz9yqJR7q0a9dlwwo
         97Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737998563; x=1738603363;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IiTH7uX9ZoGcNwWgDFE/IqiZgDgoPqLiw4UAFsSFF58=;
        b=w2R2c2TpIBciA/vH0pE6fFCAietqcwkV7p6ws3QBLYKKFt+xBKaKHnG0+qPSipDFCu
         DVuxEmyvuFknRzlv6GNWNIevC3EfMOjHi2QprgmWMEBTEwg+zsFURRlDCErd+2Bg5mTj
         NhCXaU7mgurWj/o6wXhuAGj2US9jJiKfnbnPTQ3jZsWzSI2F7Mfe6kvdUHHfgkjJTxG/
         Q0XxUM2YZOibPgfRpCKdYBINy429DCBSxOsKLEUJ+ZndKHgYtseTfGGvrY3XMGyW7gox
         KAo8yI4/XJVdvqHU1k/MaMR6ICQb+pNSx2u/J55FG9Kn9RHhHqI5WQBMLzIVWLBxGTfB
         Tmrg==
X-Forwarded-Encrypted: i=1; AJvYcCXK0rclBRVb8DB8DKl/Sdwe7FiZwXisK/k7hWf5J1ypFSqBd9aRd79nTcFKpXIa3iP+wpJTrewfhIU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4g2a1hsWIlEnHNZ/74jFrLL6hH5xTlH1wdVxHhIFqC0jFlrRe
	LGBQ4fZGkKGpafv1p5rV8lz0bR1XpRLuzLH8Poz5CfnP2ZRZC0Eu
X-Gm-Gg: ASbGncvBBOP232gZc/6gXZRhl6Gx+hMrGCv1aHAYUuGA0nFl2G1HXmUm7T/3nfBu3HD
	lZSNntkS8YcykPPH9KmocFnBBs1z3P9WytpT6DBkY5vRgbOWwpdO2ZyHS/qP+BJdgpWVtyEbISx
	dkn56Jy+NYC7ng7ZWxq4WK8w/hRY/1spF7h80Lwu9U2p2AbqmLPte7B0F2acN38fcjL4mf7N2vN
	eAqVTc96T3gNx8aKJWp3rirIXe1+GAP4Z6dJF/0PyrRGOrN70P9N20cvAu0FjLWwTJZMsg6YgKl
	DnOV8Exj9S+eNUm5JQ==
X-Google-Smtp-Source: AGHT+IEEuL1KKoYirDmnb1gybHJA74d11LQ9ywuKsQDKWjpFMgdPPRw6+oEYuR2E03TxbigAh2l+Yg==
X-Received: by 2002:a05:6512:3089:b0:542:91a5:4b90 with SMTP id 2adb3069b0e04-543df6e5307mr33317e87.21.1737998562378;
        Mon, 27 Jan 2025 09:22:42 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------60y91bUPPL5GHSd430TXDkF5"
Message-ID: <d9ca4252-1bf0-4257-ad6b-e91240cc5de3@gmail.com>
Date: Mon, 27 Jan 2025 18:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: implement software page table walking
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a304e4f0-709f-4fcd-9847-01fe6ab4b98c@suse.com>

This is a multi-part message in MIME format.
--------------60y91bUPPL5GHSd430TXDkF5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/27/25 1:57 PM, Jan Beulich wrote:
> On 27.01.2025 13:29, Oleksii Kurochko wrote:
>> On 1/27/25 11:06 AM, Jan Beulich wrote:
>>> On 20.01.2025 17:54, Oleksii Kurochko wrote:
>>>> RISC-V doesn't have hardware feature to ask MMU to translate
>>>> virtual address to physical address ( like Arm has, for example ),
>>>> so software page table walking in implemented.
>>>>
>>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>> ---
>>>>    xen/arch/riscv/include/asm/mm.h |  2 ++
>>>>    xen/arch/riscv/pt.c             | 56 +++++++++++++++++++++++++++++++++
>>>>    2 files changed, 58 insertions(+)
>>>>
>>>> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
>>>> index 292aa48fc1..d46018c132 100644
>>>> --- a/xen/arch/riscv/include/asm/mm.h
>>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>>> @@ -15,6 +15,8 @@
>>>>    
>>>>    extern vaddr_t directmap_virt_start;
>>>>    
>>>> +paddr_t pt_walk(vaddr_t va);
>>> In the longer run, is returning just the PA really going to be sufficient?
>>> If not, perhaps say a word on the limitation in the description.
>> In the long run, this function's prototype looks like|paddr_t pt_walk(vaddr_t root, vaddr_t va, bool is_xen)| [1]. However, I'm not sure if it will stay that way,
>> as I think|is_xen| could be skipped, since using|map_table()| should be sufficient (as it now considers|system_state|) and I'm not really sure if I need root argument
>> as initial goal was to use this function for debug only purposes and I've never used it for guest page table (stage-1) walking.
>> Anyway, yes, it is still returning a physical address, and that seems enough to me.
>>
>> Could you share your thoughts on what I should take into account for returning value, probably, I am missing something really useful?
> Often you care about the permissions as well. Sometimes it may even be relevant
> to know the (super-)page size of the mapping.

Perhaps it would be better to change the prototype to:
   bool pt_walk(vaddr_t va, mfn_t *ret_pa);
or even
   void pt_walk(vaddr_t va, mfn_t *ret_pa);
   In this case,|ret_pa = INVALID_MFN| could serve as a signal that|pt_walk()| failed.
If there's a need to return permissions or (super-)page size in the future, another argument could be added.

What do you think? Would this approach be better?

I am also considering returning a structure containing the|mfn| (or|paddr_t|) and adding other properties (such as permissions or
page size) as needed in the future. Both solutions seem more or less equivalent.

~ Oleksii

--------------60y91bUPPL5GHSd430TXDkF5
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
    <div class="moz-cite-prefix">On 1/27/25 1:57 PM, Jan Beulich wrote:<br>
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
    <pre>What do you think? Would this approach be better?

I am also considering returning a structure containing the <code>mfn</code> (or <code>paddr_t</code>) and adding other properties (such as permissions or
page size) as needed in the future. Both solutions seem more or less equivalent.

~ Oleksii
</pre>
  </body>
</html>

--------------60y91bUPPL5GHSd430TXDkF5--

