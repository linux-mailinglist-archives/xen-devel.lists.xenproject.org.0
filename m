Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A26990B25B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 16:38:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742381.1149180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDTn-0004y4-9A; Mon, 17 Jun 2024 14:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742381.1149180; Mon, 17 Jun 2024 14:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDTn-0004vt-6R; Mon, 17 Jun 2024 14:37:07 +0000
Received: by outflank-mailman (input) for mailman id 742381;
 Mon, 17 Jun 2024 14:37:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5eX2=NT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sJDTm-0004vn-2S
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 14:37:06 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10e3588a-2cb7-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 16:37:05 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-795502843ccso254935385a.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 07:37:05 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abc02e72sm433891885a.96.2024.06.17.07.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 07:37:03 -0700 (PDT)
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
X-Inumbo-ID: 10e3588a-2cb7-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718635024; x=1719239824; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XvP4+t8l416VgzjO1ZXGZmV/a/Zd7bc8WzT6PYRtni8=;
        b=SlJLXfOAZ35kHqarAP9x+qLWE2vL6+CL+TkHKyerplrPWTLTLazJ8sW1BALQfMkolY
         2UiHJyMj6GH3wUVG5hQx9K7wdzbcUPeBV6L6FeRI7axkefDB14lkoJ575jJ0zGdrOt5q
         flwkzDLAJ9SGsmluqIi/updmzSZkvwvxRg3KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718635024; x=1719239824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvP4+t8l416VgzjO1ZXGZmV/a/Zd7bc8WzT6PYRtni8=;
        b=CE1mYJ439P/EdC2PAIKJZq+Ff/lP31458qr5McYzHoYay+6ZwDQo3uFDOURKhablDD
         +0t5zvoUp8mlRr27Yn4JYNKXmtXUj3VGRUrC9C1Dutd22bu+VD35XVqZWDqXd6DOtG8c
         QIAB54ELU0ElvckakGy1xnkqko6tu8VXXHqYEicvvp8K1QYujCNBMgaQwTGiMg9A0itq
         tSTsF93qlvIsHLmdQCo/t7dtKdXeVcRHZFRlR7uMgxUzE8rUa08UD81fHKw2ehq5598K
         iRyw9DAuWkpqFUPnU8+Kwdj5YsgHxKqUTsrNu7BEswbF8u6S/mT6Uv26KbIRIBe5cMJE
         7jHg==
X-Forwarded-Encrypted: i=1; AJvYcCX0rZ45qXiydFWiDfxZp9D+IAc4JD6UL9KChZiTki6TpTkP5ewBrcVmuvrUvaf5mns6zSBR0tuYHthxu6f2AAXGr40m7+2rhzV5ay74I6w=
X-Gm-Message-State: AOJu0YxADBaOwSgXPP0rcdluASaA7nFbeZlD+D2YM2wZeMbxikWtj05E
	Cf0vZtGai9y5ZIq80hHEVoyjnSP5Mp9cyEVHhWREW2cBJKXjy3yP0se2fwEtmwE=
X-Google-Smtp-Source: AGHT+IHQDMfoJ/LOZJYFoBhJ4TbHf9tXcpQcYRrBKsc6jJQgkvkhyZr/hctT8019B9VlxZwrZ62Uqw==
X-Received: by 2002:a05:620a:4507:b0:795:4e89:53b2 with SMTP id af79cd13be357-798d26a8ce3mr1215726185a.70.1718635023959;
        Mon, 17 Jun 2024 07:37:03 -0700 (PDT)
Date: Mon, 17 Jun 2024 16:37:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/xen/time: Reduce Xen timer tick
Message-ID: <ZnBKDRWi_2cO6WbA@macbook>
References: <20240617141303.53857-1-frediano.ziglio@cloud.com>
 <2fe6ef97-84f2-4bf4-870b-b0bb580fa38f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2fe6ef97-84f2-4bf4-870b-b0bb580fa38f@suse.com>

On Mon, Jun 17, 2024 at 04:22:21PM +0200, Jan Beulich wrote:
> On 17.06.2024 16:13, Frediano Ziglio wrote:
> > Current timer tick is causing some deadline to fail.
> > The current high value constant was probably due to an old
> > bug in the Xen timer implementation causing errors if the
> > deadline was in the future.
> > This was fixed in Xen commit:
> > 19c6cbd90965 xen/vcpu: ignore VCPU_SSHOTTMR_future
> 
> And then newer kernels are no longer reliably usable on Xen older than
> this?

I think this should reference the Linux commit that removed the usage
of VCPU_SSHOTTMR_future on Linux itself, not the change that makes Xen
ignore the flag.

> > --- a/arch/x86/xen/time.c
> > +++ b/arch/x86/xen/time.c
> > @@ -30,7 +30,7 @@
> >  #include "xen-ops.h"
> >  
> >  /* Minimum amount of time until next clock event fires */
> > -#define TIMER_SLOP	100000
> > +#define TIMER_SLOP	1000
> 
> It may be just the lack of knowledge of mine towards noadays's Linux'es
> time handling, but the change of a value with this name and thus
> commented doesn't directly relate to "timer tick" rate. Could you maybe
> help me see the connection?

The TIMER_SLOP define is used in min_delta_{ns,ticks} field, and I
think this is wrong.

The min_delta_ns for the Xen timer is 1ns.  If Linux needs some
greater min delta than what the timer interface supports it should be
handled in the generic timer code, not open coded at the definition of
possibly each timer implementation.

Thanks, Roger.

