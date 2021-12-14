Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FF4473DC2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 08:41:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246401.424930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx2QO-0004yF-6v; Tue, 14 Dec 2021 07:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246401.424930; Tue, 14 Dec 2021 07:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx2QO-0004vX-1J; Tue, 14 Dec 2021 07:40:36 +0000
Received: by outflank-mailman (input) for mailman id 246401;
 Tue, 14 Dec 2021 07:40:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9n0m=Q7=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mx2QM-0004vM-No
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 07:40:34 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d8f7fcf-5cb1-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 08:40:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 1670C32E;
 Tue, 14 Dec 2021 08:40:31 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5YDjt2mkzHDQ; Tue, 14 Dec 2021 08:40:30 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 6BC3C230;
 Tue, 14 Dec 2021 08:40:30 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mx2QI-008b4w-04;
 Tue, 14 Dec 2021 08:40:30 +0100
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
X-Inumbo-ID: 1d8f7fcf-5cb1-11ec-9e60-abaf8a552007
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 14 Dec 2021 08:40:29 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 03/10] mini-os: don't assume contiguous RAM when
 initializing in PVH mode
Message-ID: <20211214074029.5qivn7adgp32nrfj@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-4-jgross@suse.com>
 <20211212001542.qhz7wfdwq7k5ymxr@begin>
 <e44571e4-ba85-06a4-99b2-648d94e9af8c@suse.com>
 <20211213212206.htg4eykr32x63swk@begin>
 <1a2e80ed-9077-6867-5426-e7e6171feab5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a2e80ed-9077-6867-5426-e7e6171feab5@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 1670C32E
X-Spamd-Result: default: False [0.40 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[]

Juergen Gross, le mar. 14 déc. 2021 07:35:54 +0100, a ecrit:
> On 13.12.21 22:22, Samuel Thibault wrote:
> > Juergen Gross, le lun. 13 déc. 2021 15:58:58 +0100, a ecrit:
> > > On 12.12.21 01:15, Samuel Thibault wrote:
> > > > Juergen Gross, le lun. 06 déc. 2021 08:23:30 +0100, a ecrit:
> > > > > -    unsigned long pfn, max = 0;
> > > > > +    unsigned long pfns, max = 0;
> > > > 
> > > > I'd say rather rename max to start.
> > > > 
> > > > >        e820_get_memmap();
> > > > > @@ -166,9 +166,12 @@ unsigned long e820_get_maxpfn(void)
> > > > >        {
> > > > >            if ( e820_map[i].type != E820_RAM )
> > > > >                continue;
> > > > > -        pfn = (e820_map[i].addr + e820_map[i].size) >> PAGE_SHIFT;
> > > > > -        if ( pfn > max )
> > > > > -            max = pfn;
> > > > > +        pfns = e820_map[i].size >> PAGE_SHIFT;
> > > > > +        max = e820_map[i].addr >> PAGE_SHIFT;
> > > > 
> > > > since it's it's always the start of the e820 entry.
> > > > 
> > > > > +        if ( pages <= pfns )
> > > > > +            return max + pages;
> > > > > +        pages -= pfns;
> > > > > +        max += pfns;
> > > > 
> > > > Here we don't need do change max, only pages.
> > > 
> > > It is needed in case the loop is finished.
> > > 
> > > And this was the reason for naming it max.
> > 
> > Ah, ok.
> > 
> > At first read the name was confusing me. Perhaps better use two
> > variables then: start and max, so that we have
> > 
> > start = e820_map[i].addr >> PAGE_SHIFT;
> > if ( pages <= pfns )
> >      return start + pages;
> > pages -= pfns;
> > max = start + pfns;
> 
> Hmm, or I can rename max to start, drop the "max += pfns;" and do a
> "return start + pfns;" at the end of the function.

That could do as well, yes.

Samuel

