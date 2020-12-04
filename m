Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E8D2CECDF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:16:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44432.79597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl94G-0007oF-Ue; Fri, 04 Dec 2020 11:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44432.79597; Fri, 04 Dec 2020 11:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl94G-0007np-RM; Fri, 04 Dec 2020 11:16:04 +0000
Received: by outflank-mailman (input) for mailman id 44432;
 Fri, 04 Dec 2020 11:16:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl94E-0007nk-P6
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:16:02 +0000
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 942dccf4-b72e-440f-9281-60580c165893;
 Fri, 04 Dec 2020 11:16:00 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id e25so6712741wme.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:16:00 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id b14sm3203129wrx.35.2020.12.04.03.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:15:59 -0800 (PST)
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
X-Inumbo-ID: 942dccf4-b72e-440f-9281-60580c165893
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jFJIH+lw+TMVA2V8UqXknJ8gSkPNdLR7MaI2n2kAMs4=;
        b=SrqEEohvP+BZdCMV3l7ikDf5AnNkK0kwsVBPYw3smgJ/wacptD72Le2qKSW5xRoYzN
         3Z4+98OEoCH5DR1K466DJxzU7CM4MYLYUox/zvlWTKrPF2ygl3b3cwAmgFMsjP+66OI9
         P0k98ydT8FVHHcIt3o4Z3Zor5cSfF7D6qZk5xuYnoWdY990YTPs6YhedfblkZY0+k2E9
         tAp6jlKsT9kGv1aH55fANUoBTrWQhzfKXLULnmzjd8VRvzGTcTl6wE+P8ZtAyhtwbdmI
         ulDNUUcM0vWW1TZGJpeY40jmf7p2fghPBK4AHCWDyZkNAMEEVW8UmH31dgWs3fyD8yDc
         eqRA==
X-Gm-Message-State: AOAM530WQ68ci45P5q57eT+dGUksfIaD+Ln69CpDpUntcrKO4H6VYTTT
	9lmgBbN4gDtDMOHXwhs4vAA=
X-Google-Smtp-Source: ABdhPJzynoOzSvmEUiPX5nnqOc3x9oJE14/CZWa3l2WPV3av2SFoudCMCiLe8p0+FRyk1FCOSgQlmg==
X-Received: by 2002:a1c:220b:: with SMTP id i11mr3713673wmi.8.1607080559783;
        Fri, 04 Dec 2020 03:15:59 -0800 (PST)
Date: Fri, 4 Dec 2020 11:15:57 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 01/23] xl / libxl: s/pcidev/pci and remove
 DEFINE_DEVICE_TYPE_STRUCT_X
Message-ID: <20201204111557.34ya4w4wvqvyonao@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-2-paul@xen.org>
 <20201204111326.5pxgqertdm3tk7y2@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204111326.5pxgqertdm3tk7y2@liuwe-devbox-debian-v2>
User-Agent: NeoMutt/20180716

On Fri, Dec 04, 2020 at 11:13:26AM +0000, Wei Liu wrote:
> On Thu, Dec 03, 2020 at 02:25:12PM +0000, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> > 
> > The seemingly arbitrary use of 'pci' and 'pcidev' in the code in libxl_pci.c
> > is confusing and also compromises use of some macros used for other device
> > types. Indeed it seems that DEFINE_DEVICE_TYPE_STRUCT_X exists solely because
> > of this duality.
> > 
> > This patch purges use of 'pcidev' from the libxl code, allowing evaluation of
> > DEFINE_DEVICE_TYPE_STRUCT_X to be replaced with DEFINE_DEVICE_TYPE_STRUCT,
> > hence allowing removal of the former.
> > 
> > For consistency the xl and libs/util code is also modified, but in this case
> > it is purely cosmetic.
> > 
> > NOTE: Some of the more gross formatting errors (such as lack of spaces after
> >       keywords) that came into context have been fixed in libxl_pci.c.
> > 
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > ---
> > Cc: Ian Jackson <iwj@xenproject.org>
> > Cc: Wei Liu <wl@xen.org>
> > Cc: Anthony PERARD <anthony.perard@citrix.com>
> > 
> 
> This is going to break libxl callers because the name "pcidev" is
> visible from the public header.
> 
> I agree this is confusing and inconsistent, but we didn't go extra
> length to maintain the inconsistency for no reason.
> 
> If you really want to change it, I won't stand in the way. In fact, I'm
> all for consistency. I think the flag you added should help alleviate
> the fallout. Also, you will need to submit patches to libvirt (the only
> user I know of) to make use of the flag and switch to the new name and
> then request such patch(es) be backported to all maintained version of
> libvirt.
> 
> See https://github.com/libvirt/libvirt/blob/0d05d51b715390e08cd112f83e03b6776412aaeb/src/libxl/libxl_conf.c#L2273

Pasted in the wrong line. This is the correct one I had in mind:

https://github.com/libvirt/libvirt/blob/0d05d51b715390e08cd112f83e03b6776412aaeb/src/libxl/libxl_conf.c#L2320

Wei.

