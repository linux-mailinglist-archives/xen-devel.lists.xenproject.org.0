Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 486FB9945FC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 13:03:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813004.1225768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy7z9-0005je-Eu; Tue, 08 Oct 2024 11:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813004.1225768; Tue, 08 Oct 2024 11:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy7z9-0005hg-Bn; Tue, 08 Oct 2024 11:02:35 +0000
Received: by outflank-mailman (input) for mailman id 813004;
 Tue, 08 Oct 2024 11:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rYz=RE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sy7z8-0005g3-51
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 11:02:34 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d13b6df6-8564-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 13:02:32 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so1641309a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 04:02:32 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993ddeddadsm430420666b.198.2024.10.08.04.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 04:02:31 -0700 (PDT)
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
X-Inumbo-ID: d13b6df6-8564-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728385352; x=1728990152; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KxoKyEG4kDrOJBu2MRInnkIYHJz/geXpCLu5nCBzoFk=;
        b=aD6GWcBlpjTSuMU/BuGrL3kvrW/kuGpX9LCnrh9ylXtLZgZ4UnSu7MSfDB41sPsxry
         2EbjhaHeSuHUXYmnCHVCSqNTt0aHLly8B+e3++bUjslTgG3z7MVEpLr5fqORbEvWHsqd
         qRDWSsbly1j0xcgwfJ6H49vsdV8ef6seP5ym4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728385352; x=1728990152;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KxoKyEG4kDrOJBu2MRInnkIYHJz/geXpCLu5nCBzoFk=;
        b=Pfaso0BIudPFS4JLKAvvQCkI1Qn5SOK4qF61wKDmu520W/RYcjA3JuNs/uiituK9lw
         Qr1RihkcwRYa+CO1cl8fC6UqAcboyXrPE/xef/Zs2Gdfd0eT+XX8E2TuphGBpgvVrwE+
         VND4K8M949wg3Z3/BEia80A4jjfD8jtjdHf1n8/4INE1NUStV7ZNWhJNeL2edHhgWYE7
         aFMdC3eY7ZlMyEQD0sxUjHtf0L1rtRTOfkYFYqEhE2Z3Ji5mcqzgkcqG3dC2V77f8zk4
         tPorgeHDHbHlZHv6kNgeogc/y1FgVgtBluZ4l6LE9H97mKT2ziAchj2RBQK777/fp1jO
         nu6g==
X-Gm-Message-State: AOJu0YzQeIb9ehbvhFzwWWH+Gytyiw7LiNFYKDKDWxh3hcykHFqpQqVw
	yu/n6fM7YXQFggNuZQjnLnmEhzp5RwJ86zscdu/ozfQ0UbVNS9slLmcUk7uXT+w=
X-Google-Smtp-Source: AGHT+IH2cRqiiz3elmPs3FoPisfIq9ty2XQqhOsxtnTHzIA4K7T13Y6MET3veuUGxbtpOQQsWz1iUw==
X-Received: by 2002:a17:907:728b:b0:a93:bc27:de24 with SMTP id a640c23a62f3a-a9967856817mr312380766b.1.1728385351973;
        Tue, 08 Oct 2024 04:02:31 -0700 (PDT)
Date: Tue, 8 Oct 2024 13:02:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/APIC: Switch flat driver to use phys dst for ext
 ints
Message-ID: <ZwURRqxvX0G7vRVV@macbook.local>
References: <0db68e62ffc428f553a30397df1e79068d26bb5f.1728311378.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0db68e62ffc428f553a30397df1e79068d26bb5f.1728311378.git.matthew.barnes@cloud.com>

On Mon, Oct 07, 2024 at 03:34:43PM +0100, Matthew Barnes wrote:
> External interrupts via logical delivery mode in xAPIC do not benefit
> from targeting multiple CPUs and instead simply bloat up the vector
> space.
> 
> However the xAPIC flat driver currently uses logical delivery for
> external interrupts.
> 
> This patch switches the xAPIC flat driver to use physical destination
> mode for external interrupts, instead of logical destination mode.
> 
> This patch also applies the following non-functional changes:
> - Remove now unused logical flat functions
> - Expand GENAPIC_FLAT and GENAPIC_PHYS macros, and delete them.
> 
> Resolves: https://gitlab.com/xen-project/xen/-/issues/194
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Just some nits below (and suggestions for future work).

> ---
> Changes in v2:
> - Reword commit message
> - Expand and delete GENAPIC_* macros
> - Bundle patch series into one patch
> ---
>  xen/arch/x86/genapic/bigsmp.c      |  8 +++++++-
>  xen/arch/x86/genapic/default.c     |  8 +++++++-

The organization of giles herre is very bad.  bigsmp.c and default.c are
almost empty files, and delivery.c is almost empty also.  IT should
all be unified into a single xapic.c file, and rename the genapic folder
to plain apic IMO.  Not for you to do here, just realized while
looking at the changes.

>  xen/arch/x86/genapic/delivery.c    | 10 ----------
>  xen/arch/x86/include/asm/genapic.h | 20 +-------------------
>  4 files changed, 15 insertions(+), 31 deletions(-)
> 
> diff --git a/xen/arch/x86/genapic/bigsmp.c b/xen/arch/x86/genapic/bigsmp.c
> index e97e4453a033..b2e721845275 100644
> --- a/xen/arch/x86/genapic/bigsmp.c
> +++ b/xen/arch/x86/genapic/bigsmp.c
> @@ -46,5 +46,11 @@ static int __init cf_check probe_bigsmp(void)
>  
>  const struct genapic __initconst_cf_clobber apic_bigsmp = {
>  	APIC_INIT("bigsmp", probe_bigsmp),
> -	GENAPIC_PHYS
> +	.int_delivery_mode = dest_Fixed,
> +	.int_dest_mode = 0, /* physical delivery */
> +	.init_apic_ldr = init_apic_ldr_phys,
> +	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
> +	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
> +	.send_IPI_mask = send_IPI_mask_phys,
> +	.send_IPI_self = send_IPI_self_legacy
>  };
> diff --git a/xen/arch/x86/genapic/default.c b/xen/arch/x86/genapic/default.c
> index a968836a1878..59c79afdb8fa 100644
> --- a/xen/arch/x86/genapic/default.c
> +++ b/xen/arch/x86/genapic/default.c
> @@ -16,5 +16,11 @@
>  /* should be called last. */
>  const struct genapic __initconst_cf_clobber apic_default = {
>  	APIC_INIT("default", NULL),
> -	GENAPIC_FLAT
> +	.int_delivery_mode = dest_Fixed,
> +	.int_dest_mode = 0, /* physical delivery */
> +	.init_apic_ldr = init_apic_ldr_flat,
> +	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
> +	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys,

After this change all APIC drivers use the same values for the
int_delivery_mode, int_dest_mode, vector_allocation_cpumask and
cpu_mask_to_apicid fields, at which point we can remove the hooks and
adjust the code.  For example vector_allocation_cpumask_phys() should
be renamed to vector_allocation_cpumask(), and the
vector_allocation_cpumask removed.

Can be done in a followup commit.

As a small nit, it would be good if the remaining fields (used for IPI
sending): init_apic_ldr, send_IPI_{mask,self} are grouped together.  I
would move the initialization of the init_apic_ldr field just above
send_IPI_mask.

Thanks, Roger.

