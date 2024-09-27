Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D6A988179
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 11:42:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806162.1217494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7To-0003q8-6k; Fri, 27 Sep 2024 09:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806162.1217494; Fri, 27 Sep 2024 09:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7To-0003ng-42; Fri, 27 Sep 2024 09:41:40 +0000
Received: by outflank-mailman (input) for mailman id 806162;
 Fri, 27 Sep 2024 09:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYFD=QZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1su7Tm-0003na-QG
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 09:41:38 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afee61d9-7cb4-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 11:41:36 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso5452738a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 02:41:36 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c5dfbsm111049366b.60.2024.09.27.02.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 02:41:35 -0700 (PDT)
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
X-Inumbo-ID: afee61d9-7cb4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727430095; x=1728034895; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E0kfQYTjisM8gIN8+2YLlNsi7lz+cHo+opNvBoyGH2w=;
        b=Zgmi+08QOTNRExCS0TO7gQlaSP1s1bvRTrY/ayy+3IiqryuGfqe+ear8iwcS7RSRop
         1jSZ8vEcu/LRhNxKj2J5weeXh/JJ2MALhRgi9Mgng6hUGVKFTNeLz3UfPqtEcDF4u5ti
         lEuyLpgpnacmMLc8N54Erc3McuYeHFfT3uukk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727430095; x=1728034895;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E0kfQYTjisM8gIN8+2YLlNsi7lz+cHo+opNvBoyGH2w=;
        b=B7+kzmyCk1dZW8J90B7scYG9GaQssyfYkJLQApggQ6I6Wxd6xfkLsq2UCmiTwrVRHE
         4xmSXCwXa35H0rVvZDBPG0DM3T7SaToNbs0rwzWrqn1xmbim4dbQDTLUz+8MzbhMsgfJ
         9+r54lNk5nr0qf1GZnJ8PiJ3wzGHMkv9mjLTUUqI3L+OE06vEJUVwBku2d+Bu/CAA9U1
         /1oEvCjTB3cwNVxiQK3yW3idfG5qY7O/O4Vpn46hU2jwGZ1Zh+DvtzM3nxKFr+cXPEbF
         z31FTz5IcQ4nB9B2PUBwaPtA37vQCWxKTcrwFbyVNVFJlCE2vNunQzt3zcSpBa6syXSY
         so7Q==
X-Gm-Message-State: AOJu0Yy116pU6x1qBPqcGdEXVFwpXykUp+I+/8lNaxhtfCpiiCWo/Zp6
	FfmQ4gGCr6opxKcB9nG1fiUdrUX7v0gpZ60+T06A1JhR/KyxwWWq8ct7/IvsC5Q=
X-Google-Smtp-Source: AGHT+IEpClgcVY8WXzxTZW4hGm+ZM+fRKLS/dE+p/6hCFMyK59U3J/nts4yBsIgkIpOBj1T+FOb+Lg==
X-Received: by 2002:a17:906:794e:b0:a91:161d:7e7a with SMTP id a640c23a62f3a-a93c3094420mr332554366b.3.1727430095484;
        Fri, 27 Sep 2024 02:41:35 -0700 (PDT)
Date: Fri, 27 Sep 2024 11:41:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: oleksii.kurochko@gmail.com
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 1/6] xen: introduce SIMPLE_DECL_SECTION
Message-ID: <ZvZ9zkCme0r8bqmC@macbook.local>
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
 <413dfb16280c3ec541df8775d31902a4b12a64fe.1727365854.git.oleksii.kurochko@gmail.com>
 <ZvZlqy4Y57ewtcq9@macbook.local>
 <05958c4be241866a5698a1396416b2d6317acc17.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05958c4be241866a5698a1396416b2d6317acc17.camel@gmail.com>

On Fri, Sep 27, 2024 at 11:07:58AM +0200, oleksii.kurochko@gmail.com wrote:
> On Fri, 2024-09-27 at 09:58 +0200, Roger Pau Monné wrote:
> > On Thu, Sep 26, 2024 at 06:54:20PM +0200, Oleksii Kurochko wrote:
> > > Introduce SIMPLE_DECL_SECTION to cover the case when
> > > an architecture wants to declare a section without specifying
> > > of load address for the section.
> > > 
> > > Update x86/xen.lds.S to use SIMPLE_DECL_SECTION.
> > 
> > No strong opinion, but I feel SIMPLE is not very descriptive.  It
> > might be better to do it the other way around: introduce a define for
> > when the DECL_SECTION macro should specify a load address:
> > DECL_SECTION_WITH_LADDR for example.
> In the next patch, two sections are introduced: dt_dev_info and
> acpi_dev_info. The definition of these sections has been made common
> and moved to xen.lds.h, and it looks like this:
>    +#define DT_DEV_INFO(secname)    \
>    +  . = ALIGN(POINTER_ALIGN);     \
>    +  DECL_SECTION(secname) {       \
>    +       _sdevice = .;           \
>    +       *(secname)              \
>    +       _edevice = .;           \
>    +  } :text
> (A similar approach is used for ACPI, please refer to the next patch in
> this series.)
> 
> For PPC, DECL_SECTION should specify a load address, whereas for Arm
> and RISC-V, it should not.
> 
> With this generalization, the name of DECL_SECTION should have the same
> name in both cases, whether a load address needs to be specified or not

Oh, sorry, I think you misunderstood my suggestion.

I'm not suggesting to introduce a new macro named
DECL_SECTION_WITH_LADDR(), but rather to use DECL_SECTION_WITH_LADDR
instead of SIMPLE_DECL_SECTION in order to signal whether
DECL_SECTION() should specify a load address or not, iow:

#ifdef DECL_SECTION_WITH_LADDR
# define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
#else
# define DECL_SECTION(x) x :
#endif

Thanks, Roger.

