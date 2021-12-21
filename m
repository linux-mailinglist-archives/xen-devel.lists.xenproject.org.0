Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165D747BBAA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 09:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250173.430834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzaLb-0007xU-2y; Tue, 21 Dec 2021 08:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250173.430834; Tue, 21 Dec 2021 08:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzaLa-0007u0-VZ; Tue, 21 Dec 2021 08:18:10 +0000
Received: by outflank-mailman (input) for mailman id 250173;
 Tue, 21 Dec 2021 08:18:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3COf=RG=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mzaLZ-0007rt-Kg
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 08:18:09 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8632c1b1-6236-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 09:18:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 559791F7;
 Tue, 21 Dec 2021 09:18:05 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VGwyIgt8v35K; Tue, 21 Dec 2021 09:18:04 +0100 (CET)
Received: from begin.home (2a01cb0088600700de41a9fffe47ec49.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb00:8860:700:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 9474A18E;
 Tue, 21 Dec 2021 09:18:03 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mzaLS-000gSV-Os;
 Tue, 21 Dec 2021 09:18:02 +0100
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
X-Inumbo-ID: 8632c1b1-6236-11ec-9e60-abaf8a552007
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 21 Dec 2021 09:18:02 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 04/10] mini-os: respect memory map when ballooning up
Message-ID: <20211221081802.qop7fsow2mu4qugy@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211220160716.4159-1-jgross@suse.com>
 <20211220160716.4159-5-jgross@suse.com>
 <20211220232231.sylwjfk6rsjrgeqi@begin>
 <75aa6bf0-dbbc-3076-ee45-42eb0b89eeff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75aa6bf0-dbbc-3076-ee45-42eb0b89eeff@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 559791F7
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

Juergen Gross, le mar. 21 déc. 2021 07:16:49 +0100, a ecrit:
> On 21.12.21 00:22, Samuel Thibault wrote:
> > Juergen Gross, le lun. 20 déc. 2021 17:07:10 +0100, a ecrit:
> > > +unsigned long e820_get_max_contig_pages(unsigned long pfn, unsigned long pages)
> > > +{
> > > +    int i;
> > > +    unsigned long end;
> > > +
> > > +    for ( i = 0; i < e820_entries && e820_map[i].addr < (pfn << PAGE_SHIFT);
> > 
> > Shouldn't that be addr+size? Otherwise if pfn is in the middle of an
> > e820 entry, we will miss picking up that.
> 
> No, we want to check all map entries starting below or at the given pfn.
> The test should be "e820_map[i].addr <= (pfn << PAGE_SHIFT)", of course.

Ah, yes, due to the "<" I mistook it for a loop that skips the entries
before the targetted pfn :)

With <=, 

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Samuel

