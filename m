Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C46A10927
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 15:23:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871423.1282424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXhpF-0004hc-O0; Tue, 14 Jan 2025 14:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871423.1282424; Tue, 14 Jan 2025 14:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXhpF-0004eS-KI; Tue, 14 Jan 2025 14:23:25 +0000
Received: by outflank-mailman (input) for mailman id 871423;
 Tue, 14 Jan 2025 14:23:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcbX=UG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tXhpE-0004eM-Bb
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 14:23:24 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c580b17-d283-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 15:23:23 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-303548a933aso44692421fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 06:23:23 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0ad5d8sm18325431fa.2.2025.01.14.06.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 06:23:21 -0800 (PST)
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
X-Inumbo-ID: 1c580b17-d283-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736864602; x=1737469402; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dNK0OcUzAFy9rXQSAnafLIpwhZuD4UFqVC5bwji4ws=;
        b=OMDQxN7n2ATe7Do30Wm132fZDaqVGkXR0qBauxsMS8Bco8b2Iorv3KA5mHFqA8B7oK
         JZxH5rX/HAqRezG8esCfKu4GvMt6M//b4CVqZvVnps1/WEQ2BYqQv8QzAXmsE0RIBBE8
         0Yvu80CskTQyOARl7MjI0tnrnLGE50mZyIMGQ/gZCuwTzVS1hVaRQ2fk6nuAIg/kJbd+
         GFjERdTKKhhuxfHo1nKaFrY1CIY9eHaov/8ibLQWouRw6uFHrmzQUychpVig0TiBSc5R
         ePG7cmCApKSUoj4HznpDo6d72tIq9PHKud9EiZ8+nyiK3NpisSQav8TFKNRrYDTmFMnO
         wokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864602; x=1737469402;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4dNK0OcUzAFy9rXQSAnafLIpwhZuD4UFqVC5bwji4ws=;
        b=oNZqI5JtNqobIDL3gduoHWPU0RS/EE2RrdtIDZh/+HjcztdmSIXSevq8OXMdmc1RR0
         FCg66glFlby+YwmapGEdDK4tppZnsR3yPY9cdfEfzMBVzU5XUCrpjXRC7ACS2pCrhWs9
         E1QDOuOoQ2so4IvUefDArb+on+boe0rtx+529L+ntLgpC7XW7fU1QeO8m8sGbruKcJTK
         hJ4eRA2w83F63JO82G20E4v+A1tGW0+G7nHYKlNA8N4HAvPJ17wkrFo+u6AJygN1qyx0
         MnbtsSb1kjuqJN5cWB9bVzpFKQtP1e0PJPokrBWEQ6RNVfU0N5S0ukSnl68WIO3FC9Qd
         IdIA==
X-Forwarded-Encrypted: i=1; AJvYcCU1oWdn3sfBXDjGJlPSXtXsKRVix7Ei8SLtS1psqRtwucAsfajn61McRqzQg7Atsud8fvPNnbfP2bI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+/0jhXlLRPyBEAr/ZdLP1yjE4MWsTqVQrkDPpiuozvdZxz97M
	cQpNwg1jZzrwPT+4wwteu1fkuZHLFCRnZltuJJJAJiMTczI6SYsu
X-Gm-Gg: ASbGncsWohequwOfSUmruO4m7eW1+/DbcqQkxHgs0UgmbTC0kX4muUGIxnDKcJFKnXd
	+kzgCH9e0WfN7oCqKkW5YL+E3DMH3hS/gRQcqO50QLc12Oi9hxcxfb2wJk++o/mY4CBQqA68pFD
	/bSQ0jEAkM6G5ua7K8i0lPP3zoR20cCwzxG1GbOMfSc/9xZaPyMAGOTnZiZdQJyfQpl1KKeMFb0
	MYYf6InobNBgApBcAA0QBXHse49ZpOKKVrR9caHZObrYyyB2xrTTeBBhJ/3aI7AvbpLEA==
X-Google-Smtp-Source: AGHT+IGHUEcwKfmAH8Tf32ObzrDAk5bSFKRMcMJYLzyQ1JzwADJYmGBej5QCBE/5EufemQw/jiKmTA==
X-Received: by 2002:a05:651c:b1f:b0:306:f7:c40a with SMTP id 38308e7fff4ca-30600f7c566mr75067681fa.18.1736864602073;
        Tue, 14 Jan 2025 06:23:22 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------mjAnriMAA48UjE7ei24TCGnc"
Message-ID: <481e1955-783a-48d0-8604-ec8554f50fc5@gmail.com>
Date: Tue, 14 Jan 2025 15:23:21 +0100
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
 <78e09ccb-65b7-4022-b9fc-7874e34c1a99@gmail.com>
 <9288f0de-945f-4056-9934-16b2b1704fb1@gmail.com>
 <Z4ZU_uvCe5lu0aMv@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <Z4ZU_uvCe5lu0aMv@macbook.local>

This is a multi-part message in MIME format.
--------------mjAnriMAA48UjE7ei24TCGnc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/14/25 1:13 PM, Roger Pau Monné wrote:
> On Tue, Jan 14, 2025 at 12:44:39PM +0100, Oleksii Kurochko wrote:
>> On 1/14/25 12:40 PM, Oleksii Kurochko wrote:
>>>
>>> On 1/14/25 12:27 PM, Roger Pau Monné wrote:
>>>> On Tue, Jan 14, 2025 at 12:12:03PM +0100, Oleksii Kurochko wrote:
>>>>> On 1/13/25 6:52 PM, Roger Pau Monné wrote:
>>>>>> On Mon, Jan 13, 2025 at 05:07:55PM +0100, Marek Marczykowski-Górecki wrote:
>>>>>>> On Fri, Sep 13, 2024 at 09:59:06AM +0200, Roger Pau Monne wrote:
>>>>>>>> Allow setting the used wallclock from the command line.  When the option is set
>>>>>>>> to a value different than `auto` the probing is bypassed and the selected
>>>>>>>> implementation is used (as long as it's available).
>>>>>>>>
>>>>>>>> The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
>>>>>>>> supported built-in) or from UEFI firmware respectively.
>>>>>>>>
>>>>>>>> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
>>>>>>> Reviewed-by: Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>
>>>>>> Thanks for the review.
>>>>>>
>>>>>> Oleksii, can I get your opinion as Release Manager about whether this
>>>>>> (and the following patch) would be suitable for committing to staging
>>>>>> given the current release state?
>>>>>>
>>>>>> It's a workaround for broken EFI implementations that many downstreams
>>>>>> carry on their patch queue.
>>>>> Based on your commit message, I understand this as addressing a bug ( but not very critical
>>>>> as IIUC downstreams have the similar patch on their side ). Therefore, if it has been properly
>>>>> reviewed and tested, we should consider including it in the current release.
>>>> IIRC at least Qubes, XenServer and XCP-ng have a patch that achieves
>>>> the same behavior as proposed here.
>>>>
>>>>> IIUC, setting the wallclock to EFI should align with the behavior Xen had previously.
>>>>> It might be preferable to use that argument as the default for a while, allowing others to verify the "auto"
>>>>> value over time. After that, we could consider making "auto" the default.
>>>>> That said, I am not particularly strict about following this approach.
>>>> We cannot really set efi as the default, as it would break when
>>>> booting on legacy BIOS systems.
>>>>
>>>> We could take only patch 1 and leave patch 2 after Xen 4.20 has
>>>> branched, but at that point I would see little benefit in having just
>>>> patch 1.
>>> I don't see a lot of benefit of comitting only the one patch either.
>>>
>>>
>>>> I don't have a strong opinion, but downstreams have been complaining
>>>> about Xen behavior regarding the usage of EFI_GET_TIME, so it might be
>>>> good to not ship yet another release with such allegedly broken
>>>> behavior.
>>> Agree with that. As  I mentioned above I consider it as a bug and based on
>>> that several mentioned above downstreams have the similar patch I could consider
>>> that as tested approach so ..
>>>> Let me know what you think, as I would need a formal Release-Ack if
>>>> this is to be committed.
>>> ... R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>.
>> Sorry for the noise.
>>
>> I missed to add that it would also be nice to mention IMO ( that now we have wallclock parameter )
>> in CHANGELOG so downstreams will receive "notification" that Xen provides a workaround for the mentioned
>> issue in the patch series.
> Indeed.  Would you be OK with adding the following chunk to patch 2?
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 8507e6556a56..1de1d1eca17f 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      leaving this to the guest kernel to do in guest context.
>    - On x86:
>      - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
> +   - Prefer CMOS over EFI_GET_TIME as time source.
>      - Switched the xAPIC flat driver to use physical destination mode for external
>        interrupts instead of logical destination mode.
>   
> @@ -24,6 +25,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - Support for LLC (Last Level Cache) coloring.
>    - On x86:
>      - xl suspend/resume subcommands.
> +   - `wallclock` command line option to select time source.

What about of adding word 'Add' before `wallclock`?

Other LGTM: Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>   
>   ### Removed
>    - On x86:
--------------mjAnriMAA48UjE7ei24TCGnc
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
    <div class="moz-cite-prefix">On 1/14/25 1:13 PM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Z4ZU_uvCe5lu0aMv@macbook.local">
      <pre wrap="" class="moz-quote-pre">On Tue, Jan 14, 2025 at 12:44:39PM +0100, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 1/14/25 12:40 PM, Oleksii Kurochko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">

On 1/14/25 12:27 PM, Roger Pau Monné wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On Tue, Jan 14, 2025 at 12:12:03PM +0100, Oleksii Kurochko wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 1/13/25 6:52 PM, Roger Pau Monné wrote:
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
              <pre wrap="" class="moz-quote-pre">Based on your commit message, I understand this as addressing a bug ( but not very critical
as IIUC downstreams have the similar patch on their side ). Therefore, if it has been properly
reviewed and tested, we should consider including it in the current release.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">IIRC at least Qubes, XenServer and XCP-ng have a patch that achieves
the same behavior as proposed here.

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">IIUC, setting the wallclock to EFI should align with the behavior Xen had previously.
It might be preferable to use that argument as the default for a while, allowing others to verify the "auto"
value over time. After that, we could consider making "auto" the default.
That said, I am not particularly strict about following this approach.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">We cannot really set efi as the default, as it would break when
booting on legacy BIOS systems.

We could take only patch 1 and leave patch 2 after Xen 4.20 has
branched, but at that point I would see little benefit in having just
patch 1.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I don't see a lot of benefit of comitting only the one patch either.


</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">I don't have a strong opinion, but downstreams have been complaining
about Xen behavior regarding the usage of EFI_GET_TIME, so it might be
good to not ship yet another release with such allegedly broken
behavior.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Agree with that. As  I mentioned above I consider it as a bug and based on
that several mentioned above downstreams have the similar patch I could consider
that as tested approach so ..
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Let me know what you think, as I would need a formal Release-Ack if
this is to be committed.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... R-Acked-by: Oleksii Kurochko<a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Sorry for the noise.

I missed to add that it would also be nice to mention IMO ( that now we have wallclock parameter )
in CHANGELOG so downstreams will receive "notification" that Xen provides a workaround for the mentioned
issue in the patch series.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Indeed.  Would you be OK with adding the following chunk to patch 2?

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8507e6556a56..1de1d1eca17f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
    leaving this to the guest kernel to do in guest context.
  - On x86:
    - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
+   - Prefer CMOS over EFI_GET_TIME as time source.
    - Switched the xAPIC flat driver to use physical destination mode for external
      interrupts instead of logical destination mode.
 
@@ -24,6 +25,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
    - Support for LLC (Last Level Cache) coloring.
  - On x86:
    - xl suspend/resume subcommands.
+   - `wallclock` command line option to select time source.</pre>
    </blockquote>
    <pre>What about of adding word 'Add' before `wallclock`?

Other LGTM: Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite" cite="mid:Z4ZU_uvCe5lu0aMv@macbook.local">
      <pre wrap="" class="moz-quote-pre">
 
 ### Removed
  - On x86:
</pre>
    </blockquote>
  </body>
</html>

--------------mjAnriMAA48UjE7ei24TCGnc--

