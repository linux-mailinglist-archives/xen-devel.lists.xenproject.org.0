Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2700B7D80C7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 12:31:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623671.971732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxe9-0005pw-0X; Thu, 26 Oct 2023 10:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623671.971732; Thu, 26 Oct 2023 10:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxe8-0005nd-UE; Thu, 26 Oct 2023 10:31:24 +0000
Received: by outflank-mailman (input) for mailman id 623671;
 Thu, 26 Oct 2023 10:31:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ziZY=GI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qvxe7-0005nU-I9
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 10:31:23 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd3c9ea5-73ea-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 12:31:19 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9a58dbd5daeso113748366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Oct 2023 03:31:19 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u17-20020a509511000000b0053e163a1ca0sm11378893eda.1.2023.10.26.03.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 03:31:19 -0700 (PDT)
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
X-Inumbo-ID: cd3c9ea5-73ea-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698316279; x=1698921079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HTxNygwx+tdoV2KIQS0h6gWSMPFZCSB+pSLkpBZb9Bg=;
        b=GGnVq09R1L9rMph4QgjOUE+SB6/fCLJtcJbZfvv59HLPsU+9rX3xhw/iTUqe4XtwrY
         qtYXx8xwFfrit8l8emngGCeKgozZ+mfjAmiyPumifR2P/EEMuw8IWHlNWJIYj9vCsx6h
         5WmpifaECw9X3l1AQ8OWmO3PKEcxI3Q3ozOOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698316279; x=1698921079;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTxNygwx+tdoV2KIQS0h6gWSMPFZCSB+pSLkpBZb9Bg=;
        b=iHEyek9kJ22HxtlwOzMosqOzb7xHphdPMHVrq75LxJ6jjm3vhLuRiWQpbjcLz1r0Va
         Bh0O2EgZjFAYYfqZfQJs7YvBDsasWBypSanTwqeJGjBR223V9r+SytoKkUzljACmGW7C
         5JdQtGu5YUdC+TVModBqEFWl/xdonAgZ2MOpzI+IrfvxzzbLQwjO1ISbmJna/t2zSjHD
         3264plXTHAHvTlTr09OcFxnePTr5DJ6pOFeumdHKU6DaAQOok+ByOsmV8TpjJzhb/dXQ
         gxoOh2LoMNX/o6ii0fAgCQ/4jQKcB8Onh6Yf652UhkE13xqESec4+dmGYVnfZ3typzIe
         RhjA==
X-Gm-Message-State: AOJu0YyEMGQOtAoJaRAbblPpp/1F6aSAxcOAarZWK2IoiIYHMhLYyZhM
	R8kCFSkgz+Ojpy8djz3/kqfamw==
X-Google-Smtp-Source: AGHT+IHighws0G/sb5dSqe+M4H0gjXCmEzp91lOqL3SVNVmCi/gr0zThuiPp5RvKwPu+ollhAabN7w==
X-Received: by 2002:a17:907:1c27:b0:9bf:697b:8f44 with SMTP id nc39-20020a1709071c2700b009bf697b8f44mr14258322ejc.6.1698316279313;
        Thu, 26 Oct 2023 03:31:19 -0700 (PDT)
Message-ID: <cc4c6681-a788-4069-8470-730969018fd0@citrix.com>
Date: Thu, 26 Oct 2023 11:31:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Content-Language: en-GB
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
 <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
 <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2023 9:34 am, Xenia Ragiadakou wrote:
> On 26/10/23 10:35, Jan Beulich wrote:
>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>> Given that start < kernel_end and end > kernel_start, the logic that
>>> determines the best placement for dom0 initrd and metadata, does not
>>> take into account the two cases below:
>>> (1) start > kernel_start && end > kernel_end
>>> (2) start < kernel_start && end < kernel_end
>>>
>>> In case (1), the evaluation will result in end = kernel_start
>>> i.e. end < start, and will load initrd in the middle of the kernel.
>>> In case (2), the evaluation will result in start = kernel_end
>>> i.e. end < start, and will load initrd at kernel_end, that is out
>>> of the memory region under evaluation.
>> I agree there is a problem if the kernel range overlaps but is not fully
>> contained in the E820 range under inspection. I'd like to ask though
>> under what conditions that can happen, as it seems suspicious for the
>> kernel range to span multiple E820 ranges.
> 
> We tried to boot Zephyr as pvh dom0 and its load address was under 1MB.
> 
> I know ... that maybe shouldn't have been permitted at all, but
> nevertheless we hit this issue.


Zephyr is linked to run at 4k.  That's what the ELF Headers say, and the
entrypoint is not position-independent.

So trying to put the binary anywhere else is going to work about as well
having the notes section misalign the pagetables by 0x20 bytes[1].

~Andrew

[1] Guess what was causing the "Zephyr doesn't boot PVH" issues.  Which
is doubly irritating because about 6h of debugging prior, I'd pointed
out that the linker was complaining about an orphaned section and that
that ought to be fixed before trying to debug further...

