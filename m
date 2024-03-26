Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E2888C988
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 17:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698164.1089566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp9on-00049F-Q8; Tue, 26 Mar 2024 16:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698164.1089566; Tue, 26 Mar 2024 16:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp9on-00046z-N8; Tue, 26 Mar 2024 16:38:33 +0000
Received: by outflank-mailman (input) for mailman id 698164;
 Tue, 26 Mar 2024 16:38:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rvZH=LA=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1rp9om-00046t-81
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 16:38:32 +0000
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46ce3e7d-eb8f-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 17:38:30 +0100 (CET)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3c397193878so3250722b6e.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 09:38:30 -0700 (PDT)
Received: from EMEAENGAAD91498 ([160.101.131.1])
 by smtp.gmail.com with ESMTPSA id
 bw20-20020a05622a099400b00430eb19dd06sm3822212qtb.91.2024.03.26.09.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 09:38:28 -0700 (PDT)
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
X-Inumbo-ID: 46ce3e7d-eb8f-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711471109; x=1712075909; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=83gN2jSnR0VX0vRMrDP8Yj5OsE6zl4FjNqjh1MpSu8o=;
        b=P5WGeGN1YQynXEXK8eNyQJnxIuaXioVbOaNZPrnRPebt7iLKY1JQBKmidjbMD7T6bt
         uEB0iQuSMw+RrJ/9AVQGlK9vm4M5wJTLHCsF4f3YOVT0EgNxkMOILEvxkj0g8pzBm1VR
         59vDI7VIJmGGq8MMO10ujB+eWcsptqkNxgUZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711471109; x=1712075909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83gN2jSnR0VX0vRMrDP8Yj5OsE6zl4FjNqjh1MpSu8o=;
        b=HsvcHJRXYiSiB40gVtTf5vkhbsE5wCK2gvUdu7SRbRNhdDNcJ9mftiKF6KEPL393OK
         bpA1RMQ9cer69AT495xsRNCGA+vkvWFki7CmmHX2lp6p0qbnV6oSesmIVnBrhnTtqIDg
         49/kSFvNqdoySayokL37XP24Nlrg2x6GNhOHMTshcNtsE3afyjbpiApvWdjfhP6Qq+f3
         ODv1dAmzCWgtIvHaa4R3qh57e9NW34h4ud60kuP9tVzvr3eBkz7aboVW4yKZRwsmNSFV
         VLvcNzKlMcVfPxgIQbMYRdZ0nSNrrhUq/sVK5ykVzyug0T8egU51IlcpVLBRISeQ9u0E
         5Qhg==
X-Forwarded-Encrypted: i=1; AJvYcCXPjh3pjJBJPQAIr8nU3D/p9DbMslqHtULySdGjWeSKjkhIu6MuiJrRvB5kdymooYShoqhX1lPFHNZQGB/Uz/DQ3gqr41LjAQ/3789Xos4=
X-Gm-Message-State: AOJu0YyDzUeMRAXEhy32i8aNaA8mU5+2f/8Ltw+taNZ+2GDEcDxazvar
	giUmGNGAKDqttGOW+vAwOfH96++ToBo6JfDjVF30ieoNrG47+44JT79IAxKKsxc=
X-Google-Smtp-Source: AGHT+IHNosMFb1qIa4yv23Ea3+nvFYF2E7KCTFI0XlQsAc3g06CvQnL+xtajX0HF0LWFnLIjEdH1pw==
X-Received: by 2002:a05:6808:3194:b0:3c3:cd50:2914 with SMTP id cd20-20020a056808319400b003c3cd502914mr8616654oib.55.1711471108936;
        Tue, 26 Mar 2024 09:38:28 -0700 (PDT)
Date: Tue, 26 Mar 2024 16:38:23 +0000
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Matthew Barnes <matthew.barnes@cloud.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] tools: add x2APIC entries in MADT based on APIC ID
Message-ID: <wm63w7mljs5ejvkf7es3egwqkpybc3etdbjrqk2x7aqr7sshrq@wmfdfpod54ko>
References: <cd1a3ce14790af8c1bb4372ef0be5a6cbbb50b1c.1710338145.git.matthew.barnes@cloud.com>
 <32a4de1e-94fe-4b44-b95c-55cd1ec7e7e4@suse.com>
 <sjkt43mvc7mpqqbqi3yky5eouf6lk3cuiksskvrnoo7hyq7gfp@7lfnxlbpvuef>
 <b178ffdf-cbd1-45fe-a271-1fa09f40606e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b178ffdf-cbd1-45fe-a271-1fa09f40606e@suse.com>

On Tue, Mar 26, 2024 at 05:15:46PM +0100, Jan Beulich wrote:
> On 26.03.2024 16:57, Matthew Barnes wrote:
> >>> This patch scans each APIC ID before constructing the MADT, and uses the
> >>> x2APIC entry for each vCPU whose APIC ID exceeds the size limit imposed
> >>> by regular APIC entries.
> >>
> >> It is my understanding that if you use any x2APIC entry, every CPU needs
> >> to have one.
> > 
> > In the ACPI 6.4 specification, section 5.2.12.12, the note says the following:
> > 
> > [Compatibility note] On some legacy OSes, Logical processors with APIC ID
> > values less than 255 (whether in XAPIC or X2APIC mode) must use the Processor
> > Local APIC structure to convey their APIC information to OSPM, and those
> > processors must be declared in the DSDT using the Processor() keyword.
> > 
> > Therefore, even in X2APIC mode, it's better to represent processors with APIC
> > ID values less than 255 with APIC entries for legacy reasons.
> 
> Well, my reading of that is different: All CPUs need to have x2APIC entries
> if one has, and CPUs with small enough APIC IDs _additionally_ need xAPIC
> entries. That's what I've been observing on real hardware, too.

Understood. Patch v2 will reflect this

Matt

