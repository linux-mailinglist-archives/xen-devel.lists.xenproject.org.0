Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FEDA9CF1B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 19:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968418.1358019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8MWW-00048m-VY; Fri, 25 Apr 2025 17:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968418.1358019; Fri, 25 Apr 2025 17:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8MWW-00045C-Sl; Fri, 25 Apr 2025 17:07:36 +0000
Received: by outflank-mailman (input) for mailman id 968418;
 Fri, 25 Apr 2025 17:07:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snHQ=XL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u8MWV-000456-Ue
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 17:07:36 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5d0e38b-21f7-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 19:07:30 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5f4b7211badso4134817a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 10:07:30 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f703831e8bsm1499964a12.66.2025.04.25.10.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 10:07:28 -0700 (PDT)
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
X-Inumbo-ID: c5d0e38b-21f7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745600850; x=1746205650; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uM6Rpe8YlwImMhpBkmOW2JNIIZDytxVZYYy+G8rxPc=;
        b=S+JLiZLR5r5/zea3fopzgBL/nyNuUS/RIs/7weBQBvG985qvhgYAWSG2YnyG3euC/X
         QXjRVnTj0QLriJBJMQpmK8dMAH0vAsnXqMIk7wVz1f5Mx5SKh4nni4bXq+JxMuqHJ4p1
         MUeSdPtgfBQv2LpnqPoUexrIL8QXtMXfuL4YZt1q0/+sch85M8G3y8/2o1RL2LzJQuZc
         5jmnwcmlsy/TX7igXix7MrkW8TOGnxjMMKYlNs8bsZuqdgCCgqGqSeYtsGAVGot048CC
         TQK29Qjq42klKRNzA3yNXeFuK2aL7qaywZd1Dxp5HPx5iO4xp2y15hKVm4xdKfzLRNlA
         VeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745600850; x=1746205650;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4uM6Rpe8YlwImMhpBkmOW2JNIIZDytxVZYYy+G8rxPc=;
        b=eB3py5MNMXb/JPLDwlFuoE2RQySa+v2ZMihXC0h6kvHxqLYDXyKFfvnAExE2qz0jzN
         3Ze9+rpIl4eGF15PKdcbzy3KxBeyQrHrCpMw5WD527MGji2TSkvNpYks+AIZStsW6UoJ
         HWJO0+QPYaZp2js2Wgstyz0ED0ds/hlLV5ycbxOevBMyIcIkzTMRZMx55AuroSGg65ev
         hztABsHhttamsE3E634tpQFAynpDTfh05ihz8N1bVZ5wmexQBkBgqpsUDTXcyjuYEAy4
         mEi+CUdK7VBdLU5Z4xUd/6MP03DnjxtQkMpo5S2vQWnZm49xh8OH41CegYtFf7hWM379
         gi/g==
X-Forwarded-Encrypted: i=1; AJvYcCXsyxxvWYURhCoI/MuGpTxdqWWfopz5tUrCEJ9+RtF8IpANHCPEtmSvtng0h1NUc5tSCFm4e8epN/g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLaEZ0u7Djv3j4OxWN4LlLv/j7UZ1nxhGW24r4zXnAmqptsmj+
	kOcLzPbMIB4ggqVd6Tyar+X0+p7CFYvHxuOwt3djdk1uDrzaWzKW
X-Gm-Gg: ASbGncvdVZbl2S4EoEvoW2zALH0saTkOLsbNoiRmuC5+jHLO6KF0c8OSDPJVkKQH326
	uzl7nQCItX9g/1U/Hn7fmrSznLQKgh6ouyphOl/qFx5CbrYPYEMf91nKU0sQmYPDJ5alAJmq0BK
	r0eaXgYoiRBXIcu/RGOk6MZZIkUnCkzscgYidqKaHxnZZUwu1IfcGAWqCloY+5IiVdCjdUstf/A
	S8c+vEtd953hdJ2jOyYccK+5BK2gh2eJ722VBfRnKWGUvCr2GugXHt6nAWVPZO80saCSMsGprUh
	4eugnLIwBTNr8y+Sf+0pT7rzq1mbpVYtnnjL0gslxnC1jKeo4YGoVUIuBipRmmVtM7zWIiZaHPn
	WxzFWBHK87TnbfGGj
X-Google-Smtp-Source: AGHT+IFbt838hrsDsvy4Zzu7Yh/XAx9Q4KJRDYg8QoiiZbuitiKT9AQUz0gqQiySG4Xt7s46F52t6w==
X-Received: by 2002:a50:858c:0:b0:5f4:ca30:149f with SMTP id 4fb4d7f45d1cf-5f723a16471mr1903259a12.31.1745600849886;
        Fri, 25 Apr 2025 10:07:29 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------vKZiJYBFphQnFEdHbsm5hwUH"
Message-ID: <83fc1566-ad4f-489d-a432-01ec638cbc21@gmail.com>
Date: Fri, 25 Apr 2025 19:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/14] xen/riscv: riscv_of_processor_hartid()
 implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <ab592d50ad161ffed3950bdf58ade49ae90a3c0e.1744126720.git.oleksii.kurochko@gmail.com>
 <65f5952a-8d2a-499c-bd66-53e9e2fbfa9c@suse.com>
 <d10323b7-d95d-4b96-9bf1-7ae8edda153e@gmail.com>
 <859d0c87-dc90-44c2-ab30-5164eec0705c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <859d0c87-dc90-44c2-ab30-5164eec0705c@suse.com>

This is a multi-part message in MIME format.
--------------vKZiJYBFphQnFEdHbsm5hwUH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/15/25 3:45 PM, Jan Beulich wrote:
> On 15.04.2025 15:39, Oleksii Kurochko wrote:
>> On 4/10/25 5:53 PM, Jan Beulich wrote:
>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>> +{
>>>> +    const __be32 *cell;
>>>> +    int ac;
>>>> +    uint32_t len;
>>>> +
>>>> +    ac = dt_n_addr_cells(cpun);
>>>> +    cell = dt_get_property(cpun, "reg", &len);
>>>> +    if ( !cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) > len) )
>>>> +        return ~0ULL;
>>> I'm sorry for my lack of DT knowledge, but what's "thread" representing here?
>>> You only pass in 0 below, so it's unclear whether it's what one might expect
>>> (the thread number on a multi-threaded core).
>> Based on the DT specification alone, the|`reg`| value could refer to either a CPU or a thread ID:
>> ```
>> The value of reg is a <prop-encoded-array> that defines a unique CPU/thread id for
>> the CPU/threads represented by the CPU node. If a CPU supports more than one thread
>> (i.e. multiple streams of execution) the reg prop-erty is an array with 1 element
>> per thread.
>> ```
>>
>> My understanding is that the term/thread/ was used in the Linux kernel to cover both
>> cases.
>> When SMT isn't supported, the CPU can be considered to have a single thread.
>> For example, RISC-V uses the term/hardware thread/ to describe a hart (i.e., a CPU).
>>
>> Interestingly, the Linux kernel always uses|thread = 0|.
>>
>> We could potentially drop this ambiguity and introduce an|ASSERT()| to check that
>> the|`reg`| property contains only one entry, representing the HART (CPU) ID:
>> ```
>>     Software can determine the number of threads by dividing the size of reg by the parent
>>     node’s #address-cells. If `|reg`| has more than one entry, it would simply SMT support
>>     is required.
>> ```
>>
>> Does that approach make sense, or should we stick with the current implementation?
> If extra enabling is required to make multi-thread CPUs work, then panic()ing
> (not so much ASSERT()ing) may make sense, for the time being. Better would be
> if we could use all threads in a system right away.

Actually, this function is ready to be used for multi-thread CPUs. A caller can request hardware id
by passing `thread` argument (`thread` -> the local thread number to get the hardware ID for).
So by calling:
  dt_get_cpu_hwid(cpu0, 0) -> it will return hardware id of thread 0 of cpu0
  dt_get_cpu_hwid(cpu0, 1) -> it will return hardware id of thread 1 of cpu0
  ...

In our case we assume that SMP isn't supported so that is why it is used only dt_get_cpu_hwid(cpu0, 0).

If one day, SMP will be enabled then it will be needed to change a callers of dt_get_cpu_hwid().

I will add a check in the caller.

~ Oleksii

--------------vKZiJYBFphQnFEdHbsm5hwUH
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
    <div class="moz-cite-prefix">On 4/15/25 3:45 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:859d0c87-dc90-44c2-ab30-5164eec0705c@suse.com">
      <pre wrap="" class="moz-quote-pre">On 15.04.2025 15:39, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 4/10/25 5:53 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+{
+    const __be32 *cell;
+    int ac;
+    uint32_t len;
+
+    ac = dt_n_addr_cells(cpun);
+    cell = dt_get_property(cpun, "reg", &amp;len);
+    if ( !cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) &gt; len) )
+        return ~0ULL;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I'm sorry for my lack of DT knowledge, but what's "thread" representing here?
You only pass in 0 below, so it's unclear whether it's what one might expect
(the thread number on a multi-threaded core).
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Based on the DT specification alone, the|`reg`| value could refer to either a CPU or a thread ID:
```
The value of reg is a &lt;prop-encoded-array&gt; that defines a unique CPU/thread id for
the CPU/threads represented by the CPU node. If a CPU supports more than one thread
(i.e. multiple streams of execution) the reg prop-erty is an array with 1 element
per thread.
```

My understanding is that the term/thread/ was used in the Linux kernel to cover both
cases.
When SMT isn't supported, the CPU can be considered to have a single thread.
For example, RISC-V uses the term/hardware thread/ to describe a hart (i.e., a CPU).

Interestingly, the Linux kernel always uses|thread = 0|.

We could potentially drop this ambiguity and introduce an|ASSERT()| to check that
the|`reg`| property contains only one entry, representing the HART (CPU) ID:
```
   Software can determine the number of threads by dividing the size of reg by the parent
   node’s #address-cells. If `|reg`| has more than one entry, it would simply SMT support
   is required.
```

Does that approach make sense, or should we stick with the current implementation?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If extra enabling is required to make multi-thread CPUs work, then panic()ing
(not so much ASSERT()ing) may make sense, for the time being. Better would be
if we could use all threads in a system right away.</pre>
    </blockquote>
    <pre>Actually, this function is ready to be used for multi-thread CPUs. A caller can request hardware id
by passing `thread` argument (`thread` -&gt; the local thread number to get the hardware ID for).
So by calling:
 dt_get_cpu_hwid(cpu0, 0) -&gt; it will return hardware id of thread 0 of cpu0
 dt_get_cpu_hwid(cpu0, 1) -&gt; it will return hardware id of thread 1 of cpu0
 ...

In our case we assume that SMP isn't supported so that is why it is used only dt_get_cpu_hwid(cpu0, 0).

If one day, SMP will be enabled then it will be needed to change a callers of dt_get_cpu_hwid().

I will add a check in the caller.

~ Oleksii
</pre>
  </body>
</html>

--------------vKZiJYBFphQnFEdHbsm5hwUH--

