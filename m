Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993AC7EA0F9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 17:10:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631762.985435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ZVP-0007q7-Nt; Mon, 13 Nov 2023 16:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631762.985435; Mon, 13 Nov 2023 16:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ZVP-0007nZ-KL; Mon, 13 Nov 2023 16:09:43 +0000
Received: by outflank-mailman (input) for mailman id 631762;
 Mon, 13 Nov 2023 16:09:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DPbO=G2=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2ZVO-0007jY-6c
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 16:09:42 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d2d5f59-823f-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 17:09:41 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9c41e95efcbso680639666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 08:09:41 -0800 (PST)
Received: from [192.168.69.100] ([176.164.221.204])
 by smtp.gmail.com with ESMTPSA id
 qk16-20020a170906d9d000b0099297782aa9sm4153050ejb.49.2023.11.13.08.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 08:09:39 -0800 (PST)
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
X-Inumbo-ID: 0d2d5f59-823f-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699891781; x=1700496581; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MT2jqnM1EXDZd7Eo9GsBNo8vayQdwjXlJYvjk3d8/BQ=;
        b=fqpCt5fteuudTORS3sV397tfRRz7tFQXcAaXoBStqd35p/mq9WjQAcc+Wv7Ry+WTQm
         +Yd00dTPF/V8UETX/gX3TaufJsQ6va9gDkOkuGVfMCqhFlwhsq8umGoqW0yzXnGb4Msv
         tLb9/im1/cG2x/jckLaGU4l0YSmWloCvWboG9c747O+GyhIlG2Xxae7KPIX4CPO1xw8C
         o6hIGD76EPSOdTbCUaSCE7emIEFdVjNDa6WAOQfc6788iCmzWBnTLFzYTHewVZrIeFOf
         PMbTWnPWoWNHsAZHfAG/DovRIy+3I2OfnAfQFGeuZ4fW7lR7mHQGGr8mENzjJNyWg/U1
         dI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891781; x=1700496581;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MT2jqnM1EXDZd7Eo9GsBNo8vayQdwjXlJYvjk3d8/BQ=;
        b=vB4dU0/bwaU2jSKspPgwj+BKGZRCrZwHPE4IcAuKzuQa6+b2bpIOZwzLHseMCbY+E9
         z90AgPx6QilhIswGrdp5venZ/AfE+XMx0WblxpOULshiBoMC2fD3ue6V3qOJHhxvJeoa
         ljlSUulPIU8kGujT/DYhBx3cHAIQ5d6L1NSgIg1Bd0FsP9BmfDJANaUV+rybDiX0pjsl
         r90CO5Q40QqCoIxsCDzKH84C/z9dy522mjwF6r3pkfwHn8TxXQrERiunXkUdDqXUmAaa
         pWeU0FqSDnnBme2ZJ8tjUG9LsFxuXU67e8casi7P+itv6pbk2AfuzpW1r6Iq+D/yib+H
         56KQ==
X-Gm-Message-State: AOJu0YzWVr+pm8TxBPCisBr/zv2WvLhwcJBSSbjbnkz99rz1kNVPeNyi
	9pglUKSweFCiTC0wKTVo/dE5XA==
X-Google-Smtp-Source: AGHT+IGeRhJFxDoIfveJ9ETd2OdQ3oHGQ3FlHAF/NrjNVpCIp+vrcNE4rMVRNzJtDcSpxiFGnRsC1Q==
X-Received: by 2002:a17:907:86a3:b0:9be:b41d:4f7e with SMTP id qa35-20020a17090786a300b009beb41d4f7emr5851496ejc.17.1699891780129;
        Mon, 13 Nov 2023 08:09:40 -0800 (PST)
Message-ID: <7a66c289-19e1-4690-8c6e-31a9f6344b6f@linaro.org>
Date: Mon, 13 Nov 2023 17:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 04/10] hw/xen: Factor xen_arch_align_ioreq_data()
 out of handle_ioreq()
Content-Language: en-US
To: "Woodhouse, David" <dwmw@amazon.co.uk>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <f791a822-f6f5-44fa-904b-f67d3f193763@email.android.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <f791a822-f6f5-44fa-904b-f67d3f193763@email.android.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/11/23 16:58, Woodhouse, David wrote:
> On 13 Nov 2023 10:22, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
>     Per commit f17068c1c7 ("xen-hvm: reorganize xen-hvm and move common
>     function to xen-hvm-common"), handle_ioreq() is expected to be
>     target-agnostic. However it uses 'target_ulong', which is a target
>     specific definition.
> 
>     In order to compile this file once for all targets, factor the
>     target-specific code out of handle_ioreq() as a per-target handler
>     called xen_arch_align_ioreq_data().
> 
>     Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>     ---
>     Should we have a 'unsigned qemu_target_long_bits();' helper
>     such qemu_target_page_foo() API and target_words_bigendian()?
> 
> 
> It can be more fun than that though. What about 
> qemu_target_alignof_uint64() for example, which differs between i386 and 
> x86_64 and causes even structs with *explicitly* sized fields to differ 
> because of padding.
> 
> I'd *love* to see this series as a step towards my fantasy of being able 
> to support Xen under TCG. After all, without that what's the point in 
> being target-agnostic?

Another win is we are building all these files once instead of one for
each i386/x86_64/aarch64 targets, so we save CI time and Amazon trees.

> However, I am mildly concerned that some of these files are accidentally 
> using the host ELF ABI, perhaps with explicit management of 32-bit 
> compatibility, and the target-agnosticity is purely an illusion?
> 
> See the "protocol" handling and the three ABIs for the ring in 
> xen-block, for example.

If so I'd expect build failures or violent runtime assertions.

Reviewing quickly hw/block/dataplane/xen-block.c, this code doesn't
seem target specific at all IMHO. Otherwise I'd really expect it to
fail compiling. But I don't know much about Xen, so I'll let block &
xen experts to have a look.

> Can we be explicit about what's expected to work here and what's not in 
> scope?

What do you mean? Everything is expected to work like without this
series applied :)

Regards,

Phil.

