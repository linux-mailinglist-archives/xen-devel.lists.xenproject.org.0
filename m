Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF3588574F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 11:18:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696296.1087117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFUn-00054T-5O; Thu, 21 Mar 2024 10:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696296.1087117; Thu, 21 Mar 2024 10:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFUn-00052K-2c; Thu, 21 Mar 2024 10:18:01 +0000
Received: by outflank-mailman (input) for mailman id 696296;
 Thu, 21 Mar 2024 10:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WPKF=K3=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1rnFUl-00052E-LF
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 10:17:59 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4949fb00-e76c-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 11:17:57 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33ececeb19eso414165f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 03:17:57 -0700 (PDT)
Received: from [192.168.2.1] (82-64-138-184.subs.proxad.net. [82.64.138.184])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a5d4688000000b0033e3c4e600asm16990081wrq.7.2024.03.21.03.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 03:17:56 -0700 (PDT)
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
X-Inumbo-ID: 4949fb00-e76c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20230601.gappssmtp.com; s=20230601; t=1711016276; x=1711621076; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7B1NwdKQNT344Q68FFSdw+cjq3T6sd7FqhjShBG2N58=;
        b=eyfPdlhwSA/UTo6qSHUpvCV1uS7Ha7NZN7xrNQXCXCz303XTyPjeSiyWwVIqalcyb0
         YTTlLgHwmYIyrduV+HwTBsHvldw8ToAqOkfhiMScBTyQi1AomDCtDVmuwn1tcg3VSh7Q
         Di37X/Yc8F7TsxCg1oYD5vKJpljFisuMmTZWKH2mz6RZMhZaNZu5+pBgc+Sjwz4mRr8J
         uJeb5OpBZvbkQ5zBoyBkMKUoWXdTlD8hFEbNCARvunexVEgqZizM7Fql3nvh6nwaT4ry
         zED1i0EXTL7/YU0zuja+bJ27ULk4mcPLeQUXctIeH3NkFoyArV/6GpjNYxSB9LGK4B+a
         I2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711016276; x=1711621076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7B1NwdKQNT344Q68FFSdw+cjq3T6sd7FqhjShBG2N58=;
        b=KPYqyP87KgFgHHu/mFj1lvFtbhzYb23nWfjkAHBs6jGqYYCXIO8rG9a8sQTOvdblWS
         GCTFogNXBdeV1yCQSNPQI18TWs7AxlPb5bQYbY0dN/q5hdcvT96oOoQuWxPrfeWXxd9X
         pemEHgQ7jnMcroPOL0pgnaBa3JkfTJnoJ2jg2JMeHnZcuZBYUsMhXakltIk/JqB8MEzM
         csa1EKLMfBuUaJfXfUXH7ozQMU0oYLGFRCR4m6hZK6QZ6A1yZqLdGXZgVv4WZT6aEB5B
         cBi+4UqIoaoIOq4kewc8I47Yuxkg9+9Nbcg0zovESgA5lCwtjb89V3wADkkrFz6EDZEb
         QPXg==
X-Gm-Message-State: AOJu0YxgUb2lvJCE+M67WJojQJeHEBgh1/EO+Q8Bz6AKL3pRZ9dIXd44
	ANv6bSb4mf7S1emoA3c11Cs0z9jjxkiZP36+EDLGJWehHcF7n48i1TsfrXjPtBg=
X-Google-Smtp-Source: AGHT+IHgSDnnDHZ1tvLGQMN6gwzMryuQnDRQQlN6Bmd/5q500BcuQZSa+1ZZdPQmfGau041j6UJ2CA==
X-Received: by 2002:a5d:4bc5:0:b0:33e:aab0:9984 with SMTP id l5-20020a5d4bc5000000b0033eaab09984mr1306799wrt.24.1711016276389;
        Thu, 21 Mar 2024 03:17:56 -0700 (PDT)
Message-ID: <e0d29ad0-50d3-48c7-b842-ace0580d3250@rabbit.lu>
Date: Thu, 21 Mar 2024 11:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/man: add shutdown reasons to xl (list) man page
Content-Language: en-US
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <0a2fcad111622431b8cd54c69adc3dedd24fb572.1709910923.git.slack@rabbit.lu>
 <c77ecb60-35c1-426d-bac5-f4892598c6b5@perard>
From: zithro <slack@rabbit.lu>
In-Reply-To: <c77ecb60-35c1-426d-bac5-f4892598c6b5@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20 Mar 2024 17:08, Anthony PERARD wrote:
> On Fri, Mar 08, 2024 at 04:19:20PM +0100, zithro / Cyril Rébert wrote:
>> Questions (unblocking):
>>   - why a double space between all sentences ?
> 
> It's an English thing maybe?
> 
> Wikipedia has an article about it: https://en.wikipedia.org/wiki/Sentence_spacing
> But actually, single space seems like it used to be a french thing, even
> called "French spacing":
> https://en.wikipedia.org/wiki/History_of_sentence_spacing#French_and_English_spacing
> 
> I guess it doesn't really matter. I don't really pay attention to it
> anyway.

Thanks for the links !
 From "https://en.wikipedia.org/wiki/Sentence_spacing#Computer_era" :
- "text-editing [...] in Emacs by default uses a double space following 
a period"
- "Troff uses two spaces to mark the end of a sentence"

I guess we at least know why ? :) Many man pages (not only Xen's) use 
double spaces. I just copied the format, good to know it's not 
mandatory. Let's save disk space, one space at a time.

(For fun, another quote from wiki : "Varying the spacing between 
sentences, and using the changing spacing to encode information, are a 
standard method of steganography, hiding secret information in public 
documents", so ... what are you doing guys ? ^^).


>>   - how to get a "simple LF" ? Ie. I want to use <br>, not <p>
>>     (a simple <Enter> has no effect, a double renders a <p>)
> 
> That doesn't look to be possible, unless you actually managed to write
> the paragraph for all targeted formats, with things like =begin html...,
> but that would probably make things more complicated that necessary.

Ok, nevermind then.
By the way, are "raw text" files (*.txt) still accepted as docs ?

> 
>> ---
>> diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
>> index bed8393473..d37227ba58 100644
>> --- a/docs/man/xl.1.pod.in
>> +++ b/docs/man/xl.1.pod.in
>> @@ -370,12 +370,50 @@ scheduling by the Xen hypervisor.
>>   The guest OS has shut down (SCHEDOP_shutdown has been called) but the
>>   domain is not dying yet.
>>   
>> -=item B<c - crashed>
>> +There are six shutdown reasons, which will be displayed after the "s" : B<-rscwS>.
>> +
>> +Note that some states will only be displayed if "on_poweroff=preserve" is set in
>> +the config file, see L<xl.cfg(5)>).
>> +
>> +=over 4
>> +
>> +=over 4
>> +
>> +=item B<s- : poweroff>
>> +
>> +The domain exited normally, it will get destroyed.
>> +
>> +=item B<sr : reboot>
>> +
>> +The domain will reboot.
> 
> Well, that's not really true. I think to end up in this state, what
> happen is that the domain shutdown and ask for a reboot. It's normally
> the toolstack job to cleanup the domain then create a new domain for the
> guest. I guess you might see this state if you have "on_reboot=preserve"
> or you run `xl list` at the right time. Or the toolstack crashed and

(one may also use 'watch -n 1 xl list' to "follow states" during tests)

> fail to kill the domain before a reboot. So maybe a better to have
> something like "The domain exited normally and ask for a reboot."

Ok, will rephrase ! Although I'd have agreed you'd do such changes while 
committing, you better know the terminology than me ! ;)

> 
> Same things for the other entries (poweroff and watchdog). The status is
> just the current status of what is supposed to happen. But a few things
> might mean that the domain stay in that state unless the admin does
> something. This could be simply because there's "on_*=preserve" setting,
> the toolstack crashed or we just happen to look while the toolstack is
> cleaning thing up.

I also wanted to "normalize" the shutdown statuses between 'xl list' and 
'xl top'. I mainly use (and dev a bit in) xentop, and realized the 
shutdown statuses are not shown (only "s", not "sX").

> 
>> +=item B<ss : suspend>
>> +
>> +The domain is suspended to disk or to RAM. If suspended to disk, the domain will
>> +get destroyed.
> 
> I think in that state, the domain is just suspended, maybe to RAM? I
> don't know if suspend to disk would end up in this state, my guess is
> the domain will go to "poweroff" instead. But for suspend to "RAM", I
> think the toolstack is supposed to save the guest memory and guest
> config somewhere, maybe even on a different host for live migration?
> 
> This is a state that seems to happen as part of a live migration (or `xl
> save` I guess).
> 
> I tried to suspend a guest (runnning `systemd suspend`), but xl never
> reported `ss`, because there's nothing to do I guess. So this state is
> probably really about migration.

I'm not sure if you have seen my other patch "Add suspend-to-ram to xl" 
(posted 29 february, no answers yet).
It allows for a domain to be suspended from dom0, without systemd, using 
libxl. Libvirt can do this, and Qubes is using it to suspend domUs 
before suspending dom0.
It works, and better than pause/unpause for the domU, but there's a bug 
later, the domains don't get "destroy"ed after a correct shutdown, need 
to 'xl destroy' manually. I talked a bit about that on XenDevel, but 
didn't get a correct answer, so the patch is stalled ...

Anyways, "ss" would be seen in both cases, if I correctly read the code 
Roger showed me (I cannot use live migration) there is only one 
"suspend" reason.

Meanwhile, will provide v3 !

> 
> 
> Thanks,
> 

-- 
++
zithro / Cyril


