Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2B86AC2F0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 15:18:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506963.780188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZBfd-0001E7-FC; Mon, 06 Mar 2023 14:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506963.780188; Mon, 06 Mar 2023 14:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZBfd-0001BC-C9; Mon, 06 Mar 2023 14:18:33 +0000
Received: by outflank-mailman (input) for mailman id 506963;
 Mon, 06 Mar 2023 14:18:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4jh=66=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pZBfc-0001B6-Fa
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 14:18:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3e82a70-bc29-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 15:18:29 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-Nj0kTPHFM9C-RtqlKixEnw-1; Mon, 06 Mar 2023 09:18:27 -0500
Received: by mail-wm1-f71.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so3631737wms.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Mar 2023 06:18:26 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-59.web.vodafone.de.
 [109.43.177.59]) by smtp.gmail.com with ESMTPSA id
 g40-20020a05600c4ca800b003eb3933ef10sm10076844wmp.46.2023.03.06.06.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:18:25 -0800 (PST)
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
X-Inumbo-ID: c3e82a70-bc29-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678112308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mbkz7IRHAR6Gk1TwwjGuAsPHXnfma+ZrprMAvR7H3bE=;
	b=cUvCgz/1TOpzETe9v9/qhb1vtRanSRVtiwRKMOx5m3cAMGtnbIs0Wfcz5QpzV+VCSL5zUk
	nMfb+zDYgRppITaBxRUeNQUwc9v8/ZJis+j7cuCXNklMqvRzMjHtL1b1L5N3APpS6CZST2
	lNcuoeeB75NnrLoQs59Wrwr/UGvvr1U=
X-MC-Unique: Nj0kTPHFM9C-RtqlKixEnw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678112306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mbkz7IRHAR6Gk1TwwjGuAsPHXnfma+ZrprMAvR7H3bE=;
        b=ZZRZOoLq/IqJHAdv7xl+rX6A+yt8nMek4GFXeEmsqPBOf0Kdy+OGItcEBxLHXhh3GY
         wzph7sR8QyYO9LHBAIDmzzeQ/SYsxnc/TWSwDaGLpKvi22aWb1hL0P+BIX3EzVLV7f54
         p1AW8tJmgEjelUfmZazOAyg9R5dP3SCxu1ZngNfG0JtxZBRwTSgIg5X2Rr05UZ8zf+TJ
         J5yWFDeCDlnC7HzKOCz6cEBz+nFWuCLNdJesQcI/KfaCRcmoTSMcjqbd4fKoKA7bhxEN
         nVqPEpa1j9jZoFzhRsOBtf4X88iH5ieaGJ9vJTC+VhmUvab8A9rLBfoTx/VtgBvqR52R
         sosg==
X-Gm-Message-State: AO0yUKUrJ5QTs3akOT+O+31ZforJHJB3FWKqPdtp544bt+Mg7v9CFTAH
	G4ci85fA7XKBf8G+TEe1BVwyn/hPFgmG4H+HJgLJPd103CHW8QREb13r+2ObkAVzVAnI7UNUcmd
	8rQ5Vpf+OsGjWBjZYW08eJhfmnIg=
X-Received: by 2002:a05:600c:198e:b0:3eb:36fa:b78d with SMTP id t14-20020a05600c198e00b003eb36fab78dmr9109242wmq.23.1678112305985;
        Mon, 06 Mar 2023 06:18:25 -0800 (PST)
X-Google-Smtp-Source: AK7set/MR21FgoX8RyVFXUFY4MzV72bl/PWGUpJmW46y4RO7kLsnJJfonvCikk1sHoHsw2wpQdbBPg==
X-Received: by 2002:a05:600c:198e:b0:3eb:36fa:b78d with SMTP id t14-20020a05600c198e00b003eb36fab78dmr9109217wmq.23.1678112305735;
        Mon, 06 Mar 2023 06:18:25 -0800 (PST)
Message-ID: <7f1501ba-f875-b227-8d7e-f43e69b2ab8d@redhat.com>
Date: Mon, 6 Mar 2023 15:18:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com> <ZAWx5eBskd1cItDx@redhat.com>
 <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
 <ZAXzUIs6wODe7/hf@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZAXzUIs6wODe7/hf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/03/2023 15.06, Daniel P. Berrangé wrote:
> On Mon, Mar 06, 2023 at 02:48:16PM +0100, Thomas Huth wrote:
>> On 06/03/2023 10.27, Daniel P. Berrangé wrote:
>>> On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
>>>> [...] If a 32-bit CPU guest
>>>> +environment should be enforced, you can switch off the "long mode" CPU
>>>> +flag, e.g. with ``-cpu max,lm=off``.
>>>
>>> I had the idea to check this today and this is not quite sufficient,
>> [...]
>>> A further difference is that qemy-system-i686 does not appear to enable
>>> the 'syscall' flag, but I've not figured out where that difference is
>>> coming from in the code.
>>
>> I think I just spotted this by accident in target/i386/cpu.c
>> around line 637:
>>
>> #ifdef TARGET_X86_64
>> #define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
>> #else
>> #define TCG_EXT2_X86_64_FEATURES 0
>> #endif
> 
> Hmm, so right now the difference between qemu-system-i386 and
> qemu-system-x86_64 is based on compile time conditionals. So we
> have the burden of building everything twice and also a burden
> of testing everything twice.
> 
> If we eliminate qemu-system-i386 we get rid of our own burden,
> but users/mgmt apps need to adapt to force qemu-system-x86_64
> to present a 32-bit system.
> 
> What about if we had qemu-system-i386 be a hardlink to
> qemu-system-x86_64, and then changed behaviour based off the
> executed binary name ?

We could also simply provide a shell script that runs:

  qemu-system-x86_64 -cpu qemu32 $*

... that'd sounds like the simplest solution to me.

  Thomas


