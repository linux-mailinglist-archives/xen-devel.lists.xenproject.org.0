Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E36A73770
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:56:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929842.1332623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqW9-000191-TF; Thu, 27 Mar 2025 16:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929842.1332623; Thu, 27 Mar 2025 16:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqW9-00016y-Pt; Thu, 27 Mar 2025 16:55:45 +0000
Received: by outflank-mailman (input) for mailman id 929842;
 Thu, 27 Mar 2025 16:55:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eznr=WO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txqW8-00016s-Ef
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:55:44 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cbd1e62-0b2c-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 17:55:34 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5e614da8615so2324330a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:55:34 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc17b2214sm61339a12.54.2025.03.27.09.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:55:32 -0700 (PDT)
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
X-Inumbo-ID: 4cbd1e62-0b2c-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743094534; x=1743699334; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6MqjwKfWq5TU0ruP3iR0qMmpmrIgjC3ZkuvdpQKBNA=;
        b=Fka9RgDtY/oQAblQZmgQ5viScTIwtnOghVoo1PsXzmUtI0mhMOgQ6zUqfqmNTuSXvB
         BwIOnw8yMPUJaZEH/Tb1/L9CQA0BjQdHkC/AkIgyR1rVh3YfP12Qj0i3tQUokUaTweGf
         lYjEIL8FpZ2fKposxNcMjwD3y5VX3nO8Em/JzaPD8AGysAv7M00fcCAUpCyxigDWtyFp
         zAUzym7TeuTmj6tRPzZJJeGhKeVch5thFPh9XFOatIE0jaaxPsPridWlAId9NmlzUyLk
         jJJXrXFYiymBeYe9O3RQSum+rHQoyhs5bQcXXwfDzruxUU7uOLD9bXMtnoEI0lAetozo
         yshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743094534; x=1743699334;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e6MqjwKfWq5TU0ruP3iR0qMmpmrIgjC3ZkuvdpQKBNA=;
        b=LT27xQl3ct8VN4KPMoe6wGQ6FwUcaqJ85NPva/cz68CILHnLhOK0ZUPUgAETlobYmm
         g3HYzdS/S/5gd0F+WJfqk65jtlMwE/bbCfLwxsc21QhBK//4Mix60paDU7FkPjXS0D6X
         gXa1FLiNkn7QO+eb0RQeJFrq6yIlnK/90jmcu4Q5a3Of2AfPRaYXVtpkz/4Z7pKjD56n
         c+kZNT0MUo4oBaX/0UWPX9D/Fjm3mzibOmlJTtpKER6ZPJECo9fPwJuz9sG1UqSJLUQj
         AYDy2xdCN1w7ZJlFakZXBj44xbX/X98TodrkcXrYQsx8Z7xxNazxbtenXsmxZpYR8QvO
         2aJA==
X-Forwarded-Encrypted: i=1; AJvYcCVGexcOnxCyGGdALPuuqPVA8Yz21q3h3BfAhWeqgBQkjJbgJFOCLkfMG1sNgc4mKVy15tuMEtMq7LM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8YP6imVaDacvkfnjhYDgTdHheIQBbEzXpLumg1IjwdF8G46KB
	TIrw2h8s3gKPTUzNu+OL1rvHimdBtjv+fEm/pW5ugDjA0/CaX+x7
X-Gm-Gg: ASbGnctpsD93Kfe7mNYamFAGqoJ1GKVGeamzZnK0BgzmO3WE209a2vKoMVT6wl9IuE+
	V+sThmENm1EUQrT5qmuXi3mZnwFwBn6BuwPRQxiH06e0na/4Bs0a4oETqFd1KtkVylM/DAF0T/q
	wPkYutm3fjuDp9sfawHkRLKhNQTBVxseHXQhKePOdIhFvz+9NyrMmrvJqNQoosZ0OmP/PPnCdZI
	5IxE7KS7H/9Raa+JxGmyx3iZ1+0Unp8mXBgoZNqGAjgD8o8Y8+dvUIARZhPETWN6doTIEDs0/K9
	VkHFGY98zcrJDRzrQYlr2NPhzrAOb5U8pI+8qaVtMLbjWJ0fGeHmg9YUzHkicGlj6u3WzQvp9YD
	qRbO3mkBnzy40EtxZwcLk
X-Google-Smtp-Source: AGHT+IHkgNQA47yZSwTQcdD1Q539shuWUwSaKsqopPNq6wTxJm4eB64E3VQSL7u4+qT0AO6CYMmJ4A==
X-Received: by 2002:a05:6402:27ce:b0:5e6:14ab:ab6a with SMTP id 4fb4d7f45d1cf-5edbf48bbbdmr975511a12.7.1743094533292;
        Thu, 27 Mar 2025 09:55:33 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------579qJyP8Kf0Ylmlh0p1nhuMJ"
Message-ID: <97e68799-a14a-4363-add8-63be6ad59f82@gmail.com>
Date: Thu, 27 Mar 2025 17:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] CHANGELOG: Minimum toolchain requirements
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250320155908.43885-1-andrew.cooper3@citrix.com>
 <20250320155908.43885-4-andrew.cooper3@citrix.com>
 <c901f573-97dc-4ad0-9974-847fc58a0d44@gmail.com>
 <956eb48f-b2f6-4951-8b12-2cf0dcfa2c9e@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <956eb48f-b2f6-4951-8b12-2cf0dcfa2c9e@citrix.com>

This is a multi-part message in MIME format.
--------------579qJyP8Kf0Ylmlh0p1nhuMJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/27/25 4:45 PM, Andrew Cooper wrote:
> On 21/03/2025 4:24 pm, Oleksii Kurochko wrote:
>>
>> On 3/20/25 4:59 PM, Andrew Cooper wrote:
>>> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
>>> ---
>>> CC: Anthony PERARD<anthony.perard@vates.tech>
>>> CC: Michal Orzel<michal.orzel@amd.com>
>>> CC: Jan Beulich<jbeulich@suse.com>
>>> CC: Julien Grall<julien@xen.org>
>>> CC: Roger Pau Monné<roger.pau@citrix.com>
>>> CC: Stefano Stabellini<sstabellini@kernel.org>
>>> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>> ---
>>>   CHANGELOG.md | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 9a5919585d43..4e333e608a96 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -7,6 +7,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>   ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>>>   
>>>   ### Changed
>>> + - The minimum toolchain requirements have been increased to either:
>>> +   - GCC 5.1 and Binutils 2.25, or
>>> +   - Clang/LLVM 11
>> I think we want here to specify for which architectures it was done as RISC-V, for example, uses
>> different versions:
>>   - GCC 12.2 or later
>>   - GNU Binutils 2.39 or later
>> And for clang the version will be 17 as:
>>    f873029386dd415cd9caa78f600a593d9570c9ae("[BOLT] Add minimal RISC-V 64-bit support")
>>    $ git tag --contains f873029386dd415cd9caa78f600a593d9570c9ae
>>      llvmorg-17.0.0
>>    ...
>> I have some patch to build Xen RISC-V using clang-17 but I haven't sent to upstream yet as I am not
>> really sure that if we need (or why we need) clang support just from the start.
> The same reason why we got an almost-nothing build in CI first, and are
> currently looking for a "hello world" message on boot.
>
> Keeping it working as you go is much easier than retrofitting at a later
> point, and supporting more than 1 of any $THING (not just compilers) is
> good to prevent accidental reliance on an implementation specific property.
>
> The only question is what version of Clang exists in Debian bookworm, as
> that affects how easy/hard it is to add to CI.
>
> According tohttps://packages.debian.org/search?keywords=clang, bookworm
> has Clang 14, while trixie has Clang 19.
>
> So, how hard a limit is Clang-17?  Is Clang-14 doable or not?

I think it is pretty hard limit because:
1. I haven't checked all the extension but, for example, we required 'H' extension and
    the support for it was added in 16.0.0:
    [f4c887c3a8406d85f4f942c8350f10026994f4d8("RISCV] Add H extension")
    $ git tag --contains f4c887c3a8406d85f4f942c8350f10026994f4d8
      llvmorg-16.0.0
      ...
2. Minimal support for RISCV-64 was added in clang17:
    f873029386dd415cd9caa78f600a593d9570c9ae("[BOLT] Add minimal RISC-V 64-bit support")
    $ git tag --contains f873029386dd415cd9caa78f600a593d9570c9ae
      llvmorg-17.0.0
      ...
And, actually, the second one reason was the reason why I tried to build with clang17 and suggests to use
it as a baseline.

>
> Alternatively, we could start adding some trixie containers.  We have
> passed the toolchain freeze (was 15th March), so the build container
> should be stable now, even if it isn't quite released yet.

clang has nice script to add any version. I did that in the following way
for bookworm docker container:
+    DEPS=(
+        # Clang
+        wget
+        gnupg
+        ca-certificates
+        lsb-release
+        software-properties-common
...

+    update-ca-certificates
+
+    wget -O -https://apt.llvm.org/llvm.sh | bash -s 17
+    wget -O -https://apt.llvm.org/llvm.sh | bash -s 18
+    wget -O -https://apt.llvm.org/llvm.sh | bash -s 19
+    wget -O -https://apt.llvm.org/llvm.sh | bash -s 20
+    # ln -s /usr/bin/clang-17 /usr/bin/clang

~ Oleksii

--------------579qJyP8Kf0Ylmlh0p1nhuMJ
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
    <div class="moz-cite-prefix">On 3/27/25 4:45 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:956eb48f-b2f6-4951-8b12-2cf0dcfa2c9e@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 21/03/2025 4:24 pm, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

On 3/20/25 4:59 PM, Andrew Cooper wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 9a5919585d43..4e333e608a96 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,9 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
 ## [4.21.0 UNRELEASED](<a class="moz-txt-link-freetext" href="https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging">https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging</a>) - TBD
 
 ### Changed
+ - The minimum toolchain requirements have been increased to either:
+   - GCC 5.1 and Binutils 2.25, or
+   - Clang/LLVM 11
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">I think we want here to specify for which architectures it was done as RISC-V, for example, uses
different versions:
 - GCC 12.2 or later
 - GNU Binutils 2.39 or later
And for clang the version will be 17 as:
  f873029386dd415cd9caa78f600a593d9570c9ae("[BOLT] Add minimal RISC-V 64-bit support")
  $ git tag --contains f873029386dd415cd9caa78f600a593d9570c9ae
    llvmorg-17.0.0
  ...
I have some patch to build Xen RISC-V using clang-17 but I haven't sent to upstream yet as I am not
really sure that if we need (or why we need) clang support just from the start.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The same reason why we got an almost-nothing build in CI first, and are
currently looking for a "hello world" message on boot.

Keeping it working as you go is much easier than retrofitting at a later
point, and supporting more than 1 of any $THING (not just compilers) is
good to prevent accidental reliance on an implementation specific property.

The only question is what version of Clang exists in Debian bookworm, as
that affects how easy/hard it is to add to CI.

According to <a class="moz-txt-link-freetext" href="https://packages.debian.org/search?keywords=clang">https://packages.debian.org/search?keywords=clang</a>, bookworm
has Clang 14, while trixie has Clang 19.

So, how hard a limit is Clang-17?  Is Clang-14 doable or not?</pre>
    </blockquote>
    <pre>I think it is pretty hard limit because:
1. I haven't checked all the extension but, for example, we required 'H' extension and
   the support for it was added in 16.0.0:
   [f4c887c3a8406d85f4f942c8350f10026994f4d8("RISCV] Add H extension")
   $ git tag --contains f4c887c3a8406d85f4f942c8350f10026994f4d8
     llvmorg-16.0.0
     ...
2. Minimal support for RISCV-64 was added in clang17:
   f873029386dd415cd9caa78f600a593d9570c9ae("[BOLT] Add minimal RISC-V 64-bit support")
   $ git tag --contains f873029386dd415cd9caa78f600a593d9570c9ae
     llvmorg-17.0.0
     ...
And, actually, the second one reason was the reason why I tried to build with clang17 and suggests to use
it as a baseline.

</pre>
    <blockquote type="cite"
      cite="mid:956eb48f-b2f6-4951-8b12-2cf0dcfa2c9e@citrix.com">
      <pre wrap="" class="moz-quote-pre">

Alternatively, we could start adding some trixie containers.  We have
passed the toolchain freeze (was 15th March), so the build container
should be stable now, even if it isn't quite released yet.
</pre>
    </blockquote>
    <pre>clang has nice script to add any version. I did that in the following way
for bookworm docker container:
+    DEPS=(
+        # Clang
+        wget
+        gnupg
+        ca-certificates
+        lsb-release
+        software-properties-common
...
</pre>
    <pre>+    update-ca-certificates
+
+    wget -O - <a class="moz-txt-link-freetext" href="https://apt.llvm.org/llvm.sh">https://apt.llvm.org/llvm.sh</a> | bash -s 17
+    wget -O - <a class="moz-txt-link-freetext" href="https://apt.llvm.org/llvm.sh">https://apt.llvm.org/llvm.sh</a> | bash -s 18
+    wget -O - <a class="moz-txt-link-freetext" href="https://apt.llvm.org/llvm.sh">https://apt.llvm.org/llvm.sh</a> | bash -s 19
+    wget -O - <a class="moz-txt-link-freetext" href="https://apt.llvm.org/llvm.sh">https://apt.llvm.org/llvm.sh</a> | bash -s 20
+    # ln -s /usr/bin/clang-17 /usr/bin/clang

~ Oleksii
</pre>
  </body>
</html>

--------------579qJyP8Kf0Ylmlh0p1nhuMJ--

