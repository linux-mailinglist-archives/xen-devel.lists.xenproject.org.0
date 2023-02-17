Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C9C69A777
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 09:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496943.767861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSwRb-0006DX-Oq; Fri, 17 Feb 2023 08:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496943.767861; Fri, 17 Feb 2023 08:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSwRb-0006Am-Lj; Fri, 17 Feb 2023 08:50:15 +0000
Received: by outflank-mailman (input) for mailman id 496943;
 Fri, 17 Feb 2023 08:50:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+A+B=6N=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1pSwRZ-00069B-Uf
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 08:50:14 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15c59004-aea0-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 09:50:10 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 z12-20020a1c4c0c000000b003e21e018039so1891501wmf.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Feb 2023 00:50:10 -0800 (PST)
Received: from horizon ([2a01:e0a:257:8c60:48e5:bfa:d652:b8ef])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a1c4b19000000b003dc4480df80sm823505wma.34.2023.02.17.00.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 00:50:08 -0800 (PST)
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
X-Inumbo-ID: 15c59004-aea0-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCCwBRNqqs/M5Re28DTWANd2CatfKwKXtqWOyXxwKZc=;
        b=dcI55P8uip1UPstL013tnzWwN6Tj6tbuOoYf/a8N9zjG5MjYcdDyUA8NQE5/RxbjI9
         /R+dMH6VGl1Ao1NAcxIraglXj4hJ3V/RUpgZgmIRCSwCPSjXXLix/5V9FXlSkx8XsrHX
         z+FK5MUeWp/2ba2GWZLOpZcKF9WwIIr57qCGs/Fm54uhGDUmcFyoG7uUVR6rzLPyZ791
         yFJim5Ody+phEQoh+nqFKETQCGtAfTpUhb8cSfxXhnD304rRkgfLhBTnmlIZEIdTzBhh
         nT9H+HzJ3vXU/57smgTLWuzaxwHwXGyJJRBo+sfHjLy+DJv5qHzGYTf08pbzN28SA4Ek
         rVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCCwBRNqqs/M5Re28DTWANd2CatfKwKXtqWOyXxwKZc=;
        b=d0L4O1JW4gs69m496xIhQ/STbC2H+qXSRWWlDJZbpyXYwBWaGOVMoHNWg7NNi/hTEp
         D8w73G7ofo6zdDDwKznxZXHYTWMaQo0H4pyDU5HhE7I+rz8dyH+uCl3Lj9wo0ZW+ydtO
         ditArnwaQHe2r4oHsJbrml39sHieppZ4WdT4rHwvQdetQljI6iPjja/uzy1mMS5CUI0M
         jhZgqyfvSDvCD0XOVgz7mbPJm+jdrqp25KN3ZlsG7q04DjhM7WRH2UULXd4PaRov/jmf
         lOF6QjkCpWltRCq5MpUukIWpigx/XAjGPAZx5TPa0BQ8BQoyyKdUNL6/29rSU4oTE1Q9
         Zq4Q==
X-Gm-Message-State: AO0yUKW+PiEFlZwJKTKpdTDgRui9bJoY43AkRgZc/2Oxm/MWFiU+I2Lo
	EiC0V1sJ1vX2feENuNZSs1A=
X-Google-Smtp-Source: AK7set+wooYgtmvapjXT4J9l1D33IqAfXE85gxNoIe4OxLQ+pOsQ+LK6qfIdD7aznHR7IolIzz5xjw==
X-Received: by 2002:a05:600c:5006:b0:3e1:f8af:963f with SMTP id n6-20020a05600c500600b003e1f8af963fmr624811wmr.3.1676623809581;
        Fri, 17 Feb 2023 00:50:09 -0800 (PST)
Date: Fri, 17 Feb 2023 09:50:06 +0100
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v2 1/2] xen/memory : Add a stats_table resource type
Message-ID: <20230217085006.GA2281468@horizon>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
 <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
 <3aa736d3-b833-0c6c-2a41-71cc4b953aae@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aa736d3-b833-0c6c-2a41-71cc4b953aae@suse.com>

On Wed, Dec 14, 2022 at 08:56:57AM +0100, Jan Beulich wrote:
> On 14.12.2022 08:29, Jan Beulich wrote:
> > On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
> >> +static int stats_vcpu_alloc_mfn(struct domain *d)
> >> +{
> >> +    struct page_info *pg;
> >> +
> >> +    pg = alloc_domheap_page(d, MEMF_no_refcount);
> > 
> > The ioreq and vmtrace resources are also allocated this way, but they're
> > HVM-specific. The one here being supposed to be VM-type independent, I'm
> > afraid such pages will be accessible by an "owning" PV domain (it'll
> > need to guess the MFN, but that's no excuse).
> 
> Which might be tolerable if it then can't write to the page. That would
> require "locking" the page r/o (from guest pov), which ought to be
> possible by leveraging a variant of what share_xen_page_with_guest()
> does: It marks pages PGT_none with a single type ref. This would mean
> ...
> 
> >> +    if ( !pg )
> >> +        return -ENOMEM;
> >> +
> >> +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {
> 
> ... using PGT_none here. Afaict this _should_ work, but we have no
> precedent of doing so in the tree, and I may be overlooking something
> which prevents that from working.
> 

I do not fully understand this. I checked share_xen_page_with_guest() and I
think you're talking about doing something like this for each allocated page to
set them ro from a pv guest pov:

pg->u.inuse.type_info = PGT_none;
pg->u.inuse.type_info |= PGT_validated | 1;
page_set_owner(page, d); // not sure if this is needed

Then, I should use PGT_none instead of PGT_writable_page in
get_page_and_type(). Am I right?

Matias

