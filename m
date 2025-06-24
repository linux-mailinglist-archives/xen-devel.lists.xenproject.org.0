Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9880AE6B19
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 17:32:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023887.1399961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5dN-0005Wh-C1; Tue, 24 Jun 2025 15:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023887.1399961; Tue, 24 Jun 2025 15:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5dN-0005Uu-8v; Tue, 24 Jun 2025 15:32:29 +0000
Received: by outflank-mailman (input) for mailman id 1023887;
 Tue, 24 Jun 2025 15:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ctQ0=ZH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uU5dL-0005Uo-Ow
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 15:32:27 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e1b896f-5110-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 17:32:25 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-60700a745e5so10869261a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 08:32:25 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c2f196c01sm1188587a12.8.2025.06.24.08.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 08:32:24 -0700 (PDT)
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
X-Inumbo-ID: 6e1b896f-5110-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750779145; x=1751383945; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpdaQy4McXynnxNOtXAw9z3+Dz9Lljao8HeM5Ru8ouA=;
        b=kutGpZzeXfHzOa/H990smssoIuhPJ0/R7nNCdoNN7gtD97j6Hn3zgROTCE1+lsMUVM
         P+bW/XROjgfiUf1fT5OV+lpD/DWOScsPviIlY03YDm2YLolspDNy9glKWInUV2spMu53
         2LuWQ1wVxHsRzu49yYxOak3S7imk0Ig6kogEoFEbOwfKO8HOFyGybmslQ2B0LM2AyK1L
         UAFxmdKlBuSuG/SPEnHa7uVTTexbbjcqHSW68LJdx1pOsPEXZORnP3wSknLMVhTUh6up
         92O/glcV3jOF2BY/uFMjvWZBxoEGk27K/CBv72LFWpki9UJlQ/P2W9A9WTDFzNI+hIBm
         gHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750779145; x=1751383945;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpdaQy4McXynnxNOtXAw9z3+Dz9Lljao8HeM5Ru8ouA=;
        b=JpCMq2AkHskXctPOVeTnd+mGVheBSo2cqwJgbYaple346fp0mysO9BlE/ITWWBHNoe
         b+CLPIEtYoenBEPWe/nN0SApnniV1Eo+wsQkkYJTUQ0JHd+CZ7itGTnz/Gb3j12GyhUW
         g+lggqEuHOeRMAdBrBYWcPpkAhJTn3yhnzZgpHeWdI4sdTcJcj0e7sgHJwApC0Br+4C5
         Ezpi7pq0Eh3hbgK12pAT2+tT09IfJDhLfu1pmjaNA4YTRI1hSDobSD5pu10UUyaxP4VE
         cfXCeCSt45a0Vx0JmUFKjPxdhKvFvZ+tDUwFxRHfIBeZejc+nuZHsaNP7Jd1lB2369TM
         SByg==
X-Forwarded-Encrypted: i=1; AJvYcCX+mc2RXWj8oU4prFFLvhmPF3Pxm/V4jJZtGSA+6n1oB3m9CR3z5ClLryxH5GImadigXCA4yRENwsA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiN7C1YEKOndRfIta+tUMWC7CvzBdWnLzp1D/n4I2obtIH92ak
	AGiAqrmPx724tFnVi8NIuM4EjoHQuJF6CE/X+Dy8T+/plpThEXXMXmWf
X-Gm-Gg: ASbGnct+OFBbfOplSgVZUOVao7lQ7zXYBnNm0beVSlLGj9U2q2FvSAc5jBu+yKLGRvE
	J+DQKWFp0IkixuNxQwpvujqs/YqI1CWoDL5MdBfqWC46wEePSvTL3bg9lcLZyscfqFZ0ihFo6Ge
	yQDgI79gFcWGVxs4NonUA8e+f+uYpzwj3+KkkNPcf/wDSW9u7Lq0lls9Ln5rQEPqFMm/uhw3wFN
	XjojshMwx4iJo2VfzwOhmbHAOAwkVPB2DyTGk5EiDlvS0tPhudyH9USybd/o3//IsCgSwIqNkXp
	/XeJHrj9mru3u2/GrAdgRm7rtHIY4E2zHvgTTJg7/edzRfWnJz7899VueaQkpRz2PPyPuKlaJYX
	YJ2M2RNlH9veSz5kTWhHNNG2Xf+PQNAOs9j4=
X-Google-Smtp-Source: AGHT+IElrT7EFJLCFM3kKWyD7xtoobTWY+tQrt1T92EoXQ+clgX7sdGIMSePrJCyCDLacdJyyBNspw==
X-Received: by 2002:a05:6402:d0d:b0:607:f257:ad1e with SMTP id 4fb4d7f45d1cf-60a1d16775amr15725564a12.22.1750779144958;
        Tue, 24 Jun 2025 08:32:24 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------VER609lEyLacFcpjKMatvkaI"
Message-ID: <a271e3f8-5cc4-4863-93e7-7d7b16834ea2@gmail.com>
Date: Tue, 24 Jun 2025 17:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] xen/riscv: introduce guest domain's VMID
 allocation and manegement
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <abbf1c30c485d4baae25d4c1fb26942f60015403.1749555949.git.oleksii.kurochko@gmail.com>
 <d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com>
 <145f71c2-643e-4839-a2ae-0bc1f049db74@gmail.com>
 <80223fe3-7403-4026-9505-8826c318fabb@suse.com>
 <a692d449-4101-498e-a460-33e4b2fb7176@gmail.com>
 <f5c14ffa-6314-4534-a83e-4024b379755c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f5c14ffa-6314-4534-a83e-4024b379755c@suse.com>

This is a multi-part message in MIME format.
--------------VER609lEyLacFcpjKMatvkaI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/25 4:01 PM, Jan Beulich wrote:
>>>>>> +        sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid);
>>>>> You're creating d; it cannot possibly have run on any CPU yet. IOW
>>>>> d->dirty_cpumask will be reliably empty here. I think it would be hard to
>>>>> avoid issuing the flush to all CPUs here in this scheme.
>>>> I didn't double check, but I was sure that in case d->dirty_cpumask is empty then
>>>> rfence for all CPUs will be send. But I was wrong about that.
>>>>
>>>> What about just update a code of sbi_rfence_v02()?
>>> I don't know, but dealing with the issue there feels wrong. However,
>>> before deciding where to do something, it needs to be clear what you
>>> actually want to achieve. To me at least, that's not clear at all.
>> I want to achieve the following behavior: if a mask is empty
>> (specifically, in our case|d->dirty_cpumask|), then perform the flush
>> on all CPUs.
> That's still too far into the "how". The "why" here is still unclear: Why
> do you need any flushing here at all? (With the scheme you now mean to
> implement I expect it'll become yet more clear that no flush is needed
> during domain construction.)

For the same reason x86 has flush:
     /* If there are no free ASIDs, need to go to a new generation */
     if ( unlikely(data->next_asid > data->max_asid) )
     {
         hvm_asid_flush_core();

But hvm_asid_flush_core() isn't doing a "real" flush what I missed to check
on the first look at hvm_asid_handle_vmenter().

So I assume then a "real" flush will be called somewhere before entry to guest
context.

I think now it is more or less clear.

Anyway, what then do for the cases if it is needed to have ASID which isn't
expected to be changed?
With this cycling approach after a new generation will be needed, all ASIDs
could/will be changed. It isn't a case for RISC-V (at least, at the moment)
but AFAIK it is an issue for AMD SEV.

~ Oleksii

--------------VER609lEyLacFcpjKMatvkaI
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
    <div class="moz-cite-prefix">On 6/24/25 4:01 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f5c14ffa-6314-4534-a83e-4024b379755c@suse.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+        sbi_remote_hfence_gvma_vmid(d-&gt;dirty_cpumask, 0, 0, p2m-&gt;vmid);
</pre></blockquote><pre wrap="" class="moz-quote-pre">You're creating d; it cannot possibly have run on any CPU yet. IOW
d-&gt;dirty_cpumask will be reliably empty here. I think it would be hard to
avoid issuing the flush to all CPUs here in this scheme.
</pre></blockquote><pre wrap="" class="moz-quote-pre">I didn't double check, but I was sure that in case d-&gt;dirty_cpumask is empty then
rfence for all CPUs will be send. But I was wrong about that.

What about just update a code of sbi_rfence_v02()?
</pre></blockquote><pre wrap="" class="moz-quote-pre">I don't know, but dealing with the issue there feels wrong. However,
before deciding where to do something, it needs to be clear what you
actually want to achieve. To me at least, that's not clear at all.
</pre></blockquote><pre wrap="" class="moz-quote-pre">I want to achieve the following behavior: if a mask is empty
(specifically, in our case|d-&gt;dirty_cpumask|), then perform the flush
on all CPUs.
</pre></blockquote><pre wrap="" class="moz-quote-pre">That's still too far into the "how". The "why" here is still unclear: Why
do you need any flushing here at all? (With the scheme you now mean to
implement I expect it'll become yet more clear that no flush is needed
during domain construction.)</pre></pre>
    </blockquote>
    <pre>For the same reason x86 has flush:
    /* If there are no free ASIDs, need to go to a new generation */
    if ( unlikely(data-&gt;next_asid &gt; data-&gt;max_asid) )
    {
        hvm_asid_flush_core();

But hvm_asid_flush_core() isn't doing a "real" flush what I missed to check
on the first look at hvm_asid_handle_vmenter().

So I assume then a "real" flush will be called somewhere before entry to guest
context.

I think now it is more or less clear.

Anyway, what then do for the cases if it is needed to have ASID which isn't
expected to be changed?
With this cycling approach after a new generation will be needed, all ASIDs
could/will be changed. It isn't a case for RISC-V (at least, at the moment)
but AFAIK it is an issue for AMD SEV.

~ Oleksii

</pre>
  </body>
</html>

--------------VER609lEyLacFcpjKMatvkaI--

