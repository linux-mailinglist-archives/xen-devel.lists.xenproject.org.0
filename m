Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCDB1F7485
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 09:22:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jje0v-0002YE-4I; Fri, 12 Jun 2020 07:22:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d5ow=7Z=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jje0s-0002Y9-Ts
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 07:22:07 +0000
X-Inumbo-ID: 6b087506-ac7d-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b087506-ac7d-11ea-b7bb-bc764e2007e4;
 Fri, 12 Jun 2020 07:22:06 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u26so8511966wmn.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2020 00:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=QX2hYMcq8KtNejbzc9d9v51YQ40OXVASPsQvLnJH96s=;
 b=oKwBvXhx/Wuy2jnsNtK61cawaTAnoU1rJn5g7y5FReTlL1Rph/WtFa6hZuM9g7YXFv
 ZOsHdbDmQ6ent057T2/Mxr6RGNn9+TTG7hBbBJpSjQB99x/eK948G5TWFK6kBbB4yPTe
 z9nHEYFF+ZodIXGJJ+ASlml8RQ6kXBtOmwc47D0Hlq1ZP4emsuztAiB3CpqJ4iKCO23V
 goOsOElOqSSZUEnf0A7IGdkQjpqrJGSlue88KcVnZ6Aj4+Mz5OEjrffFfFfTjqk9UOT3
 woI0G7Y78LQU6R6/HGnlXP6WG/cSpFNvmo+XxqSb5V4h90pXoJJ5V9Dc33S2e59H0yOV
 JPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=QX2hYMcq8KtNejbzc9d9v51YQ40OXVASPsQvLnJH96s=;
 b=CV3+8Ttu8cWwExuK57AbdjSlSPUzkP0XbqDGH1cEJrKzWqM+UjmrxT2yZIBEGJnBWi
 jvzApcKZdR+AKEMAOjzufXhDarEep8cCX/HFo+xr/mWIC21qmCbAebGsWx6hkidxGo6A
 rOfffWv2WNg8pVsI8XzLDU2Zsxxd24Hi+5lx0LXKNGC05qigNOROn9pgZiZub8MiUlDu
 uIYNOXsZyEZpWErnCqN4niltJgaMNYN3pDxcEaOxYuUKgsGVb6nTv1SizKQYntFszSTG
 p2btEY8OcJ4UpDoiMrlphpFurGBXjOVd8AmEFYlM401Adb5mXxgAqXNxiJG/gIilwXG0
 0cuw==
X-Gm-Message-State: AOAM531ySFCizBK8Nostst9vyETmRfn8c4r6fSQhEpaB2hQJPM7O+Co5
 CqS3p3mT8jSTDWWiYIHfq0k=
X-Google-Smtp-Source: ABdhPJxCljITKr7EqcB/OdCl9+q4VixzvbFNlcOFBcHOMPB3XebDxolzsfgQeTEtDfftNWD8YByFLw==
X-Received: by 2002:a1c:408:: with SMTP id 8mr11681540wme.15.1591946525171;
 Fri, 12 Jun 2020 00:22:05 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5782:7500:500b:ebd:ed78:4380])
 by smtp.gmail.com with ESMTPSA id b14sm7429409wmj.47.2020.06.12.00.22.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jun 2020 00:22:04 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200610114004.30023-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200610114004.30023-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH for-4.14] tools: fix error path of xendevicemodel_open()
Date: Fri, 12 Jun 2020 08:22:04 +0100
Message-ID: <010401d6408a$2c57bba0$850732e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJVAhO9pRR+GTACAAMIE1rLmlKQ5KfXD/qg
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Juergen Gross' <jgross@suse.com>, 'Ian Jackson' <Ian.Jackson@citrix.com>,
 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 10 June 2020 12:40
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson <Ian.Jackson@citrix.com>; Wei Liu
> <wl@xen.org>; Juergen Gross <jgross@suse.com>; Paul Durrant <paul@xen.org>
> Subject: [PATCH for-4.14] tools: fix error path of xendevicemodel_open()
> 
> c/s 6902cb00e03 "tools/libxendevicemodel: extract functions and add a compat
> layer" introduced calls to both xencall_open() and osdep_xendevicemodel_open()
> but failed to fix up the error path.
> 
> c/s f68c7c618a3 "libs/devicemodel: free xencall handle in error path in
> _open()" fixed up the xencall_open() aspect of the error path (missing the
> osdep_xendevicemodel_open() aspect), but positioned the xencall_close()
> incorrectly, creating the same pattern proved to be problematic by c/s
> 30a72f02870 "tools: fix error path of xenhypfs_open()".
> 
> Reposition xtl_logger_destroy(), and introduce the missing
> osdep_xendevicemodel_close().
> 
> Fixes: 6902cb00e03 ("tools/libxendevicemodel: extract functions and add a compat layer")
> Fixes: f68c7c618a3 ("libs/devicemodel: free xencall handle in error path in _open()")
> Backport: 4.9+
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Ian Jackson <Ian.Jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Paul Durrant <paul@xen.org>
> 
> RFC - this is still broken.
> 

I'm slightly confused. Do you want this in 4.14 in this form or are you expecting to update it?

  Paul

> Failure to create the logger will still hit the NULL deference, in all of the
> stable libs, not just devicemodel.
> 
> Also, unless I'd triple checked the history, I was about to reintroduce the
> deadlock from c/s 9976f3874d4, because it totally counterintuitive wrong to
> expect setup and teardown in opposite orders.
> ---
>  tools/libs/devicemodel/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
> index db501d9e80..4d4063956d 100644
> --- a/tools/libs/devicemodel/core.c
> +++ b/tools/libs/devicemodel/core.c
> @@ -67,9 +67,10 @@ xendevicemodel_handle *xendevicemodel_open(xentoollog_logger *logger,
>      return dmod;
> 
>  err:
> -    xtl_logger_destroy(dmod->logger_tofree);
> +    osdep_xendevicemodel_close(dmod);
>      xentoolcore__deregister_active_handle(&dmod->tc_ah);
>      xencall_close(dmod->xcall);
> +    xtl_logger_destroy(dmod->logger_tofree);
>      free(dmod);
>      return NULL;
>  }
> --
> 2.11.0



