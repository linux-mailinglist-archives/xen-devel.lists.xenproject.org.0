Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2633C79714C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 11:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597213.931417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeBTB-0000fE-Nl; Thu, 07 Sep 2023 09:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597213.931417; Thu, 07 Sep 2023 09:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeBTB-0000dW-Kq; Thu, 07 Sep 2023 09:38:37 +0000
Received: by outflank-mailman (input) for mailman id 597213;
 Thu, 07 Sep 2023 09:38:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1vp=EX=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qeBT9-0000dM-NG
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 09:38:35 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 505be669-4d62-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 11:38:34 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-401b0d97850so8490895e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 02:38:34 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n18-20020a5d4012000000b0031c79de4d8bsm22830825wrp.106.2023.09.07.02.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 02:38:33 -0700 (PDT)
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
X-Inumbo-ID: 505be669-4d62-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694079514; x=1694684314; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=boNO0qTU+/44eeBmVD3BuYCvtrQxofPQT82jLgHD/jk=;
        b=f+A6Vc+P75cB1Dp7vhhHaxrjsipz75kc1E7ea2DCw+V70qpC9jnIvJlrLWHznUX7IJ
         zA7xXaabs//zNcC2nsb3GG0hAL3clzrrRwa1fJViLkpPB3GA4z4/fqfhODC5/QHoweXo
         IfbW4z2OPYM6objGI+aO7FGDAW8iq8lmWf+iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694079514; x=1694684314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boNO0qTU+/44eeBmVD3BuYCvtrQxofPQT82jLgHD/jk=;
        b=DBbMNqVh4paPPICVCV9DzHmF3D313uE+I/BrTWiHEJhNvATMc9KMZpmbyNrZ+p9AG8
         j3+93S33y1OGAGnn27vDaaiS/t7BaPZL37BiaVoj836l0hpdlgJNo6iVlUGrq5m54vmB
         8eVuTqoA0fjHgskwNtYZPt9uax+HWSgaU1rls0or5z8sG9E66rxX22VkAg/seH48OOOf
         Ez8rOn0IU7MfFlZyk2vCQadpGrrzeu5ZAkSqr48tfS0QN7gVRtv8WNlJxJLmRij+VUZw
         LC0UhkgrFz+wUYesbJtYtScHufxCUpZdU/jpMSJDnxtXsl/9JZe6PQh7ZCWTtc8l6tJX
         9HZQ==
X-Gm-Message-State: AOJu0YwdebKyvHp0k7hY8GztiGOKtQmiPlMNpoPPhBbbspfCKBvCE2Gq
	yqyLiRPG9nmPNLbOK6RKm7QIQw==
X-Google-Smtp-Source: AGHT+IGePNB+kl9uIhFW7x8bIYZfKOpVeI/2nEZ2OZTogH5y1eN7QDwYY+3fFxMSKhXbakeX3oLa8w==
X-Received: by 2002:adf:f30a:0:b0:31d:cf59:8d8 with SMTP id i10-20020adff30a000000b0031dcf5908d8mr4249546wro.14.1694079514150;
        Thu, 07 Sep 2023 02:38:34 -0700 (PDT)
Date: Thu, 7 Sep 2023 10:38:33 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] MAINTAINERS: generalize vm-event/monitor entry
Message-ID: <555f8369-f8a1-41de-978a-3c3e36cd247a@perard>
References: <bb6831bd-5846-5cfe-53fd-8274b24bdfb5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb6831bd-5846-5cfe-53fd-8274b24bdfb5@suse.com>

On Thu, Sep 07, 2023 at 09:45:55AM +0200, Jan Beulich wrote:
> Replace Arm- and x86-specific lines with wildcard ones, thus covering
> all architectures. Uniformly permit an extra sub-directory level to be
> used, as is already the case for xen/include/.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Unfold, for F: not being handled as originally expected.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

