Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C289C04F7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 12:55:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831730.1247084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t916F-0004iI-O5; Thu, 07 Nov 2024 11:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831730.1247084; Thu, 07 Nov 2024 11:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t916F-0004fG-LL; Thu, 07 Nov 2024 11:54:55 +0000
Received: by outflank-mailman (input) for mailman id 831730;
 Thu, 07 Nov 2024 11:54:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t916D-0004f8-Mw
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 11:54:53 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 184bac62-9cff-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 12:54:51 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso133603666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 03:54:51 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0deeef7sm82662666b.145.2024.11.07.03.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 03:54:50 -0800 (PST)
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
X-Inumbo-ID: 184bac62-9cff-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE4NGJhYzYyLTljZmYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTgwNDkxLjE1OTYyLCJzZW5kZXIiOiJyb2dlci5wYXVAY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730980490; x=1731585290; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UuYdK5k9okck0V2sRC0oIb06oFHPncN5ly31dj3z2s0=;
        b=N659MazGPgkgtzJfxoTTKslpZMASBhvmt97qdWvJtn1xHNrsH05NC7i9j5Vjhywedw
         Bd/ggFyAlkytFrs27sTRqXB/ME4BVbtjQ1B4FRn0Ek5Sj4wuOsAKxnhQAd/WWp/hDpI7
         PG1sh8kMnomcQI+j8Aw3B9DzK9m9ospclCQYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730980490; x=1731585290;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UuYdK5k9okck0V2sRC0oIb06oFHPncN5ly31dj3z2s0=;
        b=vqAz88Ij1AY2kvYRKUCiJd4YBH/iEsQzVoK+LxnCNQFmU377Yfiw1Hm52eZ9DYiF6V
         NKA0EZirR6jOcfDLeQXSW2jOqC9vLvPjW7hq6T+3RThubH6lhfJ3ZP8fLyTU1YdJ+QP4
         9Ds02oefJpMasCi5d1OQrhFvmAbR1UE2Fu0sVbJuxdoQtVcJmwAlTZbii8pFIa3bEX/H
         soWHIte+o5Qtw6cPn7+Re6/fkWLhQLov9HGsD6NJbUpo8kD+raGaiCDw8th42G+ZYwGn
         OvpALzRJUr/O/pD0eX+fiwCsC5UiXYE6UBfnrnTP+tW5TKgzj1u2IF/OFKsa6Rib+qwK
         QBcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ApFPUFPr2oE2czjsPtMnADGpFGr7g2E5lF+QJvSrF27sy40Virxkd93Jll77M5Gz75xgpYqdg7k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxomY6WKJjRyyfVdtwtVzFW6nItYFL8Z8F3uJlEddDAhzbhvCnC
	r/2LyXkSf2agzIUEn5tF4kaZASFYk0sAfxaqWwoL5ux2O//gTjIJnI55NcETG4YstPmAbYZlA8R
	1
X-Google-Smtp-Source: AGHT+IFxIfDi7ByY/43N0nTdPqoIDGte8bN7OVzfQcaudotiC0cp43NUS8gNpEshWSInfYhz6P0RMw==
X-Received: by 2002:a17:907:9713:b0:a9d:e01e:ffa9 with SMTP id a640c23a62f3a-a9de5f82589mr3926014166b.33.1730980490487;
        Thu, 07 Nov 2024 03:54:50 -0800 (PST)
Date: Thu, 7 Nov 2024 12:54:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/4] x86/setup: remove bootstrap_map_addr() usage of
 destroy_xen_mappings()
Message-ID: <ZyyqibpW2dFg5hOQ@macbook>
References: <20241106122927.26461-1-roger.pau@citrix.com>
 <20241106122927.26461-4-roger.pau@citrix.com>
 <c8620982-37b5-4556-9061-5dbf5778a43a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8620982-37b5-4556-9061-5dbf5778a43a@suse.com>

On Thu, Nov 07, 2024 at 12:23:51PM +0100, Jan Beulich wrote:
> On 06.11.2024 13:29, Roger Pau Monne wrote:
> > bootstrap_map_addr() top level comment states that it doesn't indented to
> > remove the L2 tables, as the same L2 will be re-used to create further 2MB
> > mappings.
> 
> With that I assume you refer to the 2nd sentence in the comment immediately
> ahead of the function. According to my reading, it may imply what you say,
> but it certainly doesn't "state" this. Imo the problem was latent already
> before, if BOOTSTRAP_MAP_{BASE,LIMIT} were changed to cover at least one
> full L3E range. Which isn't to say that ...

Hm, maybe I've implied too much from that comment.  What about
replacing the first paragraph with:

"bootstrap_map_addr() needs to be careful to not remove existing
page-table structures when tearing down mappings, as such pagetable
structures might be needed to fulfill subsequent mappings requests.
The comment ahead of the function already notes that pagetable memory
shouldn't be allocated."

> >  It's incorrect for the function to use destroy_xen_mappings() which
> > will free empty L2 tables.
> > 
> > Fix this by using map_pages_to_xen(), which does zap the page-table entries,
> > but does not free page-table structures even when empty.
> > 
> > Fixes: 4376c05c3113 ('x86-64: use 1GB pages in 1:1 mapping if available')
> > Signed-off-by: Roger Pau Monné <roger.pau@ctrix.com>
> > ---
> > The fixes tag reflects the fact that if 4376c05c3113 freed the L2 correctly
> > when empty, it would have become obvious that bootstrap_map_addr() shouldn't be
> > using it if it wants to keep the L2.  4376c05c3113 should have switched
> > bootstrap_map_addr() to not use destroy_xen_mappings().
> 
> ... I mind the commit you name to be blamed. It was clearly something I
> missed back then.
> 
> With the 1st sentence of the description re-worded some:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, Roger.

