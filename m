Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BF0C01CF8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 16:36:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149158.1480869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwPH-0002mv-Qm; Thu, 23 Oct 2025 14:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149158.1480869; Thu, 23 Oct 2025 14:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwPH-0002kk-Nv; Thu, 23 Oct 2025 14:35:11 +0000
Received: by outflank-mailman (input) for mailman id 1149158;
 Thu, 23 Oct 2025 14:35:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pfyu=5A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vBwPF-0002ke-V3
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 14:35:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79623778-b01d-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 16:35:08 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b6d402422c2so218908966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 07:35:09 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d511f7027sm266002166b.25.2025.10.23.07.35.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 07:35:07 -0700 (PDT)
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
X-Inumbo-ID: 79623778-b01d-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761230108; x=1761834908; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pE5tdVzRZHDl+TZBRnh6M3Cd8JWffdiXRMrYC2G5zQY=;
        b=KpWes+ZBLotCTTtP2WvHYjqTrLomatGcfW9aZXs03rJ+rJALZ3aLJUSoqDM8PvX9eW
         RTiYsMASiIW9YkCV79xCxOkSe8/ENylJ4q0BuiyEgC+G5qybvaZDHs1y4owf743knu5R
         YYsqI5RVBDhf9KUdH6o1NIELn4OoFZ0A9oKAvP46Iw44E8/BU5xYug88wAaDqtZPoLfQ
         pRByv+J86TteZ/kKidohuOGgLt8UD4Kp0TlnVNpgIwiaE0WfcMVnfbw8WhO9q5dgftkx
         7OuwrL0tzk49j/b99+/uNizGf6w15pYCZRNPU2pqRnjFwlXSEgeyLbxucR2ZTMX81lie
         HLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230108; x=1761834908;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pE5tdVzRZHDl+TZBRnh6M3Cd8JWffdiXRMrYC2G5zQY=;
        b=K0jiw50eAUBIyVCcCCjk4lRi/o/nIQW6WgROrTsuq2jB8KCG3i9ys4DEd0vAbvqMQ9
         wIICodvjolqh8h5rO21EPwVsQEE91kZmVEnwPs/MBWFcIB3dier1tzA3UVUTJgy98u83
         z9ejtuLYL1nMP2YMJu7IvEmN3kbsog2MrM3A7PiMUr0ByruWKbgdYky43wEUNkHvVDNR
         JoeqzT8GiLQpwLaEJxbe5sfkGuWXGf4WXVe7NRdMqvkhTIypIDNxzc0HKFTMby1+f0hT
         bR6+i5804have3nbuuztlvvkZT9X2Xs7XBablHoTVEwlF3pkv8GNXrKwrGNQvww6It+K
         bonQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOW0KCXc4frSl6xCll3BOrs4t81KdhRznrndBRYE8t0+qHjWkmtxrJ1NfTckTtqcrSO0LHlF0VzKY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGqEuFz3NtPxOfARCriIMGyNpFnAnYLcOF9NUU8b+UJ2GbhLse
	k7CcqRsRZIYBiqMoU8PuQN3BzcB2xo6FGtjCUMH8VCqGDPlh4M9DRfSv
X-Gm-Gg: ASbGnctVf5iYIfko8FE7ncKCbEjhElyVt/vFDIQyjDVncyb5HHAcMsUmKP0VQ9fiuC5
	TMnZBS24MOUl4dc3uMKEiBGfR+ba7eoCkI1IVl/M6C9gyWn8ZphFyn3uQQRieUgIsqjllAFzQVH
	XIofJD3qihS/AsHK67XB0VAySiEbNDHqOefmBFsA+YiRZFTu/fJHX7KAXAkZ7w/mdfXsVeEiwEY
	AmnHaLPY+G3x3yxdPKQbJVNrMLM3JwrEciHTFTYvB39kyuZBNXOThb5U7GEO3WpDur0DSzLwyvN
	L3YQNm6t4JUOFy4p/SLFcEFlylWMNl3H1U4CrildugIr+WwOeWNSgoGce/6mZTea1zszBGKPNFc
	DvGCY+vnPjBpOxWGLikRrvj560N+7bMNFxaP/kMZFWorLgM8NsCQonYZ+D/ETadQa58WR+q8ayU
	R0s7KtkLEA2TC8nxG6LoAmOvqxUawIGg7sN7u/AhFW/yynhGjcQ5pK4A==
X-Google-Smtp-Source: AGHT+IE2nYh95thbXiwUp4jgN67zcRjnXT8AVuiaxvtzaawGUqIzQQuxjSX0WykmLGBPU2A6AxDiDw==
X-Received: by 2002:a17:906:c106:b0:b6d:5262:a615 with SMTP id a640c23a62f3a-b6d5262afc3mr369862766b.41.1761230107825;
        Thu, 23 Oct 2025 07:35:07 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------CXGOxGRMdFHE9Zzozs5ZoitQ"
Message-ID: <62a66123-ec8c-4458-a2d6-edacba36cb81@gmail.com>
Date: Thu, 23 Oct 2025 16:35:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Various IOMMU related simplifications
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Community Manager
 <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1761209564.git.teddy.astie@vates.tech>
 <b9baa995-da2c-49d9-844c-6b4c625721c0@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b9baa995-da2c-49d9-844c-6b4c625721c0@vates.tech>

This is a multi-part message in MIME format.
--------------CXGOxGRMdFHE9Zzozs5ZoitQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/23/25 11:15 AM, Teddy Astie wrote:
> Le 23/10/2025 à 11:12, Teddy Astie a écrit :
>> Various simplifications in the VT-d and IO-APIC code (mostly related to legacy ia64 code).

I think these changes isn't very critical for the current stage of release, so I suggest to
have them in 4.22.

Thanks.

~ Oleksii

>>
>> No functional change intended.
>>
>> Changed in v2 :
>>    - drop (un)map_vtd_domain_page wrapper instead of moving it
>>    - drop deprecated and Intel-exclusive iommu_inclusive_mapping=<boolean>
>>    - description and formatting changes
>>
>> Teddy Astie (5):
>>     vtd: Drop (un)map_vtd_domain_page wrapper
>>     vtd: Drop "iommu_inclusive_mapping" command-line option
>>     vtd: Collapse x86 subdirectory
>>     vtd: Remove IO_xAPIC_route_entry macro
>>     x86/ioapic: Don't open-code 32-bits rte reads
>>
>>    CHANGELOG.md                                |  2 +
>>    docs/misc/xen-command-line.pandoc           |  6 --
>>    xen/arch/x86/include/asm/io_apic.h          |  1 +
>>    xen/arch/x86/io_apic.c                      | 29 +++----
>>    xen/drivers/passthrough/vtd/Makefile        |  3 +-
>>    xen/drivers/passthrough/vtd/{x86 => }/ats.c | 21 ++---
>>    xen/drivers/passthrough/vtd/dmar.c          |  2 +-
>>    xen/drivers/passthrough/vtd/extern.h        |  3 -
>>    xen/drivers/passthrough/vtd/intremap.c      | 34 ++++----
>>    xen/drivers/passthrough/vtd/iommu.c         | 88 ++++++++++-----------
>>    xen/drivers/passthrough/vtd/iommu.h         |  7 +-
>>    xen/drivers/passthrough/vtd/qinval.c        | 13 +--
>>    xen/drivers/passthrough/vtd/utils.c         | 25 +++---
>>    xen/drivers/passthrough/vtd/vtd.h           |  3 -
>>    xen/drivers/passthrough/vtd/x86/Makefile    |  2 -
>>    xen/drivers/passthrough/vtd/x86/vtd.c       | 48 -----------
>>    16 files changed, 108 insertions(+), 179 deletions(-)
>>    rename xen/drivers/passthrough/vtd/{x86 => }/ats.c (92%)
>>    delete mode 100644 xen/drivers/passthrough/vtd/x86/Makefile
>>    delete mode 100644 xen/drivers/passthrough/vtd/x86/vtd.c
>>
> I forgot to add the CC-ed people
>
>
> --
> Teddy Astie | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web:https://vates.tech
>
>
--------------CXGOxGRMdFHE9Zzozs5ZoitQ
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
    <div class="moz-cite-prefix">On 10/23/25 11:15 AM, Teddy Astie
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b9baa995-da2c-49d9-844c-6b4c625721c0@vates.tech">
      <pre wrap="" class="moz-quote-pre">Le 23/10/2025 à 11:12, Teddy Astie a écrit :
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Various simplifications in the VT-d and IO-APIC code (mostly related to legacy ia64 code).</pre>
      </blockquote>
    </blockquote>
    <pre>I think these changes isn't very critical for the current stage of release, so I suggest to
have them in 4.22.

Thanks.

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:b9baa995-da2c-49d9-844c-6b4c625721c0@vates.tech">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

No functional change intended.

Changed in v2 :
  - drop (un)map_vtd_domain_page wrapper instead of moving it
  - drop deprecated and Intel-exclusive iommu_inclusive_mapping=&lt;boolean&gt;
  - description and formatting changes

Teddy Astie (5):
   vtd: Drop (un)map_vtd_domain_page wrapper
   vtd: Drop "iommu_inclusive_mapping" command-line option
   vtd: Collapse x86 subdirectory
   vtd: Remove IO_xAPIC_route_entry macro
   x86/ioapic: Don't open-code 32-bits rte reads

  CHANGELOG.md                                |  2 +
  docs/misc/xen-command-line.pandoc           |  6 --
  xen/arch/x86/include/asm/io_apic.h          |  1 +
  xen/arch/x86/io_apic.c                      | 29 +++----
  xen/drivers/passthrough/vtd/Makefile        |  3 +-
  xen/drivers/passthrough/vtd/{x86 =&gt; }/ats.c | 21 ++---
  xen/drivers/passthrough/vtd/dmar.c          |  2 +-
  xen/drivers/passthrough/vtd/extern.h        |  3 -
  xen/drivers/passthrough/vtd/intremap.c      | 34 ++++----
  xen/drivers/passthrough/vtd/iommu.c         | 88 ++++++++++-----------
  xen/drivers/passthrough/vtd/iommu.h         |  7 +-
  xen/drivers/passthrough/vtd/qinval.c        | 13 +--
  xen/drivers/passthrough/vtd/utils.c         | 25 +++---
  xen/drivers/passthrough/vtd/vtd.h           |  3 -
  xen/drivers/passthrough/vtd/x86/Makefile    |  2 -
  xen/drivers/passthrough/vtd/x86/vtd.c       | 48 -----------
  16 files changed, 108 insertions(+), 179 deletions(-)
  rename xen/drivers/passthrough/vtd/{x86 =&gt; }/ats.c (92%)
  delete mode 100644 xen/drivers/passthrough/vtd/x86/Makefile
  delete mode 100644 xen/drivers/passthrough/vtd/x86/vtd.c

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I forgot to add the CC-ed people


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng &amp; Xen Orchestra - Vates solutions

web: <a class="moz-txt-link-freetext" href="https://vates.tech">https://vates.tech</a>


</pre>
    </blockquote>
  </body>
</html>

--------------CXGOxGRMdFHE9Zzozs5ZoitQ--

