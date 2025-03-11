Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D80A5C850
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 16:43:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908371.1315497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1kw-00089D-Gb; Tue, 11 Mar 2025 15:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908371.1315497; Tue, 11 Mar 2025 15:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1kw-00088G-Dk; Tue, 11 Mar 2025 15:42:58 +0000
Received: by outflank-mailman (input) for mailman id 908371;
 Tue, 11 Mar 2025 15:42:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siat=V6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ts1kv-00088A-Dq
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:42:57 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80210bf9-fe8f-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 16:42:56 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2254e0b4b79so18990185ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 08:42:56 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22410a7fa3csm99499365ad.110.2025.03.11.08.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 08:42:54 -0700 (PDT)
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
X-Inumbo-ID: 80210bf9-fe8f-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741707775; x=1742312575; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uVvQXPeG41SSMts6CES/bBVEgm9zR46UGau7gngXz9s=;
        b=bEG1AJI4ANk7qCcma0/g2djKkkL4hYS8vCuhr2NfqKkWRhDUiZeezmGB9VJu36tTD+
         XxIFsnK4coiWUvspRKyvl9pNbgwAOuiB0p0yx+dldB2MO9ddMGt7f/CcFNTve+uQVinB
         7dbtJJT2xUaTsHO5IgIq2ZJ18oGTTdqrKWQ48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741707775; x=1742312575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVvQXPeG41SSMts6CES/bBVEgm9zR46UGau7gngXz9s=;
        b=SO9zB8jpmdxK7t+iIbg/CvzqN1zlgI/+qJ7yud3wqZWOX2cwZVaYHpkCgLw5ZOVQJV
         3YYCLpNK2GbvdQ//7P6BfxeMeDbF3Zbcb48nNrIX8RJHBpLk1GxVoBy4ZI5b427jbZ5c
         /6sflN/20Mmzserx55Eqr9FoouOZZvfl4DdcPryCN8ZLscUMJTk78OfixvUn9DzVCpcQ
         /oIwoiw9SynGUhwVqUINq78jbX1NIVzXLBoNy5Br9ngIFX5pcmKMNPY6u8oUCYjvIdMl
         2CSn/HyS5WBhBzu9LKIS482wXGO4+/SCrUsyhE2sQBf6PA5AzBnwZQYMY14Q1en9ByWU
         XfvA==
X-Gm-Message-State: AOJu0YzNtk+rYEiNVA4L7uXN0ma60aiFXNqjpurmAJOPbAdjQu3JiUYt
	XAsb/mMZJgM9l4SSbXEmCQsRouaX0akfUzWv4Rr/wBi3m9K6nRfZ9heWwdz6gmY=
X-Gm-Gg: ASbGncuaHoAjram76zrb/x0GWd+w5NSt7g0katz653criaOkPELnfeDIEGblbLEqDVJ
	dfwLpr693ipaYljOOGE1VVlYgi1ePc3nAAjH3rGgemD6sEwCTnRsERWeFleQOSkHuGHKnw5BTyW
	Eu6EO0u7oGD5MAlihpgM8+R1AEW+GYk068lHatYrAK/qTNCpxFdCrk9R2O+NxTqizB4ZD1KJ3Fw
	Lwb0LOZ2f24rFs0h6jmuKnrxIeaVaHYKQBVOLQXrw4duaf3filXba0p9JLOOWkoo7nCFZZZ3wx2
	7fGpxZ083pxnwujaVLCQgOxcFradQHd+GqXBvpe2DHe3AfQHTQ==
X-Google-Smtp-Source: AGHT+IEhD1gp8LfNeFBtGapOSB1nq3wkIb4u0G3lHWr4BOOxkULdDIIlJMtVMKaJLPntH+UnSJ9RVw==
X-Received: by 2002:a17:902:d48f:b0:224:1219:934b with SMTP id d9443c01a7336-22428c099abmr249693515ad.50.1741707774952;
        Tue, 11 Mar 2025 08:42:54 -0700 (PDT)
Date: Tue, 11 Mar 2025 16:42:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen/page_alloc: Simplify domain_adjust_tot_pages
Message-ID: <Z9BZ-V8fWHOAwMJ7@macbook.local>
References: <20250304111000.9252-1-alejandro.vallejo@cloud.com>
 <Z9AwsrDBELe2UREz@macbook.local>
 <D8DITFXFKM32.2H5OOI4GVUAZ1@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D8DITFXFKM32.2H5OOI4GVUAZ1@cloud.com>

On Tue, Mar 11, 2025 at 02:53:04PM +0000, Alejandro Vallejo wrote:
> On Tue Mar 11, 2025 at 12:46 PM GMT, Roger Pau Monné wrote:
> > On Tue, Mar 04, 2025 at 11:10:00AM +0000, Alejandro Vallejo wrote:
> > > The logic has too many levels of indirection and it's very hard to
> > > understand it its current form. Split it between the corner case where
> > > the adjustment is bigger than the current claim and the rest to avoid 5
> > > auxiliary variables.
> > > 
> > > Add a functional change to prevent negative adjustments from
> > > re-increasing the claim. This has the nice side effect of avoiding
> > > taking the heap lock here on every free.
> > > 
> > > While at it, fix incorrect field name in nearby comment.
> > > 
> > > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > I think it would be nice to also ensure that once the domain is
> > finished building (maybe when it's unpaused for the first
> > time?) d->outstanding_pages is set to 0.  IMO the claim system was
> > designed to avoid races during domain building, and shouldn't be used
> > once the domain is already running.
> >
> > Thanks, Roger.
> 
> As a matter of implementation that's already the case by toolstack being "nice"
> and unconditionally clearing claims after populating the physmap.

I see.  Another option would be to refuse the unpause a domain if it
still has pending claims.  However I don't know how that will work out
with all possible toolstacks.

> However, I agree the hypervisor should do it on its own. I didn't find a
> suitable place for it. 

You could do it in arch_domain_creation_finished().

> It may be possible to do it on every unpause with
> minimal overhead because it doesn't need to take the heap lock unless there are
> outstanding claims on the domains. Would that sound like an ok idea? I'd rather
> not add even more state into "struct domain" to count pauses...

There's another side missing IMO, XENMEM_claim_pages should return an
error (and refuse the set any claims) once d->creation_finished ==
true.

Thanks, Roger.

