Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FCB969E02
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 14:44:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789117.1198627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slSsh-00014k-03; Tue, 03 Sep 2024 12:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789117.1198627; Tue, 03 Sep 2024 12:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slSsg-00012s-SL; Tue, 03 Sep 2024 12:43:34 +0000
Received: by outflank-mailman (input) for mailman id 789117;
 Tue, 03 Sep 2024 12:43:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slSsf-00012m-7k
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 12:43:33 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ff0548d-69f2-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 14:43:31 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42bb81e795bso43319965e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 05:43:31 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c88c624f7sm28396065e9.39.2024.09.03.05.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:43:29 -0700 (PDT)
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
X-Inumbo-ID: 1ff0548d-69f2-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725367410; x=1725972210; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AW7kzey51ARYVDcGuTgDsat0tG18yOnoWTZ9UxMdR6g=;
        b=Xp4E5KrffMx7c9tfDORgu8zke1Jrag/kQAKJlBX0+gd/zotc1Fl6fp0zuIpfjjCzXX
         k+cTAyc7IBWZC8VzIP/dDWabUsScXsFB37kqD+9D4QcKY+/537SDTWGOTXTJplDznU2l
         GYanT7hyvMnZFzUxxWs7a1iF8XzB0LwiZL7c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725367410; x=1725972210;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AW7kzey51ARYVDcGuTgDsat0tG18yOnoWTZ9UxMdR6g=;
        b=DwMmLEUbYlxlRu8cMaKe2CKJHq5x5Zt41f0aLk60WzBmmsFdtFUgBTqWDIwJuNjWgJ
         /4AOnfkZyFh68BUSwvKF6nWQTuzWK4q7C4cpzfXNCUFcbMYuJQdEFxkuVb/o16rzBjMq
         Ys61fkCqIO6mPxxDHwSyGl3JqI4xcLuQLB5oOKQiG93i1aV8KJA/Gwdojt3yjxeAAj7E
         wcNSLCSxsSIvQ0lnrfUA9/Z5orEj2jBwq5ZBLgL8WeamgTb2G4WZ40vKdXtfJkxNWJBk
         PbCR2iZyGfTP1AySZvqGcO+xjweDNf1rwPLGUFHl1DibMxA0XIM9QC1ygcrjn4nNfQdV
         7x3A==
X-Gm-Message-State: AOJu0YyySVRMFxn6HNliGx5wNg6wClC3hP5E60yp2soiwHC+CWPFhCK9
	lljbjCPKkJ9Ze2cWpPP6Vot+mEb9yoUNj7amapzFpdtbPaw56d+WWt7D4vlH4G0=
X-Google-Smtp-Source: AGHT+IHzQHezRJsNS2kJ0agyU/hu2AJZGPSp7RlIhVmq8xi1SMrVogc6PI9VyyU5hbqbVgECKifVyg==
X-Received: by 2002:a05:600c:3c9b:b0:425:69b7:3361 with SMTP id 5b1f17b1804b1-42bbb2167c8mr104517235e9.18.1725367410032;
        Tue, 03 Sep 2024 05:43:30 -0700 (PDT)
Date: Tue, 3 Sep 2024 14:43:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2] x86/boot: Fix include paths for 32bit objects
Message-ID: <ZtcEcT7E95sOi276@macbook.local>
References: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
 <20240903115334.3526368-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903115334.3526368-1-andrew.cooper3@citrix.com>

On Tue, Sep 03, 2024 at 12:53:34PM +0100, Andrew Cooper wrote:
> Most of Xen is build using -nostdinc and a fully specified include path.
> However, the makefile line:
> 
>   $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
> 
> discards XEN_CFLAGS and replaces them with CFLAGS_x86_32.
> 
> Reinstate -nostdinc, and copy all -I (and -Wa,-I) arguments from XEN_CFLAGS.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I wouldn't mind if you also open-coded the config.h -include addition
to CFLAGS_x86_32, regardless:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I do wonder however whether the explicit assembler includes parameters
(-Wa,-I) are actually required, seeing as we only provide include/ to
the assembler, but not the arch-specific include paths.

This is from XSA-254, which used the '.include' asm directive, but
that was ultimately removed by:

762c3890c89f x86: fold indirect_thunk_asm.h into asm-defns.h

So maybe the -Wa,-I is no longer needed?

Thanks, Roger.

