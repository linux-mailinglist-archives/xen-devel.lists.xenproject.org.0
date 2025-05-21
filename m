Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C7ABF2B5
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 13:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991698.1375519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHhY9-0005e2-Am; Wed, 21 May 2025 11:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991698.1375519; Wed, 21 May 2025 11:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHhY9-0005cb-7x; Wed, 21 May 2025 11:23:53 +0000
Received: by outflank-mailman (input) for mailman id 991698;
 Wed, 21 May 2025 11:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Cb8=YF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uHhY8-0005cV-3A
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 11:23:52 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11893d7d-3636-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 13:23:50 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a35919fa8bso2707619f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 04:23:50 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a35ca4d2d1sm20013991f8f.19.2025.05.21.04.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 04:23:49 -0700 (PDT)
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
X-Inumbo-ID: 11893d7d-3636-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747826629; x=1748431429; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5i2XRUMt8Wc5XyeJDF55b4Gg6QTaNnRZIhf+cL4pUc=;
        b=iYjSoVU7GPyxAJob7QDM2RoAhg2JNpkC00Rz23lKzwH0SVWDG+9dyl5vUFlJKxInbO
         mPwVVrFlh87BYWa1ht2cOJBNbzgW1QaEO4Twqd1pefx/oPr8nQRva7WWoy0QX56FCN9+
         HIyLXGTAPRUyeE+eFDpfePzIlmWmmxQM2xgAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747826629; x=1748431429;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5i2XRUMt8Wc5XyeJDF55b4Gg6QTaNnRZIhf+cL4pUc=;
        b=E4uezjimkX4YAUr9yDxhSoHlINwRvPqnRtdykboAri3qQs/mJk/GDyGtssMy7XH2xP
         6XSEcu+vjaEdc1lJEFM8XbnoL840PWShAQx3oR/miwAdj+ICumijWbu1DUK9ab8D99hB
         bhP7WYjsqgWi5byhfjVuyXj5tdvL3z4nfO3DaTNan+zBAip/+VMsDubi3/UbXLbik1XL
         3iDOOkHMU4VfS/Og7i8YJ4ZC0crPrY7kt/yj8vCTnXjdCx8SwCs7B1rhK1plisdnZnP1
         /sTC4MuE1h7RmO4SnlTvq507/L8Azt2VBQvpxdunN/PxLL/0MOtzOArsOYl+G1bzhFrW
         tUWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA2bwFyiWgBELsbz5xHZMi4mHVvJGn1zGHk177V9Thay+64RR1sGjGYrKz9XRlRSPTlcpSSYb0ouE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOIhXIO9OQTsSXB27CopaUE7qmZwO/Uqyz8MZ9mImzZoqR0rIv
	yFWHYmPbqJM0XBHGRpOUa5ygt/GAdrCYiH1oYjF0xWWy3/a7nP7Xm8M6M2B9du1W4smTnIGaUbi
	QRmNu
X-Gm-Gg: ASbGncsuiDiBppEwfKmirAbCrj0FCdC6LOqP7C3V6uItXmhOXBaeWr7M3rwF6o8Epi8
	zWdiYsYgiCgSjGsle9aS6yvnPzZuGycZxJWPnUaahlJc9itHmZt0XHSK1Qw209hbtSIzYYKPgva
	klIK3WhfImVGSlrfgRm4l05zQTHWiTRRU9ImkspB+AvNq8r7Ruajw/M2On+oOumVNZ/LfBlvkAv
	Ynf5XMXJQgN5sW5Za5WCRpSMu2YQYckiz0OwMlvjowrloEaJJBJGBNDPVVQpu6OzM5m57+kdAAd
	eHD9dMIaVg+MR5bN/tk6L5e7PckH6WI9I3KXhzp993EVwfD5rUSJXve3HIhCYc5hMEYFw2TL7B8
	ypE+2sgHqtD0KzenxVnl9hzbl
X-Google-Smtp-Source: AGHT+IGUKR7sqx8CoV9YlU7kqFMHBgORAwfq23kSzJIcSUZ0jlnyPRqoj0J0qxYipwYA8iC0aAGvwQ==
X-Received: by 2002:a05:6000:2405:b0:3a0:7a7c:2648 with SMTP id ffacd0b85a97d-3a35fe95381mr17283752f8f.27.1747826629384;
        Wed, 21 May 2025 04:23:49 -0700 (PDT)
Date: Wed, 21 May 2025 13:23:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
Message-ID: <aC23xI0qgsAqLb2S@macbook.local>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-10-Jiqian.Chen@amd.com>
 <8d89f644-4ded-4490-ad23-518563d230d2@suse.com>
 <aCxGwSl_UuCWPf6B@Mac.lan>
 <e7ab7be1-e256-4f63-a835-cf1e13e0183f@suse.com>
 <aCxO1Gh_ehxpsznI@Mac.lan>
 <BL1PR12MB5849E2CD05D70E7A475646F3E79EA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849E2CD05D70E7A475646F3E79EA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, May 21, 2025 at 07:00:37AM +0000, Chen, Jiqian wrote:
> On 2025/5/20 17:43, Roger Pau Monné wrote:
> > On Tue, May 20, 2025 at 11:14:27AM +0200, Jan Beulich wrote:
> >> On 20.05.2025 11:09, Roger Pau Monné wrote:
> >>> On Tue, May 20, 2025 at 08:40:28AM +0200, Jan Beulich wrote:
> >>>> On 09.05.2025 11:05, Jiqian Chen wrote:
> >>>>> When init_msi() fails, the previous new changes will hide MSI
> >>>>> capability, it can't rely on vpci_deassign_device() to remove
> >>>>> all MSI related resources anymore, those resources must be
> >>>>> removed in cleanup function of MSI.
> >>>>
> >>>> That's because vpci_deassign_device() simply isn't called anymore?
> >>>> Could do with wording along these lines then. But (also applicable
> >>>> to the previous patch) - doesn't this need to come earlier? And is
> >>>> it sufficient to simply remove the register intercepts? Don't you
> >>>> need to put in place ones dropping all writes and making all reads
> >>>> return either 0 or ~0 (covering in particular Dom0, while for DomU-s
> >>>> this may already be the case by default behavior)?
> >>>
> >>> For domUs this is already the default behavior.
> >>>
> >>> For dom0 I think it should be enough to hide the capability from the
> >>> linked list, but not hide all the capability related
> >>> registers.  IMO a well behaved dom0 won't try to access capabilities
> >>> disconnected from the linked list,
> >>
> >> Just that I've seen drivers knowing where their device has certain
> >> capabilities, thus not bothering to look up the respective
> >> capability.
> > 
> > OK, so let's make the control register read-only in case of failure.
> > 
> > If MSI(-X) is already enabled we should also make the entries
> > read-only, and while that's not very complicated for MSI, it does get
> > more convoluted for MSI-X.  I'm fine with just making the control
> > register read-only for the time being.
> If I understand correctly, I need to avoid control register being removed and set the write hook of control register to be vpci_ignored_write and avoid freeing vpci->msi?
> 
> "
>      if ( !msi_pos || !vpci->msi )
>          return;
> 
> +    spin_lock(&vpci->lock);
> +    control = vpci_get_register(vpci, msi_control_reg(msi_pos), 2);
> +    if ( control )
> +        control->write = vpci_ignored_write;
> +    spin_unlock(&vpci->lock);
> +
>      if ( vpci->msi->masking )
>          end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
>      else
>          end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
> 
> -    size = end - msi_control_reg(msi_pos);
> +    start = msi_control_reg(msi_pos) + 2;
> +    size = end - start;
> 
> -    vpci_remove_registers(vpci, msi_control_reg(msi_pos), size);
> -    XFREE(vpci->msi);
> +    vpci_remove_registers(vpci, start, size);

I think you want to first purge all the MSI range, and then add the
control register, also you want to keep the XFREE(), and set the
register as:

vpci_add_register(vpci, vpci_hw_read16, NULL, msi_control_reg(msi_pos),
                  2, NULL);

So that you make it strictly hardware read-only, and not use the data
in vpci->msi.

Regards, Roger.

