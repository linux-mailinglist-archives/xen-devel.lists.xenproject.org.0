Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13ABA46F6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 17:34:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131646.1470621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2ARs-0003vX-MR; Fri, 26 Sep 2025 15:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131646.1470621; Fri, 26 Sep 2025 15:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2ARs-0003u2-Jb; Fri, 26 Sep 2025 15:33:28 +0000
Received: by outflank-mailman (input) for mailman id 1131646;
 Fri, 26 Sep 2025 15:33:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5CHW=4F=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v2ARr-0003tw-Ad
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 15:33:27 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24e41a11-9aee-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 17:33:26 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-63053019880so5068153a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Sep 2025 08:33:26 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353efa5048sm381030866b.31.2025.09.26.08.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 08:33:25 -0700 (PDT)
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
X-Inumbo-ID: 24e41a11-9aee-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758900805; x=1759505605; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tojoC0BlLxgsvtmg60KCMv9JAEcKYuTATendxucjxc=;
        b=cEDzjgvya3HnKo3iAKGYzTSKZcgPQ6D+YLUEmM4SfybMaukrzw2RkEGxq14KxVfl+e
         toxr2ZAI9C7LMK7xlsqxpZL9Z8z2bSGft7010D7Jo3jVoybJNIy5qarByHvB+kGikziw
         Tb5iGN2dfoavfs1zle8pNmVh/U3V7/OIez95hDzJfWAtvz8EnOmhRnbLh6xtilZIrUSm
         wKfUBcQQhkiHTjx5b6DnajpTM1I3t5RaG8hmq1qjZJXet8/F1Hz3huCfLHCz2zEsLL8z
         nZ/Bcqcx6DZp2T0BQ2zbJmcR5uDxSSF/oCnphaAzpkZZ3I8MZKsJ+lrUt88d2BCoK98O
         KbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758900805; x=1759505605;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3tojoC0BlLxgsvtmg60KCMv9JAEcKYuTATendxucjxc=;
        b=gBtV76T6DDFWPWiZe5U81fVJHOJPGZMjvxJ/7zGllB/RidOVKHNf/UqxwsTV+t+M1P
         Tz3b2R88h7uhNbr3qvlUHIoUl8UGbn2kfmPHw8N/WwO/MK1hS/hpbUy7xmmrB3OKTQ8C
         22aiYmpCRXiPlntpLEK1WS/cZ847vToIsG9iHkQyoIpmKWyEFOp2OhDr6ZarNjfPlg3G
         12zGtlMsrS7eacMOWTKEL/O0oeufLjZdXvjmJNwx9bfk9ddonVZJhCMZ2uSKAxFPPf9u
         ZFa45SnIO0zAbJrKuee79k8I1qrRr3m9wfvM7qv+Tu0wRl1PHFqtZbmXpEnPxR6BCbVf
         J+wg==
X-Forwarded-Encrypted: i=1; AJvYcCVS/FYrqPHAbnBz3ZIY8nOZZN5CAxkLfLLhQo5y0e3TmVs7n6kRJctgslEqmizSia2JHLNmAwgVz7Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8nIGFP41FJ/cnQMxJ7nxeW8Laodk4HwmIArigCgzjI1nSa8wy
	xYFmMzm92IJSvRNjSoWIeUMyeNN2iCcXbsrwr8C7LY6ogqn2EAJkE8Y+
X-Gm-Gg: ASbGnctxZV3g0Uxcyt3HSpECS5KbLKn8ZE0EL/PWdaIdgvRkXBi4oDVZ+08+rvA8+g7
	mnHqnpSi6mjV5jTjtZU3jEfD3WoyK8VpBsYYildSF87wOc7H02RojXm9ATOyxIMIl9K/mYg0izl
	EPj4czFTOVn1Leil0wAjcsr+IzmgUdMDB4OaOUPaQOjoB/x3WlCm9ba+4gp6y2FCmKbW4tI/4XZ
	8ew8my/haaGX4PuZ65hYEUtZMcRgyVnvtxo6sjmPSunGabJjm5V73XtHbYXq4bOPVxSiu/x14BT
	4wqaIOmslvn4Mcin1I4YAOfJ6pU5AAvsoCiyShjz5RB98BLx6Kq5HAE+wTiOgq52U2zYSd4HdjI
	6qz+/Ye1yshy50S9W+7QWGkxKH3T3Bn6MuELZCE8g2N213J7QHL7gijz7IpLcji41tRCSgrt0OI
	S9ymFxvk0=
X-Google-Smtp-Source: AGHT+IG0vMPlcMYnYnAoorMYQym2YbNe+38Tm8UPaoGgLk5j1z0xSkkyJQaQdx8Rr5Fv1HaCpux3yA==
X-Received: by 2002:a17:907:9713:b0:b2e:4590:e8ba with SMTP id a640c23a62f3a-b34bd440ee1mr966847466b.40.1758900805325;
        Fri, 26 Sep 2025 08:33:25 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------yIgbcwYEQ24rlZbi1PB2dr0J"
Message-ID: <b31b5905-f022-4478-8742-f91b74474168@gmail.com>
Date: Fri, 26 Sep 2025 17:33:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/18] xen/riscv: Implement p2m_free_subtree() and
 related helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <18ed5517721254a56e992d9cd9bc1a64672eda8a.1758145428.git.oleksii.kurochko@gmail.com>
 <de20c915-e05f-48a7-a2fd-51b4befca525@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <de20c915-e05f-48a7-a2fd-51b4befca525@suse.com>

This is a multi-part message in MIME format.
--------------yIgbcwYEQ24rlZbi1PB2dr0J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/20/25 1:57 AM, Jan Beulich wrote:
> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>> @@ -342,11 +354,147 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>>       return P2M_TABLE_MAP_NONE;
>>   }
>>   
>> +static void p2m_put_foreign_page(struct page_info *pg)
>> +{
>> +    /*
>> +     * It’s safe to call put_page() here because arch_flush_tlb_mask()
>> +     * will be invoked if the page is reallocated before the end of
>> +     * this loop, which will trigger a flush of the guest TLBs.
>> +     */
>> +    put_page(pg);
>> +}
> What is "this loop" referring to in the comment? There's no loop here.

The loop is inside the caller (p2m_put_2m_superpage()):
      ...
      for ( i = 0; i < P2M_PAGETABLE_ENTRIES(1); i++, pg++ )
          p2m_put_foreign_page(pg);

Agree, that comment is pretty confusing. I am not sure it is necessary to
mention a specific loop — the comment would still be correct without
referring to "this loop". So I will rewrite the comment as:

     /*
      * It’s safe to call put_page() here because arch_flush_tlb_mask()
      * will be invoked if the page is reallocated, which will trigger a
      * flush of the guest TLBs.
      */

>
>> +/* Put any references on the page referenced by pte. */
>> +static void p2m_put_page(const pte_t pte, unsigned int level, p2m_type_t p2mt)
>> +{
>> +    mfn_t mfn = pte_get_mfn(pte);
>> +
>> +    ASSERT(pte_is_valid(pte));
>> +
>> +    /*
>> +     * TODO: Currently we don't handle level 2 super-page, Xen is not
>> +     * preemptible and therefore some work is needed to handle such
>> +     * superpages, for which at some point Xen might end up freeing memory
>> +     * and therefore for such a big mapping it could end up in a very long
>> +     * operation.
>> +     */
>> +    switch ( level )
>> +    {
>> +    case 1:
>> +        return p2m_put_2m_superpage(mfn, p2mt);
>> +
>> +    case 0:
>> +        return p2m_put_4k_page(mfn, p2mt);
>> +
>> +    default:
>> +        assert_failed("Unsupported level");
> I don't think assert_failed() is supposed to be used directly. What's
> wrong with using ASSERT_UNREACHABLE() here?

Nothing, I just wanted to have some custom massage. I am okay with
ASSERT_UNREACHABLE(), anyway it will print where ASSERT occurred.

>
>> --- a/xen/arch/riscv/paging.c
>> +++ b/xen/arch/riscv/paging.c
>> @@ -107,6 +107,14 @@ int paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages)
>>       return 0;
>>   }
>>   
>> +void paging_free_page(struct domain *d, struct page_info *pg)
>> +{
>> +    spin_lock(&d->arch.paging.lock);
>> +    page_list_add_tail(pg, &d->arch.paging.freelist);
>> +    ACCESS_ONCE(d->arch.paging.total_pages)++;
> More a question to other REST maintainers than to you: Is this kind of
> use of ACCESS_ONCE() okay? By the wording, one might assume a single
> memory access, yet only x86 can actually carry out an increment (or
> alike) of an item in memory in a single insn.

I thought that ACCESS_ONCE() is more about preventing compiler optimizations
than about ensuring atomicity.

In this specific case, I don’t think ACCESS_ONCE() is really needed since
a spin lock is already being used.


~ Oleksii

--------------yIgbcwYEQ24rlZbi1PB2dr0J
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
    <div class="moz-cite-prefix">On 9/20/25 1:57 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:de20c915-e05f-48a7-a2fd-51b4befca525@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.09.2025 23:55, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -342,11 +354,147 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
     return P2M_TABLE_MAP_NONE;
 }
 
+static void p2m_put_foreign_page(struct page_info *pg)
+{
+    /*
+     * It’s safe to call put_page() here because arch_flush_tlb_mask()
+     * will be invoked if the page is reallocated before the end of
+     * this loop, which will trigger a flush of the guest TLBs.
+     */
+    put_page(pg);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What is "this loop" referring to in the comment? There's no loop here.</pre>
    </blockquote>
    <pre>The loop is inside the caller (p2m_put_2m_superpage()):
     ...
     for ( i = 0; i &lt; P2M_PAGETABLE_ENTRIES(1); i++, pg++ )
         p2m_put_foreign_page(pg);

Agree, that comment is pretty confusing. I am not sure it is necessary to
mention a specific loop — the comment would still be correct without
referring to "this loop". So I will rewrite the comment as:

    /*
     * It’s safe to call put_page() here because arch_flush_tlb_mask()
     * will be invoked if the page is reallocated, which will trigger a
     * flush of the guest TLBs.
     */

</pre>
    <blockquote type="cite"
      cite="mid:de20c915-e05f-48a7-a2fd-51b4befca525@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/* Put any references on the page referenced by pte. */
+static void p2m_put_page(const pte_t pte, unsigned int level, p2m_type_t p2mt)
+{
+    mfn_t mfn = pte_get_mfn(pte);
+
+    ASSERT(pte_is_valid(pte));
+
+    /*
+     * TODO: Currently we don't handle level 2 super-page, Xen is not
+     * preemptible and therefore some work is needed to handle such
+     * superpages, for which at some point Xen might end up freeing memory
+     * and therefore for such a big mapping it could end up in a very long
+     * operation.
+     */
+    switch ( level )
+    {
+    case 1:
+        return p2m_put_2m_superpage(mfn, p2mt);
+
+    case 0:
+        return p2m_put_4k_page(mfn, p2mt);
+
+    default:
+        assert_failed("Unsupported level");
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't think assert_failed() is supposed to be used directly. What's
wrong with using ASSERT_UNREACHABLE() here?</pre>
    </blockquote>
    <pre>Nothing, I just wanted to have some custom massage. I am okay with
ASSERT_UNREACHABLE(), anyway it will print where ASSERT occurred.</pre>
    <blockquote type="cite"
      cite="mid:de20c915-e05f-48a7-a2fd-51b4befca525@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/paging.c
+++ b/xen/arch/riscv/paging.c
@@ -107,6 +107,14 @@ int paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages)
     return 0;
 }
 
+void paging_free_page(struct domain *d, struct page_info *pg)
+{
+    spin_lock(&amp;d-&gt;arch.paging.lock);
+    page_list_add_tail(pg, &amp;d-&gt;arch.paging.freelist);
+    ACCESS_ONCE(d-&gt;arch.paging.total_pages)++;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
More a question to other REST maintainers than to you: Is this kind of
use of ACCESS_ONCE() okay? By the wording, one might assume a single
memory access, yet only x86 can actually carry out an increment (or
alike) of an item in memory in a single insn.</pre>
    </blockquote>
    <pre>I thought that ACCESS_ONCE() is more about preventing compiler optimizations
than about ensuring atomicity.

In this specific case, I don’t think ACCESS_ONCE() is really needed since
a spin lock is already being used.


~ Oleksii
</pre>
  </body>
</html>

--------------yIgbcwYEQ24rlZbi1PB2dr0J--

