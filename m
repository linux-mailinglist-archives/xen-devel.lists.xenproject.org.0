Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFFB973702
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 14:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795469.1204833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snzpg-0004lk-Ks; Tue, 10 Sep 2024 12:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795469.1204833; Tue, 10 Sep 2024 12:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snzpg-0004jN-IK; Tue, 10 Sep 2024 12:18:56 +0000
Received: by outflank-mailman (input) for mailman id 795469;
 Tue, 10 Sep 2024 12:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F9nm=QI=gmail.com=arthurborsboom@srs-se1.protection.inumbo.net>)
 id 1snzpf-0004jH-MD
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 12:18:55 +0000
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [2607:f8b0:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7af7c30-6f6e-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 14:18:53 +0200 (CEST)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-7c691c8f8dcso3634789a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 05:18:53 -0700 (PDT)
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
X-Inumbo-ID: d7af7c30-6f6e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725970732; x=1726575532; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPvvRryr0vgpHkg1cRcRCsWDsYNvGIowHyQK6GkDpME=;
        b=hxTpPFt5NA3z46I+LZ5S6St0+GyxCJFvLpDc++J7zGaxhpccMQdCH+5yIp9/E0SWl7
         iYgTtok7OPUpV+Kp3w1tjwSJ5VEFsT1Ht2rb+8q1/Q/kx5QzUUB0J9j14M/Y9w9YI32D
         14m/sj13nQn7XOPzyPbmaEhMR48jopRBKQtNOc57qIRnaT+/orOxKE0TAbU/dNOcaWed
         URNtxNHZKM+OoEveNroQ8ZnJ9JVmBlgIUHiCAAHMshoj4BaP9ewH1cylx9M1NjA8ydz6
         nqvL1YyLkH49IXM+05qxNROM10/qnXWrqOaJiejsYqXu6jfnDBWcZZF+vDeIeL+0dbvg
         8jbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725970732; x=1726575532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPvvRryr0vgpHkg1cRcRCsWDsYNvGIowHyQK6GkDpME=;
        b=JAtkf8QyJ7khIS2SbcwbAOc7waGT7JhtdEuewyKJG5cD3/4mGxeyxqg2eZXHsdlQER
         fDUYMBc8c4lkGuR2K2A/zYmDThGdL+FUh3kFCWEvPg+xdOj5sbEbONudMhOSrcivpi4Z
         sVcHXNb0bW6BnXYgL244Yxg+7TO0Ys+mwN6Sa9hcf3C84rZIJr6JvI6bC7kehJwBg48j
         ooEzZZq6kaFVg/Vue4I3qaTfNBmqvZR16Cxj1zvA7WA5uWO1WjnbnLUajAhPpHO/mR0c
         lZHkFoplVB5grtpiCk1eucW8CCW1ARVOyQagDlD2t7xYMdvv0mW2iSjvICfTX36boKFZ
         TC1A==
X-Forwarded-Encrypted: i=1; AJvYcCXPdLr5fGmd1cW9DX918w/TGKZO3DmZnhchSAkDhDnUuHDMlgm+/jNclm17M+9TZkX1NaWzunbkhtY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzp7qGSFDCvMKLNOc8Zro+Us84pah8Cqfj2b98RQi9AB6GsddnZ
	nLLDPYI4dEMldPca2Hq0st0ZpoZJvgwUbGmyTx9/LIrGezy4AqQP3tnXFD0KKuzEW4wVUa0bB6M
	c+wp/hSPAwc4cOVjsolrYPGw4Ky8=
X-Google-Smtp-Source: AGHT+IEqnPdqGPGDHSqJ9shohkQQvK+iGfhG5oaAvU7FW7rygKnMjlmBmhrY9M9Ct4hLeZ0hd+LUouxLfQHVHh0lF2g=
X-Received: by 2002:a05:6a20:cf8c:b0:1cf:3a0a:ae45 with SMTP id
 adf61e73a8af0-1cf5e156d0fmr992068637.35.1725970731916; Tue, 10 Sep 2024
 05:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240910020919.5757-1-jandryuk@gmail.com> <Zt_zvt3VXwim_DwS@macbook.local>
 <ad9e19af-fabd-4ce0-a9ac-741149f9aab3@suse.de> <Zt__jTESjI7P7Vkj@macbook.local>
 <2024091033-copilot-autistic-926a@gregkh>
In-Reply-To: <2024091033-copilot-autistic-926a@gregkh>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Tue, 10 Sep 2024 14:18:35 +0200
Message-ID: <CALUcmUn30tPxjToysLBVBmibMaQUWW=GqFoqduP-W5QwQ-VriQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev/xen-fbfront: Assign fb_info->device
To: Greg KH <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jason Andryuk <jandryuk@gmail.com>, Helge Deller <deller@gmx.de>, 
	Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>, xen-devel@lists.xenproject.org, 
	Jason Andryuk <jason.andryuk@amd.com>, stable@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Sept 2024 at 10:33, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Sep 10, 2024 at 10:13:01AM +0200, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Sep 10, 2024 at 09:29:30AM +0200, Thomas Zimmermann wrote:
> > > Hi
> > >
> > > Am 10.09.24 um 09:22 schrieb Roger Pau Monn=C3=A9:
> > > > On Mon, Sep 09, 2024 at 10:09:16PM -0400, Jason Andryuk wrote:
> > > > > From: Jason Andryuk <jason.andryuk@amd.com>
> > > > >
> > > > > Probing xen-fbfront faults in video_is_primary_device().  The pas=
sed-in
> > > > > struct device is NULL since xen-fbfront doesn't assign it and the
> > > > > memory is kzalloc()-ed.  Assign fb_info->device to avoid this.
> > > > >
> > > > > This was exposed by the conversion of fb_is_primary_device() to
> > > > > video_is_primary_device() which dropped a NULL check for struct d=
evice.
> > > > >
> > > > > Fixes: f178e96de7f0 ("arch: Remove struct fb_info from video help=
ers")
> > > > > Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > > > > Closes: https://lore.kernel.org/xen-devel/CALUcmUncX=3DLkXWeiSiTK=
sDY-cOe8QksWhFvcCneOKfrKd0ZajA@mail.gmail.com/
> > > > > Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > > > > CC: stable@vger.kernel.org
> > > > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > > Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > >
> > > > > ---
> > > > > The other option would be to re-instate the NULL check in
> > > > > video_is_primary_device()
> > > > I do think this is needed, or at least an explanation.  The commit
> > > > message in f178e96de7f0 doesn't mention anything about
> > > > video_is_primary_device() not allowing being passed a NULL device
> > > > (like it was possible with fb_is_primary_device()).
> > > >
> > > > Otherwise callers of video_is_primary_device() would need to be
> > > > adjusted to check for device !=3D NULL.
> > >
> > > The helper expects a non-NULL pointer. We might want to document this=
.
> >
> > A BUG_ON(!dev); might be enough documentation that the function
> > expected a non-NULL dev IMO.
>
> No need for that, don't check for things that will never happen.

And yet, here we are, me reporting a kernel/VM crash due to a thing
that will never happen, see 'Closes' above.

I don't want to suggest BUG_ON is the right approach; I have no idea.
I just want to mention that (!dev) did happen. :-)

