Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DF1BA95AB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 15:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132904.1471120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3DxC-0007xZ-Bz; Mon, 29 Sep 2025 13:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132904.1471120; Mon, 29 Sep 2025 13:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3DxC-0007v7-97; Mon, 29 Sep 2025 13:30:10 +0000
Received: by outflank-mailman (input) for mailman id 1132904;
 Mon, 29 Sep 2025 13:30:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M4Dr=4I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v3DxA-0007v1-Rw
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 13:30:08 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69a15753-9d38-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 15:30:06 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6349e3578adso8806782a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 06:30:06 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3629badsm7649720a12.9.2025.09.29.06.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 06:30:05 -0700 (PDT)
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
X-Inumbo-ID: 69a15753-9d38-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759152606; x=1759757406; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoFmK086RkMBGflYJD4fDTytSAuNZZfh2xt7GTMgSbA=;
        b=PyzgD0+yKxLTf97xojphoiSHKnBOJrFfc3+/cWMI9iSq+mpAMBFH56NzI0eD8LyxJl
         10MAEu69dlTaC95QFE2+0czk4iihQbZcBdj4DjAzzpBp5+NYHuQjWGFxDbx36xiythcZ
         qDPTEkLGQFf34jw5zdvI82ETpvfLQtDs8eT9aE9WlLJ1KA0H6TWybmEaBsmlDgn/l3KC
         wLsXVGpJVP8ArRydM7T3KzIIrgzVIZuC+m56rfQJuwVFPf5KAQ4JtHNuV5XznJ9LUuJP
         JWskt8DnISD4HDY09eIS325HrkE0lyN4IynLD6UPJPpPXNIi/xGkz/mxs/6t7Xks38Gb
         zYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759152606; x=1759757406;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LoFmK086RkMBGflYJD4fDTytSAuNZZfh2xt7GTMgSbA=;
        b=n/kuob1r7J6G6KirjkAmhHVaJDJJaNnMDVJ/P8qOK/Dfh+9xyUf2URefLfUYwtv2FJ
         GHLKrnGKq4asW1dOkhhwHdF1RensUTK4CkT6fBKFw+Z9l6+eJ1UNu2V02sPLNbT9TQqt
         hw56vytDM8xWQo8AgGSC5CkKy88XFKZYXQF8ft+QFYI0i9bqoZ8xoJ3WJkzIPonPMuUH
         Ok73ezwLi/wAi7KQEfxkrJQXARXiDka7bEuWG5lYzC8mZs0/HFQ4ehEjRzpFoN4shQwe
         1qMrqkHs9T+feeLeHnTTWdKjJfUZajAfxoRQq3QiN3QCHjNurtpFTP2bhUYKGuNf3a8w
         jD8g==
X-Forwarded-Encrypted: i=1; AJvYcCVc3tACPts7DEHL+ZLnb/6o61Qtikk8+kkHbot/jkYOvyGdwXYS4wHUKKV9PEvka/ejy3S/HwEUhIM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuztJgStJW4dWVHfdPAOZGgb0VZpna0mgfIAVAiKvNpBhIWhWv
	Q44vhaalXKkK8qjvU9XUTPj3ROMxKHz6MJ9JPh/h5+EBeq8qT60U24/0
X-Gm-Gg: ASbGncsIP5kKfnvvK1/GGFnygo3wfX1esCEPpujs1ttGnC81CrVG/wlSoGb3bgC+EFL
	47LSCS1QsskNYJ0re4l9i+hmiYD8xTBwA4TOKFu04gBCrkokX6xv3S5FC6dMazlaWAkTTzbrLGo
	TjRNmyPB4tEHVd/3l4fKbT2YyNYi4lQdHe9FdPLbT0fSXmo9s+LS8jNf0wxtm6G3uPW0UqkhUyt
	Yi7SmSyhgYUzIKdVCDM5mgmGgGrERTOzZCqiL3uPvsqnuIYDNOuBuc4/8lfwaemoBrOFZoCtban
	Dd98eBLKZl8+5clEkg4YDqBnQT9vlP1m6wgJUOfu84nZBNX143JkOmRlYTUZJf3dCZFyReZbh49
	X/YLga3yya3NVQ+5FP+ZbrZbf05zQpsuHci02M5EiyNmU4Sr2dANjT+lZJFm4IANbh2eMstX4
X-Google-Smtp-Source: AGHT+IEevMVPMLGDqxiLwJxvtB7nZhJd8AWn12rS6/ydSAyDLV51NTywfn1Cm5j87XnlZr9z65VkIg==
X-Received: by 2002:a05:6402:274c:b0:634:a992:a2 with SMTP id 4fb4d7f45d1cf-634a99206c6mr14756110a12.1.1759152605591;
        Mon, 29 Sep 2025 06:30:05 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------n2ywK1zf1NJItpgQ7GwXkx16"
Message-ID: <6902c46e-c805-43aa-8753-7b6dc09716ae@gmail.com>
Date: Mon, 29 Sep 2025 15:30:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/18] xen/riscv: Implement p2m_pte_from_mfn() and
 support PBMT configuration
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <4495c8103548447f9a11963574a4cb9e01090e7a.1758145428.git.oleksii.kurochko@gmail.com>
 <7b51f40d-7ac7-460a-891d-afe1d9ab8991@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7b51f40d-7ac7-460a-891d-afe1d9ab8991@suse.com>

This is a multi-part message in MIME format.
--------------n2ywK1zf1NJItpgQ7GwXkx16
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/22/25 6:28 PM, Jan Beulich wrote:
> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>> @@ -318,11 +331,87 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
>>       p2m_write_pte(p, pte, clean_pte);
>>   }
>>   
>> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
>> +static void p2m_set_permission(pte_t *e, p2m_type_t t)
>>   {
>> -    panic("%s: hasn't been implemented yet\n", __func__);
>> +    e->pte &= ~PTE_ACCESS_MASK;
>> +
>> +    e->pte |= PTE_USER;
>> +
>> +    /*
>> +     * Two schemes to manage the A and D bits are defined:
>> +     *   • The Svade extension: when a virtual page is accessed and the A bit
>> +     *     is clear, or is written and the D bit is clear, a page-fault
>> +     *     exception is raised.
>> +     *   • When the Svade extension is not implemented, the following scheme
>> +     *     applies.
>> +     *     When a virtual page is accessed and the A bit is clear, the PTE is
>> +     *     updated to set the A bit. When the virtual page is written and the
>> +     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
>> +     *     address translation is in use and is not Bare, the G-stage virtual
>> +     *     pages may be accessed or written by implicit accesses to VS-level
>> +     *     memory management data structures, such as page tables.
>> +     * Thereby to avoid a page-fault in case of Svade is available, it is
>> +     * necesssary to set A and D bits.
>> +     */
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>> +        e->pte |= PTE_ACCESSED | PTE_DIRTY;
> All of this depending on menvcfg.ADUE anyway, is this really needed? Isn't
> machine mode software responsible for dealing with this kind of page faults
> (just like the hypervisor is reponsible for dealing with ones resulting
> from henvcfg.ADUE being clear)?

In general, I think you are right.

In this case, though, I just wanted to avoid unnecessary page faults for now.
My understanding is that having such faults handled by the hypervisor can indeed
be useful, for example to track which pages are being accessed. However, since we
currently don’t track page usage, handling these traps would only result in
setting the A and D bits and then returning control to the guest.
To avoid this overhead, I chose to set the bits up front.

>
>> +    switch ( t )
>> +    {
>> +    case p2m_map_foreign_rw:
>> +    case p2m_mmio_direct_io:
>> +        e->pte |= PTE_READABLE | PTE_WRITABLE;
>> +        break;
>> +
>> +    case p2m_ram_rw:
>> +        e->pte |= PTE_ACCESS_MASK;
>> +        break;
>> +
>> +    case p2m_invalid:
>> +        e->pte &= ~PTE_VALID;
>> +        break;
>> +
>> +    case p2m_map_foreign_ro:
>> +        e->pte |= PTE_READABLE;
>> +        break;
>> +
>> +    default:
>> +        ASSERT_UNREACHABLE();
>> +        break;
>> +    }
>> +}
>> +
>> +static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
>> +{
>> +    pte_t e = (pte_t) { PTE_VALID };
>> +
>> +    switch ( t )
>> +    {
>> +    case p2m_mmio_direct_io:
>> +        e.pte |= PTE_PBMT_IO;
>> +        break;
> Shouldn't this be limited to the !is_table case (just like you have it ...
>
>> +    default:
>> +        break;
>> +    }
>> +
>> +    pte_set_mfn(&e, mfn);
>> +
>> +    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK) || mfn_eq(mfn, INVALID_MFN));
>> +
>> +    if ( !is_table )
>> +    {
>> +        p2m_set_permission(&e, t);
> ... here? Or else at least ASSERT(!is_table) up there? Personally I think
> all of this !is_table stuff would best be done here.

Agree, that this should be done only for leaf PTEs.
I think that I will move that inside p2m_set_permissions() where
p2m_mmio_direct_io case is handled.

Thanks.

~ Oleksii

--------------n2ywK1zf1NJItpgQ7GwXkx16
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
    <div class="moz-cite-prefix">On 9/22/25 6:28 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7b51f40d-7ac7-460a-891d-afe1d9ab8991@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.09.2025 23:55, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -318,11 +331,87 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
     p2m_write_pte(p, pte, clean_pte);
 }
 
-static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
+static void p2m_set_permission(pte_t *e, p2m_type_t t)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    e-&gt;pte &amp;= ~PTE_ACCESS_MASK;
+
+    e-&gt;pte |= PTE_USER;
+
+    /*
+     * Two schemes to manage the A and D bits are defined:
+     *   • The Svade extension: when a virtual page is accessed and the A bit
+     *     is clear, or is written and the D bit is clear, a page-fault
+     *     exception is raised.
+     *   • When the Svade extension is not implemented, the following scheme
+     *     applies.
+     *     When a virtual page is accessed and the A bit is clear, the PTE is
+     *     updated to set the A bit. When the virtual page is written and the
+     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
+     *     address translation is in use and is not Bare, the G-stage virtual
+     *     pages may be accessed or written by implicit accesses to VS-level
+     *     memory management data structures, such as page tables.
+     * Thereby to avoid a page-fault in case of Svade is available, it is
+     * necesssary to set A and D bits.
+     */
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
+        e-&gt;pte |= PTE_ACCESSED | PTE_DIRTY;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
All of this depending on menvcfg.ADUE anyway, is this really needed? Isn't
machine mode software responsible for dealing with this kind of page faults
(just like the hypervisor is reponsible for dealing with ones resulting
from henvcfg.ADUE being clear)?</pre>
    </blockquote>
    <pre data-start="139" data-end="175">In general, I think you are right.</pre>
    <pre data-start="177" data-end="619">In this case, though, I just wanted to avoid unnecessary page faults for now.
My understanding is that having such faults handled by the hypervisor can indeed
be useful, for example to track which pages are being accessed. However, since we
currently don’t track page usage, handling these traps would only result in
setting the A and D bits and then returning control to the guest.
To avoid this overhead, I chose to set the bits up front.

</pre>
    <blockquote type="cite"
      cite="mid:7b51f40d-7ac7-460a-891d-afe1d9ab8991@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    switch ( t )
+    {
+    case p2m_map_foreign_rw:
+    case p2m_mmio_direct_io:
+        e-&gt;pte |= PTE_READABLE | PTE_WRITABLE;
+        break;
+
+    case p2m_ram_rw:
+        e-&gt;pte |= PTE_ACCESS_MASK;
+        break;
+
+    case p2m_invalid:
+        e-&gt;pte &amp;= ~PTE_VALID;
+        break;
+
+    case p2m_map_foreign_ro:
+        e-&gt;pte |= PTE_READABLE;
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+}
+
+static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
+{
+    pte_t e = (pte_t) { PTE_VALID };
+
+    switch ( t )
+    {
+    case p2m_mmio_direct_io:
+        e.pte |= PTE_PBMT_IO;
+        break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Shouldn't this be limited to the !is_table case (just like you have it ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    default:
+        break;
+    }
+
+    pte_set_mfn(&amp;e, mfn);
+
+    ASSERT(!(mfn_to_maddr(mfn) &amp; ~PADDR_MASK) || mfn_eq(mfn, INVALID_MFN));
+
+    if ( !is_table )
+    {
+        p2m_set_permission(&amp;e, t);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... here? Or else at least ASSERT(!is_table) up there? Personally I think
all of this !is_table stuff would best be done here.</pre>
    </blockquote>
    <pre>Agree, that this should be done only for leaf PTEs.
I think that I will move that inside p2m_set_permissions() where 
p2m_mmio_direct_io case is handled.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------n2ywK1zf1NJItpgQ7GwXkx16--

