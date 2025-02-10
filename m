Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3069A2E9D9
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:47:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884670.1294415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRK9-0005b4-VF; Mon, 10 Feb 2025 10:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884670.1294415; Mon, 10 Feb 2025 10:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRK9-0005Ys-SE; Mon, 10 Feb 2025 10:47:33 +0000
Received: by outflank-mailman (input) for mailman id 884670;
 Mon, 10 Feb 2025 10:47:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/uJm=VB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thRK7-0005XC-R3
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:47:31 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cc6f554-e79c-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:47:30 +0100 (CET)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2f833af7a09so5703841a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 02:47:30 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa099f4d81sm8368251a91.4.2025.02.10.02.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 02:47:28 -0800 (PST)
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
X-Inumbo-ID: 6cc6f554-e79c-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739184449; x=1739789249; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DtB0ftrpKo7wivkx7hKmXeP8QwBg6VeKRyxbKQYh3+0=;
        b=DeVbUhPV6G57K/7r74nNcylehYixYw5cxy5wTGaN+JujtEiQTcPwvC3890mk/2uMWD
         4iBcqjXoHUNgkw6tpmaqXgsVypl9LgNG3UJy5g6fNUmyTWRf4Q1VV+rxxzDo5yy4hCgC
         Bvurad8J67sfFqkxZmy8hv3kwC9xavpdFDWrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184449; x=1739789249;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DtB0ftrpKo7wivkx7hKmXeP8QwBg6VeKRyxbKQYh3+0=;
        b=vadrLOLTtT6X6gADx21HVSEZ8wZo0FUwpwhNdvERMY7wJrT4C7jGRg1xlfmg5+/zVs
         Lij2Z20gAy43s9RMlrQ71jNdaSfcNQ3JKS4bJx7PPcGHwMWMti4zrMCLOfrEn7XSDHED
         hBNpvH0GpXuVO8jhCvlhVzR68EeYgpBlwgH2f/Ukwha43fE6e2lQRKMLpHzDcpFmSSW0
         WBe6YN7Ib0zDRtsT8iWJk6aQD4Ukxdvu9UPCg72sF6iRlknm39W6vXC7uZKUz2vsa1NY
         QkE+C1OUQdl/thxlOh3/Y2EHLYhIRNkHlulO3vtP5lMkM+VIj+t4pfOlDjfhKOjixArv
         DkSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUchN4kdxbJBNcHjHfdJFr9RimtNpTrMmqrDpW3JoeArLq3BIUNwBm39jX46aOrBNyW+MwrqrdYcVY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSWnX7VqOlOvtSd0pzLBj3c3auXry9a9uw3MIVnvocf/VpFDbO
	qWekAzUOpnmd2QsE2q4KAN3EZVJ00fDfss3UEp5zvNMLbmC8Pdx4NQH8OgSO6BE=
X-Gm-Gg: ASbGnctR46oA2ZsdsVVFSKNcD3mOnD+7FSRTXYurB6EDfv3nsrb0gD20UFvbgBM694+
	MSSdBAAWwfcvoRIx181cWKo8Dos2PVtvZbYt2Y1GDtrWcQ7+7ISj6gvFd9T2tzp8fzaLz7PaUmK
	VehZJObO/xXBPoF0J7XKlmiDd5kqM2PyDdhxfAEoHCnzc5ILNvuDI6UGERW/mNujyJdbVPJchi7
	nTjsDeU5s51WOKBN9nD1gNj0+fmOEFcy9x9eIRjax0kr8tHsMzVAjb4D+lQAheNcHJGqn3Q3dpu
	FFmuuUR7UTz6Y5hOi865
X-Google-Smtp-Source: AGHT+IHM1MoR6XGtqCgUKOJ1hAJG1m/jkuTOkH0EvKlZJVRvuhK0X7r30x09WKgJW0WHdh2cZGvKyQ==
X-Received: by 2002:a17:90b:2303:b0:2ee:5edc:4b2 with SMTP id 98e67ed59e1d1-2fa2417c0f9mr20200256a91.20.1739184449230;
        Mon, 10 Feb 2025 02:47:29 -0800 (PST)
Date: Mon, 10 Feb 2025 11:47:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/5] x86/smp: perform disabling on interrupts ahead of
 AP shutdown
Message-ID: <Z6nZPDcu9h6zmmgx@macbook.local>
References: <20250206150615.52052-1-roger.pau@citrix.com>
 <20250206150615.52052-4-roger.pau@citrix.com>
 <72b7a783-3895-439e-aaa5-0422198e5cbb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72b7a783-3895-439e-aaa5-0422198e5cbb@suse.com>

On Mon, Feb 10, 2025 at 11:24:58AM +0100, Jan Beulich wrote:
> On 06.02.2025 16:06, Roger Pau Monne wrote:
> > Move the disabling of interrupt sources so it's done ahead of the offlining
> > of APs.  This is to prevent AMD systems triggering "Receive accept error"
> > when interrupts target CPUs that are no longer online.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - New in this version.
> 
> Ah, you decided to effectively split the original patch.
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with a question:
> 
> > --- a/xen/arch/x86/smp.c
> > +++ b/xen/arch/x86/smp.c
> > @@ -374,6 +374,8 @@ void smp_send_stop(void)
> >          smp_call_function(stop_this_cpu, &stop_aps, 0);
> >  
> >      local_irq_disable();
> > +    disable_IO_APIC();
> > +    hpet_disable();
> 
> Is this then taking care of the bogus error interrupt observing ESR=0x00?

This, with the extra commits that follow should prevent the error from
triggering yes.  With all patches in the series applied I'm no longer
able to see the ESR=0x00 message.

Thanks, Roger.

