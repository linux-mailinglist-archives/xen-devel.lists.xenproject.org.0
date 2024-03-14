Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E012C87C186
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 17:49:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693396.1081416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkoGJ-0006gl-Lw; Thu, 14 Mar 2024 16:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693396.1081416; Thu, 14 Mar 2024 16:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkoGJ-0006eo-J7; Thu, 14 Mar 2024 16:48:59 +0000
Received: by outflank-mailman (input) for mailman id 693396;
 Thu, 14 Mar 2024 16:48:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P774=KU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rkoGI-00063P-6s
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 16:48:58 +0000
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfbff003-e222-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 17:48:57 +0100 (CET)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-42ee2012bf0so9277301cf.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 09:48:57 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 s2-20020a05622a1a8200b0042f3098f410sm973946qtc.48.2024.03.14.09.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 09:48:55 -0700 (PDT)
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
X-Inumbo-ID: bfbff003-e222-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710434936; x=1711039736; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QhGTgxGuc/vLdL7mOaAwiaCw8lqrwm8qGBnkXKqns0I=;
        b=dymGnHUJ2txuuBK8rpm8LtIeoJOWHht2QQH5npwcLVs+eQMmgUPYCvINiUXVARYFZ6
         ZQ4uRV/02RLOx7izfNqwaAR6AkSFOC0+mxj9+ga8ARuOsywVf88zPtCkCL9P25F9M06T
         9CfjpDtgSHaBnpK5dJUW4F0EsAS9J0BqB/8d0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710434936; x=1711039736;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhGTgxGuc/vLdL7mOaAwiaCw8lqrwm8qGBnkXKqns0I=;
        b=lUk2Y4C+RV+mDGYbPyHffH+MgwyfqUx/mstQeEttI8LQVEyY7plbVU3Lu0cWqk7y1z
         JgoClL8hNy77l8+FYeNzbFVt0o1wObug5sM/aFhpldK5zYsJejHbPdPcQU6CztZDrFva
         eaK6+xlmzKXVW1V/jWG8ar+RFnH9+Y1tWXGzd85Z9c8C32M9k5TMqms8ezSnuNH6WsJi
         SopmPisaLtGeL+JIQwGVQIMLoVHaQxzSukT7VMkuob2hiNHeu1b4WvqDjgXYfYO3sW1M
         cO+dHgglD2q79mBEXJ97vd7exnXMLeKLNUgJpSh8EBuHPUGuYmjIna5UAMF9yYfwxxt7
         ayuA==
X-Gm-Message-State: AOJu0YwJK737YCFkaeSSap8fe4cG5JtRQArXlSRwNuUsr5ClZqW8oJBf
	bS0FVkQhFuDjnk8MOKuNn+Taq8tp3cgBHBDDGXyG5OQS8ZcgYw73ypgzmvbLhp4=
X-Google-Smtp-Source: AGHT+IGYt+PP1Ggwp+R99Iysek8feMjPiPu4EcUHmK1JGRSpH5ltzDmKJOztUNPzMHEdBJ/bPaRwKw==
X-Received: by 2002:ac8:590f:0:b0:42e:f55f:3922 with SMTP id 15-20020ac8590f000000b0042ef55f3922mr3599046qty.26.1710434936278;
        Thu, 14 Mar 2024 09:48:56 -0700 (PDT)
Date: Thu, 14 Mar 2024 17:48:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Message-ID: <ZfMqdUS2Rfv7iooq@macbook>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
 <ZfLIBHTbcbGqFAhY@macbook>
 <afb3aa21-cd8b-425d-a4fa-b9ca57367d28@amd.com>
 <ZfMKuUqopaj-Gubu@macbook>
 <a531578e-ade0-45bb-b916-e195e51e97cf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a531578e-ade0-45bb-b916-e195e51e97cf@suse.com>

On Thu, Mar 14, 2024 at 04:30:05PM +0100, Jan Beulich wrote:
> On 14.03.2024 15:33, Roger Pau Monné wrote:
> > On Thu, Mar 14, 2024 at 09:51:22AM -0400, Jason Andryuk wrote:
> >> On 2024-03-14 05:48, Roger Pau Monné wrote:
> >>> On Wed, Mar 13, 2024 at 03:30:21PM -0400, Jason Andryuk wrote:
> >>>> @@ -234,6 +235,17 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
> >>>>                   elf_note_numeric_array(elf, note, 8, 0),
> >>>>                   elf_note_numeric_array(elf, note, 8, 1));
> >>>>           break;
> >>>> +
> >>>> +    case XEN_ELFNOTE_PVH_RELOCATION:
> >>>> +        if ( elf_uval(elf, note, descsz) != 3 * sizeof(uint64_t) )
> >>>> +            return -1;
> >>>> +
> >>>> +        parms->phys_min = elf_note_numeric_array(elf, note, 8, 0);
> >>>> +        parms->phys_max = elf_note_numeric_array(elf, note, 8, 1);
> >>>> +        parms->phys_align = elf_note_numeric_array(elf, note, 8, 2);
> >>>
> >>> Size for those needs to be 4 (32bits) as the entry point is in 32bit
> >>> mode?  I don't see how we can start past the 4GB boundary.
> >>
> >> I specified the note as 3x 64bit values.  It seemed simpler than trying to
> >> support both 32bit and 64bit depending on the kernel arch.  Also, just using
> >> 64bit provides room in case it is needed in the future.
> > 
> > Why do you say depending on the kernel arch?
> > 
> > PVH doesn't know the bitness of the kernel, as the kernel entry point
> > is always started in protected 32bit mode.  We should just support
> > 32bit values, regardless of the kernel bitness, because that's the
> > only range that's suitable in order to jump into the entry point.
> > 
> > Note how XEN_ELFNOTE_PHYS32_ENTRY is also unconditionally a 32bit
> > integer.
> > 
> >> Do you want the note to be changed to 3x 32bit values?
> > 
> > Unless anyone objects, yes, that's would be my preference.
> 
> As mentioned elsewhere, unless the entire note is meant to be x86-specific,
> this fixed-32-bit property then would want limiting to x86.

Elfnotes are used only on x86 so far.  I don't see why if/when another
architecture wants to use the same elfnotes names with different field
sizes that would be an issue.  When such a need arises we could
clarify that 32-bit size is only for x86 and also specify the size for
the other architecture.

Thanks, Roger.

