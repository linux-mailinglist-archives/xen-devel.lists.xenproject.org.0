Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C084E0D9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 13:42:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678184.1055266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY3jf-0003vE-TB; Thu, 08 Feb 2024 12:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678184.1055266; Thu, 08 Feb 2024 12:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY3jf-0003sO-Q7; Thu, 08 Feb 2024 12:42:35 +0000
Received: by outflank-mailman (input) for mailman id 678184;
 Thu, 08 Feb 2024 12:42:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mdps=JR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rY3je-0003sI-Dj
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 12:42:34 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86ea671c-c67f-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 13:42:32 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55ff5f6a610so1887213a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 04:42:32 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 i8-20020a05640200c800b0055ffa94d6b8sm773244edu.31.2024.02.08.04.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 04:42:31 -0800 (PST)
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
X-Inumbo-ID: 86ea671c-c67f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707396152; x=1708000952; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DhOx3zcsQMMZLsZQMGj7+ND2NZNNZJqpdgSoYj0lico=;
        b=Dq4ezVkNBlSje/3Z8fkf30xn+ZcwQgqte3hb23pt2yiLPfEobMK1Bzpg2qllcucYKH
         NE+rfKXYWcybfl5te0dJvqKv8tbtSxTVYkgPfVQ+7ZeHXQLOIfrS9jDR0gqIp8dMgGgu
         nmAHdYpcjqPz1YMxNiN34wkA2mtfDAELriJAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396152; x=1708000952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhOx3zcsQMMZLsZQMGj7+ND2NZNNZJqpdgSoYj0lico=;
        b=IEnEjz07VvCns8j5WgNg7P1eZ3DVCJMEfP8+KddyZCUb0ZNNWeWOYESoidvt6Lndcx
         KPHupumIyXE/zBqO2e6L6iyZPPLggwCAqkBbvKow69+46Yi1pAq5TZ+Ce6snj1q7S8qx
         RnJi8ycdGBo0q183Kb0u+Hw6trZ+S6nk2JOSid5YRZnDt69NlNKIUBHu4+4oFF8bkJP5
         oJGh+J+WIxxOjY0U7La1fnacoQ4iC+c6Yshojs7h8pvnGOH3K5RpicAItd96b2XbutuI
         E+KjCvGKXVSOjx65RlaHfnRIia3ooC2DTpRsji6v8ZVaU/RsmjDdNLbOV7UKmPpG3NyW
         sNXQ==
X-Gm-Message-State: AOJu0Yzru989250/6e9p6wxSl8Xx/Ae+EVxaNk43lHZksIlVtUg6+omk
	GyIBojybqYXGnS2zABZpWI9nw29Ii8h9D2/H9wx0y+czBDxOeKL4I0juwYjvUH2UIEaLE3oTlbP
	y
X-Google-Smtp-Source: AGHT+IH6PX/HjpKnGtXKGpU4N85hWOXaM1TkZQ44xyasBqxctlGiZlTO9NaKGygB0/gfyGoMz8yFDw==
X-Received: by 2002:aa7:c2d3:0:b0:560:62e0:d28e with SMTP id m19-20020aa7c2d3000000b0056062e0d28emr6474958edp.33.1707396151778;
        Thu, 08 Feb 2024 04:42:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9DuxmUHT9pGQK0ya8v8Qg6XukFUVco9e4TNyM2WTj2zXCMJ1GgwE7c1CeABgPjMMEivQAmnSDpLppiA0unmEUXSzrZjGDWsneYufh6jl3uF27
Date: Thu, 8 Feb 2024 13:42:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 3/7] VT-d: respect ACPI SATC's ATC_REQUIRED flag
Message-ID: <ZcTMNkGvBT5S5z7L@macbook>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <72496fb7-8835-4d45-bd92-7e7d612861c7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <72496fb7-8835-4d45-bd92-7e7d612861c7@suse.com>

On Mon, Feb 05, 2024 at 02:56:14PM +0100, Jan Beulich wrote:
> When the flag is set, permit Dom0 to control the device (no worse than
> what we had before and in line with other "best effort" behavior we use
> when it comes to Dom0), but suppress passing through to DomU-s unless
> ATS can actually be enabled for such devices.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Is ats_device() using acpi_find_matched_atsr_unit() unconditionally
> actually correct? Shouldn't that check be skipped for root complex
> integrated devices?

Yes, I think so, ATSR only lists root ports supporting ATS, because
the root complex is assumed to always be ATS capable.

None of this seems to be working then for PCIe endpoints directly in
the root complex, as ats_device() will always return 0?

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -225,7 +225,10 @@ exceptions (watchdog NMIs and unexpected
>  > Default: `false`
>  
>  Permits Xen to set up and use PCI Address Translation Services.  This is a
> -performance optimisation for PCI Passthrough.
> +performance optimisation for PCI Passthrough.  Note that firmware may indicate
> +that certain devices need to have ATS enabled for proper operation. For such
> +devices ATS will be enabled by default, unless the option is used in its
> +negative form.

I'm kind of worried that we add this support while maintaining the
WARNING below.  If I was an admin I would certainly be worried whether
my system could lock-up during normal operations, even with the
devices assigned to dom0 and not a malicious domain.

I know that enabling ATS is forced on us from DMAR, but still.

>  **WARNING: Xen cannot currently safely use ATS because of its synchronous wait
>  loops for Queued Invalidation completions.**
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -254,6 +254,24 @@ struct acpi_atsr_unit *acpi_find_matched
>      return all_ports;
>  }
>  
> +const struct acpi_satc_unit *acpi_find_matched_satc_unit(
> +    const struct pci_dev *pdev)
> +{
> +    const struct acpi_satc_unit *satc;
> +
> +    list_for_each_entry ( satc, &acpi_satc_units, list )
> +    {
> +        if ( satc->segment != pdev->seg )
> +            continue;
> +
> +        for ( unsigned int i = 0; i < satc->scope.devices_cnt; ++i )
> +            if ( satc->scope.devices[i] == pdev->sbdf.bdf )
> +                return satc;
> +    }
> +
> +    return NULL;
> +}
> +
>  struct acpi_rhsa_unit *drhd_to_rhsa(const struct acpi_drhd_unit *drhd)
>  {
>      struct acpi_rhsa_unit *rhsa;
> --- a/xen/drivers/passthrough/vtd/dmar.h
> +++ b/xen/drivers/passthrough/vtd/dmar.h
> @@ -109,6 +109,8 @@ struct acpi_satc_unit {
>  
>  struct acpi_drhd_unit *acpi_find_matched_drhd_unit(const struct pci_dev *);
>  struct acpi_atsr_unit *acpi_find_matched_atsr_unit(const struct pci_dev *);
> +const struct acpi_satc_unit *acpi_find_matched_satc_unit(
> +    const struct pci_dev *pdev);
>  
>  #define DMAR_TYPE 1
>  #define RMRR_TYPE 2
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2364,6 +2364,25 @@ static int cf_check intel_iommu_add_devi
>      if ( ret )
>          dprintk(XENLOG_ERR VTDPREFIX, "%pd: context mapping failed\n",
>                  pdev->domain);
> +    else if ( !pdev->broken )
> +    {
> +        const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
> +        const struct acpi_satc_unit *satc = acpi_find_matched_satc_unit(pdev);
> +
> +        /*
> +         * Prevent the device from getting assigned to an unprivileged domain
> +         * when firmware indicates ATS is required, but ATS could not be enabled
> +         * (e.g. because of being suppressed via command line option).
> +         */

I think a safer policy would be to prevent assigning any device that
has atc_required set unless opt_ats > 1 (ie: the user has explicitly
opted-in to the usage of ATS).

While we can't likely avoid ATS being enabled for devices having the
ATC_REQUIRED flag, we shouldn't allow passthrough to possibly
untrusted guests without notice.

Thanks, Roger.

