Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C72EEA13863
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 11:58:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873495.1284472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYNZq-00027r-Um; Thu, 16 Jan 2025 10:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873495.1284472; Thu, 16 Jan 2025 10:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYNZq-00024x-Rh; Thu, 16 Jan 2025 10:58:18 +0000
Received: by outflank-mailman (input) for mailman id 873495;
 Thu, 16 Jan 2025 10:58:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EPy+=UI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tYNZq-00024r-7i
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 10:58:18 +0000
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [2a00:1450:4864:20::542])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9cae44e-d3f8-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 11:58:16 +0100 (CET)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-5d0ac27b412so1077682a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 02:58:16 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905ecb7sm890094966b.26.2025.01.16.02.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 02:58:11 -0800 (PST)
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
X-Inumbo-ID: c9cae44e-d3f8-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737025096; x=1737629896; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j/pgzfJHVhqJBf5aofeh4mqtiSZ1isoUvxZ/YYTT6lc=;
        b=gEF/SVOdaR6Wxsa4IwoLd4a8Zt4Hx55nM4DulpZYyXtrACXZUZRLxZIeRF/Xfe1UXZ
         /Ebfskr4yuAnOf6awHu5oE9QX2qfCQCBwMVbYV2Ixc779MmBsbtZ9OJ3JnbLvIigQd7I
         01qKQ9SlCWNBoNzvKnpThdFMcTqi5mbO5XzZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737025096; x=1737629896;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/pgzfJHVhqJBf5aofeh4mqtiSZ1isoUvxZ/YYTT6lc=;
        b=GSxaqWfMLjkM+esgvGMbnM/vG9KbPrMTS+Cmw0Z1Bj/amcQGJd9QC1qSRUTXHCidRw
         xbbgvhFTUO0gmRw4HmDJRT7HYyA3ZI1VTpqYUpP+70OrvA+EKxHFSMjP840dQe88EjFB
         +g7IfiKPlIJRiazO/RaAlQU7ApO+iWNzZZuNHizEwzVzj5Uk2WiKC/9wFRg0pZRWR505
         rs/zLJQjuMUw9kaA5Se30dlxpy42m1MFxiyleuLI8PMWUGi9MWAmUmwETrdVCIhr1GxL
         msWykQ4IQwjYa+Ij6yq4Mq5/mqNCB2D4tZvsWQ3dVFHZABeSv+tKTZrJpN/TDMDjL7KT
         djpg==
X-Forwarded-Encrypted: i=1; AJvYcCUF2TZqzOrafiy8PZZ1FzlLO1oXck39/IrqESQpkqkxIxij98USDpTD6kItfiY1cXoVj9tQIInoMSE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyq3AsZrNRK8pr3VerVcWp+A2siFTN3jDCN/6yBIiaF++yCierQ
	QyjzxEHASQRGj7NyWIpsJy98I9eUzZBLvSzWMpJdzn6z2STnrmExfh87BS7NPDs=
X-Gm-Gg: ASbGncsUeCacOsmrGoK4n0GKEGozA8c158nJYF6xQIy3k87XTVFuav6IbPxa9OwBrK3
	3coHfzHrHC4RRvDEyw6VnQ9d1jaW8Y92j247U8XdRLyn6lHiAaF1MA0fgVZ7JJxCdDpe43+Q8s5
	6NB17k9bv25P/U5sOFHLMpRrCP1cu+lTTuK7pAurpMcoIPouifvc04KTwBfR5hzlc6EiA436/oS
	IHUmqD6KrXg/IMRbzbStOKVJum+c0cEFU6NJL4IJSO0+UYPDIU50boNZc8wbarVDSAMfMS9ET2U
	uEmkxC/ulasPbrDlsgPP
X-Google-Smtp-Source: AGHT+IFdBuErmaLQh8qzDSGRNJz+uya9Gtzcme2EUce3xUtYu2KkkyU4wRqy+MrU90COYD0GwDZXzw==
X-Received: by 2002:a17:907:86a9:b0:aa6:c266:97cc with SMTP id a640c23a62f3a-ab2ab70b006mr2675266466b.23.1737025091425;
        Thu, 16 Jan 2025 02:58:11 -0800 (PST)
Message-ID: <ad8a8314-5cd0-4792-93ec-a530396ba3af@citrix.com>
Date: Thu, 16 Jan 2025 10:58:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Design docs: Fix some typos in the design docs
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <692dabc63953fb0d33536f87e4c5c147ba6ce11c.1736948633.git.bernhard.kaindl@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <692dabc63953fb0d33536f87e4c5c147ba6ce11c.1736948633.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2025 1:44 pm, Bernhard Kaindl wrote:
> diff --git a/docs/designs/argo.pandoc b/docs/designs/argo.pandoc
> index e18aacea7c..cd854d2a7a 100644
> --- a/docs/designs/argo.pandoc
> +++ b/docs/designs/argo.pandoc
> @@ -127,7 +127,7 @@ by the domain.
>  
>  ## Hierarchical Locking Model and Protocol
>  
> -The locking discipline within the Argo code is heirarchical and utilizes
> +The locking discipline within the Argo code is hierarchical and utilizes
>  reader/writer locks to enable increased concurrency when operations do not
>  conflict. None of the Argo locks are reentrant.
>  

In addition, focusses -> focuses needed in another hunk here.

> diff --git a/docs/designs/nested-svm-cpu-features.md b/docs/designs/nested-svm-cpu-features.md
> index 837a96df05..c855748141 100644
> --- a/docs/designs/nested-svm-cpu-features.md
> +++ b/docs/designs/nested-svm-cpu-features.md
> @@ -89,7 +89,7 @@ leaf 8000000A:edx
>   - 5 `VmcbClean`: VMCB Clean Bits: Not required by L0, provide to L1
>  
>    This is a pure optimization, both on the side of the L0 and L1.  The
> -  implementaiton for L1 is entirely Xen-side, so can be provided even
> +  implementation for L1 is entirely Xen-side, so can be provided even
>    on hardware that doesn't provide it.  And it's purely an
>    optimization, so could be "implemented" by ignoring the bits
>    entirely.

Also reson -> reason in another hunk here.


> diff --git a/docs/designs/qemu-deprivilege.md b/docs/designs/qemu-deprivilege.md
> index f12b1a3ae3..603491f24d 100644
> --- a/docs/designs/qemu-deprivilege.md
> +++ b/docs/designs/qemu-deprivilege.md
> @@ -251,7 +251,7 @@ executing QEMU.  (But this would then require other changes to create
>  the QMP socket, VNC socket, and so on).
>  
>  It should be noted that `-sandbox` is implemented as a blacklist, not
> -a whitelist; that is, it disables known-unsed functionality which may
> +a whitelist; that is, it disables known-unused functionality which may
>  be harmful, rather than disabling all functionality except that known
>  to be safe and needed.  This is unfortunately necessary since qemu
>  doesn't know what system calls libraries might end up making.  (See

Also assymetry -> asymmetry and constrants -> constraints.

I've folded these in.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

