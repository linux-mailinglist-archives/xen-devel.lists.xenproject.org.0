Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 178D829CC22
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 23:44:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13133.33721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXXhC-0001Cl-FB; Tue, 27 Oct 2020 22:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13133.33721; Tue, 27 Oct 2020 22:44:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXXhC-0001CK-BW; Tue, 27 Oct 2020 22:44:02 +0000
Received: by outflank-mailman (input) for mailman id 13133;
 Tue, 27 Oct 2020 22:44:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kXXhA-0001CB-8v
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 22:44:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5008af22-287b-4090-a77d-b7afe8327c97;
 Tue, 27 Oct 2020 22:43:59 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5867C2070E;
 Tue, 27 Oct 2020 22:43:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kXXhA-0001CB-8v
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 22:44:00 +0000
X-Inumbo-ID: 5008af22-287b-4090-a77d-b7afe8327c97
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5008af22-287b-4090-a77d-b7afe8327c97;
	Tue, 27 Oct 2020 22:43:59 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5867C2070E;
	Tue, 27 Oct 2020 22:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603838638;
	bh=s2EsWcdamgqbRhMPT220EeF+aiisPXqfZRmvzzvpkZc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t3izSP5/mRHliBCpcwOaSnnSUNGhNzyYvXZs6ZOHruDLfIP+VoO2AQiKkpJWwoN1a
	 PEoXcQazy2dYh71B8+ZM98jqdx93YeE3nqwl91rh4gdCjvfNQsVFsmset9ca5CWRZj
	 M/qSe+ASM7ahJDgDFgPWmMm9PEQUxRbfX2vACB0M=
Date: Tue, 27 Oct 2020 15:43:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/3] xen: Add an unsecure Taint type
In-Reply-To: <d7e82b374cb7c83d6e18774e23bc4d970c4e8b53.1603728729.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2010271538080.12247@sstabellini-ThinkPad-T480s>
References: <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com> <d7e82b374cb7c83d6e18774e23bc4d970c4e8b53.1603728729.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Oct 2020, Bertrand Marquis wrote:
> Define a new Unsecure taint type to be used to signal a system tainted
> due to an unsecure configuration or hardware feature/errata.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/kernel.c   | 4 +++-
>  xen/include/xen/lib.h | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index c3a943f077..7a345ae45e 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -326,6 +326,7 @@ unsigned int tainted;
>   *  'E' - An error (e.g. a machine check exceptions) has been injected.
>   *  'H' - HVM forced emulation prefix is permitted.
>   *  'M' - Machine had a machine check experience.
> + *  'U' - Platform is unsecure (usually due to an errata on the platform).
>   *
>   *      The string is overwritten by the next call to print_taint().
>   */
> @@ -333,7 +334,8 @@ char *print_tainted(char *str)
>  {
>      if ( tainted )
>      {
> -        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c",
> +        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c",
> +                 tainted & TAINT_MACHINE_UNSECURE ? 'U' : ' ',
>                   tainted & TAINT_MACHINE_CHECK ? 'M' : ' ',
>                   tainted & TAINT_SYNC_CONSOLE ? 'C' : ' ',
>                   tainted & TAINT_ERROR_INJECT ? 'E' : ' ',
> diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
> index 1983bd6b86..a9679c913d 100644
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -193,6 +193,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c);
>  #define TAINT_MACHINE_CHECK             (1u << 1)
>  #define TAINT_ERROR_INJECT              (1u << 2)
>  #define TAINT_HVM_FEP                   (1u << 3)
> +#define TAINT_MACHINE_UNSECURE          (1u << 4)
>  extern unsigned int tainted;
>  #define TAINT_STRING_MAX_LEN            20
>  extern char *print_tainted(char *str);
> -- 
> 2.17.1
> 

