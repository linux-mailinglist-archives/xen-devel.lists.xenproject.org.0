Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE16C85DB47
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 14:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684044.1063701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcmnu-0006gg-Fs; Wed, 21 Feb 2024 13:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684044.1063701; Wed, 21 Feb 2024 13:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcmnu-0006f7-D5; Wed, 21 Feb 2024 13:38:30 +0000
Received: by outflank-mailman (input) for mailman id 684044;
 Wed, 21 Feb 2024 13:38:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6My=J6=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rcmnt-0006f1-KR
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 13:38:29 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ec93c9b-d0be-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 14:38:28 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33d7b8f563eso571746f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 05:38:28 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x4-20020adff644000000b0033b792ed609sm17038166wrp.91.2024.02.21.05.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 05:38:27 -0800 (PST)
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
X-Inumbo-ID: 7ec93c9b-d0be-11ee-8a53-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708522708; x=1709127508; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kdDF83QJKZeIDA4jDwU37uslvlpmH0PGAxQ9Ot6TN1o=;
        b=Q4Cn0lThHG53fWksVNObIcXpdTBIkPiBfhYbmXEC/VDjom6AcT4baSAeWjlIsMLpji
         cbRr0CzCqb4bEH4gNiu8E5KEmvJdFsnRZ4GGPyVE1SQNkp1lUgxBeWp4bAvZWoVw6ntL
         LKu3hqLLTdY6IgRNlfWBA02dH14Zh8RlcmdJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708522708; x=1709127508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdDF83QJKZeIDA4jDwU37uslvlpmH0PGAxQ9Ot6TN1o=;
        b=JhnsDIrX2QDXsC0/w8anMrImQpqiWbSPdZspsf4ndzNlGhRJci1iCmnB6fS7C0PR+o
         YkwfkyvBr0Em7LTAnF+ojCcjd/TMrVdyI0GxdSu0Bk8qPst+YbQwAQti4y/x9v2lH6n9
         FMBIfZgCcFKBNXCr7utW0Wji2vfF+8ciV/Oylk3Vq5XnsHTK/HF8uDt+DsRa4q9Q7xHo
         bOwAQeoC8bzkn983YOF0JhMhDqPA6K3ntdFDRMmY/j/lzbEd0iBd9HoeonWFUobBBpcJ
         JDmxi1OfwsaCycz8XwtKfEq3AxaeOoVhWjIORtBkYwet1tR0ji1E/GB7Zp75OQZkJwfe
         ooKQ==
X-Gm-Message-State: AOJu0YzINGfHI+4BdcGA4uGF5rxcSo6hKByvDvNSa602fbXJazn0GbJE
	G3DiXRuTHGK3lm2ygGBaUNmcNbnEQTN5yPq4Ycb7m3rtP/iBhByk08xFNpcH4Ng=
X-Google-Smtp-Source: AGHT+IEJyxJyicierypr9dbfpGgT7XCWyOfWZf7N9RonvyfyOqT1Ef5YI7SlhA9vApHVDJVDQQ859A==
X-Received: by 2002:adf:f44f:0:b0:33d:5f6a:60e3 with SMTP id f15-20020adff44f000000b0033d5f6a60e3mr6281581wrp.43.1708522708070;
        Wed, 21 Feb 2024 05:38:28 -0800 (PST)
Date: Wed, 21 Feb 2024 13:38:27 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <Ray.Huang@amd.com>
Subject: Re: [RFC XEN PATCH v5 4/5] libxl: Use gsi instead of irq for mapping
 pirq
Message-ID: <cf52f61b-1cf2-48e6-a3ba-7cdb12adacfa@perard>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
 <20240112061317.418658-5-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112061317.418658-5-Jiqian.Chen@amd.com>

Hi Jiqian,

On Fri, Jan 12, 2024 at 02:13:16PM +0800, Jiqian Chen wrote:
> In PVH dom0, it uses the linux local interrupt mechanism,
> when it allocs irq for a gsi, it is dynamic, and follow
> the principle of applying first, distributing first. And
> the irq number is alloced from small to large, but the
> applying gsi number is not, may gsi 38 comes before gsi
> 28, that causes the irq number is not equal with the gsi
> number. And when passthrough a device, xl wants to use
> gsi to map pirq, see pci_add_dm_done->xc_physdev_map_pirq,
> but the gsi number is got from file
> /sys/bus/pci/devices/<sbdf>/irq in current code, so it
> will fail when mapping.
> 
> So, use real gsi number read from gsi sysfs.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>

The "Co-developed-by" tag isn't really defined in Xen, it's fine to keep
I guess, but it mean that another tag is missing, I'm pretty sure you
need to add "Signed-off-by: Huang Rui <ray.huang@amd.com>"

Beyond that, the patch looks good, I've only coding style issues.

> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  tools/libs/light/libxl_pci.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 96cb4da0794e..a1c6e82631e9 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1478,8 +1478,19 @@ static void pci_add_dm_done(libxl__egc *egc,
>      fclose(f);
>      if (!pci_supp_legacy_irq())
>          goto out_no_irq;
> -    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> +    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/gsi", pci->domain,
>                                  pci->bus, pci->dev, pci->func);
> +
> +    if ( access(sysfs_path, F_OK) != 0 ) {

So, the coding style in libxl is a bit different, first could you store
the return value of access() in 'r', then check that value? Then
"if (r)" will be enough, no need for "!= 0".

Second, there's no around space the condition in the if statement, so
just "if (r)".

> +        if ( errno == ENOENT )
> +            sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> +                                pci->bus, pci->dev, pci->func);

Has the else part of this if..else is in a {}-block, could you add { }
here, for the if part? To quote the CODING_STYLE libxl document: "To
avoid confusion, either all the blocks in an if...else chain have
braces, or none of them do.

> +        else {
> +            LOGED(ERROR, domainid, "Can't access %s", sysfs_path);

This error message is kind of redundant, we could could simply let the code
try fopen() on this "/gsi" path, even if we know that it's not going to
work, as the error check on fopen() will produce the same error message.
;-)

And without that else part, the code could be simplified to:

    /* If /gsi path doesn't exist, fallback to /irq */
    if (r && errno == ENOENT)
        sysfs_path = "..../irq";



And those comments also apply to the changes in pci_remove_detached().

Thanks,

-- 
Anthony PERARD

