Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC8F6C14A0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 15:24:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511948.791414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peGQL-00063T-6N; Mon, 20 Mar 2023 14:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511948.791414; Mon, 20 Mar 2023 14:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peGQL-00061V-3W; Mon, 20 Mar 2023 14:23:45 +0000
Received: by outflank-mailman (input) for mailman id 511948;
 Mon, 20 Mar 2023 14:23:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cnb9=7M=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1peGQJ-00061P-Ef
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 14:23:43 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0030f8f-c72a-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 15:23:41 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 l15-20020a05600c4f0f00b003ed58a9a15eso7622675wmq.5
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 07:23:41 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p9-20020a1c5449000000b003dc1d668866sm16596895wmi.10.2023.03.20.07.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 07:23:40 -0700 (PDT)
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
X-Inumbo-ID: d0030f8f-c72a-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679322221;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wDFPVnK26gTPvQ7OQnmaMHAo8uxTCxn0wjupc66n0+g=;
        b=iupUAOLOVvIo5M2FeGbu2pABScMqZ1WtjEgwgzAmbLp8n1wBphdMsJVh/nBr2ctxaq
         niYu4FF+KJTk+QSzJev4lNK//Wy/Yhv2xD0lLuBLZslRJqBIMiTdxNYJxSEs1KxrsHJR
         HXKgVtUZ7tM96cRGbKte3pAoXlUVUeGIklTPLppMnqAsDyzgnvesrxlGGjLmAxHwP2Z8
         oOTJXlxwRgHOZRq+NQU2XjlOeW0QinUZw0n+V/hg5OrnJccCE8/JVuMQzPi0BC01UBxH
         +gRQI2RsNKHxJHJ8loygXyNNQB1Q6krKKZ6IgKVxC7ORtE9QtzBgoDcVrwecwQ2JsPM+
         E8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679322221;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wDFPVnK26gTPvQ7OQnmaMHAo8uxTCxn0wjupc66n0+g=;
        b=TzU5+94KNvpBQ4w3vBYaH7Y5s6uHb++owc5//HLcLZcr/dtlykDDtRGLJripO0vDqx
         40/QfPWFW55xK9Z0BxKvIZnCmXDT2rIi17tQpHaMWB/BUI5MvkVzLjXj7KJ0vAA7+Qev
         hRhK6HDFg8Ss+O3I2Ul+gBBItQA/5PKngskbyqbT2IHU7cTkOickA64cXZfJmBv3lh1b
         ciUV35kk19xgXS5k9jGql55q/qYgUNb9OMO+j3GYJT9u8X1ZmzrOd1X3XOcsyhtVIRk/
         3OLUcDAPmB9qKZJP/KIx5xzW53R1dBlgfNaEEEepXGRYbusJB71nCF7TgUHAMz1ZGxt1
         c4wA==
X-Gm-Message-State: AO0yUKVvPN7TgHXUm5ZZwFxcEQqzUVqVGrlgNC6xYKGwhrzAiAp9rJzT
	AWIcm9/MqboLhUJvSMGa60rDVQ==
X-Google-Smtp-Source: AK7set/aRqtnWw0m8lIYSvCcTJKy8bYXEjcr1/Crqm07tlo2b+OzQuFfio36H5QqfOmps9fL+g8D5g==
X-Received: by 2002:a05:600c:3b24:b0:3ed:296b:4899 with SMTP id m36-20020a05600c3b2400b003ed296b4899mr26844308wms.15.1679322220744;
        Mon, 20 Mar 2023 07:23:40 -0700 (PDT)
Message-ID: <cdf53d5e-d74d-9316-f1bc-3efc36e1c3bc@linaro.org>
Date: Mon, 20 Mar 2023 15:23:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.1 4/5] bulk: Do not declare function prototypes
 using extern keyword
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Riku Voipio <riku.voipio@iki.fi>,
 Marcelo Tosatti <mtosatti@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20230320134219.22489-1-philmd@linaro.org>
 <20230320134219.22489-5-philmd@linaro.org> <ZBhkIjelEtR7lckj@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZBhkIjelEtR7lckj@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/3/23 14:48, Daniel P. Berrangé wrote:
> On Mon, Mar 20, 2023 at 02:42:18PM +0100, Philippe Mathieu-Daudé wrote:
>> By default, C function prototypes declared in headers are visible,
>> so there is no need to declare them as 'extern' functions.
>> Remove this redundancy in a single bulk commit; do not modify:
>>
>>    - meson.build (used to check function availability at runtime)
>>    - pc-bios
>>    - libdecnumber
>>    - *.c
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   block/dmg.h                    |  8 +++----
>>   bsd-user/bsd-file.h            |  6 ++---
>>   crypto/hmacpriv.h              | 13 +++++------
>>   hw/xen/xen_pt.h                |  8 +++----
>>   include/crypto/secret_common.h | 14 +++++-------
>>   include/exec/page-vary.h       |  4 ++--
>>   include/hw/misc/aspeed_scu.h   |  2 +-
>>   include/hw/nvram/npcm7xx_otp.h |  4 ++--
>>   include/hw/qdev-core.h         |  4 ++--
>>   include/qemu/crc-ccitt.h       |  4 ++--
>>   include/qemu/osdep.h           |  2 +-
>>   include/qemu/rcu.h             | 14 ++++++------
>>   include/qemu/sys_membarrier.h  |  4 ++--
>>   include/qemu/uri.h             |  6 ++---
>>   include/sysemu/accel-blocker.h | 14 ++++++------
>>   include/sysemu/os-win32.h      |  4 ++--
>>   include/user/safe-syscall.h    |  4 ++--
>>   target/i386/sev.h              |  6 ++---
>>   target/mips/cpu.h              |  4 ++--
>>   tcg/tcg-internal.h             |  4 ++--
>>   tests/tcg/minilib/minilib.h    |  2 +-
>>   include/exec/memory_ldst.h.inc | 42 +++++++++++++++++-----------------
>>   roms/seabios                   |  2 +-
> 
> Accidental submodule commit.,
> 
>>   23 files changed, 84 insertions(+), 91 deletions(-)
>>
>> diff --git a/block/dmg.h b/block/dmg.h
>> index e488601b62..ed209b5dec 100644
>> --- a/block/dmg.h
>> +++ b/block/dmg.h
>> @@ -51,10 +51,10 @@ typedef struct BDRVDMGState {
>>       z_stream zstream;
>>   } BDRVDMGState;
>>   
>> -extern int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
>> -                                 char *next_out, unsigned int avail_out);
>> +int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
>> +                          char *next_out, unsigned int avail_out);
>>   
>> -extern int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
>> -                                   char *next_out, unsigned int avail_out);
>> +int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
>> +                            char *next_out, unsigned int avail_out);
> 
> These are variable declarations, so with this change you'll get multiple
> copies of the variable if this header is included from multiple source
> files. IOW, the 'extern' usage is correct.

Doh indeed, good catch, thanks.

>> diff --git a/roms/seabios b/roms/seabios
>> index ea1b7a0733..3208b098f5 160000
>> --- a/roms/seabios
>> +++ b/roms/seabios
>> @@ -1 +1 @@
>> -Subproject commit ea1b7a0733906b8425d948ae94fba63c32b1d425
>> +Subproject commit 3208b098f51a9ef96d0dfa71d5ec3a3eaec88f0a
> 
> Nope !

Oops...


