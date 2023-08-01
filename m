Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7095C76BE1A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 21:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574489.899799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvMg-0003ZM-GL; Tue, 01 Aug 2023 19:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574489.899799; Tue, 01 Aug 2023 19:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQvMg-0003WI-Cv; Tue, 01 Aug 2023 19:49:06 +0000
Received: by outflank-mailman (input) for mailman id 574489;
 Tue, 01 Aug 2023 19:49:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZDJD=DS=flex--seanjc.bounces.google.com=3rWHJZAYKCcI0mivrkowwotm.kwu5mv-lm3mttq010.5mvxzwrmk1.wzo@srs-se1.protection.inumbo.net>)
 id 1qQvMe-0003WC-Mi
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 19:49:04 +0000
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [2607:f8b0:4864:20::64a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7709b043-30a4-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 21:49:03 +0200 (CEST)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-1bbb97d27d6so42581245ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Aug 2023 12:49:03 -0700 (PDT)
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
X-Inumbo-ID: 7709b043-30a4-11ee-b25c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690919342; x=1691524142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymMuGbXslfyJGs4W/pBqFuGxl9xUvy7q5fX4QbBoOtQ=;
        b=CydE6ofDFbki4OoGOG75dPf8HjmzdP4bx8vverzkUAQVtD69mMn7n68FWR8AAp7DXQ
         w+dl1y5zJGShPu6hUhv3xWgs0RLuDKkU1QeFVeAkGndzTQF4ejZ1rYTen/R2bDlQiGdt
         p2JE4NI74wSzCDPayw3C3EPUnZHQ6AwVPX7+Hr/id3ZzAXZ75VD1wArInmjbenyfG79V
         cEByprzGAc4WBhBRZXFreyy3tDtKJhpsG+vPyPTXY7LVerieG5d/K0kioNLl2WhELfBY
         ntCCC/ISdhA9syO12Y1PCPSKi59/fx8iNJKpcw07IuHVOLESRbk7CVIj2E7rNQ0Q4Awv
         rGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690919342; x=1691524142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymMuGbXslfyJGs4W/pBqFuGxl9xUvy7q5fX4QbBoOtQ=;
        b=Kn50+t53uU5NOm8Km3htzxTmehToWLKgCZ8oinGiCRFxhxWq52eAldm8vX2R5wHZdN
         zvotcZjjHa+FQI8CZY0qRBye0Jn2cvbDEjBCFpAYmAMYqfZgDzzVVYN+2d98FGAOmoKE
         ka1pwuXiCCH5V5aK3bmAZ4NSgKu09zhvzQ7CgoW57MbH7gG1g/mBo4idqTOEQDdXXu7h
         hfQ4ny5BENwmrAaarSgu+ZCLihuUOHjQ8GJfIzucftXRAveQoG/Dut673iA11w4+sdeq
         u3x5b2152uf+jTqLbMxZpoU73zPvNYIXXdZQNIlQb2/IMFFpL9Ek+G9eG2QkQy7Cq7Sb
         6Bcw==
X-Gm-Message-State: ABy/qLbTgnd+o0Vurg2TekbT6b6vc+33ErxsCV0eGMH2yPFxHpHF6OIX
	RQt/as1wKmqvjNcMFBleh7yi4Pne9q0=
X-Google-Smtp-Source: APBJJlHzs/CPjAfxg4yY07jd2lFS2uJwEiSQkwxUoufms67SS+axZJeOfATbgdLU+XSQqEOfpNJp/uAu49A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f683:b0:1b8:a54c:61ef with SMTP id
 l3-20020a170902f68300b001b8a54c61efmr67559plg.9.1690919341844; Tue, 01 Aug
 2023 12:49:01 -0700 (PDT)
Date: Tue, 1 Aug 2023 19:49:00 +0000
In-Reply-To: <20230801193750.GA119080@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20230801083553.8468-1-xin3.li@intel.com> <20230801083553.8468-7-xin3.li@intel.com>
 <ZMlWe5TgS6HM98Mg@google.com> <20230801193750.GA119080@hirez.programming.kicks-ass.net>
Message-ID: <ZMlhrHv1c9P6HQXw@google.com>
Subject: Re: [PATCH RESEND v9 33/36] KVM: VMX: Add VMX_DO_FRED_EVENT_IRQOFF
 for IRQ/NMI handling
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Tony Luck <tony.luck@intel.com>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Kim Phillips <kim.phillips@amd.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Suren Baghdasaryan <surenb@google.com>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Babu Moger <babu.moger@amd.com>, 
	Jim Mattson <jmattson@google.com>, Sandipan Das <sandipan.das@amd.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Daniel Sneddon <daniel.sneddon@linux.intel.com>, 
	Breno Leitao <leitao@debian.org>, Nikunj A Dadhania <nikunj@amd.com>, Brian Gerst <brgerst@gmail.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Alexander Potapenko <glider@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	"Eric W . Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Ze Gao <zegao2021@gmail.com>, 
	Fei Li <fei1.li@intel.com>, Conghui <conghui.chen@intel.com>, 
	Ashok Raj <ashok.raj@intel.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Jane Malalane <jane.malalane@citrix.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Yantengsi <siyanteng@loongson.cn>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Sathvika Vasireddy <sv@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 01, 2023, Peter Zijlstra wrote:
> On Tue, Aug 01, 2023 at 07:01:15PM +0000, Sean Christopherson wrote:
> > The spec I have from May 2022 says the NMI bit colocated with CS, not SS.  And
> > the cover letter's suggestion to use a search engine to find the spec ain't
> > exactly helpful, that just gives me the same "May 2022 Revision 3.0" spec.  So
> > either y'all have a spec that I can't find, or this is wrong.
> 
> https://intel.com/sdm
> 
> is a useful shorthand I've recently been told about.

Hallelujah!

> On that page is also "Flexible Return and Event Delivery Specification", when
> clicked it will gift you a FRED v5.0 PDF.

Worked for me, too.  Thanks!

