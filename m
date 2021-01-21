Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64A02FEDA0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 15:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72145.129625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bOC-0002CU-E4; Thu, 21 Jan 2021 14:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72145.129625; Thu, 21 Jan 2021 14:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bOC-0002C5-Ao; Thu, 21 Jan 2021 14:56:48 +0000
Received: by outflank-mailman (input) for mailman id 72145;
 Thu, 21 Jan 2021 14:56:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dq2E=GY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l2bOB-0002C0-29
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 14:56:47 +0000
Received: from mail-wr1-f49.google.com (unknown [209.85.221.49])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2048c62d-91a5-43d8-9a3a-c50c991c60f9;
 Thu, 21 Jan 2021 14:56:46 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id g10so2048224wrx.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 06:56:46 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 62sm8929461wmd.34.2021.01.21.06.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 06:56:44 -0800 (PST)
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
X-Inumbo-ID: 2048c62d-91a5-43d8-9a3a-c50c991c60f9
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PD52RRNZMruGPbAjpT8NpbgSJ5c11FTuP17ejq17RwI=;
        b=J3jCu0IkWGL0FpLlbL5P3fPbiwzlGQKQaxKgVl4ETUFyEtc/zdqNukql44W1SdQ4dJ
         aiHB/qvsPBdE8YZm2S5sGx+R0PSM4iEI82vraR0ftkgDhDZU7+LrQUMYhqOwPBw5Wlvk
         XjFKpP4eVxOAJPFtn78hbG5J7stbyl7zhn5mBN1iwvXDxVkjckyfk8ffghnornHpLrcl
         UyVlssiUJ3aKK4dTRSIKc+gJolvyENRrWm7cqSD0o85hoLMfPGLgcL5CxE+092bvhOme
         SmQxgEvaaMZZWalHvqljErcK6kOnanRjRg7xW4wtknaoIxWI7gVT2D91kFH3zq5/Wgh2
         NwTA==
X-Gm-Message-State: AOAM532/dmyEXWIhuZAVSnnrXYf8ew0sWzcYUn18Qf1KKeJBIklcVNoY
	zRhsdtxIEE4TDhP6g/8w14s=
X-Google-Smtp-Source: ABdhPJye7Rw6br8TJSW0xN+fQF80Wz3OOhUhJh7SAO+ESWYRvkgdkm9mug1+XXtv+5FNh/Yu8MJosg==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr14270170wrr.319.1611241005539;
        Thu, 21 Jan 2021 06:56:45 -0800 (PST)
Date: Thu, 21 Jan 2021 14:56:43 +0000
From: Wei Liu <wl@xen.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
	anthony.perard@citrix.com, jbeulich@suse.com,
	andrew.cooper3@citrix.com, roger.pau@citrix.com,
	jun.nakajima@intel.com, kevin.tian@intel.com
Subject: Re: [PATCH v2 1/4] xl: Add support for ignore_msrs option
Message-ID: <20210121145643.5ogz3worwt3gabdc@liuwe-devbox-debian-v2>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
User-Agent: NeoMutt/20180716

On Wed, Jan 20, 2021 at 05:49:09PM -0500, Boris Ostrovsky wrote:
> This option allows guest administrator specify what should happen when
> guest accesses an MSR which is not explicitly emulated by the hypervisor.
> 
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> ---
>  docs/man/xl.cfg.5.pod.in         | 20 +++++++++++++++++++-
>  tools/libs/light/libxl_types.idl |  7 +++++++
>  tools/xl/xl_parse.c              |  7 +++++++
>  3 files changed, 33 insertions(+), 1 deletion(-)

It is mainly missing a #define LIBXL_HAVE_XXX in libxl.h.

Other than that, this patch looks good to me. If you end up resending
this series, please fix that issue.

If other patches are all reviewed, you can provide some text to be
merged into this patch.

Wei.

