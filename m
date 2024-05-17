Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B23C8C8122
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 08:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723828.1128918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7rY4-0003DM-DK; Fri, 17 May 2024 06:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723828.1128918; Fri, 17 May 2024 06:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7rY4-0003BN-AP; Fri, 17 May 2024 06:58:36 +0000
Received: by outflank-mailman (input) for mailman id 723828;
 Fri, 17 May 2024 06:58:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJM7=MU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7rY2-0003BH-1G
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 06:58:34 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df5c15fd-141a-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 08:58:32 +0200 (CEST)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-6a05f376effso2737606d6.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 23:58:32 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1851f7sm85036176d6.47.2024.05.16.23.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 23:58:31 -0700 (PDT)
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
X-Inumbo-ID: df5c15fd-141a-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715929111; x=1716533911; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=atCC8Hh/k8kCgrNGdLCBtHARPiZ9rYxrpcX+dCOV98c=;
        b=l8xTBc7y44TAxi0jvIOXTTCiVVVI7RIJcTFFuPevT+pWMLFNDZOOHWQ22MNY2MgrVN
         1XJ7rQet4ENI1C7Womz0eyY1uCz8rcLA2kgSrFuPlGKxtZ07dC9ux+vnfk4IV5siyefD
         LVj2O9wp0dPW/8mxizxsD80IApTAhQ/3CyeSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715929111; x=1716533911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atCC8Hh/k8kCgrNGdLCBtHARPiZ9rYxrpcX+dCOV98c=;
        b=U51iorqV3z/Bi7aKJEXhGY3N3E5erIjE4ILxeWRAnZo01P9b81F4Ewl5/0iGNMyck1
         RIHo7263vQMdOaFbexOGVuVccAIHBAW/N3ly6rBJrUL2gVNbLojiyPwtzP53S0he445K
         dmt8Bei6V5lAY2yna60co9lygV5XUNUJlHoz7rjoa216pupoGjwbSpUnqfYhkRQmu8SH
         F+WAhtrIizQwPx/5NcWdXCZKBYn/iYOGWwt8xkvpavJx0kz6FMvB36rK7xomGhCH58gD
         6sOUidcNKxnXAnNi1S3NN8hjx1Mb8okIq/ciw9GoquGdn94i4AASQSpkKhwcI6zeBtBG
         G/VQ==
X-Gm-Message-State: AOJu0Yxt7xdzHO8hFtNBBzcKMO/ggJMXPNyBvLjh0eZcLdyipBCBu5tq
	1zNM+JD6yiADvKvnFZQb+1hM3OjOk3Ff1qLjYKt7KWIg+NWgkydeEdjUZBI6yrLse00y3qeeWWp
	v
X-Google-Smtp-Source: AGHT+IESzcvBDK6hgZ9zAvEbRjpBX976oKsp+KFhklEGtv5CyOJYgVxAVojTv8ng6N8R/r9nLVL9Ug==
X-Received: by 2002:a05:6214:3f81:b0:6a0:caef:3c4b with SMTP id 6a1803df08f44-6a16822f259mr256488696d6.48.1715929111419;
        Thu, 16 May 2024 23:58:31 -0700 (PDT)
Date: Fri, 17 May 2024 08:58:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19?] xen/x86: pretty print interrupt CPU affinity
 masks
Message-ID: <ZkcAFfVpxH4iGFDZ@macbook>
References: <20240515152925.77197-1-roger.pau@citrix.com>
 <06844367-cc1d-42f7-b925-ba78b4532b11@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06844367-cc1d-42f7-b925-ba78b4532b11@citrix.com>

On Thu, May 16, 2024 at 06:13:29PM +0100, Andrew Cooper wrote:
> On 15/05/2024 4:29 pm, Roger Pau Monne wrote:
> > Print the CPU affinity masks as numeric ranges instead of plain hexadecimal
> > bitfields.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/irq.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> > index 80ba8d9fe912..3b951d81bd6d 100644
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -1934,10 +1934,10 @@ void do_IRQ(struct cpu_user_regs *regs)
> >                  if ( ~irq < nr_irqs && irq_desc_initialized(desc) )
> >                  {
> >                      spin_lock(&desc->lock);
> > -                    printk("IRQ%d a=%04lx[%04lx,%04lx] v=%02x[%02x] t=%s s=%08x\n",
> > -                           ~irq, *cpumask_bits(desc->affinity),
> > -                           *cpumask_bits(desc->arch.cpu_mask),
> > -                           *cpumask_bits(desc->arch.old_cpu_mask),
> > +                    printk("IRQ%d a={%*pbl}[{%*pbl},{%*pbl}] v=%02x[%02x] t=%s s=%08x\n",
> 
> Looking at this more closely, there's still some information obfuscation
> going on.
> 
> How about "... a={} o={} n={} v=..."
> 
> so affinity, old and new masks are all stated explicitly, instead of
> having to remember what the square brackets mean, and in particular that
> the masks are backwards?
> 
> Happy to adjust on commit.

Sure, I guess I got used to it and didn't think of adjusting the
format.  The only risk is anyone having an automated parser to consume
that information, but I think it's unlikely.

Thanks, Roger.

