Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBB3972BBF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 10:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795064.1204168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snvzn-0007ru-A7; Tue, 10 Sep 2024 08:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795064.1204168; Tue, 10 Sep 2024 08:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snvzn-0007pj-5l; Tue, 10 Sep 2024 08:13:07 +0000
Received: by outflank-mailman (input) for mailman id 795064;
 Tue, 10 Sep 2024 08:13:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EW7V=QI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snvzl-0007pd-Ry
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 08:13:05 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8079a411-6f4c-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 10:13:03 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so230619166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 01:13:03 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d258354f7sm445482166b.2.2024.09.10.01.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 01:13:02 -0700 (PDT)
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
X-Inumbo-ID: 8079a411-6f4c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725955983; x=1726560783; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZrAkDLaXld3+MjEVbLTf0QH6amL7yZTph2uE3DVa+eA=;
        b=K0Afle1qlK5DelOeW5pdroL26X6Cr5UlLFrTTwOrZmpxC3Fs5o/wDLk+d80+9UlElq
         5GaM46PNZ8xJARVM6OnpSNBLjCv9QxTdVzaeeu19omhYw2/pPY7ybt8+NwH7tONJOt6y
         n02KF3zbPZOMLbB3U7ekttIu9LCMsuEkc/R7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725955983; x=1726560783;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrAkDLaXld3+MjEVbLTf0QH6amL7yZTph2uE3DVa+eA=;
        b=l+lxUNBbk4+oOxi0NOpZLkjvaK9Y8ST2/6ty2D1NUWcyMzw4znicE/MEYhEssug71P
         wizyMYN0aXT5OTUaLBy/v6ODwmumUOj1XBxF5G19C9Hn2WzfiHb5TdiYNqBzN27tN7sk
         EI7w5cuxzDqvlPAx6U58wTM7TM0wrc+bxtRcPwHIrKpztpWzc8EPcxiTJKvsnn9+FYPK
         sfOCbKgDasLXQl4LuXvqOm3Q76WOy0nuIZZwpSqEFArckI/mb4hnEdcqN181Rt4Io4s3
         xrpoaekak2u1QYXedyHoBlHcToIzmFphF2qyohcrkxt+608YFjnaTRGP16Q/pjD9vVAF
         QXqg==
X-Forwarded-Encrypted: i=1; AJvYcCU3AOBgZG4ky7BdzYUhmlXBBV8JsQCR1qjaJrl/OBEYDHDzdl9GxIS+P7pCyJB1qxh6qYq0f96FBzc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3J3AVd6JrapMiVyK7yg0nxwrIhvZ4vsBZV2XNXl5ZsilF3htB
	Rdir6wvZy12EL9AmyoTWOw//FPoZoMcUR3OZDYd+zQci70xC2ad3gkR5d3StbJg=
X-Google-Smtp-Source: AGHT+IHiB9BjTCtXbGr3lRX9SELZFUb5HLAig7DxMwgiilncoD8W9NU5mPh05hS+XdfHoA6qWwrRQQ==
X-Received: by 2002:a17:907:1c23:b0:a8d:4d76:a75e with SMTP id a640c23a62f3a-a8d4d76a983mr600932766b.30.1725955982405;
        Tue, 10 Sep 2024 01:13:02 -0700 (PDT)
Date: Tue, 10 Sep 2024 10:13:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jason Andryuk <jandryuk@gmail.com>, Helge Deller <deller@gmx.de>,
	Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>,
	xen-devel@lists.xenproject.org,
	Jason Andryuk <jason.andryuk@amd.com>,
	Arthur Borsboom <arthurborsboom@gmail.com>, stable@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev/xen-fbfront: Assign fb_info->device
Message-ID: <Zt__jTESjI7P7Vkj@macbook.local>
References: <20240910020919.5757-1-jandryuk@gmail.com>
 <Zt_zvt3VXwim_DwS@macbook.local>
 <ad9e19af-fabd-4ce0-a9ac-741149f9aab3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad9e19af-fabd-4ce0-a9ac-741149f9aab3@suse.de>

On Tue, Sep 10, 2024 at 09:29:30AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 10.09.24 um 09:22 schrieb Roger Pau Monné:
> > On Mon, Sep 09, 2024 at 10:09:16PM -0400, Jason Andryuk wrote:
> > > From: Jason Andryuk <jason.andryuk@amd.com>
> > > 
> > > Probing xen-fbfront faults in video_is_primary_device().  The passed-in
> > > struct device is NULL since xen-fbfront doesn't assign it and the
> > > memory is kzalloc()-ed.  Assign fb_info->device to avoid this.
> > > 
> > > This was exposed by the conversion of fb_is_primary_device() to
> > > video_is_primary_device() which dropped a NULL check for struct device.
> > > 
> > > Fixes: f178e96de7f0 ("arch: Remove struct fb_info from video helpers")
> > > Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > > Closes: https://lore.kernel.org/xen-devel/CALUcmUncX=LkXWeiSiTKsDY-cOe8QksWhFvcCneOKfrKd0ZajA@mail.gmail.com/
> > > Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > > CC: stable@vger.kernel.org
> > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > > ---
> > > The other option would be to re-instate the NULL check in
> > > video_is_primary_device()
> > I do think this is needed, or at least an explanation.  The commit
> > message in f178e96de7f0 doesn't mention anything about
> > video_is_primary_device() not allowing being passed a NULL device
> > (like it was possible with fb_is_primary_device()).
> > 
> > Otherwise callers of video_is_primary_device() would need to be
> > adjusted to check for device != NULL.
> 
> The helper expects a non-NULL pointer. We might want to document this.

A BUG_ON(!dev); might be enough documentation that the function
expected a non-NULL dev IMO.

Thanks, Roger.

