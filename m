Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D55CBF7099
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 16:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147339.1479662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBDGd-0008KL-Jt; Tue, 21 Oct 2025 14:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147339.1479662; Tue, 21 Oct 2025 14:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBDGd-0008I0-Ge; Tue, 21 Oct 2025 14:23:15 +0000
Received: by outflank-mailman (input) for mailman id 1147339;
 Tue, 21 Oct 2025 14:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH+j=46=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vBDGb-0008HW-Hb
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 14:23:13 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76dc23d5-ae89-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 16:23:07 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-471076f819bso44698665e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 07:23:07 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00cdf6csm20473949f8f.43.2025.10.21.07.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 07:23:05 -0700 (PDT)
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
X-Inumbo-ID: 76dc23d5-ae89-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761056587; x=1761661387; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lujhmAKv4qj3zqFSyJwljj3Hbz9BgNvxk1iEvf3EvUc=;
        b=TzorcmDaCVINdx+SlB1wgqPXifCTx9ECjcjU6D+BYR0ZELchTGuKW6HfPQb3mWkttt
         iznO8nH8tY6j5AXrz1K1cpg+0CuYeVOI5Ku+4CUjxQ8mX0iPCUl5C2Q4MTTpAzT5hZdA
         a753gMUgi8Db00Aj96pMobM669BU2fQMeokjh5kLz9Qk86RCg53naNADuIb+EJ4HzZMa
         LYNVb61sx1RUHZYzV2nn8ixqDlyC/R4qJheT4lDz01od7CN4OClRj2ZWwFIXFEEw+hcx
         HaOvhzwWQMLITaFL/MhVCE+bayf5uBO6zuWuPoqB+KW2OzCd32cBLRuD3YFSV74Nc7G3
         z8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761056587; x=1761661387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lujhmAKv4qj3zqFSyJwljj3Hbz9BgNvxk1iEvf3EvUc=;
        b=gkejn4AbzIKV4yENLAmGPzmOwtnFEiuQlPax9fVNQO/XU9ayzv0XpcciFzdc9OnTPl
         fhJD7D4AZg2xk/dnCUHiToLeOiyBg6j4j8nGsx+dU+hyQ4Cc5RQLONaQ5T+5ffUraegk
         pYsPQXLu/fpjv6XtXhKv2uzjd6BcY0qqe5KAfcp0TQsdq8Eyqzu3pUIDeZQC8FtU4VDd
         cENWQF8qw7QmCUVvjnb60ZCi7eYL8udDteUCFCjE//K3usZeNvzivO31gTxn2Bi+0DNS
         Rre1jgfya7ssctjhcqCLPmAqmbfFwaegMbvOQjRyWXj94W/LLdXXLleHytwO3EXJv+cH
         zQFw==
X-Forwarded-Encrypted: i=1; AJvYcCWZs77qlh/KYkPQCWY1MS6HdVLv/498djJHBX7UlATtn4EapvUsJa9snYJSEDs1w/qvi+U3kLaqA0o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfbHg0xayTe+bTi4RqcaXfhEqUzPh7JoAPp8Rn+++1ERRzVM74
	YH8Ujsb5ZGPAPeSKAaBSyuA8kGiuBRQkGgySrIo5Pim/Fku6EZOw7XUNFvAu8Fr8bIQ=
X-Gm-Gg: ASbGnctjWSGq8FOWBufSs7aCp4uwp9TMiz+XAWz9D1QIXuyhaSDo2ZF+hcNuaU7W7UO
	HVO9GIKCxpNlv9tlG1pk6j31Yy7f7NfqcIn23eWt8zGXWAeZ/LKCBv8MQ24wINcqR3vmt1oZBbk
	2FaL68JtFO8lo/lz+LnocG9fPdxub3PSKhigyAI+4HnAOqEgXk+HxNgPOp/cyajoPtpxGe4++Qq
	W7xt3u7FhIDskdtx/Al0WpK7fs3Esy3B1/lDIXp93jnzg/guOJK8IvsdIEg6CJxuiQEg+ZnnDTk
	5CK8ThxrAhaUyMdhjlZLQo3lsK6IE5C6ynsczkTmhTZlVUBtC9wmqp+XzwJYq0q8O+VX+Woddl8
	+q8xo+EHFFScI+43K6ZUy7+TrlSqLOnGjZO4x+wSbmZsb8/6VPAOKu2Gc5C4YFeZgNXLOCGP5ic
	3nTEYKBgSNgTG+m8aM7T4Ho6cXXrrZWkU7PIFULNDouwQG8R3P150a2A==
X-Google-Smtp-Source: AGHT+IGpNQZriF03nrUdfXcsadeGS/wWcOcHtxrbwixqf2QWNQLelRmKaF2GA7cZAx1ECPorWCWExA==
X-Received: by 2002:a05:600c:820b:b0:46e:1fc2:f9ac with SMTP id 5b1f17b1804b1-4711787dc76mr114596775e9.10.1761056586906;
        Tue, 21 Oct 2025 07:23:06 -0700 (PDT)
Message-ID: <f764e4cf-d134-4c4d-a313-a5b7dd6620d0@linaro.org>
Date: Tue, 21 Oct 2025 16:23:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] char: rename CharBackend->CharFrontend
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhenwei Pi <pizhenwei@bytedance.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, =?UTF-8?Q?Cl=C3=A9ment_Chigot?=
 <chigot@adacore.com>, Frederic Konrad <konrad.frederic@yahoo.fr>,
 Alberto Garcia <berto@igalia.com>, Thomas Huth <huth@tuxfamily.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Magnus Damm <magnus.damm@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Collin L. Walling" <walling@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Corey Minyard <minyard@acm.org>,
 Paul Burton <paulburton@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Michael Rolnik <mrolnik@gmail.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Vijai Kumar K <vijai@behindbytes.com>,
 Samuel Tardieu <sam@rfc1149.net>, Gustavo Romero
 <gustavo.romero@linaro.org>, Raphael Norwitz <raphael@enfabrica.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "reviewer:vhost-user-scmi" <mzamazal@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>, Li Zhijian <lizhijian@fujitsu.com>,
 Jason Wang <jasowang@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Lukas Straub <lukasstraub2@web.de>,
 "open list:Sharp SL-5500 Co..." <qemu-arm@nongnu.org>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:virtiofs" <virtio-fs@lists.linux.dev>,
 "open list:Rust-related patc..." <qemu-rust@nongnu.org>
References: <20251021122533.721467-1-marcandre.lureau@redhat.com>
 <CAFEAcA-jPE_onLYLMxgcAOB7dWRXOLJrWcGPnR0NUdjYytPDVA@mail.gmail.com>
 <aPePcTKl6s4FoLCL@gallifrey>
 <CAJ+F1C+bGKtY6nf3LCXrwhZ2aEdu2npXJ9FapmsqgX0uLL5TUw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAJ+F1C+bGKtY6nf3LCXrwhZ2aEdu2npXJ9FapmsqgX0uLL5TUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/10/25 15:58, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Oct 21, 2025 at 5:52 PM Dr. David Alan Gilbert <dave@treblig.org> wrote:
>>
>> * Peter Maydell (peter.maydell@linaro.org) wrote:
>>> Marc-André Lureau <marcandre.lureau@redhat.com> wrote:
>>>> The actual backend is "Chardev", CharBackend is the frontend side of it,
>>>> let's rename it for readability.
>>>
>>> I always thought the "frontend" was the device the guest
>>> saw (the 16650 UART or whatever). invocation.html has bits
>>> talking about "virtio hvc console frontend device" which
>>> seem like they also use that terminology.
>>>
>>> If we want to clean up the naming it might be helpful to have
>>> a comment somewhere documenting the different components and
>>> what names we give them and how they fit together (or even
>>> better, something in docs/devel/...)
>>
>> Or something more descriptive like 'CharGuestSide'
> 
> If we are talking about the Chardev frontend or user, that's too
> restrictive. We have generic stream handling code (think
> mux/hub/tests/client/server etc) that do not fit that usage naming.

Isn't it

- backend -> host adapter
- frontend -> implementation used by guest

?

