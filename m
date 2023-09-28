Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4907B1FD7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 16:38:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609899.949057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qls8w-0002RW-Uw; Thu, 28 Sep 2023 14:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609899.949057; Thu, 28 Sep 2023 14:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qls8w-0002Ow-SF; Thu, 28 Sep 2023 14:37:30 +0000
Received: by outflank-mailman (input) for mailman id 609899;
 Thu, 28 Sep 2023 14:37:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s/xa=FM=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qls8v-0002Oq-Qv
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 14:37:29 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b86fb5f-5e0c-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 16:37:27 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68fdcc37827so10518875b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Sep 2023 07:37:27 -0700 (PDT)
Received: from leoy-huanghe.lan ([240e:389:8607:8800:b7f0:9e8e:f56d:dc32])
 by smtp.gmail.com with ESMTPSA id
 w88-20020a17090a6be100b00263f41a655esm10610899pjj.43.2023.09.28.07.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 07:37:25 -0700 (PDT)
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
X-Inumbo-ID: 8b86fb5f-5e0c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695911846; x=1696516646; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JQ0rJPXS35GO8p0fFCs7bDNx05H3IoiF/C+rPmOWaCE=;
        b=a7n4+yfdzsdPKAhUqdWLwZYVnQI3ukja89KxrPaHheSmbP8Z/oT/Fx8VevjgP4J99P
         pU0t57gPhhjmYWO6YOJmdcu860NyBDPvo+bHD576ss1d0b7KSuYdFfKoNpINq3oK76ci
         cleErDu2rZDxw9VnDU5AtNlcDaOsWNTsO+4CZyf08lIjiDE93iLSn0HRAbKmSROmYxe4
         e2S+UwKHj+QXw1gimrCvivJLN2DAsPKueulzOgzpxZ/A85UE+vMpb3AuMxjEd7h2VDu6
         jm+Fwk6SCU/XLjtmQT0GAdwMeAF4xg/Qpisd08+sFF07AeTreH55UQhv0y5nzx9vIQay
         ndWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695911846; x=1696516646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQ0rJPXS35GO8p0fFCs7bDNx05H3IoiF/C+rPmOWaCE=;
        b=t2hXD7fLBeOvCppEckT8FWG7+zqtRLkNVgiyqqKwJFRKaMK3Nrke4VrwgTafp3T7Ye
         PiONitOV0d0KKAlGC4lJFYQ6hUtC2nmln7bEyeqDkDARiSO3yuhVpgKa3M1BSXCDbKFq
         PFi8HaZXhTZkGYT6Dw3edUizYInyfMDKkLegPFx8+69sgq5R3ksYBH4upXh7qkAdF5Oq
         mUTw5J+8eOVZx6pbuZO2pm9iNUACQCSKZfMRcCupdwVQxFP6QXBowK88jxb+npRbFu+s
         pBtRrsW7waN+A1ZTmNESMxImMeepOeySadoRu07aVnlIKvrjGm46mx5Q+ZlMVoFY4l46
         chtw==
X-Gm-Message-State: AOJu0Yz82k7asbf2zvDPRComI2hadXju6Tf3K1LVjtHA/Q8PLeTs2DOs
	pkz5YfRjDd1RLhuSXm0dMdXrYQ==
X-Google-Smtp-Source: AGHT+IFdVE+NLJrYKiM4cYj166xIZFGNtUVdG0OSeMyd0GFFxisQbQmXp0cuwJE6R55+EPWYVdghng==
X-Received: by 2002:a17:90a:880c:b0:274:751a:3f3 with SMTP id s12-20020a17090a880c00b00274751a03f3mr2442975pjn.7.1695911845939;
        Thu, 28 Sep 2023 07:37:25 -0700 (PDT)
Date: Thu, 28 Sep 2023 22:37:19 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Michal Orzel <michal.orzel@amd.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Skip memory nodes if not enabled
Message-ID: <20230928143719.GA58021@leoy-huanghe.lan>
References: <20230926053333.180811-1-leo.yan@linaro.org>
 <b0d2494a-8223-a101-5d10-f3803629f2f3@amd.com>
 <36d8f5ce-ef87-40cc-9515-12a2007bfa6d@xen.org>
 <3964a12c-b808-2ee4-9651-68c21ead817b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3964a12c-b808-2ee4-9651-68c21ead817b@amd.com>

Hi Michal, Julien,

On Wed, Sep 27, 2023 at 02:49:23PM +0200, Michal Orzel wrote:

[...]

> Either way is fine. The advantage of placing the check in boot_fdt_info() is
> that we can have a single check instead of duplicated and we do the check before
> the "first" use which happens to be the banks sorting. The advantage of setup_mm()
> is that it is the one dealing with memory banks and is called after early_print_info()
> so user can see some additional info.
> 
> @Leo, will you send a patch for that? Don't feel obliged as it is not strictly related
> to your patch in which case I can handle it.

@Michal, since you have much better sense than me for adding check for
memory banks, I'd like to leave it to you.

I just refined the patch v2 according to your comments and sent out
for review.

Thanks,
Leo

