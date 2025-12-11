Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549E1CB5B92
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 13:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183982.1506543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTfLL-0003lj-JE; Thu, 11 Dec 2025 12:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183982.1506543; Thu, 11 Dec 2025 12:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTfLL-0003jc-G0; Thu, 11 Dec 2025 12:00:23 +0000
Received: by outflank-mailman (input) for mailman id 1183982;
 Thu, 11 Dec 2025 12:00:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fhd1=6R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vTfLK-0003jW-D1
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 12:00:22 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7cf9dbf-d688-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 13:00:21 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-59584301f0cso15902e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 04:00:21 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2f45897sm817793e87.40.2025.12.11.04.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 04:00:19 -0800 (PST)
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
X-Inumbo-ID: f7cf9dbf-d688-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765454420; x=1766059220; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5E+qVkbbRQT13XEsiZ2eZB+34yprU7q+ZJweXmIlWs=;
        b=OccqK5lBdbISMm8wlnM+SL/8k3XcH7RaMgrU7/hWWCl40KfHD4pUcI97HTfbniQL9k
         bBhPx9q5ehqcX8sI1fw6GwTcfm4gCLJkWBqGDmkyXz56ZbAJiPZqFihwp+jlhQtFHMDs
         8TqmrUuAmUc7Y6c3kb1Xro+FsphSd61puR83UHu4enfSWzKKXZBKNmiCZ9GXgLpROUZh
         B044d7t/1FnRn6Mm5POsqyJff6XV3RIydCoWFHyAw2qIxcRoTOoKGarQx+twQ896weOk
         fUjfdX/2xfDWzzSkIksVXvD0yxS0fkHaR7oV6IuTSDVJ9zgO+oWowT2hai2Ink6Caqin
         IIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765454420; x=1766059220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5E+qVkbbRQT13XEsiZ2eZB+34yprU7q+ZJweXmIlWs=;
        b=QdaJUxghZU/jXfPag4QilN90YLjISbqh7/DJ9T9JM4ZxGVNdx9RCksYq6sJOv0M8d9
         gyWCN8gN3MrkhSFOYQ77RHcQo1KVYxn3+nO0QAHmGxp30+QEt8HK7mCLQlq4apNyXbcc
         WMjiLJkxAHz067PZOLL1xdv0cJEoY8+8awTV4A2Tv7IFhlvtDDxax/nBREgxm8j6p5U/
         fw/aQsAAqTErSRBalQ6wsyP8dAU4miFqdpj0S1DqtqvjOUgHJ2TlOfQm9m8QOcqTPni9
         LQYuqC7GvqrvzoO88PpohA7yf8cx8nG73OiaLDkX5feKBhB19ll2vz2VChvJrDlC2LW5
         Pcwg==
X-Forwarded-Encrypted: i=1; AJvYcCXXW5HSAYVaWSa7Q57nBvwqx272hKL3TgcGmjwAQWDbcS6Syi5R39N8f2EDBalHHTuWc3NRCrs3hGo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycsvszTlAvjYqiAY5NTWm1lGgfcKJRCGQAoeRgdss12f7qhcXI
	89UmUHmCI971w/QZcGKhId8fxWh2UKWcq5s5XrRHiRIAwS7V0uKzokGz
X-Gm-Gg: AY/fxX5TWoXAMxjut4IvF6ilaigEAD33H0mVbuIxhHLiY9FAHbEr6aupjkUyU8Xkvv8
	XV4JKLOp90Dz354dvq9cJL8IWhrxYGe1cQZVmGv/fygA6y+e2urQdBwFE8ZFe0VDhHsCdieKQiW
	ix9X4sypQDMEOl+ChdS3AmGHTJgJhNRy9KJprHi4rNtjVrJ5hQYstWkfg3SfyY3K+jzNkiGr4oi
	rVgv036XiSvCHwI/u4FhT6qO/tPmYlS/Zpe5Fg3OhilLwbi66+ffwbF1LJ1hjJplBIyQ/HRIOt3
	A9hb05GvHKQ8hKJNj58pHycQwa6PlkEV6mA2VjDiqRuVFSwVCrR6oVSYg1Y2ljaCLbsySt4quRD
	WoxTdyRALPAxtroguorQd3fBNC/iB1cG29Da1Zs5O+sYUxigH7rGqkLL90IoaRbFt92xVC0EoMI
	vdd/PDc29h1+xuk8dGvpGZ7ulzl8k2jBVdjDC7SqCCuIzlkAu2jt16jqxgLt0BBVdzABCkrLI=
X-Google-Smtp-Source: AGHT+IHnSgoNLgr7eJNNWgxqhfTAsNib7Ef8AC6oim8sLkydqQGxKgZyFPMVE3w10N9XxJ4jBI+fRw==
X-Received: by 2002:a05:6512:3f28:b0:594:5644:dba1 with SMTP id 2adb3069b0e04-598ee4712cfmr2027813e87.0.1765454420087;
        Thu, 11 Dec 2025 04:00:20 -0800 (PST)
Message-ID: <849f4eaf-3b45-4526-9ef1-4fb38015fdd5@gmail.com>
Date: Thu, 11 Dec 2025 13:00:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce vSBI extension framework
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
 <3b67330dc4c1aa053eb15261a559e7b4eac3f493.1764582112.git.oleksii.kurochko@gmail.com>
 <df316e2f-9eb0-4bb8-96cd-e5e0c42d123e@suse.com>
 <02b72d6f-d95b-4caf-825a-15280902af27@gmail.com>
 <a6ab2189-bf24-4384-8b28-58729c7d0d9f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a6ab2189-bf24-4384-8b28-58729c7d0d9f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/11/25 10:23 AM, Jan Beulich wrote:
> On 10.12.2025 18:03, Oleksii Kurochko wrote:
>> On 12/8/25 3:25 PM, Jan Beulich wrote:
>>> On 01.12.2025 11:24, Oleksii Kurochko wrote:
>>>> This commit introduces support for handling virtual SBI extensions in Xen.
>>>>
>>>> The changes include:
>>>> - Added new vsbi.c and vsbi.h files to implement virtual SBI extension
>>>>     handling.
>>>> - Modified traps.c to handle CAUSE_VIRTUAL_SUPERVISOR_ECALL by calling
>>>>     vsbi_handle_ecall() when the trap originates from VS-mode.
>>>> - Updated xen.lds.S to include a new .vsbi.exts section for virtual SBI
>>>>     extension data.
>>>> - Updated Makefile to include the new vsbi/ directory in the build.
>>>> - Add hstatus register to struct cpu_user_regs as it is needed for
>>>>     a check that CAUSE_VIRTUAL_SUPERVISOR_ECALL happens from VS-mode.
>>> I can spot the check, yes, but without the field ever being set how is one
>>> to determine whether that check actually makes sense?
>> But hstatus is set automatically when a trap occurs and will be copied in
>> handle_trap() in entry.S.
> Just that entry.S isn't even touched by this series. Did you perhaps omit an
> important part of the change?

Yes, it was omitted. I planned to introduce it as part of a larger update to
entry.S when jump (giving control) to guest support is implemented in the hypervisor.
Considering what is written here...

>
>> If you think it is better to introduce saving and restoring of hstatus in
>> handle_trap() now, or instead drop the handling of
>> “case CAUSE_VIRTUAL_SUPERVISOR_ECALL:” in do_trap(), please let me know.
> I think what I said above is quite clear: When you introduce a field that's
> supposed to be filled upon entry to the hypervisor, the entry code wants
> updating accordingly.

... I will prepare a patch that at least introduces the hstatus-related updates
in handle_trap() in entry.S.

>>>> --- a/xen/arch/riscv/traps.c
>>>> +++ b/xen/arch/riscv/traps.c
>>>> @@ -15,6 +15,7 @@
>>>>    #include <asm/processor.h>
>>>>    #include <asm/riscv_encoding.h>
>>>>    #include <asm/traps.h>
>>>> +#include <asm/vsbi.h>
>>>>    
>>>>    /*
>>>>     * Initialize the trap handling.
>>>> @@ -114,6 +115,13 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>>>>    
>>>>        switch ( cause )
>>>>        {
>>>> +    case CAUSE_VIRTUAL_SUPERVISOR_ECALL:
>>>> +        if ( !(cpu_regs->hstatus & HSTATUS_SPV) )
>>>> +            panic("CAUSE_VIRTUAL_SUPERVISOR_ECALL came not from VS-mode\n");
>>> This might more naturally want to be BUG_ON()? Assuming of course the value
>>> in question is exclusively under hypervisor control. Otherwise panic() would
>>> also be wrong to use here.
>> Only hypervisor can access ->hstatus (of course, hart is changing it when a trap
>> happens, for example).
>> BUG_ON() is a good option for me.
> Just to clarify: "can access" != "under control". There's also the possibility
> that a guest could do something causing the hardware to raise a
> CAUSE_VIRTUAL_SUPERVISOR_ECALL trap without setting HSTATUS_SPV. That was the
> underlying question here.

It is impossible for a guest to do something like that, because when the guest
is running it is in VS or VU mode, and when a trap is taken into HS mode the
virtualization mode V is set to 0 and ,in addition, hstatus.SPV and
sstatus.SPP are set according to the table:


Previous Mode SPV SPP
    U-mode      0   0
    HS-mode     0   1
    VU-mode     1   0
    VS-mode     1   1

(the panic() message should use “guest mode” instead of “VS mode”)

>
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/vsbi/vsbi.c
>>>> @@ -0,0 +1,46 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +
>>>> +#include <xen/sched.h>
>>>> +
>>>> +#include <asm/processor.h>
>>>> +#include <asm/sbi.h>
>>>> +#include <asm/vsbi.h>
>>>> +
>>>> +extern const struct vsbi_ext _svsbi_exts[], _evsbi_exts[];
>>>> +
>>>> +const struct vsbi_ext *vsbi_find_extension(unsigned long ext_id)
>>> static?
>> It could be use not in vsbi.c (for example, in the next patches it is used for
>> SBI_EXT_BASE_PROBE_EXT), so it shouldn't be static.
> Okay. In RISC-V that's okay as long as it's not subject to Misra scanning. Yet
> still introducing a non-static function without callers from other CUs may
> warrant a remark in the description. Once RISC-V becomes subject to Misra scans,
> such will be problematic, after all.

I will add such a remark in the commit description.

>
>>> Also, again - is the ext_ prefix adding any value here?
>> Not really, I guess.
> Maybe, to still distinguish from "fid", use "eid" here then?

Makes sense to use eid. I will apply this change.


>
>>>> +{
>>>> +    const struct vsbi_ext *vsbi_ext;
>>>> +
>>>> +    for ( vsbi_ext = _svsbi_exts; vsbi_ext != _evsbi_exts; vsbi_ext++ )
>>>> +        if ( ext_id >= vsbi_ext->eid_start &&
>>>> +             ext_id <= vsbi_ext->eid_end )
>>>> +            return vsbi_ext;
>>> What if multiple entries have overlapping EID ranges?
>> Good question, I wasn't able to find that EID is always unique in SBI spec,
>> but, at the same time, if to look at all available extensions and their id(s),
>> they are always unique, so I expect that they will be always unique, otherwise,
>> it won't be possible which extension should be used.
> Then should there be a build-time (or if that's not easily possible, boot-
> time) check?

Considering that the .vsbi.ext section is filled dynamically, I think it would
be quite difficult to perform a build-time check without writing an additional
script to parse the .vsbi.ext entries and verify that there are no overlaps,
which seems excessive.

A boot-time check is much easier.

>
>>>> +void vsbi_handle_ecall(struct vcpu *vcpu, struct cpu_user_regs *regs)
>>>> +{
>>>> +    const unsigned long eid = regs->a7;
>>>> +    const unsigned long fid = regs->a6;
>>>> +    const struct vsbi_ext *ext = vsbi_find_extension(eid);
>>>> +    int ret;
>>>> +
>>>> +    if ( ext && ext->handle )
>>>> +        ret = ext->handle(vcpu, eid, fid, regs);
>>> Is a registration record NULL handler pointer actually legitimate / useful?
>>> (If there was range overlap checking I could see a reason to permit such.)
>> it is a good question, I think ext->handle = NULL should be impossible. At
>> least, at the moment I can't come up with the case where it is possible and
>> what will be a use case. I will drop ext->handle check.
>>
>>>> +    else
>>>> +    {
>>>> +        printk("Unsupported Guest SBI EID #%#lx, FID #%lu\n", eid, regs->a1);
>>> Are the #-es ahead of the %-s adding value here?
>> It is how SBI spec writes them. For example,
>>    9. Hart State Management Extension (EID #0x48534D "HSM") . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
>>    9.1. Function: Hart start (FID #0) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
>>
>> So I thought that it would help to find stuff faster.
> Okay. Maybe mention such in the description?

Sure, but I think a comment above printk() will be enough.

~ Oleksii


