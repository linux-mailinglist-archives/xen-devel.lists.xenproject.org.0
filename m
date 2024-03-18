Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F2F87E40A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 08:23:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694478.1083287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm7Ku-0002LY-QK; Mon, 18 Mar 2024 07:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694478.1083287; Mon, 18 Mar 2024 07:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm7Ku-0002JH-Mm; Mon, 18 Mar 2024 07:23:08 +0000
Received: by outflank-mailman (input) for mailman id 694478;
 Mon, 18 Mar 2024 07:23:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rE6T=KY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rm7Ks-0002JA-MZ
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 07:23:06 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c0ed3b3-e4f8-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 08:23:04 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-568aa282ccdso3555713a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 00:23:04 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 wg8-20020a17090705c800b00a46cc48ab13sm218367ejb.62.2024.03.18.00.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 00:23:03 -0700 (PDT)
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
X-Inumbo-ID: 5c0ed3b3-e4f8-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710746584; x=1711351384; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2+xmiNT0HV1PrVIMTOkvVdPBI7GhnHCBaeppqG3Ayo=;
        b=dt0rzKW6PZSNFsl0P9kZEYkMtbxXGK9wPWf0cjxYAouT7huhVOcV/tG0CuPey4EktN
         jQ6dXTtKl6Hx65VYzbl6LS05OTh8PbFuaZTda47vbz+OTLzQ6GCmlr2tOR4AU1SXYAoU
         /ZH82Az/0YqqidBtv1r3FCNhU6geKrYDBTpnrrQtmv756078a3toXodMkVQKtch7AfA3
         rAR8K9aXB/4iDvOEjSv/+opQre/1ohffTyPgtrDohfj1XHCNF/GbtZawyZ45m+LUM/0H
         xCpOVRP47XQUNhrdzAz03e6bj1r7qvXnRlANXIOqsTw0ABpfj8hLsraL7llFN9sniuLT
         XFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710746584; x=1711351384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j2+xmiNT0HV1PrVIMTOkvVdPBI7GhnHCBaeppqG3Ayo=;
        b=c/8Bgblf+H1RrVsiTXad+FRKVK+JDxurXHVYYy5337CzNP4z5uxbkWwf7cl7aPkAqw
         w78D0YgSDQ43LFXyl0x0FxO3w2tG948AvppehcMQ4DnrCr/E4dCR0p3xkfx+/SAmhmHt
         4ab+XQe/ddxrPhZsT/omvvfPngTJMhYHDs6kNrWjZYo/Caq988mrrjit5TKrvHD9o5T9
         AIM7zVgy7rFNSTvW4kQaGPRjQ5VqQpxbDQ9PHoMuhetcU1Y6G0YyJUCgVy5LGu6lEU9T
         0jTw8el5CMPzRSiUufrhgXetEM+hcV9riVlOetPTRcoLBrvwaVsxl+s+tGqkiBdZwjFN
         9nLg==
X-Forwarded-Encrypted: i=1; AJvYcCXyRSmLrOGDu4T/MLxz4q+/uGc/txrvTpnk9YBqT3lR4UMTxr2kxrzpQS8DdGhVukNBBSzA+uAyHw/5IBn5VMra1czfvNj3cZtk6Iok6nI=
X-Gm-Message-State: AOJu0Yw3F+hzepjWRWxCwHo0Lnjf+ws5mEu4hxYO3to7iDxY0oyGxnx7
	drD7fGbmcBYmhS/O95/b15x2ROEg/L7dhHE5wSAJbJNENL+R/qcPfSxinFcXbJ8=
X-Google-Smtp-Source: AGHT+IG/FvP8FIPkOAjy1Sqh3yrjW0+6MsrVrNKO/gQxWJLTWjYkr4kGMhpQK7lOhCNJSTLGPpmMag==
X-Received: by 2002:a17:907:7a93:b0:a46:74fe:904f with SMTP id mm19-20020a1709077a9300b00a4674fe904fmr8405153ejc.26.1710746583937;
        Mon, 18 Mar 2024 00:23:03 -0700 (PDT)
Message-ID: <acb094b7-15b5-4a77-b461-a938f9d7e9e0@suse.com>
Date: Mon, 18 Mar 2024 08:23:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86: Rename __{start,end}_init_task to
 __{start,end}_init_stack
Content-Language: en-US
To: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-arch@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 boris.ostrovsky@oracle.com, arnd@arndb.de
References: <20240318071429.910454-1-xin@zytor.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240318071429.910454-1-xin@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.03.24 08:14, Xin Li (Intel) wrote:
> The stack of a task has been separated from the memory of a task_struct
> struture for a long time on x86, as a result __{start,end}_init_task no
> longer mark the start and end of the init_task structure, but its stack
> only.
> 
> Rename __{start,end}_init_task to __{start,end}_init_stack.
> 
> Note other architectures are not affected because __{start,end}_init_task
> are used on x86 only.
> 
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


