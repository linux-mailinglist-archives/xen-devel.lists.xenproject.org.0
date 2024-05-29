Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D778D35C5
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 13:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731826.1137549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCHm1-0004uf-0z; Wed, 29 May 2024 11:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731826.1137549; Wed, 29 May 2024 11:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCHm0-0004t4-UL; Wed, 29 May 2024 11:47:16 +0000
Received: by outflank-mailman (input) for mailman id 731826;
 Wed, 29 May 2024 11:47:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U3iI=NA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sCHly-0004sy-S0
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 11:47:14 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fd72bb4-1db1-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 13:47:12 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57a033c2e9fso1013748a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 04:47:12 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c93d38esm715595566b.90.2024.05.29.04.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 04:47:11 -0700 (PDT)
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
X-Inumbo-ID: 2fd72bb4-1db1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716983232; x=1717588032; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/Psd25rW2y4rli4LwsJaW87kPft2OszbH0V2yg3gwc=;
        b=E6oCTbHXTSSU77yjoU2yY+PWcZCh1nvrHix8EW89Po5LqJEQarUcjxGU4d/0sSNcH1
         e54nZsx6rjSDjwejVCT2GPg1gL4q/8IZ2jzn4odArY0QIcV1DlZafILg3mFDISenwYqq
         Myb5P5fwGPCkiV/uOOygeM6RKww/FeTs1VU6ZsXR63gsXT9P0XHlN3PyT6j4GZ3gNhMl
         OjrvsGt+40JwufkJf70b/HbYI4+HMnBIwUbNX77hHhtjsugGPL+HB3+rZk+FjP3bBzxW
         q7QSV/1mog+tDuLw4nM77pBh5OR7Xk7XL+rauiGIX/WB5LzEhRj270hiSHaO5vK3xBff
         hRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716983232; x=1717588032;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/Psd25rW2y4rli4LwsJaW87kPft2OszbH0V2yg3gwc=;
        b=XiM9pmp7yTav9/mi0vkvl/omGq0wMxjTzHUayYXyfinDi3vxoVpJr2nzjvihmxxROj
         8V6lJRKV5mByqybex9u+EpvNwfFlxdymR2uOhpm5gwByIPe8umG0/ThN0osLm8VTs88c
         NaavK/NrnokLEbQvSXAZn13iYJcj/PsisJj565Uj+6spjz0wRpZrEmG91X3XJ5hrxA/k
         KC2pTNEXc6PJYyxfRFuNUaTcf8duPNhwRB5AeIvRMpFw6PqjckofkcSTHst946PDFN26
         sb24EKcpBPsjuuQvrHbcS4hozrRwnFe6M7uMljUPWrDC4UtG9DKyzpBnwf6pehtlhgJ3
         IgjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2t64Sgnplvf7F+TTFmeoOI/0WbI94X1Xe+tIT+/Tg2xZmhoe9IlqYulRTi0frv/T5abCdykOTj96Pu7SJk5M6vP49aw1aWmt4hRSJWYk=
X-Gm-Message-State: AOJu0YzlfdZjn3CKHYyqvSkkhkxZ7gLIZ0A1yNzfKz1Zr50JTmBaNOQF
	2L56VPjy5yEVtAeU7bQwkMnyyhgK1j+1ixr8U/fWk6at0Y/hMjPok7ROCrOYRPU=
X-Google-Smtp-Source: AGHT+IGJWdxHIY+FPGA9gdd5UvM+HwASGUODX3LSDhISFrxbeOG/caoasZJ+wVAGhVT0Ww1I+CijvA==
X-Received: by 2002:a17:906:af92:b0:a61:ac3e:2b4c with SMTP id a640c23a62f3a-a62646d5e73mr1374069566b.40.1716983231582;
        Wed, 29 May 2024 04:47:11 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------1aFz7oXFQ2CEfG3fkws5c0WR"
Message-ID: <a749c066-0c05-47dd-b499-e712e5454033@suse.com>
Date: Wed, 29 May 2024 13:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CPU_DOWN_FAILED hits ASSERTs in scheduling logic
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <ZlW-ZyFeAzvh3pGG@macbook>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <ZlW-ZyFeAzvh3pGG@macbook>

This is a multi-part message in MIME format.
--------------1aFz7oXFQ2CEfG3fkws5c0WR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28.05.24 13:22, Roger Pau Monné wrote:
> Hello,
> 
> When the stop_machine_run() call in cpu_down() fails and calls the CPU
> notifier CPU_DOWN_FAILED hook the following assert triggers in the
> scheduling code:
> 
> Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/cred1
> ----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
> CPU:    0
> RIP:    e008:[<ffff82d040248299>] common/sched/credit2.c#csched2_free_pdata+0xc8/0x177
> RFLAGS: 0000000000010093   CONTEXT: hypervisor
> rax: 0000000000000000   rbx: ffff83202ecc2f80   rcx: ffff83202f3e64c0
> rdx: 0000000000000001   rsi: 0000000000000002   rdi: ffff83202ecc2f88
> rbp: ffff83203ffffd58   rsp: ffff83203ffffd30   r8:  0000000000000000
> r9:  ffff83202f3e6e01   r10: 0000000000000000   r11: 0f0f0f0f0f0f0f0f
> r12: ffff83202ecb80b0   r13: 0000000000000001   r14: 0000000000000282
> r15: ffff83202ecbbf00   cr0: 000000008005003b   cr4: 00000000007526e0
> cr3: 00000000574c2000   cr2: 0000000000000000
> fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> Xen code around <ffff82d040248299> (common/sched/credit2.c#csched2_free_pdata+0xc8/0x177):
>   fe ff eb 9a 0f 0b 0f 0b <0f> 0b 49 8d 4f 08 49 8b 47 08 48 3b 48 08 75 2e
> Xen stack trace from rsp=ffff83203ffffd30:
>     ffff83202d74d100 0000000000000001 ffff82d0404c4430 0000000000000006
>     0000000000000000 ffff83203ffffd78 ffff82d040257454 0000000000000000
>     0000000000000001 ffff83203ffffda8 ffff82d04021f303 ffff82d0404c4628
>     ffff82d0404c4620 ffff82d0404c4430 0000000000000006 ffff83203ffffdf0
>     ffff82d04022bc4c ffff83203ffffe18 0000000000000001 0000000000000001
>     00000000fffffff0 0000000000000000 0000000000000000 ffff82d0405e6500
>     ffff83203ffffe08 ffff82d040204fd5 0000000000000001 ffff83203ffffe30
>     ffff82d0402054f0 ffff82d0404c5860 0000000000000001 ffff83202ec75000
>     ffff83203ffffe48 ffff82d040348c25 ffff83202d74d0d0 ffff83203ffffe68
>     ffff82d0402071aa ffff83202ec751d0 ffff82d0405ce210 ffff83203ffffe80
>     ffff82d0402343c9 ffff82d0405ce200 ffff83203ffffeb0 ffff82d040234631
>     0000000000000000 0000000000007fff ffff82d0405d5080 ffff82d0405ce210
>     ffff83203ffffee8 ffff82d040321411 ffff82d040321399 ffff83202f3a9000
>     0000000000000000 0000001d91a6fa2d ffff82d0405e6500 ffff83203ffffde0
>     ffff82d040324391 0000000000000000 0000000000000000 0000000000000000
>     0000000000000000 0000000000000000 0000000000000000 0000000000000000
>     0000000000000000 0000000000000000 0000000000000000 0000000000000000
>     0000000000000000 0000000000000000 0000000000000000 0000000000000000
>     0000000000000000 0000000000000000 0000000000000000 0000000000000000
>     0000000000000000 0000000000000000 0000000000000000 0000000000000000
> Xen call trace:
>     [<ffff82d040248299>] R common/sched/credit2.c#csched2_free_pdata+0xc8/0x177
>     [<ffff82d040257454>] F free_cpu_rm_data+0x41/0x58
>     [<ffff82d04021f303>] F common/sched/cpupool.c#cpu_callback+0xfb/0x466
>     [<ffff82d04022bc4c>] F notifier_call_chain+0x6c/0x96
>     [<ffff82d040204fd5>] F common/cpu.c#cpu_notifier_call_chain+0x1b/0x36
>     [<ffff82d0402054f0>] F cpu_down+0xa7/0x143
>     [<ffff82d040348c25>] F cpu_down_helper+0x11/0x27
>     [<ffff82d0402071aa>] F common/domain.c#continue_hypercall_tasklet_handler+0x50/0xbd
>     [<ffff82d0402343c9>] F common/tasklet.c#do_tasklet_work+0x76/0xaf
>     [<ffff82d040234631>] F do_tasklet+0x5b/0x8d
>     [<ffff82d040321411>] F arch/x86/domain.c#idle_loop+0x78/0xe6
>     [<ffff82d040324391>] F continue_running+0x5b/0x5d
> 
> 
> ****************************************
> Panic on CPU 0:
> Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/credit2.c:4111
> ****************************************
> 
> The issue seems to be that since the CPU hasn't been removed, it's
> still part of prv->initialized and the assert in csched2_free_pdata()
> called as part of free_cpu_rm_data() triggers.
> 
> It's easy to reproduce by substituting the stop_machine_run() call in
> cpu_down() with an error.

Could you please give the attached patch a try?

Only compile tested, though...


Juergen

--------------1aFz7oXFQ2CEfG3fkws5c0WR
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-sched-fix-error-path-of-cpu-removal.patch"
Content-Disposition: attachment;
 filename="0001-xen-sched-fix-error-path-of-cpu-removal.patch"
Content-Transfer-Encoding: base64

RnJvbSA1OTI1ZjE1YWNlOGJlMTg2YzlmNDFjMGNkYTJkNGE2NzViMGY3YmI5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CkRhdGU6IFdlZCwgMjkgTWF5IDIwMjQgMTM6MjQ6MzYgKzAyMDAKU3ViamVjdDogW1BBVENI
XSB4ZW4vc2NoZWQ6IGZpeCBlcnJvciBwYXRoIG9mIGNwdSByZW1vdmFsCk1JTUUtVmVyc2lv
bjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50
LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpJbiBjYXNlIHJlbW92YWwgb2YgYSBjcHUgZmFp
bHMgYXQgdGhlIENQVV9EWUlORyBzdGVwLCBhbiBBU1NFUlQoKSBpbgp0aGUgY3JlZGl0MiBz
Y2hlZHVsZXIgbWlnaHQgdHJpZ2dlcjoKCkFzc2VydGlvbiAnIWNwdW1hc2tfdGVzdF9jcHUo
Y3B1LCAmcHJ2LT5pbml0aWFsaXplZCknIGZhaWxlZCBhdCBjb21tb24vc2NoZWQvY3JlZDEK
LS0tLVsgWGVuLTQuMTktdW5zdGFibGUgIHg4Nl82NCAgZGVidWc9eSAgVGFpbnRlZDogICBD
ICAgIF0tLS0tCkNQVTogICAgMApSSVA6ICAgIGUwMDg6WzxmZmZmODJkMDQwMjQ4Mjk5Pl0g
Y29tbW9uL3NjaGVkL2NyZWRpdDIuYyNjc2NoZWQyX2ZyZWVfcGRhdGErMHhjOC8weDE3NwpS
RkxBR1M6IDAwMDAwMDAwMDAwMTAwOTMgICBDT05URVhUOiBoeXBlcnZpc29yCnJheDogMDAw
MDAwMDAwMDAwMDAwMCAgIHJieDogZmZmZjgzMjAyZWNjMmY4MCAgIHJjeDogZmZmZjgzMjAy
ZjNlNjRjMApyZHg6IDAwMDAwMDAwMDAwMDAwMDEgICByc2k6IDAwMDAwMDAwMDAwMDAwMDIg
ICByZGk6IGZmZmY4MzIwMmVjYzJmODgKcmJwOiBmZmZmODMyMDNmZmZmZDU4ICAgcnNwOiBm
ZmZmODMyMDNmZmZmZDMwICAgcjg6ICAwMDAwMDAwMDAwMDAwMDAwCnI5OiAgZmZmZjgzMjAy
ZjNlNmUwMSAgIHIxMDogMDAwMDAwMDAwMDAwMDAwMCAgIHIxMTogMGYwZjBmMGYwZjBmMGYw
ZgpyMTI6IGZmZmY4MzIwMmVjYjgwYjAgICByMTM6IDAwMDAwMDAwMDAwMDAwMDEgICByMTQ6
IDAwMDAwMDAwMDAwMDAyODIKcjE1OiBmZmZmODMyMDJlY2JiZjAwICAgY3IwOiAwMDAwMDAw
MDgwMDUwMDNiICAgY3I0OiAwMDAwMDAwMDAwNzUyNmUwCmNyMzogMDAwMDAwMDA1NzRjMjAw
MCAgIGNyMjogMDAwMDAwMDAwMDAwMDAwMApmc2I6IDAwMDAwMDAwMDAwMDAwMDAgICBnc2I6
IDAwMDAwMDAwMDAwMDAwMDAgICBnc3M6IDAwMDAwMDAwMDAwMDAwMDAKZHM6IDAwMDAgICBl
czogMDAwMCAgIGZzOiAwMDAwICAgZ3M6IDAwMDAgICBzczogMDAwMCAgIGNzOiBlMDA4Clhl
biBjb2RlIGFyb3VuZCA8ZmZmZjgyZDA0MDI0ODI5OT4gKGNvbW1vbi9zY2hlZC9jcmVkaXQy
LmMjY3NjaGVkMl9mcmVlX3BkYXRhKzB4YzgvMHgxNzcpOgogZmUgZmYgZWIgOWEgMGYgMGIg
MGYgMGIgPDBmPiAwYiA0OSA4ZCA0ZiAwOCA0OSA4YiA0NyAwOCA0OCAzYiA0OCAwOCA3NSAy
ZQpYZW4gc3RhY2sgdHJhY2UgZnJvbSByc3A9ZmZmZjgzMjAzZmZmZmQzMDoKICAgZmZmZjgz
MjAyZDc0ZDEwMCAwMDAwMDAwMDAwMDAwMDAxIGZmZmY4MmQwNDA0YzQ0MzAgMDAwMDAwMDAw
MDAwMDAwNgogICAwMDAwMDAwMDAwMDAwMDAwIGZmZmY4MzIwM2ZmZmZkNzggZmZmZjgyZDA0
MDI1NzQ1NCAwMDAwMDAwMDAwMDAwMDAwCiAgIDAwMDAwMDAwMDAwMDAwMDEgZmZmZjgzMjAz
ZmZmZmRhOCBmZmZmODJkMDQwMjFmMzAzIGZmZmY4MmQwNDA0YzQ2MjgKICAgZmZmZjgyZDA0
MDRjNDYyMCBmZmZmODJkMDQwNGM0NDMwIDAwMDAwMDAwMDAwMDAwMDYgZmZmZjgzMjAzZmZm
ZmRmMAogICBmZmZmODJkMDQwMjJiYzRjIGZmZmY4MzIwM2ZmZmZlMTggMDAwMDAwMDAwMDAw
MDAwMSAwMDAwMDAwMDAwMDAwMDAxCiAgIDAwMDAwMDAwZmZmZmZmZjAgMDAwMDAwMDAwMDAw
MDAwMCAwMDAwMDAwMDAwMDAwMDAwIGZmZmY4MmQwNDA1ZTY1MDAKICAgZmZmZjgzMjAzZmZm
ZmUwOCBmZmZmODJkMDQwMjA0ZmQ1IDAwMDAwMDAwMDAwMDAwMDEgZmZmZjgzMjAzZmZmZmUz
MAogICBmZmZmODJkMDQwMjA1NGYwIGZmZmY4MmQwNDA0YzU4NjAgMDAwMDAwMDAwMDAwMDAw
MSBmZmZmODMyMDJlYzc1MDAwCiAgIGZmZmY4MzIwM2ZmZmZlNDggZmZmZjgyZDA0MDM0OGMy
NSBmZmZmODMyMDJkNzRkMGQwIGZmZmY4MzIwM2ZmZmZlNjgKICAgZmZmZjgyZDA0MDIwNzFh
YSBmZmZmODMyMDJlYzc1MWQwIGZmZmY4MmQwNDA1Y2UyMTAgZmZmZjgzMjAzZmZmZmU4MAog
ICBmZmZmODJkMDQwMjM0M2M5IGZmZmY4MmQwNDA1Y2UyMDAgZmZmZjgzMjAzZmZmZmViMCBm
ZmZmODJkMDQwMjM0NjMxCiAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwN2ZmZiBm
ZmZmODJkMDQwNWQ1MDgwIGZmZmY4MmQwNDA1Y2UyMTAKICAgZmZmZjgzMjAzZmZmZmVlOCBm
ZmZmODJkMDQwMzIxNDExIGZmZmY4MmQwNDAzMjEzOTkgZmZmZjgzMjAyZjNhOTAwMAogICAw
MDAwMDAwMDAwMDAwMDAwIDAwMDAwMDFkOTFhNmZhMmQgZmZmZjgyZDA0MDVlNjUwMCBmZmZm
ODMyMDNmZmZmZGUwCiAgIGZmZmY4MmQwNDAzMjQzOTEgMDAwMDAwMDAwMDAwMDAwMCAwMDAw
MDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAKICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAw
MDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMAogICAwMDAw
MDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAw
MDAwMDAwMDAwCiAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAw
MDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAKICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAw
MDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMAogICAwMDAwMDAw
MDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAw
MDAwMDAwClhlbiBjYWxsIHRyYWNlOgogICBbPGZmZmY4MmQwNDAyNDgyOTk+XSBSIGNvbW1v
bi9zY2hlZC9jcmVkaXQyLmMjY3NjaGVkMl9mcmVlX3BkYXRhKzB4YzgvMHgxNzcKICAgWzxm
ZmZmODJkMDQwMjU3NDU0Pl0gRiBmcmVlX2NwdV9ybV9kYXRhKzB4NDEvMHg1OAogICBbPGZm
ZmY4MmQwNDAyMWYzMDM+XSBGIGNvbW1vbi9zY2hlZC9jcHVwb29sLmMjY3B1X2NhbGxiYWNr
KzB4ZmIvMHg0NjYKICAgWzxmZmZmODJkMDQwMjJiYzRjPl0gRiBub3RpZmllcl9jYWxsX2No
YWluKzB4NmMvMHg5NgogICBbPGZmZmY4MmQwNDAyMDRmZDU+XSBGIGNvbW1vbi9jcHUuYyNj
cHVfbm90aWZpZXJfY2FsbF9jaGFpbisweDFiLzB4MzYKICAgWzxmZmZmODJkMDQwMjA1NGYw
Pl0gRiBjcHVfZG93bisweGE3LzB4MTQzCiAgIFs8ZmZmZjgyZDA0MDM0OGMyNT5dIEYgY3B1
X2Rvd25faGVscGVyKzB4MTEvMHgyNwogICBbPGZmZmY4MmQwNDAyMDcxYWE+XSBGIGNvbW1v
bi9kb21haW4uYyNjb250aW51ZV9oeXBlcmNhbGxfdGFza2xldF9oYW5kbGVyKzB4NTAvMHhi
ZAogICBbPGZmZmY4MmQwNDAyMzQzYzk+XSBGIGNvbW1vbi90YXNrbGV0LmMjZG9fdGFza2xl
dF93b3JrKzB4NzYvMHhhZgogICBbPGZmZmY4MmQwNDAyMzQ2MzE+XSBGIGRvX3Rhc2tsZXQr
MHg1Yi8weDhkCiAgIFs8ZmZmZjgyZDA0MDMyMTQxMT5dIEYgYXJjaC94ODYvZG9tYWluLmMj
aWRsZV9sb29wKzB4NzgvMHhlNgogICBbPGZmZmY4MmQwNDAzMjQzOTE+XSBGIGNvbnRpbnVl
X3J1bm5pbmcrMHg1Yi8weDVkCgpUaGlzIGNhbiBiZSBmaXhlZCBieSBub3QgZnJlZWluZyB0
aGUgY3B1J3Mgc2NoZWR1bGluZyBkYXRhIGluIGNhc2UgdGhlCkNQVV9EWUlORyBzdGVwIGhh
c24ndCBiZWVuIHBlcmZvcm1lZC4gSW5zdGVhZCB0aGUgbm90IHVzZWQgc3RydWN0CnNjaGVk
X3Jlc291cmNlIGluc3RhbmNlcyBuZWVkIHRvIGJlIGZyZWVkIGluIG9yZGVyIHRvIGF2b2lk
IG1lbW9yeQpsZWFraW5nLgoKRml4ZXM6IGQ4NDQ3MzY4OTYxMSAoInhlbi9zY2hlZDogZml4
IGNwdSBob3RwbHVnIikKUmVwb3J0ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgICAgfCAxOCArKysrKysrKysr
KysrKysrLS0KIHhlbi9jb21tb24vc2NoZWQvcHJpdmF0ZS5oIHwgIDEgKwogMiBmaWxlcyBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vc2NoZWQvY29yZS5jIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMKaW5k
ZXggZDg0YjY1ZjE5Ny4uY2JiZWVhZjBjYSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZC9jb3JlLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMKQEAgLTMyNjQsNiArMzI2
NCw4IEBAIHN0cnVjdCBjcHVfcm1fZGF0YSAqYWxsb2NfY3B1X3JtX2RhdGEodW5zaWduZWQg
aW50IGNwdSwgYm9vbCBhZmZfYWxsb2MpCiAgICAgICAgIGRhdGEtPnNyW2lkeF0tPnNjaGVk
dWxlX2xvY2sgPSBzci0+c2NoZWR1bGVfbG9jazsKICAgICB9CiAKKyAgICBkYXRhLT5uX3Ny
X3VudXNlZCA9IGlkeDsKKwogIG91dDoKICAgICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jl
c19yY3Vsb2NrKTsKIApAQCAtMzI3Miw4ICszMjc0LDE4IEBAIHN0cnVjdCBjcHVfcm1fZGF0
YSAqYWxsb2NfY3B1X3JtX2RhdGEodW5zaWduZWQgaW50IGNwdSwgYm9vbCBhZmZfYWxsb2Mp
CiAKIHZvaWQgZnJlZV9jcHVfcm1fZGF0YShzdHJ1Y3QgY3B1X3JtX2RhdGEgKm1lbSwgdW5z
aWduZWQgaW50IGNwdSkKIHsKLSAgICBzY2hlZF9mcmVlX3VkYXRhKG1lbS0+b2xkX29wcywg
bWVtLT52cHJpdl9vbGQpOwotICAgIHNjaGVkX2ZyZWVfcGRhdGEobWVtLT5vbGRfb3BzLCBt
ZW0tPnBwcml2X29sZCwgY3B1KTsKKyAgICB1bnNpZ25lZCBpbnQgaWR4OworCisgICAgaWYg
KCAhbWVtLT5uX3NyX3VudXNlZCApCisgICAgeworICAgICAgICBzY2hlZF9mcmVlX3VkYXRh
KG1lbS0+b2xkX29wcywgbWVtLT52cHJpdl9vbGQpOworICAgICAgICBzY2hlZF9mcmVlX3Bk
YXRhKG1lbS0+b2xkX29wcywgbWVtLT5wcHJpdl9vbGQsIGNwdSk7CisgICAgfQorICAgIGVs
c2UKKyAgICB7CisgICAgICAgIGZvciAoIGlkeCA9IDA7IGlkeCA8IG1lbS0+bl9zcl91bnVz
ZWQ7IGlkeCsrICkKKyAgICAgICAgICAgIHNjaGVkX3Jlc19mcmVlKCZtZW0tPnNyW2lkeF0t
PnJjdSk7CisgICAgfQogICAgIGZyZWVfYWZmaW5pdHlfbWFza3MoJm1lbS0+YWZmaW5pdHkp
OwogCiAgICAgeGZyZWUobWVtKTsKQEAgLTMzMTIsNiArMzMyNCw4IEBAIGludCBzY2hlZHVs
ZV9jcHVfcm0odW5zaWduZWQgaW50IGNwdSwgc3RydWN0IGNwdV9ybV9kYXRhICpkYXRhKQog
ICAgIC8qIFNlZSBjb21tZW50IGluIHNjaGVkdWxlX2NwdV9hZGQoKSByZWdhcmRpbmcgbG9j
ayBzd2l0Y2hpbmcuICovCiAgICAgb2xkX2xvY2sgPSBwY3B1X3NjaGVkdWxlX2xvY2tfaXJx
c2F2ZShjcHUsICZmbGFncyk7CiAKKyAgICBkYXRhLT5uX3NyX3VudXNlZCA9IDA7CisKICAg
ICBmb3JfZWFjaF9jcHUgKCBjcHVfaXRlciwgc3ItPmNwdXMgKQogICAgIHsKICAgICAgICAg
cGVyX2NwdShzY2hlZF9yZXNfaWR4LCBjcHVfaXRlcikgPSAwOwpkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9zY2hlZC9wcml2YXRlLmggYi94ZW4vY29tbW9uL3NjaGVkL3ByaXZhdGUuaApp
bmRleCBjMGU3Yzk2ZDI0Li5mMDEyOWZkOWNjIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3Nj
aGVkL3ByaXZhdGUuaAorKysgYi94ZW4vY29tbW9uL3NjaGVkL3ByaXZhdGUuaApAQCAtNjQ1
LDYgKzY0NSw3IEBAIHN0cnVjdCBjcHVfcm1fZGF0YSB7CiAgICAgY29uc3Qgc3RydWN0IHNj
aGVkdWxlciAqb2xkX29wczsKICAgICB2b2lkICpwcHJpdl9vbGQ7CiAgICAgdm9pZCAqdnBy
aXZfb2xkOworICAgIHVuc2lnbmVkIGludCBuX3NyX3VudXNlZDsKICAgICBzdHJ1Y3Qgc2No
ZWRfcmVzb3VyY2UgKnNyW107CiB9OwogCi0tIAoyLjM1LjMKCg==

--------------1aFz7oXFQ2CEfG3fkws5c0WR--

