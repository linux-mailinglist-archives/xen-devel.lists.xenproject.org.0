Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64628935111
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 19:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760662.1170552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUar-0006Xp-6H; Thu, 18 Jul 2024 17:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760662.1170552; Thu, 18 Jul 2024 17:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUUar-0006Vr-3h; Thu, 18 Jul 2024 17:07:01 +0000
Received: by outflank-mailman (input) for mailman id 760662;
 Thu, 18 Jul 2024 17:07:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEHZ=OS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sUUaq-0006Vl-Bs
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 17:07:00 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24908ea5-4528-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 19:06:59 +0200 (CEST)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-79f083f5cb6so28924885a.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 10:06:59 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1938f0674sm44494285a.61.2024.07.18.10.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 10:06:57 -0700 (PDT)
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
X-Inumbo-ID: 24908ea5-4528-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721322418; x=1721927218; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ufxJ+wk+qkOogv3RiaZnix+u85SOqFXVXqwzHhdSUoQ=;
        b=bw0l3K+iDPu3nDgVSBXf6RpT9Y+7NVKrkXDBOdjhbxYuLqyAFQbu/errI9iGQ4QfUP
         EdpAknx1fEd3MS4cLrEFv78GFg1i9WutfLIyzW96P9HdyUdsM+acYxVNJ0XWz9cCpeaF
         DX5VwLEvnAfjh/S3DEMAFCfGnLCat4bfy1kmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721322418; x=1721927218;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufxJ+wk+qkOogv3RiaZnix+u85SOqFXVXqwzHhdSUoQ=;
        b=SeV9ZWxZ+NTlEy/nZAb4rlthXVgu+Qp8+zMOderdli5PRzCKUUQn0yjroPlQDzqQ8C
         I3+u9J0RPGZNXb4x2bhpVWkM649yZ0QrMbgkquT3p2wqGJpTO2dqedXAhDs5duxqnmc+
         Ay1z6F+3qBg52PB0tGqq0g7zQoiE9nOQxep15f0QH5yyNxk2kLa+HVBZkx0vo0Sh4VWD
         GrGddIED56oTTzQtd5EuEf6ZkDs9LqxYPyuT9YaELoQMEzHeFMPr37VAMqvF61laCemk
         ugZLnH4SO41V0hSgjBhyTzY/CQFg0nhXrHprK7/PmJK5DUrQFefrNwHc9abiiWWq3uqg
         fSXg==
X-Forwarded-Encrypted: i=1; AJvYcCXX+eGBypzw6jxkueQUMjH3E54e/N/20SNZrD/6xkjh65bjYNcjJyuzaaivKCJwfvxlQhzzmAmK1uV+D6PPLEZFNpnQ0SmdJ4rqt+2WJ/Q=
X-Gm-Message-State: AOJu0Yy1J0z5eILflL15MNDRsBK4Scepw6/aEJ/VB82oxlphbvMOOK+O
	KMz7MJWKcmn1tknyxHKd7U9O1jenB1V9kK/oX5FyPJT9s1X/BHOhc1UKyiOcd7E=
X-Google-Smtp-Source: AGHT+IF3mv8dVarejYjyPlSw/zAWJWsQbtOrmZNpcFI+nTjGWLb9TCg2dOn4hV1mQbPvXY/nje3WCA==
X-Received: by 2002:a05:620a:4554:b0:79d:5a77:aea8 with SMTP id af79cd13be357-7a1938ea4cdmr170522785a.1.1721322418017;
        Thu, 18 Jul 2024 10:06:58 -0700 (PDT)
Message-ID: <99403a3c-1e4f-4971-a08b-5480e6d1e829@citrix.com>
Date: Thu, 18 Jul 2024 18:06:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: get_pat_flags() is needed only by shadow code
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <76aafbed-bea9-445a-8abb-6e1e44996594@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <76aafbed-bea9-445a-8abb-6e1e44996594@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/07/2024 11:10 am, Jan Beulich wrote:
> Therefore with SHADOW_PAGING=n this is better compiled out, to avoid
> leaving around unreachable/dead code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/hvm/mtrr.c
> +++ b/xen/arch/x86/hvm/mtrr.c
> @@ -271,6 +271,8 @@ int mtrr_get_type(const struct mtrr_stat
>     return overlap_mtrr_pos;
>  }
>  
> +#ifdef CONFIG_SHADOW_PAGING
> +
>  /*
>   * return the memory type from PAT.
>   * NOTE: valid only when paging is enabled.
> @@ -359,6 +361,8 @@ uint32_t get_pat_flags(struct vcpu *v,
>      return pat_type_2_pte_flags(pat_entry_value);
>  }
>  
> +#endif /* CONFIG_SHADOW_PAGING */
> +
>  static inline bool valid_mtrr_type(uint8_t type)
>  {
>      switch ( type )

While I can see this is true, the fact it is indicates that we have
bugs/problems elsewhere.

It is not only the shadow code that has to combine attributes like this,
so we've either got opencoding elsewhere, or a bad abstraction.

(This is an observation, rather than a specific objection.)

~Andrew

