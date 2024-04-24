Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A458B1537
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 23:35:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711691.1111855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzkG6-0002oe-8d; Wed, 24 Apr 2024 21:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711691.1111855; Wed, 24 Apr 2024 21:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzkG6-0002mI-5v; Wed, 24 Apr 2024 21:34:30 +0000
Received: by outflank-mailman (input) for mailman id 711691;
 Wed, 24 Apr 2024 21:34:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOBX=L5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rzkG4-0002l8-8U
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 21:34:28 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b416bbf-0282-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 23:34:25 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 171399445889192.37150311027006;
 Wed, 24 Apr 2024 14:34:18 -0700 (PDT)
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
X-Inumbo-ID: 6b416bbf-0282-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1713994460; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GPsB64+RwGqNUgkfDJ/OcnRBZ6Gc9gI/J6e8OrE0Ef68AWWj8qf9evII4ggKHtO4wlMWf0d02z+rpnJzBQeTmNin91waOya953v1hjb+MNsAo51F0BYDWjKSVV+9GH6I6bUiIar0yT0X0thIqjjousGMHr3ps5XZEcodfo1pMTg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713994460; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2k8RVogP7dx5rkFarQCu/NLm6n+smyW2lq6fEtmcn+c=; 
	b=VJV5PzOXrVxSK/KiNKOBfudYHdtcmPPDxcB56cEIlVE0+gZKpiGVq9vAntXxU2hyV8x5cgylHhS4K1BWqXed8y010oI1Y7E23tbrLzSTx3Vjps/5XEzSJ7+icp61uXuNTyeeMTe3+KasMadKpmYnI7gBC7k735iYWJuEpArrlm8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713994460;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2k8RVogP7dx5rkFarQCu/NLm6n+smyW2lq6fEtmcn+c=;
	b=Tu4WpIc2qICx3buTweTUKdQMjoAkckb0E6L2P+Vlod/qRX2UdCB8nMWL/4tKGpNB
	RIrV+RPiSXhX9Iyw6I775qHpSe3ob6oxAQADqBQ0nyrWltPdmoaTc5wtxo5+EuF5qjK
	5sQZK367B4f9sUGvywCcBDOL1FnmltLATwWoEeBA=
Message-ID: <633b7f7a-f2b4-4e0d-9e1a-b3efecc6f755@apertussolutions.com>
Date: Wed, 24 Apr 2024 17:34:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] gzip: refactor the gunzip window into common state
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
 <20240424163422.23276-4-dpsmith@apertussolutions.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20240424163422.23276-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/24/24 12:34, Daniel P. Smith wrote:
> Begin moving core state, in this case the gunzip window, into struct
> gunzip_state to allow a per decompression instance. In doing so, drop the
> define aliasing of window to slide.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/common/gzip/gunzip.c  | 21 ++++++++----
>   xen/common/gzip/inflate.c | 68 +++++++++++++++++++--------------------
>   2 files changed, 48 insertions(+), 41 deletions(-)
> 
> diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
> index b7cadadcca8b..e47f10ae19ad 100644
> --- a/xen/common/gzip/gunzip.c
> +++ b/xen/common/gzip/gunzip.c
> @@ -4,10 +4,12 @@
>   #include <xen/lib.h>
>   #include <xen/mm.h>
>   
> -static unsigned char *__initdata window;
> -
>   #define WSIZE           0x80000000U
>   
> +struct gunzip_state {
> +    unsigned char *window;
> +};
> +
>   static unsigned char *__initdata inbuf;
>   static unsigned int __initdata insize;
>   
> @@ -43,7 +45,7 @@ typedef unsigned long   ulg;
>   #endif
>   
>   static long __initdata bytes_out;
> -static void flush_window(void);
> +static void flush_window(struct gunzip_state *s);
>   
>   static __init void error(const char *x)
>   {
> @@ -62,7 +64,7 @@ static __init uch get_byte(void) {
>   
>   #include "inflate.c"
>   
> -static __init void flush_window(void)
> +static __init void flush_window(struct gunzip_state *s)
>   {
>       /*
>        * The window is equal to the output buffer therefore only need to
> @@ -72,7 +74,7 @@ static __init void flush_window(void)
>       unsigned int n;
>       unsigned char *in, ch;
>   
> -    in = window;
> +    in = s->window;
>       for ( n = 0; n < outcnt; n++ )
>       {
>           ch = *in++;
> @@ -99,12 +101,17 @@ __init int gzip_check(char *image, unsigned long image_len)
>   
>   __init int perform_gunzip(char *output, char *image, unsigned long image_len)
>   {
> +    struct gunzip_state *s;
>       int rc;
>   
>       if ( !gzip_check(image, image_len) )
>           return 1;
>   
> -    window = (unsigned char *)output;
> +    s = (struct gunzip_state *)malloc(sizeof(struct gunzip_state));

Looks like I inadvertently dropped the corresponding free when breaking 
up the monolithic patch.

v/r,
dps

