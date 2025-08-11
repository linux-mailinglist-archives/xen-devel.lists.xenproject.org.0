Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8287BB20E2E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 17:23:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077748.1438776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUMt-0008Hf-CJ; Mon, 11 Aug 2025 15:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077748.1438776; Mon, 11 Aug 2025 15:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUMt-0008GE-9J; Mon, 11 Aug 2025 15:23:23 +0000
Received: by outflank-mailman (input) for mailman id 1077748;
 Mon, 11 Aug 2025 15:23:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOyo=2X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ulUMs-0008G8-AT
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 15:23:22 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d2f4aa4-76c7-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 17:23:21 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61557997574so6358387a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 08:23:21 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7970sm18236135a12.31.2025.08.11.08.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 08:23:19 -0700 (PDT)
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
X-Inumbo-ID: 1d2f4aa4-76c7-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754925800; x=1755530600; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkdl6P/7L5F25Eh4NaR/4QKX1qjZ9ySZQ4Bde96aweE=;
        b=DzYk1yCOd7zhHzNCWM5TsHQ3ymC6NIv/Mid9qUpExkW5UyfWwjrvvQ0x0yL4lvk957
         dZxhF2/A7tOQhgxNJsb4ZpnFqd3Hn5F634OvwwRz01opCH4nCW1VY9U56t9K7TntdFuM
         vFCgtMcbYH+c7uWhEJsPnIDFiM8hkHeJ549BCI7zlEhXNhBBX3eCnisLmopmWRMvXdSg
         Ur2QprvEwtEIzUq2GLvyaNVcEj8zxvBIkaCm9JgkBoMAtgAxTxaod9brn8KfYKi42g32
         ScNTnXL4sZ720VNaGIljSMC9LonNhdOS5kr4d36rTafGYI9J7g5Ncevzu1Vh2dbHwwEO
         sm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925800; x=1755530600;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pkdl6P/7L5F25Eh4NaR/4QKX1qjZ9ySZQ4Bde96aweE=;
        b=bxNmBxhlJultD+YMbzPrfPVW/D+cqGVOXUNTUzcoqkOnF3RToKsQf0nNbaJsr5gejV
         /TawvPmMMRrcqmRxl9u8HyFI7V/cS8sGRKb+lmwONEIhJAp0llVj7IaCvqkNypv4icIg
         3qhznzUh2oO0mtR21JTo4XjDZZrRapUOwmT+F5n9I+QY6gYrJrA8No97Hv0nkz01+yq1
         DX3hrBoACSaKA3eb7MLedjmQ90qIFD+3R/ug6tyYHqxrT2J9g8LLapm+h2Y1uWeb43uw
         8pocVa7ZioRpkFKBnCSjAmStoKRrQS6fNiE+aCf38SQ2JyZWenlWFXx5059u8cI0eWm4
         vyew==
X-Forwarded-Encrypted: i=1; AJvYcCXkLhEiNVUAiV6lIkenvyWrv0nREadvWIZbt0orrksKgUL6xULjiacg6m5CY6o3wVZXiaAbmigskiE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOYQUuk2SyR+twikHc3ip130ZtItpJbM7f+/vVxpT5FlsbV/gY
	qbdZ8xoev3I95RnZG1jsnqP3C+nl6Qj7g1zy4bJ5N0SqVLappTI+N/VI
X-Gm-Gg: ASbGncsSlp9LSAuscXfRzV0DOoSFmm0GOQjaEPLX5tuBn/9VlZo7IVuS94VMfFJpsd1
	SaCfUrCiV4+U8/Jo95ddcGvQONHf6AiEvxQH9ykj6CCf+l8jOdNrlgsoiZSfeCbdIf0OXB4kXjJ
	1lIt9pXoWI9ct/fsmk0kmgXyb44d2DlZqOJQwBOaS1DinnhZ9MBxNTw/kcWjznE3jQHwhj2+q/x
	zd+Z6tn4cbrtfn+hnYn1RGqVYvpi1gAs0JC/z2iiE+Drz17P2hld5hCXIKi4T6F8YcSrdr4y2Pb
	YvQ6DsVfeMB6qwLmRw9t5opxbsBHnY8yJ296n3L37F/5FplWQU8sgBVjkpNCOXhZJtRQsGCGMh2
	QPpPByD8fbV+/OUup16DDAjWeU0Mcfy4CpWvS4HTQf/7X6eFRG3zXQoOdsF+q8LhnXg8jbmoE
X-Google-Smtp-Source: AGHT+IExDSlHu0siJw8mztCwUl5U/DeAPOswM5nttSDYG1lE9gpqgq4XaH0cFzn+D/vyuDgvgd4o+w==
X-Received: by 2002:a05:6402:2884:b0:615:5536:65f with SMTP id 4fb4d7f45d1cf-617e2e92e9emr8111196a12.32.1754925800303;
        Mon, 11 Aug 2025 08:23:20 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------L2CfagFlon7UxWSnfrC00h4A"
Message-ID: <2012d0ab-f6f5-4577-ab4f-0a275742fc69@gmail.com>
Date: Mon, 11 Aug 2025 17:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] CI: Update riscv64 to use Debian Trixie
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Victor Lira <victorm.lira@amd.com>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
 <20250809221206.1260861-4-andrew.cooper3@citrix.com>
 <2919f22b-0b0c-488e-b0c6-96b9538e63d9@gmail.com>
 <2e3412e8-9d62-449b-87e6-22d34ce06e30@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2e3412e8-9d62-449b-87e6-22d34ce06e30@citrix.com>

This is a multi-part message in MIME format.
--------------L2CfagFlon7UxWSnfrC00h4A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/11/25 11:56 AM, Andrew Cooper wrote:
> On 11/08/2025 9:43 am, Oleksii Kurochko wrote:
>>
>> On 8/10/25 12:12 AM, Andrew Cooper wrote:
>>> Everything works fine with Debian 13.  Provide two new build jobs, and update
>>> both the randconfig the test jobs.
>>>
>>> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
>>> ---
>>> CC: Anthony PERARD<anthony.perard@vates.tech>
>>> CC: Michal Orzel<michal.orzel@amd.com>
>>> CC: Jan Beulich<jbeulich@suse.com>
>>> CC: Julien Grall<julien@xen.org>
>>> CC: Roger Pau Monné<roger.pau@citrix.com>
>>> CC: Stefano Stabellini<sstabellini@kernel.org>
>>> CC: Shawn Anastasio<sanastasio@raptorengineering.com>
>>> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>> CC: Doug Goldstein<cardoe@cardoe.com>
>>> CC: Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>
>>> CC: Victor Lira<victorm.lira@amd.com>
>>>
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1975929387
>>> ---
>>>   automation/gitlab-ci/build.yaml | 22 ++++++++++++++++++----
>>>   automation/gitlab-ci/test.yaml  |  2 +-
>>>   2 files changed, 19 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
>>> index 3fe539dc5683..f8e45f3467c8 100644
>>> --- a/automation/gitlab-ci/build.yaml
>>> +++ b/automation/gitlab-ci/build.yaml
>>> @@ -329,10 +329,10 @@ debian-13-ppc64le-gcc-debug:
>>>         CONFIG_UBSAN=y
>>>         CONFIG_UBSAN_FATAL=y
>>>   
>>> -debian-12-riscv64-gcc-debug:
>>> +debian-13-riscv64-gcc-debug:
>>>     extends: .gcc-riscv64-cross-build-debug
>>>     variables:
>>> -    CONTAINER: debian:12-riscv64
>>> +    CONTAINER: debian:13-riscv64
>>>       KBUILD_DEFCONFIG: tiny64_defconfig
>>>       HYPERVISOR_ONLY: y
>>>       EXTRA_XEN_CONFIG: |
>>> @@ -727,6 +727,20 @@ debian-12-riscv64-gcc:
>>>       KBUILD_DEFCONFIG: tiny64_defconfig
>>>       HYPERVISOR_ONLY: y
>>>   
>>> +debian-12-riscv64-gcc-debug:
>>> +  extends: .gcc-riscv64-cross-build-debug
>>> +  variables:
>>> +    CONTAINER: debian:12-riscv64
>>> +    KBUILD_DEFCONFIG: tiny64_defconfig
>>> +    HYPERVISOR_ONLY: y
>> Don't you mind to keep an order? So:
>>    debian-12-riscv64-gcc-debug:
>>    ...
>>    debian-13-riscv64-gcc-debug:
>>    ...
> Notice how those 2 hunks are 400 lines apart in the file.
>
> This is deliberate so debian-13-riscv64-gcc-debug (the one needed for
> tests) is scheduled with higher priority than the others.
>
> The diff certainly isn't great, but this is necessary to shorten the
> pipeline.
>
>> Also, it will make a diff a little bit better.
>>
>>> +
>>> +debian-13-riscv64-gcc:
>>> +  extends: .gcc-riscv64-cross-build
>>> +  variables:
>>> +    CONTAINER: debian:13-riscv64
>>> +    KBUILD_DEFCONFIG: tiny64_defconfig
>>> +    HYPERVISOR_ONLY: y
>>> +
>>>   .riscv-fixed-randconfig:
>>>     variables: &riscv-fixed-randconfig
>>>       EXTRA_FIXED_RANDCONFIG: |
>>> @@ -739,10 +753,10 @@ debian-12-riscv64-gcc:
>>>         CONFIG_VM_EVENT=n
>>>         CONFIG_XSM=n
>>>   
>>> -debian-12-riscv64-gcc-randconfig:
>>> +debian-13-riscv64-gcc-randconfig:
>> Are we going to have randconfig build test only for Debian-13?
> We only have finite test capacity.
>
>>>     extends: .gcc-riscv64-cross-build
>>>     variables:
>>> -    CONTAINER: debian:12-riscv64
>>> +    CONTAINER: debian:13-riscv64
>>>       KBUILD_DEFCONFIG: tiny64_defconfig
>>>       RANDCONFIG: y
>>>       <<: *riscv-fixed-randconfig
>>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>>> index 2f6f3affa637..9acd984d294c 100644
>>> --- a/automation/gitlab-ci/test.yaml
>>> +++ b/automation/gitlab-ci/test.yaml
>>> @@ -705,7 +705,7 @@ qemu-smoke-riscv64-gcc:
>>>     script:
>>>       - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
>>>     needs:
>>> -    - debian-12-riscv64-gcc-debug
>>> +    - debian-13-riscv64-gcc-debug
>> The same as above, are we going to run smoke tests only for Debian-13?
> Again, test capacity.  Even for x86 and ARM, we only have one main build
> under test.
>
>> If the answer to this and the question above is “yes,” then (probably
>> keeping the order — first debian-12, then debian-13 — for the jobs):
>>   Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Sorry, but rearranging is one thing that can't really happen.  Are you
> happy with my justification?

Yes, I am happy with that. Feel free to add my Reviewed-by.

Thanks for an explanation.

~ Oleksii

--------------L2CfagFlon7UxWSnfrC00h4A
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
    <div class="moz-cite-prefix">On 8/11/25 11:56 AM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2e3412e8-9d62-449b-87e6-22d34ce06e30@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 11/08/2025 9:43 am, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

On 8/10/25 12:12 AM, Andrew Cooper wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Everything works fine with Debian 13.  Provide two new build jobs, and update
both the randconfig the test jobs.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
CC: Doug Goldstein <a class="moz-txt-link-rfc2396E" href="mailto:cardoe@cardoe.com">&lt;cardoe@cardoe.com&gt;</a>
CC: Marek Marczykowski-Górecki <a class="moz-txt-link-rfc2396E" href="mailto:marmarek@invisiblethingslab.com">&lt;marmarek@invisiblethingslab.com&gt;</a>
CC: Victor Lira <a class="moz-txt-link-rfc2396E" href="mailto:victorm.lira@amd.com">&lt;victorm.lira@amd.com&gt;</a>

<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1975929387">https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1975929387</a>
---
 automation/gitlab-ci/build.yaml | 22 ++++++++++++++++++----
 automation/gitlab-ci/test.yaml  |  2 +-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 3fe539dc5683..f8e45f3467c8 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -329,10 +329,10 @@ debian-13-ppc64le-gcc-debug:
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
 
-debian-12-riscv64-gcc-debug:
+debian-13-riscv64-gcc-debug:
   extends: .gcc-riscv64-cross-build-debug
   variables:
-    CONTAINER: debian:12-riscv64
+    CONTAINER: debian:13-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     HYPERVISOR_ONLY: y
     EXTRA_XEN_CONFIG: |
@@ -727,6 +727,20 @@ debian-12-riscv64-gcc:
     KBUILD_DEFCONFIG: tiny64_defconfig
     HYPERVISOR_ONLY: y
 
+debian-12-riscv64-gcc-debug:
+  extends: .gcc-riscv64-cross-build-debug
+  variables:
+    CONTAINER: debian:12-riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    HYPERVISOR_ONLY: y
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Don't you mind to keep an order? So:
  debian-12-riscv64-gcc-debug:
  ...
  debian-13-riscv64-gcc-debug:
  ...
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Notice how those 2 hunks are 400 lines apart in the file.

This is deliberate so debian-13-riscv64-gcc-debug (the one needed for
tests) is scheduled with higher priority than the others.

The diff certainly isn't great, but this is necessary to shorten the
pipeline.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Also, it will make a diff a little bit better.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+
+debian-13-riscv64-gcc:
+  extends: .gcc-riscv64-cross-build
+  variables:
+    CONTAINER: debian:13-riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    HYPERVISOR_ONLY: y
+
 .riscv-fixed-randconfig:
   variables: &amp;riscv-fixed-randconfig
     EXTRA_FIXED_RANDCONFIG: |
@@ -739,10 +753,10 @@ debian-12-riscv64-gcc:
       CONFIG_VM_EVENT=n
       CONFIG_XSM=n
 
-debian-12-riscv64-gcc-randconfig:
+debian-13-riscv64-gcc-randconfig:
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Are we going to have randconfig build test only for Debian-13?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
We only have finite test capacity.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">   extends: .gcc-riscv64-cross-build
   variables:
-    CONTAINER: debian:12-riscv64
+    CONTAINER: debian:13-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
     &lt;&lt;: *riscv-fixed-randconfig
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 2f6f3affa637..9acd984d294c 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -705,7 +705,7 @@ qemu-smoke-riscv64-gcc:
   script:
     - ./automation/scripts/qemu-smoke-riscv64.sh 2&gt;&amp;1 | tee ${LOGFILE}
   needs:
-    - debian-12-riscv64-gcc-debug
+    - debian-13-riscv64-gcc-debug
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">The same as above, are we going to run smoke tests only for Debian-13?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Again, test capacity.  Even for x86 and ARM, we only have one main build
under test.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
If the answer to this and the question above is “yes,” then (probably
keeping the order — first debian-12, then debian-13 — for the jobs):
 Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Sorry, but rearranging is one thing that can't really happen.  Are you
happy with my justification?</pre>
    </blockquote>
    <pre>Yes, I am happy with that. Feel free to add my Reviewed-by.

Thanks for an explanation.

~ Oleksii</pre>
  </body>
</html>

--------------L2CfagFlon7UxWSnfrC00h4A--

