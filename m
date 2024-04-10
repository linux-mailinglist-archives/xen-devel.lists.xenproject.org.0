Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEE189FC02
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 17:54:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703413.1099081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruaGb-00058y-4S; Wed, 10 Apr 2024 15:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703413.1099081; Wed, 10 Apr 2024 15:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruaGb-00056V-1K; Wed, 10 Apr 2024 15:53:41 +0000
Received: by outflank-mailman (input) for mailman id 703413;
 Wed, 10 Apr 2024 15:53:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Wol=LP=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ruaGZ-00056P-Bq
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 15:53:39 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ec8a652-f752-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 17:53:38 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-417c339d261so2542405e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 08:53:38 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c15-20020adffb0f000000b00345fb949c28sm5474269wrr.100.2024.04.10.08.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 08:53:37 -0700 (PDT)
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
X-Inumbo-ID: 7ec8a652-f752-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712764418; x=1713369218; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/XbFWPz641If8F2DOfBw2zZvHADuMeoQrBFBBkb7aw=;
        b=gDWXnLYUlIN/MXUZY+Qte6ohdd3pMxolUoH8KoEO8dnu3yDMsAuanccKAu1h6gSTXp
         6O1L5nthWAg7bGST8E073CfzGn76cPzisw/G795GIny0+79cserlXF9NsxCqjsUczr6e
         t+NAdOcVfgfFJPouLCq3OSoleEYK4KACsp+x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712764418; x=1713369218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/XbFWPz641If8F2DOfBw2zZvHADuMeoQrBFBBkb7aw=;
        b=iXWAeXJq50CEAsb6l6zfyfvefFcZw9sAILrXk4LzUBHlG0suGqmpznV4ItNqfSQr+a
         2q5N1sWqjiXHeiyvCblIpjmji1UHbFV8EpkC8KJrMb7syZXueioNci+yKqZzJH4zf1mx
         HczqirpnybI62o0A9qyRTdFtiabJBuVsEwmxA61fuBL32iIDchSToVw5XP/4SuJDIxrb
         ABHX9HQt94ge83eztXA0LFxaK+TUCtD6TF/n2h2yDGOGfCr6tWzJaFd8uUxfkvrtoiU2
         g4m7IX4C3NPiBEta8vtmcIFME5iUuOM65DR7iilJ/arwJ2tyNK/CPYlqdByf10uaQkt8
         l1Sw==
X-Gm-Message-State: AOJu0Ywz1c7fcoP1GijwLBfVLTeWH9Cz/bmWsXnBOujMciEN0IZpesHV
	FALka9tHTgfrngxvEz9MiQoNIszgNt5W4e+cztj9xmi0V2GwIrtI7lxGCrHzKRE=
X-Google-Smtp-Source: AGHT+IHYIOv+DD2pBKdlkdYHMBQ0ek+2aMjCI2zASo+EF7qz4wYJ1yPyXZ7HgaQbknDxsAMH78IFaQ==
X-Received: by 2002:a05:600c:3c8e:b0:415:6dae:7727 with SMTP id bg14-20020a05600c3c8e00b004156dae7727mr2258127wmb.11.1712764417658;
        Wed, 10 Apr 2024 08:53:37 -0700 (PDT)
Date: Wed, 10 Apr 2024 16:53:36 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH v1 0/2] convert LIBXL_DEVICE_MODEL_START_TIMEOUT to
 env var
Message-ID: <c00304a2-f990-4fb3-9276-7f4907b583ea@perard>
References: <cover.1712748711.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1712748711.git.manos.pitsidianakis@linaro.org>

On Wed, Apr 10, 2024 at 02:43:13PM +0300, Manos Pitsidianakis wrote:
> This patch series proposes converting the compile-time define 
> LIBXL_DEVICE_MODEL_START_TIMEOUT value to an optionally overridden by 
> environment variable value, just like the current behavior for 
> LIBXL_BOOTLOADER_TIMEOUT is.
> 
> Manos Pitsidianakis (2):
>   libs/light: add device model start timeout env var
>   libs/light: expand device model start timeout use
> 
>  docs/man/xl.1.pod.in                 | 11 +++++++++++
>  tools/libs/light/libxl_9pfs.c        |  2 +-
>  tools/libs/light/libxl_device.c      |  2 +-
>  tools/libs/light/libxl_dm.c          | 10 +++++-----
>  tools/libs/light/libxl_dom_suspend.c |  2 +-
>  tools/libs/light/libxl_domain.c      |  5 +++--
>  tools/libs/light/libxl_internal.h    |  6 ++++++
>  tools/libs/light/libxl_pci.c         | 10 +++++-----
>  tools/libs/light/libxl_usb.c         |  8 ++++----
>  9 files changed, 37 insertions(+), 19 deletions(-)
> 
> 
> base-commit: f48299cad5c3c69fdc2c101517a6dab9c9827ea5
> -- 
> γαῖα πυρί μιχθήτω
> 
> 

Hi Manos,

Did you know that you could run something like
    `git send-email --cc-cmd="scripts/get_maintainer.pl --no-l" ...`
and git would CC the maintainers of the code?

I've configure my xen repo to have that been automatic, with
    git config sendemail.cccmd 'cd `git rev-parse --show-toplevel` && scripts/get_maintainer.pl --no-l'

There's other way to send patch, like using
"scripts/add_maintainers.pl" described on this page:
https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Sending_a_Patch_Series
Not sure which one is better.

Anyway, I've added the series to my list of patch to look at. But I
might miss it next time if I'm not CCed.

Cheers,

-- 
Anthony PERARD

