Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F11A3C2BF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 15:55:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893066.1301995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tklTs-0007Qf-VE; Wed, 19 Feb 2025 14:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893066.1301995; Wed, 19 Feb 2025 14:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tklTs-0007OM-Rz; Wed, 19 Feb 2025 14:55:20 +0000
Received: by outflank-mailman (input) for mailman id 893066;
 Wed, 19 Feb 2025 14:55:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ0s=VK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tklTr-0007OG-Cz
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 14:55:19 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 883608a0-eed1-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 15:55:17 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3098088c630so39958441fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 06:55:17 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54523070a9csm2005069e87.5.2025.02.19.06.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 06:55:16 -0800 (PST)
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
X-Inumbo-ID: 883608a0-eed1-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739976917; x=1740581717; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBHrm6CUu/QxlYRbxU91CMyCvNw/y/8KnZwkolXjx1c=;
        b=QFZjtcZjuhY8p6sRFd9H7FEfGRktAwBDPx1rkLxCgMIqL3RAhihy2pBYw5O+MkHRgw
         uD1PJrO+SxA9HutQnk0JRoOLVMZDdos28SSqRV0IKR+Ujgu552WJgtyGI8wfVJI8V0Y/
         CmmzE0c5ljwN5nA8ZIoXi/bcHN0xV+iEtdjdSv+hB6QZXqjkgoW9yINZH47SlpE4kkkN
         3IhqUqGBiQE0seIKwrzdmB5+pl+QWzGMhDOq5wQEU2ZjOWJxsRttWZbrLg+XnGB+Vre0
         LOj3NglW1c10jpbndW0UyImL6Dy/TMnXZ6O3VcZQWDD3rQxNsnwTJDUtVyaHGG+wlUaV
         siqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739976917; x=1740581717;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XBHrm6CUu/QxlYRbxU91CMyCvNw/y/8KnZwkolXjx1c=;
        b=u9SWvEFLmLUgj+3JoAJUcCv1DvOQnClMRxaMsc3HQAxOKYHoPXXBAMxIG8TwWf4mZB
         M07xYevlWZeBgOqQH3E2bLSBDZqA0zcTTab2HKTS4tPLWtpl5yYzMh9PSjXTTAvrk5G6
         Tvd1C5Uy4e58Wr3HhSmz7znnEsarO6UtGEKlr10vvzfkftGMdwREKgrTjbi0VVu7whoz
         DKkoiCb/MJEVWamZr/iDUXYENZ+IQJ8sYX3y3rjQtK3bJwbAIYO1dV8ybe+s4cbK+ppO
         9as7qgkA+tB5TsZ0Kc/TyRhDQAJvlzgV6RQzcbCg0yjQR7ki9oZAfEsZ5v/dj5V0Nm0M
         v1BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJe5lSMAxQNXHv4QtxElrP2hRVP26L1AMfPEH5vgfZIa9scZTWo59nQ6dB+Lz4UihaPK0uo+QAkA8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1CdF0g7OKkpCn5iHiNtsgMJFWDTcCuwKTCOxKWVnMigxOr8NV
	zYjaU89FhaUgZPNigYF4ji5UUDORGUOrs3rhk1BZ44/dkD/vo0hn
X-Gm-Gg: ASbGncv/mLD3QuPzezuz1XPSq3STAjFuhw8AsebjElzfQ/kKFLQayz6ONTI0SWR9G4w
	8I2OAupcy8fJ1GyXwYo7ypvu3mUPctiZjOrO+Qk4nGwxbOh1geDNYu1f4ooCSobQOv1fziKXexh
	A6BY3oTxLxh4wo5Zvex7ByW0D18hcwRivitx4Yn58vucV4RRWu/ADsLxGZIFqgQdhR0pAJoieJN
	vE7cgy/1CXhIMyLqYpnlhGXVFoko6ayOa/921FPo8l0HqW3DMb/qfncAGPP/PCdwjv7bXdt2UBk
	CvUNXFmE++VSxrxUJ0lTiU6b
X-Google-Smtp-Source: AGHT+IEzTlmpFQ1LO3dBmkquQRvEHCUStZL6tKrmS/tpGPmN4f6/nacg23gotXFX14S5pirYclKe0Q==
X-Received: by 2002:a05:6512:1054:b0:545:6a2:e56 with SMTP id 2adb3069b0e04-5452fe904efmr5317283e87.37.1739976916317;
        Wed, 19 Feb 2025 06:55:16 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------GCdqRDqW3Na6Ukg8f2T9FYZ8"
Message-ID: <16b2411c-9d5d-4c54-a4bd-f2d7215688c1@gmail.com>
Date: Wed, 19 Feb 2025 15:55:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v6 1/2] xen/riscv: drop CONFIG_RISCV_ISA_RV64G
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739355004.git.oleksii.kurochko@gmail.com>
 <82c9611b923170b0525a7b76337ef067e359dc96.1739355004.git.oleksii.kurochko@gmail.com>
 <10155bb3-20c8-4d08-aafc-df41112c91c9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <10155bb3-20c8-4d08-aafc-df41112c91c9@suse.com>

This is a multi-part message in MIME format.
--------------GCdqRDqW3Na6Ukg8f2T9FYZ8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/18/25 6:03 PM, Jan Beulich wrote:
> On 12.02.2025 17:50, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/Kconfig
>> +++ b/xen/arch/riscv/Kconfig
>> @@ -28,16 +28,6 @@ choice
>>   	help
>>   	  This selects the base ISA extensions that Xen will target.
>>   
>> -config RISCV_ISA_RV64G
>> -	bool "RV64G"
>> -	help
>> -	  Use the RV64I base ISA, plus
>> -	  "M" for multiply/divide,
>> -	  "A" for atomic instructions,
>> -	  “F”/"D" for  {single/double}-precision floating-point instructions,
>> -	  "Zicsr" for control and status register access,
>> -	  "Zifencei" for instruction-fetch fence.
>> -
>>   endchoice
> Shouldn't the choice be removed altogether then, for now being empty?

Overlooked that, "Base ISA" choice could be removed too then. or just change to:
choice
	prompt "Base ISA"
	default "ima" if RISCV_64
	help
	  This selects the base ISA extensions that Xen will target.

endchoice

>
>> --- a/xen/arch/riscv/arch.mk
>> +++ b/xen/arch/riscv/arch.mk
>> @@ -6,8 +6,13 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>   riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
>>   riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
>>   
>> -riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
>> -riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>> +riscv-march-$(CONFIG_RISCV_64) := rv64
>> +
>> +riscv-march-y := $(riscv-march-y)ima
>> +
>> +riscv-march-$(CONFIG_RISCV_ISA_C) := $(riscv-march-y)c
>> +
>> +riscv-march-y := $(riscv-march-y)_zicsr_zifencei
> The repeated use of := makes this longer than necessary, and hence harder to
> read. I understand using += isn't exactly ideal either, because then on the rhs
> no blanks may appear (aiui), being kind of against our style and potentially
> hampering readability. Still maybe:
>
> riscv-march-$(CONFIG_RISCV_64) := rv64
> riscv-march-y+=ima
> riscv-march-$(CONFIG_RISCV_ISA_C)+=c
> riscv-march-y+=_zicsr_zifencei
>
> ?

 From my point of view both options hard to read but `+=`, at the moment, look a
little bit better. I will update correspondingly.

Thanks.

~ Oleksii

--------------GCdqRDqW3Na6Ukg8f2T9FYZ8
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
    <div class="moz-cite-prefix">On 2/18/25 6:03 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:10155bb3-20c8-4d08-aafc-df41112c91c9@suse.com">
      <pre wrap="" class="moz-quote-pre">On 12.02.2025 17:50, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -28,16 +28,6 @@ choice
 	help
 	  This selects the base ISA extensions that Xen will target.
 
-config RISCV_ISA_RV64G
-	bool "RV64G"
-	help
-	  Use the RV64I base ISA, plus
-	  "M" for multiply/divide,
-	  "A" for atomic instructions,
-	  “F”/"D" for  {single/double}-precision floating-point instructions,
-	  "Zicsr" for control and status register access,
-	  "Zifencei" for instruction-fetch fence.
-
 endchoice
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Shouldn't the choice be removed altogether then, for now being empty?</pre>
    </blockquote>
    <pre>Overlooked that, "Base ISA" choice could be removed too then. or just change to:
choice
	prompt "Base ISA"
	default "ima" if RISCV_64
	help
	  This selects the base ISA extensions that Xen will target.

endchoice

</pre>
    <blockquote type="cite"
      cite="mid:10155bb3-20c8-4d08-aafc-df41112c91c9@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -6,8 +6,13 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
 riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
 
-riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
-riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
+riscv-march-$(CONFIG_RISCV_64) := rv64
+
+riscv-march-y := $(riscv-march-y)ima
+
+riscv-march-$(CONFIG_RISCV_ISA_C) := $(riscv-march-y)c
+
+riscv-march-y := $(riscv-march-y)_zicsr_zifencei
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The repeated use of := makes this longer than necessary, and hence harder to
read. I understand using += isn't exactly ideal either, because then on the rhs
no blanks may appear (aiui), being kind of against our style and potentially
hampering readability. Still maybe:

riscv-march-$(CONFIG_RISCV_64) := rv64
riscv-march-y+=ima
riscv-march-$(CONFIG_RISCV_ISA_C)+=c
riscv-march-y+=_zicsr_zifencei

?</pre>
    </blockquote>
    <pre>From my point of view both options hard to read but `+=`, at the moment, look a
little bit better. I will update correspondingly.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------GCdqRDqW3Na6Ukg8f2T9FYZ8--

