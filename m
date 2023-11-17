Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B21B7EF2FE
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635180.991033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3yJB-0004PR-46; Fri, 17 Nov 2023 12:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635180.991033; Fri, 17 Nov 2023 12:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3yJB-0004MI-0G; Fri, 17 Nov 2023 12:50:53 +0000
Received: by outflank-mailman (input) for mailman id 635180;
 Fri, 17 Nov 2023 12:50:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3yJ9-0004Lw-D3
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:50:51 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eedd11c9-8547-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 13:50:49 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32d9d8284abso1292204f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:50:49 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 h1-20020a05600004c100b00318147fd2d3sm2229229wri.41.2023.11.17.04.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:50:48 -0800 (PST)
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
X-Inumbo-ID: eedd11c9-8547-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700225449; x=1700830249; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dJYcLh5+RXDfLvz+L8kxkAAB2gfFxTtD9XrLGKR8HUk=;
        b=E97lu07vuh6WRAp/F3YoaJ29I1u8vqylQKBDS/LbJBpqLH8BOvJfsyHlMaWFhYlbYD
         0a6wXA/ll70BrRfkUECt6tBFMWhD2M4pM+ClJR9MA1RqyoDf4MiVZ9ZJwNG73U2NvNeP
         WwNfcUZyTJyArYCM1WJvD6wB5N8cxUZGZKQaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700225449; x=1700830249;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJYcLh5+RXDfLvz+L8kxkAAB2gfFxTtD9XrLGKR8HUk=;
        b=h6MZpm0azcDoOkXKkKUSCWp4NM3aDKFahqVmOnR9CxDTFPfh3+clBIIZu0ditlPIpR
         6YKwFDj9ijH62KnFACwib/y9fDYUih+FY6CDbcoYhE5LWQDm1M7yfC+zkRvpuUNrqT0l
         ImOW7BkbLJX0azo/fWw74RGOw0j7eFX+NePvk3/JgqY0qUSuan37T+Telxj9aoO7eJd2
         A6SjYamQ3x/v3ttjREzuegKEDHQL/n+24Jp5kmpIEym5/m2V0WUo7mJIOIBowjlsl/QJ
         dndkczmejHoqwi8EXsVQEv5KUlYVpEzFWU+yCFzy6/TjoUPIh+ewbyETCMI0X7j7TdL5
         +N5Q==
X-Gm-Message-State: AOJu0YyPqaDTJ2sz279d0WphVy/me8NvDE59i7JuHZrT/Tq4vpxzyKnp
	Lv3quNziUygewhXkIMALt681DQ==
X-Google-Smtp-Source: AGHT+IHaRjlKnpFZswruv8ar99HoAQEGKjK/iyGM6t/nJJnIqL+oiKoUeNIUbOMaDyPNpex+ZhjxxQ==
X-Received: by 2002:a05:6000:1ace:b0:32d:884b:7403 with SMTP id i14-20020a0560001ace00b0032d884b7403mr15774614wry.66.1700225448709;
        Fri, 17 Nov 2023 04:50:48 -0800 (PST)
Date: Fri, 17 Nov 2023 13:50:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 2/3] x86/iommu: move xen_in_range() so it can be made
 static
Message-ID: <ZVdhplVe2_HdkRPe@macbook.local>
References: <20231117094749.81091-1-roger.pau@citrix.com>
 <20231117094749.81091-3-roger.pau@citrix.com>
 <81534803-9da4-49b7-894e-f3fb5e8fb131@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81534803-9da4-49b7-894e-f3fb5e8fb131@citrix.com>

On Fri, Nov 17, 2023 at 12:03:19PM +0000, Andrew Cooper wrote:
> On 17/11/2023 9:47 am, Roger Pau Monne wrote:
> > No functional change intended.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> There may only be one caller (after dropping some bogus tboot logic
> recently IIRC), but this isn't an IOMMU-specific helper.
> 
> See the comment in the middle which shows the other opencoded things
> this needs to be kept up to date.  (And I'd hoped to make this common
> because every architecture seems to have different bugs opencoding this
> calculation.)

But those symbols ultimately come from the linker script, and hence
didn't see them that tied to the setup code.  The setup code uses them,
just as the IOMMU will do now, and likely other parts of the code like
livepatch.

> Switching to rangesets is fine, but the result still wants to be
> something generic, rather than IOMMU-specific.

I'm fine with leaving the function in setup.c, this was mostly a
cleanup attempt.

Thanks, Roger.

