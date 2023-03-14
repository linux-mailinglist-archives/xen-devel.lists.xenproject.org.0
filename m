Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 641746B92B2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 13:07:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509562.785529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc3R1-00040u-R6; Tue, 14 Mar 2023 12:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509562.785529; Tue, 14 Mar 2023 12:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc3R1-0003xh-O8; Tue, 14 Mar 2023 12:07:19 +0000
Received: by outflank-mailman (input) for mailman id 509562;
 Tue, 14 Mar 2023 12:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eA0l=7G=gmail.com=salvatore.bonaccorso@srs-se1.protection.inumbo.net>)
 id 1pc3R0-0003xb-0n
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 12:07:18 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c354f997-c260-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 13:07:16 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id eg48so1819543edb.13
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 05:07:16 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch.
 [82.192.242.114]) by smtp.gmail.com with ESMTPSA id
 v30-20020a50d59e000000b004af7191fe35sm948475edi.22.2023.03.14.05.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 05:07:15 -0700 (PDT)
Received: by eldamar.lan (Postfix, from userid 1000)
 id BBA70BE2DE0; Tue, 14 Mar 2023 13:07:14 +0100 (CET)
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
X-Inumbo-ID: c354f997-c260-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678795636;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGJ/J3etGXzzl0b+NHW/iN6M3fmzVQmhjKRcIxTWVds=;
        b=ka8JGNS5D9SBcMnt4d472x2hwdFkFyldNKxnGEnO6pkvYSlUbIPqO4QQXn8NmzwyVC
         8rk0yUI9Ytm+zUIbnPDGByyhREZTWaoVHCxqr4ft5G7ajdPtRGbMnPcEvfISWe33JRdS
         2zRjYKlZv0ukmKIM/H+sCicuGvpuDBWpJEavqLje0lpLqJ6a2VYTridpp5gFZJJD/8JH
         OGSN3wph8HBzAGDNII2yYIqbjNDKCH0vsLyK6uYB3NXGFwph+zJjCETmmrwsneflYZSh
         CNI3KkJJK1fAfWwer4wZpllE82hWWa8pfYSbJKnUcfO0jTEFk/Iz//RQLwUCp3Me57+v
         VDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678795636;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGJ/J3etGXzzl0b+NHW/iN6M3fmzVQmhjKRcIxTWVds=;
        b=HEpmSocEsgPDjK6rmj8tpdDye2vTAy3qbK9MFVWHwEh54xE2xTq/FpapkmHAnfBUqE
         4Yy6469eIRlrVk2CYINGrGNOX7I/dnmOhqeYN5IKfJyjwcdx/HQejdnAXQCncUGKM5qO
         NkLm3rwFAeoRHb/gLugmisLCg6mOgsio79d4g18XtTzKEhyDRjO5O2KcwRLLRmObrQHp
         6vJq4tQXDPnP7bjigcwQG/R7C0aW4K0O9ksPaYc1YaE16aNDKZ9I3PmFNytN3vTS58Ge
         Xp411eaaSiu2bLz3wvGXngw/OLGQNfOrbuuOORgBP5uknSK8opeCnhSkguhT/kJJQ2I8
         mHHw==
X-Gm-Message-State: AO0yUKUthEBj9iSVn0AWR/Jg8ZtnX9V+MV4M4BgM+YwWtAa9HF2avRog
	7u0Iz6TRnbXbvyT+fOjk+sc=
X-Google-Smtp-Source: AK7set/ZXQ+XfAoC7QvC3zJZuOUeUmwsfD1u7z9CGxTW9HvRYx2Fw+SlEkD2QSWMCctkfcyjX1j1Tw==
X-Received: by 2002:aa7:d38b:0:b0:4fb:fd9f:7375 with SMTP id x11-20020aa7d38b000000b004fbfd9f7375mr7624487edq.2.1678795636347;
        Tue, 14 Mar 2023 05:07:16 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date: Tue, 14 Mar 2023 13:07:14 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Joost Roeleveld <joost@antarean.org>,
	Christoph Hellwig <hch@infradead.org>, jejb@linux.ibm.com,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Bart Van Assche <bvanassche@acm.org>, sathya.prakash@broadcom.com,
	suganath-prabu.subramani@broadcom.com,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	adi@kriegisch.at
Subject: Re: Report in downstream Debian: mpt3sas broken with xen dom0 with
 update to 5.10.149 in 5.10.y.
Message-ID: <ZBBjcu2YH9HFY06l@eldamar.lan>
References: <Y1JkuKTjVYrOWbvm@eldamar.lan>
 <85ad4508-b979-c792-e92b-01bc16260dec@acm.org>
 <CAK=zhgr=MYn=-mrz3gKUFoXG_+EQ796bHEWSdK88o1Aqamby7g@mail.gmail.com>
 <2fd505a07bd26d76f1166761fa50905414edb7ef.camel@linux.ibm.com>
 <30a056c8-071f-4259-3253-75e718af619d@suse.com>
 <Y1bEQMS5SNTbZO/3@infradead.org>
 <858a4288-46ac-d423-a529-b3b77b7fbc8a@citrix.com>
 <20230314111752.EGroupware.TiNRv1BSroWqKL7zQtfNLJ8@_>
 <4c5de098-5cd3-116b-54cb-6972c6c06818@suse.com>
 <8cc36c16-4aa0-9c47-ab2f-c75c1e22772f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8cc36c16-4aa0-9c47-ab2f-c75c1e22772f@citrix.com>

Hi Andrew,

On Tue, Mar 14, 2023 at 11:41:08AM +0000, Andrew Cooper wrote:
> On 14/03/2023 11:23 am, Juergen Gross wrote:
> > On 14.03.23 12:17, Joost Roeleveld wrote:
> >>> On Mon, Oct 24, 2022 at 05:28:05PM +0000, Andrew Cooper wrote:
> >>>> I don't know exactly how this translates to Linux internals, but most
> >>>> devices are fine and it's routinely the mpt2/3sas drivers which
> >>>> encounter problems.  It would be lovely if we could get to the
> >>>> bottom of
> >>>> this for once and for all.
> >>>
> >>> So to summarize my two mails: I think te use of dma_get_required_mask
> >>> in mpt3sas is wrong, and the dma_get_required_mask return value from
> >>> xen-swiotlb is also wrong. Fixing either one should fix this problem,
> >>> and I think we should fix both.
> >>
> >> Hi all,
> >>
> >> Is there anything that can be done to get this fixed in xen and the
> >> kernel somehow?
> >> I keep having to manually patch the mpt3sas driver to prevent it from
> >> being able to switch to 32bit mode each time I upgrade the kernel.
> >
> > Just use 5.10.173.
> 
> Its still broken even in 6.1
> 
> We've just stumbled over this yet again in XenServer.

The mentioned commit has been backported to 6.1.16, 5.15.100 and
5.10.173. Is the issue still reproducible with 6.1.16?

Regards,
Salvatore

