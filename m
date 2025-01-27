Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D2FA1D5EA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 13:30:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877814.1287958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcOFL-0007RB-6C; Mon, 27 Jan 2025 12:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877814.1287958; Mon, 27 Jan 2025 12:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcOFL-0007PM-33; Mon, 27 Jan 2025 12:29:43 +0000
Received: by outflank-mailman (input) for mailman id 877814;
 Mon, 27 Jan 2025 12:29:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qVGR=UT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tcOFJ-0007PE-L8
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 12:29:41 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60827661-dcaa-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 13:29:39 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-30219437e63so55762111fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 04:29:39 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bc198b7sm14391191fa.81.2025.01.27.04.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 04:29:38 -0800 (PST)
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
X-Inumbo-ID: 60827661-dcaa-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737980979; x=1738585779; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVHbBRjYFnq5W32t9KKnPipbCZD3giM7Ir5EHURE8Bo=;
        b=NXxlrMONvzkZttk/ykrMrrqDK2Hg6JxmafaOHBYLqjhiuGED+PsgSqj8eQp/+xFnWx
         mguxAh7rLiN8idLBj5ExQrxjivKBOxp5lsIyQhod4Vn3z9Hy6zi6ycZpm55DM31vCilq
         VRHpU9W6LV1Sfp4lj7eGSbXh1gpvUxsxGr7EiSSsLaLQG8I4M/V1pWlMPwpclMpexyEI
         964c0mT15I2Oy1XcI+5HTDoi5mC/YsRTJ0BLIXe8nKoiYvrjuqBE/j5qWpeYY0usifue
         CS+E3gyENIXWOLS4kIGYSP9OTB9jtYHFnL6aP7mPE5OSQ6xXfYkqnko0PLjGvblnjH7R
         x+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737980979; x=1738585779;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PVHbBRjYFnq5W32t9KKnPipbCZD3giM7Ir5EHURE8Bo=;
        b=MSLsWgBJXJwn30zCnm8IY22OQGo2vkk4vKhffnFYsArFPnYB5dQ7+nzjyksfUw8q0i
         5BS8T8qe6hDbnE7CY0Z3xeahKAClSCq8X38rh+LuznJyefq9Z5J6Dl6kAv+wyhrT1NfM
         KlHd+AmtKStZnymnHjMRzST2/Gk0wa3wkQTRNSDibGNo0JuO8OYg0deEduqvD2YzRBQ+
         K3/lug+AlOBe0YUsygi/dhECWABgOXvEiMppB/6MqyUaKHn1SOe8D8CTJS5ZMw8Y14NG
         q9RUiebnERvHt5A7UmCAUEmV/ZwEL9rAjvy2xHquOCIox9PLhmVl5sFOLJqq1bYBRTxx
         dw7A==
X-Forwarded-Encrypted: i=1; AJvYcCVaXMUCVYBhVbJce14BIiHPYZctIQVvZXaI5bWzOmOhr0mmxryuEB5md7lzALFtAH6HTXsL9+5q6+0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVG59dwZQgYS8bUBjhkb60rgyvvEv4e8Q3oIlcr/mMbX6ZHrDA
	7S96q2ec2HJqsO51fZqFzViavUG31a5N15qBhJsM7RKugUy/epG/
X-Gm-Gg: ASbGncudwtsYA1o7ivIC68p09UuKD34KJafyX+sRSqhNyyyUGG6QBA0WOw6OpjxJCJF
	khszuUSXTTn3hQBf6rGnIN+V0jsPFCqQXhM1wTO0JUGTYfGBlzWFv/Htf1SOaK1j+kE5pHT3SrG
	TSdv2FivbGGi6M9iT+992dpgttz1BkJh366XvBGuRUX77PY6QJhqy+ZAtRfLOQ7y4ZEH0ECAy2h
	tbmnJyEeZK2JZzKtiJ1Uvbq9nAutMncgNNsS2fso6K8gwOooMhQ9dRkcbsjBKJQ/f0DtK/KiPzl
	uVIOII5ieswDCOBpug==
X-Google-Smtp-Source: AGHT+IHLixGdbFeOaNLwLmyrWTuYSTo4l1wcFugTYmodY0UhB1ZoBiWvE0oC3Hz2aXrAl7PSjJYv6g==
X-Received: by 2002:a05:651c:b07:b0:2ff:e219:c6d with SMTP id 38308e7fff4ca-30761bd49d0mr57688641fa.10.1737980978351;
        Mon, 27 Jan 2025 04:29:38 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------ssff8jsbxYqFlRtkuDjhwSor"
Message-ID: <e2290a2a-a3c0-4cfe-b9e9-8cfec0b194a8@gmail.com>
Date: Mon, 27 Jan 2025 13:29:37 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <21bfd2f5-74b8-409e-956c-dd736a3c0be2@suse.com>

This is a multi-part message in MIME format.
--------------ssff8jsbxYqFlRtkuDjhwSor
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/27/25 11:06 AM, Jan Beulich wrote:
> On 20.01.2025 17:54, Oleksii Kurochko wrote:
>> RISC-V doesn't have hardware feature to ask MMU to translate
>> virtual address to physical address ( like Arm has, for example ),
>> so software page table walking in implemented.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>>   xen/arch/riscv/include/asm/mm.h |  2 ++
>>   xen/arch/riscv/pt.c             | 56 +++++++++++++++++++++++++++++++++
>>   2 files changed, 58 insertions(+)
>>
>> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
>> index 292aa48fc1..d46018c132 100644
>> --- a/xen/arch/riscv/include/asm/mm.h
>> +++ b/xen/arch/riscv/include/asm/mm.h
>> @@ -15,6 +15,8 @@
>>   
>>   extern vaddr_t directmap_virt_start;
>>   
>> +paddr_t pt_walk(vaddr_t va);
> In the longer run, is returning just the PA really going to be sufficient?
> If not, perhaps say a word on the limitation in the description.

In the long run, this function's prototype looks like|paddr_t pt_walk(vaddr_t root, vaddr_t va, bool is_xen)| [1]. However, I'm not sure if it will stay that way,
as I think|is_xen| could be skipped, since using|map_table()| should be sufficient (as it now considers|system_state|) and I'm not really sure if I need root argument
as initial goal was to use this function for debug only purposes and I've never used it for guest page table (stage-1) walking.
Anyway, yes, it is still returning a physical address, and that seems enough to me.

Could you share your thoughts on what I should take into account for returning value, probably, I am missing something really useful?

|[1] 
https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/mm.c#L820|

>> +     * initialize `ret` with "impossible" XEN_TABLE_MAP_NOMEM.
>> +    */
>> +    int ret = XEN_TABLE_MAP_NOMEM;
>> +    unsigned int level = HYP_PT_ROOT_LEVEL;
>> +    paddr_t pa = 0;
> Seeing 0 as initializer here, just to double check: You do prevent MFN 0
> to be handed to the page allocator, and you also don't use it "manually"
> anywhere?

MFN 0 could be used when removing the page:https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/riscv/pt.c?ref_type=heads#L251 <https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/riscv/pt.c?ref_type=heads#L251>.

In that case, it would be better to initialize|pa| with|(paddr_t)(-1)|, as this value couldn't be mapped and is safe to use as an invalid value.

>
>> +    pte_t *table;
>> +
>> +    DECLARE_OFFSETS(offsets, va);
>> +
>> +    table = map_table(root);
>> +
>> +    /*
>> +     * Find `pa` of an entry which corresponds to `va` by iterating for each
>> +     * page level and checking if the entry points to a next page table or
>> +     * to a page.
>> +     *
>> +     * Two cases are possible:
>> +     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was find;
>> +     *   (Despite of the name) XEN_TABLE_SUPER_PAGE covers 4k mapping too.
>> +     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
>> +     *   mapped.
>> +     */
>> +    while ( (ret != XEN_TABLE_MAP_NONE) && (ret != XEN_TABLE_SUPER_PAGE) )
>> +    {
>> +        /*
>> +         * This case shouldn't really occur as it will mean that for table
>> +         * level 0 a pointer to next page table has been written, but at
>> +         * level 0 it could be only a pointer to 4k page.
>> +         */
>> +        ASSERT(level <= HYP_PT_ROOT_LEVEL);
>> +
>> +        ret = pt_next_level(false, &table, offsets[level]);
>> +        level--;
>> +    }
>> +
>> +    if ( ret == XEN_TABLE_MAP_NONE )
>> +        dprintk(XENLOG_WARNING, "Is va(%#lx) really mapped?\n", va);
> Even if it's a dprintk(), I'd recommend against adding such.
>
>> +    else if ( ret == XEN_TABLE_SUPER_PAGE )
>> +        pa = pte_to_paddr(*(table + offsets[level + 1]));
> Missing "else if ( ret == XEN_TABLE_NORMAL )" (or maybe simply "else")?

If I am not missing something, we can't be here with ret == XEN_TABLE_NORMAL because we iterating
in the while loop above until we don't find a leaf or until reach level = 0. If we find a leaf then
XEN_TABLE_SUPER_PAGE is returned; otherwise sooner or later we should face a case when next table
(in case when `level`=0 and someone put at this level a pointer to next level, what is a bug) should
be allocated in pt_next_level(), but it will fail because `alloc_tbl`=false is passed to pt_next_level()
and thereby ret=XEN_TABLE_MAP_NONE() will be returned.

Based on your previous comment about dprintk this could could be re-written in the following way:
-    if ( ret == XEN_TABLE_MAP_NONE )
-        dprintk(XENLOG_WARNING, "Is va(%#lx) really mapped?\n", va);
-    else if ( ret == XEN_TABLE_SUPER_PAGE )
+    if ( ret != XEN_TABLE_MAP_NONE )
          pa = pte_to_paddr(*(table + offsets[level + 1]));

>> +    return pa;
> Don't you want to OR in the low 12 bits of VA here (unless "pa" is still 0)?

It is a bug, and IIUC if `pa` isn't 0 it is still need to add the low bits of VA to `pa`:
     return pa | (va & ((1 << PAGE_SHIFT) - 1));
(I think that I saw somewhere a macros to generate masks but can't find where)

Thanks.

~ Oleksii

--------------ssff8jsbxYqFlRtkuDjhwSor
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/27/25 11:06 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:21bfd2f5-74b8-409e-956c-dd736a3c0be2@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.01.2025 17:54, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">RISC-V doesn't have hardware feature to ask MMU to translate
virtual address to physical address ( like Arm has, for example ),
so software page table walking in implemented.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
In the longer run, is returning just the PA really going to be sufficient?
If not, perhaps say a word on the limitation in the description.</pre>
    </blockquote>
    <pre>In the long run, this function's prototype looks like <code>paddr_t pt_walk(vaddr_t root, vaddr_t va, bool is_xen)</code> [1]. However, I'm not sure if it will stay that way,
as I think <code>is_xen</code> could be skipped, since using <code>map_table()</code> should be sufficient (as it now considers <code>system_state</code>) and I'm not really sure if I need root argument
as initial goal was to use this function for debug only purposes and I've never used it for guest page table (stage-1) walking.
Anyway, yes, it is still returning a physical address, and that seems enough to me.</pre>
    <pre>Could you share your thoughts on what I should take into account for returning value, probably, I am missing something really useful?</pre>
    <pre><code><span class="hljs-params"><span class="hljs-params">[1] <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/mm.c#L820">https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/mm.c#L820</a></span></span></code></pre>
    <blockquote type="cite"
      cite="mid:21bfd2f5-74b8-409e-956c-dd736a3c0be2@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+     * initialize `ret` with "impossible" XEN_TABLE_MAP_NOMEM.
+    */
+    int ret = XEN_TABLE_MAP_NOMEM;
+    unsigned int level = HYP_PT_ROOT_LEVEL;
+    paddr_t pa = 0;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Seeing 0 as initializer here, just to double check: You do prevent MFN 0
to be handed to the page allocator, and you also don't use it "manually"
anywhere?</pre>
    </blockquote>
    <pre>MFN 0 could be used when removing the page: <a rel="noopener"
    target="_new"
href="https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/riscv/pt.c?ref_type=heads#L251"><span>https</span><span>://gitlab</span><span>.com</span><span>/xen</span><span>-project</span><span>/xen</span><span>/-/blob</span><span>/staging</span><span>/xen</span><span>/arch</span><span>/riscv</span><span>/pt</span><span>.c</span><span>?ref_type</span><span>=heads</span><span>#L251</span></a>.</pre>
    <pre>In that case, it would be better to initialize <code>pa</code> with <code>(paddr_t)(-1)</code>, as this value couldn't be mapped and is safe to use as an invalid value.</pre>
    <blockquote type="cite"
      cite="mid:21bfd2f5-74b8-409e-956c-dd736a3c0be2@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    pte_t *table;
+
+    DECLARE_OFFSETS(offsets, va);
+
+    table = map_table(root);
+
+    /*
+     * Find `pa` of an entry which corresponds to `va` by iterating for each
+     * page level and checking if the entry points to a next page table or
+     * to a page.
+     *
+     * Two cases are possible:
+     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was find;
+     *   (Despite of the name) XEN_TABLE_SUPER_PAGE covers 4k mapping too.
+     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
+     *   mapped.
+     */
+    while ( (ret != XEN_TABLE_MAP_NONE) &amp;&amp; (ret != XEN_TABLE_SUPER_PAGE) )
+    {
+        /*
+         * This case shouldn't really occur as it will mean that for table
+         * level 0 a pointer to next page table has been written, but at
+         * level 0 it could be only a pointer to 4k page.
+         */
+        ASSERT(level &lt;= HYP_PT_ROOT_LEVEL);
+
+        ret = pt_next_level(false, &amp;table, offsets[level]);
+        level--;
+    }
+
+    if ( ret == XEN_TABLE_MAP_NONE )
+        dprintk(XENLOG_WARNING, "Is va(%#lx) really mapped?\n", va);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Even if it's a dprintk(), I'd recommend against adding such.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    else if ( ret == XEN_TABLE_SUPER_PAGE )
+        pa = pte_to_paddr(*(table + offsets[level + 1]));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Missing "else if ( ret == XEN_TABLE_NORMAL )" (or maybe simply "else")?</pre>
    </blockquote>
    <pre>If I am not missing something, we can't be here with ret == XEN_TABLE_NORMAL because we iterating
in the while loop above until we don't find a leaf or until reach level = 0. If we find a leaf then
XEN_TABLE_SUPER_PAGE is returned; otherwise sooner or later we should face a case when next table
(in case when `level`=0 and someone put at this level a pointer to next level, what is a bug) should
be allocated in pt_next_level(), but it will fail because `alloc_tbl`=false is passed to pt_next_level()
and thereby ret=XEN_TABLE_MAP_NONE() will be returned.

Based on your previous comment about dprintk this could could be re-written in the following way:
-    if ( ret == XEN_TABLE_MAP_NONE )
-        dprintk(XENLOG_WARNING, "Is va(%#lx) really mapped?\n", va);
-    else if ( ret == XEN_TABLE_SUPER_PAGE )
+    if ( ret != XEN_TABLE_MAP_NONE )
         pa = pte_to_paddr(*(table + offsets[level + 1]));

</pre>
    <blockquote type="cite"
      cite="mid:21bfd2f5-74b8-409e-956c-dd736a3c0be2@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    return pa;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Don't you want to OR in the low 12 bits of VA here (unless "pa" is still 0)?</pre>
    </blockquote>
    <pre>It is a bug, and IIUC if `pa` isn't 0 it is still need to add the low bits of VA to `pa`:
    return pa | (va &amp; ((1 &lt;&lt; PAGE_SHIFT) - 1));
(I think that I saw somewhere a macros to generate masks but can't find where)

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------ssff8jsbxYqFlRtkuDjhwSor--

