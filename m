Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECA1AE817D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 13:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024779.1400605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUORh-0004AV-Ja; Wed, 25 Jun 2025 11:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024779.1400605; Wed, 25 Jun 2025 11:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUORh-00048p-Gj; Wed, 25 Jun 2025 11:37:41 +0000
Received: by outflank-mailman (input) for mailman id 1024779;
 Wed, 25 Jun 2025 11:37:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8rF=ZI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uUORg-00048h-Do
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 11:37:40 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbb315c5-51b8-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 13:37:38 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-451d54214adso10389695e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 04:37:38 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382368742sm17461245e9.31.2025.06.25.04.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 04:37:37 -0700 (PDT)
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
X-Inumbo-ID: cbb315c5-51b8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750851458; x=1751456258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpK5NSj1AhtrPLmgfwCD34PO938ZfQZnprKBOfrooKQ=;
        b=DHBVjhftQ0TCO4MrXAa16m4l8VwRsz89q6zAbb5bBThh7oye37NDe9xSpeAObwuPOm
         IxMx7HcW8GFJy+0YO71pFST+QFb0nGF2iGF+HzdVfwUk8muaHZ2OEAChQdJNRKu5BBD5
         xk68tIG+NUhdKuRFFKj9MTuyOidVYP/ueY0zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851458; x=1751456258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpK5NSj1AhtrPLmgfwCD34PO938ZfQZnprKBOfrooKQ=;
        b=qxuGOamIPE+2R7PLgfOOzWHPHR8WfM0pFr8s6FaMXc50UX0QGPpsv5FWRaIrmKek8v
         0cY3x5N4Mrvilgt7qbrjiN8a6cHtXYr979k3eay/w79FKEwZQH74r1Ik1W3njoKVb+jA
         xe9BDSV7GZWfw3d8MQ8DJc3UFOP9aOGCvj7GbKysaM3/UWxGTert1mOK98yDyk5H//hW
         OvN0UKRcQIwY6u73gX/Ob1FZvCSWiIg5qqJMnU6FDBDzuM5nJ+exYr/AP6UiW/lcHsOr
         3uTT3uMMzP7c+Ewdx4f0as3V3pWGgB1N2N/AqWBEjYt1DSvKGq8K++IdfG5mN7FWSDtm
         ZuVw==
X-Forwarded-Encrypted: i=1; AJvYcCWjIKQ0zA7DeJ6cSF0YTn3yst+nsCIvTKx3t2GbmN6k4TAuA5jKsNFjGVcykBMUS39fcFsZr/E/MRc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCO1jL2Rql0GoGvrvVy2CqKYdYXMIdn51ABJvrIrGesmFy+MpZ
	bduWl2mz43H1VrAVBAWuKsSPNYKOhRPGrixKJikotx7TayV9dv1Fn6SvL4ybR/QLEOsmVHRYlVs
	kNmfdBbr94Q==
X-Gm-Gg: ASbGncuVIeE9jdgnfORP+1Ck5nYX5d3rcZQtVrDENJraO7+nIbDWkMEWOqIDpHtV0IN
	2x7973xDoVEE49uGzG5T3A/6IQ0qg8ExAoSJYA0vdyYbUH6hyZA0p+wXcqYNZWSHA/0on4iqDG0
	CaUjF4cvzdmZIE0oYsUCMIe+bHPNitO7JP+YPwYDaQ9eZ0Lc3qTvkMMzRYHl3p0fUisGt26QkRp
	6jLDtZ8fWuDakfEqMy11TOuJMeDqxgf3ISPf1/mXk1vQSWdrHoCSIBvAZx4P/qlZ2WeFNsKw/VK
	Z5NuIXbjUR5GjHnqs52926taKhLaurbzRYaOlCb1BzqVmEYqPv6SPa82ryqz5d5HaShKBPJVirx
	AUv57PcAgoD5ye5uxQ6DRDkhJH+k=
X-Google-Smtp-Source: AGHT+IEcBErnnkD1DAqhB1k7m+NFfWfMr8NP9cFcHed69gFbJ0kxhHNXfPRv9DaZR+gCgp1SHHRXSw==
X-Received: by 2002:a05:600c:674a:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-45381ab2544mr27989235e9.12.1750851457635;
        Wed, 25 Jun 2025 04:37:37 -0700 (PDT)
Message-ID: <5fe410bd-2399-482e-aecd-922094921551@citrix.com>
Date: Wed, 25 Jun 2025 12:37:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: move l<N>_bootmap
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f7c4f267-c491-4066-b13a-e1a1060c4962@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f7c4f267-c491-4066-b13a-e1a1060c4962@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/06/2025 10:05 am, Jan Beulich wrote:
> Having them in the general .init.data section is somewhat wasteful, due
> to involved padding. Move them into .init.data.page_aligned, and place
> that right after .init.bss.stack_aligned.
>
> Overall .init.data* shrinks by slightly over 2 pages in the build I'm
> looking at.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> All three tables are merely zero-filled. They could hence even be put in
> .init.bss.page_aligned, yet then we perhaps better wouldn't use .fill
> but .skip there (i.e. a larger diff for little gain). Thoughts?

It makes no difference to the binary.  .init.bss is merged with the rest
of .init, so is a block of real zeroes.

I'd opt for lower churn.

~Andrew

