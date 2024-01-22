Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29122835C9D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 09:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669689.1042035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRph5-0006AU-78; Mon, 22 Jan 2024 08:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669689.1042035; Mon, 22 Jan 2024 08:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRph5-00067L-3p; Mon, 22 Jan 2024 08:30:11 +0000
Received: by outflank-mailman (input) for mailman id 669689;
 Mon, 22 Jan 2024 08:30:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GS+M=JA=linaro.org=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1rRph3-00067D-Ad
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 08:30:09 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 722b3125-b900-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 09:30:07 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-338aca547d9so2253352f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 00:30:06 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 d21-20020adfa355000000b003392a486758sm5511850wrb.99.2024.01.22.00.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 00:30:05 -0800 (PST)
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
X-Inumbo-ID: 722b3125-b900-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705912206; x=1706517006; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SFCiLnY6xBPrqdHIolQZod6apPlIVJ6Tq13E5RZi33g=;
        b=lWFWzBEHrbhgzKjfRi2BbI3vmiYASSV7ipD96TTYLNbAcdZL7j6swprJ5Zr8nghxdz
         XpeZd5N/Z23sKynydV+TBRF12QQSInlGj70Gh5lONEYlXrxLu9AlzEQwBs/iS775dWzP
         WmeqzAuGd6ab0GIdDYnU110uL06sTVQXtN6omJPpr1/X8IBxK1u3z+Dw+VbdtU+YIdCQ
         UqEwrgWYkVOOZAcgTJNTFexa0tT20Qt0d5j6xD5/hQIa5Zw2Di6H7MvG05tsHur883y1
         375GGIUUXmZa9wpKxrqF+IzZdj/SMW1NHbvt9MdZpeth1cQ7IWpW95wWpAP3w27IMQ4R
         +dUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705912206; x=1706517006;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SFCiLnY6xBPrqdHIolQZod6apPlIVJ6Tq13E5RZi33g=;
        b=RA/oo5+iR/S4QDH28uQGyZXiG/+tLoNHoZgR/IGELy2XhdJwWfVRK1g4DINz9NlvQl
         f5+USyhDheu8sT4S4S2gKQOxAK+LmR+mDCIsHOMmfwnVTmjJtvmRUC1LiDMexq8hTKmq
         vLCVMKfH9g3qFyLT5MXoblFYggdOh7hhB03UcJDcPvVygm0t+tSSf1HpIQvDqcWGRNU4
         FsUgJmqRA/oq5qcpvfIYOMDqKtO9d5A8XcAatv5EshAlinpRNyS6tK6w1v9KQ5kY11G9
         d3UW0ocUa0gr0+1AGP46B1YSq7ExxQp+jyh+Z92GB9QKV6Dc80ZikcdmkueRC9uiOPfG
         qj4Q==
X-Gm-Message-State: AOJu0Yx26wY9FBbUFjEQlucE0gLeMl/FiM28LfeemCt4neoi4NzfV1ag
	uWrOM/qHZldz1uZdYHi7p809KVM1/74qcwq7A1zMVzFz0khuUUbe0GlzYpAZre4=
X-Google-Smtp-Source: AGHT+IFVQ0c6+n6QcK4dPQ4aInfuFL5IaA5u36sUVkTkA1RNClaCwWZfy6oJvnyLXS/5fMx7uCKTPg==
X-Received: by 2002:adf:a18a:0:b0:337:828b:dd72 with SMTP id u10-20020adfa18a000000b00337828bdd72mr907642wru.55.1705912205784;
        Mon, 22 Jan 2024 00:30:05 -0800 (PST)
Date: Mon, 22 Jan 2024 11:30:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kunwu Chan <chentao@kylinos.cn>
Cc: Markus Elfring <Markus.Elfring@web.de>, xen-devel@lists.xenproject.org,
	kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	kernel test robot <lkp@intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	=?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org
Subject: Re: [PATCH v2] x86/xen: Add some null pointer checking to smp.c
Message-ID: <dfb6de51-3ebc-41fc-a750-cf5ca2ac05aa@moroto.mountain>
References: <20240117090018.152031-1-chentao@kylinos.cn>
 <1705655941162581.825.seg@mailgw>
 <517fae75-c4e7-4576-81ff-6a14a3eb9cd7@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <517fae75-c4e7-4576-81ff-6a14a3eb9cd7@kylinos.cn>

On Fri, Jan 19, 2024 at 05:22:25PM +0800, Kunwu Chan wrote:
> On 2024/1/17 18:40, Markus Elfring wrote:
> > > kasprintf() returns a pointer to dynamically allocated memory
> > > which can be NULL upon failure. Ensure the allocation was successful
> > > by checking the pointer validity.
> > …
> > > +++ b/arch/x86/xen/smp.c
> > > @@ -61,10 +61,14 @@ void xen_smp_intr_free(unsigned int cpu)
> > > 
> > >   int xen_smp_intr_init(unsigned int cpu)
> > >   {
> > > -	int rc;
> > > +	int rc = 0;
> > 
> > I find the indication of a successful function execution sufficient by
> > the statement “return 0;” at the end.
> > How do you think about to omit such an extra variable initialisation?
> Thanks, it's no need now. I'll remove it in v3.

This advice is good.  Don't do unnecessary assignments.

> > 
> > 
> > >   	char *resched_name, *callfunc_name, *debug_name;
> > > 
> > >   	resched_name = kasprintf(GFP_KERNEL, "resched%d", cpu);
> > > +	if (!resched_name) {
> > > +		rc = -ENOMEM;
> > > +		goto fail;
> > > +	}
> > >   	per_cpu(xen_resched_irq, cpu).name = resched_name;
> > >   	rc = bind_ipi_to_irqhandler(XEN_RESCHEDULE_VECTOR,
> > >   				    cpu,
> > 
> > You propose to apply the same error code in four if branches.
> > I suggest to avoid the specification of duplicate assignment statements
> > for this purpose.
> > How do you think about to use another label like “e_nomem”?
> I'll add a new label to simply the code.

I'm not a Xen maintainer so I can't really comment on their style
choices.  However, as one of the kernel-janitors list people, I would
say that not everyone agrees with Markus's style preferences.  Markus
was banned from the list for a while, but we unbanned everyone when we
transitioned to the new list infrastructure.  Do a search on lore to
find out more.  https://lore.kernel.org/all/?q=Elfring

Perhaps wait for feedback from the maintainers for how to proceed?

regards,
dan carpenter


