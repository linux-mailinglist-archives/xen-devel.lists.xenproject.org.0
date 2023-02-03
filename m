Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBB568A0F2
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 18:54:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489307.757674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO0GR-0002zt-6M; Fri, 03 Feb 2023 17:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489307.757674; Fri, 03 Feb 2023 17:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO0GR-0002xd-3j; Fri, 03 Feb 2023 17:54:19 +0000
Received: by outflank-mailman (input) for mailman id 489307;
 Fri, 03 Feb 2023 17:54:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eOZn=57=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1pO0GP-0002xX-Rg
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 17:54:18 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5c98f40-a3eb-11ed-933c-83870f6b2ba8;
 Fri, 03 Feb 2023 18:54:16 +0100 (CET)
Received: by mail-pj1-x102b.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso9515233pjj.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Feb 2023 09:54:15 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 e12-20020a170902784c00b00192b23b8451sm1889641pln.108.2023.02.03.09.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 09:54:13 -0800 (PST)
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
X-Inumbo-ID: c5c98f40-a3eb-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FglzRedEledpe7U/HZFQU5fjwrxpiFTlIoZfizmZKxo=;
        b=jbL6W/faZm4W+GkDNARtVIQSEx2ADO2QYfIC86h2ZMHc5o/ZEBFOY5YrRkhNg2iOpB
         /63HbsfHa9WGzx3zbFmY1UfIUIuxKXcouG1MM1zxPt90HwxBo5dELOThuq4wIWGKm/i2
         DiYYIrK7jDHD/1It501CO+Y9SysMFq67N+Mtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FglzRedEledpe7U/HZFQU5fjwrxpiFTlIoZfizmZKxo=;
        b=yTAOgjIap+UGOnls2lelohJy1FYh2XZocLZD3bczMf0SkL5TBRdr1Vho82aFx/og+6
         1YTEQuNdKuGyGyJfN2zBDfKxx+PD8Q63SvftVkqnWlUxlFr1rP0TcfPYRylTmz/ncZfD
         hm4meTPa9ZMagPLn9/jj5UVI+Bq113R6iTXq0H6/lYm4Bz6oilsZkbbOSG+BeuVMIvFF
         3mQIvbK9si0BsUDzrluCBDwTY1I97HLqstRtr/Jm4PgQdeFBcyZM8kTU6CStiv6njwrr
         eHKaRr98lf7w6C90XY7mmzxgnV1rtxRNkiMyfDfxE3hq54UD/IcdOP9JCX3j85atpDuj
         NVLA==
X-Gm-Message-State: AO0yUKWuL4x+VjBHM1ZltptZ9ypBfTixydim+oG3mCpdKxP0mOJOkywE
	i19w4bc2Hz2nyRc0Z9ipAOJq4Q==
X-Google-Smtp-Source: AK7set/Z7WE5Ld13ny7sgCsxLEEjOYX9qnYiq/CIu1TV+5vNxcdynZYDJopTLqfhZ/z5xziON6sH4Q==
X-Received: by 2002:a17:902:c611:b0:194:5fc9:f55a with SMTP id r17-20020a170902c61100b001945fc9f55amr8907518plr.35.1675446854374;
        Fri, 03 Feb 2023 09:54:14 -0800 (PST)
Message-ID: <63dd4a45.170a0220.e6dee.365d@mx.google.com>
X-Google-Original-Message-ID: <202302031754.@keescook>
Date: Fri, 3 Feb 2023 17:54:13 +0000
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] xen: Replace one-element array with flexible-array
 member
References: <Y9xjN6Wa3VslgXeX@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9xjN6Wa3VslgXeX@work>

On Thu, Feb 02, 2023 at 07:28:23PM -0600, Gustavo A. R. Silva wrote:
> One-element arrays are deprecated, and we are replacing them with flexible
> array members instead. So, replace one-element array with flexible-array
> member in struct xen_page_directory.
> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
> 
> This results in no differences in binary output.
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/255
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

