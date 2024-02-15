Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75DF85628B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 13:07:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681640.1060485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raaWg-0008Ev-Ve; Thu, 15 Feb 2024 12:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681640.1060485; Thu, 15 Feb 2024 12:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raaWg-0008DH-T5; Thu, 15 Feb 2024 12:07:38 +0000
Received: by outflank-mailman (input) for mailman id 681640;
 Thu, 15 Feb 2024 12:07:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XFnF=JY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1raaWe-0008DB-UT
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 12:07:36 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd8f1b8a-cbfa-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 13:07:34 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-412078e983aso6136435e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 04:07:35 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 hn32-20020a05600ca3a000b00410ebcf8180sm4836630wmb.43.2024.02.15.04.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 04:07:34 -0800 (PST)
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
X-Inumbo-ID: cd8f1b8a-cbfa-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707998855; x=1708603655; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RU5j0fTz/wAQruu0bLSlug1Bo8x/EjzY2X6A0fM5VUc=;
        b=PlQry8xnm/NzBSQpA/ujYEMGqGy9QO1PjxawNUHuf5E1J+vgbSt72iuZjRgcONa3V2
         KKWyAGcPtrV7TtvGPgH9uDCx+d0mReSJig0nQN6ncdgUSo0y3oprzqHGlBFl0Hc72J5z
         cO5KBzYWEFQw5vTa9Zl8/px3AmpkjMm0BZEgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707998855; x=1708603655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RU5j0fTz/wAQruu0bLSlug1Bo8x/EjzY2X6A0fM5VUc=;
        b=JkBm+FLfXSUvgEkIJ/fpzj/oMvUVhU2YBn4J3f71hHvUA3NCGMqh6MCoRP3FYdRIKg
         VnouLs2259lOlHVXYihW08kAwXN1Lu6eFCOvBtb/IwdD8ZOkFiTWF6tT9v9ROvCx8jMI
         Qza6qTW//ROVyHkRzrKzSZjY8zbmH/hRCJns8+QZ6tTgqmNiarS2yVpRomQsy5Iic22W
         6M9MFzg5u7GAmArdFEdfmPVFo4g1EG7knJrFW1BfRrG57iEWTXMtx+Xue1iPnSYW22oI
         kTVjtUD0teSYImCpUB7oSxZzgoL0its1vkk7fC2MSeK+VxDK4vbtH4xSkFGeHVL4NcJa
         9u5Q==
X-Gm-Message-State: AOJu0YxPCmugZ9NZ3AJJkPg1R26z6yFdYDyTccky7r8J0Pb4jz1RfuoJ
	tVdRqNk2icS8VQFsSe7jjmP0Vcu8cv8Chctl9E75FruOE8Uw0+MmO2d1lLsgMC4=
X-Google-Smtp-Source: AGHT+IH7NvhOqe4SC2BghmLoYjvtXb8RBeI8BaxfXR98Q9F7WZnrdK6AtPeCQp5XTXeopeKGKceF3w==
X-Received: by 2002:a05:600c:4f14:b0:411:eb4f:7fb6 with SMTP id l20-20020a05600c4f1400b00411eb4f7fb6mr1215929wmq.8.1707998855111;
        Thu, 15 Feb 2024 04:07:35 -0800 (PST)
Date: Thu, 15 Feb 2024 12:07:34 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v6 15/21] tools/xl: support new 9pfs backend xen_9pfsd
Message-ID: <f4aecdb2-b573-4843-baa0-e6ae6705c54b@perard>
References: <20240215065541.21067-1-jgross@suse.com>
 <20240215065541.21067-16-jgross@suse.com>
 <3261b14b-bce1-4aa5-bb61-a25930fca133@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3261b14b-bce1-4aa5-bb61-a25930fca133@suse.com>

On Thu, Feb 15, 2024 at 10:42:18AM +0100, Juergen Gross wrote:
> On 15.02.24 07:55, Juergen Gross wrote:
> > Add support for the new 9pfs backend "xen_9pfsd". For this backend type
> > the tag defaults to "Xen" and the host side path to
> > "/var/log/xen/guests/<dom-name>".
> > 
> > Do most of the default settings in libxl. Unfortunately the default
> > path can't easily be set in libxl, as the domain name isn't available
> > in the related 9pfs specific function.
> > 
> > Settings the defaults in libxl requires to move the sanity checking
> > of 9pfs parameters from xl to libxl, too.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> 
> Sorry Anthony, just found your R-b: in my spam folder :-(

I wonder if my @cloud.com email address would work better, and be less
broken.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

