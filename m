Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D45A69670
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 18:29:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921062.1325080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuxEM-0005SP-Un; Wed, 19 Mar 2025 17:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921062.1325080; Wed, 19 Mar 2025 17:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuxEM-0005QQ-S6; Wed, 19 Mar 2025 17:29:26 +0000
Received: by outflank-mailman (input) for mailman id 921062;
 Wed, 19 Mar 2025 17:29:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTXv=WG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tuxEL-0005QK-F7
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 17:29:25 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2eed6f6-04e7-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 18:29:23 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e66407963fso3675038a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 10:29:23 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aea93sm1035357966b.30.2025.03.19.10.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 10:29:22 -0700 (PDT)
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
X-Inumbo-ID: b2eed6f6-04e7-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742405363; x=1743010163; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pudLsqeZLxi1HoAYMVDh8cu9PXi+IgoGbpoMKfUdjdw=;
        b=cUMpFze5aER3Gdh/2+ReTV5goMQlKVJsiF7UTpKIYs5SFNxSHfh5iyvFhmS5pGwav2
         YgRL1Jw+qMwofeyyZdzr2INwHLyuIPFUO0+i6G0FjKRff/eNiyG2v3Jhr6UkMsFWomB6
         RqOqWSgUGeSEb8Hne9A1vsu+77eR1gxItPzZ3WB7Fyh0NDmMw69SmZjkUIresB4r5dBW
         3RGMx4yB/ZSdSVKpDxEhNZHIiJuOP6yRzhVtIipU4J6wXEEwcGNRMifGUsXYljLrnS1W
         s0tVdAhQYfBbyVj48cKRzStw87PqOPp8u4UNOFosdJ4fXbq59xJqSKNOLiTlcJJtigj+
         AGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742405363; x=1743010163;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pudLsqeZLxi1HoAYMVDh8cu9PXi+IgoGbpoMKfUdjdw=;
        b=aY0aHO6YbtD6RcigC7dwPUy+T6KMR3xIkEsdhiu3xTy2ttOzs3kJBi0K3k/oLT+QGG
         guGmtHn8TeDJng80IvPmVudhsW+Kmvzn2WDBor594vobLeIJszmO4kmZi376G9THIOBj
         OBD9YRTv0pWfRPinjpd/WzWOqPhsofK9MYmv3laQyYr+Yf2KteTDFYRkYQ92wz6uXKHW
         7YXngN1gsMq/l1bV3s5KqOHQ5rKbhE594PeKMJZHpNVs6nEuUp00PDZIqrwv0odAL7SS
         +p48bimSMLHKrulh0u2FUK5Y2UWXcTILDYkrBkIPuSCOHbEXQx/Fl16h/xqr3ibcBm5w
         COjg==
X-Forwarded-Encrypted: i=1; AJvYcCVjsX+0Svx0P7DQCc1iNYPjKl4OfpvJPvYLay5zltSAEDOdDAOr/swL/TwBpPZyRNmBDRFHgZ5Zub8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvMz+O3iKXwjPvj/rLJdw7AuI3kHdZ4fXZglOYQowt70rDUPVX
	+YzK7F5VQFXkdjz3GiaOIuxQp4KeSHjIveOsL0vtTjCgIgbNfkd9
X-Gm-Gg: ASbGncvi9MiLUhSkP1vk8dq+nk8HaV+3lUtRCDTFQ6nl57TEZgAtghW6Ics6YlUOXVn
	6gk8O3AvUz7GWPIvY40PZOySa7ckX8Z1UZBKb/ekYpyVEfWucXdPjZbIdgPW+Ukqwck6F6z8wRJ
	uTtc9VKLMxv3o2+wViem0rYngWnboxGpU9EmPFs8Dcnu2lETHxTgwPEzQAgAjlYAi+Fxdz1qSDN
	tcZGf6JvlrHXmP/pM13IbJokKuhq/fsnyIwyqH/ZK0/LLQ/bVZC4z/wfTC3ug0L+oeOaG9MTeuS
	HYaz20C38jLsvDCKAEEAb+lD/DX7Ft5pHGWAOZs8DdH+A6vj1uESwWoQTuqSgUVuW7gGIdbEdlO
	KMydPH0dAnOfn8iuONycwJucRbZFjNYQ=
X-Google-Smtp-Source: AGHT+IEs31iUjMqY9FFuLCSzOsXYBTyiERl+6DtIHN+GyJ92m2hVePiVR22XH+x6bktiECYVU57p+g==
X-Received: by 2002:a17:907:7da7:b0:ac2:7d72:c2ab with SMTP id a640c23a62f3a-ac3ce189338mr34039866b.47.1742405362767;
        Wed, 19 Mar 2025 10:29:22 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------OOimcDJQSSm04A8Kg6mY87ch"
Message-ID: <27dc3481-1f48-46c5-a827-e0a44c17686d@gmail.com>
Date: Wed, 19 Mar 2025 18:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/riscv: introduce preinit_xen_time()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
 <f633e10b-2bde-4574-ab87-fec5a2a52b07@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f633e10b-2bde-4574-ab87-fec5a2a52b07@suse.com>

This is a multi-part message in MIME format.
--------------OOimcDJQSSm04A8Kg6mY87ch
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/17/25 4:24 PM, Jan Beulich wrote:
> On 11.03.2025 17:19, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/time.c
>> @@ -0,0 +1,38 @@
>> +#include <xen/device_tree.h>
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/sections.h>
>> +
>> +unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
>> +unsigned long __read_mostly boot_count;
> Why not also __ro_after_init? And what is this variable actually needed
> for? Common code doesn't use it, so a better name (describing what it
> really holds) might be desirable, even if this then means not being in
> sync with Arm code.

To calculate more accurate amount of time since boot.
I think it can be __ro_after_init as it is going to be initialized once.

>
> Furthermore, I can't spot a declaration of this variable. Was it meant
> to be static?

It is going to be used for vtimer functionality and in repogram_timer()
so it can't be static.

I will add a declaration to asm/time.h:
```
   /* Counter value at boot time */
   extern uint64_t boot_count;
```

Thanks.

~ Oleksii

--------------OOimcDJQSSm04A8Kg6mY87ch
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
    <div class="moz-cite-prefix">On 3/17/25 4:24 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f633e10b-2bde-4574-ab87-fec5a2a52b07@suse.com">
      <pre wrap="" class="moz-quote-pre">On 11.03.2025 17:19, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/time.c
@@ -0,0 +1,38 @@
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/lib.h&gt;
+#include &lt;xen/sections.h&gt;
+
+unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
+unsigned long __read_mostly boot_count;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why not also __ro_after_init? And what is this variable actually needed
for? Common code doesn't use it, so a better name (describing what it
really holds) might be desirable, even if this then means not being in
sync with Arm code.</pre>
    </blockquote>
    <pre>To calculate more accurate amount of time since boot.
I think it can be __ro_after_init as it is going to be initialized once.

</pre>
    <blockquote type="cite"
      cite="mid:f633e10b-2bde-4574-ab87-fec5a2a52b07@suse.com">
      <pre wrap="" class="moz-quote-pre">

Furthermore, I can't spot a declaration of this variable. Was it meant
to be static?</pre>
    </blockquote>
    <pre>It is going to be used for vtimer functionality and in repogram_timer()
so it can't be static.

I will add a declaration to asm/time.h:
```
  /* Counter value at boot time */
  extern uint64_t boot_count;
```

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------OOimcDJQSSm04A8Kg6mY87ch--

