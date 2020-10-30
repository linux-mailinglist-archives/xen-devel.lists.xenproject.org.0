Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BEC2A02B7
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 11:21:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15591.38629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYRXB-000124-F0; Fri, 30 Oct 2020 10:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15591.38629; Fri, 30 Oct 2020 10:21:25 +0000
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
	id 1kYRXB-00011b-9k; Fri, 30 Oct 2020 10:21:25 +0000
Received: by outflank-mailman (input) for mailman id 15591;
 Fri, 30 Oct 2020 10:04:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dn1q=EF=linaro.org=srinivas.kandagatla@srs-us1.protection.inumbo.net>)
 id 1kYRGc-0007SB-H0
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:04:18 +0000
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67b18d79-1c8a-4e79-9e70-07f2f4091bd2;
 Fri, 30 Oct 2020 10:04:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t9so5737967wrq.11
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2020 03:04:17 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id h8sm7699531wro.14.2020.10.30.03.04.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Oct 2020 03:04:15 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Dn1q=EF=linaro.org=srinivas.kandagatla@srs-us1.protection.inumbo.net>)
	id 1kYRGc-0007SB-H0
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:04:18 +0000
X-Inumbo-ID: 67b18d79-1c8a-4e79-9e70-07f2f4091bd2
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 67b18d79-1c8a-4e79-9e70-07f2f4091bd2;
	Fri, 30 Oct 2020 10:04:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t9so5737967wrq.11
        for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2020 03:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gQH8tfnS5gABqR+rI2vYNKDqWdjjH0cmP3e9KTBgftU=;
        b=B9rJTdT06fBjkoaC4E33GsRL6XklEaCtgE6RSNGKr1R6NIN6tshFsvlrm73+qDotTs
         TgtMR2VLSrECST5bfnSTgKL7Wgi9dLvx0b+wOp98ZwTdU4Ui8lhbwxRwAvAFaXlLlBUv
         kIF79xh7rAnLeAmFUb7OH8iS2qmajJB6f90j1t67g5Zqi8ZvFcvZqslE0Nw79PSToAvD
         N9OdQRnS+ec6wQ18zcvo4xYOB+MrwDVlSeHj5ODLObBC4OqIgDsKYG4VpZ7Zwf1s+0XG
         E8uv8pTzD1YjF2GLDWWylcwx+GDZ++SmMtTJoKDLvlekOLEjOvRKbLbn1NSmNnF0g7r5
         ocZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gQH8tfnS5gABqR+rI2vYNKDqWdjjH0cmP3e9KTBgftU=;
        b=oUhSup3NYXi5nvqmRLfl9GEzUZgcDAzfK5FPd3YumNOQkqdxMquh0lrycpSBPLkMmH
         uUJ0RRe+AyZGi0zdcOufkbGBhqNg/6HeE+5Evk9OSZRUjw809LsxihdZJTXREcvzM9LO
         DvSu1j2HK6RSCj3QIwZWjop8zHNZX1ERmBHPWqX//3dvlGRqUPM0VGLgaS1mZIZJOZB7
         QNDeEo1lFqU2iFKg8lkvy8FhUjaXa6dhinf/XUjoHfpDvt2kUpyp6BMkHB+FOV/swxWr
         2yWXQAFL1Wr0qENlnIxl08Qa9n2+WlzN2/QYRISMShRziwAlLIA49kiIcaLP/WiesvgS
         1APg==
X-Gm-Message-State: AOAM533TVwWRhnAIk2WasG0V41pLxyhfUriCC7VlX+IjbQkg+2rnUXVV
	U8g6fI2q2AVulx5adAnIuripTUMyKKQIPg==
X-Google-Smtp-Source: ABdhPJyiqwsuWF8oCOJ2p5mgrL1UOBEF3qjVNKqZ9hb80Q/uxO4LXY5WvIi3i2M6psl12Cn+2MTVIQ==
X-Received: by 2002:a5d:40c3:: with SMTP id b3mr2187416wrq.157.1604052256376;
        Fri, 30 Oct 2020 03:04:16 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id h8sm7699531wro.14.2020.10.30.03.04.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2020 03:04:15 -0700 (PDT)
Subject: Re: [PATCH v2 19/39] docs: ABI: stable: make files ReST compatible
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jerry Snitselaar <jsnitsel@redhat.com>, Jingoo Han <jingoohan1@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Juergen Gross <jgross@suse.com>, Lee Jones <lee.jones@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Oded Gabbay <oded.gabbay@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tom Rix <trix@redhat.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <467a0dfbcdf00db710a629d3fe4a2563750339d8.1604042072.git.mchehab+huawei@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bc393307-d7dc-1666-f25c-6d756ebf5993@linaro.org>
Date: Fri, 30 Oct 2020 10:04:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <467a0dfbcdf00db710a629d3fe4a2563750339d8.1604042072.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 30/10/2020 07:40, Mauro Carvalho Chehab wrote:
> Several entries at the stable ABI files won't parse if we pass
> them directly to the ReST output.
> 
> Adjust them, in order to allow adding their contents as-is at
> the stable ABI book.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   Documentation/ABI/stable/firewire-cdev        |  4 +
>   Documentation/ABI/stable/sysfs-acpi-pmprofile | 22 +++--
>   Documentation/ABI/stable/sysfs-bus-firewire   |  3 +
>   Documentation/ABI/stable/sysfs-bus-nvmem      | 19 ++--

for nvmem parts:

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

>   Documentation/ABI/stable/sysfs-bus-usb        |  6 +-
>   .../ABI/stable/sysfs-class-backlight          |  1 +
>   .../ABI/stable/sysfs-class-infiniband         | 93 +++++++++++++------
>   Documentation/ABI/stable/sysfs-class-rfkill   | 13 ++-
>   Documentation/ABI/stable/sysfs-class-tpm      | 90 +++++++++---------
>   Documentation/ABI/stable/sysfs-devices        |  5 +-
>   Documentation/ABI/stable/sysfs-driver-ib_srp  |  1 +
>   .../ABI/stable/sysfs-firmware-efi-vars        |  4 +
>   .../ABI/stable/sysfs-firmware-opal-dump       |  5 +
>   .../ABI/stable/sysfs-firmware-opal-elog       |  2 +
>   Documentation/ABI/stable/sysfs-hypervisor-xen |  3 +
>   Documentation/ABI/stable/vdso                 |  5 +-
>   16 files changed, 176 insertions(+), 100 deletions(-)
> 

