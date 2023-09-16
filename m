Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A55287A315F
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 18:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603626.940688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhXzu-0001aG-U0; Sat, 16 Sep 2023 16:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603626.940688; Sat, 16 Sep 2023 16:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhXzu-0001XX-Qn; Sat, 16 Sep 2023 16:18:18 +0000
Received: by outflank-mailman (input) for mailman id 603626;
 Sat, 16 Sep 2023 16:18:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTkj=FA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qhXzt-0001XA-9y
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 16:18:17 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3a2312b-54ac-11ee-8788-cb3800f73035;
 Sat, 16 Sep 2023 18:18:15 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9ad8bba8125so408753766b.3
 for <xen-devel@lists.xenproject.org>; Sat, 16 Sep 2023 09:18:15 -0700 (PDT)
Received: from [192.168.1.10] (host-92-12-44-130.as13285.net. [92.12.44.130])
 by smtp.gmail.com with ESMTPSA id
 eu22-20020a170907299600b009adca8ada29sm2610411ejc.47.2023.09.16.09.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Sep 2023 09:18:14 -0700 (PDT)
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
X-Inumbo-ID: a3a2312b-54ac-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694881095; x=1695485895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U/o43Ty3aOYxFdf8q4FiS9JR1YBAHVgvyHY0uiEeQUs=;
        b=lmkelTk3nAx2Soikys8pb1tI5/6E8gfJJJFJAXULgwFJbKJSPEnXzXDfXLEKMlxgO9
         HH6macrZcCrvaSa7YYR5+P1/llX23S8aLoYBeOVHqt3q+d9edBKPK/M+aZrrw3dn5jr9
         +oackOZBaC/M9HVedXX4wkJD56f7iBVyx5K5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694881095; x=1695485895;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/o43Ty3aOYxFdf8q4FiS9JR1YBAHVgvyHY0uiEeQUs=;
        b=p8By4/kXHJDz417bmOUQJXr606DkBWEyLmJPBqTIHsnmZwB95JYKB1nC+noWI7F9je
         RRJ+phBOfk/qFJ+MeRqxonLQfL44T0rxp+TXsLph28RA7lp4PjvFHGwq1MfdLGZmoYGL
         5JI/RxFtZSCcnhj+djYj0Mx5CY/a6KGRe5xhAagg6PbiGZ68jNsw6bRqvjISFpXqsRUZ
         HX/XkM2yF1xeyRKScsyZnuvhOt3LgHu5YdWzKm6mm5KiIK/lvZCVZJEdL5Q84Hvpi8h9
         ot3XeSh1oPLBp2esVDaXf5ycL8oB2YYtWtBUtu8ZT3Z9b6EZJ2iErCLa7+6sH7rwNTdX
         Yw2Q==
X-Gm-Message-State: AOJu0Yxv05dq+tei7sDzXOW/DsNu+qzYV2ikiWE4Ot8W385UDacfMfkN
	w7HPBE8jHVWaBF7BUSzoFai56w==
X-Google-Smtp-Source: AGHT+IFeo9jKZR1onB5O7MRz+zFzNh/AGH8G09+sa99TLdKwTR4mEPcGGFbi2toYMgYMzj38IHqHiQ==
X-Received: by 2002:a17:907:2c59:b0:9a1:f10d:9751 with SMTP id hf25-20020a1709072c5900b009a1f10d9751mr4272997ejc.23.1694881094700;
        Sat, 16 Sep 2023 09:18:14 -0700 (PDT)
Message-ID: <9d6f81da-cad3-1627-b503-23cb59615540@citrix.com>
Date: Sat, 16 Sep 2023 17:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/7] x86/pv: Drop priv_op_ctxt.bpmatch and use pending_dbg
 instead
Content-Language: en-GB
To: Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-5-andrew.cooper3@citrix.com>
 <095d4737-3728-b1c2-d64d-dc5e9b438b80@gmail.com>
 <d9b5e120-6ba4-896d-1d21-8903bb2b16c2@citrix.com>
 <f0e221b3-8b81-72ca-fc6b-657b3e146fdd@gmail.com>
In-Reply-To: <f0e221b3-8b81-72ca-fc6b-657b3e146fdd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/09/2023 3:42 pm, Jinoh Kang wrote:
> On 9/16/23 23:00, Andrew Cooper wrote:
>> On 16/09/2023 8:36 am, Jinoh Kang wrote:
> (snip)
>
>>> These two hunks look like a behavioral change in singlestep mode.
>>>
>>> This is actually a fix, assuming the emulator previously did not handle
>>> 'rep {in,out}s' in singlestep mode correctly, since it now checks for
>>> PENDING_DBG.BS in addition to PENDING_DBG.B[0-4].
>> The emulator should handle this correctly already.  I had been meaning
>> to test this, but hadn't so far - guess I should fix that.
>>
>> x86_emulate.c line 511 in get_rep_prefix() sets max_reps to 1 if
>> SingleStepping is active.
> Thanks for informing.  Although that EFLAGS.TF check in the macro now
> makes me--almost reflexively--imagine all sort of creative pathological
> cases, like "mov ss, ax; rep ins"...

Yeah isn't x86 fun...

That's why it's important to accumulate in pending_dbg, which does hold
the breakpoint recognition across point where the blocked-by-movss state
inhibits the generation of #DB, and causes it to generate #DB on the
subsequent instruction boundary.

>> This in turn causes the emulator to use the io_{read,write}() hook
>> rather than the rep hook.
> Right.  (Frankly that part of code has too many branches to be readable.
> Also the "presumably most efficient" part of the comment hints at perf
> optimization sans any profiling attempts...)

Yeah it's not the greatest code.  I cant remember the exact history
there, but IIRC we used to handle the rep looping entirely in
x86_emulate() and there were no rep hooks.

There are two cases where the perf hit did get noticed.  REP OUTSB to
the qemu/bochs/Xen debug port, and Windows which does a REP MOVSB across
the various bits of PCI MMIO.

>> This is important, because singlestepping becoming pending is normally
>> evaluated at the end of the instruction.  i.e. in this example it
>> wouldn't show up in pending_dbg (yet).
>>
>> What definitely is broken here is the recognition of a data breakpoint
>> on the memory operand of the INS/OUTS instruction, but it's broken
>> everywhere else for PV guest emulation too, so needs to go on the TODO list.
> (Another thing definitely broken here is the recognition of I/O breakpoints
>  post the first iteration.  Maybe it would be beneficial to do differential
>  testing between the {read,write}_io slowpath and rep_{in,out}s fastpath.)

PV, or HVM guest?

IO breakpoint recognition is missing generally in HVM guests.  I opened
https://gitlab.com/xen-project/xen/-/work_items/171 yesterday for it,
because it's not 30s work to fix.

But, IO breakpoints are invariant of REP.  The IO port doesn't change,
so the breakpoint(s) either match on every iteration, or not at all. 
(Of course, this doesn't mean that Xen is handling the recognition
correctly.)

In this patch, there is IO breakpoint recognition on all 4 of the PV IO
port hooks, so I think it ought to work properly, whether it's the first
iteration or not.

Obviously if not, I've got another bug to figure out...


It's worth saying that patch 2 does fix a bug (an X86EMUL_OKAY/DONE
confusion), but I'm pretty sure it was only a singlestep on admin-ok PV
IO ports which would be skipped, not the breakpoints.

~Andrew

