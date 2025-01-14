Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624AAA105AF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 12:40:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871246.1282282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXfHq-0007CG-1Q; Tue, 14 Jan 2025 11:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871246.1282282; Tue, 14 Jan 2025 11:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXfHp-0007AV-V7; Tue, 14 Jan 2025 11:40:45 +0000
Received: by outflank-mailman (input) for mailman id 871246;
 Tue, 14 Jan 2025 11:40:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcbX=UG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tXfHp-0007AJ-71
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 11:40:45 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63136440-d26c-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 12:40:43 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so5341504e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 03:40:43 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec3fadsm1660801e87.188.2025.01.14.03.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 03:40:42 -0800 (PST)
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
X-Inumbo-ID: 63136440-d26c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736854843; x=1737459643; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCvMpFPg8q0V/9z6iP7kPF9IeHLFD7m7wQT91KigUqE=;
        b=kJ3xbmCjPabQp9TLYVRi6tZpVDBayQpfjyrZU5RYo/xRmxtmCB+1fg/em98eZ00jGj
         WuVwUGcmiekm/IzDudjxJhkQ+4/5paHtaQB914hqZe1xN9KaXoraRO2eKiQN3q855ADx
         p/unM0eBMHg375RIwM4pbRC570eedM9abhImln0KfxM6rDzQgOnJuWYVyjoWG8ETSrHu
         4wCPmh8vMKC0pDiHwYM8nMb7DKLwRRc7O6zJj7GJgL3pxjZt7PNZAdi0cNxyZGuLK1T8
         ToDhTMibIi7RddgtvyU9YzS/r2m+p7buzDmqqSWzrgTN113qsUMteJCQ08V+1mAqHHXz
         yPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736854843; x=1737459643;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tCvMpFPg8q0V/9z6iP7kPF9IeHLFD7m7wQT91KigUqE=;
        b=HQfQvUAOCvyZa+tCcP0Q/5EI+Zm+rfloEMGU9/ZTy1nDATw+lmFS2/YOlicKkHV6D3
         /I7AVkim27DYabaS7HLJUpABS+BtZUCnWI6qF8n++Anz+4SAzUl8b8kwZIdzLSspcrmP
         V7JazzILaDqlcUPjUTM2eWAMGA3HMikqv0zB6s+hRptdtvPKooeeNmYUmRnGF0Cs/S0+
         8NMAkDnXjWSdts4OvE1aEQRpVL7T4xOQFZKn96mgxPDcgHmRByg/OrRQTEkE9g4A4cGL
         UlFOCku9zcjYJoJajkk8Q994gwDliFeqp7cgQ6bb/F3au7V50JHdNA1QfXjOJtyc22WG
         VGNA==
X-Forwarded-Encrypted: i=1; AJvYcCXUl0seMpeuKDQy5B45lSPyVpNi9p+fFKqG0gYApkoYXi/mhkY5sqt7HmJrMdOYDJt7XORbwqR0yfY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxk/KFzr9UDPTfdDutgPRRxRA1JaLWzcId2LEeE9MbJbSwEN8DN
	qWQ+VOzPVgdct+kGTCJc/0TaQKCsD4KN8ecBtXajNXKZ66CAgXJw
X-Gm-Gg: ASbGnctZw5Z3LYc6Bl5616cAaG0g8BgWn/KJ71GG/n7NECPCxuLgJkwFwXHRWgs0IFe
	b0Vidw52s011znEDsiELhsMY402ghKpRagM6UfHgSVu67RyG17lvJb0i3elqXl7PPRwaQG4ynL5
	7Wmc1xN6vVBQPUkkI+btIPwSDmj80ARPLTb2mcQMNIEV5fs8XPqwLyE5ScxH661a2C4nR3xaXIv
	ACYnyBtRvXVlkyPmAqOF4T2A9+/tmSvIp8HjVfBF4u12y108PfgtvvzHfbBoHAQ/c50Eg==
X-Google-Smtp-Source: AGHT+IFhsTBFi9wbj6mU5gdFIFU7RphJ0sneOC8Q6CJx14xr9PcFHXwlJByz3gCR54XhHwyA1d5Z+g==
X-Received: by 2002:a05:6512:3c8c:b0:541:4900:7c42 with SMTP id 2adb3069b0e04-542845b1fffmr8736784e87.43.1736854842462;
        Tue, 14 Jan 2025 03:40:42 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------QZCsQ8CZ0plNpxFsSUBJl0N5"
Message-ID: <78e09ccb-65b7-4022-b9fc-7874e34c1a99@gmail.com>
Date: Tue, 14 Jan 2025 12:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com> <Z4U6WxtmaqGkqOqe@mail-itl>
 <Z4VS88REbzn5uasy@macbook.local>
 <49a2404f-0c45-4397-9094-a4189131832f@gmail.com>
 <Z4ZKINmJXw5T2dsM@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <Z4ZKINmJXw5T2dsM@macbook.local>

This is a multi-part message in MIME format.
--------------QZCsQ8CZ0plNpxFsSUBJl0N5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/14/25 12:27 PM, Roger Pau Monné wrote:
> On Tue, Jan 14, 2025 at 12:12:03PM +0100, Oleksii Kurochko wrote:
>> On 1/13/25 6:52 PM, Roger Pau Monné wrote:
>>> On Mon, Jan 13, 2025 at 05:07:55PM +0100, Marek Marczykowski-Górecki wrote:
>>>> On Fri, Sep 13, 2024 at 09:59:06AM +0200, Roger Pau Monne wrote:
>>>>> Allow setting the used wallclock from the command line.  When the option is set
>>>>> to a value different than `auto` the probing is bypassed and the selected
>>>>> implementation is used (as long as it's available).
>>>>>
>>>>> The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
>>>>> supported built-in) or from UEFI firmware respectively.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
>>>> Reviewed-by: Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>
>>> Thanks for the review.
>>>
>>> Oleksii, can I get your opinion as Release Manager about whether this
>>> (and the following patch) would be suitable for committing to staging
>>> given the current release state?
>>>
>>> It's a workaround for broken EFI implementations that many downstreams
>>> carry on their patch queue.
>> Based on your commit message, I understand this as addressing a bug ( but not very critical
>> as IIUC downstreams have the similar patch on their side ). Therefore, if it has been properly
>> reviewed and tested, we should consider including it in the current release.
> IIRC at least Qubes, XenServer and XCP-ng have a patch that achieves
> the same behavior as proposed here.
>
>> IIUC, setting the wallclock to EFI should align with the behavior Xen had previously.
>> It might be preferable to use that argument as the default for a while, allowing others to verify the "auto"
>> value over time. After that, we could consider making "auto" the default.
>> That said, I am not particularly strict about following this approach.
> We cannot really set efi as the default, as it would break when
> booting on legacy BIOS systems.
>
> We could take only patch 1 and leave patch 2 after Xen 4.20 has
> branched, but at that point I would see little benefit in having just
> patch 1.

I don't see a lot of benefit of comitting only the one patch either.


>
> I don't have a strong opinion, but downstreams have been complaining
> about Xen behavior regarding the usage of EFI_GET_TIME, so it might be
> good to not ship yet another release with such allegedly broken
> behavior.

Agree with that. As  I mentioned above I consider it as a bug and based on
that several mentioned above downstreams have the similar patch I could consider
that as tested approach so ..

>
> Let me know what you think, as I would need a formal Release-Ack if
> this is to be committed.

... R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>.

Thanks.

~ Oleksii

>
> Thanks, Roger.
>
>> ~ Oleksii
>>
>>
>>> Thanks, Roger.
--------------QZCsQ8CZ0plNpxFsSUBJl0N5
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
    <div class="moz-cite-prefix">On 1/14/25 12:27 PM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Z4ZKINmJXw5T2dsM@macbook.local">
      <pre wrap="" class="moz-quote-pre">On Tue, Jan 14, 2025 at 12:12:03PM +0100, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 1/13/25 6:52 PM, Roger Pau Monné wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Mon, Jan 13, 2025 at 05:07:55PM +0100, Marek Marczykowski-Górecki wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On Fri, Sep 13, 2024 at 09:59:06AM +0200, Roger Pau Monne wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Allow setting the used wallclock from the command line.  When the option is set
to a value different than `auto` the probing is bypassed and the selected
implementation is used (as long as it's available).

The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
supported built-in) or from UEFI firmware respectively.

Signed-off-by: Roger Pau Monné<a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Reviewed-by: Marek Marczykowski-Górecki<a class="moz-txt-link-rfc2396E" href="mailto:marmarek@invisiblethingslab.com">&lt;marmarek@invisiblethingslab.com&gt;</a>
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Thanks for the review.

Oleksii, can I get your opinion as Release Manager about whether this
(and the following patch) would be suitable for committing to staging
given the current release state?

It's a workaround for broken EFI implementations that many downstreams
carry on their patch queue.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Based on your commit message, I understand this as addressing a bug ( but not very critical
as IIUC downstreams have the similar patch on their side ). Therefore, if it has been properly
reviewed and tested, we should consider including it in the current release.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
IIRC at least Qubes, XenServer and XCP-ng have a patch that achieves
the same behavior as proposed here.

</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:Z4ZKINmJXw5T2dsM@macbook.local">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">IIUC, setting the wallclock to EFI should align with the behavior Xen had previously.
It might be preferable to use that argument as the default for a while, allowing others to verify the "auto"
value over time. After that, we could consider making "auto" the default.
That said, I am not particularly strict about following this approach.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
We cannot really set efi as the default, as it would break when
booting on legacy BIOS systems.

We could take only patch 1 and leave patch 2 after Xen 4.20 has
branched, but at that point I would see little benefit in having just
patch 1.</pre>
    </blockquote>
    <pre>I don't see a lot of benefit of comitting only the one patch either.</pre>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:Z4ZKINmJXw5T2dsM@macbook.local">
      <pre wrap="" class="moz-quote-pre">

I don't have a strong opinion, but downstreams have been complaining
about Xen behavior regarding the usage of EFI_GET_TIME, so it might be
good to not ship yet another release with such allegedly broken
behavior.</pre>
    </blockquote>
    <pre>Agree with that. As  I mentioned above I consider it as a bug and based on
that several mentioned above downstreams have the similar patch I could consider
that as tested approach so ..
</pre>
    <blockquote type="cite" cite="mid:Z4ZKINmJXw5T2dsM@macbook.local">
      <pre wrap="" class="moz-quote-pre">

Let me know what you think, as I would need a formal Release-Ack if
this is to be committed.</pre>
    </blockquote>
    <pre>... R-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>.

</pre>
    <pre>Thanks.
<pre>
</pre></pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite" cite="mid:Z4ZKINmJXw5T2dsM@macbook.local">
      <pre wrap="" class="moz-quote-pre">

Thanks, Roger.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">~ Oleksii


</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
Thanks, Roger.
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------QZCsQ8CZ0plNpxFsSUBJl0N5--

