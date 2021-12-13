Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C683747367E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 22:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246303.424757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwsj7-0005Ue-8s; Mon, 13 Dec 2021 21:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246303.424757; Mon, 13 Dec 2021 21:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwsj7-0005Qz-4D; Mon, 13 Dec 2021 21:19:17 +0000
Received: by outflank-mailman (input) for mailman id 246303;
 Mon, 13 Dec 2021 21:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sGW=Q6=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mwsj5-0005QX-Pt
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 21:19:15 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 507b97a9-5c5a-11ec-85d3-df6b77346a89;
 Mon, 13 Dec 2021 22:19:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 2B80938A;
 Mon, 13 Dec 2021 22:19:10 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rsLAX-jPuo-M; Mon, 13 Dec 2021 22:19:09 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 664EF18A;
 Mon, 13 Dec 2021 22:19:09 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mwsix-006yxI-AC;
 Mon, 13 Dec 2021 22:19:07 +0100
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
X-Inumbo-ID: 507b97a9-5c5a-11ec-85d3-df6b77346a89
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Mon, 13 Dec 2021 22:19:07 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 02/10] mini-os: sort and sanitize e820 memory map
Message-ID: <20211213211907.lbjjnvayklf7qucb@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-3-jgross@suse.com>
 <20211212000558.232nzs7k5lklpbym@begin>
 <ab1b2e26-65c1-c877-cf88-0df50d38b925@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab1b2e26-65c1-c877-cf88-0df50d38b925@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 2B80938A
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

Juergen Gross, le lun. 13 déc. 2021 15:56:21 +0100, a ecrit:
> On 12.12.21 01:05, Samuel Thibault wrote:
> > Hello,
> > 
> > Juergen Gross, le lun. 06 déc. 2021 08:23:29 +0100, a ecrit:
> > > - align the entries to page boundaries
> > 
> > > +    /* Adjust map entries to page boundaries. */
> > > +    for ( i = 0; i < e820_entries; i++ )
> > > +    {
> > > +        end = (e820_map[i].addr + e820_map[i].size + PAGE_SIZE - 1) & PAGE_MASK;
> > > +        e820_map[i].addr &= PAGE_MASK;
> > > +        e820_map[i].size = end - e820_map[i].addr;
> > > +    }
> > 
> > Mmm, what if the previous entry ends after the aligned start?
> > 
> > On real machines that does happen, and you'd rather round up the start
> > address of usable areas, rather than rounding it down (and conversely
> > for the end).
> 
> I think you are partially right. :-)
> 
> Entries for resources managed by Mini-OS (RAM, maybe NVME?) should be
> rounded to cover only complete pages (start rounded up, end rounded
> down), but all other entries should be rounded to cover the complete
> area (start rounded down, end rounded up) in order not to use any
> partial used page for e.g. mapping foreign pages.

Right!

> > > +    /* Sort entries by start address. */
> > > +    for ( i = 0; i < e820_entries - 1; i++ )
> > > +    {
> > > +        if ( e820_map[i].addr > e820_map[i + 1].addr )
> > > +        {
> > > +            e820_swap_entries(i, i + 1);
> > > +            i = -1;
> > > +        }
> > > +    }
> > 
> > This looks O(n^3) to me? A bubble sort like this should be fine:
> > 
> >      /* Sort entries by start address. */
> >      for ( last = e820_entries; last > 1; last-- )
> >      {
> >          for ( i = 0; i < last - 1; i++ )
> >          {
> >              if ( e820_map[i].addr > e820_map[i + 1].addr )
> >              {
> >                  e820_swap_entries(i, i + 1);
> >              }
> >          }
> >      }
> 
> Hmm, depends.
> 
> Assuming a rather well sorted map my version is O(n), while yours
> is still O(n^2).

Right, I was a bit lazy :)

This should be fine:

/* Sort entries by start address. */
for ( i = 1; i < e820_entries; i++ )
    for ( j = i; j > 0 && e820_map[j-1].addr > e820_map[j].addr ) ; j-- )
        e820_swap_entries(j - 1, j);

> I'm fine both ways, whatever you prefer.

I really prefer for loops which don't unexpectedly modify their loop
index, that's much less scary :)

Samuel

