Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16C27996F2
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 10:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598466.933288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetcB-0006rP-Q3; Sat, 09 Sep 2023 08:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598466.933288; Sat, 09 Sep 2023 08:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetcB-0006ol-ND; Sat, 09 Sep 2023 08:46:51 +0000
Received: by outflank-mailman (input) for mailman id 598466;
 Sat, 09 Sep 2023 08:46:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rb1o=EZ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qetc9-0006oc-Qr
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 08:46:49 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 692f1a89-4eed-11ee-8783-cb3800f73035;
 Sat, 09 Sep 2023 10:46:48 +0200 (CEST)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1c504386370so1968458fac.1
 for <xen-devel@lists.xenproject.org>; Sat, 09 Sep 2023 01:46:48 -0700 (PDT)
Received: from leoy-huanghe.lan ([98.98.49.29])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a17090a800100b00263987a50fcsm4061062pjn.22.2023.09.09.01.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 01:46:46 -0700 (PDT)
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
X-Inumbo-ID: 692f1a89-4eed-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694249207; x=1694854007; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WGAcv82Qzm33LHRf2WHxHuhiKlY4nF3DVLNuoygi7Bs=;
        b=IQ3VYiZMKJDxDuIYJ8Sh42+DRsMrl6gO+w8LBVbAzuUkHbpATOR83g75gQXTskM+y5
         JHDbPJC7C+8ccZXn1CVqC8v4PKnnatr4vk18dlth17cQKAZNmQh6R5o5DXAQFyMMUxl+
         WqYmMRZJj+FL4DwzqjRZ/wGzlsAG9LDiZ0Rc71ZiQCPeJPbh6PmkrmosAlPkk556Q+Lg
         XqrAybd6/L3KJysspqhB6zK5FTX5vs83vZkV8+0NHeMpMyZ1nRLXWT6++LmVs+6YLPUr
         7wIAdEMSG8h+6DcKD0GVtzF7xCDacPb8JDVF3DIjXBXJLtfRuJbDEPumsbWzcxD8A5iT
         09Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694249207; x=1694854007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGAcv82Qzm33LHRf2WHxHuhiKlY4nF3DVLNuoygi7Bs=;
        b=s/HsVeXsg4jZhZG49NKhvPQca9kWz3GEaYyyHA71al9B1UaaoFLOtQ5b/P1jtVOJyE
         LQ1vCMGDmpLPyzmRm3FSwyNmp2zc56i4T3sY5llM8628Bq2zC62NcluBetM8NUX+8K4L
         /ZuUDUgAGDuGFx0HGxpkYcDksDrYx+T2IT0QO0VxWcoozRLaYTyPIUmccGK+HrT6YGqX
         H0giI9svnBgw18kNzVbZASwfywCU6DkcsWoS3vomM4CrH3LeLHTQkteNb7C1E2b/0Rq1
         HgD+0VjXyYPlhg6bzYjxFL72hADoaz+rOGeag9Uas2HjF5Ki7zwmYLPDrwzG5lpSHmGu
         KflA==
X-Gm-Message-State: AOJu0YyNzU+2Yr7CmkGE6UhycyRYREhU1M02iSKe+/ImuEKrbIvCEaWo
	TA6NMX2KfZcd8ktqY6TcBedXpNE39A09de1yEEOTZISz
X-Google-Smtp-Source: AGHT+IHtsOSar2wp79waDTqs/BWfhUn4dP1q8d3DpsWCW3PMOHsDSGTgwh87vwsjr74b6kQZEQ0dLg==
X-Received: by 2002:a05:6870:a1a4:b0:1bb:ac7:2e34 with SMTP id a36-20020a056870a1a400b001bb0ac72e34mr6024289oaf.40.1694249206823;
        Sat, 09 Sep 2023 01:46:46 -0700 (PDT)
Date: Sat, 9 Sep 2023 16:46:42 +0800
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH RESEND v2 0/2] xen/arm: Enlarge identity map space
Message-ID: <20230909084642.GA49199@leoy-huanghe.lan>
References: <20230909083410.870726-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230909083410.870726-1-leo.yan@linaro.org>

On Sat, Sep 09, 2023 at 04:34:08PM +0800, Leo Yan wrote:
> The latest Xen fails to boot on ADLink AVA platform.  Alexey Klimov root
> caused the issue is related with the commit 1c78d76b67 ("xen/arm64: mm:
> Introduce helpers to prepare/enable/disable").
> 
> This is because on ADLink AVA platform, it loads Xen hypervisor to the
> address above 2TB and hence causes Xen panic:
> 
>   (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
>   (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
>   (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
>   (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
> 
> To fix this issue, this series is to enlarge identity map space to
> 127 TiB and tested on Telechips Dolphin5 platform.

Ouch, after 'git pull' the latest Xen staging branch and see the
conflict.  I will send new one patch set.  Please ignore this one.

Thanks,
Leo

