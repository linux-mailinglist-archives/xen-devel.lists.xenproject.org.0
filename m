Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32741A55C0A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 01:32:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904399.1312277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqLdv-0008UC-2Z; Fri, 07 Mar 2025 00:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904399.1312277; Fri, 07 Mar 2025 00:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqLdu-0008Sk-VS; Fri, 07 Mar 2025 00:32:46 +0000
Received: by outflank-mailman (input) for mailman id 904399;
 Fri, 07 Mar 2025 00:32:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqLdt-0008Se-Op
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 00:32:45 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afac8ed6-faeb-11ef-9ab4-95dc52dad729;
 Fri, 07 Mar 2025 01:32:44 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43bcc85ba13so10097725e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 16:32:44 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4352fa3sm64061035e9.30.2025.03.06.16.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 16:32:43 -0800 (PST)
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
X-Inumbo-ID: afac8ed6-faeb-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741307564; x=1741912364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PPOhyjzLHcq/1In8h9EAKP6u8F4mWrsBEn6Ol1eDuw4=;
        b=wUfIbjNfXAxBLCjCgMh1HfXbH+tzlPGuCL/QpQUNv5R0fwYQ3/ocvgG0NeycLixRDx
         JsFBGJ5uida2K+0Je68nYTedibOitpq4GViDYPnXhLfxIpGN7/evzZpDYRCq7NL7geMN
         kZQXFVaL7NYnu6jZWh18ZmpFZrm9kahSctZQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741307564; x=1741912364;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPOhyjzLHcq/1In8h9EAKP6u8F4mWrsBEn6Ol1eDuw4=;
        b=TViUqV7/ELJ9j+sENRBH1FHnatB5G7eaZr0YMzr13avRNKim/BDQTSHPiih5NDY91S
         t+PWMkPH1ZX9+tzJ01nabcfz9FoFRdyafcZlqxAlr7iVGZLi4caAjhe8lVjoY2/n01OP
         64203oCLJOOkWiU+xYVsSF3j5ScRyNJjkXMFBjdD/sX2e0PI8fy2itq/s0Uz2i+oyM8t
         X41oxHJ8pb/t9Xe+3rblL/sKbv2E1KOOUn+MAGhaZcWntHHxHTq89uokBtIq+NAvJ3Yi
         EXDwfXv+ZASJ+EBfiPJd/5ZWhQeixkTrnXhFEt5qE+AJbD1IwNXMpZRcEv6OWZ7Thtao
         yzwA==
X-Forwarded-Encrypted: i=1; AJvYcCXvh41wYgXEymkWYqNTdkNOjTmH9GKUaI22YU24HQ13VWd8CEmLxJ9lrdY/V1/am/AgArPTQbfm+SI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlCuDMxJY0qtDOzpQzqMKX4w4BOf7yXlfJ3JzQR9aZPulDadtA
	Lu21Buz/ZIoNBfveW94q9vzKur9V0fAGDE9yWk9VaURJSmIm/ZVJE5E8sGfcJKZ0uh90gY3RdnL
	W
X-Gm-Gg: ASbGncupFUVugAX8ggsjbOz8V3KbObMw5BSJ2HD7Trwgj23qSXEWOaeNgeWh9w8hC6g
	5jYGzyRiwIG1W9/zK8RmKqTNKg61ujIE2ZILLdZYRWO7rnglRWEOxkgjxhyRosHU8+muD8BxP6F
	IiaypAvmjUloCjBs/Z8SCEtMegepujZSrnW3u8WILgzOGSzb7nsFUAK19iEm12ZMf7FsWOFyivT
	QymQrV0WUM9gfNN8qOyfkThbQP1R/Y2J5CkZ0NFbzsIjd4YsBiHX7VWJa9bR3GP9taEDBOX2wn4
	0/nAlJbKXGrEfRb6AVb5Bhy+ck3F8vqPddldLHNkANbSI5StI6X0eQ9mdFLOPHQWhzFdGwxhRgs
	xFwSz3N3A
X-Google-Smtp-Source: AGHT+IEsoqVd95Wf5fPkMB/aLTNOvp+izE7J2d1fyD96GqMHdBmi0iDElVe46bxQ/0IdzcVqbMr2zw==
X-Received: by 2002:a05:600c:3108:b0:439:6ab6:5d45 with SMTP id 5b1f17b1804b1-43c5aafb438mr9471245e9.28.1741307563875;
        Thu, 06 Mar 2025 16:32:43 -0800 (PST)
Message-ID: <8b6c88f0-dbde-4fd0-a108-a7651ea3b849@citrix.com>
Date: Fri, 7 Mar 2025 00:32:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] x86/vmx: Rewrite vmx_sync_pir_to_irr() to be more
 efficient
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250304232218.2768344-1-andrew.cooper3@citrix.com>
 <1f763c1a-5844-42d8-9995-3a07f3521172@suse.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1f763c1a-5844-42d8-9995-3a07f3521172@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/03/2025 11:36 am, Jan Beulich wrote:
> On 05.03.2025 00:22, Andrew Cooper wrote:
>> There are two issues.  First, pi_test_and_clear_on() pulls the cache-line to
>> the CPU and dirties it even if there's nothing outstanding, but the final
>> bitmap_for_each() is O(256) when O(8) would do, and would avoid multiple
>> atomic updates to the same IRR word.
>>
>> Rewrite it from scratch, explaining what's going on at each step.
>>
>> Bloat-o-meter reports 177 -> 145 (net -32), but real improvement is the
>> removal of calls to __find_{first,next}_bit() hidden behind bitmap_for_each().
> Nit: As said in reply to v2, there are no underscores on the two find
> functions bitmap_for_each() uses.

I did change the commit message assuming you were right, but the
disassembly never lies.

What bitmap_for_each() uses are very much not functions in x86.

>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1699791518
>>
>> v3:
>>  * Fix IRR scatter address calculation
>>  * Spelling/Grammar improvements
> The description starting with "There are two issues" I fear it still
> doesn't become quite clear what the 2nd issue is. I can only assume it's
> the use of bitmap_for_each() that now goes away.
>
> Preferably with this tweaked a little further
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Oh.  ", but the final" can turn into ", and second,".  That should make
it clearer.

Thanks,

~Andrew

