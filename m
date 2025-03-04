Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924D9A4E047
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 15:10:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901160.1309150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpSxl-0005jw-Bz; Tue, 04 Mar 2025 14:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901160.1309150; Tue, 04 Mar 2025 14:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpSxl-0005iU-8z; Tue, 04 Mar 2025 14:09:37 +0000
Received: by outflank-mailman (input) for mailman id 901160;
 Tue, 04 Mar 2025 14:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Z5M=VX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpSxj-0005iN-VM
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 14:09:36 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c2c8441-f902-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 15:09:33 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-390dd35c78dso3668326f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 06:09:33 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4848252sm17937562f8f.69.2025.03.04.06.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 06:09:32 -0800 (PST)
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
X-Inumbo-ID: 4c2c8441-f902-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741097373; x=1741702173; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aTJN0h9Uin/WBU/IdFVCuueJG3VRjSRdBcUhoLoOg6w=;
        b=KU4OpW85xCKhx9nsgkdjLY/UU5Dk+otf7VVypGsEq6dFHiA7nSwGUHPkQiM48JPsm6
         vbRCgfHv9zY0YdQjfPqc9TCJgTBlsCYgZ7vsMmFi/6VH7WZFy9S3lK/6RedzTxFuaTxm
         vSdoCMP9n0+NiXvKtQB5DJYIriBVvvJ/E6m+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741097373; x=1741702173;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTJN0h9Uin/WBU/IdFVCuueJG3VRjSRdBcUhoLoOg6w=;
        b=GkHaExf7fos+Qg/FLKwtzrne2dld+5sryTUW8zG5LSw62lON2RAoVHPbFSal/j3R9Z
         Rn1Jn/q78yXNG7qNf6reY89Yu236qa5mbZl2gNoPEyhplswsaHJPBa0Oqsi7Hd7cI14H
         6hr9I9NUSyujonqK1mKvpK+FOyagTYBTy9DpsPEd6bL4Rn5KNUC+RCGjy/t3JyA/KsBD
         UqDMA0uJCcoiBGUfSCzK884Tn7EAUqh2+Jv186LWcqWqCkltBB9FzvHtFDy5vc3vuRvm
         N4QtFOgTCtTe6zo2aUbGAjgjEkp0L26WUer1bQ7+64qFG2A4yWH1jf7tvkcprErMnSBd
         jOVg==
X-Gm-Message-State: AOJu0Yzm8bBBppwyWk6NaZVJYt3yH2V6GuDbA2yWOAO5J2zxA1gBm9sp
	7KhPICDAqaY/4ycBHaNNxuaejERzDJo5r/mBPNXwnYzRUG6Nl3I6hj1UJX5Vhqc=
X-Gm-Gg: ASbGnctabxnaq3wJF+Sc22CMq6JDxfs4P0ud686yDAzkJhfojXNjkmaR+xGQK3y+uHk
	5nBI9Ee9zA3Ao0Rz7wPu24KukLx9DfkNMH3tWoisOUYNTcXLI+D4euDN2H4Yq33Uuw6xylbLtkf
	pwxBEod5aaX0PCpZfedBgnEmbASOL/35u3QNAeXugebFqgdzGjxRqAmyfkOsu7OcXd1bhvNICfo
	dNfzvbanK1ZpU3qQJjDHRR0KVlkZM0KRtRxFc8JOiHnlltBSDdKBDlo1PtjrlCA6laqdFOfplGs
	sgXLpMy9Cc1bH1cUr/mfBtjbRzvHKjsBvHV6K+3V4km6R0hBbj82ZUW25G55nJ0pIXuqL2Y+Epk
	Q+14k3AFk
X-Google-Smtp-Source: AGHT+IHZkwPcxsdBKPSXYxLlaLBUx97Bc9hz9RWy0cW1y4QMSeZnEmFiE09A0gElo+j/AMnGg533aQ==
X-Received: by 2002:a5d:64c7:0:b0:38d:ba8e:7327 with SMTP id ffacd0b85a97d-3911560528dmr3160653f8f.8.1741097372994;
        Tue, 04 Mar 2025 06:09:32 -0800 (PST)
Message-ID: <8a3f97d9-a7f8-4358-86c2-74dada636b1d@citrix.com>
Date: Tue, 4 Mar 2025 14:09:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/6] CI: Refresh the Debian 12 arm64 container
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1730743077.git.javi.merino@cloud.com>
 <ad9bcd46c85e738eccb2c51b42ae7d9d0d02fc5d.1730743077.git.javi.merino@cloud.com>
 <alpine.DEB.2.22.394.2411061615590.89051@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2411061615590.89051@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2024 4:23 pm, Stefano Stabellini wrote:
> On Wed, 6 Nov 2024, Javi Merino wrote:
>> Rework the container to use heredocs for readability and use
>> apt-get --no-install-recommends to keep the size down.  Rename the job
>> to debian-12-arm64-* to follow the naming scheme of all the other CI
>> jobs.
>>
>> This reduces the size of the debian:12-arm64v8 from 2.25GB down to 1.62GB.
>>
>> The container is left running the builds and tests as root to avoid
>> breaking the xilinx runners.
>>
>> Signed-off-by: Javi Merino <javi.merino@cloud.com>
>
> Hi Javi,
>
> I generated a new dependency diff, this time it should be correct, see
> the diff appended below. Most of the differences are not concerning,
> but I have a couple of questions.

Javi has moved elsewhere, so I guess I'm picking this up.

>
>
>> --- /tmp/1a	2024-11-06 16:12:09.235734221 +0000
>> +++ /tmp/2a	2024-11-06 16:12:15.203659831 +0000
>> @@ -1,36 +1,32 @@
>>  acpica-tools
>> -bcc
>> -bin86
>>  bison
>>  build-essential
>>  busybox-static
>> +ca-certificates
>>  checkpolicy
>> -clang
>>  cpio
>>  curl
>>  device-tree-compiler
>>  expect
>> +file
>>  flex
>> -git
>> -libaio-dev
> I think this one might be needed to build QEMU but given that we don't
> have any build jobs building QEMU on ARM today anymore, it could be
> removed. We are going to add a new build job to build QEMU on ARM at
> some point soon but we can add any relevant dependency back at that
> time.

Deps can be added back when (if) they're needed.  It's far easier to do
it this way around, than the other.

There's more that can be stripped, I think.

Without QEMU, we can drop libglib2.0-dev, libpixman-1-dev.

acpica-tools seems like an x86-ism to me.


I am surprised at the addition of "file".  It's listed as needed for the
test phase, but if it wasn't present before, how did things work?

That said, I really would prefer to strip out all the test container
stuff and get that working through artefacts, which will reduce test time.

>> +git-core
>> +golang-go
>> +libbz2-dev
>> +libext2fs-dev
>>  libfdt-dev
>> -libfindlib-ocaml-dev
>>  libglib2.0-dev
>>  liblzma-dev
>> -libncurses5-dev
>> -libnl-3-dev
> I think it is the same for these two

curses is for xentop.  nl-3 is for `xl colo` and surely not needed.

>
>
>> +liblzo2-dev
>>  libpixman-1-dev
>>  libyajl-dev
>> -markdown
>> -nasm
>> +libzstd-dev
>> +ocaml-findlib
>>  ocaml-nox
>> -pandoc
> The removal of pandoc and markdown both concerns me. Wouldn't this cause
> the documents under docs/ not to be built anymore?

This is intentional, because they're huge.  I'm going to do docs builds
separately, including wiring up -Werror.

>
>
>>  pkg-config
>>  python3-dev
>>  python3-setuptools
>> -transfig
>>  u-boot-qemu
>>  u-boot-tools
>>  uuid-dev
>>  wget
>> -zlib1g-dev

zlib wants to say.  It's part of the xenguest dombuilder.

~Andrew

