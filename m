Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1140A83A415
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 09:24:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670766.1043766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYY3-0005Y3-Vv; Wed, 24 Jan 2024 08:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670766.1043766; Wed, 24 Jan 2024 08:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYY3-0005Uu-S5; Wed, 24 Jan 2024 08:23:51 +0000
Received: by outflank-mailman (input) for mailman id 670766;
 Wed, 24 Jan 2024 08:23:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3ap=JC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSYY2-0004zS-3C
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 08:23:50 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5cd737d-ba91-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 09:23:48 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e60e137aaso56909045e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 00:23:48 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 q4-20020adfab04000000b00337d603fd01sm15139816wrc.66.2024.01.24.00.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 00:23:47 -0800 (PST)
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
X-Inumbo-ID: e5cd737d-ba91-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706084628; x=1706689428; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sMTmGFnBSW53su+bP0T0HtTbdX+NNUS1jw36GND5eYk=;
        b=wLN1NPDoaKzA5rdsS+V2YHEMkQ9CV2YFsRTjbDKkTZwvDZpGjeRdpUjVUhTmd6gwol
         kC1o7UuvrVu0VtDs6clQuumTG4422CH7xy2iz3IVtvndgHfZoUV4COMAlr6TGrCU3QzL
         Trw/NRDVW/COP11x/I/C7K7VDpTsDGscdJp+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706084628; x=1706689428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMTmGFnBSW53su+bP0T0HtTbdX+NNUS1jw36GND5eYk=;
        b=RU9W2Bfxno/aHk3/GcxRvy169UOSjNHDbzJBAgPVMXllhqHgBtbrrHQOYxBvBEi8Ai
         4LuLFEw3m2ExNv8zs0nzgquF422OrLu5RbOqoIp3Zsq7bRatpRodDUb1fGpX71PEfZ53
         GK1CynDUr/oYSTcEkInIlRaD1sUkOLgXmvCpD9ByowyU4tHtMcHQyNXonJGrxchrqtCp
         OG1W3RauMCx4NH9Ef7YFjh5L5tIpOBWhW3wky/NYCh5EwkbGK8QwBYmNpqz0ptMb1xTS
         jTJn3uURMnBGJZ88isYizcsEzHb6Gyd3kgkDtEEY0BO+8FJfY9X1df4hvh96gHOF9z1e
         8qIA==
X-Gm-Message-State: AOJu0YzyBr+fzR/SOQwnftYX2kabGAjOc6z81WWBnoxx+wBha2lUn9yh
	vPBGnRm2VfZmYxFdjquC4OwnmzZhHAMJLpYwACy5sKuIOFanQNeUV60jGyEtomWCD4ITlRTBnrE
	R
X-Google-Smtp-Source: AGHT+IG63QNj63g37SiP7EfxFvXpxHw5WerdYpBTDDcJ3BVjaJ9muCu1C+pPSHomHhDb5sXcNMKjWg==
X-Received: by 2002:a05:600c:3b04:b0:40e:bfba:5c0d with SMTP id m4-20020a05600c3b0400b0040ebfba5c0dmr1165714wms.171.1706084627943;
        Wed, 24 Jan 2024 00:23:47 -0800 (PST)
Date: Wed, 24 Jan 2024 09:23:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Patrick Plenefisch <simonpatp@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>, Huang Rui <ray.huang@amd.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>
Subject: Re: ACPI VFCT table too short on PVH dom0 (was: Re: E820 memory
 allocation issue on Threadripper platforms)
Message-ID: <ZbDJE-tMhnQoXkPK@macbook>
References: <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zajg1O7Z52VTBq31@macbook>
 <CAOCpoWeO9h7b_CjJb9jtKaEUVv_=XDSVkr55QSg3ArFc4n8G2w@mail.gmail.com>
 <ZajzcpArQYQhdj3T@macbook>
 <ZakcdfS3UwEb0oh2@macbook>
 <CAOCpoWdL3YnpitZxEoFgdvtZ6juy8oykYj6fX_tv4QLvj2Fv0g@mail.gmail.com>
 <ZapXoOKdhWgJFxbF@macbook>
 <CAOCpoWccvC91FiJr_MpVxXYqOfZxAn6bKkr6vQG+6p4WbxT03A@mail.gmail.com>
 <CAOCpoWf0pfp72=X9iqziP+uVkLwB0HRp3gvQhPOsHWEtFzZgVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOCpoWf0pfp72=X9iqziP+uVkLwB0HRp3gvQhPOsHWEtFzZgVA@mail.gmail.com>

On Tue, Jan 23, 2024 at 08:27:18PM -0500, Patrick Plenefisch wrote:
> On Sat, Jan 20, 2024 at 8:33 PM Patrick Plenefisch <simonpatp@gmail.com>
> wrote:
> 
> >
> >
> > On Fri, Jan 19, 2024 at 6:06 AM Roger Pau Monné <roger.pau@citrix.com>
> > wrote:
> >
> >> On Fri, Jan 19, 2024 at 02:44:35AM -0500, Patrick Plenefisch wrote:
> >> > On Thu, Jan 18, 2024 at 7:41 AM Roger Pau Monné <roger.pau@citrix.com>
> >> > wrote:
> >> >
> >> > >
> >> > > From that environment (PVH dom0) can you see if you can dump the
> >> > > contents of the VFCT table?  I don't have a system with that table, so
> >> > > not sure if this will work (because iasl is unlikely to know how to
> >> > > decode it):
> >> > >
> >> > > # acpidump -n VFCT -o table.dump
> >> > > # acpixtract -a table.dump
> >> > > # iasl -d vfct.dat
> >> > > # cat vfct.dsl
> >> > >
> >> > > Would be good if you can compare the output from what you get on a PV
> >> > > dom0 or when running native Linux.
> >> > >
> >> > > I'm also adding some AMD folks, as IIRC they did some fixes to Linux
> >> > > in order to get some AMD graphics cards running on a PVH dom0, maybe
> >> > > they can provide some additional input.
> >> > >
> >> > >
> >> > Well, this is pretty weird. I'll go into more details because it may be
> >> > relevant.
> >>
> >> Wow, you have certainly gone out of the beaten path here.
> >>
> >
> > Yeah, I wasn't expecting this many issues for being an early adopter of
> > Threaderipper 7000!
> >
> >
> >>
> >> > I had been working with ASRock support ever since I got my brand
> >> > new motherboard because I couldn't see the BIOS/UEFI screens. I could
> >> boot
> >> > up, and once native linux took control amdgpu got the screens/gpu
> >> working
> >> > fine. I finally managed to be able to see the UEFI/BIOS setup screens by
> >> > patching my VBIOS: I extracted the VBIOS image of a cheap R5 430 OEM,
> >> ran
> >> > GOPupd to update the VBIOS UEFI component (GOP) from version 1.60 to
> >> 1.67.
> >> > That allowed the UEFI to actually initialize and use a screen. However,
> >> I
> >> > later realized that only 1 monitor was lighting up in the bios: my
> >> monitor
> >> > plugged into the Radeon RX 480 that was still on VBIOS GOP 1.60. It
> >> appears
> >> > the GOP was initializing the RX 480 too, despite not being flashed with
> >> the
> >> > latest itself. I am working on an email to asrock support about that.
> >> Once
> >> > I get into linux (native or PV), both monitors light up as expected.
> >> Also,
> >> > If I boot linux PVH from grub, they also work.
> >>
> >> OK, that's good, so that would be UEFI -> grub -> Xen -> Linux PVH?
> >>
> >
> > Correct. Inserting grub into the chain "fixes" the acpi tables and things
> > work correctly.
> >
> 
> Ok, I am not sure what I did the other day to get it to work, but I can't
> replicate *any* PVH success today. One driver (radeon or amdgpu) always
> complains the VFCT table is wrong, and leads to the symptoms previously
> reported.

Are you sure you are using Xen 4.18?  Some of the Xen logs you
provided did use Xen 4.17, which doesn't have the VFCT fix.

Can you please provide the `xl dmesg` for the non-working case when
using grub2?

Thanks, Roger.

