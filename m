Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77660A7121B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 09:11:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927260.1330019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txLqL-00049c-8u; Wed, 26 Mar 2025 08:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927260.1330019; Wed, 26 Mar 2025 08:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txLqL-00046R-5x; Wed, 26 Mar 2025 08:10:33 +0000
Received: by outflank-mailman (input) for mailman id 927260;
 Wed, 26 Mar 2025 08:10:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mf06=WN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txLqJ-00046L-6Q
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 08:10:31 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5a39413-0a19-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 09:10:25 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e61375c108so8544174a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 01:10:25 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5ebccfb0e97sm9080244a12.45.2025.03.26.01.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 01:10:24 -0700 (PDT)
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
X-Inumbo-ID: c5a39413-0a19-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742976625; x=1743581425; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zvoZdGIIh0nptv4x2hyk3srE7837z4cLxs0snnCK7ls=;
        b=r69wm3qpeIQAtFCmphYmhl88DuQDMudIU5AbBhmvgb3mjgSeen0hTVPGMYtJjpdlRY
         BdUw4QLDfoVbYBHdSw61X77N19JBDq6rqH7Mqo/s2psieAnDb1BDtb4YDuirXQr7V6oQ
         fyA4rAdYf1bpsUIajYF199OAEY25lMOYNJeVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742976625; x=1743581425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zvoZdGIIh0nptv4x2hyk3srE7837z4cLxs0snnCK7ls=;
        b=qp1cy2PGoF7sI1B+pTkk4k3sliWq7Ow3dDRRGtb5TuvLcHJE5aZPtokw7yWEVmGSGh
         FNCayQOX81Ft4dCoYrVbc95EgCw4C5nYuQ2mY7V4XxKacXSesc6nxCAab8CT2YnXAQUn
         +VH0jYdjg36njGJnMeAckpUZWLZvEqakzXIjmuJ2HzB00id5f9k6hawCnwZUO/1eeX5/
         RyFOcvo6nck4ru1oZOQoPp/QzieAOxMBudUzLfs1nTvenzunKCw009YOA7yixOkmD7qR
         dCnNqQ/Ry7q+Ghiekx1GkZTWUrYZCYbBqv+ufgFR1rqBGrQTU4AZD/WcWE/Y6OAOA/+h
         mXdA==
X-Forwarded-Encrypted: i=1; AJvYcCXWM0NHosLcsmfuc6F95KJje9oTL3WZLzGGoa/jsspa7exUIk/WwAE8sGDv0VemO392WowA9+rA7ec=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzb6dP7v8R4LP4hRm7mbWvRtGzFlpJs0T6Zjg9LMkNuj3hNegas
	p43Iz6PQwGX+j79M6t8n28OVFOnlflKHWVi8yQpBfP/G6dc2q9NrC9TZQn88kKU=
X-Gm-Gg: ASbGnctFYI8u8mdHjbLPcrb4/fRXa7a3Xj9qyuI1c0xmta5m/3j7SxOJ/7gFiiiGrtp
	AQ/aGJ28DDK/vMUaKo3Vdn56c6yZPcKfIEHH83HXhqcijBgoMzYPhP1KPkJmFnkgBz0pDIrwOCc
	qDfaTYvNDSyL2vgQrO+jCERTSscNEatSkAMawyLB3KiV+pYyb7d/14PGqaltszu8o59pvZicVUT
	SpPcSssY4Ogt5nsY92PyC4ShG2xGkq0lF0Ys2nRh/EYKbIb9OK9+4qhGmHWPm4b4pfgPEh0MFYd
	8DA9nX/dYi5GCzq7UH3BGLZZvfj3NRaXlP/5aeR/xiBbLPnipA==
X-Google-Smtp-Source: AGHT+IFk/oQ4dEeG6SP1NjnX7dgOQ//K7a8iza3+Ms4rsYBb+Te5rd3AJ8dLKHMNssy8DXdKiQsVgA==
X-Received: by 2002:a05:6402:4306:b0:5dc:c531:e5c0 with SMTP id 4fb4d7f45d1cf-5ebcd519e7fmr18000389a12.27.1742976624991;
        Wed, 26 Mar 2025 01:10:24 -0700 (PDT)
Date: Wed, 26 Mar 2025 09:10:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Gomez <da.gomez@kernel.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 3/3] PCI/MSI: Convert pci_msi_ignore_mask to per MSI
 domain flag
Message-ID: <Z-O2bwbYFvOzZw0t@macbook.local>
References: <20250320210741.GA1099701@bhelgaas>
 <846c80f8-b80f-49fd-8a50-3fe8a473b8ec@suse.com>
 <qn7fzggcj6qe6r6gdbwcz23pzdz2jx64aldccmsuheabhmjgrt@tawf5nfwuvw7>
 <Z-GbuiIYEdqVRsHj@macbook.local>
 <kp372led6jcryd4ubpyglc4h7b3erramgzsjl2slahxdk7w575@jganskuwkfvb>
 <Z-Gv6TG9dwKI-fvz@macbook.local>
 <87y0wtzg0z.ffs@tglx>
 <87v7rxzct0.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7rxzct0.ffs@tglx>

On Tue, Mar 25, 2025 at 10:20:43AM +0100, Thomas Gleixner wrote:
> On Tue, Mar 25 2025 at 09:11, Thomas Gleixner wrote:
> 
> > On Mon, Mar 24 2025 at 20:18, Roger Pau Monné wrote:
> >> On Mon, Mar 24, 2025 at 07:58:14PM +0100, Daniel Gomez wrote:
> >>> The issue is that info appears to be uninitialized. So, this worked for me:
> >>
> >> Indeed, irq_domain->host_data is NULL, there's no msi_domain_info.  As
> >> this is x86, I was expecting x86 ot always use
> >> x86_init_dev_msi_info(), but that doesn't seem to be the case.  I
> >> would like to better understand this.
> >
> > Indeed. On x86 this should not happen at all. On architectures, which do
> > not use (hierarchical) interrupt domains, it will return NULL.
> >
> > So I really want to understand why this happens on x86 before such a
> > "fix" is deployed.
> 
> So after staring at it some more it's clear. Without XEN, the domain
> returned is the MSI parent domain, which is the vector domain in that
> setup. That does not have a domain info set. But on legacy architectures
> there is not even a domain.
> 
> It's really wonderful that we have a gazillion ways to manage the
> backends of PCI/MSI....
> 
> So none of the suggested pointer checks will cover it correctly. Though
> there is already a function which allows to query MSI domain flags
> independent of the underlying insanity. Sorry for not catching it in
> review.
> 
> Untested patch below.

As I'm getting reports of other people hitting this issue, is there
anything that needs to be done from my side to get the fix into
linux-next?

Thanks, Roger.

