Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 392697A75A1
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 10:18:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605284.942874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qisPc-0007j3-6e; Wed, 20 Sep 2023 08:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605284.942874; Wed, 20 Sep 2023 08:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qisPc-0007gV-3x; Wed, 20 Sep 2023 08:18:20 +0000
Received: by outflank-mailman (input) for mailman id 605284;
 Wed, 20 Sep 2023 08:18:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+DLO=FE=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qisPZ-0007gP-VS
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 08:18:18 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fb5c12a-578e-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 10:18:16 +0200 (CEST)
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
X-Inumbo-ID: 3fb5c12a-578e-11ee-8789-cb3800f73035
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1695197895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q8uz0fUswbzg4UfjUJDAWIyPtio4hXNctFhBDoWkw/I=;
	b=kE/H84Nol6C9LIOlDt6z28xGW+kuawtQTv4FXD6iVW+kmib/dyQry2HI8I77EmhgQxDLZN
	qEgTzgAv1sc4W8HrHuYKBXOEmd8iy0FrKPG0MFuz1/fda8E0rqXYkyIrrou5ubORAkaYRw
	p/nmM4quiOpVL9qhS6zLuMV3cIchMR6hkqbICxaE2zL+k7xlPk9j6ykjGGBeLVRZLYxq9d
	0yAWuJ54kFHbV4NDCNTZcx3eiPlzoAXMv/tX0K20Ws4eVdY8naRzGbrZMxHDQrwNOmAl0h
	eNDf8z882Z8cKy1r7YZcGyfp0iUOwDRibsCZp79oHbYnnohNl6oaYDjetCot7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1695197895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q8uz0fUswbzg4UfjUJDAWIyPtio4hXNctFhBDoWkw/I=;
	b=mIUwG0wXtMRC39Lg+Y7W8a/xQn0/l7mkpzZwYbL3zGlQ4h/qPTWoa7xXLmtN9Dgsu0o4pK
	pbN9cV12I/qCJfAw==
To: "Li, Xin3" <xin3.li@intel.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org"
 <linux-edac@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Cc: "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "Lutomirski, Andy" <luto@kernel.org>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "Christopherson,, Sean" <seanjc@google.com>,
 "peterz@infradead.org" <peterz@infradead.org>, "Gross, Jurgen"
 <jgross@suse.com>, "Shankar, Ravi V" <ravi.v.shankar@intel.com>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>, "jiangshanlai@gmail.com"
 <jiangshanlai@gmail.com>
Subject: RE: [PATCH v10 36/38] x86/fred: Add fred_syscall_init()
In-Reply-To: <SA1PR11MB6734C02FFB973B2074EC6CC8A8F9A@SA1PR11MB6734.namprd11.prod.outlook.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-37-xin3.li@intel.com> <87v8c6woqo.ffs@tglx>
 <SA1PR11MB6734C02FFB973B2074EC6CC8A8F9A@SA1PR11MB6734.namprd11.prod.outlook.com>
Date: Wed, 20 Sep 2023 10:18:14 +0200
Message-ID: <87h6npuuk9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 20 2023 at 04:33, Li, Xin3 wrote:
>> > +static inline void fred_syscall_init(void) {
>> > +	/*
>> > +	 * Per FRED spec 5.0, FRED uses the ring 3 FRED entrypoint for SYSCALL
>> > +	 * and SYSENTER, and ERETU is the only legit instruction to return to
>> > +	 * ring 3, as a result there is _no_ need to setup the SYSCALL and
>> > +	 * SYSENTER MSRs.
>> > +	 *
>> > +	 * Note, both sysexit and sysret cause #UD when FRED is enabled.
>> > +	 */
>> > +	wrmsrl(MSR_LSTAR, 0ULL);
>> > +	wrmsrl_cstar(0ULL);
>> 
>> That write is pointless. See the comment in wrmsrl_cstar().
>
> What I heard is that AMD is going to support FRED.
>
> Both LSTAR and CSTAR have no function when FRED is enabled, so maybe
> just do NOT write to them?

Right. If AMD needs to clear it then it's trivial enough to add a
wrmsrl_cstar(0) to it.

