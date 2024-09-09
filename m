Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E6D971538
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794204.1202977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbYK-0000VR-DD; Mon, 09 Sep 2024 10:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794204.1202977; Mon, 09 Sep 2024 10:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbYK-0000SF-9r; Mon, 09 Sep 2024 10:23:24 +0000
Received: by outflank-mailman (input) for mailman id 794204;
 Mon, 09 Sep 2024 10:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnCw=QH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snbYI-0000Gy-S8
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:23:22 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89bd904c-6e95-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 12:23:21 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cb6f3a5bcso10414925e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:23:21 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ced1bfsm319945866b.154.2024.09.09.03.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 03:23:18 -0700 (PDT)
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
X-Inumbo-ID: 89bd904c-6e95-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725877401; x=1726482201; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bhI844PgsLrKj87hPVsNaSq/gQDTrzMZ4bN8YTKgG1s=;
        b=gexq2suaMUtYWTO+WXicleGhAPORQj4dMmXmxTk4I9dPsvI+PCGB5oDvXbcckX5b0w
         AtGzA5vAr3Rfe0FwkUBIqbn/jPOUBNxbXjmnAjBYoPd7hRG+To6f0pR9LIaN20sruvC4
         7/S/7bX3yzZhm3JkpDAKpHcWG4BQiZF/VzFW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725877401; x=1726482201;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhI844PgsLrKj87hPVsNaSq/gQDTrzMZ4bN8YTKgG1s=;
        b=kH4c2X6ksvb7rlFPR2ucjPiNeCwPYOn8qOEEiVVZ13AdBXri+XwRhkoYaflLuVKouD
         oNEXis52Nf4ztr04EF7AFjF+Gl7+4eyFgieeDzUfv+uQgYrqELy2jC/W80X+kIHwkXfd
         s21z4eFeEfo3ZCBPGZOcgpzMELHq0NBnPHCP2djDGhy1MMU1wgidPZbNVC0773uWlnRX
         SIXxdOuD+j7+7AyH7OKY9SU13XMkhyFOX0Hjri4QCYW6YR0Gc6azZted/aiFlIwhh3i3
         YxV7RD0xVSEZ8CUwVulCJCWwN7P6BUpoETnWCwTqc7Dct6Bz0DMe02pd4jFL20QkyoGE
         Z2Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWhkK1DGiynNZh58pBxoL1Rp2ZvgR9JZ3aB5hm/NnXF0D3WGF8uy+N6S3aouYIjJp3SL/7gVp7Gu4U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/5xjMYzOujLwlhAcaRYM5nqMJQqb2Ef8zmGx8dA+wM6o0wK9Q
	iiCFS5sXvuX+4mTKBRzgelwwVXxiJFzb8MyZ1vEjgZrjDI3Vv/3Z8WNjESWifJo=
X-Google-Smtp-Source: AGHT+IGLuJ5u7cEgPzzuGPWR1QbEemR+sV1i2zgStqyJRC9KZsYCn2hOvL63dHMEbRt1NIxpYb40Dw==
X-Received: by 2002:adf:ef43:0:b0:374:d07a:c136 with SMTP id ffacd0b85a97d-378922d62bamr5317613f8f.36.1725877399980;
        Mon, 09 Sep 2024 03:23:19 -0700 (PDT)
Date: Mon, 9 Sep 2024 12:23:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 1/6] x86/time: introduce helper to fetch Xen wallclock
 when running as a guest
Message-ID: <Zt7Mlnajfk7E83sq@macbook.local>
References: <20240904153151.83995-1-roger.pau@citrix.com>
 <20240904153151.83995-2-roger.pau@citrix.com>
 <cbfa09ee-a576-41c7-bcf9-dbc23df911d0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbfa09ee-a576-41c7-bcf9-dbc23df911d0@suse.com>

On Thu, Sep 05, 2024 at 05:45:20PM +0200, Jan Beulich wrote:
> On 04.09.2024 17:31, Roger Pau Monne wrote:
> > Move the current code in get_wallclock_time() to fetch the Xen wallclock
> > information from the shared page when running as a guest into a separate
> > helper.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Still ...
> 
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -787,6 +787,30 @@ static struct platform_timesource __initdata_cf_clobber plt_xen_timer =
> >  };
> >  #endif
> >  
> > +static unsigned long read_xen_wallclock(void)
> > +{
> > +#ifdef CONFIG_XEN_GUEST
> > +    struct shared_info *sh_info = XEN_shared_info;
> 
> ... I'd like to switch this to pointer-to-const while committing, if okay
> with you.

Oh, sure.

Thanks, Roger.

