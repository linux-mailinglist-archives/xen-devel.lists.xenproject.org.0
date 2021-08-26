Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8763F855E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 12:34:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172926.315551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCha-0007PO-Qb; Thu, 26 Aug 2021 10:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172926.315551; Thu, 26 Aug 2021 10:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCha-0007NS-M4; Thu, 26 Aug 2021 10:33:42 +0000
Received: by outflank-mailman (input) for mailman id 172926;
 Thu, 26 Aug 2021 10:33:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eI9=NR=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1mJChZ-0007Kc-Kz
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 10:33:41 +0000
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6943740e-03bd-4a0c-927d-6f93bac6bd5f;
 Thu, 26 Aug 2021 10:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 49F2C1A5;
 Thu, 26 Aug 2021 12:33:33 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0SAFipxd0yY; Thu, 26 Aug 2021 12:33:28 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 9ECF688;
 Thu, 26 Aug 2021 12:33:28 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1mJChL-004NeY-N3; Thu, 26 Aug 2021 12:33:27 +0200
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
X-Inumbo-ID: 6943740e-03bd-4a0c-927d-6f93bac6bd5f
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Thu, 26 Aug 2021 12:33:27 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Minios-devel <minios-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH MINI-OS] gnttab: drop GNTMAP_can_fail
Message-ID: <20210826103327.diijakop36vvrzu7@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jan Beulich <jbeulich@suse.com>,
	Minios-devel <minios-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6b356c6d-d9d5-65ca-50b9-4381d535fe79@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b356c6d-d9d5-65ca-50b9-4381d535fe79@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 49F2C1A5
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Jan Beulich, le jeu. 26 août 2021 12:20:26 +0200, a ecrit:
> There's neither documentation of what this flag is supposed to mean, nor
> any implementation in the hypervisor.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> --- a/include/xen/grant_table.h
> +++ b/include/xen/grant_table.h
> @@ -627,9 +627,6 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flu
>  #define _GNTMAP_contains_pte    (4)
>  #define GNTMAP_contains_pte     (1<<_GNTMAP_contains_pte)
>  
> -#define _GNTMAP_can_fail        (5)
> -#define GNTMAP_can_fail         (1<<_GNTMAP_can_fail)
> -
>  /*
>   * Bits to be placed in guest kernel available PTE bits (architecture
>   * dependent; only supported when XENFEAT_gnttab_map_avail_bits is set).
> 

