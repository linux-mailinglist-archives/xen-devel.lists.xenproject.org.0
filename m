Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2575E83B676
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 02:15:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671312.1044578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSoKY-0002v8-6y; Thu, 25 Jan 2024 01:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671312.1044578; Thu, 25 Jan 2024 01:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSoKY-0002sR-3k; Thu, 25 Jan 2024 01:14:58 +0000
Received: by outflank-mailman (input) for mailman id 671312;
 Thu, 25 Jan 2024 01:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+DBC=JD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rSoKW-0002sL-NJ
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 01:14:56 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25e9cf94-bb1f-11ee-98f5-6d05b1d4d9a1;
 Thu, 25 Jan 2024 02:14:55 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e80046264so77184345e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 17:14:55 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a05600c1c8a00b0040e451fd602sm711151wms.33.2024.01.24.17.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 17:14:54 -0800 (PST)
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
X-Inumbo-ID: 25e9cf94-bb1f-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706145294; x=1706750094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JjhTkAcyX1mrDbwTjJczCt/6YY2bgfxIFtKZkAkc0U8=;
        b=vnqmOfI5U0hwjIOhZqTn5GTJh+OOW627H+7UsDZ+xXme6SOIiu1xcPHxn2RkhE1ugF
         ZFOesTG0/cFuWDyEylaC/ojhw4Gn4iPA8IWlPTh6qgrA1ZfZus1bOW4A7O3hgLhNoByK
         PTN42bj27dQiqPr4TakLe01MQBWaz/QmN9uw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706145294; x=1706750094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JjhTkAcyX1mrDbwTjJczCt/6YY2bgfxIFtKZkAkc0U8=;
        b=tQmnvrMjfIZJmnF/vlfwMjULUtP94MyO7fjx0LAhNP63uGgdegQsuA+TfA/1SySa/L
         n0yH3oTSd9IQ4DbLNJ7TpFQLsr5rzGDp0I7RnZB2I+2aQlbzT9p3yJQYjLJEi8VBvi/v
         6XZYYwlCr2R1E3qceL0REjTV+Ig6gSXAwaf1bp3Nw+2aed1Z5LG+nGQSYRcW+g3F7afN
         vC4WY+lnUE9YrlgHK6Q6PQQk7DG0/pYpXKqTnoULMJH20fL9nh10Ax8x8Go5psPqrl15
         nm4LrJTxLUU0h08vl3kAd2rofhmm3c2eYh7kAwGINZdD+FIk13DA2yyU11CQioqJkly/
         axGw==
X-Gm-Message-State: AOJu0YxNoMlVKYVd9JVamkiVDRETh+NUQBwhJLcCVVyChoLaH2/qCcDE
	kcjxard/DdBxvXoldJjCwEikJuNboRr68Qaw/keapDs8Cv+fL3GXb5VcYbjiWvo=
X-Google-Smtp-Source: AGHT+IHDhUnw/uzF/FcZF6EhJPuc/3/HImIMi0Pau9KzKYPv/QS/lFFaKiYPcekC4fGVMotRbCQnow==
X-Received: by 2002:a05:600c:aca:b0:40e:4833:5daa with SMTP id c10-20020a05600c0aca00b0040e48335daamr37929wmr.187.1706145294561;
        Wed, 24 Jan 2024 17:14:54 -0800 (PST)
Message-ID: <37afd0b1-a6b3-41aa-8338-c99b68592c92@citrix.com>
Date: Thu, 25 Jan 2024 01:14:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] consolidate do_bug_frame() / bug_fn_t
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <d466eb44-1160-4b57-a41f-752dbf626748@suse.com>
 <alpine.DEB.2.22.394.2401231731570.2287888@ubuntu-linux-20-04-desktop>
 <665b7ea9-77d9-4bbc-a67c-1ac0d9ba908a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <665b7ea9-77d9-4bbc-a67c-1ac0d9ba908a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/01/2024 7:28 am, Jan Beulich wrote:
> On 24.01.2024 02:34, Stefano Stabellini wrote:
>> I managed to get back to read the mailing list and noticed this patch.
>>
>> Is it still relevant and needs to be reviewed?
>>
>> Are there any outstanding disagreements between maintainers on the
>> approach to take here?  Or should I just go ahead and review it?
> It is still relevant from my pov, and everything that may be controversial
> is said ...

BUGFRAME_* cannot legitimately modify the interrupted context.  Two are
fatal paths, and other two are side-effect-less as far as C can tell.

So the infrastructure ought to take a const pointer.

The reason why this pointer is non-const is to do with the interaction
of the serial and keyhandler infrastructures.  Because we're adjusting
that for other reasons, I was hoping it would subsequently be easy to
switch Xen to being properly const in this regard.

Turns out it is:

 
https://gitlab.com/xen-project/people/andyhhp/xen/-/commit/4f857075005da1d28632e4f9198c2e7d0f404b9a

with a couple of caveats.  (Only the buster-gcc-ibt run failed, so I've
got some cf_check-ing to adjust, but all the other builds worked fine).


To make the serial code compile, I ended up having to revert patch 2 of
the regs series, which I believe is safe to do following patch 3-5 which
un-plumb the regs pointer deeper in the call chain.  If this is turns
out to be true, then the patch ought to be added and reverted in the
same series so it isn't left hanging about after the fact.

The _$X_poll() functions are used in timer context, which means there's
an outer regs context already latched, and that's arguably a better
context to use anyway for 'd'.

This in turn allows us to remove a #UD from a fast(ish) path, and remove
some per-cpu or static variables which are just used for non-standard
parameter passing because run_in_exception_handler() doesn't let you
pass any.


This leaves the '%' debugger infrastructure.  Being a debugger, it's
making arbitrary changes anyway and I'd much rather cast away constness
for a debugger, than to keep everything else mutable when it oughtn't to be.

If absolutely nothing else, registration and handling '%' ought to be
from x86 code rather than common code, which would remove the
do_debugger_trap_fatal() layering violation.

But, the more I look into the gdbstub the more I'm convinced that it
doesn't work.  For example, this gem:

/* Resuming after we've stopped used to work, but more through luck than
any actual intention.  It doesn't at the moment. */

From c/s b69f92f3012 in July 2004, and more specifically the commit
which added the gdbstub functionality to begin with.  I.e. it doesn't
appear to have ever supported more than "poke around in the crashed
state".  In the 2 decades that noone has fixed this, we've gained far
better technologies for doing this, such as running it in a VM.

I am going to submit some patches deleting gdbstub.  It clearly had not
much value to begin with, and is not definitely not worth the problems
it is creating in adjacent code these days.

~Andrew

