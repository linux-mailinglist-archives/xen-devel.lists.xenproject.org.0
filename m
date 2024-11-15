Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812669CD4D3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 01:56:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836863.1252769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBkcs-0008Mw-8a; Fri, 15 Nov 2024 00:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836863.1252769; Fri, 15 Nov 2024 00:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBkcs-0008LQ-5I; Fri, 15 Nov 2024 00:55:54 +0000
Received: by outflank-mailman (input) for mailman id 836863;
 Fri, 15 Nov 2024 00:55:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=olWw=SK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBkcq-0008LH-Dy
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 00:55:52 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a6f1eb2-a2ec-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 01:55:48 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-431688d5127so10165665e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 16:55:48 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab80a10sm36360695e9.26.2024.11.14.16.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 16:55:47 -0800 (PST)
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
X-Inumbo-ID: 5a6f1eb2-a2ec-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzQiLCJoZWxvIjoibWFpbC13bTEteDMzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVhNmYxZWIyLWEyZWMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjMyMTQ4LjcwNzk4Miwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731632148; x=1732236948; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YLKlV9TGKjUendVOGpOLjSwlswm5Bf69m1u0QHs7k+k=;
        b=YhPHVatcp4AJo7fpuj3VWR7g8y7BI/fmN9PNpTpkMHzeaaMW8iN0qUKKZWpLL/UO48
         OT8KXucjrHiR4ILEvSFa9y3sFgwelWA55OOrPfSVoZDBqUtsx4vatxHTH5S1EV95ajVU
         5N5G4SWjXGxc/lrANa8ebTmYMqYDSscq8FLig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731632148; x=1732236948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLKlV9TGKjUendVOGpOLjSwlswm5Bf69m1u0QHs7k+k=;
        b=QiFw2dAPkkw8viHbfJreSqhuqoXbZxkTQTZYlXmXNtSsdSu87AzLhiLie68XG6r5vL
         ju4fDumqxHWZxjJAnXIHS38Fq31hjzntFx3YW97LJatmiB9kFKuALUmdVH2ndmDPczk0
         0SZSEwcG+MFttn4Y6P0N64EZz56m+h84ABka9EmsfHuUpdKxOpc84Gg3S/6QZG2bmSEz
         RzVGwIWg9hwyukCO6H/EIyr0zdBIRawkPmLp//ASPFxFMAZiUrzM4KLq9tCcCEsgSMEs
         OxHe+AUsOPsTM1+PPFOSkBZ+uXPE0xXjp91uU/J4x2wCLcH5ZujRlf07vKWHcZRRBNHJ
         CU6w==
X-Forwarded-Encrypted: i=1; AJvYcCVtC4crYMcsbPpB+E/oAQwIT4fGMcx1S8B4W9FooPYOtf7kNVsmaM+PVjIb/88BVt2FuM6x/sMMyZU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwO9CgX8kK85rS6Hwfa80jizmrbIvBktTzwvzBHc6u51RDJYGmj
	L/gFagFTrgz7DDEWDwNwJcDQcCsvOP//TEbiMbjzHvaw2TKqlMLdH1gQB6TvffE=
X-Google-Smtp-Source: AGHT+IFCv22AGh5xJnyjR+qRE5AoEyB7YxN7RgEOpFh+TZE6ijEWO+ejZ671LlXEO8nfThd9QzvWdA==
X-Received: by 2002:a05:600c:5116:b0:42f:4f6:f8f3 with SMTP id 5b1f17b1804b1-432df71bc69mr4916755e9.7.1731632148009;
        Thu, 14 Nov 2024 16:55:48 -0800 (PST)
Message-ID: <0f575e16-3e83-4d8e-b5ce-7fd9c962c3ee@citrix.com>
Date: Fri, 15 Nov 2024 00:55:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] x86/mm: miscellaneous fixes
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20241114145715.59777-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241114145715.59777-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/11/2024 2:57 pm, Roger Pau Monne wrote:
> Hello,
>
> The attempt to fix destroy_xen_mappings() so that L2 tables are
> consistently freed uncovered some errors in the memory management code.
> The following series attempts to fix them.
>
> All patches except for 4/4 are new in v2, and 4/4 has no change from v1,
> hence kept Jan's Reviewed-by tag in 4/4.
>
> Thanks, Roger.
>
> Roger Pau Monne (4):
>   x86/mm: introduce helpers to detect super page alignment
>   x86/mm: skip super-page alignment checks for non-present entries
>   x86/setup: remove bootstrap_map_addr() usage of destroy_xen_mappings()
>   x86/mm: ensure L2 is always freed if empty

Still broken.  This happened to be a Cascade Lake:

(XEN) 3... 2... 1...
(XEN) Xen is relinquishing VGA console.
(XEN) ----[ Xen-4.20.0-4-d  x86_64  debug=y  Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d04022cdc8>]
common/page_alloc.c#free_heap_pages+0x52/0x753
<snip>
(XEN) Xen call trace:
(XEN)    [<ffff82d04022cdc8>] R
common/page_alloc.c#free_heap_pages+0x52/0x753
(XEN)    [<ffff82d04022e98f>] F free_domheap_pages+0x445/0x447
(XEN)    [<ffff82d040320f88>] F free_xen_pagetable+0x2f/0x31
(XEN)    [<ffff82d04032193d>] F map_pages_to_xen+0x5df/0x1028
(XEN)    [<ffff82d040238ab1>] F vunmap+0x27/0xde
(XEN)    [<ffff82d040624b61>] F vesa_endboot+0x86/0xb3
(XEN)    [<ffff82d0406244c1>] F video_endboot+0x93/0x261
(XEN)    [<ffff82d040616e3d>] F console_endboot+0x92/0x120
(XEN)    [<ffff82d0406407e2>] F __start_xen+0x2139/0x2307
(XEN)    [<ffff82d0402033ae>] F __high_start+0x8e/0x90
(XEN)
(XEN) Pagetable walk from ffff82c000205001:
(XEN)  L4[0x105] = 0000000060431063 ffffffffffffffff
(XEN)  L3[0x100] = 000000006fffd063 ffffffffffffffff
(XEN)  L2[0x001] = fffffffffffff000 ffffffffffffffff
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=0000]
(XEN) Faulting linear address: ffff82c000205001
(XEN) ****************************************

Note the definitely bogus L2e, which I'm guessing is an issue with the
use of INVALID_MFN.

But the same crash is seen on BDX, SKX, SPR, Naples, Rome and Milan, all
including the bad L2e.

ICX crashed but there was no serial console.


Genoa was weird.  It was:

(XEN) ----[ Xen-4.20.0-4-d  x86_64  debug=y  Not tainted ]----
(XEN) CPU:    24
(XEN) RIP:    e008:[<ffff82d040330509>] __node_distance+0x20/0x62
<snip>
(XEN) Xen call trace:
(XEN)    [<ffff82d040330509>] R __node_distance+0x20/0x62
(XEN)    [<ffff82d040240ee5>] F do_sysctl+0xcf8/0x140e
(XEN)    [<ffff82d0402f6b21>] F pv_hypercall+0x59b/0x62b
(XEN)    [<ffff82d0402012d3>] F lstar_enter+0x143/0x150
(XEN)
(XEN) Pagetable walk from ffff82c000203024:
(XEN)  L4[0x105] = 000000005fc31063 ffffffffffffffff
(XEN)  L3[0x100] = 00000000677cd063 ffffffffffffffff
(XEN)  L2[0x001] = 000000207a79a063 ffffffffffffffff
(XEN)  L1[0x003] = 0000000000000000 ffffffffffffffff
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 24:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=0000]
(XEN) Faulting linear address: ffff82c000203024
(XEN) ****************************************

while sat at the login prompt, which means it had survived a full
install and first boot.

The range of the change was 64d2290cf96bb^..d2c214ede05ca (starting from
Jan's fix to _xvrealloc()) but there are no other obvious candidates.

This crash isn't obviously related to the others, but there's nothing
else like it seen before.  Memory corruption isn't out of the question.

~Andrew

