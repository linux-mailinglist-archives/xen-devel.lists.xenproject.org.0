Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A17F5366
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 23:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639236.996316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vip-00067P-Rs; Wed, 22 Nov 2023 22:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639236.996316; Wed, 22 Nov 2023 22:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5vip-000652-O7; Wed, 22 Nov 2023 22:29:27 +0000
Received: by outflank-mailman (input) for mailman id 639236;
 Wed, 22 Nov 2023 22:29:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5vin-00063c-Qx
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 22:29:25 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 966d918b-8986-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 23:29:23 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40859c466efso1651175e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 14:29:23 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b004094e565e71sm45734wmo.23.2023.11.22.14.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 14:29:23 -0800 (PST)
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
X-Inumbo-ID: 966d918b-8986-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700692163; x=1701296963; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3xBLE/mbfJdHz6sZVR4UZF3jmQzSTJE2y3sDa2qMA/k=;
        b=qULVwGd77h4WAcyff1v2fPPdkrmnuV0YykLweMOB/gGxqMYbmJSJYNJ0IYRJJVJnX7
         nWDY3YhwDuomTUt4xrgyE9GYwp8tVCI2pIoCOJXIlc1TBF8GPEsFTsCchIb0GBKNEw6Z
         OCqAskG4uljLD6bkWyjJh7CsvCbIbafd9qT1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700692163; x=1701296963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3xBLE/mbfJdHz6sZVR4UZF3jmQzSTJE2y3sDa2qMA/k=;
        b=fBEkow2F4ceOkt24OAsz48fw/59YESv5IRXAsPu+66tJdEDs//yqvptamRV6w0Vumt
         BABEyx+g09/EytGQqYZgHohIq4HUCOrl1rhaCGv8k032pTPbadvYW4aYd+3tqfvlKYH2
         vy+2llxNKHjhnpLuQ9aYK4nEHCLPkfc/abC5iNzbbV8853qR0h61BNjOS901ZURqqOhA
         Pz3odLpczxcTKvRxFFO4MWCx+HLE3DdCFR3YCdjVWwKVIPLxbpZNolkhAyJd5KyCLDCS
         HCwa1bCTJFL50A/ktHd6rT44N2IjA7bsqsCzhW+t1UihHweHwjKbiZ2x2rvouM+GrzlA
         zaMg==
X-Gm-Message-State: AOJu0YyTu8EGG3IMQyT1LGdZDHB6evAjKr6M4nNh3DgQ9/NBJ8oTKqqP
	t8SP4ZkvnAvHD4TKhkKfFGQw81w1nob1nxS33E0=
X-Google-Smtp-Source: AGHT+IEDQQeazRpqw4ix1ayRKRaQxNjyDwYWMOsxWB7zsHYc2wAueNLPCZnj+TD9nQr8hPqn6a4k1g==
X-Received: by 2002:a05:600c:3590:b0:404:f9c1:d5d7 with SMTP id p16-20020a05600c359000b00404f9c1d5d7mr2601958wmq.25.1700692163299;
        Wed, 22 Nov 2023 14:29:23 -0800 (PST)
Message-ID: <f1a4d1ac-abc3-410e-a171-581b074b8155@citrix.com>
Date: Wed, 22 Nov 2023 22:29:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] tools/libfsimage: Add an fdopen() interface to
 libfsimage
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
 <20231106150508.22665-5-alejandro.vallejo@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231106150508.22665-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2023 3:05 pm, Alejandro Vallejo wrote:
> diff --git a/tools/libfsimage/common/fsimage_priv.h b/tools/libfsimage/common/fsimage_priv.h
> index 2274403557..779e433b37 100644
> --- a/tools/libfsimage/common/fsimage_priv.h
> +++ b/tools/libfsimage/common/fsimage_priv.h
> @@ -29,6 +29,7 @@ extern C {
>  #endif
>  
>  #include <sys/types.h>
> +#include <stdbool.h>
>  
>  #include "xenfsimage.h"
>  #include "xenfsimage_plugin.h"
> @@ -54,7 +55,7 @@ struct fsi_file {
>  	void *ff_data;
>  };
>  
> -int find_plugin(fsi_t *, const char *, const char *);
> +int find_plugin(fsi_t *, const char *);
>  
>  #ifdef __cplusplus
>  };

These are the only two hunks in this file.  Is the stdbool include stale?

It seems to compile fine with it removed.

> diff --git a/tools/libfsimage/ext2fs-lib/ext2fs-lib.c b/tools/libfsimage/ext2fs-lib/ext2fs-lib.c
> index 864a15b349..9f07ea288f 100644
> --- a/tools/libfsimage/ext2fs-lib/ext2fs-lib.c
> +++ b/tools/libfsimage/ext2fs-lib/ext2fs-lib.c
> @@ -25,15 +25,25 @@
>  #include INCLUDE_EXTFS_H
>  #include <errno.h>
>  #include <inttypes.h>
> +#include <stdio.h>
>  
>  static int
> -ext2lib_mount(fsi_t *fsi, const char *name, const char *options)
> +ext2lib_mount(fsi_t *fsi, const char *options)
>  {
>  	int err;
>  	char opts[30] = "";
>  	ext2_filsys *fs;
>  	uint64_t offset = fsip_fs_offset(fsi);
>  
> +	/*
> +	 * We must choose unixfd_io_manager rather than unix_io_manager in
> +	 * order for the library to accept fd strings instead of paths. It
> +	 * still means we must pass a string representing an fd rather than
> +	 * an int, but at least this way we don't need to pass paths around
> +	 */
> +	char name[32] = {0};

For an int?  12 will do fine including a terminator, and practical
system limits leave it far smaller than that generally.

Given that it is guaranteed long enough, you don't need to zero it just
to have snprintf() write a well-formed string in.

~Andrew

