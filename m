Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879637DA136
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 21:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624627.973221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwSLf-0001xH-6L; Fri, 27 Oct 2023 19:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624627.973221; Fri, 27 Oct 2023 19:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwSLf-0001v3-3b; Fri, 27 Oct 2023 19:18:23 +0000
Received: by outflank-mailman (input) for mailman id 624627;
 Fri, 27 Oct 2023 19:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHDA=GJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qwSLe-0001ux-4J
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 19:18:22 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96d09794-74fd-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 21:18:20 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9adb9fa7200so497559366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 12:18:20 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l17-20020a170906415100b009adc77fe165sm1603874ejk.118.2023.10.27.12.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 12:18:19 -0700 (PDT)
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
X-Inumbo-ID: 96d09794-74fd-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698434300; x=1699039100; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kQS3fk6DrReVt//epBsd12Yew4UIfltY3twEPZTSjhk=;
        b=Jmu4zBvtr/65MHcnamfiOrZj+vMXyoV7BjS7drAzZoe5upMr/cvn15yH8znCDXNzwt
         l6vvf+Hr5XN3fABrLJiGllCSgNdOLJaa3UtgqKLtA9WThBRxxBTqqKWEA9nTmayoLty3
         dhWv3BDNxU3oXVrRONa/i+2QKZVpfPwjqnKbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698434300; x=1699039100;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQS3fk6DrReVt//epBsd12Yew4UIfltY3twEPZTSjhk=;
        b=T4eKHw6wJZ35wHMPKUOQXrVR/9Q3Vd129u7a5azsmvLqnvRjgpDy2OiF6nx78AIMgh
         ttWZC7MsVUFI4OFMEulDWFFXXc1f8FwoR5pch/7X55KzNEOAe+O0teCxS9UT04S4bxhN
         tqWrKBLmSsio3FXjV5Q/nFEQYQMEJ8JpmehifDA9j55k1gupiJCgS3wRnxt5YOPiwnGB
         XWJspyMSdo8fQXTqq6RbU2cFSmS4ZdIa98slvAyCgGl+9AxDZQ//bhWGwb+T6rpqyHp8
         B7dNxFQXMBl1H+e+T+2UrnIOa0Wc71AZzonnajpmbssplRQQqgDcRd9dsvN9+WH3vxYF
         rFsQ==
X-Gm-Message-State: AOJu0YxEQQSiZKlGJhXRPVkNdZSUrUyN+bpygpwSs/qef4d9LGi6/ISU
	qThqdcT29v+9vnJQ9AztjYuMKg==
X-Google-Smtp-Source: AGHT+IFBYEI+8p4l+jn//eUrgVqxrBWgkV0DecSBixAAPOyM0c9Y75A3SJmU6kQdrYqBmF6DhPB19w==
X-Received: by 2002:a17:907:7206:b0:9cd:26e9:a8af with SMTP id dr6-20020a170907720600b009cd26e9a8afmr3761177ejc.21.1698434299744;
        Fri, 27 Oct 2023 12:18:19 -0700 (PDT)
Message-ID: <997218cb-b1d3-4fa8-a098-10849a54c592@citrix.com>
Date: Fri, 27 Oct 2023 20:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231026205539.3261811-1-andrew.cooper3@citrix.com>
 <20231026205539.3261811-3-andrew.cooper3@citrix.com>
 <70472259-6429-e60f-7cdc-faa50b2d257f@suse.com> <ZTu_WxdWTrthCs4m@macbook>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZTu_WxdWTrthCs4m@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/10/2023 2:47 pm, Roger Pau Monné wrote:
> On Fri, Oct 27, 2023 at 09:12:40AM +0200, Jan Beulich wrote:
>> On 26.10.2023 22:55, Andrew Cooper wrote:
>>> We eventually want to be able to build a stripped down Xen for a single
>>> platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
>>> available to randconfig), and adjust the microcode logic.
>>>
>>> No practical change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>> CC: Stefano Stabellini <stefano.stabellini@amd.com>
>>> CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>>
>>> I've intentionally ignored the other vendors for now.  They can be put into
>>> Kconfig by whomever figures out the actual dependencies between their init
>>> routines.
>>>
>>> v2:
>>>  * Tweak text
>> What about the indentation issues mentioned in reply to v1?
>>
>> As to using un-amended AMD and INTEL - Roger, what's your view here?
> I think it would be good to add a suffix, like we do for
> {AMD,INTEL}_IOMMU options, and reserve the plain AMD and INTEL options
> as platform/system level options that enable both VENDOR_{CPU,IOMMU}
> sub options.
>
> So yes, {INTEL,AMD}_CPU seems a good option.

Really?  You do realise that, unlike the IOMMU names, this is going to
be plastered all over the Makefiles and header files?

And it breaks the careful attempt not to use the ambigous term when
describing what the symbol means.

I'll send out a v2.5 so you can see it in context, but I'm going to say
straight up - I think this is a mistake.

~Andrew

