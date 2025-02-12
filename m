Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E149A325B7
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 13:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886413.1296068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiBe9-0007S4-Bq; Wed, 12 Feb 2025 12:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886413.1296068; Wed, 12 Feb 2025 12:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiBe9-0007Ps-8a; Wed, 12 Feb 2025 12:15:17 +0000
Received: by outflank-mailman (input) for mailman id 886413;
 Wed, 12 Feb 2025 12:15:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeD=VD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tiBe8-0007Pk-4U
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 12:15:16 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 026e795c-e93b-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 13:15:12 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so788803e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 04:15:12 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545049343adsm1334859e87.166.2025.02.12.04.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 04:15:11 -0800 (PST)
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
X-Inumbo-ID: 026e795c-e93b-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739362512; x=1739967312; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPdLZD5ivIZZb/+0mtABuC2A/9i3q/jJKrJuPST0F2Q=;
        b=lpIP3FS25vEzpEllnvdaUHlCcgL3RoGdeEz2Zbu206w5EliHzjRzKtNbRstAkZt9bG
         0DMndpIErH5YID+9vNW0FTF0ddMWJ4YhHePvBU+F6ZEwheahBhf3wj+q0XPHYVx8KkST
         ExO1pNfj/QuyoYL9tl60j6vAjlEIHgT7l1FU3GRpURPibt9ORGLT4q2zbWqeBw7K912q
         hY5tgMp+voZgnM+ObKU4x9JoYO2Qs0YP5SxS3cjS0m9HtoYfQ6bggQ6OS6KOeTAoxvX9
         VX/rzj7SoneJIofVaYxPxcrijc8crJlyT28cJxOZ7dKkpOz0y39m9cVK+4dFfzt3YU5Y
         B77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739362512; x=1739967312;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iPdLZD5ivIZZb/+0mtABuC2A/9i3q/jJKrJuPST0F2Q=;
        b=v3V73A/O5IN3t8LXoCf0QfOlRfqHg3oVm9zgnzCpXksW7aOE8Iy42B9NQfO1m/pER2
         n/P/g7BQLZkLv/yC8f+W2nHjdP1mPXb/SEQEumJI6SftadDzpVEaIel3QSomlDrmz1uQ
         cZ2T9DAN5JaqcfqoU/uRitWZo0MeBeaNc2fsiervyHEtYGtRFZ5Xv3aL3IyRcloWImc5
         76S7blgoRC/7lBn5JrF315awMai+Gt0vNKjwiDC0s2mkkgqJ2QCVbDlMrH+AW/UYdds1
         DWuwXPw89R8wRZRVBKL2ph73rdPEAgFWIlXJTWmSQFjj9wo7IDcJriNBQgBzhXg3VYm8
         /SnA==
X-Forwarded-Encrypted: i=1; AJvYcCVaZkJkEB4ozPeM/lrHJLZP1xJkvevrbVjEYJXU7+gU6HOU12Ztec/L/MsToyS7rSOfiBItkzu6K9A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd+fKWaT0fqg+2PtQ/CkCqqptXqy35bSLOA2RXKVGPQxcZMexS
	twz3wRo9C6UQX00y1pJInzi0VLwxu2SzkDoelfhX3syCFUlxNR64
X-Gm-Gg: ASbGncszkzwQxdGluw21m33rbgNhEVCRlvXVp4/OhrWx0QwGQ1ElOgFOU1rjf95P9vq
	sdiCpRVtoQygJ4jnu1QuP9XI/jvCjLqQ3auJVaGps+9WcuUHu+zdegf/YIsnVEmaufDAz979v9j
	y3Gtup6p+EGdTYujGQLJGnjPHTyf8Sw6k3W/RD3Hc/vf9gFI+0aPKze4n8o88pDzAsULEs8+j7d
	iPQRzJ2Oybk5CttfDJz3Q2hAT/cVNZB27Niy1BktJJSlW/gkG20pUdTQgXl2F9bPpfBPyDbgHmi
	u9ssQgVt38JpX1TJAA9xS61XWbI=
X-Google-Smtp-Source: AGHT+IFW85AMLsUjxYGfxd3KaPDVNS+7tp9RsTZKlQLwB+IB+Mtvz1ajejvKhlwgILx9yp6kRS+wsA==
X-Received: by 2002:a05:6512:3e0b:b0:545:56f:385e with SMTP id 2adb3069b0e04-54511c45525mr2260698e87.14.1739362511680;
        Wed, 12 Feb 2025 04:15:11 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------lMYEln0v04R91NK5OUhujhG3"
Message-ID: <11d69cd5-e24a-45f1-ae12-6d8dc6769aaa@gmail.com>
Date: Wed, 12 Feb 2025 13:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v3 1/3] xen/riscv: implement software page table
 walking
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738933678.git.oleksii.kurochko@gmail.com>
 <e78679b00df63bde40eb3a4d97e3ab9d1faf9382.1738933678.git.oleksii.kurochko@gmail.com>
 <c6916159-d314-4121-b1aa-f5fd26bdb7b1@suse.com>
 <78b67cb7-5bc0-4292-987f-d22e199d83ae@gmail.com>
 <e7d67dd8-5ec1-43e5-b0a1-58302bc67fa0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e7d67dd8-5ec1-43e5-b0a1-58302bc67fa0@suse.com>

This is a multi-part message in MIME format.
--------------lMYEln0v04R91NK5OUhujhG3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/12/25 12:27 PM, Jan Beulich wrote:
> On 12.02.2025 12:13, Oleksii Kurochko wrote:
>> On 2/10/25 5:32 PM, Jan Beulich wrote:
>>> On 07.02.2025 14:13, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/pt.c
>>>> +++ b/xen/arch/riscv/pt.c
>>>> @@ -185,6 +185,57 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
>>>>        return XEN_TABLE_NORMAL;
>>>>    }
>>>>    
>>>> +/*
>>>> + * _pt_walk() performs software page table walking and returns the pte_t of
>>>> + * a leaf node or the leaf-most not-present pte_t if no leaf node is found
>>>> + * for further analysis.
>>>> + * Additionally, _pt_walk() returns the level of the found pte.
>>> That's optional, which I think wants expressing here.
>>>
>>>> + */
>>>> +static pte_t *_pt_walk(vaddr_t va, unsigned int *pte_level)
>>>> +{
>>>> +    const mfn_t root = get_root_page();
>>>> +    unsigned int level;
>>>> +    pte_t *table;
>>>> +
>>>> +    DECLARE_OFFSETS(offsets, va);
>>>> +
>>>> +    table = map_table(root);
>>> This mapping operation doesn't look to have a counterpart. Aiui ...
>>>
>>>> +    /*
>>>> +     * Find `table` of an entry which corresponds to `va` by iterating for each
>>>> +     * page level and checking if the entry points to a next page table or
>>>> +     * to a page.
>>>> +     *
>>>> +     * Two cases are possible:
>>>> +     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was found;
>>>> +     *   (Despite the name) XEN_TABLE_SUPER_PAGE also covers 4K mappings. If
>>>> +     *   pt_next_level() is called for page table level 0, it results in the
>>>> +     *   entry being a pointer to a leaf node, thereby returning
>>>> +     *   XEN_TABLE_SUPER_PAGE, despite of the fact this leaf covers 4k mapping.
>>>> +     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
>>>> +     *   mapped.
>>>> +     */
>>>> +    for ( level = HYP_PT_ROOT_LEVEL; ; --level )
>>>> +    {
>>>> +        int ret = pt_next_level(false, &table, offsets[level]);
>>> ... the mapping may be replaced here, but a new mapping will then still
>>> be held by this function and ...
>>>
>>>> +        if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
>>>> +            break;
>>>> +
>>>> +        ASSERT(level);
>>>> +    }
>>>> +
>>>> +    if ( pte_level )
>>>> +        *pte_level = level;
>>>> +
>>>> +    return table + offsets[level];
>>>> +}
>>> ... the final one then be transferred to the caller.
>>>
>>>> +pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
>>>> +{
>>>> +    return *_pt_walk(va, pte_level);
>>>> +}
>>> Hence aiui there needs to be an unmap operation here.
>> As _pt_walk() returns page table entry, it is needed to transform entry to table.
>>
>> Do we have any function in Xen for that?
> I don't understand. Both unmap_domain_page() and pmap_unmap() ignore
> the low bits of the passed in address.

Missed that. Then it is safe to use unmap_table() with page table entry.

Thanks.

~ Oleksii

>> Or the best I can do is:
>>     pte_t *table = *_pt_walk(va, pte_level) - TABLE_OFFSET(pt_linear_offset(*pte_level, va)
>> (of course, it is needed to check if pte_level isn't null and do some extra actions if it is NULL)
>>
>> As an option, as all page tables are PAGE_SIZE aligned, we could use PAGE_OFFSET():
>>    pte_t *entry = _pt_walk(va, pte_level);
>>    pte_t *table = PAGE_OFFSET(entry);
>>
>> ~ Oleksii
>>
>>
--------------lMYEln0v04R91NK5OUhujhG3
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
    <div class="moz-cite-prefix">On 2/12/25 12:27 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e7d67dd8-5ec1-43e5-b0a1-58302bc67fa0@suse.com">
      <pre wrap="" class="moz-quote-pre">On 12.02.2025 12:13, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 2/10/25 5:32 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 07.02.2025 14:13, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -185,6 +185,57 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
      return XEN_TABLE_NORMAL;
  }
  
+/*
+ * _pt_walk() performs software page table walking and returns the pte_t of
+ * a leaf node or the leaf-most not-present pte_t if no leaf node is found
+ * for further analysis.
+ * Additionally, _pt_walk() returns the level of the found pte.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">That's optional, which I think wants expressing here.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ */
+static pte_t *_pt_walk(vaddr_t va, unsigned int *pte_level)
+{
+    const mfn_t root = get_root_page();
+    unsigned int level;
+    pte_t *table;
+
+    DECLARE_OFFSETS(offsets, va);
+
+    table = map_table(root);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">This mapping operation doesn't look to have a counterpart. Aiui ...

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    /*
+     * Find `table` of an entry which corresponds to `va` by iterating for each
+     * page level and checking if the entry points to a next page table or
+     * to a page.
+     *
+     * Two cases are possible:
+     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was found;
+     *   (Despite the name) XEN_TABLE_SUPER_PAGE also covers 4K mappings. If
+     *   pt_next_level() is called for page table level 0, it results in the
+     *   entry being a pointer to a leaf node, thereby returning
+     *   XEN_TABLE_SUPER_PAGE, despite of the fact this leaf covers 4k mapping.
+     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
+     *   mapped.
+     */
+    for ( level = HYP_PT_ROOT_LEVEL; ; --level )
+    {
+        int ret = pt_next_level(false, &amp;table, offsets[level]);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... the mapping may be replaced here, but a new mapping will then still
be held by this function and ...

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+        if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
+            break;
+
+        ASSERT(level);
+    }
+
+    if ( pte_level )
+        *pte_level = level;
+
+    return table + offsets[level];
+}
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... the final one then be transferred to the caller.

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
+{
+    return *_pt_walk(va, pte_level);
+}
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Hence aiui there needs to be an unmap operation here.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
As _pt_walk() returns page table entry, it is needed to transform entry to table.

Do we have any function in Xen for that?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't understand. Both unmap_domain_page() and pmap_unmap() ignore
the low bits of the passed in address.</pre>
    </blockquote>
    <pre>Missed that. Then it is safe to use unmap_table() with page table entry.

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:e7d67dd8-5ec1-43e5-b0a1-58302bc67fa0@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Or the best I can do is:
   pte_t *table = *_pt_walk(va, pte_level) - TABLE_OFFSET(pt_linear_offset(*pte_level, va)
(of course, it is needed to check if pte_level isn't null and do some extra actions if it is NULL)

As an option, as all page tables are PAGE_SIZE aligned, we could use PAGE_OFFSET():
  pte_t *entry = _pt_walk(va, pte_level);
  pte_t *table = PAGE_OFFSET(entry);

~ Oleksii


</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------lMYEln0v04R91NK5OUhujhG3--

