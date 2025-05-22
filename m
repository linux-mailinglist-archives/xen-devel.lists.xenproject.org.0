Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF78AC054F
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992982.1376442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI06Q-0003KG-25; Thu, 22 May 2025 07:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992982.1376442; Thu, 22 May 2025 07:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI06P-0003I4-V5; Thu, 22 May 2025 07:12:29 +0000
Received: by outflank-mailman (input) for mailman id 992982;
 Thu, 22 May 2025 07:12:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI06P-0003Hy-4p
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:12:29 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e3cac05-36dc-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 09:12:27 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a363ccac20so5027307f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:12:27 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a35ca5beccsm22350199f8f.36.2025.05.22.00.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 00:12:26 -0700 (PDT)
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
X-Inumbo-ID: 1e3cac05-36dc-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747897947; x=1748502747; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7oYMkcBPqatPPgNd3FRfOGxTWtsxbjr0KC1Q8451qmQ=;
        b=Of5yEHL3bCknBWZl53vNyrNnpbU/iYlEi43AvwPknCbnVzDmNl/YaKpDM4EAPUenbC
         Dwo3S2BcHhjYY07gbtuNtzj5zi01bFZzLgjQm7g4abBOurPrXXMzjv49O+DJwn/owq9Y
         1bGbyKk0ISRolyXKkjCNiJHpsSI7r754JEBV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747897947; x=1748502747;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7oYMkcBPqatPPgNd3FRfOGxTWtsxbjr0KC1Q8451qmQ=;
        b=Yvs/IUHDuObJ8oCZtyIaBuWKNdcY5gAkf4QWhM2KNzibpi9WzgmwfeJiCgfaRCowsi
         kaZrT+FL9cPlnzIByrQvSzPx0utDaH5nUtiHnu39NxKD291AAQKODpElF9agOV/LBlRw
         KzA2o6xy8TsuH14DckPY/0FJz6ui4irG+Vg6WCqRS+ATu+PEUPAtCWi/jGGYMCVn9dWP
         5DVaL0kjnDTnB47s/NGX7nFaw4ak2db/13d4OfnN5j7YNjUdtcKuDNojxL3G0QpSKbzV
         ar86/m+YijsQpdIyDTQZg47gjg9ZQ6d6fagz7ECuBvJMhuuZWeCJ7oM5OoQeCscK/6Cm
         4x9A==
X-Forwarded-Encrypted: i=1; AJvYcCUm11kMjyUWQ/7eGv/F3IGUTIjhHJpoJoA9UbtQhyRegz6hDE/9aEXTK3PnraXqnkVnLFBt2IYMwl0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw63BSy5JVNV7vIGfieQS6NUBKIovYYEriKPCmUsjB47Do4Tdrj
	aY6ljXa3Qjbjt3gVmnBv0DKO6vVb3k16lur7Y+oSI/qGccoMAHy26HzUJQJP/1JOncA=
X-Gm-Gg: ASbGnctNIElJpSwEHSl+hfzsRSv8WpIykJdRjGIE20oR95wcGgswpp38Tf8eTB3vP0z
	G5iuW2Yn6ZpuX+KnN+tRDwpPsSU4rwR1eBxtRBM93+SL77w8m5E4uRPHzK83SKD75Aq9ZOqSnTJ
	PSNW1Y4rhdL6tVmJSbJKaxgKdUf1oOhMbpZfkM8jpBeMrwDjHXIoqPaJH0wW5oXtqE+6equcHwC
	P1mjdq54sa4pTdYoEskyGA21Di60WtSXk1WgEG+eLjVq2alkslrf6IdlRZZtJpk7exAKixQKuOE
	/hu/sWVfsK1ZLZjNdUHHbo/i0CWX/hRpyS9s7sORLSQJRCsC3OOfoTL+FAHKnQaBHzKFs/h/dKe
	PaQ2Yp/ZrC8pLcgoIpIc=
X-Google-Smtp-Source: AGHT+IG+yDvMAiBIof1krR9Iosx6MaW73fpo3WlTFIcJvwRwYOG5ZUv8HOk1iA1SGLQGuV5oHKjONA==
X-Received: by 2002:a05:6000:2385:b0:3a3:4ba4:f3cd with SMTP id ffacd0b85a97d-3a35c821e38mr19214329f8f.1.1747897947335;
        Thu, 22 May 2025 00:12:27 -0700 (PDT)
Date: Thu, 22 May 2025 09:12:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v4 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
Message-ID: <aC7OWeXWyS1qKv8h@macbook.local>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-10-Jiqian.Chen@amd.com>
 <8d89f644-4ded-4490-ad23-518563d230d2@suse.com>
 <aCxGwSl_UuCWPf6B@Mac.lan>
 <e7ab7be1-e256-4f63-a835-cf1e13e0183f@suse.com>
 <aCxO1Gh_ehxpsznI@Mac.lan>
 <BL1PR12MB5849E2CD05D70E7A475646F3E79EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aC23xI0qgsAqLb2S@macbook.local>
 <BL1PR12MB5849BD99C735B7821B7841D1E799A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849BD99C735B7821B7841D1E799A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Thu, May 22, 2025 at 02:21:16AM +0000, Chen, Jiqian wrote:
> On 2025/5/21 19:23, Roger Pau Monné wrote:
> > On Wed, May 21, 2025 at 07:00:37AM +0000, Chen, Jiqian wrote:
> >> On 2025/5/20 17:43, Roger Pau Monné wrote:
> >>> On Tue, May 20, 2025 at 11:14:27AM +0200, Jan Beulich wrote:
> >>>> On 20.05.2025 11:09, Roger Pau Monné wrote:
> >>>>> On Tue, May 20, 2025 at 08:40:28AM +0200, Jan Beulich wrote:
> >>>>>> On 09.05.2025 11:05, Jiqian Chen wrote:
> >>>>>>> When init_msi() fails, the previous new changes will hide MSI
> >>>>>>> capability, it can't rely on vpci_deassign_device() to remove
> >>>>>>> all MSI related resources anymore, those resources must be
> >>>>>>> removed in cleanup function of MSI.
> >>>>>>
> >>>>>> That's because vpci_deassign_device() simply isn't called anymore?
> >>>>>> Could do with wording along these lines then. But (also applicable
> >>>>>> to the previous patch) - doesn't this need to come earlier? And is
> >>>>>> it sufficient to simply remove the register intercepts? Don't you
> >>>>>> need to put in place ones dropping all writes and making all reads
> >>>>>> return either 0 or ~0 (covering in particular Dom0, while for DomU-s
> >>>>>> this may already be the case by default behavior)?
> >>>>>
> >>>>> For domUs this is already the default behavior.
> >>>>>
> >>>>> For dom0 I think it should be enough to hide the capability from the
> >>>>> linked list, but not hide all the capability related
> >>>>> registers.  IMO a well behaved dom0 won't try to access capabilities
> >>>>> disconnected from the linked list,
> >>>>
> >>>> Just that I've seen drivers knowing where their device has certain
> >>>> capabilities, thus not bothering to look up the respective
> >>>> capability.
> >>>
> >>> OK, so let's make the control register read-only in case of failure.
> >>>
> >>> If MSI(-X) is already enabled we should also make the entries
> >>> read-only, and while that's not very complicated for MSI, it does get
> >>> more convoluted for MSI-X.  I'm fine with just making the control
> >>> register read-only for the time being.
> >> If I understand correctly, I need to avoid control register being removed and set the write hook of control register to be vpci_ignored_write and avoid freeing vpci->msi?
> >>
> >> "
> >>      if ( !msi_pos || !vpci->msi )
> >>          return;
> >>
> >> +    spin_lock(&vpci->lock);
> >> +    control = vpci_get_register(vpci, msi_control_reg(msi_pos), 2);
> >> +    if ( control )
> >> +        control->write = vpci_ignored_write;
> >> +    spin_unlock(&vpci->lock);
> >> +
> >>      if ( vpci->msi->masking )
> >>          end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
> >>      else
> >>          end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
> >>
> >> -    size = end - msi_control_reg(msi_pos);
> >> +    start = msi_control_reg(msi_pos) + 2;
> >> +    size = end - start;
> >>
> >> -    vpci_remove_registers(vpci, msi_control_reg(msi_pos), size);
> >> -    XFREE(vpci->msi);
> >> +    vpci_remove_registers(vpci, start, size);
> > 
> > I think you want to first purge all the MSI range, and then add the
> > control register, also you want to keep the XFREE(), and set the
> > register as:
> Understood.
> 
> > 
> > vpci_add_register(vpci, vpci_hw_read16, NULL, msi_control_reg(msi_pos),
> >                   2, NULL);
> And one more question, how do I process return value of vpci_add_register since definition of cleanup hook is "void"?
> Print a error message if fail?

Well, we should consider the cleanup function returning an error code.
vpci_remove_registers() can also fail, and the error is currently
ignored.  Both cases should result in failing to assign the device to
the domain IMO.

Thanks, Roger.

