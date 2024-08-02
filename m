Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF30945BF6
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 12:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770921.1181508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZpQq-0002qK-25; Fri, 02 Aug 2024 10:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770921.1181508; Fri, 02 Aug 2024 10:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZpQp-0002oZ-V2; Fri, 02 Aug 2024 10:22:43 +0000
Received: by outflank-mailman (input) for mailman id 770921;
 Fri, 02 Aug 2024 10:22:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=14L3=PB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZpQo-0002oT-D3
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 10:22:42 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25f2f8e5-50b9-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 12:22:40 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52efc60a6e6so12418878e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 03:22:41 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba11068sm191137e87.117.2024.08.02.03.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 03:22:39 -0700 (PDT)
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
X-Inumbo-ID: 25f2f8e5-50b9-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722594160; x=1723198960; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yCgYY/I2udiFa4xahad1Th6VvBrGEt9FEZKr9uWxXLM=;
        b=dYjTtnxTsEZuxd2goaV/2BlJ6tPvM1dBIRkrIP+OwkRmu5LKdN/jWa7UTiuWNun8qK
         HW3USkjVhu9n5hzGLlL74DL5NiwJbPg6Zw8e1aU4GH9ch/fwiLYLO/fSGeM6wwOAy38h
         RTGa2ayGMHl0wVIRyPjauq+cD2sTPaWwWKxo/UZHipNWIQn8mHyprHMQg7j1Ns5Mscq2
         z0wwdaw/HuJpHq2TYHtNaqNw62qmOmfAHL5TueG9z4E3p91U/iwpgfOf4KRP7qJ4+tFq
         GZ0F/5a3HCkhpqpqBUOdHRlnDNEgz/0UhCghJKIvrg9yKRuH1FlRKgaCA9vK4IJxtO2+
         t/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722594160; x=1723198960;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yCgYY/I2udiFa4xahad1Th6VvBrGEt9FEZKr9uWxXLM=;
        b=PHN9w1Aw1Xo9SnVTrqZ0W4NH9ZjwMrrOf0HuZJ6PnASUjKCV1cccsCUWMe9nqP8wDZ
         CiXGJy50Z5Smn8cPaW/52k0k2u1ZqQGw3XVYtDnA55C5rxml4JFy4Mmt836pIzxDawHl
         k1+ehitmd4f/EQr6MIil98ZqMRZzTE6xW3iilKBowowoM0LZElHGAKh2NTFxAJnODxXB
         yvpMXaXwMc68nhHwFBqPe7M05m/T9Hk7TpYrU0mbXRKTB6kYsG0tLqvUXgyBVHg/5W4g
         KgYm0slq2Ov68d/O/c/oqfKnyH6KP4uQx6nw5vsmSiDMhy6mQ54DTvpFc5sLfeY/9caZ
         6k2w==
X-Gm-Message-State: AOJu0YzS3FCsKJScZwQw3se0lCvvuY5oETvjbHmXmas2CYqRPLiaBaOt
	9NKH7/yg4xiNxTbHiZx8Tfj2nGdkQB8NnKOcrM+46X+FCv0bdgLGTQvL+g==
X-Google-Smtp-Source: AGHT+IFOUpNvc8PW8nPp/7eyiCfaW/4Au2IiKGzHI/kJ55VQqxs1eHKmwKxHsmRNxVAs+o2opFigkg==
X-Received: by 2002:a05:6512:2389:b0:52e:9ecd:3465 with SMTP id 2adb3069b0e04-530bb3b1891mr1990296e87.57.1722594160060;
        Fri, 02 Aug 2024 03:22:40 -0700 (PDT)
Message-ID: <a16ac4cd3fe0143e40f8b5ec993cd6049d41ea3d.camel@gmail.com>
Subject: Re: [PATCH v11 4/5] xen/riscv: enable GENERIC_BUG_FRAME
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Date: Fri, 02 Aug 2024 12:22:39 +0200
In-Reply-To: <83e20f26-ae59-4191-a12d-f31f779c91e2@suse.com>
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
	 <b79bcfb9031564fc8d275af66fa94c1e82e54de2.1721731887.git.oleksii.kurochko@gmail.com>
	 <7c03ed78-7c80-45bf-acf3-a916b7abb7d5@suse.com>
	 <6c379c6a0ac3e046c67647fa63d085a341906224.camel@gmail.com>
	 <83e20f26-ae59-4191-a12d-f31f779c91e2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-08-02 at 11:21 +0200, Jan Beulich wrote:
> On 02.08.2024 11:14, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Mon, 2024-07-29 at 15:00 +0200, Jan Beulich wrote:
> > > > To have working BUG(), WARN(), ASSERT,
> > > > run_in_exception_handler()
> > > > it is needed to enable GENERIC_BUG_FRAME.
> > > >=20
> > > > ebreak is used as BUG_insn so when macros from <xen/bug.h> are
> > > > used, an exception with BREAKPOINT cause will be generated.
> > > >=20
> > > > ebreak triggers a debug trap, which starts in debug mode and is
> > > > then filtered by every mode. A debugger will first handle the
> > > > debug trap and check if ebreak was set by it or not. If not,
> > > > CAUSE_BREAKPOINT will be generated for the mode where the
> > > > ebreak
> > > > instruction was executed.
> > >=20
> > > Here and in the similar code comment you talk about an external
> > > debugger, requiring debug mode, which is an optional feature. In
> > > my earlier comments what I was referring to was pure software
> > > debugging. I continue to fail to see how properly distinguishing
> > > ebreak uses for breakpoints from ebreak uses for e.g. BUG() and
> > > WARN() is going to be feasible.
> > GDB keeps track of what addresses it has breakpoints at.
>=20
> Of course it does. But in Xen how do you decide whether to trigger
> the debugger when you've hit an ebreak? (Just to repeat, my question
> is about the purely software debugging case; no hardware debugging
> extensions. In such a case, aiui, Xen gains control first and then
> decides whether to trigger the debugger, or whether to handle the
> exception internally. Sure, none of this infrastructure is in place
> right now, but imo it wants taking into consideration.)
Well, then something like KGDB is needed for Xen and mechanism to
notify guests to something similar to:

Right now Xen detects that 'ebreak' is inserted by using the function
do_bug_frame():
```
    case CAUSE_BREAKPOINT:
        if ( do_bug_frame(cpu_regs, pc) >=3D 0 )
        {
            if ( !(is_kernel_text(pc) || is_kernel_inittext(pc)) )
            {
                printk("Something wrong with PC: %#lx\n", pc);
                die();
            }

            cpu_regs->sepc +=3D GET_INSN_LENGTH(*(uint16_t *)pc);
        }
```

So if do_bug_frame() return < 0 then it should be ebreak inserted by
the debugger so need to notify GDB that he should handle that.
At the moment I think we can add():
```
        if ( do_bug_frame(cpu_regs, pc) >=3D 0 )
        {
		...

            cpu_regs->sepc +=3D GET_INSN_LENGTH(*(uint16_t *)pc);
        }
	else
	{
	    printk("this is not Xen's ebreak\n");
            die();
        }
```

Probably, to have the message is enough ( "this is not Xen's ebreak\n"
):
```
        if ( do_bug_frame(cpu_regs, pc) >=3D 0 )
        {
		...
        }
	else
	    printk("this is not Xen's ebreak\n");

        cpu_regs->sepc +=3D GET_INSN_LENGTH(*(uint16_t *)pc);
```

>=20
> > And if QEMU is being used, GDB isn't actually inserting ebreak
> > instructions because QEMU has an infinite amount of "hardware"
> > breakpoints.
> >=20
> > If it answers your original question I could add this to commit
> > message/code in the next patch version.
>=20
> I'm afraid it still doesn't.
So if we are speaking about the case QEMU + GDB then no ebreak
instruction will be inserted. So what happens is:
1. QEMU notices PC hits breakpoint ( "hardware" breakpoints are used +
GDB keeps track of what addresses it has breakpoints at )
2. QEMU tells GDB that the program received SIGTRAP
3. GDB does debugger tasks.

In case of real hardware it will be JTAG and OpenOCD to interface with
it and GDB will use OpenOCD for debugging purpose which follows RISC-V
debug spec and everything will work as I described in the commit
message/code.

Or it could be still without external h/w debugger ( using ebreak
instruction ) but then hypervisor should have an infrastrucutre to
notify GDB that a breakpoint is hited ( something like KGDB in Linux
kernel ) and for this case we will print the message mentioned above (
+ stop Xen if it is necessary )

~ Oleksii


