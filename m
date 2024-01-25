Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C298183C20A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 13:11:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671482.1044834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSyZ8-0005od-Py; Thu, 25 Jan 2024 12:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671482.1044834; Thu, 25 Jan 2024 12:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSyZ8-0005mP-Mw; Thu, 25 Jan 2024 12:10:42 +0000
Received: by outflank-mailman (input) for mailman id 671482;
 Thu, 25 Jan 2024 12:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+DBC=JD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rSyZ6-0005mJ-JB
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 12:10:40 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c029e8dc-bb7a-11ee-9b0f-b553b5be7939;
 Thu, 25 Jan 2024 13:10:38 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40ed2333c8fso4968165e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 04:10:38 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c3b8e00b0040d8d11bf63sm2355887wms.41.2024.01.25.04.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 04:10:37 -0800 (PST)
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
X-Inumbo-ID: c029e8dc-bb7a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706184637; x=1706789437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ACXtgyXgsGJ/p1CWim1rfSJpU/5WKbgM6SYN9qYZKc=;
        b=mXK7sa9aLOqtKhb7tXLxF5RuMKML2UEqrE8ua5/tlsiNE4vEp9K0dCS/2PRzlzjlhC
         /yCGzTqMB9aftmusPhTZVHL84sn9PesMxJ0yTYybX5l4xtTC5a4u1vDg+RDjVgVfuC6f
         P01BX/Ve01jDR+Iuvn0dHEBVTxffS5fjwJNXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706184637; x=1706789437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ACXtgyXgsGJ/p1CWim1rfSJpU/5WKbgM6SYN9qYZKc=;
        b=ZN2e3riQh2vUWUcp/O774XeaqmtTWAU4oS8Ysc0cl9z35myfvajTSIcrEKGJEN6eK2
         gbYKXtGRzCvcD/Nxu14al6Z8Q0J5U46lxqiz5MSNm8GXKls4w6uSjR2w6kWOSAZStZxN
         kf4CKFv/jYnB/r4qwHpBUzlhcQTBzo/PETzHYWM9O9YtPzRwoUCF1QmToEdslI3ELYLw
         +2ZtncHoz3etQfBklyKcZW1UP4/9qdHbzPSCb9o0izgkO6+WC59XutRRcLKeeqLgsp4W
         SoCANCEpLd4AxIC5SeKXslkayV/7cxaoiqusVQ4I6TrTyvFSU7Oi7ynkcqtW++I5jA9a
         ZC+A==
X-Gm-Message-State: AOJu0YyR7OFfSUNfk2E0Nyz8q5SbU1MmWYbVceFy9/VzRg6+sH47tqEX
	00L3HtqmJVwYqM0ndpgjpAuiqiCyU3UcPMmh2svfK/mmmtMR3pcd4pHpgfWZDAU=
X-Google-Smtp-Source: AGHT+IHcoJ1yuRYymi+9wfHIDBGmTAxmhhF42wa/jc83O/opanGz00CfDjwlln3Kv/GJhlug6T0g0w==
X-Received: by 2002:a05:600c:56c5:b0:40e:4d65:59c7 with SMTP id ju5-20020a05600c56c500b0040e4d6559c7mr524855wmb.244.1706184637507;
        Thu, 25 Jan 2024 04:10:37 -0800 (PST)
Message-ID: <1b109fd8-2a23-4ee8-88a4-e3bf48d2f4c5@citrix.com>
Date: Thu, 25 Jan 2024 12:10:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] consolidate do_bug_frame() / bug_fn_t
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <d466eb44-1160-4b57-a41f-752dbf626748@suse.com>
 <alpine.DEB.2.22.394.2401231731570.2287888@ubuntu-linux-20-04-desktop>
 <665b7ea9-77d9-4bbc-a67c-1ac0d9ba908a@suse.com>
 <37afd0b1-a6b3-41aa-8338-c99b68592c92@citrix.com>
 <b19ef7de-b55c-4a70-8b64-d0d4d5a96d93@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b19ef7de-b55c-4a70-8b64-d0d4d5a96d93@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Answering out of order:

On 25/01/2024 8:15 am, Jan Beulich wrote:
> All fine. Still I wonder whether in the meantime this patch isn't an
> improvement on its own, and hence whether the const couldn't sensibly
> be added subsequently.

We have a while until 4.19 goes out.  I would prefer to try and get this
untangled properly, because half of your patch is in the opposite
direction for getting the const-ness working.

If we start to hit rc1 and the const-ness isn't complete, we can revisit.


Regarding the removal of gdb-stub.  I'd like to get that done, and
rebase the remainder of the IRQ series over it, because it will reduce
the churn in your IRQ series.  I'm happy to do the rebase if you want.


> On 25.01.2024 02:14, Andrew Cooper wrote:
>> To make the serial code compile, I ended up having to revert patch 2 of
>> the regs series, which I believe is safe to do following patch 3-5 which
>> un-plumb the regs pointer deeper in the call chain.  If this is turns
>> out to be true, then the patch ought to be added and reverted in the
>> same series so it isn't left hanging about after the fact.
> Hmm, I'm not sure I see how reverting that would end up working. However,
> aiui you need to revert primarily for the non-const-ness of the pointers
> involved in [gs]et_irq_regs(). I wonder whether, if we followed your
> underlying thought here, those shouldn't be const-ified then anyway.
>
>> The _$X_poll() functions are used in timer context, which means there's
>> an outer regs context already latched, and that's arguably a better
>> context to use anyway for 'd'.
> If the timer happens to run on an idle vCPU, what "outer regs context"
> would we have there?

The only reason the serial infrastructure was setting up a fake IRQ
context was because it was using run_in_exception_handler().

But I (think I have) removed that fully (and it simplifies things more
than I was hoping).

With '%' deleted, it's only 'd' that cares, isn't it?  And that's "dump
the current regs", rather than wanting something else.

~Andrew

