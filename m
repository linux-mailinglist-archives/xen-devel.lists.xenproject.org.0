Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B3D88057E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 20:33:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695591.1085433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmfCG-0002eC-4n; Tue, 19 Mar 2024 19:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695591.1085433; Tue, 19 Mar 2024 19:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmfCG-0002cJ-1r; Tue, 19 Mar 2024 19:32:28 +0000
Received: by outflank-mailman (input) for mailman id 695591;
 Tue, 19 Mar 2024 19:32:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQvM=KZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmfCE-0002c9-Lu
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 19:32:26 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68b79038-e627-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 20:32:23 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33e1d327595so3902048f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 12:32:23 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c3b0200b004142894df64sm5579299wms.5.2024.03.19.12.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 12:32:22 -0700 (PDT)
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
X-Inumbo-ID: 68b79038-e627-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710876742; x=1711481542; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QjBNX0X4WwogqDfb45E1kF0bril/tJaw/P9Q/Rx8MSI=;
        b=vRASjtQ8TUxzubkdn5hSfS67mgSZimGBcAGO3NUjmsM9hQQKLhUgYBNFwy66s0YsLF
         FmMhwiVWJBcPTeIfs8jZXEaw4vs+mkqJXyRkEi1rQ1Z+/ZlQtCuHW9WpVroKLHL6lqBc
         i0F29xJaHD9QQQ7FcHCg2P4xnUswB9q3tU35I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710876742; x=1711481542;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjBNX0X4WwogqDfb45E1kF0bril/tJaw/P9Q/Rx8MSI=;
        b=qhAVsSNANT6ZHOnWNNjoEP/VBOn0U40TsI9Wl7Bh0K2kISDqNo2M9MmIx/pCmTWs+Y
         vv3BpWjvyIQu4EDAZpuWcGUjScaqI9NX7+1KndPIefa5yI8JaN3/wCCzeYG5dl7dqbAN
         XR8331rf79kIjuCViKeDI6QQjcf3PMmjoeXd/B7I0rZDA6MdZrlhmsMJrTiafC+UOQCE
         bgjaCjfbJgHK1/ofXyJfWyeEXfW2wBN1MYfgZaOVs+yBV3cL1NR7vs9CvkCCS9J9NZRr
         T0oohWfwn4vuvA5qcexnGQ/BDlmJG4dqbn4/wFuZpA3iRwNAeSO3lZWCuSWlJjRayCvE
         Lc0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvprfjaQ0FGYAN/wNUaWRGiwcI6SqXhzuh3fJMSwaJ1SBo/nIeB0ppHobG9Ulrbnk9CdLltPnBVVyIQPMfp4F1mhhBc7l6Kh4m1g53r1c=
X-Gm-Message-State: AOJu0YzbreH6Ey8dvgt71K8ccEy7dZVNvm10oaIv50nJDgKzioBuvyOq
	rguBGzvufIdYrnPq7rQYY7LWBhH8cF4tr3PT/Aq2NPO5yxL1q8PbgXU+dKt/LbI=
X-Google-Smtp-Source: AGHT+IGAHXsT6sdsmLcdmOjdcLCUGGNTK3ONiJOuzzDKornYQ2xzyc0vt951QiV4T/juuu5KmNHGFw==
X-Received: by 2002:adf:e68c:0:b0:33e:1a96:2be7 with SMTP id r12-20020adfe68c000000b0033e1a962be7mr9084633wrm.11.1710876742565;
        Tue, 19 Mar 2024 12:32:22 -0700 (PDT)
Message-ID: <7f44c5cd-2e50-4262-a9bd-dacd313f82bc@citrix.com>
Date: Tue, 19 Mar 2024 19:32:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/mm: fix detection of last L1 entry in
 modify_xen_mappings_lite()
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240311105416.4556-1-roger.pau@citrix.com>
 <ac38c8bf-56c2-49f8-98fe-1563803a9c14@suse.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ac38c8bf-56c2-49f8-98fe-1563803a9c14@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/03/2024 11:29 am, Jan Beulich wrote:
> On 11.03.2024 11:54, Roger Pau Monne wrote:
>> The current logic to detect when to switch to the next L1 table is incorrectly
>> using l2_table_offset() in order to notice when the last entry on the current
>> L1 table has been reached.
>>
>> It should instead use l1_table_offset() to check whether the index has wrapped
>> to point to the first entry, and so the next L1 table should be used.
>>
>> Fixes: 8676092a0f16 ('x86/livepatch: Fix livepatch application when CET is active')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> This fixes the osstest livepatch related crash, we have been lucky so far that
>> the .text section didn't seem to have hit this.
> About half a megabyte more to go until .text could run into such an issue,
> I guess, just considering the core Xen image. Patches are presumably not
> large enough to stand a sufficient risk of hitting the issue.
>
> I think there's another latent problem though, related to this part of the
> comment ahead of the function:
>
>  * It is the callers responsibility to not pass s or e in the middle of
>  * superpages if changing the permission on the whole superpage is going to be
>  * a problem.
>
> This only suggests that for a pointer into the middle of a superpage the
> effect may be wider than intended. But with s misaligned modulo 2Mb the
> superpage part of the loop would keep v misaligned, and if the 2nd 2Mb
> range wasn't a superpage, part of the range wouldn't be touched at all.
> Right now with .text always 2Mb-aligned (and with there not being a
> superpage mapping across _srodata) there's no issue as long as superpages
> aren't used in patch loading. Yet recall that .text used to be only 1Mb
> aligned in older Xen versions, and this fact isn't entirely set in stone
> when !XEN_ALIGN_2M.

That comment was added at your request.

The start address is always going to a linker symbol in the main image,
or something allocated with MAP_SMALL_PAGES.

Xen's .text strictly is 2M aligned.  The boot time pagetable handling
doesn't otherwise.

But either way.  The two options are to either ASSERT() that v is 2M
aligned when finding PSE, or to realign it on each iteration.  I'd
prefer to go with the assert on the basis that I don't expect this
property to be violated in practice.

I also note that forcing page alignment on e is useless.  All it does is
force the caller to do pointless work.

~Andrew

