Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7D9854FCB
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 18:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681092.1059678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raIv4-0004sz-KF; Wed, 14 Feb 2024 17:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681092.1059678; Wed, 14 Feb 2024 17:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raIv4-0004qc-HM; Wed, 14 Feb 2024 17:19:38 +0000
Received: by outflank-mailman (input) for mailman id 681092;
 Wed, 14 Feb 2024 17:19:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hroU=JX=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1raIv3-0004qT-6o
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 17:19:37 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a1370e4-cb5d-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 18:19:36 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33ce55ab993so679705f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 09:19:36 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bn8-20020a056000060800b0033b198efbedsm13229061wrb.15.2024.02.14.09.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 09:19:35 -0800 (PST)
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
X-Inumbo-ID: 3a1370e4-cb5d-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707931176; x=1708535976; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQcbDB//Q5fEWkhqNQ+NEk9bkYANdAUf2ims+W6W1y8=;
        b=fJ5fdTuDmdzmEuaFe7xNp8+TIOmT4OwYuUGAjip67uIUTo8HA82U3IvDqASblHCjFP
         Pz71g6JCom7py9b6VTFbCeBfoy7BlV/gO1MJtUvs9sQijvo+tQeKwzxy8/32iMdE2CjB
         9p79rvPkv0KPXxo/PRWgX5UaYtCjBXL0WNs2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707931176; x=1708535976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQcbDB//Q5fEWkhqNQ+NEk9bkYANdAUf2ims+W6W1y8=;
        b=ZD6HG0V3izJRsQ3++wp1XX5bjjFqd/On5NP7oG1++/ez9bssrecn1M1lLMMUFsQql1
         uwrQPBFWJP2xX+vwSy2Tq9MKzOIABQO7pZAhB7/PZRyL6QkHbZusu+OeD+s1TLPt8SCk
         6caKB/wHK0IHrKCjtCdKLUyMWyWjfU3ZOApDe/+FP15brI2MUcBxdyV3A4LBvTzEXPhe
         ePAaFtsgaRBM10j4nT50kj3UyJ5pbG6A8jivK0ZhbuEuewvOfk5Cp/fcsvPjwBLGpCeu
         C1U26Fc1/4U/rjKLvgEutSO4afhPCRDnIm6lqA+in5nwbe+TnDaUBrNZuF13znrFSW4w
         UNUA==
X-Gm-Message-State: AOJu0Yx4lBiNJkmugmxXY25IvkV1s72qb2AwniWEdl+wDeYk9p0QESHQ
	hAGRJk31Jfk5Y7V8lRPIaUpBMpyYwtIRMZ5ayeSPChOOY0+LpyqEZBIm36vWrnQ=
X-Google-Smtp-Source: AGHT+IGQHujsKd+TkpPpdAStmas1ncFYEdPaB6NCKbc9x79pcuCfNA5h/2zMDikzymk1wT4XvoUjxA==
X-Received: by 2002:adf:e683:0:b0:33c:df3e:a5a3 with SMTP id r3-20020adfe683000000b0033cdf3ea5a3mr2004566wrm.69.1707931175808;
        Wed, 14 Feb 2024 09:19:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDZL+ThuTqpkUQyCXiL4xr9Pg6MhBU4aIwXth0DOsXZWGT80OjWXvyTAwhFTMHiuI8RO7U6sOe4PdivF/3dvmZ8olU/b87VU/J4g==
Date: Wed, 14 Feb 2024 17:19:35 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH v5 18/22] tools: add 9pfs device to xenstore-stubdom
Message-ID: <1d87da18-6dcc-4eae-8453-3eef4ffee9c9@perard>
References: <20240208165546.5715-1-jgross@suse.com>
 <20240208165546.5715-19-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208165546.5715-19-jgross@suse.com>

On Thu, Feb 08, 2024 at 05:55:42PM +0100, Juergen Gross wrote:
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index a554f2ccd6..e6ab5ddb94 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -583,6 +583,13 @@
>   * libxl_console_add_xenstore() in libxl.
>   */
>  #define LIBXL_HAVE_CONSOLE_ADD_XENSTORE 1
> +
> +/*
> + * LIBXL_HAVE_P9_ADD_XENSTORE indicates presence of the function
> + * libxl_device_9pfs_add() in libxl.
> + */
> +#define LIBXL_HAVE_P9_ADD_XENSTORE 1

Nit, we could probably remove the _XENSTORE suffix from the define, but
it's ok to keep it as well, just to avoid a round trip.

In any case, patch looks good:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

