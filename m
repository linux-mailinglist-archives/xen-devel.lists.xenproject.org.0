Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D352E89F917
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 16:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703307.1098920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruYUe-0004ai-3v; Wed, 10 Apr 2024 14:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703307.1098920; Wed, 10 Apr 2024 14:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruYUe-0004Y5-0w; Wed, 10 Apr 2024 14:00:04 +0000
Received: by outflank-mailman (input) for mailman id 703307;
 Wed, 10 Apr 2024 14:00:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FY1=LP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ruYUc-00048F-3a
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 14:00:02 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e7ba5dc-f742-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 16:00:00 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-69b236a942dso22804496d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 07:00:00 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 iw9-20020a0562140f2900b0069b1e9df4f8sm2722362qvb.55.2024.04.10.06.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 06:59:58 -0700 (PDT)
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
X-Inumbo-ID: 9e7ba5dc-f742-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712757599; x=1713362399; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CzcqJTKtdG23TG9FbHR+xZsnTTlqt4yuyLCdXAGVsXA=;
        b=NKEe52AFe0bflg1VOyYG6zTvu3HadGzbsdmgRfHBvnwhxN9ep+V6XtXyOFNnQA2fIK
         E1HkqWOfVCBGKekq3wrIbUM2PJcOwClY1AKW8sTnjhHuHqRpCytrOms/TIYd2N7U+vIM
         7lpt+b3+ZweW9j65nvmjvgbh2NDMhvzPvT66I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712757599; x=1713362399;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CzcqJTKtdG23TG9FbHR+xZsnTTlqt4yuyLCdXAGVsXA=;
        b=EiCd2uErGkFayFEaXkLO3LygbVo/CQA2LVsV7t0V9F5+/XSydqOd/Sdm5Nq+2sUfEm
         0TFyfmxOnAhwvScCvCoYz4GpTUmmYnYQYCbnOCqAc+9JRAMlCkrvhd4Ht+fi8X6fnqrO
         ZqM73D+R45fFUlUYHWgE27g4IVgfsRMX9VtgIvv47wUqxkY+SIveP/FkaUEHHxY2DPrG
         M7hhbL8KOnbw/z6u8DQouQXysNi/DMH/W39YR31lSe+s0ThOV/FIZZAgpl5yfyMl7jSC
         WspOOKre1O7K9Ri0kivvatkQWpuhgMTQSNVPN62d/7iu7GvTIQZPT5Pt+RW8KfhAGUh3
         SWCA==
X-Forwarded-Encrypted: i=1; AJvYcCWpo4Yq71JuQbIPFQlreVrWc4P3+gSDb/GDgVGr8aJEJVb2l8QFf2+arJKeOZtQOop7QmCCsKW29+K1jaqoc/H8N2b4mHvvQxqTJxmI5Gw=
X-Gm-Message-State: AOJu0Yz1OO6e6i6tiw8mZbjMHRc54vjvnev1qfY5IVPYtOwiRwcuYaSu
	U/O37/EzT/h0+hQhwMLG9oV71P4yxid3vVNIO7blmJjaz3otyPSoEZWwzKwktAY=
X-Google-Smtp-Source: AGHT+IFcLcQfbTBtN/FUZODwx1ZdUULQTwLLgswMWlw0OTevzreEGKJ4pc8RKP4P434D2pubaLfQIQ==
X-Received: by 2002:ad4:5e8d:0:b0:691:67f9:16e7 with SMTP id jl13-20020ad45e8d000000b0069167f916e7mr4816390qvb.24.1712757598829;
        Wed, 10 Apr 2024 06:59:58 -0700 (PDT)
Date: Wed, 10 Apr 2024 15:59:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org,
	Konrad Rzeszutek Wilk <konrad@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update livepatch maintainers
Message-ID: <ZhabXICHcLm8y1nW@macbook>
References: <20240409103208.1641887-1-ross.lagerwall@citrix.com>
 <ZhVpIxhOjeRhYflW@char.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZhVpIxhOjeRhYflW@char.us.oracle.com>

On Tue, Apr 09, 2024 at 12:13:23PM -0400, Konrad Rzeszutek Wilk wrote:
> On Tue, Apr 09, 2024 at 11:32:07AM +0100, Ross Lagerwall wrote:
> > Remove Konrad from the livepatch maintainers list as he hasn't been
> > active for a few years.
> > At the same time, add Roger as a new maintainer since he has been
> > actively working on it for a while.
> > 
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> 
> Thank you for picking it up!

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks for your work on this Konrad.

Regards, Roger.

