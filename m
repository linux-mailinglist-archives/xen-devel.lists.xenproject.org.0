Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1288898EAB9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 09:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809188.1221395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swGXI-0000VQ-3T; Thu, 03 Oct 2024 07:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809188.1221395; Thu, 03 Oct 2024 07:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swGXH-0000Sv-WC; Thu, 03 Oct 2024 07:46:08 +0000
Received: by outflank-mailman (input) for mailman id 809188;
 Thu, 03 Oct 2024 07:46:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNe7=Q7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1swGXG-0000Sl-Os
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 07:46:06 +0000
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [2a00:1450:4864:20::642])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a74b8c0-815b-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 09:46:03 +0200 (CEST)
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so68093566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 00:46:03 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99100a508esm49249366b.1.2024.10.03.00.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 00:46:02 -0700 (PDT)
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
X-Inumbo-ID: 8a74b8c0-815b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727941563; x=1728546363; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=76tTwsciSNRSOnBz7Iac6NfKFoC2sTYcF9+DncgDcy4=;
        b=DpbmlvOkKbsCsSeDun5qcNoGVnMRMiqKSSuKADtV7MlCs/q4Pi918W5tCPPoW/Lxas
         aguQBuPdyFZyAS+jOYSiOoYRPCTM/4j2PBOZD4Xkh6EA8HDr+LnLosBeXEX00/PQzNeI
         VLDp4JZHSX75rfbtpYnVGD3QYJeXoeCOiT3Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727941563; x=1728546363;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76tTwsciSNRSOnBz7Iac6NfKFoC2sTYcF9+DncgDcy4=;
        b=PoxNu9pKa+B4HkFVVQIOk98x6lXYICk/LQp1kStLf4/wXeBR65RvgipwkP81j4jRyq
         oF+qWNX1dZDpsPa9B0zzVAAII6dujomb37r8ga8cw7tSTXi0Lf+bQwSDycCKp7GLzZZ7
         F0TYK8noRIHU9jdz31jCK4BGTuAhL1kqkixnNxa9d+9kOwLGTpiqNsPpJpwGbrTgEDwC
         TNco4MjUnT9sDlI4HeHlUHwMn8spcd9PoZRSvgbCSDSeYnBVA0TXSE2Pa9yO26yhJOQK
         Z5haPrxzp+nzXVJ7m0CJFN0NJvNIeIGkmylQTSIhZqT7wuekauEvPpmC+kBZZ/nQ6AVJ
         2nfg==
X-Gm-Message-State: AOJu0Yz+tNzU4TCTDwyeet8Y93qoU8XJxQK+0zcCtG8I2gSHTpHbE0HO
	Ufqd4HSDNy3Y6rlUPvbkQRIhrDXENAf2qzWEl4n1KjaYEPw7IfJOjXwDrsK8GpI=
X-Google-Smtp-Source: AGHT+IHGc3qc8d5q03N+wH9kpRg+eZYvfy/eeavtolioCHVGmpgO/8Wt4DPQd1LrQFiz61HgUPbKZw==
X-Received: by 2002:a17:906:ee89:b0:a8a:906d:b485 with SMTP id a640c23a62f3a-a98f823654emr555984466b.26.1727941563246;
        Thu, 03 Oct 2024 00:46:03 -0700 (PDT)
Message-ID: <b95e749e-9495-4ebc-88b0-3e71dbb44d91@citrix.com>
Date: Thu, 3 Oct 2024 08:46:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] x86/boot: Reduce assembly code
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
 <Zv1S88isxSSMuqqk@mail-itl>
 <CACHz=ZhmsA_7eiV+MXi6=3NRzro_sZZK+-Kt-PJ_FS6RfZPZ6g@mail.gmail.com>
 <Zv3vUCLlaZSN84D_@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zv3vUCLlaZSN84D_@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/10/2024 2:11 am, Marek Marczykowski-Górecki wrote:
> On Wed, Oct 02, 2024 at 04:27:19PM +0100, Frediano Ziglio wrote:
>> On Wed, Oct 2, 2024 at 3:04 PM Marek Marczykowski-Górecki
>> <marmarek@invisiblethingslab.com> wrote:
>>> On Tue, Oct 01, 2024 at 11:22:37AM +0100, Frediano Ziglio wrote:
>>>> This series came from part of the work of removing duplications between
>>>> boot code and rewriting part of code from assembly to C.
>>>> Rewrites EFI code in pure C.
>>> The MB2+EFI tests on Adler Lake fail with this series:
>>> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1478766782
>>> Looking at the VGA output (unfortunately not collected by the test
>>> itself) it hangs just after bootloader, before printing anything on the
>>> screen (or even clearing it after bootloader). The serial is silent too.
>>>
>> I tried multiple times to take a look at the logs, but I keep getting error 500.
> 500? That's weird. Anyway, serial log is empty, so you haven't lost
> much.
> But also, I've ran it a couple more times and it is some regression.
> Staging reliably passes while staging+this series fails.
>
> Unfortunately I don't have any more info besides it hangs before
> printing anything on serial or VGA. Maybe it hanging only on Intel but
> not AMD is some hint? Or maybe it's some memory layout or firmware
> differences that matter here (bootloader is exactly the same)?
> FWIW some links:
> successful staging run on ADL: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/7980146338
> failed staging+this run on ADL: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/7980330394
> successful staging run on Zen3+: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/7980146359
> successful staging+this run on Zen3+: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/7980146359

Ok, we should do several things.

Frediano, can you split out the efi_multiboot2() prototype in asm/efi.h
and submit it separately from introducing efi_multiboot2_prelude(). 
Mechanically, it's a somewhat-large part of the patch, and won't be
related to whatever other failure is going on here.

Everyone, is it time to consider earlyprintk() ?  This is not the first
time something like this has happened, and it wont be the last.  I for
one am quite bored of doing ad-hoc debugging each time...

~Andrew

