Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAFC92FEE3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 19:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758235.1167634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJe7-0005Bm-HU; Fri, 12 Jul 2024 17:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758235.1167634; Fri, 12 Jul 2024 17:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJe7-0005AI-Dr; Fri, 12 Jul 2024 17:01:23 +0000
Received: by outflank-mailman (input) for mailman id 758235;
 Fri, 12 Jul 2024 17:01:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZSin=OM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sSJe6-0005AC-02
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 17:01:22 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bc44768-4070-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 19:01:20 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6b5f4c7f4fbso13001076d6.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 10:01:20 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b61b9d9ec5sm36821706d6.30.2024.07.12.10.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 10:01:17 -0700 (PDT)
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
X-Inumbo-ID: 5bc44768-4070-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720803678; x=1721408478; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uuvgAeXnlqzDxHftSTTHxRF0m9OZ1jwulAni2VqRlsI=;
        b=vAEjag6qXgfRRN7JrrRv/004VNBmTVGOukDTV8w4Cglm8axdFiakFLHp96wZiGVyCq
         j2iBu6mJk5fbdwev7RPDk5iT0EDcIB6Ujtjv4RAPwFyPuFeUN5puTDfogtV7+DEtSnY+
         4zuI1IVpU8SQHfV6f7Db7jo+PgjcPiiNU2dxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720803678; x=1721408478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuvgAeXnlqzDxHftSTTHxRF0m9OZ1jwulAni2VqRlsI=;
        b=A+gUmfFXRGikiEgMYxyMYETEaGu7l4Xk7lMJzMxlqFrn12bwZcsjQIaRalcU9Uh7fE
         UD6CDE4eZA0i6w0Ji6Drboud2k6KzCCW/G7ABeCuu2NmCQlWSCGTd976CNDAY3C+n+A+
         1pWwgW0LW8TdDsinnqBL72isCJu7wNqpxkSg/mJt2DNvyPYvbkHS8z9N0VrcdkQpLica
         FcvQpu86vmxn03F8AC5XuvPSd7jtegXCZv3/BtqSnjYoI+4XFe/LY4qeaORO7Q/09adR
         ibB6JATqdA2ioOVyzk4XdMW58ZJqDWaChe/5FO9qTXMuLMpQdCLZ2oX1XpvBNf4i/tBW
         RSvw==
X-Gm-Message-State: AOJu0YzpvZanMLGyc5HRpeXUeszCnxpd2nf1o4Pt/byU8xVwJTtk8x+E
	gtS8lQ2Aru5y/LaoW/2DZiO14QdIhZv93+kz7R3B3VFGaIJ5nxt5GQ0kUuKJHA8=
X-Google-Smtp-Source: AGHT+IGE4c8eq7ViOGVlYuFMVm++Kvv0cE6i+9kr9ALY9HVu+0+xM8nFgAye+2ljWQwtXeoy/mQSSg==
X-Received: by 2002:a05:6214:e49:b0:6b5:148:736a with SMTP id 6a1803df08f44-6b61c1e1d80mr139795746d6.57.1720803678457;
        Fri, 12 Jul 2024 10:01:18 -0700 (PDT)
Message-ID: <939d1d80-b943-42e8-b67a-196a0276367f@citrix.com>
Date: Fri, 12 Jul 2024 18:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/12] CI: Add Ubuntu 22.04 (Jammy) and 24.04 (Noble)
 testing
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
 <20240712104907.3238026-1-andrew.cooper3@citrix.com> <ZpFdhgyybAAOEsE8@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZpFdhgyybAAOEsE8@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/07/2024 5:44 pm, Anthony PERARD wrote:
> On Fri, Jul 12, 2024 at 11:49:07AM +0100, Andrew Cooper wrote:
>> The containers are exactly as per 20.04 (Focal).  However, this now brings us
>> to 5 releases * 4 build jobs worth of Ubuntu testing, which is overkill.
>>
>> The oldest and newest toolchains are the most likely to find problems with new
>> code, so reduce the middle 3 releases (18/20/22) to just a single smoke test
>> each.
> That would mean a bit less `clang` build-test, but I guess that would be
> mostly covered by FreeBSD testing on GitHub.
>
> I tried to find out which version of clang were been used with this
> patch applied:
>     Alpine clang version 16.0.6
>     Debian clang version 14.0.6
>     clang version 17.0.6
>     clang version 18.1.8
>     clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)
>     Ubuntu clang version 18.1.3 (1ubuntu1)
> and the versions that won't be tested anymore:
>     clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
>     clang version 10.0.0-4ubuntu1
>     Ubuntu clang version 14.0.0-1ubuntu1.1
>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Anyway:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.

We could intermix Clang/GCC if we really want, but tbh (still!) the only
thing you want to use Clang for is stricter/better diagnostics.  GCC is
still a better optimising compiler for C, particularly for kernel
activities.

Also, those clang versions are entirely obsolete.  If we wanted to do
sensible testing, we'd need to be using the nightly builds and keeping
within ~18mo of the release which I think is their support window.

Also also, this testing is CC=Clang, LD=ld, which is subtly different to
the FreeBSD testing which is full-stack LLVM (so LD=lld).

There is definitely room for improvement in our Clang/LLVM testing.

~Andrew

