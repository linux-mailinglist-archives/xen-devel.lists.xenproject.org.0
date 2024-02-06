Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E4D84B279
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 11:28:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676780.1053063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXIg9-000206-GD; Tue, 06 Feb 2024 10:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676780.1053063; Tue, 06 Feb 2024 10:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXIg9-0001ws-DE; Tue, 06 Feb 2024 10:27:49 +0000
Received: by outflank-mailman (input) for mailman id 676780;
 Tue, 06 Feb 2024 10:27:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gRx7=JP=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rXIg7-0001vY-6o
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 10:27:47 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dc2209f-c4da-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 11:27:45 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-511612e0c57so145492e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 02:27:45 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k19-20020a05600c1c9300b0040ee51f1025sm1560842wms.43.2024.02.06.02.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 02:27:44 -0800 (PST)
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
X-Inumbo-ID: 5dc2209f-c4da-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707215264; x=1707820064; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gIJji4S2DBBQRmFrU6n0aaD7nQmednIs6SXBmScTcv0=;
        b=bNYVJTSkrJeLqyJfstkdU2qirhExiwiRXA2ATNYKLnzF0FIDu1kT8GwE7ZefJRNliZ
         eq941Rk8CJbo6wqMb/AIU4/2GKgr3Mhuf3hJ0BnDQ5qcnA9H9bdPf+ahcLfpO17Aqos7
         V1RIU+ZGlSu5RonnytPXVNPgZxB+GcEIOvd2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707215264; x=1707820064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIJji4S2DBBQRmFrU6n0aaD7nQmednIs6SXBmScTcv0=;
        b=bNHjZQI61GDccvUGYVf/crhErvEo74C53r5O0kqmryAUHDmgfi4dXt5svhZzXg1Zyu
         bfPmll9bY67R7tiCfYeuBTvsZuLEdGELq7oOAWSYZVTe1UBV7n8OPUnBYZWLD8uTGBB+
         fiSMPuE1O4Hbewu+1wWErOFy0mSpD3TuijTGlWN5E1/yzk1GCn0SG2eCx6N5tPAoWCVh
         K7gP3uA+vXv32IWcOGfu0n9roKBFvTLhaCQwjDW+DoKVz4HIOd577wyYgI3fcaolczim
         NGJXCmnxQCaXu/ENB+Q0tWw7hbal+gOOXTmKRZUPp+qiaSxLSCCor2DwM/WzQ9v5m/jL
         +qvQ==
X-Gm-Message-State: AOJu0YwD2j9D9Zjth8fUqIHpCIEKUg6cp8jrRq8/st1rVv/D/b92Caoe
	eUWna9k7lKxn0XvDelszWkO7WHgNoMtHx9UKgqX2M3eVGW75l7tCJHhXY250uJA=
X-Google-Smtp-Source: AGHT+IHwdeQVjTbM1YbFPncQovpbpjZOh7TQfQc0fQ55UWz60u0ml8AbmNV/0j4V/RmZciofC2SLlA==
X-Received: by 2002:a19:6750:0:b0:511:4e8f:e21f with SMTP id e16-20020a196750000000b005114e8fe21fmr1117265lfj.6.1707215264537;
        Tue, 06 Feb 2024 02:27:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUokOxB4uYlUEO3NTIvG48esRUrubYCuHT1IHwaJwaMa+DwoyWzEBQ03qSbwiHb2SkZK7m4lU2Zrw4BZo5apC0UEcwMWNT7ZGyRUx3tF2/4IQ2sZSqhOoo09cG4X7dUZuv3KByDuDFzByfDkO6NVwncDvD9awq5UdBGbEAwrv4hu4P+7AySsIXdiiOHD0rOl45zNu0RTlqXy4KqT9shH60S+A6WqPhbOk0=
Date: Tue, 6 Feb 2024 10:27:43 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] libxl: Add "grant_usage" parameter for virtio disk
 devices
Message-ID: <d7291530-9e32-43dc-8b82-34d3962d2551@perard>
References: <20240202104903.1112772-1-olekstysh@gmail.com>
 <ace5b3c8-38e7-4661-9401-ac9ac77a5e9f@perard>
 <78bc7890-cfcb-4de4-a676-a3c2bbbb6d9f@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78bc7890-cfcb-4de4-a676-a3c2bbbb6d9f@epam.com>

On Mon, Feb 05, 2024 at 04:52:16PM +0000, Oleksandr Tyshchenko wrote:
> On 05.02.24 17:10, Anthony PERARD wrote:
> > On Fri, Feb 02, 2024 at 12:49:03PM +0200, Oleksandr Tyshchenko wrote:
> >> +grant_usage=1,?		{ libxl_defbool_set(&DPC->disk->grant_usage, true); }
> >> +grant_usage=0,?		{ libxl_defbool_set(&DPC->disk->grant_usage, false); }
> > 
> > For other boolean type for the disk, we have "trusted/untrusted",
> > "discard/no-discard", "direct-io-save/", but you are adding
> > "grant_usage=1/grant_usage=0". Is that fine? But I guess having the new
> > option spelled "grant_usage" might be better, so it match the other
> > virtio devices and the implementation. 
> 
> 
> Yes, I noticed that how booleans are described for the disk. I decided 
> to use the same representation of this option as it was already used for 
> virtio=[...]. But I would be ok with other variants ...
> 
> 
> But maybe
> > "use-grant/no-use-grant" might be ok?
> 
>    ... like that, but preferably with leaving libxl_device_disk's field 
> named "grant_usage" (if no objection).
> 
> >> diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.in
> >> index bc945cc517..3c035456d5 100644
> >> --- a/docs/man/xl-disk-configuration.5.pod.in
> >> +++ b/docs/man/xl-disk-configuration.5.pod.in
> >> @@ -404,6 +404,31 @@ Virtio frontend driver (virtio-blk) to be used. Please note, the virtual
> >> +=item B<grant_usage=BOOLEAN>
> >>
> >> +=over 4
> >> +
> >> +=item Description
> >> +
> >> +Specifies the usage of Xen grants for accessing guest memory. Only applicable
> >> +to specification "virtio".
> >> +
> >> +=item Supported values
> >> +
> >> +If this option is B<true>, the Xen grants are always enabled.
> >> +If this option is B<false>, the Xen grants are always disabled.
> > 
> > Unfortunately, this is wrong, the implementation in the patch only
> > support two values: 1 / 0, nothing else, and trying to write "true" or
> > "false" would lead to an error. (Well actually it's "grant_usage=1" or
> > "grant_usage=0", there's nothing that cut that string at the '='.)
> 
> 
> You are right, only 1 / 0 can be set unlike for virtio=[...] which seems 
> happy with false/true.
> 
> 
> > 
> > Also, do we really need the extra verbal description of each value here?
> > Is simply having the following would be enough?
> > 
> >      =item Supported values
> > 
> >      1, 0
> > 
> > The description in "Description" section would hopefully be enough.
> 
> 
> I think, this makes sense.
> 
> So, shall I leave "grant_usage=1/grant_usage=0" or use proposed option 
> "use-grant/no-use-grant"?

Let's go with "grant_usage=*", at least this will be consistent with the
option for "virtio".

Cheers,

-- 
Anthony PERARD

