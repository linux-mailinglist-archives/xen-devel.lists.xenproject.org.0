Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BC8766BFD
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 13:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571436.895278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPLuw-0004qo-1I; Fri, 28 Jul 2023 11:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571436.895278; Fri, 28 Jul 2023 11:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPLuv-0004nw-UL; Fri, 28 Jul 2023 11:45:57 +0000
Received: by outflank-mailman (input) for mailman id 571436;
 Fri, 28 Jul 2023 11:45:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gb0=DO=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qPLuu-0004nq-K1
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 11:45:56 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fd1960c-2d3c-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 13:45:55 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe0e23a4b1so3478538e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 04:45:55 -0700 (PDT)
Received: from EMEAENGAAD19049. ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a7bc451000000b003fc17e8a1efsm6700834wmi.45.2023.07.28.04.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 04:45:54 -0700 (PDT)
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
X-Inumbo-ID: 4fd1960c-2d3c-11ee-b24d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690544755; x=1691149555;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fRhkSPt9qHiPgYCQ1t3y4EbA5p/iqPHwLpK8iS+NFhw=;
        b=c904X/u4C3i/J0t8RHh0JGgQQ0rlgrGjXSd7RFQgpArsleRTYCJxcEAplsQ1zjyjsT
         PjKTMY2lw7xU1yp0S2S8gKmn7UjJjac6KWEP+cKs+8ZkTE3CAgNk9idI+2mbMG2qj79M
         fStqgdnNyQnf5ItzcdKvjpzoeOdOO8j6kvazo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690544755; x=1691149555;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRhkSPt9qHiPgYCQ1t3y4EbA5p/iqPHwLpK8iS+NFhw=;
        b=G7c/tLFOwjAaCf1y7vZv4LDJ7aOSJkSNlSnehOKY2D6foWC87ocpDXosZIn7aIoCu4
         8K3IJM47NL1zIQdfz8h4h0aKQzfQev3aOgqD0hprq/5i+8N5z+ObLk8/iRHGpCT4+IDj
         2BKBt0ffC2uUZpVda3i3OZ9/0/0t3Vdtl4TfRl9TcJKiwCHBkzVfyGRUs2CwaGrCSk3h
         z7lcMpXe+34EjXILSy5UoXD529bDmE7a4UNyZve4KAClypNSEkbUiA+Vn0NHxNdrCmD/
         FqeTbUVgDnZgdVYNMvGo5yWDzd+H+voWVTxqnz4kprmxYMj7/kZqrgay+sLgXXh0yyoj
         UD1Q==
X-Gm-Message-State: ABy/qLafflbW0yLr1Og6ShU/fshlKbbyCHXVgiKNKTptpureEgH/T+tQ
	Br2OPx4qVUbeadXJtztOck78hA==
X-Google-Smtp-Source: APBJJlFu5CYyX94g0/93Uwds26/Ul2qwddVw7oSE33NERPqjn76D3S5XW53h1ILrIj65T14QjBiQHQ==
X-Received: by 2002:a05:6512:2034:b0:4fe:e8f:e216 with SMTP id s20-20020a056512203400b004fe0e8fe216mr1376382lfs.39.1690544755077;
        Fri, 28 Jul 2023 04:45:55 -0700 (PDT)
Message-ID: <64c3aa72.7b0a0220.ec31.f864@mx.google.com>
X-Google-Original-Message-ID: <ZMOqaF666Ov3TtnQ@EMEAENGAAD19049.>
Date: Fri, 28 Jul 2023 12:45:44 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 1/3] x86/microcode: Ignore microcode loading interface
 for revision = -1
References: <20230724165235.25262-1-alejandro.vallejo@cloud.com>
 <20230724165235.25262-2-alejandro.vallejo@cloud.com>
 <4a31893d-a784-ed33-bd47-5db85b3c02b6@suse.com>
 <64bfc52e.050a0220.14646.cb0d@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64bfc52e.050a0220.14646.cb0d@mx.google.com>

On Tue, Jul 25, 2023 at 01:50:52PM +0100, Alejandro Vallejo wrote:
> On Tue, Jul 25, 2023 at 08:40:31AM +0200, Jan Beulich wrote:
> > > --- a/xen/arch/x86/cpu/microcode/core.c
> > > +++ b/xen/arch/x86/cpu/microcode/core.c
> > > @@ -867,10 +867,23 @@ int __init early_microcode_init(unsigned long *module_map,
> > >          return -ENODEV;
> > >      }
> > >  
> > > -    microcode_grab_module(module_map, mbi);
> > > -
> > >      ucode_ops.collect_cpu_info();
> > >  
> > > +    /*
> > > +     * Some hypervisors deliberately report a microcode revision of -1 to
> > > +     * mean that they will not accept microcode updates. We take the hint
> > > +     * and ignore the microcode interface in that case.
> > > +     */
> > > +    if ( this_cpu(cpu_sig).rev == ~0 )
> > > +    {
> > > +        printk(XENLOG_INFO "Microcode loading disabled due to: %s",
> > 
> [snip]
>
> > As it stands this message
> > will be invisible by default.
> Arguably, that's not necessarily a bad thing. The fact that microcode
> cannot be updated is expected behaviour and it makes little sense to warn
> about it. If only because they should already be aware of it through their
> agreement with their provider.
> 
> The case I can think of where a warning would be sensible is where the
> system has a microcode blob more recent than the currently installed
> revision. This is something the admin may want to be aware of in order to
> pester their provider for updates. In the common case the machine won't
> even need such an update, so sending unconditional warnings per boot seems
> unwarranted.

Actually, the previous message probably ought to be an INFO too. It's an
unconditional warning on old AMD and anything non AMD/Intel for no good
reason.

Alejandro

