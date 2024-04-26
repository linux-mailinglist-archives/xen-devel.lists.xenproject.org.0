Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011278B3AED
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 17:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712921.1113824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0NL2-0006Nf-P9; Fri, 26 Apr 2024 15:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712921.1113824; Fri, 26 Apr 2024 15:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0NL2-0006LH-LS; Fri, 26 Apr 2024 15:18:12 +0000
Received: by outflank-mailman (input) for mailman id 712921;
 Fri, 26 Apr 2024 15:18:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIFE=L7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s0NL1-0006L9-99
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 15:18:11 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f6cd276-03e0-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 17:18:08 +0200 (CEST)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-69b514d3cf4so22688576d6.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 08:18:08 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d26-20020a0caa1a000000b0069b3b3b9c68sm1989138qvb.41.2024.04.26.08.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 08:18:06 -0700 (PDT)
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
X-Inumbo-ID: 2f6cd276-03e0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714144687; x=1714749487; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JaJWI/H/iWHdluCS1NEelwJSAJbQebG7UU3OkjAe+Tw=;
        b=Fr2LQs9DszHc7QUw0qgIeNnZsSCYTfkeNsbOJHlIIlgDYIXiQ/5FxMn3ECR2QgSdqx
         YyH6WHaSR0MuniTL1qqaJIgBEalvcblOfB8u12P17K9I8YTJjTZ1iGymL6iArVF+7HGr
         JEq8+ftYBfkrse7TsHrL+JJPIcSzJshJMkOn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714144687; x=1714749487;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaJWI/H/iWHdluCS1NEelwJSAJbQebG7UU3OkjAe+Tw=;
        b=vvBZhFZTfNfi9hsKXvg5DxYk9w3sIpNO5DGeNP75ymUgclbfIvSs9WEsf+99H9oXPK
         TbtlVrnTwpnffkEHeruzlxawIF1QpOZ6ZQLbYZyVV8O586NusTSTVSrsmF98El4o+ana
         9xY6/cFXQghx7dJVCpb5H1hwpqg1FQZ9IjZBKIKLxoFwacPcemJsBFxmwr7bMykbAME2
         YfHs7ZJczWTvo3VedpNwL61OkHwuZLOcdlBEawyr15cTBIMv4xYO+j/X3gS5t/1vK0za
         r+iJRSCNJ2638xrbUOt4x2l5hkAU4PdaWRjfu/lks8phhAu9SbzRDmI+lOzBgFFkRlhS
         ljnw==
X-Forwarded-Encrypted: i=1; AJvYcCWjoEDBNdeShea+a2NnDCcun7UFK5K+B3h68nxRElV9LI0hGdAKBqRqeJyQqCotP9LVFnhq4xgjX6c/r51gj/KdJmtg2V/KOKePkTjCkIg=
X-Gm-Message-State: AOJu0YyoUCpz7ua2KdQLf8MF67SgCw3dDJr19fnYHLOAbsOrjKuWyuc5
	b+rCIsbUsj7zU1S4YBCnP6StjLBNSwMTbFUBvY3D2duiGbPYroS4MXbEzA4KbEU=
X-Google-Smtp-Source: AGHT+IHdJzjfyP3TcYgyCWZVr9CdTUo7VfD60zotH0XQI7iMwNcUuZNyDJWSNxxDa0az/4fvPrXEOA==
X-Received: by 2002:a05:6214:d08:b0:699:49d3:fe3a with SMTP id 8-20020a0562140d0800b0069949d3fe3amr3277395qvh.44.1714144686969;
        Fri, 26 Apr 2024 08:18:06 -0700 (PDT)
Message-ID: <aecae47b-eba6-4544-a566-8eb259d11a41@citrix.com>
Date: Fri, 26 Apr 2024 16:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/hvm/trace: Use a different trace type for AMD
 processors
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@cloud.com>,
 Anthony Perard <anthony.perard@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Olaf Hering <olaf@aepfle.de>
References: <20240426143231.4007671-1-george.dunlap@cloud.com>
 <20240426143231.4007671-2-george.dunlap@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240426143231.4007671-2-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/04/2024 3:32 pm, George Dunlap wrote:
> A long-standing usability sub-optimality with xenalyze is the
> necessity to specify `--svm-mode` when analyzing AMD processors.  This
> fundamentally comes about because the same trace event ID is used for
> both VMX and SVM, but the contents of the trace must be interpreted
> differently.
>
> Instead, allocate separate trace events for VMX and SVM vmexits in
> Xen; this will allow all readers to properly intrepret the meaning of

interpret ?

> the vmexit reason.
>
> In xenalyze, first remove the redundant call to init_hvm_data();
> there's no way to get to hvm_vmexit_process() without it being already
> initialized by the set_vcpu_type call in hvm_process().
>
> Replace this with set_hvm_exit_reson_data(), and move setting of
> hvm->exit_reason_* into that function.
>
> Modify hvm_process and hvm_vmexit_process to handle all four potential
> values appropriately.
>
> If SVM entries are encountered, set opt.svm_mode so that other
> SVM-specific functionality is triggered.

Given that xenalyze is now closely tied to Xen, and that we're
technically changing the ABI here, is there any point keeping `--svm-mode` ?

I'm unsure of the utility of reading the buggy trace records from an
older version of Xen.

> Also add lines in `formats` for xentrace_format.

Personally I'd have put patch 3 first, and reduced the churn here.

> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> ---
> NB that this patch goes on top of Andrew's trace cleanup series:
>
> https://lore.kernel.org/xen-devel/20240318163552.3808695-1-andrew.cooper3@citrix.com/

The delta in Xen is trivial.  I'm happy if you want to commit this, and
I can rebase over it.

~Andrew

