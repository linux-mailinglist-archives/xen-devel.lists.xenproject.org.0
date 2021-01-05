Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA9F2EAA3A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 12:54:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61828.108957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwkun-0007gI-5d; Tue, 05 Jan 2021 11:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61828.108957; Tue, 05 Jan 2021 11:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwkun-0007ft-25; Tue, 05 Jan 2021 11:54:17 +0000
Received: by outflank-mailman (input) for mailman id 61828;
 Tue, 05 Jan 2021 11:54:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=apNQ=GI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kwkul-0007fn-Uu
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 11:54:15 +0000
Received: from mail-wr1-f47.google.com (unknown [209.85.221.47])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id daab8db0-0acc-4dd9-a17f-bad700283346;
 Tue, 05 Jan 2021 11:54:14 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id a12so35874978wrv.8
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jan 2021 03:54:13 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id l8sm106499571wrb.73.2021.01.05.03.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 03:54:12 -0800 (PST)
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
X-Inumbo-ID: daab8db0-0acc-4dd9-a17f-bad700283346
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2oaYULvbjp9Cau/VDDyP8LKhlo8+HQ9tEmvR8v+LeN4=;
        b=PzG04aZnBj0up9ag91bqr+ovNKqZlOvcQIjOvYgvONj44nur1dr5BAHqAKPErqkWp4
         8xgTr1A3dUXl8DVZIPysfVacT/M6MPstRy2legnzhSroWl2w9rhJtLVVHNv7qdd+SFFF
         PrcxUqcWIFXN1BHR30V1XH2NW2ud0QgOlPkOYKFAzrEzI4vUMvYDuefLRnAjyupAoKDC
         7I6WQmjyhEa+rGu8mGVC+rEJMeG0Z8c3zIvnBWX+uUxF3qTHsMpY6mNJYIRZRurQ9RX2
         3UQgW36TE/Ewlmp0YsVxs3m4VuqKaV1GEdu9xQoUY4HWf7QIG0OktAZvD1q43G5jRpJB
         ANNw==
X-Gm-Message-State: AOAM530DzZfUAYVMjiI4LNsLF9fIdjIruurs3YFwB3C6dA1HQjTuhcjY
	+6O0puFHqXuDXTHkq3GpX0A=
X-Google-Smtp-Source: ABdhPJyfHNaDx40wfv/5PjyCtNgAkHIB+Lbinpb77zWvC90lh/nbfw8D3M+irlsppbBv6DbWsmyGLg==
X-Received: by 2002:a5d:6902:: with SMTP id t2mr83472446wru.214.1609847653230;
        Tue, 05 Jan 2021 03:54:13 -0800 (PST)
Date: Tue, 5 Jan 2021 11:54:11 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools: handle more than 16T in precopy_stats
Message-ID: <20210105115411.b56fu35osf5hfgfw@liuwe-devbox-debian-v2>
References: <20210105083048.19568-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105083048.19568-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Tue, Jan 05, 2021 at 09:30:48AM +0100, Olaf Hering wrote:
> total_written tracks the number of transferred dirty pages.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Wei Liu <wl@xen.org>

> ---
>  tools/include/xenguest.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> index a9984dbea5..775cf34c04 100644
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -438,7 +438,7 @@ struct xenevtchn_handle;
>  struct precopy_stats
>  {
>      unsigned int iteration;
> -    unsigned int total_written;
> +    unsigned long total_written;
>      long dirty_count; /* -1 if unknown */
>  };
>  

