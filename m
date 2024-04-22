Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4B38AD323
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 19:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710163.1109243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryxBC-0003hR-Jd; Mon, 22 Apr 2024 17:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710163.1109243; Mon, 22 Apr 2024 17:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryxBC-0003fJ-H8; Mon, 22 Apr 2024 17:10:10 +0000
Received: by outflank-mailman (input) for mailman id 710163;
 Mon, 22 Apr 2024 17:10:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2T4=L3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ryxBA-0003fD-Lr
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 17:10:08 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b1d617d-00cb-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 19:10:07 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-346f4266e59so3428951f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 10:10:07 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 w17-20020a5d6811000000b0034a2ba13588sm11422124wru.42.2024.04.22.10.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 10:10:06 -0700 (PDT)
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
X-Inumbo-ID: 2b1d617d-00cb-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713805807; x=1714410607; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6MvZf5qZRPpuK1GETAzu5e7Tmx0LMnC8e8zPxUT4YQw=;
        b=SDN3ZBpyd38XBP0CYdJu+2Y4xuemv+1PP7IN/Hct1Ey9YUuIqM5QCQSr7mt6Xp32A7
         pjxY6zdmjLzBOUQBYu6IvWQKeaM/e+i+HtNY/0De3SgnszyQQ80/FLjvou+licClktkH
         fEVz5q/f31y2DFwDzFnDeM2iebFIoCFD80lZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713805807; x=1714410607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MvZf5qZRPpuK1GETAzu5e7Tmx0LMnC8e8zPxUT4YQw=;
        b=Xicwu0k3mYbNsWNUi7i16gS1WS+NcetzFKMRHsBI3jN94A6aprjr2SXSRF0o9wD8ug
         gsavsyXvfvOl422orzTMeQTm7BTKXrQ057wevsHTpi+TlhpwAAcus9nsiY/yW3GQafHl
         zgN6XXpsbr9ygRpPvsUWja4zYqDWWyCTpZ/uZA+H4s346myBWr47feFJ4qDbrrRVlFBd
         56Ty317x6xlTQvz0tMQp79olbsDV07ukn297tDndvNamPTrVHoHTTsChrpYZZM0+VXiQ
         2EkjT5zU7C4dYGyagyQFF/28IMzWm64lDCYSML9DoYIaVUHLjrF2/HauF6ymoCZhRiLz
         ppsw==
X-Gm-Message-State: AOJu0Yz7HZnvkdHiRQ06jUclKTde8gKLRDlpkSfG1hGREThm6mjn7ksj
	CDweXM9XVxduEJEPqqbg0najbngsxcADJ5Slqj36qVJ8lFtfqhwu6bFaeqFcmok=
X-Google-Smtp-Source: AGHT+IHMVU5aTJcF5XzoHwXEbW7cCtT8+6vY3vYuCMHivdcNY/UDE6WSAWc1Jm9tu/oJUC2b9VTSTQ==
X-Received: by 2002:a05:6000:bd1:b0:33e:c316:2a51 with SMTP id dm17-20020a0560000bd100b0033ec3162a51mr6851283wrb.27.1713805806945;
        Mon, 22 Apr 2024 10:10:06 -0700 (PDT)
Date: Mon, 22 Apr 2024 18:10:06 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: leigh@solinno.co.uk
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	slack@rabbit.lu
Subject: Re: [PATCH v3 2/4] tools/misc: xenwatchdogd enhancements
Message-ID: <22bf42d9-7cf5-4cea-aad4-a4da7e01169a@perard>
References: <20240411182023.56309-1-leigh@solinno.co.uk>
 <20240411182023.56309-3-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411182023.56309-3-leigh@solinno.co.uk>

On Thu, Apr 11, 2024 at 07:20:21PM +0100, leigh@solinno.co.uk wrote:
> From: Leigh Brown <leigh@solinno.co.uk>
> 
> Add usage() function, the ability to run in the foreground, and
> the ability to disarm the watchdog timer when exiting.
> 
> Add enhanced parameter parsing and validation, making use of
> getopt_long().  Check the number of parameters are correct, the
> timeout is at least two seconds (to allow a minimum sleep time of
> one second), and that the sleep time is at least one and less
> than the watchdog timeout.
> 
> With these changes, the daemon will no longer instantly reboot
> the domain if you enter a zero timeout (or non-numeric parameter),
> and prevent the daemon consuming 100% of a CPU due to zero sleep
> time.
> 
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

