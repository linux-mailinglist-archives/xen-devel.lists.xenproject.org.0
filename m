Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E10AA730B6
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 12:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929114.1331738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txliz-0005fg-5h; Thu, 27 Mar 2025 11:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929114.1331738; Thu, 27 Mar 2025 11:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txliz-0005cs-34; Thu, 27 Mar 2025 11:48:41 +0000
Received: by outflank-mailman (input) for mailman id 929114;
 Thu, 27 Mar 2025 11:48:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eznr=WO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txliy-0005az-96
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 11:48:40 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a518497-0b01-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 12:48:35 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5eb92df4fcbso1543004a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 04:48:35 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac696678277sm774799866b.174.2025.03.27.04.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 04:48:34 -0700 (PDT)
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
X-Inumbo-ID: 6a518497-0b01-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743076115; x=1743680915; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlY3pY5H/31YnUiRHCXNdf+Z5kXhZi3R+4s8CN883xM=;
        b=ap/FNKyNobhqYEjoXjdhDfqU4FmpzEHZPp0UUwKBex6s6phoyRwSfVllba1zJs01SJ
         tCOxgHWEVNhs+ebMx7h2Cwe9MXOjncrL6qeZ+LXg6Ny5T+6Yixf/9ZlqSAeCELjf2EIP
         7ZvQzQzDPNtbO5prlzP4m7Cbw/hMCJkEZJ8KzBMJ0R/wRM8lk4vE2brK7cQTOioBJFiF
         pdlV1meB38qofIVc05XDMF/aKBt/AfrHF9ltzpLnrWGH/cxkNe5mERXfZavStLYdJ7+o
         NNWmyKt1qylxU1cdio96LGvacU+7oC4DW5dSfcdFQKMJ/23SxXTNbbsuX1kCbLGXAiEV
         y+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743076115; x=1743680915;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wlY3pY5H/31YnUiRHCXNdf+Z5kXhZi3R+4s8CN883xM=;
        b=o0nFo2HvL/0GUYqfxRTNM3Zbuqq+iuinI7Hft/eiglMmWISmfa7W2UaOnUyvkX71MU
         ui+s7HUI8IaUQQj3iUuPtOou4oSaL8Tw8P2tYc1NwiAF6jzJfibuYhoCm1wUij7q4Qsq
         fdGiMvJUe5IdvreU4vsnjpbOzIgyVKGKrrcRfFUFM8XQmsDF7PvIOId4HI5n/2fycE7/
         jniKe149FMfrYYztnbKpRXZ4xVANHUyakq9LMjUv8kdQZwKTHii6pAw8ESUB/weAeo/e
         9ErJsj8phdswVKCtCCJW3xq8JgXgiqR2nS3xg2qQC3ZQOBF7ezpckZrTAc9rz9Uxl6+B
         Q7xw==
X-Forwarded-Encrypted: i=1; AJvYcCXE0X4E5GFKzIkRR+NJWaZeyI+ix1QGK+xtUf4NMpFP7Dt0OCCyrrOGYO2d6fEFTI5IEp9sx/K2jTs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmSjoH/QafK0lYSHuZMQ70qgec6x4p5p/OK2F9BYAjgGxNXBVH
	qslg+PWyZCYh4eM3fJTsvtDJySR07Z5eGrDYu/6k4Zg/NriaNiFG
X-Gm-Gg: ASbGncvLdKaQ0c/71G9M+Ruy63dvKA8TIKA37sNxw4i9/uUTF5nTfcbqflisQ00srWN
	Z3JHeBpHB83dVqdZPWsU97GiyM0Wc0saRx9mDf05HszkH1eAjUjov6lXsLfqx4XEPUPlyKbPWRO
	2S8t0qLc2ajMM1kKxOZovROGqefwJ2TnflHNpHwrH4o7+TT91t4aQl9XIFgLbdTjUFumAl+F/aF
	Pr5/cWsp+Z42ba/xFdp87Suqg52IvZjSVSwgxH+vOqgnr0Kg1Y251AvIt1FswGqDbcIEppDHHKk
	DjVWdw2W5TSztZs8IHsv+5kpvWCx9P4xKWICCIIZ3QvWmiBHawxXYKdM2BxEofBdAcy1gDTyiqT
	d2aDAvXhiZ9E1PtGf7Wi08oJ2JYKRyAU=
X-Google-Smtp-Source: AGHT+IHaU44+0CryGjcHvtOigpD5g7X8zwQd163aKdFFUfWA71hD3CQpJzQ6e/uij2AcRrLx2m22jw==
X-Received: by 2002:a17:906:4fd5:b0:ab3:2b85:5d5 with SMTP id a640c23a62f3a-ac6fb147aebmr350916566b.49.1743076114628;
        Thu, 27 Mar 2025 04:48:34 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------E6tmigiOHOElWvuo0eh16wO0"
Message-ID: <9fabdf22-bc0c-4c4d-9652-1b5072d83660@gmail.com>
Date: Thu, 27 Mar 2025 12:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/riscv: introduce preinit_xen_time()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
 <86c067f2-87ff-4e75-b94a-9d760fc730e5@suse.com>
 <cb66e1e4-7ac4-4a98-9bdb-b92e6c069f0a@gmail.com>
 <f76b12af-172a-4faf-9e60-54c4626db8c3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f76b12af-172a-4faf-9e60-54c4626db8c3@suse.com>

This is a multi-part message in MIME format.
--------------E6tmigiOHOElWvuo0eh16wO0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/27/25 8:42 AM, Jan Beulich wrote:
> On 26.03.2025 20:49, Oleksii Kurochko wrote:
>> On 3/26/25 4:13 PM, Jan Beulich wrote:
>>> On 25.03.2025 18:36, Oleksii Kurochko wrote:
>>>> +/* Set up the timer on the boot CPU (early init function) */
>>>> +static void __init preinit_dt_xen_time(void)
>>>> +{
>>>> +    static const struct dt_device_match __initconstrel timer_ids[] =
>>>> +    {
>>>> +        DT_MATCH_PATH("/cpus"),
>>>> +        { /* sentinel */ },
>>>> +    };
>>>> +    uint32_t rate;
>>>> +
>>>> +    timer = dt_find_matching_node(NULL, timer_ids);
>>>> +    if ( !timer )
>>>> +        panic("Unable to find a compatible timer in the device tree\n");
>>>> +
>>>> +    dt_device_set_used_by(timer, DOMID_XEN);
>>>> +
>>>> +    if ( !dt_property_read_u32(timer, "timebase-frequency", &rate) )
>>>> +        panic("Unable to find clock frequency\n");
>>>> +
>>>> +    cpu_khz = rate / 1000;
>>> "rate" being only 32 bits wide, what about clock rates above 4GHz? Or is
>>> this some external clock running at a much lower rate than the CPU would?
>> It is the frequency of the hardware timer that drives the
>> |mtime|register, it defines the frequency (in Hz) at which the timer
>> increments.
> And that timer can't plausibly run at more than 4 GHz?

I haven't seen yet such big timer frequency.

But if to look at device tree spec:
timebase-frequency: Specifies the current frequency at which the
timebase and decrementer registers are updated (in Hertz).
The value is a <prop-encoded-array> in one of two forms:
• A 32-bit integer consisting of one <u32>
   specifying the frequency.
• A 64-bit integer represented as a <u64>.

Interesting that Linux kernel reads timebase-frequency as u32:
    u32 prop;
    ...
    if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
and then saves it to:
    riscv_timebase = prop;
where riscv_timebase is declared as unsigned long.

I think it can be left as it is now as if timebase-frequency will be u64 then
it means that it will be needed to read two u32 values and in this case dt_property_read_u32()
will return 0 and the panic will occur.

~ Oleksii

--------------E6tmigiOHOElWvuo0eh16wO0
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
    <div class="moz-cite-prefix">On 3/27/25 8:42 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f76b12af-172a-4faf-9e60-54c4626db8c3@suse.com">
      <pre wrap="" class="moz-quote-pre">On 26.03.2025 20:49, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 3/26/25 4:13 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 25.03.2025 18:36, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+/* Set up the timer on the boot CPU (early init function) */
+static void __init preinit_dt_xen_time(void)
+{
+    static const struct dt_device_match __initconstrel timer_ids[] =
+    {
+        DT_MATCH_PATH("/cpus"),
+        { /* sentinel */ },
+    };
+    uint32_t rate;
+
+    timer = dt_find_matching_node(NULL, timer_ids);
+    if ( !timer )
+        panic("Unable to find a compatible timer in the device tree\n");
+
+    dt_device_set_used_by(timer, DOMID_XEN);
+
+    if ( !dt_property_read_u32(timer, "timebase-frequency", &amp;rate) )
+        panic("Unable to find clock frequency\n");
+
+    cpu_khz = rate / 1000;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">"rate" being only 32 bits wide, what about clock rates above 4GHz? Or is
this some external clock running at a much lower rate than the CPU would?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It is the frequency of the hardware timer that drives the 
|mtime|register, it defines the frequency (in Hz) at which the timer 
increments.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And that timer can't plausibly run at more than 4 GHz?</pre>
    </blockquote>
    <pre>I haven't seen yet such big timer frequency.

But if to look at device tree spec:
timebase-frequency: Specifies the current frequency at which the
timebase and decrementer registers are updated (in Hertz).
The value is a &lt;prop-encoded-array&gt; in one of two forms:
• A 32-bit integer consisting of one &lt;u32&gt;
  specifying the frequency.
• A 64-bit integer represented as a &lt;u64&gt;.

Interesting that Linux kernel reads timebase-frequency as u32:
   u32 prop;
   ... 
   if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &amp;prop))
and then saves it to:
   riscv_timebase = prop;
where riscv_timebase is declared as unsigned long.

I think it can be left as it is now as if timebase-frequency will be u64 then
it means that it will be needed to read two u32 values and in this case dt_property_read_u32()
will return 0 and the panic will occur.

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:f76b12af-172a-4faf-9e60-54c4626db8c3@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------E6tmigiOHOElWvuo0eh16wO0--

