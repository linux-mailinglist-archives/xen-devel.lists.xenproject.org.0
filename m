Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0685844DB0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 01:16:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674190.1048970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVKk9-0001YL-6v; Thu, 01 Feb 2024 00:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674190.1048970; Thu, 01 Feb 2024 00:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVKk9-0001Vr-40; Thu, 01 Feb 2024 00:15:49 +0000
Received: by outflank-mailman (input) for mailman id 674190;
 Thu, 01 Feb 2024 00:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6jM=JK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rVKk7-0001Vf-Qk
 for xen-devel@lists.xen.org; Thu, 01 Feb 2024 00:15:47 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bbbb200-c097-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 01:15:46 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33ae3cc8a6aso231720f8f.2
 for <xen-devel@lists.xen.org>; Wed, 31 Jan 2024 16:15:46 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a5d6244000000b0033ae4a3b285sm12269746wrv.36.2024.01.31.16.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 16:15:45 -0800 (PST)
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
X-Inumbo-ID: 0bbbb200-c097-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706746546; x=1707351346; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wB6q9VBrbFIo6ekJmlUp4iZqdgxywdF1k8W9gXCxehw=;
        b=EPgaPeVNemS3jMOtjXCprzzwYgWF4vGtO+u1tI6CB2+UQBEIeJ6fRxwiy91thSJsQy
         Cgavz1WsRarSEGbN6MFldqfh4aV9R3ugrCNiR6iIsx70EGt44hbPZq9DJGz+Mb99wW32
         hdQX8+PhJZ5IUqd9Fd6tHTj8i7a+F9ttZcfV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706746546; x=1707351346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wB6q9VBrbFIo6ekJmlUp4iZqdgxywdF1k8W9gXCxehw=;
        b=edcxKaRSC0Zhor8X16zabhRJk2qg+QTHRI2uughIcByq1sjFmn0rk/a0DkLZzpPV18
         jUdmqAbv+ZOrYWiZz6uErfLC3E6+1XNS6UF8TAV864EeCTkkHXOSEAL0XKMzRMJKim0D
         ULDk709Ncu91HxQszb6lFEQYbW6s93h1kDtj0IxKbwIjhyBVZxPShfzjfVhjfawkytId
         GPhmKqwR37ssqIgBXn9+thrYYqjy4PRDGbzIU4kd087iRf70CrhT0jvzxsdG+PZeDBFA
         PYyVsEqV9JONrobCIeQKbGS7ubW+DzSC87vi0jK4RvofXtj+t52R0uiBG+hbgtNBzuP6
         i2FA==
X-Gm-Message-State: AOJu0YxlFX6aBmHZA9zTSKIdp/a8zZtPdig+ALw+WNCpOlMLa/Agr1N5
	ZeWcceCuaxRtLoJLWocL5M3gixe1jCfPKLQSd1L+0EwmKzGc3+GUgMT92+oFMQQ=
X-Google-Smtp-Source: AGHT+IHZl+S8Way3RhddZvdYpiFGMASnHvje/NzNyk855TON3IX/JgvrZNVpAONtf6zrp4V4MaVF+w==
X-Received: by 2002:a5d:4049:0:b0:33a:f51a:f7ba with SMTP id w9-20020a5d4049000000b0033af51af7bamr435736wrp.49.1706746546027;
        Wed, 31 Jan 2024 16:15:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUpLTGj+TmMpxpItyXt1HUMuJQgnCzdG5KlQS+4HIeEJGoApfGbq64860OqwH2HtdMGiFKSz2bLkxYpD3K3eCx+r9KdvZGtkB7TCl52l9F74DLxBd8Xbw8tN6Ov4w==
Message-ID: <d0cd33d9-a147-4e6c-9b09-6371a4f25f28@citrix.com>
Date: Thu, 1 Feb 2024 00:15:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Nullifying Recently Introduced Xen Headers Check
Content-Language: en-GB
To: "John L. Poole" <johnlpoole@proton.me>, xen-devel@lists.xen.org,
 David Woodhouse <dwmw2@infradead.org>
References: <fb379476-f6ae-4eb7-b3c6-6f0ad175964d@proton.me>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fb379476-f6ae-4eb7-b3c6-6f0ad175964d@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/02/2024 12:05 am, John L. Poole wrote:
> Greetings,
>
> Gentoo Linux maintains two packages for Xen:
>
>    1) app-emulation/xen-tools ("xen-tools")
>    2) app-emulation/xen ("xen")
>
> xen-tools is a prerequisite to xen.  So a failure
> to install xen-tools will preclude any attempt to install xen.
> I acknowledge that building xen-tools before building xen
> is backwards and/or runs contrary to your project's way of
> building, but that is what the Gentoo paradigm has been.
>
> In trying to troubleshoot why a Gentoo 4.18.0 ebuild fails,
> I ended up downloading your archive and successfully building it.
> I then decided to compare the products built to see where
> they varied in processing order.  The Xen Project builds xen first,
> then the tools.
>
> To see a visualization of the to build systems and the object
> files they create matched in chronological order, see:
>
> https://salemdata.us/xen/gentoo-4.18.0/comparison_of_build_orders_Xen_4.18.xhtml
>      or the LibreOffice workbook I created the comparison in:
> https://salemdata.us/xen/gentoo-4.18.0/comparison_of_build_orders_Xen_4.18.ods
>
> In March 2023, this commit added some sort of headers check:
>
> https://xenbits.xen.org/gitweb/?p=qemu-xen.git;a=commit;f=include/hw/xen/xen_native.h;h=e2abfe5ec67b69fb310fbeaacf7e68d61d16609e
>
> Specifically, the lines 4-6 in [qemu-xen.git] / include / hw / xen /
> xen_native.h:
>
>     4 #ifdef __XEN_INTERFACE_VERSION__
>     5 #error In Xen native files, include xen_native.h before other Xen
> headers
>     6 #endif
>
> cause Gentoo's build to error out.  See line 24790:
>
>     5 | #error In Xen native files, include xen_native.h before other
> Xen headers
>
> at https://salemdata.us/xen/xen_tools_20240128_Sun_174740.script.html.
>
> What I have done is create a patch for a draft Gentoo ebuild which nullifies
> lines 4-6 by wrapping them in a comment:
>
>      --- a/tools/qemu-xen/include/hw/xen/xen_native.h
>      +++ b/tools/qemu-xen/include/hw/xen/xen_native.h
>      @@ -1,9 +1,9 @@
>       #ifndef QEMU_HW_XEN_NATIVE_H
>       #define QEMU_HW_XEN_NATIVE_H
>
>      -#ifdef __XEN_INTERFACE_VERSION__
>      +/* #ifdef __XEN_INTERFACE_VERSION__
>       #error In Xen native files, include xen_native.h before other Xen
> headers
>      -#endif
>      +#endif */
>
> This patch allows the Gentoo xen-tools ebuild to successfully build.
>
> Question: is there a risk nullifying the above 3 lines in xen_native.h
> given Gentoo's backward build paradigm?

CC'ing David who authored that Qemu patch.  He'll be best placed to answer.

However, as a word of warning if you're not aware.  The name
__XEN_INTERFACE_VERSION__ is massively dishonest; read it as if it said
"unstable interfaces".

We're working to stabilise the tools->xen interface, but the nice shiny
future is still a while away.

~Andrew

