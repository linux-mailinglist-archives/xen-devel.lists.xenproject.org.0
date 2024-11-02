Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E219BA19C
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 18:15:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829545.1244527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Hho-0002Pi-Tb; Sat, 02 Nov 2024 17:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829545.1244527; Sat, 02 Nov 2024 17:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Hho-0002NK-Pg; Sat, 02 Nov 2024 17:14:32 +0000
Received: by outflank-mailman (input) for mailman id 829545;
 Sat, 02 Nov 2024 17:14:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7Hhn-0002NC-0F
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 17:14:31 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8429a5e-993d-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 18:14:25 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730567659333930.6940700843745;
 Sat, 2 Nov 2024 10:14:19 -0700 (PDT)
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
X-Inumbo-ID: e8429a5e-993d-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU4NDI5YTVlLTk5M2QtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTY3NjY2LjEzMjU5Miwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730567660; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GEuGT4SWGAbGji9IA5xA2uVhMzH+olJ5F7VA+imKPCVlcgXlfpE5+iXf7PSO4Iifm6DpQp7q9ojFQSq5Xcvyfmf+iz5+e6N6coQcIqH7pAqu2erREgX8wOJn8zZboCEE2JQYRw279m/5OcbLcemk8txt7uadsa68z4s7csPs5x4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730567660; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BVRclYSW9tVf9nbPBcAG6zNkx0FUYxb3FvY6YhhGGP8=; 
	b=FoNH+wPaaBjPfuirflMINjhXAe1lCkrBwXFimWp+Ks8brR1UimKE7dGmll+16Th+ka+ZF84bnFeptQGmcbqZhOEb4+pZ3f6ETr53Skvrn+c/0GEc15ClpS5iaeUBgk/Thx5NyaNvYkh8h4rpOr4vlZvA+XK1kagIBXO3cCMD02k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730567660;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=BVRclYSW9tVf9nbPBcAG6zNkx0FUYxb3FvY6YhhGGP8=;
	b=kgqhGLDLAzhLqOjUDT0iymdt4XCCWB7dYDDsiQXUIdw/5OyAEsU3fDptd852W9zu
	2iXU09Skf2bY48zZ5BkGDSqqcRdKp9gbhj/DBzkGsY17l3DGCapAuXOyJoDKJHG9wvW
	fNMoQA5mehqwhmKICCLkDFek1yTzUBJwJMTuWKqo=
Message-ID: <123804ff-e994-4f0f-aace-d51f3e4f6de3@apertussolutions.com>
Date: Sat, 2 Nov 2024 13:14:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] x86/ucode: Drop ucode_mod and ucode_blob
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-10-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241028091856.2151603-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/28/24 05:18, Andrew Cooper wrote:
> Both are used to pass information from early_microcode_load() to
> microcode_init_cache(), and both constitute use-after-free's in certain cases.
> 
>   * ucode_mod is a copy of the module_t identified by `ucode=$n`.  Except it's
>     a copy from prior to Xen relocating the modules.  microcode_init_cache()
>     might happen to find the data still intact in it's old location, but it
>     might be an arbitrary part of some other module.
> 
>   * ucode_blob is a stashed pointer to a bootstrap_map() which becomes invalid
>     the moment control returns to __start_xen(), where other logic is free to
>     to make temporary mappings.  This was even noticed and
>     microcode_init_cache() adjusted to "fix" the stashed pointers.
> 
> The information which should be passed between these two functions is which
> module to look in.  Introduce early_mod_idx for this purpose.  opt_scan can be
> reused to distinguish between CPIO archives and raw containers.
> 
> Notably this means microcode_init_cache() doesn't need to scan all modules any
> more; we know exactly which one to look in.  However, we do re-parse the CPIO
> header for simplicity.
> 
> Furthermore, microcode_init_cache(), being a presmp_initcall does not need to
> use bootstrap_map() to access modules; it can use mfn_to_virt() directly,
> which avoids needing to funnel exit paths through bootstrap_unmap().
> 
> Fold microcode_scan_module() into what is now it's single caller.  It operates
> on the function-wide idx/data/size state which allows for a unified "found"
> path irrespective of module selection method.
> 
> This resolves all issues to do with holding pointers (physical or virtual)
> across returning to __start_xen().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

