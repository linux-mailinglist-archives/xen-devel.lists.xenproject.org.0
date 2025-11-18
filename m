Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69FC6A4E3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:29:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165017.1491848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNdD-0001VZ-TN; Tue, 18 Nov 2025 15:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165017.1491848; Tue, 18 Nov 2025 15:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNdD-0001Tl-Q4; Tue, 18 Nov 2025 15:28:35 +0000
Received: by outflank-mailman (input) for mailman id 1165017;
 Tue, 18 Nov 2025 15:28:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kq2N=52=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vLNdC-0001Tf-JC
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:28:34 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dbeab60-c493-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 16:28:32 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b7291af7190so818662766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:28:32 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73718fec4csm1048334166b.39.2025.11.18.07.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 07:28:31 -0800 (PST)
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
X-Inumbo-ID: 3dbeab60-c493-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763479712; x=1764084512; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhNnrcJ5WZfInTMJrlK0pOxHvddBeWvV4qYFYrGOxqU=;
        b=D7XWnGHAMNqZA5COkC2XcVF0QbB6ZhIZhBJ3EnpQ6oSLunc7qHPoXIqXVD3GmnuVBn
         /m+Ey5as+E4e3FeDg/qiNM5CkFDeVSqwKHu9vauLer6A3kGTuZeREWJbyweCCwz07t9G
         49N3bIafni5kRv2K1njG/IVD2L5u8eRBzfee1DuKxUb+ymgYN71RC1Wc2yi28nXpeQsZ
         LdxyADGVqCYWgCAZsqq+DLje3evu9tc6CFUGHBln58G+B7R7v543d8o3XfbpZ5uS/rRM
         0sQDrEYrTC0dUpAQV80w1qKZNDVMzk/LLH1Ea8TYQ2vSzQjeLXKDCHZ4CpyJEJOVQvC4
         LVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763479712; x=1764084512;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jhNnrcJ5WZfInTMJrlK0pOxHvddBeWvV4qYFYrGOxqU=;
        b=Em4h7WMVz/+Apt/ngmj/1UFH2pNavtGP1RTKb6h1djioMaE8tEpNZgxAz/KbK8M/NF
         EM43GiaSq6hhO+HrG5z7Ij1RQFrLcLm9fLUy75/HaBGgDEBnSd4w8Iib8BIumD1Kc5+8
         +o8OsxLqz2z7gaya3+kSTZItZNj4kPXzYOL73lEwYxZOrQuhvA+Kf2mr8VqirUo6uPYG
         KRz1Bj6ryD0XkQmVXeTR3n30ILHEulURV7gY0hzcK3mkBfve8EXRCO8pTFwKyngsALfT
         c1c13GCak03Lki2Fa6SL/7KRbVcopff/ri6fzT30I9TM7NtzcbtaO4U7MrTB0rwDJ/DG
         KHMA==
X-Forwarded-Encrypted: i=1; AJvYcCUTURohqPP87bULdKB7B0zrFtKQHBMMbCNfBbuKMZxwIKjUGSY/dvWbdmA4x2Z4YqSLvhJilOGVtO0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzH8yokKevNu+iPOXhx2Nc7AdxgBwAeri6D7ZmZ+X9NAdQ5urOX
	hotTdF6074pZkPOs+ZxTNTzc3vNJDc1zMVot8kF9rlvYiiVpY94J/EfE
X-Gm-Gg: ASbGncuDLMciYt3GzLJCwE+/INcANayWP+UFLUAbszjibnGsW83M3k1um7i3262kpq5
	c14vTXtNqO0pDajt0QW0hBHR536XIhb1o3cWYO6X3fBJsIdq5RRhPDuS9ugOgdzMyfWTvAlWjvB
	Hvhtl0zoSwoQ3v1570Tu+11tOA1Riwfc2QcsbernuGdnGS3c+5jwq4o2deeMEoRSiUkFjtPvaG4
	Y93VzLkY0ptFgZF2LAuG4HP5G4b2k5PolAI5Uql59XK/K+SrdvdvVru3aLuiNS26vSV7YAcBaaH
	kUEuJ6y8apI1BzzJkzH2JbvWoFhWv5GK4oWUR//fPia0V8cS0P70TcM3GwlHCpcLuWbfdYv6SrG
	bDbQn/RmLJjjkDt3Dkg+aP3Z/KZydVvWrdOLJXx55LPmBwIgY7cP8S5ligw5FHEu3suPvCgA24E
	A4KIVSY25c0mM06Cks+0cW4n551OQ1rt7SvMUOEBGwHSxVTLdZWb0IExowMkyR
X-Google-Smtp-Source: AGHT+IGWmJZIqp+9cQiAIkHRkBF0PYVa2YTbWa3JgfpPGjlfFwvqnql3hXLqFXbB13Vso75H6PRTuw==
X-Received: by 2002:a17:906:8f8a:b0:b73:1634:6d71 with SMTP id a640c23a62f3a-b736780df8cmr1795378066b.26.1763479711590;
        Tue, 18 Nov 2025 07:28:31 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------AdDDLHzqARKdy0Ld8w6LZXVe"
Message-ID: <6ddb0571-6c19-404b-813b-55c9ad0dd062@gmail.com>
Date: Tue, 18 Nov 2025 16:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 10/18] xen/riscv: implement p2m_set_range()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <d689c48582505b0dab6896b414d01d844d834bd5.1760974017.git.oleksii.kurochko@gmail.com>
 <cfe9da20-5680-4f42-92f6-f46350811380@suse.com>
 <3fc28006-4a03-4d95-8db3-71a7b3131f82@gmail.com>
 <31c69c86-46ba-4670-b265-10baa0001f85@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <31c69c86-46ba-4670-b265-10baa0001f85@suse.com>

This is a multi-part message in MIME format.
--------------AdDDLHzqARKdy0Ld8w6LZXVe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/17/25 9:56 AM, Jan Beulich wrote:
>>>> +#define P2M_MAX_ROOT_LEVEL 4
>>>> +
>>>> +#define P2M_DECLARE_OFFSETS(var, addr) \
>>>> +    unsigned int var[P2M_MAX_ROOT_LEVEL] = {-1};\
>>>> +    for ( unsigned int i = 0; i <= gstage_root_level; i++ ) \
>>>> +        var[i] = calc_offset(i, addr);
>>> This surely is more than just "declare", and it's dealing with all levels no
>>> matter whether you actually will use all offsets.
>> I will rename|P2M_DECLARE_OFFSETS| to|P2M_BUILD_LEVEL_OFFSETS()|.
>>
>> But how can I know which offset I will actually need to use?
>> If we take the following loop as an example:
>>     |for( level = P2M_ROOT_LEVEL; level > target; level-- ) { ||/* ||* 
>> Don't try to allocate intermediate page tables if the mapping ||* is 
>> about to be removed. ||*/ ||rc = p2m_next_level(p2m, 
>> !removing_mapping, ||level, &table, offsets[level]); ||... ||} |It 
>> walks from|P2M_ROOT_LEVEL| down to|target|, where|target| is determined at runtime.
>>
>> If you mean that, for example, when the G-stage mode is Sv39, there is no need to allocate
>> an array with 4 entries (or 5 entries if we consider Sv57, so P2M_MAX_ROOT_LEVEL should be
>> updated), because Sv39 only uses 3 page table levels — then yes, in theory it could be
>> smaller. But I don't think it is a real issue if the|offsets[]| array on the stack has a
>> few extra unused entries.
>>
>> If preferred, Icould allocate the array dynamically based on|gstage_root_level|.
>> Would that be better?
> Having a few unused entries isn't a big deal imo. What I'm not happy with here is
> that you may_initialize_ more entries than actually needed. I have no good
> suggestion within the conceptual framework you use for page walking (the same
> issue iirc exists in host page table walks, just that the calculations there are
> cheaper).

The loop inside|P2M_DECLARE_OFFSETS()| uses|gstage_root_level|, so only the entries that
are actually going to be used are initialized.

You probably mean that it’s possible we don’t need to walk all the tables because a
leaf page-table entry appears earlier than the L0 page table for some gfns? IMO, it’s not
really a big deal, because at worst we just spend some time calculating something that
isn’t actually needed, but considering that it will be just extra 2 calls in the worst case
(when mapping is 1g, for no reason we calculated offsets for L1 and L0) of calc_offset()
it won't affect performance too much.

~ Oleksii

--------------AdDDLHzqARKdy0Ld8w6LZXVe
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
    <div class="moz-cite-prefix">On 11/17/25 9:56 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:31c69c86-46ba-4670-b265-10baa0001f85@suse.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+#define P2M_MAX_ROOT_LEVEL 4
+
+#define P2M_DECLARE_OFFSETS(var, addr) \
+    unsigned int var[P2M_MAX_ROOT_LEVEL] = {-1};\
+    for ( unsigned int i = 0; i &lt;= gstage_root_level; i++ ) \
+        var[i] = calc_offset(i, addr);
</pre></blockquote><pre wrap="" class="moz-quote-pre">This surely is more than just "declare", and it's dealing with all levels no
matter whether you actually will use all offsets.
</pre></blockquote><pre wrap="" class="moz-quote-pre">I will rename|P2M_DECLARE_OFFSETS| to|P2M_BUILD_LEVEL_OFFSETS()|.

But how can I know which offset I will actually need to use?
If we take the following loop as an example:
   <code class="moz-txt-verticalline"><span class="moz-txt-tag">|</span>for( level = P2M_ROOT_LEVEL; level &gt; target; level-- ) { ||/* ||* Don't try to allocate intermediate page tables if the mapping ||* is about to be removed. ||*/ ||rc = p2m_next_level(p2m, !removing_mapping, ||level, &amp;table, offsets[level]); ||... ||} <code
      class="moz-txt-verticalline"><span class="moz-txt-tag">|</span>It walks from|P2M_ROOT_LEVEL<span
      class="moz-txt-tag">|</span></code> down to|target<span
      class="moz-txt-tag">|</span></code>, where|target| is determined at runtime.

If you mean that, for example, when the G-stage mode is Sv39, there is no need to allocate
an array with 4 entries (or 5 entries if we consider Sv57, so P2M_MAX_ROOT_LEVEL should be
updated), because Sv39 only uses 3 page table levels — then yes, in theory it could be
smaller. But I don't think it is a real issue if the|offsets[]| array on the stack has a
few extra unused entries.

If preferred, Icould allocate the array dynamically based on|gstage_root_level|.
Would that be better?
</pre></blockquote><pre wrap="" class="moz-quote-pre">Having a few unused entries isn't a big deal imo. What I'm not happy with here is
that you may <span class="moz-txt-underscore"><span class="moz-txt-tag">_</span>initialize<span
      class="moz-txt-tag">_</span></span> more entries than actually needed. I have no good
suggestion within the conceptual framework you use for page walking (the same
issue iirc exists in host page table walks, just that the calculations there are
cheaper).</pre></pre>
    </blockquote>
    <pre>The loop inside <code data-start="92" data-end="115">P2M_DECLARE_OFFSETS()</code> uses <code
    data-start="121" data-end="140">gstage_root_level</code>, so only the entries that
are actually going to be used are initialized.

You probably mean that it’s possible we don’t need to walk all the tables because a
leaf page-table entry appears earlier than the L0 page table for some gfns? IMO, it’s not
really a big deal, because at worst we just spend some time calculating something that
isn’t actually needed, but considering that it will be just extra 2 calls in the worst case
(when mapping is 1g, for no reason we calculated offsets for L1 and L0) of calc_offset()
it won't affect performance too much.

~ Oleksii</pre>
  </body>
</html>

--------------AdDDLHzqARKdy0Ld8w6LZXVe--

