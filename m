Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D9AA32859
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 15:26:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886473.1296107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiDgS-0008CH-12; Wed, 12 Feb 2025 14:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886473.1296107; Wed, 12 Feb 2025 14:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiDgR-0008A3-UC; Wed, 12 Feb 2025 14:25:47 +0000
Received: by outflank-mailman (input) for mailman id 886473;
 Wed, 12 Feb 2025 14:25:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeD=VD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tiDgQ-00089x-JR
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 14:25:46 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3eb50a0c-e94d-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 15:25:44 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-545039b6a67so4231440e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 06:25:44 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54504b0c280sm1411686e87.137.2025.02.12.06.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 06:25:43 -0800 (PST)
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
X-Inumbo-ID: 3eb50a0c-e94d-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739370344; x=1739975144; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcTHL77+repIi4UKSMu9IWPGTJ7f083fYMJ7Nto208Y=;
        b=Qschaw0jAfoRGBez6rR/e5NiijXn5LU+cN8wnFYJAim5OW0QYR7Pn+4UB8jZHi3vaQ
         PZhbDL+fUCYGMSH/FiEDWtatNxH7M9NCv9GHYzrNZcXxGAxoWiL4t76O3whVdiq/ZUNF
         /wbgLw5344I4nauA2hRxVqSPcaX3mWNvRNsfiqIH+HgrhWJbSZSl8sDqfEO7vZzQ9N7l
         KbSSyHdD9vFaXYDRyUZSyL3nKzQeGS4siqI03uUFKznKKVkAyY1VJyaWL2W+wkwB9Rf/
         MulSdbbMzep1PvTwvR6mHjMfO4PMF1gDndejjgrc1lsY6bnkk/DrQ3s+Bvqna2wtdpxm
         n+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739370344; x=1739975144;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JcTHL77+repIi4UKSMu9IWPGTJ7f083fYMJ7Nto208Y=;
        b=liacMSmW7jUYg09edM6eOjEOrf4B3mccWBDUYazGdGiaVWkEyWGeI46I+n2/7FRCZ9
         0pHKT2NDl1S9MZbbam7mc5vVrjlcaNSrqqYkrEMwPGOu8N20npE60Vx/DhXxpOUAHtW6
         /r9vPjf0E89HnAh2l3zcuJ691fFxottFwRZGTtJoOvEmv7b42ew+aI0/VMQiZRINITwX
         78+IHfzwdb4WZ1kioccUj3Ykpr/MUbRPN2TPb+5K4Qb/SaYed/PsVm9JhUB5bGMxTf6C
         Va+IAz0wmr4EUifqPO4Clj6urks5i/WVrpJlByxzdSU2X+zgs2vy7pHo2aASARUeawVZ
         BQPg==
X-Gm-Message-State: AOJu0Yxi3V8DvZhVwxHsU4mdr/WEeYXCO5/6LZN70AEKLG4RmiDsJ1sE
	u9oTvxHqEF75ifVoIv0r/toaDXzIZWeNm6QDLzxvyuDlcYDAhLxMZTbqFA==
X-Gm-Gg: ASbGncvI/BpSRxIAuOJrVLAz6cYE7lgewZEwy+29u+KAKmCu0YTIwygcgwjKYvxAf6+
	3w2M0hchst+dDygIIym8eMBZ24e93jz8KFGsaR+oLl/rk4/fzf9Wh3yVzT+JA3bE0rx43cLLc9w
	flHgQmc2nTif2zR3eUQwWocVFwI40Ts/EsYJwmWL2zFtQrqnC+ZPSx0OPT5rxEsl0r4DcqSdQ2d
	Fo328pyJ4EcBEsbWiVDJSVH5GhFwufpQmhn+4ua51gJpYe7CqMB2wxdgT7bsrGFD9qXAxZs/FOF
	oNlc/VTn+U16cjjmZJekkQAVbww=
X-Google-Smtp-Source: AGHT+IEXao6YK8OfDQTgRzRleWK2eZsjnMQltJzTUKv1n028LaAlsxyuRg4a4BriQubo2tovNG2nxQ==
X-Received: by 2002:a05:6512:1288:b0:545:f9c:a825 with SMTP id 2adb3069b0e04-545180e9111mr911581e87.2.1739370343604;
        Wed, 12 Feb 2025 06:25:43 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------vjubAoRcbhX0UsEiNAZuek2b"
Message-ID: <3aec69ed-c78d-46ed-a60f-88f260c71ce9@gmail.com>
Date: Wed, 12 Feb 2025 15:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v3 0/5] xen/x86: prevent local APIC errors at
 shutdown
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250211110209.86974-1-roger.pau@citrix.com>
 <Z6uZZrR9XvTFjtO9@macbook.local>
 <30b4c319-64fc-4a8f-bc8d-a60e10831357@gmail.com>
 <6191ed5b-ec66-4054-a6bc-173ab578aa54@suse.com>
 <Z6xo7Us0LiJqiEi1@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <Z6xo7Us0LiJqiEi1@macbook.local>

This is a multi-part message in MIME format.
--------------vjubAoRcbhX0UsEiNAZuek2b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/12/25 10:25 AM, Roger Pau Monné wrote:
> On Wed, Feb 12, 2025 at 09:51:16AM +0100, Jan Beulich wrote:
>> On 12.02.2025 09:33, Oleksii Kurochko wrote:
>>> On 2/11/25 7:39 PM, Roger Pau Monné wrote:
>>>> On Tue, Feb 11, 2025 at 12:02:04PM +0100, Roger Pau Monne wrote:
>>>>> Hello,
>>>>>
>>>>> The following series aims to prevent local APIC errors from stalling the
>>>>> shtudown process.  On XenServer testing we have seen reports of AMD
>>>>> boxes sporadically getting stuck in a spam of:
>>>>>
>>>>> APIC error on CPU0: 00(08), Receive accept error
>>>>>
>>>>> Messages during shutdown, as a result of device interrupts targeting
>>>>> CPUs that are offline (and have the local APIC disabled).
>>>>>
>>>>> First patch strictly solves the issue of shutdown getting stuck, further
>>>>> patches aim to quiesce interrupts from all devices (known by Xen) as an
>>>>> attempt to prevent a spurious "APIC error on CPU0: 00(00)" plus also
>>>>> make kexec more reliable.
>>>>>
>>>>> Thanks, Roger.
>>>>>
>>>>> Roger Pau Monne (5):
>>>>>     x86/shutdown: offline APs with interrupts disabled on all CPUs
>>>>>     x86/irq: drop fixup_irqs() parameters
>>>>>     x86/smp: perform disabling on interrupts ahead of AP shutdown
>>>>>     x86/pci: disable MSI(-X) on all devices at shutdown
>>>>>     x86/iommu: disable interrupts at shutdown
>>>> This is now fully reviewed, can I get your opinion (and
>>>> release-acked-by) on which patches we should take for 4.20?
>>> If my understanding is correct to unblock shutdown process, it is enough just
>>> to have only first patch merged, correct? So the first patch should be merged.
>>>
>>> As second patch doesn't have functional changes, IMO, it could be merged to
>>> despite of the fact we have Hard code freeze period.
>>>
>>> All other patches, I would like to ask additional opinion (as I am an expert in x86),
>>> at first glance it looks like an absence of these patches in staging branch will
>>> lead only to triggering "Receive accept error" which I believe won't block shutdown
>>> process, so these patches could be postponed until 4.21. On other side, if it is
>>> low-risk fixes then we could consider to merge them now.
> I expect the following patches might make kexec'ing from Xen a bit
> more reliable, as the kexec'ed kernel should find an environment with
> interrupts from all Xen known devices quiesced.
>
>> I'm not Roger, but as a data point: While I'm uncertain about patch 2, all
>> others in this series will very likely be backported anyway.
> I plan to backport the series to the XenServer patch queue also when it
> goes in.

If it is likely to be backported anyway, then let's merge the patch series now:
   Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~Oleksii

>
> Thanks, Roger.
--------------vjubAoRcbhX0UsEiNAZuek2b
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
    <div class="moz-cite-prefix">On 2/12/25 10:25 AM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Z6xo7Us0LiJqiEi1@macbook.local">
      <pre wrap="" class="moz-quote-pre">On Wed, Feb 12, 2025 at 09:51:16AM +0100, Jan Beulich wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 12.02.2025 09:33, Oleksii Kurochko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
On 2/11/25 7:39 PM, Roger Pau Monné wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On Tue, Feb 11, 2025 at 12:02:04PM +0100, Roger Pau Monne wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Hello,

The following series aims to prevent local APIC errors from stalling the
shtudown process.  On XenServer testing we have seen reports of AMD
boxes sporadically getting stuck in a spam of:

APIC error on CPU0: 00(08), Receive accept error

Messages during shutdown, as a result of device interrupts targeting
CPUs that are offline (and have the local APIC disabled).

First patch strictly solves the issue of shutdown getting stuck, further
patches aim to quiesce interrupts from all devices (known by Xen) as an
attempt to prevent a spurious "APIC error on CPU0: 00(00)" plus also
make kexec more reliable.

Thanks, Roger.

Roger Pau Monne (5):
   x86/shutdown: offline APs with interrupts disabled on all CPUs
   x86/irq: drop fixup_irqs() parameters
   x86/smp: perform disabling on interrupts ahead of AP shutdown
   x86/pci: disable MSI(-X) on all devices at shutdown
   x86/iommu: disable interrupts at shutdown
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">This is now fully reviewed, can I get your opinion (and
release-acked-by) on which patches we should take for 4.20?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
If my understanding is correct to unblock shutdown process, it is enough just
to have only first patch merged, correct? So the first patch should be merged.

As second patch doesn't have functional changes, IMO, it could be merged to
despite of the fact we have Hard code freeze period.

All other patches, I would like to ask additional opinion (as I am an expert in x86),
at first glance it looks like an absence of these patches in staging branch will
lead only to triggering "Receive accept error" which I believe won't block shutdown
process, so these patches could be postponed until 4.21. On other side, if it is
low-risk fixes then we could consider to merge them now.
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I expect the following patches might make kexec'ing from Xen a bit
more reliable, as the kexec'ed kernel should find an environment with
interrupts from all Xen known devices quiesced.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">I'm not Roger, but as a data point: While I'm uncertain about patch 2, all
others in this series will very likely be backported anyway.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I plan to backport the series to the XenServer patch queue also when it
goes in.</pre>
    </blockquote>
    <pre>If it is likely to be backported anyway, then let's merge the patch series now:
  Release-Acked-by: Oleksii Kurochko <a data-start="117" data-end="145"
    data-is-last-node="" rel="noopener">&lt;oleksii.kurochko@gmail.com&gt;</a>

~Oleksii
</pre>
    <blockquote type="cite" cite="mid:Z6xo7Us0LiJqiEi1@macbook.local">
      <pre wrap="" class="moz-quote-pre">

Thanks, Roger.
</pre>
    </blockquote>
  </body>
</html>

--------------vjubAoRcbhX0UsEiNAZuek2b--

