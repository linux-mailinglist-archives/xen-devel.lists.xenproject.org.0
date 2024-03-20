Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FD488145F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 16:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695993.1086450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxja-0001Ku-LE; Wed, 20 Mar 2024 15:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695993.1086450; Wed, 20 Mar 2024 15:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxja-0001JG-GI; Wed, 20 Mar 2024 15:20:06 +0000
Received: by outflank-mailman (input) for mailman id 695993;
 Wed, 20 Mar 2024 15:20:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmxjZ-0008Eu-4N
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 15:20:05 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52f22566-e6cd-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 16:20:03 +0100 (CET)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-789f50b3e40so81798885a.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 08:20:03 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 jf14-20020a0562142a4e00b00690afbf56d5sm7875091qvb.66.2024.03.20.08.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 08:20:02 -0700 (PDT)
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
X-Inumbo-ID: 52f22566-e6cd-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710948002; x=1711552802; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AHbkqahN1wSn0BiQYUnDUhVtbBjifYZuCyICyoeS01Y=;
        b=cTQFv0FtELFhQQEcK5ilPzZdN0gcCgnXccVSDkiSQtPPBFWgdpNO2w1KMTYvfLWHSR
         M8pnie9/Kf2rHmNBVutMuN872x0Qa9Z5XcvGdpy67xtqQQgBrVqnlF0e7SOKcw8pPVEc
         hw8mYelvLIdRyIfqD1Q98r++c4RXbVr5FZGO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710948002; x=1711552802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHbkqahN1wSn0BiQYUnDUhVtbBjifYZuCyICyoeS01Y=;
        b=tOXh3bKRc2DoeGncpT5PMzdJm7PEB3dLtDm69Z8vdeeKqWiO6c+SGImbizBzNEwHKy
         tX4UcifNrweAR9mtiYnq2yb7GGV3Zzs2TYy/DSzJD14ZPVGPZQvu/mJAUVUn0fb/gUph
         3ryJvfaoKzPTNh/a5zMjyYxPPDwiNwwRg/gdSHn8zJKaA18CVUb27s59rCNCj9JClidt
         vAkVDuiwIFY+jq8gIiuCr5Rfxs49PKDzCYC1XAF3mBecFV5JyaK7ro5JwzriNagAc4Bx
         7jJAGpdZOwyWsqjDmiGx4l7oSzW9i7M81XSohy87CO89L8zYtEu9nAQQi5LFQx003fQA
         Z3jQ==
X-Gm-Message-State: AOJu0YyovUlQrYfXoZfbGPcnK6HrPiG4Gl8dxg3qRD+pz60J3jogH7Fu
	IoUN1n7FLBm2FuACDSM1jbAaruyAPR9Qda8+8o/SB4Q+t7QaSA8B76sa0awHMSM=
X-Google-Smtp-Source: AGHT+IHLPITz3dcd5Ofgn3kQkXvFDtliG5Ej/74OJiimgL312cvmYzgGI3XSlq2N4z5dqGyH4Z3m5Q==
X-Received: by 2002:a05:6214:401c:b0:68f:b825:9255 with SMTP id kd28-20020a056214401c00b0068fb8259255mr166122qvb.22.1710948002367;
        Wed, 20 Mar 2024 08:20:02 -0700 (PDT)
Date: Wed, 20 Mar 2024 16:20:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 02/36] ts-xen-build-prep: Only force git protocol
 v2 on buster
Message-ID: <Zfr-oCQrJmetJPQG@macbook>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
 <20240318165545.3898-3-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318165545.3898-3-anthony.perard@citrix.com>

On Mon, Mar 18, 2024 at 04:55:11PM +0000, Anthony PERARD wrote:
> Newer version of Debian and thus git would use this automatically, no
> need to force it.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  Osstest/TestSupport.pm | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
> index f0e087aa..0dded9b2 100644
> --- a/Osstest/TestSupport.pm
> +++ b/Osstest/TestSupport.pm
> @@ -3257,7 +3257,7 @@ END
>  
>      # Adding mandadory use of Git protocol v2
>      # necessary on buster when building QEMU v8.1
> -    $gitcfg .= <<END;
> +    $gitcfg .= <<END if $ho->{Suite} =~ m/buster/;
>  [protocol]
>  	version = 2

Do we need to limit ourselves to version 2 for the git cache stuff, or
that doesn't matter?

I'm wondering whether it case version 3 of the protocol appears we
would be in trouble by not having version = 2 in the config file.

Thanks, Roger.

