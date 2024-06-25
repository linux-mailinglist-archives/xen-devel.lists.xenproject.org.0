Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D00C9172E8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 23:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748100.1155675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMDJP-0003Dt-SV; Tue, 25 Jun 2024 21:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748100.1155675; Tue, 25 Jun 2024 21:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMDJP-0003BD-Om; Tue, 25 Jun 2024 21:02:47 +0000
Received: by outflank-mailman (input) for mailman id 748100;
 Tue, 25 Jun 2024 21:02:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vmrN=N3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sMDJO-0003B7-3F
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 21:02:46 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 443aa275-3336-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 23:02:43 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-424a2dabfefso11616265e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 14:02:43 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638d9b8a8sm13868248f8f.50.2024.06.25.14.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 14:02:43 -0700 (PDT)
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
X-Inumbo-ID: 443aa275-3336-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719349363; x=1719954163; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IM2ODf7O1MrqUMtcbzyQsPK7i2h78DBHiijlWHd+KcY=;
        b=AXbiTe4Lt815qSGiI33b2tYcSDB1406CkXMC1ZfeNWd8ACcZXpn1xYZk+lsdOF5gNN
         mgq4p+qqL6iFR419HmehLx45oW4l3o8OlxTNpKIBXZL3gptV6z1mR56iVf6P8a6PZI18
         XZzFSUb5fLq9ppVVScLp51s3wiNn9ri0+YSO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719349363; x=1719954163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM2ODf7O1MrqUMtcbzyQsPK7i2h78DBHiijlWHd+KcY=;
        b=CMpIlMGUcaK3+35odb6Ukg4/E6yZJyFnBQ+O6bCQ5Ua+Mi834PTOEhqvXdl3kPdkee
         S/XcSSSesSsrfzLEsgy8HEkEq+TZ/EV1m5eZ6tenKPe9o365a81y4ZUBWQ8bZONxRW2K
         jOaafnyScOmnS3K9Fv5FqMHFtTm140TkadAvp+0y9Et8M7F38xjwcsfGcEylGKCdMf43
         1b1P9oMp3lZDAyYqjQNOTikMNJJihjEfkqDvQerKhp3Qt1dxsLZeVfXDYEfQz4EbbmsM
         o8gjgd+UnbYBCU0msEiaodR+jkSr5/wLx55mBiWg5P6Hk5NAecpkHybVGlkK/NEChI12
         OZgA==
X-Forwarded-Encrypted: i=1; AJvYcCWZmSx5871NxhSQTN1uXjif96J6d+jcifScImoNh74Yu1kB93Tk289kCVQcECBz4z3bezQ2mGqXfDWxUj30rS51FNxYr5YZgpU3qGwjap8=
X-Gm-Message-State: AOJu0YwctYSuMOcbWU+Ca7jNUL7B8DDN1VRdIS+KaPa8Xq0T7FYk0yFH
	I0x3e+Mv1DawCw8sfqtiOeDiKwuIW6zACISxgE442EcHsvqpzUtxw54jAMKOI+xgXtjNbYrx0gt
	8Ebqgxg==
X-Google-Smtp-Source: AGHT+IFMPGbEAZOqpW1QdybOfZpsVhnoEcuo3LlRJKRJVQUOd9p7DFx8VgYEj6lMOsoP2ZqUlxc0GA==
X-Received: by 2002:a05:6000:1847:b0:366:eba0:8d8c with SMTP id ffacd0b85a97d-366eba08d93mr8789216f8f.54.1719349363330;
        Tue, 25 Jun 2024 14:02:43 -0700 (PDT)
Message-ID: <7ffabe8b-7993-4cc5-97fe-dd1cbd35798e@citrix.com>
Date: Tue, 25 Jun 2024 22:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] tools/misc: xen-hvmcrash: Inject #DF instead of
 overwriting RIP
To: Matthew Barnes <matthew.barnes@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>
References: <27f4397093d92b53f89d625d682bd4b7145b65d8.1717426439.git.matthew.barnes@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <27f4397093d92b53f89d625d682bd4b7145b65d8.1717426439.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/06/2024 3:59 pm, Matthew Barnes wrote:
> xen-hvmcrash would previously save records, overwrite the instruction
> pointer with a bogus value, and then restore them to crash a domain
> just enough to cause the guest OS to memdump.
>
> This approach is found to be unreliable when tested on a guest running
> Windows 10 x64, with some executions doing nothing at all.
>
> Another approach would be to trigger NMIs. This approach is found to be
> unreliable when tested on Linux (Ubuntu 22.04), as Linux will ignore
> NMIs if it is not configured to handle such.
>
> Injecting a double fault abort to all vCPUs is found to be more
> reliable at crashing and invoking memdumps from Windows and Linux
> domains.

Why every CPU?

We never did that before, and I don't see any it ought to be necessary
now either.



> diff --git a/tools/misc/xen-hvmcrash.c b/tools/misc/xen-hvmcrash.c
> index 1d058fa40a47..8ef1beb388f8 100644
> --- a/tools/misc/xen-hvmcrash.c
> +++ b/tools/misc/xen-hvmcrash.c
> @@ -38,22 +38,21 @@
>  #include <sys/stat.h>
>  #include <arpa/inet.h>
>  
> +#define XC_WANT_COMPAT_DEVICEMODEL_API

Please don't introduce this.  We want to purge it from the codebase, not
propagate it.

You want to open and use a libxendevicemodel handle.  (Sadly you also
need a xenctrl handle too, until we sort out the userspace ABIs).

>  #include <xenctrl.h>
>  #include <xen/xen.h>
>  #include <xen/domctl.h>
>  #include <xen/hvm/save.h>
>  
> +#define X86_ABORT_DF 8

#include <xen/asm/x86-defns.h>

and use X86_EXC_DF.

~Andrew

