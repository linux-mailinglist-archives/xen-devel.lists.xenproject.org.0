Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A1A897443
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 17:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700597.1093989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs2mE-0001Zp-DN; Wed, 03 Apr 2024 15:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700597.1093989; Wed, 03 Apr 2024 15:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs2mE-0001Wc-AF; Wed, 03 Apr 2024 15:43:50 +0000
Received: by outflank-mailman (input) for mailman id 700597;
 Wed, 03 Apr 2024 15:43:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPGy=LI=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rs2mC-0001WW-Jg
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 15:43:48 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5d4de71-f1d0-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 17:43:47 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41624fe4194so4268515e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 08:43:47 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 fm15-20020a05600c0c0f00b00416253a0dbdsm1325954wmb.36.2024.04.03.08.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 08:43:46 -0700 (PDT)
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
X-Inumbo-ID: f5d4de71-f1d0-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712159027; x=1712763827; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y9Sp/OHQl7LX0HvfCuA51fjMs6lNI8EXuXJQcWV9ReA=;
        b=YqIWmimFJIGnS7iNXks0CdEfB/7k2Lo6z1ZJuRWCAB2FDpvY8KMo7JXj3FhLmnfKh6
         qY1/SAIQ8urABYagrfrm646U7elUggaJpd8tay+Q5SPBhWBUtARUte9Kpmt0bl3p1l3v
         D7wrexUnm/qYn2KY9EVzP6WmCHLAtSB+KrX9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712159027; x=1712763827;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9Sp/OHQl7LX0HvfCuA51fjMs6lNI8EXuXJQcWV9ReA=;
        b=A4wIypaxOiOWeoDc6IRkRnczaUH2DdK5PiNa89lrigCJO7C7oHRbhWs6bUPu4NOH+m
         WslLNqNjoeR0gJ6tXFVTk6L1CWtq57JvV3wZPEEgbjon8SqugSMpEusa0D6H4ya1mF3D
         jvT2A1PWVVI0jlVmSi3/3l64U3d2kPFKo8D0ea9U2WB29Uy9eZEFnZZRE5CUx5bE8xwg
         9yJ4GcFeDibT9xda+st0dqPHouJ4ZME6Exjuliu1wR3EclcRBG2cFRTHNb+cp85OqAnj
         1IfQEV+5m6eR4jRjMMXWkQTtS9+ncAGWlq7eThXS6hrHIXzBZY0zjzAPTy/Uyrpl1HBx
         BY0g==
X-Forwarded-Encrypted: i=1; AJvYcCUq/1zyA9dXowKQj20vbN9SY8GaxUox5U4uY9Z3F36pe+X4Hshy+GVafOn5Mpq6p6tSHLddAoc+Lv1BWeiCFozAYGzRE/B2aqe+IVJuycU=
X-Gm-Message-State: AOJu0YwrMUFHMr8jY3AgJJt7mKHcpwYoirmVBKZBoDbGQntPyVwTHb44
	ig9G5nrKeRlLFkoYcs0FS11g4fcoXln8X3wHmDw1KyfiUvxpmm6SiTnxHyw7KiU=
X-Google-Smtp-Source: AGHT+IF5b8HjXApAcpQwe/1kkOZl1c5PJHbxIW52Fl5orkLlISVOTSBTRKkbtyWMo1dODw/9n2ekQA==
X-Received: by 2002:a05:600c:3c88:b0:414:7e73:1f5b with SMTP id bg8-20020a05600c3c8800b004147e731f5bmr28842wmb.4.1712159027053;
        Wed, 03 Apr 2024 08:43:47 -0700 (PDT)
Date: Wed, 3 Apr 2024 16:43:46 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] xen: fix stubdom PCI addr
Message-ID: <a7ebf899-1078-47b0-bf03-ba5503dba0e8@perard>
References: <cover.527f002866de2be7c275c5000b6e5edfeb7e8368.1711506237.git-series.marmarek@invisiblethingslab.com>
 <35049e99da634a74578a1ff2cb3ae4cc436ede33.1711506237.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35049e99da634a74578a1ff2cb3ae4cc436ede33.1711506237.git-series.marmarek@invisiblethingslab.com>

On Wed, Mar 27, 2024 at 04:05:15AM +0100, Marek Marczykowski-Górecki wrote:
> When running in a stubdomain, the config space access via sysfs needs to
> use BDF as seen inside stubdomain (connected via xen-pcifront), which is
> different from the real BDF. For other purposes (hypercall parameters
> etc), the real BDF needs to be used.
> Get the in-stubdomain BDF by looking up relevant PV PCI xenstore
> entries.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

