Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49838C36DF
	for <lists+xen-devel@lfdr.de>; Sun, 12 May 2024 16:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720582.1123543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6AUk-0000gk-UV; Sun, 12 May 2024 14:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720582.1123543; Sun, 12 May 2024 14:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6AUk-0000eC-Rn; Sun, 12 May 2024 14:48:10 +0000
Received: by outflank-mailman (input) for mailman id 720582;
 Sun, 12 May 2024 14:48:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZUm/=MP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s6AUj-0000e6-OU
 for xen-devel@lists.xenproject.org; Sun, 12 May 2024 14:48:09 +0000
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [2607:f8b0:4864:20::835])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a549f764-106e-11ef-909d-e314d9c70b13;
 Sun, 12 May 2024 16:48:08 +0200 (CEST)
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-43cff222427so17277071cf.3
 for <xen-devel@lists.xenproject.org>; Sun, 12 May 2024 07:48:08 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df54da2d3sm44613731cf.27.2024.05.12.07.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 May 2024 07:48:06 -0700 (PDT)
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
X-Inumbo-ID: a549f764-106e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715525287; x=1716130087; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lOImqBUuSz91DharMd8kZr0C/2tEUjAPixNxKnsR+u4=;
        b=ohXKn84XJ6J/53DLDVBIPswoDcI9i14hMbLvJgAg/PXvFdhfOXFvMA5HQvF7KbRrsG
         IAmZOqZd2/4UlyBobE0o3XgeH+56yTONbpSbo1VsX6zATA0TQvGIC204pjUf8oiTS98A
         HhlRaBxXCnLdWLMaqaqdiC/RBCsAav/7rW1ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715525287; x=1716130087;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOImqBUuSz91DharMd8kZr0C/2tEUjAPixNxKnsR+u4=;
        b=HYiTtfAld2HrHVWhEDLYp34UUEpluXCHo8kmF5mMM27R0Ah6DIgSxKrMRSRzGC4TXz
         MELcFQR0mfA3J559F77NM3p5VvT0xhV5NC1sKplL4t1JkHEP19wP1FQBfTK/+p41oC2/
         jx9XqNKp+7rvRAOsZefYIBC/7hpNQDMPcPM1FAxoUPVgJQ880X4dlCsycVJ/eiy3Sdhv
         fbCizbrz7sPn7mwuyrzuLhN42SgYDsJQG+jJ0u/5jBkgp4fI/9rgVg8nxrn18WO1uLAm
         Yk5NmwMjRwuI8BW9jWOAIZTX9MtEabp1duTJ5e22DIwM+DDuEfkbqIhVln6NCx5m+d5l
         7gxA==
X-Forwarded-Encrypted: i=1; AJvYcCU5tmmW4M+qW83pkUAI1z8gb+FkUFkBdCOmqCZjAmYsygm9fnNX4m2ca61ZK5ClMtKNscMM5alCwTA0nTGQPyhqup8OHpwgIaZ4OIylOUc=
X-Gm-Message-State: AOJu0YwgOsyt0w4oCbpk7LDAYSZ78Tw49vkfkYNMa3VuJZDbzNDRy0Ds
	NNXVMzDFCJRJNGFijoAJLyStbbYrTvc5OlJPHHylwfbc8qynSiSNq4tuYm7TvR1yWQ83NSwlnge
	u
X-Google-Smtp-Source: AGHT+IFASHmDzLJCUOJgho0HwTJCmjxbHz5ePKcnzkVo6AhZ/gu7NnO4zccBUPzWweeP8Welpl+Esg==
X-Received: by 2002:a05:622a:447:b0:43a:bec1:37c with SMTP id d75a77b69052e-43dfdd4b54bmr114718271cf.66.1715525287211;
        Sun, 12 May 2024 07:48:07 -0700 (PDT)
Message-ID: <653ba4f5-dc1e-48b9-9833-35b47bfc5fc4@citrix.com>
Date: Sun, 12 May 2024 15:48:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux HVM fails to start with PANIC: early exception 0x00 IP
 0010:clear_page_orig+0x12/0x40 error 0
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <ZkAmdiHI-DfUMiOV@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZkAmdiHI-DfUMiOV@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/05/2024 3:16 am, Marek Marczykowski-Górecki wrote:
> Hi,
>
> I've got a report[1] that after some update Linux HVM fails to start with the
> error as in the subject. It looks to be caused by some change between
> Xen 4.17.3 and 4.17.4. Here the failure is on Linux 6.6.25 (both dom0
> and domU), but the 6.1.62 that worked with older Xen before, now fails
> too. The full error (logged via earlyprintk=xen) is:
>
>     [    0.009500] Using GB pages for direct mapping
>     PANIC: early exception 0x00 IP 10:ffffffffb01c32e2 error 0 cr2 0xffffa08649801000
>     [    0.009606] CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.25-1.qubes.fc37.x86_64 #1
>     [    0.009665] Hardware name: Xen HVM domU, BIOS 4.17.4 04/26/2024
>     [    0.009710] RIP: 0010:clear_page_orig+0x12/0x40
>     [    0.009766] Code: 84 00 00 00 00 00 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 31 c0 b9 40 00 00 00 0f 1f 44 00 00 ff c9 <48> 89 07 48 89 47 08 48 89 47 10 48 89 47 18 48 89 47 20 48 89 47
>     [    0.009862] RSP: 0000:ffffffffb0e03d58 EFLAGS: 00010016 ORIG_RAX: 0000000000000000
>     [    0.009915] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000000000003f
>     [    0.009967] RDX: 0000000000009801 RSI: 0000000000000000 RDI: ffffa08649801000
>     [    0.010015] RBP: 0000000000000001 R08: 0000000000000001 R09: 6b7f283562d74b16
>     [    0.010063] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
>     [    0.010112] R13: 0000000000000000 R14: ffffffffb0e22a08 R15: ffffa08640000000
>     [    0.010161] FS:  0000000000000000(0000) GS:ffffffffb16ea000(0000) knlGS:0000000000000000
>     [    0.010214] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     [    0.010257] CR2: ffffa08649801000 CR3: 0000000008e80000 CR4: 00000000000000b0
>     [    0.010310] Call Trace:
>     [    0.010341]  <TASK>
>     [    0.010372]  ? early_fixup_exception+0xf7/0x190
>     [    0.010416]  ? early_idt_handler_common+0x2f/0x3a
>     [    0.010460]  ? clear_page_orig+0x12/0x40
>     [    0.010501]  ? alloc_low_pages+0xeb/0x150
>     [    0.010541]  ? __kernel_physical_mapping_init+0x1d2/0x630
>     [    0.010588]  ? init_memory_mapping+0x83/0x160
>     [    0.010631]  ? init_mem_mapping+0x9a/0x460
>     [    0.010669]  ? memblock_reserve+0x6d/0xf0
>     [    0.010709]  ? setup_arch+0x796/0xf90
>     [    0.010748]  ? start_kernel+0x63/0x420
>     [    0.010787]  ? x86_64_start_reservations+0x18/0x30
>     [    0.010828]  ? x86_64_start_kernel+0x96/0xa0
>     [    0.010868]  ? secondary_startup_64_no_verify+0x18f/0x19b
>     [    0.010918]  </TASK>
>
> I'm pretty sure the exception 0 is misleading here, I don't see how it
> could be #DE.
>
> More logs (including full hypervisor log) are attached to the linked
> issue.
>
> This is on HP 240 g7, and my educated guess is it's Intel Celeron N4020
> CPU. I cannot reproduce the issue on different hardware.
>
> PVH domains seems to work.
>
> Any ideas what could have happened here?

Yes.

Revert the microcode back to revision 0x38 for now.

~Andrew

