Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56939A0BEB9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 18:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870792.1281866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXO4s-0000Op-LW; Mon, 13 Jan 2025 17:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870792.1281866; Mon, 13 Jan 2025 17:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXO4s-0000NM-Im; Mon, 13 Jan 2025 17:18:14 +0000
Received: by outflank-mailman (input) for mailman id 870792;
 Mon, 13 Jan 2025 17:18:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q7wO=UF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tXO4r-0000NG-RT
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 17:18:13 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dbab8fe-d1d2-11ef-99a4-01e77a169b0f;
 Mon, 13 Jan 2025 18:18:11 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3043e84c687so35049841fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 09:18:11 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c7b99sm15606661fa.84.2025.01.13.09.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 09:18:10 -0800 (PST)
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
X-Inumbo-ID: 5dbab8fe-d1d2-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736788691; x=1737393491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5HjDTBYIqq6mb8lh3R3GImpfBdHQLjRud0GwSs4KM4=;
        b=VX8f834Df31zQBQS01pzZmxPCM6gbbSZwWktQa6vlIqHc0CRmSyMavd2abR2jraC0U
         QHPQSvZAT2lc10ncUf9amp69KRHp9mgBi7O7eC9Ax8sQJkGnmW9PREjw3/4rTq5evLtU
         xDr2EKC3ln49w5UMDuDQ9kNfjKp6UOcfqPm8IFuV9zg7L9dR5Hmh2y4try6Nn7mR8MCR
         mtHY1dtWBKyTLjnuNS0SGFCJHA3qhEGFbumo+wzWuOMBr1UdQd5DCguEtWQczQfkXHpA
         qQpvvtoolV6furOFszgWlyZ/sY2kr19mislI6xuZyjM5SL6Z10F0u9gDnNk7YxqZSbGU
         iYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736788691; x=1737393491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O5HjDTBYIqq6mb8lh3R3GImpfBdHQLjRud0GwSs4KM4=;
        b=Fx+GVyxLDC7XIoxlL0HfNTtuwtCChA+LaW/f94K2h+MAz7N7wOm/OP+TIXOZa30h4+
         VLq1WWnjZmAOi5q4uSQPCE+qsiK188aOtvI5tyoG4IbiCMps3sOrtOeBGCsa2Z7iem/T
         myIJllMHz7kSof9rvh38oJeWLFxNxwfmWfqdmhnHMIpL33vnzdEY0njuMtFGSKug1cni
         TFaIxIY+ZCvYEmibbEAB9Jy08pPSKsc95QySvdENpwI/4Qax7tfxCxOj7iCSDwl4NeQW
         1wm8j3+PeGUHfL6aZEwY4x+BlU1f5jsV81l7ijl8wYLCIfa//nGIFgwBdZGvlKTTBQoC
         68WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDgIxsvt4CkdJs5JFx/xNGK0zK4c+qeSWA+mbMfFv+fXgSDv6vZisSX7dU03lQsPRN53/8rr3WWuA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTeDTPGwAQuIkdwPq/kN4FBvDlcnKYt1hviNb7LOlBqyIQlaaA
	nctZH05dPzbF9VbYT7XEdWxyWjy1xV/Vzh5mB+J7xzOrYMdFYhQO
X-Gm-Gg: ASbGncveI5S93T6OWQocFjJIwZMGZPB85VlI+K7LPyF/B6k68S8MPlvPbGqBZwrz0ZE
	oRwPfZx4BnbYaV1tAqVTXSjov1+zT5BbSlAuTB2yxu7WG+NfnhSNr+lWGgju2fE0wkd8T6JRTZ6
	S/+8J5Ak/r0WbWjMffEtpDdDyz5vkV2RJtqIBVjBxInkDevDvnjpY6oIjVQy5PEF2S12hJTLjO6
	qmBlswqJj8l6Gs5qgdzHjw2wT4nZVyZGczserykoDNitPM57G24p0sHMTOfBxvB4DJhUA==
X-Google-Smtp-Source: AGHT+IFOVketSCQTF1nklmx6YCWUutCyFJVZLFbUGrISJS6ggkjSSAxnfOrEEbYfSybBjBwgtEkM+A==
X-Received: by 2002:a2e:a78a:0:b0:300:1f2c:e3cf with SMTP id 38308e7fff4ca-305f454ffabmr75361171fa.13.1736788690955;
        Mon, 13 Jan 2025 09:18:10 -0800 (PST)
Message-ID: <333f50dd-927d-43de-8b49-6865648a9ec5@gmail.com>
Date: Mon, 13 Jan 2025 18:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] x86: Add Support for Paging-Write Feature
To: Tamas K Lengyel <tamas@tklengyel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 xen-devel@lists.xenproject.org, Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1735837806.git.w1benny@gmail.com>
 <4eea61a2-cf56-4ff5-8c43-58f5a20c9cb1@gmail.com>
 <CABfawhmHK_Lg8GuVr9yb1gw82YFs3e1gh76azzH8C98R552dSw@mail.gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <CABfawhmHK_Lg8GuVr9yb1gw82YFs3e1gh76azzH8C98R552dSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/9/25 4:25 PM, Tamas K Lengyel wrote:
> On Thu, Jan 9, 2025 at 9:30 AM Oleksii Kurochko
> <oleksii.kurochko@gmail.com> wrote:
>>
>> On 1/2/25 6:13 PM, Petr Beneš wrote:
>>
>> From: Petr Beneš <w1benny@gmail.com>
>>
>> Changes since v2:
>> - Reset entry->pw in all cases in p2m_set_entry, except for p2m_access_r_pw
>>
>> Changes since v1:
>> - Added signed-off-by tags
>>
>> This patch introduces a new XENMEM_access_r_pw permission. Functionally, it is similar to XENMEM_access_r, but for processors with TERTIARY_EXEC_EPT_PAGING_WRITE support (Intel 12th Gen/Alder Lake and later), it also permits the CPU to write to the page during guest page-table walks (e.g., updating A/D bits) without triggering an EPT violation.
>>
>> This behavior works by both enabling the EPT paging-write feature and setting the EPT paging-write flag in the EPT leaf entry.
>>
>> This feature provides a significant performance boost for introspection tools that monitor guest page-table updates. Previously, every page-table modification by the guest—including routine updates like setting A/D bits—triggered an EPT violation, adding unnecessary overhead. The new XENMEM_access_r_pw permission allows these "uninteresting" updates to occur without EPT violations, improving efficiency.
>>
>> Considering that this feature provides a significant performance boost for introspection tools probably we could consider to take it to current release.
>>
>> I see that the patch series was acked-by "Acked-by: Tamas K Lengyel <tamas@tklengyel.com>" but based on the change log it is not clear when exactly
>>
>> before Feature freeze date or not. ( and I don't see any reply from Tamas ).
> I've acked the patch Thu, Dec 19, 2024.

In this case, I believe we should consider including it in the current 
release, as it was technically ready for merging before the Feature 
Freeze deadline.

I would like to kindly ask the x86 maintainers for clarification on why 
this patch series was not merged.

~ Oleksii

