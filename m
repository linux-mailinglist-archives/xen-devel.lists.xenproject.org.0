Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD0889D736
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 12:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702239.1097154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru8yo-0003UQ-Tm; Tue, 09 Apr 2024 10:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702239.1097154; Tue, 09 Apr 2024 10:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru8yo-0003S8-R3; Tue, 09 Apr 2024 10:45:30 +0000
Received: by outflank-mailman (input) for mailman id 702239;
 Tue, 09 Apr 2024 10:45:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mUTu=LO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ru8yn-0003S2-Nf
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 10:45:29 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47c4a177-f65e-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 12:45:28 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-416632343d0so15585445e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 03:45:28 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 cg6-20020a5d5cc6000000b00345e730aa7csm3322838wrb.11.2024.04.09.03.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 03:45:27 -0700 (PDT)
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
X-Inumbo-ID: 47c4a177-f65e-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712659528; x=1713264328; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DPd9OL27DqjNiu7RPISNzn6sIXao5VZQF9RZVBrlFf4=;
        b=jphlZeLQZcXbrcrM0Lz6KCqOajInd6OSsXI6UHuvRbG7w1lN4t+GKuzf3Z6uYVeJ0u
         3YtorCuseoEB07uPFaGLO3QiJ/nCrHuxU3GoQxyJJKoLNKGd+Nzk+eZ8w54EVdgJcB4z
         5TLSlulyTKWWU7Ec7eA9jnPk3yeJgKV7BrLJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712659528; x=1713264328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPd9OL27DqjNiu7RPISNzn6sIXao5VZQF9RZVBrlFf4=;
        b=f9DH7capAfiUCplfraTiHVqRt72/QnwRjSdpjWDARZTa+OC6THJVJBSqTrUXQHLuxf
         +iH5HvX4nbDCfuMm9ma+iAX0+bQkXjp4eJnY5g96Jd/EBLNyjOjevTBAbRMDBr+QNadO
         lZSki8n8mmM4CbeOeUS2VpNWe0vNmp7D4uTpyvRIxBNZxSKh9+/vDcK/SUwELgzyjIhQ
         Ge+TQm/FLS3iYUlZf8kIibFxif4IeZEDGlKiT8RIh1Mv++vOFwpCSOiWtTwm3k6FW2uR
         p9SoUAIfLMDDjFnyC8cinYerHQrXG8u/Sab/z9SX8fOkEAjKnFD3eCw85k16DGsA3ii+
         ccFQ==
X-Gm-Message-State: AOJu0YxjoAgAgjGZefWuGWtzueou7OJAPX+C7IYFxfkZ0/jGwxfhzlxG
	46BlFuyyWiaQh3JhMqHA7/HB92LqeYYh0lSPjs/IxAViWi/kPu4POVwpV3L6xYo=
X-Google-Smtp-Source: AGHT+IFR0xvMeQysJXIrZ+x0z1Yr1vuIubGwGbVSN8UDaP7q1UldbnK6jI2isb+R7cY82iP58olAhA==
X-Received: by 2002:a05:600c:511b:b0:416:90e6:5f2a with SMTP id o27-20020a05600c511b00b0041690e65f2amr2237397wms.19.1712659528253;
        Tue, 09 Apr 2024 03:45:28 -0700 (PDT)
Date: Tue, 9 Apr 2024 11:45:27 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: leigh@solinno.co.uk
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	slack@rabbit.lu
Subject: Re: [PATCH v2 1/6] tools/misc: xenwatchdogd: use EXIT_* constants
Message-ID: <78aff49a-a244-4d0f-a5e9-15b03985d46f@perard>
References: <20240329111056.6118-1-leigh@solinno.co.uk>
 <20240329111056.6118-2-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329111056.6118-2-leigh@solinno.co.uk>

On Fri, Mar 29, 2024 at 11:10:51AM +0000, leigh@solinno.co.uk wrote:
> From: Leigh Brown <leigh@solinno.co.uk>
> 
> Use EXIT_SUCCESS/EXIT_FAILURE constants instead of magic numbers.
> 
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

