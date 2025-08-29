Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8E9B3B915
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 12:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101130.1454321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urwYN-0000q6-5F; Fri, 29 Aug 2025 10:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101130.1454321; Fri, 29 Aug 2025 10:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urwYN-0000nw-2Z; Fri, 29 Aug 2025 10:41:55 +0000
Received: by outflank-mailman (input) for mailman id 1101130;
 Fri, 29 Aug 2025 10:41:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFyT=3J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1urwYL-0000nq-JT
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 10:41:53 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5746d6a-84c4-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 12:41:51 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso11719425e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 03:41:51 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b7e8ab832sm32607095e9.23.2025.08.29.03.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:41:49 -0700 (PDT)
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
X-Inumbo-ID: c5746d6a-84c4-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756464110; x=1757068910; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U5yySbhjffhRoItwsnqVmwKIUq2X4Y3Gs6VuJPzQPPM=;
        b=vFFcbR6PbX+lwwH5VTBlrZtoqOMiB1kMfnJOkTtVAp/bQXU/3ToVKnwTfkypk01/4E
         uMRoe1yalSvVUlLPDSVN3PIA+RP4pzgl1j6+1jdg+h3A+//GhU0dDL5xzwJnkkCidBtA
         XSK0BsbHQjEQaWr2v34EnvjbnAZOQZGEbW+9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756464110; x=1757068910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U5yySbhjffhRoItwsnqVmwKIUq2X4Y3Gs6VuJPzQPPM=;
        b=C1gUm6ctcdbxu9XS6YtW+3ncImkaBxAFT4ElCSMOIpDrv+U3BkBpZ+y7mvWrycqX6D
         SPKjMu2MM1Xh6D9LnM9EnSuzXojHtTgBPGrlstGJNMS5SQzGSzKDW5bythuWKKht5+Z2
         qeWuICHqS2Lb/FzQh50aKFEASaqOXJQs/RAYdgr+GGAYgtfFlpofKTJS/5VbGlSx2bjA
         8KmYXfQe+ridUE5Wzc3Nt3LzHH+ffn403m+gMUqCyOPtUIbhnlauSNyNPKH3NkKqQF3J
         MQT5Yrfj3o8H8V1/IOdX34c9AuH1QvERX0hFZ0Ipema9Hq5mP9xAnjCQ1I8OD7wxsOPo
         cGXQ==
X-Gm-Message-State: AOJu0YwMogRLD9uUok52u9UYgqJPYKNxEWzIZSPXIIrzTA/4MRskr5/J
	rZN3ME/lQZ3HRpj4oRWrxbhDjUNqvgCv3GZkP4fFlyZ1K6BwebL01nmNW817tdWsp11JBEOJzfx
	fEvho
X-Gm-Gg: ASbGncuESqp8QAChUg85sA+lhzNFhGlvd11SgEN0be+PvFXvjZVAdYDeGn+HJ1BwOyp
	3oV0SIJdZi5PM4dks7gfqf1SkR/tIZgjIMQ8l+1H8+UTt+0rAX5ZBjKUCz9iXjrLrSRB7QnhIPN
	bs4tRPv8KCuONzoIVPsyrjI2wG3YQTcoUD2SnGMXyux+eFsGs3B5VDYVFH3vENWlgz0A7CP0avP
	pqxPjW0VvYSfdPZ2Ig/yq1tEVCkorHBq9wtekHYn8Pi+7RUG0hfevT32az2HuHriOodyeesjHnq
	5lHhQ+NzV4isWfF0WHR7BhygyIlX6xEdVS98OveY4Jj+Kn1+TmXkHGTZsWBFnH2F0Ty/oXUdq51
	j+4/PRo1WKn5tWuRTVrMGqBMU4MzpHQ4G8pz6GnHM/+6uBEorMR7OlVElscMnAxBB8FNjYJJr49
	/X
X-Google-Smtp-Source: AGHT+IHfEXFAHHTr00XVeh3iisPKNQfz2I4z25nbQ/tWk8drsiSfv1Z5pJyswrFhmBhxta+BjMw+1A==
X-Received: by 2002:a05:600c:198f:b0:458:7005:2ac3 with SMTP id 5b1f17b1804b1-45b5f8479f3mr145767515e9.21.1756464110435;
        Fri, 29 Aug 2025 03:41:50 -0700 (PDT)
Date: Fri, 29 Aug 2025 12:41:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v11 4/5] vpci/msi: Implement cleanup function for MSI
Message-ID: <aLGD7JKYiTUtSQ5h@Mac.lan>
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
 <20250808080337.28609-5-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808080337.28609-5-Jiqian.Chen@amd.com>

On Fri, Aug 08, 2025 at 04:03:36PM +0800, Jiqian Chen wrote:
> When MSI initialization fails, vPCI hides the capability, but
> removing handlers and datas won't be performed until the device is
> deassigned. So, implement MSI cleanup hook that will be called to
> cleanup MSI related handlers and free it's associated data when
> initialization fails.
> 
> Since cleanup function of MSI is implemented, delete the open-code
> in vpci_deassign_device().
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v10->v11 changes:
> * Add hide paratemer to cleanup_msi().
> * Check hide, if false return directly instead of letting ctrl RO.
> * Delete xfree(pdev->vpci->msi); in vpci_deassign_device().
> * Remove Roger's Reviewed-by since patch change.
> 
> v9->v10 changes:
> No.
> 
> v8->v9 changes:
> * Add Roger's Reviewed-by.
> 
> v7->v8 changes:
> * Add a comment to describe why "-2" in cleanup_msi().
> * Given the code in vpci_remove_registers() an error in the removal of
>   registers would likely imply memory corruption, at which point it's
>   best to fully disable the device. So, Rollback the last two modifications of v7.
> 
> v6->v7 changes:
> * Change the pointer parameter of cleanup_msi() to be const.
> * When vpci_remove_registers() in cleanup_msi() fails, not to return
>   directly, instead try to free msi and re-add ctrl handler.
> * Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msi in
>   init_msi() since we need that every handler realize that msi is NULL
>   when msi is free but handlers are still in there.
> 
> v5->v6 changes:
> No.
> 
> v4->v5 changes:
> * Change definition "static void cleanup_msi" to "static int cf_check cleanup_msi"
>   since cleanup hook is changed to be int.
> * Add a read-only register for MSI Control Register in the end of cleanup_msi.
> 
> v3->v4 changes:
> * Change function name from fini_msi() to cleanup_msi().
> * Remove unnecessary comment.
> * Change to use XFREE to free vpci->msi.
> 
> v2->v3 changes:
> * Remove all fail path, and use fini_msi() hook instead.
> * Change the method to calculating the size of msi registers.
> 
> v1->v2 changes:
> * Added a new function fini_msi to free all MSI resources instead of using an array
>   to record registered registers.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/msi.c  | 49 ++++++++++++++++++++++++++++++++++++++++-
>  xen/drivers/vpci/vpci.c |  1 -
>  2 files changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index c3eba4e14870..6ab45b9ba655 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -193,6 +193,53 @@ static void cf_check mask_write(
>      msi->mask = val;
>  }
>  
> +static int cf_check cleanup_msi(const struct pci_dev *pdev, bool hide)
> +{
> +    int rc;
> +    unsigned int end;
> +    struct vpci *vpci = pdev->vpci;
> +    const unsigned int msi_pos = pdev->msi_pos;
> +    const unsigned int ctrl = msi_control_reg(msi_pos);
> +
> +    if ( !msi_pos || !vpci->msi )
> +        return 0;

I'm afraid the above is not correct, even if vpci->msi == NULL we
still want to hide the capability when requested to do so, that would
be the case if the memory alloc of vpci->msi fails in init_msi().

This should be:

if ( !msi_pos )
{
    ASSERT_UNREACHABLE();
    return 0;
}

if ( !hide )
{
    XFREE(vpci->msi);
    return 0;
}



> +
> +    if ( vpci->msi->masking )

You cannot assume that masking has been correctly set, depending on
where init_msi() fails masking will be uninitialized, same with
address64.

I think the logic would still be correct, because if ->masking and
->address64 is not initialized the register handlers won't be setup
either, but feels fragile.  Ideally cleanup_msi() shouldn't use the
contents of vpci->msi, because they are likely not properly
initialized.

Thanks, Roger.

