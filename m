Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D657A7140A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 10:46:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927410.1330159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNL5-0007uL-3s; Wed, 26 Mar 2025 09:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927410.1330159; Wed, 26 Mar 2025 09:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNL5-0007rF-0u; Wed, 26 Mar 2025 09:46:23 +0000
Received: by outflank-mailman (input) for mailman id 927410;
 Wed, 26 Mar 2025 09:46:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+Jq=WN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txNL3-0007r3-Fj
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 09:46:21 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bcc2dab-0a27-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 10:46:20 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso1101612466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 02:46:20 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac6932e843asm581380866b.83.2025.03.26.02.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 02:46:19 -0700 (PDT)
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
X-Inumbo-ID: 2bcc2dab-0a27-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742982380; x=1743587180; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKtAF4Sn4MGkhBMDCi6lQ3hpL91KxMQ7xTKUQPP3h9c=;
        b=ZmSOogulft6G+ddFAUxKYnTwxJDcsansnt/lkGbZvPIvDh6rCQwbq5414rTPA5zByr
         E3FHC+K6unSVdPM0A2jpa9OKLJhWoHzynHPRDyjACyOkkPEUuSPcX8eprLNVX1pMH+3H
         ygShcrmnZjn8Y65F5gIscECAWBFmFedaTOr1fs69nIwSbotcqlszseMYzWKHgBxF9n/5
         YGn61darlynrm6QDe7S2pi6+wLI7fANh7FRMjRpwN446kytJOWBmTIxCIpfdmaYxgcqO
         INTRjAfyL+zVSk7Vmj/+iuZtsEs0OishA7FJ/D1zpXn+2gtpkdGvcLGoqoWbOhRyJ9bt
         SP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742982380; x=1743587180;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VKtAF4Sn4MGkhBMDCi6lQ3hpL91KxMQ7xTKUQPP3h9c=;
        b=B16YBqYteZ8m6ltwUDplF+ZS+2JHM/HOTlL0lonajWaS68HTUBwa3OXgyFvVaSCQFb
         Y3HLAmGFpKs4bXaPeSgH4HMMNWKo51QFlPA2uAAbtCT5mSFKMp0S/c1pQ+CdbfxTNOoT
         h9HZJ1ibivvtVZYCowcYYbi75X8NHAoEWUH6iCanGUJF0KZBCa9lKMp3sFh2l1409WBt
         9RXcTgXEEVAe1jJ3pb3L/1gzhQ4SxXZbnaQq/CraJtRfc0PEAt3x6ry+CuGouhZNerTV
         NDwiy6IvxwrQjBqkTacSXlb4eaxrz0VuJJVSxh1ln8iyfUOXZYbv6a8mHxSIVaPhJggn
         zZbA==
X-Forwarded-Encrypted: i=1; AJvYcCVMuH/ytOvUUkqi+HAbgJVVr/Po6oEu4ilvjffBXeow+sV2oZ1kjHvBr3TnTRZagRYa8OX5g0Rq7Jo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEQME1dv+F9T8DbXFnaRoInwrvTayCjh5PeilOswUCRv+3MM5X
	Dm0yOOaVfcoTJ3EFsYIxJXPkwQB2iJq04LhQf/g4GP1MHwIRrHpw
X-Gm-Gg: ASbGncuV5Zk3alxuZZVbLPP4MgGiLUy0YbfD8pT8LSTtOh56WtlopVGaoCkb7qj97th
	0sUXlMq81Hkamn8F/VH63ZNteq7tq+bcSEcj1YnoDmn2h0cud1wKaqJ+THdzULVderZkAC+6ZoN
	I26m5qG0IS9jTrXP+Wt1PyIlRlDFWtQg8Ti+2FfNyjl8w7nzRpkMHx2bigDnYFdLPYlkKSxDooy
	UpPrssJoB3A2NdZMchueiSQ2NZCqKSpg6ABvyuZI5VwYYyTz9jeqUJszlwKCJsHYhn1OdDWi+Nj
	FidOc99KmUg+zXIwFHvPwYpe4kmuMPJFksozh8/aVj4+aM8OBNX+JIjYOD32fITzAmnX/h/Ks9g
	vFfAtoc1nJfOVBnOWmI0Z
X-Google-Smtp-Source: AGHT+IHeekuqGizZnyty1U6Tv5JzCn5ILs+r4Ex0G80DvsO9kh7mFzqCdX+xP3p8CFNvdmKztOHCTA==
X-Received: by 2002:a17:906:d7cc:b0:abf:73ba:fd60 with SMTP id a640c23a62f3a-ac3f22b8b4bmr2098518266b.29.1742982379492;
        Wed, 26 Mar 2025 02:46:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------tJSC0cM6NTZK6SeyIwhchS0Q"
Message-ID: <763b3dc7-68c9-4984-9e55-7bd57c356bd7@gmail.com>
Date: Wed, 26 Mar 2025 10:46:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
To: "Orzel, Michal" <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Luca Fancellu <luca.fancellu@arm.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Wei Chen <wei.chen@arm.com>,
 xen-devel@lists.xenproject.org
References: <20250317200727.798696-1-luca.fancellu@arm.com>
 <20250317200727.798696-7-luca.fancellu@arm.com>
 <85ba02a9-f9f9-4141-85be-a9a2d431e450@gmail.com>
 <26583ecf-4057-46b1-8f87-f4589d7bec17@suse.com>
 <136cf1c5-d1e5-471d-b560-51632b444e41@gmail.com>
 <94865aea-043b-4f52-adb8-d2d78dba293b@suse.com>
 <0957c74f-a53d-4107-bc8d-e13d7c308d39@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0957c74f-a53d-4107-bc8d-e13d7c308d39@amd.com>

This is a multi-part message in MIME format.
--------------tJSC0cM6NTZK6SeyIwhchS0Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/26/25 10:39 AM, Orzel, Michal wrote:
>
> On 20/03/2025 08:32, Jan Beulich wrote:
>>
>> On 19.03.2025 17:31, Oleksii Kurochko wrote:
>>> On 3/19/25 12:35 PM, Jan Beulich wrote:
>>>> On 18.03.2025 14:05, Oleksii Kurochko wrote:
>>>>> On 3/17/25 9:07 PM, Luca Fancellu wrote:
>>>>>> From: Penny Zheng<Penny.Zheng@arm.com>
>>>>>>
>>>>>> ARM MPU system doesn't need to use paging memory pool, as MPU memory
>>>>>> mapping table at most takes only one 4KB page, which is enough to
>>>>>> manage the maximum 255 MPU memory regions, for all EL2 stage 1
>>>>>> translation and EL1 stage 2 translation.
>>>>>>
>>>>>> Introduce ARCH_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
>>>>>> MMU systems, x86 and RISC-V.
>>>>>>
>>>>>> Wrap the code inside 'construct_domU' that deal with p2m paging
>>>>>> allocation in a new function 'domain_p2m_set_allocation', protected
>>>>>> by ARCH_PAGING_MEMPOOL, this is done in this way to prevent polluting
>>>>>> the former function with #ifdefs and improve readability
>>>>>>
>>>>>> Introduce arch_{get,set}_paging_mempool_size stubs for architecture
>>>>>> with !ARCH_PAGING_MEMPOOL.
>>>>>>
>>>>>> Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
>>>>>> field is not required.
>>>>>>
>>>>>> Signed-off-by: Penny Zheng<penny.zheng@arm.com>
>>>>>> Signed-off-by: Wei Chen<wei.chen@arm.com>
>>>>>> Signed-off-by: Luca Fancellu<luca.fancellu@arm.com>
>>>>>> ---
>>>>>> v3 changes:
>>>>>>     - Introduced ARCH_PAGING_MEMPOOL instead of HAS_PAGING_MEMPOOL
>>>>>> v2 changes:
>>>>>>     - make Kconfig HAS_PAGING_MEMPOOL common
>>>>>>     - protect also "xen,domain-p2m-mem-mb" reading with HAS_PAGING_MEMPOOL
>>>>>>     - do not define p2m_teardown{_allocation} in this patch
>>>>>>     - change commit message
>>>>>> ---
>>>>>>     xen/arch/arm/Kconfig              |  1 +
>>>>>>     xen/arch/arm/dom0less-build.c     | 74 ++++++++++++++++++++-----------
>>>>>>     xen/arch/arm/include/asm/domain.h |  2 +
>>>>>>     xen/arch/riscv/Kconfig            |  1 +
>>>>>>     xen/arch/x86/Kconfig              |  1 +
>>>>>>     xen/common/Kconfig                |  3 ++
>>>>>>     xen/include/xen/domain.h          | 17 +++++++
>>>>>>     7 files changed, 73 insertions(+), 26 deletions(-)
>>>>> For RISC-V:
>>>>>     Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>> Mind me asking then why RISC-V needs this at this point? The stubs surely
>>>> were added to address some build issue, not because they are actively
>>>> meaningful?
>>> Only because we have stubs and not to have redefinition compilation
>>> error. And, yes, they are not actively meaningful now, at least. I am
>>> okay with not enabling of this config for RISC-V but then seems to me we
>>> have to drop stubs in riscv/stubs.c. ~ Oleksii
>> Well, I don't think it's "have to", but I agree that dropping them would
>> make sense then (and be desirable).
> @Jan, @Oleksii, is there anything blocking this patch to be committed (Luca
> question does not seem to be answered)? Other patches in the series are ready to
> be merged.

I think the change in xen/arch/riscv/Kconfig should be dropped with dropping
arch_{get,set}_paging_mempool_size() in riscv/stubs.c as they are defined in
xen/domain.h for the case when CONFIG_ARCH_PAGING_MEMPOOL=n.

~ Oleksii

--------------tJSC0cM6NTZK6SeyIwhchS0Q
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
    <div class="moz-cite-prefix">On 3/26/25 10:39 AM, Orzel, Michal
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0957c74f-a53d-4107-bc8d-e13d7c308d39@amd.com">
      <pre wrap="" class="moz-quote-pre">

On 20/03/2025 08:32, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

On 19.03.2025 17:31, Oleksii Kurochko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
On 3/19/25 12:35 PM, Jan Beulich wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 18.03.2025 14:05, Oleksii Kurochko wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 3/17/25 9:07 PM, Luca Fancellu wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">From: Penny Zheng<a class="moz-txt-link-rfc2396E" href="mailto:Penny.Zheng@arm.com">&lt;Penny.Zheng@arm.com&gt;</a>

ARM MPU system doesn't need to use paging memory pool, as MPU memory
mapping table at most takes only one 4KB page, which is enough to
manage the maximum 255 MPU memory regions, for all EL2 stage 1
translation and EL1 stage 2 translation.

Introduce ARCH_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
MMU systems, x86 and RISC-V.

Wrap the code inside 'construct_domU' that deal with p2m paging
allocation in a new function 'domain_p2m_set_allocation', protected
by ARCH_PAGING_MEMPOOL, this is done in this way to prevent polluting
the former function with #ifdefs and improve readability

Introduce arch_{get,set}_paging_mempool_size stubs for architecture
with !ARCH_PAGING_MEMPOOL.

Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
field is not required.

Signed-off-by: Penny Zheng<a class="moz-txt-link-rfc2396E" href="mailto:penny.zheng@arm.com">&lt;penny.zheng@arm.com&gt;</a>
Signed-off-by: Wei Chen<a class="moz-txt-link-rfc2396E" href="mailto:wei.chen@arm.com">&lt;wei.chen@arm.com&gt;</a>
Signed-off-by: Luca Fancellu<a class="moz-txt-link-rfc2396E" href="mailto:luca.fancellu@arm.com">&lt;luca.fancellu@arm.com&gt;</a>
---
v3 changes:
   - Introduced ARCH_PAGING_MEMPOOL instead of HAS_PAGING_MEMPOOL
v2 changes:
   - make Kconfig HAS_PAGING_MEMPOOL common
   - protect also "xen,domain-p2m-mem-mb" reading with HAS_PAGING_MEMPOOL
   - do not define p2m_teardown{_allocation} in this patch
   - change commit message
---
   xen/arch/arm/Kconfig              |  1 +
   xen/arch/arm/dom0less-build.c     | 74 ++++++++++++++++++++-----------
   xen/arch/arm/include/asm/domain.h |  2 +
   xen/arch/riscv/Kconfig            |  1 +
   xen/arch/x86/Kconfig              |  1 +
   xen/common/Kconfig                |  3 ++
   xen/include/xen/domain.h          | 17 +++++++
   7 files changed, 73 insertions(+), 26 deletions(-)
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">For RISC-V:
   Reviewed-by: Oleksii Kurochko<a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Mind me asking then why RISC-V needs this at this point? The stubs surely
were added to address some build issue, not because they are actively
meaningful?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
Only because we have stubs and not to have redefinition compilation
error. And, yes, they are not actively meaningful now, at least. I am
okay with not enabling of this config for RISC-V but then seems to me we
have to drop stubs in riscv/stubs.c. ~ Oleksii
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Well, I don't think it's "have to", but I agree that dropping them would
make sense then (and be desirable).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">@Jan, @Oleksii, is there anything blocking this patch to be committed (Luca
question does not seem to be answered)? Other patches in the series are ready to
be merged.</pre>
    </blockquote>
    <pre>I think the change in xen/arch/riscv/Kconfig should be dropped with dropping
arch_{get,set}_paging_mempool_size() in riscv/stubs.c as they are defined in
xen/domain.h for the case when CONFIG_ARCH_PAGING_MEMPOOL=n.

~ Oleksii

</pre>
  </body>
</html>

--------------tJSC0cM6NTZK6SeyIwhchS0Q--

