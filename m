Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A122857AAD
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 11:52:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682131.1061182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ravp4-0007Hd-Ie; Fri, 16 Feb 2024 10:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682131.1061182; Fri, 16 Feb 2024 10:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ravp4-0007En-FE; Fri, 16 Feb 2024 10:52:02 +0000
Received: by outflank-mailman (input) for mailman id 682131;
 Fri, 16 Feb 2024 10:52:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dcAy=JZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ravp3-0007Ef-Hv
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 10:52:01 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68da02fc-ccb9-11ee-98f5-efadbce2ee36;
 Fri, 16 Feb 2024 11:51:59 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-51296ca7f78so449437e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 02:51:59 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 k12-20020ac8074c000000b0042ddde7c415sm489238qth.9.2024.02.16.02.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 02:51:58 -0800 (PST)
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
X-Inumbo-ID: 68da02fc-ccb9-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708080719; x=1708685519; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8n0bPwYe8enx2Q8FWNVK8TZWaqPo1Pct3EbywqUPyps=;
        b=RgQrsGNsSW/KPRXd7AWYyjB3izHN0+SL6AVr4SzegD5goB1b0F6RpCTtGz6Xh40qwZ
         L56A4/JUo/Wh4mtbJmHKZgLf9H/+zTGrUrYc5voaV+97+sBoY/P9lZjQcBhQ96ZG+NOK
         mSe/tYNlzC4gih9EwK6UtMUsNRzMYDdnwCwps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708080719; x=1708685519;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8n0bPwYe8enx2Q8FWNVK8TZWaqPo1Pct3EbywqUPyps=;
        b=D3WnUFRiKzk87mljcKT8eXQI4K/N8UUxYInsiD7N4119EvmNK9AqotP5bKkUt55fvq
         VEFD4jhXB9W0Utg2uvGuOpe8ajWBNv/Dm5XXhpFiDRp5Z9enp+kGTmapHgtNaukjdlrX
         u5MZrPHm582maBdraD1dUJCyruAGlVR4TY6PFHfL+7zSsbdm27C806DjISGN/O/rKM59
         n11yxsuFA5qOyTlTJsRiZ8KnhBFlW2AXWEtLGSkDY59hV/nwOqwrVszxdWyPzUHe+oeF
         EJCWxD/+qClqvr5hnKMlfjn12XNBNaXW7F3bhA/QXXcX3tbU/+NUiNim/EQnQxae+DqG
         psVA==
X-Forwarded-Encrypted: i=1; AJvYcCWDsiwN4wDG49tReAHlPhatz6+feyD3SLHkYGbtkMIhWuCl1Cs0ggtlUxe0uHPpHsuBuj7gYcCI1SObvaaxcKzHqEC6JIN15WERvtwuhKg=
X-Gm-Message-State: AOJu0YzO0Rj9zpC+Z6xiXveq4N0THH7YaWzD2MsIX/Pq/nSRCPmEbDHg
	IuTefCAgnTELc1Sp2lsuPXBJA1Jn+WfD8C+7ZglxGSJHOOhAFDjysyl/OkX2PjY=
X-Google-Smtp-Source: AGHT+IH4UMmHIlo0Wqq5kJ2+wcYvCon1+GHSAEukwTVFy0gv8BBTYGzAhWz+6Gf5ca8vxM1jNgJzDg==
X-Received: by 2002:a05:6512:b88:b0:512:8de1:2714 with SMTP id b8-20020a0565120b8800b005128de12714mr2306610lfv.24.1708080719062;
        Fri, 16 Feb 2024 02:51:59 -0800 (PST)
Date: Fri, 16 Feb 2024 11:51:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] build/xen: fail to rebuild if Kconfig fails
Message-ID: <Zc8-TNOMG7ljNCj1@macbook>
References: <20240215093002.23527-1-roger.pau@citrix.com>
 <a2edb04f-c343-4baf-9f15-d96c4d014f05@suse.com>
 <Zc3nXpUOlnIHEfsl@macbook>
 <54678829-4bcf-4d83-8134-1ab386f299b6@suse.com>
 <Zc3v20RKMssbaDsl@macbook>
 <a48cbad6-701d-4077-9044-4205b932a7f3@suse.com>
 <Zc428VMDoYnPw1zo@macbook>
 <d545cc6c-d213-43da-af31-1768af32aba0@suse.com>
 <Zc5Io3dkAlGSt3on@macbook>
 <2fe68b26-87c3-43bf-ba11-f261c81c6373@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fe68b26-87c3-43bf-ba11-f261c81c6373@suse.com>

On Fri, Feb 16, 2024 at 11:04:46AM +0100, Jan Beulich wrote:
> On 15.02.2024 18:23, Roger Pau Monné wrote:
> > On Thu, Feb 15, 2024 at 05:22:00PM +0100, Jan Beulich wrote:
> >> On 15.02.2024 17:08, Roger Pau Monné wrote:
> >>> On Thu, Feb 15, 2024 at 02:02:41PM +0100, Jan Beulich wrote:
> >>>> --- a/xen/Rules.mk
> >>>> +++ b/xen/Rules.mk
> >>>> @@ -15,7 +15,11 @@ srcdir := $(srctree)/$(src)
> >>>>  PHONY := __build
> >>>>  __build:
> >>>>  
> >>>> --include $(objtree)/include/config/auto.conf
> >>>> +ifneq ($(obj),tools)
> >>>> +ifneq ($(obj),tools/kconfig)
> >>>> +include $(objtree)/include/config/auto.conf
> >>>> +endif
> >>>> +endif
> >>>
> >>> Trying to understand this, I assume it's to avoid an infinite
> >>> dependency loop that generating include/config/auto.conf requires some
> >>> tools that are build using xen/Rules.mk?
> >>
> >> The file has dependencies only in xen/Makefile. This is about the
> >> file simply not being there when initially building. Perhaps the
> >> patch description helps that I've written in the meantime:
> >>
> >> "Because of using "-include", failure to (re)build auto.conf (with
> >>  auto.conf.cmd produced as a secondary target) won't stop make from
> >>  continuing the build. Arrange for it being possible to drop the - from
> >>  Rules.mk, requiring that the include be skipped for tools-only targets.
> > 
> > Wouldn't it be more reliable if we skipped the include for any paths
> > in $(obj) that start with 'tools', rather than hardcoding 'tools' and
> > 'tools/kconfig'?
> 
> I was first meaning to do so, but the expression would end up more
> complex than I'd like (for it needing to be an exact match of "tools"
> and a prefix match of "tools/"). Thinking of it,
> 
> ifneq ($(obj),tools)
> ifneq ($(patsubst tools/%,$(obj)),)
> 
> might do (and not be as complex as I first thought, when intending to
> put all in a single "if").

Would something like the rune below work?

ifneq ($(word 1, $(subst /, ,$(obj))),tools)

That should allow to have a single condition, and should match both
'tools' and 'tools/*'

Thanks, Roger.

