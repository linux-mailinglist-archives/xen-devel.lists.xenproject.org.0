Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC571E1F45
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 12:04:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdWR1-0007tz-13; Tue, 26 May 2020 10:03:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3u5=7I=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jdWQz-0007tu-7V
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 10:03:45 +0000
X-Inumbo-ID: 2ee37cda-9f38-11ea-9947-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ee37cda-9f38-11ea-9947-bc764e2007e4;
 Tue, 26 May 2020 10:03:44 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t18so5729577wru.6
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2020 03:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=QrOVKMNdUBLLHH/nbmg3vYiipoecOqTtO9FF9ATZl9E=;
 b=sgtCM8vE6hmf54xd5rSL746e0q9+uIhGHaGUmToYZ9lHGw3Ad6UQeWbAE3oZ3+yils
 3+yJzSNBGihiU34HDtszOrHPTLVFdMaUq8lw4tueyEnsAgllQDMgz57vC3AP7bMGSJ67
 IVPWt2R4c3g7JSzmqnjd3/qsWm6HvDF16ZBdTzec/trqmbj0n76T6c9CHwuScjHeAlnM
 hYjbZoFd0U4EtgY2Cd5sq1ONpUMXhuw3KYg/Zg7eRT5ay7S9vM5LF00GQmrT8qaZIPAO
 eu30WPWvDMjWC8R2WcxtzRlNZyr8Zv7G2+i9cRUFpqwJwJqMWdHMg1ErAAEDJqwMgwPJ
 vXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=QrOVKMNdUBLLHH/nbmg3vYiipoecOqTtO9FF9ATZl9E=;
 b=iYHTwUv/8icUtLLpd5btbPRqEdXoUyrQ81iJWdricPlqQfP7BU6QBFis7oL9R4C8A/
 YHs9ZtKJia8L88ccqMLAZv1H8Zmu54Sz+hrqAMflzNZBjvdmp7dZj8cuX96S9R8aZ3oT
 O0UzFV5EeeypLlWbiFL51/l3wm0hEm3gpGldA7o4GwTUbKApaSW8tFSgze0plugWRclr
 Ck6DmLZ0723fi1y026z0C0iAnwQo4MemNOe00+VW3r8bM6cK79nAdOBdMtSFx5/IQULG
 qhT1F8VIAma7jnLHbPZisCIzc8/G4FpCETdwbeNwV+DRoUWAxLD+ePZ+Ewsp0R60Hl80
 qEFw==
X-Gm-Message-State: AOAM530E3Pl2vTdLKQT5sj+syDmtjGhyExPBEnQXr4qrU3aPNS0z7lnT
 8FSBswC8NGTb/3G9t1Qc4PI=
X-Google-Smtp-Source: ABdhPJxRV7tECLej5J7sXTjPqP+Jwph+Yk3wdqueS3QNCNiPvrwOTrnDIm9VxPf5hHesntP0uQ9lWw==
X-Received: by 2002:adf:f990:: with SMTP id f16mr13493344wrr.311.1590487423892; 
 Tue, 26 May 2020 03:03:43 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id j4sm19202837wrx.24.2020.05.26.03.03.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 May 2020 03:03:43 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <20200526095038.27378-1-jgross@suse.com>
 <20200526095038.27378-2-jgross@suse.com>
In-Reply-To: <20200526095038.27378-2-jgross@suse.com>
Subject: RE: [PATCH 1/2] CHANGELOG: add hypervisor file system support
Date: Tue, 26 May 2020 11:03:42 +0100
Message-ID: <004501d63344$f025a540$d070efc0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKQq46lmxkKpOsd5tjB0m87I8ZJ0wFonwPmpzntqMA=
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
Cc: 'Community Manager' <community.manager@xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Juergen Gross <jgross@suse.com>
> Sent: 26 May 2020 10:51
> To: xen-devel@lists.xenproject.org
> Cc: Juergen Gross <jgross@suse.com>; Paul Durrant <paul@xen.org>; Community Manager
> <community.manager@xenproject.org>
> Subject: [PATCH 1/2] CHANGELOG: add hypervisor file system support
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>  CHANGELOG.md | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ccb5055c87..75b7582447 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     fixes.
>   - Hypervisor framework to ease porting Xen to run on hypervisors.
>   - Initial support to run on Hyper-V.
> + - Initial hypervisor file system (hypfs) support.
> 
>  ## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
> 
> --
> 2.26.2



