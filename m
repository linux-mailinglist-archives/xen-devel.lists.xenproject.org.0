Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D94A341E1
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 15:26:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887679.1297141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaAh-00073p-Bt; Thu, 13 Feb 2025 14:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887679.1297141; Thu, 13 Feb 2025 14:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaAh-00072N-94; Thu, 13 Feb 2025 14:26:31 +0000
Received: by outflank-mailman (input) for mailman id 887679;
 Thu, 13 Feb 2025 14:26:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=horU=VE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tiaAf-0006tN-M0
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 14:26:29 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83140dfa-ea16-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 15:26:28 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5450f2959f7so912278e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 06:26:28 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f083507sm184487e87.46.2025.02.13.06.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 06:26:26 -0800 (PST)
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
X-Inumbo-ID: 83140dfa-ea16-11ef-abfc-e33de0ed8607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739456788; x=1740061588; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZEhdrGpu+dmM1uViSr6alMMNAIZsWP3UH6pDfXAmGk=;
        b=DQp1SF2tXywrAmVNb4yr4zqF4qqA2e6JRRiD4PICdHh7HEbeY/vEeQc6b6gmL6DiEC
         Ii+vKwg7O3L1Jn0aEqPSc+0VYqsDz5ydpar7EpAk9mFiaWBH+7v9CwzNpVn64sBwZ8ea
         Ec6TS8uiyiXEnCH8IX7QKmmMs4X6nSap3OPCvDsWgM9zpkzxyoG0r0Q/W6DhZ7B3vNqe
         f/36bxy0x6u+IcGZYbaRVSPAhCGh4fTvAPzU8ET2gfQbO4Ttd7OIP9D9tyb+cCoaz6XS
         pnXlunp9u3IsWypecAJ0CTFSpJ1BhdmvIFI2Pfd4hIbIDnFq7uio+tSmCtJOgcCelKxv
         Fi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739456788; x=1740061588;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wZEhdrGpu+dmM1uViSr6alMMNAIZsWP3UH6pDfXAmGk=;
        b=MsiExxsGBDPu76pU0pVbUSUE9uE3FeN9iu5BTqc/DGAIXnscKQMidlsV02P14FmFqh
         Lps0j6eajY81UfR8y2OVadJofG2SPdFqUt1HPlAxFyRbFmjE67yUXyA8OrZNoYe9uEyt
         OFKtbtyE/l9zD9PmEl8QgGNGRr+qIjQSkgPUGySUEHbTbD2A6zV/kLU2uJGiR/1NfK8f
         hpXhybm+zJ7Ay80iCMuO7mzLERJVgs6p7YeY0P6dKIVRwEzLFCdBTYsfaEeud9/5/b2f
         7qc4EFZoutw8CisHpJV7EK0pNgJSkw1LM/hEsM/nOmlA2miJmTOS5XIazeq4PYYuLww2
         AsEg==
X-Gm-Message-State: AOJu0YyGcLlq1hMe3deXQT/pTP1zRaLfIhaF0nguabv231f5oIEiqzi2
	DIKG41qAlaCcL5bu78+GOZcQJbhZ+h7zqHivRtRKoxqBevFKgd6Z
X-Gm-Gg: ASbGncspvjhued7jRWrabyuXNtxmUHLiVzhs8G7XRAiGo4/u38fSk5oQFIlgptbsvWD
	zO3l8oe0BGX9gxGWbnQgPTSht2zs/mcuwyHt0Grhn00t3c7HyUCxAU+heWZ3sFa9DdKwDvUYq+N
	s51VdZC+fybIIkUs6XAdFWnNkDrxrjwVaCY277OqvfNuJ9c51zQU8+7cj/kR6KHpxAfOABzTfAc
	Fpy94j3eksrljA6tIYAER1cICiOJCkC2/jFR1G0Eeb4XuupODuiticmnK5JJ//dxVV79SPvEM10
	bEdFQN63gKX8PsSPMDJ2okoNt2c=
X-Google-Smtp-Source: AGHT+IFY2L/GW0B2sxZGnempepxoEAwWeV/8fRLyPMTc8kDJJ1zwNzMpPfvCozDM4kCkELKmCWgJ9Q==
X-Received: by 2002:a05:6512:159b:b0:545:4d1:64c0 with SMTP id 2adb3069b0e04-5451dd9e2admr1140283e87.27.1739456787263;
        Thu, 13 Feb 2025 06:26:27 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------djpUm2pEGkcI3gzt189hNQVh"
Message-ID: <50d8f989-2512-4414-b12c-a9cb33c675b7@gmail.com>
Date: Thu, 13 Feb 2025 15:26:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 for-4.20(?) 0/4] Add/enable stack protector
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Community Manager <community.manager@xenproject.org>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
 <5b6b1ad2-c0cd-454c-aa7c-b6de37ab39df@citrix.com> <87pljmymos.fsf@epam.com>
 <e692db7a-c457-445e-befa-96702b512b13@citrix.com>
 <402c93ec-9cb0-41e0-b1c8-eca321140ad6@gmail.com>
Content-Language: en-US
In-Reply-To: <402c93ec-9cb0-41e0-b1c8-eca321140ad6@gmail.com>

This is a multi-part message in MIME format.
--------------djpUm2pEGkcI3gzt189hNQVh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/13/25 3:21 PM, Oleksii Kurochko wrote:
>
>
> On 2/13/25 3:07 PM, Andrew Cooper wrote:
>> On 13/02/2025 1:54 pm, Volodymyr Babchuk wrote:
>>> Hi Andrew,
>>>
>>> Andrew Cooper<andrew.cooper3@citrix.com> writes:
>>>
>>>> On 14/01/2025 4:25 am, Volodymyr Babchuk wrote:
>>>>> Volodymyr Babchuk (4):
>>>>>    common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
>>>>>    xen: common: add ability to enable stack protector
>>>>>    xen: arm: enable stack protector feature
>>>>>    CHANGELOG.md: Mention stack-protector feature
>>>> Reviewed-by: Andrew Cooper<andrew.cooper3@citrix.com>
>>>>
>>>> There's one minor formatting error which can be fixed on commit.
>>>>
>>>> ~Andrew
>>> Thanks for the review. I noticed that this series is not committed. Is
>>> there anything else required from my side?
>>>
>> You need an ARM Ack on patch 3.  [EDIT], no you don't, my R-by is good
>> enough.

Andrew, why it is enough your R-by for patch 3? It seems like it is fully Arm related patch
and I expect to see Ack from Arm maintainers. Also, there is some comments from Julien.

>> And at this point at rc4, you'll need to persuade Oleksii to take it for
>> 4.20.
>>
>> Personally I think it's low risk and worthwhile to take for 4.20, and it
>> was technically completed in time - it just fell between the cracks.
> I think the same it's low risk patch series, so we can take it for 4.20:
>   Release-Acked-by: Oleksii Kurochko<olekskii.kurochko@gmail.com>
>
> Thanks.
>
> ~ Oleksii
>> ~Andrew
--------------djpUm2pEGkcI3gzt189hNQVh
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
    <div class="moz-cite-prefix">On 2/13/25 3:21 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:402c93ec-9cb0-41e0-b1c8-eca321140ad6@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2/13/25 3:07 PM, Andrew Cooper
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:e692db7a-c457-445e-befa-96702b512b13@citrix.com">
        <pre wrap="" class="moz-quote-pre">On 13/02/2025 1:54 pm, Volodymyr Babchuk wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Hi Andrew,

Andrew Cooper <a class="moz-txt-link-rfc2396E"
          href="mailto:andrew.cooper3@citrix.com" moz-do-not-send="true">&lt;andrew.cooper3@citrix.com&gt;</a> writes:

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 14/01/2025 4:25 am, Volodymyr Babchuk wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Volodymyr Babchuk (4):
  common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
  xen: common: add ability to enable stack protector
  xen: arm: enable stack protector feature
  CHANGELOG.md: Mention stack-protector feature
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Reviewed-by: Andrew Cooper <a
            class="moz-txt-link-rfc2396E"
            href="mailto:andrew.cooper3@citrix.com"
            moz-do-not-send="true">&lt;andrew.cooper3@citrix.com&gt;</a>

There's one minor formatting error which can be fixed on commit.

~Andrew
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Thanks for the review. I noticed that this series is not committed. Is
there anything else required from my side?

</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">You need an ARM Ack on patch 3.  [EDIT], no you don't, my R-by is good
enough.</pre>
      </blockquote>
    </blockquote>
    <pre>Andrew, why it is enough your R-by for patch 3? It seems like it is fully Arm related patch
and I expect to see Ack from Arm maintainers. Also, there is some comments from Julien.

</pre>
    <blockquote type="cite"
      cite="mid:402c93ec-9cb0-41e0-b1c8-eca321140ad6@gmail.com">
      <blockquote type="cite"
        cite="mid:e692db7a-c457-445e-befa-96702b512b13@citrix.com">
        <pre wrap="" class="moz-quote-pre">
And at this point at rc4, you'll need to persuade Oleksii to take it for
4.20.

Personally I think it's low risk and worthwhile to take for 4.20, and it
was technically completed in time - it just fell between the cracks.</pre>
      </blockquote>
      <pre>I think the same it's low risk patch series, so we can take it for 4.20:
 Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E"
      href="mailto:olekskii.kurochko@gmail.com" moz-do-not-send="true">&lt;olekskii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
      <blockquote type="cite"
        cite="mid:e692db7a-c457-445e-befa-96702b512b13@citrix.com">
        <pre wrap="" class="moz-quote-pre">~Andrew
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------djpUm2pEGkcI3gzt189hNQVh--

