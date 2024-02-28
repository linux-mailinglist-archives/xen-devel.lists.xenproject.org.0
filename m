Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D386F86B55E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 17:57:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686745.1069162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfNET-0001lc-0m; Wed, 28 Feb 2024 16:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686745.1069162; Wed, 28 Feb 2024 16:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfNES-0001ii-TO; Wed, 28 Feb 2024 16:56:36 +0000
Received: by outflank-mailman (input) for mailman id 686745;
 Wed, 28 Feb 2024 16:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqYS=KF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rfNER-0001ic-Im
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 16:56:35 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5264dfe3-d65a-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 17:56:31 +0100 (CET)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-787ef8b194dso73776185a.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 08:56:31 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 h8-20020a05620a10a800b00785da717d64sm4719424qkk.111.2024.02.28.08.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 08:56:30 -0800 (PST)
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
X-Inumbo-ID: 5264dfe3-d65a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709139391; x=1709744191; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N0xKBzokyOF7L7x5XSmIhKlw17iIgKyEqx8u4319JZU=;
        b=Q3nXSKD1xdG0jg3PlRCUjqGwHozv80w90F99EDTnRS6NCGrpjI8PTlIcY5h03Sra8U
         NfVvGimwto7UauPvff0vFX8q+5YaCXiZGg5RZJqoT9JsSwFFWZlHak5oFSAMUFDjq6EY
         TAyCp1cVFY165dUrBgil1hJXFWAwyzjAxNpl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709139391; x=1709744191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N0xKBzokyOF7L7x5XSmIhKlw17iIgKyEqx8u4319JZU=;
        b=Wkv4RHBu5+RlbKS9g63ACeiihS5L6nqneshrYihuXugns1CaXXb1voFRVWY97OoPTX
         NJCzZAayJywxcJ+OnxR4uaRPnrfnA0nGIDUYRBLdWDfViFGLXecPAPisZE3AO/aq0YPI
         nDju6ps7FcwMKq4783b+JMPDfwRilN/q2A5uD+e0ICGxpcDlDd57kIiTmo7+8L7ELSqY
         Z9FxyOYZUlhmXOSFKhNRJmkIqZpvLFMGcZW+tlTpKKy2QK5IZQBpSyt5KOfskwJNV6S+
         TxMlzU7phlg2iD4kSvj009sw6ZhnnXFhY3ptDN6bRkOJEcX07wMBPA+gWcuof/hPn01U
         vmxA==
X-Forwarded-Encrypted: i=1; AJvYcCUHJvNuO8fA99te2HfVbvEu6r7NgrLrFS2AOZghyL1OF9b0qbCprI9fM6BbbYoB/VF/WwDzw00FZ660FdGy4MvZ2AVJp1x/zF2jVgDFprI=
X-Gm-Message-State: AOJu0YyPWAY6ko24liy9LGrfyg8053qCUSF/Ty67tq962mgBs3ja5Fnn
	6l2gE1FGSMF9FQCmN7DeGS+VIbxTqH9fOdMWs4tgogb1Umuu9tYts+ghQzc1yXk=
X-Google-Smtp-Source: AGHT+IEn0V/qQECJjKpcNHMt9o6EukjJed5x4DbQ/LCrvJUbFIyxu9hpQU8SAgxSwIJFKCPCR73saA==
X-Received: by 2002:a05:620a:24d4:b0:787:edf7:b178 with SMTP id m20-20020a05620a24d400b00787edf7b178mr4669985qkn.27.1709139390715;
        Wed, 28 Feb 2024 08:56:30 -0800 (PST)
Date: Wed, 28 Feb 2024 17:56:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/altcall: always use a temporary parameter stashing
 variable
Message-ID: <Zd9lvN2tUrmEt2pg@macbook>
References: <20240228135908.13319-1-roger.pau@citrix.com>
 <11f0e1dd-01b4-4d13-8137-e86b0975ad80@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11f0e1dd-01b4-4d13-8137-e86b0975ad80@suse.com>

On Wed, Feb 28, 2024 at 03:28:25PM +0100, Jan Beulich wrote:
> On 28.02.2024 14:59, Roger Pau Monne wrote:
> > The usage in ALT_CALL_ARG() on clang of:
> > 
> > register union {
> >     typeof(arg) e;
> >     const unsigned long r;
> > } ...
> > 
> > When `arg` is the first argument to alternative_{,v}call() and
> > const_vlapic_vcpu() is used results in clang 3.5.0 complaining with:
> > 
> > arch/x86/hvm/vlapic.c:141:47: error: non-const static data member must be initialized out of line
> >          alternative_call(hvm_funcs.test_pir, const_vlapic_vcpu(vlapic), vec) )
> > 
> > Workaround this by pulling `arg1` into a local variable, like it's done for
> > further arguments (arg2, arg3...)
> > 
> > Originally arg1 wasn't pulled into a variable because for the a1_ register
> > local variable the possible clobbering as a result of operators on other
> > variables don't matter:
> > 
> > https://gcc.gnu.org/onlinedocs/gcc/Local-Register-Variables.html#Local-Register-Variables
> > 
> > Note clang version 3.8.1 seems to already be fixed and don't require the
> > workaround, but since it's harmless do it uniformly everywhere.
> > 
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Fixes: 2ce562b2a413 ('x86/altcall: use a union as register type for function parameters on clang')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I'm okay with this change, but since you don't mention anything in this
> regard: Did you look at whether / how generated code (with gcc) changes?

So the specific example of vlapic_test_irq() shows no changes to the
generated code. bloat-o-meter shows a 0 delta:

add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Function                                     old     new   delta
Total: Before=3570098, After=3570098, chg +0.00%

I assume there can be some reordering of instructions, as we now force
arg1 temporary variable (v1_) to be initialized ahead of the rest of
the arguments.

Thanks, Roger.

