Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A058A32136
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 09:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886177.1295854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8Bj-00024l-TG; Wed, 12 Feb 2025 08:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886177.1295854; Wed, 12 Feb 2025 08:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8Bj-00022D-QU; Wed, 12 Feb 2025 08:33:43 +0000
Received: by outflank-mailman (input) for mailman id 886177;
 Wed, 12 Feb 2025 08:33:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeD=VD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ti8Bi-000227-G7
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 08:33:42 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fc3b20a-e91c-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 09:33:40 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-308e92c3779so5673091fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 00:33:40 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308ec25911csm9539061fa.57.2025.02.12.00.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 00:33:39 -0800 (PST)
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
X-Inumbo-ID: 0fc3b20a-e91c-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739349220; x=1739954020; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBVQN+2fS53YOm+Cl5t8f2PdQEr6xtDvcyz7iju/HHE=;
        b=bOWbeV1F0CSw7psWGbYkgJ6Y6z6QFZzTs7stMp6EWm+F0ClsSsXGg1Lq2piqekuSPg
         SlPiBB9JixLveZ7VDWX3FeiC7VPCI8mEAe72w/FhODVBKMf2u/R8R6RXD+b3mJojFFcf
         2rPvf8zK9njgttCdowt1cQ/2McDQo64de9puEo0U3cSCa7MGv1mPOh+jTvyM0s9QlvFd
         fWiy+4RlSWbAEGX9cAzenYy5bXN2Pwj19rTCOIzaOaSfFte+f1dUUE+JV29Yzt6yRgi6
         T3BgyMtRziJ+TzJ+Rp3KHF30PO0cWs1cv0Q3QMy9MawRiTgHmVWcbvNbdeMb+9eMrdNa
         RmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739349220; x=1739954020;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JBVQN+2fS53YOm+Cl5t8f2PdQEr6xtDvcyz7iju/HHE=;
        b=qXGjj9l5P3bnHk1bhKSX8jvAO2s5R0Nqw6T/9jaLPYw9uhhriVLaB/C6/YYRVsG4Fe
         QRLkc5GjfRptzwqXjycNw7bEWW1y+raRjQybfdTkOlMjx7L1YtcEVCKQfDyko7LQd0Yv
         Xk564brjdjiVreSJNtdMUSTZ/+DZcN+Wnu1Tn4lxv2by4Jy73AFYLnBgU4fVgbCNGLDQ
         fNFq0L+qkEiWX12fItEbkxOHKaDgmMUUTjBxdgYBOBzgKAGQz5yMDjwqqPGrJ+PtIJ54
         1FxVEAnm2OAjZB8nG40tA/6VucBnuzsvD9h7zP/GjBCmhqfLXavuFyY3NjB4J6AlpCjh
         WSkg==
X-Gm-Message-State: AOJu0Ywc5TqYiOEas1bznO7XZuwqdRm7AeJFH+1eVzPIx8ZIXpinOT8s
	SDOw6VnMH72p+OcEcyRhmLgHSi2jr55S9eU+hFn7B8QeCExFCa2zpNe3Dw==
X-Gm-Gg: ASbGncuXCNtGk8pnrcOIIYiQNuRhzYoiHkyYGxOfEMniC0jfBWI1YqBQMclO6CRNP3q
	Vh1LaO5VrXJFT3iaykAwCe4dZ0+8pHiGplcwmjcrHg9w+oX+ujiMkN4f2OxtUEnA+x37P6LIfT7
	rUmHoIES7Hr+I34Lcg32HoiNyWQkGEOBY7dEECjB8hlKd2jtu/8m6/wSzaVGb7UfMIGWn+R2Inh
	jFu3NirAHWDl/MB9DPKdTMKcu1DAA+l6uExPjLeGVwA5ofROixpcgMA0wmNvkSR0RX0m+nQnPZe
	pN1w6abtpgz4Al9OIDaeorX83fU=
X-Google-Smtp-Source: AGHT+IEYDLqAd2GzZfYSyzqeehxwKV9VQVRiVKVkc2uEYJSNAfSJwLqqTinBleZRqrpvgBl/UYu5pA==
X-Received: by 2002:a2e:96ce:0:b0:308:f752:576f with SMTP id 38308e7fff4ca-308f9114f63mr18950381fa.5.1739349219493;
        Wed, 12 Feb 2025 00:33:39 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------VCsMDvYkL4U91kqcD4s3wm06"
Message-ID: <30b4c319-64fc-4a8f-bc8d-a60e10831357@gmail.com>
Date: Wed, 12 Feb 2025 09:33:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v3 0/5] xen/x86: prevent local APIC errors at
 shutdown
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250211110209.86974-1-roger.pau@citrix.com>
 <Z6uZZrR9XvTFjtO9@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <Z6uZZrR9XvTFjtO9@macbook.local>

This is a multi-part message in MIME format.
--------------VCsMDvYkL4U91kqcD4s3wm06
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/11/25 7:39 PM, Roger Pau Monné wrote:
> On Tue, Feb 11, 2025 at 12:02:04PM +0100, Roger Pau Monne wrote:
>> Hello,
>>
>> The following series aims to prevent local APIC errors from stalling the
>> shtudown process.  On XenServer testing we have seen reports of AMD
>> boxes sporadically getting stuck in a spam of:
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
>>
>> Thanks, Roger.
>>
>> Roger Pau Monne (5):
>>    x86/shutdown: offline APs with interrupts disabled on all CPUs
>>    x86/irq: drop fixup_irqs() parameters
>>    x86/smp: perform disabling on interrupts ahead of AP shutdown
>>    x86/pci: disable MSI(-X) on all devices at shutdown
>>    x86/iommu: disable interrupts at shutdown
> This is now fully reviewed, can I get your opinion (and
> release-acked-by) on which patches we should take for 4.20?

If my understanding is correct to unblock shutdown process, it is enough just
to have only first patch merged, correct? So the first patch should be merged.

As second patch doesn't have functional changes, IMO, it could be merged to
despite of the fact we have Hard code freeze period.

All other patches, I would like to ask additional opinion (as I am an expert in x86),
at first glance it looks like an absence of these patches in staging branch will
lead only to triggering "Receive accept error" which I believe won't block shutdown
process, so these patches could be postponed until 4.21. On other side, if it is
low-risk fixes then we could consider to merge them now.

~ Oleksii


--------------VCsMDvYkL4U91kqcD4s3wm06
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
    <div class="moz-cite-prefix">On 2/11/25 7:39 PM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Z6uZZrR9XvTFjtO9@macbook.local">
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
      <pre wrap="" class="moz-quote-pre">
This is now fully reviewed, can I get your opinion (and
release-acked-by) on which patches we should take for 4.20?</pre>
    </blockquote>
    <pre>If my understanding is correct to unblock shutdown process, it is enough just
to have only first patch merged, correct? So the first patch should be merged.

As second patch doesn't have functional changes, IMO, it could be merged to
despite of the fact we have Hard code freeze period.

All other patches, I would like to ask additional opinion (as I am an expert in x86),
at first glance it looks like an absence of these patches in staging branch will
lead only to triggering "Receive accept error" which I believe won't block shutdown
process, so these patches could be postponed until 4.21. On other side, if it is
low-risk fixes then we could consider to merge them now.

~ Oleksii
</pre>
    <br>
  </body>
</html>

--------------VCsMDvYkL4U91kqcD4s3wm06--

