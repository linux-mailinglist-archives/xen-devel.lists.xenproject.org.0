Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77588314A0
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 09:27:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668634.1040963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQNjt-0004b9-SS; Thu, 18 Jan 2024 08:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668634.1040963; Thu, 18 Jan 2024 08:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQNjt-0004Y3-Oo; Thu, 18 Jan 2024 08:27:05 +0000
Received: by outflank-mailman (input) for mailman id 668634;
 Thu, 18 Jan 2024 08:27:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSQR=I4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQNjr-0004Xx-Gb
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 08:27:03 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5aeb044b-b5db-11ee-98f2-6d05b1d4d9a1;
 Thu, 18 Jan 2024 09:27:02 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-337be1326e3so2337829f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 00:27:02 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 i16-20020a5d55d0000000b00337c7423b95sm1651752wrw.61.2024.01.18.00.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 00:27:01 -0800 (PST)
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
X-Inumbo-ID: 5aeb044b-b5db-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705566422; x=1706171222; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0gMk9Qli1uHFdRyVBRU4olTHzO9Mwb9pnIxJftD4iqA=;
        b=eUDbVXzS5iLf0v3cKxkerPH1vJJVp8utLSHXF0s9C5VZrb6pKUdZXYdu/1obMHGbtF
         XtriF3vpJFFOjt40eGvwoFXBxuQWEL8Nbxk9TKn2rGva6qxX0K1K4C2oTZbIV63EuMg0
         +8ZWzBZ6z73r+LDxNlp16oTDXX3wVjtAeA5cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705566422; x=1706171222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0gMk9Qli1uHFdRyVBRU4olTHzO9Mwb9pnIxJftD4iqA=;
        b=OExDBxA4LDUrtVEVTRXGLqRdNKL0nUfx5T/Ng53ACAundMFbdQSeObBxKfgw0aJKFK
         R0EH7IDYysOQMcyv3iAitpo1ASJmFLo/v2MLoL22higjL9S+Pp4e9lcpLh3jkCeDpZ/5
         ZJrzI+U6w8ZGUjS3R00HUMM0q7qSP0AvXKMttHSDGJ4hfEC4z0H1LEflYKZ3TDjKPiG5
         f4mJojqeHEEupnX79Ud1gGaEHnORhgKoX+jspTvNjEbg5g0C2RjSQoT/FVDlMrlxu3PC
         9TaUlEqYQx1v797OEk+/AIC06h8vQ2OIPvRPyfMHTb7loVENgJKTMJ2iwMFl0D2GD9Za
         XZNA==
X-Gm-Message-State: AOJu0Yz4gRNv8mGRJ7nUQTigD9/hdYCsdwHCp4eGaESW/EcgtZf2HWzK
	yfrMR+hZvkIC1UCpqzIrriRqlbMleiB6ooGhBknNUMBXLzg/q7Q+33oySoz/nyI=
X-Google-Smtp-Source: AGHT+IGrW0m7/9rEu2gDX5+IClkIgV7ilta0TEsI0ARp4BpVNToIz+pvkZB/hWX1iNsPjXMOaDCrjg==
X-Received: by 2002:adf:e946:0:b0:337:6e32:1811 with SMTP id m6-20020adfe946000000b003376e321811mr281788wrn.75.1705566421942;
        Thu, 18 Jan 2024 00:27:01 -0800 (PST)
Date: Thu, 18 Jan 2024 09:27:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Patrick Plenefisch <simonpatp@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms
Message-ID: <Zajg1O7Z52VTBq31@macbook>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>

On Thu, Jan 18, 2024 at 01:23:56AM -0500, Patrick Plenefisch wrote:
> On Wed, Jan 17, 2024 at 3:46 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
> > On 17.01.2024 07:12, Patrick Plenefisch wrote:
> > > On Tue, Jan 16, 2024 at 4:33 AM Jan Beulich <jbeulich@suse.com> wrote:
> > >
> > >> On 16.01.2024 01:22, Patrick Plenefisch wrote:
> For the two logs that actually boooted (linuxoffset), I truncated them
> during pcie initialization, but they did go all the way to give me a login
> screen

I'm not seeing any Linux output on the provided logs, they just seem
to contain Xen output ...

> >
> > > As someone who hasn't built a kernel in over a decade, should I figure
> > out
> > > how to do a kernel build with CONFIG_PHYSICAL_START=0x2000000 and report
> > > back?
> >
> > That was largely a suggestion to perhaps allow you to gain some
> > workable setup. It would be of interest to us largely for completeness.
> >
> 
> Typo aside, setting the boot to 2MiB works! It works better for PV, while
> PVH has some graphics card issues, namely that I have to interact over
> serial and dmesg has some concerning radeon errors

... and so the radeon error mentioned here seem to be missing.  IIRC
for radeon cards to work on PVH dom0 you will need an hypervisor with
the following commit:

https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=f69c5991595c92756860d038346569464c1b9ea1

(included in 4.18)

There where also some changes not long ago in order to propagate the
video console information from Xen into dom0, those are also included
in 4.18, but I don't recall in which Linux version they landed.

Anyway, would be good if you can provide the full Xen + Linux logs
when the radeon issue happens.

Regards, Roger.

