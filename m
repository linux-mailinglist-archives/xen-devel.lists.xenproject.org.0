Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99DA77E958
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 21:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584876.915750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWLre-0008LC-3R; Wed, 16 Aug 2023 19:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584876.915750; Wed, 16 Aug 2023 19:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWLre-0008JH-0T; Wed, 16 Aug 2023 19:07:30 +0000
Received: by outflank-mailman (input) for mailman id 584876;
 Wed, 16 Aug 2023 19:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8vYs=EB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qWLrc-0008JB-5D
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 19:07:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2260ad43-3c68-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 21:07:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BD51064599;
 Wed, 16 Aug 2023 19:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A45C433C7;
 Wed, 16 Aug 2023 19:07:20 +0000 (UTC)
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
X-Inumbo-ID: 2260ad43-3c68-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692212843;
	bh=8gC8VMKB+svpCG+GNMeSR2f2T+szTe085NNxtTX6/Ig=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dF9shLjkRNhpfVccowfoROvqD7KHgN08B6ozQ9r3jOmpwWLz4DqrbIJdd69OuG+mx
	 bIepDG3jJBOMUBga5AuK2N/B90+Fk0pEuG/Is2xOtcUc0ERtmwb9wMDKUUFmaFuXRq
	 h85nWZWBcUpSJbmzCmVtYMsHGfSjZ83WtXTe1XWsi7u6Bs91M94TtvZaFdAuh7KnBI
	 mSmQxLBzt4BHkL2uH1KNcsx3saP/6qzEn2jeQOqhn8JqgVJYMqMerZttsAPY54ktIV
	 Z84PH3i9ch8j9EkxoddOEAvrf3jTUjAUuH46g54YbDkWY9KU8/i+ATvF2fBiU4HRyT
	 Zp3024Y7mnO2A==
Date: Wed, 16 Aug 2023 12:07:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jason Andryuk <jandryuk@gmail.com>, 
    George Dunlap <George.Dunlap@eu.citrix.com>, 
    Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Julien Grall <julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
    Daniel Smith <dpsmith@apertussolutions.com>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v3 02/10] xen/version: Introduce non-truncating
 deterministically-signed XENVER_* subops
In-Reply-To: <5f75e037-1f73-f7be-740c-715902d5d9a0@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2308161204120.6458@ubuntu-linux-20-04-desktop>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com> <20230815210650.2735671-3-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2308151708070.6458@ubuntu-linux-20-04-desktop> <5f75e037-1f73-f7be-740c-715902d5d9a0@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-300263942-1692212843=:6458"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-300263942-1692212843=:6458
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 16 Aug 2023, Andrew Cooper wrote:
> On 16/08/2023 1:19 am, Stefano Stabellini wrote:
> > On Tue, 15 Aug 2023, Andrew Cooper wrote:
> >> @@ -498,6 +499,59 @@ static int __init cf_check param_init(void)
> >>
> >> +    sz = strlen(str);
> >> +
> >> +    if ( sz > KB(64) ) /* Arbitrary limit.  Avoid long-running operations. */
> >> +        return -E2BIG;
> > Realistically do we want this buffer to cross page boundaries?
> 
> A 1-byte answer can cross a page boundary, even if the hypercall
> argument is correctly aligned (and even that is unspecified in the Xen ABI).
> 
> But importantly, this series is also prep work to fixing the cmdline
> limit.  1k is already causing problems, and 64k is a whole lot less bad
> than 4k when we enter such corner cases.

OK. It is just that 64K seems *a lot* in this context. But if you have
reasons to believe that 64K is a good number for this check then OK.


> >> + */
> >>  #define XENVER_commandline 9
> >>  typedef char xen_commandline_t[1024];
> >>  
> >> @@ -110,6 +133,42 @@ struct xen_build_id {
> >>  };
> >>  typedef struct xen_build_id xen_build_id_t;
> >>  
> >> +/*
> >> + * Container for an arbitrary variable length buffer.
> >> + */
> >> +struct xen_varbuf {
> >> +    uint32_t len;                          /* IN:  size of buf[] in bytes. */
> >> +    unsigned char buf[XEN_FLEX_ARRAY_DIM]; /* OUT: requested data.         */
> > I realize that you just copied struct xen_build_id
> 
> No - it was originally an ambiguously-signed char in v1.  It became
> unsigned through review.
> 
> But being unsigned char is relevant to the non-ABI-changingness of later
> patches in the series.
> 
> > but I recall from
> > MISRA C training that we should use plain "char" for strings for good
> > reasons, not "unsigned char"?
> 
> I don't recall anything to that effect, nor can I see anything obvious
> when scanning through the standard.
> 
> MISRA can't plausibly prohibit the use of char for arbitrary data.  It's
> the one and only thing the C spec states is safe for the task.

After this morning's call with Roberto, I take this comment back.
unsigned char is OK from MISRA POV.
--8323329-300263942-1692212843=:6458--

