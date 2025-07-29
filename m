Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E654B154CC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 23:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063159.1428956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugs9N-0004OR-Lt; Tue, 29 Jul 2025 21:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063159.1428956; Tue, 29 Jul 2025 21:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugs9N-0004M4-JG; Tue, 29 Jul 2025 21:46:21 +0000
Received: by outflank-mailman (input) for mailman id 1063159;
 Tue, 29 Jul 2025 21:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/H3U=2K=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugs9L-0004Ly-9S
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 21:46:19 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 753d120e-6cc5-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 23:46:18 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45896cf24ebso38075e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 14:46:18 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589536a664sm2105845e9.5.2025.07.29.14.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 14:46:16 -0700 (PDT)
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
X-Inumbo-ID: 753d120e-6cc5-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753825577; x=1754430377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=11mYoXlWCLXbwNZiAtfQOiBV0G/BP9C3pYF+UsbZh34=;
        b=SzDuKuaupgNfxuiRiJY09Il/vqPBA08M7mYiJlcc4Bv+sdS/iP7wYnWmVEfI2nKJF4
         Idx3vm31WhhSn3PXv895reNAOmA5kEF3GHrdQoxC12ZWDlu96OK6JA4rAqcsQZhfamLO
         SvHoXEK7F1ttJBtCotKocILDJh/w3YstXDqA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753825577; x=1754430377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11mYoXlWCLXbwNZiAtfQOiBV0G/BP9C3pYF+UsbZh34=;
        b=JcGJYTHLVkXI6HRSjZR3JArKXPuinRBkrpIDTVX8NBIp3rBuVFFOFOR9ij81vAaeZw
         RpUhdTzmA3uBlgbE6JlaPRbA6Bthm3xpvRdR7gr6LUN5iGF4zPRK2GPn8YvfVyaPqRbe
         5TGvjfkrhe1VzbnXNmxB7wdTruJRHYSx+fqOWfbiA6cqp0q0mVzWO5Hb6UBfOgA7S4LC
         IZLqll/etV07hRtmBKai1wXdBbW2WdrYb17MwvT/9NT1wRa0E5lpsBSbz7MGIPm/31aH
         cq5xnl9CapIbDxV8QDnDAH3jY8s66q28mcNXGr1ljEMT6f2tPQlafRa75CiVvh8Us4I+
         K+uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq82qbOb9uPHQnCQHzybiwsE0RnOPNRQl6HVvDzU2zDOQbZ2gdQtt4FVaNNGD8qMi2cCz+iX9z6To=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yziciti3OCbEi/gEapAEgKqwQ53KRrB4M9xLUFl/zBE1nR30LXF
	zZ8mI2J4dz5ID87ZPZ6J+RX/v4w954d97QVPIoBBmqpdpvJrdLXaSgMZfhTfleitHpU=
X-Gm-Gg: ASbGnctUbtsy0etIgCkFtPxbT7n+uzQzbew8XvLnA5zS5kDXzXqvG5c2bI0T8oocNux
	bbFtAN9T9rAD7zzOFnLKWYWvxg2WxWNkF+mKnLbWV4HKBVbwUZN3vBt68rpIEa8eDIc/2fK90pS
	EtHDS++oHfdl7ZgFDQzG4c7P4vmKtkcJhB1219yvDx2G4+BVkDQbMeH2GW5BEHblZtlvCytUnGg
	tip6rxdyKH/aB6KPIPptRHpEI6kfMOWFsaes1nfTMQgUwFOuaR3a2OqmA9UVNxRWAjgi8YGq4Sx
	k6BxGFuy6smlwlgVAYE4v3bzmqp0VP8gPUbgfzme30ULfFNfOMj1fyhjfYLG0ZeKSRWE4eSp09M
	4oPhSIqBc5AUeUuxCsONZfT1JKN2IuQrqBv6NZKbjQqEo3uRtidnJ6/m6pycVC4S82TwT
X-Google-Smtp-Source: AGHT+IFB11ljCyCHyXN/XnB8IM99wwB1AOF1b0DH/3g2dWs47gkqiy4lcP1Cooa9SrQjwagsqNtPaw==
X-Received: by 2002:a05:6000:1a86:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3b794fc2a9bmr833749f8f.3.1753825577437;
        Tue, 29 Jul 2025 14:46:17 -0700 (PDT)
Message-ID: <264a147b-2916-4006-8619-29dcb652fb6a@citrix.com>
Date: Tue, 29 Jul 2025 22:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] misra: address rule 5.5 gnttab
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1753822074.git.dmytro_prokopchuk1@epam.com>
 <b42e78384731eadf15dd45efdc35c8ff72b37dd3.1753822074.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b42e78384731eadf15dd45efdc35c8ff72b37dd3.1753822074.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/07/2025 10:24 pm, Dmytro Prokopchuk1 wrote:
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
>  xen/common/grant_table.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index cf131c43a1..9b8f0d87d3 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -127,8 +127,8 @@ static void __init cf_check max_maptrack_frames_init(struct param_hypfs *par)
>                        opt_max_maptrack_frames_val);
>  }
>  #else
> -#define update_gnttab_par(v, unused1, unused2)     update_gnttab_par(v)
> -#define parse_gnttab_limit(a, v, unused1, unused2) parse_gnttab_limit(a, v)
> +#define UPDATE_GNTTAB_PAR(v, unused1, unused2)     update_gnttab_par(v)
> +#define PARSE_GNTTAB_LIMIT(a, v, unused1, unused2) parse_gnttab_limit(a, v)

I'm afraid this doesn't compile, and cannot be taken in this form. 
CONFIG_HYPFS very intentionally uses this macro alias to discard the 2nd
and 3rd parameters.

Also, it's really not just gnttab which suffers from this.  All
subsystems with mutable parameters follow the same pattern.

I don't have a good suggestion, and it's extra awkward that the MISRA
violation only occurs in the !CONFIG_HYPFS case which is trying to stub
out the logic with minimal #ifdef-ary.  It is definitely weird and
unergonomic for par and parval to not even be evaluated, but that's
necessary for things to compile.

~Andrew

