Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AF847B61E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 00:18:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250045.430603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzRuT-0006zu-Rh; Mon, 20 Dec 2021 23:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250045.430603; Mon, 20 Dec 2021 23:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzRuT-0006xr-Oi; Mon, 20 Dec 2021 23:17:37 +0000
Received: by outflank-mailman (input) for mailman id 250045;
 Mon, 20 Dec 2021 23:17:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lA0=RF=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mzRuT-0006xl-2x
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 23:17:37 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0328e659-61eb-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 00:17:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 31D4E4EC;
 Tue, 21 Dec 2021 00:17:33 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xn2FJjRoLvxK; Tue, 21 Dec 2021 00:17:32 +0100 (CET)
Received: from begin.home (2a01cb0088600700de41a9fffe47ec49.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb00:8860:700:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 7BB4E63;
 Tue, 21 Dec 2021 00:17:32 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mzRuN-00065d-0B;
 Tue, 21 Dec 2021 00:17:31 +0100
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
X-Inumbo-ID: 0328e659-61eb-11ec-9e60-abaf8a552007
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 21 Dec 2021 00:17:30 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 02/10] mini-os: sort and sanitize e820 memory map
Message-ID: <20211220231730.nivaq6vgtlyfqhng@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211220160716.4159-1-jgross@suse.com>
 <20211220160716.4159-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211220160716.4159-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 31D4E4EC
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

Juergen Gross, le lun. 20 déc. 2021 17:07:08 +0100, a ecrit:
> +static void e820_sanitize(void)
> +{
> +    int i;
> +    unsigned long end, start;
> +
> +    /* Sanitize memory map in current form. */
> +    e820_process_entries();
> +
> +    /* Adjust map entries to page boundaries. */
> +    for ( i = 0; i < e820_entries; i++ )
> +    {
> +        start = e820_map[i].addr;
> +        end = start + e820_map[i].size;
> +        if ( (1U << e820_map[i].type) & E820_NARROW )
> +        {
> +            if ( start & (PAGE_SIZE - 1) )
> +            {
> +                start = round_pgup(start);
> +                e820_insert_entry_at(i, start - PAGE_SIZE, PAGE_SIZE,
> +                                     E820_TMP_RESERVED);
> +                i++;
> +            }
> +            if ( end & (PAGE_SIZE - 1) )
> +            {
> +                end = round_pgdown(end);
> +                e820_insert_entry_at(i, end, PAGE_SIZE, E820_TMP_RESERVED);

Rather i+1 so it's most probably already sorted?

Apart from that,

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Samuel

