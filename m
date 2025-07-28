Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0825B13A3F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 14:11:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061411.1426973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugMhN-0000DK-2z; Mon, 28 Jul 2025 12:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061411.1426973; Mon, 28 Jul 2025 12:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugMhN-0000Bd-03; Mon, 28 Jul 2025 12:11:21 +0000
Received: by outflank-mailman (input) for mailman id 1061411;
 Mon, 28 Jul 2025 12:11:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44Jj=2J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ugMhM-0000A6-HA
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 12:11:20 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f77e3e34-6bab-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 14:11:18 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45600581226so44536135e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 05:11:18 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4587ac65e86sm96885205e9.25.2025.07.28.05.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 05:11:17 -0700 (PDT)
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
X-Inumbo-ID: f77e3e34-6bab-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753704678; x=1754309478; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BQ31gmIYlW3GVN+ARq3QY6D1UgjlPF0eI2qxiWPZvpI=;
        b=unRpmDn6qm3PhgHan4FiTlkGVtCEFtxAc3HDkTwJ3ogrYCEN+ZtJe3iXEMTKtTqczq
         XPCM0AIWTBMF9StD2iHbCEu+eZnSWJhZNzxSGAT9ErxQ0H3CRrHucHpF2xnF0IG+tXAK
         kXyUFseDx76W+Ra0ZC7JWqsSqGhLHDQfShDqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753704678; x=1754309478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQ31gmIYlW3GVN+ARq3QY6D1UgjlPF0eI2qxiWPZvpI=;
        b=FxoJ9V4Co2HfQCsTIgUqpq21ZxMuv1Jp+AvLpfev6T+6quwYqXzoudgjr84Inldy9t
         +L1ZSxIW3r+r2dGwiry3zhiHms9c+50xu5m5O+/82F22EjxfqQVE3jCHXBzX6XG57rf0
         YAgLtEPTcIbxIReBwQ35pD4HKGg7e7tGSArTlunigZzs7zaG7WhkePecOhlxvWh5UT8J
         1vHwwFCy+PdjKgbIeojN6uCW/OGoXwWOW5DwH9S3XWVnYwDYBJ6+D6GHWjzxW50GkTku
         iB5T8CRV1IvTYFlY79JgK4EbbfPf3Ug0aOqNqnvEBfGvEgcI3a2kNdmpUulULG8oYi1i
         kUaA==
X-Gm-Message-State: AOJu0Yxsx2RsSR1EcYSexIC15yewCWA9iAUOeBvIBmD53mOnGz0kzqJp
	nz+mnAt496X8QaFXvy0bFODHJ021rwODdRWWTv1sVLs6l3Dc1QfN0WNGQ5lVENgdtllBT5MxNB6
	WLp2w
X-Gm-Gg: ASbGncu/Ge8UB9MORSiq/soejB3VMcngxxscj+yr97JPEvVEJcoS/i3E9kHZsE04pd9
	0tMa59KeOqPYODvthTlSuh2U9cp98JxIPP1cT9Pl7fhPiaYF9KmpOSqIrYJLS04sHySRVwgj+Hc
	8kqu57YYd+3qqGydRlvhjbe4bg/qrpEAw1SStSw9RZ7GthwxWhYhK26eRLCN9Zr17Ogmzvoi7kK
	H8kB4yEMeV+Q0lCQiAu7NNFqgjOX/DWnyuqvTbiago7qw1wiXnBgGmEFY7Utc9xlnm2t/OFyDI/
	XhsLvvIwoP1w7EoKKsXNsMFRq0P/Nup4MQ5eu/3RcxmdguuNju+g4pg+5OFbFL7dvxsbd9dc3hl
	BNnR9e979Xnm6i8Fv2hKkf5E55xcH3Ef9nPQaKFQVt+acbGQ0QgrDaTFPIbFBPM2C6A==
X-Google-Smtp-Source: AGHT+IG2qiNDc1L5Oj+RCBcVrVlyuKs9gfeyWzUZMjS8+yJVRWWbe3R5U3zvp5uz0abyvNTuoOweGg==
X-Received: by 2002:a05:600c:35c6:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-4587d76cfc9mr64831675e9.4.1753704677729;
        Mon, 28 Jul 2025 05:11:17 -0700 (PDT)
Date: Mon, 28 Jul 2025 14:11:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tools/xl: don't crash on NULL command line
Message-ID: <aIdo5K6RfTUFr__Q@macbook.local>
References: <20250728102422.2245808-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728102422.2245808-1-marmarek@invisiblethingslab.com>

On Mon, Jul 28, 2025 at 12:24:03PM +0200, Marek Marczykowski-Górecki wrote:
> When running xl in a domU, it doesn't have access to the Xen command
> line. Before the non-truncating xc_xenver_cmdline(), it was always set
> with strdup, possibly of an empty string. Now it's NULL. Treat it the
> same as empty cmdline, as it was before. Autoballoon isn't relevant for
> xl devd in a domU anyway.
> 
> Fixes: 75f91607621c ("tools: Introduce a non-truncating xc_xenver_cmdline()")
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> So, apparently the "No API/ABI change" was a lie... it changed "empty
> string" to NULL in libxl_version_info->commandline. Quick search didn't
> spot any other (in-tree) place that could trip on NULL there. IMO NULL
> value in this case makes more sense. Buf maybe for the API stability
> reasons the old behavior should be restored?
> 
> PS I'm working on a CI test for this case (and driver domains in
> general). I have it working with Alpine already, but it wouldn't detect
> this issue, as musl's regexec() doesn't crash on NULL... So, I'll add a
> test on Debian too.
> ---
>  tools/xl/xl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/xl/xl.c b/tools/xl/xl.c
> index ec72ca60c32a..e183d42b1d65 100644
> --- a/tools/xl/xl.c
> +++ b/tools/xl/xl.c
> @@ -81,6 +81,8 @@ static int auto_autoballoon(void)
>      info = libxl_get_version_info(ctx);
>      if (!info)
>          return 1; /* default to on */
> +    if (!info->commandline)
> +        return 1;

It's a nit, but could you join with the previous if condition, so that
the comment also applies?

     if (!info || !info->commandline)
         return 1; /* default to on */

Thanks, Roger.

