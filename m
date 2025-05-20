Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6004BABE30F
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 20:46:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991029.1374965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHRyM-00055C-Af; Tue, 20 May 2025 18:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991029.1374965; Tue, 20 May 2025 18:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHRyM-00053A-7j; Tue, 20 May 2025 18:45:54 +0000
Received: by outflank-mailman (input) for mailman id 991029;
 Tue, 20 May 2025 18:45:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+YD=YE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uHRyK-000534-PE
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 18:45:53 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a561ad3a-35aa-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 20:45:49 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747766744617924.572632780241;
 Tue, 20 May 2025 11:45:44 -0700 (PDT)
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
X-Inumbo-ID: a561ad3a-35aa-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; t=1747766745; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KC8KtYzt7icVWvNs6vOE/lsLg13Y3r0yDCG+avUBldA7Ns63v1lQ1VfqOrQK1X69T2qqQmF9e8OiBO4jEtlnCwEgz14Ue56EEf1jxqwY2a86aZ9dsaDN6gXL1l/u9lmM+RdvV1+P/W2buP/JUlEQCqg8zljtU97MlXxk/0sIj6s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747766745; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=khwdnsxgTYA4crYq+mdovbUPglmY9ltme7rsuRBtajo=; 
	b=KAbyMZaGaRuRYQw42G0xg8gwg/TYf1KBV2gaRh8XKH0VIuu9+GsrvrCkCy+cK6kvPv3mwMi6fxGxzgHpTH+9gZKEae37GQA1NC/+oE2Llk20YuVGHgZay3IJRAbPGANf+BDeuYs6gciMj1fhids4ezp9reYe8ZMpFn2Zb2+sQbw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747766745;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=khwdnsxgTYA4crYq+mdovbUPglmY9ltme7rsuRBtajo=;
	b=FbeCexl1TPZDpk0V0O2TUXfxEYsKyPnccnNyMBich2ZW63mBwdpPdQKm7Ouf/wQ2
	ml0r5unKouaF8QddaaS6mgizG7QsboEeexyRNX2Ax3V4RyUqL3Ys2zXwJJuOcGhxCtl
	gDD07n8vPvDD4qedvqmeDQPLSx/WyDrIAkd4wp+g=
Message-ID: <2a92e866-543e-404d-be34-d58cf5d51aec@apertussolutions.com>
Date: Tue, 20 May 2025 14:45:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/argo: Command line handling improvements
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Denis Mukhin <dmkhn@proton.me>
References: <20250520141027.120958-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <20250520141027.120958-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/20/25 10:10, Andrew Cooper wrote:
> Treat "argo" on the command line as a positive boolean, rather than requiring
> the user to pass "argo=1/on/enable/true".
> 
> Move both opt_argo* variables into __ro_after_init.  They're set during
> command line parsing and never modified thereafter.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christopher Clark <christopher.w.clark@gmail.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Denis Mukhin <dmkhn@proton.me>
> 
> Found while
> ---
>   xen/common/argo.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index cbe8911a4364..027b37b18a6c 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -79,8 +79,8 @@ DEFINE_XEN_GUEST_HANDLE(xen_argo_unregister_ring_t);
>   DEFINE_COMPAT_HANDLE(compat_argo_iov_t);
>   #endif
>   
> -static bool __read_mostly opt_argo;
> -static bool __read_mostly opt_argo_mac_permissive;
> +static bool __ro_after_init opt_argo;
> +static bool __ro_after_init opt_argo_mac_permissive;
>   
>   static int __init cf_check parse_argo(const char *s)
>   {
> @@ -92,7 +92,10 @@ static int __init cf_check parse_argo(const char *s)
>           if ( !ss )
>               ss = strchr(s, '\0');
>   
> -        if ( (val = parse_bool(s, ss)) >= 0 )
> +        /* Intepret "argo" as a positive boolean. */
> +        if ( *s == '\0' )
> +            opt_argo = true;
> +        else if ( (val = parse_bool(s, ss)) >= 0 )
>               opt_argo = val;
>           else if ( (val = parse_boolean("mac-permissive", s, ss)) >= 0 )
>               opt_argo_mac_permissive = val;
> 
> base-commit: 293abb9e0c5e8df96cc5dfe457c62dfcb7542b19

While it is logical, this does technically change the behavior of the 
command line flag. Should there be an update to xen-command-line.pandoc 
to clarify that the list is optional?

Other than the doc concern,

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>


