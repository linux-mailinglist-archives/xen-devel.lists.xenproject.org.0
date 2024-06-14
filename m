Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216C6909111
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 19:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740839.1147942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIAOr-0007Yt-5o; Fri, 14 Jun 2024 17:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740839.1147942; Fri, 14 Jun 2024 17:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIAOr-0007Ur-36; Fri, 14 Jun 2024 17:07:41 +0000
Received: by outflank-mailman (input) for mailman id 740839;
 Fri, 14 Jun 2024 17:07:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/js=NQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sIAOp-0007Uc-0y
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 17:07:39 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 992297b1-2a70-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 19:07:37 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a68b41ef3f6so281274766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 10:07:37 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da32c3sm207057266b.13.2024.06.14.10.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 10:07:35 -0700 (PDT)
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
X-Inumbo-ID: 992297b1-2a70-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718384855; x=1718989655; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWI1hpd63xiNM8gEgVvcx+MNCHuqUWCo1glSOM5ZNN4=;
        b=RwKXJTOBfGgQfCwgdkvKIJ7VyRTEmWXkBroWIJcmTi4j5bSN4ziHfWNDFSOqV2zgge
         f0DOQ2Gsma0CoNC61nL7w40huQB+jXeQPMrNJI60t/K1WMQvoGdLvg3LtZlXDIICZOur
         AjT0dPdR6vCMuDVxdiSud1xgIMpJoW2duue8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718384855; x=1718989655;
        h=content-transfer-encoding:cc:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWI1hpd63xiNM8gEgVvcx+MNCHuqUWCo1glSOM5ZNN4=;
        b=B9o46qsIC++lQZOIPNTmIVJoQpd8YbG1Dd1Cof23wx43zhU0nVAusS9WUGO0lJdqMQ
         AExnJ70W9Nir6jSasgrlsDqFAIJ3P5d1fZzTRCouKfIRZx7GtT7cn1C5aGEqOq7m9vNX
         VK2qVc6rcEG18iYBsbDZc91cKRzQWSP1qgeUwDalHDFGcmKOHzOXBmwPD/oFRwBnOKiy
         KT7f/sMxneMRrM8xObC5LjOoOAMXWEBdTEv9T4UeuKnD59o+fwISvQUM0SZ2DIYj7ydd
         DyU8fqz9R+wprVCKj/wOJXxANHw8aCfFvCEJorEthQO8e2hDjitgamzCTe3K0hP6BzD8
         u5Gw==
X-Gm-Message-State: AOJu0YxvVGAVcATh3iOiTfHDv1uxC08Gi+ThufanUWpuMRy1jXW+QdgS
	rPkRV7IyMFiEi9kc6TOLDG6FevQ5D6FhR5W4LejLdUYVYF2QLhihotzIBtMuK0LxWE+GtIe05TE
	ywXs=
X-Google-Smtp-Source: AGHT+IF4lCmjQVG0V/v6a78HxywKIWXL9U0EfU4lnYPISoLvyREwf9bpwOZPBTgPznrRyUVbKfOscQ==
X-Received: by 2002:a17:906:b74c:b0:a68:e161:b765 with SMTP id a640c23a62f3a-a6f60d295eamr206911366b.29.1718384855513;
        Fri, 14 Jun 2024 10:07:35 -0700 (PDT)
Message-ID: <46abec6c-ebe9-4426-865e-5513107949be@citrix.com>
Date: Fri, 14 Jun 2024 18:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: for_each_set_bit() clean-up (API RFC)
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

More fallout from looking at the code generation...

for_each_set_bit() forces it's bitmap parameter out into memory.  For an
arbitrary sized bitmap, this is fine - and likely preferable as it's an
in-memory to begin with.

However, more than half the current users of for_each_set_bit() are
operating over an single int/long, and this too is spilled to the
stack.  Worse, x86 seems to be the only architecture which (tries, but
not very well) to optimise find_{first,next}_bit() for GPR-sized
quantities, meaning that for_each_set_bit() hides 2 backing function calls.

The ARM (v)GIC code in particular suffers horribly because of this.

We also have several interesting opencoded forms:
* evtchn_check_pollers() is a (preprocessor identical) opencoding.
* hvm_emulate_writeback() is equivalent.
* for_each_vp() exists just to hardcode a constant and swap the other
two parameters.

and several others forms which I think could be expressed more cleanly
as for_each_set_bit().

We also have the while()/ffs() forms which are "just" for_each_set_bit()
and some even manage to not spill their main variable to memory.


I want to get to a position where there is one clear API to use, and
that the compiler will handle nicely.  Xen's code generation will
definitely improve as a consequence.


Sadly, transforming the ideal while()/ffs() form into a for() loop is a
bit tricky.  This works:

for ( unsigned int v = (val), (bit);
      v;
      v &= v - 1 )
if ( 1 )
{
    (bit) = ffs(v) - 1;
    goto body;
}
else
    body:

which is a C metaprogramming trick borrowed from PuTTY to make:

for_each_BLAH ( bit, val )
{
    // nice loop body
}

work, while having the ffs() calculated logically within the loop body.

The first issue I expect people to have with the above is the raw 'body'
label, although with a macro that can be fixed using body_ ## __COUNTER__.

A full example is https://godbolt.org/z/oMGfah696 although a real
example in Xen is going to have to be variadic for at least ffs() and
ffsl().


Now, from an API point of view, it would be lovely if we could make a
single for_each_set_bit() which covers both cases, and while I can
distinguish the two forms by whether there are 2 or 3 args, I expect
MISRA is going to have a fit at that.  Also there's a difference based
on the scope of 'bit' and also whether modifications to 'val' in the
loop body take effect on the loop condition (they don't because a copy
is taken).

So I expect everyone is going to want a new API to use here.  But what
to call it?

More than half of the callers in Xen really want the GPR form, so we
could introduce a new bitmap_for_each_set_bit(), move all the callers
over, then introduce a "new" for_each_set_bit() which is only of the GPR
form.

Or does anyone want to suggest an alternative name?

Thoughts?

~Andrew

