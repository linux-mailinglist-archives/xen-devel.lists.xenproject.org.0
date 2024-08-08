Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB46A94BFEB
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 16:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774343.1184808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc4Lz-0000iX-E0; Thu, 08 Aug 2024 14:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774343.1184808; Thu, 08 Aug 2024 14:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc4Lz-0000gT-9R; Thu, 08 Aug 2024 14:42:59 +0000
Received: by outflank-mailman (input) for mailman id 774343;
 Thu, 08 Aug 2024 14:42:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5uN=PH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sc4Lx-0000gM-H0
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 14:42:57 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f4cd8d5-5594-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 16:42:55 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-428f5c0833bso12436725e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429059719ebsm78438585e9.18.2024.08.08.07.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 07:42:54 -0700 (PDT)
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
X-Inumbo-ID: 7f4cd8d5-5594-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723128175; x=1723732975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jv9gb3TPJoZtfBTwu5KhtnLtJz/V1TQePAfnqZ3cjz0=;
        b=N5mIxm8wB+W8+b/xrFL7dS20E7o+pziLElJENwzBhsGOFKRhIj2FtiXpb9ZZmAlZ4O
         OJ/91+fnNGQ25lbY+ey1dnvDusKA3SIjvQQJIVhaNEgd8QL+jLXr/Hn+xunecErOsOno
         dwb4AOpuVdLQ6gokTWhJ7+iMZUElfV1hiTIMVtSC0DdCyF7ha/veauIZsBjk8X9H8mS4
         817UCtjmVcaeNiYS0j4NKlWaTll4pmDNadVKywc+ly21EgB549um+I0Xaxy5ZKQA5SAn
         f23WOjTncL9ifAiQUdE+q4vuSy1DIT2kVQu3hDAex7dCA8k2C3cmWegn+45PCEyYu6SM
         /HPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128175; x=1723732975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jv9gb3TPJoZtfBTwu5KhtnLtJz/V1TQePAfnqZ3cjz0=;
        b=Cvxwba0zgmR4Q+3YymvrurV5vf8ZHbGtKUSCFNi4jozjcqORkps3fDH723GmzVZ1pb
         wKTRYMKEHdN8O36lKTNPgE7pkBp8LlDCYhGPdcZABppEY+kXrfyhJG7I5bYTN+us/mUo
         0hkjbipon4oarC/ksMC8RyYDIE8Eu2EwlAHfOhzk3kF5SVUa3WnciG+4PcXlYgI+37LR
         5F7vPQaQ3cYloK04kxEtdmESGp2pwlj6cXNc9oWKRYBhUfaYKBSt/wnPzIjKbYNQDHdP
         g9f5V/zVcuLBx6TS7A5uHFbQxXiI2c2tjyNgkaGybbPeetiGnpohr6LRIQ56PUEvENMz
         oGJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGoSnh0bxiJIbaewqG4iPljrTgGqnx3T+kX5/XO/T7vIRBX3aWyvEbCcNOOxYHXd172vHvf1sGOOWNSxPg9QBlCxaIz4H96q5WpuMEFtE=
X-Gm-Message-State: AOJu0YwSdEYuPuE0t+SrJ9nBREBHpIGEDUNSaZgeBzI+t+WraFj6MUmV
	9E5j5mipzAcwQus51UUQTy7QQxVfY5bGii7pDyqwCUZYxHrHj39UItVZfxY5dpc=
X-Google-Smtp-Source: AGHT+IGfHetkju187eiWx/ciHnZOqqXfWCLQz3E6ZDrUpHQOpzLG8ZnfGN6zwAylwTHSvHr33bT8Fw==
X-Received: by 2002:a05:6000:e08:b0:362:4679:b5a with SMTP id ffacd0b85a97d-36d2815552dmr1988101f8f.16.1723128174493;
        Thu, 08 Aug 2024 07:42:54 -0700 (PDT)
Message-ID: <5389eb85-873c-4ae2-a916-6fdd0e5b496d@suse.com>
Date: Thu, 8 Aug 2024 16:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen: tolerate ACPI NVS memory overlapping with Xen
 allocated memory
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20240807104110.18117-1-jgross@suse.com>
 <20240807104110.18117-6-jgross@suse.com>
 <90d67e10-6e35-487e-a9e7-611a0fa3b00b@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <90d67e10-6e35-487e-a9e7-611a0fa3b00b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.08.24 14:05, Jan Beulich wrote:
> On 07.08.2024 12:41, Juergen Gross wrote:
>> In order to minimize required special handling for running as Xen PV
>> dom0, the memory layout is modified to match that of the host. This
>> requires to have only RAM at the locations where Xen allocated memory
>> is living. Unfortunately there seem to be some machines, where ACPI
>> NVS is located at 64 MB, resulting in a conflict with the loaded
>> kernel or the initial page tables built by Xen.
>>
>> As ACPI NVS needs to be accessed by the kernel only for saving and
>> restoring it across suspend operations, it can be relocated in the
>> dom0's memory map by swapping it with unused RAM (this is possible
>> via modification of the dom0 P2M map).
> 
> While the kernel may not (directly) need to access it for other purposes,
> what about AML accessing it? As you can't advertise the movement to ACPI,
> and as non-RAM mappings are carried out by drivers/acpi/osl.c:acpi_map()
> using acpi_os_ioremap(), phys-to-machine translations won't cover for
> that (unless I'm overlooking something, which unfortunately seems like I
> might be).

Seems I need to hook into acpi_os_ioremap() in order to handle that case.

> Even without that I wonder in how far tools (kexec?) may be misguided by
> relocating non-RAM memory ranges. Even more so when stuff traditionally
> living below the 4G boundary suddenly moves far beyond that.

I don't think kexec is working in PV mode.

Other tools: time will tell, I guess. I prefer a generally working system
with maybe some tools failing over one not booting at all.

The only other general solution I could think of would be something similar
to vmlinuz on bare metal: a "small" boot code looking for an appropriate
location for the kernel and then relocating the "real" kernel accordingly.
This would require quite some effort, though, as the boot code would need
to create the related page tables and p2m table, too. I'd like to avoid
that.


Juergen

