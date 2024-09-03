Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08705969EAF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 15:08:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789182.1198760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTGb-0004aF-HA; Tue, 03 Sep 2024 13:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789182.1198760; Tue, 03 Sep 2024 13:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTGb-0004XL-Dp; Tue, 03 Sep 2024 13:08:17 +0000
Received: by outflank-mailman (input) for mailman id 789182;
 Tue, 03 Sep 2024 13:08:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slTGZ-0004WV-Uj
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 13:08:15 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 936267c4-69f5-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 15:08:13 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42bb8c6e250so40594475e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 06:08:13 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c07eed5dsm9034370f8f.116.2024.09.03.06.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 06:08:11 -0700 (PDT)
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
X-Inumbo-ID: 936267c4-69f5-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725368893; x=1725973693; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wyy3ztq23VOzIB3y9iBZEdxVwVTEXVY4eTQK8pSkStU=;
        b=efUn1RyXBvJ38GXaGiEwkuSkzvIuWy3Q4TULEsOZioEiYP3YlavWqiybhPJrr6h+RE
         kmvvfEDowQaouUiNuVBBjjtqKf21lx8Y113AlEE7vwzrMuiNdAFwHv6B6MZ/QAKNyOuU
         GHMlLi/UMOPYuHg/WArOuy4dYF05w/2L6n96A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725368893; x=1725973693;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyy3ztq23VOzIB3y9iBZEdxVwVTEXVY4eTQK8pSkStU=;
        b=m1BnxM0B7YgUqxcejLC4Ja7mrqFa+GS34Z0x8nfgjf0LpGHlpH+37sXVzONYHhAnuY
         LteVL8n/x+Nf46kzsa7Zhsa+lmicXQWqn9BDQXWP7Gdz/qOrkMP6zh3T/kM8yV9WFkRc
         U4vr6YXzqG6SlR0SD8osIc5uYpwJ0K+7Vo3SPmoe845n0e7Dz4+Ht/f0ERrdvUsa9WOW
         SUTtpJPta70gTerIlFf6CAYI2ioGGnPlNCDO1KGIdImCXjZZFZxlyCiDORZYJdBA2+lk
         y0Qef22wHcU1hnYnWKyQruPZANPe8aMykvMnR2YoBQR57D0OOt4tQPJ4lpaEFZWtnHgo
         FMdg==
X-Gm-Message-State: AOJu0YxCIvo4Mu6U8n7u8E1Vyta/EdxH4wwab0Lz3z/4gJp7dAxYPA7J
	lVSRsFn1BQrZItBu4q9R2RqteSnhUyNps/o0Avh3ZRPaHKvKM9s1uA+QfTHP6ug=
X-Google-Smtp-Source: AGHT+IFmkhKimd6gPfd1TU8t7gmDaWJZgxtGc7aKMdtL4GhnLSAINWDdYiap8geVbKZEwHA6P6JWHg==
X-Received: by 2002:a05:600c:358b:b0:426:6099:6eaa with SMTP id 5b1f17b1804b1-42c82f673c7mr43825935e9.26.1725368892218;
        Tue, 03 Sep 2024 06:08:12 -0700 (PDT)
Date: Tue, 3 Sep 2024 15:08:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2] x86/boot: Fix include paths for 32bit objects
Message-ID: <ZtcKOzDReFLLBPb5@macbook.local>
References: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
 <20240903115334.3526368-1-andrew.cooper3@citrix.com>
 <ZtcEcT7E95sOi276@macbook.local>
 <586d6b5c-5095-4355-a6c8-11caf9d5dd17@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <586d6b5c-5095-4355-a6c8-11caf9d5dd17@citrix.com>

On Tue, Sep 03, 2024 at 02:01:45PM +0100, Andrew Cooper wrote:
> On 03/09/2024 1:43 pm, Roger Pau Monné wrote:
> > On Tue, Sep 03, 2024 at 12:53:34PM +0100, Andrew Cooper wrote:
> >> Most of Xen is build using -nostdinc and a fully specified include path.
> >> However, the makefile line:
> >>
> >>   $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
> >>
> >> discards XEN_CFLAGS and replaces them with CFLAGS_x86_32.
> >>
> >> Reinstate -nostdinc, and copy all -I (and -Wa,-I) arguments from XEN_CFLAGS.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > I wouldn't mind if you also open-coded the config.h -include addition
> > to CFLAGS_x86_32, regardless:
> >
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> TBH, I'm going to put it in as is and unblock the fixes behind it.
> 
> We can adjust the others in due course.

Sure, if that allows you to unblock the rest.

> Given the other shuffling of headers we've done recently, I'm starting
> to think that the -include isn't really as needed as it might once have
> been.
> 
> > I do wonder however whether the explicit assembler includes parameters
> > (-Wa,-I) are actually required, seeing as we only provide include/ to
> > the assembler, but not the arch-specific include paths.
> >
> > This is from XSA-254, which used the '.include' asm directive, but
> > that was ultimately removed by:
> >
> > 762c3890c89f x86: fold indirect_thunk_asm.h into asm-defns.h
> >
> > So maybe the -Wa,-I is no longer needed?
> 
> Perhaps, although I'm struggling to find where it's declared today.

It's in xen/arch/x86/arch.mk.

Thanks, Roger.

