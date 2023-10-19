Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C827CF61D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619190.963862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQqH-0003XB-Of; Thu, 19 Oct 2023 11:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619190.963862; Thu, 19 Oct 2023 11:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQqH-0003Tn-M1; Thu, 19 Oct 2023 11:05:29 +0000
Received: by outflank-mailman (input) for mailman id 619190;
 Thu, 19 Oct 2023 11:05:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/TV=GB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qtQqG-0003Oa-By
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:05:28 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67f354ba-6e6f-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 13:05:26 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4083f61312eso12638535e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Oct 2023 04:05:26 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 bs30-20020a056000071e00b0032d9a1f2ec3sm4307639wrb.27.2023.10.19.04.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 04:05:25 -0700 (PDT)
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
X-Inumbo-ID: 67f354ba-6e6f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697713525; x=1698318325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XmMJwa3l2soeLn6+XFCad/sSs5sDXHRJpXU8N66IEO0=;
        b=iMLVAQx4iuiNYb7Ir0t1o0VULJBINrdFNxaL8LbF3ELOffz2FsWEry05o3FPdOCwJc
         Os87WvTsSxcZVMojpgfjkIL3oWS9S2MQ3jKV0cm1qoMMSmmpexYfiGOmsjoTo067GYn2
         jiUpu+LUomwCPkAbkRn01t++qdDb34lWii7oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697713525; x=1698318325;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmMJwa3l2soeLn6+XFCad/sSs5sDXHRJpXU8N66IEO0=;
        b=UiD7Odoi2zcvC5CdoIsGb/P40BjlOwTsJ2tzEVs6P2k+BJiNRnQmEXuScg6D5G92aD
         kvJvVixmzXPSAih833ojKGwWUteZy0wRDucb7URZabDCO0nQDuJVamJd2dhRJ6fY50N7
         auSkmQFB8uIgVVoqtyrBvQRsDn1IBo8A+H0W4WCnF3UJxe1RDlfjCtKufZ31XohSFydS
         +3tJkgEdS4Q9W6gzc74iirwn6tP58XhfI62T1jQ5rHK6IQbMzKHDLfqxFHASwtp+Xh5X
         1ROYKzjbMqrCSy9pahx3Fb7Pwt8XBo743BbYu+osClBvtSo7LbJpBDMcXplk6mzKJaYb
         BLKQ==
X-Gm-Message-State: AOJu0Ywt4CYZZWbe8qwWfJyV+ZWfphwfYpfxztYb/6qQT/FWqsdUs+hH
	DFcjRdfRsfkcos8KuTQyytAkGRaaGAWasSYGQhJHDA==
X-Google-Smtp-Source: AGHT+IE0Q6mp18bxn9XUItuHyG4rdZsGlSmIjOok2gydJhs9avcMVJEZJDoRIQSNJ/NvuU+C4LmLOA==
X-Received: by 2002:adf:cd83:0:b0:329:6be4:e199 with SMTP id q3-20020adfcd83000000b003296be4e199mr1324005wrj.13.1697713525430;
        Thu, 19 Oct 2023 04:05:25 -0700 (PDT)
Message-ID: <72f65a40-1875-45a4-a265-f4111e02150e@citrix.com>
Date: Thu, 19 Oct 2023 12:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 00/13] xen/spinlock: make recursive spinlocks a
 dedicated type
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: javi.merino@cloud.com, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20231013094224.7060-1-jgross@suse.com>
 <c86cb866-b795-b6af-0ad7-38e68c7d35c4@suse.com>
 <5f0cecef-8600-40b7-8e59-77d8e33750a7@citrix.com>
 <2efe4ba4-e94c-a5fd-008c-df8e0dc661b5@suse.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2efe4ba4-e94c-a5fd-008c-df8e0dc661b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/10/2023 10:39 am, Jan Beulich wrote:
> On 19.10.2023 11:35, Andrew Cooper wrote:
>> On 19/10/2023 8:48 am, Jan Beulich wrote:
>>> On 13.10.2023 11:42, Juergen Gross wrote:
>>>> Instead of being able to use normal spinlocks as recursive ones, too,
>>>> make recursive spinlocks a special lock type.
>>>>
>>>> This will make the spinlock structure smaller in production builds and
>>>> add type-safety.
>>>>
>>>> This allows to increase the maximum number of physical cpus from 8191
>>>> to 65535 without increasing the size of the lock structure in production
>>>> builds (the size of recursive spinlocks in debug builds will grow to
>>>> 12 bytes due to that change).
>>>>
>>>> Changes in V2:
>>>> - addressed comments by Jan Beulich
>>>> - lots of additional cleanups
>>>> - reorganized complete series
>>>>
>>>> Juergen Gross (13):
>>>>   xen/spinlock: fix coding style issues
>>>>   xen/spinlock: reduce lock profile ifdefs
>>>>   xen/spinlock: make spinlock initializers more readable
>>>>   xen/spinlock: introduce new type for recursive spinlocks
>>>>   xen/spinlock: rename recursive lock functions
>>>>   xen/spinlock: add rspin_[un]lock_irq[save|restore]()
>>>>   xen/spinlock: make struct lock_profile rspinlock_t aware
>>>>   xen/spinlock: add explicit non-recursive locking functions
>>>>   xen/spinlock: add another function level
>>>>   xen/spinlock: add missing rspin_is_locked() and rspin_barrier()
>>>>   xen/spinlock: split recursive spinlocks from normal ones
>>>>   xen/spinlock: remove indirection through macros for spin_*() functions
>>>>   xen/spinlock: support higher number of cpus
>>> Before looking at patches 4 and onwards, I'd like us to settle on the future
>>> of recursive locking in Xen, considering in particular Andrew's objections
>>> to their use in the code base. If the plan was to eliminate them, I'd see
>>> little point in reworking the infrastructure. I'd like to suggest that one
>>> of us tries to remember to put this up as an agenda item for the next
>>> Community Call. But of course the discussion can also happen right here; I
>>> merely expect there might not be much of a reaction.
>> Actually, I consider this series an improvement.  The CPU limit is the
>> most urgent problem to fix.
>>
>> XenServer has just jumped to NR_CPUS=2k in order to support 2024's range
>> of hardware, and it's only going to be a couple of years more before
>> we're stuck given the current spinlocks.
>>
>> I do genuinely think the code and logic would be better without
>> recursive locks, but making that happen is going to be very invasive and
>> complicated.
>>
>> But in the meantime with spinlocks properly separated from recursive
>> locks, it becomes easier IMO to dissuade the introduction of new cases
>> while we unpick the existing ones.
>>
>> And so what if we do end up deleting recursive locks in a few years
>> time?  That's not an argument against doing this untangling now.
> Of course if that was happening only in a few years time, the series
> here is still worthwhile to have. My question was rather towards us
> possibly eliminating recursive locks in the next release cycle.

I find it unlikely that we'd manage to do it in the next release cycle,
even if we did dedicate a significant portion of effort to it.  There
are more urgent things too.

But the same argument works with several years substituted for months. 

~Andrew

