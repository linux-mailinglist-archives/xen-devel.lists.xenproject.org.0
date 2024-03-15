Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B476387CC09
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 12:13:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693789.1082363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Up-000317-FR; Fri, 15 Mar 2024 11:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693789.1082363; Fri, 15 Mar 2024 11:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Up-0002z5-Cw; Fri, 15 Mar 2024 11:13:07 +0000
Received: by outflank-mailman (input) for mailman id 693789;
 Fri, 15 Mar 2024 11:13:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9knB=KV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rl5Un-0002yz-T2
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 11:13:05 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd9dadac-e2bc-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 12:13:03 +0100 (CET)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-789de1f59feso98226385a.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 04:13:03 -0700 (PDT)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 dc33-20020a05620a522100b007885cd1c058sm1929059qkb.103.2024.03.15.04.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 04:13:02 -0700 (PDT)
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
X-Inumbo-ID: fd9dadac-e2bc-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710501183; x=1711105983; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TH4oZKWsSpsm50Au/stOiDvSfimGlrtLfYhMA69EASM=;
        b=U2OzfFIVelUG0OPWW+7Kd2L/n//3E4Tvneb0m6/SEmYpMWE5By12z/quyXKoY5qDGH
         YD5U2tHiHGb93uTcUYsapBWEEYKv1Hs6iw8WasBq0Z3KdD4GXYsMWYY2W6yTt0Xv8dw8
         H65dyrJZ53zg309TtzKxU9hLG5Fz2YrPzISns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710501183; x=1711105983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TH4oZKWsSpsm50Au/stOiDvSfimGlrtLfYhMA69EASM=;
        b=cIZs8ep9qFLAS9cW5LwqXTytBNQI72iup19TnhP+94uskLP+df6dzfO+xwAQAqZ2YU
         ui6Q7wFvcuAyY7FkkzTKAU2b1VWsWSb6TBKzjfqQ7E9uw0O3MrHgtxmFTAGzk1i4Qj8P
         tCKcmlmU0LxN6ebHo5vSdMvuEjr83VWz6CwsnlTCF/O2pddnlv/FettaHZD/VX+hG75g
         RHVDk/HgxzlUIQ/WchVVKvwwbKQn+bTv+XX+GHGuUWkbXupbXkrWAG4PCYbC5d2QnXsq
         nKuHlpTfbKRVqM91hQjUeHF+KPQKPFkGehptxJkx3Pg8QYEBkjOs0bblsJZj78LCJpND
         VJcA==
X-Forwarded-Encrypted: i=1; AJvYcCVz42NKhwzrDHcYGknLt9WXXXHrJucDJ/rfFDYT1jXNnHMHEEEOKTpfwCpmw+2WfgRONn+kA01OGTC7/ZA89NvZB1ePtgJ4sHYTIokTQJU=
X-Gm-Message-State: AOJu0Yyt34NKJIU+gXPxc1FOxOctfrt2UL9PSPMpJOumIpOuNXrWN+6/
	zMvb0CAzYa5YceG1FeHZ/9H/3EIXsK/XiJeSy11xTxmiv3vkixBkzG86i2sElws=
X-Google-Smtp-Source: AGHT+IF0RF8eP42+G5vXE7DU8L5+KV19LL5nEUsrAFC0mtTocqvnBzvW7BXp5hW40aLri8akp1GhFQ==
X-Received: by 2002:a05:620a:cf2:b0:789:d334:619c with SMTP id c18-20020a05620a0cf200b00789d334619cmr4503526qkj.29.1710501182604;
        Fri, 15 Mar 2024 04:13:02 -0700 (PDT)
Message-ID: <9958b4cc-a6a5-4370-b87e-3e2facf7ee5f@citrix.com>
Date: Fri, 15 Mar 2024 11:13:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: x86/bitops and MISRA C:2012 Rule 5.5
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <42d630c9-e311-4e17-9fae-e14ec81a339e@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <42d630c9-e311-4e17-9fae-e14ec81a339e@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/03/2024 11:07 am, Federico Serafini wrote:
> Hello everyone,
>
> there are violations of Rule 5.5 ("Identifiers shall be distinct
> from macro names") in xen/arch/x86/include/asm/bitops.h.
> You can see them at [1].
>
> Do you agree to distinguish between function-like macros and
> inline functions by adding a suffix to the functions?

Please see the other bitops thread, which you're also CC'd on.

Although it's not got to these functions yet, this is going to be fixed
by having set_bit() be common, and arch_set_bit() be the per-arch
implemenation.

Neither _unsafe nor _nocheck are remotely appropriate here.

~Andrew

