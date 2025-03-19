Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D6CA69505
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 17:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920947.1324989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuwK9-0007z9-22; Wed, 19 Mar 2025 16:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920947.1324989; Wed, 19 Mar 2025 16:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuwK8-0007xT-Un; Wed, 19 Mar 2025 16:31:20 +0000
Received: by outflank-mailman (input) for mailman id 920947;
 Wed, 19 Mar 2025 16:31:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTXv=WG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tuwK7-0007xI-1K
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 16:31:19 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 956cfdcf-04df-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 17:31:18 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac2aeada833so192307866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 09:31:18 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a40eadsm1024294766b.138.2025.03.19.09.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 09:31:16 -0700 (PDT)
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
X-Inumbo-ID: 956cfdcf-04df-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742401877; x=1743006677; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+t3QfeCPe9OWpyIRU1FczRT4gPwFi8oV3jm6C+nIN4=;
        b=FmQjkNC1Na0IoHoXyzk+OrWN/+V3z77zWk8OYNIqEYyaziets3pSlZ+09xArdHo867
         ESZDXc9JtCnPa8u4QpwhIfQpkFOq/C/D5FJBpvQebgCREMyjZ13rJnxOo1GQyRjHX5ph
         DD0BuNlspJPevw9XbtDtB35qK7FZCSA5sVClCjMmqLfWeUpCDhszD6isthCt3OwVctAc
         9O9VtJTWke0i6pc6VgGZvTM15WIZxiRF/V1C20PGVMnG7TfnIAW8VBjVxHgjOjrPJdVZ
         74KZjl6QZoqqxmJtku1W6H+OLOX75M6biY2Yn/jBfeR3exIBioFyLMk760kuPAFVrL+E
         vZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742401877; x=1743006677;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y+t3QfeCPe9OWpyIRU1FczRT4gPwFi8oV3jm6C+nIN4=;
        b=bNBCcl8TvD8QnbJO3zMngY3d35PIdSZItOx8Dut/LweZWwbJV3oAVYmmADu1tlNJyl
         KwSkIHfwSXQvOk9CS/UvNnIenYYFrWDZrNv6tPUKqHhg0Lk5fMSdHpmnetk07ujgoend
         UybZ8N4/MSDYUk90hmIYAj+8sK8jXiy2T9IRYcZ9eiWq7HsLUqka1gaue5zFlU3p8LEj
         0AoFI7W5dJUKP7oZbWrAlVtAV+nx1nrvPNUd54YSzKASDJQWl49vaWsB9jQxNvVWO5YC
         m+UMflel5d18ChaQcq3xbENurflk0cRMFNW3vsMni6bPclywSpToGVJQhtYhLYD046cu
         dJRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2nB/NDZRjpao22fsqUt0V75K81qUYvUrSgP24C0fDWkQxhgzlnz3QB5bIFvrrR7nCoam13bYrcJs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCryIZlqWTiH6sCpUUY35PF11UtCmXlAePwNCxfGxAqHxDTKix
	FGZHx5E0OIPrEJTzVlH037poiGK14WjKiqlHcGMBul+HSUiGA8su
X-Gm-Gg: ASbGncvUnV5qPOokabo8ytnvBtRCzOsQIwugagAf8MISksg0sO0AsdUnxoS9jbmPVN6
	bro2WdnsRE3ZrrEIvdVFQe5LRUhzkNLMEPmWLRVVVBzmyf71udgMlwMZe8Hztm225kLZTNP+UZj
	763r3/Rvd9gxjvTY5vK32WjWZZizvNemSl4rlroEGuh63QrD5VAn0wNoCD4becvKquuZ8S7jeoX
	LREnUf9cI+QkPy+mlWms8nkQ5Wi8fJIixyCEaYAx6Wn4qsqbNsIo21Ndx2fry+uRsJXuxrkvrxp
	Sly+lqZvCq3uMKlbQqoXJS05SomJ1Nu7hyVNjXOX1Qfdv9azLGNYvKvt8/B1YgVBLk4dBtpb4F0
	Pc70SRx0rpm7yysUfEM0fyCW8+281sVI=
X-Google-Smtp-Source: AGHT+IHIyIRZoOher4NxZwDzuAF+TSHesQ6SZ3ZqveigPDVKTwLUQks0VQfU1RKqRSDw/s7pGwROlA==
X-Received: by 2002:a17:907:a58b:b0:ac2:9a4:700b with SMTP id a640c23a62f3a-ac3cdbe7da3mr21270866b.16.1742401877074;
        Wed, 19 Mar 2025 09:31:17 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------txHr0TffMXjD4Y555X3JuzY4"
Message-ID: <136cf1c5-d1e5-471d-b560-51632b444e41@gmail.com>
Date: Wed, 19 Mar 2025 17:31:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <26583ecf-4057-46b1-8f87-f4589d7bec17@suse.com>

This is a multi-part message in MIME format.
--------------txHr0TffMXjD4Y555X3JuzY4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/19/25 12:35 PM, Jan Beulich wrote:
> On 18.03.2025 14:05, Oleksii Kurochko wrote:
>> On 3/17/25 9:07 PM, Luca Fancellu wrote:
>>> From: Penny Zheng<Penny.Zheng@arm.com>
>>>
>>> ARM MPU system doesn't need to use paging memory pool, as MPU memory
>>> mapping table at most takes only one 4KB page, which is enough to
>>> manage the maximum 255 MPU memory regions, for all EL2 stage 1
>>> translation and EL1 stage 2 translation.
>>>
>>> Introduce ARCH_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
>>> MMU systems, x86 and RISC-V.
>>>
>>> Wrap the code inside 'construct_domU' that deal with p2m paging
>>> allocation in a new function 'domain_p2m_set_allocation', protected
>>> by ARCH_PAGING_MEMPOOL, this is done in this way to prevent polluting
>>> the former function with #ifdefs and improve readability
>>>
>>> Introduce arch_{get,set}_paging_mempool_size stubs for architecture
>>> with !ARCH_PAGING_MEMPOOL.
>>>
>>> Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
>>> field is not required.
>>>
>>> Signed-off-by: Penny Zheng<penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen<wei.chen@arm.com>
>>> Signed-off-by: Luca Fancellu<luca.fancellu@arm.com>
>>> ---
>>> v3 changes:
>>>    - Introduced ARCH_PAGING_MEMPOOL instead of HAS_PAGING_MEMPOOL
>>> v2 changes:
>>>    - make Kconfig HAS_PAGING_MEMPOOL common
>>>    - protect also "xen,domain-p2m-mem-mb" reading with HAS_PAGING_MEMPOOL
>>>    - do not define p2m_teardown{_allocation} in this patch
>>>    - change commit message
>>> ---
>>>    xen/arch/arm/Kconfig              |  1 +
>>>    xen/arch/arm/dom0less-build.c     | 74 ++++++++++++++++++++-----------
>>>    xen/arch/arm/include/asm/domain.h |  2 +
>>>    xen/arch/riscv/Kconfig            |  1 +
>>>    xen/arch/x86/Kconfig              |  1 +
>>>    xen/common/Kconfig                |  3 ++
>>>    xen/include/xen/domain.h          | 17 +++++++
>>>    7 files changed, 73 insertions(+), 26 deletions(-)
>> For RISC-V:
>>    Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Mind me asking then why RISC-V needs this at this point? The stubs surely
> were added to address some build issue, not because they are actively
> meaningful?

Only because we have stubs and not to have redefinition compilation 
error. And, yes, they are not actively meaningful now, at least. I am 
okay with not enabling of this config for RISC-V but then seems to me we 
have to drop stubs in riscv/stubs.c. ~ Oleksii

--------------txHr0TffMXjD4Y555X3JuzY4
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
    <div class="moz-cite-prefix">On 3/19/25 12:35 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:26583ecf-4057-46b1-8f87-f4589d7bec17@suse.com">
      <pre wrap="" class="moz-quote-pre">On 18.03.2025 14:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 3/17/25 9:07 PM, Luca Fancellu wrote:
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
        <pre wrap="" class="moz-quote-pre">
For RISC-V:
  Reviewed-by: Oleksii Kurochko<a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Mind me asking then why RISC-V needs this at this point? The stubs surely
were added to address some build issue, not because they are actively
meaningful?</pre>
    </blockquote>
    <pre><span class="add"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255);">Only because we have stubs and not to have redefinition compilation error.
And, yes, they are not actively meaningful now, at least.

I am okay with not enabling of this config for RISC-V but then seems to me
we have to drop stubs in riscv/stubs.c.

~ Oleksii


</span><span class="add"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255);">

</span><span class="add"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255);"></span></pre>
  </body>
</html>

--------------txHr0TffMXjD4Y555X3JuzY4--

