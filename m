Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49864A2FCAD
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 23:10:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884999.1294758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thbyH-0000wS-Px; Mon, 10 Feb 2025 22:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884999.1294758; Mon, 10 Feb 2025 22:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thbyH-0000uJ-NG; Mon, 10 Feb 2025 22:09:41 +0000
Received: by outflank-mailman (input) for mailman id 884999;
 Mon, 10 Feb 2025 22:09:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kHzY=VB=google.com=jannh@srs-se1.protection.inumbo.net>)
 id 1thbyF-0000uD-Sq
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 22:09:39 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b59e8803-e7fb-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 23:09:34 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5de636e6937so3005a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 14:09:34 -0800 (PST)
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
X-Inumbo-ID: b59e8803-e7fb-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739225374; x=1739830174; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44AOn8KPG/5b/gwXWVMZM4o0cSu0C5gCOO/mytEsVzc=;
        b=iZtuqt+BGJ0/rahOm4dwlfw0/j1NhK0VF4IQ4dV0gcl1y/qJlnwtjQ3k5W6hEM1nDJ
         WsoQKCiQGhfyjmPGhnC84VPKNjStr6+k6ucQaaUwa1MufbWhDbg1qclpFuiQxt8OciAn
         9UzRbNZhSy5AxCuwhKUP0gVyUzQG2Zx6YBCl3xNTGwzbGo3478TjaHIYdnoAprkIZYrH
         6zzGoRjdGmff0d1vQHnYlkLXpiWawu4yUxJERMCexp0cId6v17NJm/f8d3BkqKNa5eRr
         3ZFc3olkFZK19zPGPJAmhXyrodVy4WhWaid1Buuo5buNYa9oXg70qUI0jkeeiXOlTe/d
         LmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225374; x=1739830174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44AOn8KPG/5b/gwXWVMZM4o0cSu0C5gCOO/mytEsVzc=;
        b=lo8uIO7WshzwMV5gEDLKmvEpdFrZtQOUHVTR38FjT0dz1vSl9QcUdRNjUgneKOXWZc
         myzbEEikMTbDtTqnI10es7t6Xl+AgmLhoDryUPSV2vlubXH4WH7Yz4rbT/OjyhATczon
         lFAsM29lcUZbNDPSLR6hiMw+UVh4fDH/SVzaG7JIDyQGTpa0ZUDZT/lC321hIY6H7P4N
         zFWCjU5tV8NixyW44isJWOroA4mVNjiUxaE3+jcK08O3tQHnqBg/ybR6NvhFq7K2SMTS
         PqBQ+aC83jFIOnByyBBpd2m4dHHoOhJaaoQwqbUkn6lOqzWGCuHjL9sDhbPMYXMnMzyM
         zeVw==
X-Forwarded-Encrypted: i=1; AJvYcCWHAy3+CjBTehCRVw0ajKSfkhvP+Z709lfOrPPF8LEgxK6OnSb77mycJdgnKmSh1r47X2SGcmsmkKI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+Ww0LO4b1cTYeCgAgD0+Ghdg/O6IZWezYg1dbUbFNjwNXsHc3
	xS2c2+jedrDnyB3g07jKv4LY6q5efIyQYvEz0K9IeAKlFAeVI1WVp7rC1bo4XcIh+cdfY63hvyq
	zs5gWgEPaGTX0Ym5maZiybjq8VRG6WXAMHy6E
X-Gm-Gg: ASbGncvLHoVaMqyzc1aoPA5ENkx2c151dD9vCe0eCwTjjz+5wn+sCvIinJ3ZdKkG4Eg
	5O3qJ3oh359Ue+z8wZbl2CaHjJ0Iww0hknUImDkGG6L6YNOQcHyAfQpbt3S3KK9R3SrbeyZfyTA
	tWSlAsuR/CxAP5P8+JUM5aNu8=
X-Google-Smtp-Source: AGHT+IG6JmQxBrqAHiHQy9r7fd0aAn9Heiw/iaJpJbhcsh707Pq8kG+sl2h6STthD8Ujnt3Wdn5OEmJdDMQ5PMlBL9s=
X-Received: by 2002:a50:aa93:0:b0:5dc:d08e:e128 with SMTP id
 4fb4d7f45d1cf-5dea05e7838mr1520a12.5.1739225373121; Mon, 10 Feb 2025 14:09:33
 -0800 (PST)
MIME-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com> <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
In-Reply-To: <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
From: Jann Horn <jannh@google.com>
Date: Mon, 10 Feb 2025 23:08:55 +0100
X-Gm-Features: AWEUYZmtdNVDV_xq3vvo5TVQ7aaS79EFzdycTCfl72XGpztchND9QHjN9zcxWNo
Message-ID: <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer flush_tlb_kernel_range()
 targeting NOHZ_FULL CPUs
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, Juergen Gross <jgross@suse.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"Liang, Kan" <kan.liang@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, 
	Tomas Glozar <tglozar@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, 
	Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Yosry Ahmed <yosryahmed@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 7:36=E2=80=AFPM Valentin Schneider <vschneid@redhat=
.com> wrote:
> What if isolated CPUs unconditionally did a TLBi as late as possible in
> the stack right before returning to userspace? This would mean that upon
> re-entering the kernel, an isolated CPU's TLB wouldn't contain any kernel
> range translation - with the exception of whatever lies between the
> last-minute flush and the actual userspace entry, which should be feasibl=
e
> to vet? Then AFAICT there wouldn't be any work/flush to defer, the IPI
> could be entirely silenced if it targets an isolated CPU.

Two issues with that:

1. I think the "Common not Private" feature Will Deacon referred to is
incompatible with this idea:
<https://developer.arm.com/documentation/101811/0104/Address-spaces/Common-=
not-Private>
says "When the CnP bit is set, the software promises to use the ASIDs
and VMIDs in the same way on all processors, which allows the TLB
entries that are created by one processor to be used by another"

2. It's wrong to assume that TLB entries are only populated for
addresses you access - thanks to speculative execution, you have to
assume that the CPU might be populating random TLB entries all over
the place.

