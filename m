Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFFE8751A6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 15:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689927.1075426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riEYQ-0005S1-GW; Thu, 07 Mar 2024 14:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689927.1075426; Thu, 07 Mar 2024 14:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riEYQ-0005PQ-Dh; Thu, 07 Mar 2024 14:17:02 +0000
Received: by outflank-mailman (input) for mailman id 689927;
 Thu, 07 Mar 2024 14:17:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3smc=KN=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1riEYO-0005PK-4y
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 14:17:00 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b9f9ff1-dc8d-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 15:16:58 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56682b85220so1305132a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 06:16:58 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ch14-20020a170906c2ce00b00a42ea946917sm8253661ejb.130.2024.03.07.06.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 06:16:57 -0800 (PST)
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
X-Inumbo-ID: 5b9f9ff1-dc8d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709821017; x=1710425817; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xTJKudv5n555xDB36nbOT1Mlzplfm/E/PA4E8+tCLoA=;
        b=HUKiYKYUe1oDZBV9bQUvM37KJk+2Qgw2XqhPQYkdEBoT6OOwJKGp9B9CVP/MHuy1bD
         yeapz7+EKYkPAe4qJEYAZTwPVh+3sFuFrCoqWISVsycU00+MgHXg+RvIcPuCmJ0tyui3
         5ts7BlOrA62tOHuZufESusmor3qRQTmd6gB4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821017; x=1710425817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTJKudv5n555xDB36nbOT1Mlzplfm/E/PA4E8+tCLoA=;
        b=ZQ9WZ1Ls7HOAFTidHobE/jjG75CI+HUudhaLfGgISh8B6UYEtg1OH9LrqFivr8dOkV
         y5qSUxTzgIwfYGaIeEpJ8bv8BG36VT9IgM5Ct9XxXfIM7IFymoBbikdeiZueh+yshUzr
         8jyat8E3yMlceEQ3y2/1A1eVN/5F1yf+Od10qxZM46tpBgP+FCbnlPUcCVxAQvGz0l3I
         pjHHhMU+98PlA+VJlYb9R+R7+xAhDxAUHnqDX8DnuRECE2OHO8E07HeOjS/AdtpF9umJ
         jbdC6hYEwS/ezVW25sVMOpBzAMWk7TREwDnly6si4N4qH1t/N492Sky3qrARZN+eaAtF
         0j9Q==
X-Gm-Message-State: AOJu0Yy+8ejxAEVDL64o6TVnKbzQ8IBfb3y5Gzq/AnZDSZ0FqEUpJR9x
	M0V6CdajhdoqumX0d6CgsTyxE+cnvL5TOsjQ/2qqWGBE9VvHfh1vK627UuwGkFI=
X-Google-Smtp-Source: AGHT+IFtFUYlb87wle99gwYQ1C6aNcvPqx/m9s9NlmjqX7BWoWZfPstlUD251iq+d/rVqE97q2LaZw==
X-Received: by 2002:a17:906:6bda:b0:a45:b1d8:200c with SMTP id t26-20020a1709066bda00b00a45b1d8200cmr4476135ejs.14.1709821017569;
        Thu, 07 Mar 2024 06:16:57 -0800 (PST)
Date: Thu, 7 Mar 2024 14:16:56 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Henry Wang <xin.wang2@amd.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3] tools/9pfsd: Fix build error caused by strerror_r
Message-ID: <6c3cfb96-0f39-49ec-84bd-c37e0701563b@perard>
References: <20240307135616.3953774-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240307135616.3953774-1-xin.wang2@amd.com>

On Thu, Mar 07, 2024 at 09:56:16PM +0800, Henry Wang wrote:
> Below error can be seen when doing Yocto build of the toolstack:
> 
> | io.c: In function 'p9_error':
> | io.c:684:5: error: ignoring return value of 'strerror_r' declared
>   with attribute 'warn_unused_result' [-Werror=unused-result]
> |   684 |     strerror_r(err, ring->buffer, ring->ring_size);
> |       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | cc1: all warnings being treated as errors
> 
> Using strerror_r() without special casing different build environments
> is impossible due to the different return types (int vs char *)
> depending on the environment. As p9_error() is not on a performance
> critical path, using strerror() with a mutex ought to be fine. So,
> fix the build by using strerror() to replace strerror_r(). The steps
> would then become: Acquire the mutex first, invoke strerror(), copy
> the string from strerror() to the designated buffer and then drop the
> mutex.
> 
> Fixes: f4900d6d69b5 ("9pfsd: allow building with old glibc")
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

