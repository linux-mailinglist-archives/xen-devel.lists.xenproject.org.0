Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005F97A30C9
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 16:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603602.940649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhVqS-0006WE-Qa; Sat, 16 Sep 2023 14:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603602.940649; Sat, 16 Sep 2023 14:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhVqS-0006Tb-N9; Sat, 16 Sep 2023 14:00:24 +0000
Received: by outflank-mailman (input) for mailman id 603602;
 Sat, 16 Sep 2023 14:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTkj=FA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qhVqQ-0006TS-NO
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 14:00:22 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f99570b-5499-11ee-9b0d-b553b5be7939;
 Sat, 16 Sep 2023 16:00:20 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-52bd9ddb741so3773592a12.0
 for <xen-devel@lists.xenproject.org>; Sat, 16 Sep 2023 07:00:20 -0700 (PDT)
Received: from [192.168.1.10] (host-92-12-44-130.as13285.net. [92.12.44.130])
 by smtp.gmail.com with ESMTPSA id
 bq14-20020a170906d0ce00b0099ddc81903asm3782205ejb.221.2023.09.16.07.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Sep 2023 07:00:19 -0700 (PDT)
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
X-Inumbo-ID: 5f99570b-5499-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694872820; x=1695477620; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YkOCQGhod07bdR5p9eLW+VGCI29v6mssx/4CABwWhXw=;
        b=pug6hkRniqovsnAjN0MLpEeCZnb6G1SxJJx+q8kPqBT4uuMhQdBq3H2YT2GGBp6IPM
         66EcyhtMD5UO6a0kZWGrwNKEgFfW5RuuyaHbOijYejR2M5DLP36Jm3J/zQ/Jac0Hcxzb
         OsbjPmHwyEAbIv/ZK7MqwuvQnO4dvgAANkVbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694872820; x=1695477620;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YkOCQGhod07bdR5p9eLW+VGCI29v6mssx/4CABwWhXw=;
        b=AlxTfB+HU97mJVlH2C6bN+24XMlbB9/wrnQamfpe+y8qVnxlT0gwHsgkgwGFq5rRZY
         iNK3XkyTxGEt4glDHjl+9ZhjEzygU4ckdj8tjwlkRjfwte4KntUMJ6aLzia0wmSe5rMN
         uhdXn1fec0PN9kP3uQ5bsCPRoLbYdEu/eu67i36ftyZL4IBYbkdZ4aGNeXyj0Nq0k8M2
         Ai/BuT9euN496Qc2g3Bi3AZSpXGHim6DnxyAbS01HJaYlkL2Qh7zU3D4DB7baUl/QZyT
         2fU/k6NxI7Otu7ZsNPXU7yjVTjrEf/CB2EH5KvKguYWi9RpGDCZPQGJoyydQu3GG/Eew
         Uang==
X-Gm-Message-State: AOJu0YxEGy7/C5VY37BQTjtNBsNTNLmQPks5N5Znm1APDDndx6o7j22c
	gKi8sUWm9adLCuHg8Udnxwopyg==
X-Google-Smtp-Source: AGHT+IEMLWsFffXjLaEyW+Whp7/IOs7NnfpkMeH7X0bdp2AcnZmtgnkDl1Boz+9cCtZu2ocgSAOSaw==
X-Received: by 2002:a17:906:19:b0:9ad:e351:28bb with SMTP id 25-20020a170906001900b009ade35128bbmr2252483eja.29.1694872820124;
        Sat, 16 Sep 2023 07:00:20 -0700 (PDT)
Message-ID: <d9b5e120-6ba4-896d-1d21-8903bb2b16c2@citrix.com>
Date: Sat, 16 Sep 2023 15:00:19 +0100
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
In-Reply-To: <095d4737-3728-b1c2-d64d-dc5e9b438b80@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/09/2023 8:36 am, Jinoh Kang wrote:
> On 9/16/23 05:36, Andrew Cooper wrote:
>> @@ -658,7 +660,7 @@ static int cf_check rep_ins(
>>  
>>          ++*reps;
>>  
>> -        if ( poc->bpmatch || hypercall_preempt_check() )
>> +        if ( poc->ctxt.retire.pending_dbg || hypercall_preempt_check() )
>>              break;
>>  
>>          /* x86_emulate() clips the repetition count to ensure we don't wrap. */
> (snip)
>
>> @@ -726,7 +729,7 @@ static int cf_check rep_outs(
>>  
>>          ++*reps;
>>  
>> -        if ( poc->bpmatch || hypercall_preempt_check() )
>> +        if ( poc->ctxt.retire.pending_dbg || hypercall_preempt_check() )
>>              break;
>>  
>>          /* x86_emulate() clips the repetition count to ensure we don't wrap. */
> These two hunks look like a behavioral change in singlestep mode.
>
> This is actually a fix, assuming the emulator previously did not handle
> 'rep {in,out}s' in singlestep mode correctly, since it now checks for
> PENDING_DBG.BS in addition to PENDING_DBG.B[0-4].

The emulator should handle this correctly already.  I had been meaning
to test this, but hadn't so far - guess I should fix that.

x86_emulate.c line 511 in get_rep_prefix() sets max_reps to 1 if
SingleStepping is active.

This in turn causes the emulator to use the io_{read,write}() hook
rather than the rep hook.

This is important, because singlestepping becoming pending is normally
evaluated at the end of the instruction.  i.e. in this example it
wouldn't show up in pending_dbg (yet).

What definitely is broken here is the recognition of a data breakpoint
on the memory operand of the INS/OUTS instruction, but it's broken
everywhere else for PV guest emulation too, so needs to go on the TODO list.

> If this is the case, (at least) this part of the patch looks like a stable
> candidate.  You might want to edit the commit message to reflect that.

We're going to try and get all the %dr6 handling issues sorted, then
decide whether to backport the lot or not.  It will entirely depend on
how invasive the fixes end up being, but I hope they'll be ok to backport.

> (Ideally all the HWBP handling should be part of the emulator logic, but
>  I don't see an easy way to generalize the PV-specific logic.  It could
>  be its own patch anyway.)

The emulator does have HWBP handling for HVM guests, because that's
architectural behaviour to look in the TSS.

PV guests are the odd-ones-out with non-standard behaviour.

~Andrew

