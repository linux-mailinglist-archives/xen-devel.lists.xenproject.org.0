Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AC681A54F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 17:36:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658184.1027271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFzYe-0005iP-26; Wed, 20 Dec 2023 16:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658184.1027271; Wed, 20 Dec 2023 16:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFzYd-0005gG-UL; Wed, 20 Dec 2023 16:36:31 +0000
Received: by outflank-mailman (input) for mailman id 658184;
 Wed, 20 Dec 2023 16:36:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHJo=H7=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rFzYc-0005g3-NA
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 16:36:30 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed48a397-9f55-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 17:36:29 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d22d3e751so5973845e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 08:36:29 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c459400b0040c3dcc36e6sm153916wmo.47.2023.12.20.08.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 08:36:29 -0800 (PST)
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
X-Inumbo-ID: ed48a397-9f55-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703090189; x=1703694989; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hA8y5W1bqpc6Dd91vzYXk0eopxD9JxEsxFTEP6oeTcU=;
        b=biBGNLLZHWTEFNPQEGiApnP9LK0QSh0tZ1gAtzLyBwNfRg66CMlxrd0I2n+YOc5052
         440Wh2A8TihM50fDd/Jxq66tQ676IZaL9MY3OLtWTaij4O02ViBwx2yP59P/eMbbvVRU
         uYT+9aohCZooL0wfLhsk2C8yk5PMVjsHj95YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703090189; x=1703694989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hA8y5W1bqpc6Dd91vzYXk0eopxD9JxEsxFTEP6oeTcU=;
        b=dGTyJc1pbqT70twljE3Yj5/HnTzJuazbRrkhCiLVzPqE7xjpJ5jwbyVw28gz8Va1KY
         d/aWV5zpPdVTAkKzJ0400aeXnd74KU7jvhZ58nqv9P8tHksBfWG8uNNgr6735qdN9dzW
         yLV0tCG5QhVlSJXirS5YW5WzwlcYofrbIyK4KhTTSusqJClYoAV5FsYMlOs/N4dhok1M
         6AHL1itSrXmtkY3OScnpuGElY/X6KkI+VWhKhfYMTzIZJdgF9ZJqe89KuO9V1RcX+Z5V
         Fk70xnL3tTxTpdWrGi3hwQSUIXr/wqCcu7rdaOZQGoWaMePn0zrv0S2vH0yFhSP1r+2m
         o7Gw==
X-Gm-Message-State: AOJu0YyEude6Kixz0mGNKPH2s7UrZvbd7jE1pdMaUA+qX+rB0omg9mDm
	tG1qAKfJPZcQ+UrVOKNNY0yc2g==
X-Google-Smtp-Source: AGHT+IF2iBCEIWT9+giyQFrkRCEzdk/ePARygHTC3Xad8r8PiffiW26aBv41KnAHoEwZ5EKRxqF7Cg==
X-Received: by 2002:a1c:6a0c:0:b0:40d:2dd9:dac5 with SMTP id f12-20020a1c6a0c000000b0040d2dd9dac5mr1325382wmc.97.1703090189366;
        Wed, 20 Dec 2023 08:36:29 -0800 (PST)
Date: Wed, 20 Dec 2023 16:36:28 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/7] tools/xenguest: Dynamically allocate xc_cpu_policy_t
 contents
Message-ID: <1ba3c90e-7af0-4331-966d-ac39d1ee4721@perard>
References: <20231107154921.54979-1-alejandro.vallejo@cloud.com>
 <20231107154921.54979-2-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107154921.54979-2-alejandro.vallejo@cloud.com>

On Tue, Nov 07, 2023 at 03:49:15PM +0000, Alejandro Vallejo wrote:
>  void xc_cpu_policy_destroy(xc_cpu_policy_t *policy)
>  {
> -    if ( policy )
> -        free(policy);
> +    int err = errno;
> +
> +    if ( !policy )
> +        return;
> +
> +    if ( policy->leaves.buf )
> +        free(policy->leaves.buf);
> +    if ( policy->msrs.buf )
> +        free(policy->msrs.buf);

FYI: free() already check for NULL, so the extra if() is unnecessary.

Otherwise, patch looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

