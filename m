Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF8629E38
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 16:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444001.698750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouyHt-0002W3-UD; Tue, 15 Nov 2022 15:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444001.698750; Tue, 15 Nov 2022 15:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouyHt-0002Tf-Ra; Tue, 15 Nov 2022 15:55:49 +0000
Received: by outflank-mailman (input) for mailman id 444001;
 Tue, 15 Nov 2022 15:55:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MVo=3P=redhat.com=hdegoede@srs-se1.protection.inumbo.net>)
 id 1ouyHt-0002TZ-2u
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 15:55:49 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6f90f10-64fd-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 16:55:46 +0100 (CET)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-379-IoijgZNPNoCGDi6JSoRS-w-1; Tue, 15 Nov 2022 10:55:43 -0500
Received: by mail-ed1-f69.google.com with SMTP id
 w4-20020a05640234c400b004631f8923baso10264455edc.5
 for <xen-devel@lists.xenproject.org>; Tue, 15 Nov 2022 07:55:43 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a17090630d900b0078d38cda2b1sm5602709ejb.202.2022.11.15.07.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 07:55:41 -0800 (PST)
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
X-Inumbo-ID: f6f90f10-64fd-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668527744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WPjmVSvbKB40CCR5+G61PkEf4Ba+oFIdDkT9Qj5RB98=;
	b=PIaAHZQ1AG3n9/vVQwLPA5nrdcAdsbwBaysva+ZfswmR/y4hQjZoC6UPcn8vaif2yTNJqj
	6xGFX/QIzOih/oIBrmfLLeukbRQG/w6mMJ97+NoQ56d/WPolyNv4a+ErR1xTJmrihP+oSG
	L4fwn+P9dTwkvMTdcsss9GSDKem0PsA=
X-MC-Unique: IoijgZNPNoCGDi6JSoRS-w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WPjmVSvbKB40CCR5+G61PkEf4Ba+oFIdDkT9Qj5RB98=;
        b=exOCRDT7wRz7cYyR0BGl1+8SGuKRXk+0FBSV10OKKLBqfGUK+WpCA0SRch+Pxy5gkV
         7wY+XzmZRE+v+IqBNIwfdiLsAVuazP3eM3/b426PZgiwyyh3nhYJF2D+6IXIDlQdVaib
         FMjhs7YcXQIugHhDZcUKweqQ9yO1ZEvXozpYV30dfA0O6Y+AIaq6PgEW+CIH4fG25qHR
         +LqWcrmyv+lA8qvE4as6dfPb/AAgjxsAwrX3Xfs1mBQf7oAzKLsfy6C5ck4RwvzIoyCc
         23I2cVVuAa+ZLgxoCc4C/2NAoEu71XhgfoCN1VuKQ6mrdgO+7G+wBv54N7oXzZeheQXE
         o3GQ==
X-Gm-Message-State: ANoB5pnRCryMjs+OPPKCZjdiAFO54wUHDvoFZAqB53oR0qJ6+72n34uz
	bihRiZCVMQohDsNe0cEGg7OuCPy4QTlFORx7MP3DUG0F8SB38YjCtdrP0l87xG/hdKS8WlDU2zV
	19wQ+fCvycFo/JaG3636PI6l8zAs=
X-Received: by 2002:a50:fe13:0:b0:461:565e:8779 with SMTP id f19-20020a50fe13000000b00461565e8779mr15869000edt.387.1668527742097;
        Tue, 15 Nov 2022 07:55:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf62LnypI8+D6I1dwsExAn0tS+t62csKAA7KiPjW0+QdBxIexBU16E3VPnjUKKjLqOCYwTe88w==
X-Received: by 2002:a50:fe13:0:b0:461:565e:8779 with SMTP id f19-20020a50fe13000000b00461565e8779mr15868982edt.387.1668527741895;
        Tue, 15 Nov 2022 07:55:41 -0800 (PST)
Message-ID: <8f28a8dd-5a0c-c233-217c-0e610b830406@redhat.com>
Date: Tue, 15 Nov 2022 16:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3] platform/x86: don't unconditionally attach Intel PMC
 when virtualized
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 "David E . Box" <david.e.box@linux.intel.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20221110163145.80374-1-roger.pau@citrix.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221110163145.80374-1-roger.pau@citrix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/10/22 17:31, Roger Pau Monne wrote:
> The current logic in the Intel PMC driver will forcefully attach it
> when detecting any CPU on the intel_pmc_core_platform_ids array,
> even if the matching ACPI device is not present.
> 
> There's no checking in pmc_core_probe() to assert that the PMC device
> is present, and hence on virtualized environments the PMC device
> probes successfully, even if the underlying registers are not present.
> Previous to 21ae43570940 the driver would check for the presence of a
> specific PCI device, and that prevented the driver from attaching when
> running virtualized.
> 
> Fix by only forcefully attaching the PMC device when not running
> virtualized.  Note that virtualized platforms can still get the device
> to load if the appropriate ACPI device is present on the tables
> provided to the VM.
> 
> Make an exception for the Xen initial domain, which does have full
> hardware access, and hence can attach to the PMC if present.
> 
> Fixes: 21ae43570940 ('platform/x86: intel_pmc_core: Substitute PCI with CPUID enumeration')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: David E. Box <david.e.box@linux.intel.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
> Changes since v2:
>  - Don't split condition line.
> 
> Changes since v1:
>  - Use cpu_feature_enabled() instead of boot_cpu_has().
> ---
>  drivers/platform/x86/intel/pmc/pltdrv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/pmc/pltdrv.c b/drivers/platform/x86/intel/pmc/pltdrv.c
> index 15ca8afdd973..ddfba38c2104 100644
> --- a/drivers/platform/x86/intel/pmc/pltdrv.c
> +++ b/drivers/platform/x86/intel/pmc/pltdrv.c
> @@ -18,6 +18,8 @@
>  #include <asm/cpu_device_id.h>
>  #include <asm/intel-family.h>
>  
> +#include <xen/xen.h>
> +
>  static void intel_pmc_core_release(struct device *dev)
>  {
>  	kfree(dev);
> @@ -53,6 +55,13 @@ static int __init pmc_core_platform_init(void)
>  	if (acpi_dev_present("INT33A1", NULL, -1))
>  		return -ENODEV;
>  
> +	/*
> +	 * Skip forcefully attaching the device for VMs. Make an exception for
> +	 * Xen dom0, which does have full hardware access.
> +	 */
> +	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR) && !xen_initial_domain())
> +		return -ENODEV;
> +
>  	if (!x86_match_cpu(intel_pmc_core_platform_ids))
>  		return -ENODEV;
>  


