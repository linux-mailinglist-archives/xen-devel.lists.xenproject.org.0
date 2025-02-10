Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7FFA2F56B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 18:37:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884922.1294673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thXi2-0005If-KW; Mon, 10 Feb 2025 17:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884922.1294673; Mon, 10 Feb 2025 17:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thXi2-0005GR-HM; Mon, 10 Feb 2025 17:36:38 +0000
Received: by outflank-mailman (input) for mailman id 884922;
 Mon, 10 Feb 2025 17:36:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9QN=VB=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1thXi0-0005GL-N4
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 17:36:36 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ab2680a-e7d5-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 18:36:22 +0100 (CET)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-NW_eUtOiOMe5am9TLLsLUQ-1; Mon, 10 Feb 2025 12:36:26 -0500
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38dca55788eso1753068f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 09:36:26 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbf2ed900sm12687106f8f.53.2025.02.10.09.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 09:36:24 -0800 (PST)
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
X-Inumbo-ID: 8ab2680a-e7d5-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739208988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmeQoovG0+h8NkGt8mJ7mUN4l2oR44byLjbsSTWDllc=;
	b=TNVef/C9tVl7GrjDDWrrk4hKqiVtvBdY+TNx20ou+2MVywJjBiuRS+LAdusTTRCqabnRrS
	2SiqpNifaNfl25SlyrgBFL3GpF+iEYwRuIyGr0R8M3DIJp2CSXAawX3L6JXmi/qYw5Lo2e
	q6z9McKvrk7zmUsoFCctS6WLdDv4p8Y=
X-MC-Unique: NW_eUtOiOMe5am9TLLsLUQ-1
X-Mimecast-MFC-AGG-ID: NW_eUtOiOMe5am9TLLsLUQ
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739208985; x=1739813785;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmeQoovG0+h8NkGt8mJ7mUN4l2oR44byLjbsSTWDllc=;
        b=vo3t1gTvtnoRCUZeSrzdnOcChkGWojzzbBIquGMQqEUWZUGaDnTEVo6E7SrnnWniSK
         xuh8wS8PfLB6yMYKIgTJbogD3Qt3+bv8cdTp1VFEVrpbWS4lck1B2EqMMoQ9kvuxJNXh
         DZ202oy5x8YfLEUZvfkccQBsiSio3z8zvCdIenCh4HdXAm/ldGqXlxuPdGE8t1bCQp+/
         zJryGgKANz6uNPLHCY8h4bR997vTi465SFchg5XYWhVsmnGnzynyyLMfhuCs90ISsRPx
         I1gzQGh478cf5WW11hK2WJ/11PYFvDYeB/SaGDkeafIhK0b+4V2ZoqB9Ze2B11ACr7sT
         BnIA==
X-Forwarded-Encrypted: i=1; AJvYcCUdRJYUk9Rd+rqbweZUtn0lkD4MkM2hfCwupMknJOLOCzFoQ/q85BL+QEFmmzAcj3aMhbu1pRPNYZQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyT4RfV/gGWwL5lp4NO9K6FOjSJnXjNiVCLrNC2+AcBDm2S/mh5
	pgN/Lcjftm4y6rzqAhDUzKkAUI07yo0nCKqnPIYtkVls0ww4/i347Y3iqMJiqRbYdJ7LFcpEg2U
	9qRMveZ12GOjRAkG0Z2gzoCOWYAP0ZCmNYfjMBDGrKflvIvi5T+6Qz1IkuA/GwCzq
X-Gm-Gg: ASbGncvqWPb2ETfHCGwaw6MQ2AXy3CnFAWGOIZI0yOU8yN3R2j5zqv1GyuyVr1/2/W3
	AqMTxMVSh6sXUmJHTtVOibHj9ZaYlrX6x5WK4+/U2u6qrst80HPufTeUIeVcF7+/fXRzD2HSVcy
	ynEMYk+ZyENPBMUzv0WnCsHfmGaZd9l28BFGwGUoaCaqp0qgZL98Ljo6rFHvtWBAh7LkIzkdDVV
	r/4LtCqYeYrewkt3berWa/EYu8ivts393CQwC8TsxVfur6DFNgha++yO6dVqV28cZpgJSEE2k8R
	DKyeJ+psi+c/jPcCksvj7aYUX2OqelD8I3hZHM4Zahk+LN4SXZBAM7KbwBlUq2s/bQ==
X-Received: by 2002:a5d:598f:0:b0:38d:e250:d953 with SMTP id ffacd0b85a97d-38de250dbabmr3058660f8f.35.1739208985404;
        Mon, 10 Feb 2025 09:36:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxfTkrMg3Ut4KvVNhGVu91A0XAdGHvAD9T0QbpHzfP2OmSPgOw5f7LxHQ3fWHxL8NqTxJ5mQ==
X-Received: by 2002:a5d:598f:0:b0:38d:e250:d953 with SMTP id ffacd0b85a97d-38de250dbabmr3058583f8f.35.1739208984820;
        Mon, 10 Feb 2025 09:36:24 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov
 <alexey.amakhalov@broadcom.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian
 Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan
 Gupta <pawan.kumar.gupta@linux.intel.com>, Sean Christopherson
 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski
 <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney"
 <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>,
 Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>,
 Tomas Glozar <tglozar@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Kees Cook
 <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Christoph
 Hellwig <hch@infradead.org>, Shuah Khan <shuah@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Yosry Ahmed <yosryahmed@google.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, Luis
 Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 22/30] context_tracking: Exit CT_STATE_IDLE upon
 irq/nmi entry
In-Reply-To: <Z6ZTBXUiEOLVcSKp@pavilion.home>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-23-vschneid@redhat.com>
 <Z5A6NPqVGoZ32YsN@pavilion.home>
 <xhsmh5xm0pkuo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhbjvdk7kq.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z6ZTBXUiEOLVcSKp@pavilion.home>
Date: Mon, 10 Feb 2025 18:36:20 +0100
Message-ID: <xhsmh8qqdk8h7.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m8cSvRQDwN8laHZmp7zgLSmZaLn6XhbKdWPGAc0tcXY_1739208985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07/02/25 19:37, Frederic Weisbecker wrote:
> Le Fri, Feb 07, 2025 at 06:06:45PM +0100, Valentin Schneider a =C3=A9crit=
 :
>>
>> Soooo I've been thinking...
>>
>> Isn't
>>
>>   (context_tracking.state & CT_RCU_WATCHING)
>>
>> pretty much a proxy for knowing whether a CPU is executing in kernelspac=
e,
>> including NMIs?
>
> You got it!
>

Yay!

>>
>> NMI interrupts userspace/VM/idle -> ct_nmi_enter()   -> it becomes true
>> IRQ interrupts idle              -> ct_irq_enter()   -> it becomes true
>> IRQ interrupts userspace         -> __ct_user_exit() -> it becomes true
>> IRQ interrupts VM                -> __ct_user_exit() -> it becomes true
>>
>> IOW, if I gate setting deferred work by checking for this instead of
>> explicitely CT_STATE_KERNEL, "it should work" and prevent the
>> aforementioned issue? Or should I be out drinking instead? :-)
>
> Exactly it should work! Now that doesn't mean you can't go out
> for a drink :-)
>

Well, drinks were had very shortly after sending this email :D

> Thanks.


