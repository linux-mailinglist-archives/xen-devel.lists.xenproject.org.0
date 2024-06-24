Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F040914ED4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 15:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746635.1153749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjs4-00076U-O8; Mon, 24 Jun 2024 13:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746635.1153749; Mon, 24 Jun 2024 13:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjs4-00074I-LU; Mon, 24 Jun 2024 13:36:36 +0000
Received: by outflank-mailman (input) for mailman id 746635;
 Mon, 24 Jun 2024 13:36:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NRWk=N2=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sLjs2-00073r-HN
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 13:36:34 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c54cb4d7-322e-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 15:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 091EEA02C7;
 Mon, 24 Jun 2024 15:36:33 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wbocwnsz_QVE; Mon, 24 Jun 2024 15:36:32 +0200 (CEST)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id C62E1A00DD;
 Mon, 24 Jun 2024 15:36:32 +0200 (CEST)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sLjs0-00000006LvV-1ftl; Mon, 24 Jun 2024 15:36:32 +0200
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
X-Inumbo-ID: c54cb4d7-322e-11ef-90a3-e314d9c70b13
Date: Mon, 24 Jun 2024 15:36:32 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Minios-devel <minios-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: {PATCH mini-os] mman: correct m{,un}lock() definitions
Message-ID: <20240624133632.emyygqh2hop3kyxv@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jan Beulich <jbeulich@suse.com>,
	Minios-devel <minios-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e25f5cd4-9130-488c-8294-22bd9fbd76ff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e25f5cd4-9130-488c-8294-22bd9fbd76ff@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jan Beulich, le lun. 24 juin 2024 15:34:53 +0200, a ecrit:
> From: Charles Arnold <carnold@suse.com>
> 
> gcc14 no longer (silently) accepts functions with no return type
> specified.
> 
> Signed-off-by: Charles Arnold <carnold@suse.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> 
> --- a/include/posix/sys/mman.h
> +++ b/include/posix/sys/mman.h
> @@ -16,7 +16,7 @@
>  
>  void *mmap(void *start, size_t length, int prot, int flags, int fd, off_t offset) asm("mmap64");
>  int munmap(void *start, size_t length);
> -static inline mlock(const void *addr, size_t len) { return 0; }
> -static inline munlock(const void *addr, size_t len) { return 0; }
> +static inline int mlock(const void *addr, size_t len) { return 0; }
> +static inline int munlock(const void *addr, size_t len) { return 0; }
>  
>  #endif /* _POSIX_SYS_MMAN_H */

