Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E394E92EBFA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 17:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757613.1166655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRw4f-0008VQ-QA; Thu, 11 Jul 2024 15:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757613.1166655; Thu, 11 Jul 2024 15:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRw4f-0008Tm-MG; Thu, 11 Jul 2024 15:51:13 +0000
Received: by outflank-mailman (input) for mailman id 757613;
 Thu, 11 Jul 2024 15:51:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRw4e-0008TM-7j
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 15:51:12 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fb72c23-3f9d-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 17:51:02 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57d05e0017aso1428807a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 08:51:02 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc7c9sm265779966b.42.2024.07.11.08.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 08:51:01 -0700 (PDT)
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
X-Inumbo-ID: 5fb72c23-3f9d-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720713061; x=1721317861; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0PYEQ99sKgEQ0mb0O21JgbNmYcAk+GYhxdqveZYQNNo=;
        b=dRaDFMGQQaOgauOk+HFmW5rnqZbgBMyx9HcH0NcIZrXaGaBG6T7YGo9m8KVR+i1VKo
         e4v4Gg8NdF0BVFfLdlhgE4+doRUPszkyeylumnJ1iZouLm+frRRgQuLMAncU/+57Rq6j
         B8JfZ1uJOo6fbuM+iTBPwaw1kkNn1VimUjqkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720713061; x=1721317861;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PYEQ99sKgEQ0mb0O21JgbNmYcAk+GYhxdqveZYQNNo=;
        b=Ul53jNHr61MIdAFjIoM2rQNM9X45wB34RbhuvyDx7/3s5adhWi6mtzUIFUuDpDdudS
         Se52BWG3bjuTvQFCFpZ4DRI7i6GMmZUNOP+gsRrcspDXsKSchYK1SHhdEdW9nv2km1AS
         GYTRWbfgl8cDFGFxTazET74OXrZOLj5o1xFHC3OBvgZV0R079RFolBfkF3qwBf1p3pGU
         OnJVVEZ2bUQVcfVRxe6B54WdQ3HYap9IdmKqhQjEtRWqPk+A9zsFqzqv9+0x0Wj8s0u1
         c3XJEkG3fOFnTW3FspR5Ya7OBTHQrCGb50GwTje0Vcx2CVLZuRquwjk43/4TuL4KCzjj
         uEsQ==
X-Gm-Message-State: AOJu0YyBaUu12AZSwhFeR8U5ZY0R4+pgVP6qXVPQkREuxnp6zULzTQUe
	dgnqaRAnstJXOByanPTHSS2vCku03NDIirVxmO4ZUF1XifMuBryM2Z5cHJiSFCk=
X-Google-Smtp-Source: AGHT+IF+bdkRhqUmqzXkxmqxcAUu1meFNvpCwcXF65xVBbmfQ3N8S4d6IhmiAmj7Q6WefhhDxVFJ0g==
X-Received: by 2002:a17:907:944f:b0:a77:db36:1ccf with SMTP id a640c23a62f3a-a780b70528emr832371866b.42.1720713061545;
        Thu, 11 Jul 2024 08:51:01 -0700 (PDT)
Message-ID: <d4fee591-711e-4557-a6fc-f59a4d2e9a27@citrix.com>
Date: Thu, 11 Jul 2024 16:50:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] CI: Introduce a debian:12-ppc64le container
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
 <20240711111517.3064810-8-andrew.cooper3@citrix.com> <Zo/vKR2YuDJdFLq+@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zo/vKR2YuDJdFLq+@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/07/2024 3:41 pm, Anthony PERARD wrote:
> On Thu, Jul 11, 2024 at 12:15:12PM +0100, Andrew Cooper wrote:
>> diff --git a/automation/build/debian/12-ppc64le.dockerfile b/automation/build/debian/12-ppc64le.dockerfile
>> new file mode 100644
>> index 000000000000..3b311e675ef5
>> --- /dev/null
>> +++ b/automation/build/debian/12-ppc64le.dockerfile
>> @@ -0,0 +1,36 @@
> ...
>> +ENV CROSS_COMPILE=powerpc64le-linux-gnu-
>> +ENV XEN_TARGET_ARCH=ppc64
> I don't really like these two envvars. The second one is already set in
> the env by gitlab, the first one could in theory also come from
> gitlab-ci.

The first one is pre-existing.  (It shows as new because enough of the
file changed for it not to be deemed a rename).

The second is something I added, for improved usability.

> But I guess that comment comes from the fact that I don't really know
> why we would want a second bookworm containers with only a few packages.

Right now (for better or worse) - we have single purpose containers for
a single arch.

For PPC and RISCV, where we're only doing a cross-build of the
hypervisor, the dependencies are almost identical.  But the moment we
start doing userspace, it will diverge quickly.

Part of the work I'm doing is trimming the containers down.  Container
size is a relevant factor for how long the CI tests take.  Also, with
smaller containers, the "oops, out of disk space, delete everything"
logic on various runners will trigger less frequently, so we get better
cache utilisation.

We do not IMO want to have containers with a union of all deps of all
architectures.  They'd be giant.

So while we do have single-purpose containers, these ENV vars are
~mandatory for using the container for it's intended purpose, and it's
far more usable for a human when you can just enter the container and
type `make`.
>> +
>> +RUN <<EOF
>> +#!/bin/bash
>> +    set -e
>> +
>> +    useradd --create-home user
>> +
>> +    apt-get -y update
>> +
>> +    DEPS=(
>> +        # Xen
>> +        bison
>> +        build-essential
>> +        checkpolicy
>> +        flex
>> +        gcc-powerpc64le-linux-gnu
>> +        python3-minimal
>> +
>> +        # Qemu for test phase
>> +        qemu-system-ppc
>> +    )
>> +
>> +    apt-get -y --no-install-recommends install "${DEPS[@]}"
>> +    rm -rf /var/lib/apt/lists/*
> Other containers do also `apt-get clean` is this not needed? Or maybe
> the original containers is setup to not save packages?
>
> /me looking into /var/cache
>
> Looks empty enough, so I guess `apt-get clean` is optional.

https://docs.docker.com/build/building/best-practices/ notes that the
official Debian and Ubuntu images automatically clean themselves, so you
don't need to do it manually.

https://github.com/moby/moby/blob/03e2923e42446dbb830c654d0eec323a0b4ef02a/contrib/mkimage/debootstrap#L82-L105

> Changes looks good enough, so:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.

~Andrew

