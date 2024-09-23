Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E1A97EEBE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 18:00:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802208.1212402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslUB-0001oE-Vx; Mon, 23 Sep 2024 16:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802208.1212402; Mon, 23 Sep 2024 16:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslUB-0001mi-SS; Mon, 23 Sep 2024 16:00:27 +0000
Received: by outflank-mailman (input) for mailman id 802208;
 Mon, 23 Sep 2024 16:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfwC=QV=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sslUA-0001ma-C5
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 16:00:26 +0000
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [2607:f8b0:4864:20::92c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1a6e5c5-79c4-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 18:00:25 +0200 (CEST)
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-846bcf3677dso1292350241.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 09:00:25 -0700 (PDT)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-49e6b47dd80sm3954043137.32.2024.09.23.09.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 09:00:22 -0700 (PDT)
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
X-Inumbo-ID: f1a6e5c5-79c4-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727107224; x=1727712024; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZO6xw2zK+FekRHP0AmCwr1+BY0iBwxezeniLtwBxfA=;
        b=XQwb5MAu+e/HGd0YS15puEuJnql5iTDKf67qlgjBhq1rWT+iD3Uzt8cgfmNJqk9sGA
         M/MPRLaellVEM9Gd6D+Kw8GgdgHU3O8nYrY4M4HC6d95MRynzASv2jRP8aDWbrycAI33
         XKvzHBuc2WdNXi5f9H9tLzkgQ2qraK5Ix0bUtn/AosgFRsVm8Jj4833Klrbq5FDXXBGs
         Bi4KPccqY29dYer+DCQIFxcnTtQff0CHDj/es+k7aOgSdoJAFTjKejOnHA6pc8uBL2qr
         MY1wlHnMjf8vLp1AthMqgfgdGcarzTr51/ZLP/3CIMfHf4XVZ6qrHUz3JTzZsIa/Tink
         esvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727107224; x=1727712024;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZO6xw2zK+FekRHP0AmCwr1+BY0iBwxezeniLtwBxfA=;
        b=HeFCvw1sGJHyD2jpNk4fvM7rrMh/ARPTfVKt0YhN8qTq59wPPfKmau5I7I2j+WcnqY
         SHdakfpVqMr9Ih11aH4J0FjXL36kMlXXX9qkzNMA97F/4dpRj60R3mhULckVFVhwXwCh
         WmlcNrpCiDAKeueEpeZcYPYgb+iR4rcPeKwLvJdoOHb8Zmp2qFO90QrMEZI1OuBdBkTX
         7OJkuq6l32kTnsO7+okvxxpT/fSEEEPXbAAUbvvFbQkdUFpqth+vMrc3cq0LqwegVglu
         OUHrkch/Dk+FG8hOvS0LAHN27oakuZjrJ6NbeTzgot8w4cKzddhH7sPoQq55nfPq4pW4
         AbAg==
X-Forwarded-Encrypted: i=1; AJvYcCVooSLQo4eGR2K50IWXjoUiuF+GcYSVTrPoAxlMUFiMBinPQlKY+I7cMGLEPqqyopqhM6Qe+zyQpFM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypokmobsA7xtTq7XfusGIym+P61/1tpw+5vbTmhG9DmezG0dse
	nvA+W36DtVv0Q60UYksqTHGpBkybjPVDElpiH8ulS2qncLQJbD2J
X-Google-Smtp-Source: AGHT+IENPozg+xVMIWvMBGwR3CYA3qJoZ8EoZAcMqVrMNwVId4uYtFV9S3FOA/RS+nWXEQ9yToaOpQ==
X-Received: by 2002:a05:6102:510b:b0:497:6bb5:398a with SMTP id ada2fe7eead31-49fc9554cfbmr7208071137.7.1727107223959;
        Mon, 23 Sep 2024 09:00:23 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:00:21 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: dave@treblig.org, sstabellini@kernel.org, paul@xen.org,
	xen-devel@lists.xenproject.org, qemu-devel@nongnu.org,
	anthony@xenproject.org
Subject: Re: [PATCH] hw/xen: Remove deadcode
Message-ID: <ZvGQleGKoqrz7dkq@zapote>
References: <20240917002212.330893-1-dave@treblig.org>
 <ZulFy+S9b243+EQy@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZulFy+S9b243+EQy@l14>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Tue, Sep 17, 2024 at 09:03:09AM +0000, Anthony PERARD wrote:
> On Tue, Sep 17, 2024 at 01:22:12AM +0100, dave@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <dave@treblig.org>
> > 
> > xen_be_copy_grant_refs is unused since 2019's
> >   19f87870ba ("xen: remove the legacy 'xen_disk' backend")
> > 
> > xen_config_dev_console is unused since 2018's
> >   6d7c06c213 ("Remove broken Xen PV domain builder")
> > 
> > Remove them.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dave@treblig.org>
> 
> Acked-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Thanks,

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Cheers,
Edgar

