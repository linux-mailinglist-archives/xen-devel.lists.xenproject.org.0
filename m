Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFB3BCC2ED
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 10:43:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141050.1475651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v78ho-0000CY-Ru; Fri, 10 Oct 2025 08:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141050.1475651; Fri, 10 Oct 2025 08:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v78ho-000095-Od; Fri, 10 Oct 2025 08:42:28 +0000
Received: by outflank-mailman (input) for mailman id 1141050;
 Fri, 10 Oct 2025 08:42:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LP+B=4T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v78hn-00008z-Qr
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 08:42:27 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b9f26dd-a5b5-11f0-9809-7dc792cee155;
 Fri, 10 Oct 2025 10:42:25 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b00a9989633so250341966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Oct 2025 01:42:25 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c12a62sm180705966b.58.2025.10.10.01.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 01:42:24 -0700 (PDT)
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
X-Inumbo-ID: 0b9f26dd-a5b5-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760085745; x=1760690545; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBK2HJaszjawCeXdIsnPH18eNfldQcmshXEmSq62Iec=;
        b=B4ll1LcQrEYVd8JbtZUs+0QZTmI8NXg8xVdtfg7Lvvjnp5LYaJydDBluehXxXZtAZ7
         BF3UhyIRTD9Pil5i3yb74obVx5nYu6yJ4DXngBc5bbsw3VBha0JKPUZd0oGzul+nBz7s
         uT38nNFvzzHDjk0gRwNWcqSuGIhnQus06fkGnUZ8S+1c+/geHhA5DoiVCVLmHb8L5+La
         lsVYSCWH+wvYPTPYkDbvuMYXBJXm6k8Xve4Znb6IwqlPGJbcOOW17RA/NTnRwMCalLC9
         uYbtKqHC9+we2SXge6yi3OHCQmqRncw60tzKuoKhDX3PkUWpC7LLlUSPfEG3VlQ6KV0J
         IzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760085745; x=1760690545;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NBK2HJaszjawCeXdIsnPH18eNfldQcmshXEmSq62Iec=;
        b=JoSMWIY/ivUKJqj6Q9uRq43XOWv1ByDDih9V7xtWWJhQcEjq5KOmNEzlzr46kzAz3k
         Xoby4x64qVa+5BgUdIHCFZAFIuA1wIA8f0e2LEQL3M5ddmXKR75g2PEYCY1PRB1dzUee
         gAC7ciNWSClJLi+jLgPKOLfse346MMPD8VCYZrnAaSHy0x2kB2+LBWXYYheqv2VbxJRm
         af8ZZ9wW3GdJwn2N3ZVLOwfHpvyCdA1r4ARBnN67WM6nMewFrIEmwuQzVA1bWf4Kfxix
         1m/QQMeANJZoxAvqnCegN66ZazIcR/dKihDAPWk6zdlnC5ZWWI+RcmUoZFThYa5B0rhg
         tfGw==
X-Forwarded-Encrypted: i=1; AJvYcCVknfOELppLTnIAw2LS9ue5o6ctnNQaKJ/HiI4rL39/YOX7+POATasmzgDu/hbfvJVsWJrXMh7Y3bU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQn1QarbPW30F97VCkbYARdROPp2e2qp+IzXc5OGLXHWj6ZCxG
	kawAvUB0F7Ab/JQ6XagJ7OwkE+Ne7d8GeVvlI9mBdUTRCb/sIjhauR4v
X-Gm-Gg: ASbGnctcmKzEnbD/Mjo4Fg63TUA1l4USBI2/unlQGyYZLf9qI028Oq2KtQSpkMmHPzg
	4mC7BbZUjiLEQNvz1NUNASoaJkzFlRxxNMWewdijYoPAeZSHdjFKG8iZlxfK333gd13CyCh1+3y
	K+0jLVQlyx8axfUch1ibG1bgfgO77qo2D3cQDL3nu6QELxYs3+IgQzbiPBWo2shJNWWf3RdABor
	T5G5afnwXmoMmOULW6m3UCK8sitCZxZiOXqQt9Z461Kg6hgnqX4SSNJgJ/x1fXdQ+vb+7+/hlgB
	h7d5q+smNNDH09VD8675RNi9wvWZsvXgvriYOp4R6AWdtau54hlEyNdexoxT/mYfbVUDdmn2u8h
	nQoHbm+gaNQ02LP377Il/SMoLkARrsk+uEFbU8YI9xjJrYZOKilFz+jPApGvJc9SBXwrFalO+lQ
	8ism+7SDZ8+wN+NHchANsSraSY+GPhe2Yi
X-Google-Smtp-Source: AGHT+IGChQoOeCYnpt9j7a1RS94hb0hC6bSODYyz8tBcjOZbNxpVy6H7SL41wMItlKVy17Zg5efGrQ==
X-Received: by 2002:a17:907:3f95:b0:b41:c602:c75d with SMTP id a640c23a62f3a-b50bf7f13d2mr1369328866b.31.1760085744296;
        Fri, 10 Oct 2025 01:42:24 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------U3ORGlMOPwXwOdCUdHQys1CG"
Message-ID: <a4c674cf-045d-4bf1-b66f-96b6be933bca@gmail.com>
Date: Fri, 10 Oct 2025 10:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/18] xen/riscv: introduce metadata table to store P2M
 type
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <f1e346b228ea76eb5bd988e8aab0062cbea58c9d.1758145428.git.oleksii.kurochko@gmail.com>
 <4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com>
 <5142b7c4-ab2e-4f73-a60d-3d23fe255ca7@gmail.com>
 <4232140b-e44a-4d8b-8178-b583a2f4fabc@suse.com>
 <e875ffa9-28c5-4733-b079-babad3734a9c@gmail.com>
 <fb6debfa-cdc2-491c-a488-6a4bf64ca7ad@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <fb6debfa-cdc2-491c-a488-6a4bf64ca7ad@suse.com>

This is a multi-part message in MIME format.
--------------U3ORGlMOPwXwOdCUdHQys1CG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/9/25 2:10 PM, Jan Beulich wrote:
> On 09.10.2025 13:34, Oleksii Kurochko wrote:
>> On 10/7/25 3:25 PM, Jan Beulich wrote:
>>> On 01.10.2025 18:00, Oleksii Kurochko wrote:
>>>> On 9/23/25 12:41 AM, Jan Beulich wrote:
>>>>> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>>>>>> +    if ( *md_pg )
>>>>>> +        metadata = __map_domain_page(*md_pg);
>>> Not this conditional assignment for ...
>>>
>>>>>> +    if ( t < p2m_first_external )
>>>>>> +    {
>>>>>>             pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>>>>>     
>>>>>> -    return rc;
>>>>>> +        if ( metadata )
>>>>>> +            metadata[ctx->index].pte = p2m_invalid;
>>>>>> +    }
>>>>>> +    else
>>>>>> +    {
>>>>>> +        pte->pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
>>>>>> +
>>>>>> +        metadata[ctx->index].pte = t;
>>>>> Afaict metadata can still be NULL when you get here.
>>>> It shouldn't be, because when this line is executed, the metadata page already
>>>> exists or was allocated at the start of p2m_set_type().
>>> ... this reply of yours. And the condition there can be false, in case you
>>> took the domain_crash() path.
>> Oh, right, for some reason, I thought we didn’t return from|domain_crash()|.
>> I’m curious whether calling|domain_crash()| might break something, as some useful
>> data could be freed and negatively affect the internals of|map_regions_p2mt()|.
>>
>> It might make more sense to use|panic()| here instead.
>> Do you have any thoughts or suggestions on this?
> domain_crash() is generally preferable over crashing the system as a whole.
> I don't follow what negative effects you're alluding to. Did you look at
> what domain_crash() does? It doesn't start tearing down the domain, that'll
> still need invoking from the toolstack. A crashed domain will stay around
> with all its resources allocated.

I was confused by|arch_domain_shutdown()|, which is called somewhere inside
|domain_crash()|, since the function name suggests that some resource cleanup
might happen there. There’s also no comment explaining what
|arch_domain_shutdown()| is expected to do or not to do.

However, since it’s an architecture-specific function, we can control its
behavior for a given architecture.

So, if it doesn’t actually start tearing down the domain, I don’t see any
other negative effects.

Anyway, if|domain_crash()| is called, I’m not really sure we need to set
PTE type afterward. We could simply add a|return;| right after the
|domain_crash()| call and so we won't have NULL pointer deference.

Thanks.

~ Oleksii

--------------U3ORGlMOPwXwOdCUdHQys1CG
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
    <div class="moz-cite-prefix">On 10/9/25 2:10 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:fb6debfa-cdc2-491c-a488-6a4bf64ca7ad@suse.com">
      <pre wrap="" class="moz-quote-pre">On 09.10.2025 13:34, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 10/7/25 3:25 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 01.10.2025 18:00, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 9/23/25 12:41 AM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 17.09.2025 23:55, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    if ( *md_pg )
+        metadata = __map_domain_page(*md_pg);
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Not this conditional assignment for ...

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    if ( t &lt; p2m_first_external )
+    {
           pte-&gt;pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
   
-    return rc;
+        if ( metadata )
+            metadata[ctx-&gt;index].pte = p2m_invalid;
+    }
+    else
+    {
+        pte-&gt;pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
+
+        metadata[ctx-&gt;index].pte = t;
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Afaict metadata can still be NULL when you get here.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">It shouldn't be, because when this line is executed, the metadata page already
exists or was allocated at the start of p2m_set_type().
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... this reply of yours. And the condition there can be false, in case you
took the domain_crash() path.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Oh, right, for some reason, I thought we didn’t return from|domain_crash()|.
I’m curious whether calling|domain_crash()| might break something, as some useful
data could be freed and negatively affect the internals of|map_regions_p2mt()|.

It might make more sense to use|panic()| here instead.
Do you have any thoughts or suggestions on this?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
domain_crash() is generally preferable over crashing the system as a whole.
I don't follow what negative effects you're alluding to. Did you look at
what domain_crash() does? It doesn't start tearing down the domain, that'll
still need invoking from the toolstack. A crashed domain will stay around
with all its resources allocated.</pre>
    </blockquote>
    <pre data-start="92" data-end="391">I was confused by <code
    data-start="136" data-end="160">arch_domain_shutdown()</code>, which is called somewhere inside
<code data-start="195" data-end="211">domain_crash()</code>, since the function name suggests that some resource cleanup
might happen there. There’s also no comment explaining what
<code data-start="333" data-end="357">arch_domain_shutdown()</code> is expected to do or not to do.</pre>
    <pre data-start="393" data-end="503">However, since it’s an architecture-specific function, we can control its
behavior for a given architecture.</pre>
    <pre data-start="505" data-end="605">So, if it doesn’t actually start tearing down the domain, I don’t see any
other negative effects.

Anyway, if <code data-start="99" data-end="115">domain_crash()</code> is called, I’m not really sure we need to set
PTE type afterward. We could simply add a <code data-start="208"
    data-end="217">return;</code> right after the
<code data-start="234" data-end="250" data-is-only-node="">domain_crash()</code> call and so we won't have NULL pointer deference.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------U3ORGlMOPwXwOdCUdHQys1CG--

