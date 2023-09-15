Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 693397A12C7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 03:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602817.939584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgxIf-0008C1-P1; Fri, 15 Sep 2023 01:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602817.939584; Fri, 15 Sep 2023 01:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgxIf-00089z-MR; Fri, 15 Sep 2023 01:07:13 +0000
Received: by outflank-mailman (input) for mailman id 602817;
 Fri, 15 Sep 2023 01:07:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3l1k=E7=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qgxIe-00089t-9f
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 01:07:12 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3297cd88-5364-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 03:07:10 +0200 (CEST)
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
X-Inumbo-ID: 3297cd88-5364-11ee-8788-cb3800f73035
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694740029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8cRPJbRPbpPyl0DIKbunWuB6+IYtaMtGVInY/dfsbq0=;
	b=YUWamJ5Utp3OQKs0c96zn7z7qwtq5o7oz8CSYdDscALYnuLUGz8SVTh1fz7twIzwmSpsjE
	vsB7w4hBDv0GFnE1NN3xIKfUwohwgKJpgAgZtmggKQQqDjhO+FNlFRQL/GB+Kh6EPdNzpk
	zRoYVcfu1QT7x79DLIjnLloBqPeETIiVgYs2saYJniSZNoOL1AkKr2CHD3knl35LxG/dAt
	vl6bKdoPy0wCFCYinek/JPK3YjMQeQzqL0G4ogM7a0qh4LFhznuacNFS7LjyPTQFfrPXf8
	6OJcRCfY0/JSCSl7MingVERa+6SpAnCJXhzq6Sz5oSfPHvpIl+lN69R9ABcy8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694740029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8cRPJbRPbpPyl0DIKbunWuB6+IYtaMtGVInY/dfsbq0=;
	b=YgXAAcfI7PqVQfPd3GS4BbveJ65cq2aLT9IHq5xExXqf946ewsDrQfSvPRljDdyjnuMZ8G
	TM8nzdItAHQpybAg==
To: andrew.cooper3@citrix.com, Jan Beulich <jbeulich@suse.com>, Juergen
 Gross <jgross@suse.com>
Cc: mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, luto@kernel.org, pbonzini@redhat.com,
 seanjc@google.com, peterz@infradead.org, ravi.v.shankar@intel.com,
 mhiramat@kernel.org, jiangshanlai@gmail.com, Xin Li <xin3.li@intel.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v10 08/38] x86/cpufeatures: Add the cpu feature bit for
 FRED
In-Reply-To: <7d907488-d626-0801-3d4b-af42d00a5537@citrix.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-9-xin3.li@intel.com>
 <d98a362d-d806-4458-9473-be5bea254db7@suse.com>
 <77ca8680-02e2-cdaa-a919-61058e2d5245@suse.com>
 <7d907488-d626-0801-3d4b-af42d00a5537@citrix.com>
Date: Fri, 15 Sep 2023 03:07:09 +0200
Message-ID: <87o7i41bya.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14 2023 at 14:15, andrew wrote:
> PV guests are never going to see FRED (or LKGS for that matter) because
> it advertises too much stuff which simply traps because the kernel is in
> CPL3.
>
> That said, the 64bit PV ABI is a whole lot closer to FRED than it is to
> IDT delivery.=C2=A0 (Almost as if we decided 15 years ago that giving the=
 PV
> guest kernel a good stack and GSbase was the right thing to do...)

No argument about that.

> In some copious free time, I think we ought to provide a
> minorly-paravirt FRED to PV guests because there are still some
> improvements available as low hanging fruit.
>
> My plan was to have a PV hypervisor leaf advertising paravirt versions
> of hardware features, so a guest could see "I don't have architectural
> FRED, but I do have paravirt-FRED which is as similar as we can
> reasonably make it".=C2=A0 The same goes for a whole bunch of other featu=
res.

*GROAN*

I told you before that we want less paravirt nonsense and not more. I'm
serious about that. XENPV CPL3 virtualization is a dead horse from a
technical POV. No point in wasting brain cycles to enhance the zombie
unless you can get rid of the existing PV nonsense, which you can't for
obvious reasons.

That said, we can debate this once the more fundamental issues of
XEN[PV] have been addressed. I expect that to happen quite some time
after I retired :)

Thanks,

        tglx

