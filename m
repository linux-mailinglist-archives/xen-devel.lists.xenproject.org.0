Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1616AACD9
	for <lists+xen-devel@lfdr.de>; Sat,  4 Mar 2023 23:02:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504111.779519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwY-0000XL-8j; Sat, 04 Mar 2023 22:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504111.779519; Sat, 04 Mar 2023 22:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwY-0000Vc-3A; Sat, 04 Mar 2023 22:01:30 +0000
Received: by outflank-mailman (input) for mailman id 504111;
 Wed, 01 Mar 2023 15:39:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hLBl=6Z=rivosinc.com=debug@srs-se1.protection.inumbo.net>)
 id 1pXOY3-0000fb-3F
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 15:39:19 +0000
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [2607:f8b0:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3768813d-b847-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 16:39:14 +0100 (CET)
Received: by mail-pg1-x533.google.com with SMTP id q189so7948257pga.9
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 07:39:14 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a62b60d000000b005a8851e0cddsm8070167pff.188.2023.03.01.07.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:39:11 -0800 (PST)
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
X-Inumbo-ID: 3768813d-b847-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677685152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G88lHAU8EQsCcXmuw5k8V0o7uYf93X0m0EbK56nmCkc=;
        b=Ny+HmlrE0gXICVns/E53J7P+ufLy4O/6mPMZ9p2rf+anhUNDxXReAJ7Of7RumsIo7i
         MF0of+OFSSVag+jJbKJCbWqw/7+3QP1Ep9RYaalmJO09mE4viOw8S2klvVFaryWM8jl2
         TtVtqnAAOEN9R1ADWrsxZJSJWmuT6eBeUtGvwmxtiW6+g7vic+774Z/gaDYyszuozffC
         OjXIGEYSwLxa1xaHosEo3E4lK3jZqYXbE8AJSAcyVW/Ya9OJJK8u4pEJ6QPLxpJdgj2D
         ds5e0Mvpliu5fpO+nw6SVbgSyG5paByNt+L/3lCiP7+YU4Hd4Qok+ddJgLOslD7RpwmT
         /2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677685152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G88lHAU8EQsCcXmuw5k8V0o7uYf93X0m0EbK56nmCkc=;
        b=BypsN1UkNhcoY2pwcSmL+bVejL56EIRkGPM2/+OJWPQG9g+AVQ0iBqQlJmDOmzXOL2
         bUAD160e2672vMbhMih4kYy6zdasxmYxVGJ2tYahDYfyC+87fz1DJY2kPgBnJMesp75N
         8o1tEBDexcps4vL6uH4nLoux8n6+vP4gxfRuIxDj7hu7yFDIG9zSfrT+xdo8tJZLbOaf
         6OfhK9+NWiK4hII93jX3jEsLx8o18CwtayvDxAgrjwnosex2LxeWZtKUKXC+/Kbovkjz
         KiLmK5JMa9b2fiqSKF0iEsufzdwBg+fDZkH9NTw1Cuve1yW9W4H57wly7ymGi0CKIZq0
         jkxQ==
X-Gm-Message-State: AO0yUKV1Q4Nke70LPYsE4aGRfrEoJJm9f/c6LPCui4BTUARets9A1Sk0
	2dOFFQMm+sbLCHXPXzL5c75Mnw==
X-Google-Smtp-Source: AK7set8O+FBRYvI4IODXsFr4hn8ba9dIyWnvB6rPeJHmFqFJ7d5V8y8v1teRy0/jHqbFKVQ/Seo5yA==
X-Received: by 2002:aa7:9ac2:0:b0:5a8:ea06:662 with SMTP id x2-20020aa79ac2000000b005a8ea060662mr6767366pfp.20.1677685152202;
        Wed, 01 Mar 2023 07:39:12 -0800 (PST)
Date: Wed, 1 Mar 2023 07:39:08 -0800
From: Deepak Gupta <debug@rivosinc.com>
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
	Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>,
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
	david@redhat.com, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 11/41] mm: Introduce pte_mkwrite_kernel()
Message-ID: <20230301153908.GA3505369@debug.ba.rivosinc.com>
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-12-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230218211433.26859-12-rick.p.edgecombe@intel.com>

On Sat, Feb 18, 2023 at 01:14:03PM -0800, Rick Edgecombe wrote:
>The x86 Control-flow Enforcement Technology (CET) feature includes a new
>type of memory called shadow stack. This shadow stack memory has some
>unusual properties, which requires some core mm changes to function
>properly.
>
>One of these changes is to allow for pte_mkwrite() to create different
>types of writable memory (the existing conventionally writable type and
>also the new shadow stack type). Future patches will convert pte_mkwrite()
>to take a VMA in order to facilitate this, however there are places in the
>kernel where pte_mkwrite() is called outside of the context of a VMA.
>These are for kernel memory. So create a new variant called
>pte_mkwrite_kernel() and switch the kernel users over to it. Have
>pte_mkwrite() and pte_mkwrite_kernel() be the same for now. Future patches
>will introduce changes to make pte_mkwrite() take a VMA.
>
>Only do this for architectures that need it because they call pte_mkwrite()
>in arch code without an associated VMA. Since it will only currently be
>used in arch code, so do not include it in arch_pgtable_helpers.rst.
>
>Cc: linux-doc@vger.kernel.org
>Cc: linux-arm-kernel@lists.infradead.org
>Cc: linux-s390@vger.kernel.org
>Cc: xen-devel@lists.xenproject.org
>Cc: linux-arch@vger.kernel.org
>Cc: linux-mm@kvack.org
>Tested-by: Pengfei Xu <pengfei.xu@intel.com>
>Suggested-by: David Hildenbrand <david@redhat.com>
>Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>

Acked-by: Deepak Gupta <debug@rivosinc.com>

