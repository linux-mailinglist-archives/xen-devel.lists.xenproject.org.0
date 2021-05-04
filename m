Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 485C2372EE4
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 19:26:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122628.231300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldyoj-0003MP-Or; Tue, 04 May 2021 17:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122628.231300; Tue, 04 May 2021 17:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldyoj-0003M0-Lm; Tue, 04 May 2021 17:26:41 +0000
Received: by outflank-mailman (input) for mailman id 122628;
 Tue, 04 May 2021 17:26:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E2aX=J7=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1ldyoj-0003Lv-13
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:26:41 +0000
Received: from mail-qk1-x729.google.com (unknown [2607:f8b0:4864:20::729])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ce38a9c-592a-4b90-9b97-b800ec854132;
 Tue, 04 May 2021 17:26:40 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id o27so9339825qkj.9
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 10:26:40 -0700 (PDT)
Received: from six (c-73-89-138-5.hsd1.vt.comcast.net. [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id g25sm935209qtu.93.2021.05.04.10.26.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 May 2021 10:26:39 -0700 (PDT)
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
X-Inumbo-ID: 9ce38a9c-592a-4b90-9b97-b800ec854132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q0A+THcWBgMm6tqQiWxwcEZdK2rcBHSm8cjiNNwjTMs=;
        b=FWHc9H2k/L66PF9EKRO6TYr6gPDB12UyoSnWh65ewlR7QF/CuU2HeAh4+oJMDIDfs8
         BK8rymhueB2j0BHJG5Qi/W0opvdXqgUQrl8dKtuFZEARHm4FoUKedRDe3C+qbd06iNpt
         IQNJIJPh1JlSl/DVx8FQD5uAAVkHOSUrnBcYqXtsWx+OH4RTez5lfyd+Ms3WxeXVXGgy
         07iRmAdZG6mJ+bTNvJ0kcPlM1rkRHU3UqJ6LCc0x7YopNkZplXMYsz11Oyif5i+su5Oh
         0BPDtKjHq0e2x1bIAw+8RbnDyfrGjVjjsG+PQdG3UVZlaVi1iIzyA+IAy2a/8pl/KiBz
         IvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q0A+THcWBgMm6tqQiWxwcEZdK2rcBHSm8cjiNNwjTMs=;
        b=Xj245EylRPbjQutanaaMmas9u+bTbM3VAiiaDClNGqj1t4BEyvN6iunsiA7VPTF1Gb
         xSrtMgazPCkGubcz6Lq0jB3i1Sd4OPaapJZ/OQBVouxHUiVnmYTVmkr7zZlCc4E9vpi1
         rx873dgyNZc+h3O6K/bm/MuFrLgTc0ZpbSoXqVUyMoYjZ3PLrayevXC3NioebWbbEJ/0
         1V9P/jrJT3ykQkZLbA2y4C2e0KpXkS5xDPgx3LFUmyJVV7zduL0cTF/ifKOu9Xu1vMbU
         sn3lAjF5LFjTren1FADdi3u4f24dSc0c/7spDfEZiN3NYNkaPm87XVKWx7jFJdh+HpZk
         MmAw==
X-Gm-Message-State: AOAM533CuSPWKjbL595vsRCoI6AXDjauPlIaIuOlaUENIaGtC3BF2yTI
	Gg5n16gPar7Y4uxlY48qRsY=
X-Google-Smtp-Source: ABdhPJxW4R0R8Pp38jsXDjxIPkp5ZAamG2jqOVe6u+ZY5sjFiJLffceFBXByVWFSjbYsyU80KWCW2g==
X-Received: by 2002:a05:620a:138f:: with SMTP id k15mr13272719qki.471.1620149200029;
        Tue, 04 May 2021 10:26:40 -0700 (PDT)
Date: Tue, 4 May 2021 13:26:37 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, george.dunlap@citrix.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [RFC v2 5/7] libxl: add device function definitions to
 libxl_types.idl
Message-ID: <20210504172637.GA7941@six>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
 <2cd96b7e884c6f0c2667ef7499ff7179b99ea635.1614734296.git.rosbrookn@ainfosec.com>
 <YJFrn7+4AQt7K2Fa@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJFrn7+4AQt7K2Fa@perard>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, May 04, 2021 at 04:43:27PM +0100, Anthony PERARD wrote:
> On Tue, Mar 02, 2021 at 08:46:17PM -0500, Nick Rosbrook wrote:
> > diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> > index 5b85a7419f..550af7a1c7 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -666,6 +668,24 @@ libxl_device_vfb = Struct("device_vfb", [
> >      ("keymap",        string),
> >      ])
> >  
> > +libxl_device_vfb_add = DeviceAddFunction("device_vfb_add",
> > +    device_param=("vfb", libxl_device_vfb),
> > +    extra_params=[("ao_how", libxl_asyncop_how)],
> > +    return_type=libxl_error
> > +)
> > +
> > +libxl_device_vfb_remove = DeviceRemoveFunction("device_vfb_remove",
> > +    device_param=("vfb", libxl_device_vfb),
> > +    extra_params=[("ao_how", libxl_asyncop_how)],
> > +    return_type=libxl_error
> > +)
> > +
> > +libxl_device_vfb_destroy = DeviceDestroyFunction("device_vfb_destroy",
> > +    device_param=("vfb", libxl_device_vfb),
> > +    extra_params=[("ao_how", libxl_asyncop_how)],
> > +    return_type=libxl_error
> > +)
> > +
> >  libxl_device_vkb = Struct("device_vkb", [
> >      ("backend_domid", libxl_domid),
> >      ("backend_domname", string),
> 
> In future version of the series that is deem ready, I think it would be
> useful to have this change in libxl_types.idl and the change that remove
> the macro call from the C file in the same patch. It would make it
> possible to review discrepancies.
> 
> The change in the idl for vfb is different that the change in the C
> file:
> 
> > --- a/tools/libs/light/libxl_console.c
> > +++ b/tools/libs/light/libxl_console.c
> > @@ -723,8 +723,6 @@ static LIBXL_DEFINE_UPDATE_DEVID(vfb)
> >  static LIBXL_DEFINE_DEVICE_FROM_TYPE(vfb)
> > 
> >  /* vfb */
> > -LIBXL_DEFINE_DEVICE_REMOVE(vfb)
> > -
> >  DEFINE_DEVICE_TYPE_STRUCT(vfb, VFB, vfbs,
> >      .skip_attach = 1,
> >      .set_xenstore_config = (device_set_xenstore_config_fn_t)
> 
> No add function ;-)
> 

Good catch, thanks. I will consolidate these two patches in the next
version.

> And libxl doesn't build anymore with the last patch applied. They are
> maybe also issues with functions that are static and thus are not
> accessible from other c files.

Yes, I wanted to receive a bit of feedback on the code generation
approach before mangling things to build. As you say, there are
currently static functions in libxl_<device>.c files that will need to
be accessible from the generated C file. I will address this in v3.

Thanks,
NR

