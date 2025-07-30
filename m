Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726DBB1614C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 15:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063967.1429732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh6i8-00017G-Pb; Wed, 30 Jul 2025 13:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063967.1429732; Wed, 30 Jul 2025 13:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh6i8-00015f-MR; Wed, 30 Jul 2025 13:19:12 +0000
Received: by outflank-mailman (input) for mailman id 1063967;
 Wed, 30 Jul 2025 13:19:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uh6i7-00015Z-Fk
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 13:19:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh6i6-0099qD-2N;
 Wed, 30 Jul 2025 13:19:10 +0000
Received: from [2a01:cb15:80df:da00:4c1a:a750:6210:2b8] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh6i6-00GwbI-1A;
 Wed, 30 Jul 2025 13:19:10 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=PM/A842BUuEmRphspvrC1nsJTWVXSYb1+n5lQ5WJEeU=; b=jJta3QwHrmbcXSRpUxFZX6oUOg
	p7o8uId0Yt/OruGbXnma8HNnCk7w8nr3BFxVZxfYjli0x9tMmTll8YCQRE0yebaSSPV2lHTeeUpfs
	NVT3eatjRXKqHoz7xDLTFavoEfDWgM1XUVJ3c16BJZdVUQF5lO1FYRVOQ3B/eX/9I518=;
Date: Wed, 30 Jul 2025 15:19:07 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v5 03/10] xen/arm: scmi-smc: passthrough SCMI SMC to
 domain, single agent
Message-ID: <aIoby3slVQc96SNa@l14>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
 <3c8b292b345d81cd20ce260d45d3d7aac6d98702.1753184487.git.oleksii_moisieiev@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c8b292b345d81cd20ce260d45d3d7aac6d98702.1753184487.git.oleksii_moisieiev@epam.com>

On Tue, Jul 22, 2025 at 11:41:39AM +0000, Oleksii Moisieiev wrote:
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 4ffcbf624b..68d2ebeb9f 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1284,6 +1284,36 @@ out:
>      if (rc) exit(EXIT_FAILURE);
>  }
>  
> +static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
> +                                const char *str)
> +{
> +    int ret = 0;
> +    char *buf2, *ptr;
> +    char *oparg;
> +
> +    if (NULL == (buf2 = ptr = strdup(str)))
> +        return ERROR_NOMEM;
> +
> +    ptr = strtok(buf2, ",");
> +    while (ptr != NULL)
> +    {
> +        if (MATCH_OPTION("type", ptr, oparg)) {
> +            ret = libxl_arm_sci_type_from_string(oparg, &arm_sci->type);
> +            if (ret) {
> +                fprintf(stderr, "Unknown ARM_SCI type: %s\n", oparg);
> +                ret = ERROR_INVAL;
> +                goto parse_error;
> +            }
> +        }
> +
> +        ptr = strtok(NULL, ",");
> +    }
> +
> +parse_error:

This label could be named "out", as it just a path out of the function,
both on success and error.

> +    free(buf2);
> +    return ret;
> +}
> +

The patch looks fine to me for the toolstack part, so:
Acked-by: Anthony PERARD <anthony.perard@vates.tech> # tools

TODO on commit (or before): regen golang/xenlight/{helpers,types}.gen.go
due to change in libxl_types.idl.

Thanks,

-- 
Anthony PERARD

