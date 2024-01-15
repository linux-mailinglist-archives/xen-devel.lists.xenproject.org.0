Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B2E82DC1E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 16:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667454.1038722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPOZe-0003G2-W8; Mon, 15 Jan 2024 15:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667454.1038722; Mon, 15 Jan 2024 15:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPOZe-0003FK-TS; Mon, 15 Jan 2024 15:08:26 +0000
Received: by outflank-mailman (input) for mailman id 667454;
 Mon, 15 Jan 2024 15:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tunR=IZ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rPOZc-0003Do-L4
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 15:08:24 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb898bd3-b3b7-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 16:08:20 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e760e5b49so12546475e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 07:08:20 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c314500b0040e5e21cd7bsm16036394wmo.11.2024.01.15.07.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 07:08:20 -0800 (PST)
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
X-Inumbo-ID: eb898bd3-b3b7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705331300; x=1705936100; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K9rzUaYZpXYTEVeRrX4tj1tEK4S5W1ku9LxNIp/QaXc=;
        b=j++JAe76lf+Ylj9eGYbaeIHkO9YwpKHLNewsrfJ9JI7m9nUoAbiGpW21mQhbxyTdGD
         ahwyteFxmNwV9cPPCwDM4Fsmqm36Wa5eP1i8cTXRDjxtwqh8tebQbUWEwX6B9S/qXjAU
         zHg0Mk/osXOcE+jv0YIcGyG47hfU1L6pkixMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705331300; x=1705936100;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9rzUaYZpXYTEVeRrX4tj1tEK4S5W1ku9LxNIp/QaXc=;
        b=lAdFe6sdtbG5qExTOC9jGSEIvkF1cHEHs7kdOAAEzBND+pnzL2q0w1+mVcX6GyzIoZ
         AWk0FLn9Q5ruWGwZw5ZEfWs9uUVuPjkvc0NeQ8dFRPJaxo3CMBGhrPR97TsZy6JdSbWy
         pwXD92slrPd57nJx87PpBmzLDqr2H06klQPq0dtE0UKREby+zv/jDxFrPCo99asZMT1p
         bWtqJY2z6ZzsA9UnMx5fGYUHk+8lgOgMgK/ZR9yUsxtYc+XWZP+4RVXbYeinh9lMU6q2
         uV/8eQaS4Tp8iM6xBHvRe6J/T1d+AuoH4f0bubuv75L7dmlzp6xNru9gthZ+3ZB6N/1O
         83KA==
X-Gm-Message-State: AOJu0YyEtNnLs+4wZI74BaNild0t1ImMYg9vs1EhpSkVQKi2KLPb0CN+
	t2gZP7dHmP+z8QJW8IKPzPHF7bhUVeFCGA==
X-Google-Smtp-Source: AGHT+IHjHfZST8cOJudRJHiiJkqeyNeIZVR2pL/XAulQ9cJEW05ul0HQPE2Y0v+WEu7vpW7JfXb+LQ==
X-Received: by 2002:a7b:c8c4:0:b0:40e:43fa:b8b8 with SMTP id f4-20020a7bc8c4000000b0040e43fab8b8mr2170359wml.90.1705331300378;
        Mon, 15 Jan 2024 07:08:20 -0800 (PST)
Date: Mon, 15 Jan 2024 15:08:19 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] osstest: bump /boot partition to 1G
Message-ID: <b552ee37-c5c8-438e-98fe-ecebad296bf7@perard>
References: <20240115141837.82983-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240115141837.82983-1-roger.pau@citrix.com>

On Mon, Jan 15, 2024 at 03:18:37PM +0100, Roger Pau Monne wrote:
> Increase the size of the boot partition, as arm64 initrd is already exhausting
> all the space:
> 
> update-initramfs: Generating /boot/initrd.img-6.7.0+
> gzip: stdout: No space left on device
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  Osstest.pm | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Osstest.pm b/Osstest.pm
> index 7776ba88c6e2..a559ca4ea8b6 100644
> --- a/Osstest.pm
> +++ b/Osstest.pm
> @@ -94,7 +94,7 @@ our %c = qw(
>      HostProp_GenEtherPrefixBase 5e:36:0e:f5
>  
>      HostDiskESP    300
> -    HostDiskBoot   300
> +    HostDiskBoot  1000

Did you tried this change on the arm32 machine as well? If so:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

(Or I guess we can find out the result of the test on commit.)

Thanks,


-- 
Anthony PERARD

