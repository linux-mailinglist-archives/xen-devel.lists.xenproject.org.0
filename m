Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB412547820
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jun 2022 03:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347462.573902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0C7Z-0000ky-CX; Sun, 12 Jun 2022 01:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347462.573902; Sun, 12 Jun 2022 01:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0C7Z-0000hZ-8c; Sun, 12 Jun 2022 01:10:29 +0000
Received: by outflank-mailman (input) for mailman id 347462;
 Sun, 12 Jun 2022 01:10:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tCbL=WT=gmail.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1o0C7W-0000hA-Vd
 for xen-devel@lists.xenproject.org; Sun, 12 Jun 2022 01:10:27 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 704a5757-e9ec-11ec-bd2c-47488cf2e6aa;
 Sun, 12 Jun 2022 03:10:25 +0200 (CEST)
Received: by mail-pf1-x431.google.com with SMTP id 15so2731844pfy.3
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jun 2022 18:10:25 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 kw19-20020a17090b221300b001dd11e4b927sm4212883pjb.39.2022.06.11.18.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 18:10:23 -0700 (PDT)
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
X-Inumbo-ID: 704a5757-e9ec-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ed2L5Xukb0x530A4eAXxNU5Y2kMwxFVSJ7UPqpwGeqo=;
        b=abxM082Dlwxi65fThPNfZemww/5/56Sdae15mJ/9NowCfcVuO1BqCEcCjPX/iKj5gP
         jzaz/vgCrovBaYKU7U9+DArZtxg20Oi8wzCFth72tIjPW7GrJrqg1NPST0hoDFw6f/qk
         KzfbM+Y7SMTmAzFFC9NVDfjYWyESskIrdWmM0HcE2uxttenUuAlpWUxGkkL8Z+PxT7g2
         zsSo3NIcs/Mt+V5YdgVNm+7bCWhbJiumqSQq/nrIyEnWKoyK1N1zQeuqdiRE+kVdQeoh
         4WUNfAexkeSJ50lHbZ85+JiVZmFwsazFUmHl76hZ4kpL73VbBMMIXogi0mc5zzct/5Zl
         Ruew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ed2L5Xukb0x530A4eAXxNU5Y2kMwxFVSJ7UPqpwGeqo=;
        b=hnSBlLf8RR+7reclzgQATVKgSsUxrMJVbJUe9Vmgdlwi85NSvnmd442nm/39lFpgBB
         /Fl+ctVvgIRdFEsIlsu2ryLzl96bHPHtajokQLCtd5WkH3nzDqPcJleVKt63Q5fD+iNe
         zCVA19bGvqh/bLJlsvsWccqx5w6VPCVPOKcNO25p5KLMsIlzQbyqUwhdnKTmrcbFzCpv
         8xyKRvp83B475MjJ8/mfpedgADb/1fd/XF4kb47pSm2L6jqF4zMWvQlSAQnawlji6wem
         3FZ8ftOQv7bAzEw2UCG+ICD0TkSh/R+wuD35nx1MvhKluV0iuH8oAIpBZZEtuQZNnbJL
         BagQ==
X-Gm-Message-State: AOAM530RE1OhWPxVJQOM3xVF3kQmpyJ/Qn69fem4h7VAjbS+V2pTIHRy
	Gk8oqAAFzaM6S94xRI+5ID4=
X-Google-Smtp-Source: ABdhPJx6nOH3fmkp/Vrk+8u78czzsqal/W8wFxPqKLD2ytrgYjBiiB/mtGp+2rlz16bQrrPZgqSQ7w==
X-Received: by 2002:a05:6a00:194d:b0:51b:eb84:49b1 with SMTP id s13-20020a056a00194d00b0051beb8449b1mr43072278pfk.77.1654996224101;
        Sat, 11 Jun 2022 18:10:24 -0700 (PDT)
Message-ID: <77ae4462-6cd6-b612-a36d-68f196d6a0cf@gmail.com>
Date: Sun, 12 Jun 2022 10:10:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PULL 00/17] Kraxel 20220610 patches
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: "Canokeys.org" <contact@canokeys.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>, xen-devel@lists.xenproject.org,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220610092043.1874654-1-kraxel@redhat.com>
 <adec1cff-54f1-e2bf-8092-945601aeb912@linaro.org>
 <60c72935-85ce-4e24-43a5-119f6428b916@t-online.de>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <60c72935-85ce-4e24-43a5-119f6428b916@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2022/06/12 1:34, Volker Rümelin wrote:
> Am 10.06.22 um 22:16 schrieb Richard Henderson:
>> On 6/10/22 02:20, Gerd Hoffmann wrote:
>>> The following changes since commit 
>>> 9cc1bf1ebca550f8d90f967ccd2b6d2e00e81387:
>>>
>>>    Merge tag 'pull-xen-20220609' of 
>>> https://xenbits.xen.org/git-http/people/aperard/qemu-dm into staging 
>>> (2022-06-09 08:25:17 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://git.kraxel.org/qemu tags/kraxel-20220610-pull-request
>>>
>>> for you to fetch changes up to 02319a4d67d3f19039127b8dc9ca9478b6d6ccd8:
>>>
>>>    virtio-gpu: Respect UI refresh rate for EDID (2022-06-10 11:11:44 
>>> +0200)
>>>
>>> ----------------------------------------------------------------
>>> usb: add CanoKey device, fixes for ehci + redir
>>> ui: fixes for gtk and cocoa, move keymaps, rework refresh rate
>>> virtio-gpu: scanout flush fix
>>
>> This introduces regressions:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/2576157660
>> https://gitlab.com/qemu-project/qemu/-/jobs/2576151565
>> https://gitlab.com/qemu-project/qemu/-/jobs/2576154539
>> https://gitlab.com/qemu-project/qemu/-/jobs/2575867208
>>
>>
>>  (27/43) 
>> tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password: 
>> ERROR: ConnectError: Failed to establish session: EOFError\n Exit 
>> code: 1\n    Command: ./qemu-system-x86_64 -display none -vga none 
>> -chardev 
>> socket,id=mon,path=/var/tmp/avo_qemu_sock_4nrz0r37/qemu-2912538-7f732e94e0f0-monitor.sock 
>> -mon chardev=mon,mode=control -node... (0.09 s)
>>  (28/43) tests/avocado/vnc.py:Vnc.test_change_password:  ERROR: 
>> ConnectError: Failed to establish session: EOFError\n    Exit code: 
>> 1\n    Command: ./qemu-system-x86_64 -display none -vga none -chardev 
>> socket,id=mon,path=/var/tmp/avo_qemu_sock_yhpzy5c3/qemu-2912543-7f732e94b438-monitor.sock 
>> -mon chardev=mon,mode=control -node... (0.09 s)
>>  (29/43) 
>> tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password: 
>> ERROR: ConnectError: Failed to establish session: EOFError\n Exit 
>> code: 1\n    Command: ./qemu-system-x86_64 -display none -vga none 
>> -chardev 
>> socket,id=mon,path=/var/tmp/avo_qemu_sock_tk3pfmt2/qemu-2912548-7f732e93d7b8-monitor.sock 
>> -mon chardev=mon,mode=control -node... (0.09 s)
>>
>>
>> r~
>>
> 
> This is caused by [PATCH 14/17] ui: move 'pc-bios/keymaps' to 
> 'ui/keymaps'. After this patch QEMU no longer finds it's keymaps if 
> started directly from the build directory.
> 
> With best regards,
> Volker
> 

I have a patch series which allow to find files not in pc-bios directory 
even if started directly from the build directory:
https://patchew.org/QEMU/20220228005710.10442-1-akihiko.odaki@gmail.com/

Regards,
Akihiko Odaki

