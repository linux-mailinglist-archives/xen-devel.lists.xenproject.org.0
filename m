Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87971A2F70E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 19:30:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884937.1294689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thYXM-0003pW-GP; Mon, 10 Feb 2025 18:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884937.1294689; Mon, 10 Feb 2025 18:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thYXM-0003nk-DW; Mon, 10 Feb 2025 18:29:40 +0000
Received: by outflank-mailman (input) for mailman id 884937;
 Mon, 10 Feb 2025 18:29:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fMFa=VB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thYXL-0003ne-3O
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 18:29:39 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbea326d-e7dc-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 19:29:37 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-545075ff6d5so1981250e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 10:29:37 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450ab80820sm477065e87.52.2025.02.10.10.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 10:29:36 -0800 (PST)
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
X-Inumbo-ID: fbea326d-e7dc-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739212177; x=1739816977; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLf2IMOCuo7mqbuPNM/KTFAUIJKm6lIdCvJHqRSIPyw=;
        b=bWhG9W0kCmpaER+yPkz6HjEp8dEVO5hoeJ+tv6+qMYkaRjUkmFJmbWW0RjrnSC8/HO
         xzJ1f8VPhcYZTvVJ6pzPNnlAMvha5pL8rHE6aT4lCYf4vxafd/Yku23EvdcgDtli8TFN
         cYsHEa3p6I2lYN7TNH9d4y3cVBYvIeUVQFiB6R4fiO7rXSpM+c+H4FekApCMldy6lbJA
         l88zoOvcrzpDvTTSOvvP6aCgfR2zdtQOO/76KMbqnHfMF8vkAqtZ356hbMjJPL6CDFjN
         nPg8enRLJrXBCgUlOVYxjWCLPhc3r01w309Sqtkj/LUn14Qfj4aSCoQaAbxpEPtZV5Yn
         BcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212177; x=1739816977;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LLf2IMOCuo7mqbuPNM/KTFAUIJKm6lIdCvJHqRSIPyw=;
        b=jtrlshNLRM4CU1ZWY8G8H8lxyjBq9yD8zmGMhaP3q07/kwS+brWTQ0YzdMPnY8+2OS
         C2ezuZca7jFLgRdDlG85k2wuJlKe3Un29v45dAN56Cc5GsvfjCI02B1Pu/YYddvXju+e
         3AdpmzVEdOW+3QwXvlAq18vzZoV7lgtAaVezxIG5BYOcLSATJsVLGcWQxga1w54C9xkB
         6BUKDgupgUO/xa+drIhh22z67H1NUm4tevvqB7AxLKxcZKFcQjU+GkkktoZlZ+e+Awal
         lm6+de317SWbYsJo+unxTq1obn+W7lC4TwdPdyJcAgnkFIcZBHx2WY9aVQzYTDCY8wbs
         dSVg==
X-Gm-Message-State: AOJu0YyqlUvXzVg/VS4fK3cDV2+MxV42ojwktssdqiIIfRWo7jmY5dX4
	gOK5bivRkmZ2FPVJkVaimTmOYt6KodU1yGxZg2Vfw+Vj4BZw+xpJ
X-Gm-Gg: ASbGncvDveSv7f7uw/qgIQnmyl5ciXmvX7jbz2qVy5BVG4cDMB1q3fdBDhPoICQrjaa
	BkSwTZR44tvdStHJozKOXUfsEIgHsT0nGKL8xVRH0zSeeuiIwW3vDxI2ClRuT0Y75O0jS9WnXVL
	QlxZayrdviKVAI2lSb9hhUKGE9nro3Z3hmJdJK/3GSEVzplAEnwHlDPsVgD8rWUcdBHnYWBE8SK
	NtaXAIxSPkG4BkZXfHtNGx0m6Ob5mmaWYQtg6wdUL8+u35CXp1/YhNs4Ha+UbE1PUEP1ge2sCXy
	SZTPVQ6WTjI0GXe6Uwriyjuv5Sw=
X-Google-Smtp-Source: AGHT+IGjkdz7G6OOOVh6bSdBO97SpvcWhWB7lYmQD9yZtlcTS7PrKiGqTdWX+jR1nFOsanNwQRvDug==
X-Received: by 2002:ac2:568d:0:b0:545:d70:1d1c with SMTP id 2adb3069b0e04-5450d701fe3mr1361840e87.11.1739212176772;
        Mon, 10 Feb 2025 10:29:36 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------uFL1wE5BEWFfcOK8HHkTlKx2"
Message-ID: <9f6240b2-009d-46a7-af9f-4944cd9439b1@gmail.com>
Date: Mon, 10 Feb 2025 19:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? v2 0/5] xen/x86: prevent local APIC errors at
 shutdown
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250206150615.52052-1-roger.pau@citrix.com>
 <Z6nOmwdp8iRNmkzh@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <Z6nOmwdp8iRNmkzh@macbook.local>

This is a multi-part message in MIME format.
--------------uFL1wE5BEWFfcOK8HHkTlKx2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Roger,

On 2/10/25 11:02 AM, Roger Pau Monné wrote:
> Hello,
>
> This should have had a 'for-4.20?' tag in the subject name, as
> otherwise we will need to add an errata to the release notes to notice
> that reboot can sometimes fail on AMD boxes.
>
> Also adding Oleksii.
>
> Thanks, Roger.
>
> On Thu, Feb 06, 2025 at 04:06:10PM +0100, Roger Pau Monne wrote:
>> Hello,
>>
>> The following series aims to prevent local APIC errors from stalling the
>> shtudown process.  On XenServer testing we have seen reports of AMD
>> boxes sporadically getting stuck in a spam of:

How often this issue happen?

>>
>> APIC error on CPU0: 00(08), Receive accept error
>>
>> Messages during shutdown, as a result of device interrupts targeting
>> CPUs that are offline (and have the local APIC disabled).
>>
>> First patch strictly solves the issue of shutdown getting stuck, further
>> patches aim to quiesce interrupts from all devices (known by Xen) as an
>> attempt to prevent a spurious "APIC error on CPU0: 00(00)" plus also
>> make kexec more reliable.

If the first patch solves does it make sense to consider, at least, it to be merged?

~ Oleksii

>>
>> Thanks, Roger.
>>
>> Roger Pau Monne (5):
>>    x86/shutdown: offline APs with interrupts disabled on all CPUs
>>    x86/irq: drop fixup_irqs() parameters
>>    x86/smp: perform disabling on interrupts ahead of AP shutdown
>>    x86/pci: disable MSI(-X) on all devices at shutdown
>>    x86/iommu: disable interrupts at shutdown
>>
>>   xen/arch/x86/crash.c                        |  2 ++
>>   xen/arch/x86/include/asm/irq.h              |  4 +--
>>   xen/arch/x86/include/asm/msi.h              |  1 +
>>   xen/arch/x86/irq.c                          | 30 ++++++++-----------
>>   xen/arch/x86/msi.c                          | 18 +++++++++++
>>   xen/arch/x86/smp.c                          | 33 +++++++++++++++------
>>   xen/arch/x86/smpboot.c                      |  2 +-
>>   xen/drivers/passthrough/amd/iommu.h         |  1 +
>>   xen/drivers/passthrough/amd/iommu_init.c    | 17 +++++++++++
>>   xen/drivers/passthrough/amd/pci_amd_iommu.c |  1 +
>>   xen/drivers/passthrough/iommu.c             |  6 ++++
>>   xen/drivers/passthrough/pci.c               | 33 +++++++++++++++++++++
>>   xen/drivers/passthrough/vtd/iommu.c         | 19 ++++++++++++
>>   xen/include/xen/iommu.h                     |  3 ++
>>   xen/include/xen/pci.h                       |  4 +++
>>   15 files changed, 145 insertions(+), 29 deletions(-)
>>
>> -- 
>> 2.46.0
>>
--------------uFL1wE5BEWFfcOK8HHkTlKx2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello Roger,</pre>
    <div class="moz-cite-prefix">On 2/10/25 11:02 AM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Z6nOmwdp8iRNmkzh@macbook.local">
      <pre wrap="" class="moz-quote-pre">Hello,

This should have had a 'for-4.20?' tag in the subject name, as
otherwise we will need to add an errata to the release notes to notice
that reboot can sometimes fail on AMD boxes.

Also adding Oleksii.

Thanks, Roger.

On Thu, Feb 06, 2025 at 04:06:10PM +0100, Roger Pau Monne wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hello,

The following series aims to prevent local APIC errors from stalling the
shtudown process.  On XenServer testing we have seen reports of AMD
boxes sporadically getting stuck in a spam of:</pre>
      </blockquote>
    </blockquote>
    <pre>How often this issue happen?

</pre>
    <blockquote type="cite" cite="mid:Z6nOmwdp8iRNmkzh@macbook.local">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

APIC error on CPU0: 00(08), Receive accept error

Messages during shutdown, as a result of device interrupts targeting
CPUs that are offline (and have the local APIC disabled).

First patch strictly solves the issue of shutdown getting stuck, further
patches aim to quiesce interrupts from all devices (known by Xen) as an
attempt to prevent a spurious "APIC error on CPU0: 00(00)" plus also
make kexec more reliable.</pre>
      </blockquote>
    </blockquote>
    <pre>If the first patch solves does it make sense to consider, at least, it to be merged?

~ Oleksii
</pre>
    <blockquote type="cite" cite="mid:Z6nOmwdp8iRNmkzh@macbook.local">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

Thanks, Roger.

Roger Pau Monne (5):
  x86/shutdown: offline APs with interrupts disabled on all CPUs
  x86/irq: drop fixup_irqs() parameters
  x86/smp: perform disabling on interrupts ahead of AP shutdown
  x86/pci: disable MSI(-X) on all devices at shutdown
  x86/iommu: disable interrupts at shutdown

 xen/arch/x86/crash.c                        |  2 ++
 xen/arch/x86/include/asm/irq.h              |  4 +--
 xen/arch/x86/include/asm/msi.h              |  1 +
 xen/arch/x86/irq.c                          | 30 ++++++++-----------
 xen/arch/x86/msi.c                          | 18 +++++++++++
 xen/arch/x86/smp.c                          | 33 +++++++++++++++------
 xen/arch/x86/smpboot.c                      |  2 +-
 xen/drivers/passthrough/amd/iommu.h         |  1 +
 xen/drivers/passthrough/amd/iommu_init.c    | 17 +++++++++++
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  1 +
 xen/drivers/passthrough/iommu.c             |  6 ++++
 xen/drivers/passthrough/pci.c               | 33 +++++++++++++++++++++
 xen/drivers/passthrough/vtd/iommu.c         | 19 ++++++++++++
 xen/include/xen/iommu.h                     |  3 ++
 xen/include/xen/pci.h                       |  4 +++
 15 files changed, 145 insertions(+), 29 deletions(-)

-- 
2.46.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------uFL1wE5BEWFfcOK8HHkTlKx2--

