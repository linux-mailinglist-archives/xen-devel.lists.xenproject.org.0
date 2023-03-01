Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3136AACD8
	for <lists+xen-devel@lfdr.de>; Sat,  4 Mar 2023 23:02:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504113.779525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwY-0000e8-J3; Sat, 04 Mar 2023 22:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504113.779525; Sat, 04 Mar 2023 22:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwY-0000XB-BU; Sat, 04 Mar 2023 22:01:30 +0000
Received: by outflank-mailman (input) for mailman id 504113;
 Wed, 01 Mar 2023 15:41:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hLBl=6Z=rivosinc.com=debug@srs-se1.protection.inumbo.net>)
 id 1pXOaI-0001Wn-Ji
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 15:41:38 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d112d92-b847-11ed-96a6-2f268f93b82a;
 Wed, 01 Mar 2023 16:41:37 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id y2so13743966pjg.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 07:41:37 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a62be0c000000b005821c109cebsm8058970pff.199.2023.03.01.07.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:41:35 -0800 (PST)
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
X-Inumbo-ID: 8d112d92-b847-11ed-96a6-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677685296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T04RMfKzSUFRrZ3CYc3+bErGU8vpxkP2QVI3mwlpG78=;
        b=RacUjtkKVhkSdFUBywOGho+8dt8NsK+GHdxWXdQ69WX2yCf/yYWl7r6icMXBWT/ShM
         KzbzJEeKqlnWntlEh4Hu5sno9Ak81pDzhFum2pY94j4Sv2hldxTUvXOesOtDXjR8r6gc
         qTgIZDS9fRsSDLNbTTTqAFsgPsTJ/DQ+0jjGE9ek1g+5UBhUcmjFAxCNoVki1FxJorhz
         1mqoDsTuoBLwUNz+cTKmWUvmBN0WlvjuL/8NCCPe/UsZ69pgJ+6lNteW1mdicJGes/KY
         sz2TvcyHAjAaMaJRH5/VJiCFama3PVa+Xs98E38Ow6CsZfQ4ni3p2/e/LUrMvV5jGCLw
         yEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677685296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T04RMfKzSUFRrZ3CYc3+bErGU8vpxkP2QVI3mwlpG78=;
        b=OP8lUEAGw6RP/4UsEfOuqksO9Ov/vcOzqr60Bsy5M1l38PXUyfOURpqV/Ygp/vNmOx
         amynM7LJXWUIE2Uk7/pQMXdDF0NScAvee5RHhe7zXjhO/SgHl8bC/5e0431oRtS9q9YB
         NA59jfbazz7geqgpIKtRdxsteoTGwhlbKc25aoB0bAJ6neHqMpM6QResVapXOhtj814X
         sO58Rk+6ZBi8Ryb3N16e8KfRkF//jeiSS03jX5NfTaoZZq8AXLclTnIWnSLo11iQwe+T
         hbomFKohsPxQ1ZTCKu877FLrlxqfPjOSx+g6d4qn555QmMx2Uvq++npqdMiNQWCXd7+r
         60LA==
X-Gm-Message-State: AO0yUKXPWeESqLyc1IFqpFpcZ3Oesux7XdY3VUQrmwTa2T5Y2lSR1tvI
	eXw9tPOvdEf+M/bwXajg+j0aug==
X-Google-Smtp-Source: AK7set89u8u7K351sr+Ck6r7PKKsfq0NxjZus48TDBYC9SmTqwP5jGqb0tSf18Db2RC/D0Tp3KOSQg==
X-Received: by 2002:a05:6a20:2444:b0:cc:ac05:88f7 with SMTP id t4-20020a056a20244400b000ccac0588f7mr8304959pzc.34.1677685295782;
        Wed, 01 Mar 2023 07:41:35 -0800 (PST)
Date: Wed, 1 Mar 2023 07:41:30 -0800
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
	david@redhat.com, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 13/41] mm: Make pte_mkwrite() take a VMA
Message-ID: <20230301154130.GB3505369@debug.ba.rivosinc.com>
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-14-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230218211433.26859-14-rick.p.edgecombe@intel.com>

On Sat, Feb 18, 2023 at 01:14:05PM -0800, Rick Edgecombe wrote:
>The x86 Control-flow Enforcement Technology (CET) feature includes a new
>type of memory called shadow stack. This shadow stack memory has some
>unusual properties, which requires some core mm changes to function
>properly.
>
>One of these unusual properties is that shadow stack memory is writable,
>but only in limited ways. These limits are applied via a specific PTE
>bit combination. Nevertheless, the memory is writable, and core mm code
>will need to apply the writable permissions in the typical paths that
>call pte_mkwrite().
>
>In addition to VM_WRITE, the shadow stack VMA's will have a flag denoting
>that they are special shadow stack flavor of writable memory. So make
>pte_mkwrite() take a VMA, so that the x86 implementation of it can know to
>create regular writable memory or shadow stack memory.
>
>Apply the same changes for pmd_mkwrite() and huge_pte_mkwrite().
>
>No functional change.
>
>Cc: linux-doc@vger.kernel.org
>Cc: linux-kernel@vger.kernel.org
>Cc: linux-alpha@vger.kernel.org
>Cc: linux-snps-arc@lists.infradead.org
>Cc: linux-arm-kernel@lists.infradead.org
>Cc: linux-csky@vger.kernel.org
>Cc: linux-hexagon@vger.kernel.org
>Cc: linux-ia64@vger.kernel.org
>Cc: loongarch@lists.linux.dev
>Cc: linux-m68k@lists.linux-m68k.org
>Cc: Michal Simek <monstr@monstr.eu>
>Cc: Dinh Nguyen <dinguyen@kernel.org>
>Cc: linux-mips@vger.kernel.org
>Cc: openrisc@lists.librecores.org
>Cc: linux-parisc@vger.kernel.org
>Cc: linuxppc-dev@lists.ozlabs.org
>Cc: linux-riscv@lists.infradead.org
>Cc: linux-s390@vger.kernel.org
>Cc: linux-sh@vger.kernel.org
>Cc: sparclinux@vger.kernel.org
>Cc: linux-um@lists.infradead.org
>Cc: xen-devel@lists.xenproject.org
>Cc: linux-arch@vger.kernel.org
>Cc: linux-mm@kvack.org
>Tested-by: Pengfei Xu <pengfei.xu@intel.com>
>Suggested-by: David Hildenbrand <david@redhat.com>
>Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>

Acked-by: Deepak Gupta <debug@rivosinc.com>

