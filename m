Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D2D7A30F2
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 16:43:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603617.940672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhWVH-0004wa-3K; Sat, 16 Sep 2023 14:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603617.940672; Sat, 16 Sep 2023 14:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhWVG-0004tk-VD; Sat, 16 Sep 2023 14:42:34 +0000
Received: by outflank-mailman (input) for mailman id 603617;
 Sat, 16 Sep 2023 14:42:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1Uw=FA=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qhWVF-0004te-8j
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 14:42:33 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43dec8d0-549f-11ee-8788-cb3800f73035;
 Sat, 16 Sep 2023 16:42:32 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68fcb4dc8a9so2917626b3a.2
 for <xen-devel@lists.xenproject.org>; Sat, 16 Sep 2023 07:42:31 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 t19-20020aa79393000000b00686236718d8sm4592966pfe.41.2023.09.16.07.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Sep 2023 07:42:29 -0700 (PDT)
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
X-Inumbo-ID: 43dec8d0-549f-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694875350; x=1695480150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiBbaTEoR4KdXzrafod1XJetgle5g3jH5UWLbf33Jow=;
        b=CCURVFzEFz1uUu17YYbTBawODsA8onGw1At4ONZMGAqcYHurRACtAwh+HL2QSvRoVL
         2TwZULZzEAK6hSGC6QiPio4EuC/UqLmVebk0BL0Xy6S/0Zyr25yWzUllJElK+e8WSYJk
         KJRQfnVxU9EyXYp3dh2jX7faGHpCYnh/57kBt/iBqX+XDEPyicGSzTy6pYpRA5LkhuiF
         FA87YBwshXx1hxxV2kQz9Dr0ii1cGTSAfQ4PKNVxNzXq3MjuuHnNwJsylTO3TvtIpEfy
         1kS1xYPdYjVJTgKFWrGVHX7zOtmiosq/PQqQZV1witFhc9IqiHjXLygwKodq8/HRkZ75
         7xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694875350; x=1695480150;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XiBbaTEoR4KdXzrafod1XJetgle5g3jH5UWLbf33Jow=;
        b=oBxl0Xpn9Hzfafp2l+AH/S79y5YVaDfyjFhXcM4kVbvib5tUEG9GmyCJGY8ZJbAmxB
         z5tjKcAiv9GVBl7CM+0rseCS2jbblNS0M99Yzi8VpXj9dyLsnCQzjYuYMwHZhGdoHjXU
         5zW6oqyPq+Ylo/pH/6r0lWI0DhJ22lSzT3z4hpJplryCKyWb3/CsB63851PBfJPpBwl/
         STBVQGU0SV6k8xHh+USZbpp6NACIrIxEbYqorKeGu+RMEIrCFIMtFG0R8gu5hJkj0/8Z
         ob1XnvtWxQd9IAOzz3H3Mx1nmiX0mx/txYyItaML0YpmTjNG+DqOI7yIqTNJpKNvyRBA
         jZcA==
X-Gm-Message-State: AOJu0Yy+HgStgpXBz5GECmHdGErQOVJ+4mA5wG9rZVn3vr9enm4PS48m
	/TFw5P3b6smbhN4teAyb6+E=
X-Google-Smtp-Source: AGHT+IGNS3ifciJNU0oa2YYj2ZiDBwuyHZG4A4f7b1/OjKL2Cp7J39BVWMPmrjrNkDT2kvUjVHSafg==
X-Received: by 2002:a05:6a20:2594:b0:15a:290:d833 with SMTP id k20-20020a056a20259400b0015a0290d833mr4102450pzd.53.1694875350288;
        Sat, 16 Sep 2023 07:42:30 -0700 (PDT)
Message-ID: <f0e221b3-8b81-72ca-fc6b-657b3e146fdd@gmail.com>
Date: Sat, 16 Sep 2023 23:42:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-5-andrew.cooper3@citrix.com>
 <095d4737-3728-b1c2-d64d-dc5e9b438b80@gmail.com>
 <d9b5e120-6ba4-896d-1d21-8903bb2b16c2@citrix.com>
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: Re: [PATCH 4/7] x86/pv: Drop priv_op_ctxt.bpmatch and use pending_dbg
 instead
In-Reply-To: <d9b5e120-6ba4-896d-1d21-8903bb2b16c2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/16/23 23:00, Andrew Cooper wrote:
> On 16/09/2023 8:36 am, Jinoh Kang wrote:

(snip)

>> These two hunks look like a behavioral change in singlestep mode.
>>
>> This is actually a fix, assuming the emulator previously did not handle
>> 'rep {in,out}s' in singlestep mode correctly, since it now checks for
>> PENDING_DBG.BS in addition to PENDING_DBG.B[0-4].
> 
> The emulator should handle this correctly already.  I had been meaning
> to test this, but hadn't so far - guess I should fix that.
> 
> x86_emulate.c line 511 in get_rep_prefix() sets max_reps to 1 if
> SingleStepping is active.

Thanks for informing.  Although that EFLAGS.TF check in the macro now
makes me--almost reflexively--imagine all sort of creative pathological
cases, like "mov ss, ax; rep ins"...

> 
> This in turn causes the emulator to use the io_{read,write}() hook
> rather than the rep hook.

Right.  (Frankly that part of code has too many branches to be readable.
Also the "presumably most efficient" part of the comment hints at perf
optimization sans any profiling attempts...)

> 
> This is important, because singlestepping becoming pending is normally
> evaluated at the end of the instruction.  i.e. in this example it
> wouldn't show up in pending_dbg (yet).
> 
> What definitely is broken here is the recognition of a data breakpoint
> on the memory operand of the INS/OUTS instruction, but it's broken
> everywhere else for PV guest emulation too, so needs to go on the TODO list.

(Another thing definitely broken here is the recognition of I/O breakpoints
 post the first iteration.  Maybe it would be beneficial to do differential
 testing between the {read,write}_io slowpath and rep_{in,out}s fastpath.)

> 
>> If this is the case, (at least) this part of the patch looks like a stable
>> candidate.  You might want to edit the commit message to reflect that.
> 
> We're going to try and get all the %dr6 handling issues sorted, then
> decide whether to backport the lot or not.  It will entirely depend on
> how invasive the fixes end up being, but I hope they'll be ok to backport.
> 
>> (Ideally all the HWBP handling should be part of the emulator logic, but
>>  I don't see an easy way to generalize the PV-specific logic.  It could
>>  be its own patch anyway.)
> 
> The emulator does have HWBP handling for HVM guests, because that's
> architectural behaviour to look in the TSS.

I was under such impression since I didn't immediately notice I/O
breakpoint handling in ins/outs path; maybe I haven't looked into it deeper...

> 
> PV guests are the odd-ones-out with non-standard behaviour.
> 
> ~Andrew

-- 
Sincerely,
Jinoh Kang


