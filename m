Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89A4AEE217
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 17:14:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029199.1402962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWGCn-0008LT-Pg; Mon, 30 Jun 2025 15:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029199.1402962; Mon, 30 Jun 2025 15:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWGCn-0008IY-MQ; Mon, 30 Jun 2025 15:14:01 +0000
Received: by outflank-mailman (input) for mailman id 1029199;
 Mon, 30 Jun 2025 15:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irzh=ZN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uWGCm-0008IS-Cv
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 15:14:00 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d31ba59a-55c4-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 17:13:49 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-60c9d8a16e5so4939426a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 08:13:49 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c82908297sm5923452a12.26.2025.06.30.08.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:13:47 -0700 (PDT)
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
X-Inumbo-ID: d31ba59a-55c4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751296429; x=1751901229; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URZGSaU+VVA5WNhzpeNfLfLA+JWWZpuqgmWNLBiC51I=;
        b=G3B1ZTheQHsG1LWovi/zwq686j5XZly274R37sFAwVOko2mH3qkdAHe5n5QrpyKaZ9
         NC6PFTzNw2i5b/8+qeAZRHBYSx73kBs3wBgTV/LytXteewR8QRqqfS2tfLS9oR3zDLjN
         6GggrkxRdj+7YjbPhq+dKAadpUMoNLNrieyFSJfV6yiok4QVmBJcP91RPfZxCpKuh0ee
         RbE2QFHwt0TB5o3fG23k5Y6KifRhu6oxnQn8ZvVc7CT+jLq3GHXiI+E+kNOl6LwFepYy
         KZaq3cq7txoMWY+BrFacg4Y1f9j2hCBMpsoi59AR5Y+b8PaAecVzgmiY8c5LrDqBpgyB
         U9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751296429; x=1751901229;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=URZGSaU+VVA5WNhzpeNfLfLA+JWWZpuqgmWNLBiC51I=;
        b=eLrvsi8gJgfCnL3rH+zQp9D0kYbkFe1YtWdEhClljz8eKwLP1G+0jsRPcY3kPA0sIh
         7bPuARoyKWSaBkq1GRqde/fSWV64FAP2DD4tgSwHvLvYBX3EJkyYfQbc+zhqqcpZtKtE
         lf3HTY0o+xmSDTHTBsLIXZUePJPDo+jLPfnwQVsbI5XANpNCL98cQJi8WQYwZLXucYMP
         smc3kIr9JY4lOpA1ksjNWN9PXX05QgKYjHeV5P7PnPH6BPs9AzjHQYZ1ea61RaraJGb1
         VBvC2+Fquo+iZWQOjcxNo2udR+iSNC/rBV8MmybL/hidtn5iVzDx6xNe1S50xzz9D1yx
         51Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVk4F1OVcbapF4jEHNpYznHgw2mb5k445nlJliX4XU79dPyHJ0o+vksi92iwgHytjzfYVQNHuA/gy4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFpWxBTNqjb4F79/cbI1p+x5YvXU/Hkhx6nyyX7d+ulGu7iC8d
	u3kX3wjeljQ269QST/9YQ8djXbpgv8ME/pwYLI/tzyNLzy4riOoZe94G
X-Gm-Gg: ASbGncsy2ULSep5mWuyMLhOnTEpHaHcB4/lOJF/vQclGzjeoKILvHAtgeOK6Mv+vsqf
	YoOHvijcfWGQquMyIivu9frGZm+YekRhL35hxeuHVHHtp9HSOCQLXV7VknnHSsLneLi7v5AtOlC
	5TCoUIMZSpOgDOTt4jsoNkVa1BbHUre2YdDXxsN6OhZ7LgZRoIHhELpWWLZM/iC4Te4k+DY9bkA
	oAUQZnt/uMaOC/OHH2swzWQLP96XHiQ2bj8IhnboqnhTLFoDvY5u1zLYP8vKsNx8z5tgnWuONHi
	MyRoTC/0dxiM56gknmVGpRjOhYRK/oqvs3CWR6BzTiojPD4W8XCeaaZzLjiL1iFSJUViQrbh7oE
	2UZLSxZenhjwlyjPLtCxFkTlRHhuQHRXrmE0=
X-Google-Smtp-Source: AGHT+IHMoZcQ/FeV4aJt3J88B1Iv5+49GOtX0BJm+1eKjCSYz8NPnNG39ywUdPpPKZ0TvwFpTDQapw==
X-Received: by 2002:a05:6402:2801:b0:609:d685:e831 with SMTP id 4fb4d7f45d1cf-60c88b1fbacmr11762180a12.12.1751296428323;
        Mon, 30 Jun 2025 08:13:48 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------wh6BblbLqUIZWDnFi0rf3BvZ"
Message-ID: <4b5c2a81-947b-4e2f-bb89-a4e776548e52@gmail.com>
Date: Mon, 30 Jun 2025 17:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] xen/riscv: add new p2m types and helper macros
 for type classification
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <f943c6ce5371258af0f36c2633d542341fcf47b4.1749555949.git.oleksii.kurochko@gmail.com>
 <8f45cffe-e2a2-46e3-8370-2b6b4c86dccf@suse.com>
 <13b80e15-9db9-427d-aaa2-c0389e4c248a@gmail.com>
 <2ebfaa8c-e0bb-4c5b-89e1-48d309ee4989@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2ebfaa8c-e0bb-4c5b-89e1-48d309ee4989@suse.com>

This is a multi-part message in MIME format.
--------------wh6BblbLqUIZWDnFi0rf3BvZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/25 4:42 PM, Jan Beulich wrote:
> On 30.06.2025 16:33, Oleksii Kurochko wrote:
>> On 6/26/25 4:59 PM, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>>> @@ -61,8 +61,28 @@ struct p2m_domain {
>>>>    typedef enum {
>>>>        p2m_invalid = 0,    /* Nothing mapped here */
>>>>        p2m_ram_rw,         /* Normal read/write domain RAM */
>>>> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
>>> As indicated before - this type should be added when the special handling that
>>> it requires is also introduced.
>> Perhaps, I missed that. I will drop this type for now.
>>
>>>> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
>>> What's the _dev suffix indicating here?
>> It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
>> spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
>> |using PTE_PBMT_IO for |p2m_mmio_direct_dev.
>>
>> Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.
> And what would the _io suffix indicate, beyond what "mmio" already indicates?

Just that PBMT_IO will be used for device memory and not PBMT_NC.

~ Oleksii

--------------wh6BblbLqUIZWDnFi0rf3BvZ
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
    <div class="moz-cite-prefix">On 6/30/25 4:42 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2ebfaa8c-e0bb-4c5b-89e1-48d309ee4989@suse.com">
      <pre wrap="" class="moz-quote-pre">On 30.06.2025 16:33, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 6/26/25 4:59 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -61,8 +61,28 @@ struct p2m_domain {
  typedef enum {
      p2m_invalid = 0,    /* Nothing mapped here */
      p2m_ram_rw,         /* Normal read/write domain RAM */
+    p2m_ram_ro,         /* Read-only; writes are silently dropped */
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">As indicated before - this type should be added when the special handling that
it requires is also introduced.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Perhaps, I missed that. I will drop this type for now.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">What's the _dev suffix indicating here?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It indicates that it is device memory, probably, it isn't so necessary in case of RISC-V as
spec doesn't use such terminology. In RISC-V there is only available IO, NC. And we are
|using PTE_PBMT_IO for |p2m_mmio_direct_dev.

Maybe it would be better just to rename s/p2m_mmio_direct_dev/p2m_mmio_direct_io.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And what would the _io suffix indicate, beyond what "mmio" already indicates?</pre>
    </blockquote>
    <pre>Just that PBMT_IO will be used for device memory and not PBMT_NC.

~ Oleksii
</pre>
  </body>
</html>

--------------wh6BblbLqUIZWDnFi0rf3BvZ--

