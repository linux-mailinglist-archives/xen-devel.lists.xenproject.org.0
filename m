Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FA5A5FCEB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 18:02:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913149.1319266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslx5-0004SH-WD; Thu, 13 Mar 2025 17:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913149.1319266; Thu, 13 Mar 2025 17:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslx5-0004PJ-So; Thu, 13 Mar 2025 17:02:35 +0000
Received: by outflank-mailman (input) for mailman id 913149;
 Thu, 13 Mar 2025 17:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tslx4-0004Ns-N3
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 17:02:34 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f48e4309-002c-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 18:02:33 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-390f5f48eafso732833f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 10:02:33 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a1csm2667587f8f.28.2025.03.13.10.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 10:02:31 -0700 (PDT)
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
X-Inumbo-ID: f48e4309-002c-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741885352; x=1742490152; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1wHxQ2ALVFBDQ8Kkjsmf/rwXj0v8yVpHL72uazXBkBk=;
        b=FDdLvv46dnvifsGp1yVFkqMbq8uBfRyOeLIXQxMKk6EAUDnhZeVggG0HONvfPFA+Os
         XfGyGNrsom95ejknynkVg/l0ocAGjDBt73KBcRm/3FDR5P8rZB8QEN53bdfbzzJsajnJ
         hepVk6wxPezk6nQQGlNylZt8kF0eafBpvE2yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741885352; x=1742490152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wHxQ2ALVFBDQ8Kkjsmf/rwXj0v8yVpHL72uazXBkBk=;
        b=ic8k/HKVsZHXK8tLa9WGWivhTXkEEERh165L71J93eSzptRphh+IGWlAxCUcQhX5Xw
         r5E4QJw+n9oblOa5YPk4aylHT3WNEM2P6dk0zt/NySjrcCiR6xMx2s7e6SEev9k1yzkG
         XeoSBoKMbyv09o1zgWR9CD3ZSfgzVeoM9e1mzY58XmhqP6vLi497hD1LvfYDSjPaGdwM
         CHW82aKgz2rptI8QjSnJEdN3xeurUToK9alTuAOIfUHr+jAW/J4J8F5k5dh2+SCjCjLa
         sfH9R6VzTGRZ5SjrbgGDdc3lfTPRgiitItWXxX26mB74pOEYKdZR/ow0jo4Y324c/Hsz
         wDbw==
X-Forwarded-Encrypted: i=1; AJvYcCV3opbsxKYL1RGndcMnnGr9Nj8TIqVMHf8X+vR7lsAmr9aOPrqmN2QyCDgpA69whE8RrOjilKJoTUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOOLlAjj9HTXjou2OIv5JDwsLI7VLaCQZfpf7vIxgu9HaurEit
	ZwWnARG5dWFvPu0HIZeR/PVKUJ1yJWnz+k0oNI05nmhPfkUJ6eGcOZVVkwEK5EU=
X-Gm-Gg: ASbGncvGm8w2zUTyBvzoqYDwUW0bMJMNYPzf6sy880YtrcSGmERregF7vgPWfHZaV+7
	ypYErs9Z6JEqNGY44hVg8qQOXAV6Bm3fmLzk6Qd3AA04yypwTXjX8m8NpuaHrBVYcbE5oOf6kjx
	tY6UsVRXweVt+O6+Lemj9m7thtljn/trq3DP0npvYnXALNWh9mOo/JU2H/5HtKsWBekamV1RxC8
	VJailIT5YOpPA5lH4LQ729VfcPcciwLP4PCUdTqM/PPz0R4kJKrWMSvpopEx96Zy2uGaA7Dj2EQ
	nvQV5BEq9G0XXCb5mY/AMD1j2gCQ1C18EepgX3Vl9xgBWQk2OAatljKNDYSy9HD0nYexrHQBlIG
	CbvFDvdBk
X-Google-Smtp-Source: AGHT+IH7/UW/LXpEqjrZ8q2zJk8nmF9PKcg2x502FswTq23zoJOH2E9NlP/Zv4WNHKpftGrcbNjBiA==
X-Received: by 2002:a5d:6c61:0:b0:38f:28a1:501e with SMTP id ffacd0b85a97d-396c175366amr321741f8f.8.1741885352076;
        Thu, 13 Mar 2025 10:02:32 -0700 (PDT)
Message-ID: <17c27c8a-7314-4e89-9c21-f1a807867428@citrix.com>
Date: Thu, 13 Mar 2025 17:02:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] symbols: centralize and re-arrange $(all_symbols)
 calculation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
 <d0521cf8-dc85-4b31-9850-2bb94c560fc5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d0521cf8-dc85-4b31-9850-2bb94c560fc5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 1:55 pm, Jan Beulich wrote:
> For one there's no need for each architecture to have the same logic.
> Move to the root Makefile, also to calculate just once.
>
> And then re-arrange to permit FAST_SYMBOL_LOOKUP to be independent of
> LIVEPATCH, which may be useful in (at least) debugging.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Likely syms-warn-dup-y wants to follow suit; it doesn't even have an Arm
> counterpart right now.

Recently, I thought the same about --orphan-handling={warn,error} too. 
We need to up it to error, and enforce it consistently.

There's actually a lot of $(TARGET)-syms which ought to be less
copy&paste.  I'll submit my cleanup so far, which doesn't interact here
I don't think, but is also incomplete.

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -460,6 +460,10 @@ ALL_OBJS-$(CONFIG_CRYPTO) += crypto/buil
>  
>  ALL_LIBS-y                := lib/lib.a
>  
> +all-symbols-y :=
> +all-symbols-$(CONFIG_LIVEPATCH) += --all-symbols
> +all-symbols-$(CONFIG_FAST_SYMBOL_LOOKUP) += --sort-by-name
> +

I presume this works, so it's after we've processed Kconfig, but is
there really nowhere better for it to live?

If we're moving others, this is going to turn into a lot, and it's
specific to one final stage.

~Andrew

