Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA9669C260
	for <lists+xen-devel@lfdr.de>; Sun, 19 Feb 2023 21:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497864.768643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTqSJ-0007vV-MO; Sun, 19 Feb 2023 20:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497864.768643; Sun, 19 Feb 2023 20:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTqSJ-0007ss-JS; Sun, 19 Feb 2023 20:38:43 +0000
Received: by outflank-mailman (input) for mailman id 497864;
 Sun, 19 Feb 2023 20:38:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nX2M=6P=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1pTqSI-0007sk-AJ
 for xen-devel@lists.xenproject.org; Sun, 19 Feb 2023 20:38:42 +0000
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [2607:f8b0:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62f054b9-b095-11ed-93b5-47a8fe42b414;
 Sun, 19 Feb 2023 21:38:38 +0100 (CET)
Received: by mail-pg1-x529.google.com with SMTP id 8so324096pge.10
 for <xen-devel@lists.xenproject.org>; Sun, 19 Feb 2023 12:38:38 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b005afda1496c6sm2648912pfn.31.2023.02.19.12.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 12:38:36 -0800 (PST)
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
X-Inumbo-ID: 62f054b9-b095-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cNhE2FASeH5o8yi0ZLyiaK0kUF7pA0USqp0ltHH/0Fo=;
        b=TJUJ1J2ArJiZ+C52sbA4rJUl5jkwfEU0A4lmboDWRNDWEfBXuFPkUHzTEyJZAm+S4p
         Wge2lQiBs7TGtXwWkE0b1xhZw6outUBXabRYNKQBImrjMsw8dd8fr8oWOeq3BFAQBjtb
         8uo983lQimMC+dk9fekE1rNd+VY9r+8q/tjI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNhE2FASeH5o8yi0ZLyiaK0kUF7pA0USqp0ltHH/0Fo=;
        b=zB+BCXio0dedt9PKMkMxnOZRkuX4yMsaepoG4kbWclP2Plori7XZcJNP0gO9pV57+k
         FJE/d18Xc5ICmMH/FF9Js9MopRO+JZ2tyMNOy4KJV+5XpXJ9NSixbFo1ntzdKehrFe1H
         +Kkcp8lwIimPBjndh3C9xX61cFyaCv+gQBcelFm/Vu08z/P1+dIKp4sA//BePf1UIDRJ
         iNvN1Jv1ZoceAOnI7aPD8uzMHjsw6FkZ+r7uCDC0WG99CGoefK774YcBds+vR32CpxP1
         NDNoaonnxFAllRY3SctlUZ8B1zSMo+fUF4MxUk6ID3bF5kPnK8uU/dQdEivPRYZ7/QH5
         WVTg==
X-Gm-Message-State: AO0yUKU56+66c7HMhG8mruWHojTWDajFIsQcMw6fj3g1jjSSu8IbTEpg
	euXMvHQ0m4EW5rLO0u5YlLdOSg==
X-Google-Smtp-Source: AK7set/XVAl5klPqjExLu4JTPo0Bl98f24f9lS+8n7DA1eEGRV2Dh4JhkKn00B8IKrJYG+VivvI0vw==
X-Received: by 2002:a62:1a57:0:b0:58d:d546:8012 with SMTP id a84-20020a621a57000000b0058dd5468012mr769767pfa.0.1676839116854;
        Sun, 19 Feb 2023 12:38:36 -0800 (PST)
Message-ID: <63f288cc.a70a0220.5558c.3c92@mx.google.com>
X-Google-Original-Message-ID: <202302191237.@keescook>
Date: Sun, 19 Feb 2023 12:38:35 -0800
From: Kees Cook <keescook@chromium.org>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
	Balbir Singh <bsingharora@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Cyrill Gorcunov <gorcunov@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Florian Weimer <fweimer@redhat.com>,
	"H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Nadav Amit <nadav.amit@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
	Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijiang Yang <weijiang.yang@intel.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	John Allen <john.allen@amd.com>, kcc@google.com, eranian@google.com,
	rppt@kernel.org, jamorris@linux.microsoft.com,
	dethoma@microsoft.com, akpm@linux-foundation.org,
	Andrew.Cooper3@citrix.com, christina.schimpe@intel.com,
	david@redhat.com, debug@rivosinc.com,
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 11/41] mm: Introduce pte_mkwrite_kernel()
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-12-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230218211433.26859-12-rick.p.edgecombe@intel.com>

On Sat, Feb 18, 2023 at 01:14:03PM -0800, Rick Edgecombe wrote:
> The x86 Control-flow Enforcement Technology (CET) feature includes a new
> type of memory called shadow stack. This shadow stack memory has some
> unusual properties, which requires some core mm changes to function
> properly.
> 
> One of these changes is to allow for pte_mkwrite() to create different
> types of writable memory (the existing conventionally writable type and
> also the new shadow stack type). Future patches will convert pte_mkwrite()
> to take a VMA in order to facilitate this, however there are places in the
> kernel where pte_mkwrite() is called outside of the context of a VMA.
> These are for kernel memory. So create a new variant called
> pte_mkwrite_kernel() and switch the kernel users over to it. Have
> pte_mkwrite() and pte_mkwrite_kernel() be the same for now. Future patches
> will introduce changes to make pte_mkwrite() take a VMA.
> 
> Only do this for architectures that need it because they call pte_mkwrite()
> in arch code without an associated VMA. Since it will only currently be
> used in arch code, so do not include it in arch_pgtable_helpers.rst.
> 
> Cc: linux-doc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-mm@kvack.org
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

I think it's a little weird that it's the only PTE helper taking a vma,
but it does seem like the right approach.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

