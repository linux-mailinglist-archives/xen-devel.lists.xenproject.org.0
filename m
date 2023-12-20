Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D94819B5B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:26:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657509.1026394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsq3-00071F-UC; Wed, 20 Dec 2023 09:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657509.1026394; Wed, 20 Dec 2023 09:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsq3-0006yg-Qu; Wed, 20 Dec 2023 09:26:03 +0000
Received: by outflank-mailman (input) for mailman id 657509;
 Wed, 20 Dec 2023 09:26:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFsq2-0006k1-B6
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:26:02 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8e7aaab-9f19-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 10:25:59 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3366827ca79so2905359f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 01:25:59 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 w1-20020adfcd01000000b0033651e6a74dsm962178wrm.27.2023.12.20.01.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 01:25:58 -0800 (PST)
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
X-Inumbo-ID: c8e7aaab-9f19-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703064358; x=1703669158; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/n9fVzun9HV4qvz9ociuNgnncThnUDGYOkmdgR5Mi9A=;
        b=KX8VIIhI5So8HVrZwDCHstmLRh9+OEsN1nj09FQv8IfCQvh9Htd+/yk8fHf1IdPGm+
         yykTwJdMXnnrS5up21GnatVzJtq8GsW5FodkH4ffnsU6vuglGwOFsQkCmQrrj/DnY18U
         onMIvfvTYvy2UG1SGhmhK5Ne1ase4GD4BbkfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703064358; x=1703669158;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/n9fVzun9HV4qvz9ociuNgnncThnUDGYOkmdgR5Mi9A=;
        b=gilYXFFOuQtJmrkRrCPhH1I0svTYr8yRFCMZd4lJYsttP323sGUosxq1gp9StIzN4b
         D/E5aD8N31pgbLLnCv8QCXbGBRgYGVHdfm8lf6u898LzOTcWiTR7Tc75uQ80yF2aisqX
         BgDOEMK8l1eYw+0q1Lihz7QmZp04DadGI4f0FNF6kgmUPyO+21XxxGOD1aDRJlbsXu5Y
         D/Zo6I+oIp1xatGeq/0Xx4tqiMcVguRM5/WoBvh99uCw9XYG68xmvC/q7tczGfx4+fiF
         8IbWyieKPU+TrfbZfa8BKfsqjbrhVJ1RVdaouev5omuFxYAsQbmRn1cjsBj+Hl854923
         S3vw==
X-Gm-Message-State: AOJu0YxaJRsZD983NHGEnnisU4gbQvQ9kcwVQMGra1bNgu6M//aMl6yU
	VgYNfoHKXUM148KQfOyDpm/x4g==
X-Google-Smtp-Source: AGHT+IE+v2Cr3irVtSnRxZdkNy09PArWCn+qlzKXIA95UN/PSowkdNe09nT/FvJ1F9Lx2//QsOFptQ==
X-Received: by 2002:adf:f00a:0:b0:336:4216:d998 with SMTP id j10-20020adff00a000000b003364216d998mr5887010wro.23.1703064358451;
        Wed, 20 Dec 2023 01:25:58 -0800 (PST)
Date: Wed, 20 Dec 2023 10:25:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 2/4] xen/x86: introduce self modifying code test
Message-ID: <ZYKzJeiOLOW5mcF_@macbook>
References: <20231215111842.8009-1-roger.pau@citrix.com>
 <20231215111842.8009-3-roger.pau@citrix.com>
 <32d6d42f-2736-42ed-bad3-a6bdaedf588c@citrix.com>
 <ZYKvFUICQ4pKwH0S@macbook>
 <91390df2-57f7-41b7-a1cc-a050d89e5219@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91390df2-57f7-41b7-a1cc-a050d89e5219@suse.com>

On Wed, Dec 20, 2023 at 10:12:15AM +0100, Jan Beulich wrote:
> On 20.12.2023 10:08, Roger Pau Monné wrote:
> > On Tue, Dec 19, 2023 at 08:31:29PM +0000, Andrew Cooper wrote:
> >> On 15/12/2023 11:18 am, Roger Pau Monne wrote:
> >>> --- /dev/null
> >>> +++ b/xen/arch/x86/include/asm/test.h
> >>> @@ -0,0 +1,30 @@
> >>> +#ifndef _ASM_X86_TEST_H_
> >>> +#define _ASM_X86_TEST_H_
> >>> +
> >>> +#include <xen/types.h>
> >>> +
> >>> +int test_smoc(uint32_t selection, uint32_t *results);
> >>> +
> >>> +static inline void execute_selftests(void)
> >>
> >> IMO run_selftests() would be better, but this is already not all of our
> >> selftests, and this particular function really doesn't warrant being
> >> static inline.
> >>
> >> But I'm also not sure what this is liable to contain other than
> >> test_smoc() so I'm not sure why we want it.
> > 
> > This was requested by Jan, he was concerned that more of such tests
> > would appear.  It's new in v4 IIRC.
> 
> If the two of you want it without such a wrapper, so be it. I will admit
> I was a little puzzled to find it implemented as inline function, but I
> didn't see a strong need to comment on that.

It felt a bit misplaced to put such generic selftest function in a
smoc.c file, and I didn't feel like introducing a new test.c file just
for that.  I don't have a strong opinion however, if you think it's
better to go in smoc.c I'm happy with that.

Thanks, Roger.

