Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE0CA6876F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 10:06:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920120.1324379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tupMt-00087Q-6r; Wed, 19 Mar 2025 09:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920120.1324379; Wed, 19 Mar 2025 09:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tupMt-000858-3q; Wed, 19 Mar 2025 09:05:43 +0000
Received: by outflank-mailman (input) for mailman id 920120;
 Wed, 19 Mar 2025 09:05:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xiIg=WG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tupMr-000852-J5
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 09:05:41 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53c1cba5-04a1-11f0-9abc-95dc52dad729;
 Wed, 19 Mar 2025 10:05:40 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2241053582dso30965325ad.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 02:05:39 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c6ba721esm108897145ad.149.2025.03.19.02.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 02:05:37 -0700 (PDT)
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
X-Inumbo-ID: 53c1cba5-04a1-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742375138; x=1742979938; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7BIlGf34JkLixmsUbT7VMSgLveu/nPVmFeVhZurps8A=;
        b=YkRk1gyQRh7QMg4PnReLmsV3dP8exRUXxJAHjSifsC2yhX6mdtlA5K5Jud0uODiXO7
         6VbbCHTl60uG5wcctLl5F38/t3neu5/M6dkM+mClLe2FsV+cnHeL4+3/JZMgAyJh3xIY
         yBjvOUvqeAfBVi+5+uKTs0svdq2LhoV0lU2Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375138; x=1742979938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7BIlGf34JkLixmsUbT7VMSgLveu/nPVmFeVhZurps8A=;
        b=PzpPzkZYWTiTuNajdR3DEbbxX+9nQA1RpL8NpsrXWLUHbzKDk4pqMQKWAuc/VU/kdO
         t0dZZmVC5G2qH83gHJq75JZ/jUbrJKcJ44bjNEEGI3FBOrUllK7bR4zIRc1B8f+qKPHG
         0oaNOs4BfdJi6vsC3l9lpL9N1onZzC+9OB7I1pL5uPBns9vYiRQg6jLxNrLkoVm8OCvH
         W6IzSBbhyIXcmQdFRPYs9EdHOnbaU5NXx7E2pUvV+kLM5qy7ZfSnWcocExyHHFaSKcDJ
         2r+mmHPuEgfLuEKjzocxZCNwcPWo7DYqRzyWekR8tVzhDaU6MmCvGC512HpxGaLH1wMR
         aWKA==
X-Gm-Message-State: AOJu0YwPGWrjujZzpmmkUaFEcMz2QHquzks8n9GA95sBC/bpatf28sYG
	Hvksm86npIW5x49XmNeLlmj35WN8zYfR4eF+6FdWpv8aWa881te3f9gGqjUgMJM=
X-Gm-Gg: ASbGnctbZJs+nyhQbGWaIaZH4nbNTklLIrdRwLWENdjbiweJ/AswKKFUI4nVQdyTkZ0
	Lq0m+H4Iya+0r7Nq55ocakUsVTXyoWDqB26jpEaExTWN0/t8AfrYi9bU4ty8d0kw7Au8WLJgRzf
	hvP2TV1bekYHwS6qOAZ+u3GVlqN708fewN1/krYvBDz6kmKtEAY4NZW5rJTR/GzfZGau6kiLIpI
	x65wHLz1Yy0SxNLUWyLci4tx0YhahxIJgFwb364v2VvYQv0vVoSvayHCjj1B+wFZg0Bk9j0oAFm
	T3gRphg9lveeGNvlgNFZFTaPcLXeCwms0I41JJYYXVG76HCtQQ==
X-Google-Smtp-Source: AGHT+IFbPmyWLcZ3qbPWeXN+IgtqHjphlRdP68hvRXE3ufyrT1JVu5VSoh9O1TVoYIe+GZ61W/eMHA==
X-Received: by 2002:a17:902:c949:b0:224:2667:8115 with SMTP id d9443c01a7336-22649a8108fmr32368945ad.48.1742375138352;
        Wed, 19 Mar 2025 02:05:38 -0700 (PDT)
Date: Wed, 19 Mar 2025 10:05:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/boot: Untangle the trampoline copying/entry logic
Message-ID: <Z9qI3cnE3BcuqAPE@macbook.local>
References: <20250318173547.59475-5-roger.pau@citrix.com>
 <20250318201033.60634-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318201033.60634-1-andrew.cooper3@citrix.com>

On Tue, Mar 18, 2025 at 08:10:33PM +0000, Andrew Cooper wrote:
> The LRET is detached from the PUSHes which set it up, and this is about to get
> worse with the changes to trampoline relocation.  For the sake of one variable
> read, the complexity is not worth it.
> 
> Reorder the logic to copy the trampoline into place, then switch stack and
> enter the trampoline.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Roger: I'd like this to be a prerequisite to your "[PATCH 4/7] x86/boot: apply
> trampoline relocations at destination position" to avoid the movement of
> reloc_trampoline32() making things worse.

I think you could commit this now-ish, and I can rebase on top?

Thanks, Roger.

