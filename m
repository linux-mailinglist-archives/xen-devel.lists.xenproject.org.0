Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98DA8AA961
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 09:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708828.1107991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxitS-0001zx-S5; Fri, 19 Apr 2024 07:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708828.1107991; Fri, 19 Apr 2024 07:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxitS-0001xY-Ov; Fri, 19 Apr 2024 07:42:46 +0000
Received: by outflank-mailman (input) for mailman id 708828;
 Fri, 19 Apr 2024 07:42:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3Bi=LY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rxitQ-0001xM-Ji
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 07:42:44 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67e269a4-fe20-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 09:42:43 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-78f05e56cb3so102038185a.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 00:42:43 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 w16-20020a0cef90000000b006a05e9bb2easm512986qvr.99.2024.04.19.00.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 00:42:41 -0700 (PDT)
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
X-Inumbo-ID: 67e269a4-fe20-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713512562; x=1714117362; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEsGsx9fMsbnNOaT+N4X8FkDI8MNH8fKSqLnYKVxFPQ=;
        b=Tnn2kxVxeMy2lDnQMA7LEl19fRj74xuy3eVZrRPJj2P8EHaGSDXeC3kA71TGIRLfIL
         brV+EtibVzuU2yUOonEn6DtRS0MgA0Ui9dIyS4RbcbSnyNcsasVoAHfhTsiMpSrYrOec
         JWKiV/0243xUeftsnZjwC43MGeXITPbunXyrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713512562; x=1714117362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEsGsx9fMsbnNOaT+N4X8FkDI8MNH8fKSqLnYKVxFPQ=;
        b=cn8cQ+PMWGPTd4QNZQDh/t2sOcaV4febqd2L01f+QndmOmiTV8XAQqfmuZo0xN/QDj
         cMCAJ3gfECTATHUUavG4o79a2wp6So0Avf+RdQJVkj6f+ji9pqecKtNBVM+D9RmOnK1l
         v9lxkVO2LiBMa6Rbc1Gl65IUfVdvzhKVL9fy8t3DwHWATg8tvTNkUMiumyNtNB7tb3bL
         csIvlQLjsAthOK5/TwFCPr2pv5Bi8gfpuleb/vgBSTdIN3VPt4I42+QgfWT8pL4kHAFD
         gN9CR92Qr9NS3QycVMInkT87QlhkodxPb86qmIIPoP1jX8V7XufHlNlzNePUGfEZyKEO
         HQDA==
X-Forwarded-Encrypted: i=1; AJvYcCVlEEVkkcrl47cA6fscYTdMhw/U1l/pcYKw7Os/Yn1AoAQWE/X3OxXaG6ZCm+fovhe3D3Ewc4LIYplLmrunMgNlEmnlK+2JzhZzTqbmKTM=
X-Gm-Message-State: AOJu0YwLy8UbIxuiu3cLdrWhx3MhmnX4mH2DoXc0/VWgyui+eyOic2Ls
	Le76GgvGDQ1yxOvsAi0D6Uq+pJrO4U813whgAC36bHJD0Mv9zz/SqO6EL1rIlaU=
X-Google-Smtp-Source: AGHT+IEH1rXaMIMqy+r+qTL89bxoYqT8HHktCWvtykKYyFbfufsO5kbVfR0AzBiHVZnVBHLSnAiCuQ==
X-Received: by 2002:a0c:8bd9:0:b0:69b:2066:fc58 with SMTP id a25-20020a0c8bd9000000b0069b2066fc58mr1298893qvc.57.1713512562442;
        Fri, 19 Apr 2024 00:42:42 -0700 (PDT)
Date: Fri, 19 Apr 2024 09:42:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/video: do not assume a video mode to be
 unconditionally present
Message-ID: <ZiIgb4Wnv-GCOoyx@macbook>
References: <20240328153523.4155-1-roger.pau@citrix.com>
 <20240328153523.4155-3-roger.pau@citrix.com>
 <87601c5e-2ee3-4d3f-b4eb-0f509bcf1c2b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87601c5e-2ee3-4d3f-b4eb-0f509bcf1c2b@suse.com>

On Tue, Apr 02, 2024 at 11:49:20AM +0200, Jan Beulich wrote:
> On 28.03.2024 16:35, Roger Pau Monne wrote:
> > There's no reason to assume VGA text mode 3 to be unconditionally available.
> > With the addition of booting Xen itself in PVH mode there's a boot path that
> > explicitly short-circuits all the real-mode logic, including the VGA detection.
> > 
> > Leave the default user selected mode as text mode 3 in boot_vid_mode, but do
> > not populate boot_vid_info with any default settings.  It will either be
> > populated by the real-mode video detection code, or left zeroed in case
> > real-mode code is skipped.
> > 
> > Note that only PVH skips the real-mode portion of the boot trampoline,
> > otherwise the only way to skip it is to set `no-real-mode` on the command line,
> > and the description for the option already notes that VGA would be disabled as
> > a result of skipping real-mode bootstrap.
> > 
> > This fixes Xen incorrectly reporting:
> > 
> > (XEN) Video information:
> > (XEN)  VGA is text mode 80x25, font 8x16
> > 
> > When booted as a PVH guest.
> 
> And what effect does this have on a bare-metal boot with no-real-mode in use?
> The default on x86 hardware still is that in the absence of other information,
> a VGA of some kind can be assumed to be there. Yes, there are headless
> systems, but better assume VGA is there when there's not than the other way
> around.

But that contradicts the text of the 'no-real-mode' option, which
explicitly notes:

"Do not execute real-mode bootstrap code when booting Xen. This option
should not be used except for debugging. It will effectively disable
the vga option, which relies on real mode to set the video mode."

> What I would have expected is for the PVH boot path to clear boot_vid_info.

Well, my intention was to fix both PVH and also make the
implementation of the 'no-real-mode' option consistent with the
documentation.

Thanks, Roger.

