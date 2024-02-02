Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDB5846E96
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 12:03:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674992.1050173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVrKP-0003OT-Ej; Fri, 02 Feb 2024 11:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674992.1050173; Fri, 02 Feb 2024 11:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVrKP-0003MV-C9; Fri, 02 Feb 2024 11:03:25 +0000
Received: by outflank-mailman (input) for mailman id 674992;
 Fri, 02 Feb 2024 11:03:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNq7=JL=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1rVrKN-0003MP-Qx
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 11:03:23 +0000
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [2607:f8b0:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac92d973-c1ba-11ee-98f5-efadbce2ee36;
 Fri, 02 Feb 2024 12:03:20 +0100 (CET)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso1553866a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Feb 2024 03:03:20 -0800 (PST)
Received: from localhost ([122.172.83.95]) by smtp.gmail.com with ESMTPSA id
 g1-20020aa79f01000000b006dd810cdd91sm1333659pfr.88.2024.02.02.03.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 03:03:18 -0800 (PST)
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
X-Inumbo-ID: ac92d973-c1ba-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706871799; x=1707476599; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pOzd3P/hbbhllGoqP07nNcV24HbOBqqsBesfyxV3P3A=;
        b=K70qiCjnqwBAPpaAED6JhyHrtszkQm82TbZ5MOsZf5oHIJ1Rfzu70us0nVN98P43Ef
         ytTUkxXwAxCT/5Ivo4Sg8k3IK51XPKZFW4Ej8VChxuLz38HdbzwQkEAUtAB9dEreUUNd
         PlQ0WLdDiSloJWY+HolaOa/IO3DcHazg0vkZjbV2bK083TRSP6qZHxDFmMUkGk5eTi6M
         it7SpRgEHSk77COA2PlPTvvmixTEsopcve9/MmJHfIeC6JRXRQGnDv0K9HfIiW3SwTo6
         nCagkcM9Q+PQzZWMBUJ0+x+kqpwkWStBbU5rSNVEpt0KBe/N9YNfj32hxxQy6x8DQUDP
         SopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706871799; x=1707476599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOzd3P/hbbhllGoqP07nNcV24HbOBqqsBesfyxV3P3A=;
        b=anWyadvM97Hn8xSM54sRdaVPm0xccGJzRrJ3KMUcH48riJcazjnHMtgBk3MyVQhZ7s
         K0T0JaUAUOezGljjwgRNWXSl5Nr+0rBRmDp+ahArdpK1oJuKa2jxTel6NYLcdKoKcWz0
         p192Znd3KvGmwPugn9TZp0bTwzmtIbJg7rB/3J3ddScWtY8cvxPoVJHqCVyJ7hZM+mhZ
         GLLRejkcYsejjC0yHMN5qGud2vUY1ubNwVapHdvXm+XfO+P3FpAY4WzqLyCdkZ3sDEbc
         xAibT3zqaRXKcuZOCnXTwcsu4G4pbsdc4gLXio9a8Btk+TBiorNjjVZxfg6acIyHxr+r
         RjBA==
X-Gm-Message-State: AOJu0Yx5xgEjGQ1M+mkZMyigxzfhTrULYVXWeT7K+9YI6rX69PKvxMSm
	5RqOd2/n1mtgOVQvhcv5IFe3vhoXGlTFytjiHnhDucvqbNpcj9w9/6RmqyYoni4=
X-Google-Smtp-Source: AGHT+IH8BUE/rhtLmMDcmB6yOpNrU6zurwqymctC8MdQurtg5xR2MhTfGET5Fs5zi0GIl8poLk3Blw==
X-Received: by 2002:a05:6a20:e30b:b0:19e:4004:b6a3 with SMTP id nb11-20020a056a20e30b00b0019e4004b6a3mr5200384pzb.39.1706871799203;
        Fri, 02 Feb 2024 03:03:19 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXxyQTiAXw+BLklx0iNwHwyvVWZRGyyue7VyiFcjB7ZBKfL1i1DifOd2V+tFtJYGEbTSO/gbQSQduA4M33YRCx9+dW+sn7QE0zYvtSLQ+OQeO/Uvozlyf5hdnNYbdKUQ6xKe7Uw7X5Qy4xizMPBu2g2LPZuKLwGp0SIeYYlOKcfQrCnG/MNtOKyitb1PYuMFtQtrwZYAKiVY8w3kEdygtPxgTJdIZ4YR3fzKFVhBwwjLFx0OxafhO8Yaohg7+yujK8BOZ7p3msl545KdZ7b
Date: Fri, 2 Feb 2024 16:33:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxl: Add "grant_usage" parameter for virtio disk
 devices
Message-ID: <20240202110316.hfzwseow7uhdgtsz@vireshk-i7>
References: <20240202104903.1112772-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202104903.1112772-1-olekstysh@gmail.com>

On 02-02-24, 12:49, Oleksandr Tyshchenko wrote:
> diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.in
> index bc945cc517..3c035456d5 100644
> --- a/docs/man/xl-disk-configuration.5.pod.in
> +++ b/docs/man/xl-disk-configuration.5.pod.in
> @@ -404,6 +404,31 @@ Virtio frontend driver (virtio-blk) to be used. Please note, the virtual
>  device (vdev) is not passed to the guest in that case, but it still must be
>  specified for the internal purposes.
>  
> +=item B<grant_usage=BOOLEAN>
> +
> +=over 4
> +
> +=item Description
> +
> +Specifies the usage of Xen grants for accessing guest memory. Only applicable
> +to specification "virtio".
> +
> +=item Supported values
> +
> +If this option is B<true>, the Xen grants are always enabled.
> +If this option is B<false>, the Xen grants are always disabled.
> +
> +=item Mandatory
> +
> +No
> +
> +=item Default value
> +
> +If this option is missing, then the default grant setting will be used,
> +i.e. enable grants if backend-domid != 0.
> +
> +=back
> +
>  =back
>  
>  =head1 COLO Parameters

I wonder if there is a way to avoid the duplication here and use the definition
from: docs/man/xl.cfg.5.pod.in somehow ?

-- 
viresh

