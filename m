Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BFF7EC6A8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 16:05:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633737.988766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3HRv-0000iS-8R; Wed, 15 Nov 2023 15:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633737.988766; Wed, 15 Nov 2023 15:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3HRv-0000fW-5F; Wed, 15 Nov 2023 15:05:03 +0000
Received: by outflank-mailman (input) for mailman id 633737;
 Wed, 15 Nov 2023 15:05:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CvKG=G4=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1r3HRu-0000fQ-96
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 15:05:02 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 594838ef-83c8-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 16:05:01 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32fa7d15f4eso4750702f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Nov 2023 07:05:01 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c16-20020adfed90000000b00327cd5e5ac1sm10821833wro.1.2023.11.15.07.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 07:05:00 -0800 (PST)
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
X-Inumbo-ID: 594838ef-83c8-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700060700; x=1700665500; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aSalCrnrwBmXA1Qhq88zL44bwNDSOCxoaFr0u7ks5ns=;
        b=Vdt237n/2hmyfJGvEaty2U9GPxJF2mGjB7G42DMr790ymZjqLdZvoc94SsXx2abMvX
         yZE1SMo+m0YBt6DPuri/m9RERzDNu+NHCkjBrOD8IUqTvo8f3tpQD56CbVOL98EgZQxT
         vJzjNipoAQ+h8iCFGKma9QSno3gEWYED2jMXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700060700; x=1700665500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSalCrnrwBmXA1Qhq88zL44bwNDSOCxoaFr0u7ks5ns=;
        b=bUMR3JKoEgg3X+yUdsuHPYhaNnNu1lgNjHN8cHZ+qBTkcO96hoDq9yNZaTPprVtUGp
         iypyRbabMeZslUcLzhlyn9kkBS/LjdYXOGyWZfUqT12IwpPcIx2wSD1z3unj/re202pK
         /W153uncWcDGmmKTO2Orl5gGSv/fCk5l/W4eaNg5bHFkxyGDIhuIs1blbP8pTEtxn/5B
         DDXOHqpVV3Rr7bvjHtqnUZwDAkywo75Ctkz3m8rpybHz8oA8A4qZXacQUt/Kc+QPBtJH
         X6nprz+Mb+4EiEWyPpLtgwoHuP9t2vTdxDQzgYnWs+2YmcfOK8ejkTLdeJJPaDSIU3mr
         Li3g==
X-Gm-Message-State: AOJu0YwoVL+KODMlraxj/Ux9XlKlFVxbJehgR6LigfAtRSUvF38QlG8K
	16Ezj24MjR95moR2F2AjKGaZZwB6YFmnpIPbmpM=
X-Google-Smtp-Source: AGHT+IF2nFYSv5iJtT9ZKRMQS5lpEHNl+N7jpQtyxD8AFfXtvV4/vx5OAqry1Gz9qClZbkdr1AdyJg==
X-Received: by 2002:a05:6000:1881:b0:32d:9579:94e3 with SMTP id a1-20020a056000188100b0032d957994e3mr9701655wri.6.1700060700490;
        Wed, 15 Nov 2023 07:05:00 -0800 (PST)
Date: Wed, 15 Nov 2023 15:04:59 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: xen | Failed pipeline for staging-4.17 | 28f44b60
Message-ID: <3cbfffc2-4c3e-4132-be05-1787e4f71e3c@perard>
References: <6553d80525384_2ca04b0436ee@gitlab-sidekiq-catchall-v2-548c659f69-wtllv.mail>
 <6efe7a0d-eb87-42e8-aeec-1276e40574ed@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6efe7a0d-eb87-42e8-aeec-1276e40574ed@suse.com>

On Wed, Nov 15, 2023 at 11:11:30AM +0100, Jan Beulich wrote:
> On 14.11.2023 21:26, GitLab wrote:
> > Pipeline #1072370735 ( https://gitlab.com/xen-project/xen/-/pipelines/1072370735 ) triggered by Ganis ( https://gitlab.com/ganis )
> > had 4 failed jobs.
> > 
> > Job #5534997591 ( https://gitlab.com/xen-project/xen/-/jobs/5534997591/raw )
> > 
> > Stage: build
> > Name: ubuntu-focal-gcc-debug
> > Job #5534997608 ( https://gitlab.com/xen-project/xen/-/jobs/5534997608/raw )
> > 
> > Stage: build
> > Name: alpine-3.12-gcc-debug
> > Job #5534997597 ( https://gitlab.com/xen-project/xen/-/jobs/5534997597/raw )
> > 
> > Stage: build
> 
> These three failed due to (once again) too little disk space.

Runner is "gitlab-docker-seagull".
Looks like the cleanup task that I've setup sometime ago and run
weekly only isn't enough anymore. Sorry.
I'll look at running it hourly instead.

> > Name: opensuse-leap-clang-debug
> > Job #5534997599 ( https://gitlab.com/xen-project/xen/-/jobs/5534997599/raw )
> > 
> > Stage: build
> > Name: opensuse-leap-gcc-debug
> 
> Here it's unclear, as the log referenced ends too early.

I had to log into the runner to find out, because no artifact as been
uploaded to gitlab (which would have a more complete log).
Turns out that this runner also got into a "no space left" situation.
This time, runner is "gitlab-docker-swift".

Cheers,

-- 
Anthony PERARD

